<?php
session_start();
require_once 'bdd.php';

// Protection : si pas connecté, redirection vers le formulaire
if (!isset($_SESSION['user_id'])) {
    header('Location: Formulaire_vinland.html');
    exit;
}

// ─── FONCTIONS ───────────────────────────────────────────────

function getMediaByType(PDO $bdd, string $nomType): array {
    $stmt = $bdd->prepare("
        SELECT m.id_media, m.titre, m.image, m.progression
        FROM media m
        JOIN type t ON m.id_type = t.id_type
        WHERE t.nom_type = :nom
        ORDER BY m.id_media ASC
    ");
    $stmt->execute(['nom' => $nomType]);
    return $stmt->fetchAll();
}

function getPopulaires(PDO $bdd): array {
    $stmt = $bdd->query("
        SELECT id_media, titre, image, progression
        FROM media
        WHERE populaire = 1
        ORDER BY id_media ASC
    ");
    return $stmt->fetchAll();
}

function getEnCours(PDO $bdd): array {
    $stmt = $bdd->query("
        SELECT id_media, titre, image, progression
        FROM media
        WHERE progression > 0 AND progression < 100
        ORDER BY id_media ASC
    ");
    return $stmt->fetchAll();
}

// ─── DONNÉES ─────────────────────────────────────────────────
$enCours      = getEnCours($bdd);
$populaires   = getPopulaires($bdd);
$animes       = getMediaByType($bdd, 'Animé');
$films        = getMediaByType($bdd, "Film d'animation");
$adultCartoons = getMediaByType($bdd, 'Adult Cartoon');
$cartoons     = getMediaByType($bdd, 'Cartoon');
$series       = getMediaByType($bdd, 'Série');

// ─── HELPERS ─────────────────────────────────────────────────

function renderCards(array $items): void {
    if (empty($items)) {
        echo '<div class="card empty"><div class="card-img-wrapper"></div><p>Bientôt disponible</p></div>';
        return;
    }
    foreach ($items as $item):
        $titre      = htmlspecialchars($item['titre']);
        $image      = htmlspecialchars($item['image']);
        $progression = (int)$item['progression'];
?>
        <a class="card" href="film.php?id=<?= $item['id_media'] ?>">
            <div class="card-img-wrapper">
                <img src="/Image/<?= $image ?>" alt="<?= $titre ?>" loading="lazy">
            </div>
            <div class="progress-bar">
                <span style="width:<?= $progression ?>%"></span>
            </div>
            <div class="card-overlay">
                <div class="play-btn">&#9654;</div>
            </div>
            <p><?= $titre ?></p>
        </a>
<?php
    endforeach;
}

function renderSection(string $titre, array $items, string $id): void { ?>
    <section class="section" id="section-<?= $id ?>">
        <h2><?= htmlspecialchars($titre) ?></h2>
        <div class="carousel-wrapper">
            <button class="carousel-btn prev" onclick="scroll(this, -1)">&#8249;</button>
            <div class="cards" id="<?= $id ?>">
                <?php renderCards($items); ?>
            </div>
            <button class="carousel-btn next" onclick="scroll(this, 1)">&#8250;</button>
        </div>
    </section>
<?php }
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vinland Anime</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="vinland-Anime CSS Version 3.css">
</head>
<body>

<header>
    <button class="menu-icon" id="menuToggle" onclick="toggleMenu()">&#9776;</button>
    <h1>Vinland Anime</h1>
    <div class="user-info">
        Bonjour, <?= htmlspecialchars($_SESSION['prenom']) ?> !
        <a href="deconnexion.php" class="btn-deconnexion">Se déconnecter</a>
    </div>
</header>

<nav id="menu">
    <ul>
        <li><a href="#section-films">Films</a></li>
        <li><a href="#section-series">Séries</a></li>
        <li><a href="#section-animes">Animés</a></li>
        <li><a href="#section-adult">Adult Cartoons</a></li>
        <li><a href="#section-cartoons">Cartoons</a></li>
    </ul>
</nav>

<main>
    <?php renderSection('Reprenez votre visionnage', $enCours,       'carousel-encours'); ?>
    <?php renderSection('Animés populaires',          $populaires,    'carousel-populaires'); ?>
    <?php renderSection('Animés',                     $animes,        'animes'); ?>
    <?php renderSection("Films d'animation",          $films,         'films'); ?>
    <?php renderSection('Adult Cartoons',             $adultCartoons, 'adult'); ?>
    <?php renderSection('Cartoons',                   $cartoons,      'cartoons'); ?>
    <?php renderSection('Séries',                     $series,        'series'); ?>
</main>

<footer>
    <p>&copy; <?= date('Y') ?> — Vinland Anime &middot; Site de streaming</p>
</footer>

<script src="vinland-Anime JavaScript Version 3.js"></script>
</body>
</html>