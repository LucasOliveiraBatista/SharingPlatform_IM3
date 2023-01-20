<?php

require_once('config.php');
require_once('autorisieren.php');

$user = $_POST["userID"];

$profilbild = $_POST["profilbild"];
$name = $_POST["name"];
$email = $_POST["email"];
$beschreibung = $_POST["beschreibung"];
$links = $_POST["links"];
$kanton = $_POST["kanton"];
$status = $_POST["status"];

$btID = $_POST["btID"];

$sql = "UPDATE beitreage SET profilbild=?, name=?, email=?, beschreibung=?, links=?, kanton=?,status=? WHERE user_id=?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$profilbild, $name, $email, $beschreibung, $links, $kanton, $status, $user]);

// falls erfolg true bzw. 1 ist
if ($erfolg) {

    print_r("Beitrag wurde erfolgreich aktualisiert.");

} else {

    print_r($erfolg);

};