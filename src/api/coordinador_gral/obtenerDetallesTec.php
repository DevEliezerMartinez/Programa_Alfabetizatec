<?php
session_start();

// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

try {
    // Incluir el archivo de conexión
    include('../../config/conexionDB.php');

    // Obtener la conexión
    $conn = Database::getConnection();

    // Obtener el id del tecnológico desde la URL (GET)
    $tecnologicoId = isset($_GET['id']) ? $_GET['id'] : '';

    // Si no se proporciona el id del tecnológico, devolver error
    if (empty($tecnologicoId)) {
        echo json_encode([
            'success' => false,
            'message' => 'No se proporcionó el ID del tecnológico.'
        ]);
        exit();
    }

    // Consulta para obtener los detalles de un tecnológico por su id
    $queryTecnologico = "
        SELECT t.id AS tecnologico_id, t.nombre AS tecnologico_nombre, e.id AS estado_id, e.nombre AS estado_nombre,
               t.director, t.modalidad
        FROM tecnologicos t
        LEFT JOIN estados e ON t.estado_id = e.id
        WHERE t.id = ?
    ";

    $stmt = $conn->prepare($queryTecnologico);
    $stmt->bind_param("i", $tecnologicoId); // Bindeamos el id del tecnológico
    $stmt->execute();
    $resultTecnologico = $stmt->get_result();

    // Verificar si se obtuvo el resultado
    if ($resultTecnologico->num_rows > 0) {
        $data = $resultTecnologico->fetch_assoc(); // Obtener los datos del tecnológico

        // Consulta para obtener el nombre de los niveles, la cantidad de programas por grupo y la suma de metas
        $queryNiveles = "
            SELECT n.nombre AS nivel_nombre, COUNT(p.id) AS cantidad_programas, SUM(p.meta) AS suma_metas
            FROM programas p
            INNER JOIN niveles n ON p.id_nivel = n.id
            WHERE p.id_tecnologico = ?
            GROUP BY n.nombre
        ";

        $stmtNiveles = $conn->prepare($queryNiveles);
        $stmtNiveles->bind_param("i", $tecnologicoId); // Bindeamos el id del tecnológico
        $stmtNiveles->execute();
        $resultNiveles = $stmtNiveles->get_result();

        // Almacenar los niveles en un array
        $niveles = [];
        while ($nivel = $resultNiveles->fetch_assoc()) {
            // Agregar el nivel con la cantidad de programas y la suma de metas
            $niveles[] = [
                'nivel' => $nivel['nivel_nombre'],
                'cantidad_programas' => (int)$nivel['cantidad_programas'],
                'suma_metas' => (float)$nivel['suma_metas'],
            ];
        }

        // Agregar los niveles a la respuesta
        $data['niveles'] = $niveles;

        // Enviar la respuesta JSON con los datos
        echo json_encode([
            'success' => true,
            'data' => $data
        ]);
    } else {
        // Si no se encuentran resultados para el id proporcionado
        echo json_encode([
            'success' => false,
            'message' => 'No se encontró el tecnológico solicitado.'
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
