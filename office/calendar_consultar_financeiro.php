<?php
include 'login_activity.php';
include 'office_header.php';
require_once("conexaoAction.php"); // Certifique-se de que o arquivo de configuração está correto

// Define variáveis para o filtro de datas
$data_inicio = $_GET['data_inicio'] ?? '';
$data_fim = $_GET['data_fim'] ?? '';

// Consulta SQL com filtro por data de agendamento
$filter_sql = "";
if (!empty($data_inicio) && !empty($data_fim)) {
    $filter_sql = " AND data_inicio >= '$data_inicio' AND data_fim <= '$data_fim'";
}


// Consultar total de receitas e total de serviços
$sql_totais = "
    SELECT 
        SUM(servico.preco) AS receita_total,
        COUNT(agendamento.id_evento) AS total_servicos
    FROM agendamento
    JOIN servico ON servico_id = servico.id
    WHERE 1=1 $filter_sql
";
$result_totais = $conexao->query($sql_totais);
$row_totais = $result_totais->fetch_assoc();

$receita_total = $row_totais['receita_total'] ?? 0;
$total_servicos = $row_totais['total_servicos'] ?? 0;

// Consultar receitas por tipo de serviço para o gráfico
$sql_grafico = "
    SELECT 
        servico.tipo,
        SUM(servico.preco) AS receita_tipo
    FROM agendamento
    JOIN servico ON servico_id = servico.id
    WHERE 1=1 $filter_sql
    GROUP BY servico.tipo
";
$result_grafico = $conexao->query($sql_grafico);

$dados_grafico = [];
$labels = [];
while ($row = $result_grafico->fetch_assoc()) {
    $labels[] = $row['tipo'];
    $dados_grafico[] = $row['receita_tipo'];
}

?>

<head>
    <title>Dashboard Financeiro</title>

    <style>
        .dashboard-header {
            margin-bottom: 20px;
            text-align: center;
        }
        .summary-box {
            border: 1px solid #ccc;
            padding: 15px;
            border-radius: 10px;
            background-color: #f8f9fa;
            width: 100%;
            text-align: center;
        }
        .filter {
            max-width: 400px;
            margin: 0 auto;
        }
    </style>
</head>
<body class="bg-light">

<div class="container my-5">
    <!-- Título -->
    <div class="dashboard-header">
        <h2>Dashboard Financeiro</h2>
    </div>

    <!-- Filtro de Data -->
    <div class="filter mb-4">
        <form method="GET" action="" class="row g-2">
            <div class="col-md-5">
                <label for="data_inicio" class="form-label">Data Início</label>
                <input type="date" id="data_inicio" name="data_inicio" class="form-control" value="<?php echo htmlspecialchars($data_inicio); ?>" required>
            </div>
            <div class="col-md-5">
                <label for="data_fim" class="form-label">Data Fim</label>
                <input type="date" id="data_fim" name="data_fim" class="form-control" value="<?php echo htmlspecialchars($data_fim); ?>" required>
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <button type="submit" class="btn btn-primary w-100">Filtrar</button>
            </div>
        </form>
    </div>

    <!-- Informações financeiras -->
    <div class="row text-center mb-5">
        <div class="col-md-6">
            <div class="summary-box">
                <strong>Total de Receitas:</strong>
                <p class="text-success fs-4">R$ <?php echo number_format($receita_total, 2, ',', '.'); ?></p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="summary-box">
                <strong>Total de Serviços:</strong>
                <p class="text-primary fs-4"><?php echo $total_servicos; ?></p>
            </div>
        </div>
    </div>

    <!-- Gráfico de Pizza -->
    <div class="text-center mb-3">
        <h5>Receitas x Serviços</h5>
    </div>
    <div class="d-flex justify-content-center">
        <div style="max-width: 500px;">
            <canvas id="graficoPizza" width="600" height="600"></canvas>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- Script para inicializar o gráfico de pizza -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const ctx = document.getElementById('graficoPizza').getContext('2d');

        // Configuração dos dados do gráfico
        const data = {
            labels: <?php echo json_encode($labels); ?>,
            datasets: [{
                data: <?php echo json_encode($dados_grafico); ?>,
                backgroundColor: ['#FF6384', '#008000', '#FFCE56'],
                borderColor: '#fff',
                borderWidth: 1
            }]
        };

        // Configuração do gráfico de pizza
        const config = {
            type: 'pie',
            data: data,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'right',
                        labels: {
                            color: 'black',
                            font: {
                                size: 14
                            }
                        }
                    }
                }
            }
        };

        // Inicializa o gráfico
        new Chart(ctx, config);
    });
</script>


</body>
</html>

<?php
// Fecha a conexão com o banco de dados
$conexao->close();

include 'office_footer.php';

?>

