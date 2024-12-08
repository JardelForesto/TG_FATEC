<?php
include 'login_activity.php';
include 'office_header.php';
?>


<?php
// Conexão ao banco de dados
include 'conexaoAction.php';

// Buscar clientes
$clientes_result = $conexao->query("SELECT id, nome FROM cliente ORDER BY nome ASC");

// Buscar veterinários
$veterinarios_result = $conexao->query("SELECT id, nome FROM veterinario ORDER BY nome ASC");
?>

<head>
    <title>Cadastro de Pet</title>
</head>
<body>
<div class="container-centered container d-flex justify-content-center align-items-center">
    <div class="form-container col-md-8 bg-light p-4 rounded shadow">
        <h1 class="text-center mb-4 display-4">Cadastro de Pet</h1>
        <form id="cadastropetForm">

            <!-- Campo oculto ID -->
            <input name="txtID" id="txtID" type="text" hidden>

            <div class="row mb-3">
                <div class="col">
                    <label for="txtNome" class="form-label">Nome do Pet</label>
                    <input type="text" class="form-control" id="txtNome" name="txtNome" maxlength="50" required>
                </div>
                <div class="col">
                    <label for="txtSexo" class="form-label">Sexo</label>
                    <select class="form-control" id="txtSexo" name="txtSexo" required>
                        <option value="Macho">Macho</option>
                        <option value="Fêmea">Fêmea</option>
                    </select>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="txtEspecie" class="form-label">Espécie</label>
                    <select class="form-control" id="txtEspecie" name="txtEspecie" required>
                        <option value="Canina">Canina</option>
                        <option value="Felina">Felina</option>
                    </select>
                </div>
                <div class="col">
                    <label for="txtRaca" class="form-label">Raça</label>
                    <input type="text" class="form-control" id="txtRaca" name="txtRaca" maxlength="50" required>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="txtCor" class="form-label">Cor</label>
                    <input type="text" class="form-control" id="txtCor" name="txtCor" maxlength="50" required>
                </div>
                <div class="col">
                    <label for="txtIdade" class="form-label">Idade</label>
                    <input name="txtIdade" id="txtIdade" type="number" class="form-control" max="99" required>
                    <script>
                    document.getElementById("txtIdade").addEventListener("input", function(event) {
                        let input = event.target;
                        let value = input.value;

                        // Remove caracteres que não são números e limita a 6 dígitos
                        value = value.replace(/\D/g, "").slice(0, 2);

                        // Atualiza o valor do campo
                        input.value = value;
                    });
                    </script>
                </div>
            </div>

            <div class="row mb-3">
                <div class="col">
                    <label for="txtPorte" class="form-label">Porte</label>
                    <select class="form-control" id="txtPorte" name="txtPorte" maxlength="50" required>
                        <option value="Pequeno">Pequeno</option>
                        <option value="Médio">Médio</option>
                        <option value="Grande">Grande</option>
                    </select>
                </div>
                <div class="col">
                    <label for="txtRga" class="form-label">RGA</label>
                    <input name="txtRga" id="txtRga" type="text" class="form-control" maxlength="9" required>
                    <script>
                        document.getElementById("txtRga").addEventListener("input", function(event) {
                            let input = event.target;
                            let value = input.value;

                            // Remove caracteres que não são números
                            value = value.replace(/\D/g, "");

                            // Aplica a máscara RGA X.XXX.XXX
                            if (value.length > 1 && value.length <= 4) {
                                // Quando o tamanho for de 2 a 4 dígitos, coloca o ponto após o primeiro dígito
                                value = `${value.slice(0, 1)}.${value.slice(1)}`;
                            } else if (value.length >= 5) {
                                // Quando o tamanho for maior que 4, coloca os dois pontos
                                value = `${value.slice(0, 1)}.${value.slice(1, 4)}.${value.slice(4, 7)}`;
                            }

                            // Atualiza o valor do campo com a máscara
                            input.value = value;
                        });
                    </script>



                </div>
            </div>

            <!-- Filtro de cliente com autocomplete -->
            <div class="row mb-3">
                <div class="col">
                    <label for="id_cliente" class="form-label">Cliente</label>
                    <select class="form-control" id="id_cliente" name="id_cliente" required>
                        <option value="">Selecione o Cliente</option>
                        <?php while($cliente = $clientes_result->fetch_assoc()): ?>
                            <option value="<?= $cliente['id']; ?>"><?= $cliente['nome']; ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>
                <div class="col d-flex align-items-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCliente">
                        Adicionar Cliente
                    </button>
                </div>
            </div>

            <!-- Filtro de veterinário com autocomplete -->
            <div class="row mb-3">
                <div class="col">
                    <label for="id_veterinario" class="form-label">Veterinário</label>
                    <select class="form-control" id="id_veterinario" name="id_veterinario" required>
                        <option value="">Selecione o Veterinário</option>
                        <?php while($veterinario = $veterinarios_result->fetch_assoc()): ?>
                            <option value="<?= $veterinario['id']; ?>"><?= $veterinario['nome']; ?></option>
                        <?php endwhile; ?>
                    </select>
                </div>
                <div class="col d-flex align-items-end">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalVeterinario">
                        Adicionar Veterinário
                    </button>
                </div>
            </div>

            
            <div class="mb-3">
                <label for="foto_pet" class="form-label">Foto do Pet</label>
                <input type="file" class="form-control" id="foto_pet" name="foto_pet" required>
            </div>

            

            <!-- Botão de Enviar -->
            <div class="text-center">
                <button type="submit" class="btn btn-primary w-100">
                    <i class="fa fa-paw"></i> Adicionar
                </button>
            </div>
        </form>
    </div>
</div>

 <!-- Modal para adicionar Cliente -->
<div class="modal fade" id="modalCliente" tabindex="-1" aria-labelledby="modalClienteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalClienteLabel">Adicionar Cliente</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="cadastroclienteForm" action="pet_adicionarClienteAction.php" method="POST">
                <div class="modal-body">
                    <!-- Campo oculto ID -->
                    <input name="clienteID" id="clienteID" type="text" hidden>

                    <!-- Nome e CPF -->
                    <div class="row mb-1">
                        <div class="col-md-6">
                            <label for="clienteNome" class="form-label">Nome do Cliente</label>
                            <input name="clienteNome" id="clienteNome" type="text" class="form-control" maxlength="100" required>
                        </div>
                        <div class="col-md-6">
                            <label for="clienteCpf" class="form-label">CPF</label>
                            <input name="txtCpf" id="txtCpf" type="text" class="form-control" maxlength="14" required>
                <div id="cpfMessage" class="validation-message"></div> <!-- Div para mensagem de validação -->

                <style>
                    /* Estilo para a mensagem de validação */
                    .validation-message {
                        color: red;
                        font-size: 0.9em;
                        margin-top: 5px;
                        display: none; /* Escondido por padrão */
                    }
                </style>

                <script>
                    // Aplica a máscara ao digitar
                    document.getElementById("txtCpf").addEventListener("input", function(event) {
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

                    document.getElementById("txtCpf").addEventListener("blur", function() {
                            if (!validarCpf(this.value)) {
                                this.focus();
                            }
                        });

                        function validarCpf(cpf) {
                            // Remove caracteres especiais
                            cpf = cpf.replace(/[^\d]+/g, '');
                            let messageElement = document.getElementById("cpfMessage");

                            // Limpa a mensagem de validação
                            messageElement.style.display = "none";
                            messageElement.textContent = "";

                            // Verifica se o CPF tem 11 dígitos ou se é uma sequência de números iguais
                            if (cpf.length !== 11 || /^(\d)\1{10}$/.test(cpf)) {
                                messageElement.textContent = "CPF inválido";
                                messageElement.style.display = "block";
                                return false;
                            }

                            let soma = 0;
                            let resto;

                            // Validação do primeiro dígito verificador
                            for (let i = 1; i <= 9; i++) {
                                soma += parseInt(cpf.substring(i - 1, i)) * (11 - i);
                            }

                            resto = (soma * 10) % 11;
                            if (resto === 10 || resto === 11) resto = 0;
                            if (resto !== parseInt(cpf.substring(9, 10))) {
                                messageElement.textContent = "CPF inválido";
                                messageElement.style.display = "block";
                                return false;
                            }

                            soma = 0;
                            // Validação do segundo dígito verificador
                            for (let i = 1; i <= 10; i++) {
                                soma += parseInt(cpf.substring(i - 1, i)) * (12 - i);
                            }

                            resto = (soma * 10) % 11;
                            if (resto === 10 || resto === 11) resto = 0;
                            if (resto !== parseInt(cpf.substring(10, 11))) {
                                messageElement.textContent = "CPF inválido";
                                messageElement.style.display = "block";
                                return false;
                            }

                            return true;
                        }

                </script>
                        </div>
                    </div>

                    <!-- Telefone e Email -->
                    <div class="row mb-1">
                        <div class="col-md-6">
                            <label for="clienteTelefone" class="form-label">Telefone</label>
                            <input type="tel" name="txtTelefonec" id="txtTelefonec"  class="form-control mb-2"  required  maxlength="15">
                <script>
                            // Função para aplicar a máscara no campo de telefone
                            document.getElementById("txtTelefonec").addEventListener("input", function(event) {
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
                            <label for="clienteEmail" class="form-label">Email</label>
                            <input name="clienteEmail" id="clienteEmail" type="email" class="form-control" maxlength="100" required>
                        </div>
                    </div>

                    <!-- Endereço, Número e Complemento -->
                    <div class="row mb-1">
                        <div class="col-md-6">
                            <label for="clienteEndereco" class="form-label">Endereço</label>
                            <input name="clienteEndereco" id="clienteEndereco" type="text" class="form-control" maxlength="100" required>
                        </div>
                        <div class="col-md-3">
                            <label for="clienteNumero" class="form-label">Número</label>
                            <input name="txtNumeroc" id="txtNumeroc" type="number" class="form-control" max="999999">
                    <script>
                    document.getElementById("txtNumeroc").addEventListener("input", function(event) {
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
                            <label for="clienteComplemento" class="form-label">Complemento</label>
                            <input name="clienteComplemento" id="clienteComplemento" type="text" class="form-control" maxlength="20">
                        </div>
                    </div>

                    <!-- Bairro e CEP -->
                    <div class="row mb-1">
                        <div class="col-md-6">
                            <label for="clienteBairro" class="form-label">Bairro</label>
                            <input name="clienteBairro" id="clienteBairro" type="text" class="form-control" maxlength="30" required>
                        </div>
                        <div class="col-md-6">
                            <label for="clienteCep" class="form-label">CEP</label>
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
                            <label for="clienteCidade" class="form-label">Cidade</label>
                            <input name="clienteCidade" id="clienteCidade" type="text" class="form-control" maxlength="40" required>
                        </div>
                        <div class="col-md-6">
                            <label for="clienteEstado" class="form-label">Estado</label>
                            <input name="clienteEstado" id="clienteEstado" type="text" class="form-control" maxlength="20" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>

 <!-- Modal para adicionar Veterinário -->
 <div class="modal fade" id="modalVeterinario" tabindex="-1" aria-labelledby="modalVeterinarioLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalVeterinarioLabel">Adicionar Veterinário</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="cadastroveterinarioForm" action="pet_adicionarVeterinarioAction.php" method="POST">
                <div class="modal-body">
                    <!-- Campo oculto ID -->
                    <input name="veterinarioID" id="veterinarioID" type="text" hidden>

                    <!-- Nome -->
                    <div class="row mb-1">
                        <div class="col-md-15">
                            <label for="veterinarioNome" class="form-label">Nome do Veterinário</label>
                            <input name="veterinarioNome" id="veterinarioNome" type="text" class="form-control" maxlength="100" required>
                        </div>
                    </div>

                    <!-- Telefone e Email -->
                    <div class="row mb-1">
                        <div class="col-md-6">
                            <label for="veterinarioTelefone" class="form-label">Telefone</label>
                            <input type="tel" name="txtTelefonev" id="txtTelefonev"  class="form-control mb-2"  required  maxlength="15">
                <script>
                            // Função para aplicar a máscara no campo de telefone
                            document.getElementById("txtTelefonev").addEventListener("input", function(event) {
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
                            <label for="veterinarioEmail" class="form-label">Email</label>
                            <input name="veterinarioEmail" id="veterinarioEmail" type="email" class="form-control" maxlength="100" required>
                        </div>
                    </div>

                    <!-- Endereço, Número e Complemento -->
                    <div class="row mb-1">
                        <div class="col-md-6">
                            <label for="veterinarioEndereco" class="form-label">Endereço</label>
                            <input name="veterinarioEndereco" id="veterinarioEndereco" type="text" class="form-control" maxlength="100" required>
                        </div>
                        <div class="col-md-3">
                            <label for="veterinarioNumero" class="form-label">Número</label>
                            <input name="txtNumerov" id="txtNumerov" type="number" class="form-control" max="999999">
                    <script>
                    document.getElementById("txtNumerov").addEventListener("input", function(event) {
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
                            <label for="veterinarioComplemento" class="form-label">Complemento</label>
                            <input name="veterinarioComplemento" id="veterinarioComplemento" type="text" class="form-control" maxlength="20">
                        </div>
                    </div>

                    <!-- Bairro e CEP -->
                    <div class="row mb-1">
                        <div class="col-md-6">
                            <label for="veterinarioBairro" class="form-label">Bairro</label>
                            <input name="veterinarioBairro" id="veterinarioBairro" type="text" class="form-control" maxlength="30" required>
                        </div>
                        <div class="col-md-6">
                            <label for="veterinarioCep" class="form-label">CEP</label>
                            <input name="txtCepv" id="txtCepv" type="text" class="form-control" maxlength="10" required>
                    <script>
                        document.getElementById("txtCepv").addEventListener("input", function(event) {
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
                            <label for="veterinarioCidade" class="form-label">Cidade</label>
                            <input name="veterinarioCidade" id="veterinarioCidade" type="text" class="form-control" maxlength="40" required>
                        </div>
                        <div class="col-md-6">
                            <label for="veterinarioEstado" class="form-label">Estado</label>
                            <input name="veterinarioEstado" id="veterinarioEstado" type="text" class="form-control" maxlength="20" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Alerta -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalTitle">Cadastro Pet</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p id="modalMessage">Cadastro de Pet realizado com sucesso!</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Fechar</button>
          </div>
        </div>
      </div>
    </div>



    <script>
    document.getElementById('cadastroclienteForm').addEventListener('submit', function(e) {
        e.preventDefault(); // Previne o envio tradicional do formulário

        var formData = new FormData(this);

        fetch('pet_adicionarClienteAction.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.id_cliente) {
                // Adicionar o novo cliente à lista de cliente
                var selectCliente = document.getElementById('id_cliente');
                var newOption = document.createElement('option');
                newOption.value = data.id_cliente;
                newOption.text = data.nome;
                newOption.selected = true; // Seleciona automaticamente o novo cliente
                selectCliente.appendChild(newOption);

                // Fechar o modal corretamente
                var modalCliente = bootstrap.Modal.getInstance(document.getElementById('modalCliente'));
                modalCliente.hide();

            } else {
                alert(data.error || 'Erro JS 1 ao cadastrar cliente.');
            }
        })
        .catch(error => {
            console.error('Erro:', error);
            alert('Ocorreu um erro, CPF já cadastrado.');
        });
    });
</script>


<script>
    document.getElementById('cadastroveterinarioForm').addEventListener('submit', function(e) {
        e.preventDefault(); // Previne o envio tradicional do formulário

        var formData = new FormData(this);

        fetch('pet_adicionarVeterinarioAction.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.id_veterinario) {
                // Adicionar o novo cliente à lista de veterinário
                var selectVeterinario = document.getElementById('id_veterinario');
                var newOption = document.createElement('option');
                newOption.value = data.id_veterinario;
                newOption.text = data.nome;
                newOption.selected = true; // Seleciona automaticamente o novo veterinário
                selectVeterinario.appendChild(newOption);

                // Fechar o modal corretamente
                var modalCliente = bootstrap.Modal.getInstance(document.getElementById('modalVeterinario'));
                modalCliente.hide();

            } else {
                alert(data.error || 'Erro JS 1 ao cadastrar veterinário.');
            }
        })
        .catch(error => {
            console.error('Erro:', error);
            alert('Ocorreu um erro JS2 ao cadastrar o veterinário.');
        });
    });
</script>

<script>
          document.getElementById('cadastropetForm').onsubmit = function(event) {
            event.preventDefault();

            var formData = new FormData(this);

            fetch('pet_cadastroAction.php', {
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
            .catch(error => console.error('Erro: JS cadastropetForm', error));
        };
    </script>

</body>
</html>

<?php
// Fechar a conexão
$conexao->close();
?>

<?php
include 'office_footer.php';
?>