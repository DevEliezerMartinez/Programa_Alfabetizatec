<?php
session_start();

// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

try {
    // Incluir el archivo de conexión
    include('../../config/conexionDB.php');

    // Obtener la conexión
    $conn = Database::getConnection();

    // Consulta para agrupar por tecnológico y tipo de participante
    $queryParticipantes = "
        SELECT t.nombre AS tecnologico, e.tipo_participante, COUNT(*) AS total
        FROM educadores e
        JOIN tecnologicos t ON e.id_tecnologico = t.id
        GROUP BY t.nombre, e.tipo_participante
        ORDER BY t.nombre, total DESC
    ";

    $resultParticipantes = $conn->query($queryParticipantes);

    // Consulta para agrupar estudiantes por tecnológico y nombre del nivel
    $queryEstudiantesPorNivel = "
        SELECT t.nombre AS tecnologico, n.nombre AS nivel, COUNT(s.id) AS total_estudiantes
        FROM solicitudes s
        JOIN programas p ON s.id_programa = p.id
        JOIN tecnologicos t ON p.id_tecnologico = t.id
        JOIN niveles n ON p.id_nivel = n.id
        GROUP BY t.nombre, n.nombre
        ORDER BY t.nombre, total_estudiantes DESC
    ";

    $resultEstudiantesPorNivel = $conn->query($queryEstudiantesPorNivel);

    // Verificar si se obtuvieron resultados
    $data = [];

    if ($resultParticipantes->num_rows > 0) {
        $data['participantes_por_tecnologico'] = [];
        while ($row = $resultParticipantes->fetch_assoc()) {
            $data['participantes_por_tecnologico'][] = [
                'tecnologico' => $row['tecnologico'],
                'tipo_participante' => $row['tipo_participante'],
                'total' => $row['total']
            ];
        }
    }

    if ($resultEstudiantesPorNivel->num_rows > 0) {
        $data['estudiantes_por_tecnologico_nivel'] = [];
        while ($row = $resultEstudiantesPorNivel->fetch_assoc()) {
            $data['estudiantes_por_tecnologico_nivel'][] = [
                'tecnologico' => $row['tecnologico'],
                'nivel' => $row['nivel'],
                'total_estudiantes' => $row['total_estudiantes']
            ];
        }
    }

    // Enviar la respuesta JSON con los datos
    echo json_encode([
        'success' => true,
        'data' => $data
    ]);
} catch (Exception $e) {
    // Manejo de errores
    echo json_encode([
        'success' => false,
        'message' => 'Hubo un error al procesar la solicitud.',
        'error_details' => $e->getMessage()
    ]);
}
?>
