USE Bercario;

-- 1. Tabela Enderecos
INSERT INTO Enderecos (cep, rua, numero, complemento, bairro, cidade, estado)
VALUES
('01001-000', 'Rua A', '123', 'Apt 101', 'Centro', 'São Paulo', 'SP'),
('02002-111', 'Avenida B', '456', 'Casa 2', 'Jardins', 'São Paulo', 'SP'),
('03003-222', 'Travessa C', '789', NULL, 'Vila Mariana', 'São Paulo', 'SP'),
('04004-333', 'Alameda D', '101', NULL, 'Pinheiros', 'São Paulo', 'SP'),
('05005-444', 'Rua E', '202', 'Bloco A', 'Moema', 'São Paulo', 'SP'),
('06006-555', 'Avenida F', '303', 'Apt 202', 'Brooklin', 'São Paulo', 'SP'),
('07007-666', 'Praça G', '404', NULL, 'Liberdade', 'São Paulo', 'SP'),
('08008-777', 'Rua H', '505', 'Casa 3', 'Ipiranga', 'São Paulo', 'SP'),
('09009-888', 'Alameda I', '606', NULL, 'Tatuapé', 'São Paulo', 'SP'),
('10010-999', 'Avenida J', '707', 'Bloco B', 'Vila Madalena', 'São Paulo', 'SP');

-- 2. Tabela Genitores
INSERT INTO Genitores (nome, RG, sexo, data_nascimento, telefone, id_endereco)
VALUES
('Carlos Silva', '123456789', 'M', '1980-01-01', '11987654321', 1),
('Ana Costa', '987654321', 'F', '1985-02-02', '11987654322', 2),
('Paulo Santos', '112233445', 'M', '1979-03-03', '11987654323', 3),
('Maria Souza', '998877665', 'F', '1988-04-04', '11987654324', 4),
('Jorge Lima', '223344556', 'M', '1982-05-05', '11987654325', 5),
('Juliana Oliveira', '334455667', 'F', '1984-06-06', '11987654326', 6),
('Roberto Almeida', '445566778', 'M', '1981-07-07', '11987654327', 7),
('Fernanda Melo', '556677889', 'F', '1987-08-08', '11987654328', 8),
('Marcelo Pereira', '667788990', 'M', '1983-09-09', '11987654329', 9),
('Luciana Ribeiro', '778899001', 'F', '1986-10-10', '11987654330', 10);

-- 3. Tabela Bebes
INSERT INTO Bebes (nome, data_hora_nascimento, sexo, peso, altura, tipo_parto, id_pai, id_mae)
VALUES
('Lucas Silva', '2024-08-01 08:30:00', 'M', 3.2, 50.0, 'Normal', 1, 2),
('Laura Costa', '2024-08-02 09:45:00', 'F', 3.0, 49.5, 'Cesárea', NULL, 2),
('Pedro Santos', '2024-08-03 07:15:00', 'M', 3.5, 51.0, 'Normal', 3, 4),
('Alice Souza', '2024-08-04 06:30:00', 'F', 3.1, 49.0, 'Cesárea', 5, 4),
('Gabriel Lima', '2024-08-05 10:00:00', 'M', 3.3, 50.5, 'Normal', 5, 6),
('Sofia Oliveira', '2024-08-06 11:15:00', 'F', 3.2, 49.8, 'Cesárea', NULL, 6),
('Henrique Almeida', '2024-08-07 12:30:00', 'M', 3.4, 51.2, 'Normal', 7, 8),
('Isabella Melo', '2024-08-08 05:45:00', 'F', 3.1, 50.3, 'Cesárea', 7, 8),
('Felipe Pereira', '2024-08-09 09:00:00', 'M', 3.5, 51.5, 'Normal', 9, 10),
('Beatriz Ribeiro', '2024-08-10 04:15:00', 'F', 3.0, 49.4, 'Cesárea', 9, 10);

-- 4. Tabela Cargos
INSERT INTO Cargos (descricao_cargo)
VALUES
('Pediatra'),
('Enfermeiro(a)'),
('Nutricionista'),
('Fisioterapeuta'),
('Obstetra'),
('Auxiliar de Enfermagem'),
('Técnico(a) de Enfermagem'),
('Assistente Social'),
('Psicólogo(a)'),
('Recepcionista');

-- 5. Tabela Profissionais_Saude
INSERT INTO Profissionais_Saude (nome, RG, CPF, data_nascimento, registro_ordem, id_cargo)
VALUES
('Dr. João Marques', '223344556', '123.456.789-00', '1975-01-01', 'CRM 12345', 1),
('Enf. Maria Duarte', '334455667', '234.567.890-11', '1980-02-02', 'COREN 67890', 2),
('Nut. Patrícia Lima', '445566778', '345.678.901-22', '1985-03-03', 'CRN 98765', 3),
('Fisio. Carlos Nunes', '556677889', '456.789.012-33', '1978-04-04', 'CREFITO 54321', 4),
('Dr. Ana Barbosa', '667788990', '567.890.123-44', '1982-05-05', 'CRM 65432', 5),
('Aux. Joana Souza', '778899001', '678.901.234-55', '1984-06-06', 'COREN 87654', 6),
('Tec. José Silva', '889900112', '789.012.345-66', '1977-07-07', 'COREN 11223', 7),
('Ass. Carla Mendes', '990011223', '890.123.456-77', '1981-08-08', NULL, 8),
('Psic. Fernanda Lima', '001122334', '901.234.567-88', '1983-09-09', 'CRP 76543', 9),
('Rec. Marcos Oliveira', '112233445', '012.345.678-99', '1986-10-10', NULL, 10);

-- 6. Tabela Profissionais_Bebe
INSERT INTO Profissionais_Bebe (id_bebe, id_profissional)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- 7. Tabela Usuarios
INSERT INTO Usuarios (nome, email, senha, ativo)
VALUES
('Administrador', 'admin@bercario.com', 'senhaadmin', TRUE),
('Carlos Silva', 'carlos.silva@bercario.com', 'senha123', TRUE),
('Ana Costa', 'ana.costa@bercario.com', 'senha123', TRUE),
('Paulo Santos', 'paulo.santos@bercario.com', 'senha123', TRUE),
('Maria Souza', 'maria.souza@bercario.com', 'senha123', TRUE),
('Jorge Lima', 'jorge.lima@bercario.com', 'senha123', TRUE),
('Juliana Oliveira', 'juliana.oliveira@bercario.com', 'senha123', TRUE),
('Roberto Almeida', 'roberto.almeida@bercario.com', 'senha123', TRUE),
('Fernanda Melo', 'fernanda.melo@bercario.com', 'senha123', TRUE),
('Marcelo Pereira', 'marcelo.pereira@bercario.com', 'senha123', TRUE);

-- 8. Tabela Logins
INSERT INTO Logins (id_usuario, data_hora_login, ip_login)
VALUES
(1, '2024-08-01 09:00:00', '192.168.0.1'),
(2, '2024-08-01 09:05:00', '192.168.0.2'),
(3, '2024-08-01 09:10:00', '192.168.0.3'),
(4, '2024-08-01 09:15:00', '192.168.0.4'),
(5, '2024-08-01 09:20:00', '192.168.0.5'),
(6, '2024-08-01 09:25:00', '192.168.0.6'),
(7, '2024-08-01 09:30:00', '192.168.0.7'),
(8, '2024-08-01 09:35:00', '192.168.0.8'),
(9, '2024-08-01 09:40:00', '192.168.0.9'),
(10, '2024-08-01 09:45:00', '192.168.0.10');

-- 9. Tabela Papeis
INSERT INTO Papeis (nome_papel)
VALUES
('Administrador'),
('Genitor'),
('Profissional de Saúde'),
('Recepcionista'),
('Gerente'),
('Enfermeiro'),
('Pediatra'),
('Nutricionista'),
('Fisioterapeuta'),
('Assistente Social');

-- 10. Tabela Permissoes
INSERT INTO Permissoes (nome_permissao)
VALUES
('Visualizar Bebês'),
('Adicionar Bebês'),
('Editar Bebês'),
('Deletar Bebês'),
('Visualizar Genitores'),
('Adicionar Genitores'),
('Editar Genitores'),
('Deletar Genitores'),
('Visualizar Profissionais'),
('Adicionar Profissionais');

-- 11. Tabela Papel_Permissoes
INSERT INTO Papel_Permissoes (id_papel, id_permissao)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 5),
(3, 9),
(3, 10),
(4, 1),
(4, 5);

-- 12. Tabela Usuario_Papeis
INSERT INTO Usuario_Papeis (id_usuario, id_papel)
VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 4);

