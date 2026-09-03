-- criação de banco
create database escola2; 

-- selecionar o banco a ser usado.
USE escola2;

-- criação de tabelas
create table aluno  (
idaluno int(4) auto_increment primary key,
nome_aluno varchar(100) not null,
idade int(3) not null,
serie varchar(20) not null,
cidade varchar(50) not null
);

create table matricula (
idmatricula INT(4) auto_increment primary key, 
idaluno INT(4),
curso varchar(50) not null,
data_matricula date,
foreign key (idaluno) references aluno(idaluno)
);

insert into aluno (nome_aluno, idade, serie, cidade) values
('Bruno Lima', 17, '3º ano','Rio de Janeiro'),
('Amanda Rocha', 14, '8º ano','Belo Horizonte'),
('Marcelo Silva', 13, '7º ano','Curitiba');

INSERT INTO matricula (idaluno, curso, data_matricula) VALUES
(1, 'Matemática', '2024-02-01'),
(1, 'Física', '2024-02-10'),
(2, 'História', '2024-01-20'),
(3, 'Geografia', '2024-02-15'),
(4, 'Química', '2024-01-25');



-- Atualização de dados
update aluno set cidade = 'São Paulo' 
where idaluno = 3;

update matricula set curso = 'Biologia'
where idmatricula = 3;

-- Mudar a serie todos os alunos que moram em SP
update aluno set serie = 'Ensino Fundamental'
where idaluno = 1;
update aluno set serie = 'Ensino Fundamental'
where idaluno = 3;

-- Utilizando o DELETE
Delete from matricula
where idmatricula = 4;

Delete from aluno
where idaluno = 3;

--Trabalhando com o SELECT
--Esta query traz todos os campo da tabela
SELECT * FROM aluno; 

--Para trazer o nome e a cidade dos alunos
SELECT nome_aluno, cidade from aluno;

--Listar todos os alunos com idade maior ou igual a 15 anos
SELECT * from aluno where idade >= 15;

-- Organizar os dados em ordem alfabetica
select nome, email from clientes order by email;

select produto, preco_unidade from produtos;
select produto, preco_unidade * 12 AS duzia from produtos;
select produto, "Esse valor é literal" valor, preco_unidade from produtos;
select 10 * 5 as resultado;
select produto from produtos order by produto;
select produto from produtos order by produto desc;

--produtudo mais caro para o mais barato
select produto, preco_unidade from produtos order by preco_unidade desc;
select nome from clientes order by nome;
select produto, preco_unidade from produtos order by preco_unidade desc;
select * from encomendas order by data_hora desc;
select id, nome, email from clientes limit 10;
select id, nome from clientes limit 5 offset 5;
select id, nome, email from clientes order by id desc limit 10;
select id, nome from clientes limit 10,5;
select * from produtos order by preco_unidade desc limit 1;

-- o Distinct é usado para remover dados duplicados 
select distinct cidade from clientes order by cidade;

--where permite definir confições de registros.
select * from clientes where cidade = "Lisboa"; 
select * from clientes where sexo = "f";
select * from clientes where cidade = "Lisboa" and sexo ="f";

-- o select permite usar o peradores lógicos e operacionais. 
select * from colaboradores where sexo <> "f";
select * from encomendas where data_hora <= "2030-01-02 10:00:00";

-- trabalhando com intervalo de dados 
select * from produtos where preco_unidade between 1 and 2;
select * from produtos where preco_unidade > 1 and preco_unidade < 2 ;

-- IN devolve todos os registros que estejam compreendidos dentro de uma coleção de valores.
select * from clientes where cidade in("Lisboa", "Viseu", "Coimbra");

--LIke 
select nome from clientes where nome like "João%";
select nome from clientes where nome like "Daniel%";
select nome from clientes where nome like "%Silva%";
select nome, email from clientes where email like "%gmail.com";
select nome from clientes where nome like "A%S";
select nome from clientes where nome like "Francisc_%";
select nome from clientes where nome like "__a%";

--selecionar valores NULL
select * from colaboradores where ativo is NULL
--
select * from colaboradores where ativo is NULL;

select *, preco_unidade * 6 as `Preço por dúzia`, 
preco_unidade * 24 as `Duas dúzias` from produtos;

-- junção de tabelas 
select clientes.nome, encomendas.*
from clientes, encomendas
where clientes.id = encomendas.id_cliente limit 5;

select c.nome, e.*
from clientes c, encomendas e
where c.id = e.id_cliente limit 5;

--contagem 
SELECT COUNT(*) AS Total
FROM produtos;

--JOINS 
-- esta query vai devolver os nomes dos clientes, o id e data hora das encomendas em que cada cliente esteve envolvido.

SELECT c.nome, e.id, e.data_hora
from clientes c left JOIN encomendas e
on e.id_cliente = c.id
where c.id = 2;

--quero saber quais colaboradores estiveram envolvidos em cada encomenda.

select c.*, e.*
from colaboradores c left JOIN encomendas e
on c.id = e.id_colaborador

--dados das encomendas do cliente com id =20
SELECT c.*, e.* 
FROM clientes c
LEFT JOIN encomendas e 
ON c.id = e.id_cliente
WHERE c.id = 20

--quero varios detalhes sobre a encomenda 3, como: quando foi efetuada? / que produtos foram comprados? / E a quantidade?  

select
e.data_hora,
p.produto,
ep.quantidade
from encomendas_produtos ep left join encomendas e 
on e.id = ep.id_produto left join produtos p
on p.id = ep.id_produto where e.id = 3;

-- com o preço
select
e.data_hora,
p.produto,
ep.quantidade,
concat(Round(p.preco_unidade * ep.quantidade, 2), ' R$ ') as TOTAL_Compra
from encomendas_produtos ep left join encomendas e 
on e.id = ep.id_produto left join produtos p
on p.id = ep.id_produto where e.id = 3;

