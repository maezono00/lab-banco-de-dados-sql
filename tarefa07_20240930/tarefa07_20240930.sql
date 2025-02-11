CREATE DATABASE tarefa_triggers;
USE tarefa_triggers;

-- Tabela de Tipos de Usuários
CREATE TABLE TiposDeUsuarios (
    TipoUsuarioID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

-- Tabela de Usuários
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    TipoUsuarioID INT,
    FOREIGN KEY (TipoUsuarioID) REFERENCES TiposDeUsuarios(TipoUsuarioID)
);

-- Tabela de Livros
CREATE TABLE Livros (
    LivroID INT PRIMARY KEY,
    Titulo VARCHAR(255) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    AnoPublicacao INT,
    Disponivel BOOLEAN NOT NULL
);

-- Tabela de Empréstimos
CREATE TABLE Emprestimos (
    EmprestimoID INT PRIMARY KEY,
    UsuarioID INT,
    LivroID INT,
    DataEmprestimo DATE NOT NULL,
    DataDevolucaoPrevista DATE NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(UsuarioID),
    FOREIGN KEY (LivroID) REFERENCES Livros(LivroID)
);

-- Tabela de Devoluções
CREATE TABLE Devolucoes (
    DevolucaoID INT PRIMARY KEY,
    EmprestimoID INT,
    DataDevolucao DATE NOT NULL,
    Penalidade DECIMAL(10, 2),
    FOREIGN KEY (EmprestimoID) REFERENCES Emprestimos(EmprestimoID)
);

-- Inserindo dados
-- Inserir registros na tabela TiposDeUsuarios
INSERT INTO TiposDeUsuarios (TipoUsuarioID, Nome)
VALUES
    (1, 'Estudante'),
    (2, 'Professor'),
    (3, 'Funcionário'),
    (4, 'Visitante'),
    (5, 'Bibliotecário');

-- Inserir registros na tabela Usuarios
INSERT INTO Usuarios (UsuarioID, Nome, TipoUsuarioID)
VALUES
    (1, 'João Silva', 1),
    (2, 'Maria Santos', 2),
    (3, 'Pedro Alves', 1),
    (4, 'Ana Pereira', 3),
    (5, 'Lucas Oliveira', 4);

-- Inserir registros na tabela Livros
INSERT INTO Livros (LivroID, Titulo, Autor, AnoPublicacao, Disponivel)
VALUES
    (1, 'Dom Casmurro', 'Machado de Assis', 1899, true),
    (2, 'A Revolução dos Bichos', 'George Orwell', 1945, true),
    (3, 'Cem Anos de Solidão', 'Gabriel García Márquez', 1967, true),
    (4, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, true),
    (5, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, true);

-- Inserir registros na tabela Emprestimos
INSERT INTO Emprestimos (EmprestimoID, UsuarioID, LivroID, DataEmprestimo, DataDevolucaoPrevista)
VALUES
    (1, 1, 2, '2023-08-15', '2023-09-15'),
    (2, 3, 1, '2023-08-20', '2023-09-20'),
    (3, 2, 4, '2023-08-25', '2023-09-25'),
    (4, 4, 3, '2023-08-30', '2023-09-30'),
    (5, 5, 5, '2023-09-01', '2023-10-01');

-- Inserir registros na tabela Devolucoes
INSERT INTO Devolucoes (DevolucaoID, EmprestimoID, DataDevolucao, Penalidade)
VALUES
    (1, 1, '2023-09-16', 0.00),
    (2, 2, '2023-09-21', 0.00),
    (3, 3, '2023-09-28', 0.00),
    (4, 4, '2023-10-05', 0.00),
    (5, 5, '2023-10-02', 0.00);
    
-- Retornando dados
#Quando um empréstimo for realizado, baixar a quantidade disponível na tabela livros;
ALTER TABLE livros
DROP COLUMN Disponivel;

ALTER TABLE livros
ADD COLUMN QuantidadeDisponivel INT NOT NULL DEFAULT 1;

#CRIAÇÃO DO TRIGGER
DELIMITER $

CREATE TRIGGER Tgr_Emprestimos_Insert
AFTER INSERT
ON Emprestimos
FOR EACH ROW
BEGIN
    UPDATE Livros
    SET QuantidadeDisponivel = QuantidadeDisponivel - 1
    WHERE LivroID = NEW.LivroID AND QuantidadeDisponivel > 0;
    
    UPDATE Livros
    SET Disponivel = 0
    WHERE LivroID = NEW.LivroID AND QuantidadeDisponivel = 0;
END$

DELIMITER ;

DROP TRIGGER Tgr_Emprestimos_Insert;

# Teste de inserção de um novo empréstimo
INSERT INTO Emprestimos (EmprestimoID, UsuarioID, LivroID, DataEmprestimo, DataDevolucaoPrevista)
VALUES (7, 1, 4, '2023-09-10', '2023-10-10');

#quando um livro for devolvido, aumentar a quantidade na tabela livros.
DELIMITER $
CREATE TRIGGER Tgr_Devolucoes_Insert AFTER INSERT
ON Devolucoes
FOR EACH ROW
BEGIN
  UPDATE Livros
  SET Quantidade = Quantidade + 1
  WHERE LivroID = (SELECT LivroID FROM Emprestimos WHERE EmprestimoID = NEW.EmprestimoID);
END $

DROP TRIGGER Tgr_Devolucoes_Insert;

#TESTE DE INSERÇÃO DE UMA NOVA DEVOLUÇÃO
INSERT INTO Devolucoes (DevolucaoID, EmprestimoID, DataDevolucao, Penalidade)
VALUES (9, 7, '2023-10-02', 0.00);