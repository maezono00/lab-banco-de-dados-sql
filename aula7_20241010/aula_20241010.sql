-- a. criar database;
CREATE DATABASE aula_20241010;
USE aula_20241010;

-- b. criar tabelas e relacionamentos
CREATE TABLE Venda
(
	CodVenda INT(11) NOT NULL PRIMARY KEY,
    DataVenda DATE NOT NULL,
    CodCliente INT(11),
    TotalVendas FLOAT
);

CREATE TABLE Estoque
(
	CodProduto INT(11) NOT NULL PRIMARY KEY,
    Descricao VARCHAR(255),
    Estoque INT(11) NOT NULL
);

CREATE TABLE ItensVenda
(
	CodItem INT(11) NOT NULL PRIMARY KEY,
    CodVenda INT(11) NOT NULL,
    CodProduto INT(11) NOT NULL,
    QtdeProduto INT(11) NOT NULL,
    ValorUnitario FLOAT,
    FOREIGN KEY (CodVenda) REFERENCES Venda(CodVenda),
    FOREIGN KEY (CodProduto) REFERENCES Estoque(CodProduto)
);

-- c. popular as tabelas com 5 registros cada
INSERT INTO Venda (CodVenda, DataVenda, CodCliente, TotalVendas) VALUES
(1, '2024-10-01', 101, 250.00),
(2, '2024-10-02', 102, 300.50),
(3, '2024-10-03', 103, 150.75),
(4, '2024-10-04', 104, 400.00),
(5, '2024-10-05', 105, 500.25);

INSERT INTO Estoque (CodProduto, Descricao, Estoque) VALUES
(1, 'Produto A', 100),
(2, 'Produto B', 50),
(3, 'Produto C', 200),
(4, 'Produto D', 75),
(5, 'Produto E', 30);

INSERT INTO ItensVenda (CodItem, CodVenda, CodProduto, QtdeProduto, ValorUnitario) VALUES
(1, 1, 1, 2, 125.00),
(2, 1, 2, 1, 250.00),
(3, 2, 3, 1, 300.50),
(4, 3, 1, 1, 150.75),
(5, 4, 4, 3, 133.33);

-- d. criar uma procedure p/ inserir as vendas e seus itens
DELIMITER //
CREATE PROCEDURE InserirVenda (IN p_CodVenda INT(11), IN p_DataVenda DATE, IN p_CodCliente INT(11), IN p_TotalVendas FLOAT, IN p_CodItem INT(11), IN p_CodProduto INT(11), IN p_QtdeProduto INT(11), IN p_ValorUnitario FLOAT)
BEGIN
	DECLARE v_TotalVendas FLOAT;
    SET v_TotalVendas = p_QtdeProduto * p_ValorUnitario;
    
	INSERT INTO Venda(CodVenda, DataVenda, CodCliente, TotalVendas)
    VALUES (p_CodVenda, p_DataVenda, p_CodCliente, p_TotalVendas);
    
    INSERT INTO ItensVenda(CodItem, CodVenda, CodProduto, QtdeProduto, ValorUnitario)
    VALUES(p_CodItem, p_CodVenda, p_CodProduto, p_QtdeProduto, p_ValorUnitario);
    
    UPDATE Venda
    SET TotalVendas = (SELECT SUM(QtdeProduto * ValorUnitario) 
                       FROM ItensVenda 
                       WHERE CodVenda = p_CodVenda)
    WHERE CodVenda = p_CodVenda;
END//
DELIMITER ;

DROP PROCEDURE InserirVenda;

CALL InserirVenda(1004, '2024-10-10', 101, 0, 1004, 2, 3, 100.00);

-- e. criar uma trigger p/ atualizar o estoque a cada venda
DELIMITER //
CREATE TRIGGER EstoqueItensVendaUpdate
AFTER UPDATE ON Estoque
FOR EACH ROW
BEGIN
	SET NEW.Estoque = OLD.Estoque - QtdeProdutos;
END //
DELIMITER ; 

-- f. Criar uma trigger p/ atualizar o estoque caso a venda seja cancelada, obviamente, excluir os itens da venda; fazer exclusão da venda usando procedure
ALTER TABLE Venda
ADD COLUMN Estado ENUM ('Ativa', 'Cancelada')
NOT NULL DEFAULT 'Ativa';

DELIMITER //
CREATE TRIGGER VendasCancelarUpdate
AFTER UPDATE ON Venda
FOR EACH ROW
BEGIN
	IF NEW.Estado = 'Cancelada' THEN
		UPDATE Estoque
        SET Estoque = Estoque + (
			SELECT SUM(QtdeProduto) FROM ItensVenda WHERE CodVenda = OLD.CodVenda
        )
        WHERE CodProduto IN (
			SELECT CodProduto FROM ItensVenda WHERE CodVenda = OLD.CodVenda
        );
	END IF;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ApagarVenda (IN p_CodVenda INT(11))
BEGIN
	DELETE FROM ItensVenda
    WHERE CodVenda = p_CodVenda;
END//
DELIMITER ;

-- Teste do item f
SET SQL_SAFE_UPDATES = 0;

UPDATE Venda
SET Estado = 'Cancelada'
WHERE CodVenda = 1002;

CALL ApagarVenda (1002);

-- g. Implementar um controle da transações (commit e rollback) na exclusão de venda
DELIMITER //

CREATE PROCEDURE ExcluirVenda (IN p_CodVenda INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    DELETE FROM ItensVenda
    WHERE CodVenda = p_CodVenda;

    DELETE FROM Venda
    WHERE CodVenda = p_CodVenda;

	COMMIT;
END//

DELIMITER ;

CALL ExcluirVenda(1003);

