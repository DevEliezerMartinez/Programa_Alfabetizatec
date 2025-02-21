<?php
session_start();

// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

try {
    // Incluir el archivo de conexión
    include('../../config/conexionDB.php');

    // Obtener la conexión
    $conn = Database::getConnection();

    // Verificar si se recibió el parámetro de la región
    if (!isset($_GET['region_nombre']) || empty($_GET['region_nombre'])) {
        echo json_encode([
            'success' => false,
            'message' => 'El nombre de la región es obligatorio.'
        ]);
        exit;
    }

    // Obtener el nombre de la región del parámetro GET
    $regionNombre = $_GET['region_nombre'];

    // Consulta para obtener los tecnológicos y la cantidad total de estudiantes y educadores por tecnológico en la región
    $queryTecnologicosConEstudiantesYEducadores = "
SELECT
    t.id AS tecnologico_id,
    t.nombre AS tecnologico_nombre,
    COUNT(DISTINCT s.id_estudiante) AS total_estudiantes,
    COUNT(DISTINCT e.id) AS total_educadores
FROM tecnologicos t
LEFT JOIN programas p ON t.id = p.id_tecnologico
LEFT JOIN solicitudes s ON p.id = s.id_programa
LEFT JOIN estados e2 ON t.estado_id = e2.id
LEFT JOIN regiones r ON e2.id_region = r.id
LEFT JOIN educadores e ON t.id = e.id_tecnologico
WHERE r.nombre = ?
GROUP BY t.id;

    ";

    // Preparar la consulta para evitar inyecciones SQL
    $stmt = $conn->prepare($queryTecnologicosConEstudiantesYEducadores);
    $stmt->bind_param('s', $regionNombre);  // 's' indica que es una cadena

    // Ejecutar la consulta
    $stmt->execute();
    $resultTecnologicosConEstudiantesYEducadores = $stmt->get_result();

    // Verificar si se obtuvieron resultados
    if ($resultTecnologicosConEstudiantesYEducadores->num_rows > 0) {
        $data = [
            'tecnologicos' => []
        ];

        // Almacenar los datos de los tecnológicos con la cantidad de estudiantes y educadores
        while ($row = $resultTecnologicosConEstudiantesYEducadores->fetch_assoc()) {
            $tecnologicoId = $row['tecnologico_id'];
            $tecnologicoNombre = $row['tecnologico_nombre'];
            $totalEstudiantes = $row['total_estudiantes'];
            $totalEducadores = $row['total_educadores'];

            // Verificar si el tecnológico ya ha sido agregado a la lista
            if (!isset($data['tecnologicos'][$tecnologicoId])) {
                $data['tecnologicos'][$tecnologicoId] = [
                    'tecnologico_nombre' => $tecnologicoNombre,
                    'total_estudiantes' => $totalEstudiantes,  // Solo la cantidad total de estudiantes
                    'total_educadores' => $totalEducadores  // Solo la cantidad total de educadores
                ];
            }
        }

        // Enviar la respuesta JSON con los datos
        echo json_encode([
            'success' => true,
            'data' => $data
        ]);
    } else {
        // Si no hay datos encontrados
        echo json_encode([
            'success' => false,
            'message' => 'No se encontraron datos para la región proporcionada.'
        ]);
    }

    // Cerrar la declaración preparada
    $stmt->close();
} catch (Exception $e) {
    // Manejo de errores
    echo json_encode([
        'success' => false,
        'message' => 'Hubo un error al procesar la solicitud.',
        'error_details' => $e->getMessage()
    ]);
}
