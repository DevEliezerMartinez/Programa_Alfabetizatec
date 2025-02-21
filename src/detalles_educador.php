<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del educador</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/vista_programa.css">
    <link rel="stylesheet" href="../assets/css/layout/header.css">
    <link rel="stylesheet" href="../assets/css/detallesEducador.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert ya importado -->

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
            <li><a href="./coordinador_programa.php">Inicio</a></li>
            <li><a href="#">Detalles del educador:</a></li>
        </ul>



        <div id="detallesPrograma">
            <h1>
                Detalles del Educador 📚
            </h1>

            <!-- Botón para editar educador -->
            <button class="btn" id="editarEducadorBtn">Editar educador</button>

        </div>


    </main>



    <!-- Modal de edición -->
    <div class="modal" id="editarEducadorModal">
        <div class="modal-content">
            <div class="modal-header">
                <span class="close" id="closeModal">&times;</span>
            </div>
            <div class="modal-body">
                <!-- Formulario para editar los datos del educador -->
                <form id="editarEducadorForm">
                    <div class="form-group">
                        <label for="nombreEducador">Nombre</label>
                        <input type="text" class="form-control" id="nombreEducador" name="nombre" placeholder="Nombre del educador">
                        <input type="hidden" class="form-control" id="idEducador" name="idEducador" placeholder="idEducador">
                    </div>
                    <div class="form-group">
                        <label for="apellidoEducador">Apellido</label>
                        <input type="text" class="form-control" id="apellidoEducador" name="apellido" placeholder="Apellido del educador">
                    </div>
                    <div class="form-group">
                        <label for="curpEducador">CURP</label>
                        <input type="text" class="form-control" id="curpEducador" name="curp" placeholder="CURP del educador">
                    </div>
                    <div class="form-group">
                        <label for="telefonoEducador">Teléfono</label>
                        <input type="text" class="form-control" id="telefonoEducador" name="telefono" placeholder="Teléfono del educador">
                    </div>
                    <div class="form-group">
                        <label for="correoEducador">Correo</label>
                        <input type="email" class="form-control" id="correoEducador" name="correo" placeholder="Correo del educador">
                    </div>
                    <div class="form-group">
                        <label for="alianza">Alianza o convenio:</label>
                        <input type="text" id="alianza" name="alianza" placeholder="Ej. Alianza con XYZ">
                        <span class="tooltip">Ingresa el nombre de la alianza o convenio (opcional).</span>
                    </div>

                    <div class="form-group">
                        <label for="subproyecto">Subproyecto:</label>
                        <input type="text" id="subproyecto" name="subproyecto" placeholder="Ej. Subproyecto ABC">
                        <span class="tooltip">Ingresa el nombre del subproyecto (opcional).</span>
                    </div>

                    <div class="form-group">
                        <label for="tipo_vinculacion">Tipo de vinculación:</label>
                        <input type="text" id="tipo_vinculacion" name="tipo_vinculacion" placeholder="Ej. Vinculación directa">
                        <span class="tooltip">Ingresa el tipo de vinculación (opcional).</span>
                    </div>

                    <div class="form-group">
                        <label for="dependencia">Dependencia:</label>
                        <input type="text" id="dependencia" name="dependencia" placeholder="Dependencia ... ">
                        <span class="tooltip">Ingresa el tipo de dependencia (opcional).</span>
                    </div>
                    <button type="submit" class="btn btn-primary">Guardar cambios</button>
                </form>
            </div>
        </div>
    </div>



    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Obtener el id del coordinador desde la URL
        const urlParams = new URLSearchParams(window.location.search);
        const idCooordinador = urlParams.get('id');

        // Función para formatear las fechas
        function formatDate(dateString) {
            const date = new Date(dateString);
            const day = date.getDate().toString().padStart(2, '0');
            const month = (date.getMonth() + 1).toString().padStart(2, '0');
            const year = date.getFullYear();
            return `${day}/${month}/${year}`;
        }

        if (idCooordinador) {
            $.ajax({
                url: `./api/coordinador_gral/obtenerDetallesEducador.php?id=${idCooordinador}`,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    if (data.success) {

                        // Rellenar el formulario con los datos del educador
                        $('#idEducador').val(data.educador_datos.id);
                        $('#nombreEducador').val(data.educador_datos.nombre);
                        $('#apellidoEducador').val(data.educador_datos.apellido);
                        $('#curpEducador').val(data.educador_datos.curp);
                        $('#telefonoEducador').val(data.educador_datos.telefono);
                        $('#correoEducador').val(data.educador_datos.correo);
                        $('#alianza').val(data.educador_datos.alianza);
                        $('#subproyecto').val(data.educador_datos.subproyecto);
                        $('#tipo_vinculacion').val(data.educador_datos.tipo_vinculacion);
                        $('#dependencia').val(data.educador_datos.dependencia);


                        // Mostrar el nombre del educador
                        let nombreEducador = data.educador || "Desconocido";
                        $('#detallesPrograma').append(`<h3>Educador: <span class="nombre">${nombreEducador}</span></h3>`);

                        // Mostrar información del educador
                        $('#detallesPrograma').append(`
    <div class="programa-cantidad">
        <p>Este educador tiene <span>${data.programas.length}</span> programas disponibles para los estudiantes.</p>
    </div>
`);

                        // Mostrar los cursos y estudiantes
                        if (data.programas.length > 0) {
                            data.programas.forEach(programa => {

                                // Crear una tarjeta para el programa
                                let programaCard = `
            <div class="card mb-3">
                <div class="card-body">
                    <h3 class="programa_titulo"> ➡️ ${programa.nivel} - ${programa.inicio_periodo} - ${programa.fin_periodo} </h3>
        `;

                                if (programa.estudiantes.length > 0) {
                                    // Si hay estudiantes, mostrar tabla
                                    let tableContent = `
                <table id="estudiantesTable_${programa.id}" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>CURP</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                        </tr>
                    </thead>
                    <tbody>
            `;

                                    programa.estudiantes.forEach(estudiante => {
                                        tableContent += `
                    <tr>
                        <td>${estudiante.nombre}</td>
                        <td>${estudiante.apellidos}</td>
                        <td>${estudiante.curp}</td>
                        <td>${estudiante.telefono}</td>
                        <td>${estudiante.correo || "N/A"}</td>
                    </tr>
                `;
                                    });

                                    tableContent += '</tbody></table>';
                                    programaCard += tableContent;

                                    let tooltip = `
                <span class="tooltip"> Recuerda que para editar información de un estudiante debes acceder a los detalles del programa, no del educador. </span>
            `;
                                    programaCard += tooltip;
                                    // Inicializar DataTable
                                    $(`#estudiantesTable_${programa.id}`).DataTable();


                                } else {
                                    // Si no hay estudiantes, mostrar mensaje
                                    programaCard += `<p>Sin estudiantes registrados en este curso.</p>`;
                                }

                                // Cerrar la tarjeta del programa
                                programaCard += `</div></div>`;
                                $('#detallesPrograma').append(programaCard);

                            });
                        } else {
                            $('#detallesPrograma').append('<p>No hay programas registrados para este educador.</p>');
                        }

                    } else {
                        alert(data.message || 'Hubo un error al obtener los detalles del educador.');
                    }

                },
                error: function(error) {
                    console.log('Error al obtener los detalles:', error);
                }
            });
        }
    </script>

    <script>
        // Función para obtener el ID del educador de la URL

        // Mostrar el modal y cargar los datos del educador
        document.getElementById('editarEducadorBtn').addEventListener('click', function() {
            // Mostrar el modal
            document.getElementById('editarEducadorModal').style.display = 'block';
        });

        // Cerrar el modal
        document.getElementById('closeModal').addEventListener('click', function() {
            document.getElementById('editarEducadorModal').style.display = 'none';
        });

        // Manejar el envío del formulario para actualizar los datos
        document.getElementById('editarEducadorForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevenir el envío por defecto del formulario

            // Obtener los datos del formulario
            const formData = {
                nombre: document.getElementById('nombreEducador').value,
                apellido: document.getElementById('apellidoEducador').value,
                curp: document.getElementById('curpEducador').value,
                telefono: document.getElementById('telefonoEducador').value,
                correo: document.getElementById('correoEducador').value,
                alianza: document.getElementById('alianza').value,
                subproyecto: document.getElementById('subproyecto').value,
                tipo_vinculacion: document.getElementById('tipo_vinculacion').value,
                dependencia: document.getElementById('dependencia').value
            };
            const idUsuario_educador = document.getElementById('idEducador').value;

            // Hacer la llamada AJAX para actualizar los datos en el servidor
            fetch(`./api/actualizar_educadores.php?id=${idUsuario_educador}`, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify(formData)
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Usar SweetAlert para el éxito
                        Swal.fire({
                            icon: 'success',
                            title: 'Educador actualizado correctamente',
                            showConfirmButton: false,
                            timer: 1500
                        });
                        document.getElementById('editarEducadorModal').style.display = 'none';
                        // Agregar un delay de 3 segundos antes de recargar
                        setTimeout(() => {
                            window.location.reload();
                        }, 1200);
                    } else {
                        // Usar SweetAlert para el error
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: data.message || 'Hubo un error al actualizar los datos del educador.',
                            showConfirmButton: true
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    // Usar SweetAlert para problemas de conexión
                    Swal.fire({
                        icon: 'error',
                        title: 'Error de conexión',
                        text: 'Hubo un problema al conectarse con el servidor.',
                        showConfirmButton: true
                    });
                });
        });
    </script>

</body>