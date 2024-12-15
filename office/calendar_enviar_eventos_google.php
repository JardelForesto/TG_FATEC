<?php
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

    // Configuração do evento no Google Calendar
    $eventData = [
        'summary' => $_POST['titulo'],
        'location' => $_POST['localizacao'],
        'description' => $_POST['descricao'],
        'reminders' => [
            'useDefault' => false,
            'overrides' => [
                ['method' => 'email', 'minutes' => 24 * 60],
                ['method' => 'popup', 'minutes' => 10],
            ],
        ],
        'attendees' => [
            ['email' => $_POST['email_cliente']],
        ],
    ];

    // Configuração de data e hora do evento
    if ($_POST['diaCompleto'] == 1) {
        $eventData['start'] = ['date' => date('Y-m-d', strtotime($_POST['data_inicio']))];
        $eventData['end'] = ['date' => date('Y-m-d', strtotime($_POST['data_fim'] . ' +1 day'))];
    } else {
        $eventData['start'] = [
            'dateTime' => date(DATE_ISO8601, strtotime($_POST['data_inicio'])),
            'timeZone' => 'America/Sao_Paulo',
        ];
        $eventData['end'] = [
            'dateTime' => date(DATE_ISO8601, strtotime($_POST['data_fim'])),
            'timeZone' => 'America/Sao_Paulo',
        ];
    }

    // Insere o evento no Google Calendar
    try {
        $event = new Google_Service_Calendar_Event($eventData);
        $calendarId = 'primary';
        $optParams = array('sendUpdates' => 'all');
        $event = $service->events->insert($calendarId, $event, $optParams);
        echo json_encode(['status' => 'success', 'message' => 'Evento adicionado ao Google Calendar com sucesso']);
    } catch (Exception $e) {
        echo json_encode(['status' => 'error', 'message' => 'Erro ao adicionar evento ao Google Calendar: ' . $e->getMessage()]);
    }
}
?>
