<?php
require_once('config.php');
require_once('autorisieren.php');

$userID = $_POST["userID"];
$btID = $_POST["btID"];

$sql = "DELETE FROM beitreage WHERE user_id = ?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$userID]);


if ($erfolg) {

    print_r('Beitrag erfolgreich gelöscht.');
} else {

    print_r('Es ist ein Fehler aufgetreten');
};
