-- 1) Criar um banco de dados com o nome prova.
CREATE DATABASE prova;
USE prova;

-- a) Tabelas e relacionamentos;
CREATE TABLE proprietarios
(
	id_proprietario INT(11) PRIMARY KEY,
    primeiro_nome VARCHAR(50),
    sobrenome VARCHAR(50),
    endereco VARCHAR(100),
    numero_telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animais
(
	id_animal INT(11) PRIMARY KEY,
    nome_animal VARCHAR(50),
    especie VARCHAR(50),
    raca VARCHAR(50),
    data_nascimento DATE,
    sexo CHAR(1),
    id_proprietario INT(11),
    FOREIGN KEY (id_proprietario) REFERENCES proprietarios(id_proprietario)
);

CREATE TABLE vacinacoes
(
	id_vacinacao INT(11)PRIMARY KEY,
    nome_vacina VARCHAR(100),
    data_vacinacao DATE,
    id_animal INT(11),
    data_validade DATE,
    FOREIGN KEY (id_animal) REFERENCES animais(id_animal)
);

CREATE TABLE alimentacao
(
	id_alimentacao INT(11),
    id_animal INT(11),
    tipo_comida VARCHAR(50),
    quantidade VARCHAR(20),
    horario_alimentacao TIME,
    frequencia VARCHAR(20),
    FOREIGN KEY (id_animal) REFERENCES animais(id_animal)
);

CREATE TABLE visitasveterinario
(
	id_visita INT(11),
    data_visita DATE,
    motivo VARCHAR(255),
    id_animal INT(11),
    custo DECIMAL(10,2),
    diagnostico TEXT,
    FOREIGN KEY (id_animal) REFERENCES animais(id_animal)
);

-- b) Popular as tabelas com 2 registros cada usando INSERT;
INSERT INTO proprietarios(id_proprietario, primeiro_nome, sobrenome, endereco, numero_telefone, email)
VALUES
(1, 'João', 'Silva', 'Rua A', '(19)1234-5678', 'joaosilva@email.com'),
(2, 'Maria', 'Barros', 'Rua B', '(19)9875-4321', 'mariabarros@email.com');

INSERT INTO animais(id_animal, nome_animal, especie, raca, data_nascimento, sexo, id_proprietario)
VALUES
(1, 'Flor', 'Cachorro', 'RND', '2024-01-01', 'F', 1),
(2, 'Rosa', 'Gato', 'Azul russo', '2023-12-31', 'F', 2);

INSERT INTO vacinacoes(id_vacinacao, nome_vacina, data_vacinacao, id_animal, data_validade)
VALUES
(1, 'Vacina A', '2024-02-01', 1, '2024-12-31'),
(2, 'Vacina B', '2024-02-02', 2, '2025-01-01');

INSERT INTO alimentacao(id_alimentacao, id_animal, tipo_comida, quantidade, horario_alimentacao, frequencia)
VALUES
(1, 1, 'Sólida', '30 gramas', '12:00:00','3 vezes por dia'),
(2, 2, 'Sólida', '15 gramas', '09:00:00', '2 vezes por dia');

INSERT INTO visitasveterinario(id_visita, data_visita, motivo, id_animal, custo, diagnostico)
VALUES
(1, '2024-02-01', 'Vacina', 1, '2.99', 'Saudável'),
(2, '2024-05-20', 'Retirada de pontos', 2, '0.00', 'Saudável');

-- c) Apresentar um exemplo de DELETE;
DELETE FROM vacinacoes WHERE id_vacinacao = 2; 

-- d) Apresentar um exemplo de UPDATE;
UPDATE vacinacoes SET data_validade = '2025-01-01' WHERE id_vacinacao = 1;

-- e) Acrescentar uma coluna idade do tipo int na tabela de animais usando ALTER TABLE;
ALTER TABLE animais ADD idade INT(11);

-- 3) Selecionar o banco de dados prova. Aplicar o script a seguir para criar a estrutura do banco de dados e popular o banco. Na sequência, responder usando SQL DML as alternativas a, b, c e d.
-- Criação da tabela "empresas"
CREATE TABLE empresas (
 id INT PRIMARY KEY,
 nome VARCHAR(100),
 endereco VARCHAR(200)
);

-- Criação da tabela "produtos"
CREATE TABLE produtos (
 id INT PRIMARY KEY,
 nome VARCHAR(100),
 preco DECIMAL(10, 2)
);

-- Criação da tabela "projetos"
CREATE TABLE projetos (
 id INT PRIMARY KEY,
 nome VARCHAR(100),
 empresa_id INT,
 produto_id INT,
 FOREIGN KEY (empresa_id) REFERENCES empresas(id),
 FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Inserção de registros na tabela "empresas"
INSERT INTO empresas (id, nome, endereco)
VALUES (1, 'Empresa A', 'Rua A, 123'),
 (2, 'Empresa B', 'Avenida B, 456'),
 (3, 'Empresa C', 'Travessa C, 789'),
 (4, 'Empresa D', 'Praça D, 987');
 
-- Inserção de registros na tabela "produtos"
INSERT INTO produtos (id, nome, preco)
VALUES (1, 'Produto A', 10.99),
 (2, 'Produto B', 20.50),
 (3, 'Produto C', 15.75),
 (4, 'Produto D', 5.99);
 
 -- Inserção de registros na tabela "projetos"
INSERT INTO projetos (id, nome, empresa_id, produto_id)
VALUES (1, 'Projeto A', 1, 1),
 (2, 'Projeto B', 2, 2),
 (3, 'Projeto C', 1, 3),
 (4, 'Projeto D', 3, 4);
 
-- a. Liste o nome de todos os projetos juntamente com o nome da empresa responsável por cada projeto.
SELECT p.nome AS projetos, e.nome AS empresas
FROM projetos p
JOIN empresas e
ON p.empresa_id = e.id;
 
-- b. Retorne o nome do projeto, o nome da empresa responsável e o preço do produto associado a cada projeto. Se um projeto não tiver um produto associado, o preço deve ser mostrado como 0.
SELECT p.nome AS projeto, e.nome AS empresa, pd.preco
FROM projetos p
INNER JOIN empresas e
ON p.empresa_id = e.id
INNER JOIN produtos pd
ON p.produto_id = pd.id;


-- c. Liste o nome das empresas que não estão associadas a nenhum projeto.
SELECT e.nome
FROM empresas e
JOIN projetos p
ON p.empresa_id = e.id
WHERE e.id IS NULL;

-- d. Calcule o preço total de todos os produtos associados aos projetos
SELECT SUM(preco) AS preco_total FROM produtos;