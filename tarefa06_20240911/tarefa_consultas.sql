-- Consultas Básicas
-- 1. Selecionar todos os endereços.
SELECT * FROM Enderecos;

-- 2. Selecionar apenas os nomes e telefones dos genitores.
SELECT nome, telefone FROM genitores;

-- 3. Selecionar todos os bebês nascidos em setembro de 2024.
SELECT * FROM Bebes WHERE data_hora_nascimento BETWEEN '2024-09-01' AND '2024-09-30';

-- 4. Selecionar os genitores e seus endereços.
SELECT G.nome, E.rua, E.numero, E.cidade
FROM Genitores G
JOIN Enderecos E ON G.id_endereco = E.id_endereco;

-- 5. Selecionar os bebês com peso acima de 3,5 kg.
SELECT nome, peso FROM Bebes WHERE peso > 3.5;

-- Ordenação e Limitação
-- 6. Selecionar todos os bebês ordenados pelo peso em ordem decrescente.
SELECT * FROM Bebes ORDER BY Peso DESC;

-- 7. Selecionar os 5 primeiros genitores mais recentes em termos de data de nascimento.
SELECT * FROM Genitores ORDER BY data_nascimento DESC LIMIT 5;

-- 8. Selecionar os 3 bebês mais pesados que nasceram no mês de setembro de 2024.
SELECT nome, peso FROM Bebes
WHERE data_hora_nascimento BETWEEN '2024-09-01' AND '2024-09-30'
ORDER BY peso DESC LIMIT 3;

-- Filtragem Avançada
-- 9. Selecionar bebês que têm o mesmo tipo de parto ('Normal') e são do sexo masculino.
SELECT * FROM Bebes WHERE tipo_parto = 'Normal' AND sexo = 'M';

-- 10. Selecionar genitores cujo nome começa com 'M'.
SELECT * FROM Genitores WHERE nome LIKE 'M%';

-- 11. Selecionar os profissionais de saúde que trabalham como 'Pediatra' ou 'Enfermeiro'.
SELECT nome FROM Profissionais_Saude
JOIN Cargos ON Profissionais_Saude.id_cargo = Cargos.id_cargo
WHERE descricao_cargo IN ('Pediatra', 'Enfermeiro');

-- 12. Selecionar todos os bebês e genitores que não têm um tipo de parto 'Cesárea'.
SELECT B.nome AS Bebes, G.nome AS Genitor FROM Bebes B
JOIN Genitores G ON (B.id_pai = G.id_genitor OR B.id_mae = G.id_genitor)
WHERE B.tipo_parto <> 'Cesárea';

-- Agrupamento e Agregação
-- 13. Contar o número total de bebês nascidos por tipo de parto.
SELECT tipo_parto, COUNT(*) AS total_bebes
FROM Bebes
GROUP BY tipo_parto;

-- 14. Encontrar a média de peso dos bebês.
SELECT AVG(peso) AS media_peso FROM Bebes;

-- 15. Selecionar o nome e o total de bebês nascidos por genitor (pai).
SELECT G.nome, COUNT(B.id_bebe)
FROM Genitores G
JOIN Bebes B ON G.id_genitor  = B.id_pai
GROUP BY G.nome;

-- 16. Encontrar o bebê mais pesado de cada tipo de parto.
SELECT tipo_parto, nome, peso
FROM Bebes
WHERE (tipo_parto, peso) IN
(SELECT tipo_parto, MAX(peso)
FROM Bebes
GROUP BY tipo_parto);

-- Joins e Relacionamentos
-- 17. Selecionar os nomes dos bebês e os nomes dos profissionais de saúde que os atenderam.
SELECT B.nome AS Bebê, P.nome AS Profissional
FROM Bebes B 
JOIN Profissionais_Bebe PB ON B.id_bebe = PB.id_bebe
JOIN Profissionais_Saude P ON PB.id_profissional = P.id_profissional;

-- 18. Selecionar todos os genitores e os respectivos bebês que nasceram em 2024.
SELECT G.nome AS Genitor, B.nome AS Bebê
FROM Genitores G
JOIN Bebes B ON (G.id_genitor = B.id_pai OR G.id_genitor = B.id_mae)
WHERE YEAR(B.data_hora_nascimento) = 2024;

-- 19. Selecionar todos os bebês e seus endereços através dos genitores.
SELECT B.nome AS Bebê, E.rua, E.numero
FROM Bebes B
JOIN Genitores G ON (B.id_pai = G.id_genitor OR B.id_mae = G.id_genitor)
JOIN Enderecos E ON G.id_endereco = E.id_endereco;

-- 20. Selecionar os profissionais de saúde e os cargos que ocupam.
SELECT P.nome AS Profissionais, C.descricao_cargo
FROM Profissionais_Saude P
JOIN Cargos C ON P.id_cargo = C.id_cargo;

-- Uso de Funções de Janela e Avançadas
-- 21. Selecionar o nome do bebê, o peso e a classificação de peso dentro de cada tipo de parto.
SELECT nome, peso, tipo_parto,
RANK() OVER (PARTITION BY tipo_parto ORDER BY peso DESC) AS classificacao_peso
FROM Bebes;

-- 22. Selecionar os genitores e a quantidade total de bebês que cada um gerou, ordenado pelo total em ordem decrescente.
SELECT G.nome, COUNT(*) AS total_bebes
FROM Genitores G
LEFT JOIN Bebes B ON (G.id_genitor = B.id_pai OR G.id_genitor = B.id_mae)
GROUP BY G.nome
ORDER BY total_bebes DESC;

-- 23. Selecionar os bebês e o nome dos genitores que os atenderam.
SELECT B.nome AS Bebê, G.nome AS Genitor 
FROM Bebes B
JOIN Genitores G ON (B.id_pai = G.id_genitor OR B.id_mae = 
G.id_genitor);

-- 24. Selecionar o nome dos bebês e a data do nascimento, mostrando a diferença em dias desde o nascimento até hoje.
SELECT nome, data_hora_nascimento, 
DATEDIFF(CURDATE(), data_hora_nascimento) AS 
dias_desde_nascimento
FROM Bebes;

-- Subconsultas
-- 25. Selecionar todos os bebês cujo peso é maior que a média de peso de todos os bebês.
SELECT * FROM Bebes
WHERE peso > (SELECT AVG(peso) FROM Bebes);

-- 26. Selecionar os nomes dos genitores que têm pelo menos um bebê nascido em 2024.
SELECT DISTINCT G.nome 
FROM Genitores G
JOIN Bebes B ON (G.id_genitor = B.id_pai OR G.id_genitor = 
B.id_mae)
WHERE YEAR(B.data_hora_nascimento) = 2024;

-- 27. Selecionar os bebês com mais de um profissional de saúde associado.
SELECT B.nome 
FROM Bebes B
JOIN Profissionais_Bebe PB ON B.id_bebe = PB.id_bebe
GROUP BY B.id_bebe
HAVING COUNT(PB.id_profissional) > 1;

-- 28. Selecionar os genitores que não possuem nenhum bebê registrado.
SELECT G.nome 
FROM Genitores G
LEFT JOIN Bebes B ON (G.id_genitor = B.id_pai OR G.id_genitor = 
B.id_mae)
WHERE B.id_bebe IS NULL;

-- Manipulação Avançada
-- 29. Selecionar todos os endereços e, se existirem, mostrar a quantidade de bebês registrados em cada endereço.
SELECT E.*, 
(SELECT COUNT(*) FROM Genitores G 
JOIN Bebes B ON (G.id_genitor = B.id_pai OR G.id_genitor = 
B.id_mae)
WHERE G.id_endereco = E.id_endereco) AS total_bebes
FROM Enderecos E;

-- 30. Selecionar o nome dos profissionais de saúde e a quantidade de bebês que atenderam, ordenado pela quantidade de bebês em ordem decrescente.
SELECT P.nome, COUNT(PB.id_bebe) AS total_bebes 
FROM Profissionais_Saude P
JOIN Profissionais_Bebe PB ON P.id_profissional = 
PB.id_profissional
GROUP BY P.id_profissional
ORDER BY total_bebes DESC;

-- 31. Selecionar todos os bebês e, se existirem, mostrar o nome dos genitores e o tipo de parto associado.
SELECT B.nome AS Bebê, G.nome AS Genitor, B.tipo_parto
FROM Bebes B
JOIN Genitores G ON (B.id_pai = G.id_genitor OR B.id_mae = 
G.id_genitor);

-- 32. Selecionar todos os profissionais de saúde com registro de ordem começando com '1234'.
SELECT * FROM Profissionais_Saude WHERE registro_ordem LIKE '1234%';

-- Uso de Janela e Funções de Agregação
-- 33. Selecionar os bebês e o número acumulado de bebês por data de nascimento.
SELECT nome, data_hora_nascimento, 
ROW_NUMBER() OVER (ORDER BY data_hora_nascimento) AS 
numero_acumulado
FROM Bebes;

-- 34. Selecionar os bebês e a quantidade de dias desde o nascimento até o último dia de setembro de 2024.
SELECT nome, data_hora_nascimento, 
DATEDIFF('2024-09-30', data_hora_nascimento) AS 
dias_ate_final_setembro
FROM Bebes;

-- 35. Selecionar os genitores com a maior idade e mostrar a diferença em anos em relação ao genitor mais jovem.
SELECT nome, data_nascimento,
TIMESTAMPDIFF(YEAR, data_nascimento, (SELECT 
MIN(data_nascimento) FROM Genitores)) AS idade_diff
FROM Genitores
ORDER BY idade_diff DESC;

-- 36. Selecionar o nome dos bebês e a classificação do peso usando uma função de janela.
SELECT nome, peso, 
RANK() OVER (ORDER BY peso DESC) AS classificacao_peso
FROM Bebes;

-- Exportação e Variáveis
-- 37. Exportar os dados de todos os bebês para um arquivo CSV.
SELECT * INTO OUTFILE 'bebes.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY 
'\n'
FROM Bebes;

-- 38. Armazenar o total de bebês em uma variável e depois exibi-lo.
SET @total_bebes = (SELECT COUNT(*) FROM Bebes);
SELECT @total_bebes AS TotalDeBebes;

-- 39. Exportar o nome dos profissionais de saúde e seus cargos para um arquivo TXT.
SELECT P.nome, C.descricao_cargo INTO OUTFILE 
'profissionais_saude.txt'
FIELDS TERMINATED BY '\t' ENCLOSED BY '"' LINES TERMINATED BY 
'\n'
FROM Profissionais_Saude P
JOIN Cargos C ON P.id_cargo = C.id_cargo;

-- 40. Armazenar o nome do bebê mais leve em uma variável e exibi-lo.
SET @bebe_mais_leve = (SELECT nome FROM Bebes ORDER BY peso ASC 
LIMIT 1);
SELECT @bebe_mais_leve AS BebêMaisLeve;