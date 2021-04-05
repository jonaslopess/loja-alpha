<?php 

$mysqli = new mysqli('localhost', 'rank', '', 'loja_alpha');

if ($mysqli->connect_errno) {

    echo "Desculpe, aconteceu algum erro na conexão. :(";
    exit;
}

?>