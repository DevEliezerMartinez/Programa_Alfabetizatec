<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<?php
$user_id = isset($_SESSION['rol_id']) ? $_SESSION['rol_id'] : null; // Obtener el user_id de la sesión
?>

<nav class="layout_header">
    <!-- Logotipos -->
    <img src="../assets/img/logotipos/TecNM_Azteca.png" alt="Logotipo TECNM">
    <img src="../assets/img/logotipos/inea_blanco.png" alt="Logotipo INEA">

    <!-- Menú desplegable -->
    <div class="menu_layout full_center">
        <span>Menu</span>
        <img src="../assets/img/svg/menu.svg" alt="menu icon">
    </div>

    <!-- Opciones del menú -->
    <ul class="dropdown_menu hidden">

        <?php if ($user_id > 2): ?>
            <li class="menu_item back">
                <img src="../assets/img/svg/back.svg" alt="volver icono">
                <a href="#" class="">Volver</a>
            </li>
        <?php endif; ?>


        <!-- Condición para mostrar el item de administrar solo si el user_id es 1 o 2 -->
        <?php if ($user_id == 1): ?>
            <li>
                <img src="../assets/img/svg/user.svg" alt="usuarios icono">
                <a href="./usuarios.php?tipo=regional" class="admin-users">Administrar usuarios</a>
            </li>
        <?php elseif ($user_id == 2): ?>
            <li>
                <img src="../assets/img/svg/user.svg" alt="usuarios icono">
                <a  href="./usuarios.php?tipo=programa" class="admin-users">Administrar usuarios</a>
            </li>
        <?php endif; ?>


        <li class="logout">
            <img src="../assets/img/svg/logout.svg" alt="cerrar icono">
            <a href="#" >Cerrar Sesión</a>
        </li>

        <!-- Mostrar el ítem de cambiar contraseña solo si la sesión tiene contra = true -->
        <?php if (isset($_SESSION['contra']) && $_SESSION['contra'] === 1): ?>
            <li>
                <img src="../assets/img/svg/logout.svg" alt="cambiar contraseña icono">
                <a href="api/auth/cambiar_contrasena.php" class="change-password">Cambiar Contraseña</a>
            </li>
        <?php endif; ?>
    </ul>
</nav>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        // Elementos del DOM
        const menuLayout = document.querySelector('.menu_layout');
        const dropdownMenu = document.querySelector('.dropdown_menu');
        const logoutLink = document.querySelector('.logout');
        const backLink = document.querySelector('.back');

 

        // Mostrar/Ocultar el menú desplegable
        menuLayout.addEventListener('click', () => {
            dropdownMenu.classList.toggle('hidden');
            dropdownMenu.classList.toggle('show');
        });

        // Cerrar sesión
        logoutLink.addEventListener('click', (event) => {
            event.preventDefault(); // Prevenir comportamiento predeterminado

            // Destruir sesión automáticamente y mostrar toast
            Swal.fire({
                toast: true,
                position: 'top-end',
                icon: 'success',
                title: 'Sesión cerrada',
                showConfirmButton: false,
                timer: 1000 // Mostrar el toast durante 2 segundos
            });

            // Redirigir al login después del tiempo del toast
            setTimeout(() => {
                window.location.href = './login.php';
            }, 1200); // Redirigir 1 segundo después del cierre del toast
        });

        // Volver
        backLink.addEventListener('click', (event) => {
            event.preventDefault(); // Prevenir comportamiento predeterminado
            window.history.back(); // Volver a la página anterior
        });

        // Cerrar el menú desplegable al hacer clic fuera
        document.addEventListener('click', (event) => {
            if (!menuLayout.contains(event.target) && !dropdownMenu.contains(event.target)) {
                dropdownMenu.classList.add('hidden');
                dropdownMenu.classList.remove('show');
            }
        });
    });
</script>