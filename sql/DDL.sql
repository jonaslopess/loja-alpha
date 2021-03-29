#DDL - comandos de definição
create schema loja_alpha;
use loja_alpha;

create table cliente(
	email varchar(45),
    nome varchar(45),
    telefone varchar(45),
    endereco varchar(90) not null,
    primary key(email)
);

create table produto(
	nome varchar(45),
    preco float default 0,
    quantidade int default 0,
    primary key(nome)
);

create table pedido(
	email_cliente varchar(45),
    nome_produto varchar(45),
    quantidade int default 1,
    foreign key(email_cliente) references cliente(email),
    foreign key(nome_produto) references produto(nome),
    primary key(email_cliente, nome_produto)
);

create table venda(
	id int auto_increment,
    email_cliente varchar(45),
    nome_produto varchar(45),
    quantidade int default 1,
    foreign key(email_cliente) references cliente(email),
    foreign key(nome_produto) references produto(nome),
    primary key(id)
);

create user 'admlojaalpha'@'localhost' identified by '*Adm1234';
grant all on loja_alpha.* to 'admlojaalpha'@'localhost';
show grants for 'admlojaalpha'@'localhost';

create user 'estoque'@'localhost' identified by '*ALPHAestoque2225';
grant select, insert, update, delete on loja_alpha.produto to 'estoque'@'localhost';
show grants for 'estoque'@'localhost';

create user 'venda'@'localhost' identified by '*ALPHAvenda2225';
grant select, insert, update, delete on loja_alpha.venda to 'venda'@'localhost';
show grants for 'venda'@'localhost';

#DML - comandos de manipulação
insert into cliente(email, nome, telefone, endereco)
values ("j@g.com","joaquim", "3599885544","rua b, 42");

update cliente set nome = "Joaquim Silva" where email = "j@g.com";

delete from cliente where email = "b@g.com";
delete from produto;

#DQL - comando de busca
select nome,telefone from cliente;

select * from produto;
select * from pedido where email_cliente = "j@g.com";

SELECT nome, preco, quantidade FROM produto WHERE quantidade > 0;

update produto set quantidade = o where nome = "Banana";

