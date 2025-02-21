<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regiones alfabetizatec</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/usuarios.css">
    <link rel="stylesheet" href="../assets/css/layout/header.css">

    <!-- DataTable CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">

    <!-- SweetAlert CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.16/dist/sweetalert2.min.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTable JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <!-- SweetAlert JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.16/dist/sweetalert2.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

</head>

<body>

    <?php
    // <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert ya importado -->
    session_start();
    include('./api/auth/validate.php');
    ?>

    <?php include('./layout/header.php') ?>
    </header>
    <main>
        <ul class="breadcrumb">
            <li><a href="./coordinador_nacional.php">Inicio</a></li>
            <li><a href="#">Gestion de usuarios:</a></li>
        </ul>

        <div class="central">
            <h2>Mostrando coordinadores:</h2>

            <button class="addUser" onclick="toggleModal()">
                <i class="fas fa-user-plus"></i> Agregar coordinador
            </button>

            <!-- DataTable container -->
            <table id="coordinadoresTable" class="display">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Región/Tecnológico</th>
                        <th>Acciones</th> <!-- Columna para el ícono de borrar -->
                    </tr>
                </thead>
                <tbody>
                    <!-- Los datos se cargarán aquí con AJAX -->
                </tbody>
            </table>

        </div>


    </main>





    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="toggleModal()">&times;</span>
            <h2>Agregar Coordinador</h2>
            <form id="addCoordinatorForm">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" placeholder="Escribe el nombre" required>

                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" placeholder="Escribe el apellido" required>

                <label for="curp">CURP:</label>
                <input type="text" id="curp" name="curp" placeholder="Escribe el CURP (opcional)">

                <label for="telefono">Teléfono:</label>
                <input type="number" id="telefono" name="telefono" placeholder="Escribe el teléfono" required>

                <label for="correo">Correo:</label>
                <input type="email" id="correo" name="correo" placeholder="Escribe el correo" required>

                <label for="correo_inst">Correo institucional:</label>
                <input type="email" id="correo_inst" name="correo_inst" placeholder="Escribe el correo institucional (opcional)">

                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" placeholder="Escribe la contraseña" required>

                <input type="hidden" id="rol_id" name="rol_id" value="2">

                <label for="puesto">Puesto:</label>
                <input type="text" id="puesto" name="puesto" placeholder="Escribe el puesto (opcional)">

                <label for="fecha_nacimiento">Fecha de nacimiento:</label>
                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>

                <label for="region">Región:</label>
                <select id="region" name="region" required>
                    <option value="1">Occidente</option>
                    <option value="2">Noreste</option>
                    <option value="3">Bajío</option>
                    <option value="4">Centro</option>
                    <option value="5">Sureste</option>
                </select>

                <!-- Agregar un nuevo select para el tecnológico -->
                <label for="tecnologico" id="tecnologicoLabel" style="display:none;">Tecnológico:</label>
                <select id="tecnologico" name="tecnologico" style="display:none;">
                    <!-- Tecnológicos cargados dinámicamente aquí -->
                </select>

                <br><br>

                <button type="submit" class="submit">Guardar</button>
            </form>
        </div>
    </div>




    <script>
        // Función para alternar la visibilidad del modal
        function toggleModal() {
            const modal = document.getElementById("modal");
            modal.style.display = modal.style.display === "block" ? "none" : "block";
        }

        // Cerrar modal si se hace clic fuera de él
        window.onclick = function(event) {
            const modal = document.getElementById("modal");
            if (event.target === modal) {
                modal.style.display = "none";
            }
        };

        // Manejar el envío del formulario
        $(document).ready(function() {
            // Capturar el evento de envío del formulario
            $("#addCoordinatorForm").on("submit", function(event) {
                event.preventDefault(); // Evitar el envío tradicional del formulario

                // Capturar los datos del formulario
                const formData = {
                    nombre: $("#nombre").val(),
                    apellido: $("#apellido").val(),
                    curp: $("#curp").val(),
                    telefono: $("#telefono").val(),
                    correo: $("#correo").val(),
                    correo_inst: $("#correo_inst").val(),
                    contrasena: $("#contrasena").val(),
                    rol_id: $("#rol_id").val(),
                    puesto: $("#puesto").val(),
                    fecha_nacimiento: $("#fecha_nacimiento").val(),
                    id_region: tipo === 'regional' ? $("#region").val() : null, // Enviar región solo si es 'regional'
                    id_tecnologico: tipo === 'programa' ? $("#tecnologico").val() : null, // Enviar tecnológico solo si es 'programa'
                };

                // Enviar los datos al endpoint
                $.ajax({
                    url: "./api/addRegional.php", // Cambia esto por tu endpoint real
                    method: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(formData),
                    success: function(response) {
                        console.log(response); // Verifica la respuesta
                        if (response.success) {
                            Swal.fire({
                                icon: "success",
                                title: "Agregado correctamente",
                                text: "El coordinador fue registrado con éxito.",
                                timer: 3000,
                                showConfirmButton: false,
                            });
                            toggleModal(); // Cerrar el modal
                            $("#addCoordinatorForm")[0].reset(); // Reiniciar el formulario
                            table.ajax.reload(); // Recargar la tabla después de agregar el coordinador
                        } else {
                            Swal.fire({
                                icon: "error",
                                title: "Error",
                                text: response.message || "Hubo un problema al agregar el coordinador.",
                            });
                        }
                    },
                    error: function(xhr) {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: xhr.responseJSON?.message || "Ocurrió un error en el servidor.",
                        });
                    },
                });
            });

            // Obtener el parámetro tipo de la URL (regional o programa)
            const urlParams = new URLSearchParams(window.location.search);
            const tipo = urlParams.get('tipo'); // Esto recuperará el parámetro 'tipo' de la URL

            // Verificar que el tipo sea válido
            if (tipo !== 'regional' && tipo !== 'programa') {
                alert('Tipo no válido en la URL. Debe ser "regional" o "programa".');
                return;
            }

            // Mostrar u ocultar los campos según el tipo
            if (tipo === 'programa') {
                $('#region').hide(); // Ocultar región
                $('#tecnologico').show(); // Mostrar tecnológico
                $('#tecnologicoLabel').show(); // Mostrar la etiqueta de tecnológico

                // Cargar los tecnológicos dinámicamente
                $.ajax({
                    url: './api/getTecnologicos.php', // Asegúrate de tener un endpoint que devuelva los tecnológicos
                    method: 'GET',
                    success: function(response) {
                        const tecnologicos = response.data; // Suponiendo que la respuesta tiene los datos en 'data'
                        let options = '';
                        tecnologicos.forEach(tecnologico => {
                            options += `<option value="${tecnologico.id}">${tecnologico.nombre}</option>`;
                        });
                        $('#tecnologico').html(options); // Cargar las opciones en el select
                    },
                    error: function() {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'No se pudieron cargar los tecnológicos.',
                        });
                    }
                });
            } else {
                $('#region').show(); // Mostrar región
                $('#tecnologico').hide(); // Ocultar tecnológico
                $('#tecnologicoLabel').hide(); // Ocultar la etiqueta de tecnológico
            }

            // Configurar el URL del API dependiendo del tipo
            const apiUrl = `./api/getUsuarios.php?tipo=${tipo}`;

            // Inicializar DataTable
            const table = $('#coordinadoresTable').DataTable({

                "ajax": {
                    "url": apiUrl,
                    "dataSrc": "data", // La respuesta del API tiene los datos en "data"
                    "data": function(d) {
                        // Se pueden agregar parámetros adicionales si es necesario
                        return d;
                    }
                },
                "columns": [{
                        "data": "id"
                    },
                    {
                        "data": "nombre"
                    },
                    {
                        "data": "apellido"
                    },
                    {
                        "data": "correo"
                    },
                    {
                        "data": "telefono"
                    },
                    {
                        "data": "region",
                        "render": function(data, type, row) {
                            // Verificar si la columna 'region' tiene valor
                            return data ? data : row.tecnologico; // Si no tiene valor 'region', mostrar 'tecnologico'
                        }
                    }, // Para tipo regional, usa la columna 'region', para 'programa' usa 'tecnologico'
                    {
                        "data": "id", // ID para la columna de acciones
                        "render": function(data, type, row) {
                            return `
                            <button class="delete-btn" data-id="${data}" style="background: none; border: none; color: red; cursor: pointer;">
                                <i class="fa fa-trash" aria-hidden="true"></i> Borrar
                            </button>
                        `;
                        }
                    }
                ]
            });

            // Manejar la acción de borrar
            $('#coordinadoresTable').on('click', '.delete-btn', function() {
                const coordinadorId = $(this).data('id');

                // Mostrar el SweetAlert de confirmación
                Swal.fire({
                    title: '¿Estás seguro?',
                    text: "Esta acción no se puede deshacer.",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, eliminar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Si el usuario confirma, eliminar el coordinador
                        $.ajax({
                            url: `./api/deleteCoordinador.php`, // Reemplaza con tu endpoint para borrar
                            method: 'POST',
                            data: {
                                id: coordinadorId,
                                tipo: tipo
                            },
                            success: function(response) {
                                console.log(response); // Verifica la respuesta recibida

                                Swal.fire(
                                    'Eliminado!',
                                    response.message || 'El coordinador ha sido eliminado.',
                                    'success'
                                );
                                table.ajax.reload(); // Recargar la DataTable

                            },
                            error: function() {
                                Swal.fire(
                                    'Error!',
                                    'Hubo un problema con la solicitud.',
                                    'error'
                                );
                            }
                        });
                    }
                });
            });
        });
    </script>



</body>

</html>