<?php
    class Orm{
        protected $id;
        protected $table;
        protected $db;

        public function __construct($id, $table, PDO $conexion){

            $this->id = $id;
            $this->table = $table;
            $this->db = $conexion;
        }

        public function getAll(){
            $stm = $this->db->prepare("SELECT * FROM {$this->table}");
            $stm->execute();
            return $stm->fetchAll();
        }

        public function getUserByName($usuario){
            $stm = $this->db->prepare("SELECT * FROM {$this->table} WHERE usuario = :usuario");
            $stm->execute(array(":usuario" => $usuario));
            return $stm->fetch(PDO::FETCH_ASSOC);
        }

        public function getById($id){
            $stm = $this->db->prepare("SELECT * FROM {$this->table} WHERE id = {$id}");
            $stm->execute();
            return $stm->fetch();
        }
        
        public function getByUserId($id){
            $stm = $this->db->prepare("SELECT * FROM {$this->table} WHERE usuario_id = {$id}");
            $stm->execute();
            return $stm->fetch();
        }

        public function deleteById($id){ //SENTENCIA SQL DELETE
            $stm = $this->db->prepare("DELETE FROM {$this->table} WHERE id = {$id}");
            $stm->execute();
        }

        public function updateById($id, $data){  //SENTENCIA SQL UPDATE
           $sql = " UPDATE clientes SET ";
           foreach ($data as $key => $value) {
                $sql .= "{$key} = :{$key},";
           }

           $sql = trim($sql, ',');
           $sql .= " WHERE id = :id ";

           $stm = $this->db->prepare($sql);
           foreach ($data as $key => $value) {
                $stm->bindValue(":{$key}", $value);
           }
        
           $stm->bindValue(":id", $id);
           $stm->execute();
        }

        public function insertUsuario($usuario, $contrasena) {
            $sql = "INSERT INTO {$this->table} (usuario, contrasena) VALUES (:usuario, :contrasena)";
        
            $stm = $this->db->prepare($sql);
        
            //Bind de los valores
            $stm->bindParam(':usuario', $usuario, PDO::PARAM_STR);
            $stm->bindParam(':contrasena', $contrasena, PDO::PARAM_STR);
        
            try {
                $stm->execute();
                echo "Inserción exitosa.";
            } catch (PDOException $e) {
                echo "Error en la inserción: " . $e->getMessage();
            }
        }
        
        public function insertEA($data){
            $stm = $this->db->prepare("INSERT INTO escuela_alumno (escuela_id, alumno_id) VALUES (:escuela_id, :alumno_id)");
            
            $stm->execute(array(":escuela_id" => $data['escuela_id'], ":alumno_id" => $data['alumno_id']));
            
            return $this->db->lastInsertId();
        }
    }
?>