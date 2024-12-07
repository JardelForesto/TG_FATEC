<?php
include 'login_activity.php';
include 'office_header.php';
?>

<head>
	<title>Cadastro Veterinário</title>
</head>

<body>
<div class="container-centered container d-flex justify-content-center align-items-center">
    <div class="form-container col-md-8 bg-light p-4 rounded shadow">
        <h1 class="text-center mb-4 display-4">Cadastro de Veterinário</h1>
        <form id="cadastroveterinarioForm">

            <!-- Campo oculto ID -->
            <input type="text" name="txtID" hidden>

            <!-- Nome Veterinário -->
            <div class="row mb-1">
                <div class="col-md-12">
                    <label for="txtNome" class="form-label">Nome do Veterinário</label>
                    <input type="text" name="txtNome" id="txtNome" class="form-control" maxlength="100" required>
                </div>
            </div>

            <!-- Telefone e Email -->
            <div class="row mb-1">
                <div class="col-md-6">
                <label for="txtTelefone"><b>Telefone</b></label>
                <input type="tel" name="txtTelefone" id="txtTelefone"  class="form-control mb-2"  required  maxlength="15">
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
                <div class="col-md-6">
                    <label for="txtEmail" class="form-label">Email</label>
                    <input type="email" name="txtEmail" id="txtEmail" class="form-control" maxlength="100" required>
                </div>
            </div>

            <!-- Endereço, Número e Complemento -->
            <div class="row mb-1">
                <div class="col-md-6">
                    <label for="txtEndereco" class="form-label">Endereço</label>
                    <input type="text" name="txtEndereco" id="txtEndereco" class="form-control" maxlength="100" required>
                </div>
                <div class="col-md-3">
                <label for="txtNumero" class="form-label">Número</label>
                    <input name="txtNumero" id="txtNumero" type="number" class="form-control" max="999999">
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
                <div class="col-md-3">
                    <label for="txtComplemento" class="form-label">Complemento</label>
                    <input type="text" name="txtComplemento" id="txtComplemento" class="form-control" maxlength="20">
                </div>
            </div>

            <!-- Bairro e CEP -->
            <div class="row mb-1">
                <div class="col-md-6">
                    <label for="txtBairro" class="form-label">Bairro</label>
                    <input type="text" name="txtBairro" id="txtBairro" class="form-control" maxlength="30" required>
                </div>
                <div class="col-md-6">
                <label for="txtCep" class="form-label">CEP</label>
                    <input name="txtCep" id="txtCep" type="text" class="form-control" maxlength="10" required>
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
            </div>

            <!-- Cidade e Estado -->
            <div class="row mb-1">
                <div class="col-md-6">
                    <label for="txtCidade" class="form-label">Cidade</label>
                    <input type="text" name="txtCidade" id="txtCidade" class="form-control" maxlength="40" required>
                </div>
                <div class="col-md-6">
                    <label for="txtEstado" class="form-label">Estado</label>
                    <input type="text" name="txtEstado" id="txtEstado" class="form-control" maxlength="20" required>
                </div>
            </div>

            <!-- Botão de Enviar -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary w-100">
                    <i class="fa fa-ambulance"></i> Adicionar
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
          document.getElementById('cadastroveterinarioForm').onsubmit = function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            fetch('veterinario_cadastroAction.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById('modalTitle').innerText = data.status === 'success' ? 'Sucesso' : 'Erro';
                document.getElementById('modalMessage').innerText = data.message;

                 // Limpa os campos do formulário após o envio
                if (data.status === 'success') {
                    this.reset(); // Reseta todos os campos do formulário
                }

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