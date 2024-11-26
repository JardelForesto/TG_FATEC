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


## Do Deploy

### Instalação do XAMPP

O primeiro passo, o sistema precisa roda em algum servidor local com Apache, MySQL, PHP.

O XAMPP é uma boa opção e vai facilitar muito o processo já que ele conta com todas as funcionalidades necessarias.

O XAMPP pode ser baixado através do link: https://www.apachefriends.org/pt_br/index.html

Faça a instalação de acordo com seu sistema operacional. Após a instalação a pasta raiz do XAMPP deve ter a seguinte estrutura:

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

O XAMPP roda os projetos que estão dentro da pasta **`htdocs`**
<p>

### Como rodar o projeto

Para rodar o projeto, salve todos os arquivo na pasta informada.

- A pasta do nosso projeto chama `tiodupetservice_web`.

- No Windows, o projeto fica no seguinte endereço: `C:\xampp\htdocs\tiodupetservice_web`

- Execute o XAMPP e Start os módulos Apache e MySQL 

O ultimo passo inicia o servidor local e o projeto já 
pode ser iniciado pelo seu navegador preferido pelo 
seguinte endereço: http://localhost/tiodupetservice_web/
<p>
Agora falta configurar o banco de dados.

### Configuração do banco de dados




Requisitos do sistema: Apache, PHP, MySQL.

Configure o banco de dados:

Importar o arquivo database.sql localizado na pasta /sql.
Atualizar as credenciais no arquivo config.php.
Inicie o servidor:

bash
Copiar código
php -S localhost:8000
Acesse o sistema no navegador:
http://localhost:8000
