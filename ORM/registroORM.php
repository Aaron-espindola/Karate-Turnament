

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="../css/login.css?v=<?php echo time(); ?>">
</head>
<body>
    <div>
    <?php include '../php/header_login.php'; ?>
        <video muted autoplay loop>
            <source src="img/video.mp4" type="video/mp4">
        </video>
        <div class="capa"></div>
    </div>
    
    <div class="caja">
        <section id="intro_login">
            <div id="cajon_login">
                <div id="box_datos">
                    <h1>Registrarse</h1>
                    <form action="registroORM.php" method="POST" id="form_login">
                        <h3>Usuario:</h3>
                        <input type="text" name="usuario" maxlength="16" required><br>
                        <h3>Contraseña:</h3>
                        <input type="password" name="contrasena" maxlength="16" required><br>
                        <input type="submit" value="Registrarse" id="iniciar">
                    </form>
                    <?php
                    require_once(__DIR__ . '/Database.php');
                    require_once(__DIR__ . '/Orm.php');
                    require_once(__DIR__ . '/usuariosORM.php');

                    $database = new Database();
                    $conexion = $database->getConnection();

                    $usuarioModel = new Usuario($conexion);

                    // INSERT PARA USUARIOS
                    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                        $usuario = $_POST['usuario'];
                        $contrasena = password_hash($_POST['contrasena'], PASSWORD_DEFAULT);

                        $usuarioModel->insertUsuario($usuario, $contrasena);

                        header("Location: LoginORM.php");
                    }
                    ?>
                    <p>¿Ya tenes cuenta? <a href="loginORM.php">Iniciar sesión</a></p>
                </div>
                <div id="box_info">
                    <p>Inicia sesión para comenzar a crear tu torneo. Registrate si no tienes una cuenta.</p>
                    <img src="../img/logo.png" alt="Jorgito">
                </div>
            </div>
        </section>
        <section id="centrar_orden_box1">
            <div id="orden_box1">
            </div>
        </section>
        
        <div id="sec1">
        </div>
        
    </div>
    <footer id="pie">
        <div>
            <p>Texto ejemplo</p>
            <p>Texto ejemplo</p>
            <p>Texto ejemplo</p>
        </div>
        <div>
            <p>Texto ejemplo</p>
            <p>Texto ejemplo</p>
            <p>Texto ejemplo</p>
        </div>
    </footer>
</body>
</html>