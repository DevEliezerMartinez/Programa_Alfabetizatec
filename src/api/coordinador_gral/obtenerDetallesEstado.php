<?php
session_start();

// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

try {
    // Incluir el archivo de conexión
    include('../../config/conexionDB.php');

    // Obtener la conexión
    $conn = Database::getConnection();

    // Obtener el nombre del estado desde la URL (GET)
    $estadoNombre = isset($_GET['estado']) ? $_GET['estado'] : '';

    // Si no se proporciona el nombre del estado, devolver error
    if (empty($estadoNombre)) {
        echo json_encode([
            'success' => false,
            'message' => 'No se proporcionó el nombre del estado.'
        ]);
        exit();
    }

    // Consulta para obtener los detalles del estado
    $queryEstado = "
        SELECT id AS estado_id, nombre AS estado_nombre
        FROM estados
        WHERE nombre = ?
    ";

    $stmt = $conn->prepare($queryEstado);
    $stmt->bind_param("s", $estadoNombre); // Bindeamos el nombre del estado
    $stmt->execute();
    $resultEstado = $stmt->get_result();

    // Verificar si se obtuvo el estado
    if ($resultEstado->num_rows > 0) {
        $estado = $resultEstado->fetch_assoc();

        // Consulta para obtener los detalles de los tecnológicos por estado
        $queryTecnologicosPorEstado = "
            SELECT t.id AS tecnologico_id, t.nombre AS tecnologico_nombre, director, modalidad AS tipo_de_institucion
            FROM tecnologicos t
            WHERE t.estado_id = ?
        ";

        $stmt = $conn->prepare($queryTecnologicosPorEstado);
        $stmt->bind_param("i", $estado['estado_id']); // Bindeamos el ID del estado
        $stmt->execute();
        $resultTecnologicosPorEstado = $stmt->get_result();

        // Preparar los datos del estado con sus tecnológicos
        $data = [
            'estado_id' => $estado['estado_id'],
            'estado_nombre' => $estado['estado_nombre'],
            'tecnologicos' => []
        ];

        // Almacenar los tecnológicos en el array
        while ($row = $resultTecnologicosPorEstado->fetch_assoc()) {
            $data['tecnologicos'][] = [
                'tecnologico_id' => $row['tecnologico_id'],
                'tecnologico_nombre' => $row['tecnologico_nombre'],
                'tipo_de_institucion' => $row['tipo_de_institucion'],
                'director' => $row['director'],
            ];
        }

        // Enviar la respuesta JSON con los datos
        echo json_encode([
            'success' => true,
            'data' => $data
        ]);
    } else {
        // Si no se encuentra el estado
        echo json_encode([
            'success' => false,
            'message' => 'No se encontró el estado solicitado.'
        ]);
    }
} catch (Exception $e) {
    // Manejo de errores
    echo json_encode([
        'success' => false,
        'message' => 'Hubo un error al procesar la solicitud.',
        'error_details' => $e->getMessage()
    ]);
}
?>
