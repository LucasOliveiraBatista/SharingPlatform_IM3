<?php

require('config.php');

$email = $_POST["email"];
$password = $_POST["password"];

$sql = "SELECT * FROM user WHERE email = '$email'";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $anzahlREsultate = count($array);

        
    if($anzahlREsultate == 1){

    $dbPassword = $array[0]['password'];
    $UserID = $array[0]['ID'];

    pruefepassword($password, $dbPassword, $UserID);

    } else {

        //echo "Dieser Email existiert nicht.";
        sendeAntwort('Diese Email existiert nicht.', 0, 0);

    }
}

function pruefepassword($userpassword, $dbPassword, $UserID){

    if (password_verify($userpassword, $dbPassword)) {

        erstelleToken($UserID);

        //echo 'E-amil and Password super!';

    } else {

        //echo 'Ungültiges password.';
        sendeAntwort('Ungültiges password.', 0, 0);

    }

}

function erstelleToken($UserID){

    require('config.php');

    $token = generateRandomString(42);
    
    $sql = "INSERT INTO session (User_ID, Token) VALUES (:User_ID, :Token);";
    
    $stmt = $pdo->prepare($sql);
    
    $erfolg = $stmt->execute(array('User_ID' => $UserID, 'Token' => $token));
    
    if ($erfolg) {
    
        //print_r('Session Gut.');
        sendeAntwort('Session Gut.', $UserID, $token);

    } else {
    
        print_r($erfolg);

        sendeAntwort('Datenbankfehler meine Freunde: ' . $erfolg, 0, 0);
    };

}

function generateRandomString($length)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}


function sendeAntwort($nachricht, $UserID, $token){

    $anwort = [$nachricht, $UserID, $token];

    $anwort = json_encode($anwort);

    print($anwort);


}





//  AND password = '$password'