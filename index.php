<?php
require_once __DIR__ . '/vendor/autoload.php';
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TecNM - INEA Alfabetizatec</title>
    <link rel="shortcut icon" href="./assets/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./assets/css/root.css">
    <link rel="stylesheet" href="./assets/css/index.css">
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
</head>

<body>
    <header class="principal_header">
        <div class="logo_dinamico">
            <img src="./assets/img/logotipos/blanco.png" alt="Logotipo Alfabetizatec">
            <div class="text">
                <p> Programa Nacional</p>
                <p>Alfabetizatec</p>
            </div>
        </div>
        <img src="./assets/img/logotipos/TecNM_Azteca.png" alt="Logotipo TECNM">
        <img src="./assets/img/logotipos/inea_blanco.png" alt="Logotipo INEA">
    </header>
    <main>
        <div class="hero">
            <div class="content">
                <h1>¡Bienvenido al arranque del programa AlfabetizaTEC! </h1>
                <p>Una iniciativa del TecNM y el INEA, que busca transformar vidas mediante la alfabetización y la conclusión de estudios básicos para personas mayores de 15 años.</p>

                <div class="cta">
                    <button id="convocatoria">Descárga la convocatoria </button>
                    <button id="referencia">Marco de Referencia del programa</button>
                    <button id="acceso">Acceso</button>
                </div>
            </div>
        </div>

        <section class="bienvenida">
            <h2>Mensaje de bienvenida</h2>
            <video controls>
                <source src="./assets/videos/final_alfabetizatec.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </section>


        <section>
            <h2 class="titulo_land">
                𝐈𝐧𝐢𝐜𝐢𝐚 𝐞𝐥 𝐏𝐫𝐨𝐠𝐫𝐚𝐦𝐚 𝐀𝐥𝐟𝐚𝐛𝐞𝐭𝐢𝐳𝐚𝐓𝐞𝐜 𝐞𝐧 𝐞𝐥 𝐈𝐧𝐬𝐭𝐢𝐭𝐮𝐭𝐨 𝐓𝐞𝐜𝐧𝐨𝐥𝐨́𝐠𝐢𝐜𝐨 𝐝𝐞 𝐓𝐢𝐳𝐢𝐦𝐢́𝐧
            </h2>

            <div class="row">
                <div class="izq">
                    <img src="./assets/img/carousel_principal/6.jpg" alt="Enseñanza imagen">
                </div>
                <div class="texto">
                    <p>
                        <strong>30 de Enero.-</strong> En el marco de la firma del convenio de colaboración entre el
                        Tecnológico Nacional de México (TecNM) y el Instituto Nacional para la Educación de los Adultos (INEA),
                        encabezados por el profesor Ramón Jiménez López y Armando Contreras Castillo, respectivamente, se anunció
                        una iniciativa clave para combatir el rezago educativo en el país. Actualmente, se estima que 27 millones
                        de personas no han concluido la secundaria y casi 5 millones son analfabetas.
                    </p>

                    <p>
                        Este esfuerzo se alinea con la propuesta de la presidenta de México, Claudia Sheinbaum Pardo, de declarar
                        <strong>"Bandera Blanca"</strong> en 2026, lo que significa reducir la tasa de analfabetismo a menos del 4%
                        de la población, conforme a los parámetros de la ONU. En este contexto, surge la convocatoria para el
                        Programa Nacional AlfabetizaTec ("Brigadas TecNM en Movimiento Nacional por la Alfabetización"), el cual
                        busca involucrar a los estudiantes como agentes de cambio en sus comunidades, brindando enseñanza a adultos
                        que no han tenido la oportunidad de aprender a leer y escribir.
                    </p>


                </div>



                <div>
                    <h3>📌 Modalidades de participación en AlfabetizaTec:</h3>
                    <ul>
                        <li><strong>1. Construyendo tu Servicio Social en AlfabetizaTec:</strong> Dirigido a estudiantes de 1º a 7º semestre.</li>
                        <li><strong>2. Servicio Social Comunitario:</strong> Para estudiantes con al menos el 70% de los créditos aprobados.</li>
                        <li><strong>3. Créditos complementarios:</strong> Oportunidad para obtener puntos complementarios.</li>
                        <li><strong>4. Constancia con Valor Curricular:</strong> Certificación oficial que acredita experiencia para el currículum.</li>
                        <li><strong>5. Diploma de Participación Honorífica:</strong> Reconocimiento por la labor comunitaria en el programa.</li>
                    </ul>

                    <p>
                        El evento de lanzamiento se llevó a cabo en el Auditorio 2 de la Institución, con la presencia del director del
                        Tecnológico de Tizimín, Baltazar Loría Avilés; la coordinadora del Instituto de Educación para Adultos del Estado
                        de Yucatán en Tizimín, Alejandra del Mar Tun Jiménez; la responsable del programa en la institución,
                        Mtra. Mayra Mendoza Lagunes; así como subdirectores, personal directivo y docentes.
                    </p>

                    <p><strong>#TransformamosLaEducación</strong></p>
                </div>
            </div>





        </section>

        <div class="home_cards">
            <div class="card_landing">
                <img src="./assets/img/capacitacion-alfabetizatec.png" alt="Noticia tec">
                <h4>Capacitación AlfabetizaTEC en el TecNM – Tijuana</h4>
                <span>El TecNM Tijuana promueve la alfabetización y la educación, acreditando conocimientos clave en la comunidad.</span>
                <a href="./blog/Avances.php" class="cta"><button type="button">Explorar</button></a>
            </div>

            <div class="card_landing">
                <img src="./assets/img/carousel_principal/impulsando.jpeg" alt="Noticia tec">
                <h4>Estudiantes y maestros del Tec de Piedras Negras por la educación</h4>
                <span>Un esfuerzo conjunto para reducir el rezago educativo y fomentar el acceso a la educación en Coahuila.</span>
                <a href="./blog/Impulsando.php" class="cta"><button type="button">Explorar</button></a>
            </div>

            <div class="card_landing">
                <img src="./assets/img/carousel_principal/tec1.png" alt="Noticia tec">
                <h4>Reduciendo el analfabetismo en Campeche</h4>
                <span>Brigadas educativas y círculos de apoyo impulsan la alfabetización en comunidades menonitas e indígenas.</span>
                <a href="./blog/Campeche.php" class="cta"><button type="button">Explorar</button></a>
            </div>

            <div class="card_landing">
                <img src="./assets/img/carousel_principal/tec1.png" alt="Noticia tec">
                <h4>Arranca el Programa de Alfabetización en San Pedro Pochutla</h4>
                <span>Estudiantes y autoridades locales unen esfuerzos para ofrecer educación a quienes más lo necesitan.</span>
                <a href="./blog/Arranque.php" class="cta"><button type="button">Explorar</button></a>
            </div>
        </div>





    </main>

    <footer>
        <?php include('./src/layout/footer.php') ?>
    </footer>

    <!-- Include Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script>
        // Seleccionar el botón por su ID
        const accesoButton = document.getElementById('acceso');

        // Agregar un evento al hacer clic
        accesoButton.addEventListener('click', () => {
            // Redirigir al archivo login.php
            window.location.href = './src/login.php';
        });



        // Seleccionamos el botón por su ID
        const button = document.getElementById('convocatoria');

        // Añadimos un evento de clic al botón
        button.addEventListener('click', () => {
            // Redirigimos al archivo PDF
            window.location.href = 'assets/pdf/CONVOCATORIA_AlfabetizaTEC.pdf';
        });

        // Seleccionamos el botón por su ID
        const buttonReferencia = document.getElementById('referencia');

        // Añadimos un evento de clic al botón referencia
        buttonReferencia.addEventListener('click', () => {
            // Redirigimos al archivo PDF de Marco de Referencia
            window.location.href = 'assets/pdf/Marco.pdf';
        });
    </script>
</body>

</html>