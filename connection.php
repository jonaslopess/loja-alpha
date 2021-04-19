<?php 

function connect($user, $pass, $database){
    $mysqli = new mysqli('localhost', $user, $pass, $database);

    if ($mysqli->connect_errno) {
        return false;
    }
    return $mysqli;
}

?>