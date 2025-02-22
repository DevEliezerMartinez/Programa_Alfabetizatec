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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.21/jspdf.plugin.autotable.min.js"></script>
    <script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
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
    /* Centrar y colocar los botones en línea */
    .boton-container {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 20px 0;
    }

    /* Diseño básico del botón */
    button {
        padding: 15px 30px;
        font-size: 18px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: transform 0.3s ease, background-color 0.3s ease;
        margin: 0 10px; /* Espaciado entre botones */
    }

    /* Efecto de movimiento al poner el cursor sobre el botón */
    button:hover {
        transform: translateY(-5px);
        background-color: #45a049;
    }
</style>

<!-- Contenedor para los botones en línea -->
<div class="boton-container">
    <button id="descargar-pdf">
        Descargar reportes PDF
    </button>
    <button id="descargar-excel">
        Descargar reportes Excel
    </button>
</div>


    <h2>Resumen de las regiones</h2>

    <div class="graficas_region">
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

            // Descargar reporte en PDF
            $("#descargar-pdf").on("click", function() {
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

            // Generar reporte en PDF
            function generarPDF(data) {
                const doc = new jspdf.jsPDF();

                doc.setFontSize(18);
                doc.text("Reporte de Participantes por Tecnológico", 10, 20);

                // Tabla Participantes por Tecnológico
                doc.setFontSize(12);
                doc.text("Participantes por Tecnológico", 10, 30);

                const participantesHeaders = ['Tecnológico', 'Tipo de Participante', 'Total'];
                const participantesData = data.participantes_por_tecnologico.map(item => [
                    item.tecnologico,
                    item.tipo_participante,
                    item.total
                ]);

                doc.autoTable({
                    head: [participantesHeaders],
                    body: participantesData,
                    startY: 40,
                    theme: 'grid',
                    headStyles: { fillColor: [63, 81, 181] },
                    margin: { top: 10, left: 10, right: 10 },
                    tableWidth: 'auto',
                });

                // Nueva página para Estudiantes por Nivel
                doc.addPage();
                doc.text("Estudiantes por Nivel", 10, 20);

                const estudiantesHeaders = ['Tecnológico', 'Nivel', 'Total Estudiantes'];
                const estudiantesData = data.estudiantes_por_tecnologico_nivel.map(item => [
                    item.tecnologico,
                    item.nivel,
                    item.total_estudiantes
                ]);

                doc.autoTable({
                    head: [estudiantesHeaders],
                    body: estudiantesData,
                    startY: 30,
                    theme: 'grid',
                    headStyles: { fillColor: [63, 81, 181] },
                    margin: { top: 10, left: 10, right: 10 },
                    tableWidth: 'auto',
                });

                doc.save("reporte_participantes.pdf");
            }

           // Generar reporte en Excel
function generarExcel(data) {
    const participantesData = data.participantes_por_tecnologico.map(item => ({
        Tecnológico: item.tecnologico,
        "Tipo de Participante": item.tipo_participante,
        Total: item.total
    }));

    const estudiantesData = data.estudiantes_por_tecnologico_nivel.map(item => ({
        Tecnológico: item.tecnologico,
        Nivel: item.nivel,
        "Total Estudiantes": item.total_estudiantes
    }));

    const wb = XLSX.utils.book_new();

    // Crear las hojas de Excel
    const ws1 = XLSX.utils.json_to_sheet(participantesData);
    const ws2 = XLSX.utils.json_to_sheet(estudiantesData);

    // Estilo para las celdas
    const cellStyle = {
        alignment: {
            horizontal: 'center', // Centrado horizontal
            vertical: 'center'    // Centrado vertical
        },
        border: {
            top: { style: 'thin' },
            left: { style: 'thin' },
            bottom: { style: 'thin' },
            right: { style: 'thin' }
        }
    };

    // Función para aplicar estilo a las celdas de la hoja
    function applyStyle(ws) {
        const range = XLSX.utils.decode_range(ws['!ref']);
        for (let row = range.s.r; row <= range.e.r; row++) {
            for (let col = range.s.c; col <= range.e.c; col++) {
                const cell = ws[XLSX.utils.encode_cell({ r: row, c: col })];
                if (cell) {
                    cell.s = cellStyle; // Aplicar estilo
                }
            }
        }
    }

    // Aplicar estilos a las hojas
    applyStyle(ws1);
    applyStyle(ws2);

    // Ajustar el tamaño de las columnas para que se vea centrado
    ws1['!cols'] = [
        { wpx: 120 },  // Ancho de la primera columna
        { wpx: 200 },  // Ancho de la segunda columna
        { wpx: 80 }    // Ancho de la tercera columna
    ];

    ws2['!cols'] = [
        { wpx: 120 },  // Ancho de la primera columna
        { wpx: 200 },  // Ancho de la segunda columna
        { wpx: 100 }   // Ancho de la tercera columna
    ];

    // Añadir las hojas al libro
    XLSX.utils.book_append_sheet(wb, ws1, "Participantes por Tecnológico");
    XLSX.utils.book_append_sheet(wb, ws2, "Estudiantes por Nivel");

    // Generar y descargar el archivo Excel
    XLSX.writeFile(wb, "reporte_participantes.xlsx");
}

// Descargar reporte en Excel
$("#descargar-excel").on("click", function() {
    $.ajax({
        url: "./api/coordinador_gral/obtenerDetallesRegiones.php",
        type: "GET",
        dataType: "json",
        success: function(response) {
            if (response.success && response.data) {
                generarExcel(response.data);
            } else {
                console.error("Error: Datos no válidos");
            }
        },
        error: function(xhr, status, error) {
            console.error("Error en la petición:", error);
        }
    });
});


            // Obtener y mostrar gráficos
            $.ajax({
                url: './api/graficas/metas.php',
                method: 'GET',
                dataType: 'json',
                success: function(response) {
                    if (response) {
                        const metasData = response.resumenPorRegion;
                        const educadoresData = response.educadoresPorRegion;

                        const regiones = [];
                        const metas = [];
                        const educadores = [];

                        regionesPredefinidas.forEach(region => {
                            regiones.push(region.nombre);

                            const metaRegion = metasData.find(meta => meta.region === region.nombre);
                            metas.push(metaRegion ? parseInt(metaRegion.meta_total) || 0 : 0);

                            const educadoresRegion = educadoresData.find(edu => edu.region === region.nombre);
                            educadores.push(educadoresRegion ? parseInt(educadoresRegion.total_educadores) || 0 : 0);
                        });

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
