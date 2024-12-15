<?php
include 'conexaoAction.php'; // Inclua sua conexão com o banco de dados

// Consulta SQL com JOIN para buscar nome do pet, cliente, veterinário e serviço
$sql = "
    SELECT agendamento.id_evento, agendamento.titulo, agendamento.data_inicio, agendamento.data_fim, 
           agendamento.descricao, agendamento.dia_completo, pet.nome AS pet_nome, 
           cliente.nome AS cliente_nome, servico.servico AS servico_servico, 
           veterinario.nome AS veterinario_nome
    FROM agendamento
    INNER JOIN pet ON agendamento.pet_id = pet.id
    INNER JOIN cliente ON agendamento.cliente_id = cliente.id
    INNER JOIN veterinario ON agendamento.veterinario_id = veterinario.id
    INNER JOIN servico ON agendamento.servico_id = servico.id
    WHERE agendamento.status = 'ativo'
";


$result = $conexao->query($sql);
$events = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        // Define a cor com base no nome do serviço
        switch ($row['servico_servico']) {
            case 'Hospedagem Diária':
                $color = '#FF6347'; // Vermelho Tomate
                break;
            case 'Hospedagem Semanal':
                $color = '#FF4500'; // Laranja
                break;
            case 'Hospedagem Mensal':
                $color = '#FF7F50'; // Coral
                break;
            case 'Creche Anual':
                $color = '#4682B4'; // Azul Aço
                break;
            case 'Creche Semestral':
                $color = '#5F9EA0'; // Azul Verde
                break;
            case 'Creche Mensal':
                $color = '#6495ED'; // Azul Claro
                break;
            case 'Pet Sitter Visita Única':
                $color = '#32CD32'; // Verde Lima
                break;
            case 'Pet Sitter Visitas Diárias':
                $color = '#228B22'; // Verde Floresta
                break;
            case 'Pet Sitter Noturno':
                $color = '#006400'; // Verde Escuro
                break;
            default:
                $color = '#3788d8'; // Cor padrão
        }

        $events[] = [
            'id' => $row['id_evento'],
            'title' => $row['pet_nome'] . ' - ' . $row['servico_servico'],
            'start' => $row['data_inicio'],
            'end' => $row['data_fim'],
            'backgroundColor' => $color,
            'borderColor' => $color,
            'allDay' => (bool)$row['dia_completo'], // Adiciona a propriedade allDay
            'extendedProps' => [
                'descricao' => $row['descricao'],
                'pet_nome' => $row['pet_nome'],
                'cliente_nome' => $row['cliente_nome'],
                'veterinario_nome' => $row['veterinario_nome'],
                'servico_nome' => $row['servico_servico']
            ]
        ];
    }
}

$conexao->close();

// Retorna os eventos como JSON
header('Content-Type: application/json');
echo json_encode($events);
?>
