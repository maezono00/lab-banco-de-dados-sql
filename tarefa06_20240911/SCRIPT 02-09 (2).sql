CREATE DATABASE BERCARIO_NOVO;
USE BERCARIO_NOVO;

-- Criação da tabela Enderecos
CREATE TABLE Enderecos (
    id_endereco INT PRIMARY KEY,
    cep VARCHAR(10),
    rua VARCHAR(255),
    numero VARCHAR(10),
    complemento VARCHAR(50),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50)
);

-- Criação da tabela Genitores
CREATE TABLE Genitores (
    id_genitor INT PRIMARY KEY,
    nome VARCHAR(255),
    RG VARCHAR(20) UNIQUE,
    sexo CHAR(1),
    data_nascimento DATE,
    telefone VARCHAR(15),
    id_endereco INT,
    FOREIGN KEY (id_endereco) REFERENCES Enderecos(id_endereco)
);

-- Criação da tabela Bebes
CREATE TABLE Bebes (
    id_bebe INT PRIMARY KEY,
    nome VARCHAR(255),
    data_hora_nascimento DATETIME,
    sexo CHAR(1),
    peso DECIMAL(5,2),
    altura DECIMAL(5,2),
    tipo_parto VARCHAR(50),
    id_pai INT,
    id_mae INT,
    FOREIGN KEY (id_pai) REFERENCES Genitores(id_genitor),
    FOREIGN KEY (id_mae) REFERENCES Genitores(id_genitor)
);

-- Criação da tabela Cargos
CREATE TABLE Cargos (
    id_cargo INT PRIMARY KEY,
    descricao_cargo VARCHAR(100)
);

-- Criação da tabela Profissionais_Saude
CREATE TABLE Profissionais_Saude (
    id_profissional INT PRIMARY KEY,
    nome VARCHAR(255),
    RG VARCHAR(20) UNIQUE,
    CPF VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    registro_ordem VARCHAR(50),
    id_cargo INT,
    FOREIGN KEY (id_cargo) REFERENCES Cargos(id_cargo)
);

-- Criação da tabela Profissionais_Bebe
CREATE TABLE Profissionais_Bebe (
    id_bebe INT,
    id_profissional INT,
    PRIMARY KEY (id_bebe, id_profissional),
    FOREIGN KEY (id_bebe) REFERENCES Bebes(id_bebe),
    FOREIGN KEY (id_profissional) REFERENCES Profissionais_Saude(id_profissional)
);

INSERT INTO Enderecos (id_endereco, cep, rua, numero, complemento, bairro, cidade, estado) VALUES
(1, '12345-678', 'Rua das Flores', '123', 'Apto 101', 'Jardim das Rosas', 'São Paulo', 'SP'),
(2, '23456-789', 'Av. Paulista', '456', 'Sala 202', 'Centro', 'São Paulo', 'SP'),
(3, '34567-890', 'Rua da Esperança', '789', '', 'Vila Nova', 'Rio de Janeiro', 'RJ'),
(4, '45678-901', 'Rua do Sol', '101', '', 'Bela Vista', 'Belo Horizonte', 'MG'),
(5, '56789-012', 'Av. Brasil', '202', 'Cobertura', 'Centro', 'Curitiba', 'PR'),
(6, '67890-123', 'Rua dos Jasmins', '303', 'Casa', 'São Francisco', 'Porto Alegre', 'RS'),
(7, '78901-234', 'Rua do Comércio', '404', '', 'Boa Vista', 'Salvador', 'BA'),
(8, '89012-345', 'Av. das Américas', '505', 'Apto 303', 'Barra', 'Rio de Janeiro', 'RJ'),
(9, '90123-456', 'Rua dos Limoeiros', '606', '', 'Jardim das Palmeiras', 'Fortaleza', 'CE'),
(10, '01234-567', 'Av. do Estado', '707', 'Sala 404', 'Centro', 'Recife', 'PE');

INSERT INTO Genitores (id_genitor, nome, RG, sexo, data_nascimento, telefone, id_endereco) VALUES
(1, 'Maria Silva', 'MG1234567', 'F', '1980-05-15', '(11) 98765-4321', 1),
(2, 'João Pereira', 'JP2345678', 'M', '1975-11-20', '(21) 99876-5432', 2),
(3, 'Ana Costa', 'AC3456789', 'F', '1982-03-22', '(31) 91234-5678', 3),
(4, 'Carlos Oliveira', 'CO4567890', 'M', '1978-07-30', '(41) 92345-6789', 4),
(5, 'Fernanda Souza', 'FS5678901', 'F', '1990-09-01', '(51) 93456-7890', 5),
(6, 'Pedro Martins', 'PM6789012', 'M', '1985-12-12', '(61) 94567-8901', 6),
(7, 'Juliana Lima', 'JL7890123', 'F', '1988-01-25', '(71) 95678-9012', 7),
(8, 'Roberto Almeida', 'RA8901234', 'M', '1979-06-10', '(81) 96789-0123', 8),
(9, 'Patrícia Rocha', 'PR9012345', 'F', '1986-04-05', '(91) 97890-1234', 9),
(10, 'Marcos Fernandes', 'MF0123456', 'M', '1992-08-18', '(41) 98901-2345', 10);

INSERT INTO Bebes (id_bebe, nome, data_hora_nascimento, sexo, peso, altura, tipo_parto, id_pai, id_mae) VALUES
(1, 'Lucas Silva', '2024-09-01 10:15:00', 'M', 3.50, 50.0, 'Normal', 1, 2),
(2, 'Julia Pereira', '2024-09-02 11:30:00', 'F', 3.20, 48.0, 'Cesárea', 3, 4),
(3, 'Mateus Costa', '2024-09-03 09:45:00', 'M', 3.80, 52.0, 'Normal', 5, 6),
(4, 'Sofia Oliveira', '2024-09-04 12:00:00', 'F', 3.10, 49.0, 'Cesárea', 7, 8),
(5, 'Gabriel Souza', '2024-09-05 08:00:00', 'M', 3.60, 51.0, 'Normal', 9, 10),
(6, 'Isabella Martins', '2024-09-06 14:20:00', 'F', 3.40, 50.0, 'Normal', 1, 3),
(7, 'Felipe Lima', '2024-09-07 15:10:00', 'M', 3.70, 52.5, 'Cesárea', 4, 6),
(8, 'Mariana Almeida', '2024-09-08 13:25:00', 'F', 3.00, 48.5, 'Normal', 7, 8),
(9, 'Rafael Rocha', '2024-09-09 16:40:00', 'M', 3.55, 51.5, 'Normal', 9, 1),
(10, 'Ana Fernandes', '2024-09-10 17:00:00', 'F', 3.30, 49.5, 'Cesárea', 2, 10);

INSERT INTO Cargos (id_cargo, descricao_cargo) VALUES
(1, 'Pediatra'),
(2, 'Enfermeiro'),
(3, 'Cirurgião'),
(4, 'Ginecologista'),
(5, 'Nutricionista'),
(6, 'Fisioterapeuta'),
(7, 'Psicólogo'),
(8, 'Assistente Social'),
(9, 'Tecnólogo em Radiologia'),
(10, 'Anestesista');

INSERT INTO Profissionais_Saude (id_profissional, nome, RG, CPF, data_nascimento, registro_ordem, id_cargo) VALUES
(1, 'Dr. Roberto Silva', 'RS1234567', '123.456.789-00', '1980-06-10', '1234-SP', 1),
(2, 'Enf. Ana Costa', 'AC2345678', '234.567.890-11', '1985-02-15', '5678-SP', 2),
(3, 'Dr. Carlos Lima', 'CL3456789', '345.678.901-22', '1975-10-25', '9101-RJ', 3),
(4, 'Dra. Fernanda Almeida', 'FA4567890', '456.789.012-33', '1982-07-12', '1121-MG', 4),
(5, 'Nutri. Juliana Rocha', 'JR5678901', '567.890.123-44', '1988-03-20', '3141-PR', 5),
(6, 'Fisio. Marcos Ferreira', 'MF6789012', '678.901.234-55', '1990-08-30', '5161-RS', 6),
(7, 'Psic. Patricia Martins', 'PM7890123', '789.012.345-66', '1984-12-01', '7181-BA', 7),
(8, 'Assist. Social João Silva', 'JS8901234', '890.123.456-77', '1979-09-18', '9202-CE', 8),
(9, 'Tec. Radiologia Paulo Souza', 'PS9012345', '901.234.567-88', '1992-11-25', '1234-PE', 9),
(10, 'Dr. Lucas Pereira', 'LP0123456', '012.345.678-99', '1987-05-14', '5678-RJ', 10);

INSERT INTO Profissionais_Bebe (id_bebe, id_profissional) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 5),
(4, 6),
(4, 7),
(5, 8),
(5, 9);




