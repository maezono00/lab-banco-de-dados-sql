<?php
//1. Hello World
echo "Hello, World!!! <br><br>";

//2- Variáveis e Concatenação
$nome = "João";
echo "Olá, " . $nome . "!<br><br>";

//2.1- Operador Ponto (.)
$nome = "João";
$sobrenome = "da Silva";
$nomecompleto = $nome . " " . $sobrenome;

echo $nomecompleto . "<br><br>";

// 2.2- Operador de Atribuição Composto (.=):
/*
Você pode usar o operador .= para adicionar uma string a uma variável 
existente.
*/

$mensagem = "Olá, ";
$nome = "João";
$mensagem .= $nome;

echo $mensagem . "<br><br>";

//2.3- Usando aspas duplas
/*
Dentro de aspas duplas, você pode incorporar variáveis diretamente na 
string sem usar o operador ., o que torna o código mais legível.
*/

$nome = "Arthur";
$mensagem = "Olá, $nome!! <br><br>";

echo $mensagem;

//2.4- Usando a função sprintf()
/*
A função sprintf() permite formatar uma string com espaços reservados 
para variáveis, tornando a concatenação mais estruturada.
*/

$nome = "Heitor";
$sobrenome = "Barros";
$nomecompleto = sprintf("%s %s", $nome, $sobrenome);

echo $nomecompleto . "<br><br>";

//3- Operadores Aritméticos
$a = 10;
$b = 4;

// Adição
$resultado_adicao = $a + $b;
echo "Adição: $a + $b = $resultado_adicao<br>";

// Subtração
$resultado_subtracao = $a - $b;
echo "Subtração: $a - $b = $resultado_subtracao<br>";

// Multiplicação
$resultado_multiplicacao = $a * $b;
echo "Multiplicação: $a * $b = $resultado_multiplicacao<br>";

// Divisão
$resultado_divisao = $a / $b;
echo "Divisão: $a / $b = $resultado_divisao<br>";

// Módulo (Resto de divisão)
$resultado_modulo = $a % $b;
echo "Módulo: $a % $b = $resultado_modulo<br>";

//Incremento
$a ++;
echo "Incremento de 'a': $a <br>";

//Descremento
$b --;
echo "Decremento de 'b': $b <br><br>";

//4- Condicionais (IF-ELSE)
$idade = 18;
if ($idade >= 18)
{
    echo "Você é maior de idade.<br><br>";
}
else
{
    echo "Você é menor de idade.<br><br>";
}

//4.1 Estrutura if-elseif-else
/*
Esta estrutura é usada quando você precisa verificar várias condições 
diferentes.
*/

$nota = 75;

if ($nota >= 90)
{
    echo "Nota A";
}
elseif ($note >= 80)
{

}

?>