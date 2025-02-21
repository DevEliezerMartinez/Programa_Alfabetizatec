<?php
include '../config/conexionDB.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents("php://input"), true);

    if ($data === null) {
        echo json_encode([
            'success' => false,
            'message' => 'No se recibieron datos válidos.'
        ]);
        exit;
    }

    // Datos generales
    $nombre = isset($data['nombres']) ? $data['nombres'] : '';
    $apellidos = isset($data['primer_apellido']) ? $data['primer_apellido'] : '';
    $segundo_apellido = isset($data['segundo_apellido']) ? $data['segundo_apellido'] : null;
    $domicilio = isset($data['vialidad_nombre']) ? $data['vialidad_nombre'] : '';
    $curp = isset($data['curp']) ? $data['curp'] : '';
    $telefono = isset($data['telefono_celular']) ? $data['telefono_celular'] : '';
    $correo = isset($data['correo_personal']) ? $data['correo_personal'] : null;

    // Campos adicionales
    $fecha_nacimiento = isset($data['fecha_nacimiento']) ? $data['fecha_nacimiento'] : null;
    $sexo = isset($data['sexo']) ? $data['sexo'] : null;
    $nacionalidad = isset($data['nacionalidad']) ? $data['nacionalidad'] : null;
    $entidad_nacimiento = isset($data['entidad_nacimiento']) ? $data['entidad_nacimiento'] : null;
    $estado_civil = isset($data['estado_civil']) ? $data['estado_civil'] : null;
    $num_hijos = isset($data['num_hijos']) ? $data['num_hijos'] : 0;
    $vialidad_tipo = isset($data['vialidad_tipo']) ? $data['vialidad_tipo'] : null;
    $vialidad_nombre = isset($data['vialidad_nombre']) ? $data['vialidad_nombre'] : null;
    $num_exterior = isset($data['num_exterior']) ? $data['num_exterior'] : null;
    $num_interior = isset($data['num_interior']) ? $data['num_interior'] : null;
    $codigo_postal = isset($data['codigo_postal']) ? $data['codigo_postal'] : null;
    $telefono_fijo = isset($data['telefono_fijo']) ? $data['telefono_fijo'] : null;
    $habla_lengua_indigena = isset($data['habla_lengua_indigena']) ? $data['habla_lengua_indigena'] : 'no';
    $situacion_laboral = isset($data['situacion_laboral']) ? $data['situacion_laboral'] : null;
    $discapacidad = isset($data['discapacidad']) ? implode(',', $data['discapacidad']) : 'ninguna';
    $nivel_educativo = isset($data['nivel_educativo']) ? $data['nivel_educativo'] : null;
    $motivacion = isset($data['motivacion']) ? implode(',', $data['motivacion']) : null;
    $id_programa = isset($data['programa_estudiante']) ? $data['programa_estudiante'] : null;

    // Nuevos campos que mencionaste
    $colonia = isset($data['colonia']) ? $data['colonia'] : '';
    $entidad_federativa = isset($data['entidad_federativa']) ? $data['entidad_federativa'] : '';
    $habla_otro_idioma = isset($data['habla_otro_idioma']) ? $data['habla_otro_idioma'] : '';
    $lengua_indigena = isset($data['lengua_indigena']) ? $data['lengua_indigena'] : '';
    $municipio = isset($data['municipio']) ? $data['municipio'] : '';
    $otro_idioma = isset($data['otro_idioma']) ? $data['otro_idioma'] : '';
    $proceso_nivel_ingresa = isset($data['proceso_nivel_ingresa']) ? $data['proceso_nivel_ingresa'] : '';
    $se_considera_afromexicano = isset($data['se_considera_afromexicano']) ? $data['se_considera_afromexicano'] : '';
    $se_considera_indigena = isset($data['se_considera_indigena']) ? $data['se_considera_indigena'] : '';
    $servicio_educativo = isset($data['servicio_educativo']) ? $data['servicio_educativo'] : '';
    $tiene_acceso_internet = isset($data['tiene_acceso_internet']) ? $data['tiene_acceso_internet'] : '';
    $tiene_equipo_computo = isset($data['tiene_equipo_computo']) ? $data['tiene_equipo_computo'] : '';

    // Validación de campos obligatorios
    $missing_fields = [];
    $required_fields = ['nombres', 'primer_apellido', 'curp', 'telefono_celular', 'programa_estudiante'];

    foreach ($required_fields as $field) {
        if (empty($data[$field])) {
            $missing_fields[] = $field;
        }
    }

    if (!empty($missing_fields)) {
        echo json_encode([
            'success' => false,
            'message' => 'Faltan los siguientes campos: ' . implode(', ', $missing_fields)
        ]);
        exit;
    }

    $conn = Database::getConnection();
    $conn->begin_transaction();

    try {
        // Construir domicilio a partir de los componentes de la dirección
        $domicilio = trim(
            ($data['vialidad_tipo'] ? $data['vialidad_tipo'] . ' ' : '') .
                ($data['vialidad_nombre'] ? $data['vialidad_nombre'] . ' ' : '') .
                ($data['num_exterior'] ? 'No. ' . $data['num_exterior'] . ' ' : '') .
                ($data['num_interior'] ? 'Int. ' . $data['num_interior'] : '')
        );

        // Insertar datos del estudiante
        $query_estudiante = "INSERT INTO estudiantes (
            nombre, apellidos, domicilio, curp, telefono, correo,
            segundo_apellido, fecha_nacimiento, sexo, nacionalidad, 
            entidad_nacimiento, estado_civil, num_hijos, vialidad_tipo, 
            vialidad_nombre, num_exterior, num_interior, codigo_postal, 
            telefono_fijo, habla_lengua_indigena, situacion_laboral, 
            discapacidad, nivel_educativo, motivacion,
            colonia, entidad_federativa, habla_otro_idioma, lengua_indigena, 
            municipio, otro_idioma, proceso_nivel_ingresa, 
            se_considera_afromexicano, se_considera_indigena, 
            servicio_educativo, tiene_acceso_internet, tiene_equipo_computo
        ) VALUES (
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?, ?, ?
        )";

        // Preparar la declaración y vincular los parámetros
        $stmt_estudiante = $conn->prepare($query_estudiante);
        $stmt_estudiante->bind_param(
            'ssssssssssssssssssssssssssssssssssss',
            $nombre,
            $apellidos,
            $domicilio,
            $curp,
            $telefono,
            $correo,
            $segundo_apellido,
            $fecha_nacimiento,
            $sexo,
            $nacionalidad,
            $entidad_nacimiento,
            $estado_civil,
            $num_hijos,
            $vialidad_tipo,
            $vialidad_nombre,
            $num_exterior,
            $num_interior,
            $codigo_postal,
            $telefono_fijo,
            $habla_lengua_indigena,
            $situacion_laboral,
            $discapacidad,
            $nivel_educativo,
            $motivacion,
            $colonia,
            $entidad_federativa,
            $habla_otro_idioma,
            $lengua_indigena,
            $municipio,
            $otro_idioma,
            $proceso_nivel_ingresa,
            $se_considera_afromexicano,
            $se_considera_indigena,
            $servicio_educativo,
            $tiene_acceso_internet,
            $tiene_equipo_computo
        );

        // Ejecutar la consulta
        $stmt_estudiante->execute();

        // Obtener el ID del estudiante recién insertado
        $id_estudiante = $stmt_estudiante->insert_id;

        // Insertar en la tabla `solicitudes`
        $query_solicitud = "INSERT INTO solicitudes (
            status, id_programa, id_estudiante, fecha
        ) VALUES (
            'pendiente', ?, ?, NOW()
        )";

        $stmt_solicitud = $conn->prepare($query_solicitud);
        $stmt_solicitud->bind_param('ii', $id_programa, $id_estudiante);
        $stmt_solicitud->execute();

        // Confirmar la transacción
        $conn->commit();
        echo json_encode(['success' => true]);
    } catch (Exception $e) {
        $conn->rollback();
        echo json_encode([
            'success' => false,
            'message' => 'Error: ' . $e->getMessage()
        ]);
    }
}