<?php
session_start();

// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

try {
    // Incluir el archivo de conexión
    include('../../config/conexionDB.php');

    // Obtener la conexión
    $conn = Database::getConnection();

    // Obtener el id del educador (coordinador) desde la URL (GET)
    $educadorId = isset($_GET['id']) ? $_GET['id'] : '';

    // Si no se proporciona el id del educador, devolver error
    if (empty($educadorId)) {
        echo json_encode([
            'success' => false,
            'message' => 'No se proporcionó el ID del educador.'
        ]);
        exit();
    }

    // Obtener el nombre y datos del educador (coordinador)
    $queryCoordinador = "
        SELECT u.id, u.nombre, u.apellido, u.curp, u.correo, u.telefono, u.correo_inst,
               e.alianza, e.subproyecto, e.tipo_vinculacion, e.dependencia
        FROM usuarios u
        JOIN educadores e ON u.id = e.id_usuario
        WHERE e.id = ?
    ";
    $stmtCoordinador = $conn->prepare($queryCoordinador);
    $stmtCoordinador->bind_param("i", $educadorId);
    $stmtCoordinador->execute();
    $resultCoordinador = $stmtCoordinador->get_result();

    $coordinadorNombre = '';
    $coordinadorDatos = [];
    if ($resultCoordinador->num_rows > 0) {
        $coordinador = $resultCoordinador->fetch_assoc();
        $coordinadorNombre = $coordinador['nombre'] . ' ' . $coordinador['apellido'];
        $coordinadorDatos = [
            'id' => $coordinador['id'],
            'nombre' => $coordinador['nombre'],
            'apellido' => $coordinador['apellido'],
            'curp' => $coordinador['curp'],
            'correo' => $coordinador['correo'],
            'telefono' => $coordinador['telefono'],
            'correo_inst' => $coordinador['correo_inst'],
            'alianza' => $coordinador['alianza'],
            'subproyecto' => $coordinador['subproyecto'],
            'tipo_vinculacion' => $coordinador['tipo_vinculacion'],
            'dependencia' => $coordinador['dependencia']
        ];
    }

    // Obtener los programas asociados al educador
    $queryProgramasEducador = "
        SELECT p.id, p.nombre, p.descripcion, p.inicio_periodo, p.fin_periodo, p.id_nivel, p.id_coordinador
        FROM programas p
        WHERE p.id_coordinador = ?
    ";

    $stmtProgramasEducador = $conn->prepare($queryProgramasEducador);
    $stmtProgramasEducador->bind_param("i", $educadorId);
    $stmtProgramasEducador->execute();
    $resultProgramasEducador = $stmtProgramasEducador->get_result();

    $programas = [];
    while ($programa = $resultProgramasEducador->fetch_assoc()) {
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

        // Agregar el nombre del nivel al programa
        $programa['nivel'] = $nivelNombre;

        // Consultar los estudiantes asociados a ese programa
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
        $stmtEstudiantes->bind_param("i", $programa['id']);
        $stmtEstudiantes->execute();
        $resultEstudiantes = $stmtEstudiantes->get_result();

        $estudiantes = [];
        while ($estudiante = $resultEstudiantes->fetch_assoc()) {
            $estudiantes[] = $estudiante;
        }

        // Agregar la lista de estudiantes al programa
        $programa['estudiantes'] = $estudiantes;

        $programas[] = $programa;
    }

    // Enviar la respuesta JSON con el nombre del educador, los programas y los datos del coordinador
    echo json_encode([
        'success' => true,
        'educador' => $coordinadorNombre,
        'educador_datos' => $coordinadorDatos,
        'programas' => $programas
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
