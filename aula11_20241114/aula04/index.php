	<?php
	//INICIAR SESSÃO NO SERVIDOR, CASO JÁ EXISTA ELE APENAS RETOMA, CASO CONTRÁRIO, CRIA UMA NOVA.
	session_start();

	//CASO A SESSÃO NÃO TIVER NADA, O SCRIPT VAI ENVIAR O USUÁRIO PARA O LOGIN.PHP, CASO CONTRÁRIO, ESTÁ TUDO CORRETO.
	if (!isset($_SESSION['user_id']))
	{
		header("Location: login.php");
		exit();
	}

	require 'config.php';

	//
	$result = $conn->query("SELECT * FROM alunos");
	?>
	<!DOCTYPE html>
	<html lang="pt-BR">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Lista de Alunos</title>
		<link rel="stylesheet" href="style.css">
	</head>
	<body>
		<h2>Lista de Alunos</h2>
		<a href="logout.php">Logout</a>
		<a href="create.php">Adicionar Aluno</a>
		<table border="1" width="100%">
			<thead>
				<tr>
					<th>Nome</th>
					<th>RA</th>
					<th>Idade</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<?php while ($row = $result->fetch_assoc()): ?>
				<!-- O PHP VAI PERCORRER A TABELA TODA E VAI PREENCHER AS LINHAS DA TABELA DO SITE. -->
					<tr>
				<!-- TR: TABLE ROW, LINHA DAS TABELAS -->
						<td><?php echo $row['nome']; ?></td>
						<td><?php echo $row['ra']; ?></td>
						<td><?php echo $row['idade']; ?></td>
						<td>
							<a href="edit.php?id=<?php echo $row['id']; ?>">Editar</a>
							<a href="delete.php?id=<?php echo $row['id']; ?>">Excluir</a>
						</td>
					</tr>
				<?php endwhile; ?>
			</tbody>
		</table>
	</body>
	</html>
