<?php
include 'login_activity.php';
include 'office_header.php';

// Conexão ao banco de dados
include 'conexaoAction.php';

// Pega o ID do cliente
$cliente_id = $_GET['id'];

// Busca os dados do cliente
$sql = "SELECT * FROM cliente WHERE id = $cliente_id";
$resultado = $conexao->query($sql);

if ($resultado->num_rows > 0) {
    // Pega os dados do cliente
    $row = $resultado->fetch_assoc();
} else {
    echo "<div class='container'><p class='text-danger text-center'>cliente não encontrado.</p></div>";
    exit;
}
?>

<head>
    <title>Atualizar cliente</title>
</head>
<body>

<div class="container-centered container d-flex justify-content-center align-items-center">
    <div class="form-container col-md-8 bg-light p-4 rounded shadow">
        <h1 class="text-center mb-4 display-4">Excluir Cliente - ID: <?php echo $cliente_id; ?></h1>

        <form id="excluirclienteForm">
            <input name="txtID" type="hidden" value="<?php echo $cliente_id; ?>">


            <!-- Nome e CPF -->
            <div class="row mb-1">
                <div class="col-md-6">
                    <label for="txtNome" class="form-label">Nome cliente</label>
                    <input name="txtNome" id="txtNome" type="text" class="form-control" value="<?php echo htmlspecialchars($row['nome']); ?>" disabled>
                </div>
                <div class="col-md-6">
                    <label for="txtCpf" class="form-label">CPF</label>
                    <input name="txtCpf" id="txtCpf" type="text" class="form-control" value="<?php echo htmlspecialchars($row['cpf']); ?>" disabled>
                </div>
            </div>


            <!-- Telefone e Email -->
            <div class="row mb-1">
		        <div class="col-md-6">
                    <label for="txtTelefone" class="form-label">Telefone</label>
                    <input name="txtTelefone" id="txtTelefone" type="text" class="form-control" value="<?php echo htmlspecialchars($row['telefone']); ?>" disabled>
                </div>
                <div class="col-md-6">
                    <label for="txtEmail" class="form-label">Email</label>
                    <input name="txtEmail" id="txtEmail" type="email" class="form-control" value="<?php echo htmlspecialchars($row['email']); ?>" disabled>
                </div>
            </div>

            <!-- Endereço e Número -->
            <div class="row mb-1">
                <div class="col-md-8">
                    <label for="txtEndereco" class="form-label">Endereço</label>
                    <input name="txtEndereco" id="txtEndereco" type="text" class="form-control" value="<?php echo htmlspecialchars($row['endereco']); ?>" disabled>
                </div>
                <div class="col-md-4">
                    <label for="txtNumero" class="form-label">Número</label>
                    <input name="txtNumero" id="txtNumero" type="number" class="form-control" value="<?php echo htmlspecialchars($row['numero']); ?>" disabled>
                </div>
            </div>

            <!-- Complemento e Bairro -->
            <div class="row mb-1">
                <div class="col-md-6">
                    <label for="txtComplemento" class="form-label">Complemento</label>
                    <input name="txtComplemento" id="txtComplemento" type="text" class="form-control" value="<?php echo htmlspecialchars($row['complemento']); ?>" disabled>
                </div>
                <div class="col-md-6">
                    <label for="txtBairro" class="form-label">Bairro</label>
                    <input name="txtBairro" id="txtBairro" type="text" class="form-control" value="<?php echo htmlspecialchars($row['bairro']); ?>" disabled>
                </div>
            </div>

            <!-- CEP, Cidade e Estado -->
            <div class="row mb-1">
                <div class="col-md-4">
                    <label for="txtCep" class="form-label">CEP</label>
                    <input name="txtCep" id="txtCep" type="text" class="form-control" value="<?php echo htmlspecialchars($row['cep']); ?>" disabled>
                </div>
                <div class="col-md-4">
                    <label for="txtCidade" class="form-label">Cidade</label>
                    <input name="txtCidade" id="txtCidade" type="text" class="form-control" value="<?php echo htmlspecialchars($row['cidade']); ?>" disabled>
                </div>
                <div class="col-md-4">
                    <label for="txtEstado" class="form-label">Estado</label>
                    <input name="txtEstado" id="txtEstado" type="text" class="form-control" value="<?php echo htmlspecialchars($row['estado']); ?>" disabled>
                </div>
            </div>

            <div style="height: 2vh;"></div>

            <!-- Botões -->
            <div class="text-center">
                <a href="cliente_listar.php" class="btn btn-warning w-100 mb-2">
                    <i class="fa fa-ban"></i> Cancelar Exclusão
                </a>
                <button type="submit" name="btnExcluir" class="btn btn-danger w-100">
                    <i class="fa fa-trash"></i> Confirmar Exclusão
                </button>
            </div>
        </form>
    </div>
</div> 
        <!-- Modal -->
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">Exclusão Cliente</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p id="modalMessage">Cliente excluído com sucesso!</p>
            </div>
            <div class="modal-footer">
                <button id="closeButton" class="btn btn-primary">
                <i class="fa fa-times"></i> Fechar
                </button>
            </div>
            </div>
        </div>
        </div>

        <script>
        document.getElementById('excluirclienteForm').onsubmit = function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            fetch('cliente_excluirAction.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
            document.getElementById('modalTitle').innerText = data.status === 'success' ? 'Sucesso' : 'Erro';
            document.getElementById('modalMessage').innerText = data.message;

            var matriculaModal = new bootstrap.Modal(document.getElementById('successModal'));
            matriculaModal.show();

            // Após o fechamento do modal, redirecionar para listar_veterinario.php
            document.getElementById('closeButton').addEventListener('click', function() {
                window.location.href = 'cliente_listar.php';
            });
            })
            .catch(error => {
            console.error('Erro:', error);

            // Exibir o modal com mensagem de erro
            document.getElementById('modalTitle').innerText = 'Erro';
            document.getElementById('modalMessage').innerText = 'Erro ao excluir o Cliente. O Cliente que você está tentando excluir está associado a agendamentos existentes. Para excluir, por favor, cancele ou remova os agendamentos relacionados primeiro.';

            var errorModal = new bootstrap.Modal(document.getElementById('successModal'));
            errorModal.show();
            });
        };
        </script>


</body>



<?php
// Fecha a conexão
$conexao->close();
?>
</html>
<?php
include 'office_footer.php';
?>
