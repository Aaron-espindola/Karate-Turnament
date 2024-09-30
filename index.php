<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="css/styles.css?v=<?php echo time(); ?>">
</head>
<body>
    <div>
        <?php include 'php/header.php'; ?>
        <video muted autoplay loop>
            <source src="img/video.mp4" type="video/mp4">
        </video>
        <div class="capa"></div>
    </div>
    
    <div class="caja">
        <section id="intro">
            <h1>
                ¡<span>Zarate-Kid</span>!
            </h1>
            <h2>
                Taekwondo Tournament Manager
            </h2>
            <p>Te brindamos la posibilidad de generar tu torneo con las herramientas necesarias para elegir un potencial ganador. Podes empezar a organizar tu torneo ahora mismo, con un solo click. </p>
            <a href="ORM/LoginORM.php" class="btn"><button>CREAR UN TORNEO</button></a>
        </section>
        <section id="centrar_orden_box1">
            <div id="orden_box1">
                <div class="box1">
                <a href="baku.php" class="btn"><img src="img/baku.png" alt="baku"></a>
                    <div class= "hover-news">
                        <img src="img/pngegg.png" alt="">
                            <p> Ganadores del mundial 2023 </p>
                        </div>
                </div>
                <div class="box1">
                <a href= "ulp.php" class="btn"><img src="img/ulp.jpg" alt="ulp"></a>
                     <div class= "hover-news">
                        <img src="img/pngegg.png" alt="">
                            <p> Capacitacion de arbitral en la ULP </p>
                        </div> 
                </div>
                <div class="box1">
                <a href="selecar.php" class="btn"><img src="img/arg.jpg" alt="arg"></a>
                    <div class= "hover-news">
                        <img src="img/pngegg.png" alt="">
                            <p> Seleccionado argentino hace historia </p>
                        </div>
                </div>
            </div>
        </section>
        
        <div id="sec1">
        </div>
        
    </div>
    <footer id="pie">
        
        <div>
            <p>Fernando Bernal</p>
            <p>Camila Garcia</p>
            <p>Aarón Espíndola</p>

        </div>
    </footer>
</body>
</html>