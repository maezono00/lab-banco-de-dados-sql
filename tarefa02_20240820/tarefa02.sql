CREATE DATABASE tarefa02;
USE tarefa02;

-- ITEM 01
-- CRIAÇÃO DA TABELA ALUNOS
CREATE TABLE alunos
(
	codigo_aluno INT PRIMARY KEY,
    rg VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    nome_completo VARCHAR(100) NOT NULL,
    estado_civil VARCHAR(20),
    genero CHAR(1),
    data_nascimento DATE NOT NULL
);

-- INSERÇÃO DE 5 REGISTROS NA TABELA ALUNOS
INSERT INTO alunos VALUES
(1, '123456789', '1111111111', 'João da Silva', 'Solteiro', 'M', '1995-01-01'),
(2, '234567890', '2222222222', 'Maria Souza', 'Casada', 'F', '1990-03-15'),
(3, '345678901', '3333333333', 'Pedro Santos', 'Solteiro', 'M', '1998-11-22'),
(4, '456789012', '4444444444', 'Ana de Oliveira', 'Divorciada', 'F', '1985-07-08'),
(5, '567890123', '5555555555', 'Lucas de Lima', 'Solteiro', 'M', '1992-05-10');

-- CRIAÇÃO DA TABELA MATÉRIAS
CREATE TABLE materias
(
	codigo_materia INT PRIMARY KEY,
    nome_materia VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    codigo_curso INT NOT NULL,
    FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo_curso)
);

-- INSERÇÃO DE 5 REGISTROS NA TABELA DE MATÉRIAS
INSERT INTO materias VALUES
(1, 'Matemática', 80, 1),
(2, 'Português', 60, 1),
(3, 'Física', 60, 1),
(4, 'Química', 60, 2),
(5, 'Biologia', 80, 2);

-- CRIAÇÃO DA TABELA DE CURSOS
CREATE TABLE cursos
(
	codigo_curso INT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL
);

-- INSERÇÃO DE 5 REGISTROS NA TABELA CURSOS
INSERT INTO cursos VALUES
(1, 'Ciências Exatas'),
(2, 'Ciências Biológicas'),
(3, 'Ciências Humanas'),
(4, 'Engenharia'),
(5, 'Administração');

-- CRIAÇÃO DA TABELA HISTÓRICO DOS ALUNOS
CREATE TABLE historico_aluno
(
	codigo_aluno INT,
    codigo_materia INT,
    PRIMARY KEY (codigo_aluno, codigo_materia),
    FOREIGN KEY (codigo_aluno) REFERENCES alunos (codigo_aluno),
    FOREIGN KEY (codigo_materia) REFERENCES materias (codigo_materia)
);

-- RELACIONAMENTO ENTRE ALUNOS E MATÉRIAS
INSERT INTO historico_aluno VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 4),
(4, 5),
(5, 3),
(5, 5);

-- ITEM02
-- ALTERAÇÃO NA TABELA DE CÓDIGO ALUNOS
ALTER TABLE historico_aluno
ADD COLUMN notas DECIMAL(4,2) NOT NULL DEFAULT (0.0),
ADD COLUMN faltas INT NOT NULL DEFAULT(0);

-- UPDATE DOS CAMPOS NOTAS E FALTAS
UPDATE historico_aluno
SET notas = 8.5, faltas = 3
WHERE codigo_aluno = 1 AND codigo_materia = 1;

UPDATE historico_aluno
SET notas = 7.0, faltas = 5
WHERE codigo_aluno = 1 AND codigo_materia = 2;

UPDATE historico_aluno
SET notas = 9.0, faltas = 1
WHERE codigo_aluno = 1 AND codigo_materia = 3;

UPDATE historico_aluno
SET notas = 6.0, faltas = 4
WHERE codigo_aluno = 2 AND codigo_materia = 1;

UPDATE historico_aluno
SET notas = 8.0, faltas = 2
WHERE codigo_aluno = 2 AND codigo_materia = 2;

UPDATE historico_aluno
SET notas = 7.5, faltas = 0
WHERE codigo_aluno = 3 AND codigo_materia = 4;

UPDATE historico_aluno
SET notas = 9.5, faltas = 0
WHERE codigo_aluno = 4 AND codigo_materia = 5;

UPDATE historico_aluno
SET notas = 5.5, faltas = 2
WHERE codigo_aluno = 5 AND codigo_materia = 3;

UPDATE historico_aluno
SET notas = 6.5, faltas = 3
WHERE codigo_aluno = 5 AND codigo_materia = 5;

-- ITEM 03
-- CRIAÇÃO DO BANCO DE DADOS
CREATE DATABASE loja_roupas;
USE loja_roupas;

-- CRIAÇÃO DA TABELA DE CATEGORIAS
CREATE TABLE categorias
(
	id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
);

-- INSERÇÃO DE REGISTROS NA TABELA DE CATEGORIAS DE ROUPAS
INSERT INTO categorias (nome_categoria) VALUES ('Camisetas');
INSERT INTO categorias (nome_categoria) VALUES ('Calças');
INSERT INTO categorias (nome_categoria) VALUES ('Sapatos');
INSERT INTO categorias (nome_categoria) VALUES ('Casacos');
INSERT INTO categorias (nome_categoria) VALUES ('Vestidos');

-- CRIAÇÃO DA TABELA DE MARCAS DE ROUPAS
CREATE TABLE marcas
(
	id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nome_marca VARCHAR(50) NOT NULL
);

-- INSERÇÃO DE REGISTROS NA TABELA DE MARCAS DE ROUPAS
INSERT INTO marcas (nome_marca) VALUES ('Nike');
INSERT INTO marcas (nome_marca) VALUES ('Adidas');
INSERT INTO marcas (nome_marca) VALUES ('Puma');
INSERT INTO marcas (nome_marca) VALUES ('H&M');
INSERT INTO marcas (nome_marca) VALUES ('Zara');

-- CRIAÇÃO DA TABELA DE PRODUTOS DE ROUPAS
CREATE TABLE produtos
(
	int_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    descricao TEXT,
    id_categoria INT NOT NULL,
    id_marca INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias (id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marcas (id_marca)
);

-- INSERÇÃO DE REGISTROS NA TABELA DE PRODUTOS DE ROUPAS
INSERT INTO produtos (nome_produto, preco, descricao, 
id_categoria, id_marca) VALUES ('Camiseta Nike', 69.99, 'Camiseta Nike de algodão com logo 
da marca', 1, 1);

INSERT INTO produtos (nome_produto, preco, descricao, 
id_categoria, id_marca) VALUES ('Calça Adidas', 149.99, 'Calça Adidas de poliéster com 
bolsos laterais', 2, 2);

INSERT INTO produtos (nome_produto, preco, descricao, 
id_categoria, id_marca) VALUES ('Sapato Puma', 199.99, 'Sapato Puma de couro sintético 
com solado de borracha', 3, 3);

INSERT INTO produtos (nome_produto, preco, descricao, 
id_categoria, id_marca) VALUES ('Casaco H&M', 119.99, 'Casaco H&M de algodão com capuz e 
zíper frontal', 4, 4);

INSERT INTO produtos (nome_produto, preco, descricao, 
id_categoria, id_marca) VALUES ('Vestido Zara', 89.99, 'Vestido Zara de viscose com 
estampa floral', 5, 5);