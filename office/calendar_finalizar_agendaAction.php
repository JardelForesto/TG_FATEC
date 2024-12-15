<?php
include 'conexaoAction.php'; // Certifique-se de que $conexao está configurado corretamente aqui

if (isset($_POST['id_evento'])) {
    $idEvento = $_POST['id_evento'];

    // Atualiza o status do agendamento para "finalizado"
    $sql = "UPDATE agendamento SET status = 'finalizado' WHERE id_evento = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("i", $idEvento);

    if ($stmt->execute()) {
        echo json_encode([
            'status' => 'success',
            'message' => 'Agendamento finalizado com sucesso!'
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'Erro ao finalizar o agendamento.'
        ]);
    }

    $stmt->close();
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'ID de agendamento ou descrição ausente.'
    ]);
}
?>