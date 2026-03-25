# php_netflix

Ce projet est développé en **PHP** et utilise **XAMPP** comme environnement local de développement sur **Windows**. Il permet de créer, tester et gérer des fichiers PHP avec une base de données MySQL.

---

## I. Démarrage

1. **Lancer XAMPP**
   - Ouvrir le **XAMPP Control Panel**.
   - Démarrer **Apache** (serveur web) et **MySQL** (base de données).

2. **Accéder aux services**
   - Pour tester les pages PHP : ouvrir un navigateur et taper `http://localhost/`.
   - Pour gérer la base de données : accéder à **phpMyAdmin** via `http://localhost/phpmyadmin/`.

3. **Stocker les fichiers PHP**
   - Placer vos fichiers PHP dans le dossier **`htdocs`** de XAMPP, généralement :  
     ```
     C:\xampp\htdocs\MonProjet
     ```

---

## II. Coder sereinement

1. **Éviter de coder directement sur le disque C:**
   - Les fichiers sur C: peuvent être supprimés accidentellement par d'autres utilisateurs ou par le système.

2. **Utiliser Git et GitHub pour sauvegarder son travail**
   - Créer un dépôt **GitHub** en ligne :
     1. Se connecter à [GitHub](https://github.com/).
     2. Cliquer sur **New repository**.
     3. Donner un nom au projet et créer le dépôt.
   
   - **Cloner le dépôt** sur votre ordinateur :
     ```bash
     git clone <URL_DU_DEPOT>
     ```
     > Remplacez `<URL_DU_DEPOT>` par l’URL du dépôt GitHub que vous venez de créer.
   
   - **Travailler sur vos fichiers** dans le dossier cloné.
   
   - **Ajouter vos modifications et faire un commit** :
     ```bash
     git add .
     git commit -m "Ajout des fichiers du projet"
     ```
   
   - **Envoyer vos changements vers GitHub** :
     ```bash
     git push 
     ```

> Astuce : Faites des commits fréquents pour ne jamais perdre votre travail et garder l’historique de vos modifications.

---

## III. Tester ses fichiers

1. Placer le fichier PHP dans le dossier du projet cloné (`htdocs/MonProjet`).

2. Ouvrir un navigateur et accéder à : 
(http://localhost/MonProjet/nom_du_fichier.php)

3. Vérifier que la page s’affiche correctement et que la connexion à la base de données fonctionne si nécessaire.

---

> Conseil général : Toujours sauvegarder avant de fermer XAMPP et faire des commits réguliers pour éviter toute perte de données.


---

*Généré par IA, le 04/02/2026.*
