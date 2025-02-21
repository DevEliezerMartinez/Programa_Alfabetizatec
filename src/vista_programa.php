
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del programa</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/vista_programa.css">
    <link rel="stylesheet" href="../assets/css/layout/header.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert ya importado -->
</head>

<body>
    <?php
    // <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert ya importado -->
    session_start();
    include('./api/auth/validate.php');
    ?>
    <header>
        <?php include('./layout/header.php') ?>
    </header>

    <main>
        <ul class="breadcrumb">
            <?php if ($_SESSION['rol_id'] === 2): ?>
                <li><a href="./vista_region.php?region=<?php echo urlencode($_SESSION['nombre_region']); ?>">Inicio</a></li>
                <li><a href="./vista_region.php?region=<?php echo urlencode($_SESSION['nombre_region']); ?>">Región</a></li>
                <li><a href="javascript:history.back();">Tecnológico:</a></li>
                <li><a href="#">Detalles por nivel:</a></li>
            <?php else: ?>
                <li><a href="./coordinador_nacional.php">Inicio</a></li>
                <li><a href="javascript:history.go(-2);">Estado:</a></li>
                <li><a href="javascript:history.back();">Tecnológico:</a></li>
                <li><a href="#">Detalles por nivel:</a></li>
            <?php endif; ?>
        </ul>

        <h3 id="titulo-programa" class="titulo_principal"></h3>

        <div id="detallesPrograma" class="full_center"></div>
    </main>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    <script>
        // Obtener el id del programa de la URL
        const urlParams = new URLSearchParams(window.location.search);
        // Obtener el id del programa de la URL
        const Programa = urlParams.get('nombre');
        console.log("nombre", Programa)
        // Obtener el id del programa de la URL
        const id_tecnologico = urlParams.get('id_tecnologico');
        console.log("nombre", Programa)
        let status = false;
        if (Programa == "Analfabeta" || Programa == "Primaria" || Programa == "Secundaria") {
            status = true;
        }

        console.log(status)


        // Verificar si se tiene el id del programa
        if (Programa) {
            console.log("true ajax");
            // Realizar la petición AJAX para obtener los detalles del programa y la lista de educadores
            $.ajax({
                url: `./api/coordinador_gral/obtenerDetalleNivel.php?nivel=${Programa}&id_tecnologico=${id_tecnologico}`,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    if (data.success) {
                        // Verificar si hay datos de educadores
                        if (data.data && data.data.length > 0) {
                            // Filtrar educadores: excluir aquellos con todos los campos null
                            const educadoresFiltrados = data.data.filter(educador =>
                                educador.usuario_id !== null ||
                                educador.nombre !== null ||
                                educador.apellido !== null ||
                                educador.correo !== null ||
                                educador.telefono !== null
                            );

                            // Crear la tabla de educadores solo si hay educadores después del filtrado
                            if (educadoresFiltrados.length > 0) {
                                let tableContentEducadores = `
                            <h4>Educadores:</h4>
                            <table id="educadoresTable" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Correo</th>
                                        <th>Teléfono</th>
                                        <th>Nivel Educativo</th>
                                    </tr>
                                </thead>
                                <tbody>
                        `;

                                // Agregar los educadores filtrados a la tabla
                                educadoresFiltrados.forEach(function(educador) {
                                    tableContentEducadores += '<tr>' +
                                        `<td>${educador.nombre || "N/A"}</td>` +
                                        `<td>${educador.apellido || "N/A"}</td>` +
                                        `<td>${educador.correo || "N/A"}</td>` +
                                        `<td>${educador.telefono || "N/A"}</td>` +
                                        `<td>${educador.nivel_educativo || "N/A"}</td>` +
                                        '</tr>';
                                });

                                tableContentEducadores += '</tbody></table>';
                                $('#detallesPrograma').append(tableContentEducadores);

                                // Inicializar DataTable sobre la tabla de educadores
                                $('#educadoresTable').DataTable({
                                    paging: true,
                                    searching: true,
                                    ordering: true,
                                    info: true,
                                    lengthChange: true,
                                    language: {
                                        search: "Buscar:",
                                        lengthMenu: "Mostrar _MENU_ registros por página",
                                        info: "Mostrando de _START_ a _END_ de _TOTAL_ registros",
                                        infoEmpty: "Mostrando 0 a 0 de 0 registros",
                                        infoFiltered: "(filtrado de _MAX_ registros en total)",
                                        paginate: {
                                            first: "Primero",
                                            previous: "Anterior",
                                            next: "Siguiente",
                                            last: "Último"
                                        }
                                    }
                                });
                            } else {
                                $('#detallesPrograma').append('<p>No hay educadores registrados para este programa.</p>');
                            }
                        } else {
                            $('#detallesPrograma').append('<p>No hay educadores registrados para este programa.</p>');
                        }

                    } else {
                        alert(data.message || 'Hubo un error al obtener los detalles del programa.');
                    }
                },
                error: function(error) {
                    console.log('Error al obtener los detalles del programa:', error);
                }
            });
        } else {
            console.log('No se encontró el id del programa en la URL');
        }
    </script>



</body>