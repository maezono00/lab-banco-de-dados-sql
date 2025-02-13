<?php

session_start();
require 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
    $email = $_POST['email'];
    $senha = $_POST['senha'];

    $stmt = $conn -> prepare("SELECT * FROM usuarios WHERE email = ?");
    $stmt -> bind_param("s", $email);
    $stmt -> execute();
    $result = $stmt -> get_result();

    if ($result -> num_rows === 1)
    {
        $user = $result -> fetch_assoc();
        if (password_verify($senha, $user['senha']))
        {
            $_SESSION['user_id'] = $user['id'];
            header("Location: index.php");
            exit();
        }
        else
        {
            $error = "Senha incorreta!!!";
        }
    }
    else
    {
        $error = "Usuário não foi encontrado!!!";
    }
}

?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Login</h2>
    <?php if (isset($error)) { echo "<p>$error</p>"; } ?>
    <form method="post">
        <input type="email" name="email" required placeholder="Email">
        <input type="password" name="senha" required placeholder="Senha">
        <button type="submit">Login</button>
    </form>
    <a href="forgot_password.php">Esqueceu a senha?</a>
</body>
</html>