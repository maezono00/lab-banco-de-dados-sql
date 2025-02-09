CREATE DATABASE bercario02;
USE bercario02;

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