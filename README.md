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

- <b>Requisitos funcionais e não funcionais:</b> definição clara das funcionalidades esperadas e das restrições técnicas ou operacionais.
- <b>Modelagem do banco de dados:</b> estruturação lógica e física dos dados necessários para o funcionamento do sistema.
- <b>Desenvolvimento Fullstack:</b> criação de uma aplicação completa, abrangendo frontend e backend.
- <b>Hospedagem do website:</b> implantação do sistema em um ambiente online funcional e acessível.

## Das Tecnologias.
- <b>HTML5:</b> Estrutura das páginas.
- <b>CSS3:</b> Estilização responsiva e moderna.
- <b>JavaScript:</b> Interatividade e usabilidade dinâmica.
- <b>PHP:</b> Backend robusto para lógica e integração com banco de dados.
- <b>MySQL:</b> Gerenciamento de dados de clientes, pets e agendamentos.
- <b>Framework:</b> FullCalendar v6.1.9.
- <b>API:</b> Google Calendar

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


## Do Deploy


Estrutura do Projeto
Contribuição
Licença
Funcionalidades
Liste as principais funcionalidades do sistema:


Como Executar o Projeto
Instruções para configurar e executar o projeto localmente:

Clone o repositório:

bash
Copiar código
git clone https://github.com/SeuUsuario/SeuProjeto.git
Instale as dependências necessárias (se houver):

Requisitos do sistema: Apache, PHP, MySQL.
Instalação de pacotes adicionais (se necessário):
bash
Copiar código
composer install
npm install
Configure o banco de dados:

Importar o arquivo database.sql localizado na pasta /sql.
Atualizar as credenciais no arquivo config.php.
Inicie o servidor:

bash
Copiar código
php -S localhost:8000
Acesse o sistema no navegador:
http://localhost:8000

Estrutura do Projeto
Explique como os arquivos e diretórios estão organizados:

plaintext
Copiar código
.
├── assets/
│   ├── css/
│   ├── js/
│   └── images/
├── config/
├── sql/
├── templates/
├── index.php
└── README.md
Descrição dos diretórios
assets/: Arquivos estáticos (CSS, JS, imagens).
config/: Arquivos de configuração do sistema.
sql/: Scripts de banco de dados.
templates/: Layouts e páginas reutilizáveis.
Contribuição
Gostaria de contribuir com melhorias? Siga os passos abaixo:

Faça um fork do projeto.
Crie um branch para sua funcionalidade:
bash
Copiar código
git checkout -b feature/SuaFuncionalidade
Faça um commit das suas alterações:
bash
Copiar código
git commit -m "Descrição da alteração"
Envie para o branch principal:
bash
Copiar código
git push origin feature/SuaFuncionalidade
Abra um Pull Request.
