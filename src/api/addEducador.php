<?php
header('Content-Type: application/json'); // Siempre devolver JSON
include '../config/conexionDB.php';

// Iniciar sesión
session_start();

// Verificar si el usuario está autenticado
if (!isset($_SESSION['id_tecnologico'])) {
    echo json_encode([
        'success' => false,
        'message' => 'Sesión caducada. Por favor, inicie sesión nuevamente.',
        'details' => 'No se encontró id_tecnologico en la sesión.'
    ]);
    exit;
}

// Validar método de solicitud
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode([
        'success' => false,
        'message' => 'Método de solicitud no válido.',
        'details' => 'Se esperaba una solicitud POST.'
    ]);
    exit;
}

// Recibir y validar datos del formulario
$required_fields = [
    'nombre',
    'telefono',
    'correo',
    'tipo_participante',
    'modalidad'
];

$missing_fields = [];
foreach ($required_fields as $field) {
    if (empty($_POST[$field])) {
        $missing_fields[] = $field;
    }
}

if (!empty($missing_fields)) {
    echo json_encode([
        'success' => false,
        'message' => 'Faltan los siguientes campos: ' . implode(', ', $missing_fields),
        'details' => 'Campos obligatorios no proporcionados.'
    ]);
    exit;
}

// Validar formato de datos
if (!filter_var($_POST['correo'], FILTER_VALIDATE_EMAIL)) {
    echo json_encode([
        'success' => false,
        'message' => 'El correo electrónico no es válido.',
        'details' => 'Formato de correo inválido.'
    ]);
    exit;
}

if (!preg_match('/^\d{10}$/', $_POST['telefono'])) {
    echo json_encode([
        'success' => false,
        'message' => 'El teléfono debe tener 10 dígitos.',
        'details' => 'Formato de teléfono inválido.'
    ]);
    exit;
}

// Asignar datos del formulario
$nombre = trim($_POST['nombre']);
$primer_apellido = trim($_POST['primer_apellido'] ?? '');
$segundo_apellido = trim($_POST['segundo_apellido'] ?? '');
$fecha_nacimiento = $_POST['fecha_nacimiento'] ?? '';
$telefono = str_replace(' ', '', $_POST['telefono']);
$correo = $_POST['correo'];
$correo_inst = $_POST['correo_inst'] ?? '';
$escolaridad = $_POST['escolaridad'] ?? '';
$ocupacion = $_POST['ocupacion'] ?? '';
$rol = $_POST['rol'] ?? '';
$fecha_registro = $_POST['fecha_registro'] ?? '';
$alianza = $_POST['alianza'] ?? '';
$subproyecto = $_POST['subproyecto'] ?? '';
$tipo_vinculacion = $_POST['tipo_vinculacion'] ?? '';
$tipo_participante = $_POST['tipo_participante'];
$modalidad = $_POST['modalidad'];
$carrera = intval($_POST['carrera'] ?? 0);
$semestre = intval($_POST['semestre'] ?? 0);
$rol_id = intval($_POST['rol_id'] ?? 4);
$id_tecnologico = $_SESSION['id_tecnologico'];
$nacionalidad = $_POST['nacionalidad'] ?? '';
$entidad_nacimiento = $_POST['entidad_nacimiento'] ?? '';
$curp = $_POST['curp'] ?? '';
$sexo = $_POST['sexo'] ?? '';
$depedencia = $_POST['depedencia'] ?? '';
$estado_civil = $_POST['estado_civil'] ?? '';
$num_hijos = $_POST['num_hijos'] ?? '';

// Conectar a la base de datos
$conn = Database::getConnection();
if (!$conn) {
    echo json_encode([
        'success' => false,
        'message' => 'Error al conectar con la base de datos.',
        'details' => 'Conexión a la base de datos fallida.'
    ]);
    exit;
}

// Iniciar transacción
$conn->begin_transaction();

try {
    // Insertar usuario
    $apellido = trim($primer_apellido . " " . $segundo_apellido);
    $contrasena_hash = '$2y$10$Tlx2JQtCvLDValQloBiKSuk/qp5owPEgdVTRwO4e0TYYnuGXL5Ui.'; // Hash de ejemplo

    $query_usuario = "INSERT INTO usuarios (nombre, apellido, fecha_nacimiento, telefono, correo, correo_inst, contrasena, rol_id, puesto)
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt_usuario = $conn->prepare($query_usuario);
    $stmt_usuario->bind_param(
        'sssssssss',
        $nombre,
        $apellido,
        $fecha_nacimiento,
        $telefono,
        $correo,
        $correo_inst,
        $contrasena_hash,
        $rol_id,
        $puesto
    );
    $stmt_usuario->execute();
    $id_usuario = $stmt_usuario->insert_id;

    // Insertar educador
    $query_educador = "INSERT INTO educadores (
        id_usuario, tipo_participante, modalidad, id_tecnologico, semestre, nacionalidad,
        entidad_nacimiento, curp, sexo, estado_civil, num_hijos, escolaridad, ocupacion,
        fecha_registro, alianza, subproyecto, tipo_vinculacion, dependencia
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt_educador = $conn->prepare($query_educador);
    $stmt_educador->bind_param(
        'isssiissssssssssss',
        $id_usuario,
        $tipo_participante,
        $modalidad,
        $id_tecnologico,
        $semestre,
        $nacionalidad,
        $entidad_nacimiento,
        $curp,
        $sexo,
        $estado_civil,
        $num_hijos,
        $escolaridad,
        $ocupacion,
        $fecha_registro,
        $alianza,
        $subproyecto,
        $tipo_vinculacion,
        $depedencia
    );
    $stmt_educador->execute();

    // Confirmar transacción
    $conn->commit();

    echo json_encode([
        'success' => true,
        'message' => 'Datos insertados correctamente.',
        'details' => 'Usuario y educador registrados con éxito.'
    ]);
} catch (Exception $e) {
    // Revertir transacción en caso de error
    $conn->rollback();
    error_log("Error en la transacción: " . $e->getMessage()); // Log para depuración
    echo json_encode([
        'success' => false,
        'message' => 'Error al insertar los datos.',
        'details' => $e->getMessage() // Detalles del error
    ]);
} finally {
    // Cerrar conexiones
    if (isset($stmt_usuario)) $stmt_usuario->close();
    if (isset($stmt_educador)) $stmt_educador->close();
    if ($conn) $conn->close();
}
