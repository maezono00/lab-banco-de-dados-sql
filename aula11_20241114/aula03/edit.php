<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

require 'config.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id = $_POST['id'];
    $nome = $_POST['nome'];
    $ra = $_POST['ra'];
    $idade = $_POST['idade'];

    $stmt = $conn->prepare("UPDATE alunos SET nome = ?, ra = ?, idade = ? WHERE id = ?");
    $stmt->bind_param("ssii", $nome, $ra, $idade, $id);
    $stmt->execute();

    header("Location: index.php");
    exit();
}

$id = $_GET['id'];
$stmt = $conn->prepare("SELECT * FROM alunos WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$aluno = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Aluno</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Editar Aluno</h2>
    <form method="post">
        <input type="hidden" name="id" value="<?php echo $aluno['id']; ?>">
        <input type="text" name="nome" required value="<?php echo $aluno['nome']; ?>">
        <input type="text" name="ra" required value="<?php echo $aluno['ra']; ?>">
        <input type="number" name="idade" required value="<?php echo $aluno['idade']; ?>">
        <button type="submit">Salvar</button>
    </form>
</body>
</html>
