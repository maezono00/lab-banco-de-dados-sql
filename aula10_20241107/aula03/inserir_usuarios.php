<?php

require 'config.php';

//FUNÇÃO PARA GERAR TOKEN (PODE SER USADA PARA A RECUPERAÇÃO DE SENHAS)
function generateToken()
{
    return bin2hex(random_bytes(16));
}

//DADOS DOS USUÁRIOS
$usuarios =
[
    ['nome' => 'Clerivaldo', 'email' => 'clerivaldo.roccia@gmail.com', 'senha' => 'cleris']
];

//PREPARAR A CONSULTA SQL PARA INSERIR USUÁRIOS
$stmt = $conn -> prepare ("INSERT INTO usuarios (nome, email, senha, token) VALUES (?, ?, ?, ?)");

foreach ($usuarios as $usuario)
{
    $nome = $usuario['nome'];
    $email = $usuario['email'];
    $senha = password_hash($usuario['senha'], PASSWORD_DEFAULT);
    $token = generateToken();
    $stmt -> bind_param("ssss", $nome, $email, $senha, $token);
    $stmt -> execute();
}

echo "Usuários inseridos com sucesso!!!";
?>