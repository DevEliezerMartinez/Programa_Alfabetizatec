
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles region</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/vista_region.css">
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
            <?php if ($_SESSION['rol_id'] === 2): ?>
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Tecnologicos por region:</a></li>
            <?php else: ?>
                <li><a href="./coordinador_nacional.php">Inicio</a></li>
                <li><a href="./Regiones.php">Vista regiones:</a></li>
                <li><a href="#">Tecnologicos por region:</a></li>
            <?php endif; ?>
        </ul>



        <!-- Este es el título que se actualizará con el nombre de la región -->
        <h2 id="region_title" class="titulo_principal">Detalles de región</h2>
        <div id="detallesRegion" class="full_center"></div>

        <div class="graficas">
            <div class="avance_metas">
                <h4 class="titulo_principal">Participantes por region</h4>
                <canvas id="graficoBarras"></canvas>
            </div>

            <div class="reporte_avance">
                <h4 class="titulo_principal">Avance por region</h4>
                <canvas id="avance"></canvas>
            </div>
        </div>

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

        let url = './api/coordinador_gral/obtenerDetallesRegion.php'

        // Obtener el nombre de la región de la URL
        const regionName = getUrlParameter('region');

        // Si el parámetro 'region' está presente, actualizar el título
        if (regionName) {
            document.getElementById("region_title").textContent = `Detalles de la región ${regionName}`;
            obtenerDetallesRegion(regionName);
            obtenerDatosRegion(regionName)
            obtenerAvancesRegion(regionName)
        } else {
            document.getElementById("region_title").textContent = "Detalles de la región";
        }

        function obtenerDetallesRegion(regionNombre) {
            const detallesContainer = document.querySelector("#detallesRegion");

            if (!detallesContainer) {
                console.error("Contenedor detallesRegion no encontrado.");
                return; // Terminar la ejecución si no existe el contenedor
            }

            fetch(`./api/coordinador_gral/obtenerDetallesRegion.php?region=${regionNombre}`)
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
                        <th>Estado</th>
                        <th>Tecnológico</th>
                        <th>Tipo de Institución</th>
                    </tr>
                `;
                        table.appendChild(thead);

                        // Agregar los datos de los tecnológicos
                        const tbody = document.createElement("tbody");
                        data.data.estados_por_region.forEach(estado => {
                            if (estado.tecnologicos) {
                                estado.tecnologicos.forEach(tecnologico => {
                                    const tr = document.createElement("tr");
                                    tr.innerHTML = `
                                <td>${estado.estado_nombre}</td>
                                <td><a href="vista_tecnologico.php?id=${tecnologico.tecnologico_id}" class="tecnologico-link">${tecnologico.tecnologico_nombre}</a></td>
                                <td>${tecnologico.tipo_de_institucion || "N/A"}</td>
                            `;
                                    tbody.appendChild(tr);
                                });
                            }
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
                        alert(data.message || 'Hubo un error al obtener los detalles de la región.');
                    }
                })
                .catch(error => {
                    console.error("Error al realizar la solicitud AJAX:", error);
                    alert("Hubo un error al realizar la solicitud.");
                });
        }

        function obtenerDatosRegion(regionNombre) {
            // Verificar que se pase un nombre de región válido
            if (!regionNombre || regionNombre.trim() === "") {
                console.error("El nombre de la región es obligatorio.");
                return;
            }

            // Crear la solicitud AJAX
            const xhr = new XMLHttpRequest();
            const url = `./api/graficas/graficas_region.php?region_nombre=${encodeURIComponent(regionNombre)}`;

            // Configurar la solicitud GET
            xhr.open("GET", url, true);

            // Configurar el evento para manejar la respuesta
            xhr.onload = function() {
                if (xhr.status === 200) {
                    try {
                        // Parsear la respuesta JSON
                        const response = JSON.parse(xhr.responseText);

                        if (response.success) {

                            // Aquí puedes procesar los datos y usarlos, por ejemplo, para crear gráficos
                            renderizarGraficos(response.data);
                        } else {
                            console.error("Error en la respuesta:", response.message);
                        }
                    } catch (error) {
                        console.error("Error al parsear la respuesta JSON:", error);
                    }
                } else {
                    console.error(`Error en la petición: ${xhr.statusText} (Código ${xhr.status})`);
                }
            };

            // Manejar errores de red
            xhr.onerror = function() {
                console.error("Error de red al hacer la solicitud.");
            };

            // Enviar la solicitud
            xhr.send();
        }

        function obtenerAvancesRegion(regionNombre) {
            // Verificar que se pase un nombre de región válido
            if (!regionNombre || regionNombre.trim() === "") {
                console.error("El nombre de la región es obligatorio.");
                return;
            }

            // Hacer la solicitud AJAX usando jQuery
            $.ajax({
                url: `./api/graficas/avance_region.php`, // Ruta del archivo PHP
                type: "GET", // Tipo de solicitud GET
                data: {
                    region_nombre: regionNombre
                }, // Datos a enviar
                success: function(response) {
                    console.log(response)
                    try {
                        // Verificar si la respuesta es exitosa
                        if (response.success) {
                            // Llamar a renderizarGraficosAvance con la data recibida
                            renderizarGraficosAvance(response.data);
                        } else {
                            console.error("Error en la respuesta:", response.message);
                        }
                    } catch (error) {
                        console.error("Error al procesar la respuesta JSON:", error);
                    }
                },
                error: function(xhr, status, error) {
                    // Manejar errores de la solicitud AJAX
                    console.error("Error en la solicitud AJAX:", error);
                }
            });
        }

        function renderizarGraficos(datos) {

            const tecnologicos = datos.tecnologicos;

            const labels = [];
            const datosEstudiantes = [];
            const datosEducadores = [];

            for (const tecnologicoId in tecnologicos) {
                const tecnologico = tecnologicos[tecnologicoId];
                if (!tecnologico || !tecnologico.tecnologico_nombre) {
                    console.warn(`El tecnológico con ID ${tecnologicoId} no tiene nombre válido.`);
                    labels.push("Sin nombre");
                } else {
                    labels.push(tecnologico.tecnologico_nombre);
                }

                datosEstudiantes.push(tecnologico.total_estudiantes || 0);
                datosEducadores.push(tecnologico.total_educadores || 0);
            }



            const ctx = document.getElementById("graficoBarras").getContext("2d");

            // Destruir gráfica previa, si existe
            if (window.myChart) {
                window.myChart.destroy();
            }

            // Crear el gráfico de barras con comparación lado a lado
            window.myChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                            label: "Total Estudiantes",
                            data: datosEstudiantes,
                            backgroundColor: "rgba(255, 99, 132, 0.7)",
                            borderColor: "rgba(255, 99, 132, 1)",
                            borderWidth: 1,
                        },
                        {
                            label: "Total Educadores",
                            data: datosEducadores,
                            backgroundColor: "rgba(54, 162, 235, 0.7)",
                            borderColor: "rgba(54, 162, 235, 1)",
                            borderWidth: 1,
                        },
                    ],
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: "top",
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const value = context.raw;
                                    return `${context.dataset.label}: ${value}`;
                                },
                            },
                        },
                    },
                    scales: {
                        x: {
                            stacked: false, // Barras no apiladas
                            title: {
                                display: true,
                                text: "Tecnológicos",
                            },
                        },
                        y: {
                            stacked: false, // Barras no apiladas
                            title: {
                                display: true,
                                text: "Cantidad",
                            },
                        },
                    },
                },
            });
        }

        function renderizarGraficosAvance(datos) {
            console.log("de avances", datos)
            const tecnologicos = datos.tecnologicos;

            const labels = [];
            const datosMetas = [];
            const datosEstudiantesAprobados = [];

            for (const tecnologico of tecnologicos) {
                // Asegurarse de que el nombre del tecnológico esté disponible
                if (!tecnologico || !tecnologico.tecnologico_nombre) {
                    console.warn(`El tecnológico con ID ${tecnologico.tecnologico_id} no tiene nombre válido.`);
                    labels.push("Sin nombre");
                } else {
                    labels.push(tecnologico.tecnologico_nombre);
                }

                // Si no hay datos de metas o estudiantes, asignamos 0
                datosMetas.push(tecnologico.meta_total || 0);
                datosEstudiantesAprobados.push(tecnologico.estudiantes_aprobados || 0);
            }

            const ctx = document.getElementById("avance").getContext("2d");



            // Crear el gráfico de barras
            window.myChart = new Chart(ctx, {
                type: "bar",
                data: {
                    labels: labels,
                    datasets: [{
                            label: "Metas",
                            data: datosMetas,
                            backgroundColor: "rgba(255, 99, 132, 0.7)",
                            borderColor: "rgba(255, 99, 132, 1)",
                            borderWidth: 1,
                        },
                        {
                            label: "Estudiantes Aprobados",
                            data: datosEstudiantesAprobados,
                            backgroundColor: "rgba(54, 162, 235, 0.7)",
                            borderColor: "rgba(54, 162, 235, 1)",
                            borderWidth: 1,
                        },
                    ],
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: "top",
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    const value = context.raw;
                                    return `${context.dataset.label}: ${value}`;
                                },
                            },
                        },
                    },
                    scales: {
                        x: {
                            stacked: false, // Barras no apiladas
                            title: {
                                display: true,
                                text: "Tecnológicos",
                            },
                        },
                        y: {
                            stacked: false, // Barras no apiladas
                            title: {
                                display: true,
                                text: "Cantidad",
                            },
                        },
                    },
                },
            });
        }
    </script>

    <script>

    </script>
</body>

</html>