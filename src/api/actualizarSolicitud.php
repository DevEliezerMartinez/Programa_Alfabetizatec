<?php
// Establecer el tipo de respuesta como JSON
header('Content-Type: application/json');

// Incluir el archivo de conexión a la base de datos
include('../config/conexionDB.php'); // Ajusta la ruta según tu estructura de archivos

try {
    // Obtener la conexión a la base de datos
    $conn = Database::getConnection();

    // Verificar si se recibieron los datos necesarios
    if (!isset($_POST['id_solicitud']) || !isset($_POST['nombre']) || !isset($_POST['apellidos']) || !isset($_POST['nuevoVialidadTipo']) || !isset($_POST['nuevoVialidadNombre']) || !isset($_POST['nuevoNumExterior']) || !isset($_POST['curp']) || !isset($_POST['telefono'])) {
        echo json_encode([
            'success' => false,
            'message' => 'Datos incompletos.'
        ]);
        exit();
    }

    // Obtener los datos desde la solicitud POST
    $idSolicitud = $_POST['id_solicitud'];
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $apellido_materno = $_POST['apellido_materno'];
    $nuevoVialidadTipo = $_POST['nuevoVialidadTipo'];
    $nuevoVialidadNombre = $_POST['nuevoVialidadNombre'];
    $nuevoNumExterior = $_POST['nuevoNumExterior'];
    $curp = $_POST['curp'];
    $telefono = $_POST['telefono'];
    $correo = $_POST['correo'] ?? null; // Campo opcional

    // Construir el domicilio completo
    $domicilio = $nuevoVialidadTipo . ' ' . $nuevoVialidadNombre . ' ' . $nuevoNumExterior;

    // Preparar la consulta SQL para actualizar el estudiante
    $query = "UPDATE estudiantes SET 
              nombre = ?, 
              apellidos = ?, 
              segundo_apellido = ?, 
              domicilio = ?, 
              curp = ?, 
              telefono = ?, 
              correo = ? 
              WHERE id = ?";
    $stmt = $conn->prepare($query);

    // Vincular los parámetros
    $stmt->bind_param("sssssssi", $nombre, $apellidos, $apellido_materno, $domicilio, $curp, $telefono, $correo, $idSolicitud);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo json_encode([
            'success' => true,
            'message' => 'Los datos del estudiante han sido actualizados correctamente.'
        ]);
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Hubo un error al intentar actualizar los datos del estudiante.',
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