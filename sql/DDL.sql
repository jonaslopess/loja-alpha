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

insert into cliente(email, nome, telefone, endereco)
values ("jose@g.com","José Silva", "3599887744","Rua das Flores, 66"),
("joaquinaalves@m.com","Joaquina ALves", "35988774411","Rua dos rios, 33");

update cliente set nome = "Joaquim Silva" where email = "j@g.com";

delete from cliente where email = "b@g.com";
delete from produto;

insert into venda (email_cliente, nome_produto, quantidade) 
values ("j@g.com", "Banana", 2),
("j@g.com", "Banana", 2),
("joaquinaalves@m.com", "Banana", 3),
("jose@g.com", "Banana", 1);

insert into venda (email_cliente, nome_produto, quantidade) 
values ("joaquinaalves@m.com", "Banana", 2),
("joaquinaalves@m.com", "Banana", 3);

#DQL - comando de busca
# 1) Dado o e-mail do cliente, como que eu sei quantas compras ele fez?

select count(*) as quantidade_compras from venda where email_cliente = "j@g.com";

# 2) Como que eu sei quantas compras cada cliente fez?
# 2.1) Como eu recupero nome de todos os clientes cadastrados?
select nome from cliente;

# 2.2) Como que eu sei quantas compras cada um desses clientes fez?
select cliente.nome as cliente_nome, count(*) as quantidade_compras 
from venda inner join cliente
on venda.email_cliente = cliente.email
group by cliente.email
order by quantidade_compras desc;

#3) Como eu encapsulo essa query complexa em uma view?
create or replace view vw_rank as
select cliente.nome as cliente_nome, count(*) as quantidade_compras 
from venda inner join cliente
on venda.email_cliente = cliente.email
group by cliente.email
order by quantidade_compras desc;

select * from vw_rank;

#4) Como eu crio um usuário de banco de dados que tem acesso apenas a essa view?
create user 'rank'@'localhost';
show grants for 'rank'@'localhost';
grant select on loja_alpha.vw_rank to 'rank'@'localhost';

#--------------------------------------------------------------

select * from produto;
select * from cliente;
select * from pedido where email_cliente = "j@g.com";

SELECT nome, preco, quantidade FROM produto WHERE quantidade > 0;

update produto set quantidade = 0 where nome = "Banana";

