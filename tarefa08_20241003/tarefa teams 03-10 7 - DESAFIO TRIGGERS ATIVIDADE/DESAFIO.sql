create database desafio;
use desafio;

create table BDx(
	id int PRIMARY KEY,
    nome varchar(50),
    data_criacao date
);

create table BDy(
	id INT PRIMARY KEY,
    nome varchar(50),
    data_criacao date
);

-- ----------------------------TRIGGER----------------------------


DELIMITER //

CREATE TRIGGER trigger_inserir_y
AFTER INSERT ON BDx
FOR EACH ROW
BEGIN
    INSERT INTO BDy (id, nome, data_criacao)
    VALUES (NEW.id, NEW.nome, NEW.data_criacao);
END;

//
DELIMITER ;

