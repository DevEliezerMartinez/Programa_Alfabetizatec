<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vista estado</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/vista_estado.css">
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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <header>
        <?php include('./layout/header.php') ?>
    </header>

    <main>
        <ul class="breadcrumb">
            <li><a href="./coordinador_nacional.php">Inicio</a></li>
            <li><a href="#">Detalles por estado:</a></li>

        </ul>
        <!-- Este es el título que se actualizará con el nombre de la región -->
        <h2 id="estado_title" class="titulo_principal"></h2>
        <div id="detallesEstado" class="full_center"></div>

    </main>

    <!-- Librerías de DataTables y Chart.js -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Función para obtener los parámetros de la URL
        function getUrlParameter(name) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(name);
        }

        let url = './api/coordinador_gral/obtenerDetallesEstado.php';

        // Obtener el nombre del estado de la URL
        const estadoName = getUrlParameter('nombre');

        // Si el parámetro 'estado' está presente, actualizar el título
        if (estadoName) {
            document.getElementById("estado_title").textContent = `Mostrando tecnologicos de:  ${estadoName}`;
            obtenerDetallesEstado(estadoName);
            /*  obtenerDatosEstado(estadoName);
             obtenerAvancesEstado(estadoName); */
        } else {
            document.getElementById("estado_title").textContent = "Detalles del estado";
        }

        function obtenerDetallesEstado(estadoNombre) {
            const detallesContainer = document.querySelector("#detallesEstado");

            if (!detallesContainer) {
                console.error("Contenedor detallesEstado no encontrado.");
                return; // Terminar la ejecución si no existe el contenedor
            }

            fetch(`./api/coordinador_gral/obtenerDetallesEstado.php?estado=${estadoNombre}`)
                .then(response => response.json()) // Parsear la respuesta JSON
                .then(data => {
                    if (data.success) {
                        detallesContainer.innerHTML = ''; // Limpiar el contenedor

                        // Crear la tabla para mostrar los detalles
                        const table = document.createElement("table");
                        table.className = "table table-striped"; // Puedes agregar clases adicionales para estilo

                        const thead = document.createElement("thead");
                        thead.innerHTML = `
                    <tr>
                        <th>Tecnológico</th>
                        <th>Tipo de Institución</th>
                        <th>Director</th>
                    </tr>
                `;
                        table.appendChild(thead);

                        // Agregar los datos de los tecnológicos
                        const tbody = document.createElement("tbody");
                        data.data.tecnologicos.forEach(tecnologico => {
                            const tr = document.createElement("tr");
                            tr.innerHTML = `
                        <td><a href="vista_tecnologico.php?id=${tecnologico.tecnologico_id}" class="tecnologico-link">${tecnologico.tecnologico_nombre}</a></td>
                        <td>${tecnologico.tipo_de_institucion || "N/A"}</td>
                        <td>${tecnologico.director || "N/A"}</td>
                    `;
                            tbody.appendChild(tr);
                        });

                        table.appendChild(tbody);
                        detallesContainer.appendChild(table);

                        // Inicializar DataTable sobre la tabla generada
                        $(table).DataTable({
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
                        alert(data.message || 'Hubo un error al obtener los detalles del estado.');
                    }
                })
                .catch(error => {
                    console.error("Error al realizar la solicitud AJAX:", error);
                    alert("Hubo un error al realizar la solicitud.");
                });
        }
    </script>
</body>

</html>