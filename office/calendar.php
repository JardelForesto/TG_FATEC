<?php

include './login_activity.php';
include './office_header.php';
?>



<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8' />
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    themeSystem: 'bootstrap5',
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay'
                    },
                    locale: 'pt-br',
                    displayEventTime: false,
                    events: 'calendar_get_events.php', // Caminho para o arquivo PHP que retorna eventos em JSON
                    eventClick: function(arg) {
                        window.open(arg.event.url, '_blank', 'width=700,height=600');
                        arg.jsEvent.preventDefault();
                    }
                });
                calendar.render();
            });
    </script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/@fullcalendar/bootstrap5@6.1.9/index.global.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/@fullcalendar/google-calendar@6.1.9/index.global.min.js'></script>
    <style>
        
        #calendar {
            width: auto;
            height: auto; /* Ajuste conforme necessário */
            margin: 20px;
            background-color: #ffff;
            border-style: solid;
            border: 10px solid #f8f9fa;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10pt;
        }
    </style>
</head>
<body>


        <div id='calendar'></div>

        <!-- Modal Bootstrap -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventModalLabel">Detalhes do Evento</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Início:</strong> <span id="start"></span></p>
                <p><strong>Término:</strong> <span id="end"></span></p>
                <p><strong>Nome do Pet:</strong> <span id="petNome"></span></p>
                <p><strong>Nome do Cliente:</strong> <span id="clienteNome"></span></p>
                <p><strong>Nome do Veterinário:</strong> <span id="veterinarioNome"></span></p>
                <p><strong>Descrição:</strong> <span id="descricao"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>



<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            themeSystem: 'bootstrap5',
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            locale: 'pt-br',
            displayEventTime: false,
            events: 'calendar_get_events.php',
            eventClick: function(arg) {
                arg.jsEvent.preventDefault();

                // Preencher o modal com os dados do evento
                document.getElementById('start').innerText = arg.event.start.toLocaleString();
                document.getElementById('end').innerText = arg.event.end ? arg.event.end.toLocaleString() : 'Sem término definido';
                document.getElementById('petNome').innerText = arg.event.extendedProps.pet_nome;
                document.getElementById('clienteNome').innerText = arg.event.extendedProps.cliente_nome;
                document.getElementById('veterinarioNome').innerText = arg.event.extendedProps.veterinario_nome;
                document.getElementById('descricao').innerText = arg.event.extendedProps.descricao;

                // Exibir o modal Bootstrap
                var modal = new bootstrap.Modal(document.getElementById('eventModal'));
                modal.show();
            }
        });
        calendar.render();
    });
</script>

<?php
include 'office_footer.php';
?>

</body>
</html>
