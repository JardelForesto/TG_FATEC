<?php
include 'conexaoAction.php'; // Inclua sua conexão com o banco de dados
session_start();

// Processar o formulário quando o método for POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $servico_id = $_POST['servico_id'];
    $pet_id = $_POST['pet_id'];
    $cliente_id = $_POST['cliente_id'];
    $veterinario_id = $_POST['veterinario_id'];
    $titulo = $_POST['titulo'];
    $descricao = $_POST['descricao'];
    $localizacao = "https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220";
    $dia_completo = isset($_POST['diaCompleto']) ? 1 : 0;
    $status = 'ativo';
    $data_inicio = $_POST['data_inicio'];
    $data_fim = $_POST['data_fim'];

    $sql = "INSERT INTO agendamento 
                (servico_id, pet_id, cliente_id, veterinario_id, titulo, descricao, localizacao, data_inicio, data_fim, dia_completo, status) 
            VALUES 
                (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("iiiisssssss", $servico_id, $pet_id, $cliente_id, $veterinario_id, $titulo, $descricao, $localizacao, $data_inicio, $data_fim, $dia_completo, $status);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Agendamento salvo no banco de dados com sucesso']);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Erro ao salvar agendamento no banco de dados']);
    }

    // Fecha a declaração e a conexão
    $stmt->close();
    $conexao->close();
}
?>
