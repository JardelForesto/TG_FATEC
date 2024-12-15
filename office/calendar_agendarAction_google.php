<?php
include 'conexaoAction.php'; // Inclua sua conexão com o banco de dados
require_once 'vendor/autoload.php'; // Inclui o autoload da biblioteca Google

session_start();

// Configurando o cliente Google com a conta de serviço
$client = new Google_Client();
$client->setAuthConfig('credentials.json'); // Caminho para o arquivo JSON da conta de serviço
$client->setApplicationName('APIgoogle TioDuPetService 2024');
$client->setScopes(Google_Service_Calendar::CALENDAR);
$client->setSubject('tiodupets@gmail.com'); // Coloque aqui o e-mail do proprietário do calendário
$client->setRedirectUri('http://localhost/tiodupetservice_web/office/callback.php');


// Verifica se o token de acesso já está salvo na sessão
if (!isset($_SESSION['access_token.json'])) {
    // Redireciona para a URL de autenticação do Google
    $authUrl = $client->createAuthUrl();
    echo json_encode(['status' => 'auth_required', 'authUrl' => $authUrl]);
    exit();

} else {
    // Usa o token de acesso da sessão
    $client->setAccessToken($_SESSION['access_token.json']);

    // Renova o token se necessário
    if ($client->isAccessTokenExpired()) {
        $client->fetchAccessTokenWithRefreshToken($client->getRefreshToken());
        $_SESSION['access_token.json'] = $client->getAccessToken();
    }

    // Instancia o serviço do Google Calendar
    $service = new Google_Service_Calendar($client);

    // Processar o formulário quando o método for POST
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $servico_id = $_POST['servico_id'];
        $pet_id = $_POST['pet_id'];
        $cliente_id = $_POST['cliente_id'];
        $emailCliente = $_POST['email_cliente'];
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
            // Configuração do evento no Google Calendar
            $eventData = [
                'summary' => $titulo,
                'location' => $localizacao,
                'description' => $descricao,
                'reminders' => [
                    'useDefault' => false,
                    'overrides' => [
                        ['method' => 'email', 'minutes' => 24 * 60],
                        ['method' => 'popup', 'minutes' => 10],
                    ],
                ],
                'attendees' => [
                    ['email' => $emailCliente],  // Adiciona o e-mail do cliente dinamicamente
                ],
            ];

            // Configuração de data e hora do evento
            if ($dia_completo == 1) {
                $eventData['start'] = ['date' => date('Y-m-d', strtotime($data_inicio))];
                // Somar um dia para incluir o dia final no evento de dia completo
                $eventData['end'] = ['date' => date('Y-m-d', strtotime($data_fim . ' +1 day'))];
            } else {
                $eventData['start'] = [
                    'dateTime' => date(DATE_ISO8601, strtotime($data_inicio)),
                    'timeZone' => 'America/Sao_Paulo',
                ];
                $eventData['end'] = [
                    'dateTime' => date(DATE_ISO8601, strtotime($data_fim)),
                    'timeZone' => 'America/Sao_Paulo',
                ];
            }
            

            // Insere o evento no Google Calendar
            try {
                $event = new Google_Service_Calendar_Event($eventData);
                $calendarId = 'primary';
                $optParams = array('sendUpdates' => 'all'); // Força envio de notificação para todos os participantes
                $event = $service->events->insert($calendarId, $event, $optParams);
                echo json_encode(['status' => 'success', 'message' => 'Agendamento realizado e evento adicionado ao Google Calendar com sucesso']);
            } catch (Exception $e) {
                echo json_encode(['status' => 'error', 'message' => 'Erro ao adicionar evento ao Google Calendar: ' . $e->getMessage()]);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Erro ao salvar agendamento no banco de dados']);
        }
        
        // Fecha a declaração e a conexão
        $stmt->close();
        $conexao->close();
    }
}
?>
