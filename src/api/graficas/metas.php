<?php
include('../../config/conexionDB.php');

try {
    // Crear la conexión
    $conn = Database::getConnection();

    // Primera consulta: Obtener la meta total de programas por región
    $sql1 = "
    SELECT r.id, r.nombre AS region, SUM(p.meta) AS meta_total 
    FROM programas p 
    JOIN tecnologicos t ON p.id_tecnologico = t.id 
    JOIN estados e ON t.estado_id = e.id 
    JOIN regiones r ON e.id_region = r.id 
    GROUP BY r.id, r.nombre 
    ORDER BY r.nombre ASC;
    ";

    // Ejecutar la consulta
    $result1 = $conn->query($sql1);

    if (!$result1) {
        throw new Exception('Error en la consulta de programas: ' . $conn->error);
    }

    $resultResumenPorRegion = [];
    while ($row = $result1->fetch_assoc()) {
        $resultResumenPorRegion[] = $row;
    }

    // Segunda consulta: Obtener la cantidad de educadores por región
    $sql2 = "
    SELECT r.id, r.nombre AS region, COUNT(e.id) AS total_educadores 
    FROM educadores e 
    JOIN tecnologicos t ON e.id_tecnologico = t.id 
    JOIN estados es ON t.estado_id = es.id 
    JOIN regiones r ON es.id_region = r.id 
    GROUP BY r.id, r.nombre 
    ORDER BY r.nombre ASC;
    ";

    // Ejecutar la consulta
    $result2 = $conn->query($sql2);

    if (!$result2) {
        throw new Exception('Error en la consulta de educadores: ' . $conn->error);
    }

    $resultEducadoresPorRegion = [];
    while ($row = $result2->fetch_assoc()) {
        $resultEducadoresPorRegion[] = $row;
    }

    // Configurar el encabezado para JSON
    header('Content-Type: application/json');

    // Retornar los resultados en formato JSON
    echo json_encode([
        'sucess' => true,
        'resumenPorRegion' => $resultResumenPorRegion,
        'educadoresPorRegion' => $resultEducadoresPorRegion
    ]);
} catch (Exception $e) {
    // Manejo de errores
    echo json_encode(['sucess' => false, 'error' => $e->getMessage()]);
}