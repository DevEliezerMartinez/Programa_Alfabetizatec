<?php
session_start();

// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

try {
    // Incluir el archivo de conexión
    include('../../config/conexionDB.php');

    // Obtener la conexión
    $conn = Database::getConnection();

    // Obtener el id del programa desde la URL (GET)
    $programaId = isset($_GET['id']) ? $_GET['id'] : '';

    // Si no se proporciona el id del programa, devolver error
    if (empty($programaId)) {
        echo json_encode([
            'success' => false,
            'message' => 'No se proporcionó el ID del programa.'
        ]);
        exit();
    }

    // Consulta para obtener los detalles del programa por su id y el nombre del coordinador
    $queryPrograma = "
        SELECT p.id, 
               p.nombre, 
               p.descripcion, 
               p.inicio_periodo, 
               p.fin_periodo, 
               p.id_nivel, 
               cp.id_usuario AS id_coordinador, 
               u.nombre AS nombre_coordinador, 
               u.apellido AS apellido_coordinador
        FROM programas p
        LEFT JOIN educadores cp ON p.id_coordinador = cp.id
        LEFT JOIN usuarios u ON cp.id_usuario = u.id
        WHERE p.id = ?
    ";

    $stmtPrograma = $conn->prepare($queryPrograma);
    $stmtPrograma->bind_param("i", $programaId);
    $stmtPrograma->execute();
    $resultPrograma = $stmtPrograma->get_result();

    if ($resultPrograma->num_rows > 0) {
        $programa = $resultPrograma->fetch_assoc();

        // Obtener el nombre del nivel asociado al programa
        $nivelId = $programa['id_nivel'];
        $queryNivel = "SELECT nombre FROM niveles WHERE id = ?";
        $stmtNivel = $conn->prepare($queryNivel);
        $stmtNivel->bind_param("i", $nivelId);
        $stmtNivel->execute();
        $resultNivel = $stmtNivel->get_result();

        $nivelNombre = '';
        if ($resultNivel->num_rows > 0) {
            $nivel = $resultNivel->fetch_assoc();
            $nivelNombre = $nivel['nombre'];
        }
        $programa['nivel'] = $nivelNombre;

        // Consulta para obtener la lista de estudiantes asociados al programa
        $queryEstudiantes = "
            SELECT e.id, 
                   e.nombre, 
                   CONCAT(e.apellidos) AS apellidos, 
                    CONCAT(e.segundo_apellido) AS apellido_materno, 
                   e.vialidad_tipo, 
                   e.vialidad_nombre, 
                   e.num_exterior, 
                   e.curp, 
                   e.telefono, 
                   e.correo , 
                   s.status
            FROM estudiantes e
            JOIN solicitudes s ON e.id = s.id_estudiante
            WHERE s.id_programa = ?
        ";

        $stmtEstudiantes = $conn->prepare($queryEstudiantes);
        $stmtEstudiantes->bind_param("i", $programaId);
        $stmtEstudiantes->execute();
        $resultEstudiantes = $stmtEstudiantes->get_result();

        $estudiantes = [];
        while ($estudiante = $resultEstudiantes->fetch_assoc()) {
            $estudiantes[] = $estudiante;
        }
        $programa['estudiantes'] = $estudiantes;

        // Consulta para obtener todas las solicitudes asociadas al programa
        $querySolicitudes = "
            SELECT id, status, id_programa, id_estudiante, fecha
            FROM solicitudes
            WHERE id_programa = ?
        ";

        $stmtSolicitudes = $conn->prepare($querySolicitudes);
        $stmtSolicitudes->bind_param("i", $programaId);
        $stmtSolicitudes->execute();
        $resultSolicitudes = $stmtSolicitudes->get_result();

        $solicitudes = [];
        while ($solicitud = $resultSolicitudes->fetch_assoc()) {
            $solicitudes[] = $solicitud;
        }
        $programa['solicitudes'] = $solicitudes;

        // Enviar la respuesta JSON con los detalles del programa, estudiantes y solicitudes
        echo json_encode([
            'success' => true,
            'data' => $programa
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'No se encontró el programa solicitado.'
        ]);
    }
} catch (Exception $e) {
    echo json_encode([
        'success' => false,
        'message' => 'Hubo un error al procesar la solicitud.',
        'error_details' => $e->getMessage()
    ]);
}
