<?php
header('Content-Type: application/json');

// Incluir archivo de configuración de la base de datos
include '../config/conexionDB.php';

try {
    $conn = Database::getConnection();

    // Obtener el id del Instituto desde los parámetros de la solicitud
    $id_instituto = isset($_GET['id_instituto']) ? (int)$_GET['id_instituto'] : 0;

    if ($id_instituto > 0) {
        // Consulta para obtener los programas asociados al Instituto y sus niveles
        $query = "
            SELECT
    p.id,
    p.nombre AS programa_nombre,
    p.descripcion AS programa_descripcion,
    n.nombre AS nivel_nombre,
    p.meta,
    p.inicio_periodo,
    p.fin_periodo,
    CONCAT(u.nombre, ' ', u.apellido) AS coordinador_nombre
FROM
    programas p
INNER JOIN
    niveles n ON p.id_nivel = n.id
INNER JOIN
    educadores cp ON p.id_coordinador = cp.id
INNER JOIN
    usuarios u ON cp.id_usuario = u.id
WHERE
    p.id_tecnologico = ?;
        ";
        $stmt = $conn->prepare($query);

        if ($stmt) {
            $stmt->bind_param("i", $id_instituto); // Enlazar el parámetro
            $stmt->execute();

            // Obtener los resultados
            $result = $stmt->get_result();
            $programas = $result->fetch_all(MYSQLI_ASSOC);

            // Devolver los resultados como JSON
            echo json_encode([
                'success' => true,
                'data' => $programas
            ]);
        } else {
            throw new Exception("Error en la preparación de la consulta: " . $conn->error);
        }
    } else {
        // Si no se recibió un id_instituto válido
        echo json_encode([
            'success' => false,
            'error' => 'El ID del Instituto no es válido o no fue proporcionado.',
            'dato' => $id_instituto
        ]);
    }
} catch (Exception $e) {
    // Capturar cualquier error
    echo json_encode([
        'success' => false,
        'error' => 'Error: ' . $e->getMessage()
    ]);
} finally {
    // Cerrar conexión si fue abierta
    if (isset($conn) && $conn->ping()) {
        $conn->close();
    }
}
