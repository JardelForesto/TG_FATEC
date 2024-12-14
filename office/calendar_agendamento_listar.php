<?php
include 'login_activity.php';
include 'office_header.php';
include 'conexaoAction.php';

$filtro_cliente = isset($_GET['cliente_id']) ? $_GET['cliente_id'] : '';
$filtro_pet = isset($_GET['pet_id']) ? $_GET['pet_id'] : '';
$filtro_servico = isset($_GET['servico_id']) ? $_GET['servico_id'] : '';
$filtro_datainicio = isset($_GET['data_inicio']) ? $_GET['data_inicio'] : '';
$filtro_datafim = isset($_GET['data_fim']) ? $_GET['data_fim'] : '';
$filtro_status = isset($_GET['status']) ? $_GET['status'] : '';

// Consulta para buscar clientes, pets e serviços para os filtros
$sql_clientes = "SELECT id, nome FROM cliente ORDER BY nome ASC";
$clientes = $conexao->query($sql_clientes);

$sql_pets = "SELECT id, nome FROM pet ORDER BY nome ASC";
$pets = $conexao->query($sql_pets);

$sql_servicos = "SELECT id, servico FROM servico";
$servicos = $conexao->query($sql_servicos);

// Consulta de agendamentos com filtros
$sql = "SELECT agendamento.*, cliente.nome AS nome_cliente, pet.nome AS nome_pet, servico.tipo AS tipo_servico 
        FROM agendamento
        JOIN cliente ON agendamento.cliente_id = cliente.id
        JOIN pet ON agendamento.pet_id = pet.id
        JOIN servico ON agendamento.servico_id = servico.id
        WHERE 1=1";

        

if (!empty($filtro_cliente)) {
    $sql .= " AND agendamento.cliente_id = '$filtro_cliente'";
}
if (!empty($filtro_pet)) {
    $sql .= " AND agendamento.pet_id = '$filtro_pet'";
}
if (!empty($filtro_servico)) {
    $sql .= " AND agendamento.servico_id = '$filtro_servico'";
}
if (!empty($filtro_datainicio)) {
    $sql .= " AND DATE(agendamento.data_inicio) = '$filtro_datainicio'";
}
if (!empty($filtro_datafim)) {
    $sql .= " AND DATE(agendamento.data_fim) = '$filtro_datafim'";
}
if (!empty($filtro_status)) {
    $sql .= " AND(agendamento.status) = '$filtro_status'";
}

$resultado = $conexao->query($sql);
?>

<head>
    <title>Listagem de Agendamentos</title>
</head>
<body>
<section>
    <div class="container mt-4">
        <div class="form-container shadow-lg p-4 rounded">
            <h1 class="text-center mb-4 display-4">Listagem de Agendamentos</h1>

            <!-- Formulário de filtros -->
            <form method="GET" action="" class="mb-2">
                <div class="row g-3">
                    <div class="col-md-4">
                            <label for="status" class="form-label">Status</label>
                            <select name="status" id="status" class="form-select">
                                <option value="">Todos</option>
                                <option value="ativo" <?= $filtro_status == 'ativo' ? 'selected' : '' ?>>Ativo</option>
                                <option value="cancelado" <?= $filtro_status == 'cancelado' ? 'selected' : '' ?>>Cancelado</option>
                                <option value="finalizado" <?= $filtro_status == 'finalizado' ? 'selected' : '' ?>>Finalizado</option>
                            </select>
                    </div>

                    <div class="col-md-4">
                            <label for="cliente_id" class="form-label">Cliente:</label>
                            <select name="cliente_id" class="form-select">
                                <option value="">Todos</option>
                                <?php while ($cliente = $clientes->fetch_assoc()) { ?>
                                    <option value="<?= $cliente['id'] ?>" <?= ($filtro_cliente == $cliente['id']) ? 'selected' : '' ?>><?= $cliente['nome'] ?></option>
                                <?php } ?>
                            </select>
                    </div>

                    <div class="col-md-4">
                            <label for="pet_id" class="form-label">Pet:</label>
                            <select name="pet_id" class="form-select">
                                <option value="">Todos</option>
                                <?php while ($pet = $pets->fetch_assoc()) { ?>
                                    <option value="<?= $pet['id'] ?>" <?= ($filtro_pet == $pet['id']) ? 'selected' : '' ?>><?= $pet['nome'] ?></option>
                                <?php } ?>
                            </select>
                    </div>

                    <div class="col-md-4">
                            <label for="servico_id" class="form-label">Serviço:</label>
                            <select name="servico_id" class="form-select">
                                <option value="">Todos</option>
                                <?php while ($servico = $servicos->fetch_assoc()) { ?>
                                    <option value="<?= $servico['id'] ?>" <?= ($filtro_servico == $servico['id']) ? 'selected' : '' ?>><?= $servico['servico'] ?></option>
                                <?php } ?>
                            </select>
                    </div>

                    <div class="col-md-4">
                            <label for="data_inicio" class="form-label">Data inicio:</label>
                            <input type="date" name="data_inicio" value="<?= $filtro_datainicio ?>" class="form-control">

                    </div>

                    <div class="col-md-4">
                            <label for="data_fim" class="form-label">Data fim:</label>
                            <input type="date" name="data_fim" value="<?= $filtro_datafim ?>" class="form-control">
                    </div>

                    <div class="text-center mt-4">
                        <input type="submit" value="Filtrar" class="btn btn-primary">
                    </div>

                </div>

            </form>

            <br>

            <!-- Tabela de agendamentos -->
            <table class="table table-sm table-striped table-hover table-bordered border-primary rounded">
                <thead class="table-primary text-center">
                    <tr>
                        <th>Código</th>
                        <th>Serviço</th>
                        <th>Pet</th>
                        <th>Cliente</th>
                        <th>Data Início</th>
                        <th>Data Fim</th>
                        <th>Descrição</th>
                        <th>Status</th>
                        <th>Cancelar</th>
                        <th>Atualizar</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <?php if ($resultado->num_rows > 0) {
                        while ($linha = $resultado->fetch_assoc()) { ?>
                            <tr>
                                <td><?= $linha['id_evento'] ?></td>
                                <td><?= $linha['tipo_servico'] ?></td>
                                <td><?= $linha['nome_pet'] ?></td>
                                <td><?= $linha['nome_cliente'] ?></td>
                                <td><?= $linha['data_inicio'] ?></td>
                                <td><?= $linha['data_fim'] ?></td>
                                <td><?= $linha['descricao'] ?></td>
                                <td><?= $linha['status'] ?></td>
                                <td><a href="calendar_cancelar_agenda.php?id_evento=<?= $linha['id_evento'] ?>"><i class="fa fa-ban"></i></a></td>
                                <td><a href="calendar_atualizar_agenda.php?id_evento=<?= $linha['id_evento'] ?>"><i class="fa fa-refresh"></i></a></td>
                            </tr>
                        <?php }
                    } else { ?>
                        <tr>
                            <td colspan="8" class="text-center">Nenhum agendamento encontrado</td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</section>

</body>
<?php
include 'office_footer.php';
?>
</html>
