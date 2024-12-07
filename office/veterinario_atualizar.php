<?php
include 'login_activity.php';
include 'office_header.php';

// Conexão ao banco de dados
include 'conexaoAction.php';

// Pega o ID do veterinário
$veterinario_id = $_GET['id'];

// Busca os dados do veterinário
$sql = "SELECT * FROM veterinario WHERE id = $veterinario_id";
$resultado = $conexao->query($sql);

if ($resultado->num_rows > 0) {
    // Pega os dados do veterinário
    $row = $resultado->fetch_assoc();
} else {
    echo "<div class='container'><p class='text-danger text-center'>Veterinário não encontrado.</p></div>";
    exit;
}
?>

<head>
    <title>Atualizar Veterinário</title>
</head>
<body>

<div class="container-centered container d-flex justify-content-center align-items-center">
    <div class="form-container col-md-8 bg-light p-4 rounded shadow">
        <h1 class="text-center mb-4 display-4">Atualizar Veterinário - ID: <?php echo $veterinario_id; ?></h1>

        <form id="atualizarveterinarioForm">
            <input name="txtID" type="hidden" value="<?php echo $veterinario_id; ?>">

            <!-- Nome e Telefone -->
            <div class="row mb-1">
                <div class="col-md-6">
                    <label for="txtNome" class="form-label">Nome Veterinário</label>
                    <input name="txtNome" id="txtNome" type="text" class="form-control"  maxlength="100" value="<?php echo htmlspecialchars($row['nome']); ?>" required>
                </div>
                <div class="col-md-6">
                <label for="txtTelefone"><b>Telefone</b></label>
                <input type="tel" name="txtTelefone" id="txtTelefone"  class="form-control mb-2"  value="<?php echo htmlspecialchars($row['telefone']); ?>" required  maxlength="15">
                <script>
                            // Função para aplicar a máscara no campo de telefone
                            document.getElementById("txtTelefone").addEventListener("input", function(event) {
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
            </div>

            <!-- Email -->
            <div class="row mb-1">
                <div class="col-md-12">
                    <label for="txtEmail" class="form-label">Email</label>
                    <input name="txtEmail" id="txtEmail" type="email" class="form-control"  maxlength="100" value="<?php echo htmlspecialchars($row['email']); ?>" required>
                </div>
            </div>

            <!-- Endereço e Número -->
            <div class="row mb-1">
                <div class="col-md-8">
                    <label for="txtEndereco" class="form-label">Endereço</label>
                    <input name="txtEndereco" id="txtEndereco" type="text" class="form-control"  maxlength="100" value="<?php echo htmlspecialchars($row['endereco']); ?>" required>
                </div>
                <div class="col-md-4">
                    <label for="txtNumero" class="form-label">Número</label>
                    <input name="txtNumero" id="txtNumero" type="number" class="form-control" max="999999" value="<?php echo htmlspecialchars($row['numero']); ?>" required>
                    <script>
                    document.getElementById("txtNumero").addEventListener("input", function(event) {
                        let input = event.target;
                        let value = input.value;

                        // Remove caracteres que não são números e limita a 6 dígitos
                        value = value.replace(/\D/g, "").slice(0, 6);

                        // Atualiza o valor do campo
                        input.value = value;
                    });
                    </script>
                </div>
            </div>

            <!-- Complemento e Bairro -->
            <div class="row mb-1">
                <div class="col-md-6">
                    <label for="txtComplemento" class="form-label">Complemento</label>
                    <input name="txtComplemento" id="txtComplemento" type="text" class="form-control" maxlength="20" value="<?php echo htmlspecialchars($row['complemento']); ?>">
                </div>
                <div class="col-md-6">
                    <label for="txtBairro" class="form-label">Bairro</label>
                    <input name="txtBairro" id="txtBairro" type="text" class="form-control" maxlength="30" value="<?php echo htmlspecialchars($row['bairro']); ?>" required>
                </div>
            </div>

            <!-- CEP, Cidade e Estado -->
            <div class="row mb-1">
                <div class="col-md-4">
                    <label for="txtCep" class="form-label">CEP</label>
                    <input name="txtCep" id="txtCep" type="text" class="form-control" maxlength="10" value="<?php echo htmlspecialchars($row['cep']); ?>" required>
                    <script>
                        document.getElementById("txtCep").addEventListener("input", function(event) {
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
                    <label for="txtCidade" class="form-label">Cidade</label>
                    <input name="txtCidade" id="txtCidade" type="text" class="form-control" maxlength="40" value="<?php echo htmlspecialchars($row['cidade']); ?>" required>
                </div>
                <div class="col-md-4">
                    <label for="txtEstado" class="form-label">Estado</label>
                    <input name="txtEstado" id="txtEstado" type="text" class="form-control" maxlength="20" value="<?php echo htmlspecialchars($row['estado']); ?>" required>
                </div>
            </div>

            <!-- Botões de Ação -->
            <div class="text-center">
                <a href="veterinario_listar.php" class="btn btn-warning w-100 mb-2">
                    <i class="fa fa-ban"></i> Cancelar Atualização
                </a>
                <button type="submit" name="btnAtualizar" class="btn btn-primary w-100">
                    <i class="fa fa-ambulance"></i> Atualizar
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
            <h5 class="modal-title" id="modalTitle">Cadastro Veterinário</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p id="modalMessage">Cadastro de Veterinário realizado com sucesso!</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Fechar</button>
          </div>
        </div>
      </div>
    </div>


    <script>
          document.getElementById('atualizarveterinarioForm').onsubmit = function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            fetch('veterinario_atualizarAction.php', {
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