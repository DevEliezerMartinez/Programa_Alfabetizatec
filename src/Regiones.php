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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<<<<<<< Updated upstream
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.21/jspdf.plugin.autotable.min.js"></script>
   


=======
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.24/jspdf.plugin.autotable.min.js"></script>
>>>>>>> Stashed changes
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

    <style>
        /* Centrar el botón en la pantalla */
        .boton-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0; /* Espaciado opcional */
        }

        /* Diseño básico del botón */
        button {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #4CAF50; /* Color de fondo */
            color: white; /* Color del texto */
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        /* Efecto de movimiento al poner el cursor sobre el botón */
        button:hover {
            transform: translateY(-5px); /* Mover hacia arriba 5px */
            background-color: #45a049; /* Cambiar color al hacer hover */
        }
    </style>

    <!-- Contenedor para centrar el botón -->
    <div class="boton-container">
        <button>
            Descargar reportes
        </button>
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
                    id: "1",
                    nombre: 'Occidente'
                },
                {
                    id: "2",
                    nombre: 'Noreste'
                },
                {
                    id: "3",
                    nombre: 'Bajio'
                },
                {
                    id: "4",
                    nombre: 'Centro'
                },
                {
                    id: "5",
                    nombre: 'Sureste'
                }
            ];


            $("button:contains('Descargar reportes')").on("click", function() {
                $.ajax({
                    url: "./api/coordinador_gral/obtenerDetallesRegiones.php",
                    type: "GET",
                    dataType: "json",
                    success: function(response) {
                        if (response.success && response.data) {
                            generarPDF(response.data);
                        } else {
                            console.error("Error: Datos no válidos");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("Error en la petición:", error);
                    }
                });
            });


            function generarPDF(data) {
<<<<<<< Updated upstream
    console.log("empezando PDF");
=======
                console.log("empezó");
                // Crear una instancia de jsPDF
                const doc = new jspdf.jsPDF();
>>>>>>> Stashed changes

    // Crear una instancia de jsPDF
    const doc = new jspdf.jsPDF();

<<<<<<< Updated upstream
    // Configurar el título del PDF
    doc.setFontSize(18);
    doc.text("Reporte de Participantes por Tecnológico", 10, 20);

    // Configurar el tamaño de la fuente para el contenido
    doc.setFontSize(12);

    // Agregar tabla de Participantes por Tecnológico
    // Iniciar la tabla en la página actual
    doc.text("Participantes por Tecnológico", 10, 30);

    // Definir los encabezados y los datos
    const participantesHeaders = ['Tecnológico', 'Tipo de Participante', 'Total'];
    const participantesData = data.participantes_por_tecnologico.map(item => [
        item.tecnologico,
        item.tipo_participante,
        item.total
    ]);

    // Crear la tabla con autoTable
    doc.autoTable({
        head: [participantesHeaders],
        body: participantesData,
        startY: 40,  // Iniciar tabla en una posición Y específica
        theme: 'grid',
        headStyles: { fillColor: [63, 81, 181] },
        margin: { top: 10, left: 10, right: 10 },
        tableWidth: 'auto',
    });

    // Agregar una nueva sección para Estudiantes por Nivel
    doc.addPage(); // Esto está bien, solo asegurate de que no haya una hoja en blanco.
    doc.text("Estudiantes por Nivel", 10, 20);

    // Definir los encabezados y los datos
    const estudiantesHeaders = ['Tecnológico', 'Nivel', 'Total Estudiantes'];
    const estudiantesData = data.estudiantes_por_tecnologico_nivel.map(item => [
        item.tecnologico,
        item.nivel,
        item.total_estudiantes
    ]);

    // Crear la tabla con autoTable
    doc.autoTable({
        head: [estudiantesHeaders],
        body: estudiantesData,
        startY: 30,
        theme: 'grid',
        headStyles: { fillColor: [63, 81, 181] },
        margin: { top: 10, left: 10, right: 10 },
        tableWidth: 'auto',
    });

    // Guardar el PDF
    doc.save("reporte_participantes.pdf");
}


=======
                // Procesar los datos para la tabla
                const groupedData = {};

                // Procesar participantes_por_tecnologico (Educadores)
                data.participantes_por_tecnologico.forEach(item => {
                    if (!groupedData[item.tecnologico]) {
                        groupedData[item.tecnologico] = {
                            Estudiantes: '',
                            Docentes: '',
                            Administrativos: '',
                            Analfabeta: '',
                            Primaria: '',
                            Secundaria: ''
                        };
                    }

                    switch (item.tipo_participante) {
                        case 'Estudiante Universitario':
                            groupedData[item.tecnologico].Estudiantes = item.total;
                            break;
                        case 'Docente':
                            groupedData[item.tecnologico].Docentes = item.total;
                            break;
                        case 'Administrativo':
                            groupedData[item.tecnologico].Administrativos = item.total;
                            break;
                    }
                });

                // Procesar estudiantes_por_tecnologico_nivel (Educandos)
                data.estudiantes_por_tecnologico_nivel.forEach(item => {
                    if (!groupedData[item.tecnologico]) {
                        groupedData[item.tecnologico] = {
                            Estudiantes: '',
                            Docentes: '',
                            Administrativos: '',
                            Analfabeta: '',
                            Primaria: '',
                            Secundaria: ''
                        };
                    }

                    switch (item.nivel) {
                        case 'Analfabeta':
                            groupedData[item.tecnologico].Analfabeta = item.total_estudiantes;
                            break;
                        case 'Primaria':
                            groupedData[item.tecnologico].Primaria = item.total_estudiantes;
                            break;
                        case 'Secundaria':
                            groupedData[item.tecnologico].Secundaria = item.total_estudiantes;
                            break;
                    }
                });

                // Preparar los datos para la tabla
                const tableData = Object.keys(groupedData).map(tecnologico => [
                    tecnologico,
                    groupedData[tecnologico].Estudiantes,
                    groupedData[tecnologico].Docentes,
                    groupedData[tecnologico].Administrativos,
                    groupedData[tecnologico].Analfabeta,
                    groupedData[tecnologico].Primaria,
                    groupedData[tecnologico].Secundaria
                ]);

                // Configurar los encabezados de la tabla
                const headers = [{
                        title: "Tecnológico",
                        colSpan: 1,
                        rowSpan: 2
                    },
                    {
                        title: "Educadores",
                        colSpan: 3,
                        rowSpan: 1
                    },
                    {
                        title: "Educandos",
                        colSpan: 3,
                        rowSpan: 1
                    }
                ];

                const subHeaders = [
                    "Estudiantes", "Docentes", "Administrativos",
                    "Analfabeta", "Primaria", "Secundaria"
                ];

                // Generar la tabla
                doc.autoTable({
                    head: [headers, subHeaders],
                    body: tableData,
                    startY: 30,
                    theme: 'grid',
                    styles: {
                        fontSize: 10,
                        cellPadding: 3,
                        lineColor: [0, 0, 0], // Color de los bordes
                        lineWidth: 0.1 // Grosor de los bordes
                    },
                    headStyles: {
                        fillColor: [22, 160, 133],
                        textColor: [255, 255, 255],
                        fontStyle: 'bold',
                        halign: 'center'
                    },
                    bodyStyles: {
                        halign: 'center' // Centrar el texto en las celdas del cuerpo
                    },
                    didParseCell: function(data) {
                        // Ajustar el estilo de las celdas de encabezado principal
                        if (data.section === 'head' && data.row.index === 0) {
                            data.cell.styles.fillColor = [22, 160, 133]; // Color de fondo
                            data.cell.styles.fontStyle = 'bold'; // Texto en negrita
                            data.cell.styles.halign = 'center'; // Centrar texto
                        }
                    }
                });

                // Guardar el PDF
                doc.save("reporte_participantes.pdf");
            }
>>>>>>> Stashed changes
            $.ajax({
                url: './api/graficas/metas.php', // URL del endpoint de las metas
                method: 'GET',
                dataType: 'json',
                success: function(response) {
                    if (response) { // Verifica si la respuesta es exitosa
                        // console.log(response)
                        const metasData = response.resumenPorRegion;
                        const educadoresData = response.educadoresPorRegion;

                        const regiones = [];
                        const metas = [];
                        const educadores = [];

                        regionesPredefinidas.forEach(region => {
                            regiones.push(region.nombre);

                            // Buscar la meta en los datos recibidos
                            const metaRegion = metasData.find(meta => meta.region === region.nombre);
                            metas.push(metaRegion ? parseInt(metaRegion.meta_total) || 0 : 0);

                            // Buscar los educadores en los datos recibidos
                            const educadoresRegion = educadoresData.find(edu => edu.region === region.nombre);
                            educadores.push(educadoresRegion ? parseInt(educadoresRegion.total_educadores) || 0 : 0);
                        });

                        //console.log('Metas:', metas);
                        //console.log('Educadores:', educadores);

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
                                    label: 'Total Educadores',
                                    data: educadores,
                                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                                    borderColor: 'rgba(75, 192, 192, 1)',
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

                    } else {
                        console.error('Formato de datos incorrecto:', response);
                        alert('No se encontraron datos de metas.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error al obtener los datos de las metas:', status, error);
                    alert('Hubo un error al obtener los datos de las metas.');
                }
            });
        });
    </script>





    <script src="../assets/js/jquery.js"></script>

</body>

</html>