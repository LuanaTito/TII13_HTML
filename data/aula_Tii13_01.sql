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

--paramos aqui - 20/08/2026 (os aluno inseriram as matriculas sozinhos)