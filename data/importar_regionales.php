<?php
require '../vendor/autoload.php'; // Autocarga de PhpSpreadsheet

use PhpOffice\PhpSpreadsheet\IOFactory;

// Incluir el archivo de conexión
include('../src/config/conexionDB.php');

// Obtener la conexión
$conn = Database::getConnection();

// Ruta del archivo Excel
$archivoExcel = './locales.xlsx';

try {
    // Leer el archivo Excel
    $spreadsheet = IOFactory::load($archivoExcel);
    $hoja = $spreadsheet->getActiveSheet();
    $filas = $hoja->toArray();

    // Ignorar la primera fila (cabeceras)
    unset($filas[0]);

    // Procesar cada fila del archivo Excel
    foreach ($filas as $fila) {
        // Extraer los datos de la fila
        // Asignación de datos desde el arreglo $fila a variables, comenzando desde A1 (índice 0)
        $nombre = $fila[1];  // Columna A (Nombre)
        $apellido_paterno = $fila[2];  // Columna B (Apellido Paterno)
        $apellido_materno = $fila[3];  // Columna C (Apellido Materno)
        $sexo = $fila[4];  // Columna D (Sexo)
        $curp = $fila[5];  // Columna E (CURP)
        $correo_inst = $fila[6];  // Columna F (Correo electrónico)
        $telefono = $fila[7];  // Columna G (No. de teléfono celular)
        $puesto = $fila[8];  // Columna H (Cargo)
        $tipo_institucion = $fila[9];  // Columna I (Tipo de Institución)
        $nombre_tecnologico = empty($fila[10]) ? $fila[11] : $fila[10];
        // Crear la variable con el valor de búsqueda para el nombre del tecnológico
        $busquedaTecnologico = "%$nombre_tecnologico%";

        // Intentar encontrar el ID del tecnológico usando LIKE
        $sqlTecnologico = "SELECT id FROM tecnologicos WHERE nombre LIKE ?";
        $stmtTecnologico = $conn->prepare($sqlTecnologico);
        $stmtTecnologico->bind_param("s", $busquedaTecnologico);  // Pasar la variable correctamente
        $stmtTecnologico->execute();
        $resultado = $stmtTecnologico->get_result();

        if ($resultado->num_rows > 0) {
            $row = $resultado->fetch_assoc();
            $id_tecnologico = $row['id'];
        } else {
            // Si no se encuentra con LIKE, intentar con REGEXP
            $sqlTecnologico = "SELECT id FROM tecnologicos WHERE nombre REGEXP ?";
            $stmtTecnologico = $conn->prepare($sqlTecnologico);
            $stmtTecnologico->bind_param("s", $nombre_tecnologico);  // Pasar la variable correctamente
            $stmtTecnologico->execute();
            $resultado = $stmtTecnologico->get_result();

            if ($resultado->num_rows > 0) {
                $row = $resultado->fetch_assoc();
                $id_tecnologico = $row['id'];
            } else {
                // Si no se encuentra el tecnológico, mostrar el error con los detalles
                echo "Error: Tecnológico no encontrado para '$nombre_tecnologico'.<br>";
                echo "Detalles de la persona: <br>";
                echo "Nombre: $nombre $apellido_paterno $apellido_materno<br>";
                echo "CURP: $curp<br>";
                echo "Correo Institucional: $correo_inst<br>";
                echo "Teléfono: $telefono<br>";
                echo "Puesto: $puesto<br>";
                echo "Tipo de Institución: $tipo_institucion<br>";
                continue;  // Continuar con la siguiente fila si no se encuentra el tecnológico
            }
        }

        // Combinar apellido paterno y materno
        $apellido = $apellido_paterno . ' ' . $apellido_materno;

        // Insertar el usuario en la tabla usuarios
        $sqlUsuario = "INSERT INTO usuarios (nombre, apellido, curp, telefono, correo, puesto, contrasena, rol_id) 
               VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        $stmtUsuario = $conn->prepare($sqlUsuario);
        $contrasena = password_hash("password_default", PASSWORD_DEFAULT);  // Establecer una contraseña predeterminada
        $rol_id = 3;  // Establecer el rol a 3
        $stmtUsuario->bind_param("sssssssi", $nombre, $apellido, $curp, $telefono, $correo_inst, $puesto, $contrasena, $rol_id);

        if ($stmtUsuario->execute()) {
            // Obtener el ID del último usuario insertado
            $id_usuario = $conn->insert_id;

            // Insertar el coordinador en la tabla coordinadores_programa
            $sqlCoordinador = "INSERT INTO coordinadores_programa (id_usuario, id_tecnologico) VALUES (?, ?)";
            $stmtCoordinador = $conn->prepare($sqlCoordinador);
            $stmtCoordinador->bind_param("ii", $id_usuario, $id_tecnologico);

            if ($stmtCoordinador->execute()) {
                echo "Usuario '$nombre' importado con éxito.<br>";
            } else {
                echo "Error al insertar coordinador para '$nombre'.<br>";
            }
        } else {
            echo "Error al insertar usuario '$nombre'.<br>";
        }
    }
} catch (Exception $e) {
    echo "Error al procesar el archivo Excel: " . $e->getMessage();
}

// Cerrar la conexión
$conn->close();
