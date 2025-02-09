-- DADOS TABELA ENDEREÇOS
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_enderecos.csv'
INTO TABLE Enderecos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(cep,rua,numero,complemento,bairro,cidade,estado);

-- DADOS TABELA GENITORES
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_genitores.csv'
INTO TABLE genitores
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome,rg,sexo,data_nascimento,telefone,id_endereco);

-- DADOS TABELA BEBÊS
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_bebes.csv'
INTO TABLE bebes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome,data_hora_nascimento,sexo,peso,altura,tipo_parto,id_pai,id_mae);

-- DADOS TABELA CARGOS
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_cargos.csv'
INTO TABLE cargos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_cargo, descricao_cargo);

-- DADOS TABELA PROFISSIONAIS DE SAÚDE
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_profissionais.csv'
INTO TABLE profissionais_saude
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_profissional,nome,rg,cpf,data_nascimento,registro_ordem,id_cargo);

-- DADOS TABELA PROFISSIONAL BEBÊ
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_profissionalbebe.csv'
INTO TABLE profissionais_bebe
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_bebe,id_profissional);

-- DADOS TABELA USUÁRIOS
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_usuarios.csv'
INTO TABLE usuarios
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome,email,senha,ativo);

-- DADOS TABELA LOGIN
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_login.csv'
INTO TABLE login
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_usuario,data_hora_login,ip_login);

-- DADOS TABELA PAPÉIS
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_papeis.csv'
INTO TABLE papeis
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome_papel);

-- DADOS TABELA PERMISSÕES
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_permissoes.csv'
INTO TABLE permissoes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(nome_permissao);

-- DADOS TABELA PAPEL PERMISSÕES
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_papelpermissao.csv'
INTO TABLE papel_permissoes
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_papel,id_permissao);

-- DADOS TABELA PROFISSIONAL PAPÉIS
LOAD DATA INFILE 'C:\\Users\\0040482311050\\Downloads\\dados_usuariopapel.csv'
INTO TABLE usuario_papeis
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_usuario,id_papel);