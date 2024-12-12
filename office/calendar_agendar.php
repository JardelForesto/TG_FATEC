<?php
include 'login_activity.php';
include 'office_header.php';

// Conexão ao banco de dados
include 'conexaoAction.php';

// Buscar os serviços disponíveis
$servico_result = $conexao->query("SELECT id, servico FROM servico");

// Buscar os pets com chaves estrangeiras para cliente e veterinário
$pet_result = $conexao->query("SELECT id, nome, cliente_id, veterinario_id, foto_pet FROM pet ORDER BY nome ASC");

?>
<head>
    <title>Agendar Evento</title>
    <!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <style>



.form-select, .form-control, .btn {
    border-radius: 5px; /* Bordas arredondadas */
    
}

.btn-primary {
    background-color: #007bff; /* Ajuste de cor do botão */
    border-color: #007bff;
}

.select2-container .select2-selection--single {
    height: 35px; /* Alinhe com a altura dos inputs */
    border-radius: 5px; /* Bordas arredondadas */
}

        </style>
</head>
<body>

<div class="container-centered container d-flex justify-content-center align-items-center">
    <div class="form-container shadow-lg col-md-8 bg-light p-4 rounded shadow">
        <h1 class="text-center mb-4 display-4">Agendar Novo Evento</h1>
        
        <form id="calendaragendarForm">
            <div class="mb-3">
                <label for="servico" class="form-label">Serviço</label>
                <select class="form-select" id="servico" name="servico_id" required onchange="toggleHorario(this)">
                    <option selected disabled>Escolha o serviço</option>
                    <?php while ($servico = $servico_result->fetch_assoc()): ?>
                        <option value="<?= $servico['id'] ?>"><?= $servico['servico'] ?></option>
                    <?php endwhile; ?>
                </select>
            </div>

            <div class="row mb-3" id="dataHospedagemCampos" style="display: none;">
                <div class="col-md-6">
                    <label for="data_inicio_hospedagem" class="form-label">Data de Início</label>
                    <input type="date" class="form-control" id="data_inicio_hospedagem" name="data_inicio_hospedagem">
                </div>
                <div class="col-md-6">
                    <label for="data_fim_hospedagem" class="form-label">Data de Término</label>
                    <input type="date" class="form-control" id="data_fim_hospedagem" name="data_fim_hospedagem">
                </div>
            </div>

            <div class="row mb-3" id="dataCrecheCampos" style="display: none;">
                <div class="col-md-6">
                    <label for="data_inicio_creche" class="form-label">Data de Início</label>
                    <input type="date" class="form-control" id="data_inicio_creche" name="data_inicio_creche">
                </div>
                <div class="col-md-6">
                    <label for="data_fim_creche" class="form-label">Data de Término</label>
                    <input type="date" class="form-control" id="data_fim_creche" name="data_fim_creche">
                </div>
            </div>

            <div class="row mb-3" id="horarioCampos" style="display: none;">
                <div class="col-md-6">
                    <label for="data_hora_inicio" class="form-label">Data e Hora de Início</label>
                    <input type="datetime-local" class="form-control" id="data_hora_inicio" name="data_hora_inicio">
                </div>
                <div class="col-md-6">
                    <label for="data_hora_fim" class="form-label">Data e Hora de Término</label>
                    <input type="datetime-local" class="form-control" id="data_hora_fim" name="data_hora_fim">
                </div>
            </div>

            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="diaCompletoCheckbox" name="diaCompleto" hidden>
            </div>

            <div class="container d-flex justify-content-center align-items-center mt-4">
    <div class="col-md-6">
        <!-- Seleção do pet -->
        <div class="mb-3">
            <label for="pet" class="form-label">Pet</label>
            <select class="form-select select2" id="pet" name="pet_id" required onchange="fetchPetDetails(this.value)">
                <option selected disabled>Escolha o pet</option>
                <?php while ($pet = $pet_result->fetch_assoc()): ?>
                    <option value="<?= $pet['id'] ?>"><?= $pet['nome'] ?></option>
                <?php endwhile; ?>
            </select>
        </div>


        <!-- Campos automáticos para cliente e veterinário -->
        <div class="mt-3">
            <label for="cliente" class="form-label">Cliente</label>
            <input type="text" id="cliente" class="form-control" disabled>
            <input type="hidden" id="cliente_id" name="cliente_id">
            <input type="hidden" id="email_cliente" name="email_cliente">
        </div>
        <div class="mt-3">
            <label for="veterinario" class="form-label">Veterinário</label>
            <input type="text" id="veterinario" class="form-control" disabled>
            <input type="hidden" id="veterinario_id" name="veterinario_id">
        </div>
    </div>

    <!-- Coluna para exibir a imagem do pet centralizada -->
    <div class="col-md-6 d-flex justify-content-center align-items-center" style="height: 100%;">
        <div id="petFotoContainer" class="text-center">
            <p class="text-muted">Sem foto disponível.</p>
        </div>
    </div>
</div>



            <!-- Campo para título -->
            <div class="mb-3">
                <input type="text" class="form-control" id="titulo" name="titulo" hidden>
            </div>

           
            <!-- Campo para descrição -->
            <div class="mb-3">
                <label for="descricao" class="form-label">Descrição</label>
                <textarea class="form-control" id="descricao" name="descricao" rows="3"></textarea>
            </div>

          <!-- Botão de submissão -->
            <button type="submit" class="btn btn-primary w-100">
                <i class="fas fa-calendar-check"></i> Agendar Evento
            </button>
        </form>
    </div>
</div>



        <!-- Modal -->
        <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Cadastro Agendamento</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="modalMessage">Agendamento realizado com sucesso!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Fechar</button>
                </div>
                </div>
            </div>
        </div>



    <script>
    function toggleHorario(selectElement) {
        const serviceId = selectElement.value;

        // Esconde todos os campos inicialmente
        document.getElementById("dataHospedagemCampos").style.display = "none";
        document.getElementById("dataCrecheCampos").style.display = "none";
        document.getElementById("horarioCampos").style.display = "none";

        // Limpa o checkbox de "Dia Completo"
        const diaCompletoCheckbox = document.getElementById("diaCompletoCheckbox");
        diaCompletoCheckbox.checked = false;

        // Checa o serviço selecionado e exibe os campos necessários
        if (serviceId) {
            // Faz uma requisição AJAX para buscar o tipo de serviço
            fetch(`calendar_get_servicos.php?servico_id=${serviceId}`)
                .then(response => response.json())
                .then(data => {
                    // Verifica o tipo do serviço para exibir os campos corretos
                    if (data.tipo === 'Hospedagem') {
                        document.getElementById("dataHospedagemCampos").style.display = "flex";
                        diaCompletoCheckbox.checked = true;
                    } else if (data.tipo === 'Creche') {
                        document.getElementById("dataCrecheCampos").style.display = "flex";
                        diaCompletoCheckbox.checked = true;
                    } else if (data.tipo === 'Pet Sitter') {
                        document.getElementById("horarioCampos").style.display = "flex";
                        diaCompletoCheckbox.checked = false;
                    }
                })
                .catch(error => console.error("Erro ao buscar serviço:", error));
        }
    }
</script>

<script>
    document.getElementById("calendaragendarForm").addEventListener("submit", function (event) {
        // Desabilita campos invisíveis para evitar que sejam enviados
        const dataHospedagemCampos = document.getElementById("dataHospedagemCampos");
        const dataCrecheCampos = document.getElementById("dataCrecheCampos");
        const horarioCampos = document.getElementById("horarioCampos");

        // Campos de data para hospedagem
        if (dataHospedagemCampos.style.display === "none") {
            document.getElementById("data_inicio_hospedagem").disabled = true;
            document.getElementById("data_fim_hospedagem").disabled = true;
        }

        // Campos de data para creche
        if (dataCrecheCampos.style.display === "none") {
            document.getElementById("data_inicio_creche").disabled = true;
            document.getElementById("data_fim_creche").disabled = true;
        }

        // Campos de horário para pet sitter
        if (horarioCampos.style.display === "none") {
            document.getElementById("data_hora_inicio").disabled = true;
            document.getElementById("data_hora_fim").disabled = true;
        }
    });
</script>

<!-- Script para alternar a visibilidade dos campos de horário -->
<script>
   function fetchPetDetails(petId) {
    if (!petId) return;

    fetch(`calendar_get_pets.php?pet_id=${petId}`)
        .then(response => response.json())
        .then(data => {
            if (data) {
                // Preenche os campos de cliente e veterinário
                document.getElementById('cliente').value = data.nome_cliente || '';
                document.getElementById('veterinario').value = data.nome_veterinario || '';
                
                // Define os IDs e o e-mail do cliente para o formulário de envio
                document.getElementById('cliente_id').value = data.cliente_id || '';
                document.getElementById('email_cliente').value = data.email_cliente || '';
                document.getElementById('veterinario_id').value = data.veterinario_id || '';

                // Exibe a foto do pet, se disponível
                const petFotoContainer = document.getElementById('petFotoContainer');
                if (data.foto_pet) {
                    petFotoContainer.innerHTML = `<img src="uploads/${data.foto_pet}" alt="Foto do Pet" class="img-fluid rounded w-50">`;
                } else {
                    petFotoContainer.innerHTML = '<p class="text-muted">Sem foto disponível.</p>';
                }
            }
        })
        .catch(error => console.error('Erro ao buscar detalhes do pet:', error));
}

</script>



<script>
    // Função para preencher o título automaticamente com o tipo de serviço e nome do pet
    function updateTitulo() {
        const servicoSelect = document.getElementById("servico");
        const petSelect = document.getElementById("pet");
        const tituloInput = document.getElementById("titulo");

        const servicoText = servicoSelect.options[servicoSelect.selectedIndex]?.text || '';
        const petText = petSelect.options[petSelect.selectedIndex]?.text || '';

        if (servicoText && petText) {
            tituloInput.value = `${servicoText} - ${petText}`;
        } else {
            tituloInput.value = '';
        }
    }

    // Adiciona um event listener para os campos de serviço e pet
    document.getElementById("servico").addEventListener("change", updateTitulo);
    document.getElementById("pet").addEventListener("change", updateTitulo);
</script>


    <script>
            document.getElementById("calendaragendarForm").addEventListener("submit", function(event) {
                event.preventDefault();

                var formData = new FormData(this);
                
                if (document.getElementById("dataHospedagemCampos").style.display === "flex") {
                    formData.set("data_inicio", document.getElementById("data_inicio_hospedagem").value);
                    formData.set("data_fim", document.getElementById("data_fim_hospedagem").value);
                } else if (document.getElementById("dataCrecheCampos").style.display === "flex") {
                    formData.set("data_inicio", document.getElementById("data_inicio_creche").value);
                    formData.set("data_fim", document.getElementById("data_fim_creche").value);
                } else if (document.getElementById("horarioCampos").style.display === "flex") {
                    formData.set("data_inicio", document.getElementById("data_hora_inicio").value);
                    formData.set("data_fim", document.getElementById("data_hora_fim").value);
                }

                fetch('calendar_agendarAction.php', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.status === 'auth_required') {
                            window.location.href = data.authUrl; // Redireciona para a autenticação
                        } else {
                            document.getElementById('modalTitle').innerText = data.status === 'success' ? 'Sucesso' : 'Erro';
                            document.getElementById('modalMessage').innerText = data.message;
                            if (data.status === 'success') {
                                document.getElementById("calendaragendarForm").reset();
                            }
                            var matriculaModal = new bootstrap.Modal(document.getElementById('successModal'));
                            matriculaModal.show();
                        }
                    })
                    .catch(error => console.error('Erro:', error));
            });


    </script>

    <script>
    $(document).ready(function() {
        // Inicializa o Select2 no select de pets
        $('#pet').select2({
            placeholder: 'Escolha o pet',
            allowClear: true
        });
    });

    function fetchPetDetails(petId) {
        if (!petId) return;

        fetch(`calendar_get_pets.php?pet_id=${petId}`)
            .then(response => response.json())
            .then(data => {
                if (data) {
                    // Preenche os campos de cliente e veterinário
                    document.getElementById('cliente').value = data.nome_cliente || '';
                    document.getElementById('veterinario').value = data.nome_veterinario || '';
                    
                    // Define os IDs e o e-mail do cliente para o formulário de envio
                    document.getElementById('cliente_id').value = data.cliente_id || '';
                    document.getElementById('email_cliente').value = data.email_cliente || '';
                    document.getElementById('veterinario_id').value = data.veterinario_id || '';

                    // Exibe a foto do pet, se disponível
                    const petFotoContainer = document.getElementById('petFotoContainer');
                    if (data.foto_pet) {
                        petFotoContainer.innerHTML = `<img src="uploads/${data.foto_pet}" alt="Foto do Pet" class="img-fluid rounded w-50">`;
                    } else {
                        petFotoContainer.innerHTML = '<p class="text-muted">Sem foto disponível.</p>';
                    }
                }
            })
            .catch(error => console.error('Erro ao buscar detalhes do pet:', error));
    }
</script>



<?php
include 'office_footer.php';
?>
</body>

</html>

