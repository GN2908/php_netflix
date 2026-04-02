-- ============================================================
--  BASE DE DONNÉES : vinland_anime
--  Généré depuis Vinland Anime Version 3
--  Compatible phpMyAdmin — encodage UTF-8
-- ============================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS vinland_anime
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE vinland_anime;

-- ============================================================
--  TABLE : type
--  Catégorie du contenu (Animé, Film, Cartoon, Série...)
-- ============================================================
DROP TABLE IF EXISTS type;
CREATE TABLE type (
    id_type     INT          NOT NULL AUTO_INCREMENT,
    nom_type    VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id_type),
    UNIQUE KEY uq_nom_type (nom_type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO type (id_type, nom_type) VALUES
    (1, 'Animé'),
    (2, 'Film d\'animation'),
    (3, 'Adult Cartoon'),
    (4, 'Cartoon'),
    (5, 'Série');

-- ============================================================
--  TABLE : genre
--  Genre du contenu (Action, Romance, Horreur...)
-- ============================================================
DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
    id_genre    INT          NOT NULL AUTO_INCREMENT,
    nom_genre   VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id_genre),
    UNIQUE KEY uq_nom_genre (nom_genre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO genre (id_genre, nom_genre) VALUES
    (1,  'Action'),
    (2,  'Aventure'),
    (3,  'Fantasy'),
    (4,  'Romance'),
    (5,  'Horreur'),
    (6,  'Science-Fiction'),
    (7,  'Drame'),
    (8,  'Comédie'),
    (9,  'Mystère'),
    (10, 'Psychologique'),
    (11, 'Historique'),
    (12, 'Musique'),
    (13, 'Super-héros'),
    (14, 'Thriller'),
    (15, 'Crime');

-- ============================================================
--  TABLE : media
--  Tous les contenus présents sur le site
-- ============================================================
DROP TABLE IF EXISTS media;
CREATE TABLE media (
    id_media        INT           NOT NULL AUTO_INCREMENT,
    titre           VARCHAR(150)  NOT NULL,
    image           VARCHAR(255)  NOT NULL,
    id_type         INT           NOT NULL,
    progression     TINYINT       NOT NULL DEFAULT 0 COMMENT 'Pourcentage de visionnage (0-100)',
    populaire       TINYINT(1)    NOT NULL DEFAULT 0 COMMENT '1 = affiché dans Animés populaires',
    PRIMARY KEY (id_media),
    FOREIGN KEY (id_type) REFERENCES type(id_type) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -------- Animés (section "Reprenez votre visionnage") --------
INSERT INTO media (id_media, titre, image, id_type, progression, populaire) VALUES
    (1,  'Vinland Saga',           'Vinland-Saga 4.jpeg',                  1, 62, 0),
    (2,  'Tensura Slime',          'tensei shitara slime datta ken.jpg',    1, 30, 0),
    (3,  'Highschool of the Dead', 'highschool of the dead.jpg',            1, 80, 0),
    (4,  'Demon Slayer',           'demon slayer.jpg',                      1, 45, 0),
    (5,  'Violet Evergarden',      'violet evergarden.jpg',                 1, 55, 0),
    (6,  'Erased',                 'erased.jpg',                            1, 90, 0),
    (7,  'Re:Zero',                'rezero2.jpg',                           1, 20, 0),
    (8,  'The Promised Neverland', 'The promised neverland.png',            1, 60, 0),
    (9,  'Samurai Champloo',       'Samurai Champloo 2.jpeg',               1, 40, 0),
    (10, 'Michiko To Hatchin',     'Michiko to Hatchin.jpeg',               1, 40, 0),
    (11, 'Charlotte',              'charlotte.jpeg',                        1, 10, 0),
    (12, 'Wistoria',               'Wistoria.jpeg',                         1, 60, 0),
    (13, 'Tengoku Daimakyou',      'Tengoku Daimakyou.webp',                1, 40, 0),
    (14, 'Arcane',                 'Arcane.jpeg',                           1, 40, 0);

-- -------- Animés populaires --------
INSERT INTO media (id_media, titre, image, id_type, progression, populaire) VALUES
    (15, 'Fairy Tail',              'Fairy Tail.png',                            1, 80, 1),
    (16, 'Black Clover',            'Black-Clover 2.png',                        1, 80, 1),
    (17, 'Tokyo Ghoul',             'Tokyo Ghoul.jpeg',                          1, 80, 1),
    (18, 'Cyberpunk Edgerunners',   'Cyberpunk_Edgerunners_Trigger_2.webp',      1, 80, 1),
    (19, 'L\'Attaque Des Titans',   'l\'attaque_des_titans_4.webp',              1, 80, 1),
    (20, 'Jojo\'s Bizarre Adventure','jojo\'s bizzare adventure part 5.webp',   1, 80, 1),
    (21, 'One Piece',               'One piece wano.webp',                       1, 80, 1),
    (22, 'Boruto',                  'boruto.webp',                               1, 80, 1),
    (23, 'Gachiakuta',              'Gachiakuta.jpg',                            1, 80, 1);

-- -------- Films d'animation --------
INSERT INTO media (id_media, titre, image, id_type, progression, populaire) VALUES
    (24, 'Your Name',                         'yourname 2.jpg',                          2, 40, 0),
    (25, 'Tenki No Ko',                       'Tenki No Ko.jpeg',                        2, 40, 0),
    (26, 'I Want to Eat Your Pancreas',       'i want to eat your pancreas.jpeg',        2, 40, 0),
    (27, '5 Centimeters Per Second',          '5 cm per seconds.jpeg',                   2, 40, 0),
    (28, 'Spiderman Across the Spider-Verse', 'spiderman across the spider-verse.jpeg',  2, 40, 0),
    (29, 'Entergalactic',                     'Entergalactic.webp',                      2, 40, 0),
    (30, 'Silent Voice',                      'Silent_Voice.webp',                       2, 30, 0),
    (31, 'Le Voyage de Chihiro',              'Le Voyage de Chihiro.jpeg',               2, 40, 0);

-- -------- Adult Cartoons --------
INSERT INTO media (id_media, titre, image, id_type, progression, populaire) VALUES
    (32, 'Rick Et Morty',       'Rick Et Morty2.webp',      3, 40, 0),
    (33, 'Final Space',         'Final_Space.webp',          3, 40, 0),
    (34, 'Désenchantée',        'Disanchantment.jpeg',       3, 40, 0),
    (35, 'BoJack Horseman',     'BoJack_Horseman.jpeg',      3, 40, 0),
    (36, 'Inside Job',          'Inside Job.jpeg',           3, 40, 0),
    (37, 'Close Enough',        'Close Enough.jpeg',         3, 40, 0),
    (38, 'Solar Opposites',     'Solar Opposites.webp',      3, 40, 0),
    (39, 'Invincible',          'Invincible2.jpeg',          3, 40, 0),
    (40, 'Les Simpsons',        'Les Simpsons.webp',         3, 40, 0),
    (41, 'Family Guy',          'Family guy.jpeg',           3, 40, 0),
    (42, 'The Cleveland Show',  'The Cleveland Show.jpeg',   3, 40, 0);

-- -------- Cartoons --------
INSERT INTO media (id_media, titre, image, id_type, progression, populaire) VALUES
    (43, 'Gravity Falls',                   'Gravity Falls.jpeg',                       4, 40, 0),
    (44, 'Steven Universe',                 'Steven Universe.jpeg',                     4, 40, 0),
    (45, 'Le Monde Incroyable de Gumball',  'le monde incroyable de gumball.jpeg',      4, 40, 0),
    (46, 'Teen Titans Go',                  'Teen Titans Go.jpeg',                      4, 40, 0),
    (47, 'Adventure Time',                  'Adventure_Time_.png',                      4, 40, 0),
    (48, 'Regular Show',                    'Regular Show.jpeg',                        4, 40, 0),
    (49, 'Craig De La Crique',              'Craig de la crique.jpeg',                  4, 40, 0),
    (50, 'We Bare Bears',                   'We Bare Bears.jpeg',                       4, 40, 0),
    (51, 'Bienvenue Chez Les Louds',        'Bienvenue Chez Les Louds.jpeg',            4, 40, 0),
    (52, 'Bienvenue Chez Les Casagrandes',  'Bienvenue Chez Les Casagrandes.jpeg',      4, 40, 0),
    (53, 'Tom Et Jerry',                    'tom_et_jerry.webp',                        4, 40, 0),
    (54, 'Magic',                           'Magic.jpeg',                               4, 40, 0),
    (55, 'Angelo La Débrouille',            'Angelo La Débrouille.jpeg',                4, 40, 0),
    (56, 'Mes Parrains Sont Magiques',      'Mes Parrains Sont Magiques.jpeg',          4, 40, 0),
    (57, 'Oscar Et Malika',                 'Oscar Et Malika.jpeg',                     4, 40, 0),
    (58, 'Jamie A Des Tentacules',          'Jamie A Des TenTacules.jpeg',              4, 40, 0),
    (59, 'Rekkit',                          'Rekkit..avif',                             4, 40, 0);

-- -------- Séries --------
INSERT INTO media (id_media, titre, image, id_type, progression, populaire) VALUES
    (60, 'The Chi',             'The_Chi.jpeg',             5, 40, 0),
    (61, 'On My Block',         'On My Block 2.jpeg',        5, 40, 0),
    (62, 'Bel Air',             'Bel Air 2.jpeg',            5, 40, 0),
    (63, 'Swagger',             'Swagger.webp',              5, 40, 0),
    (64, 'Top Boy',             'Top Boy.webp',              5, 40, 0),
    (65, 'BMF',                 'BMF.jpeg',                  5, 40, 0),
    (66, 'Snowfall',            'Snowfall.webp',             5, 40, 0),
    (67, 'Outer Banks',         'Outer Banks.jpeg',          5, 40, 0),
    (68, 'You',                 'You.jpeg',                  5, 40, 0),
    (69, 'Lupin',               'Lupin 3.jpeg',              5, 40, 0),
    (70, 'La Reine Charlotte',  'La Reine Charlotte.webp',   5, 40, 0);

-- ============================================================
--  TABLE : media_genre  (liaison N-N entre media et genre)
-- ============================================================
DROP TABLE IF EXISTS media_genre;
CREATE TABLE media_genre (
    id_media    INT NOT NULL,
    id_genre    INT NOT NULL,
    PRIMARY KEY (id_media, id_genre),
    FOREIGN KEY (id_media) REFERENCES media(id_media)  ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_genre) REFERENCES genre(id_genre)  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Vinland Saga → Action, Aventure, Historique
INSERT INTO media_genre VALUES (1,1),(1,2),(1,11);
-- Tensura Slime → Fantasy, Aventure, Comédie
INSERT INTO media_genre VALUES (2,3),(2,2),(2,8);
-- Highschool of the Dead → Action, Horreur
INSERT INTO media_genre VALUES (3,1),(3,5);
-- Demon Slayer → Action, Fantasy, Aventure
INSERT INTO media_genre VALUES (4,1),(4,3),(4,2);
-- Violet Evergarden → Drame, Romance
INSERT INTO media_genre VALUES (5,7),(5,4);
-- Erased → Mystère, Psychologique, Drame
INSERT INTO media_genre VALUES (6,9),(6,10),(6,7);
-- Re:Zero → Fantasy, Psychologique, Action
INSERT INTO media_genre VALUES (7,3),(7,10),(7,1);
-- The Promised Neverland → Horreur, Mystère, Psychologique
INSERT INTO media_genre VALUES (8,5),(8,9),(8,10);
-- Samurai Champloo → Action, Aventure, Historique, Musique
INSERT INTO media_genre VALUES (9,1),(9,2),(9,11),(9,12);
-- Michiko To Hatchin → Action, Aventure, Drame
INSERT INTO media_genre VALUES (10,1),(10,2),(10,7);
-- Charlotte → Drame, Science-Fiction
INSERT INTO media_genre VALUES (11,7),(11,6);
-- Wistoria → Action, Fantasy, Aventure
INSERT INTO media_genre VALUES (12,1),(12,3),(12,2);
-- Tengoku Daimakyou → Science-Fiction, Mystère, Action
INSERT INTO media_genre VALUES (13,6),(13,9),(13,1);
-- Arcane → Action, Fantasy, Drame
INSERT INTO media_genre VALUES (14,1),(14,3),(14,7);
-- Fairy Tail → Action, Fantasy, Aventure, Comédie
INSERT INTO media_genre VALUES (15,1),(15,3),(15,2),(15,8);
-- Black Clover → Action, Fantasy, Aventure
INSERT INTO media_genre VALUES (16,1),(16,3),(16,2);
-- Tokyo Ghoul → Action, Horreur, Psychologique, Drame
INSERT INTO media_genre VALUES (17,1),(17,5),(17,10),(17,7);
-- Cyberpunk Edgerunners → Action, Science-Fiction, Drame
INSERT INTO media_genre VALUES (18,1),(18,6),(18,7);
-- L'Attaque Des Titans → Action, Drame, Horreur, Mystère
INSERT INTO media_genre VALUES (19,1),(19,7),(19,5),(19,9);
-- Jojo's Bizarre Adventure → Action, Aventure, Psychologique
INSERT INTO media_genre VALUES (20,1),(20,2),(20,10);
-- One Piece → Action, Aventure, Fantasy, Comédie
INSERT INTO media_genre VALUES (21,1),(21,2),(21,3),(21,8);
-- Boruto → Action, Fantasy, Aventure
INSERT INTO media_genre VALUES (22,1),(22,3),(22,2);
-- Gachiakuta → Action, Fantasy, Aventure
INSERT INTO media_genre VALUES (23,1),(23,3),(23,2);
-- Your Name → Romance, Drame, Fantasy
INSERT INTO media_genre VALUES (24,4),(24,7),(24,3);
-- Tenki No Ko → Romance, Drame, Fantasy
INSERT INTO media_genre VALUES (25,4),(25,7),(25,3);
-- I Want to Eat Your Pancreas → Romance, Drame
INSERT INTO media_genre VALUES (26,4),(26,7);
-- 5 Centimeters Per Second → Romance, Drame
INSERT INTO media_genre VALUES (27,4),(27,7);
-- Spiderman Across the Spider-Verse → Action, Aventure, Super-héros
INSERT INTO media_genre VALUES (28,1),(28,2),(28,13);
-- Entergalactic → Romance, Musique, Drame
INSERT INTO media_genre VALUES (29,4),(29,12),(29,7);
-- Silent Voice → Drame, Romance
INSERT INTO media_genre VALUES (30,7),(30,4);
-- Le Voyage de Chihiro → Fantasy, Aventure, Drame
INSERT INTO media_genre VALUES (31,3),(31,2),(31,7);
-- Rick Et Morty → Science-Fiction, Comédie, Aventure
INSERT INTO media_genre VALUES (32,6),(32,8),(32,2);
-- Final Space → Science-Fiction, Comédie, Action
INSERT INTO media_genre VALUES (33,6),(33,8),(33,1);
-- Désenchantée → Fantasy, Comédie
INSERT INTO media_genre VALUES (34,3),(34,8);
-- BoJack Horseman → Drame, Comédie, Psychologique
INSERT INTO media_genre VALUES (35,7),(35,8),(35,10);
-- Inside Job → Science-Fiction, Comédie
INSERT INTO media_genre VALUES (36,6),(36,8);
-- Close Enough → Comédie
INSERT INTO media_genre VALUES (37,8);
-- Solar Opposites → Science-Fiction, Comédie
INSERT INTO media_genre VALUES (38,6),(38,8);
-- Invincible → Action, Super-héros, Drame
INSERT INTO media_genre VALUES (39,1),(39,13),(39,7);
-- Les Simpsons → Comédie
INSERT INTO media_genre VALUES (40,8);
-- Family Guy → Comédie
INSERT INTO media_genre VALUES (41,8);
-- The Cleveland Show → Comédie
INSERT INTO media_genre VALUES (42,8);
-- Gravity Falls → Mystère, Comédie, Aventure
INSERT INTO media_genre VALUES (43,9),(43,8),(43,2);
-- Steven Universe → Fantasy, Action, Aventure
INSERT INTO media_genre VALUES (44,3),(44,1),(44,2);
-- Le Monde Incroyable de Gumball → Comédie
INSERT INTO media_genre VALUES (45,8);
-- Teen Titans Go → Action, Comédie, Super-héros
INSERT INTO media_genre VALUES (46,1),(46,8),(46,13);
-- Adventure Time → Fantasy, Comédie, Aventure
INSERT INTO media_genre VALUES (47,3),(47,8),(47,2);
-- Regular Show → Comédie, Aventure
INSERT INTO media_genre VALUES (48,8),(48,2);
-- Craig De La Crique → Comédie, Aventure
INSERT INTO media_genre VALUES (49,8),(49,2);
-- We Bare Bears → Comédie
INSERT INTO media_genre VALUES (50,8);
-- Bienvenue Chez Les Louds → Comédie
INSERT INTO media_genre VALUES (51,8);
-- Bienvenue Chez Les Casagrandes → Comédie
INSERT INTO media_genre VALUES (52,8);
-- Tom Et Jerry → Comédie, Action
INSERT INTO media_genre VALUES (53,8),(53,1);
-- Magic → Comédie, Fantasy
INSERT INTO media_genre VALUES (54,8),(54,3);
-- Angelo La Débrouille → Comédie
INSERT INTO media_genre VALUES (55,8);
-- Mes Parrains Sont Magiques → Comédie, Fantasy
INSERT INTO media_genre VALUES (56,8),(56,3);
-- Oscar Et Malika → Comédie, Aventure
INSERT INTO media_genre VALUES (57,8),(57,2);
-- Jamie A Des Tentacules → Comédie, Science-Fiction
INSERT INTO media_genre VALUES (58,8),(58,6);
-- Rekkit → Comédie, Aventure
INSERT INTO media_genre VALUES (59,8),(59,2);
-- The Chi → Drame, Crime
INSERT INTO media_genre VALUES (60,7),(60,15);
-- On My Block → Comédie, Drame, Crime
INSERT INTO media_genre VALUES (61,8),(61,7),(61,15);
-- Bel Air → Drame
INSERT INTO media_genre VALUES (62,7);
-- Swagger → Drame, Action
INSERT INTO media_genre VALUES (63,7),(63,1);
-- Top Boy → Crime, Drame, Thriller
INSERT INTO media_genre VALUES (64,15),(64,7),(64,14);
-- BMF → Crime, Drame, Thriller
INSERT INTO media_genre VALUES (65,15),(65,7),(65,14);
-- Snowfall → Crime, Drame, Thriller
INSERT INTO media_genre VALUES (66,15),(66,7),(66,14);
-- Outer Banks → Aventure, Mystère, Drame
INSERT INTO media_genre VALUES (67,2),(67,9),(67,7);
-- You → Thriller, Psychologique, Drame
INSERT INTO media_genre VALUES (68,14),(68,10),(68,7);
-- Lupin → Crime, Mystère, Action
INSERT INTO media_genre VALUES (69,15),(69,9),(69,1);
-- La Reine Charlotte → Romance, Drame, Historique
INSERT INTO media_genre VALUES (70,4),(70,7),(70,11);

-- ============================================================
--  VUES UTILES
-- ============================================================

DROP VIEW IF EXISTS vue_media_complet;
CREATE VIEW vue_media_complet AS
SELECT
    m.id_media,
    m.titre,
    m.image,
    t.nom_type AS type,
    GROUP_CONCAT(g.nom_genre ORDER BY g.nom_genre SEPARATOR ', ') AS genres,
    m.progression,
    m.populaire
FROM media m
JOIN type t ON m.id_type = t.id_type
LEFT JOIN media_genre mg ON m.id_media = mg.id_media
LEFT JOIN genre g ON mg.id_genre = g.id_genre
GROUP BY m.id_media, m.titre, m.image, t.nom_type, m.progression, m.populaire;

DROP VIEW IF EXISTS vue_populaires;
CREATE VIEW vue_populaires AS
SELECT * FROM vue_media_complet WHERE populaire = 1;

-- ============================================================
--  EXEMPLES DE REQUÊTES
-- ============================================================

-- Tous les animés :
-- SELECT * FROM vue_media_complet WHERE type = 'Animé';

-- Tous les contenus d'action :
-- SELECT m.titre, t.nom_type FROM media m
-- JOIN media_genre mg ON m.id_media = mg.id_media
-- JOIN genre g ON mg.id_genre = g.id_genre
-- JOIN type t ON m.id_type = t.id_type
-- WHERE g.nom_genre = 'Action'
-- ORDER BY m.titre;

-- Tous les populaires :
-- SELECT * FROM vue_populaires;

-- Recherche par titre :
-- SELECT * FROM vue_media_complet WHERE titre LIKE '%demon%';

-- Tous les contenus par type :
-- SELECT t.nom_type, COUNT(*) AS total FROM media m
-- JOIN type t ON m.id_type = t.id_type
-- GROUP BY t.nom_type;

SET FOREIGN_KEY_CHECKS = 1;
