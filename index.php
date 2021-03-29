<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loja Alpha | Home</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php
    
    require_once 'connection.php';
    require_once 'header.php';

    echo "<div class='conteudo'> <h2>Produtos</h2>";

    $sql = "SELECT nome, preco, quantidade FROM produto WHERE quantidade > 0";

    $result = $mysqli->query($sql);

    if(!$result){
        echo "Desculpe, o site está com problemas.. :(";
        exit;
    }

    if($result->num_rows == 0){
        echo "Desculpe, não há nenhum produto disponível.. :(";
    }

    echo "<ul>\n";
    while($produto = $result->fetch_assoc()){
        echo "<li><strong>".$produto['nome']." - R$ ".$produto['preco'];
        echo " (Quantidade disponível: ".$produto['quantidade'].")</strong></li>";
    }
    echo "</ul>";
    
    echo "</div>";

    $result->free();
    $mysqli->close();    
    ?>
    
</body>
</html>