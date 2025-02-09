CREATE DATABASE tarefa05;
USE tarefa05;

-- CRIAÇÃO DA TABELA ENDEREÇOS
CREATE TABLE Enderecos
(
	id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    cep VARCHAR(10) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
	cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

-- CRIAÇÃO DA TABELA GENITORES
CREATE TABLE Genitores
(
	id_genitor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    rg VARCHAR(20) UNIQUE NOT NULL,
    sexo CHAR(1) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    id_endereco INT,
    FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

-- CRIAÇÃO DA TABELA BEBÊS
CREATE TABLE Bebes
(
	id_bebe INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_hora_nascimento DATETIME NOT NULL,
    sexo CHAR(1) NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    altura DECIMAL(5,2) NOT NULL,
    tipo_parto VARCHAR(50) NOT NULL,
    id_pai INT,
    id_mae INT NOT NULL,
    FOREIGN KEY (id_pai) REFERENCES Genitores(id_genitor),
    FOREIGN KEY (id_mae) REFERENCES Genitores(id_genitor)
);

-- CRIAÇÃO DA TABELA CARGOS
CREATE TABLE Cargos
(
	id_cargo INT PRIMARY KEY AUTO_INCREMENT,
    descricao_cargo VARCHAR(100) NOT NULL
);

-- CRIAÇÃO DA TABELA PROFISSIONAIS DE SAÚDE
CREATE TABLE Profissionais_Saude
(
	id_profissional INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    rg VARCHAR(20) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    registro_ordem VARCHAR(50) NOT NULL,
	id_cargo INT,
    FOREIGN KEY (id_cargo) 	REFERENCES Cargos(id_cargo)
);

-- CRIAÇÃO DA TABELA PROFISSIONAL E BEBÊ 
CREATE TABLE Profissionais_Bebe
(
	id_bebe INT,
	id_profissional INT,
	PRIMARY KEY (id_bebe, id_profissional),
    FOREIGN KEY (id_bebe) REFERENCES Bebes(id_bebe),
    FOREIGN KEY (id_profissional) REFERENCES Profissionais_Saude(id_profissional)
);

-- CRIAÇÃO DA TABELA USUÁRIOS
CREATE TABLE Usuarios
(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    ativo BOOLEAN
);

-- CRIAÇÃO DA TABELA LOGIN
CREATE TABLE Login
(
	id_login INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    data_hora_login DATETIME,
    ip_login VARCHAR(45),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- CRIAÇÃO DA TABELA PAPÉIS
CREATE TABLE Papeis
(
	id_papel INT PRIMARY KEY AUTO_INCREMENT,
    nome_papel VARCHAR(50) UNIQUE NOT NULL
);

-- CRIAÇÃO DA TABELA PERMISSÕES
CREATE TABLE Permissoes
(
	id_permissao INT PRIMARY KEY AUTO_INCREMENT,
    nome_permissao VARCHAR(100) NOT NULL
);

-- CRIAÇÃO DA TABELA PAPEL PERMISSÕES
CREATE TABLE Papel_Permissoes
(
	id_papel INT,
    id_permissao INT,
    PRIMARY KEY (id_papel, id_permissao),
    FOREIGN KEY (id_papel) REFERENCES Papeis(id_papel),
    FOREIGN KEY (id_permissao) REFERENCES Permissoes(id_permissao)
);

-- CRIAÇÃO DA TABELA PROFISSIONAL PAPÉIS
CREATE TABLE Usuario_Papeis
(
	id_usuario INT,
    id_papel INT,
    PRIMARY KEY (id_usuario, id_papel),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_papel) REFERENCES Papeis(id_papel)
);

-- TAREFA05_20240903
-- CRIAÇÃO DA TABELA DE REGISTRO DE VACINAS
CREATE TABLE Vacinas
(
	id_vacina INT AUTO_INCREMENT PRIMARY KEY,
    nome_vacina VARCHAR(255) NOT NULL,
    descricao TEXT,
    data_vacinacao DATE,
    id_bebe INT,
    FOREIGN KEY (id_bebe) REFERENCES bebes (id_bebe) ON DELETE CASCADE
);

-- ADICIONAR NOVA COLUNA "EMAIL" NA TABELA GENITORES
ALTER TABLE Genitores ADD email VARCHAR(255) UNIQUE;

-- Modificar o tipo de dado da coluna "telefone" na tabela Genitores para VARCHAR(20):
ALTER TABLE Genitores MODIFY telefone VARCHAR(20);

-- Remover a coluna "complemento" da tabela Enderecos:
ALTER TABLE Enderecos DROP COLUMN complemento;

-- Criar uma nova tabela para registrar as consultas médicas dos bebês:
CREATE TABLE Consultas
(
	id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE NOT NULL,
    id_bebe INT NOT NULL,
    id_profissional INT NOT NULL,
    FOREIGN KEY (id_bebe) REFERENCES Bebes(id_bebe) ON DELETE CASCADE,
    FOREIGN KEY (id_profissional) REFERENCES Profissionais_Saude(id_profissional) ON DELETE RESTRICT
);

-- Adicionar uma constraint UNIQUE para a coluna "nome_papel" na tabela Papeis:
ALTER TABLE Papeis ADD CONSTRAINT unique_nome_papel UNIQUE (nome_papel);

-- Criar uma tabela de históricos de alterações dos dados dos bebês:
CREATE TABLE Historico_Bebes
(
	id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_bebe INT NOT NULL,
    data_alteracao DATETIME NOT NULL,
    descricao_alteracao TEXT,
    FOREIGN KEY (id_bebe) REFERENCES Bebes(id_bebe) ON DELETE CASCADE
);

-- Adicionar uma constraint CHECK na tabela Bebes para garantir que o peso seja maior que 0:
ALTER TABLE Bebes ADD CONSTRAINT chk_peso CHECK (peso > 0);

-- Excluir a tabela Profissionais_Bebe
DROP TABLE Profissionais_Bebe;

-- Renomear a coluna "descricao_cargo" na tabela Cargos para "nome_cargo":
ALTER TABLE Cargos CHANGE descricao_cargo nome_cargo VARCHAR(100);

-- Criar uma nova tabela para registrar os exames realizados nos bebês
CREATE TABLE Exames
(
	id_exame INT AUTO_INCREMENT PRIMARY KEY,
    tipo_exame VARCHAR(255) NOT NULL,
    data_exame DATE,
    resultado_exame TEXT,
    id_bebe INT NOT NULL,
    FOREIGN KEY (id_bebe) REFERENCES Bebes(id_bebe) ON DELETE CASCADE
);

-- Adicionar uma nova coluna "ativo" na tabela Papeis com valor padrão TRUE:
ALTER TABLE Papeis ADD ativo BOOLEAN DEFAULT TRUE;

-- Remover a constraint UNIQUE da coluna "RG" na tabela Genitores:
ALTER TABLE Genitores DROP INDEX RG;

-- Criar uma tabela "Vacinas_Bebe" para registrar as vacinas que cada bebê tomou:
CREATE TABLE Vacinas_Bebe
(
	id_bebe INT NOT NULL,
    id_vacina INT NOT NULL,
    data_aplicacao DATE NOT NULL,
    PRIMARY KEY (id_bebe, id_vacina),
    FOREIGN KEY (id_bebe) REFERENCES Bebes(id_bebe) ON DELETE CASCADE,
    FOREIGN KEY (id_vacina) REFERENCES Vacinas(id_vacina) ON DELETE CASCADE
);

-- Alterar a tabela Bebes para adicionar uma coluna "observacoes"
ALTER TABLE Bebes ADD observacoes TEXT;

SET FOREIGN_KEY_CHECKS = 0;

-- Excluir a tabela Permissoes:
DROP TABLE Permissoes;

-- Renomear a tabela "Logins" para "Acessos"
ALTER TABLE Login RENAME TO Acessos;

-- Criar uma tabela para registrar as alergias dos bebês:
CREATE TABLE Alergias
(
	id_alergia INT AUTO_INCREMENT PRIMARY KEY,
    tipo_alergia VARCHAR(255) NOT NULL,
    descricao TEXT,
    id_bebe INT,
    FOREIGN KEY (id_bebe) REFERENCES Bebes(id_bebe) ON DELETE CASCADE
);

-- Adicionar uma constraint CHECK na tabela Enderecos para garantir que o CEP tenha o formato correto
ALTER TABLE Enderecos ADD CONSTRAINT chk_cep CHECK (cep REGEXP '^[0-9]{5}-[0-9]{3}$');