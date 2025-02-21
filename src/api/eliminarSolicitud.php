<?php
// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

// Incluir el archivo de conexión a la base de datos
include('../config/conexionDB.php'); // Ajusta la ruta según tu estructura de archivos

try {
    // Obtener la conexión a la base de datos
    $conn = Database::getConnection();

    // Verificar si se recibió el ID de la solicitud
    if (!isset($_POST['id_solicitud']) || empty($_POST['id_solicitud'])) {
        echo json_encode([
            'success' => false,
            'message' => 'No se proporcionó el ID de la solicitud.'
        ]);
        exit();
    }

    // Obtener el ID de la solicitud desde la solicitud POST
    $idSolicitud = $_POST['id_solicitud'];

    // Preparar la consulta SQL para eliminar la solicitud
    $query = "DELETE FROM solicitudes WHERE id = ?";
    $stmt = $conn->prepare($query);

    // Vincular el parámetro
    $stmt->bind_param("i", $idSolicitud);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        // Verificar si se eliminó alguna fila
        if ($stmt->affected_rows > 0) {
            echo json_encode([
                'success' => true,
                'message' => 'La solicitud ha sido eliminada correctamente.'
            ]);
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'No se encontró la solicitud con el ID proporcionado.'
            ]);
        }
    } else {
        // Si hubo un error en la ejecución de la consulta
        echo json_encode([
            'success' => false,
            'message' => 'Hubo un error al intentar eliminar la solicitud.',
            'error_details' => $stmt->error
        ]);
    }

    // Cerrar la declaración y la conexión
    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    // Manejo de errores
    echo json_encode([
        'success' => false,
        'message' => 'Hubo un error al procesar la solicitud.',
        'error_details' => $e->getMessage()
    ]);
}