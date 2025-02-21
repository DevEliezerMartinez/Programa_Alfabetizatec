<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alfabetizatec - Coor. Nacional</title>
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/layout/header.css">
    <link rel="stylesheet" href="../assets/css/coordinador_nacional.css">
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
            <li><a href="#">Inicio</a></li>

        </ul>
        <h2 class="titulo_principal">Bienvenido <?php echo $_SESSION['nombre'] . ' ' . $_SESSION['apellido']; ?></h2>
        <div class="hero_cord_nacional">
            <div class="map_container">
                <?php include('./components/mapa.html') ?>
            </div>

            <!-- Contenedor de las cards -->
            <div class="cards_container">
                <!-- Card de vista de regiones -->
                <div class="card">
                    <h3>Vista de Regiones</h3>
                    <p>Accede a la vista detallada de las diferentes regiones del país.</p>
                    <div class="card_body ">
                        <p><strong>¿Qué puedes hacer aquí?</strong></p>
                        <ul>
                            <li><strong>Ver todas las regiones:</strong> Obtén una lista completa de las regiones geográficas del país, organizada por estados o áreas.</li>
                            <li><strong>Consultar detalles por región:</strong> Al seleccionar una región, puedes obtener información específica como el nombre de los tecnológicos, el tipo de institución, los directores y otros datos relevantes.</li>
                            <li><strong>Visualizar estadísticas:</strong> Puedes ver estadísticas relacionadas con cada región, como el rendimiento de los tecnológicos, el número de estudiantes, y otros indicadores clave.</li>
                            <li><strong>Acceder a tecnología por región:</strong> Descubre qué tecnológicos pertenecen a cada región y cómo se distribuyen a lo largo del país.</li>
                        </ul>
                        <p id="card-regiones" class="btn btn-primary">Acceder a la vista de regiones</p>
                    </div>
                </div>



            </div>

        </div>
    </main>

</body>
<footer>
    <?php include('./layout/footer.php') ?>

</footer>


<script src="../assets/js/jquery.js"></script>


<script>
    $(document).ready(function() {
        // Redirigir al hacer clic en "Vista de Regiones"
        $('#card-regiones').click(function() {
            window.location.href = './Regiones.php'; // Cambia '/ruta-regiones' por la ruta que desees
        });


    });
</script>

</html>