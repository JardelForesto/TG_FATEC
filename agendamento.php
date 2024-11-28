<div class="floating-box">
    <div class="dropdown-center">
        <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            Solicite um serviço
        </button>
        <ul class="dropdown-menu p-1" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item text-primary" href="#" onclick="setServiceType('Hospedagem')">Hospedagem</a></li>
            <li><a class="dropdown-item text-primary" href="#" onclick="setServiceType('Creche')">Creche</a></li>
            <li><a class="dropdown-item text-primary" href="#" onclick="setServiceType('Pet Sitter')">Pet Sitter</a></li>
        </ul>
    </div>

    <!-- Formulário -->
    <div class="form-popup" id="reservationForm">
        <form class="form-container" action="agendamentoAction.php" method="POST"> 
            <h3>Solicitação de Agendamento</h3>
            <label for="txtID" hidden></label>
            <input name="txtID" id="txtID" type="text" hidden>

            <input type="hidden" name="serviceTypeInput" id="serviceTypeInput">
            <input type="hidden" name="selectedDateTime" id="selectedDateTime">

            <label for="name"><b>Nome</b></label>
            <input type="text" placeholder="Digite seu nome" name="txtNome" id="txtNome" required class="form-control mb-2" maxlength="100">
        
            <label for="phone"><b>Telefone</b></label>

                <label for="txtTelefone"><b>Telefone</b></label>
                <input type="tel" placeholder="Digite seu telefone" name="txtTelefone" id="txtTelefone"  class="form-control mb-2"  required  maxlength="15">
                <script>
                            // Função para aplicar a máscara no campo de telefone
                            document.getElementById("txtTelefone").addEventListener("input", function(event) {
                                let input = event.target;
                                let value = input.value;

                                // Remove caracteres que não são números
                                value = value.replace(/\D/g, "");

                                // Aplica a máscara (DD) XXXXX-XXXX
                                if (value.length > 2 && value.length <= 7) {
                                value = `(${value.slice(0, 2)}) ${value.slice(2)}`;
                                } else if (value.length > 7) {
                                value = `(${value.slice(0, 2)}) ${value.slice(2, 7)}-${value.slice(7, 11)}`;
                                }

                                // Atualiza o valor do campo com a máscara
                                input.value = value;
                            });
                </script>


            <label for="email"><b>Email</b></label>
            <input type="email" placeholder="Digite seu email" name="txtEmail" id="txtEmail" required class="form-control mb-2" maxlength="100">

            <!-- Preferência de Contato -->
            <fieldset>
                <legend>Como prefere nosso contato?</legend>
                <label><input type="radio" name="contato" value="email" required>Email</label>
                <label><input type="radio" name="contato" value="telefone" required>Telefone</label>
                <label><input type="radio" name="contato" value="whatsapp" required checked>WhatsApp</label>
            </fieldset>


            <!-- Horário Preferido -->
            <fieldset>
                <legend>Qual horário prefere receber nosso contato?</legend>
                <label><input type="radio" name="horario" value="manha" required checked>Manhã</label>
                <label><input type="radio" name="horario" value="tarde" required>Tarde</label>
            </fieldset>
            <fieldset>
            <!-- Receber Novidades -->
            <label class="checkbox">
                <input type="checkbox" name="receber_novidades" id="receber_novidades" checked> Gostaria de receber nossas novidades por email?
            </label>

            <!-- Autorização para Tratamento de Dados -->
            <label class="checkbox">
                <input type="checkbox" name="autorizacao" id="autorizacao" required> 
                Autorizo o uso de meus dados conforme a <a href="politica_privacidade.php" target="_blank">Política de Privacidade</a>.
            </label>
            </fieldset>

             <input type="hidden" name="lead_contatado" id="lead_contatado" value="Não">

            <button type="submit" class="btn btn-primary mt-2" onclick="setDateTime()">Enviar Solicitação</button>
            <button type="button" class="btn btn-secondary mt-2" onclick="closeForm()">Cancelar</button>
        </form>
    </div>
</div>
