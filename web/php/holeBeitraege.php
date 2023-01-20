<?php

require("config.php");
require("autorisieren.php");

$sql = "
SELECT BT.ID, BT.profilbild, BT.name, BT.email, BT.beschreibung, BT.links, BT.kanton, BT.status, BT.user_id
FROM beitreage BT
";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}