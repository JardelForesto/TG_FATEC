<?php
include 'login_activity.php';
include 'office_header.php';
include 'conexaoAction.php'; // Certifique-se de que $conexao está configurado corretamente aqui

// Obter o ID do evento
$id_evento = $_GET['id_evento'] ?? null;

if ($id_evento) {
    // Buscar dados do agendamento para preencher o formulário usando MySQLi
    $stmt = $conexao->prepare("SELECT * FROM agendamento WHERE id_evento = ?");
    $stmt->bind_param("i", $id_evento);
    $stmt->execute();
    $result = $stmt->get_result();
    $agendamento = $result->fetch_assoc();
    $stmt->close();

    if (!$agendamento) {
        die("Agendamento não encontrado.");
    }
} else {
    die("ID de agendamento não fornecido.");
}

// Buscar os serviços disponíveis
$servico_result = $conexao->query("SELECT id, servico FROM servico");

// Consulta para obter o nome e foto do pet
$stmtPet = $conexao->prepare("SELECT nome, foto_pet FROM pet WHERE id = ?");
$stmtPet->bind_param("i", $agendamento['pet_id']);
$stmtPet->execute();
$resultPet = $stmtPet->get_result();
$pet = $resultPet->fetch_assoc();
$stmtPet->close();

// Consulta para obter o nome do cliente
$stmtCliente = $conexao->prepare("SELECT nome FROM cliente WHERE id = ?");
$stmtCliente->bind_param("i", $agendamento['cliente_id']);
$stmtCliente->execute();
$resultCliente = $stmtCliente->get_result();
$cliente = $resultCliente->fetch_assoc();
$stmtCliente->close();

// Consulta para obter o nome do veterinário
$stmtVeterinario = $conexao->prepare("SELECT nome FROM veterinario WHERE id = ?");
$stmtVeterinario->bind_param("i", $agendamento['veterinario_id']);
$stmtVeterinario->execute();
$resultVeterinario = $stmtVeterinario->get_result();
$veterinario = $resultVeterinario->fetch_assoc();
$stmtVeterinario->close();
?>


<head>
    <title>Atualizar Agendamento</title>
</head>
<body>
<div class="container-centered container d-flex justify-content-center align-items-center">
    <div class="form-container col-md-8 bg-light p-4 rounded shadow">
        <h1 class="text-center mb-4 display-4">Cancelar agendamento - ID: <?php echo $id_evento; ?></h1>
        
        <form id="calendarCancelarForm">
            <!-- Campo oculto para ID do agendamento -->
            <input type="hidden" name="id_evento" value="<?= htmlspecialchars($id_evento) ?>">

                    <div class="mb-3">
                        <label for="servico" class="form-label">Serviço</label>
                        <select class="form-select" id="servico" name="servico_id" required disabled>
                            <?php while ($servico = $servico_result->fetch_assoc()): ?>
                                <option value="<?= $servico['id'] ?>" <?= $agendamento['servico_id'] == $servico['id'] ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($servico['servico']) ?>
                                </option>
                            <?php endwhile; ?>
                        </select>

                    </div>


            
                    <div class="row mb-3" id="horarioCampos">
                        <div class="col-md-6">
                            <label for="data_inicio" class="form-label">Data e Hora de Início</label>
                            <input type="datetime-local" class="form-control" id="data_inicio" name="data_inicio" 
                                value="<?= htmlspecialchars($agendamento['data_inicio']) ?>" disabled>
                        </div>
                        <div class="col-md-6">
                            <label for="data_fim" class="form-label">Data e Hora de Término</label>
                            <input type="datetime-local" class="form-control" id="data_fim" name="data_fim" 
                                value="<?= htmlspecialchars($agendamento['data_fim']) ?>" disabled>
                        </div>
                    </div>

                <div class="container d-flex justify-content-center align-items-center mt-4">
                    <div class="col-md-6">
                        <!-- Exibição do nome do pet -->
                        <label for="pet_id" class="form-label">Pet</label>
                        <input class="form-control" id="pet_id" name="pet_id" value="<?= htmlspecialchars($pet['nome']) ?>" disabled>

                        <!-- Exibição do nome do cliente -->
                        <div class="mt-3">
                            <label for="cliente_id" class="form-label">Cliente</label>
                            <input class="form-control" type="text" id="cliente_id" name="cliente_id" value="<?= htmlspecialchars($cliente['nome']) ?>" disabled>
                        </div>

                        <!-- Exibição do nome do veterinário -->
                        <div class="mt-3">
                            <label for="veterinario_id" class="form-label">Veterinário</label>
                            <input class="form-control" type="text" id="veterinario_id" name="veterinario_id" value="<?= htmlspecialchars($veterinario['nome']) ?>" disabled>
                        </div>
                    </div>

                    <!-- Exibição da imagem do pet -->
                    <div class="col-md-6 d-flex justify-content-center align-items-center" style="height: 100%;">
                        <div id="petFotoContainer" class="text-center">
                            <?php if (!empty($pet['foto_pet'])): ?>
                                <img src="uploads/<?= htmlspecialchars($pet['foto_pet']) ?>" alt="Foto do Pet" style="max-width: 50%;">
                            <?php else: ?>
                                <p class="text-muted">Sem foto disponível.</p>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>


            <!-- Exemplo para preencher campo de descrição -->
            <div class="mb-3">
                <label for="descricao" class="form-label">Descrição</label>
                <textarea class="form-control" id="descricao" name="descricao" rows="3" disabled><?= htmlspecialchars($agendamento['descricao']) ?></textarea>
            </div>

            <!-- O botão de submissão -->
            <div class="text-center">
                <a href="calendar_agendamento_listar.php" class="btn btn-warning w-100 mb-2">
                    <i class="fa fa-ban"></i> Cancelar Exclusão
                </a>
                <button type="submit" name="btnExcluir" class="btn btn-danger w-100">
                    <i class="fa fa-trash"></i> Confirmar Exclusão
                </button>
            </div>
        </form>
    </div>

     <!-- Modal -->
     <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Cancelamento de Agendamento</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p id="modalMessage">Agendamento cancelado com sucesso!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Fechar</button>
                </div>
                </div>
            </div>
        </div>
        </div>

<script>
    // JavaScript para carregar os campos no formulário e enviar a atualização
    document.getElementById("calendarCancelarForm").addEventListener("submit", function(event) {
        event.preventDefault();

        var formData = new FormData(this);

        fetch('calendar_cancelar_agendaAction.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            document.getElementById('modalTitle').innerText = data.status === 'success' ? 'Sucesso' : 'Erro';
            document.getElementById('modalMessage').innerText = data.message;

            if (data.status === 'success') {
                this.reset();
            }

            var matriculaModal = new bootstrap.Modal(document.getElementById('successModal'));
            matriculaModal.show();
        })
        .catch(error => console.error('Erro:', error));
    });
</script>
</body>
<?php
include 'office_footer.php';
?>
</html>
