<?php
    if(isset($_GET["error"])){
        if($_GET["error"] == "form"){
            $error = "form";
        }else if($_GET["error"] == "unique"){
            $error = "unique";
        }
    }else{
        $error = "";
    }

    


?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php
        if($error == "form")
            echo "<p id=\"error\"> Le formulaire n'est pas correct </p>";
        if($error == "unique")
            echo "<p id=\"unique\"> Cet email existe déjà.</p>";
    ?>


    <form action= "traitement.php" method="post">
        <label for="pseudo">Pseudonyme</label>
        <input name="pseudo" id="pseudo">

        <label for="prenom">Prénom</label>
        <input name="prenom" id="prenom">

        <label for="nom">Nom</label>
        <input name="nom" id="nom">

        <label for="email">Email</label>
        <input name="email" id="email">

        <label for="pass">Mot de passe</label>
        <input name="pass" id="pass">

        <label for="pass2">Vérification mot de passe</label>
        <input name="pass2" id="pass2">

        <input type="submit" value="Valider">
    </form>

    
</body>
</html>

