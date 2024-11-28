<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tio Du Pets</title>

    <style>

        /* Estilizando o nav */
        header nav {
            position:fixed;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #f0f001; /* Fundo amarelo */
            color: #000;
        }

        .nav-list {
            list-style: none;
            display: flex;
            gap: 15px;
            margin: 0;
            justify-content: center;
            width: 100%;
        }

        .nav-list li {
            margin: 0;
        }

        .nav-list a {
            color: #000; /* Texto preto para contraste no fundo amarelo */
            text-decoration: none;
            font-size: 14px; /* Fonte menor */
            font-weight: bold;
            padding: 8px 15px;
            border: 2px solid transparent;
            border-radius: 25px;
            transition: all 0.3s ease;
        }

        /* Hover nos botões */
        .nav-list a:hover {
            background-color: #ffffff; /* Cor de destaque */
            color:#fe6c6c;
            border-color: #ffa8a8;
        }

        /* Estilo da logo */
        .logo img {
            max-width: 120px;
            height: auto;
        }

        /* Menu mobile */
        .mobile-menu {
            display: none;
            cursor: pointer;
        }

        .mobile-menu div {
            width: 25px;
            height: 3px;
            background-color: #000;
            margin: 5px;
            transition: 0.3s;
        }

        /* Menu responsivo */
        @media (max-width: 768px) {
            .nav-list {
                position: absolute;
                top: 100px;
                right: 0;
                width: 100%;
                height: calc(100vh - 100px);
                background-color: #FFD700;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: 30px;
                transform: translateX(100%);
                transition: transform 0.3s ease;
            }

            .nav-list.active {
                transform: translateX(0);
            }

            .mobile-menu {
                display: block;
            }
        }
    </style>
</head>

<body>
   
<header>
    <nav>
        <a class="logo" href="index.php#"><img src="assets/images/LogoTioDu.svg" alt="Logo Tio Du Pets"></a>

        <div class="mobile-menu" onclick="toggleMenu()">
            <div class="line1"></div>
            <div class="line2"></div>
            <div class="line3"></div>
        </div>
        
        <ul class="nav-list" id="nav-list">
            <li><a href="/tiodupetservice_web/#sobre-nos">O Espaço</a></li>
            <li><a href="/tiodupetservice_web/#servicos">Serviços e comodidades</a></li>
            <li><a href="/tiodupetservice_web/#acomodacoes">Acomodações</a></li>
            <li><a href="/tiodupetservice_web/#localizacao">Localização</a></li>
            <li><a href="/tiodupetservice_web/#avaliacoes">Avaliações</a></li>
        </ul>
    </nav>
</header>

<script>
    function toggleMenu() {
        const navList = document.getElementById('nav-list');
        navList.classList.toggle('active');
    }
</script>

</body>
</html>
