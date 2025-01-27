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

    // Consulta para obtener los detalles del programa por su id
    $queryPrograma = "
        SELECT p.id, p.nombre, p.descripcion, p.inicio_periodo, p.fin_periodo, p.id_nivel
        FROM programas p
        WHERE p.id = ?
    ";

    $stmtPrograma = $conn->prepare($queryPrograma);
    $stmtPrograma->bind_param("i", $programaId); // Bindeamos el id del programa
    $stmtPrograma->execute();
    $resultPrograma = $stmtPrograma->get_result();

    // Verificar si se obtuvo el resultado
    if ($resultPrograma->num_rows > 0) {
        $programa = $resultPrograma->fetch_assoc(); // Obtener los detalles del programa

        // Obtener el nombre del nivel asociado al programa
        $nivelId = $programa['id_nivel'];
        $queryNivel = "SELECT nombre FROM niveles WHERE id = ?";
        $stmtNivel = $conn->prepare($queryNivel);
        $stmtNivel->bind_param("i", $nivelId); // Bindeamos el id del nivel
        $stmtNivel->execute();
        $resultNivel = $stmtNivel->get_result();

        $nivelNombre = '';
        if ($resultNivel->num_rows > 0) {
            $nivel = $resultNivel->fetch_assoc();
            $nivelNombre = $nivel['nombre'];
        }

        // Agregar el nombre del nivel al programa
        $programa['nivel'] = $nivelNombre;

        // Consulta para obtener la lista de estudiantes asociados al programa
        $queryEstudiantes = "
SELECT e.id, 
       e.nombre, 
       CONCAT(e.apellidos, ' ', e.segundo_apellido) AS apellidos, 
       e.domicilio, 
       e.curp, 
       e.telefono, 
       e.correo, 
       s.status
FROM estudiantes e
JOIN solicitudes s ON e.id = s.id_estudiante
WHERE s.id_programa = ?

";

        $stmtEstudiantes = $conn->prepare($queryEstudiantes);
        $stmtEstudiantes->bind_param("i", $programaId); // Bindeamos el id del programa
        $stmtEstudiantes->execute();
        $resultEstudiantes = $stmtEstudiantes->get_result();

        $estudiantes = [];
        while ($estudiante = $resultEstudiantes->fetch_assoc()) {
            $estudiantes[] = $estudiante; // Almacenamos cada estudiante en un array
        }

        // Agregar la lista de estudiantes al programa
        $programa['estudiantes'] = $estudiantes;

        // Consulta para obtener todas las solicitudes asociadas al programa
        $querySolicitudes = "
            SELECT id, status, id_programa, id_estudiante, fecha
            FROM solicitudes
            WHERE id_programa = ?
        ";

        $stmtSolicitudes = $conn->prepare($querySolicitudes);
        $stmtSolicitudes->bind_param("i", $programaId); // Bindeamos el id del programa
        $stmtSolicitudes->execute();
        $resultSolicitudes = $stmtSolicitudes->get_result();

        $solicitudes = [];
        while ($solicitud = $resultSolicitudes->fetch_assoc()) {
            $solicitudes[] = $solicitud; // Almacenamos cada solicitud en un array
        }

        // Agregar la lista de solicitudes al programa
        $programa['solicitudes'] = $solicitudes;

        // Enviar la respuesta JSON con los detalles del programa, estudiantes y solicitudes
        echo json_encode([
            'success' => true,
            'data' => $programa
        ]);
    } else {
        // Si no se encuentra el programa
        echo json_encode([
            'success' => false,
            'message' => 'No se encontró el programa solicitado.'
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
