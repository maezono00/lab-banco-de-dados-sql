CREATE DATABASE aula;
use aula;
CREATE TABLE alunos
(
	RA CHAR(13),
    NOME VARCHAR(100) NOT NULL,
    CPF CHAR(14) NOT NULL,
    DATANASCIMENTO DATE,
    PRIMARY KEY(RA)
);

SELECT * FROM ALUNOS;

INSERT INTO ALUNOS (RA, CPF, NOME, DATANASCIMENTO)
VALUES('0040482311000', 'MARIA GONÇALVES', '123-456-789-01', '2024-08-05');