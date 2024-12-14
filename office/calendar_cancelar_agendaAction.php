<?php
include 'conexaoAction.php';

header('Content-Type: application/json');

// Verifica se o ID do evento foi fornecido
$id_evento = $_POST['id_evento'] ?? null;

if (!$id_evento) {
    echo json_encode([
        'status' => 'error',
        'message' => 'ID do evento não fornecido.'
    ]);
    exit;
}

// Prepara a query para cancelar o agendamento (definindo o status como "cancelado")
$stmt = $conexao->prepare("UPDATE agendamento SET status = 'cancelado' WHERE id_evento = ?");
$stmt->bind_param("i", $id_evento);

if ($stmt->execute()) {
    echo json_encode([
        'status' => 'success',
        'message' => 'Agendamento cancelado com sucesso.'
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'Erro ao cancelar o agendamento.'
    ]);
}

$stmt->close();
$conexao->close();
?>
