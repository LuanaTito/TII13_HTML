<<<<<<< HEAD
O Objetivo é se conceituar as consultas DQL (Linguagem de Consulta de dados)
Criar o banco de dados:

CREATE DATABASE escola;
USE escola;
Criar a tabela alunos:
CREATE TABLE alunos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 idade INT NOT NULL,
 serie VARCHAR(20),
 cidade VARCHAR(50)
);

Criar a tabela matriculas:
CREATE TABLE matriculas (
 id_matricula INT AUTO_INCREMENT PRIMARY KEY,
 id_aluno INT,
 curso VARCHAR(50),
 data_matricula DATE,
 FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);
---------------------------------------------------------
Inserir dados nas tabelas:
INSERT INTO alunos (nome, idade, serie, cidade) VALUES
('Ana Souza', 15, '9º Ano', 'São Paulo'),
('Bruno Lima', 17, '3º Ano', 'Rio de Janeiro'),
('Amanda Rocha', 14, '8º Ano', 'São Paulo'),
('Carlos Silva', 16, '2º Ano', 'Belo Horizonte'),
('Alice Nunes', 13, '7º Ano', 'Curitiba');
 
INSERT INTO matriculas (id_aluno, curso, data_matricula) VALUES
(1, 'Matemática', '2024-02-01'),
(1, 'Física', '2024-02-10'),
(2, 'História', '2024-01-20'),
(3, 'Geografia', '2024-02-15'),
(4, 'Química', '2024-01-25');

-------------------------------------------------------------
UPDATE (Atualização de Dados)
1. Atualizar a cidade da aluna Ana Souza para Campinas
UPDATE alunos
SET cidade = 'Campinas'
WHERE id = 1;

Verificar o resultado:
SELECT * FROM alunos WHERE id = 1;

2. Atualizar a idade de Carlos Silva para 17 anos
UPDATE alunos
SET idade = 17
WHERE nome = 'Carlos Silva';

3. Alterar a série de todos os alunos de São Paulo para "Ensino Fundamental"
UPDATE alunos
SET serie = 'Ensino Fundamental'
WHERE cidade = 'São Paulo';

4. Alterar o curso da matrícula 5 para Biologia
UPDATE matriculas
SET curso = 'Biologia'
WHERE id_matricula = 5;
------------------------------------------------------------
DELETE (Exclusão de Dados)
Atenção!

Como a tabela matriculas possui chave estrangeira para alunos, será necessário excluir primeiro as matrículas do aluno antes de excluir o aluno.

1. Excluir a matrícula de Geografia
DELETE FROM matriculas
WHERE curso = 'Geografia';

Verificar o resultado:
SELECT * FROM matriculas;

2. Excluir a matrícula com ID 2
DELETE FROM matriculas
WHERE id_matricula = 2;

3. Excluir todas as matrículas do aluno 4
DELETE FROM matriculas
WHERE id_aluno = 4;

4. Excluir o aluno Carlos Silva
DELETE FROM alunos
WHERE id = 4;
-----------------------------------------------------------
1. Exibir todos os alunos cadastrados.
SELECT * FROM alunos;
2. Mostrar apenas os nomes e a cidade dos alunos.
SELECT nome, cidade FROM alunos;
3. Listar os alunos com idade maior ou igual a 15 anos.
SELECT * FROM alunos WHERE idade >= 15;
4. Exibir os alunos que moram em São Paulo.
SELECT * FROM alunos WHERE cidade = 'São Paulo';
5. Ordenar os alunos em ordem crescente de idade.
SELECT * FROM alunos ORDER BY idade ASC;
6. Selecionar os alunos cujo nome começa com "A".
SELECT * FROM alunos WHERE nome LIKE 'A%';
7. Exibir os alunos que NÃO são de São Paulo.
SELECT * FROM alunos WHERE cidade <> 'São Paulo';
8. Contar quantos alunos estão cadastrados.
SELECT COUNT(*) FROM alunos;
9. Exibir a média de idade dos alunos.
SELECT AVG(idade) AS media FROM alunos;
10. Listar os alunos matriculados entre 1º e 3º Ano.
SELECT * FROM alunos WHERE serie IN ('1º Ano', '2º Ano', '3º Ano');
=======
O Objetivo é se conceituar as consultas DQL (Linguagem de Consulta de dados)
Criar o banco de dados:

CREATE DATABASE escola;
USE escola;
Criar a tabela alunos:
CREATE TABLE alunos (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 idade INT NOT NULL,
 serie VARCHAR(20),
 cidade VARCHAR(50)
);

Criar a tabela matriculas:
CREATE TABLE matriculas (
 id_matricula INT AUTO_INCREMENT PRIMARY KEY,
 id_aluno INT,
 curso VARCHAR(50),
 data_matricula DATE,
 FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);
---------------------------------------------------------
Inserir dados nas tabelas:
INSERT INTO alunos (nome, idade, serie, cidade) VALUES
('Ana Souza', 15, '9º Ano', 'São Paulo'),
('Bruno Lima', 17, '3º Ano', 'Rio de Janeiro'),
('Amanda Rocha', 14, '8º Ano', 'São Paulo'),
('Carlos Silva', 16, '2º Ano', 'Belo Horizonte'),
('Alice Nunes', 13, '7º Ano', 'Curitiba');
 
INSERT INTO matriculas (id_aluno, curso, data_matricula) VALUES
(1, 'Matemática', '2024-02-01'),
(1, 'Física', '2024-02-10'),
(2, 'História', '2024-01-20'),
(3, 'Geografia', '2024-02-15'),
(4, 'Química', '2024-01-25');

-------------------------------------------------------------
UPDATE (Atualização de Dados)
1. Atualizar a cidade da aluna Ana Souza para Campinas
UPDATE alunos
SET cidade = 'Campinas'
WHERE id = 1;

Verificar o resultado:
SELECT * FROM alunos WHERE id = 1;

2. Atualizar a idade de Carlos Silva para 17 anos
UPDATE alunos
SET idade = 17
WHERE nome = 'Carlos Silva';

3. Alterar a série de todos os alunos de São Paulo para "Ensino Fundamental"
UPDATE alunos
SET serie = 'Ensino Fundamental'
WHERE cidade = 'São Paulo';

4. Alterar o curso da matrícula 5 para Biologia
UPDATE matriculas
SET curso = 'Biologia'
WHERE id_matricula = 5;
------------------------------------------------------------
DELETE (Exclusão de Dados)
Atenção!

Como a tabela matriculas possui chave estrangeira para alunos, será necessário excluir primeiro as matrículas do aluno antes de excluir o aluno.

1. Excluir a matrícula de Geografia
DELETE FROM matriculas
WHERE curso = 'Geografia';

Verificar o resultado:
SELECT * FROM matriculas;

2. Excluir a matrícula com ID 2
DELETE FROM matriculas
WHERE id_matricula = 2;

3. Excluir todas as matrículas do aluno 4
DELETE FROM matriculas
WHERE id_aluno = 4;

4. Excluir o aluno Carlos Silva
DELETE FROM alunos
WHERE id = 4;
-----------------------------------------------------------
1. Exibir todos os alunos cadastrados.
SELECT * FROM alunos;
2. Mostrar apenas os nomes e a cidade dos alunos.
SELECT nome, cidade FROM alunos;
3. Listar os alunos com idade maior ou igual a 15 anos.
SELECT * FROM alunos WHERE idade >= 15;
4. Exibir os alunos que moram em São Paulo.
SELECT * FROM alunos WHERE cidade = 'São Paulo';
5. Ordenar os alunos em ordem crescente de idade.
SELECT * FROM alunos ORDER BY idade ASC;
6. Selecionar os alunos cujo nome começa com "A".
SELECT * FROM alunos WHERE nome LIKE 'A%';
7. Exibir os alunos que NÃO são de São Paulo.
SELECT * FROM alunos WHERE cidade <> 'São Paulo';
8. Contar quantos alunos estão cadastrados.
SELECT COUNT(*) FROM alunos;
9. Exibir a média de idade dos alunos.
SELECT AVG(idade) AS media FROM alunos;
10. Listar os alunos matriculados entre 1º e 3º Ano.
SELECT * FROM alunos WHERE serie IN ('1º Ano', '2º Ano', '3º Ano');
>>>>>>> 7d4fae60320125bd501b56402c82988d9936fb4f
Printar os resultados das consultas e colocar abaixo de cada SELECT