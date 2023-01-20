<?php

require('config.php');

$email = $_POST["email"];
$username = $_POST["username"];
$password1 = $_POST["password1"];
$password2 = $_POST["password2"];
$error = false;

usernameAbfrage($error, $username);


if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    echo 'Bitte eine gültige E-Mail-Adresse eingeben<br>';
    $error = true;
} else {

    emailAbfrage($email);
}
if (strlen($password1) == 0) {
    echo 'Bitte ein Passwort angeben<br>';
    $error = true;
}
if ($password1 != $password2) {
    echo 'Die Passwörter müssen übereinstimmen<br>';
    $error = true;
}

eintragErstellen($error, $password1, $username, $email);

function usernameAbfrage($error, $username)
{

    require('config.php');

    if (!$error) {
        $statement = $pdo->prepare("SELECT * FROM user WHERE name = :Name");
        $result = $statement->execute(array('Name' => $username));
        $user = $statement->fetch();

        if ($user !== false) {
            echo 'Dieser Username ist bereits vergeben<br>';
            global $error;
            $error = true;
        }

    }
}


function emailAbfrage($email)
{

    require('config.php');

    
        $statement = $pdo->prepare("SELECT * FROM user WHERE email = :Email");
        $result = $statement->execute(array('Email' => $email));
        $user = $statement->fetch();

        if ($user !== false) {
            echo 'Diese E-Mail-Adresse ist bereits vergeben<br>';
            global $error;
            $error = true;
    } 

}
function eintragErstellen($error, $password1, $username, $email)
{
    require('config.php');

    if(!$error){
    $password1 = password_hash($password1, PASSWORD_DEFAULT);

        $sql = "INSERT INTO user (name, email, password) VALUES (:Name, :Email, :Password)";

        $stmt = $pdo->prepare($sql);

        $erfolg = $stmt->execute(array('Name' => $username, 'Email' => $email, 'Password' => $password1));

        if ($erfolg) {
           echo "Registrierung erfolgreich! <br> <a href= ../login.html> Hier geht's weiter</a>";
        } else {

            print_r('Es ist ein Fehler aufgetreten');
        }
    }
}

