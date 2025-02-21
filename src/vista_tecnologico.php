
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vista tecnológico</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/vista_tecnologico.css">
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
                <li><a href="#">Detalles por tecnológico:</a></li>
            <?php else: ?>
                <li><a href="./coordinador_nacional.php">Inicio</a></li>
                <li><a href="javascript:history.back();">Estado:</a></li>
                <li><a href="#">Detalles por tecnológico:</a></li>
            <?php endif; ?>
        </ul>

        <h3 id="titulo-tecnologico" class="titulo_principal"></h3>

        <div id="detallesTecnologico" class="full_center"></div>
    </main>



    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


    <script>
        $(document).ready(function() {
            // Obtener el id del tecnológico de la URL
            const urlParams = new URLSearchParams(window.location.search);
            const idTecnologico = urlParams.get('id');

            if (idTecnologico) {
                // Realizar la petición AJAX para obtener los detalles del tecnológico
                $.ajax({
                    url: `./api/coordinador_gral/obtenerDetallesTec.php?id=${idTecnologico}`, // Cambia esta URL a la correcta
                    type: 'GET',
                    dataType: 'json',
                    success: function(data) {
                        if (data.success) {
                            // Mostrar el nombre del tecnológico en el título
                            $('#titulo-tecnologico').text(`Tecnológico: ${data.data.tecnologico_nombre}`);

                            // Crear la tabla de niveles con la cantidad de programas y la suma de metas
                            if (data.data.niveles && data.data.niveles.length > 0) {
                                let tableContent = `
            <table id="nivelesTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>Nivel</th>
                        <th>Cantidad de Programas</th>
                        <th>Suma de Metas</th>
                    </tr>
                </thead>
                <tbody>
            `;

                                // Agregar los niveles a la tabla
                                data.data.niveles.forEach(function(nivel) {
                                    tableContent += '<tr>' +
                                        // Convertir el nombre del nivel en un enlace
                                        `<td><a href="./vista_programa.php?nombre=${encodeURIComponent(nivel.nivel)}&id_tecnologico=${encodeURIComponent(idTecnologico)}">${nivel.nivel}</a></td>` +
                                        `<td>${nivel.cantidad_programas}</td>` +
                                        `<td>${nivel.suma_metas}</td>` +
                                        '</tr>';
                                });

                                tableContent += '</tbody></table>';
                                $('#detallesTecnologico').append(tableContent);

                                // Inicializar DataTable sobre la tabla generada
                                $('#nivelesTable').DataTable({
                                    paging: true,
                                    searching: true,
                                    ordering: true,
                                    info: true,
                                    lengthChange: true, // Permitir seleccionar cantidad de registros por página
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
                                $('#detallesTecnologico').append('<p>No hay niveles disponibles para este tecnológico.</p>');
                            }

                        } else {
                            alert(data.message || 'Hubo un error al obtener los detalles del tecnológico.');
                        }
                    },
                    error: function(error) {
                        console.log('Error al obtener los detalles del tecnológico:', error);
                    }
                });
            } else {
                console.log('No se encontró el id del tecnológico en la URL');
            }
        });
    </script>


</body>


</html>