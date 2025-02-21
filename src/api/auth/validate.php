<?php

// Verifica si el usuario está autenticado
if (!isset($_SESSION['correo']) || !isset($_SESSION['rol_id'])) {
    echo "<script>
        Swal.fire({
            icon: 'warning',
            title: 'Sesión Expirada',
            text: 'Por favor, inicia sesión nuevamente.',
            confirmButtonText: 'Aceptar'
        }).then(() => {
            window.location.href = 'login.php';
        });
    </script>";
    exit();
}

// Obtener el rol del usuario
$rol_id = $_SESSION['rol_id'];

// Definir páginas restringidas para ciertos roles
$paginas_restringidas = ['coordinador_nacional.php', 'vista_estado.php', 'Regiones.php'];
$pagina_actual = basename($_SERVER['PHP_SELF']);

// Verificar permisos según el rol
if ($rol_id == 2 || $rol_id == 3) {
    
    // Restringir acceso a ciertas páginas según el rol
    if (in_array($pagina_actual, $paginas_restringidas) || ($rol_id == 3 && $pagina_actual == 'coordinador_regional.php')) {
        echo "<script>
            Swal.fire({
                icon: 'error',
                title: 'Acceso Denegado',
                text: 'No tienes permiso para acceder a esta página.',
                confirmButtonText: 'Aceptar'
            }).then(() => {
                window.location.href = 'login.php';
            });
        </script>";
        exit();
    }

    // Verificar que las variables de sesión necesarias estén definidas
    if ($rol_id == 2) {
        if (!isset($_SESSION['id_region'])) {
            echo "<script>
                Swal.fire({
                    icon: 'warning',
                    title: 'Sesión Incompleta',
                    text: 'Por favor, inicia sesión nuevamente.',
                    confirmButtonText: 'Aceptar'
                }).then(() => {
                    window.location.href = 'login.php';
                });
            </script>";
            exit();
        }
        
        // Validar acceso a vista_region.php según la región
        if ($pagina_actual == 'vista_region.php' && isset($_GET['region'])) {
            $region_actual = $_GET['region'];
            if ($region_actual !== $_SESSION['nombre_region']) {
                echo "<script>
                    Swal.fire({
                        icon: 'error',
                        title: 'Acceso Denegado',
                        text: 'No tienes acceso a esta región.',
                        confirmButtonText: 'Aceptar'
                    }).then(() => {
                        window.location.href = 'login.php';
                    });
                </script>";
                exit();
            }
        }
    }

    if ($rol_id == 3 && !isset($_SESSION['id_tecnologico'])) {
        echo "<script>
            Swal.fire({
                icon: 'warning',
                title: 'Sesión Incompleta',
                text: 'Por favor, inicia sesión nuevamente.',
                confirmButtonText: 'Aceptar'
            }).then(() => {
                window.location.href = 'login.php';
            });
        </script>";
        exit();
    }
}

// Si el rol_id es 1, el usuario tiene acceso a todo y no se necesita verificación adicional
