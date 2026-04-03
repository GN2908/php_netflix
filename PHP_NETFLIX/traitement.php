<?php
require_once 'bdd.php';

// Vérification que le formulaire est bien envoyé
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: inscription.php');
    exit;
}

$pseudo = trim($_POST['pseudo'] ?? '');
$prenom = trim($_POST['prenom'] ?? '');
$nom    = trim($_POST['nom'] ?? '');
$email  = trim($_POST['email'] ?? '');
$pass   = $_POST['pass'] ?? '';
$pass2  = $_POST['pass2'] ?? '';

// Vérification des champs vides
if (!$pseudo || !$prenom || !$nom || !$email || !$pass || !$pass2) {
    header('Location: inscription.php?error=form');
    exit;
}

// Vérification mots de passe identiques
if ($pass !== $pass2) {
    header('Location: inscription.php?error=form');
    exit;
}

// Vérification email valide
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    header('Location: inscription.php?error=form');
    exit;
}

// Vérification email unique
$stmt = $bdd->prepare("SELECT id_user FROM users WHERE email = :email");
$stmt->execute(['email' => $email]);
if ($stmt->fetch()) {
    header('Location: inscription.php?error=unique');
    exit;
}

// Hash du mot de passe
$hash = password_hash($pass, PASSWORD_DEFAULT);

// Insertion en base
$stmt = $bdd->prepare("
    INSERT INTO users (pseudo, prenom, nom, email, mot_de_passe)
    VALUES (:pseudo, :prenom, :nom, :email, :mdp)
");
$stmt->execute([
    'pseudo' => $pseudo,
    'prenom' => $prenom,
    'nom'    => $nom,
    'email'  => $email,
    'mdp'    => $hash,
]);

// Redirection vers la connexion
header('Location: index.php?success=inscription');
exit;