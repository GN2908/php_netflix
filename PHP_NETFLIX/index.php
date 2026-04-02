<?php
// ─── CONFIG DB ───────────────────────────────────────────────
$host = 'localhost';
$db   = 'vinland_anime';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    die('Connexion échouée : ' . $e->getMessage());
}

// ─── REQUÊTES PAR CATÉGORIE ──────────────────────────────────
function getMediaByCategory(PDO $pdo, string $category): array {
    $stmt = $pdo->prepare(
        "SELECT id, title, thumbnail, video_url, progress
         FROM media
         WHERE category = :cat
         ORDER BY sort_order ASC, id ASC"
    );
    $stmt->execute(['cat' => $category]);
    return $stmt->fetchAll();
}

function getInProgress(PDO $pdo): array {
    $stmt = $pdo->query(
        "SELECT id, title, thumbnail, video_url, progress
         FROM media
         WHERE progress > 0 AND progress < 100
         ORDER BY updated_at DESC"
    );
    return $stmt->fetchAll();
}

// ─── DONNÉES ─────────────────────────────────────────────────
$inProgress  = getInProgress($pdo);
$animes      = getMediaByCategory($pdo, 'anime');
$films       = getMediaByCategory($pdo, 'film');
$adultCartoons = getMediaByCategory($pdo, 'adult_cartoon');
$jeux        = getMediaByCategory($pdo, 'jeux');
$cartoons    = getMediaByCategory($pdo, 'cartoon');
$series      = getMediaByCategory($pdo, 'serie');

// ─── HELPER : génère les cards d'un carousel ─────────────────
function renderCards(array $items): void {
    if (empty($items)) {
        echo '<div class="card empty"><div class="card-img-wrapper"></div><p>Bientôt disponible</p></div>';
        return;
    }
    foreach ($items as $item):
        $title    = htmlspecialchars($item['title'] ?? '');
        $thumb    = htmlspecialchars($item['thumbnail'] ?? '');
        $videoUrl = htmlspecialchars($item['video_url'] ?? '#');
        $progress = (int)($item['progress'] ?? 0);
?>
        <a class="card" href="<?= $videoUrl ?>">
            <div class="card-img-wrapper">
                <?php if ($thumb): ?>
                    <img src="<?= $thumb ?>" alt="<?= $title ?>" loading="lazy">
                <?php endif; ?>
            </div>
            <div class="progress-bar"><span style="width:<?= $progress ?>%"></span></div>
            <div class="card-overlay"><div class="play-btn">&#9654;</div></div>
            <p><?= $title ?></p>
        </a>
<?php
    endforeach;
}

// ─── HELPER : génère un carousel complet ─────────────────────
function renderSection(string $title, array $items, string $id): void { ?>
    <section class="section" id="section-<?= $id ?>">
        <h2><?= htmlspecialchars($title) ?></h2>
        <div class="carousel-wrapper">
            <button class="carousel-btn prev" data-dir="-1">&#8249;</button>
            <div class="cards" id="<?= $id ?>">
                <?php renderCards($items); ?>
            </div>
            <button class="carousel-btn next" data-dir="1">&#8250;</button>
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
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=DM+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<header>
    <button class="menu-icon" id="menuToggle" aria-label="Menu">&#9776;</button>
    <h1>Vinland Anime</h1>
</header>

<nav id="menu">
    <ul>
        <li><a href="?cat=film">Films</a></li>
        <li><a href="?cat=serie">Séries</a></li>
        <li><a href="?cat=anime">Animés</a></li>
        <li><a href="?cat=adult_cartoon">Adult Cartoons</a></li>
        <li><a href="?cat=cartoon">Cartoons</a></li>
        <li><a href="?cat=jeux">Jeux-Vidéo</a></li>
    </ul>
</nav>

<main>
    <?php renderSection('Reprenez votre visionnage', $inProgress,      'carousel-continue'); ?>
    <?php renderSection('Animés populaires',         $animes,          'carousel-animes'); ?>
    <?php renderSection("Films d'animation",         $films,           'carousel-films'); ?>
    <?php renderSection('Adult Cartoons',            $adultCartoons,   'carousel-adult'); ?>
    <?php renderSection('Jeux-Vidéo',                $jeux,            'carousel-jeux'); ?>
    <?php renderSection('Cartoons',                  $cartoons,        'carousel-cartoons'); ?>
    <?php renderSection('Séries',                    $series,          'carousel-series'); ?>
</main>

<footer>
    <p>&copy; <?= date('Y') ?> &mdash; Vinland Anime &middot; Site de streaming</p>
</footer>

<script src="main.js"></script>
</body>
</html>