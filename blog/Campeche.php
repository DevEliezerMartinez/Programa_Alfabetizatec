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
            <h1>Llevando educación a cada rincón de Campeche</h1>

            <img src="../assets/img/carousel_principal/campeche.jpeg" alt="capacitacion-alfabetizatec">

            <p>Brigadas y círculos de apoyo para reducir el analfabetismo en comunidades indígenas y menonitas.

                CAMPECHE, CAMP. – Con el objetivo de reducir el rezago educativo en comunidades vulnerables, el Instituto Estatal para la Educación de los Adultos (IEEA) ha identificado a los municipios de Calakmul, Candelaria y Hopelchén como las zonas con mayores índices de analfabetismo. En respuesta, se pondrán en marcha 300 círculos de apoyo educativo dirigidos a poblaciones indígenas y menonitas.

                Además, a través del programa AlfabetizaTEC, se han implementado brigadas de alfabetización para capacitar a voluntarios, incluyendo jóvenes que deseen realizar su servicio social en esta iniciativa. Hasta el momento, más de 6,000 personas han logrado obtener su certificado de primaria.

                Si bien la tasa de analfabetismo en el estado ha disminuido del 5.3% al 5%, aún queda un largo camino por recorrer. Se estima que 37,000 personas no saben leer ni escribir, y alrededor de 97,000 no han concluido su educación secundaria.

                Ante este panorama, la estrategia del IEEA busca fortalecer los esfuerzos educativos en el estado, ampliando el alcance de estos programas y asegurando que más personas tengan acceso a oportunidades de aprendizaje.
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