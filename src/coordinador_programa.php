<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alfabetizatec - Coor. Programa</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/layout/header.css">
    <link rel="stylesheet" href="../assets/css/coordinador_programa.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert ya importado -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

</head>

<body>
    <?php
    session_start();
    include('./api/auth/validate.php');
    ?>

    <header>
        <?php include('./layout/header.php') ?>
    </header>

    <main>
        <ul class="breadcrumb">
            <li><a href="#">Inicio</a></li>

        </ul>
        <h2 class="titulo_principal">Bienvenido <?php echo $_SESSION['nombre'] . ' ' . $_SESSION['apellido']; ?></h2>
        <p class="tec_nombre"><?php echo $_SESSION['nombre_tecnologico']; ?></p>


        <div class="actions">
            <button class="btn_submit_educador">1. -Registrar educador </button>
            <button class="btn_submit_programa">2.- Nuevo Programa </button>
            <button class="btn_submit_estudiante">3. -Agregar Estudiante </button>
        </div>


        <div class="datos_tec">
            <!-- Bloque: Educadores -->
            <div class="info">
                <h4>Educadores:
                    <span class="tooltip-icon" data-tooltip="En esta sección se muestra la lista de educadores. Cada educador tiene un perfil detallado al que se puede acceder haciendo clic en su nombre.">?</span>
                </h4>

                <div id="Educadores_tec"></div>

            </div>

            <!-- Bloque: Programas -->
            <div class="info">
                <h4>Programas:
                    <span class="tooltip-icon" data-tooltip="Aquí se muestra el listado de programas registrados, mostrando Información gral, puedes acceder a los detalles de un programa en especifico ">?</span>
                </h4>

                <div id="Programas_tec"></div>
                <p class="nota">
                    Nota: Un educador puede estar asociado a múltiples programas, por lo que su nombre puede aparecer más de una vez.
                </p>
            </div>
        </div>



    </main>

    <!-- Modal programa -->
    <div id="modal_programa" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Formulario de Registro</h2>
            <form id="registrationForm">
                <div class="input_grupo">
                    <label for="educador">Educador:</label>
                    <select id="educadorSelect" name="educador" required>
                        <option value="">Selecciona un educador</option>
                    </select>
                    <span class="tooltip">Recuerda que debes registrar primero a tus educadores.</span>
                </div>

                <div class="input_grupo">
                    <label for="id_nivel">Nivel:</label>
                    <select id="id_nivel" name="id_nivel[]" multiple required>
                        <option value="1">Analfabeta</option>
                        <option value="2">Primaria</option>
                        <option value="3">Secundaria</option>
                    </select>
                    <span class="tooltip">Selecciona uno o más niveles (usa Ctrl + clic para seleccionar múltiples).</span>
                </div>

                <div id="metasContainer">
                    <!-- Aquí se agregarán dinámicamente los campos de meta -->
                </div>

                <div class="input_grupo">
                    <label for="inicio_periodo">Inicio Periodo:</label>
                    <input type="date" id="inicio_periodo" name="inicio_periodo" required>
                    <span class="tooltip">Formato: DD/MM/AAAA</span>
                </div>

                <div class="input_grupo">
                    <label for="fin_periodo">Fin Periodo:</label>
                    <input type="date" id="fin_periodo" name="fin_periodo" required>
                    <span class="tooltip">Formato: DD/MM/AAAA</span>
                </div>

                <button class="btn_submit">Enviar</button>
            </form>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const nivelSelect = document.getElementById("id_nivel");
            const metasContainer = document.getElementById("metasContainer");
            const niveles = {
                "1": "Analfabeta",
                "2": "Primaria",
                "3": "Secundaria"
            };

            nivelSelect.addEventListener("change", function() {
                metasContainer.innerHTML = ""; // Limpiar contenido anterior
                const inicioPeriodo = document.getElementById("inicio_periodo").value || "Inicio";
                const finPeriodo = document.getElementById("fin_periodo").value || "Fin";

                Array.from(nivelSelect.selectedOptions).forEach(option => {
                    const nivelId = option.value;
                    const nivelNombre = niveles[nivelId];

                    const metaGrupo = document.createElement("div");
                    metaGrupo.classList.add("input_grupo");

                    metaGrupo.innerHTML = `
                <label for="meta_${nivelId}">Meta del nivel: ${nivelNombre} </label>
                <input type="number" id="meta_${nivelId}" name="meta[${nivelId}]" required>
            `;

                    metasContainer.appendChild(metaGrupo);
                });
            });


        });
    </script>


    <!-- Modal Educador -->
    <div id="modal_educador" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Formulario de Registro - Educador</h2>
            <form id="registrationFormEducador">
                <div class="input_grupo">
                    <label for="nombre">Nombre(s):</label>
                    <input type="text" id="nombre" name="nombre" required placeholder="Ej. Juan Carlos">
                    <span class="tooltip">Ingresa el nombre(s) sin apellidos.</span>
                </div>

                <div class="input_grupo">
                    <label for="primer_apellido">Primer Apellido:</label>
                    <input type="text" id="primer_apellido" name="primer_apellido" required placeholder="Ej. Pérez">
                    <span class="tooltip">Ingresa el primer apellido.</span>
                </div>

                <div class="input_grupo">
                    <label for="segundo_apellido">Segundo Apellido:</label>
                    <input type="text" id="segundo_apellido" name="segundo_apellido" placeholder="Ej. López">
                    <span class="tooltip">Ingresa el segundo apellido (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                    <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
                    <span class="tooltip">Formato: DD/MM/AAAA</span>
                </div>

                <div class="input_grupo">
                    <label for="rfc">RFC:</label>
                    <input type="text" id="rfc" name="rfc" placeholder="Ej. PERJ800101XXX">
                    <span class="tooltip">Ingresa el RFC (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="nacionalidad">Nacionalidad:</label>
                    <select id="nacionalidad" name="nacionalidad" required>
                        <option value="">Seleccione</option>
                        <option value="mexicano">Mexicano</option>
                        <option value="extranjero">Extranjero</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="entidad_nacimiento">Entidad de Nacimiento:</label>
                    <select id="entidad_nacimiento" name="entidad_nacimiento" required>
                        <option value="">Seleccione</option>
                        <option value="Aguascalientes">Aguascalientes</option>
                        <option value="Baja California">Baja California</option>
                        <option value="Baja California Sur">Baja California Sur</option>
                        <option value="Campeche">Campeche</option>
                        <option value="Chiapas">Chiapas</option>
                        <option value="Chihuahua">Chihuahua</option>
                        <option value="Ciudad de México">Ciudad de México</option>
                        <option value="Coahuila">Coahuila</option>
                        <option value="Colima">Colima</option>
                        <option value="Durango">Durango</option>
                        <option value="Guanajuato">Guanajuato</option>
                        <option value="Guerrero">Guerrero</option>
                        <option value="Hidalgo">Hidalgo</option>
                        <option value="Jalisco">Jalisco</option>
                        <option value="México">México</option>
                        <option value="Michoacán">Michoacán</option>
                        <option value="Morelos">Morelos</option>
                        <option value="Nayarit">Nayarit</option>
                        <option value="Nuevo León">Nuevo León</option>
                        <option value="Oaxaca">Oaxaca</option>
                        <option value="Puebla">Puebla</option>
                        <option value="Querétaro">Querétaro</option>
                        <option value="Quintana Roo">Quintana Roo</option>
                        <option value="San Luis Potosí">San Luis Potosí</option>
                        <option value="Sinaloa">Sinaloa</option>
                        <option value="Sonora">Sonora</option>
                        <option value="Tabasco">Tabasco</option>
                        <option value="Tamaulipas">Tamaulipas</option>
                        <option value="Tlaxcala">Tlaxcala</option>
                        <option value="Veracruz">Veracruz</option>
                        <option value="Yucatán">Yucatán</option>
                        <option value="Zacatecas">Zacatecas</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="curp">CURP:</label>
                    <input type="text" id="curp" name="curp" required placeholder="Ej. PERJ800101HDFLNR01">
                    <span class="tooltip">Ingresa la CURP (18 caracteres).</span>
                </div>

                <div class="input_grupo">
                    <label for="sexo">Sexo:</label>
                    <select id="sexo" name="sexo" required>
                        <option value="">Seleccione</option>
                        <option value="mujer">Mujer</option>
                        <option value="hombre">Hombre</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="estado_civil">Estado Civil:</label>
                    <select id="estado_civil" name="estado_civil" required>
                        <option value="">Seleccione</option>
                        <option value="soltero">Soltero</option>
                        <option value="union_libre">Unión Libre</option>
                        <option value="casado">Casado</option>
                        <option value="separado">Separado</option>
                        <option value="divorciado">Divorciado</option>
                        <option value="viudo">Viudo</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="num_hijos">No. de Hijos:</label>
                    <input type="number" id="num_hijos" name="num_hijos" min="0" required placeholder="Ej. 2">
                    <span class="tooltip">Ingresa el número de hijos (0 si no tiene).</span>
                </div>

                <div class="input_grupo">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" id="telefono" name="telefono" pattern="[0-9]{10}" required maxlength="10" placeholder="Ej. 5512345678">
                    <span class="tooltip">Ingresa solo números (10 dígitos).</span>
                </div>

                <div class="input_grupo">
                    <label for="correo">Correo Personal:</label>
                    <input type="email" id="correo" name="correo" required placeholder="Ej. juan.perez@gmail.com">
                    <span class="tooltip">Ingresa un correo válido.</span>
                </div>

                <div class="input_grupo">
                    <label for="correo_inst">Correo Institucional:</label>
                    <input type="email" id="correo_inst" name="correo_inst" placeholder="Ej. juan.perez@institucion.com">
                    <span class="tooltip">Ingresa el correo institucional (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="escolaridad">Escolaridad:</label>
                    <select id="escolaridad" name="escolaridad" required>
                        <option value="">Seleccione</option>
                        <option value="primaria_completa">Primaria Completa</option>
                        <option value="secundaria_completa">Secundaria Completa</option>
                        <option value="bachillerato_completo">Bachillerato Completo</option>
                        <option value="tecnica_completa">Carrera Técnica Completa</option>
                        <option value="licenciatura_completa">Licenciatura Completa</option>
                        <option value="postgrado_completo">Postgrado Completo</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="ocupacion">Ocupación:</label>
                    <select id="ocupacion" name="ocupacion" required>
                        <option value="Operador de trans. o maq. mov.">Operador de trans. o maq. mov.</option>
                        <option value="Trabajador en ser. al púb. o pers.">Trabajador en ser. al púb. o pers.</option>
                        <option value="Desempleado">Desempleado</option>
                        <option value="Trabajador agropecuario">Trabajador agropecuario</option>
                        <option value="Jefe de actividades administrativas">Jefe de actividades administrativas</option>
                        <option value="Trabajador doméstico">Trabajador doméstico</option>
                        <option value="Trabajador de la educación">Trabajador de la educación</option>
                        <option value="Inspector o supervisor">Inspector o supervisor</option>
                        <option value="Trabajador administrativo">Trabajador administrativo</option>
                        <option value="Protección o vigilancia">Protección o vigilancia</option>
                        <option value="Trabajador del arte o deportes">Trabajador del arte o deportes</option>
                        <option value="Artesano u obrero">Artesano u obrero</option>
                        <option value="Comerciante o dependiente">Comerciante o dependiente</option>
                        <option value="Quehaceres del hogar">Quehaceres del hogar</option>
                        <option value="Funcionario o directivo">Funcionario o directivo</option>
                        <option value="Operador de maquinaria fija">Operador de maquinaria fija</option>
                        <option value="Trabajador ambulante">Trabajador ambulante</option>
                        <option value="Profesionista">Profesionista</option>
                        <option value="Empleado de gobierno">Empleado de gobierno</option>
                        <option value="Ayudante o similar">Ayudante o similar</option>
                        <option value="Estudiante">Estudiante</option>
                        <option value="Pensionado">Pensionado</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="rol">Rol (es) de la persona operativa:</label>
                    <select id="rol" name="rol" required>
                        <option value="Asesor educativo">Asesor educativo</option>
                        <option value="Responsable de Área en Inst Estatal / UO">Responsable de Área en Inst Estatal / UO</option>
                        <option value="Personal en Inst Estatal / UO">Personal en Inst Estatal / UO</option>
                        <option value="Aplicador de exámenes">Aplicador de exámenes</option>
                        <option value="Coordinador Regional">Coordinador Regional</option>
                        <option value="Personal en Coordinación de Zona">Personal en Coordinación de Zona</option>
                        <option value="Persona Técnico Docente">Persona Técnico Docente</option>
                        <option value="Coordinador de Zona">Coordinador de Zona</option>
                        <option value="Director Inst Estatal / UO">Director Inst Estatal / UO</option>
                        <option value="Responsable de Informática en CZ">Responsable de Informática en CZ</option>
                        <option value="Responsable de Informática en Inst Estatal / UO">Responsable de Informática en Inst Estatal / UO</option>
                        <option value="Responsable de Acreditación en CZ">Responsable de Acreditación en CZ</option>
                        <option value="Responsable de Acreditación en Inst Estatal / UO">Responsable de Acreditación en Inst Estatal / UO</option>
                        <option value="Responsable de Planeación en CZ">Responsable de Planeación en CZ</option>
                        <option value="Responsable de Planeación en Inst Estatal / UO">Responsable de Planeación en Inst Estatal / UO</option>
                        <option value="Personal en Oficinas Centrales">Personal en Oficinas Centrales</option>
                        <option value="SASA-02">SASA-02</option>
                        <option value="Responsable de Servicios Educativos en Inst Estatal / UO">Responsable de Servicios Educativos en Inst Estatal / UO</option>
                        <option value="Otro">Otro</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="fecha_registro">Fecha de Registro:</label>
                    <input type="date" id="fecha_registro" name="fecha_registro" required>
                    <span class="tooltip">Formato: DD/MM/AAAA</span>
                </div>

                <div class="input_grupo">
                    <label for="alianza">Alianza o convenio:</label>
                    <input type="text" id="alianza" name="alianza" placeholder="Ej. Alianza con XYZ">
                    <span class="tooltip">Ingresa el nombre de la alianza o convenio (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="subproyecto">Subproyecto:</label>
                    <input type="text" id="subproyecto" name="subproyecto" placeholder="Ej. Subproyecto ABC">
                    <span class="tooltip">Ingresa el nombre del subproyecto (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="tipo_vinculacion">Tipo de vinculación:</label>
                    <input type="text" id="tipo_vinculacion" name="tipo_vinculacion" placeholder="Ej. Vinculación directa">
                    <span class="tooltip">Ingresa el tipo de vinculación (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="dependencia">Dependencia:</label>
                    <input type="text" id="dependencia" name="dependencia" placeholder="Dependencia ... ">
                    <span class="tooltip">Ingresa el tipo de dependencia (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="tipo_participante">Tipo de Educador:</label>
                    <select id="tipo_participante" name="tipo_participante" class="styled-select" required>
                        <option value="" disabled selected>Seleccione</option>
                        <option value="Estudiante Universitario">Estudiante Universitario</option>
                        <option value="Docente">Docente</option>
                        <option value="Externo">Externo</option>
                        <option value="Directivo">Directivo</option>
                        <option value="Administrativo">Administrativo</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="modalidad">Modalidad:</label>
                    <select id="modalidad" name="modalidad" required>
                        <option value="" selected>Selecciona</option>
                        <option value="AlfabetizaTEC">Construyendo tu Servicio Social en AlfabetizaTEC</option>
                        <option value="Servicio Social Comunitario">Servicio Social Comunitario</option>
                        <option value="Créditos Complementarios">Créditos Complementarios</option>
                        <option value="Constancia de Valor Curricular">Constancia de Valor Curricular</option>
                        <option value="Diploma de Participación Honorífica">Diploma de Participación Honorífica</option>
                    </select>
                </div>

                <div class="input_grupo" id="grupo_numero_control" style="display:none;">
                    <label for="numero_control">Número de Control:</label>
                    <input type="number" id="numero_control" name="numero_control" placeholder="Ej. 123456">
                    <span class="tooltip">Ingresa el número de control (opcional).</span>
                </div>

                <div class="input_grupo" id="grupo_carrera" style="display:none;">
                    <label for="carrera">Carrera:</label>
                    <input type="text" id="carrera" name="carrera" placeholder="Ej. Ingeniería en Sistemas">
                    <span class="tooltip">Ingresa la carrera (opcional).</span>
                </div>

                <div class="input_grupo" id="grupo_semestre" style="display:none;">
                    <label for="semestre">Semestre:</label>
                    <input type="number" id="semestre" name="semestre" placeholder="Ej. 6">
                    <span class="tooltip">Ingresa la semestre (opcional).</span>
                </div>

                <input type="hidden" value="4" id="rol_id" name="rol_id" required>
                <input type="hidden" id="id_tec" name="id_tecnologico" value="<?php echo isset($_SESSION['id_tecnologico']) ? $_SESSION['id_tecnologico'] : ''; ?>">

                <button class="submit_principal" type="submit">Enviar</button>
            </form>


        </div>
    </div>

    <!-- Modal Estudiante -->
    <div id="modal_estudiante" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Formulario de Registro - Estudiante</h2>
            <form id="registrationFormEstudiante" class="formulario_registro">
                <h5>Datos generales:</h5>
                <!-- Datos Generales -->
                <div class="input_grupo">
                    <label for="nombres">Nombre(s):</label>
                    <input type="text" name="nombres" required maxlength="100">
                    <span class="tooltip">Ingresa el(s) nombre(s) sin apellidos.</span>
                </div>
                <div class="input_grupo">
                    <label for="primer_apellido">Primer Apellido:</label>
                    <input type="text" name="primer_apellido" required maxlength="100">
                    <span class="tooltip">Ingresa el primer apellido.</span>
                </div>
                <div class="input_grupo">
                    <label for="segundo_apellido">Segundo Apellido:</label>
                    <input type="text" name="segundo_apellido" maxlength="100" required>
                    <span class="tooltip">Ingresa el segundo apellido (opcional).</span>
                </div>

                <div class="input_grupo">
                    <label for="curp">CURP:</label>
                    <input type="text" name="curp" required maxlength="18" pattern="[A-Z0-9]{18}">
                    <span class="tooltip">Ingresa el CURP (18 caracteres alfanuméricos).</span>
                </div>

                <!-- Información Personal -->
                <div class="input_grupo">
                    <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                    <input type="date" name="fecha_nacimiento" required>
                    <span class="tooltip">Formato: DD/MM/AAAA.</span>
                </div>
                <div class="input_grupo">
                    <label>Sexo:</label>
                    <select name="sexo" required>
                        <option value="">Seleccionar</option>
                        <option value="mujer">Mujer</option>
                        <option value="hombre">Hombre</option>
                        <option value="no_binario">No binario</option>
                    </select>
                    <span class="tooltip">Selecciona el sexo.</span>
                </div>
                <div class="input_grupo">
                    <label for="nacionalidad">Nacionalidad:</label>
                    <select name="nacionalidad" id="nacionalidad" required>
                        <option value="" disabled selected>Seleccione una opción</option>
                        <option value="mexicana">Mexicana</option>
                        <option value="extranjera">Extranjera</option>
                    </select>
                    <span class="tooltip">Selecciona la nacionalidad.</span>
                </div>

                <div class="input_grupo">
                    <label for="entidad_nacimiento">Entidad de Nacimiento:</label>
                    <select name="entidad_nacimiento" id="entidad_nacimiento" required>
                        <option value="" disabled selected>Seleccione una opción</option>
                        <option value="Aguascalientes">Aguascalientes</option>
                        <option value="Baja California">Baja California</option>
                        <option value="Baja California Sur">Baja California Sur</option>
                        <option value="Campeche">Campeche</option>
                        <option value="Chiapas">Chiapas</option>
                        <option value="Chihuahua">Chihuahua</option>
                        <option value="Ciudad de México">Ciudad de México</option>
                        <option value="Coahuila">Coahuila</option>
                        <option value="Colima">Colima</option>
                        <option value="Durango">Durango</option>
                        <option value="Estado de México">Estado de México</option>
                        <option value="Guanajuato">Guanajuato</option>
                        <option value="Guerrero">Guerrero</option>
                        <option value="Hidalgo">Hidalgo</option>
                        <option value="Jalisco">Jalisco</option>
                        <option value="Michoacán">Michoacán</option>
                        <option value="Morelos">Morelos</option>
                        <option value="Nayarit">Nayarit</option>
                        <option value="Nuevo León">Nuevo León</option>
                        <option value="Oaxaca">Oaxaca</option>
                        <option value="Puebla">Puebla</option>
                        <option value="Querétaro">Querétaro</option>
                        <option value="Quintana Roo">Quintana Roo</option>
                        <option value="San Luis Potosí">San Luis Potosí</option>
                        <option value="Sinaloa">Sinaloa</option>
                        <option value="Sonora">Sonora</option>
                        <option value="Tabasco">Tabasco</option>
                        <option value="Tamaulipas">Tamaulipas</option>
                        <option value="Tlaxcala">Tlaxcala</option>
                        <option value="Veracruz">Veracruz</option>
                        <option value="Yucatán">Yucatán</option>
                        <option value="Zacatecas">Zacatecas</option>
                    </select>
                    <span class="tooltip">Selecciona la entidad de nacimiento.</span>
                </div>

                <h5> Estado Civil:</h5>
                <!-- Estado Civil -->
                <div class="input_grupo">
                    <label>Estado Civil:</label>
                    <select name="estado_civil" required>
                        <option value="">Seleccionar</option>
                        <option value="soltero">Soltero</option>
                        <option value="casado">Casado</option>
                        <option value="union_libre">Unión Libre</option>
                        <option value="separado">Separado</option>
                        <option value="divorciado">Divorciado</option>
                        <option value="viudo">Viudo</option>
                    </select>
                    <span class="tooltip">Selecciona el estado civil.</span>
                </div>
                <div class="input_grupo">
                    <label for="num_hijos">Número de Hijos:</label>
                    <input type="number" name="num_hijos" min="0" max="20" required>
                    <span class="tooltip">Ingresa el número de hijos (0 si no tienes).</span>
                </div>

                <!-- Domicilio Detallado -->
                <h5>Domicilio:</h5>
                <div class="input_grupo">
                    <label for="vialidad_tipo">Tipo de Vialidad:</label>
                    <select name="vialidad_tipo" required>
                        <option value="">Seleccionar</option>
                        <option value="calle">Calle</option>
                        <option value="avenida">Avenida</option>
                        <option value="boulevard">Boulevard</option>
                        <option value="privada">Privada</option>
                        <option value="otro">Otro</option>
                    </select>
                    <span class="tooltip">Selecciona el tipo de vialidad.</span>
                </div>
                <div class="input_grupo">
                    <label for="vialidad_nombre">Nombre de Vialidad:</label>
                    <input type="text" name="vialidad_nombre" required>
                    <span class="tooltip">Ingresa el nombre de la vialidad.</span>
                </div>
                <div class="input_grupo">
                    <label for="num_exterior">Número Exterior:</label>
                    <input type="text" name="num_exterior" required>
                    <span class="tooltip">Ingresa el número exterior.</span>
                </div>
                <div class="input_grupo">
                    <label for="num_interior">Número Interior:</label>
                    <input type="text" name="num_interior">
                    <span class="tooltip">Ingresa el número interior (opcional).</span>
                </div>
                <div class="input_grupo">
                    <label for="codigo_postal">Código Postal:</label>
                    <input type="text" name="codigo_postal" pattern="[0-9]{5}" required>
                    <span class="tooltip">Ingresa el código postal (5 dígitos).</span>
                </div>

                <!-- Colonia -->
                <div class="input_grupo">
                    <label>Colonia</label>
                    <input type="text" name="colonia" placeholder="Especifica la colonia" required>
                    <span class="tooltip">Ingresa el nombre de la colonia.</span>
                </div>

                <!-- Municipio -->
                <div class="input_grupo">
                    <label>Municipio</label>
                    <input type="text" name="municipio" placeholder="Especifica el municipio" required>
                    <span class="tooltip">Ingresa el nombre de el municipio.</span>
                </div>

                <!-- Entidad Federativa -->
                <div class="input_grupo">
                    <label>Entidad Federativa</label>
                    <select name="entidad_federativa" id="entidad_federativa" required>
                        <option value="" disabled selected>Seleccione una opción</option>
                        <option value="Aguascalientes">Aguascalientes</option>
                        <option value="Baja California">Baja California</option>
                        <option value="Baja California Sur">Baja California Sur</option>
                        <option value="Campeche">Campeche</option>
                        <option value="Chiapas">Chiapas</option>
                        <option value="Chihuahua">Chihuahua</option>
                        <option value="Ciudad de México">Ciudad de México</option>
                        <option value="Coahuila">Coahuila</option>
                        <option value="Colima">Colima</option>
                        <option value="Durango">Durango</option>
                        <option value="Estado de México">Estado de México</option>
                        <option value="Guanajuato">Guanajuato</option>
                        <option value="Guerrero">Guerrero</option>
                        <option value="Hidalgo">Hidalgo</option>
                        <option value="Jalisco">Jalisco</option>
                        <option value="Michoacán">Michoacán</option>
                        <option value="Morelos">Morelos</option>
                        <option value="Nayarit">Nayarit</option>
                        <option value="Nuevo León">Nuevo León</option>
                        <option value="Oaxaca">Oaxaca</option>
                        <option value="Puebla">Puebla</option>
                        <option value="Querétaro">Querétaro</option>
                        <option value="Quintana Roo">Quintana Roo</option>
                        <option value="San Luis Potosí">San Luis Potosí</option>
                        <option value="Sinaloa">Sinaloa</option>
                        <option value="Sonora">Sonora</option>
                        <option value="Tabasco">Tabasco</option>
                        <option value="Tamaulipas">Tamaulipas</option>
                        <option value="Tlaxcala">Tlaxcala</option>
                        <option value="Veracruz">Veracruz</option>
                        <option value="Yucatán">Yucatán</option>
                        <option value="Zacatecas">Zacatecas</option>
                    </select>
                    <span class="tooltip">Selecciona la entidad federativa.</span>
                </div>

                <!-- Tiene equipo de cómputo -->
                <div class="input_grupo">
                    <label>¿Tiene equipo de cómputo?</label>
                    <select name="tiene_equipo_computo" id="tiene_equipo_computo" required>
                        <option value="no">No</option>
                        <option value="si">Sí</option>
                    </select>
                    <span class="tooltip">Selecciona si tienes equipo de cómputo.</span>
                </div>

                <!-- Tiene acceso a Internet -->
                <div class="input_grupo">
                    <label>¿Tiene acceso a Internet?</label>
                    <select name="tiene_acceso_internet" id="tiene_acceso_internet" required>
                        <option value="no">No</option>
                        <option value="si">Sí</option>
                    </select>
                    <span class="tooltip">Selecciona si tienes acceso a Internet.</span>
                </div>

                <!-- Contacto -->
                <div class="input_grupo">
                    <label for="telefono_fijo">Teléfono Fijo:</label>
                    <input type="tel" name="telefono_fijo" pattern="[0-9]{10}" maxlength="10">
                    <span class="tooltip">Ingresa el teléfono fijo (10 dígitos, opcional).</span>
                </div>
                <div class="input_grupo">
                    <label for="telefono_celular">Teléfono Celular:</label>
                    <input type="tel" name="telefono_celular" pattern="[0-9]{10}" maxlength="10" required>
                    <span class="tooltip">Ingresa el teléfono celular (10 dígitos).</span>
                </div>
                <div class="input_grupo">
                    <label for="correo_personal">Correo Electrónico Personal:</label>
                    <input type="email" name="correo_personal">
                    <span class="tooltip">Ingresa el correo electrónico personal (opcional).</span>
                </div>

                <!-- Idioma -->
                <div class="input_grupo">
                    <label>Habla Lengua Indígena:</label>
                    <select name="habla_lengua_indigena" id="habla_lengua_indigena" required>
                        <option value="no">No</option>
                        <option value="si">Sí</option>
                    </select>
                    <span class="tooltip">Selecciona si hablas una lengua indígena.</span>
                </div>

                <div class="input_grupo" id="lengua_indigena_input" style="display: none;">
                    <label>¿Cuál?</label>
                    <input type="text" name="lengua_indigena" placeholder="Especifica la lengua indígena">
                    <span class="tooltip">Especifica la lengua indígena que hablas.</span>
                </div>

                <div class="input_grupo">
                    <label>¿Habla algún idioma además del Español?</label>
                    <select name="habla_otro_idioma" id="habla_otro_idioma" required>
                        <option value="no">No</option>
                        <option value="si">Sí</option>
                    </select>
                    <span class="tooltip">Selecciona si hablas otro idioma además del español.</span>
                </div>

                <div class="input_grupo" id="otro_idioma_input" style="display: none;">
                    <label>¿Cuál?</label>
                    <input type="text" name="otro_idioma" placeholder="Especifica el idioma">
                    <span class="tooltip">Especifica el idioma que hablas.</span>
                </div>

                <div class="input_grupo">
                    <label>De acuerdo con su cultura, ¿usted se considera indígena?</label>
                    <select name="se_considera_indigena" id="se_considera_indigena" required>
                        <option value="no">No</option>
                        <option value="si">Sí</option>
                    </select>
                    <span class="tooltip">Selecciona si te consideras indígena.</span>
                </div>

                <div class="input_grupo">
                    <label>¿Usted se considera afromexicano(a), negro(a) o afrodescendiente?</label>
                    <select name="se_considera_afromexicano" id="se_considera_afromexicano" required>
                        <option value="no">No</option>
                        <option value="si">Sí</option>
                    </select>
                    <span class="tooltip">Selecciona si te consideras afromexicano, negro o afrodescendiente.</span>
                </div>

                <script>
                    // Mostrar u ocultar campo para otro idioma
                    document.getElementById('habla_otro_idioma').addEventListener('change', function() {
                        var otroIdiomaInput = document.getElementById('otro_idioma_input');
                        if (this.value === 'si') {
                            otroIdiomaInput.style.display = 'block';
                        } else {
                            otroIdiomaInput.style.display = 'none';
                        }
                    });

                    document.getElementById('habla_lengua_indigena').addEventListener('change', function() {
                        var lenguaIndigenaInput = document.getElementById('lengua_indigena_input');
                        if (this.value === 'si') {
                            lenguaIndigenaInput.style.display = 'block';
                        } else {
                            lenguaIndigenaInput.style.display = 'none';
                        }
                    });
                </script>

                <!-- Ocupación -->
                <div class="input_grupo">
                    <label>Situación Laboral:</label>
                    <select name="situacion_laboral" required>
                        <option value="">Seleccionar</option>
                        <option value="trabajando">Trabajando</option>
                        <option value="jubilado">Jubilado/Pensionado</option>
                        <option value="desempleado">Desempleado</option>
                        <option value="estudiante">Estudiante</option>
                        <option value="hogar">Quehaceres del Hogar</option>
                    </select>
                </div>

                <!-- Discapacidad -->
                <div class="input_grupo">
                    <label>¿Tiene alguna discapacidad?</label>
                    <select name="discapacidad" multiple required>
                        <option value="ninguna">Ninguna</option>
                        <option value="fisica">Física o Motriz</option>
                        <option value="visual">Visual</option>
                        <option value="auditiva">Auditiva</option>
                        <option value="intelectual">Intelectual</option>
                        <option value="psicosocial">Psicosocial</option>
                    </select>
                </div>

                <!-- Nivel Educativo -->
                <div class="input_grupo">
                    <label>Nivel Educativo:</label>
                    <select name="nivel_educativo" required>
                        <option value="">Seleccionar</option>
                        <option value="sin_estudios">Sin Estudios</option>
                        <option value="primaria_incompleta">Primaria Incompleta</option>
                        <option value="primaria_completa">Primaria Completa</option>
                        <option value="secundaria_incompleta">Secundaria Incompleta</option>
                        <option value="secundaria_completa">Secundaria Completa</option>
                    </select>
                </div>

                <!-- Proceso o nivel al que ingresa -->
                <div class="input_grupo">
                    <label>Proceso o nivel al que ingresa:</label>
                    <select name="proceso_nivel_ingresa" id="proceso_nivel_ingresa" required>
                        <option value="alfabetizacion">Alfabetización</option>
                        <option value="primaria">Primaria</option>
                        <option value="secundaria">Secundaria</option>
                        <option value="alfabetizacion_indigena_bilingue">Alfabetización indígena bilingüe</option>
                        <option value="etnia_lengua">Etnia/Lengua</option>
                    </select>
                </div>

                <!-- Servicio educativo seleccionado -->
                <div class="input_grupo">
                    <label>Servicio educativo seleccionado:</label>
                    <select name="servicio_educativo" id="servicio_educativo" required>
                        <option value="examen_diagnostico">Examen diagnóstico</option>
                        <option value="reconocimiento_saberes">Reconocimiento de saberes</option>
                        <option value="atencion_educativa">Atención educativa</option>
                    </select>
                </div>


                <!-- Motivación para Estudiar -->
                <div class="input_grupo">
                    <label>Motivación para Estudiar:</label>
                    <select name="motivacion" multiple required>
                        <option value="certificado">Obtener Certificado</option>
                        <option value="educacion">Continuar Educación</option>
                        <option value="empleo">Mejorar Oportunidades de Empleo</option>
                        <option value="laborales">Mejorar Condiciones Laborales</option>
                        <option value="hijos">Ayudar a Hijos/Nietos con Tareas</option>
                    </select>
                </div>

                <div class="input_grupo">
                    <label for="programa_estudiante">Programa:</label>
                    <select id="programa_estudiante" name="programa_estudiante" required>
                        <option value="">Selecciona un programa</option> <!-- Opción por defecto -->
                    </select>
                    <span class="tooltip">⚠️ Recuerda que debes registrar primero los programas:</span>
                </div>

                <button class="btn_submit" type="submit">Registrar</button>
            </form>
        </div>
    </div>

    <script src="../assets/js/sweetalert.js"></script>
    <script src="../assets/js/jquery.js"></script>
    <script src="api/auth/login.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <script src="./utilidades/coordinador_programa.js"></script>




</body>

</html>