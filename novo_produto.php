<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loja Alpha | Novo Produto</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <?php
    require_once 'connection.php';
    require_once 'header.php';

    $mysqli = connect('estoque', '*ALPHAestoque2225', 'loja_alpha');

    function insert($mysqli, $name, $price, $amount){
        $sql = "INSERT INTO produto (nome, preco, quantidade) values ('$name', '$price', '$amount')";

        if( $mysqli->query($sql) === TRUE){
            echo "<div class='alert alert-success'>Produto adicionado com sudesso!</div>";
        }else{
            echo "<div class='alert alert-danger'>Erro: Aconteceu um erro ao adicionar o produto.</div>";
        }

    }


    if(isset($_POST['name']))
    {
        insert($mysqli, $_POST['name'],$_POST['price'],$_POST['amount']);
    } 



    ?>
    <div class="formulario">
        <h2>Novo Produto</h2>
        <form action="" method="post">
        <p>Nome: <input type="text" name="name" /></p>
        <p>Preço: <input type="number" step="0.01" name="price" /></p>
        <p>Quantidade: <input type="number" name="amount" /></p>
        <p><input type="submit" /></p>
        </form>
    </div>

</body>
</html>