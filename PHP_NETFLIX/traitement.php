<?php

    define("UNIQUE", 1062);

    try{
        $bd = new PDO("mysql:host=localhost;dbname=user", "root", "");
    }catch(Exception $e){
        die($e->getMessage());
    }


    $pseudo = htmlspecialchars($_POST["pseudo"]);
    $prenom = $_POST["prenom"];

    $email = $_POST["email"];


        try{
            $sql = 'INSERT INTO user(pseudo, prenom, mail)
            VALUES(:pseudo, :prenom, :email)';
            $req = $bd->prepare($sql);
            $req->bindParam('pseudo', $pseudo, PDO::PARAM_STR);
            $req->bindParam('prenom', $prenom, PDO::PARAM_STR);
            $req->bindParam('email', $email, PDO::PARAM_STR);
            $req->execute();
        }catch(Exception $e){
            if($req->errorInfo()[1] == UNIQUE){
                header("location:inscription.php?error=unique&param2=value");
                die();
            }
        }

    


?>