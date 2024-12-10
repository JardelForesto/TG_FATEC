<?php
include 'login_activity.php';  // Verificação de login do usuário
include 'office_header.php';    // Cabeçalho da página
include 'conexaoAction.php';    // Conexão com o banco de dados

// Contagem de Leads Não Contatados
$sqlLeadsNaoContatados = "SELECT COUNT(*) AS nao_contatados FROM lead WHERE lead_contatado = 0";
$result = mysqli_query($conexao, $sqlLeadsNaoContatados);
$leadsNaoContatados = mysqli_fetch_assoc($result)['nao_contatados'];

// Contagem de Avaliações Solicitadas
$sqlAvaliacoesSolicitadas = "SELECT COUNT(*) AS total FROM avaliacao_solicitadas";
$result = mysqli_query($conexao, $sqlAvaliacoesSolicitadas);
$totalAvaliacoesSolicitadas = mysqli_fetch_assoc($result)['total'];

// Define a data atual
$dataAtual = date('Y-m-d');

// Contagem de Agendamentos para Hospedagem no dia atual
$sqlHospedagem = "
    SELECT COUNT(*) AS total_hospedagem 
    FROM agendamento AS a 
    JOIN servico AS s ON a.servico_id = s.id 
    WHERE s.tipo = 'Hospedagem' 
    AND a.status = 'ativo'
    AND a.data_inicio <= '$dataAtual' 
    AND a.data_fim >= '$dataAtual'";
$result = mysqli_query($conexao, $sqlHospedagem);
$totalHospedagem = mysqli_fetch_assoc($result)['total_hospedagem'];

// Contagem de Agendamentos para Creche no dia atual
$sqlCreche = "
    SELECT COUNT(*) AS total_creche 
    FROM agendamento AS a 
    JOIN servico AS s ON a.servico_id = s.id 
    WHERE s.tipo = 'Creche' 
    AND a.status = 'ativo'
    AND a.data_inicio <= '$dataAtual' 
    AND a.data_fim >= '$dataAtual'";
$result = mysqli_query($conexao, $sqlCreche);
$totalCreche = mysqli_fetch_assoc($result)['total_creche'];

/* Contagem de Agendamentos para Pet Sitter no dia atual
$sqlPetSitter = "
    SELECT COUNT(*) AS total_pet_sitter 
    FROM agendamento AS a 
    JOIN servico AS s ON a.servico_id = s.id 
    WHERE s.tipo = 'Pet Sitter' 
    AND a.status = 'ativo'
    AND a.data_inicio <= '$dataAtual' 
    AND a.data_fim >= '$dataAtual'";
$result = mysqli_query($conexao, $sqlPetSitter);
$totalPetSitter = mysqli_fetch_assoc($result)['total_pet_sitter'];*/

// Define o início e o fim do dia atual
$dataAtualInicio = date('Y-m-d') . ' 00:00:00';
$dataAtualFim = date('Y-m-d') . ' 23:59:59';

// Contagem de Agendamentos para Pet Sitter no dia atual, considerando eventos de dia completo e específicos por hora
$sqlPetSitter = "
    SELECT COUNT(*) AS total_pet_sitter 
    FROM agendamento AS a 
    JOIN servico AS s ON a.servico_id = s.id 
    WHERE s.tipo = 'Pet Sitter' 
    AND a.status = 'ativo'
    AND (
        (DATE(a.data_inicio) = DATE(a.data_fim) AND a.data_inicio >= '$dataAtualInicio' AND a.data_fim <= '$dataAtualFim')  -- Eventos de dia completo
        OR (a.data_inicio <= '$dataAtualFim' AND a.data_fim >= '$dataAtualInicio')  -- Eventos que se sobrepõem ao dia atual
    )";
    
$result = mysqli_query($conexao, $sqlPetSitter);

if ($result) {
    $totalPetSitter = mysqli_fetch_assoc($result)['total_pet_sitter'];
} else {
    $totalPetSitter = 0;  // Define um valor padrão em caso de erro na consulta
    echo "Erro na consulta: " . mysqli_error($conexao);  // Exibe o erro para depuração
}



?>

<head>
    <title>Dashboard</title>
    <style>
        .card { border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); text-align: center; padding: 20px; }
        .table { margin-top: 20px; }
    </style>
</head>
<body>

<div class="container text-center mt-4">
    <div class="row justify-content-md-center">
        <!-- Primeira linha de cartões -->
        <div class="col-md-3 mb-3">
            <div class="card bg-secondary ">
                <div class="card-header">
                    <a href="<?php echo base_url('office/lead_listar.php'); ?>" class="text-black">Leads Não Contatados</a>
                </div>
                <div class="card-body">
                    <h5 class="card-text"><?php echo $leadsNaoContatados; ?></h5>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-bg-warning ">
                <div class="card-header">
                    <a href="<?php echo base_url('office/avaliacao_listar.php'); ?>" class="text-black">Avaliações Solicitadas</a>

                </div>
                <div class="card-body">
                    <h5 class="card-text"><?php echo $totalAvaliacoesSolicitadas; ?></h5>
                </div>
            </div>
        </div>
    </div>
    <div class="row justify-content-md-center">
        <!-- Segunda linha de cartões -->
        <div class="col-md-3 mb-3">
            <div class="card text-bg-danger">
                <div class="card-header">Hospedagem</div>
                    <div class="card-body">
                    <h5 class="card-text"><?php echo $totalHospedagem; ?></h5>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-bg-info">
                <div class="card-header">Creche</div>
                    <div class="card-body">
                    <h5 class="card-text"><?php echo $totalCreche; ?></h5>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-3">
            <div class="card text-bg-success">
                <div class="card-header">Pet Sitter</div>
                    <div class="card-body">
                    <h5 class="card-text"><?php echo $totalPetSitter; ?></h5>
                </div>
            </div>
        </div>


    </div>
</div>


<section>
    <div class="container mt-4">
        <div class="form-container shadow-lg p-4 rounded">
            <h1 class="text-center mb-4 display-4">Detalhes dos Agendamentos</h1>
            <table class="table table-sm table-striped table-hover table-bordered border-primary rounded">
                <thead class="table-primary text-center">
                        <tr>
                            <th>ID</th>
                            <th>Cliente</th>
                            <th>Pet</th>
                            <th>Serviço</th>
                            <th>Data de Início</th>
                            <th>Data de Fim</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
            $sqlAgendamentos = "
            SELECT 
                a.id_evento, 
                c.nome AS cliente, 
                p.nome AS pet, 
                s.servico, 
                a.data_inicio, 
                a.data_fim, 
                a.status
            FROM 
                agendamento AS a
            JOIN 
                cliente AS c ON a.cliente_id = c.id
            JOIN 
                pet AS p ON a.pet_id = p.id
            JOIN 
                servico AS s ON a.servico_id = s.id

WHERE 
    a.status = 'ativo'
    AND (
        (DATE(a.data_inicio) = CURDATE() AND DATE(a.data_fim) = CURDATE())  -- Eventos de um único dia com início e fim no dia atual
        OR (a.data_inicio <= '$dataAtualFim' AND a.data_fim >= '$dataAtualInicio')  -- Eventos que se sobrepõem ao dia atual
    )

                ";


                        
                        $result = mysqli_query($conexao, $sqlAgendamentos);
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td>" . $row['id_evento'] . "</td>";
                            echo "<td>" . $row['cliente'] . "</td>";
                            echo "<td>" . $row['pet'] . "</td>";
                            echo "<td>" . $row['servico'] . "</td>";
                            echo "<td>" . $row['data_inicio'] . "</td>";
                            echo "<td>" . $row['data_fim'] . "</td>";
                            echo "<td>" . $row['status'] . "</td>";
                            echo "</tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
<section>

</body>

<?php
include 'office_footer.php';
?>
