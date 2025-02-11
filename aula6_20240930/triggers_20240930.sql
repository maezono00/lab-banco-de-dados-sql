CREATE DATABASE aula_triggers;
USE aula_triggers;

#CRIAÇÃO E INSERÇÃO DOS DADOS
CREATE TABLE Produtos
(
Referencia VARCHAR(3) PRIMARY KEY,
Descricao VARCHAR(50) UNIQUE,
Estoque INT NOT NULL DEFAULT 0
);

INSERT INTO Produtos VALUES ('001', 'Feijão', 10);
INSERT INTO Produtos VALUES ('002', 'Arroz', 5);
INSERT INTO Produtos VALUES ('003', 'Farinha', 15);

CREATE TABLE ItensVenda
(
Venda INT,
Produto VARCHAR(3),
Quantidade INT
);

