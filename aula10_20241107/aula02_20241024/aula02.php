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
    echo "Nota A<br><br>";
}
elseif ($nota >= 80)
{
    echo "Nota B<br><br>";
}
elseif ($nota >= 70)
{
    echo "Nota C<br><br>";
}
else
{
    echo "Nota D<br><br>";
}

//4.2- Operador ternário
/*
O operador ternário é uma forma concisa de escrever uma estrutura 
condicional if-else.
*/
$idade = 20;
$status = ($idade >= 18) ? "Maior de idade<br><br>" : "Menor de idade<br><br>";
echo $status;

//4.3- Estrutura switch-case:
/*
É útil quando você tem muitas condições a serem verificadas.
*/

$dia = "Domingo";
switch ($dia)
{
    case "Segunda":
        echo "Hoje é segunda-feira.<br><br>";
        break;
    case "Terça":
        echo "Hoje é terça-feira.<br><br>";
        break;
    default:
        echo "Outro dia da semana.<br><br>";
}

//4.4- Operadores lógicos
/*
Além dos operadores de comparação (==, !=, >, <, >=, <=), você também 
pode usar operadores lógicos como && (AND), || (OR) e ! (NOT) para 
criar condições mais complexas.
*/

$idade = 20;
$genere = "Masculine";
if ($idade >= 18 && $genere == "Masculine")
{
    echo "Vecê é em hemem edelte.<br><br>";
}

$a = 10;
$b = 5;
$c = 15;

//Operadores relacionais
if ($a > $b && $a < $c)
{
    echo "$a é maior que $b e menor que $c.<br>";
}

if ($a == 10 || $b == 5)
{
    echo "Pelo menos uma das condições é verdadeira.<br>";
}

if ($a != $b)
{
    echo "$a é diferente de $b.<br><br>";
}

// Operadores lógicos
$verdadeiro = true;
$falso = false;

if ($verdadeiro && $falso)
{
    echo "Essa linha não será executada. <br>";
}

else
{
    echo "Pelo menos uma das condições é falsa. <br>";
}

if ($verdadeiro || $falso)
{
    echo "Pelo menos uma das condições é verdadeira. <br>";
}

if (!$falso)
{
    echo "O valor de \$falso foi negado. <br><br>";
}

//5- Loops (FOR)
for ($i = 1; $i <= 5; $i ++)
{
    echo "$i <br>";
}

echo "<br>";

//6- Loops (WHILE)
$contador = 1;
while ($contador <= 5)
{
    echo "$contador <br>";
    $contador ++;
}

echo "<br>";

//7- Array Simples
$cores = array("Vermelho", "Verde", "Azul");
echo "Minha cor favorita é: " . $cores[0] . ".<br><br>";
?>