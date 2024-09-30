<!DOCTYPE html>
<html>
<head>
    <title>Crear Torneo</title>
</head>
<body>
    <h1>Crear Nuevo Torneo</h1>
    <form action="guardarTorneo.php" method="POST">
        <label for="nombreTorneo">Nombre del Torneo:</label>
        <input type="text" id="nombreTorneo" name="nombreTorneo" required><br>

        <label for="fechaTorneo">Fecha del Torneo:</label>
        <input type="date" id="fechaTorneo" name="fechaTorneo" required><br>

        <input type="submit" value="Crear Torneo">
    </form>
</body>
</html>