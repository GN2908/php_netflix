<?php
session_start();
require_once 'bdd.php';

// Vérification que le formulaire est bien envoyé
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: Formulaire_vinland.html');
    exit;
}

$pseudo   = trim($_POST['pseudo'] ?? '');
$password = $_POST['password'] ?? '';

// Vérification champs vides
if (!$pseudo || !$password) {
    header('Location: Formulaire_vinland.html?error=form');
    exit;
}

// Recherche de l'utilisateur en base
$stmt = $bdd->prepare("SELECT * FROM users WHERE pseudo = :pseudo");
$stmt->execute(['pseudo' => $pseudo]);
$user = $stmt->fetch();

// Vérification mot de passe
if (!$user || !password_verify($password, $user['mot_de_passe'])) {
    header('Location: Formulaire_vinland.html?error=identifiants');
    exit;
}

// Création de la session
$_SESSION['user_id']  = $user['id_user'];
$_SESSION['pseudo']   = $user['pseudo'];
$_SESSION['prenom']   = $user['prenom'];

// Redirection vers l'accueil
header('Location: index.php');
exit;