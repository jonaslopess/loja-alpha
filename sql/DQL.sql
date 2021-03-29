select * from produto;

SELECT SUM(produto.preco * pedido*quantidade) AS valor_compra
FROM pedido
JOIN produto
ON pedido.nome_produto = produto.nome
WHERE pedido.email_cliente = "jose@g.com";

USE loja_alpha;

SELECT valor_compra("jose@g.com"); 

