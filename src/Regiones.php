<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regiones alfabetizatec</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/regiones.css">
    <link rel="stylesheet" href="../assets/css/layout/header.css">
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
            <li><a href="./coordinador_nacional.php">Inicio</a></li>
            <li><a href="#">Vista regiones:</a></li>
        </ul>

        <h1 class="titulo_principal">Regiones alfabetizatec</h1>
        <div class="">
            <?php include('./components/mapa_regiones/mapa_reg.html') ?>
        </div>

        <div class="container_cards">
            <!-- Las cards se generarán dinámicamente aquí -->
        </div>

        <h2>Resumen de las regiones</h2>

        <div class="graficas_region ">
            <!-- Gráfico de Metas -->
            <h3>Metas Totales</h3>
            <canvas id="graficoMetas" width="400" height="200"></canvas>

            <!-- Gráfico de Participantes -->
            <h3>Participantes</h3>
            <canvas id="graficoParticipantes" width="400" height="200"></canvas>
        </div>

    </main>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        $(document).ready(function() {
            const regionesPredefinidas = [{
                    id: 1,
                    nombre: 'Occidente'
                },
                {
                    id: 2,
                    nombre: 'Noreste'
                },
                {
                    id: 3,
                    nombre: 'Bajio'
                },
                {
                    id: 4,
                    nombre: 'Centro'
                },
                {
                    id: 5,
                    nombre: 'Sureste'
                }
            ];

            $.ajax({
                url: './api/graficas/datos_region.php', // URL del endpoint de los datos de la región
                method: 'GET',
                dataType: 'json',
                success: function(response) {
                    if (response.success) {
                        const regionesData = response.data.regiones;

                        if (typeof regionesData !== 'object') {
                            console.error('Los datos de regiones no son un objeto');
                            return;
                        }

                        const regiones = [];
                        const metas = [];
                        const estudiantes = [];
                        const educadores = [];

                        $.ajax({
                            url: './api/graficas/metas.php', // URL del endpoint de las metas
                            method: 'GET',
                            dataType: 'json',
                            success: function(metasResponse) {
                                if (metasResponse && metasResponse.length > 0) {
                                    $.each(regionesPredefinidas, function(index, region) {
                                        regiones.push(region.nombre);
                                        let totalMeta = 0;
                                        let totalEstudiantes = 0;
                                        let totalEducadores = 0;

                                        const regionData = regionesData[region.id];
                                        if (regionData) {
                                            console.log('Procesando región:', region.nombre);
                                            console.log('Datos de la región:', regionData); // Verifica que los datos de la región sean correctos

                                            if (Array.isArray(regionData.tecnologicos) && regionData.tecnologicos.length > 0) {
                                                console.log('Tecnológicos encontrados:', regionData.tecnologicos); // Verifica que technologicos es un arreglo con datos
                                                $.each(regionData.tecnologicos, function(i, tecnologico) {
                                                    console.log("Tecnológico:", tecnologico); // Verifica cada objeto en el array
                                                    totalEstudiantes += tecnologico.estudiantes_aprobados || 0;
                                                    totalEducadores += tecnologico.total_educadores || 0;
                                                });
                                            } else {
                                                console.warn('No se encontró el arreglo de tecnológicos en la región:', region.nombre);
                                            }

                                            const metaData = metasResponse.find(meta => meta.region === region.nombre);
                                            if (metaData) {
                                                totalMeta = parseInt(metaData.meta_total) || 0; // Convertir a número
                                            }
                                        } else {
                                            console.warn('No se encontraron datos para la región:', region.nombre);
                                        }

                                        metas.push(totalMeta);
                                        estudiantes.push(totalEstudiantes);
                                        educadores.push(totalEducadores);
                                    });

                                    console.log('Metas:', metas);
                                    console.log('Estudiantes:', estudiantes);
                                    console.log('Educadores:', educadores);

                                    const ctxMetas = document.getElementById('graficoMetas').getContext('2d');
                                    new Chart(ctxMetas, {
                                        type: 'bar',
                                        data: {
                                            labels: regiones,
                                            datasets: [{
                                                label: 'Metas Totales',
                                                data: metas,
                                                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                                borderColor: 'rgba(255, 99, 132, 1)',
                                                borderWidth: 1
                                            }]
                                        },
                                        options: {
                                            responsive: true,
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });

                                    const ctxParticipantes = document.getElementById('graficoParticipantes').getContext('2d');
                                    new Chart(ctxParticipantes, {
                                        type: 'bar',
                                        data: {
                                            labels: regiones,
                                            datasets: [{
                                                    label: 'Estudiantes Aprobados',
                                                    data: estudiantes,
                                                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                                                    borderColor: 'rgba(54, 162, 235, 1)',
                                                    borderWidth: 1
                                                },
                                                {
                                                    label: 'Total Educadores',
                                                    data: educadores,
                                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                                    borderColor: 'rgba(75, 192, 192, 1)',
                                                    borderWidth: 1
                                                }
                                            ]
                                        },
                                        options: {
                                            responsive: true,
                                            scales: {
                                                y: {
                                                    beginAtZero: true
                                                }
                                            }
                                        }
                                    });
                                } else {
                                    alert('No se encontraron datos de metas.');
                                }
                            },
                            error: function(xhr, status, error) {
                                console.error('Hubo un error al obtener los datos de las metas: ', status, error);
                                alert('Hubo un error al obtener los datos de las metas.');
                            }
                        });
                    } else {
                        alert('No se encontraron datos de regiones.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Hubo un error en la solicitud de datos de región: ', status, error);
                    alert('Hubo un error al obtener los datos de la región.');
                }
            });
        });
    </script>




    <script src="../assets/js/jquery.js"></script>

</body>

</html>