CREATE DATABASE revisao;
USE revisao;

CREATE TABLE duplicata
(
	NOME CHAR(40),
    NUMERO INT NOT NULL PRIMARY KEY,
    VALOR DECIMAL(10,2),
    VENCIMENTO DATE,
    BANCO CHAR(10)
);

INSERT INTO duplicata (nome, numero, valor, vencimento, banco) VALUES
('ABC PAPELARIA', 100100, 5000.00, '2017-01-20', 'ITAU'),
('LIVRARIA FERNANDES', 100110, 2500.00, '2017-01-22', 'ITAU'),
('LIVRARIA FERNANDES', 100120, 1500.00, '2016-10-15', 'BRADESCO'),
('ABC PAPELARIA', 100130, 8000.00, '2016-10-15', 'SANTANDER'),
('LER E SABER', 200120, 10500.00, '2018-04-26', 'BANCO DO BRASIL'),
('LIVROS E CIA', 200125, 2000.00, '2018-04-26', 'BANCO DO BRASIL'),
('LER E SABER', 200130, 11000.00, '2018-09-26', 'ITAU'),
('PAPELARIA SILVA', 250350, 1500.00, '2018-01-26', 'BRADESCO'),
('LIVROS MM', 250360, 500.00, '2018-12-18', 'SANTANDER'),
('LIVROS MM', 250370, 3400.00, '2018-04-26', 'SANTANDER'),
('PAPELARIA SILVA', 250380, 3500.00, '2018-04-26', 'BANCO DO BRASIL'),
('LIVROS E CIA', 453360, 1500.00, '2018-06-15', 'ITAU'),
('LIVROS MM', 453365, 5400.00, '2018-06-15', 'BRADESCO'),
('PAPELARIA SILVA', 453370, 2350.00, '2017-12-27', 'ITAU'),
('LIVROS E CIA', 453380, 1550.00, '2017-12-27', 'BANCO DO BRASIL'),
('ABC PAPELARIA', 980130, 4000.00, '2016-12-11', 'ITAU'),
('LIVRARIA FERNANDES', 770710, 2500.00, '2016-11-15', 'SANTANDER'),
('ABC PAPELARIA', 985001, 3000.00, '2016-09-11', 'ITAU'),
('PAPEL E AFINS', 985002, 2500.00, '2016-03-12', 'SANTANDER'),
('LER E SABER', 888132, 2500.00, '2017-03-05', 'ITAU');

DROP TABLE duplicata;

-- 1. Listar nome,vencimento e valor de cada duplicata da tabela. 
SELECT NOME, VENCIMENTO, VALOR FROM duplicata;

-- 2. Apresentar o número das duplicatas depositadas no banco Itaú 
SELECT NUMERO FROM duplicata WHERE BANCO = 'ITAU';

-- 3. Apresentar o número de duplicatas depositadas no banco Itaú 
SELECT COUNT(NUMERO) FROM duplicata  WHERE BANCO = 'ITAU';

-- 4. Quais são as duplicatas (número, vencimento, valor e nome) que vencem no ano de 2017.
SELECT NUMERO, VENCIMENTO, VALOR, NOME FROM duplicata WHERE VENCIMENTO LIKE '2017%';

-- 5. Apresentar as duplicatas (número, vencimento, valor e nome) que não estão depositadas nos bancos Itaú e Santander.
SELECT NUMERO, VENCIMENTO, VALOR, NOME FROM duplicata WHERE BANCO NOT IN ('ITAU', 'SANTANDER');

-- 6. Quanto é o valor da divida o cliente PAPELARIA SILVA, e quais são as duplicatas? 
SELECT (SELECT SUM(VALOR) FROM duplicata WHERE NOME = 'PAPELARIA SILVA') AS 'DIVIDA DO CLIENTE',
	NOME, NUMERO, VALOR FROM duplicata WHERE NOME = 'PAPELARIA SILVA';

-- 7. Retirar da tabela a duplicata 770710 do cliente LIVRARIA FERNANDES, por ter sido devidamente quitada.
DELETE FROM duplicata WHERE NUMERO = '770710';

--  8. Apresentar uma listagem em ordem alfabética por nome do cliente de todos os campos da tabela. 
SELECT * FROM DUPLICATA ORDER BY NOME;

-- 9. Apresentar uma listagem em ordem de data de vencimento com o nome do cliente, banco, valor e vencimento.
SELECT NOME, BANCO, VALOR, VENCIMENTO FROM DUPLICATA ORDER BY VENCIMENTO;

-- 10. As duplicatas do Banco do Brasil foram transferidas para o Santander. Proceder o ajuste dos registros. 
UPDATE DUPLICATA SET BANCO = 'SANTANDER' WHERE BANCO = 'BANCO DO BRASIL';

SET SQL_SAFE_UPDATES = 0;

-- 11. Quais são os clientes que possuem suas duplicatas depositadas no Banco Bradesco? 
SELECT NOME, BANCO FROM DUPLICATA WHERE BANCO = 'BRADESCO';

-- 12. Qual é a previsão de recebimento no período de 01/01/2016 até 31/12/2016?
SELECT SUM(VALOR) AS VALOR_RECEBIDO FROM DUPLICATA WHERE VENCIMENTO BETWEEN '2016-01-01' AND '2016-12-31';

-- 13. Quanto a empresa tem para receber no período de 01/08/2016 até 30/08/2016?
SELECT SUM(VALOR) AS VALOR_RECEBER FROM DUPLICATA WHERE VENCIMENTO between '2016-08-01' AND '2016-08-30';

-- 14. Quais foram os itens adquiridos pelo cliente ABC PAPELARIA?
SELECT NOME, NUMERO FROM DUPLICATA WHERE NOME = 'ABC PAPELARIA';

-- 15. Acrescentar uma multa de 15% para todos os títulos que se encontram vencidos no período de 01/01/2016 até 31/12/2016.
UPDATE DUPLICATA SET VALOR = VALOR * 1.15 WHERE VENCIMENTO BETWEEN '2016-01-01' AND '2016-12-31';

-- 16. Acrescentar uma multa de 5% para todos os títulos vencidos entre 01/01/2017 e 31/05/2017 que sejam do cliente LER E SABER.
UPDATE DUPLICATA SET VALOR = VALOR * 1.05 WHERE VENCIMENTO BETWEEN '2017-01-01' AND '2017-05-31' AND NOME = 'LER E SABER';

-- 17. Qual é a média aritmética dos valores das duplicatas do ano de 2016?
SELECT AVG(VALOR) AS MEDIA_DUPLICATAS FROM DUPLICATA WHERE VENCIMENTO BETWEEN '2016-01-01' AND '2016-12-31';

-- 18. Exiba as duplicatas e nome dos respectivos clientes que possuem duplicatas com valor superior a 10000,00? 
SELECT NOME, VALOR FROM DUPLICATA WHERE VALOR > 10000;

-- 19. Qual o valor total das duplicatas lançadas para o banco Santander? 
SELECT SUM(VALOR) AS TOTAL_SANTANDER FROM DUPLICATA WHERE BANCO = 'SANTANDER';

-- 20. Quais são os clientes que possuem suas duplicatas depositadas nos Bancos Bradesco ou Itaú?
SELECT DISTINCT NOME, BANCO FROM DUPLICATA WHERE BANCO IN ('BRADESCO', 'ITAU');

-- PARA PRATICAR - EXERCÍCIOS COM RESPOSTA
-- 1. Criar uma nova tabela para armazenar históricos de alterações de duplicatas:
CREATE TABLE historico_duplicatas (
 id_historico INT AUTO_INCREMENT PRIMARY KEY,
 numero_duplicata INT NOT NULL,
 acao VARCHAR(20),
 data_acao DATE,
 valor_anterior DECIMAL(10,2),
 valor_novo DECIMAL(10,2),
 FOREIGN KEY (numero_duplicata) REFERENCES duplicata(numero)
);

-- 2. Adicionar uma nova coluna "juros" à tabela duplicata para registrar juros por atraso:
ALTER TABLE historico_duplicatas ADD JUROS DECIMAL(10,2) DEFAULT 0.0;

-- 3. Criar uma tabela de "clientes" para armazenar informações detalhadas dos clientes:
CREATE TABLE clientes (
 id_cliente INT AUTO_INCREMENT PRIMARY KEY,
 nome VARCHAR(100) NOT NULL,
 endereco VARCHAR(255),
 telefone VARCHAR(20),
 email VARCHAR(50)
);

-- 4. Criar uma tabela de "pagamentos" para registrar os pagamentos realizados pelos clientes:
CREATE TABLE pagamentos (
 id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
 numero_duplicata INT,
 data_pagamento DATE,
 valor_pago DECIMAL(10,2),
 FOREIGN KEY (numero_duplicata) REFERENCES duplicata(numero)
);

-- 5. Adicionar uma restrição de valor mínimo na coluna "valor" da tabela duplicata para garantir que nenhum valor seja inferior a 100.00:
ALTER TABLE DUPLICATA MODIFY VALOR DECIMAL(10,2) CHECK (VALOR >= 100);

-- 6. Criar um índice na coluna "vencimento" para otimizar consultas baseadas em datas:
CREATE INDEX idx_vencimento ON duplicata(vencimento);

-- 7. Adicionar uma coluna "status" à tabela duplicata para controlar se a duplicata está "Pendente" ou "Paga"
ALTER TABLE DUPLICATA ADD STATUS ENUM('PENDENTE', 'PAGA') DEFAULT 'PENDENTE';

-- 8. Modificar a coluna "banco" para aceitar apenas os valores 'ITAU', 'SANTANDER', 'BRADESCO', 'BANCO DO BRASIL':
ALTER TABLE DUPLICATA MODIFY BANCO ENUM('ITAU', 'SANTANDER', 'BRADESCO', 'BANCO DO BRASIL');

-- 9. Criar uma tabela de "multas" para armazenar o percentual de multas aplicadas:
CREATE TABLE multas (
 id_multa INT AUTO_INCREMENT PRIMARY KEY,
 numero_duplicata INT,
 percentual_multa DECIMAL(5,2),
 data_multa DATE,
 FOREIGN KEY (numero_duplicata) REFERENCES duplicata(numero)
);

-- 10. Remover a coluna "juros" da tabela duplicata:
ALTER TABLE HISTORICO_DUPLICATAS DROP COLUMN JUROS;

-- 1. Listar todos os clientes que têm duplicatas vencidas há mais de 90 dias, com seus valores e datas de vencimento:
SELECT NOME, VALOR, VENCIMENTO FROM DUPLICATA WHERE DATEDIFF(CURDATE(), VENCIMENTO) > 90;

-- 2. Calcular o total de duplicatas vencidas em cada banco:
select banco, sum(valor) as total_vencido from duplicata where vencimento < curdate() group by banco;

-- 3. Listar as duplicatas cuja multa aplicada é maior que 500,00
SELECT d.numero, d.nome, m.percentual_multa, d.valor, (d.valor * m.percentual_multa / 100) AS valor_multa
FROM duplicata d
JOIN multas m ON d.numero = m.numero_duplicata
WHERE (d.valor * m.percentual_multa / 100) > 500.00;