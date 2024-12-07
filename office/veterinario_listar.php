<?php
include 'login_activity.php';
include 'office_header.php';
?>

<head>
    <title>Listagem de Veterinários</title>
</head>
<body>

<?php
// Conexão ao banco de dados
include 'conexaoAction.php';
?>

<section>
    <div class="container mt-4">
        <div class="form-container shadow-lg p-4 rounded">
            <h1 class="text-center mb-4 display-4">Listagem de Veterinários</h1>

            <!-- Formulário de Filtros -->
            <form method="GET" class="mb-4">
                <div class="row">
                    <div class="col-md-3">
                        <input type="text" name="nome" class="form-control" placeholder="Nome" maxlength="30" value="<?php echo $_GET['nome'] ?? ''; ?>">
                    </div>
                    <div class="col-md-3">
                    <input type="tel" name="telefone" id="telefone"  class="form-control mb-2" maxlength="15" placeholder="Telefone" value="<?php echo $_GET['telefone'] ?? ''; ?>">
                <script>
                            // Função para aplicar a máscara no campo de telefone
                            document.getElementById("telefone").addEventListener("input", function(event) {
                                let input = event.target;
                                let value = input.value;

                                // Remove caracteres que não são números
                                value = value.replace(/\D/g, "");

                                // Aplica a máscara (DD) XXXXX-XXXX
                                if (value.length > 2 && value.length <= 7) {
                                value = `(${value.slice(0, 2)}) ${value.slice(2)}`;
                                } else if (value.length > 7) {
                                value = `(${value.slice(0, 2)}) ${value.slice(2, 7)}-${value.slice(7, 11)}`;
                                }

                                // Atualiza o valor do campo com a máscara
                                input.value = value;
                            });
                </script>
                    </div>
                    <div class="col-md-3">
                        <input type="text" name="email" class="form-control" placeholder="Email" maxlength="30" value="<?php echo $_GET['email'] ?? ''; ?>">
                    </div>
                    <div class="col-md-3 d-flex">
                        <button type="submit" class="btn btn-primary me-2">Filtrar</button>
                        <a href="veterinario_listar.php" class="btn btn-secondary">Limpar Filtros</a>
                    </div>
                </div>
            </form>

            <table class="table table-sm table-striped table-hover table-bordered border-primary rounded">
                <thead class="table-primary text-center">
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>Telefone</th>
                        <th>Email</th>
                        <th>Excluir</th>
                        <th>Atualizar</th>
                    </tr>
                </thead>
                <tbody class="text-center">

<?php
// Construção da query com filtros
$conditions = [];
if (!empty($_GET['nome'])) {
    $nome = $conexao->real_escape_string($_GET['nome']);
    $conditions[] = "nome LIKE '%$nome%'";
}
if (!empty($_GET['telefone'])) {
    $telefone = $conexao->real_escape_string($_GET['telefone']);
    $conditions[] = "telefone LIKE '%$telefone%'";
}
if (!empty($_GET['email'])) {
    $email = $conexao->real_escape_string($_GET['email']);
    $conditions[] = "email LIKE '%$email%'";
}

// Condições na query
$sql = "SELECT * FROM veterinario";
if (count($conditions) > 0) {
    $sql .= " WHERE " . implode(" AND ", $conditions);
}

$resultado = $conexao->query($sql);
if ($resultado != null) {
    foreach ($resultado as $linha) {
        echo '<tr>';
        echo '<td>' . $linha['id'] . '</td>';
        echo '<td>' . $linha['nome'] . '</td>';
        echo '<td>' . $linha['telefone'] . '</td>';
        echo '<td>' . $linha['email'] . '</td>';

        echo '<td>
                <a href="veterinario_excluir.php?id=' . $linha['id'] . '">
                    <i class="fa fa-user-times"></i>
                </a>
              </td>';

        echo '<td>
                <a href="veterinario_atualizar.php?id=' . $linha['id'] . '">
                    <i class="fa fa-refresh"></i>
                </a>
              </td>';
        
        echo '</tr>';
    }
}

?>

                </tbody>
            </table>
        </div>
    </div>
</section>

<?php
$conexao->close();
?>

<div style="height: 6vh;"></div>
</body>
<?php include 'office_footer.php'; ?>
</html>
