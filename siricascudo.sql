-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 18, 2026 at 09:15 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siricascudo`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `endereco` text NOT NULL,
  `telefone` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `endereco`, `telefone`) VALUES
(1, 'Durvaldo Gonçalves', 'Rua das Flores, 123', '38998451201'),
(2, 'Joisce Almeida', 'Av. Sanitária, 456', '38998123456'),
(3, 'Marcos Pereira', 'Rua São João, 78', '38998765432'),
(4, 'Ana Clara Souza', 'Rua do Comércio, 890', '38999112233'),
(5, 'Rafael Lima', 'Av. Brasil, 1500', '38998224455'),
(6, 'Beatriz Mendes', 'Rua das Acácias, 32', '38998336677'),
(7, 'Carlos Eduardo', 'Rua XV de Novembro, 210', '38998448899'),
(8, 'Fernanda Oliveira', 'Av. Getúlio Vargas, 675', '38998551010'),
(9, 'Gustavo Rocha', 'Rua Minas Gerais, 44', '38998662020'),
(10, 'Larissa Costa', 'Rua Bahia, 320', '38998773030'),
(11, 'Pedro Henrique', 'Av. Cula Mangabeira, 980', '38998884040'),
(12, 'Juliana Ferreira', 'Rua Goiás, 55', '38998995050'),
(13, 'Ricardo Santos', 'Rua Espírito Santo, 128', '38999006060'),
(14, 'Camila Barbosa', 'Av. Deputado Esteves, 745', '38998117070'),
(15, 'Thiago Nunes', 'Rua Paraná, 67', '38998228080'),
(16, 'Patrícia Gomes', 'Rua Ceará, 412', '38998339090'),
(17, 'André Martins', 'Av. Doutor Ruy Braga, 1200', '38998441112'),
(18, 'Vanessa Ribeiro', 'Rua Pernambuco, 89', '38998552223'),
(19, 'Bruno Carvalho', 'Rua Alagoas, 156', '38998663334'),
(20, 'Isabela Dias', 'Av. Mestra Fininha, 530', '38998774445');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int NOT NULL,
  `id_cliente` int NOT NULL,
  `id_produto` int NOT NULL,
  `data_hora` datetime NOT NULL,
  `forma_pagamento` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_cliente`, `id_produto`, `data_hora`, `forma_pagamento`, `status`) VALUES
(1, 1, 3, '2026-08-31 21:15:43', 'PIX', 1),
(2, 3, 1, '2026-08-31 21:19:43', 'CARTÃO', 0),
(3, 6, 2, '2026-08-31 21:50:43', 'DINHEIRO', 0),
(4, 2, 4, '2026-08-31 19:05:12', 'PIX', 1),
(5, 4, 12, '2026-08-31 19:22:37', 'CARTÃO', 1),
(6, 1, 6, '2026-08-31 20:01:55', 'DINHEIRO', 0),
(7, 5, 16, '2026-08-31 20:14:08', 'PIX', 1),
(8, 3, 3, '2026-08-31 20:33:41', 'CARTÃO', 0),
(9, 6, 8, '2026-08-31 20:47:19', 'PIX', 1),
(10, 2, 22, '2026-08-31 21:02:50', 'DINHEIRO', 1),
(11, 4, 5, '2026-08-31 21:10:33', 'CARTÃO', 0),
(12, 1, 24, '2026-08-31 21:28:04', 'PIX', 1),
(13, 5, 13, '2026-08-31 21:35:47', 'PIX', 0),
(14, 3, 17, '2026-08-31 21:44:22', 'DINHEIRO', 1),
(15, 6, 20, '2026-08-31 21:58:11', 'CARTÃO', 1),
(16, 2, 7, '2026-08-31 22:05:39', 'PIX', 0),
(17, 4, 23, '2026-08-31 22:13:57', 'CARTÃO', 1),
(18, 5, 9, '2026-08-31 22:21:44', 'DINHEIRO', 0),
(19, 1, 18, '2026-08-31 22:30:26', 'PIX', 1),
(20, 3, 23, '2026-08-31 22:41:08', 'CARTÃO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produtos`
--

CREATE TABLE `produtos` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `categoria`, `preco`) VALUES
(1, 'x-tudo', 'lanche', '15.99'),
(2, 'coca-cola 1L', 'bebida', '14.99'),
(3, 'Pudim de Leite', 'sobremesa', '13.00'),
(4, 'x-burger', 'lanche', '12.99'),
(5, 'x-salada', 'lanche', '14.50'),
(6, 'x-bacon', 'lanche', '16.99'),
(7, 'x-egg', 'lanche', '13.99'),
(8, 'x-frango', 'lanche', '15.50'),
(9, 'x-calabresa', 'lanche', '15.00'),
(10, 'cachorro-quente', 'lanche', '10.99'),
(11, 'misto quente', 'lanche', '8.99'),
(12, 'batata frita', 'acompanhamento', '12.00'),
(13, 'batata com cheddar e bacon', 'acompanhamento', '18.99'),
(14, 'onion rings', 'acompanhamento', '14.00'),
(15, 'nuggets 10un', 'acompanhamento', '16.50'),
(16, 'coca-cola lata', 'bebida', '6.00'),
(17, 'guarana lata', 'bebida', '5.50'),
(18, 'suco de laranja 500ml', 'bebida', '8.99'),
(19, 'agua mineral 500ml', 'bebida', '4.00'),
(20, 'agua com gas 500ml', 'bebida', '4.50'),
(21, 'cerveja long neck', 'bebida', '9.99'),
(22, 'milk-shake chocolate', 'bebida', '16.00'),
(23, 'milk-shake morango', 'bebida', '16.00'),
(24, 'petit gateau', 'sobremesa', '17.99'),
(25, 'brownie com sorvete', 'sobremesa', '15.50'),
(26, 'sorvete 2 bolas', 'sobremesa', '12.00'),
(27, 'mousse de maracuja', 'sobremesa', '11.00'),
(28, 'combo x-burger + batata + refri', 'combo', '32.90'),
(29, 'combo x-tudo + batata + refri', 'combo', '36.90'),
(30, 'combo kids', 'combo', '24.90');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
