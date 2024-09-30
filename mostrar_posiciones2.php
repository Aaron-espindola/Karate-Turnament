<?php
require_once 'php/conexion.php';
session_start();

// Obtener el ID del usuario que inició sesión
$usuarioId = $_SESSION['usuario_id'];

// Obtener los resultados de los alumnos creados por el usuario, ordenados por puntos
$obtenerResultadosAlumnosQuery = "SELECT * FROM alumnos_resultado WHERE usuario_id = $usuarioId ORDER BY puntos DESC";
$resultadoResultadosAlumnos = $conexion->query($obtenerResultadosAlumnosQuery);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Clasificación de Alumnos</title>
</head>
<body>
    <h1>Clasificación de Alumnos</h1>
    <table>
        <tr>
            <th>Posición</th>
            <th>Nombre</th>
            <th>Edad</th>
            <th>Puntos</th>
        </tr>
        <?php
        if ($resultadoResultadosAlumnos->num_rows > 0) {
            $posicion = 1;
            while ($fila = $resultadoResultadosAlumnos->fetch_assoc()) {
                echo "<tr>";
                echo "<td>$posicion</td>";
                echo "<td>" . $fila['nombre'] . "</td>";
                echo "<td>" . $fila['edad'] . "</td>";
                echo "<td>" . $fila['puntos'] . "</td>";
                echo "</tr>";
                $posicion++;
            }
        } else {
            echo '<p>No se han encontrado alumnos.</p>';
        }
        ?>
    </table>
</body>
</html>