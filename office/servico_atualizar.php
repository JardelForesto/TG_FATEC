<?php
include 'login_activity.php';
include 'office_header.php';
?>

<head>
    <title>Atualizar Serviço</title>
</head>
<body>

<div class="container-centered container d-flex justify-content-center align-items-center">
    <div class="form-container col-md-8 bg-light p-4 rounded shadow">
        <h1 class="text-center mb-4 display-4">Atualizar Serviço - ID: <?php echo isset($_GET['id']) ? $_GET['id'] : ''; ?></h1>

        <form id="atualizarservicoForm">
            <input name="txtID" type="hidden" value="<?php echo isset($_GET['id']) ? $_GET['id'] : ''; ?>">

            <!-- Campo Serviço -->
            <div class="form-content mb-3">
                <label for="txtServico">Serviço</label>
                <input name="txtServico" id="txtServico" type="text" class="form-control" maxlength="50" value="<?php echo isset($_GET['servico']) ? htmlspecialchars($_GET['servico']) : ''; ?>" required>
            </div>

            <!-- Campo Tipo -->
            <div class="form-content mb-3">

                <label for="txtTipo" class="form-label">Tipo</label>
                <select name="txtTipo" id="txtTipo" class="form-control" required>
                    <option value="">Selecione o tipo de serviço</option>
                    <option value="Hospedagem" <?php echo isset($_GET['tipo']) && $_GET['tipo'] == 'Hospedagem' ? 'selected' : ''; ?>>Hospedagem</option>
                    <option value="Pet Sitter" <?php echo isset($_GET['tipo']) && $_GET['tipo'] == 'Pet Sitter' ? 'selected' : ''; ?>>Pet Sitter</option>
                    <option value="Creche" <?php echo isset($_GET['tipo']) && $_GET['tipo'] == 'Creche' ? 'selected' : ''; ?>>Creche</option>
                </select>

            </div>

            <!-- Campo Preço -->
            <div class="form-content mb-3">
                <label for="txtPreco">Preço</label>
                <div class="input-group">
                        <span class="input-group-text">R$</span>
                        <input
                            type="number"
                            name="txtPreco"
                            id="txtPreco"
                            class="form-control"
                            max="999999"
                            value="<?php echo isset($_GET['preco']) ? htmlspecialchars($_GET['preco']) : ''; ?>" required/>
                    </div>

                    <script>
                    document.getElementById("txtPreco").addEventListener("input", function(event) {
                        let input = event.target;
                        let value = input.value;

                        // Remove caracteres que não são números e limita a 6 dígitos
                        value = value.replace(/\D/g, "").slice(0, 6);

                        // Atualiza o valor do campo
                        input.value = value;
                    });
                    </script>
            </div>

            <!-- Botões -->
            <div class="text-center">
                <a href="servico_listar.php" class="btn btn-warning w-100 mb-2">
                    <i class="fa fa-ban"></i> Cancelar Atualização
                </a>
                <button type="submit" name="btnAtualizar" class="btn btn-primary w-100">
                    <i class="fa fa-wrench"></i> Atualizar
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
            <h5 class="modal-title" id="modalTitle">Cadastro Cliente</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p id="modalMessage">Cadastro de Cliente realizado com sucesso!</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Fechar</button>
          </div>
        </div>
      </div>
    </div>


    <script>
          document.getElementById('atualizarservicoForm').onsubmit = function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            fetch('servico_atualizarAction.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById('modalTitle').innerText = data.status === 'success' ? 'Sucesso' : 'Erro';
                document.getElementById('modalMessage').innerText = data.message;

                var matriculaModal = new bootstrap.Modal(document.getElementById('successModal'));
                matriculaModal.show();
            })
            .catch(error => console.error('Erro:', error));
        };
    </script>

</body>

<?php
include 'office_footer.php';
?>
