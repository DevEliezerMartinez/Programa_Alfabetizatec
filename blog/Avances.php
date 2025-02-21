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
            <img  src="../assets/img/logotipos/blanco.png" alt="Logotipo Alfabetizatec">
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
            <h1>Plática y capacitación de AlfabetizaTEC en el TecNM – Tijuana</h1>

            <img src="../assets/img/capacitacion-alfabetizatec.png" alt="capacitacion-alfabetizatec">

            <p>Con la asistencia de más de 100 estudiantes de la modalidad semipresencial, el TecNM – Instituto
                Tecnológico
                de Tijuana, unidad Tomás Aquino, fue sede de la plática informativa y capacitación impartida por el
                personal
                del Instituto Nacional para la Educación de los Adultos (INEA). La actividad estuvo dirigida a los
                estudiantes interesados en formar parte del Programa AlfabetizaTEC, el cual busca fomentar la educación
                y
                alfabetización en la comunidad.

                Durante la jornada, los participantes recibieron información detallada sobre los objetivos y metodología
                del
                programa, además de una capacitación especializada para desempeñarse como alfabetizadores voluntarios.
                La
                sesión permitió a los estudiantes resolver dudas y fortalecer su compromiso con la educación
                comunitaria.

                En representación del Tecnológico de Tijuana, estuvieron presentes Artemio Lara Chávez, jefe del
                Departamento de Gestión Tecnológica y Vinculación, y Nayeli Fernández González, encargada del área de
                Servicio Social en la unidad Tomás Aquino, quienes destacaron la importancia de la participación
                estudiantil
                en programas de impacto social como AlfabetizaTEC.

                Con este tipo de iniciativas, el Tecnológico de Tijuana reafirma su compromiso con la responsabilidad
                social
                y el desarrollo educativo, impulsando la formación de sus estudiantes como agentes de cambio en su
                comunidad
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