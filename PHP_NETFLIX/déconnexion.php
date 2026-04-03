<?php
session_start();
session_destroy();
header('Location: Formulaire_vinland.html');
exit;