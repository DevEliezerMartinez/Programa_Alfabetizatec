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
    // Obtener el id_tecnologico desde los parámetros de la solicitud
    $id_tecnologico = isset($_GET['id_tecnologico']) ? intval($_GET['id_tecnologico']) : 0;

    if ($id_tecnologico === 0) {
        $response['message'] = 'ID Tecnológico no válido';
        echo json_encode($response);
        exit;
    }

    // Obtener el parámetro de paginación
    $start = isset($_GET['start']) ? intval($_GET['start']) : 0;
    $length = isset($_GET['length']) ? intval($_GET['length']) : 10;

    // Obtener la conexión a la base de datos utilizando la clase Database
    $conn = Database::getConnection();

    if ($conn->connect_error) {
        $response['message'] = 'Error al conectar a la base de datos';
        echo json_encode($response);
        exit;
    }

    // Consulta para obtener el total de educadores para la paginación
    $countSql = "SELECT COUNT(*) as total 
                 FROM educadores e
                 WHERE e.id_tecnologico = ? ";

    $stmt = $conn->prepare($countSql);
    $stmt->bind_param('i', $id_tecnologico);
    $stmt->execute();
    $countResult = $stmt->get_result();
    $countRow = $countResult->fetch_assoc();
    $response['recordsTotal'] = $countRow['total'];
    $response['recordsFiltered'] = $response['recordsTotal'];  // Por defecto, sin filtros adicionales

    // Consulta SQL para obtener los educadores y los detalles de la tabla usuarios (correo, telefono)
    $sql = "SELECT e.id, e.id_usuario, e.modalidad, e.tipo_participante, u.nombre, u.apellido, u.correo, u.telefono
            FROM educadores e
            INNER JOIN usuarios u ON e.id_usuario = u.id
            WHERE e.id_tecnologico = ?
            ";

    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id_tecnologico);  // Pagina los resultados
    $stmt->execute();
    $result = $stmt->get_result();

    $educadores = [];
    while ($row = $result->fetch_assoc()) {
        $educadores[] = [
            'id' => $row['id'],
            'id_usuario' => $row['id_usuario'],
            'nombre' => $row['nombre'],
            'apellido' => $row['apellido'],
            'modalidad' => $row['modalidad'],
            'tipo_participante' => $row['tipo_participante'],
            'correo' => $row['correo'],  // Agregamos el correo
            'telefono' => $row['telefono']  // Agregamos el telefono
        ];
    }

    if (!empty($educadores)) {
        $response['status'] = true;
        $response['message'] = 'Consulta exitosa';
        $response['data'] = $educadores;
    } else {
        $response['message'] = 'No se encontraron docentes para el ID tecnológico proporcionado';
    }

    $stmt->close();
    $conn->close();

    echo json_encode($response);
    exit;
}

echo json_encode($response);
exit;
