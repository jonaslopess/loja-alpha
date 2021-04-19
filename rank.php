<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loja Alpha | Rank de Compradores</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php
    
    require_once 'connection.php';
    require_once 'header.php';

    $mysqli = connect('rank', '', 'loja_alpha');

    echo "<div class='conteudo'> <h2>Rank de Compradores</h2>";

    $sql = "SELECT * FROM vw_rank";

    $result = $mysqli->query($sql);

    if(!$result){
        echo "Desculpe, o site está com problemas.. :(";
        exit;
    }

    if($result->num_rows == 0){
        echo "Desculpe, não há nenhuma compra registrada.. :(";
    }

    echo "<ul>\n";
    while($rank = $result->fetch_assoc()){
        echo "<li><strong>".$rank['cliente_nome']." - ".$rank['quantidade_compras'];
        echo "</strong></li>";
    }
    echo "</ul>";
    
    echo "</div>";

    $result->free();
    $mysqli->close();
    ?>
    
</body>
</html>