<?php
include 'conexaoAction.php';  // Certifique-se de que esta conexão está correta

// Verifique se o ID do serviço foi fornecido
if (isset($_GET['servico_id'])) {
    $servico_id = intval($_GET['servico_id']);
    
    // Consulta o serviço específico no banco de dados
    $query = "SELECT id, servico, tipo FROM servico WHERE id = ?";
    $stmt = $conexao->prepare($query);
    $stmt->bind_param("i", $servico_id);
    $stmt->execute();
    $result = $stmt->get_result();

    // Verifica se encontrou o serviço
    if ($result->num_rows > 0) {
        $servico = $result->fetch_assoc();
        echo json_encode($servico);  // Envia o JSON
    } else {
        echo json_encode(['error' => 'Serviço não encontrado']);  // Envia erro se não encontrou
    }
    
    $stmt->close();
} else {
    echo json_encode(['error' => 'ID de serviço não fornecido']);  // Envia erro se o ID não foi passado
}

$conexao->close();
?>
