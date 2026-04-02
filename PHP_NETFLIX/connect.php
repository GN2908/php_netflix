<?php
include('id.php');
try {
    $dbh = new PDO('mysql:host=localhost;dbname=Netflix', $user, $pass);
    echo "Connexion réussie !";
} catch (PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage();
}