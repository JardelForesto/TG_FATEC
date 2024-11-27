CREATE DATABASE db_tiodupetservice;

USE db_tiodupetservice;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "-03:00";


--
-- Banco de dados: `db_tiodupetservice`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `id_evento` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `veterinario_id` int(11) DEFAULT NULL,
  `servico_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `dia_completo` tinyint(1) DEFAULT 0,
  `status` varchar(50) DEFAULT 'Agendado',
  `data_criacao` timestamp NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agendamento`
--

INSERT INTO `agendamento` (`id_evento`, `pet_id`, `cliente_id`, `veterinario_id`, `servico_id`, `titulo`, `descricao`, `localizacao`, `data_inicio`, `data_fim`, `dia_completo`, `status`, `data_criacao`, `data_atualizacao`) VALUES
(1, 1, 1, 1, 4, 'Creche Anual', 'Plano anual de acompanhamento diário', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-01 00:00:00', '2024-12-31 00:00:00', 1, 'finalizado', '2023-12-25 16:30:00', '2024-12-31 16:30:00'),
(2, 2, 2, 2, 5, 'Creche Semestral', 'Instruções especiais sobre a alimentação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-01 00:00:00', '2024-06-01 00:00:00', 1, 'finalizado', '2023-12-28 16:30:00', '2023-12-28 16:30:00'),
(3, 3, 3, 3, 1, 'Hospedagem Diária', 'Pet precisa de medicamento às 10h', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-02 00:00:00', '2024-01-03 00:00:00', 1, 'cancelado', '2023-12-28 16:30:00', '2024-11-04 22:31:31'),
(4, 4, 4, 4, 1, 'Hospedagem Diária', 'Pet precisa de medicamento às 8h', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-02 00:00:00', '2024-01-03 00:00:00', 1, 'finalizado', '2023-12-28 16:30:00', '2023-12-28 20:44:06'),
(5, 5, 5, 5, 1, 'Hospedagem Diária', 'Pet precisa de medicamento às 8h', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-02 00:00:00', '2024-01-03 00:00:00', 1, 'finalizado', '2023-12-28 16:30:00', '2023-12-28 20:44:06'),
(6, 6, 6, 6, 4, 'Creche Anual', 'Supervisão e cuidados o ano todo', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-01 00:00:00', '2024-12-31 00:00:00', 1, 'finalizado', '2024-01-01 06:00:00', '2025-01-01 06:00:00'),
(7, 7, 7, 7, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-15 00:00:00', '2024-01-31 00:00:00', 1, 'finalizado', '2024-01-01 18:00:00', '2026-01-31 18:00:00'),
(8, 8, 8, 8, 9, 'Pet Sitter Noturno', 'Cuidado noturno e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-20 18:00:00', '2024-01-20 19:00:00', 0, 'finalizado', '2024-01-01 20:30:00', '2026-01-01 20:30:00'),
(9, 9, 9, 9, 2, 'Hospedagem Semanal', 'Pet com dieta especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-10 00:00:00', '2024-01-17 00:00:00', 1, 'finalizado', '2024-01-05 15:15:00', '2024-01-05 15:15:00'),
(10, 10, 10, 10, 2, 'Hospedagem Semanal', 'Pet com dieta especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-10 00:00:00', '2024-01-17 00:00:00', 1, 'finalizado', '2024-01-05 15:15:00', '2024-01-05 15:15:00'),
(11, 11, 11, 11, 2, 'Hospedagem Semanal', 'Pet com dieta especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-10 00:00:00', '2024-01-17 00:00:00', 1, 'finalizado', '2024-01-05 15:15:00', '2024-01-05 15:15:00'),
(12, 12, 12, 12, 7, 'Pet Sitter Visita Única', 'Visita para alimentação e higiene', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-15 10:00:00', '2024-01-15 11:00:00', 0, 'finalizado', '2024-01-10 14:45:00', '2025-01-10 14:45:00'),
(13, 13, 13, 1, 1, 'Hospedagem Diária', 'Cuidados especiais para o pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-25 00:00:00', '2024-01-26 00:00:00', 1, 'finalizado', '2024-01-10 20:00:00', '2026-01-26 20:00:00'),
(14, 14, 14, 2, 8, 'Pet Sitter Visitas Diárias', 'Visitas diárias para cuidados e passeios', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-20 08:00:00', '2024-01-27 08:00:00', 0, 'finalizado', '2024-01-15 15:15:00', '2025-01-27 15:15:00'),
(15, 15, 15, 3, 5, 'Creche Semestral', 'Supervisão em grupo e atividades recreativas', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-01 00:00:00', '2024-07-01 00:00:00', 1, 'finalizado', '2024-01-15 15:50:00', '2025-02-01 15:50:00'),
(16, 16, 16, 4, 3, 'Hospedagem Mensal', 'Instruções para banho semanal', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-01 00:00:00', '2024-03-01 00:00:00', 1, 'cancelado', '2024-01-15 22:40:00', '2024-01-21 00:30:00'),
(17, 17, 17, 5, 3, 'Hospedagem Mensal', 'Instruções para banho semanal', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-01 00:00:00', '2024-03-01 00:00:00', 1, 'cancelado', '2024-01-15 22:40:00', '2024-01-21 00:30:00'),
(18, 18, 18, 6, 3, 'Hospedagem Mensal', 'Instruções para banho semanal', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-01 00:00:00', '2024-03-01 00:00:00', 1, 'cancelado', '2024-01-15 22:40:00', '2024-01-21 00:30:00'),
(19, 19, 19, 7, 7, 'Pet Sitter Visita Única', 'Cuidado e supervisão rápida', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-01-30 10:00:00', '2024-01-30 11:00:00', 0, 'finalizado', '2024-01-20 17:00:00', '2026-01-20 17:00:00'),
(20, 20, 20, 8, 2, 'Hospedagem Semanal', 'Cuidados contínuos e carinho', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-05 00:00:00', '2024-02-12 00:00:00', 1, 'finalizado', '2024-01-25 18:15:00', '2026-02-12 18:15:00'),
(21, 21, 21, 9, 1, 'Hospedagem Diária', 'Pet com restrições alimentares', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-01 00:00:00', '2024-02-02 00:00:00', 1, 'finalizado', '2024-01-28 18:00:00', '2025-01-28 18:00:00'),
(22, 22, 22, 10, 9, 'Pet Sitter Noturno', 'Acompanhamento noturno e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-01 18:00:00', '2024-02-01 19:00:00', 0, 'finalizado', '2024-01-28 21:30:00', '2025-01-28 21:30:00'),
(23, 23, 23, 11, 2, 'Hospedagem Semanal', 'Atividades supervisionadas com dieta', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-05 00:00:00', '2024-02-12 00:00:00', 1, 'finalizado', '2024-01-30 15:00:00', '2025-02-12 15:00:00'),
(24, 24, 24, 12, 6, 'Creche Mensal', 'Interação e diversão diárias', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-10 00:00:00', '2024-02-28 00:00:00', 1, 'finalizado', '2024-01-30 16:00:00', '2026-01-30 16:00:00'),
(25, 25, 25, 1, 1, 'Hospedagem Diária', 'Cuidados diários para seu pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-20 00:00:00', '2024-02-21 00:00:00', 1, 'finalizado', '2024-02-01 20:00:00', '2026-02-21 20:00:00'),
(26, 26, 26, 2, 9, 'Pet Sitter Noturno', 'Cuidados e supervisão noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-15 18:00:00', '2024-02-15 19:00:00', 0, 'finalizado', '2024-02-01 20:30:00', '2026-02-01 20:30:00'),
(27, 27, 27, 3, 9, 'Pet Sitter Noturno', 'Supervisão durante a noite', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-10 20:00:00', '2024-02-10 21:00:00', 0, 'finalizado', '2024-02-01 22:00:00', '2025-02-11 02:00:00'),
(28, 28, 28, 4, 8, 'Pet Sitter Visitas Diárias', 'Visitas para exercícios e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-15 08:00:00', '2024-02-22 08:00:00', 0, 'finalizado', '2024-02-10 14:30:00', '2025-02-10 14:30:00'),
(29, 29, 29, 5, 8, 'Pet Sitter Visitas Diárias', 'Supervisão e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-25 08:00:00', '2024-03-04 08:00:00', 0, 'finalizado', '2024-02-10 16:00:00', '2026-02-10 16:00:00'),
(30, 30, 30, 6, 7, 'Pet Sitter Visita Única', 'Companhia por uma hora', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-02-15 14:00:00', '2024-02-15 15:00:00', 0, 'finalizado', '2024-02-10 17:00:00', '2024-02-10 17:00:00'),
(31, 31, 31, 7, 2, 'Hospedagem Semanal', 'Cuidados e carinho especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-01 00:00:00', '2024-03-08 00:00:00', 1, 'finalizado', '2024-02-15 17:15:00', '2026-03-08 17:15:00'),
(32, 32, 32, 8, 4, 'Creche Anual', 'Lembrar de verificar a saúde do pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-01 00:00:00', '2024-03-01 00:00:00', 1, 'finalizado', '2024-02-15 17:20:00', '2024-02-15 17:20:00'),
(33, 33, 33, 9, 4, 'Creche Anual', 'Lembrar de verificar a saúde do pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-01 00:00:00', '2024-03-01 00:00:00', 1, 'finalizado', '2024-02-15 17:20:00', '2024-02-15 17:20:00'),
(34, 34, 34, 10, 4, 'Creche Anual', 'Lembrar de verificar a saúde do pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-01 00:00:00', '2024-03-01 00:00:00', 1, 'finalizado', '2024-02-15 17:20:00', '2024-02-15 17:20:00'),
(35, 35, 35, 11, 8, 'Pet Sitter Visitas Diárias', 'Passeios diários pelo bairro', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-01 09:00:00', '2024-03-01 10:00:00', 0, 'finalizado', '2024-02-20 14:00:00', '2024-03-01 16:00:00'),
(36, 36, 36, 12, 4, 'Creche Anual', 'Atividades sociais e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-01 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-02-20 15:30:00', '2025-02-20 15:30:00'),
(37, 37, 37, 1, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-05 00:00:00', '2024-03-31 00:00:00', 1, 'finalizado', '2024-02-20 18:00:00', '2026-03-31 18:00:00'),
(38, 38, 38, 2, 9, 'Pet Sitter Noturno', 'Cuidado e conforto durante a noite', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-01 18:00:00', '2024-03-01 19:00:00', 0, 'finalizado', '2024-02-20 23:00:00', '2025-02-20 23:00:00'),
(39, 39, 39, 3, 7, 'Pet Sitter Visita Única', 'Visita para alimentação e cuidados rápidos', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-10 10:00:00', '2024-03-10 11:00:00', 0, 'finalizado', '2024-03-01 17:15:00', '2025-03-01 17:15:00'),
(40, 40, 40, 4, 2, 'Hospedagem Semanal', 'Supervisão contínua e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-15 00:00:00', '2024-03-22 00:00:00', 1, 'finalizado', '2024-03-01 17:30:00', '2025-03-22 17:30:00'),
(41, 41, 41, 5, 1, 'Hospedagem Diária', 'Recomendações de medicação e dieta', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-05 00:00:00', '2024-03-06 00:00:00', 1, 'finalizado', '2024-03-01 18:30:00', '2025-03-06 18:30:00'),
(42, 42, 42, 6, 1, 'Hospedagem Diária', 'Cuidado especial para seu pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-15 00:00:00', '2024-03-16 00:00:00', 1, 'finalizado', '2024-03-01 20:00:00', '2026-03-16 20:00:00'),
(43, 43, 43, 7, 9, 'Pet Sitter Noturno', 'Cuidado noturno com atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-10 18:00:00', '2024-03-10 19:00:00', 0, 'finalizado', '2024-03-01 20:30:00', '2026-03-01 20:30:00'),
(44, 44, 44, 8, 7, 'Pet Sitter Visita Única', 'Cuidado e supervisão rápida', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-20 10:00:00', '2024-03-20 11:00:00', 0, 'finalizado', '2024-03-05 16:00:00', '2026-03-05 16:00:00'),
(45, 45, 45, 9, 3, 'Hospedagem Mensal', 'Cuidado integral durante o mês', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 00:00:00', '2024-04-30 00:00:00', 1, 'finalizado', '2024-03-10 16:00:00', '2025-03-10 16:00:00'),
(46, 46, 46, 10, 9, 'Pet Sitter Noturno', 'Cuidado durante a noite e conforto', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-25 18:00:00', '2024-03-25 19:00:00', 0, 'finalizado', '2024-03-15 23:45:00', '2025-03-15 23:45:00'),
(47, 47, 47, 11, 5, 'Creche Semestral', 'Interação com outros pets e atividades', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 00:00:00', '2024-09-30 00:00:00', 1, 'finalizado', '2024-03-20 15:00:00', '2025-03-20 15:00:00'),
(48, 48, 48, 12, 4, 'Creche Anual', 'Cuidados e interação com outros pets', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-03-20 15:30:00', '2025-03-20 15:30:00'),
(49, 49, 49, 1, 2, 'Hospedagem Semanal', 'Cuidados contínuos e carinho', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-03-25 00:00:00', '2024-04-01 00:00:00', 1, 'finalizado', '2024-03-20 18:15:00', '2026-04-01 18:15:00'),
(50, 50, 50, 2, 9, 'Pet Sitter Noturno', 'Supervisão durante a noite', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 20:00:00', '2024-04-01 21:00:00', 0, 'cancelado', '2024-03-20 23:00:00', '2024-03-20 23:00:00'),
(51, 51, 51, 3, 8, 'Pet Sitter Visitas Diárias', 'Visitas para exercícios e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-05 08:00:00', '2024-04-12 08:00:00', 0, 'finalizado', '2024-03-25 15:30:00', '2025-03-25 15:30:00'),
(52, 52, 52, 4, 7, 'Pet Sitter Visita Única', 'Pet precisa de visita para alimentação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 10:00:00', '2024-04-01 11:00:00', 0, 'finalizado', '2024-03-28 19:15:00', '2024-04-01 14:00:00'),
(53, 53, 53, 5, 7, 'Pet Sitter Visita Única', 'Pet precisa de visita para alimentação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 10:00:00', '2024-04-01 11:00:00', 0, 'finalizado', '2024-03-28 19:15:00', '2024-04-01 14:00:00'),
(54, 54, 54, 6, 7, 'Pet Sitter Visita Única', 'Pet precisa de visita para alimentação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 10:00:00', '2024-04-01 11:00:00', 0, 'finalizado', '2024-03-28 19:15:00', '2024-04-01 14:00:00'),
(55, 55, 55, 7, 6, 'Creche Mensal', 'Interação e diversão diárias', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-01 00:00:00', '2024-04-30 00:00:00', 1, 'finalizado', '2024-03-30 16:00:00', '2026-04-30 16:00:00'),
(56, 56, 56, 8, 1, 'Hospedagem Diária', 'Cuidados diários para seu pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-10 00:00:00', '2024-04-11 00:00:00', 1, 'finalizado', '2024-03-31 20:00:00', '2026-04-11 20:00:00'),
(57, 57, 57, 9, 9, 'Pet Sitter Noturno', 'Cuidados e supervisão noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-05 18:00:00', '2024-04-05 19:00:00', 0, 'finalizado', '2024-03-31 20:30:00', '2026-03-31 20:30:00'),
(58, 58, 58, 10, 8, 'Pet Sitter Visitas Diárias', 'Supervisão e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-15 08:00:00', '2024-04-22 08:00:00', 0, 'finalizado', '2024-04-01 16:00:00', '2026-04-01 16:00:00'),
(59, 59, 59, 11, 2, 'Hospedagem Semanal', 'Atividades supervisionadas com dieta', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-15 00:00:00', '2024-04-22 00:00:00', 1, 'finalizado', '2024-04-01 16:30:00', '2025-04-01 16:30:00'),
(60, 60, 60, 12, 9, 'Pet Sitter Noturno', 'Acompanhamento noturno e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-25 18:00:00', '2024-04-25 19:00:00', 0, 'finalizado', '2024-04-01 17:00:00', '2025-04-01 17:00:00'),
(61, 61, 61, 1, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-25 00:00:00', '2024-05-31 00:00:00', 1, 'finalizado', '2024-04-01 18:00:00', '2026-05-31 18:00:00'),
(62, 62, 62, 2, 2, 'Hospedagem Semanal', 'Cuidados e carinho especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-04-20 00:00:00', '2024-04-27 00:00:00', 1, 'finalizado', '2024-04-10 17:15:00', '2026-04-27 17:15:00'),
(63, 63, 63, 3, 1, 'Hospedagem Diária', 'Importante verificar medicação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-01 00:00:00', '2024-05-02 00:00:00', 1, 'finalizado', '2024-04-15 20:45:00', '2025-05-02 20:45:00'),
(64, 64, 64, 4, 8, 'Pet Sitter Visitas Diárias', 'Visitas diárias para alimentação e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-05 08:00:00', '2024-05-12 08:00:00', 0, 'finalizado', '2024-04-25 15:30:00', '2025-04-25 15:30:00'),
(65, 65, 65, 5, 8, 'Pet Sitter Visitas Diárias', 'Visitas diárias para passeios', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-01 09:00:00', '2024-05-01 10:00:00', 0, 'finalizado', '2024-04-25 16:10:00', '2024-04-25 16:10:00'),
(66, 66, 66, 6, 8, 'Pet Sitter Visitas Diárias', 'Visitas diárias para passeios', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-01 09:00:00', '2024-05-01 10:00:00', 0, 'finalizado', '2024-04-25 16:10:00', '2024-04-25 16:10:00'),
(67, 67, 67, 7, 8, 'Pet Sitter Visitas Diárias', 'Visitas diárias para passeios', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-01 09:00:00', '2024-05-01 10:00:00', 0, 'finalizado', '2024-04-25 16:10:00', '2024-04-25 16:10:00'),
(68, 68, 68, 8, 2, 'Hospedagem Semanal', 'Cuidado total durante a semana', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-10 00:00:00', '2024-05-17 00:00:00', 1, 'finalizado', '2024-04-30 16:00:00', '2025-05-10 16:00:00'),
(69, 69, 69, 9, 1, 'Hospedagem Diária', 'Cuidados especiais para o pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-05 00:00:00', '2024-05-06 00:00:00', 1, 'finalizado', '2024-04-30 20:00:00', '2026-05-06 20:00:00'),
(70, 70, 70, 10, 9, 'Pet Sitter Noturno', 'Cuidado noturno e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-01 18:00:00', '2024-05-01 19:00:00', 0, 'finalizado', '2024-04-30 20:30:00', '2026-04-30 20:30:00'),
(71, 71, 71, 11, 7, 'Pet Sitter Visita Única', 'Cuidado e supervisão rápida', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-10 10:00:00', '2024-05-10 11:00:00', 0, 'finalizado', '2024-05-01 16:00:00', '2026-05-01 16:00:00'),
(72, 72, 72, 12, 9, 'Pet Sitter Noturno', 'Acompanhamento noturno e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-15 18:00:00', '2024-05-15 19:00:00', 0, 'finalizado', '2024-05-01 17:15:00', '2025-05-01 17:15:00'),
(73, 73, 73, 1, 1, 'Hospedagem Diária', 'Recomendações de saúde e alimentação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-20 00:00:00', '2024-05-21 00:00:00', 1, 'finalizado', '2024-05-01 18:00:00', '2025-05-21 18:00:00'),
(74, 74, 74, 2, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-20 00:00:00', '2024-05-31 00:00:00', 1, 'finalizado', '2024-05-01 18:00:00', '2026-05-31 18:00:00'),
(75, 75, 75, 3, 8, 'Pet Sitter Visitas Diárias', 'Supervisão e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-05 08:00:00', '2024-06-12 08:00:00', 0, 'finalizado', '2024-05-10 16:00:00', '2026-05-10 16:00:00'),
(76, 76, 76, 4, 7, 'Pet Sitter Visita Única', 'Cuidado e supervisão rápida', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-01 10:00:00', '2024-07-01 11:00:00', 0, 'finalizado', '2024-05-10 16:00:00', '2026-05-10 16:00:00'),
(77, 77, 77, 5, 8, 'Pet Sitter Visitas Diárias', 'Supervisão e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-01 08:00:00', '2024-08-08 08:00:00', 0, 'finalizado', '2024-05-10 16:00:00', '2026-05-10 16:00:00'),
(78, 78, 78, 6, 2, 'Hospedagem Semanal', 'Cuidados e carinho especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-10 00:00:00', '2024-06-17 00:00:00', 1, 'finalizado', '2024-05-10 17:15:00', '2026-06-17 17:15:00'),
(79, 79, 79, 7, 2, 'Hospedagem Semanal', 'Cuidados e carinho especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-05 00:00:00', '2024-08-12 00:00:00', 1, 'finalizado', '2024-05-10 17:15:00', '2026-08-12 17:15:00'),
(80, 80, 80, 8, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-15 00:00:00', '2024-06-30 00:00:00', 1, 'finalizado', '2024-05-10 18:00:00', '2026-06-30 18:00:00'),
(81, 81, 81, 9, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-15 00:00:00', '2024-07-31 00:00:00', 1, 'finalizado', '2024-05-10 18:00:00', '2026-07-31 18:00:00'),
(82, 82, 82, 10, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-10 00:00:00', '2024-08-31 00:00:00', 1, 'finalizado', '2024-05-10 18:00:00', '2026-08-31 18:00:00'),
(83, 83, 83, 11, 2, 'Hospedagem Semanal', 'Cuidados contínuos e carinho', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-15 00:00:00', '2024-05-22 00:00:00', 1, 'finalizado', '2024-05-10 18:15:00', '2026-05-22 18:15:00'),
(84, 84, 84, 12, 2, 'Hospedagem Semanal', 'Cuidados contínuos e carinho', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-05 00:00:00', '2024-07-12 00:00:00', 1, 'finalizado', '2024-05-10 18:15:00', '2026-07-12 18:15:00'),
(85, 85, 85, 1, 1, 'Hospedagem Diária', 'Cuidados especiais para seu pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-30 00:00:00', '2024-05-31 00:00:00', 1, 'finalizado', '2024-05-10 20:00:00', '2026-05-31 20:00:00'),
(86, 86, 86, 2, 1, 'Hospedagem Diária', 'Cuidados especiais para o pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-25 00:00:00', '2024-06-26 00:00:00', 1, 'finalizado', '2024-05-10 20:00:00', '2026-06-26 20:00:00'),
(87, 87, 87, 3, 1, 'Hospedagem Diária', 'Cuidados especiais para seu pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-25 00:00:00', '2024-07-26 00:00:00', 1, 'finalizado', '2024-05-10 20:00:00', '2026-07-26 20:00:00'),
(88, 88, 88, 4, 1, 'Hospedagem Diária', 'Cuidados especiais para o pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-20 00:00:00', '2024-08-21 00:00:00', 1, 'finalizado', '2024-05-10 20:00:00', '2026-08-21 20:00:00'),
(89, 89, 89, 5, 9, 'Pet Sitter Noturno', 'Cuidado noturno e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-25 18:00:00', '2024-05-25 19:00:00', 0, 'finalizado', '2024-05-10 20:30:00', '2026-05-10 20:30:00'),
(90, 90, 90, 6, 9, 'Pet Sitter Noturno', 'Cuidado noturno e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-20 18:00:00', '2024-06-20 19:00:00', 0, 'finalizado', '2024-05-10 20:30:00', '2026-05-10 20:30:00'),
(91, 91, 91, 7, 9, 'Pet Sitter Noturno', 'Cuidado noturno e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-20 18:00:00', '2024-07-20 19:00:00', 0, 'finalizado', '2024-05-10 20:30:00', '2026-05-10 20:30:00'),
(92, 92, 92, 8, 9, 'Pet Sitter Noturno', 'Cuidado noturno e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-15 18:00:00', '2024-08-15 19:00:00', 0, 'finalizado', '2024-05-10 20:30:00', '2026-05-10 20:30:00'),
(93, 93, 93, 9, 4, 'Creche Anual', 'Acompanhamento diário e interações', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-05-01 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-05-15 16:30:00', '2025-05-15 16:30:00'),
(94, 94, 94, 10, 5, 'Creche Semestral', 'Instruções sobre cuidados específicos', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-01 00:00:00', '2024-12-01 00:00:00', 1, 'ativo', '2024-05-15 17:20:00', '2024-05-15 17:20:00'),
(95, 95, 95, 11, 7, 'Pet Sitter Visita Única', 'Cuidado rápido e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-01 10:00:00', '2024-06-01 11:00:00', 0, 'finalizado', '2024-05-20 20:00:00', '2025-05-20 20:00:00'),
(96, 96, 96, 12, 3, 'Hospedagem Mensal', 'Cuidado integral durante o mês', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-05 00:00:00', '2024-06-30 00:00:00', 1, 'finalizado', '2024-05-25 18:00:00', '2025-06-30 18:00:00'),
(97, 97, 97, 1, 9, 'Pet Sitter Noturno', 'Pet precisa de companhia noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-01 20:00:00', '2024-06-01 21:00:00', 0, 'cancelado', '2024-05-29 23:45:00', '2024-05-31 15:00:00'),
(98, 98, 98, 2, 9, 'Pet Sitter Noturno', 'Pet precisa de companhia noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-01 20:00:00', '2024-06-01 21:00:00', 0, 'cancelado', '2024-05-29 23:45:00', '2024-05-31 15:00:00'),
(99, 99, 99, 3, 9, 'Pet Sitter Noturno', 'Pet precisa de companhia noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-01 20:00:00', '2024-06-01 21:00:00', 0, 'cancelado', '2024-05-29 23:45:00', '2024-05-31 15:00:00'),
(100, 100, 100, 4, 9, 'Pet Sitter Noturno', 'Cuidado e alimentação à noite', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-10 18:00:00', '2024-06-10 19:00:00', 0, 'finalizado', '2024-06-01 21:30:00', '2025-06-01 21:30:00'),
(101, 101, 1, 1, 2, 'Hospedagem Semanal', 'Supervisão contínua e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-15 00:00:00', '2024-06-22 00:00:00', 1, 'finalizado', '2024-06-05 16:00:00', '2025-06-22 16:00:00'),
(102, 102, 2, 2, 8, 'Pet Sitter Visitas Diárias', 'Visitas diárias para alimentação e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-06-20 08:00:00', '2024-06-27 08:00:00', 0, 'finalizado', '2024-06-05 17:30:00', '2025-06-05 17:30:00'),
(103, 103, 3, 3, 4, 'Creche Anual', 'Cuidados e interação com outros pets', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-01 00:00:00', '2024-12-31 00:00:00', 1, 'finalizado', '2024-06-15 15:30:00', '2025-06-15 15:30:00'),
(104, 104, 4, 4, 6, 'Creche Mensal', 'Pet precisa de exercícios diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-01 00:00:00', '2024-08-01 00:00:00', 1, 'finalizado', '2024-06-20 16:00:00', '2024-06-20 16:00:00'),
(105, 105, 5, 5, 3, 'Hospedagem Mensal', 'Cuidado integral durante o mês', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-01 00:00:00', '2024-07-31 00:00:00', 1, 'finalizado', '2024-06-20 16:00:00', '2025-07-31 16:00:00'),
(106, 106, 6, 6, 5, 'Creche Semestral', 'Necessita atenção especial em exercícios', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-01 00:00:00', '2024-12-31 00:00:00', 1, 'finalizado', '2024-06-20 16:15:00', '2024-12-31 06:00:00'),
(107, 107, 7, 7, 5, 'Creche Semestral', 'Supervisão de comportamentos específicos', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-01 00:00:00', '2024-12-31 00:00:00', 1, 'finalizado', '2024-06-20 16:15:00', '2024-06-20 16:15:00'),
(108, 108, 8, 8, 9, 'Pet Sitter Noturno', 'Acompanhamento noturno e conforto', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-05 18:00:00', '2024-07-05 19:00:00', 0, 'finalizado', '2024-06-20 20:45:00', '2025-06-20 20:45:00'),
(109, 109, 9, 9, 2, 'Hospedagem Semanal', 'Supervisão contínua e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-10 00:00:00', '2024-07-17 00:00:00', 1, 'finalizado', '2024-06-25 18:30:00', '2025-07-17 18:30:00'),
(110, 110, 10, 10, 4, 'Creche Anual', 'Pet precisa de supervisão constante', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-01 00:00:00', '2024-07-01 00:00:00', 1, 'finalizado', '2024-06-28 15:00:00', '2024-06-28 15:00:00'),
(111, 111, 11, 11, 8, 'Pet Sitter Visitas Diárias', 'Cuidado diário e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-20 08:00:00', '2024-07-27 08:00:00', 0, 'finalizado', '2024-07-01 16:00:00', '2025-07-01 16:00:00'),
(112, 112, 12, 12, 5, 'Creche Semestral', 'Interação com outros pets e atividades', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-15 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-07-01 17:00:00', '2025-07-01 17:00:00'),
(113, 113, 13, 1, 1, 'Hospedagem Diária', 'Recomendações de medicação e dieta', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-25 00:00:00', '2024-07-26 00:00:00', 1, 'finalizado', '2024-07-01 17:15:00', '2025-07-26 17:15:00'),
(114, 114, 14, 2, 9, 'Pet Sitter Noturno', 'Cuidado noturno e conforto', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-07-30 18:00:00', '2024-07-30 19:00:00', 0, 'finalizado', '2024-07-01 18:00:00', '2025-07-01 18:00:00'),
(115, 115, 15, 3, 6, 'Creche Mensal', 'Cuidado e interação com outros pets', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-01 00:00:00', '2024-08-31 00:00:00', 1, 'finalizado', '2024-07-15 16:00:00', '2025-08-31 16:00:00'),
(116, 116, 16, 4, 1, 'Hospedagem Diária', 'Importante verificar medicação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-05 00:00:00', '2024-08-06 00:00:00', 1, 'finalizado', '2024-07-20 20:45:00', '2025-08-06 20:45:00'),
(117, 117, 17, 5, 7, 'Pet Sitter Visita Única', 'Cuidado rápido e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-10 10:00:00', '2024-08-10 11:00:00', 0, 'finalizado', '2024-08-01 17:00:00', '2025-08-01 17:00:00'),
(118, 118, 18, 6, 2, 'Hospedagem Semanal', 'Cuidado supervisionado', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-15 00:00:00', '2024-08-22 00:00:00', 1, 'finalizado', '2024-08-01 18:30:00', '2025-08-22 18:30:00'),
(119, 119, 19, 7, 5, 'Creche Semestral', 'Interação e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-20 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-08-05 15:30:00', '2025-08-05 15:30:00'),
(120, 120, 20, 8, 1, 'Hospedagem Diária', 'Check-up diário recomendado', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-10 00:00:00', '2024-08-11 00:00:00', 1, 'finalizado', '2024-08-05 21:00:00', '2024-08-10 06:00:00'),
(121, 121, 21, 9, 9, 'Pet Sitter Noturno', 'Cuidado e conforto noturno', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-08-25 18:00:00', '2024-08-25 19:00:00', 0, 'finalizado', '2024-08-10 21:30:00', '2025-08-10 21:30:00'),
(122, 122, 22, 10, 1, 'Hospedagem Diária', 'Cuidado e atenção especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-01 00:00:00', '2024-09-02 00:00:00', 1, 'finalizado', '2024-08-15 20:00:00', '2025-09-02 20:00:00'),
(123, 123, 23, 11, 8, 'Pet Sitter Visitas Diárias', 'Supervisão e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-05 08:00:00', '2024-09-12 08:00:00', 0, 'finalizado', '2024-08-20 16:00:00', '2025-08-20 16:00:00'),
(124, 124, 24, 12, 2, 'Hospedagem Semanal', 'Pet tem uma dieta específica', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-01 00:00:00', '2024-09-08 00:00:00', 1, 'finalizado', '2024-08-25 15:00:00', '2024-08-25 15:00:00'),
(125, 125, 25, 1, 3, 'Hospedagem Mensal', 'Pet precisa de atenção especial com alergias', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-01 00:00:00', '2024-10-01 00:00:00', 1, 'finalizado', '2024-08-25 15:00:00', '2024-08-25 15:00:00'),
(126, 126, 26, 2, 2, 'Hospedagem Semanal', 'Cuidados e atenção constante', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-10 00:00:00', '2024-09-17 00:00:00', 1, 'finalizado', '2024-08-25 17:15:00', '2025-09-17 17:15:00'),
(127, 127, 27, 3, 1, 'Hospedagem Diária', 'Pet com dieta especial e medicação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-05 00:00:00', '2024-09-06 00:00:00', 1, 'finalizado', '2024-09-01 16:00:00', '2024-09-01 16:00:00'),
(128, 128, 28, 4, 9, 'Pet Sitter Noturno', 'Cuidado à noite com atenção especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-20 18:00:00', '2024-09-20 19:00:00', 0, 'finalizado', '2024-09-01 16:00:00', '2025-09-01 16:00:00'),
(129, 129, 29, 5, 6, 'Creche Mensal', 'Interação e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-15 00:00:00', '2024-09-30 00:00:00', 1, 'finalizado', '2024-09-01 18:00:00', '2025-09-30 18:00:00'),
(130, 130, 30, 6, 1, 'Hospedagem Diária', 'Cuidados diários e recomendações', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-25 00:00:00', '2024-09-26 00:00:00', 1, 'finalizado', '2024-09-05 18:30:00', '2025-09-26 18:30:00'),
(131, 131, 31, 7, 7, 'Pet Sitter Visita Única', 'Pet precisa de companhia por uma hora', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-09-15 14:00:00', '2024-09-15 15:00:00', 0, 'finalizado', '2024-09-10 14:45:00', '2024-09-15 16:00:00'),
(132, 132, 32, 8, 4, 'Creche Anual', 'Atividades e cuidados contínuos', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-01 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-09-20 15:00:00', '2025-09-20 15:00:00'),
(133, 133, 33, 9, 2, 'Hospedagem Semanal', 'Requer monitoramento constante', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-01 00:00:00', '2024-10-08 00:00:00', 1, 'finalizado', '2024-09-20 18:00:00', '2024-10-01 15:00:00'),
(134, 134, 34, 10, 6, 'Creche Mensal', 'Supervisão de socialização e recreação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-01 00:00:00', '2024-10-31 00:00:00', 1, 'cancelado', '2024-09-25 15:00:00', '2024-09-25 15:00:00'),
(135, 135, 35, 11, 8, 'Pet Sitter Visitas Diárias', 'Passeio no parque próximo', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-01 09:00:00', '2024-10-01 10:00:00', 0, 'finalizado', '2024-09-25 16:10:00', '2024-09-25 16:10:00'),
(136, 136, 36, 12, 7, 'Pet Sitter Visita Única', 'Cuidado e supervisão breve', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-05 10:00:00', '2024-10-05 11:00:00', 0, 'finalizado', '2024-09-25 17:00:00', '2025-09-25 17:00:00'),
(137, 137, 37, 1, 2, 'Hospedagem Semanal', 'Cuidado supervisionado contínuo', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-10 00:00:00', '2024-10-17 00:00:00', 1, 'finalizado', '2024-09-25 18:15:00', '2025-10-17 18:15:00'),
(138, 138, 38, 2, 6, 'Creche Mensal', 'Cuidado contínuo e interações', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-15 00:00:00', '2024-10-31 00:00:00', 1, 'finalizado', '2024-10-01 16:30:00', '2025-10-01 16:30:00'),
(139, 139, 39, 3, 9, 'Pet Sitter Noturno', 'Cuidado e alimentação noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-20 18:00:00', '2024-10-20 19:00:00', 0, 'finalizado', '2024-10-01 20:00:00', '2025-10-01 20:00:00'),
(140, 140, 40, 4, 1, 'Hospedagem Diária', 'Cuidados especiais para o pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-11-02 00:00:00', 1, 'finalizado', '2024-10-15 20:00:00', '2024-11-11 09:09:24'),
(141, 141, 6, 6, 3, 'Hospedagem Mensal', 'Atenção a exercícios físicos', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-12-01 00:00:00', 1, 'ativo', '2024-10-15 21:00:00', '2024-10-15 21:00:00'),
(142, 142, 7, 7, 8, 'Pet Sitter Visitas Diárias', 'Supervisão e cuidados diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-05 08:00:00', '2024-11-12 08:00:00', 0, 'ativo', '2024-10-20 16:00:00', '2025-10-20 16:00:00'),
(143, 143, 8, 8, 9, 'Pet Sitter Noturno', 'Pet precisa de companhia durante a noite', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 20:00:00', '2024-11-01 21:00:00', 0, 'cancelado', '2024-10-20 20:30:00', '2024-10-25 15:00:00'),
(144, 144, 9, 9, 2, 'Hospedagem Semanal', 'Cuidados constantes e carinho', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-10 00:00:00', '2024-11-17 00:00:00', 1, 'ativo', '2024-10-25 17:15:00', '2025-11-17 17:15:00'),
(145, 145, 10, 10, 1, 'Hospedagem Diária', 'Precisa de supervisão especial noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-11-02 00:00:00', 1, 'finalizado', '2024-10-28 16:00:00', '2024-11-11 09:09:47'),
(146, 146, 11, 11, 1, 'Hospedagem Diária', 'Teste inicial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-30 00:00:00', '2024-10-31 00:00:00', 1, 'ativo', '2024-10-31 05:45:00', '2024-10-31 05:45:17'),
(147, 147, 12, 12, 1, 'Hospedagem Diária', 'Teste inicial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-30 00:00:00', '2024-10-31 00:00:00', 1, 'ativo', '2024-10-31 05:45:00', '2024-10-31 05:45:46'),
(148, 148, 1, 1, 1, 'Hospedagem Diária', 'Teste inicial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-30 00:00:00', '2024-10-31 00:00:00', 1, 'ativo', '2024-10-31 05:52:00', '2024-10-31 05:52:27'),
(149, 149, 2, 2, 1, 'Hospedagem Diária', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-11-01 00:00:00', 1, 'ativo', '2024-10-31 06:11:00', '2024-10-31 06:11:51'),
(150, 150, 3, 3, 1, 'Hospedagem Diária', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-11-02 00:00:00', 1, 'ativo', '2024-10-31 06:31:00', '2024-10-31 06:31:16'),
(151, 1, 1, 1, 7, 'Pet Sitter Visita Única', 'Teste Pet Sitter', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 07:31:00', '2024-10-31 08:31:00', 0, 'ativo', '2024-10-31 06:32:00', '2024-10-31 06:32:17'),
(152, 2, 2, 2, 8, 'Pet Sitter Visitas Diárias', 'Passeio Diario', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 08:00:00', '2024-11-07 08:00:00', 0, 'ativo', '2024-10-31 06:34:00', '2024-10-31 06:34:36'),
(153, 3, 3, 3, 1, 'Hospedagem Diária', '3 dias', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-11-02 00:00:00', 1, 'ativo', '2024-10-31 06:36:00', '2024-10-31 06:36:16'),
(154, 4, 4, 4, 1, 'Hospedagem Diária', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-11-02 00:00:00', 1, 'ativo', '2024-10-31 06:40:00', '2024-10-31 06:40:11'),
(155, 5, 5, 5, 1, 'Hospedagem Diária', 'Teste email', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-11-02 00:00:00', 1, 'cancelado', '2024-10-31 06:44:00', '2024-10-31 06:52:21'),
(156, 6, 6, 6, 7, 'Pet Sitter Visita Única', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 08:00:00', '2024-10-31 09:00:00', 0, 'ativo', '2024-10-31 06:50:00', '2024-10-31 06:50:48'),
(157, 7, 7, 7, 1, 'Hospedagem Diária', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-11-01 00:00:00', 1, 'ativo', '2024-10-31 06:53:00', '2024-10-31 06:53:25'),
(158, 8, 8, 8, 1, 'Hospedagem Diária', 'Teste hotmail', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-03 00:00:00', '2024-11-06 00:00:00', 1, 'ativo', '2024-10-31 06:56:00', '2024-10-31 06:56:54'),
(159, 9, 9, 9, 1, 'Hospedagem Diária', 'Teste gmail', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-06 00:00:00', '2024-11-08 00:00:00', 1, 'ativo', '2024-10-31 06:57:00', '2024-10-31 06:57:40'),
(160, 10, 10, 10, 2, 'Hospedagem Semanal', 'Medicação diária e dieta controlada', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-05 00:00:00', '2024-11-12 00:00:00', 1, 'ativo', '2024-10-31 15:15:00', '2024-11-12 15:15:00'),
(161, 11, 11, 11, 6, 'Creche Mensal', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-10-31 00:00:00', 1, 'ativo', '2024-11-01 03:32:00', '2024-11-01 03:32:49'),
(162, 12, 12, 12, 6, 'Creche Mensal', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-11-30 00:00:00', 1, 'ativo', '2024-11-01 03:35:00', '2024-11-01 03:35:17'),
(163, 13, 13, 1, 7, 'Pet Sitter Visita Única', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 08:00:00', '2024-11-01 09:00:00', 0, 'ativo', '2024-11-01 03:47:00', '2024-11-01 03:47:13'),
(164, 14, 14, 2, 7, 'Pet Sitter Visita Única', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 13:04:00', '2024-11-01 13:04:00', 0, 'ativo', '2024-11-01 04:05:00', '2024-11-01 04:05:21'),
(165, 15, 15, 3, 7, 'Pet Sitter Visita Única', 'teste email', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 22:09:00', '2024-10-31 23:09:00', 0, 'ativo', '2024-11-01 04:09:00', '2024-11-01 04:09:24');
INSERT INTO `agendamento` (`id_evento`, `pet_id`, `cliente_id`, `veterinario_id`, `servico_id`, `titulo`, `descricao`, `localizacao`, `data_inicio`, `data_fim`, `dia_completo`, `status`, `data_criacao`, `data_atualizacao`) VALUES
(166, 16, 16, 4, 7, 'Pet Sitter Visita Única', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 22:25:00', '2024-10-31 23:25:00', 0, 'ativo', '2024-11-01 07:14:00', '2024-11-01 07:14:01'),
(167, 17, 17, 5, 9, 'Pet Sitter Noturno', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 22:29:00', '2024-10-31 22:44:00', 0, 'ativo', '2024-11-01 07:18:00', '2024-11-01 07:18:03'),
(168, 18, 18, 6, 7, 'Pet Sitter Visita Única', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 22:29:00', '2024-10-31 23:29:00', 0, 'ativo', '2024-11-01 07:30:00', '2024-11-01 07:30:16'),
(169, 19, 19, 7, 2, 'Hospedagem Semanal', 'Apagar input', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-10-31 00:00:00', '2024-11-04 00:00:00', 1, 'ativo', '2024-11-01 07:49:00', '2024-11-02 06:11:14'),
(170, 20, 20, 8, 2, 'Hospedagem Semanal', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-11-02 00:00:00', 1, 'ativo', '2024-11-01 07:51:00', '2024-11-01 07:51:47'),
(171, 21, 21, 9, 7, 'Pet Sitter Visita Única', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 19:00:00', '2024-11-01 22:29:00', 0, 'ativo', '2024-11-01 07:56:00', '2024-11-01 07:56:07'),
(172, 22, 22, 10, 1, 'Hospedagem Diária', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-11-02 00:00:00', 1, 'ativo', '2024-11-01 07:58:00', '2024-11-01 07:58:10'),
(173, 23, 23, 11, 1, 'Hospedagem Diária', 'qual é a mensagem que vai', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-11-02 00:00:00', 1, 'ativo', '2024-11-01 07:58:00', '2024-11-01 07:58:40'),
(174, 24, 24, 12, 1, 'Hospedagem Diária', 'qual é a mensagem que vai', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-01 00:00:00', '2024-11-02 00:00:00', 1, 'ativo', '2024-11-01 07:58:00', '2024-11-01 07:58:41'),
(175, 25, 25, 1, 9, 'Pet Sitter Noturno', 'Cuidado à noite com carinho', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-20 18:00:00', '2024-11-20 19:00:00', 0, 'ativo', '2024-11-01 19:00:00', '2025-11-01 19:00:00'),
(176, 26, 26, 2, 6, 'Creche Mensal', 'Atividades diárias e atenção', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-15 00:00:00', '2024-11-30 00:00:00', 1, 'ativo', '2024-11-01 21:00:00', '2025-11-30 21:00:00'),
(177, 27, 27, 3, 7, 'Pet Sitter Visita Única', 'Visita de rotina e passeio', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-10 15:00:00', '2024-11-10 16:00:00', 0, 'cancelado', '2024-11-05 17:00:00', '2024-11-05 17:00:00'),
(178, 28, 28, 4, 7, 'Pet Sitter Visita Única', 'Visita de rotina com brincadeiras', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-15 10:00:00', '2024-11-15 11:00:00', 0, 'ativo', '2024-11-10 17:45:00', '2024-11-10 17:45:00'),
(179, 29, 29, 5, 1, 'Hospedagem Diária', 'Cuidados diários para seu pet', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-25 00:00:00', '2024-11-26 00:00:00', 1, 'ativo', '2024-11-10 21:30:00', '2025-11-26 21:30:00'),
(180, 30, 30, 6, 8, 'Pet Sitter Visitas Diárias', 'Passeio diário e alimentação', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-20 08:00:00', '2024-11-26 08:00:00', 0, 'ativo', '2024-11-15 16:20:00', '2024-11-26 16:20:00'),
(181, 31, 31, 7, 4, 'Creche Anual', 'Cuidados contínuos e diversão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-01 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-11-20 18:00:00', '2025-11-20 18:00:00'),
(182, 32, 32, 8, 7, 'Pet Sitter Visita Única', 'Cuidado e supervisão rápida', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-05 10:00:00', '2024-12-05 11:00:00', 0, 'ativo', '2024-11-25 20:00:00', '2025-11-25 20:00:00'),
(183, 36, 36, 12, 4, 'Creche Anual', 'Supervisão de comportamento e brincadeiras', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-01 00:00:00', '2024-12-01 00:00:00', 1, 'ativo', '2024-11-25 20:30:00', '2024-11-25 20:30:00'),
(184, 37, 37, 1, 3, 'Hospedagem Mensal', 'Atividades recreativas e dieta controlada', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-01 00:00:00', '2024-01-01 00:00:00', 1, 'cancelado', '2024-11-25 21:10:00', '2024-11-08 21:16:58'),
(185, 38, 38, 2, 2, 'Hospedagem Semanal', 'Cuidados e atenção especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-10 00:00:00', '2024-12-17 00:00:00', 1, 'ativo', '2024-11-25 21:15:00', '2025-12-17 21:15:00'),
(186, 39, 39, 3, 9, 'Pet Sitter Noturno', 'Supervisão noturna e cuidados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-05 18:00:00', '2024-12-05 19:00:00', 0, 'ativo', '2024-11-28 23:45:00', '2024-11-28 23:45:00'),
(187, 40, 40, 4, 6, 'Creche Mensal', 'Interação e cuidados contínuos', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-15 00:00:00', '2024-12-31 00:00:00', 1, 'ativo', '2024-12-01 19:30:00', '2025-12-01 19:30:00'),
(188, 41, 41, 5, 9, 'Pet Sitter Noturno', 'Cuidado e atenção noturna', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-20 18:00:00', '2024-12-20 19:00:00', 0, 'ativo', '2024-12-01 23:00:00', '2025-12-01 23:00:00'),
(189, 42, 42, 6, 2, 'Hospedagem Semanal', 'Dieta especial e exercícios controlados', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-10 00:00:00', '2024-12-17 00:00:00', 1, 'ativo', '2024-12-05 17:20:00', '2024-12-05 17:20:00'),
(190, 43, 43, 7, 8, 'Pet Sitter Visitas Diárias', 'Visitas diárias para alimentação e limpeza', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-20 08:00:00', '2024-12-26 08:00:00', 0, 'cancelado', '2024-12-15 18:00:00', '2024-12-15 18:00:00'),
(191, 44, 44, 8, 1, 'Hospedagem Diária', 'Cuidado e atenção para pets', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-01 00:00:00', '2025-01-02 00:00:00', 1, 'ativo', '2024-12-15 23:00:00', '2026-01-02 23:00:00'),
(192, 45, 45, 9, 8, 'Pet Sitter Visitas Diárias', 'Cuidados diários e supervisão', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-05 08:00:00', '2025-01-12 08:00:00', 0, 'ativo', '2024-12-20 19:00:00', '2025-12-20 19:00:00'),
(193, 46, 46, 10, 9, 'Pet Sitter Noturno', 'Visita noturna e acompanhamento noturno', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-12-25 18:00:00', '2024-12-25 19:00:00', 0, 'finalizado', '2024-12-21 00:00:00', '2024-11-03 18:20:40'),
(194, 47, 47, 11, 2, 'Hospedagem Semanal', 'Cuidados e atenção especial', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-10 00:00:00', '2025-01-17 00:00:00', 1, 'ativo', '2024-12-25 20:15:00', '2026-01-17 20:15:00'),
(195, 48, 48, 12, 1, 'Hospedagem Diária', 'Cuidados especiais e atenção constante', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-01 00:00:00', '2025-01-02 00:00:00', 1, 'ativo', '2024-12-28 20:00:00', '2024-12-28 20:00:00'),
(196, 49, 49, 1, 6, 'Creche Mensal', 'Cuidados e interação com outros pets', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-01 00:00:00', '2025-01-31 00:00:00', 1, 'ativo', '2024-12-28 23:00:00', '2024-12-28 23:00:00'),
(197, 50, 50, 2, 6, 'Creche Mensal', 'Pet precisa de supervisão durante atividades', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-01 00:00:00', '2025-02-01 00:00:00', 1, 'ativo', '2024-12-29 20:30:00', '2024-12-29 20:30:00'),
(198, 51, 51, 3, 2, 'Hospedagem Semanal', 'Controle de dieta e exercícios diários', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-05 00:00:00', '2025-01-12 00:00:00', 1, 'ativo', '2024-12-30 19:30:00', '2025-01-12 19:30:00'),
(199, 52, 52, 4, 3, 'Hospedagem Mensal', 'Cuidado total durante o mês', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2025-01-01 00:00:00', '2025-01-31 00:00:00', 1, 'ativo', '2024-12-30 20:00:00', '2024-12-30 20:00:00'),
(200, 156, 106, 12, 1, 'Hospedagem Diária - PetTeste', 'teste', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-02 00:00:00', '2024-11-03 00:00:00', 1, 'ativo', '2024-11-02 14:54:07', '2024-11-02 14:54:07'),
(206, 156, 106, 12, 7, 'Pet Sitter Visita Única - PetTeste', 'testando novo envio', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-02 13:46:00', '2024-11-02 14:46:00', 0, 'ativo', '2024-11-02 16:46:40', '2024-11-02 16:46:40'),
(207, 156, 106, 12, 7, 'Pet Sitter Visita Única - PetTeste', 'já enviou', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-02 13:46:00', '2024-11-02 14:47:00', 0, 'ativo', '2024-11-02 16:47:32', '2024-11-02 16:47:32'),
(208, 2, 2, 2, 1, 'Hospedagem Diária - Miau', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-16 00:00:00', '2024-11-17 00:00:00', 1, 'ativo', '2024-11-02 16:52:32', '2024-11-02 16:52:32'),
(209, 18, 18, 6, 2, 'Hospedagem Semanal - Roxy', 'agendamento salvom om sucesso', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-09 00:00:00', '2024-11-16 00:00:00', 1, 'ativo', '2024-11-02 16:54:54', '2024-11-02 16:54:54'),
(210, 2, 2, 2, 2, 'Hospedagem Semanal - Miau', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-02 00:00:00', '2024-11-03 00:00:00', 1, 'ativo', '2024-11-02 17:01:38', '2024-11-02 17:01:38'),
(211, 17, 17, 5, 2, '', '', NULL, '2024-11-03 00:00:00', '2024-11-05 00:00:00', 1, 'Agendado', '2024-11-03 17:26:04', '2024-11-03 17:26:04'),
(212, 17, 17, 5, 1, 'Hospedagem Diária - Garfield', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-03 00:00:00', '2024-11-04 00:00:00', 1, 'ativo', '2024-11-03 18:19:41', '2024-11-03 18:19:41'),
(213, 63, 63, 3, 2, 'Hospedagem Semanal - Escolha o pet', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-06 00:00:00', '2024-11-16 00:00:00', 1, 'ativo', '2024-11-04 01:36:07', '2024-11-04 01:36:07'),
(214, 94, 94, 10, 5, 'Creche Semestral - Escolha o pet', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-03 00:00:00', '2024-11-12 00:00:00', 1, 'ativo', '2024-11-04 02:23:59', '2024-11-04 02:23:59'),
(215, 37, 37, 1, 4, 'Creche Anual - Escolha o pet', 'Teste professor', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-11 00:00:00', '2024-11-22 00:00:00', 1, 'ativo', '2024-11-04 23:44:20', '2024-11-04 23:45:35'),
(216, 158, 110, 4, 7, 'Pet Sitter Visita Única - Escolha o pet', 'Medicamento a cada 9 horas.', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-10 12:53:00', '2024-11-11 12:53:00', 0, 'finalizado', '2024-11-10 15:56:35', '2024-11-11 09:15:53'),
(219, 162, 107, 1, 7, 'Pet Sitter Visita Única - Escolha o pet', 'Medicação a cada 8 horas.', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-09 17:20:00', '2024-11-11 17:20:00', 0, 'ativo', '2024-11-10 20:21:11', '2024-11-11 09:13:12'),
(220, 162, 107, 1, 7, 'Pet Sitter Visita Única - Escolha o pet', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-11 05:39:00', '2024-11-11 06:39:00', 0, 'ativo', '2024-11-11 08:39:39', '2024-11-11 08:39:39'),
(221, 66, 66, 6, 7, 'Pet Sitter Visita Única - Escolha o pet', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-11 06:06:00', '2024-11-11 09:06:00', 0, 'ativo', '2024-11-11 09:06:13', '2024-11-11 09:06:13'),
(222, 108, 8, 8, 7, 'Pet Sitter Visita Única - Escolha o pet', '', 'https://www.google.com/maps?ll=-22.862127,-47.09906&z=13&t=m&hl=pt-BR&gl=BR&mapclient=embed&cid=6413274545009271220', '2024-11-10 06:07:00', '2024-11-11 06:07:00', 0, 'ativo', '2024-11-11 09:07:21', '2024-11-11 09:07:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao_aprovadas`
--

CREATE TABLE `avaliacao_aprovadas` (
  `id` int(11) NOT NULL,
  `nome_avaliador` varchar(255) NOT NULL,
  `estrelas` int(11) DEFAULT NULL CHECK (`estrelas` between 1 and 5),
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacao_aprovadas`
--

INSERT INTO `avaliacao_aprovadas` (`id`, `nome_avaliador`, `estrelas`, `descricao`) VALUES
(1, 'Avaliador', 5, 'Ficou TOP!!!'),
(3, 'Teste', 5, 'ok'),
(4, 'Teste2910', 5, 'Funcionando'),
(18, 'EDUARDO DE OLIVEIRA FERREIRA', 5, 'Excelente serviço!'),
(19, 'Jardel Lezier Foresto', 5, 'Fui muito bem atendido');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao_recusadas`
--

CREATE TABLE `avaliacao_recusadas` (
  `id` int(11) NOT NULL,
  `nome_avaliador` varchar(255) NOT NULL,
  `estrelas` int(11) DEFAULT NULL CHECK (`estrelas` between 1 and 5),
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacao_recusadas`
--

INSERT INTO `avaliacao_recusadas` (`id`, `nome_avaliador`, `estrelas`, `descricao`) VALUES
(2, 'Avaliador2', 5, 'Muito bom'),
(3, 'Avaliador3', 3, 'Precisa melhorar '),
(6, 'teste avaliação', 4, 'teste'),
(7, 'teste avaliação', 4, 'teste'),
(8, 'teste avaliação', 4, 'teste'),
(9, 'Oi professor', 5, 'tesye'),
(10, 'teste', 5, 'teste'),
(11, 'teste', 5, 'teste'),
(12, 'teste', 4, 'teste'),
(13, 'teste', 5, 'teste'),
(14, 'teste', 4, 'cdadasd'),
(15, '12321321', 4, '321321321'),
(16, 'teste', 2, '4124'),
(17, 'testes', 5, 'testes'),
(20, 'Jardel Foresto', 5, 'Serviço muito bem efetuado!');

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao_solicitadas`
--

CREATE TABLE `avaliacao_solicitadas` (
  `id` int(11) NOT NULL,
  `nome_avaliador` varchar(255) NOT NULL,
  `estrelas` int(11) DEFAULT NULL CHECK (`estrelas` between 1 and 5),
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpf`, `telefone`, `email`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `estado`) VALUES
(1, 'João da Silva', '418.681.602-62', '(19) 98765-4321', 'joao.silva@email.com.br', 'Rua das Flores', '123111', 'Apt 101', 'Cambuí', '13.024-040', 'Campinas', 'SP'),
(2, 'Maria Oliveira', '619.426.491-85', '(19) 98234-5645', 'maria.oliveira@email.com.br', 'Avenida dos Gatos', '456', 'Bloco A', 'Taquaral', '13.075-000', 'Campinas', 'SP'),
(3, 'Carlos Santos', '967.390.400-60', '(19) 99321-8792', 'carlos.santos@email.com.br', 'Rua do Jardim', '789', '', 'Guanabara', '13.020-432', 'Campinas', 'SP'),
(4, 'Fernanda Lima', '790.141.970-98', '(19) 97987-6589', 'fernan.lima@email.com.br', 'Rua das Palmeiras', '321', 'Apt 501', 'Jardim Proença', '13.034-567', 'Campinas', 'SP'),
(5, 'Roberto Ferreira', '175.193.511-65', '(19) 98123-4576', 'roberto.ferreira@email.com.br', 'Avenida Campinas', '654', 'Conjunto 2', 'Vila Industrial', '13.030-890', 'Campinas', 'SP'),
(6, 'Juliana Costa', '209.828.147-12', '(19) 97765-4359', 'juliana.costa@email.com.br', 'Rua do Sol', '222', 'Apt 302', 'Vila Costa', '13.026-001', 'Campinas', 'SP'),
(7, 'Marcos Vinícius', '120.247.833-68', '(19) 97456-7852', 'marcos.vinícius@email.com.br', 'Avenida da Liberdade', '333', 'Bloco B', 'Jardim Nova Era', '13.020-567', 'Campinas', 'SP'),
(8, 'Luana Pereira', '943.299.941-60', '(19) 97321-8793', 'luana.pereira@email.com.br', 'Rua das Acácias', '444', '', 'Parque Itália', '13.020-123', 'Campinas', 'SP'),
(9, 'Thiago Rodrigues', '120.261.859-64', '(19) 96123-4550', 'thiago.rodrigues@email.com.br', 'Rua da Alegria', '555', 'Apt 204', 'Centro', '13.014-000', 'Campinas', 'SP'),
(10, 'Patrícia Mendes', '465.225.402-40', '(19) 95987-6587', 'patrícia.mendes@email.com.br', 'Avenida dos Pássaros', '666', 'Casa 12', 'Jardim do Lago', '13.026-000', 'Campinas', 'SP'),
(11, 'Eduardo Almeida', '769.639.160-71', '(19) 94987-3212', 'eduardo.almeida@email.com.br', 'Rua das Oliveiras', '777', 'Apt 101', 'Vila Nova', '13.030-100', 'Campinas', 'SP'),
(12, 'Camila Ferreira', '960.218.597-07', '(19) 93876-5466', 'camila.ferreira@email.com.br', 'Avenida das Amoreiras', '888', '', 'Vila Santa Clara', '13.042-200', 'Campinas', 'SP'),
(13, 'Rafael Lima', '021.733.671-02', '(19) 92765-4321', 'rafael.lima@email.com.br', 'Rua do Ipê', '999', 'Casa 4', 'Jardim das Flores', '13.034-400', 'Campinas', 'SP'),
(14, 'Sofia Santos', '405.797.068-18', '(19) 91654-320', 'sofia.santos@email.com.br', 'Rua do Bosque', '101', 'Apt 205', 'Vila Nova Campinas', '13.031-500', 'Campinas', 'SP'),
(15, 'Gabriel Rocha', '293.931.944-83', '(19) 90543-2162', 'gabriel.rocha@email.com.br', 'Avenida dos Trabalhadores', '202', 'Bloco C', 'Parque São Quirino', '13.023-300', 'Campinas', 'SP'),
(16, 'Alice Martins', '722.929.050-35', '(19) 91234-5661', 'alice.martins@email.com.br', 'Rua das Orquídeas', '300', 'Apt 12', 'Bairro das Flores', '13.025-000', 'Campinas', 'SP'),
(17, 'Fernando Campos', '072.156.941-27', '(19) 92345-6718', 'fernando.campos@email.com.br', 'Avenida da Esperança', '400', 'Casa 1', 'Bairro Novo', '13.031-001', 'Campinas', 'SP'),
(18, 'Tatiane Oliveira', '525.590.533-06', '(19) 93456-7853', 'tatiane.oliveira@email.com.br', 'Rua dos Eucaliptos', '500', 'Apt 303', 'Parque das Laranjeiras', '13.032-002', 'Campinas', 'SP'),
(19, 'Felipe Mendes', '943.791.066-91', '(19) 94567-8954', 'felipe.mendes@email.com.br', 'Rua da Esperança', '600', 'Casa 7', 'Vila Nova', '13.034-003', 'Campinas', 'SP'),
(20, 'Laura Ribeiro', '638.681.030-90', '(19) 95678-9095', 'laura.ribeiro@email.com.br', 'Avenida do Sol', '700', '', 'Jardim das Palmeiras', '13.035-004', 'Campinas', 'SP'),
(21, 'Gustavo Torres', '487.108.286-56', '(19) 96789-019', 'gustavo.torres@email.com.br', 'Rua do Lavrador', '800', 'Bloco D', 'Parque Itajaí', '13.036-005', 'Campinas', 'SP'),
(22, 'Bianca Silva', '897.942.752-20', '(19) 97890-1295', 'bianca.silva@email.com.br', 'Avenida da Liberdade', '900', 'Apt 56', 'Vila Universitária', '13.037-006', 'Campinas', 'SP'),
(23, 'Mariana Costa', '663.720.084-08', '(19) 98901-2385', 'mariana.costa@email.com.br', 'Rua da Paz', '1000', '', 'Bairro Alto', '13.038-007', 'Campinas', 'SP'),
(24, 'Leonardo Alves', '063.675.636-01', '(19) 99012-3428', 'leonardo.alves@email.com.br', 'Avenida dos Trabalhadores', '1100', 'Bloco E', 'Centro', '13.039-008', 'Campinas', 'SP'),
(25, 'Renata Gomes', '573.069.345-11', '(19) 99123-4595', 'renata.gomes@email.com.br', 'Rua da Amizade', '1200', '', 'Jardim São José', '13.040-009', 'Campinas', 'SP'),
(26, 'Paulo Henrique', '158.170.694-40', '(19) 99234-562', 'paulo.henrique@email.com.br', 'Rua da Juventude', '1300', 'Apt 202', 'Vila Nova', '13.041-010', 'Campinas', 'SP'),
(27, 'Sérgio Lima', '015.753.212-70', '(19) 99345-6720', 'sergio.lima@email.com.br', 'Avenida da Amizade', '1400', 'Casa 2', 'Bairro dos Pássaros', '13.042-011', 'Campinas', 'SP'),
(28, 'Rafael Gomes', '355.388.134-87', '(19) 99456-7847', 'rafael.gomes@email.com.br', 'Rua do Futuro', '1500', 'Bloco F', 'Vila Harmonia', '13.043-012', 'Campinas', 'SP'),
(29, 'Nathalia Dias', '699.822.144-46', '(19) 99567-8934', 'nathalia.dias@email.com.br', 'Avenida das Flores', '1600', '', 'Jardim Panorama', '13.044-013', 'Campinas', 'SP'),
(30, 'Cláudio Santos', '800.970.053-39', '(19) 99678-9055', 'claudio.santos@email.com.br', 'Rua do Amanhã', '1700', 'Apt 5', 'Parque São Jorge', '13.045-014', 'Campinas', 'SP'),
(31, 'Tatiane Alves', '740.755.606-78', '(19) 99789-0137', 'tatiane.alves@email.com.br', 'Avenida do Comércio', '1800', 'Casa 3', 'Vila Concordia', '13.046-015', 'Campinas', 'SP'),
(32, 'Fábio Martins', '335.615.880-50', '(19) 99890-1227', 'fabio.martins@email.com.br', 'Rua do Progresso', '1900', '', 'Bairro dos Sonhos', '13.047-016', 'Campinas', 'SP'),
(33, 'Viviane Castro', '124.484.668-66', '(19) 99901-2320', 'viviane.castro@email.com.br', 'Avenida das Artes', '2000', 'Apt 8', 'Jardim da Esperança', '13.048-017', 'Campinas', 'SP'),
(34, 'Hugo Nascimento', '279.198.271-08', '(19) 90012-3446', 'hugo.nascimento@email.com.br', 'Rua da Família', '2100', 'Bloco H', 'Bairro Verde', '13.049-018', 'Campinas', 'SP'),
(35, 'Gabriel Almeida', '572.281.522-55', '(19) 90001-2361', 'gabriel.almeida@email.com.br', 'Rua do Progresso', '2500', 'Apt 101', 'Jardim São Jorge', '13.050-019', 'Campinas', 'SP'),
(36, 'Beatriz Ferreira', '062.627.277-79', '(19) 91112-347', 'beatriz.ferreira@email.com.br', 'Avenida das Américas', '2600', '', 'Vila Brasil', '13.051-020', 'Campinas', 'SP'),
(37, 'Ricardo Costa', '470.460.621-02', '(19) 92223-4590', 'ricardo.costa@email.com.br', 'Rua da Liberdade', '2700', 'Casa 4', 'Bairro Santa Rita', '13.052-021', 'Campinas', 'SP'),
(38, 'Juliana Santos', '746.515.578-99', '(19) 93334-5646', 'juliana.santos@email.com.br', 'Avenida do Sol', '2800', '', 'Bairro Novo', '13.053-022', 'Campinas', 'SP'),
(39, 'Lucas Pereira', '213.437.895-67', '(19) 94445-6711', 'lucas.pereira@email.com.br', 'Rua das Flores', '2900', 'Apt 205', 'Parque das Águas', '13.054-023', 'Campinas', 'SP'),
(40, 'Priscila Lima', '518.784.694-95', '(19) 95556-785', 'priscila.lima@email.com.br', 'Rua do Café', '3000', 'Casa 8', 'Jardim das Acácias', '13.055-024', 'Campinas', 'SP'),
(41, 'André Santos', '410.877.095-12', '(19) 96667-8973', 'andre.santos@email.com.br', 'Avenida da Paz', '3100', '', 'Vila Oliveira', '13.056-025', 'Campinas', 'SP'),
(42, 'Fernanda Rocha', '961.734.641-95', '(19) 97778-9034', 'fernan.rocha@email.com.br', 'Rua dos Corações', '3200', 'Bloco A', 'Bairro do Trabalho', '13.057-026', 'Campinas', 'SP'),
(43, 'Matheus Dias', '984.478.925-73', '(19) 98889-0185', 'matheus.dias@email.com.br', 'Avenida dos Sonhos', '3300', '', 'Vila Progresso', '13.058-027', 'Campinas', 'SP'),
(44, 'Carolina Souza', '408.549.010-94', '(19) 99990-1234', 'carolina.souza@email.com.br', 'Rua do Amanhã', '3400', 'Apt 3', 'Bairro das Conquistas', '13.059-028', 'Campinas', 'SP'),
(45, 'Rafael Andrade', '317.864.845-36', '(19) 90001-2348', 'rafael.andrade@email.com.br', 'Avenida das Palmeiras', '3500', '', 'Jardim das Flores', '13.060-029', 'Campinas', 'SP'),
(46, 'Mariana Alves', '209.340.777-97', '(19) 91112-349', 'mariana.alves@email.com.br', 'Rua da Esperança', '3600', 'Bloco C', 'Bairro de Natal', '13.061-030', 'Campinas', 'SP'),
(47, 'Victor Hugo', '196.028.062-73', '(19) 92223-4595', 'victor.hugo@email.com.br', 'Avenida do Futuro', '3700', 'Casa 5', 'Vila Universitária', '13.062-031', 'Campinas', 'SP'),
(48, 'Tatiane Ribeiro', '568.253.207-42', '(19) 93334-5618', 'tatiane.ribeiro@email.com.br', 'Rua dos Sonhos', '3800', '', 'Bairro dos Animais', '13.063-032', 'Campinas', 'SP'),
(49, 'Eliana Lima', '560.628.008-63', '(19) 94445-6729', 'eliana.lima@email.com.br', 'Avenida das Mangueiras', '3900', 'Apt 101', 'Vila Nova', '13.064-033', 'Campinas', 'SP'),
(50, 'Guilherme Martins', '501.486.378-76', '(19) 95556-7885', 'guilherme.martins@email.com.br', 'Rua do Lazer', '4000', 'Casa 2', 'Jardim Encantado', '13.065-034', 'Campinas', 'SP'),
(51, 'Isabela Costa', '276.286.576-05', '(19) 90111-336', 'isabela.costa@email.com.br', 'Rua das Samambaias', '3100', '', 'Vila Célia', '13.066-055', 'Campinas', 'SP'),
(52, 'João Pedro Lima', '627.966.669-72', '(19) 91333-5557', 'joao.lima@email.com', 'Avenida das Flores', '3300', 'Casa 1', 'Bairro da Esperança', '13.067-056', 'Campinas', 'SP'),
(53, 'Luísa Martins', '444.203.652-77', '(19) 93555-3392', 'luisa.martins@email.com', 'Rua das Palmeiras', '3500', '', 'Jardim Alvorada', '13.069-057', 'Campinas', 'SP'),
(54, 'Marcos Vinícius', '694.543.672-18', '(19) 95333-5595', 'marcos.vinicius@email.com', 'Avenida do Comércio', '3300', 'Apt 103', 'Bairro Novo Horizonte', '13.069-059', 'Campinas', 'SP'),
(55, 'Bianca Ferreira', '868.038.422-40', '(19) 93555-6669', 'bianca.ferreira@email.com', 'Rua do Trabalho', '3500', '', 'Vila da Paz', '13.070-059', 'Campinas', 'SP'),
(56, 'César Augusto', '286.959.734-76', '(19) 95666-7718', 'cesar.augusto@email.com', 'Rua do Esporte', '3600', 'Bloco B', 'Bairro dos Amigos', '13.071-030', 'Campinas', 'SP'),
(57, 'Eduarda Alves', '008.610.918-92', '(19) 96777-998', 'eduarda.alves@email.com', 'Avenida da Saúde', '3700', '', 'Jardim dos Sonhos', '13.073-031', 'Campinas', 'SP'),
(58, 'Gabriel Santos', '507.177.532-80', '(19) 97999-9911', 'gabriel.santos@email.com', 'Rua do Bem', '3900', 'Casa 5', 'Bairro da Vitória', '13.075-033', 'Campinas', 'SP'),
(59, 'Larissa Oliveira', '108.567.217-43', '(19) 99999-0039', 'larissa.oliveira@email.com', 'Avenida da Amizade', '3900', '', 'Vila Nova', '13.073-035', 'Campinas', 'SP'),
(60, 'Otávio Martins', '885.319.902-46', '(19) 90011-3385', 'otavio.martins@email.com', 'Rua do Futuro', '5000', 'Apt 303', 'Bairro dos Músicos', '13.075-033', 'Campinas', 'SP'),
(61, 'Rafael Lima', '021.343.757-01', '(19) 91133-5542', 'rafael.lima@email.com', 'Avenida do Sol', '5100', '', 'Vila Verde', '13.076-035', 'Campinas', 'SP'),
(62, 'Sofia Almeida', '689.048.231-02', '(19) 93355-3354', 'sofia.almeida@email.com', 'Rua das Cerejeiras', '5300', '', 'Jardim das Oliveiras', '13.077-036', 'Campinas', 'SP'),
(63, 'Thiago Ramos', '806.653.849-98', '(19) 95533-558', 'thiago.ramos@email.com', 'Avenida da Liberdade', '5500', 'Casa 6', 'Bairro São João', '13.079-037', 'Campinas', 'SP'),
(64, 'Vanessa Soares', '614.496.210-74', '(19) 93355-6683', 'vanessa.soares@email.com', 'Rua do Campo', '5300', '', 'Vila Tropical', '13.079-039', 'Campinas', 'SP'),
(65, 'William Oliveira', '961.247.800-70', '(19) 95566-7741', 'william.oliveira@email.com', 'Avenida da Esperança', '5500', 'Apt 107', 'Bairro dos Nossos', '13.090-039', 'Campinas', 'SP'),
(66, 'Ana Clara Martins', '119.003.953-20', '(19) 96677-9964', 'anaclara.martins@email.com', 'Rua da Alegria', '5600', '', 'Jardim da Luz', '13.091-050', 'Campinas', 'SP'),
(67, 'Felipe Andrade', '107.614.104-81', '(19) 97799-9934', 'felipe.andrade@email.com', 'Avenida do Lazer', '5700', 'Casa 5', 'Bairro das Rosas', '13.093-051', 'Campinas', 'SP'),
(68, 'Jéssica Pires', '744.044.198-21', '(19) 99999-0038', 'jessica.pires@email.com', 'Rua dos Girassóis', '5900', '', 'Vila Branca', '13.095-053', 'Campinas', 'SP'),
(69, 'Nicolas Costa', '387.894.129-31', '(19) 90011-3383', 'nicolas.costa@email.com', 'Avenida das Árvores', '5900', 'Bloco D', 'Bairro da Esperança', '13.093-055', 'Campinas', 'SP'),
(70, 'Patrícia Ferreira', '364.606.090-55', '(19) 91133-5516', 'patricia.ferreira@email.com', 'Rua do Amanhã', '6000', '', 'Bairro das Águas', '13.095-053', 'Campinas', 'SP'),
(71, 'Renato Silva', '648.147.003-00', '(19) 93355-3335', 'renato.silva@email.com', 'Avenida da Vitória', '6100', '', 'Jardim do Sol', '13.096-055', 'Campinas', 'SP'),
(72, 'Aline Moreira', '314.362.399-31', '(19) 95533-5597', 'aline.moreira@email.com', 'Rua da Paz', '6300', 'Casa 9', 'Bairro do Amanhã', '13.097-056', 'Campinas', 'SP'),
(73, 'Eduardo Ferreira', '017.065.888-01', '(19) 93355-6694', 'eduardo.ferreira@email.com', 'Avenida da Justiça', '6500', '', 'Vila Riqueza', '13.099-057', 'Campinas', 'SP'),
(74, 'Carla Mendes', '917.496.721-54', '(19) 95566-7729', 'carla.mendes@email.com', 'Rua das Flores', '6300', '', 'Bairro do Conhecimento', '13.099-059', 'Campinas', 'SP'),
(75, 'Fernando Gonçalves', '021.688.490-05', '(19) 96677-9962', 'fernando.goncalves@email.com', 'Avenida do Trabalho', '6500', 'Apt 110', 'Jardim das Conquistas', '13.090-059', 'Campinas', 'SP'),
(76, 'Tamara Lima', '135.513.339-47', '(19) 97799-9981', 'tamara.lima@email.com', 'Rua da União', '6600', '', 'Bairro do Futuro', '13.091-060', 'Campinas', 'SP'),
(77, 'Leonardo Sousa', '294.016.572-62', '(19) 99999-0057', 'leonardo.sousa@email.com', 'Avenida do Ser', '6700', 'Casa 9', 'Vila da Esperança', '13.093-061', 'Campinas', 'SP'),
(78, 'Karla Mendes', '603.791.200-97', '(19) 90011-3320', 'karla.mendes@email.com', 'Rua das Fadas', '6900', '', 'Bairro Verde', '13.095-063', 'Campinas', 'SP'),
(79, 'Marcelo Almeida', '712.110.779-18', '(19) 91133-5540', 'marcelo.almeida@email.com', 'Avenida do Mundo', '6900', 'Bloco A', 'Bairro das Águas', '13.093-065', 'Campinas', 'SP'),
(80, 'Felipe Araújo', '194.934.687-04', '(19) 91114-2244', 'felipe.araujo@email.com', 'Rua das Acácias', '303', '', 'Centro', '13.020-020', 'Campinas', 'SP'),
(81, 'Tatiane Santos', '793.723.325-77', '(19) 92225-3393', 'tatiane.santos@email.com', 'Avenida da Esperança', '404', 'Apt 7', 'Jardim Novo', '13.021-021', 'Campinas', 'SP'),
(82, 'Rodrigo Lima', '797.603.803-66', '(19) 93336-4413', 'rodrigo.lima@email.com', 'Rua do Sol', '505', '', 'Vila Nova', '13.022-022', 'Campinas', 'SP'),
(83, 'Amanda Ribeiro', '137.456.965-81', '(19) 94447-5539', 'amanda.ribeiro@email.com', 'Avenida do Trânsito', '606', 'Casa 3', 'Jardim das Palmeiras', '13.023-023', 'Campinas', 'SP'),
(84, 'Diego Souza', '981.154.998-20', '(19) 95558-6643', 'diego.souza@email.com', 'Rua da Alegria', '707', '', 'Vila dos Sonhos', '13.024-024', 'Campinas', 'SP'),
(85, 'Patrícia Almeida', '232.711.242-72', '(19) 96669-7726', 'patricia.almeida@email.com', 'Rua das Flores', '808', 'Apt 4', 'Bairro dos Sonhos', '13.025-025', 'Campinas', 'SP'),
(86, 'Luana Ferreira', '037.467.465-58', '(19) 97770-8831', 'luana.ferreira@email.com', 'Avenida da Paz', '909', '', 'Centro', '13.026-026', 'Campinas', 'SP'),
(87, 'Gustavo Costa', '572.070.950-90', '(19) 98881-992', 'gustavo.costa@email.com', 'Rua das Palmeiras', '1010', 'Apt 2', 'Jardim das Oliveiras', '13.027-027', 'Campinas', 'SP'),
(88, 'Bruna Oliveira', '253.590.606-62', '(19) 90000-0071', 'bruna.oliveira@email.com', 'Avenida das Águas', '1111', '', 'Vila Verde', '13.028-028', 'Campinas', 'SP'),
(89, 'Leandro Gomes', '719.600.920-73', '(19) 91115-2249', 'leandro.gomes@email.com', 'Rua do Rio', '1212', '', 'Centro', '13.029-029', 'Campinas', 'SP'),
(90, 'Mariana Santos', '993.551.163-49', '(19) 92226-3364', 'mariana.santos@email.com', 'Avenida da Liberdade', '1313', '', 'Jardim das Estrelas', '13.030-030', 'Campinas', 'SP'),
(91, 'Samuel Lima', '575.157.781-72', '(19) 93337-4413', 'samuel.lima@email.com', 'Rua das Flores', '1414', 'Casa 1', 'Vila dos Anjos', '13.031-031', 'Campinas', 'SP'),
(92, 'Flávia Ribeiro', '379.999.176-05', '(19) 94448-5553', 'flavia.ribeiro@email.com', 'Avenida do Sol', '1515', '', 'Centro', '13.032-032', 'Campinas', 'SP'),
(93, 'Vinícius Costa', '705.834.498-16', '(19) 95559-6676', 'vinicius.costa@email.com', 'Rua da Paz', '1616', '', 'Bairro Esperança', '13.033-033', 'Campinas', 'SP'),
(94, 'Ana Paula', '953.567.811-64', '(19) 96660-7790', 'anapaula@email.com', 'Avenida da Liberdade', '1717', 'Apt 5', 'Vila Verde', '13.034-034', 'Campinas', 'SP'),
(95, 'Renan Ferreira', '614.549.818-81', '(19) 97771-8849', 'renan.ferreira@email.com', 'Rua dos Lírios', '1818', '', 'Bairro Novo', '13.035-035', 'Campinas', 'SP'),
(96, 'Natália Gomes', '490.181.070-77', '(19) 98882-9932', 'natalia.gomes@email.com', 'Avenida do Comércio', '1919', '', 'Jardim das Flores', '13.036-036', 'Campinas', 'SP'),
(97, 'Edson Lima', '244.784.666-53', '(19) 90000-0125', 'edson.lima@email.com', 'Rua das Acácias', '2020', '', 'Centro', '13.037-037', 'Campinas', 'SP'),
(98, 'Giovana Souza', '388.233.258-11', '(19) 91116-227', 'giovana.souza@email.com', 'Avenida da Esperança', '2121', '', 'Jardim dos Anjos', '13.038-038', 'Campinas', 'SP'),
(99, 'Maurício Ribeiro', '561.182.969-44', '(19) 92227-332', 'mauricio.ribeiro@email.com', 'Rua do Comércio', '2222', 'Apt 3', 'Centro', '13.039-039', 'Campinas', 'SP'),
(100, 'Tatiane Martins', '820.172.035-05', '(19) 93338-4452', 'tatiane.martins@email.com', 'Avenida das Flores', '2323', '', 'Bairro Esperança', '13.040-040', 'Campinas', 'SP'),
(107, 'Gabriel Silveira Morgan', '490.859.348-50', '(19) 99110-3056', 'gabriel@morgan.com', 'Avenida Palestina, 7 ', '7', 'Bloco T Apto 1', 'Jardim Flamboyant', '13.091-150', 'Campinas', 'Sã');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lead`
--

CREATE TABLE `lead` (
  `id` int(11) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `data_lead` datetime DEFAULT current_timestamp(),
  `nome` varchar(255) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contato_prefere` enum('email','telefone','whatsapp') NOT NULL,
  `horario_prefere` enum('manha','tarde') NOT NULL,
  `receber_novidades` tinyint(1) DEFAULT 0,
  `consentimento_dados` tinyint(1) DEFAULT 0,
  `data_consentimento` datetime NOT NULL,
  `politica_privacidade` varchar(255) NOT NULL,
  `lead_contatado` enum('Sim','Não') DEFAULT 'Não'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `lead`
--

INSERT INTO `lead` (`id`, `servico`, `data_lead`, `nome`, `telefone`, `email`, `contato_prefere`, `horario_prefere`, `receber_novidades`, `consentimento_dados`, `data_consentimento`, `politica_privacidade`, `lead_contatado`) VALUES
(14, 'Hospedagem', '2024-11-05 14:55:55', 'Gabriel Silveira Morgan', '(19) 99110-3056', 'gabriel@morgan.com', 'whatsapp', 'manha', 1, 1, '2024-11-05 14:55:55', 'Sim', 'Sim'),
(17, 'Hospedagem', '2024-11-06 21:24:06', 'Pedro Henrique Ferreira', '(19) 99172-1443', 'phf@gmail.com', 'email', 'manha', 1, 1, '2024-11-06 21:24:06', 'Sim', 'Sim'),
(18, 'Hospedagem', '2024-11-06 21:24:21', 'Pedro Henrique Ferreira', '(19) 99172-1443', 'phf@gmail.com', 'email', 'manha', 1, 1, '2024-11-06 21:24:21', 'Sim', 'Não'),
(20, 'PetSitter', '2024-11-10 15:12:36', 'Jardel Foresto', '(19) 99122-9845', 'jardel.foresto@fatec.sp.gov.br', 'whatsapp', 'tarde', 1, 1, '2024-11-10 15:12:36', 'Sim', 'Não');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pet`
--

CREATE TABLE `pet` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `veterinario_id` int(11) NOT NULL,
  `foto_pet` varchar(255) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `especie` varchar(30) NOT NULL,
  `raca` varchar(50) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `porte` varchar(20) DEFAULT NULL,
  `rga` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pet`
--

INSERT INTO `pet` (`id`, `cliente_id`, `veterinario_id`, `foto_pet`, `nome`, `sexo`, `especie`, `raca`, `cor`, `idade`, `porte`, `rga`) VALUES
(1, 1, 1, 'pet_ (1).jpg', 'Bobby', 'M', 'Cão', 'Labrador', 'Amarelo', 3, 'Médio', '1.493.675'),
(2, 2, 2, 'pet_ (2).jpg', 'Miau', 'F', 'Gato', 'Siamês', 'Cinza', 2, 'Pequeno', '1.216.228'),
(3, 3, 3, 'pet_ (3).jpg', 'Rex', 'M', 'Cão', 'Pastor Alemão', 'Preto', 5, 'Grande', '2.397.445'),
(4, 4, 4, 'pet_ (4).jpg', 'Shiva', 'F', 'Cão', 'Golden Retriever', 'Dourado', 4, 'Médio', '2.818.657'),
(5, 5, 5, 'pet_ (5).jpg', 'Menina', 'F', 'Gato', 'Persa', 'Branco', 1, 'Pequeno', '1.982.805'),
(6, 6, 6, 'pet_ (6).jpg', 'Spike', 'M', 'Cão', 'Bulldog', 'Marrom', 3, 'Médio', '2.412.960'),
(7, 7, 7, 'pet_ (7).jpg', 'Zezinho', 'M', 'Gato', 'Vira-lata', 'Tigrado', 6, 'Médio', '2.375.371'),
(8, 8, 8, 'pet_ (8).jpg', 'Nina', 'F', 'Cão', 'Chihuahua', 'Caramelo', 2, 'Pequeno', '2.789.783'),
(9, 9, 9, 'pet_ (9).jpg', 'Simba', 'M', 'Gato', 'Maine Coon', 'Cinza', 3, 'Médio', '1.253.607'),
(10, 10, 10, 'pet_ (10).jpg', 'Toby', 'M', 'Cão', 'Beagle', 'Marrom e Branco', 4, 'Médio', '1.272.622'),
(11, 11, 11, 'pet_ (11).jpg', 'Kitty', 'F', 'Gato', 'Ragdoll', 'Cinza e Branco', 2, 'Pequeno', '2.173.887'),
(12, 12, 12, 'pet_ (12).jpg', 'Ozzy', 'M', 'Cão', 'Pit Bull', 'Preto', 5, 'Grande', '1.865.463'),
(13, 13, 1, 'pet_ (13).jpg', 'Bella', 'F', 'Cão', 'Poodle', 'Branco', 2, 'Pequeno', '2.575.735'),
(14, 14, 2, 'pet_ (14).jpg', 'Jasper', 'M', 'Gato', 'Siamês', 'Creme', 3, 'Pequeno', '2.724.354'),
(15, 15, 3, 'pet_ (15).jpg', 'Rufus', 'M', 'Cão', 'Cocker Spaniel', 'Dourado', 4, 'Médio', '2.860.896'),
(16, 16, 4, 'pet_ (16).jpg', 'Pipoca', 'F', 'Cão', 'Dachshund', 'Chocolate', 1, 'Pequeno', '2.475.831'),
(17, 17, 5, 'pet_ (17).jpg', 'Garfield', 'M', 'Gato', 'Persa', 'Laranja', 5, 'Grande', '2.585.732'),
(18, 18, 6, 'pet_ (18).jpg', 'Roxy', 'F', 'Cão', 'Basset Hound', 'Bege', 4, 'Médio', '1.881.250'),
(19, 19, 7, 'pet_ (19).jpg', 'Whiskers', 'M', 'Gato', 'Vira-lata', 'Preto e Branco', 2, 'Pequeno', '1.131.959'),
(20, 20, 8, 'pet_ (20).jpg', 'Gigi', 'F', 'Cão', 'Maltês', 'Branco', 3, 'Pequeno', '2.702.360'),
(21, 21, 9, 'pet_ (21).jpg', 'Shadow', 'Macho', 'Canina', 'British Shorthair', 'Cinza', 14, 'Pequeno', '1.844.189'),
(22, 22, 10, 'pet_ (22).jpg', 'Bianca', 'F', 'Cão', 'Pug', 'Bege', 5, 'Pequeno', '2.370.988'),
(23, 23, 11, 'pet_ (23).jpg', 'Paco', 'M', 'Gato', 'Siamês', 'Preto', 3, 'Pequeno', '1.988.937'),
(24, 24, 12, 'pet_ (24).jpg', 'Fido', 'M', 'Cão', 'Border Collie', 'Branco e Preto', 2, 'Médio', '2.743.470'),
(25, 25, 1, 'pet_ (25).jpg', 'Tina', 'F', 'Gato', 'Maine Coon', 'Cinza', 1, 'Pequeno', '2.186.743'),
(26, 26, 2, 'pet_ (26).jpg', 'Buddy', 'M', 'Cão', 'Golden Retriever', 'Dourado', 6, 'Grande', '2.515.236'),
(27, 27, 3, 'pet_ (27).jpg', 'Sasha', 'F', 'Cão', 'Yorkshire Terrier', 'Preto e Dourado', 4, 'Pequeno', '1.156.789'),
(28, 28, 4, 'pet_ (28).jpg', 'Félix', 'M', 'Gato', 'Siamês', 'Branco', 3, 'Médio', '2.968.201'),
(29, 29, 5, 'pet_ (29).jpg', 'Lola', 'F', 'Cão', 'Shih Tzu', 'Caramelo', 2, 'Pequeno', '1.750.685'),
(30, 30, 6, 'pet_ (30).jpg', 'Neko', 'M', 'Gato', 'Vira-lata', 'Cinza e Branco', 5, 'Médio', '1.861.119'),
(31, 31, 7, 'pet_ (31).jpg', 'Charlie', 'M', 'Cão', 'Beagle', 'Marrom', 4, 'Médio', '1.417.618'),
(32, 32, 8, 'pet_ (32).jpg', 'Penny', 'F', 'Gato', 'Persa', 'Branco', 1, 'Pequeno', '1.403.752'),
(33, 33, 9, 'pet_ (33).jpg', 'Rusty', 'M', 'Cão', 'Pit Bull', 'Preto e Branco', 5, 'Grande', '2.831.754'),
(34, 34, 10, 'pet_ (34).jpg', 'Supla', 'M', 'Gato', 'British Shorthair', 'Cinza', 2, 'Pequeno', '1.267.654'),
(35, 35, 11, 'pet_ (35).jpg', 'Daisy', 'F', 'Cão', 'Poodle', 'Branco', 3, 'Pequeno', '2.954.479'),
(36, 36, 12, 'pet_ (36).jpg', 'Zorro', 'M', 'Gato', 'Siamês', 'Preto', 4, 'Médio', '1.432.406'),
(37, 37, 1, 'pet_ (37).jpg', 'Chico', 'M', 'Cão', 'Cocker Spaniel', 'Marrom', 2, 'Médio', '2.528.371'),
(38, 38, 2, 'pet_ (38).jpg', 'Dolly', 'F', 'Gato', 'Vira-lata', 'Cinza', 1, 'Pequeno', '2.461.312'),
(39, 39, 3, 'pet_ (39).jpg', 'Juno', 'F', 'Cão', 'Labrador', 'Amarelo', 4, 'Grande', '1.660.766'),
(40, 40, 4, 'pet_ (40).jpg', 'Oscar', 'M', 'Gato', 'Siamês', 'Branco', 3, 'Pequeno', '1.727.200'),
(41, 41, 5, 'pet_ (41).jpg', 'Peanut', 'F', 'Cão', 'Chihuahua', 'Caramelo', 2, 'Pequeno', '1.412.447'),
(42, 42, 6, 'pet_ (42).jpg', 'Smokey', 'M', 'Gato', 'Persa', 'Cinza', 1, 'Pequeno', '2.898.329'),
(43, 43, 7, 'pet_ (43).jpg', 'Rocky', 'M', 'Cão', 'Rottweiler', 'Preto e Marrom', 5, 'Grande', '2.410.655'),
(44, 44, 8, 'pet_ (44).jpg', 'Magali', 'F', 'Gato', 'Vira-lata', 'Tigrado', 3, 'Médio', '2.391.469'),
(45, 45, 9, 'pet_ (45).jpg', 'Harley', 'M', 'Cão', 'Beagle', 'Marrom e Branco', 2, 'Médio', '2.749.937'),
(46, 46, 10, 'pet_ (46).jpg', 'Tiffany', 'F', 'Gato', 'British Shorthair', 'Preto', 4, 'Médio', '2.312.219'),
(47, 47, 11, 'pet_ (47).jpg', 'Lucky', 'M', 'Cão', 'Dachshund', 'Chocolate', 5, 'Pequeno', '1.205.426'),
(48, 48, 12, 'pet_ (48).jpg', 'Angel', 'F', 'Gato', 'Persa', 'Branco', 1, 'Pequeno', '2.679.654'),
(49, 49, 1, 'pet_ (49).jpg', 'Piper', 'F', 'Cão', 'Schnauzer', 'Cinza', 2, 'Pequeno', '1.606.130'),
(50, 50, 2, 'pet_ (50).jpg', 'Benji', 'M', 'Gato', 'Vira-lata', 'Preto e Branco', 3, 'Médio', '2.908.768'),
(51, 51, 3, 'pet_ (51).jpg', 'Goku', 'M', 'Cão', 'Golden Retriever', 'Dourado', 4, 'Grande', '2.175.389'),
(52, 52, 4, 'pet_ (52).jpg', 'Luna', 'F', 'Gato', 'Siamês', 'Cinza', 1, 'Pequeno', '2.441.220'),
(53, 53, 5, 'pet_ (53).jpg', 'Neo', 'M', 'Cão', 'Beagle', 'Marrom', 2, 'Médio', '2.447.226'),
(54, 54, 6, 'pet_ (54).jpg', 'Aladdin', 'M', 'Gato', 'Persa', 'Branco', 3, 'Pequeno', '1.321.480'),
(55, 55, 7, 'pet_ (55).jpg', 'Madona', 'F', 'Cão', 'Cocker Spaniel', 'Marrom', 4, 'Médio', '1.542.966'),
(56, 56, 8, 'pet_ (56).jpg', 'Patches', 'M', 'Gato', 'Siamês', 'Preto', 2, 'Pequeno', '1.951.888'),
(57, 57, 9, 'pet_ (57).jpg', 'Ruby', 'F', 'Cão', 'Chihuahua', 'Dourado', 1, 'Pequeno', '1.568.195'),
(58, 58, 10, 'pet_ (58).jpg', 'Bruno', 'M', 'Gato', 'British Shorthair', 'Cinza', 4, 'Médio', '2.806.613'),
(59, 59, 11, 'pet_ (59).jpg', 'Dalila', 'F', 'Cão', 'Labrador', 'Amarelo', 3, 'Grande', '1.487.915'),
(60, 60, 12, 'pet_ (60).jpg', 'Oliver', 'M', 'Gato', 'Vira-lata', 'Preto', 2, 'Pequeno', '1.157.188'),
(61, 61, 1, 'pet_ (61).jpg', 'Lia', 'F', 'Cão', 'Beagle', 'Branco', 5, 'Médio', '2.361.863'),
(62, 62, 2, 'pet_ (62).jpg', 'Maggie', 'F', 'Gato', 'Persa', 'Laranja', 3, 'Pequeno', '1.341.945'),
(63, 63, 3, 'pet_ (63).jpg', 'Jack', 'M', 'Cão', 'Dachshund', 'Marrom', 2, 'Pequeno', '1.129.347'),
(64, 64, 4, 'pet_ (64).jpg', 'Misty', 'F', 'Gato', 'Siamês', 'Cinza', 1, 'Pequeno', '1.806.215'),
(65, 65, 5, 'pet_ (65).jpg', 'Max', 'M', 'Cão', 'Golden Retriever', 'Dourado', 4, 'Grande', '2.320.864'),
(66, 66, 6, 'pet_ (66).jpg', 'Amy', 'F', 'Gato', 'Siamês', 'Branco', 3, 'Pequeno', '2.228.607'),
(67, 67, 7, 'pet_ (67).jpg', 'Pituquinho', 'M', 'Cão', 'Pit Bull', 'Preto e Branco', 5, 'Grande', '2.400.642'),
(68, 68, 8, 'pet_ (68).jpg', 'Fiona', 'F', 'Gato', 'Vira-lata', 'Tigrado', 2, 'Pequeno', '2.494.114'),
(69, 69, 9, 'pet_ (69).jpg', 'Tadeu', 'M', 'Cão', 'Beagle', 'Marrom e Branco', 4, 'Médio', '1.339.800'),
(70, 70, 10, 'pet_ (70).jpg', 'Fluffy', 'F', 'Gato', 'Persa', 'Branco', 1, 'Pequeno', '2.968.828'),
(71, 71, 11, 'pet_ (71).jpg', 'Nene', 'M', 'Cão', 'Bulldog', 'Preto', 3, 'Médio', '2.114.512'),
(72, 72, 12, 'pet_ (72).jpg', 'Snoopy', 'M', 'Gato', 'British Shorthair', 'Cinza', 2, 'Pequeno', '1.942.888'),
(73, 73, 1, 'pet_ (73).jpg', 'Pietro', 'M', 'Cão', 'Cocker Spaniel', 'Dourado', 4, 'Médio', '1.297.293'),
(74, 74, 2, 'pet_ (74).jpg', 'Filomena', 'M', 'Gato', 'Siamês', 'Branco', 3, 'Pequeno', '2.147.860'),
(75, 75, 3, 'pet_ (75).jpg', 'Zoe', 'F', 'Cão', 'Dachshund', 'Marrom', 2, 'Pequeno', '2.660.925'),
(76, 76, 4, 'pet_ (76).jpg', 'Toni', 'M', 'Gato', 'Persa', 'Cinza', 1, 'Pequeno', '1.945.539'),
(77, 77, 5, 'pet_ (77).jpg', 'Bailey', 'F', 'Cão', 'Labrador', 'Preto', 4, 'Grande', '2.486.167'),
(78, 78, 6, 'pet_ (78).jpg', 'Mochi', 'M', 'Gato', 'Vira-lata', 'Tigrado', 3, 'Pequeno', '1.695.613'),
(79, 79, 7, 'pet_ (79).jpg', 'Tequila', 'F', 'Cão', 'Chihuahua', 'Dourado', 2, 'Pequeno', '2.362.552'),
(80, 80, 8, 'pet_ (80).jpg', 'Larry', 'M', 'Gato', 'British Shorthair', 'Cinza', 1, 'Pequeno', '1.776.323'),
(81, 81, 9, 'pet_ (81).jpg', 'Winnie', 'F', 'Cão', 'Beagle', 'Marrom e Branco', 3, 'Médio', '1.768.873'),
(82, 82, 10, 'pet_ (82).jpg', 'Pip', 'M', 'Gato', 'Siamês', 'Branco', 2, 'Pequeno', '1.617.386'),
(83, 83, 11, 'pet_ (83).jpg', 'Ayla', 'F', 'Cão', 'Golden Retriever', 'Dourado', 4, 'Grande', '1.983.308'),
(84, 84, 12, 'pet_ (84).jpg', 'Yakult', 'M', 'Gato', 'Persa', 'Preto e Branco', 5, 'Grande', '1.210.458'),
(85, 85, 1, 'pet_ (85).jpg', 'Rita', 'F', 'Cão', 'Bulldog', 'Branco', 3, 'Médio', '2.486.521'),
(86, 86, 2, 'pet_ (86).jpg', 'Fedo', 'M', 'Gato', 'Vira-lata', 'Preto', 1, 'Pequeno', '1.356.280'),
(87, 87, 3, 'pet_ (87).jpg', 'Milo', 'M', 'Cão', 'Dachshund', 'Marrom', 2, 'Pequeno', '1.535.877'),
(88, 88, 4, 'pet_ (88).jpg', 'Jolie', 'F', 'Gato', 'Persa', 'Cinza', 4, 'Médio', '1.235.701'),
(89, 89, 5, 'pet_ (89).jpg', 'Dunga', 'M', 'Cão', 'Beagle', 'Preto', 3, 'Médio', '2.671.798'),
(90, 90, 6, 'pet_ (90).jpg', 'Ralph', 'M', 'Gato', 'Siamês', 'Branco', 5, 'Pequeno', '1.614.560'),
(91, 91, 7, 'pet_ (91).jpg', 'Malu', 'F', 'Cão', 'Golden Retriever', 'Dourado', 1, 'Pequeno', '2.827.479'),
(92, 92, 8, 'pet_ (92).jpg', 'Sophie', 'F', 'Gato', 'Vira-lata', 'Tigrado', 2, 'Pequeno', '2.955.256'),
(93, 93, 9, 'pet_ (93).jpg', 'Beiçola', 'M', 'Cão', 'Labrador', 'Amarelo', 3, 'Grande', '1.144.981'),
(94, 94, 10, 'pet_ (94).jpg', 'Lilica', 'F', 'Gato', 'British Shorthair', 'Cinza', 5, 'Pequeno', '1.764.130'),
(95, 95, 11, 'pet_ (95).jpg', 'Chiara', 'F', 'Cão', 'Beagle', 'Branco', 2, 'Médio', '2.251.348'),
(96, 96, 12, 'pet_ (96).jpg', 'Neymar', 'M', 'Gato', 'Siamês', 'Preto', 1, 'Pequeno', '2.435.373'),
(97, 97, 1, 'pet_ (97).jpg', 'Pitty', 'F', 'Cão', 'Dachshund', 'Caramelo', 3, 'Médio', '1.476.245'),
(98, 98, 2, 'pet_ (98).jpg', 'Xuxa', 'F', 'Gato', 'Persa', 'Branco', 4, 'Pequeno', '2.274.534'),
(99, 99, 3, 'pet_ (99).jpg', 'Melissa', 'F', 'Cão', 'Bulldog', 'Cinza', 5, 'Grande', '1.840.892'),
(100, 100, 4, 'pet_ (100).jpg', 'Yoshi', 'M', 'Gato', 'Vira-lata', 'Marrom', 2, 'Pequeno', '2.224.517'),
(101, 1, 1, 'pet_ (101).jpg', 'Jujuba', 'M', 'Cão', 'Golden Retriever', 'Dourado', 3, 'Médio', '2.492.199'),
(102, 2, 2, 'pet_ (102).jpg', 'Lolita', 'F', 'Gato', 'Siamês', 'Branco', 2, 'Pequeno', '2.117.219'),
(103, 3, 3, 'pet_ (103).jpg', 'Ginger', 'F', 'Cão', 'Poodle', 'Ruivo', 5, 'Médio', '1.483.849'),
(104, 4, 4, 'pet_ (104).jpg', 'Kiko', 'M', 'Gato', 'Vira-lata', 'Preto', 1, 'Pequeno', '1.290.787'),
(105, 5, 5, 'pet_ (105).jpg', 'Sandy', 'F', 'Cão', 'Bulldog', 'Branco', 4, 'Médio', '1.943.723'),
(106, 6, 6, 'pet_ (106).jpg', 'Pantera', 'M', 'Gato', 'British Shorthair', 'Cinza', 3, 'Médio', '1.969.363'),
(107, 7, 7, 'pet_ (107).jpg', 'Fifi', 'F', 'Cão', 'Labrador', 'Amarelo', 2, 'Grande', '2.873.526'),
(108, 8, 8, 'pet_ (108).jpg', 'Alex', 'M', 'Gato', 'Siamês', 'Dourado', 1, 'Pequeno', '2.596.764'),
(109, 9, 9, 'pet_ (109).jpg', 'Olaf', 'M', 'Cão', 'Beagle', 'Marrom', 3, 'Médio', '1.505.988'),
(110, 10, 10, 'pet_ (110).jpg', 'Pucca', 'F', 'Gato', 'Persa', 'Branco', 4, 'Pequeno', '1.332.423'),
(111, 11, 11, 'pet_ (111).jpg', 'Gaya', 'F', 'Cão', 'Chihuahua', 'Tigrado', 2, 'Pequeno', '2.394.385'),
(112, 12, 12, 'pet_ (112).jpg', 'Farofa', 'M', 'Gato', 'Vira-lata', 'Cinza', 1, 'Pequeno', '2.930.318'),
(113, 13, 1, 'pet_ (113).jpg', 'Pipoca', 'F', 'Cão', 'Schnauzer', 'Preto', 5, 'Médio', '1.751.173'),
(114, 14, 2, 'pet_ (114).jpg', 'Pipa', 'M', 'Gato', 'Siamês', 'Caramelo', 3, 'Pequeno', '1.236.701'),
(115, 15, 3, 'pet_ (115).jpg', 'Artur', 'M', 'Cão', 'Dachshund', 'Marrom', 4, 'Pequeno', '1.295.625'),
(116, 16, 4, 'pet_ (116).jpg', 'Bernadete', 'F', 'Gato', 'British Shorthair', 'Cinza', 2, 'Médio', '1.131.878'),
(117, 17, 5, 'pet_ (117).jpg', 'Gizmo', 'M', 'Cão', 'Golden Retriever', 'Dourado', 3, 'Médio', '2.891.156'),
(118, 18, 6, 'pet_ (118).jpg', 'Anitta', 'F', 'Gato', 'Vira-lata', 'Branco', 1, 'Pequeno', '2.733.730'),
(119, 19, 7, 'pet_ (119).jpg', 'Jeskier', 'M', 'Cão', 'Labrador', 'Preto', 4, 'Grande', '2.403.516'),
(120, 20, 8, 'pet_ (120).jpg', 'Panqueca', 'F', 'Gato', 'Siamês', 'Cinza', 2, 'Pequeno', '2.908.417'),
(121, 21, 9, 'pet_ (121).jpg', 'Mogli', 'M', 'Cão', 'Beagle', 'Marrom e Branco', 3, 'Médio', '1.151.250'),
(122, 22, 10, 'pet_ (122).jpg', 'Chester', 'M', 'Gato', 'Persa', 'Preto', 1, 'Pequeno', '1.161.235'),
(123, 23, 11, 'pet_ (123).jpg', 'Rubi', 'F', 'Cão', 'Golden Retriever', 'Dourado', 5, 'Grande', '2.166.211'),
(124, 24, 12, 'pet_ (124).jpg', 'Justin', 'M', 'Gato', 'Vira-lata', 'Marrom', 2, 'Pequeno', '2.970.761'),
(125, 25, 1, 'pet_ (125).jpg', 'Chocolate', 'F', 'Cão', 'Dachshund', 'Preto', 4, 'Pequeno', '2.490.898'),
(126, 26, 2, 'pet_ (126).jpg', 'Cacau', 'M', 'Gato', 'Siamês', 'Cinza', 1, 'Pequeno', '2.694.594'),
(127, 27, 3, 'pet_ (127).jpg', 'Judite', 'F', 'Cão', 'Bulldog', 'Branco', 3, 'Médio', '2.430.729'),
(128, 28, 4, 'pet_ (128).jpg', 'Teteu', 'M', 'Gato', 'British Shorthair', 'Dourado', 2, 'Pequeno', '1.886.973'),
(129, 29, 5, 'pet_ (129).jpg', 'Jorisvalda', 'F', 'Cão', 'Chihuahua', 'Caramelo', 5, 'Pequeno', '2.446.164'),
(130, 30, 6, 'pet_ (130).jpg', 'Yume', 'F', 'Gato', 'Vira-lata', 'Cinza', 4, 'Pequeno', '2.870.534'),
(131, 31, 7, 'pet_ (131).jpg', 'Bruce', 'M', 'Cão', 'Beagle', 'Marrom', 3, 'Médio', '2.185.212'),
(132, 32, 8, 'pet_ (132).jpg', 'Laika', 'F', 'Gato', 'Persa', 'Branco', 2, 'Pequeno', '1.221.260'),
(133, 33, 9, 'pet_ (133).jpg', 'Bolinha', 'M', 'Cão', 'Golden Retriever', 'Dourado', 4, 'Grande', '2.968.613'),
(134, 34, 10, 'pet_ (134).jpg', 'Betonera', 'M', 'Gato', 'Vira-lata', 'Tigrado', 1, 'Pequeno', '1.659.304'),
(135, 35, 11, 'pet_ (135).jpg', 'Pituca', 'F', 'Cão', 'Dachshund', 'Marrom', 2, 'Pequeno', '2.874.454'),
(136, 36, 12, 'pet_ (136).jpg', 'Chiquinha', 'F', 'Gato', 'Siamês', 'Cinza', 3, 'Pequeno', '1.177.639'),
(137, 37, 1, 'pet_ (137).jpg', 'Neiva', 'F', 'Cão', 'Bulldog', 'Preto', 4, 'Grande', '1.749.793'),
(138, 38, 2, 'pet_ (138).jpg', 'Smeagol', 'M', 'Gato', 'British Shorthair', 'Cinza', 5, 'Pequeno', '1.362.210'),
(139, 39, 3, 'pet_ (139).jpg', 'Bel', 'F', 'Cão', 'Beagle', 'Marrom e Branco', 1, 'Médio', '2.833.446'),
(140, 40, 4, 'pet_ (140).jpg', 'Alvim', 'M', 'Gato', 'Vira-lata', 'Preto', 2, 'Pequeno', '2.272.591'),
(141, 6, 6, 'pet_ (141).jpg', 'Teddy', 'M', 'Cão', 'Golden Retriever', 'Dourado', 5, 'Grande', '2.948.403'),
(142, 7, 7, 'pet_ (142).jpg', 'Pepper', 'F', 'Gato', 'Siamês', 'Preto', 3, 'Pequeno', '2.361.631'),
(143, 8, 8, 'pet_ (143).jpg', 'Vitória', 'F', 'Cão', 'Bulldog', 'Branco', 2, 'Médio', '1.135.812'),
(144, 9, 9, 'pet_ (144).jpg', 'Mufasa', 'M', 'Gato', 'Persa', 'Caramelo', 4, 'Pequeno', '2.871.517'),
(145, 10, 10, 'pet_ (145).jpg', 'Ziggy', 'M', 'Cão', 'Beagle', 'Tigrado', 3, 'Médio', '2.839.412'),
(146, 11, 11, 'pet_ (146).jpg', 'Lupita', 'F', 'Gato', 'Siamês', 'Cinza', 2, 'Pequeno', '2.471.876'),
(147, 12, 12, 'pet_ (147).jpg', 'Lili', 'F', 'Cão', 'Chihuahua', 'Branco', 1, 'Pequeno', '2.330.739'),
(148, 1, 1, 'pet_ (148).jpg', 'Marley', 'M', 'Gato', 'Vira-lata', 'Dourado', 4, 'Pequeno', '1.501.748'),
(149, 2, 2, 'pet_ (149).jpg', 'Gugu', 'M', 'Cão', 'Dachshund', 'Marrom', 5, 'Pequeno', '1.852.504'),
(150, 3, 3, 'pet_ (150).jpg', 'Mafalda', 'F', 'Gato', 'Persa', 'Branco', 3, 'Pequeno', '2.328.793'),
(158, 110, 4, 'pet_158.png', 'Milly', 'Fêmea', 'Canina', 'Yorkshire', 'Marrom', 3, 'Pequeno', '4.352.362'),
(162, 107, 1, 'pet_162.jpg', 'Amelia', 'Fêmea', 'Canina', 'Shih tzu', 'Marrom', 6, 'Pequeno', '4.123.451');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(10) NOT NULL,
  `servico` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servico`
--

INSERT INTO `servico` (`id`, `servico`, `tipo`, `preco`) VALUES
(1, 'Hospedagem Diária', 'Hospedagem', 80.00),
(2, 'Hospedagem Semanal', 'Hospedagem', 500.00),
(3, 'Hospedagem Mensal', 'Hospedagem', 1800.00),
(4, 'Creche Anual', 'Creche', 12000.00),
(5, 'Creche Semestral', 'Creche', 7000.00),
(6, 'Creche Mensal', 'Creche', 1300.00),
(7, 'Pet Sitter Visita Única', 'Pet Sitter', 50.00),
(8, 'Pet Sitter Visitas Diárias', 'Pet Sitter', 300.00),
(9, 'Pet Sitter Noturno', 'Pet Sitter', 100.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `funcao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `funcao`) VALUES
(1, 'Teste Usuário', 'master', '$2y$10$Cem/2C3LYH5wVcEsJ5aUmuH.HmZMyg/J/ehIVv5hPAEZIl7grIkhG', 'admin'),
(2, 'Gabriel Morgan', 'gabriel.morgan', '$2y$10$apvw/5J5Q1wsB.ygI7hiGeOf4ClwfBkPFlgSYehh9Iqh0cJ/NsA6i', 'admin'),
(3, 'teste', 'teste', '$2y$10$qIDIcP6UsroLMy.dn3kXXewOednMpgzl0UySHvilRUZSnWj29d5wC', 'admin'),
(4, 'teste1', 'teste2', '$2y$10$qKZ2Q9habihkcvSqHVERU.nHJ/vcUNqSOnKR6a2rBGFCdd2g2L8.K', 'admin'),
(5, 'Banca', 'login.banca', '$2y$10$w2BtcwiKy9bcIpVu3ckHAOKWMN5aKna3v10183C6OF0I6qS24CLZ2', 'admin');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `id` int(10) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(20) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veterinario`
--

INSERT INTO `veterinario` (`id`, `nome`, `telefone`, `email`, `endereco`, `numero`, `complemento`, `bairro`, `cep`, `cidade`, `estado`) VALUES
(1, 'Dr. Gregory House', '(19) 98765-4312', 'ghouse@vetclinic.com.br', 'Rua Padre Vieira', '123', 'Sala 102', 'Cambuí', '13.024-040', 'Campinas', 'SP'),
(2, 'Dr Paulo Coelho', '(19) 99654-4321', 'pc@gmail.com', 'Rua Papa Paulo VI', '569', '96B', 'Vila Itatiaia', '13.100-466', 'Campinas', 'SP'),
(3, 'Dr. Victor Frankenstein', '(19) 98712-3434', 'vfrankenstein@vetlab.com.br', 'Avenida Andrade Neves', '1010', '', 'Centro', '13.013-161', 'Campinas', 'SP'),
(4, 'Dr Beakman', '(19) 99654-3256', 'beakman@animed.com.br', 'Rua Coronel Quirino', '203', 'Loja 4', 'Cambuí', '13.025-001', 'Campinas', 'SP'),
(5, 'Dr. Drauzio Varella', '(19) 98765-4378', 'drauzio@vetclinic.com.br', 'Rua Doutor Heitor Penteado', '123', 'Sala 102', 'Cambuí', '13.024-040', 'Campinas', 'SP'),
(6, 'Dra. Rita Lee', '(19) 99543-2198', 'ritalee@petspecialist.com.br', 'Rua José de Alencar', '606', 'Apt 301', 'Bonfim', '13.070-001', 'Campinas', 'SP'),
(7, 'Dr. Paulo Maluf', '(19) 99234-5676', 'maluf@bakerstreet.com.br', 'Rua Treze de Maio', '321', 'Sala 203', 'Centro', '13.010-161', 'Campinas', 'SP'),
(8, 'Dr. Snoopy', '(19) 98765-4354', 'snoopy@vetclinic.com.br', 'Rua Charlie Brown', '123', 'Sala 102', 'Cambuí', '13.024-040', 'Campinas', 'SP'),
(9, 'Dr. Max Steel', '(19) 99234-5632', 'maxsteel@bakerstreet.com.br', 'Rua dos Super-Heróis', '321', 'Sala 203', 'Centro', '13.010-161', 'Campinas', 'SP'),
(10, 'Dr. Mufasa', '(19) 99876-5410', 'mufasa@sciencevet.com.br', 'Rua do Reino Animal', '214', 'Sala 201', 'Castelo', '13.070-003', 'Campinas', 'SP'),
(11, 'Dr. Lingüiça', '(19) 97678-5401', 'linguica@vetclinic.com.br', 'Rua do Salsichão', '654', 'Apt 201', 'Parque Itália', '13.020-123', 'Campinas', 'SP'),
(12, 'Dr. Dolittle', '(19) 99321-8723', 'jdolittle@vetclinic.com.br', 'Rua Barão de Itapura', '789', 'Conjunto 3', 'Guanabara', '13.020-432', 'Campinas', 'SP');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id_evento`),
  ADD KEY `fk_pet_id` (`pet_id`),
  ADD KEY `fk_cliente_id` (`cliente_id`),
  ADD KEY `fk_veterinario_id` (`veterinario_id`),
  ADD KEY `fk_servico_id` (`servico_id`);

--
-- Índices de tabela `avaliacao_aprovadas`
--
ALTER TABLE `avaliacao_aprovadas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `avaliacao_recusadas`
--
ALTER TABLE `avaliacao_recusadas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `avaliacao_solicitadas`
--
ALTER TABLE `avaliacao_solicitadas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `lead`
--
ALTER TABLE `lead`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cliente_id_pet` (`cliente_id`),
  ADD KEY `fk_veterinario_id_pet` (`veterinario_id`);

--
-- Índices de tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Índices de tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`id`);
