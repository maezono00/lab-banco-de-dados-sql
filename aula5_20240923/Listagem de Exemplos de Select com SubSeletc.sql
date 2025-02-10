
-- Listar usuários que pegaram livros emprestados:
SELECT Nome 
FROM Usuarios 
WHERE UsuarioID IN (SELECT UsuarioID FROM Emprestimos);

-- Listar títulos de livros que foram emprestados:
SELECT Titulo 
FROM Livros 
WHERE LivroID IN (SELECT LivroID FROM Emprestimos);

-- Encontrar os usuários que não têm nenhum empréstimo:
SELECT Nome 
FROM Usuarios 
WHERE UsuarioID NOT IN (SELECT UsuarioID FROM Emprestimos);

-- Contar o número de livros emprestados por cada usuário:
SELECT U.Nome, 
       (SELECT COUNT(*) FROM Emprestimos E WHERE E.UsuarioID = U.UsuarioID) AS TotalEmprestimos
FROM Usuarios U;

-- Listar os livros que estão disponíveis e não foram emprestados:
SELECT Titulo 
FROM Livros 
WHERE Disponivel = true 
AND LivroID NOT IN (SELECT LivroID FROM Emprestimos);

-- Encontrar o nome do usuário que mais emprestou livros:
SELECT Nome 
FROM Usuarios 
WHERE UsuarioID = (SELECT UsuarioID 
                   FROM Emprestimos 
                   GROUP BY UsuarioID 
                   ORDER BY COUNT(*) DESC 
                   LIMIT 1);

-- Listar os empréstimos com as informações do usuário e livro:
SELECT U.Nome AS NomeUsuario, L.Titulo AS TituloLivro 
FROM Emprestimos E 
JOIN Usuarios U ON E.UsuarioID = U.UsuarioID 
JOIN Livros L ON E.LivroID = L.LivroID;

-- Encontrar livros emprestados com data de devolução prevista no futuro:
SELECT Titulo 
FROM Livros 
WHERE LivroID IN (SELECT LivroID 
                  FROM Emprestimos 
                  WHERE DataDevolucaoPrevista > CURRENT_DATE);

-- Listar penalidades acumuladas por usuários:
SELECT U.Nome, 
       (SELECT SUM(Penalidade) FROM Devolucoes D WHERE D.EmprestimoID IN 
        (SELECT EmprestimoID FROM Emprestimos E WHERE E.UsuarioID = U.UsuarioID)) AS TotalPenalidade
FROM Usuarios U;

-- Obter o número total de livros na biblioteca:
SELECT (SELECT COUNT(*) FROM Livros) AS TotalLivros;


-- Listar os tipos de usuários que têm empréstimos ativos:
SELECT DISTINCT T.Nome 
FROM TiposDeUsuarios T 
WHERE T.TipoUsuarioID IN (SELECT U.TipoUsuarioID FROM Usuarios U 
                           WHERE U.UsuarioID IN (SELECT UsuarioID FROM Emprestimos));

-- Encontrar a média de penalidades das devoluções:
SELECT AVG(Penalidade) 
FROM Devolucoes 
WHERE Penalidade IS NOT NULL;

-- Listar usuários que pegaram livros emprestados:
SELECT Nome 
FROM Usuarios 
WHERE UsuarioID IN (SELECT UsuarioID FROM Emprestimos);

-- Listar títulos de livros que foram emprestados:
SELECT Titulo 
FROM Livros 
WHERE LivroID IN (SELECT LivroID FROM Emprestimos);

-- Encontrar os usuários que não têm nenhum empréstimo:
SELECT Nome 
FROM Usuarios 
WHERE UsuarioID NOT IN (SELECT UsuarioID FROM Emprestimos);

-- Contar o número de livros emprestados por cada usuário:
SELECT U.Nome, 
       (SELECT COUNT(*) FROM Emprestimos E WHERE E.UsuarioID = U.UsuarioID) AS TotalEmprestimos
FROM Usuarios U;

-- Listar os livros que estão disponíveis e não foram emprestados:
SELECT Titulo 
FROM Livros 
WHERE Disponivel = true 
AND LivroID NOT IN (SELECT LivroID FROM Emprestimos);

-- Encontrar o nome do usuário que mais emprestou livros:
SELECT Nome 
FROM Usuarios 
WHERE UsuarioID = (SELECT UsuarioID 
                   FROM Emprestimos 
                   GROUP BY UsuarioID 
                   ORDER BY COUNT(*) DESC 
                   LIMIT 1);
				   
-- Listar os empréstimos com as informações do usuário e livro:
SELECT U.Nome AS NomeUsuario, L.Titulo AS TituloLivro 
FROM Emprestimos E 
JOIN Usuarios U ON E.UsuarioID = U.UsuarioID 
JOIN Livros L ON E.LivroID = L.LivroID;

-- Encontrar livros emprestados com data de devolução prevista no futuro:
SELECT Titulo 
FROM Livros 
WHERE LivroID IN (SELECT LivroID 
                  FROM Emprestimos 
                  WHERE DataDevolucaoPrevista > CURRENT_DATE);

-- Listar penalidades acumuladas por usuários:
SELECT U.Nome, 
       (SELECT SUM(Penalidade) FROM Devolucoes D WHERE D.EmprestimoID IN 
        (SELECT EmprestimoID FROM Emprestimos E WHERE E.UsuarioID = U.UsuarioID)) AS TotalPenalidade
FROM Usuarios U;

-- Obter o número total de livros na biblioteca:
SELECT (SELECT COUNT(*) FROM Livros) AS TotalLivros;

-- Listar os tipos de usuários que têm empréstimos ativos:
SELECT DISTINCT T.Nome 
FROM TiposDeUsuarios T 
WHERE T.TipoUsuarioID IN (SELECT U.TipoUsuarioID FROM Usuarios U 
                           WHERE U.UsuarioID IN (SELECT UsuarioID FROM Emprestimos));

-- Encontrar a média de penalidades das devoluções:
SELECT AVG(Penalidade) 
FROM Devolucoes 
WHERE Penalidade IS NOT NULL;
