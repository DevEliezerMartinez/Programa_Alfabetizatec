<?php

// Obtener el ID del educador desde la URL
$idEducador = isset($_GET['id']) ? $_GET['id'] : null;

// Verificar si se proporcionó el ID del educador
if (empty($idEducador)) {
    echo json_encode([
        'success' => false,
        'message' => 'No se proporcionó el ID del educador.'
    ]);
    exit();
}

// Obtener los datos JSON enviados en el cuerpo de la solicitud
$datos = json_decode(file_get_contents('php://input'), true);

// Verificar si la decodificación JSON fue exitosa
if ($datos === null) {
    echo json_encode([
        'success' => false,
        'message' => 'No se pudo procesar los datos JSON.'
    ]);
    exit();
}

// Obtener los datos enviados desde el JSON
$apellido = isset($datos['apellido']) ? $datos['apellido'] : '';
$correo = isset($datos['correo']) ? $datos['correo'] : '';
$curp = isset($datos['curp']) ? $datos['curp'] : '';
$nombre = isset($datos['nombre']) ? $datos['nombre'] : '';
$telefono = isset($datos['telefono']) ? $datos['telefono'] : '';
$alianza = isset($datos['alianza']) ? $datos['alianza'] : '';
$subproyecto = isset($datos['subproyecto']) ? $datos['subproyecto'] : '';
$tipo_vinculacion = isset($datos['tipo_vinculacion']) ? $datos['tipo_vinculacion'] : '';
$dependencia = isset($datos['dependencia']) ? $datos['dependencia'] : '';

// Inicializar un array para los errores
$errores = [];

// Verificar qué campos faltan
if (empty($apellido)) {
    $errores[] = 'Apellido';
}
if (empty($correo)) {
    $errores[] = 'Correo';
}
if (empty($nombre)) {
    $errores[] = 'Nombre';
}
if (empty($telefono)) {
    $errores[] = 'Teléfono';
}
if (empty($alianza)) {
    $errores[] = 'Alianza';
}
if (empty($subproyecto)) {
    $errores[] = 'Subproyecto';
}
if (empty($tipo_vinculacion)) {
    $errores[] = 'Tipo de Vinculación';
}
if (empty($dependencia)) {
    $errores[] = 'Dependencia';
}

// Si hay errores, mostrar qué datos faltan
if (count($errores) > 0) {
    echo json_encode([
        'success' => false,
        'message' => 'Faltan los siguientes datos: ' . implode(', ', $errores)
    ]);
    exit();
}

try {
    // Incluir el archivo de conexión
    include('../config/conexionDB.php');
    $conn = Database::getConnection();

    // Iniciar una transacción para asegurar la integridad de los datos
    $conn->begin_transaction();

    // Preparar la consulta SQL para actualizar los datos del educador en la tabla usuarios
    $queryUsuarios = "
        UPDATE usuarios
        SET nombre = ?, apellido = ?, curp = ?, telefono = ?, correo = ?
        WHERE id = ?
    ";

    // Preparar la consulta para usuarios
    $stmtUsuarios = $conn->prepare($queryUsuarios);
    $stmtUsuarios->bind_param('sssssi', $nombre, $apellido, $curp, $telefono, $correo, $idEducador);

    // Ejecutar la consulta para usuarios
    if (!$stmtUsuarios->execute()) {
        throw new Exception("Error al actualizar los datos en la tabla usuarios.");
    }

    // Preparar la consulta SQL para actualizar los datos del educador en la tabla educadores
    $queryEducadores = "
        UPDATE educadores
        SET alianza = ?, subproyecto = ?, tipo_vinculacion = ?, dependencia = ?
        WHERE id_usuario = ?
    ";

    // Preparar la consulta para educadores
    $stmtEducadores = $conn->prepare($queryEducadores);
    $stmtEducadores->bind_param('ssssi', $alianza, $subproyecto, $tipo_vinculacion, $dependencia, $idEducador);

    // Ejecutar la consulta para educadores
    if (!$stmtEducadores->execute()) {
        throw new Exception("Error al actualizar los datos en la tabla educadores.");
    }

    // Confirmar la transacción
    $conn->commit();

    echo json_encode([
        'success' => true,
        'message' => 'Los datos del educador fueron actualizados correctamente.'
    ]);

    // Cerrar las consultas y la conexión
    $stmtUsuarios->close();
    $stmtEducadores->close();
    $conn->close();
} catch (Exception $e) {
    // Revertir la transacción en caso de error
    $conn->rollback();

    echo json_encode([
        'success' => false,
        'message' => 'Hubo un error al procesar la solicitud.',
        'error_details' => $e->getMessage()
    ]);
}
?>