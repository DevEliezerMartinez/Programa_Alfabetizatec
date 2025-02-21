<?php
require '../vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\IOFactory;

// Función para normalizar nombres
function normalizarNombre($nombre) {
    $nombre = trim($nombre);
    $nombre = strtolower($nombre);
    $nombre = preg_replace('/\s+/', ' ', $nombre);
    return $nombre;
}

// Función para encontrar instituciones similares
function encontrarInstitucionSimilar($nombre, $institucionEstadoMap) {
    $nombre = normalizarNombre($nombre);
    foreach ($institucionEstadoMap as $institucion => $estadoId) {
        if (similar_text($nombre, strtolower($institucion)) > strlen($nombre) * 0.9) {
            return $estadoId;
        }
    }
    return null;
}

// Configuración de la conexión a la base de datos
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'alfabetizatec';

// Crear conexión
$conn = new mysqli($host, $user, $pass, $db);

// Verificar conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

try {
    // Cargar coordinadores_programa.xlsx
    $coordinadoresFile = 'coordinadores_programa.xlsx';
    $spreadsheet = IOFactory::load($coordinadoresFile);
    $sheet = $spreadsheet->getActiveSheet();
    $coordinadoresData = $sheet->toArray(null, true, true, true);

    // Cargar estados.xlsx
    $estadosFile = 'estados.xlsx';
    $spreadsheetEstados = IOFactory::load($estadosFile);
    $sheetEstados = $spreadsheetEstados->getSheetByName('Hoja 1');
    $estadosData = $sheetEstados->toArray(null, true, true, true);

    // Debug: Mostrar contenido de estados.xlsx
    echo "Contenido de estados.xlsx:\n";
    foreach ($estadosData as $index => $row) {
        if ($index == 1) continue;
        echo "Fila $index: Institución: '{$row['B']}', Estado: '{$row['C']}'\n";
    }

    // Crear un mapa de institución a estado_id
    $institucionEstadoMap = [];
    foreach ($estadosData as $index => $row) {
        if ($index == 1) continue; // Saltar encabezados
        $institucion = normalizarNombre($row['B']);
        $estado = trim($row['C']);
        
        // Debug
        echo "\nProcesando estado.xlsx:\n";
        echo "Institución normalizada: '$institucion'\n";
        echo "Estado: '$estado'\n";
        
        // Consultar estado_id
        $queryEstado = "SELECT id FROM estados WHERE nombre = ?";
        $stmt = $conn->prepare($queryEstado);
        $stmt->bind_param('s', $estado);
        $stmt->execute();
        $result = $stmt->get_result();
        if ($result->num_rows > 0) {
            $estadoRow = $result->fetch_assoc();
            $institucionEstadoMap[$institucion] = $estadoRow['id'];
            echo "Estado ID encontrado: {$estadoRow['id']}\n";
        } else {
            echo "No se encontró ID para el estado: $estado\n";
        }
        $stmt->close();
    }

    // Debug: Mostrar mapeo completo
    echo "\nMapeo completo de instituciones a estados:\n";
    foreach ($institucionEstadoMap as $inst => $id) {
        echo "Institución: '$inst' -> Estado ID: $id\n";
    }

    // Contraseña fija para los usuarios
    $hashedPassword = '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.';

    // Insertar tecnológicos
    foreach ($coordinadoresData as $index => $row) {
        if ($index == 1) continue; // Saltar encabezados
        
        $nombre = trim($row['O']);
        $institucion = normalizarNombre($row['O']);
        $modalidad = trim($row['J']);
        $director = "";

        // Debug
        echo "\nProcesando coordinadores_programa.xlsx:\n";
        echo "Institución original: '$nombre'\n";
        echo "Institución normalizada: '$institucion'\n";
        echo "Modalidad: '$modalidad'\n";

        // Intentar encontrar el estado_id
        $estado_id = $institucionEstadoMap[$institucion] ?? null;
        if (!$estado_id) {
            // Intentar búsqueda flexible
            $estado_id = encontrarInstitucionSimilar($institucion, $institucionEstadoMap);
            if (!$estado_id) {
                echo "Estado no encontrado para la institución: $nombre\n";
                echo "Intenté buscar con el nombre normalizado: $institucion\n";
                continue;
            }
        }

        // Insertar tecnológico
        $queryTec = "INSERT INTO tecnologicos (nombre, estado_id, modalidad, director) VALUES (?, ?, ?, ?)";
        $stmt = $conn->prepare($queryTec);
        $stmt->bind_param('siss', $nombre, $estado_id, $modalidad, $director);
        $stmt->execute();
        $idTecnologico = $stmt->insert_id;
        $stmt->close();

        // Insertar usuario
        $nombreUsuario = $row['B'];
        $apellido = $row['C'] . ' ' . $row['D'];
        $curp = $row['F'];
        $telefono = preg_replace('/[^0-9]/', '', $row['H']); // Corregido la expresión regular
        $correo = $row['G'];
        $correoInst = $row['G'];
        $puesto = $row['I'];
        $rolId = 3;

        // Debug
        echo "Insertando usuario:\n";
        echo "Nombre: $nombreUsuario\n";
        echo "Apellido: $apellido\n";
        echo "CURP: $curp\n";
        echo "Teléfono: $telefono\n";
        echo "Puesto: $puesto\n";

        $queryUsuario = "INSERT INTO usuarios (nombre, apellido, curp, telefono, correo, correo_inst, contrasena, rol_id, puesto) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($queryUsuario);
        $stmt->bind_param('sssssssis', $nombreUsuario, $apellido, $curp, $telefono, $correo, $correoInst, $hashedPassword, $rolId, $puesto);
        $stmt->execute();
        $idUsuario = $stmt->insert_id;
        $stmt->close();

        // Insertar coordinador
        $queryCoordinador = "INSERT INTO coordinadores_programa (id_usuario, id_tecnologico) VALUES (?, ?)";
        $stmt = $conn->prepare($queryCoordinador);
        $stmt->bind_param('ii', $idUsuario, $idTecnologico);
        $stmt->execute();
        $stmt->close();

        echo "Registro completado para: $nombre\n";
    }

    echo "Proceso completado correctamente.\n";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
    echo "\nTraza del error:\n";
    echo $e->getTraceAsString();
} finally {
    $conn->close();
}
?>