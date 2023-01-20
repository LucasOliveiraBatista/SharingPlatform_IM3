<?php

$host = "localhost";
$user = "173662_5_1";
$password = "9kjd0UpBc2F7";
$dbname = "173662_5_1";

$pdo = new PDO('mysql:host='. $host . '; dbname=' . $dbname . ';charset=utf8', $user, $password);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$pdo->exec("set names utf8");
