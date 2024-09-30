<?php
class Usuario extends Orm {
    public function __construct(PDO $conexion) {
        parent::__construct('usuario_id', 'usuarios', $conexion);
    }
}