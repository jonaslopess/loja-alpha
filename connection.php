<?php 

$mysqli = new mysqli('localhost', 'estoque', '*ALPHAestoque2225', 'loja_alpha');

if ($mysqli->connect_errno) {

    echo "Desculpe, aconteceu algum erro na conexão. :(";
    exit;
}

?>