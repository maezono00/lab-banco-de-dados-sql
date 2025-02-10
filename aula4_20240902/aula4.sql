-- Consultas para a Tabela Enderecos
-- 1. Selecionar todos os endereços
SELECT * FROM Enderecos;

-- 2.Selecionar endereços na cidade de 'São Paulo'
SELECT * FROM Enderecos WHERE cidade = 'São Paulo';

-- 3.Selecionar endereços com o estado 'RJ'
SELECT * FROM Enderecos WHERE estado = 'RJ';

-- 4. Selecionar endereços onde o complemento é 'Apto 101':
SELECT * FROM Enderecos WHERE complemento = 'Apto 101';

-- 5. Selecionar endereços com CEP começando com '123'
SELECT * FROM Enderecos WHERE cep LIKE '123%';

-- Consultas para a Tabela Genitores
-- 6. Selecionar todos os genitores:
SELECT * FROM Genitores;

-- 7. Selecionar genitores com o nome 'Maria Silva'
SELECT * FROM Genitores WHERE nome = 'Maria Silva';

-- 8. Selecionar genitores do sexo 'F':
SELECT * FROM Genitores WHERE sexo = 'F';

-- 9. Selecionar genitores que nasceram após 1980-01-01
SELECT * FROM Genitores WHERE data_nascimento > '1980-01-01';

-- 10. Selecionar genitores com RG começando com 'MG'
SELECT * FROM Genitores WHERE RG LIKE 'MG%';

-- Consultas para a Tabela Bebes
-- 11. Selecionar todos os bebês:
SELECT * FROM Bebes;

-- 12. Selecionar bebês do sexo 'M'
SELECT * FROM Bebes WHERE sexo = 'M';

-- 13. Selecionar bebês nascidos antes de 2024-09-05
SELECT * FROM Bebes WHERE data_hora_nascimento < '2024-09-05';

SELECT * FROM profissionais_saude, profissionais_bebe, cargos WHERE profissionais_saude.id_profissional = profissionais_bebe.id_profissional AND profissionais_saude.id_cargo = cargos.id_cargo AND profissionais_saude.registro_ordem = '1121-mg';

SELECT * FROM profissionais_saude, profissionais_bebe, genitores
