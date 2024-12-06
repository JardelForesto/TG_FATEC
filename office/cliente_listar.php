<?php 
include 'login_activity.php';
include 'office_header.php';
?>

<head>
    <title>Listagem de Clientes</title>
</head>
<body>
<?php
include 'conexaoAction.php';
?>

<section>
    <div class="container mt-4">
        <div class="form-container shadow-lg p-4 rounded">
            <h1 class="text-center mb-4 display-4">Listagem de Clientes</h1>

           <!-- Formulário de Filtros -->
            <form method="GET" class="mb-2">
                <div class="row g-3">
                    <div class="col-md-4">
                        <input type="text" name="nome" class="form-control" placeholder="Nome" maxlength="30" value="<?php echo $_GET['nome'] ?? ''; ?>">
                    </div>
                    <div class="col-md-4">
                        <input type="text" name="cpf" id="cpf" class="form-control" placeholder="CPF" value="<?php echo $_GET['cpf'] ?? ''; ?>">
                        <script>
                    // Aplica a máscara ao digitar
                    document.getElementById("cpf").addEventListener("input", function(event) {
                        let input = event.target;
                        let value = input.value;

                        // Remove caracteres que não são números
                        value = value.replace(/\D/g, "");

                        // Aplica a máscara CPF: XXX.XXX.XXX-XX
                        if (value.length > 3 && value.length <= 6) {
                            value = `${value.slice(0, 3)}.${value.slice(3)}`;
                        } else if (value.length > 6 && value.length <= 9) {
                            value = `${value.slice(0, 3)}.${value.slice(3, 6)}.${value.slice(6)}`;
                        } else if (value.length > 9) {
                            value = `${value.slice(0, 3)}.${value.slice(3, 6)}.${value.slice(6, 9)}-${value.slice(9, 11)}`;
                        }

                        // Atualiza o valor do campo com a máscara
                        input.value = value;
                    });
                    </script>
                    </div>
                    <div class="col-md-4">
                        <input name="cep" id="cep" type="text" class="form-control" placeholder="CEP" maxlength="10" value="<?php echo $_GET['cep'] ?? ''; ?>">
                        <script>
                            document.getElementById("cep").addEventListener("input", function(event) {
                                let input = event.target;
                                let value = input.value;

                                // Remove caracteres que não são números
                                value = value.replace(/\D/g, "");

                                // Aplica a máscara CEP: XX.XXX-XXX
                                if (value.length > 2 && value.length <= 5) {
                                    value = `${value.slice(0, 2)}.${value.slice(2)}`;
                                } else if (value.length > 5) {
                                    value = `${value.slice(0, 2)}.${value.slice(2, 5)}-${value.slice(5, 8)}`;
                                }

                                // Atualiza o valor do campo com a máscara
                                input.value = value;
                            });

                        </script>
                    </div>
                    <div class="col-md-4">
                        <input type="text" name="email" class="form-control" placeholder="Email" maxlength="30" value="<?php echo $_GET['email'] ?? ''; ?>">
                    </div>
                    <div class="col-md-4">
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


                <!-- Linha separada para os botões de ação -->
                <div class="col-md-4">
                    <div class="col-md-9 d-flex justify-content-end">
                        <button type="submit" class="btn btn-primary me-4">Filtrar</button>
                        <a href="cliente_listar.php" class="btn btn-secondary">Limpar Filtros</a>
                    </div>
                </div>
                </div>
            </form>

            <div style="height: 6vh;"></div>
            <!-- Tabela de Clientes -->
            <table class="table table-sm table-striped table-hover table-bordered border-primary rounded">
                <thead class="table-primary text-center">
                    <tr>
                        <th>Código</th>
                        <th>Nome</th>
                        <th>CPF</th>
                        <th>Email</th>
                        <th>Telefone</th>
                        <th>CEP</th>
                        <th>Excluir</th>
                        <th>Atualizar</th>
                    </tr>
                </thead>
                <tbody class="text-center">

<?php
// Obtenha os valores dos filtros
$nome = $_GET['nome'] ?? '';
$cpf = $_GET['cpf'] ?? '';
$telefone = $_GET['telefone'] ?? '';
$email = $_GET['email'] ?? '';
$cep = $_GET['cep'] ?? '';

// Construa a consulta com filtros
$sql = "SELECT * FROM cliente WHERE 1=1";
if ($nome) $sql .= " AND nome LIKE '%$nome%'";
if ($cpf) $sql .= " AND cpf LIKE '%$cpf%'";
if ($telefone) $sql .= " AND telefone LIKE '%$telefone%'";
if ($email) $sql .= " AND email LIKE '%$email%'";
if ($cep) $sql .= " AND cep LIKE '%$cep%'";

$resultado = $conexao->query($sql);
if ($resultado && $resultado->num_rows > 0) {
    while ($linha = $resultado->fetch_assoc()) {
        echo '<tr>';
        echo '<td>' . $linha['id'] . '</td>';
        echo '<td>' . $linha['nome'] . '</td>';
        echo '<td>' . $linha['cpf'] . '</td>';
        echo '<td>' . $linha['email'] . '</td>';
        echo '<td>' . $linha['telefone'] . '</td>';
        echo '<td>' . $linha['cep'] . '</td>';
        echo '<td><a href="cliente_excluir.php?id=' . $linha['id'] . '"><i class="fa fa-user-times"></i></a></td>';
        echo '<td><a href="cliente_atualizar.php?id=' . $linha['id'] . '"><i class="fa fa-refresh"></i></a></td>';
        echo '</tr>';
    }
} else {
    echo '<tr><td colspan="8" class="text-center">Nenhum cliente encontrado.</td></tr>';
}

$conexao->close();
?>
                </tbody>
            </table>
        </div>
    </div>
</section>
<div style="height: 6vh;"></div>
</body>

<?php include 'office_footer.php'; ?>
</html>
