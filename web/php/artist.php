<?php
require('config.php');
require('autorisieren.php');

$user = $_POST["user"];

$profilbild = $_POST["profilbild"];
$name = $_POST["name"];
$email = $_POST["email"];
$beschreibung = $_POST["beschreibung"];
$links = $_POST["links"];
$kanton = $_POST["kanton"];
$status = $_POST["status"];


$sql = "INSERT INTO beitreage (profilbild, name, email, beschreibung, links, kanton, status, user_id) VALUES (:Profilbild, :Name, :Email, :Beschreibung, :Links, :Kanton, :Status, :User_id)";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute(array('Profilbild' => $profilbild, 'Name' => $name, 'Email' => $email, 'Beschreibung' => $beschreibung, 'Links' => $links, 'Kanton' => $kanton, 'Status' => $status, 'User_id' => $user));

if ($erfolg) {
    echo "Beitrag erfolgreich hinzugefügt!";
} else {

    print_r('Es ist ein Fehler aufgetreten');
}
