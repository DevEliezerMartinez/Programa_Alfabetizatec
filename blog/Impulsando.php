<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TecNM - INEA Alfabetizatec</title>
    <link rel="shortcut icon" href="../assets/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="../assets/css/root.css">
    <link rel="stylesheet" href="../assets/css/blog.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>

<body>
    <header class="principal_header">
        <div class="logo_dinamico">
            <img src="../assets/img/logotipos/blanco.png" alt="Logotipo Alfabetizatec">
            <div class="text">
                <p> Programa Nacional</p>
                <p>Alfabetizatec</p>
            </div>
        </div>
        <img src="../assets/img/logotipos/TecNM_Azteca.png" alt="Logotipo TECNM">
        <img src="../assets/img/logotipos/inea_blanco.png" alt="Logotipo INEA">
    </header>
    <main>
        <div class="menu">

            <img id="volver" class="menu_actions" src="../assets/img/svg/back_black.svg" alt="volver img">
            <span>Noticias TecNM</span>
        </div>

        <section class="nota_principal">
            <h1>Alfabetiza-Tec: Estudiantes y Maestros del Tec de Piedras Negras se Unen por la Educación</h1>

            <img src="../assets/img/carousel_principal/impulsando.jpeg" alt="capacitacion-alfabetizatec">

            <p>Piedras Negras, Coah.- Con el objetivo de reducir el rezago educativo en la comunidad, el Tecnológico de Piedras Negras ha puesto en marcha la campaña Alfabetiza-Tec, en la que participarán alrededor de 80 estudiantes y diversos maestros de distintas especialidades. Esta iniciativa busca apoyar a personas que no han concluido su educación primaria o secundaria, así como a quienes aún no saben leer ni escribir.

                El director del plantel, Dr. Gustavo Emilio Rojo, informó que este jueves se llevó a cabo una reunión informativa con los alumnos voluntarios que formarán parte del programa, el cual dará inicio en los próximos días.

                Esta campaña forma parte de un esfuerzo a nivel nacional tras la firma de un convenio entre el Tecnológico Nacional de México (TecNM) y el Instituto Nacional para la Educación de los Adultos (INEA), el cual ha sido refrendado en los ámbitos estatal y local.

                Rojo Velázquez destacó que Coahuila es el estado con menor rezago educativo en educación básica, y con esta iniciativa se espera seguir reduciendo las cifras de personas en situación de analfabetismo.

                Tras la reunión informativa, se establecerá un centro de asesoría donde se organizarán los grupos de trabajo y se utilizarán los materiales proporcionados por el Instituto para la Educación de los Adultos, garantizando así un aprendizaje estructurado y efectivo.
            </p>
        </section>
    </main>

    <footer>
        <?php include('../src/layout/footer.php') ?>
    </footer>

    <script>
        document.getElementById("volver").addEventListener("click", function() {
            window.history.back(); // O también puedes usar: window.history.go(-1);
        });
    </script>
</body>