<?php
session_start();

// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

try {
    // Incluir el archivo de conexión
    include('../../config/conexionDB.php');

    // Obtener la conexión
    $conn = Database::getConnection();

    // Obtener el nombre de la región desde la URL (GET)
    $regionNombre = isset($_GET['region']) ? $_GET['region'] : '';

    // Si no se proporciona el nombre de la región, devolver error
    if (empty($regionNombre)) {
        echo json_encode([
            'success' => false,
            'message' => 'No se proporcionó el nombre de la región.'
        ]);
        exit();
    }

    // Consulta para obtener los detalles de los estados por región
    $queryEstadosPorRegion = "
        SELECT e.id AS estado_id, e.nombre AS estado_nombre
        FROM regiones r
        LEFT JOIN estados e ON r.id = e.id_region
        WHERE r.nombre = ?
    ";

    $stmt = $conn->prepare($queryEstadosPorRegion);
    $stmt->bind_param("s", $regionNombre); // Bindeamos el nombre de la región
    $stmt->execute();
    $resultEstadosPorRegion = $stmt->get_result();

    // Consulta para obtener los detalles de los tecnológicos por estado
    $queryTecnologicosPorEstado = "
        SELECT t.id AS tecnologico_id, t.nombre AS tecnologico_nombre, e.id AS estado_id, director,modalidad
        FROM tecnologicos t
        LEFT JOIN estados e ON t.estado_id = e.id
        LEFT JOIN regiones r ON e.id_region = r.id
        WHERE r.nombre = ?
    ";

    $stmt = $conn->prepare($queryTecnologicosPorEstado);
    $stmt->bind_param("s", $regionNombre); // Bindeamos el nombre de la región
    $stmt->execute();
    $resultTecnologicosPorEstado = $stmt->get_result();

    // Verificar si se obtuvieron resultados
    if ($resultEstadosPorRegion->num_rows > 0) {
        $data = [
            'estados_por_region' => []
        ];

        // Almacenar los tecnológicos por estado en un array temporal
        $tecnologicosPorEstado = [];
        while ($row = $resultTecnologicosPorEstado->fetch_assoc()) {
            $tecnologicosPorEstado[$row['estado_id']][] = [
                'tecnologico_id' => $row['tecnologico_id'],
                'tecnologico_nombre' => $row['tecnologico_nombre'],
                'tipo_de_institucion' => $row['modalidad'],
                'director' => $row['director'],
            ];
        }

        // Almacenar los datos de estados y tecnológicos por región
        while ($row = $resultEstadosPorRegion->fetch_assoc()) {
            $estadoId = $row['estado_id'];
            $data['estados_por_region'][] = [
                'estado_id' => $estadoId,
                'estado_nombre' => $row['estado_nombre'],
                'tecnologicos' => $tecnologicosPorEstado[$estadoId] ?? []
            ];
        }

        // Enviar la respuesta JSON con los datos
        echo json_encode([
            'success' => true,
            'data' => $data
        ]);
    } else {
        // Si no se encuentran resultados
        echo json_encode([
            'success' => false,
            'message' => 'No se encontraron datos para la región solicitada.'
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
