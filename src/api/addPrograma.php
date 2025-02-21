<?php
// Incluir el archivo de conexión a la base de datos
include '../config/conexionDB.php';
session_start();  // Asegúrate de iniciar la sesión en el backend

// Verificar si la solicitud es POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos JSON enviados
    $data = json_decode(file_get_contents("php://input"), true);

    // Verificar si los datos fueron recibidos correctamente
    if ($data === null) {
        echo json_encode([
            'success' => false,
            'message' => 'No se recibieron datos válidos.'
        ]);
        exit;
    }

    // Obtener el id_tecnologico de la sesión
    $id_tecnologico = isset($_SESSION['id_tecnologico']) ? $_SESSION['id_tecnologico'] : null;

    // Validar que el id_tecnologico esté disponible
    if (!$id_tecnologico) {
        echo json_encode([
            'success' => false,
            'message' => 'El id_tecnologico no está disponible en la sesión.'
        ]);
        exit;
    }

    // Obtener los datos del formulario
    $id_nivel = isset($data['id_nivel']) ? $data['id_nivel'] : [];  // Ahora es un arreglo
    $metas = isset($data['metas']) ? $data['metas'] : [];  // Las metas vienen como un objeto
    $id_coordinador = isset($data['educador']) ? $data['educador'] : ''; // Usar 'educador' si ese es el campo correcto
    $inicio_periodo = isset($data['inicio_periodo']) ? $data['inicio_periodo'] : '';
    $fin_periodo = isset($data['fin_periodo']) ? $data['fin_periodo'] : '';

    // Validación de campos obligatorios
    $missing_fields = [];

    if (empty($id_nivel)) {
        $missing_fields[] = 'id_nivel';
    }
    if (empty($metas)) {
        $missing_fields[] = 'metas';
    }

    if (!$inicio_periodo) {
        $missing_fields[] = 'inicio_periodo';
    }
    if (!$fin_periodo) {
        $missing_fields[] = 'fin_periodo';
    }

    // Si hay campos faltantes, devolver error
    if (!empty($missing_fields)) {
        echo json_encode([
            'success' => false,
            'message' => 'Faltan los siguientes campos: ' . implode(', ', $missing_fields)
        ]);
        exit;
    }

    // Cambiar nombre y descripcion a cadenas con 3 espacios
    $nombre = "   ";  // 3 espacios
    $descripcion = "   ";  // 3 espacios


    // Obtener la conexión a la base de datos
    $conn = Database::getConnection();

    // Iniciar la transacción
    $conn->begin_transaction();

    try {
        // Preparar la consulta para insertar los programas
        $query_programa = "INSERT INTO programas (nombre, descripcion, id_tecnologico, id_nivel, meta, id_coordinador, inicio_periodo, fin_periodo)
                           VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt_programa = $conn->prepare($query_programa);

        // Iterar sobre los niveles recibidos
        foreach ($id_nivel as $nivelId) {
            // Recuperar la meta asociada a este nivel
            $meta = isset($metas[$nivelId]) ? $metas[$nivelId] : '';

            // Si hay una meta para este nivel, realizar la inserción
            if ($meta) {
                // Aquí realizamos la inserción por cada nivel
                $stmt_programa->bind_param('ssiiisss', $nombre, $descripcion, $id_tecnologico, $nivelId, $meta, $id_coordinador, $inicio_periodo, $fin_periodo);
                $stmt_programa->execute();
            }
        }

        // Confirmar la transacción
        $conn->commit();

        // Respuesta exitosa
        echo json_encode([
            'success' => true,
            'message' => 'Programa(s) registrado(s) correctamente.'
        ]);
    } catch (Exception $e) {
        // En caso de error, revertir la transacción
        $conn->rollback();
        echo json_encode([
            'success' => false,
            'message' => 'Error al insertar los datos: ' . $e->getMessage()
        ]);
    }

    // Cerrar la declaración
    $stmt_programa->close();
    $conn->close();
} else {
    // Si la solicitud no es POST, retornar error
    echo json_encode([
        'success' => false,
        'message' => 'Método de solicitud no válido.'
    ]);
}
