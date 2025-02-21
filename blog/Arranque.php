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
            <h1>Arranca el Programa de Alfabetización para el Bienestar en San Pedro Pochutla</h1>

            <img src="../assets/img/carousel_principal/oaxaca.jpeg" alt="capacitacion-alfabetizatec">

            <p>El Gobierno Estatal, en colaboración con las autoridades municipales y el Instituto Tecnológico local, ha dado inicio al programa de Alfabetización para el Bienestar en San Pedro Pochutla. Esta iniciativa busca ofrecer a jóvenes, adultos y adultos mayores la oportunidad de acceder a la educación, especialmente a aquellos que aún no han podido completar su educación básica.

La Secretaria de Honestidad, Transparencia y Función Pública, Leticia Elsa Reyes López, fue la encargada de presentar el programa, señalando que su enfoque está dirigido a combatir el analfabetismo en la región, implementando un modelo comunitario y social que llevará los recursos necesarios a las poblaciones más vulnerables.

Gracias a la colaboración entre el gobierno local de San Pedro Pochutla y el Instituto Tecnológico Nacional de México (campus Pochutla), se pondrán en marcha brigadas estudiantiles dentro del Programa Nacional AlfabetizaTEC 2023. Los estudiantes estarán al frente de las brigadas, brindando apoyo a quienes necesiten completar sus estudios o aprender a leer y escribir.

En la inauguración del programa, se contó con la presencia de 51 estudiantes que se desempeñarán como instructores durante seis meses. La Secretaria Leticia Reyes destacó que esta colaboración permitirá que muchas personas que no saben leer ni escribir encuentren en este programa una oportunidad para mejorar su calidad de vida.

Además, la presidenta municipal, Minerva Pérez García, enfatizó la importancia del programa y la satisfacción que conlleva contribuir al bienestar de la comunidad. “Este es el mayor logro que puede tener una profesión, ayudar a los demás”, comentó Pérez García.

Como parte del arranque, las autoridades también realizaron una jornada de lectura en la Escuela Primaria Presidente Juárez, en la que participaron 51 estudiantes de sexto año. Los alumnos leyeron "El Principito" de Antoine de Saint-Exupéry, promoviendo así el amor por la lectura entre las nuevas generaciones.

Este esfuerzo conjunto, respaldado por la Secretaría de Educación Pública (SEP) de Oaxaca y el Instituto Estatal de Educación para Adultos (IEEA), forma parte de la estrategia estatal para la Reparación Histórica de los pueblos.</p>
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