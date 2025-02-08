-- CRIAR TABELA UNIVERSIDADE
CREATE DATABASE UNIVERSIDADE;
USE UNIVERSIDADE;

-- CRIAR TABELA ALUNOS
CREATE TABLE Alunos(
	id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    matricula VARCHAR(10) NOT NULL UNIQUE
);

-- CRIAR TABELA MATÉRIAS
CREATE TABLE Materias(
	id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    codigo VARCHAR(10) NOT NULL UNIQUE
);

-- CRIAR TABELA HISTÓRICO
CREATE TABLE Historico(
	id INT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_materia INT NOT NULL,
    nota FLOAT,
    semestre VARCHAR(10),
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id),
    FOREIGN KEY (id_materia) REFERENCES Materias(id)
);

-- INSERINDO DADOS NA TABELA ALUNOS
INSERT INTO Alunos(id, nome, sobrenome, matricula) VALUES
(1, 'João', 'Silva', '2021001'),
(2, 'Maria', 'Santos', '2021002'),
(3, 'José', 'Oliveira', '2021003');

-- INSERIR DADOS NA TABELA MATÉRIAS
INSERT INTO Materias(id, nome, codigo) VALUES
(1, 'Matemática', 'MAT101'),
(2, 'Física', 'FIS101'),
(3, 'História', 'HIS101');

-- INSERIR DADOS NA TABELA HISTÓRICO
INSERT INTO Historico(id, id_aluno, id_materia, nota, semestre) VALUES
(1, 1, 1, 7.5, '2023/1'),
(2, 1, 2, 8.0, '2023/1'),
(3, 2, 1, 9.0, '2023/1'),
(4, 2, 3, 6.5, '2023/1'),
(5, 3, 2, 7.0, '2023/1');

-- ATUALIZAR O NOME DO ALUNO COM ID = 1 PARA 'PEDRO'
UPDATE Alunos SET nome = 'Pedro' WHERE id = 1;

-- EXCLUI A MATÉRIA COM ID = 1 NA TABELA MATÉRIAS
SET SQL_SAFE_UPDATES = 1;
DELETE FROM Materias WHERE id = 3;

-- ATUALIZA A NOTA DO ALUNO COM ID = 2 NA DISCIPLINA COM ID = 1 PARA 9.5
UPDATE Historico SET nota = 9.5 WHERE id_aluno = 2 AND id_materia = 1;