<?php
session_start();
require 'config.php';

function generateToken()
{
    return bin2hex(random_bytes(16));
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);
    $token = generateToken();

    $stmt = $conn -> prepare ("INSERT INTO usuarios (nome, email, senha, token) VALUES (?, ?, ?, ?)");
    $stmt -> bind_param("ssss", $nome, $email, $senha, $token);
    $stmt -> execute();

    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastre-se</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Cadastre-se</h2>
    <form method="post">
        <input type="text" name="nome" required placeholder="Nome">
        <input type="text" name="email" required placeholder="E-mail">
        <input type="password" name="senha" required placeholder="Senha">
        <button type="submit">Cadastre-se</button>
    </form>
</body>
</html>
