<?php
include 'conexaoAction.php'; // Certifique-se de que $conexao está configurado corretamente aqui

// Verifica se os dados foram enviados
$id_evento = $_POST['id_evento'] ?? null;
$descricao = $_POST['descricao'] ?? null;
$data_inicio = $_POST['data_inicio'] ?? null;
$data_fim = $_POST['data_fim'] ?? null;

if ($id_evento && $descricao && $data_inicio && $data_fim) {
    // Atualiza os campos de descrição, data de início e data de término do evento no banco de dados
    $stmt = $conexao->prepare("UPDATE agendamento SET descricao = ?, data_inicio = ?, data_fim = ? WHERE id_evento = ?");
    $stmt->bind_param("sssi", $descricao, $data_inicio, $data_fim, $id_evento);

    if ($stmt->execute()) {
        echo json_encode([
            'status' => 'success',
            'message' => 'Agendamento atualizado com sucesso!'
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Erro ao atualizar o agendamento.'
        ]);
    }

    $stmt->close();
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Dados incompletos: ID de agendamento, descrição, data de início ou data de fim ausente.'
    ]);
}

$conexao->close();
?>
