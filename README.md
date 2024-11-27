# Trabalho de Graduação FATEC

Projeto de Graduação em Gestão da Tecnologia da Informação da Faculdade de Tecnologia de Campinas, 
elaborado sob orientação do Prof. Humberto Celeste Innarelli.

FERREIRA, E. O., FORESTO, J. L., MORGAN, G. S., Projeto de Tecnologia da Informação. Trabalho em grupo 
(Gestão da Tecnologia da Informação) - Centro Paula Souza - Faculdade de Tecnologia de Campinas, 2024.

## Do Objetivo.

A FATEC incentiva os alunos a desenvolverem solucões para problemas reais das empresas da região.
 A solução desenvolvida é um website para servir como  ferramenta de marketing digital para atrair 
 novos clientes e consolidar a preseça digital da empresa.
<p>
O escopo do projeto abrange a criação de uma empresa fictícia especializada em desenvolvimento de software e consultoria. 
O cliente será uma empresa que necessite de uma solução de software personalizada, possibilitando que os alunos desenvolvam e implementem a solução proposta.
<p>
Os alunos deverão detalhar e abordar os seguintes tópicos no desenvolvimento do projeto:

- **Requisitos funcionais e não funcionais:** definição clara das funcionalidades esperadas e das restrições técnicas ou operacionais.
- **Modelagem do banco de dados:** estruturação lógica e física dos dados necessários para o funcionamento do sistema.
- **Desenvolvimento Fullstack:** criação de uma aplicação completa, abrangendo frontend e backend.
- **Hospedagem do website:** implantação do sistema em um ambiente online funcional e acessível.

## Das Tecnologias.
- **HTML5:** Estrutura das páginas.
- **CSS3:** Estilização responsiva e moderna.
- **JavaScript:** Interatividade e usabilidade dinâmica.
- **PHP:** Backend robusto para lógica e integração com banco de dados.
- **MySQL:** Gerenciamento de dados de clientes, pets e agendamentos.
- **Framework:** FullCalendar v6.1.9.
- **API:** Google Calendar

### O sistema apresenta as seguintes funcionalidades:
- Apresentação dos serviços oferecidos.
- Solicitação de agendamentos para serviços.
- Avaliação de serviços.
- Sistema de login com autenticação segura
- Cadastro de Entidades, Clientes, Pets, Veterinários, Serviços, Usuários.
- Sistema de Agendamento.
- Conexão com o Google Calendar.
- Relatórios dinâmicos gerados em tempo real

## Da Solução
O sistema resolve o problema da falta de presença digital e organização operacional em empresas que prestam serviços para pets. 
Tal sistema funciona como uma ferramenta de marketing digital para atrair novos clientes e consolidar a presença online da empresa, 
ao mesmo tempo em que melhora a eficiência do gerenciamento de agendamentos e serviços. 
Além disso, facilita a comunicação com os clientes, enviando notificações por e-mail para auxiliá-los na organização de suas agendas, 
enquanto integra com o Google Calendar para sincronizar compromissos de forma prática e acessível.

## Da Justificativa
O projeto Tio Du Pet Service Web é uma aplicação web desenvolvida como Trabalho de Conclusão de Curso,
 com o objetivo de integrar conhecimentos teóricos e práticos adquiridos ao longo da graduação. 
 Ele busca simular um ambiente corporativo real, onde os alunos atuam na criação de uma solução tecnológica 
 completa para atender às necessidades de um cliente fictício, neste caso, uma plataforma voltada para serviços pet.

O propósito principal é desenvolver uma aplicação funcional que atenda aos requisitos específicos do cliente, 
enquanto os alunos aprimoram habilidades técnicas, como desenvolvimento fullstack, modelagem de banco de dados e hospedagem, 
além de competências interpessoais, como trabalho em equipe e gestão de projetos.

## Da Estrutura

O projeto está estruturado da seguinte forma:

### Estrutura do Projeto: TioDuPetService Web

#### Raiz do Projeto
- `agendamento.php`
- `agendamentoAction.php`
- `assets`
- `header.php`
- `index.php`
- `office`
- `politica_privacidade.php`
- `processa_avaliacao.php`
- `README.md`
- `solicitarAvaliacao.php`

#### Diretório: assets
- `db_tiodupetservice.sql`
- `mobile-navbar.js`
- `style.css`

#### Subdiretório: assets/images
- `acomodacao1.jpg`
- `acomodacao2.jpg`
- `acomodacao3.jpg`
- `ambiente-seguro.jpg`
- `atividades - Copia.jpg`
- `atividades.jpg`
- `carousel`
- `carousel3 - Copia.jpg`
- `comentario1.jpg`
- `comentario2.jpg`
- `comentario3.jpg`
- `creche_pet.jpg`
- `equipe.jpg`
- `hotel_pet - Copia.jpg`
- `hotel_pet.jpg`
- `LogoTioDu.png`
- `LogoTioDu.svg`
- `petsitter_pet - Copia.jpg`
- `petsitter_pet.jpg`
- `tiodumainimage.jpg`

#### Subdiretório: assets/images/carousel
- `carousel1.jpg`
- `carousel2.jpg`
- `carousel3.webp`

#### Diretório: office
- `avaliacaoAction.php`
- `avaliacao_excluirAction.php`
- `avaliacao_listar.php`
- `bootstrap.bundle.min.js`
- `calendar.php`
- `calendar_agendamento_listar.php`
- `calendar_agendar - Copia.php`
- `calendar_agendar.php`
- `calendar_agendarAction - Copia.php`
- `calendar_agendarAction.php`
- `calendar_atualizar_agenda.php`
- `calendar_atualizar_agendaAction.php`
- `calendar_cancelar_agenda.php`
- `calendar_cancelar_agendaAction.php`
- `calendar_consultar_financeiro.php`
- `calendar_enviar_eventos_google.php`
- `calendar_finalizar_agendaAction.php`
- `calendar_get_events.php`
- `calendar_get_pets.php`
- `calendar_get_servicos.php`
- `callback.php`
- `cliente_atualizar.php`
- `cliente_atualizarAction.php`
- `cliente_cadastro.php`
- `cliente_cadastroAction.php`
- `cliente_excluir.php`
- `cliente_excluirAction.php`
- `cliente_listar.php`
- `conexaoAction.php`
- `credentials.json`
- `lead_atualizar.php`
- `lead_atualizarAction.php`
- `lead_excluir.php`
- `lead_excluirAction.php`
- `lead_listar.php`
- `login.php`
- `login_activity.php`
- `logout.php`
- `main.php`
- `office_footer.php`
- `office_header.php`
- `office_style.css`
- `pet_adicionarClienteAction.php`
- `pet_adicionarVeterinarioAction.php`
- `pet_atualizar.php`
- `pet_atualizarAction.php`
- `pet_cadastro.php`
- `pet_cadastroAction.php`
- `pet_excluir.php`
- `pet_excluirAction.php`
- `pet_listar.php`
- `servico_atualizar.php`
- `servico_atualizarAction.php`
- `servico_cadastro.php`
- `servico_cadastroAction.php`
- `servico_excluir.php`
- `servico_excluirAction.php`
- `servico_listar.php`
- `token.php`
- `usuario_cadastro.php`
- `usuario_criar.php`
- `veterinario_atualizar.php`
- `veterinario_atualizarAction.php`
- `veterinario_cadastro.php`
- `veterinario_cadastroAction.php`
- `veterinario_excluir.php`
- `veterinario_excluirAction.php`
- `veterinario_listar.php`

#### Subdiretório: office/uploads
- `pet_ (1).jpg`
- `pet_ (2).jpg`
- `pet_ (3).jpg`
- `pet_ (...).jpg`



## Do Deploy
### Instalação do XAMPP
Para rodar o sistema localmente, é necessário configurar um servidor local que inclua Apache, MySQL e PHP. O XAMPP é uma excelente opção, pois reúne todas as funcionalidades necessárias em um único pacote, facilitando o processo.

Você pode baixar o XAMPP pelo site oficial: https://www.apachefriends.org/pt_br/index.html.

#### Passos para instalação:
1. Acesse o link acima e baixe a versão compatível com o seu sistema operacional (Windows, macOS ou Linux).
2. Execute o instalador e siga as instruções exibidas durante o processo.
3. Após a instalação, verifique a estrutura da pasta raiz do XAMPP. Ela deve incluir subpastas como htdocs, apache, mysql, entre outras. Após a instalação a pasta raiz do XAMPP deve ter a seguinte estrutura:

| Diretório       | Tipo   | Data       | Hora   |
|-----------------|--------|------------|--------|
| **xampp**       | DIR    | 25/11/2024 | 20:18  |
| ├── anonymous   | DIR    | 25/11/2024 | 20:18  |
| ├── apache      | DIR    | 25/11/2024 | 20:19  |
| ├── cgi-bin	  | DIR    | 25/11/2024 | 20:24  |
| ├── contrib	  | DIR    | 25/11/2024 | 20:18  |
| ├── **`htdocs`** 	  | DIR    | 25/11/2024 | 20:18  |
| ├── img	      | DIR    | 25/11/2024 | 20:18  |
| ├── FileZillaFTP| DIR    | 25/11/2024 | 20:24  |
| ├── install     | DIR    | 25/11/2024 | 20:24  |
| ├── licenses    | DIR    | 25/11/2024 | 20:18  |
| ├── locale      | DIR    | 25/11/2024 | 20:18  |
| ├── mailoutput  | DIR    | 25/11/2024 | 20:18  |
| ├── mailtodisk  | DIR    | 25/11/2024 | 20:19  |
| ├── MercuryMail | DIR    | 25/11/2024 | 20:24  |
| ├── mysql       | DIR    | 25/11/2024 | 20:19  |
| ├── perl        | DIR    | 25/11/2024 | 20:21  |
| ├── php         | DIR    | 25/11/2024 | 20:24  |
| ├── phpMyAdmin  | DIR    | 25/11/2024 | 20:24  |
| ├── sendmail    | DIR    | 25/11/2024 | 20:24  |
| ├── src         | DIR    | 25/11/2024 | 20:18  |
| ├── tmp         | DIR    | 25/11/2024 | 20:25  |
| ├── tomcat      | DIR    | 25/11/2024 | 20:19  |
| ├── webalizer   | DIR    | 25/11/2024 | 20:24  |
| └── webdav      | DIR    | 25/11/2024 | 20:19  |
<p>

A pasta **`htdocs`** será o local onde os arquivos do sistema devem ser colocados, pois é a raiz acessada pelo servidor web.
<p>

### Como rodar o projeto

Para executar o projeto, siga os passos abaixo:

Salve os arquivos na pasta correta:

- A pasta do projeto deve ser chamada **`tiodupetservice_web`**.
- No Windows, o projeto deve ser salvo no seguinte caminho: `C:\xampp\htdocs\tiodupetservice_web`

- Execute o XAMPP e inicie os módulos Apache e MySQL clicando em **`Start`** para cada um.

Após os módulos estarem em execução, abra o navegador de sua preferência e acesse o projeto pelo endereço: `http://localhost/tiodupetservice_web/`<p>

Agora, basta configurar o banco de dados para completar a instalação.

### Configuração do banco de dados

Configure o banco de dados:

Importar o arquivo database.sql localizado na pasta /sql.
Atualizar as credenciais no arquivo config.php.
Inicie o servidor: