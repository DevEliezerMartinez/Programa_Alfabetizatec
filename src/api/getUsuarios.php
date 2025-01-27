<?php
header('Content-Type: application/json');

// Incluir archivo de configuración de la base de datos
include '../config/conexionDB.php';

$response = [
    'status' => false,
    'message' => 'Método no permitido o error en la solicitud',
    'data' => [],
    'recordsTotal' => 0,  // Total de registros sin filtros
    'recordsFiltered' => 0  // Total de registros después del filtro (si aplica)
];

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Obtener el tipo de consulta (regional o programa) y validar
    $tipo = isset($_GET['tipo']) ? $_GET['tipo'] : '';
    
    if ($tipo === 'regional') {
        // Si es tipo regional, continuar con el flujo normal para coordinadores regionales
        $start = isset($_GET['start']) ? intval($_GET['start']) : 0;
        $length = isset($_GET['length']) ? intval($_GET['length']) : 10;

        // Obtener la conexión a la base de datos utilizando la clase Database
        $conn = Database::getConnection();

        if ($conn->connect_error) {
            $response['message'] = 'Error al conectar a la base de datos';
            echo json_encode($response);
            exit;
        }

        // Consulta para obtener el total de coordinadores regionales (sin filtro de id_tecnologico)
        $countSql = "SELECT COUNT(*) as total 
                     FROM coordinadores_regionales cr
                     INNER JOIN usuarios u ON cr.id_usuario = u.id";

        $stmt = $conn->prepare($countSql);
        $stmt->execute();
        $countResult = $stmt->get_result();
        $countRow = $countResult->fetch_assoc();
        $response['recordsTotal'] = $countRow['total'];
        $response['recordsFiltered'] = $response['recordsTotal'];  // Por defecto, sin filtros adicionales

        // Consulta SQL para obtener todos los coordinadores regionales y los detalles de la tabla usuarios (correo, telefono)
        $sql = "SELECT cr.id, cr.id_usuario, u.nombre, u.apellido, u.correo, u.telefono, r.nombre AS region
                FROM coordinadores_regionales cr
                INNER JOIN usuarios u ON cr.id_usuario = u.id
                INNER JOIN regiones r ON cr.id_region = r.id
                LIMIT ?, ?";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param('ii', $start, $length);  // Pagina los resultados
        $stmt->execute();
        $result = $stmt->get_result();

        $coordinadores = [];
        while ($row = $result->fetch_assoc()) {
            $coordinadores[] = [
                'id' => $row['id'],
                'id_usuario' => $row['id_usuario'],
                'nombre' => $row['nombre'],
                'apellido' => $row['apellido'],
                'correo' => $row['correo'],
                'telefono' => $row['telefono'],
                'region' => $row['region']
            ];
        }

        if (!empty($coordinadores)) {
            $response['status'] = true;
            $response['message'] = 'Consulta exitosa';
            $response['data'] = $coordinadores;
        } else {
            $response['message'] = 'No se encontraron coordinadores regionales';
        }

        $stmt->close();
        $conn->close();

        echo json_encode($response);
        exit;

    } elseif ($tipo === 'programa') {
        // Si es tipo programa, obtener los coordinadores de la tabla coordinadores_programa
        $start = isset($_GET['start']) ? intval($_GET['start']) : 0;
        $length = isset($_GET['length']) ? intval($_GET['length']) : 10;

        // Obtener la conexión a la base de datos
        $conn = Database::getConnection();

        if ($conn->connect_error) {
            $response['message'] = 'Error al conectar a la base de datos';
            echo json_encode($response);
            exit;
        }

        // Consulta para obtener el total de coordinadores de programa
        $countSql = "SELECT COUNT(*) as total 
                     FROM coordinadores_programa cp
                     INNER JOIN usuarios u ON cp.id_usuario = u.id";

        $stmt = $conn->prepare($countSql);
        $stmt->execute();
        $countResult = $stmt->get_result();
        $countRow = $countResult->fetch_assoc();
        $response['recordsTotal'] = $countRow['total'];
        $response['recordsFiltered'] = $response['recordsTotal'];  // Por defecto, sin filtros adicionales

        // Consulta SQL para obtener todos los coordinadores de programa y los detalles de la tabla usuarios (correo, telefono)
        $sql = "SELECT cp.id, cp.id_usuario, u.nombre, u.apellido, u.correo, u.telefono, t.nombre AS tecnologico
                FROM coordinadores_programa cp
                INNER JOIN usuarios u ON cp.id_usuario = u.id
                INNER JOIN tecnologicos t ON cp.id_tecnologico = t.id
                LIMIT ?, ?";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param('ii', $start, $length);  // Pagina los resultados
        $stmt->execute();
        $result = $stmt->get_result();

        $coordinadores = [];
        while ($row = $result->fetch_assoc()) {
            $coordinadores[] = [
                'id' => $row['id'],
                'id_usuario' => $row['id_usuario'],
                'nombre' => $row['nombre'],
                'apellido' => $row['apellido'],
                'correo' => $row['correo'],
                'telefono' => $row['telefono'],
                'tecnologico' => $row['tecnologico']
            ];
        }

        if (!empty($coordinadores)) {
            $response['status'] = true;
            $response['message'] = 'Consulta exitosa';
            $response['data'] = $coordinadores;
        } else {
            $response['message'] = 'No se encontraron coordinadores de programa';
        }

        $stmt->close();
        $conn->close();

        echo json_encode($response);
        exit;

    } else {
        $response['message'] = 'Tipo no válido. Debe ser "regional" o "programa"';
        echo json_encode($response);
        exit;
    }
}

echo json_encode($response);
exit;
