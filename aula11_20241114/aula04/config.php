<?php

$servername = "localhost";
$username = "root";
$password = ""; //COLOQUE AQUI A SENHA DO BANCO DE DADOS, SE HOUVER.
$dbname = "escola";

//CRIAR CONEXÃO
$conn = new mysqli($servername, $username, $password, $dbname);

//VERIFICAR CONEXÃO
if ($conn -> connect_error)
{
    die("Conexão falhou: " . $conn -> connect_error);
}

?>