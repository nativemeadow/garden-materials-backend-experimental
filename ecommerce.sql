-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2023 at 02:24 AM
-- Server version: 8.0.27
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(24, 'b6a19327-e5d5-4b06-aba6-3607d81671a6', '2022-08-24 10:43:00', NULL),
(25, '91f0b9c5-a3a1-4a7c-a6ee-46153dad3418', '2022-10-15 18:23:15', NULL),
(26, '25176827-7f64-4c6f-8618-42c1421bdf0b', '2022-11-13 10:34:14', NULL),
(27, '8fa649b2-2fe7-4734-83a3-3da8f81e6804', '2022-11-16 09:23:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_id` int NOT NULL,
  `item_id` int NOT NULL,
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  `sku` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `unit` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_id`, `item_id`, `category_id`, `product_id`, `sku`, `quantity`, `price`, `title`, `image`, `unit`, `color`, `created_at`, `updated_at`) VALUES
(24, 27, 11, 135, 'BCBL', 3, '0.33', 'Bouquet Canyon Boulders', 'bouquetCanyonBoulders.jpg', 'lbs', '', '2022-12-22 10:58:27', NULL),
(24, 177, 11, 78, 'AGB', 3, '64.00', 'Amador Granite Boulder', 'amadorGraniteBoulders.jpg', 'ton', '', '2022-11-28 16:04:24', NULL),
(24, 178, 29, 33, 'OBULL', 5, '255.00', 'Oregon Bull Organic Aged Humus - Special Order', 'oregonBullOrganicAgedHumus.jpg', 'yd', '', '2022-12-22 10:58:27', NULL),
(24, 268, 11, 134, 'ATOBL', 1, '810.00', 'Antigo Boulder ', 'AntigoBolder.jpg', 'ton', '', '2022-12-15 09:45:32', NULL),
(25, 297, 20, 45, '34CDR', 6, '77.95', '3/4\" Crushed Drain Rock', '3-4crushedDrainRock.jpg', 'ton', '', '2022-10-15 18:23:15', NULL),
(24, 304, 20, 44, '38PG', 3, '84.95', '3/8\" Pea Gravel ', '3-8-pea-gravel.jpg', 'ton', '', '2022-11-05 10:18:38', NULL),
(24, 306, 19, 6, '1OS', 5, '103.95', '#1 Olympia Sand', '1-olympia-sand.jpg', 'ton', '', '2022-11-09 09:17:19', '2022-12-22 10:58:27'),
(26, 307, 26, 86, 'BBBLP', 3, '800.00', 'Black Button La Paz Pebbles', 'blackButtonLaPazPebbles.jpeg', 'ton', '', '2022-11-13 10:34:14', NULL),
(27, 308, 24, 63, '112LC', 4, '179.95', 'Lin Creek Pebbles', '1-12LinCreekPebbles.jpg', 'ton', '', '2022-11-16 09:23:00', NULL),
(24, 309, 11, 136, 'CCB', 6, '0.38', 'Chiefcliff Boulders', 'ChiefcliffBoulders.jpeg', 'lbs', '', '2023-01-01 10:22:00', NULL),
(24, 310, 22, 48, 'BF', 3, '91.50', 'Blue Fines', 'blueFines.jpg', 'ton', '', '2023-01-02 11:05:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `url_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `category_order` int NOT NULL,
  `parent_category` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `url_key`, `title`, `description`, `image`, `category_order`, `parent_category`) VALUES
(1, 'sand-gravel-aggregates', 'Sand, Gravel, and Decorative Aggregates', '<p>The key to landscaping in California is to maximize water efficiency, and strategically use decorative rocks and fillers in places where plants can’t grow. Designing your exteriors to be functional, efficient, and aesthetically appealing is a great way to increase your enjoyment and the value of your home. To improve your landscape\'s function, choose from a wide variety of filler materials, such as our sands, pea gravels, and crushed grain rock, as well as base rock materials. To increase aesthetic beauty, we offer a large variety of crushed rock, as well as decorative, polished, and premium pebbles. See for a guide to all<a style=\"color: #aa081e\" target=\"_blank\" href=\"#\"> our landscaping sands, gravels, and rocks.</a></p>\r\n\r\n<p style=\"font-size:12px;text-align:center;margin-bottom:15px\">Disclaimer: Product pictures of natural stone are not an exact representation of the product hues seen in natural light. There are natural color variations in stone and exact color match is not guaranteed. We recommend verifying the product color at our location before placing your order online.</p>', 'sand-grave-decorative-rocks.jpg', 1, NULL),
(2, 'natural-stone', 'Natural Stone', NULL, 'natural-stone.jpg', 4, NULL),
(3, 'composts-mulches-soils-amendments', 'Composts, Mulches, Soils and Amendments', NULL, 'compost-mulch.jpg', 2, NULL),
(4, 'biologicals-fertilizers-bagged-soils', 'Biologicals, Fertilizers and Bagged Soils', NULL, 'fertilizers-amendments.jpg', 3, NULL),
(5, 'pottery-garden-ornaments', 'Pottery and Garden Ornaments', 'We carry an extensive line of pottery and statues. \r\nVisit our location in San Carlos for our new and ever evolving inventory.', 'pottery-garden-ornements.jpg', 5, NULL),
(6, 'water-features', 'Water Features', NULL, 'water-features.jpg', 6, NULL),
(7, 'building-materials-tools', 'Building Materials and Tools', NULL, 'tools.jpg', 7, NULL),
(8, 'precast-concrete', 'Precast Concrete Products', 'Please refer to our vendor websites for your paver selections, you\'ll be redirected by clicking on the picture below. \r\n\r\nFor more information and to place your order, call us at (650) 364 1730.', 'precast-concrete.jpg', 8, NULL),
(11, 'boulders', 'Boulders', '<p>Boulders are a timeless natural resource that enhances the beauty of any landscaped area. Use them as a focal point in your garden or as a complimentary element. Boulders could also be enjoyed as a natural seating in an outdoor space. Our boulders are sold by weight of the individual piece. We carry a wide variety of natural boulders from granite to quartzite to basalt and more! With natural variations between each boulder, no two are alike. </p>\r\n\r\n<p>Visit our yard to handpick your unique boulders!</p>\r\n\r\n<p>Disclaimer: Many stone types may have concentrations of iron, and with the exposure to moisture, rust stains may be bleeding to the surface of the stone. For many stone types there is no way of knowing prior to installation if this will be an issue.</p>', 'boulders.jpg', 10, 2),
(13, 'dimensional-stone', 'Dimensional Stones', 'Dimensional Stones are cut stones with rectilinear edges, making installation of natural stone quite easy. Create your own desired pattern with various sizes. Most dimensional stones are offered from 12\" X 12\" size. Custom sizes are made to order.', 'dimensional-stone.jpg', 11, 2),
(14, 'cubes-cobbles-pavers', 'Driveway Cubes, Cobbles & Pavers', NULL, 'driveway-cubes-cobbles-pavers.jpg', 12, 2),
(15, 'drystack-wallrocks', 'Drystack and Wall Rocks\r\n', NULL, 'drystack-wall-rocks.jpg', 13, 2),
(16, 'irregular-flagstone', 'Irregular Flagstones', 'Irregular Flagstones are available as stand-up select on a pallet. Due to the variations between each pallets, we recommend that our customers visit our yard to select the exact pallet before setting up a delivery. For smaller quantities, we offer an open bin option to hand select your flagstones from.', 'irregular-flagstone.jpg', 14, 2),
(17, 'ledgerstones', 'Ledgestones', NULL, 'ledgerstones.jpg', 15, 2),
(18, 'veneer-panels', 'Veneer Panels', NULL, 'veneer-panels.jpg', 16, 2),
(19, 'sand', 'Sand', NULL, 'sand.jpg', 17, 1),
(20, 'gravel', 'Gravel', NULL, 'gravel.jpg', 18, 1),
(21, 'base-rock', 'Base Rock', NULL, 'base-rock.jpg', 19, 1),
(22, 'pathway-fines', 'Path Fines', NULL, 'path-fines.jpg', 20, 1),
(23, 'crushed-rock', 'Crushed Rock', NULL, 'crushed-rock.jpg', 21, 1),
(24, 'decorative-pebbles', 'Decorative Pebbles', NULL, 'decorative-pebbles.jpg', 22, 1),
(25, 'polished-pebbles', 'Polished Pebbles', NULL, 'polished-pebbles.jpg', 23, 1),
(26, 'premium-pebbles', 'Premium Pebbles', NULL, 'premium-pebbles.jpg', 24, 1),
(27, 'bocce-ball-courts', 'Bocce Ball Court Materials', '<h1>Bocce Court Surface Materials</h1>\r\n\r\nWhen building a backyard bocce court, be sure to choose lasting materials that are low maintenance and that facilitate fast play while offering minimal bounce. Choose from our bocce court materials below, or see our guide to building a backyard bocce court for more tips and advice.', 'bocce-ball-court-materials.jpg', 25, 1),
(28, 'amendments', 'Amendments', '<h1>Organic Soil Amendments</h1>\r\n\r\nThe ideal soil consists of a balance of sand, loam, clay, organic matter, minerals, water, and air, but rarely do we get to start with the perfect combination. That\'s why we offer a number of soil amendments that are perfect for California\'s main soil types: sandy, loamy, and clay. For tips on how to amend, see our <a href=\"https://www.lyngsogarden.com/community-resources/the-best-soils-for-vegetables-fruit-flowers-and-other-landscaping-needs/\">guide to amendments for California soils</a>.', 'amendments.jpg', 26, 3),
(29, 'compost', 'Compost', '<h1>Organic Garden Composts</h1>\r\n\r\nCompost is decomposed organic matter that is rich in nutrients and often a course, dark brown, peat-like material. Adding compost to your soil improves the overall structure and texture. It increases the capacity to hold water in sandy soils, and enhances drainage in heavy clay soils. It also attracts earthworms that help aerate the soil and beneficial microbiology that helps convert material into molecules and elements that plants can more easily absorb.\r\n\r\nNot sure which compost is best for your needs? Check out our guide to choosing the right compost for your flower or vegetable garden.', 'compost.jpg', 27, 3),
(31, 'mulches', 'Mulches', 'Mulch is a generic term for a ground cover that protects the soil. Organic and natural mulch helps with moisture retention, weed prevention and water loss due to surface evaporation. Covering your landscape with at least 1\" of mulch helps provide the soil with the much needed protection from the natural weathering elements. The mulch will decompose over time, providing carbon matter and feeding your soil. Choose from a variety of mulch to match your garden aesthetics.\r\n\r\nNot sure which compost is best for your needs? Check out our guide to choosing the right compost for your flower or vegetable garden.', 'mulches.jpg', 29, 3),
(32, 'soils', 'Soils', '<h1>SOIL IS LIFE!</h1>\r\n\r\nThe ideal soil is made up of a balance between clay, sand, loam, organic matter, minerals, water and air. At Lyngso, we believe in the soil food web with a healthy balance of microorganisms that help the soil be alive, organic, and full of life. We pride ourselves in our extensive knowledge of soil biology and are happy to recommend the right kind of soil for your garden to thrive! \r\n\r\nSee our how to guide on improving your soil\'s structure, feeding your soil, and protecting your soil.  \r\n\r\nNot sure which compost is best for your needs? Check out our guide to choosing the right compost for your flower or vegetable garden.', 'soils.jpg', 30, 3),
(33, 'biologicals-minerals-liquid-fertilizers', 'Biologicals, Minerals and Liquid Fertilizers', NULL, 'biological-minerals-liquid-fertilizers.jpg', 31, 4),
(34, 'down-to-earh-fertilizers', 'Down To Earth Single and Blended Fertilizers', NULL, 'down-to-earth.jpg', 32, 4),
(35, 'pre-bagged-soils-composts', 'Pre-bagged Soils and Composts', NULL, 'pre-bagged-soils-composts.jpg', 33, 4),
(36, 'sheet-mulching-supplies', 'Sheet Mulching Supplies', NULL, 'sheet-mulching-supplies.jpg', 34, 4),
(40, 'pottery', 'Pottery', NULL, 'pottery.jpg', 35, 5),
(41, 'earthware-planters', 'Earthenware Planters', NULL, 'earthenware-planters.jpg', 36, 40),
(43, 'statuary', 'Statuary', NULL, 'statuary.jpg', 37, 5),
(44, 'columns', 'Columns', NULL, 'columns.jpg', 38, 6),
(45, 'basins', 'Basins', NULL, 'basins.jpg', 39, 6),
(46, 'pumps', 'Pumps', NULL, 'basins.jpg', 40, 6),
(47, 'plumbling', 'Plumbing', NULL, 'plumbing.jpg', 41, 6),
(48, 'lighting', 'Lighting', NULL, 'lighting.jpg', 42, 6),
(49, 'installation-parts', 'Installation Parts', NULL, 'installation-parts.jpg', 43, 6),
(50, 'water-treatments', 'Water Treatments', NULL, 'water-treatments.jpg', 44, 6),
(51, 'cement-grout-quikrete', 'Cement, Grout and Quikrete', NULL, 'cement-grout-quikrete.jpg', 45, 7),
(52, 'pre-bagged-sand', 'Sand(Pre-Bagged)', NULL, 'pre-bagged-sand.jpg', 46, 7),
(53, 'stains-sealers-cleaners', 'Stains, Sealers and Cleaners', NULL, 'stains-sealers-cleaners.jpg', 47, 7),
(54, 'structural-edging', 'Structural and Edging', NULL, 'structural-and-edging.jpg', 48, 7),
(55, 'tools', 'tools', NULL, 'construction-tools.jpg', 49, 7),
(57, 'calstone', 'Calstone', NULL, 'calstone.jpg', 51, 8),
(58, 'stepping-stone', 'Step Stone', NULL, 'step-stone.jpg', 52, 8);

-- --------------------------------------------------------

--
-- Table structure for table `customer_cc`
--

CREATE TABLE `customer_cc` (
  `id` int NOT NULL,
  `address_id` int NOT NULL,
  `credit_card` varchar(20) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `number` varchar(20) NOT NULL,
  `security_code` int NOT NULL,
  `expire_month` int NOT NULL,
  `expire-year` year NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tax_rate` decimal(8,0) DEFAULT NULL,
  `total_price` decimal(10,0) DEFAULT NULL,
  `delivery_instructions` text,
  `purchase_order` varchar(50) DEFAULT NULL,
  `requested_delivery_date` date DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `manual_address` json DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` time DEFAULT NULL,
  `is_delivery` tinyint(1) DEFAULT '0',
  `is_pickup` tinyint(1) DEFAULT '0',
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_delivered` tinyint(1) NOT NULL DEFAULT '0',
  `payment_method` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `confirm_order` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `tax_rate`, `total_price`, `delivery_instructions`, `purchase_order`, `requested_delivery_date`, `address_id`, `manual_address`, `pickup_date`, `pickup_time`, `is_delivery`, `is_pickup`, `is_paid`, `is_delivered`, `payment_method`, `confirm_order`, `created_at`, `updated_at`) VALUES
(18, 'b6a19327-e5d5-4b06-aba6-3607d81671a6', '2022-09-03 23:21:55', NULL, NULL, 'Please deliver to back garage door. Okay Now Start again', '4546737723455', '2022-10-25', 14, '{\"city\": \"Mountain View\", \"name\": \"Joseph McClintock\", \"address\": \"279 Walker Drive\", \"country\": \"USA\", \"postal_code\": \"94043\", \"state_province\": \"CA\"}', '2022-11-18', '11:30:00', 0, 0, 0, 0, NULL, 0, '2022-09-03 16:21:55', '2022-11-28 13:24:56'),
(21, '25176827-7f64-4c6f-8618-42c1421bdf0b', '2022-11-13 18:34:43', NULL, NULL, 'Test', '', '2022-11-22', 34, '{\"city\": \"San Carlos\", \"name\": \"Joseph McClintock\", \"address\": \"564 Birch Lane\", \"country\": \"USA\", \"postal_code\": \"94006\", \"state_province\": \"CA\"}', '2022-11-23', '11:30:00', 0, 0, 0, 0, NULL, 0, '2022-11-13 10:34:43', '2022-11-13 10:51:34'),
(22, '8fa649b2-2fe7-4734-83a3-3da8f81e6804', '2022-11-16 17:23:20', NULL, NULL, 'Test', '', '2022-11-30', 8, '{\"city\": \"Loma Mar\", \"name\": \"Joseph McClintock\", \"address\": \"201 Burns Valley Road\", \"country\": \"USA\", \"postal_code\": \"94021\", \"state_province\": \"CA\"}', '2022-11-29', '12:30:00', 0, 0, 0, 0, NULL, 0, '2022-11-16 09:23:20', '2022-11-16 09:33:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  `sku` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `unit` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `color` varchar(30) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `id`, `category_id`, `product_id`, `sku`, `quantity`, `price`, `title`, `image`, `unit`, `color`, `created_at`, `updated_at`) VALUES
(21, 2786, 26, 86, 'BBBLP', 3, '800.00', 'Black Button La Paz Pebbles', 'blackButtonLaPazPebbles.jpeg', 'ton', '', '2022-11-15 15:53:43', NULL),
(22, 2788, 24, 63, '112LC', 4, '179.95', 'Lin Creek Pebbles', '1-12LinCreekPebbles.jpg', 'ton', '', '2022-11-16 09:39:49', NULL),
(18, 3057, 11, 135, 'BCBL', 3, '0.33', 'Bouquet Canyon Boulders', 'bouquetCanyonBoulders.jpg', 'lbs', '', '2023-01-02 11:05:33', NULL),
(18, 3058, 11, 78, 'AGB', 3, '64.00', 'Amador Granite Boulder', 'amadorGraniteBoulders.jpg', 'ton', '', '2023-01-02 11:05:33', NULL),
(18, 3059, 29, 33, 'OBULL', 5, '255.00', 'Oregon Bull Organic Aged Humus - Special Order', 'oregonBullOrganicAgedHumus.jpg', 'yd', '', '2023-01-02 11:05:33', NULL),
(18, 3060, 11, 134, 'ATOBL', 1, '810.00', 'Antigo Boulder ', 'AntigoBolder.jpg', 'ton', '', '2023-01-02 11:05:33', NULL),
(18, 3061, 20, 44, '38PG', 3, '84.95', '3/8\" Pea Gravel ', '3-8-pea-gravel.jpg', 'ton', '', '2023-01-02 11:05:33', NULL),
(18, 3062, 19, 6, '1OS', 5, '103.95', '#1 Olympia Sand', '1-olympia-sand.jpg', 'ton', '', '2023-01-02 11:05:33', NULL),
(18, 3063, 11, 136, 'CCB', 6, '0.38', 'Chiefcliff Boulders', 'ChiefcliffBoulders.jpeg', 'lbs', '', '2023-01-02 11:05:33', NULL),
(18, 3064, 22, 48, 'BF', 3, '91.50', 'Blue Fines', 'blueFines.jpg', 'ton', '', '2023-01-02 11:05:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id` int NOT NULL,
  `sku` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `size` varchar(100) DEFAULT NULL,
  `units` text NOT NULL,
  `coverage` varchar(20) DEFAULT NULL,
  `coverage_value` decimal(10,2) DEFAULT NULL,
  `online_minimum` decimal(10,2) NOT NULL DEFAULT '1.00',
  `product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id`, `sku`, `title`, `description`, `image`, `price`, `size`, `units`, `coverage`, `coverage_value`, `online_minimum`, `product`) VALUES
(1, 'C2BR', 'Class 2 Base Rock U-sack', 'Per U-sack', NULL, '2.25', NULL, 'sk', 'Ton/Yard', '1.35', '3.75', 1),
(2, 'C2BR', 'Class 2 Base Rock', 'Per Ton', NULL, '31.50', NULL, 'ton', 'Ton/Yard', '1.35', '3.75', 1),
(3, '34C2P', 'Class 2 Base Rock Permeable U-sack', 'Per U-Sack', NULL, '5.25', NULL, 'sk', 'Ton/Yard', '1.25', '3.75', 2),
(4, '34C2P', 'Class 2 Base Rock Permeable', 'Per Ton', NULL, '77.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.75', 2),
(5, '14PG', '1/4\" Pea Gravel U-sack', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Ton/Yard', '1.25', '2.50', 3),
(6, '14PG', '1/4\" Pea Gravel ', 'Per Ton', NULL, '84.95', NULL, 'ton', 'Ton/Yard', '1.25', '2.50', 3),
(7, 'AFBF', 'Arizona Flagstone - Buckskin', 'Per Lb', NULL, '0.23', 'Per Lb', 'lbs', NULL, NULL, '1.00', 4),
(8, 'AFBF', 'Arizona Flagstone - Buckskin', 'Per Ton', NULL, '450.00', 'Per ton', 'ton', NULL, NULL, '1.00', 4),
(9, '14-FB', '1/4\" Minus Fir Bark U-sack', 'Per U-Sack ', NULL, '4.50', NULL, 'sk', 'Ton/Yard', '0.16', '2.50', 5),
(10, '14-FB', '1/4\" Minus Fir Bark ', 'Per Yard', NULL, '75.50', NULL, 'yd', 'Ton/Yard', '0.16', '2.50', 5),
(11, '1OS', '#1 Olympia Sand Sack U-sack', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 6),
(12, '1OS', '#1 Olympia Sand', 'Per Ton', NULL, '103.95', 'Ton', 'ton', 'Ton/Yard', '1.25', '3.25', 6),
(13, '2OS', '#2 Olympia Sand U-sack', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 7),
(14, '2OS', '#2 Olympia Sand', 'Per Ton', NULL, '103.95', 'Ton', 'ton', 'Ton/Yard', '1.25', '3.25', 7),
(15, 'CS', 'Concrete Sand U-sack', 'Per U-Sack', NULL, '5.00', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 8),
(16, 'CS', 'Concrete Sand Per Ton ', 'Per Ton', NULL, '99.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 8),
(17, 'CBSB', 'Connecticut Bluestone, True Blue full Pallet Only', 'Full Pallet', NULL, '950.00', 'pallet', 'pallet', '100-100 / Ton', NULL, '1.00', 9),
(18, 'AL', 'Azure Limestone', 'Per Lb', NULL, '0.60', 'lbs', 'lbs', '75 sqf / ton', NULL, '1.00', 10),
(19, 'AL', 'Azure Limestone', 'Per Ton', NULL, '1195.00', 'ton', 'ton', '75 sqf / ton', NULL, '1.00', 10),
(20, 'GBLT', 'Galaxy Black Limestone', 'Per Lb', NULL, '0.60', 'lbs', 'lbs', '75 sqf / ton', NULL, '1.00', 11),
(21, 'GBLT', 'Galaxy Black Limestone', 'Per Ton', NULL, '1195.00', 'ton', 'ton', '75 sqf / ton', NULL, '1.00', 11),
(22, 'LGS', 'Luna Grey Sandstone', 'Per Lb', NULL, '0.60', 'lbs', 'lbs', '75 sqf / ton', NULL, '1.00', 12),
(23, 'LGS', 'Luna Grey Sandstone', 'Per Ton', NULL, '1195.00', 'ton', 'ton', '75 sqf / ton', NULL, '1.00', 12),
(24, '516RL', '5/16\" Lava Sack', 'Per U-Sack', NULL, '6.50', NULL, 'sk', 'Lb/yd', '0.65', '2.50', 13),
(25, '516RL', '5/16\" Lava Aprox.1350 Lb/yd ', 'Per Yard', NULL, '109.95', NULL, 'yd', 'Lb/yd', '0.65', '2.50', 13),
(26, 'LIGNA PEAT', 'U-sack Ligna Peat', 'Per U-Sack', NULL, '3.95', NULL, 'sk', 'Lb/yd', '0.15', '2.50', 14),
(27, 'LIGNA PEAT', 'Ligna Peat Amendment', 'Per U-Sack', NULL, '57.95', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 14),
(28, 'ORGANIC-AMENDMENT', 'U-sack Amendment Mix', 'Per U-Sack', NULL, '3.25', NULL, 'sk', 'Lb/yd', '0.65', '2.50', 15),
(29, 'ORGANIC-AMENDMENT', 'Amendment Mix', 'Per Yard', NULL, '41.50', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 15),
(30, 'RS', 'U Sack Redwood Sawdust', 'Per U-Sack', NULL, '3.50', NULL, 'sk', 'Lb/yd', '0.29', '2.50', 16),
(31, 'RS', 'Redwood Sawdust ', 'Per Yard', NULL, '42.50', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 16),
(32, 'COMPOST-MULCH', 'Composted Mulch - Limited Quantity', 'Per U-Sack', NULL, '3.00', NULL, 'sk', 'Lb/yd', '0.29', '2.50', 17),
(33, 'COMPOST-MULCH', 'Composted Mulch', 'Per Yard', NULL, '78.00', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 17),
(34, 'GRB', 'Ground Redwood Bark Sack', 'Per U-Sack', NULL, '3.75', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 18),
(35, 'GRB', 'Ground Redwood Bark Double Grind ', 'Per Yard', NULL, '51.00', NULL, 'yd', 'Lb/yd', '0.15', '2.50', 18),
(36, 'MA CHIP', 'U-sack Mahogany Chip', 'Per U-Sack', NULL, '4.35', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 19),
(37, 'MA CHIP', 'Mahogany Chip', 'Per Yard', NULL, '71.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 19),
(38, 'MMFB', 'Mini Mulch Fir Bark Sack', 'Per U-Sack', NULL, '4.95', NULL, 'sk', 'Lb/yd', '0.25', '2.50', 20),
(39, 'MMFB', 'Mini Mulch Fir Bark', 'Per Yard', NULL, '87.50', NULL, 'yd', 'Lb/yd', '0.25', '2.50', 20),
(40, 'MOCHA CHIP', 'U-sack Mocha Chip 1cf Bag ', 'Per U-Sack', NULL, '4.20', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 21),
(41, 'MOCHA CHIP', 'Mocha Chip', 'Per Yard', NULL, '59.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 21),
(42, 'PF', 'U-sack Playground Fibe', 'Per U-Sack', NULL, '4.25', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 22),
(43, 'PF', 'Playground Fiber', 'Per Yard', NULL, '73.75', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 22),
(44, 'PAM', 'U-sack Premium Arbor Mulch', 'Per U-Sack', NULL, '2.75', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 23),
(45, 'PAM', 'Premium Arbor Mulch', 'Per Yard', NULL, '36.00', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 23),
(46, 'SCB', 'Shredded Cedar Bark', 'Per U-Sack', NULL, '3.85', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 24),
(47, 'SCB', 'Shredded Cedar Bark', 'Per Yard', NULL, '55.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 24),
(48, 'SFB', 'Small Fir Bark Sack', 'Per U-Sack', NULL, '4.95', NULL, 'sk', 'Lb/yd', '0.26', '2.50', 25),
(49, 'SFB', 'Small Fir Bark 3/4\"-1-1/2\"', 'Per Yard', NULL, '87.50', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 25),
(50, 'WOB', 'U-sack Walk On Bark', 'Per U-Sack', NULL, '4.45', NULL, 'sk', 'Lb/yd', '0.25', '2.50', 26),
(51, 'WOB', 'Walk On Bark', 'Per Yard', NULL, '71.00', NULL, 'yd', 'Lb/yd', '0.25', '2.50', 26),
(52, 'TWC', 'U-sack Wood Chips', 'Per U-Sack', NULL, '3.45', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 27),
(53, 'TWC', 'Wood Chips ', 'Per Yard', NULL, '42.75', NULL, 'yd', 'Lb/yd', '0.16', '2.50', 27),
(54, 'AACT', 'Actively Aerated Compost Tea', 'Per GL', NULL, '12.00', NULL, 'gl', 'gl', NULL, '2.50', 28),
(55, 'BBBC', 'Bu\'s Blend Compost Pre Bag 1 Cf', 'Per Cubic Foot', NULL, '19.99', NULL, 'cu ft', 'cf', NULL, '2.50', 29),
(56, 'DDOC', 'Double Doody Organic Compost', 'EA', NULL, '13.50', NULL, 'EA', 'cf', NULL, '2.50', 30),
(57, 'HOWC', 'Heritage Organics Worm Castings', 'EA', NULL, '24.00', NULL, 'EA', 'cf', NULL, '2.50', 31),
(58, 'SCCOB', 'Seacoast Biodynamic Compost ', 'EA', NULL, '26.50', NULL, 'EA', 'cf', NULL, '2.50', 32),
(59, 'OBULL', 'Oregon Bull Organic Aged Humus ', 'Per U-Sack', NULL, '12.50', NULL, 'sk', 'Lb/yd', '0.75', '2.50', 33),
(60, 'OBULL', 'Oregon Bull Organic Aged Humus', 'Per Yard', NULL, '255.00', NULL, 'yd', 'Lb/yd', '0.75', '2.50', 33),
(61, 'OAM', 'U-sack Amendment Mix', 'Per U-Sack', NULL, '3.25', NULL, 'sk', 'Lb/yd', '0.16', '2.50', 34),
(62, 'OAM', 'Amendment Mix', 'Per Yard', NULL, '41.00', NULL, 'yd', 'Lb/yd', '0.75', '2.50', 34),
(63, 'DIESTEL', 'Diestel Structured Compost U-sk', 'Per U-Sack', NULL, '7.95', NULL, 'sk', 'Lb/yd', '0.50', '2.50', 35),
(64, 'DIESTEL', 'Diestel Structured Compost', 'Per Yard', NULL, '162.95', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 35),
(65, 'OC', 'U-sk Garden Compost /green Waste', 'Per U-Sack', NULL, '3.50', NULL, 'sk', 'Lb/yd', '0.50', '2.50', 36),
(66, 'OC', 'Garden Compost / Green Waste', 'Per Yard', NULL, '40.50', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 36),
(67, 'WEBB', 'U-sack Webb Ranch Compost ', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Lb/yd', '0.50', '2.50', 37),
(68, 'WEBB', 'Webb Ranch Organic Compost ', 'Per Yard', NULL, '140.95', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 37),
(69, 'BIOSWALE', 'Biotreatment Soil Mix', 'Per Yard', NULL, '72.00', NULL, 'yd', 'Lb/yd', '0.50', '2.50', 38),
(70, 'BBBPS', 'Baby Bu Potting Mix 1 1/2 Cu Ft', 'Cubic Foot', NULL, '72.00', NULL, 'cu ft', 'cu ft', '0.50', '2.50', 39),
(71, 'DEANPP', 'All Natural Potting Soil 1.5 Cu Ft', 'Cubic Foot', NULL, '19.00', NULL, 'cu ft', 'cu ft', '0.50', '2.50', 40),
(72, 'ES', 'Essential Soil Blend Usack', 'Per U-sack', NULL, '5.00', NULL, 'sk', 'ton/yd', '0.95', '2.50', 41),
(73, 'ES', 'Essential Soil Blend', 'Per Yard', NULL, '99.99', NULL, 'yd', 'ton/yd', '0.95', '2.50', 41),
(74, 'LM', 'U-sack Landscape Mix', 'Per U-sack', NULL, '3.75', NULL, 'sk', 'ton/yd', '0.85', '2.50', 42),
(75, 'LM', 'Landscape Mix', 'Per Yard', NULL, '62.00', NULL, 'yd', 'ton/yd', '0.85', '2.50', 42),
(76, 'OAM', 'U-sack Amendment Mix', 'Per U-sack', NULL, '3.25', NULL, 'sk', 'ton/yd', '0.85', '2.50', 43),
(77, 'OAM', 'Amendment Mix', 'Per Yard', NULL, '41.50', NULL, 'yd', 'ton/yd', '0.85', '2.50', 43),
(78, '38PG', '3/8&quot; Pea Gravel U-sack', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 44),
(79, '38PG', '3/8&quot; Pea Gravel ', 'Per Ton', NULL, '84.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 44),
(80, '34CDR', '3/4\" Crushed Drain Rock/u-sack', 'Per U-Sack', NULL, '5.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 45),
(81, '34CDR', '3/4\" Crushed D/r', 'Per Ton', NULL, '77.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 45),
(82, 'BBF', 'U Sack Black Basalt Fines', 'Per U-Sack', NULL, '8.95', NULL, 'sk', 'Ton/Yard', '1.50', '3.75', 46),
(83, 'BBF', 'Black Basalt Fines', 'Per Ton', NULL, '118.50', NULL, 'ton', 'Ton/Yard', '1.50', '3.75', 46),
(84, 'BBFS', 'Black Basalt Fines Stabilized', 'Per Ton', NULL, '168.00', NULL, 'ton', 'Ton/Yard', '1.50', '1.00', 47),
(85, 'BF', 'Blue Fines U-sack', 'Per U-Sack', NULL, '6.95', NULL, 'sk', 'Ton/Yard', '1.50', '1.00', 48),
(86, 'BF', 'Blue Fines', 'Per Ton', NULL, '91.50', NULL, 'ton', 'Ton/Yard', '1.50', '1.00', 48),
(87, 'BFS', 'Blue Fines Stabilized', 'Per Ton', NULL, '158.00', NULL, 'ton', 'Ton/Yard', '1.50', '3.75', 49),
(88, 'DBF', 'Desert Brown Fines', 'Per Ton', NULL, '350.00', NULL, 'ton', 'Ton/Yard', '1.50', '1.00', 50),
(89, 'SGPF', 'U-sack Sunset Gold Path Fines', 'Per U-Sack', NULL, '8.95', NULL, 'sk', 'Ton/Yard', '1.40', '3.75', 51),
(90, 'SGPF', 'Sunset Gold Path Fines', 'Per Ton', NULL, '128.95', NULL, 'ton', 'Ton/Yard', '1.40', '3.75', 51),
(91, 'SGPFS', 'Sunset Gold Path Fines Stabilized', 'Per Ton', NULL, '168.00', NULL, 'ton', 'Ton/Yard', '1.40', '1.00', 52),
(92, 'SGPF', 'U-sk Stabilized Sunset Gold Fine', 'Per U-Sack', NULL, '9.75', NULL, 'sk', 'Ton/Yard', '1.40', '1.00', 52),
(93, 'ASTC', 'U-sack Autumn Sl Tumbled Chips', 'Per U-Sack', NULL, '68.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 53),
(94, 'ASTC', '1.5\"-7\" Autumn Slate Tumble Chip', 'Per Ton', NULL, '1750.00', NULL, 'ton', 'Ton/Yard', '1.40', '3.25', 53),
(95, 'MBTSC', 'U-sack Midnight Blk Tumble Chips ', 'Per U-Sack', NULL, '68.50', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 54),
(96, 'MBTSC', 'Midnight Blk Tmbl Chips 1.5\"-7', 'Per Ton', NULL, '1750.00', NULL, 'ton', 'Ton/Yard', '1.40', '3.25', 54),
(97, '1278GGR', 'U-sack Glacier Green 1/2\"-7/8\"', 'Per U-Sack', NULL, '20.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 55),
(98, '1278GGR', 'Glacier Green Rock 1/2\"-7/8\"', 'Per Ton', NULL, '374.95', NULL, 'ton', 'Ton/Yard', '1.40', '3.25', 55),
(99, '38CBB', 'Crushed Black Basalt U-sack ', 'Per U-Sack', NULL, '7.95', NULL, 'sk', 'Ton/Yard', '1.25', '3.25', 56),
(100, '38CBB', '3/8\" Crushed Black Basalt Rock', '3/8\"', '3-8CrushedBlackBasalt.jpg', '111.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 56),
(101, '14CBB', '1/4\" Crushed Black Basalt Rock', '1/4\"', NULL, '111.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 56),
(102, '18DG', '1/8\" Desert Gold Sack ', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 57),
(103, '14DG', '1/4\" Desert Gold (nets 1/8\") ', '1/8\"', '1-8DesertGold.jpg', '111.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 57),
(104, '38DG', '3/8\" Desert Gold', '3/8\"', '3-8DesertGold.jpg', '111.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 57),
(105, '34DG', '3/4\" Desert Gold', '3/4\"', '3-4DesertGold.jpg', '111.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 57),
(106, '38T', '3/8\" Taffy Per U-sack', 'Per U-Sack', NULL, '9.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 58),
(107, '38T', '3/8\" Taffy Rock (minus) ', '3/8\"', NULL, '155.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 58),
(108, '21CBB', '2 1/2\" Crushed Black Basalt Sack ', 'Per U-Sack', NULL, '8.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 59),
(109, '21CBB', '2 1/2\" Crushed Black Basalt Rock ', '21/2\"', NULL, '132.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 59),
(110, '38CRG', '3/8 Crushed Rose Gold (minus)', '3/8', NULL, '249.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 60),
(111, '38Y', '3/8\" Yosemite Tan Per U-sack', 'Per U-Sack', NULL, '7.50', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 61),
(112, '38Y', '3/8\" Crushed Yosemite Tan', '21/2\"', NULL, '106.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 61),
(113, '24LC', '2 X 4 Lin Creek Cobbles Sack', 'Per U-Sack', NULL, '11.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 62),
(114, '24LCC', '2 X 4 Lin Creek Cobbles', '2\"/4\"', '2-4LinCreekCobble.jpg', '199.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 62),
(115, '38LCC', '3 X 8 Lin Creek Cobbles', '3\"/8\"', '3-8LinCreekCobble.jpg', '199.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 62),
(116, '12LC', 'U-sack 1 1/2\" Lin Creek Pebbles', 'Per U-Sack', NULL, '10.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 63),
(117, '24LC', '2 X 4 Lin Creek Cobbles', '2\"/4\"', '1-12LinCreekPebbles.jpg', '179.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 63),
(118, '112LC', '1/2\" Lin Creek Pebbles', '1/2\"', '1-2LinCreekPebbles.jpg', '179.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 63),
(119, '38LODI', '3/8\" Lodi Per Sack', 'Per U-Sack', NULL, '7.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 64),
(120, '38LODI', '3/8\" Lodi ', '3/8\"', NULL, '114.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 64),
(121, '38PAMI', '3/8\" Pami Pebbles Sack ', 'Per U-Sack', NULL, '17.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 65),
(122, '38PAMI', '3/8\" Pami Pebbles', '3/8\"', '3-8PamiPebbles.jpg', '305.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 65),
(123, '34PAMI', '3/4\" Pami Pebbles', '3/4\"', '3-4PamiPebbles.jpg', '305.95', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 65),
(124, '12QP', '1/2\" Quartz Pebbles 3/8\"x1/2\"', 'Per U-Sack', NULL, '17.95', NULL, 'sk', 'Lb/yd', '1.25', '3.25', 66),
(125, '12QP', '1/2\" Quartz Pebbles 3/8\"x1/2\"', '1/2\"', '1-2QuartzPebbles.jpg', '131.50', NULL, 'ton', 'Ton/Yard', '1.25', '3.25', 66),
(126, '34QP', '3/4\" Quartz Pebbles 3/4\"x1/2\"', '3/4\"', '3-4QuartzPebbles.jpg', '131.50', NULL, 'ton', 'Lb/yd', '1.25', '3.25', 66),
(127, '12SB', 'U-sack 1/2\" Salmon Bay', 'Per U-Sack', NULL, '30.50', NULL, 'sk', 'Ton/yd', '1.25', '3.25', 67),
(128, '34SB', '1/4\" Salmon Bay Pebbles', '1/4\"', 'samonBayPebbles.jpg', '576.95', NULL, 'ton', 'Ton/yd', '1.25', '3.25', 67),
(129, '12SB', '1/2\" Salmon Bay Pebbles ', '1/2\"', '1-2samonBayPebbles.jpg', '576.95', NULL, 'ton', 'Ton/yd', '1.25', '3.25', 67),
(130, 'BYHPP', 'Buckthorn Yellow High Pol 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '', '65.00', NULL, 'lbs', '', '0.00', '3.25', 68),
(132, '9-15FSHPP', 'Five Springs High Pol .8-1.5cm', '9 cm - 15 cm or 3/8\" - 5/8\"', '3-5-8FiveSpringsHighPolishPebbles.jpg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 69),
(133, '2-3FSHPP', 'Five Springs High Pol 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '3-11-4FiveSpringsHighPolishPebbles.jpg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 69),
(134, 'HRHPP', 'Henna Red High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '', '65.00', NULL, 'lbs', '', '0.00', '3.25', 70),
(135, 'JGPP', 'Pol Jade Green 2-3cm/3/4\"-1 1/4\"', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '', '45.00', NULL, 'lbs', '', '0.00', '3.25', 71),
(136, '2-3KBHPP', 'Kuro Black High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '3-4-1-1-4KuroBlackHighPolishPebbles.jpg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 72),
(137, '3-5KBHPP', 'Kuro Black High Polish 3-5Cm', '3 cm - 5 cm or 1\" - 2\"', '1-2KuroBlackHighPolishPebbles.jpeg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 72),
(138, '5-8KBHPP', 'Kuro Black High Polish 3-5Cm', '5 cm - 8 cm or 2\" - 3\"', '2-3KuroBlackHighPolishPebbles.jpeg', '65.00', NULL, 'lbs', '', '0.00', '3.25', 72),
(139, '2-3NPP', 'Niji Pebbles 2-3cm/3/4\"-1 1/4\"', '2 cm - 3 cm or 3/4\" - 1 1/4\"', '3-4-1-1-4NijiPebbles.jpg', '35.00', NULL, 'lbs', '', '0.00', '3.25', 73),
(140, '1-15NPP', 'Niji Pebbles 1-1.5cm/3/8\"-5/8\"', '1 cm - 1.5 cm or 3/8\" - 5/8\"', '2-5-2-8NijiPebbles.jpg', '35.00', NULL, 'lbs', '', '0.00', '3.25', 73),
(141, 'TFWHPP', 'Tufa White High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '65.00', NULL, 'lbs', '', '0.00', '3.25', 74),
(142, 'WGPP', 'Wasabi Grn Pbl 1-1.5cm/3/8\"-5/8\"', '1 cm - 1.5 cm or 3/8\" - 5/8\"', NULL, '35.00', NULL, 'lbs', '', '0.00', '3.25', 75),
(143, 'WHPP', 'Pol Woodgrain 2-3cm/3/4\"-1 1/4\" ', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '45.00', NULL, 'lbs', '', '0.00', '3.25', 76),
(144, 'WBHPP', 'Wuyi Brown High Polish 2-3 Cm', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '27.00', NULL, 'lbs', '', '0.00', '3.25', 77),
(145, 'AGB', 'Amador Granite Boulders Per Lb', 'Per Lb', NULL, '0.32', 'lbs', 'lbs', '', '0.00', '1.00', 78),
(146, 'AGB', 'Amador Granite Boulders', 'Per Ton', NULL, '64.00', 'ton', 'ton', '', '0.00', '1.00', 78),
(147, 'AWGB', 'Atwater Granite Boulder', 'Per Ton', NULL, '898.00', 'ton', 'ton', '', '0.00', '1.00', 79),
(148, 'BCSB', 'Basalt Column Sawn Bottom Per Lb ', 'Per Lb', NULL, '0.43', 'lbs', 'lbs', '', '0.00', '1.00', 80),
(149, 'BCSB', 'Basalt Column, Sawn Bottom', 'Per Ton', NULL, '860.00', 'ton', 'ton', '', '0.00', '1.00', 80),
(150, 'BCSBD', 'Basalt Fountain Rock Per Lb ', 'Per Lb', NULL, '0.94', 'lbs', 'lbs', '', '0.00', '1.00', 81),
(151, 'BCSBD', 'Basalt Column, Sawn Bottom Drill', 'Per Ton', NULL, '1880.00', 'ton', 'ton', '', '0.00', '1.00', 81),
(154, 'CCB', 'Chiefcliff Boulder Per Pound ', 'Per Lb', NULL, '0.33', 'lbs', 'lbs', '', '0.00', '1.00', 83),
(155, 'BCB', 'Chiefcliff Boulder', 'Per Ton', NULL, '660.00', 'ton', 'ton', '', '0.00', '1.00', 83),
(156, 'SWP2-3CM', 'Snow White Pbl 2-3cm/3/4\"-1 1/4\"', '2 cm - 3 cm or 3/4\" - 1 1/4\"', NULL, '35.00', NULL, 'lbs', '', '0.00', '3.25', 84),
(157, 'BB1', 'Blk Aqua Cove 10mm-20mm 1/2\"-1\"', '1 cm - 2 cm or 1/2\" - 1\"', 'blackAquaCovePebbles1.jpg', '1995.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 85),
(158, 'BB1', 'U-sack Blk Aqua Cove 1-2cm', 'Per U-Sack', NULL, '78.00', NULL, 'sk', 'Ton/yd', '1.25', '1.00', 85),
(159, 'BB2', 'Blk Aqua Cove 20-30mm 3/4-1 1/4', '2 cm - 3 cm or 3/4\" - 1 1/4\"', 'blackAquaCovePebbles3.jpg', '1995.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 85),
(160, 'BB5', 'Blk Aqua Cove 30mm-50mm 1\"-2\"', '3 cm - 5 cm or 1\" - 2\"', 'blackAquaCovePebbles5.jpg', '1995.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 85),
(161, 'BBBLP', 'U-sack Blk Button 5/8-7/8 La Paz', 'Per U-Sack', NULL, '43.00', NULL, 'sk', 'Ton/yd', '1.25', '1.00', 86),
(162, 'BBBLP', 'Bsk Black 5/8-7/8 La Paz Button', '5/8\" - 7/8\"', '', '800.00', 'per ton', 'ton', 'Ton/yd', '1.25', '1.00', 86),
(163, 'OSM', 'U-sack Oyster Shell Bocce Mix', 'Per U-Sack', NULL, '32.00', NULL, 'sk', 'Ton/yd', '1.00', '3.75', 87),
(164, 'OSM', 'Oyster Shell Bocce Blend ', 'per ton', '', '585.00', 'per ton', 'tons', 'Ton/yd', '1.00', '3.75', 87),
(165, 'OSM', 'U-sack Oyster Shell Bocce Mix', 'bag', NULL, '21.00', NULL, 'bg', 'Ton/yd', '1.00', '3.75', 88),
(166, 'TF', 'Taffy Fines Per U-sack', 'Per U-Sack', NULL, '9.50', NULL, 'sk', 'Ton/yd', '1.00', '3.75', 89),
(167, 'TF', 'Taffy Fines ', 'per ton', '', '145.00', 'per ton', 'ton', 'Ton/yd', '1.00', '3.75', 89),
(168, 'B-BLP', 'U-sack 1/2\"x1\" Black La Paz', 'Per U-Sack', '', '36.00', NULL, 'sk', 'Ton/yd', '1.25', '3.75', 90),
(169, 'B-BLP', 'Bulk Basket 1/2\"-1\" Black La Paz', '1/2\"-1\"', '1-2-1BlackLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90),
(170, 'B-BLP', 'Bulk Basket 1\"-2\" Black La Paz', '1\"-2\"', '1-2BlackLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90),
(171, 'B-BLP', 'Bulk Basket 2\"-3\" Black La Paz ', '2\"-3\"', '2-3BlackLaPazPebbles.jpb.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90),
(172, 'B-BLP', 'Bulk Basket 3\"-5\" Black La Paz', '3\"-5\"', '3-5BlackLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 90),
(173, 'B-BUFFLP', 'Bulk Basket 1/2\"-1\"buff La Paz ', '1/2\"-1\"', '1-2-1BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91),
(174, 'B-BUFFLP', 'Bulk Basket 1\"-2\" Buff La Paz', '1\"-2\"', '1-2BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91),
(175, 'B-BUFFLP', 'Bulk Basket 2\"-3\" Buff La Paz', '2\"-3\"', '2-3BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91),
(176, 'B-BUFFLP', 'Bulk Basket 3\"-5\" Buff La Paz', '3\"-5\"', '3-5BuffLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 91),
(177, 'BT1', 'U-sack Green Aqua Cove 1/2-2 1/2', 'Per U-Sack', '', '63.00', NULL, 'sk', 'Ton/yd', '1.25', '3.75', 92),
(178, 'BT1', 'Green Aqua Cove 1/2\"-2 1/2\"', '1/2\"-2 1/2\"', '1-2-2-1-2GreenAquaCovePebbles.jpeg', '1200.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 92),
(179, 'BT3', 'Green Aqua Cove 1/2\"-2 1/2\"', '1\"- 3\"', '1-3GreenAquaCovePebbles.jpeg', '1200.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 92),
(180, 'BTS', 'Green Aqua Cove 1 1/2\" - 3 1/2\"', '1 1/2\" - 3 1/2\"', '1-1-2-3-1-2GreenAquaCovePebbles.jpg', '1200.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 92),
(181, 'HTP1-2CM', 'Hama Pebbles 1-2cm / 1/2\" - 1\" ', 'Per U-Sack', NULL, '104.00', NULL, 'sk', 'Lb/yd', '0.65', '2.50', 93),
(182, 'HTP1-2CM', 'Green Aqua Cove 1/2\"-2 1/2\"', '1/2\"-2 1/2\"', '', '1975.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 93),
(183, 'B-LP', 'U-sack 1/4\"x1/2\" Mix La Paz', 'Per U-Sack', '', '36.00', NULL, 'sk', 'Ton/yd', '1.25', '3.75', 94),
(184, 'B-LP', 'Bulk Basket 1/8\"x1/4\" La Paz Mix', '1/8\"x1/4\"', '1-8-1-4MixedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 94),
(185, 'B-LP', 'Bulk Basket 1/4\"-1/2\" Mix La Paz', '1/4\"-1/2\"', '1-4-1-2MixedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 94),
(186, 'B-RLP', 'Bulk Basket 1/2\"-1\" Red La Paz', '1/2\"-1\"', '1-2-1RedLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95),
(187, 'B-RLP', 'Bulk Basket 1\"-2\" Red La Paz', '1\"-2\"', '1-2RedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95),
(188, 'B-RLP', 'Bulk Basket 2\"-3\" Red La Paz', '2\"- 3\"', '2-3RedLaPazPebbles.jpg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95),
(189, 'B-RLP', 'Bulk Basket 3\"-5\" Red La Paz', '3\"- 5\"', '3-5RedLaPazPebbles.jpeg', '650.00', 'per ton', 'ton', 'Ton/yd', '1.25', '3.75', 95),
(190, 'BASALT-C-ND', 'Basalt Columns 24\" Not Drilled', '24\"', '', '96.00', 'per each', '24\" column', NULL, NULL, '0.00', 96),
(191, 'BASALT-C-ND-36', 'Basalt Columns 36\" Not Drilled', '36\"', '', '140.00', 'per each', '36\" column', NULL, NULL, '0.00', 96),
(192, 'BASALT-C-ND-48', 'Basalt Columns 48\" Not Drilled', '48\"', '', '196.00', 'per each', '48\" column', NULL, NULL, '0.00', 96),
(193, 'BASALT-NT', 'Drilled Basalt Columns 24\"', '24\"', '', '115.00', 'per each', '24\" column', NULL, NULL, '0.00', 97),
(194, 'BASALT-NT-36', 'Drilled Basalt Columns 36\"', '36\"', '', '165.00', 'per each', '36\" column', NULL, NULL, '0.00', 97),
(195, 'BASALT-NT-48', 'Drilled Basalt Columns 48\"', '48\"', '', '250.00', 'per each', '48\" column', NULL, NULL, '0.00', 97),
(196, 'BASALT-NT-60', 'Drilled Basalt Columns 60\"', '60\"', '', '325.00', 'per each', '60\" column', NULL, NULL, '0.00', 97),
(197, 'BASALT-FPT', 'Drilled Basalt Column 24\" Polish ', '24\"', '', '120.00', 'per each', '24\" column', NULL, NULL, '0.00', 98),
(198, 'BASALT-FPT-36', 'Drilled Basalt Column 36\" Polish ', '36\"', '', '182.00', 'per each', '36\" column', NULL, NULL, '0.00', 98),
(199, 'BASALT-FPT-48', 'Drilled Basalt Column 48\" Polish ', '48\"', '', '266.00', 'per each', '48\" column', NULL, NULL, '0.00', 98),
(200, 'LBASALT-FNT', 'Large Basalt Column 36\" Nat. Top', '36\"', '', '435.00', 'per each', '36\" column', NULL, NULL, '0.00', 99),
(201, 'LBASALT-FNT-48', 'Large Basalt Column 48\" Nat. Top', '48\"', '', '550.00', 'per each', '48\" column', NULL, NULL, '0.00', 99),
(202, 'LBASALT-FNT-60', 'Large Basalt Column 60\" Nat. Top', '60\"', '', '660.00', 'per each', '60\" column', NULL, NULL, '0.00', 99),
(203, 'LBASALT-FPT', 'Large Basalt Column 36\" Polished Top', '36\"', '', '450.00', 'per each', '36\" column', NULL, NULL, '0.00', 100),
(204, 'LBASALT-FPT-48', 'Large Basalt Column 48\" Polished Top', '48\"', '', '565.00', 'per each', '48\" column', NULL, NULL, '0.00', 100),
(205, 'LBASALT-FPT-60', 'Large Basalt Column 60\" Polished Top', '60\"', '', '680.00', 'per each', '60\" column', NULL, NULL, '0.00', 100),
(206, 'BASALT-FSET', 'Basalt Fountain 2 Pcs/set - 2 Ft', '24\"', '', '345.00', 'per each', '24\" column', NULL, NULL, '0.00', 101),
(207, 'BASALT-FSET', 'Basalt Fountain 2 Pcs/set - 2 Ft', '36\"', '', '505.00', 'per each', '36\" column', NULL, NULL, '0.00', 101),
(208, 'BASALT-SCF', 'Special Carving Basalt 48\"', '48\"', '', '660.00', 'per each', '48\" column', NULL, NULL, '0.00', 102),
(209, 'SWIRL-PAT-BASALT-F', 'Swirl Basalt Fountain Dia 16\"', '16\"', '', '150.00', 'per each', '16\" wide', NULL, NULL, '0.00', 103),
(210, 'SWIRL-PAT-BASALT-F-24', 'Swirl Basalt Fountain Dia 24\"', '24\"', '', '2200.00', 'per each', '24\" wide', NULL, NULL, '0.00', 103),
(211, 'CAL-PLANTER-21-30', 'Calistoga Planter', '21\" Wide x 30\" High', NULL, '147.00', 'per each', '21\" x 30\"', NULL, NULL, '0.00', 104),
(212, 'CAL-PLANTER-13-22', 'Calistoga Planter', '13\" Wide x 22\" High', NULL, '60.00', 'per each', '13\" x 22\"', NULL, NULL, '0.00', 104),
(213, 'CUPER-PLANTER-16-32', 'Cuprtino Planter', '16\" Wide x 32\" High', NULL, '100.00', 'per each', '16\" x 32\"', NULL, NULL, '0.00', 105),
(214, 'CUPER-PLANTER-14-23', 'Cuprtino Planter', '14\" Wide x 23\" High', NULL, '69.00', 'per each', '14\" x 23\"', NULL, NULL, '0.00', 105),
(215, 'CUPER-PLANTER-22-39', 'Cuprtino Planter', '22\" Wide x 39\" High', NULL, '170.00', 'per each', '22\" x 39\"', NULL, NULL, '0.00', 105),
(216, 'LARKS-PLANTER-24-55', 'Larkspur Planter', '24\" Wide x 55\" High', NULL, '300.00', 'per each', '24\" x 55\"', NULL, NULL, '0.00', 106),
(217, 'LARKS-PLANTER-22-47', 'Larkspur Planter', '22\" Wide x 47\" High', NULL, '250.00', 'per each', '22\" x 47\"', NULL, NULL, '0.00', 106),
(218, 'LARKS-PLANTER-20-39', 'Larkspur Planter', '20\" Wide x 39\" High', NULL, '150.00', 'per each', '20\" x 39\"', NULL, NULL, '0.00', 106),
(219, 'LARKS-PLANTER-19-30', 'Larkspur Planter', '19\" Wide x 30\" High', NULL, '85.00', 'per each', '19\" x 30\"', NULL, NULL, '0.00', 106),
(220, 'OAKLAND-PLANTER-30-28', 'Oakland Planter ', '30\" Wide x 28\" High', NULL, '185.00', 'per each', '30\" x 28\"', NULL, NULL, '0.00', 107),
(221, 'OAKLAND-PLANTER-20-21', 'Oakland Planter ', '20\" Wide x 21\" High', NULL, '100.00', 'per each', '20\" x 21\"', NULL, NULL, '0.00', 107),
(222, 'OAKLAND-PLANTER-36-33', 'Oakland Planter ', '36\" Wide x 33\" High', NULL, '325.00', 'per each', '36\" x 33\"', NULL, NULL, '0.00', 107),
(223, 'WC', 'Lehigh White Cement 94 Lbs ', 'EA', NULL, '30.95', '94 LBS', 'EA', '', NULL, '0.00', 108),
(224, 'PGG', 'Perkgrout Grey', 'Bag', NULL, '26.00', '', 'Bag', '', NULL, '0.00', 109),
(226, 'PGT', 'Perkgrout Tan', 'Bag', NULL, '26.00', '', 'Bag', '', NULL, '0.00', 110),
(227, 'QKS', 'Quikrete Base Coat Stucco 60 Lbs ', 'EA', NULL, '10.00', '', 'EA', '', NULL, '0.00', 111),
(228, 'QKFSCM', 'Quikrete Base Coat Stucco 80 Lbs ', 'EA', NULL, '8.30', '', 'EA', '', NULL, '0.00', 112),
(229, 'QKFPC', 'Quikrete Fence Post Mix 80 Lbs', 'EA', NULL, '8.30', '', 'EA', '', NULL, '0.00', 113),
(230, 'QKA', 'Quikrete High Performance Blacktop Repair 50 Lbs ', 'EA', NULL, '19.25', '', 'EA', '', NULL, '0.00', 114),
(231, 'OKMM', 'Quikrete Masons Mix 80 Lbs ', 'EA', NULL, '11.90', '', 'EA', '', NULL, '0.00', 115),
(232, 'QKM', 'Quikrete Mortar Mix 80 Lbs', 'EA', NULL, '11.50', '', 'EA', '', NULL, '0.00', 116),
(233, 'GTS', 'Quikrete Thin Set Sanded - Gray 50 Lbs', 'EA', NULL, '19.00', '', 'EA', '', NULL, '0.00', 117),
(234, '47#C', 'Quikrete Portland Cement 94 Lbs', 'EA', NULL, '20.95', '', 'EA', '', NULL, '0.00', 118),
(235, 'QKPMSVMG', 'Quikrete Plastic Cement 94 Lbs', 'EA', NULL, '23.75', '', 'EA', '', NULL, '0.00', 119),
(236, 'CGS5035', 'Coregravel Driveway', 'EA', NULL, '68.00', '', 'EA', '', NULL, '0.00', 120),
(237, 'CGS3818', 'Coregravel Pathway', 'EA', NULL, '50.00', '', 'EA', '', NULL, '0.00', 121),
(238, 'GATORNW', 'Gator Geotextile Fabric ', 'EA', 'GatorGeotextileFabric.png', '160.00', '', 'EA', '', NULL, '0.00', 122),
(239, 'GATORNW', 'Gator Geotextile Fabric ', 'EA', 'GatorGeotextFabricView.jpg', '160.00', '', 'EA', '', NULL, '0.00', 122),
(241, 'PBB			', 'Plastic Bender Board 1\"x4\"x20’ ', 'EA', NULL, '36.75', '', 'EA', '', NULL, '0.00', 123),
(242, '24PBB			', 'Plastic Bender Board 2\"x4\"x20’ ', 'EA', NULL, '76.25', '', 'EA', '', NULL, '0.00', 124),
(243, 'PBBS', 'Plastic Bender Board Stakes', 'EA', NULL, '1.00', '', 'EA', '', NULL, '0.00', 125),
(244, '30S', '#0/30 Lapis Lustre Sand 100 ', 'EA', NULL, '23.75', '', 'EA', '', NULL, '0.00', 126),
(245, '20S', '#1/20 Lapis Lustre Sand 100 ', 'EA', NULL, '23.50', '', 'EA', '', NULL, '0.00', 127),
(246, '216S', '#2/16 Lapis Lustre Sand 100 ', 'EA', NULL, '23.50', '', 'EA', '', NULL, '0.00', 128),
(247, 'AZOMITEP', 'Azomite Powder 44 Lbs', 'EA', NULL, '32.50', '', 'EA', '', NULL, '0.00', 129),
(248, 'BOB1', 'Black Owl BIOCHAR 1 cu.ft ', '1 Cubit Foot', NULL, '43.50', 'cu ft', 'cf', '', NULL, '0.00', 130),
(249, 'BOBQ', 'Black Owl BIOCHAR 1 qt. ', '1 Quart', NULL, '18.50', 'qt', 'qt', '', NULL, '0.00', 130),
(250, 'BOBEUQ', 'Black Owl BIOCHAR ENV ULTRA 1 CF', '1 Cubit Foot', NULL, '43.50', 'cu ft', 'cf', '', NULL, '0.00', 131),
(251, 'BOBU!', 'Black Owl BIOCHAR ENV ULTRA 1 qt', '1 Quart', NULL, '18.50', 'qt', 'qt', '', NULL, '0.00', 131),
(252, 'BSF', 'Filled Burlap Sand Bag', 'EA', NULL, '4.00', 'ea', 'ea', '', NULL, '0.00', 132),
(253, 'QKSANDBAG', 'Prefilled Poly Woven Sand Bag 50 Lbs', 'EA', NULL, '6.00', 'ea', 'ea', '', NULL, '0.00', 133),
(254, 'ATOBL', 'Antigo Boulder', 'Per pound', NULL, '0.41', 'lbs', 'lbs', NULL, NULL, '1.00', 134),
(255, 'ATOBL', 'Antigo Boulder', 'Per ton', NULL, '810.00', 'ton', 'ton', NULL, NULL, '1.00', 134),
(256, 'BCBL', 'Boquet Canyon Boulder Per Lb', 'Per pound', NULL, '0.33', 'lbs', 'lbs', NULL, NULL, '1.00', 135),
(257, 'BCBL', 'Boquet Canyon Boulder Per Ton', 'Per ton', NULL, '650.00', 'ton', 'ton', NULL, NULL, '1.00', 135),
(258, 'CCB', 'Chiefcliff Boulder Per Pound', 'Per pound', NULL, '0.38', 'lbs', 'lbs', NULL, NULL, '1.00', 136),
(259, 'CCB', 'Chiefcliff Boulder Per Ton', 'Per ton', NULL, '750.00', 'ton', 'ton', NULL, NULL, '1.00', 136),
(260, 'CCFBP', 'Crawford Granite Boulder per pound', 'Per pound', NULL, '0.43', 'lbs', 'lbs', NULL, NULL, '1.00', 137),
(261, 'CFGB', 'Crawford Granite Boulder per ton', 'Per ton', NULL, '855.00', 'ton', 'ton', NULL, NULL, '1.00', 137);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `sku` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `url_key` varchar(255) DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `image_lens_size` json DEFAULT NULL,
  `extended` json DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `sku`, `url_key`, `title`, `description`, `image`, `image_lens_size`, `extended`, `status`) VALUES
(1, 'C2BR', 'class2baserock', 'Class 2 Base Rock', '<p>Class 2 Base Rock is a recycled product composed of fines and 3/4\" crushed concrete. It is used underneath foundations, pathways, patios, and driveways. It is also used as a base underneath concrete and asphalt. Class 2 Base Rock meets the Cal Trans spec.</p>\r\n<p>We sell the Class 2 Base Rock in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your Bay Area location. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Class 2 Base Rock may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'class2baserock.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(2, '34C2P', 'class2permeableBaserock', 'Class 2 Permeable Base Rock', '<p>Class 2 Base Rock is a recycled permeable product composed of 3/4\" crushed concrete and minimal fine stones allowing it to be water permeable. It is used underneath foundations, pathways, patios, and driveways or wherever permeability and stability are desired. Class 2 Permeable Base Rock meets the Cal Trans spec.</p>\r\n<p>We sell the Class 2 Permeable Base Rock in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck, or for a fee, have us deliver the base rock to your location in the Bay Area. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Class 2 Permeable Base Rock may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'class2permeableBaserock.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(3, '14PG', 'oneQuarterInchPeaGravel', '1/4\" Pea Gravel ', '<p>1/4&quot; Pea Gravel is commonly used for pathways, driveways, dog runs, playgrounds, patios, and as ground cover. The smaller gravels are often used on roofs over tar.  Underground applications include drainage and pipe bedding materials for stable support.</p>\r\n<p>Please note: 1/4&quot; Pea Gravel vendor source is currently different than our previous source. Therefore, the gravel may vary in appearance. </p>\r\n<p>We sell the 1/4\" Pea Gravel in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your own truck,  or for a fee, have us deliver to your Bay Area location. For orders over 20 tons please call us for direct pricing.</p>\r\n<p>1/4&quot; Pea Gravel may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'oneQuarterInchPeaGravel.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(4, 'AFBF', 'arizona-flagstone-buckskin', 'Arizona Flagstone - Buckskin', '<ul class=\"product-details\">\r\n<li class=\"item-details\">Origin: North America</li>\r\n<li class=\"item-details\">Classification Sandstone</li>\r\n<li class=\"item-details\">Color Range: Warm Tones</li>\r\n<li class=\"item-details\">Finish: Natural Cleft</li>\r\n<li class=\"item-details\">Applications: Walkways, Pathways, Patios, Accents</li>\r\n</ul> \r\n\r\n\r\n<p>Arizona Flagstone is a standup select grade flagstone that is available in large sheets of random shapes. It can be used for patios, stepping stones or any flat surface that you want to cover with flagstone. Due to the natural cleft and the porosity, this natural paving stone spalls, meaning, the top layer of the stone peels off with wear. In a shady damp area, particularly in winter months, algae and moss growth which can permanently stain the stone. Some landscapes desire this look but to deter algae and moss growth, use a stone sealer.</p><p>This sedimentary sandstone is available in a variety of southwest colors: Sedona Red, Rosa, Peach, Buckskin, Buff, Classic Oak, and variations in between.</p>\r\n<p>Available in two thickness: 1&quote;-1  3/4 &quote; and thinner 1&quote; minus.</p>\r\n<p>For sand setting application, use the thicker 1&quote; - 1  3/4 &quote; flagstone.\r\nFor the 1&quote; minus flagstone, special care needs to be taken since the stone is very fragile and brittle. It is intended to be set in mortar on a concrete base to protect it from cracking</p>', 'arizona-flagstone-buckskin.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(5, '14-FB', '14-fur-bark', '1/4\" - Fir Bark', '<p>1/4 &quot; Fir Bark is the smallest remaining particles from sifting the fir barks. Mix in with clay soil to loosen and aerate as an organic amendment. Provides moisture retention and aeration. Due to the small size of the bark, breaks down faster than Fine Redwood Amendment.</p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p>', '14-fur-bark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(6, '1OS', '1-olympia-sand', '#1 Olympia Sand', '<p>Olympia Sands is used primarily for making mortar or stucco. However, Olympia Sand #1 is screened and washed. It is highly desirable for children\'s sandboxes, playgrounds, and the sand used for volleyball courts.</p><p>Lyngso Garden Materials sell #1 Olympia Sand in one cubic foot bags.  We supply the bags and you fill them! For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your jobsite. For orders over 20 tons please call us for direct pricing.</p><p>#1 Olympia Sand may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', '1-olympia-sand.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(7, '2OS', '2-olympia-sand', '#2 Olympia Sand', '<p>Olympia Sand #2 is used for making plaster, mortar or stucco and can also be used for sandboxes.  It is a more coarse material than Olympia Sand #1, which provides it with better construction properties.</p><p>We sell both Olympia Sand #1 and Olympia Sand #2 in one cubic foot bags.  Lyngso will supply the bags and you can fill as many as you need. For larger areas, you\'ll want to purchase Olympia Sand by the ton. We can load your truck for you, or for a fee, you can use our rental truck and load the sand on your own, or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>#2 Olympia Sand may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', '2-olympia-sand.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(8, 'CS', 'concrete-sand', 'Concrete Sand', '<p>Concrete sand, also known as top sand, is a coarse washed and screened sand. It is used as a base for setting stones, pavers, and bricks. Concrete Sand packs together well and will not wash out as easily as finer sands.</p><p>We sell the Concrete Sand in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your jobsite. For orders over 20 tons please call us for direct pricing.</p>', 'concrete-sand.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(9, 'CBSB', 'connecticut-blue-stone', 'Connecticut Bluestone, True Blue', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Metamorphic Sandstone</li>\r\n<li>Color Range: Greys, Blues, Greens</li>\r\n<li>Finish: Natural Cleft</li>\r\nApplications: Walkways, Pathways, Patios, Accents</li>\r\n</ul>\r\n\r\n<p>Connecticut Bluestone is a classic East Coast paving stone that\'s been used for centuries, dating back to the 1800s. Denser sandstone that has been tested through the times.  A metamorphic sandstone with consistent blue-grey colors. Thickness ranges from 1 inch to 2 inches. Full pallet can weigh between 1.25 tons to 2.25 tons. This bluestone is standup select with sizes that vary from 1.5 sq. ft. to upwards of 20 sq. ft.</p>', 'connecticut-blue-stone.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(10, 'AL', 'azure-limestone', 'Azure Limestone', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Limestone</li>\r\n<li>Color Range: Blues, Grays</li>\r\n<li>Finishes: Natural Cleft</li>\r\n<li>Applications: Walkways, Pathways, Patios, Accents</li>\r\n</ul>\r\n\r\n<p>Azure Limestone is a great alternative for Connecticut Bluestone True Blue. 2\" thickness.</p>', 'azure-limestone.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(11, 'GBLT', 'galaxy-black-limestone', 'Galaxy Black Limestone', '<ul>\r\n<li>Origin: Asia</li>\r\n<li>Classification: Limestone</li>\r\n<li>Color Range: Blacks</li>\r\n<li>Finishes: Tumbled Natural Cleft</li>\r\n<li>Applications: Walkways, Pathways, Patios, Veneers, Accents</li>\r\n</ul>\r\n\r\n<p>Galaxy Black Tumbled flagstone are limestone with striking matte black hues. The flagstones are tumbled to soften the edges. Nominal 2\" thickness.</p>', 'galaxy-black-limestone.jpeg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(12, 'LGS', 'luna-gray-sandstone', 'Luna Grey Sandstone', '<ul>\r\n<li>Origin: Asia</li>\r\n<li>Classification: Sandstone</li>\r\n<li>Color Range: Grays</li>\r\n<li>Finishes: Natural Cleft</li>\r\n<li>Application: Walkways, Pathways, Pavers, Veneers, Patios, Accents</li>\r\n</ul>\r\n\r\n<p>Luna Grey Flagstone are a light grey colored sandstone. 2” thickness.<p>', 'luna-gray-sandstone.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(13, '516RL', '5-16-horticultureLava', '5/16\" Horticulture Lava', '<p>Light weight horticultural lava. Use as an amendment to aerate soil mixes. Great for creating custom potting mixes for succulents, cacti, orchids, and plants that require ample drainage.</p><p>We sell the lava in one cubic foot bags, we supply the bags and you fill them. For large areas you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p>', '5-16-horticultureLava.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(14, 'LIGNA PEAT', 'lingaPeat', 'Ligna Peat', '<p>Ligna Peat is 100% pure, organic, and sustainably harvest redwood fiber. A sustainable alternative to Peat Moss. Ligna Peat provides beneficial organic matter for a sustained period of time without rapid decomposition. Commonly used for aeration and water retention within the soil. </p><p>We sell Ligna Peat in one cubic foot bags, we supply the bags and you fill them. For large areas you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p><p>Ligna Peat is CDFA OIM listed for organic use and is a FSC certified product.</p>', 'lingaPeat.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(15, 'ORGANIC-AMENDMENT', 'organicAmendmentMix', 'Organic amendment Mix', '<p>Organic Amendment Mix is a blend of Organic Green Waste Garden Compost, Redwood Sawdust, and Organic Feather Meal. This mix is generally used for improving most soils in water retention and aeration. Amendment Mix helps to open up clay for rainwater to be held and to be moved through the soil. Excellent for new sod installations and for generic all-purpose soil amending. </p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending. </p><p>Lyngso\'s Organic Amendment Mix is an organic substitute for Nitrolized Redwood Amendment. </p><p>CDFA OIM LISTED FOR ORGANIC USE</p><p>We sell the Organic Amendment Mix in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site. For orders over 20 cubic yards, please call us for direct pricing.</p>', 'organicAmendmentMix.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(16, 'RS', 'redwoodSawdust', 'Redwood Sawdust', '<p>Redwood Sawdust is an all-natural redwood byproduct of the lumber mills. Not treated with any chemicals.  It is typically used as a soil amendment to help break up clay and aerate compacted soil.</p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending. </p><p>We sell the Redwood Sawdust in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site</p>', 'redwoodSawdust.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(17, 'COMPOST-MULCH', 'compostMulch', 'Composted Mulch - Limited Quantity', '<p>Composted Mulch is derived from composted wood from composting green waste facility. This material has been through a 9–20-week composting process. During the composting period, accepted thermophilic composting procedures are performed to accomplish pathogen reduction through time and temperature (130-170 degrees (F) throughout the composting period). This ensures a thoroughly composted, weed and pathogen free product. </p><p>Composted Mulch is screened to 1”-3’’ in size and contains fines. Although Composted Mulch is listed as OMRI organic, it is still a recycled product so it may occasionally contain small inert debris such as plastic or glass.</p><p>Compost Mulch is an excellent ground cover that greatly enhances the aesthetic appearance of landscapes. Composted Mulch can help retain moisture, control weeds, and help prevent erosion. In addition, this Composted Mulch has demonstrated to be less combustible and less floatable compared to other wood mulches. </p><p>Composted Mulch is also considered as a no-float mulch and is highly recommended for use in Bioretention areas. Composted Mulch is OMRI listed organic as a soil amendment and a weed and disease control product. </p> <p>Composted Mulch complies with SB 1383 requirements and is produced in a fully permitted composting facility conforming to the State of California regulations set forth by the California Integrated Waste Management Board (CIWMB) Title 14, Division 7 California Code of Regulations governing composting operations. </p> <p>Limited quantity available. </p>', 'compostMulch.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(18, 'GRB', 'groundRedwoodBark', 'Ground Redwood Bark ', '<p>Ground Redwood Bark is the bark from redwood trees that have been double ground. It is a stringy, fluffy, and fibrous bark that ranges in size around 1-2 inches and less. Often referred to as \"Gorilla Hair\" or \"Monkey Fur\". However, our Ground Redwood Bark is double ground and has finer texture. It does hold onto water and is lightweight. Not recommended for windy areas or steep slopes. Depending on the grade, holds well in moderately sloped areas. Great for indoor or outdoor potted plants. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee you can use our rental dump truck or have us deliver the bark to you. For large orders over 60 yards please call for a direct price.</p><p><a href=\"https://www.youtube.com/watch?v=W_xlAV7gKjI\" target=\"blank\">Information Link</a></p>', 'groundRedwoodBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(19, 'MA CHIP', 'mahoganyChip', 'Mahogany Chip', '<p>Mahogany Chip is an attractive processed wood product that\'s dyed with a natural UV protectant color, ferric oxide. Clean byproduct from sawmills, no post consumer wood is used. Therefore, no paints or toxins in the mulch. Great for commercial applications or wherever longevity of the vibrant color is desired. Mahogany Chip varies in size quite drastically, from 2\" to 6\" but typically stays towards the smaller size. Our batches vary from day to day, so it\'s best to check with us directly if you need to match a specific size. If you are trying to match your exiting Mahogany Chip, consider taking a trip to our yard to verify the size before your purchase.  Although Mahogany Chip will retain its color longer than most non-colored chips, in rainy season however, the color could wash away when it is exposed to water or sits in water for an extended period of time. It is advisable to install the chips once the rains have passed.</p><p>We sell the mulch in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the mulch by the cubic yard. We can load your truck or for a fee, have us deliver the mulch to your home or jobsite. For orders over 50 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=D8gjB759-hQ\" target=\"blank\">Information Link</a></p>', 'mahoganyChip.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(20, 'MMFB', 'miniMulchFirBark', 'Mini Mulch Fir Bark', '<p>Mini Mulch Fir Bark is 1/4-3/8 inch in size. The sun fades the natural red bark to a weathered grey over time. Often mistaken for redwood, it is indeed the bark of fir trees. Very attractive and popular mulch for vegetable garden beds. The Mini Mulch will decompose faster than larger mulch and will eventually turn into organic soil amendment.</p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to you. For orders over 45 yards please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=aBKZYxsMf90\" target=\"blank\">Information Link</a></p>', 'miniMulchFirBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(21, 'MOCHA CHIP', 'mochaChip', 'Mocha Chip', '<p>Mocha Chip is an attractive processed redwood that\'s dyed with a natural UV protectant color, ferric oxide. It\'s a clean byproduct from sawmills, no post-consumer wood is used. Therefore, no paints or toxins in the mulch. Great for commercial applications or wherever longevity of the vibrant color is desired. Mocha Chip varies in size quite drastically, from 2\" to 6\" but typically stays towards the smaller size. </p><p>Our shipment varies from day to day, so it\'s best to check with us directly if you need to match a specific size. If you are trying to match your exiting Mocha Chip, consider taking a trip to our yard to verify the size before your purchase.  Although Mocha Chip will retain its color longer than most non-colored chips, in the rainy season, however, the color could wash away when it is exposed to water or sits in water for an extended period of time. It is advisable to install the chips once the rains have passed.</p><p>Freshly produced Mocha Chips may be subject to colorant wash off and can stain driveways. Therefore, it is recommended that the mulch is dumped on a tarp. The colorant can also stain clothing or be tracked onto carpet or furniture by pets. </p><p>We sell the mulch in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the mulch by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 50 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=I1ZOsWuYzzs\" target=\"blank\">Information Link</a></p>', 'mochaChip.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(22, 'PF', 'playgroundFiber', 'Playground Fiber', '<p>Playground Fiber is engineered natural wood that is 1/2\" - 1\" in size. Made out of California white conifers, the fiber is processed to have elongated blunt or soft chopped ends, therefore, more resistant to splintering. Chips do not contains any toxins or chemical additives. No recycled by-products, processed woods or fillers are used. Meets ADA, ASTM and CPSC playground surfacing standards for impact absorption, accessibility and safety. Approved for use in public playgrounds, parks or pathways. </p><p>We sell the Playground Fiber in one cubic foot bags, we supply the bags you fill them. For larger areas, you\'ll want to purchase the Playground Fiber by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 45 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=EJ1EtKcxSno\" target=\"blank\">Information Link</a></p>', 'playgroundFiber.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(23, 'PAM', 'premiumArborMulch', 'Premium Arbor Mulch', '<p>Premium Arbor Mulch is 100% clean tree trimming from local urban forests. The tree trimmers and arborists dropping off the trimmings and wood are monitored closely for quality. Mulch contains a conglomerate of bark, wood chips, and some leaves. Provides protection and food for the life in your soil. Mulch will eventually decompose and will turn into organic soil amendment over time. Depending on the grade, holds well in moderately sloped areas. Excellent for Sheet Mulching applications! Click on the Information Link below to learn more about Sheet Mulching!</p><p>We sell the mulch in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the mulch by the cubic yard. We can load your truck or for a fee, have us deliver the mulch to your home or jobsite. For orders over 50 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.lyngsogarden.com/community-resources/sheet-mulching/\" target=\"blank\">Information Link</a></p>', 'premiumArborMulch.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(24, 'SCB', 'shreddedCedarBark', 'Shredded Cedar Bark', '<p>Shredded Cedar Bark is a stringy, and fibrous bark that ranges in size around 1-3 inches and less. Bark originates from lumber from cedar trees. Practical and attractive mulch for most applications in your landscape. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to your home or jobsite. For large orders over 60 cubic yards, please call for a direct price.</p><p><a href=\"https://www.youtube.com/watch?v=z3OEKGpTf-4\" target=\"blank\">Information Link</a></p>', 'shreddedCedarBark.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(25, 'SFB', 'smallFirBark', 'Small Fir Bark', '<p>Small Fir Bark is often mistaken for redwood, it is indeed the bark of fir trees. An attractive and popular mulch for most landscapes. The sun fades the natural red fir bark to a weathered grey over time. Mulch will eventually decompose and will turn into an organic soil amendment over time.  </p><p>Small Fir Bark is 1/2\"-2\" in size and has some variation. Please check the physical inventory in our yard before ordering. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to you. For orders over 45 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=i3Dd3WTvRjY\" target=\"blank\">Information Link</a></p>', 'smallFirBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(26, 'WOB', 'walkOnBark', 'Walk On Bark ', '<p>Walk on Bark is mostly a mixture of 1\"-3\" red/brown fir bark nuggets and cambium. There could be some much larger pieces of material mixed in, from time to time and the consistency of the Walk on Bark varies from batch to batch.  Clean byproduct from sawmills, no post consumer wood is used. When Fir Bark is the desired visual effect, Walk on Fir Bark is a beautiful and economical alternative to Small Fir Bark and Mini Mulch Fir Bark, to mulch your landscape project. Great for pathways and walkways. </p><p>We sell the bark in one cubic foot bags, we supply the bags and you fill them. For large areas, you\'ll want to purchase the bark by the cubic yard. We can load your truck or for a fee, have us deliver the bark to your home or jobsite. For large orders over 60 cubic yards, please call for a direct price.</p>', 'walkOnBark.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(27, 'TWC', 'woodChips', 'Wood Chips', '<p>Wood Chips are primarily redwood and may contain a small amount of fir that are 1/2\"-1\" in size. Lighter colored mulch that will darken with age and has a sheen. Great for pathways, walkways, and larger landscaped areas. Wood Chips take longer to decompose than other mulch so can be used in areas where mulch needs to last for a while. </p><p>We sell the Wood Chips in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase the wood chips by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 45 cubic yards, please call us for direct pricing.</p><p><a href=\"https://www.youtube.com/watch?v=a1zr7dEPtM0\" target=\"blank\"></a></p>', 'woodChips.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(28, 'AACT', 'activelyAeratedCompostTea', 'Actively Aerated Compost Tea', '<p>Actively Aerated Compost Tea (AACT) is a liquid concentrate containing all the beneficial microbial components that compost is famous for.  These living beneficial microbes are the biology that drives the soil food web in a healthy functioning soil.  The soil food web is responsible for:</p>\r\n<ul>\r\n<li>Nutrient cycling break-down and reuse of organic sources of plant nutrition, and their holding capacity in the soil.</li><li>Improved soil structure - through the formation of soil aggregates.</li><li>Increased porosity - resulting in better aeration and water retention.</li><li>The degradation of soil pollutants and pH buffering.</li>\r\n<ul>\r\n\r\n<p>Inorganic (chemical) fertilizers, pesticides, herbicides, and mechanical compaction damage these beneficial soil microbes and reduce or delete the benefits of a healthy soil food web.  This breakdown of microbial functioning can be the cause of poor plant growth and color, low resistance to garden pests and pathogens, and decreased fruit and vegetable production. Without the re-introduction of the beneficial microbes found in well-made compost, garden maintenance becomes a dependent cycle of chemical inputs and controls, spreading pesticide pollution by air and leaching through the soil to pollute our groundwater, creeks, and bay waters.</p><p>The tea made here at Lyngso Garden Materials, Inc is specifically called Actively Aerated Compost Tea (AACT) in reference to the careful brewing process that maintains oxygen levels necessary for aerobic functioning.</p><p>AACT is composed of living biology and is therefore very sensitive to heat, sunlight, and oxygen loss and should be protected until applied; no more than a few hours at the most, from purchase.  If you detect \"bad\" or rotten smells, do not use the tea, as the biology has been damaged and will contain harmful by-products of anaerobic reproduction.</p><p>AACT can be used full strength or diluted up to 1:4. If chloramine-treated city water is used for dilution the water must be pre-treated using Amquel or another aquarium product that breaks down the chloramine.  Another treatment to neutralize the chloramine is by mixing a small amount of liquid humates (Humic Acid) into the city water before putting the AACT in. Application can be made manually with a watering can to the soil.  Rinse out the container and let it air dry.</p><p>It is important to provide food for the biology if you use AACT as a soil drench.  A liquid fertilizer such as Native Nutrients Fish Hydrolysate or Native Nutrients Kelp may be added to the AACT before applying.   A 1\" layer of compost and mulch will provide additional food for the organisms.</p><p>Tea brewing & compost production are under the direction of Alane Weber, Certified Adviser for the Soil Food Web, Inc (www.soilfoodweb.com) and are regularly tested for microbial health and diversity.  Test results are available upon request.</p>\r\n<ul><li>AACT is not for human or animal consumption.</li><li>Do not apply AACT directly onto food crops.</li><li>Wash your hands with soap and water after applying AACT.</li></ul><p></p>\r\n<p>Actively Aerated Compost Tea (AACT) Pricing:</p><ul><li>$12.00 per gallon (if less than 18 gallons)</li><li>$10.00 per gallon (if 18 gallons or more in your own bulk container. No one-gallon containers please.)</li></ul><p>One gallon and three-gallon containers are available for purchase and if cleaned, can be reused.</p><ul><li>1-gallon containers $3.00</li><li>2.5-gallon containers $8.00</li></ul><p></p><p>Actively Aerated Compost Tea (AACT) is available on a first-come-first-served basis. To ensure we have the quantity you need, we suggest you place your bulk orders before Tuesday at noon for our Wednesday and Thursday brew. </p><p>If you would like to be on our weekly email notification schedule for our Actively Aerated Compost Tea (AACT) please subscribe to our AACT Email list under the Community Resources tab and find the AACT article. Or click the link below.</p><p><a href=\"https://www.lyngsogarden.com/community-resources/actively-aerated-compost-tea-aact/\" target=\"blank\"></a></p>', 'activelyAeratedCompostTea.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Inactive'),
(29, 'BBBC', 'busBlendBiodynamicCompost', 'Bu’s Blend Biodynamic Compost ', '<p>A Demeter(R) USA certified biodynamic compost. Contains no GMOs, pesticides, sewage sludge, growth hormones or synthetic chemicals. Acts as an alternative to chemical, synthetic, and \"faux\" organic soil amendments. Excellent compost to feed your soil.</p><p>Ingredients: Dairy cow manure, straw, wood chips, and concentrations of yarrow, chamomile, valerian, stinging nettle, dandelion, and oak bark.</p><p>For good soil & seasonal care: Spread 1/2\" to 1\" of Bu\'s Blend over planting area (for edibles and grass), watering well (for roses and other bushes), or drip line (for larger trees). Water in (or let the rain do it for you) and let the microbes do the work. Repeat every 3-4 months.</p><p>For poor soil: Break up the soil and apply up to 2\" of Bu\'s Blend on top. Water deeply & repeat every 2 weeks or so until soil improves. The water will draw beneficial microbes deep into the soil, where they will work to improve soil structure and vitality.</p>', 'busBlendBiodynamicCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(30, 'DDOC', 'doubleDoodyOrganicCompost', 'Double Doody Organic Compost', '<p>Double Doody Compost is an earthy blend of nutrient-rich horse and cow manure.</p><p>Adds vigor to plants, promotes root growth, aids water penetration, and improves the structure and quality of the soil.</p><p>Perfect for veggies, shrubs, trees, plants, and gardens, Point Reyes Double Doody is an excellent top dressing to help protect roots and soil from temperature damage. Lab-tested for the highest nutrient value, Double Doody has an excellent carbon to nitrogen ratio and iron reserve, and can assist in correcting any degree of deficiency of phosphorous, potassium and sulfate. Its stability and maturity means the rich nutrients are readily available – little of this stout stuff goes a long, long way.</p><p>Nutrient-wise, it offers three basic elements critical to plant health: nitrogen, phosphorus, and potassium. Nitrogen allows plants to produce the proteins needed to build living tissue for green stems, strong roots, and lots of leaves. Phosphorus helps move energy throughout the plant, especially important in maturing plants. Potassium aids plants in adapting sugars needed in growth and is especially helpful in root crops.</p><p>Double Doody Compost is CDFA OIM listed for organic use. </p>', 'doubleDoodyOrganicCompost.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(31, 'HOWC', 'heritageOrganics', 'Heritage Organics Worm Castings', '<p>Heritage Organics® Premium Quality Organic Worm Castings are an all-in-one Soil Amendment that is safe for the environment, children and pets. For millions of years earthworms have continued the “Cycle of Fertility” by converting organic matter into vermicompost. Odorless. Great for indoor/outdoor use. CDFA & OMRI listed for organic use.</p>\r\n<p>APPLICATION RATES:</p><ul><li>Vegetable Gardens – Till in 1/2\" of worm castings or top dress with 1\" of worm castings around plants. Re-apply every 3 to 6 month with 1/2\" of worm castings.</li><li>Potting Mix – Mix in 1 part of worm castings to every 4 parts of potting soil</li><li> House Plants & Flower Beds – Apply 1/2\" of worm castings at the beginning of spring, summer & fall. Till in worm castings if possible.</li><li>New & Established Lawns – Apply 10 pounds per 100 square feet. Water lawns as usual.</li><li>Fruit Trees – Apply 1/2\" – 1\" of worm castings under half the diameter oft he trees canopy. Till in if possible.</li><li>Worm Castings are perfect for a plant tea. Mix 2 cups castings with 5 gallons of water. Let steep for 1 hour and feed plants.</li></ul><br /><p>INGREDIENTS: Worm Castings</p>', 'heritageOrganics.png', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(32, 'SCCOB', 'seaCoastCompost', 'Seacoast Biodynamic Compost ', '<p>SeaCoast Compost is a premium, Biodynamic® compost crafted from the finest combination of sea and land ingredients. We gather the “waste” from three iconic Oregon coast industries and use these high-quality inputs to create nutrient-rich compost. The mixture includes fish, shrimp and crab leftovers from seafood processing, alder hardwood from the lumber industry, and cow manure and bedding from organic dairies. They add homeopathic preparations to enliven the compost and stimulate plants to maximize their effectiveness in their environments. The resulting compost offers a feast for your soil and plants.</p><p>SeaCoast Biodynamic Compost is available in 1 cubic foot bags.</p>', 'seaCoastCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(33, 'OBULL', 'oregonBullOrganicAgedHumus', 'Oregon Bull Organic Aged Humus - Special Order', '<p>AVAILABLE BY SPECIAL ORDER ONLY. Order minimum is 12 cubic yards. </p><p>Oregon Bull Organic Aged Humus is not compost but rather humus - it is the manure of cattle that have been left to decompose over time. The manure comes from an old feed yard where animals were grass-fed and barley finished. This was before the days of GMOs, hormones, and antibiotics. The process of humification is much slower than composting and involves a greater diversity of microbes including fungi. You will notice on the Soil Food Web Report that the Oregon Bull Organic Aged Humus has a higher fungal count than compost, it has a more diverse soil food web and will benefit a wide range of plants.</p><p>The Oregon Bull Organic Aged Humus can be used for food crops including vegetable gardens, fruit trees, berries and as well as roses and perennials. As with all composts and worm castings, you can apply the Humus as a top dressing but then do apply mulch on top to protect it from the sun, wind, and rain.</p><p>Due to the fine nature of the humus, you will find that it may shed water if it is dry. If you incorporate it into the soil lightly that will help to remoisten it.  If you are side dressing then wet the soil, apply the Oregon Bull, then apply a 2-3\" layer of mulch, and then water the mulch. It will supply soluble nutrients and lots of life. A 3/8\"-1/2\" layer on top of the soil followed by mulch is all you need for most plants. If incorporating it into the soil 1/2\" - 1\" of Oregon Bull to a depth of 6-8\" soil is sufficient from a wide range of plants. If planting vegetables, go with a higher rate of 1\" and incorporate to a depth of 6-8\" of soil.</p><p>We sell the Oregon Bull Organic Aged Humus in one cubic foot bag, we supply the bags, you fill them. For larger areas, you will want to purchase the Humus by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.</p><p>Oregon Bull Organic Aged Humus is OMRI and CDFA OIM listed for organic use.</p>', 'oregonBullOrganicAgedHumus.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(34, 'OAM', 'organicAmendmentMix-1', 'Organic Amendment Mix', '<p>Organic Amendment Mix is a blend of Organic Green Waste Garden Compost, Redwood Sawdust, and Organic Feather Meal. This mix is generally used for improving most soils in water retention and aeration. Amendment Mix helps to open up clay for rainwater to be held and to be moved through the soil. Excellent for new sod installations and for generic all-purpose soil amending. </p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending. </p><p>Lyngso\'s Organic Amendment Mix is an organic substitute for Nitrolized Redwood Amendment. </p><p>CDFA OIM LISTED FOR ORGANIC USE</p><p>We sell the Organic Amendment Mix in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site. For orders over 20 cubic yards, please call us for direct pricing.</p>', 'organicAmendmentMix.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(35, 'DIESTEL', 'OrganicDiestelStructuredCompost', 'Organic Diestel Structured Compost ', '<p>Diestel Structured Compost delivers vitality to the soil. Diestel Structured Compost is completely finished and is not a hot compost. The ingredients are sourced directly from the Diestel family turkey ranch where turkeys are allowed to develop at a natural growth rate. The carbon used to make the Diestel Structured Compost comes from forest trimmings from the Sierra Nevada Foothills. The compost is given time and consistent attention to develop into a dark brown, fresh-smelling, living compost ready to add life and feed your plants. </p><p>For additional organic fertilizer and microbiology, mix in We sell the Diestel Structured Compost in one cubic foot bag, we supply the bags, you fill them. For larger areas, you will want to purchase the Garden Compost by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.\r\n</p><p>Diestel Structured Compost is CDFA OIM listed for organic use.</p>', 'OrganicDiestelStructuredCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(36, 'OC', 'organicGreenWasteGardenCompost', 'Organic Green Waste Garden Compost', '<p>Garden Compost is composted green waste and is OMRI and CDFA listed as organic. It is a rich amendment that is especially good for improving soils that are too sandy and drain too fast as well as to amend clay soil. Garden Compost is still warm, so spread it out on the surface or mix into your existing soil.  Spread the Garden Compost to a depth of 2 inches and mix in with your soil. </p><p>Although the Garden Compost is listed as CDFA OIM, it is still a recycled product so it may occasionally contain small inert debris such as plastic or glass. Therefore, we don\'t recommend it for organic food production. If you are looking for compost to grow organic vegetable, please consider using our Organic Diestel Structured Compost. </p><p>We sell the Garden Compost in one cubic foot bags, we supply the bags, you fill them. For larger areas, you will want to purchase the Garden Compost by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.</p><p>Garden Compost is OMRI and CDFA listed for organic use.\r\n</p><p>Organic Green Waste Garden Compost complies with SB 1383 requirements and is produced in a fully permitted composting facility conforming to the State of California regulations set forth by the California Integrated Waste Management Board (CIWMB) Title 14, Division 7 California Code of Regulations governing composting operations.</p>', 'organicGreenWasteGardenCompost.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(37, 'WEBB', 'webRanchPremiumCompost', 'Webb Ranch Premium Organic Compost ', '<p>Webb Ranch Premium Organic Compost is screened and aged over 6 months. Compost is weed-free, smells earthy, and is an invaluable addition to any garden because it improves soil structure. The primary soil food is organic matter and compost is the best way to provide it— making Webb Ranch Compost a key component of successful gardens.  \r\nWebb Ranch Premium Organic Compost is made from fine wood shavings, horse manure, hay, and green waste from Webb Ranch’s organic farm.  It is ideal for use in vegetable gardens, flower beds, around trees and shrubs, and on lawns.  Add it to the soil at the time of planting, side-dress your existing plants, or use it as a surface mulch and watch your garden thrive!\r\n</p><p>Although the Garden Compost is listed as CDFA OIM, it is still a recycled product so it may occasionally contain small inert debris such as plastic or glass. Therefore, we don\'t recommend it for organic food production. If you are looking for compost to grow organic vegetable, please consider using our Organic Diestel Structured Compost. </p><p>How to Use: </p><p>Amending Soil: Work 1-2 inches of compost into the top 3-5 inches of soil.</p><p>Growing Fruit and Vegetables- Spread 1-2 inches of compost on top of the garden bed in the Fall.  Till it into the soil in the Springtime.  Add ½ inch of compost monthly as plants begin to grow quickly.</p><p>Lawn: For new lawns, add up to 3 inches of compost into the soil and till to a depth of 5-7 inches.  For existing lawns, incorporate 1 inch of compost into the bald spots before reseeding.  You can also topdress lawns with ¼ inch of finely screened compost.  Rake the compost evenly throughout the grass area.  Over time the compost will improve the soil, reducing the need for other products.</p><p>New and Existing Plants: When planting, work 1 inch of compost into the top 2 inches of soil in and around the planting hole.  Apply 1-2 inches of compost as a mulch around new and existing plants in early Spring or Fall to improve the soil, prevent weeds, and help retain moisture.  You can also gently till compost into the soil once or twice a year.  Do not place compost directly against the stem or trunk of a plant, which could cause rot or invite pests.</p><p>Compost Coverage: 2 cubic feet of compost will cover approximately 24 square feet at a depth of 1 inch.</p><p>We sell the Webb Ranch Premium Organic Compost in one cubic foot bag, we supply the bags, you fill them. For larger areas, you will want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 40 cubic yards, please call us for direct pricing.</p><p>Webb Ranch Premium Organic Compost is CDFA OIM listed for organic use. </p>', 'webRanchPremiumCompost.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(38, 'BIOSWALE', 'biotreatmentSoilMix', 'Biotreatment Soil Mix', '<p>Biotreatment Soil Mix is very effective at filtering stormwater runoff before it enters our storm drains and waterways. The process of running the storm or runoff water through the Biotreatment Soil Mix allows the water to be cleaned up by the biology and filtered so pollutants and sediments are much reduced. The Biotreatment Soil Mix will support many vernal and riparian plant communities, the roots of the plants will also help clean up the stormwater runoff. The quality of water going into our streams, creeks, bay and ocean will be much improved creating a much healthier habitat for our native amphibians and fish.</p><p>Our Biotreatment Mix meets the “Soil Specifications: criteria approved by the Executive Officer of the San Francisco Bay Regional Water Quality Control Board on April 18, 2016, in accordance with Provision C.3.c.i.(2)(c)(ii) of the Municipal Regional Stormwater Permit (MRP). Meets BASMAA and SFPUC specifications. </p>', 'biotreatmentSoilMix.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(39, 'BBBPS', 'babyBuBiodynamicPottingSoil', 'Baby Bu\'s Biodynamic Potting Mix', '<p>Baby Bu bursts with premium materials specially blended with Bu\'s Blend(TM) Biodynamic(R) Compost to Support plant & soil life in your raised beds, pots, container gardens, hanging baskets, and houseplants.</p><p>Baby Bu\'s(TM) Biodynamic(R) Blend Potting Soil:</p><ul><li>Contains no GMOs, pesticides, sewage sludge, growth hormones, or synthetic chemicals</li><li>Acts as an alternative to chemical, synthetic, and \"faux\" soil amendments</li><li>Aids in the proliferation of beneficial soil microbes</li><li> Is ideal for seeds, seedlings, & transplants</li><li>Saves water through proper moisture absorption at the surface and dissipation at the root levels</li><li>Is safe and non-toxic for your kids, your pets, and our planet.</li></ul><br/><p>Ingredients:</p><p>Coir, compost (composted organic dairy cow manure, wood chips, straw, concentrations of yarrow, chamomile, valerian, stinging nettle, dandelion, & oak bark), fir bark, perlite, worm castings, soybean meal, fish meal, fish bone meal, langbeinite, alfalfa meal, crab meal, green sand, neem seed meal, volcanic ash, biochar & kelp meal. </p><p>Baby Bu\'s Biodynamic Potting Mix is available pre-bagged in 1.5 cubic foot.</p>', 'babyBuBiodynamicPottingSoil.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(40, 'DEANPP', 'downToEarchAllNaturalPottingSoil', 'Down To Earth All Natural Potting Soil', '<p>Our blend of premium organic ingredients makes Down To Earth™ All Natural Potting Soil an excellent all purpose mix for seed starting, transplanting or container gardening. It’s ideal for vegetables, flowers, houseplants and trees in indoor and outdoor containers, hanging baskets or planter boxes. It is also recommended for amending garden soils or for preparing raised beds. This Aged Pacific Northwest Bark, Coconut Coir Fiber and Vermicompost based soil is ideal for the developing root systems of all plants. Enhanced with pure Earthworm Castings, Mycorrhizal Fungi and Organic Fertilizer, DTE™ All Natural Potting Soil will nourish your plants naturally.</p><p>GUARANTEED ANALYSIS:</p><ul><li>Total Nitrogen (N) 0.1%\r\n0.1% Water Insoluble Nitrogen</li><li>Available Phosphate (P2O5) 0.1%</li><li>Soluble Potash (K2O) 0.1%</li><li>SOIL AMENDING INGREDIENTS: Bark, Coir Fiber, Perlite, Diatomite, Vermicompost, Oyster Shell, and Dolomitic Limestone (for pH adjustment)</li><li>DERIVED FROM: Earthworm Castings, Fish Bone Meal, Blood Meal, Langbeinite, Greensand, Volcanic Ash and Kelp Meal.</li></ul><br/><p>ALSO CONTAINS NON-PLANT FOOD INGREDIENT(S):\r\nMycorrhizal Inoculant (Glomus intraradices 0.016 prop/gm, Glomus mosseae 0.017 prop/gm, Glomus aggregatum 0.018 prop/gm, Glomus etunicatum 0.02 prop/gm, Pisolithus tinctorius 280 prop/gm, Rhizopogon villosullus 8 prop/gm, Rhizopogon luteolus 8 prop/gm, Rhizopogon amylopogon 8 prop/gm, Rhizopogon fulvigleba 8 prop/gm, Scleroderma citrinum 17 prop/gm, Scleroderma cepa 17 prop/gm)</p><p>APPLICATION RATES:</p><ul><li>This potting soil is ready to use right from the bag. Select the appropriate size container for your plant and add 2-3 inches of fresh potting soil.</li><li>Gently remove the plant from its current pot and carefully untangle any existing roots.</li><li>Place the plant in the new container and add soil to completely cover the root system up to the base of the stem.</li><li>Lightly tamp down the soil to remove any air pockets and secure the plant. Water thoroughly and allow the excess water to drain out the bottom of the pot.</li><li> Most plants will benefit from a regular feeding schedule and consistent watering practices. Take pleasure in your plants and be sure to water when the soil feels dry to the touch.</li></ul><br /><p>Down To Earth All Natural Potting Soil will supply enough organic nutrients to feed the average plant for 3 to 4 weeks. To ensure consistent performance, please remember to tightly close the bag after each use.</p>', 'downToEarchAllNaturalPottingSoil.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active');
INSERT INTO `product` (`id`, `sku`, `url_key`, `title`, `description`, `image`, `image_lens_size`, `extended`, `status`) VALUES
(41, 'ES', 'essentialSoil', 'Essential Soil Blend', '<p>Essential Soil Blend is a substitute soil mix for our regular Essential Soil.</p><p>Essential Soil Blend is an all-natural mix that is engineered to resist compaction, has excellent water penetration, good aeration, and will support rapid root growth. Essential Soil Blend is recommended for raised planter beds and will support excellent root growth. An ideal soil for vegetables and fruit trees.</p><p>Essential Soil Blend is comprised of the following: ¼”-Pea Gravel which is an inorganic mineral component for drainage and aeration; Organic Garden Compost provides organic matter and soluble nutrients; ¼-Fir Bark is a wood amendment acts as carbon matter; Coarse Sand is an inorganic mineral component; Bio-Nutrient Package provides soil microbiology.</p><p>Due to the biological nature of the Essential Soil, proper irrigation and mulch cover is required. Do not let the soil sit fallow. Cover cropping during Winter is highly recommended.\r\n</p><p>We sell the Essential Soil Blend in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase the Mix by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site.</p>', 'essentialSoil.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(42, 'LM', 'landScapeMix', 'Landscape Mix', '<p>Our Landscape Mix (formerly \"Nursery Mix\") is an all-purpose soil mix for outdoor use. It contains Sandy Loam, Redwood Sawdust, Organic Garden Compost, and Organic Crustacean Meal. You can spread it out over an existing soil and turn it under wherever you need to raise the grade and improve your soil. Our Landscape Mix can also be used for under new sod installation with an application of Bio-Turf or Bio-Live organic fertilizers.</p><p>If you are growing vegetables we recommend using either the Essential Soil or our Lyngso Vegetable Blend. For vegetables, the Landscape Mix will need either an application of organic fertilizer like Bio-Fish or All Purpose or a 2\" application of Diestel Structured Compost worked into the top 6\"-8\" of the raised bed.</p><p>We sell the Landscape Mix in one cubic foot bags, we supply the bags, you fill them. For larger areas, you\'ll want to purchase the Nursery Mix by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job-site.\r\n</p>', 'landScapeMix.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(43, 'OAM', 'organicAmendmentMix-2', 'Organic Amendment Mix', '<p>Organic Amendment Mix is a blend of Organic Green Waste Garden Compost, Redwood Sawdust, and Organic Feather Meal. This mix is generally used for improving most soils in water retention and aeration. Amendment Mix helps to open up clay for rainwater to be held and to be moved through the soil. Excellent for new sod installations and for generic all-purpose soil amending.</p><p>For additional organic fertilizer and microbiology, mix in Bio-Live 5-4-2 while amending.</p><p>Lyngso\'s Organic Amendment Mix is an organic substitute for Nitrolized Redwood Amendment.</p><p>CDFA OIM LISTED FOR ORGANIC USE</p><p>We sell the Organic Amendment Mix in one cubic foot bag, we supply the bags and you fill them. For large areas, you\'ll want to purchase by the cubic yard. We can load your truck or for a fee, have us deliver to your home or job site. For orders over 20 cubic yards, please call us for direct pricing.</p>', 'organicAmendmentMix.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(44, '38PG', '3-8-pea-gravel', '3/8\" Pea Gravel ', '<p>3/8\" Pea Gravel is a clean stone mix often used in small line Portland cement and concrete mixes.  The gravel can also be used as a backfill for drainage runs and underground storage tanks. 3/8\" pea gravel also makes for a care-free ground cover, patio mix, sturdy driveway material, dog run, and quality roofing material.</p>\r\n<p>We sell the 3/8\" Pea Gravel in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. Bring your truck and we can load it, or have us deliver the stones to you in the Bay Area. For orders over 20 tons please call us for direct pricing.</p>\r\n<p>3/8\" Pea Gravel may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', '3-8-pea-gravel.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(45, '34CDR', '3-4crushedDrainRock', '3/4\" Crushed Drain Rock', '<p>Used for back-filling perforated drainpipes and french drains, allowing water flow in your intended direction. The 3/4\" Crushed Drain Rock is also a sturdy material for potholes and driveways. The crushed rock locks together making a more stable surface and provide a strong foundation.\r\n</p>\r\n<p>Please note: accurate product pictures can be found by clicking on \'VIEW MORE\' under the currently displayed picture. </p>\r\n<p>We sell the 3/4\" Crushed Drain Rock in one cubic foot bag, we supply the bags and you fill them in our San Carlos location. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your jobsite in the Bay Area. For orders over 20 tons please call us for direct pricing.</p><p>3/4\" Crushed Drain Rock may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', '3-4crushedDrainRock.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(46, 'BBF', 'blackBasaltFines', 'Black Basalt Fines', '<p>Black Basalt Fines are 1/4\" minus basalt quarry fines that are charcoal gray in color. Typically used for pathways and parking areas, dog runs, and utility yards. These quarry fines will not compact to a firm surface and is permeable. \r\n</p>\r\n<p>Standard application is to spread about 2\", water and roll it, then apply the last 1\"-2\" for extra stability. </p>\r\n<p>We sell the Black Basalt Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p><p>Black Basalt Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'blackBasaltFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(47, 'BBFS', 'blackBasaltFinesStabilized', 'Black Basalt Fines Stabilized ', '<p>Black Basalt Fines are 1/4\" minus basalt quarry fines that are charcoal gray in color. Typically used for pathways and parking areas, dog runs, and utility yards. These quarry fines will not compact to a firm surface and is permeable. \r\n</p>\r\n<p>Standard application is to spread about 2\", water and roll it, then apply the last 1\"-2\" for extra stability. </p>\r\n<p>We sell the Black Basalt Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p><p>Black Basalt Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>', 'blackBasaltFinesStabilized.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(48, 'BF', 'blueFines', 'Blue Fines', '<p>Blue Fines is a 1/4\" minus quarry fines is typically used for pathways and parking areas, dog runs, utility yards and allows water to permeate. Blue Fines should be spread 3\"-4\" deep and compacted. You will have a natural-looking pathway for years to come.\r\n</p>\r\n<p>We sell the Blue Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Blue Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', 'blueFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(49, 'BFS', 'blueFinesStabilized', 'Blue Fines Stabilized', '<p>Blue Fines Stabilized stone is not a substitute for a non-permeable concrete or asphalt surface. This product was developed to mitigate erosion during heavy rains and is perfect for pathways and between flagstone and pavers. The surface will always have some loose grit that can be tracked. \r\n</p>\r\n<p>It is critical to follow the proper installation instructions to ensure the performance of the product. Lyngso will not be responsible for unsatisfactory results due to improper installation. See the attached installation guidelines. </p>\r\n<p>Blue Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n<p>Blue Fines are a 1/4\" minus rock that is perfect for pathways and between flagstone and pavers.  Stabilized Blue Fines are available in stock and are pre-mixed with a stabilizer. For areas where the stability of the pathway fines is desired, a stabilizer can be added. We only use a non-toxic, natural stabilizer. </p><p>Blue Fines should be spread and compacted at 2\"- 4\". There may be a 15-20% shrinkage during compaction so plan ahead with your calculations. Stabilized Blue Fines will need to be set with spraying water once compacted. Curing time is necessary before using the space and varies depending on the weather.\r\n</p><p>We sell the Blue Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p><p>Blue Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', 'blueFinesStabilized.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(50, 'DBF', 'desertBrownFines', 'Desert Brown Fines', '<p>Desert Brown Fines are brown decomposed 3/8\" minus quarry fines. Commonly used for decorative pathways, parking areas, utility yards and dog runs. Desert Brown Fines packs well due to the larger quarry gravel and will have visible grits on the surface layer. Permeable material. Desert Brown Fines should be spread 3\"-4\" deep and compacted. \r\n</p>\r\n<p>We sell the Desert Brown Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p>\r\n', 'desertBrownFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(51, 'SGPF', 'sunsetGoldPathFines', 'Sunset Gold Path Fines', '<p>Sunset Gold Path Fines are 1/4\" minus gold granite fines and is typically referred to as decomposed granite. Sunset Gold Path Fines are gold and tan in color and are used for pathways, driveways, parking areas, and between flagstone and pavers. Sunset Gold Path Fines is permeable and once compacted, top layer will still have some loose fines.  Apply 2\" deep, water and roll, then add a 1\" - 2\" layer to complete the project. \r\n</p>\r\n<p>We sell the Sunset Gold Path Fines in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>Sunset Gold Path Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'sunsetGoldPathFines.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(52, 'SGPFS', 'sunsetGoldPathFines-stabliized', 'Sunset Gold Path Fines Stabilized', '<p>Sunset Gold Path Fines Stabilized stones is not a substitute for a non-permeable concrete or asphalt surface. This product was developed to mitigate erosion during heavy rains. The surface will always have some loose grit that can be tracked.</p>\r\n<p>Gold Path Fines stones are pre-mixed with stabilizer and available in stock.  Non-toxic stabilizer material is added to the mix in applications where high stability is needed.</p><p>It is critical to follow the proper installation instructions to ensure the performance of the product. Lyngso will not be responsible for unsatisfactory results due to improper installation. See the attached installation guidelines. </p><p>Sunset Gold Path Fines are 1/4\" minus gold granite fines. The Sunset Gold Path Fines are gold and tan in color and are used for pathways and between flagstone and pavers. Stabilized Sunset Gold Path Fines are available in stock and are pre-mixed with a stabilizer. For areas where the stability of the pathway fines is desired, a stabilizer can be added. We only use a non-toxic, natural stabilizer. </p><p>Sunset Gold Path Fines should be spread and compacted at 2\"- 4\". There may be a 15-20% shrinkage during compaction so plan ahead with your calculations. Stabilized Sunset Gold Path Fines will need to be set with spraying water once compacted. Curing time is necessary before using the space and varies depending on the weather. </p><p>We sell the Sunset Gold Path Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck or have us deliver to you. For orders over 20 tons, please call us for direct pricing.\r\n</p><p>Sunset Gold Path Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'sunsetGoldPathFines-stabliized.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(53, 'ASTC', '15-7AutumnSlateTumbledChip', '1.5\"-7\" Autumn Slate Tumbled Chip ', '<ul>\r\n<li>Origin: Asia</li><li>Classification: Slate</li><li>Color Range: Charcoals, Tans, Bronze Rusts</li><li>Finishes: Crushed Tumbled Natural Matte</li>\r\n</ul>\r\n\r\n\r\n<p>The Autumn Slate Chips look great in contemporary gardens, walkway lining and accent areas. Slate material with tans and bronze colored rusts. Use as an unusual ground cover. Tumbled for smooth edges. 1.5\"-7\" in size. </p>\r\n<p>We sell the Autumn Slate Tumbled Chips in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p>\r\n', '15-7AutumnSlateTumbledChip.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(54, 'MBTSC', '15-7MidnightBlackSlateTumbledChip', '1.5\"-7\" Midnight Black Slate Tumbled Chip', '<ul>\r\n<li>Origin: Asia</li><li>Classification: Slate</li><li>Color Range: Charcoals, Tans</li><li>Finishes: Crushed Tumbled Natural Matte</li>\r\n</ul>\r\n\r\n\r\n<p>The black Slate Tumbled Chips look great in contemporary gardens, edge areas near walkways and drives, or use it as an unusual ground cover. Tumbled for smooth edges.\r\n</p>\r\n<p>We sell the Midnight Black Slate Tumbled Chips in one cubic foot bags, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p>\r\n', '15-7MidnightBlackSlateTumbledChip.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(55, '1278GGR', '12-78GlacerGreen', '1/2\"-7/8\" Glacier Green', '<p>Our 1/2\" - 7/8\" Glacier Green Gravel is crushed and cleaned, great for gardens, walkways and decorative accents in gardens.\r\n</p>\r\n<p>The Glacier Green Gravel can be purchased by the bag or delivery may be possible to your SF Bay area home.  Visit our large showroom and landscaping yard in San Carlos. </p>\r\n', '12-78GlacerGreen.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(56, '38CBB', 'crushedBlackBasalt', '1/4\" & 3/8\" Crushed Black Basalt', '<p>3/8\" Crushed Black Basalt rock is attractive decorative gravel with charcoal hues. It\'s angular in shape, it packs well for walkways, pathways, patios and driveways.\r\n</p>\r\n<p>We sell the 3/8\" Crushed Black Basalt in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>3/8\" Crushed Black Basalt may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'crushedBlackBasalt.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(57, '18DG', '1-8DesertGold', '1/8\", 3/8\" & 3/4\" Desert Gold ', '<ul><li>Origin: North America</li><li>Classification: Gold Granite</li><li>Finishes: Crushed Angular Rocks</li><li>Application: Great for walkways/pathways</li></ul>\r\n<br/ >\r\n<p>Our Desert Gold stone material is a vibrant tan and white speckled crushed granite. Seamlessly integrates into succulent gardens, xeriscaping and various design aspect of a striking landscape. Common uses include pathways, driveways, and decorative accents. Also, used as a garden groundcover, and in planting beds as rock mulch. Desert Gold will contain fines. \r\n</p><p>Desert Gold is available in three nominal sizes: 1/8\", 3/8\" and  3/4\".</p>\r\n<p>Desert Gold may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '1-8DesertGold.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(58, '38T', '3-8Taffy', '3/8\" Taffy', '<ul><li>Origin: North America</li><li>Color Range: Tans, Yellows, Buffs</li><li>Finishes: Crushed Angular - Natural Matte</li></ul>\r\n<br/ >\r\n<p>Lightweight crushed gravel. Size range is  1/4 \" -  1/2 \"\r\nBuff, orange and pink hues. Used for walkways and as a decorative mulch. Contains fines. </p><p>Desert Gold is available in three nominal sizes: 1/8\", 3/8\" and  3/4\".</p>\r\n<p>We sell the 3/8\" Taffy in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>3/8\" Taffy may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '3-8Taffy.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(59, '21CBB', '21-2CrushedBlackBasalt', '2 1/2\" Crushed Black Basalt ', '<p>2 1/2\" Crushed Black Basalt is attractive decorative gravel with dark gray and charcoal hues.  May be some reds visible as well.</p>\r\n<p>We sell the 2 1/2\" Crushed Black Basalt in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck. For orders over 20 tons please call us for direct pricing.</p><p>2 1/2\" Crushed Black Basalt may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '21-2CrushedBlackBasalt.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(60, '38CRG', '3-8CrushedRoseGold', '3/8\" Crushed Rose Gold ', '<p>3/8\" Crushed Rose Gold is a beautiful shimmery rock that is very attractive with speckles of reflectiveness. It\'s rosy tan in color. Works well as garden groundcover for succulents and dry gardens. This product contains a lot of fines and it can not be separated from the gravel during pickup or delivery. Once gravel is installed, wet the area down with water so that the fines will settle to the bottom and the gravel will surface. </p>\r\n<p>3/8\" Crushed Rose Gold may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '3-8CrushedRoseGold.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(61, '38Y', '3-8CrushedYosemiteTan', '3/8\" Crushed Yosemite Tan', '<p>3/8\" Crushed Yosemite Tan is decorative gravel that is used in pathways and walkways. The material will contain fines.</p>\r\n<p>We sell the 3/8\" Crushed Yosemite Tan in one cubic foot bag, we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, you can use our rental truck or have us deliver to you. For orders over 20 tons please call us for direct pricing.</p><p>3/8\" Crushed Yosemite Tan may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', '3-8CrushedYosemiteTan.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(62, '24LCC', '2-4LinCreekCobble', 'Lin Creek Cobbles', '<p>Lin Creek Cobbles are rounded river rock cobblestones; however, some cobblestones are fractured and split. Colors include brown, tan, rust, grey, and blue-grey. The cobbles are commonly used for dry creek beds, borders, under oak trees and water features. </p>\r\n<p>LIN CREEK COBBLES WILL CONTAIN FINES - after installation, water the fines down to settle the dust and to expose the pebbles. </p><p>The 2\"-4\" Lin Creek Cobbles will cover about 85 square feet of area and the 3\"-8\" Lin Creek Cobbles will cover about 60 square feet of area.</p><p>Lin Creek Cobbles are sold in cubic foot sacks, we supply the bags, you load them. For larger areas, you will want to purchase the Lin Creek Cobbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Lin Creek Cobbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p><p>Lin Creek Cobbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', '2-4LinCreekCobble.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(63, '12LC', '1-12LinCreekPebbles', 'Lin Creek Pebbles', '<p>Lin Creek Pebbles are rounded river rock pebbles, colors include brown, tan, grey and blue-grey. Commonly used as garden ground-cover, dry creek beds, and borders. </p>\r\n<p>LIN CREEK PEBBLES WILL CONTAIN FINES - after installation, water the fines down to settle the dust and to expose the pebbles. </p><p>Lin Creek Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Lin Creek Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Lin Creek Cobbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.\r\n</p><p>Lin Creek Pebbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', '1-12LinCreekPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(64, '38LODI', 'lodiPebbles', 'Lodi Creek Pebbles', '<p>Lodi Pebbles are a mixture of rounded and angular pebbles containing white, grey, blue, tan, brown and red colors. Commonly used for garden ground cover, pathways, planting beds, and as an exposed aggregate in concrete.</p>\r\n<p>Lodi Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Lodi Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Lodi Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying. </p><p>Lodi Pebbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', 'lodiPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(65, '38PAMI', '3-4PamiPebbles', 'Pami Pebbles', '<p>Pami Pebbles are a mixture of rounded pebbles, beautiful muted colors including burgundy, pink, tan, blue grey, and green. Great for barefoot pathways or garden ground-cover surface. Pami Pebbles are also our most popular aggregate for exposing in concrete walks and driveways.</p>\r\n<p>Pami Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Pami Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Pami Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p>\r\n', '3-4PamiPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(66, '12QP', '1-2QuartzPebbles', 'Quartz Pebble', '<p>Quartz Pebbles are available by special order only. Please call or email us to order. </p>\r\n<p>Quartz Pebbles are a mixture of rounded and angular pebbles, including black, white and grey with a few rust-colored pebbles. Commonly used for garden ground cover, pathways, planting beds and walkways.</p><p>Quartz Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Quartz Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Quartz Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p><p>Quartz Pebbles may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly. </p>\r\n', '1-2QuartzPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(67, '12SB', 'samonBayPebbles', 'Salmon Bay Pebbles - Limited Availability', '<p>Salmon Bay Pebbles are a mixture of opaque salmon colored pebbles with some white coloration. It is a beautiful and unique glass like rock. It is best used as an accent in the garden, as a mulch for containers or in dish gardens. Popular in pond applications and in water features.\r\n</p>\r\n<p>Salmon Bay Pebbles do contain fines and are available in two sizes: 1/4\" and 1/2\"</p><p>Salmon Bay Pebbles are sold in cubic foot sacks, we supply the bags, and you load them. For larger areas, you will want to purchase the Salmon Bay Pebbles in bulk by the ton. We can load your pickup truck or for a fee, have us deliver the Salmon Bay Pebbles to your home or job site. If you need increments of 25 tons please call us for special pricing. We sell these pebbles by the ton, or by the U-Sack. With the U-Sacks, one full bag weighs 100 pounds, but you can fill them 1/4, 1/2, or 3/4 full for easier carrying.</p>\r\n', 'samonBayPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(68, 'BYHPP', 'buckthornYellowHighPolishPebbles', 'Buckthorn Yellow High Polish Pebbles', '<p>The Buckthorn Yellow High Polish Pebbles are a mixture of yellow and tan pebbles, polished to a bright finish.  Light, natural looking stones are a great finishing color and surface for many indoor and outdoor garden, walkway, yards and planting applications.\r\n</p>\r\n<p>The Buckthorn Yellow High Polish Pebbles come pre-bagged, 55 pounds each.</p>\r\n', 'buckthornYellowHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(69, 'FSHPP', '3-11-4FiveSpringsHighPolishPebbles', 'Five Springs High Polish Pebbles', '<p>The Five Springs High Polished Pebbles are a mixture of red, tan, black, white, and yellow pebbles. Great for indoor or outdoor use, along walkways instead of mulch, outdoor gardens and in fountains or water features.\r\n</p>\r\n<p>The Five Springs High Polished Pebbles come pre-bagged, 55 pounds each.</p>\r\n', '3-11-4FiveSpringsHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(70, 'HRHPP', 'hennaRedHighPolishPebbles', 'Henna Red High Polish Pebbles', '<p>The Henna High Polish Pebbles are an assortment of red and brown colored stones. Strikingly beautiful accents in any landscape.  The 3/4\" to 1 1/4\" polished stones provide a finished look in natural settings indoors or outside.\r\n</p>\r\n<p>Henna High Polish Pebbles come pre-bagged, 55 pounds each.</p>\r\n', 'hennaRedHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(71, 'JGPP', 'jadeGreenHighPolishPebbles', 'Jade Green High Polish Pebbles', '<p>The Jade Green high Polish Pebbles have pale jade-green color with flecks of white, reminiscent of sea foam. These pebbles have a subtle translucency. Polished to a satin sheen.  The mix provides an interesting color tone for indoor and outdoor landscaping applications.\r\n</p>\r\n<p>Jade Green High Polish Pebbles come pre-bagged, 44 pounds each.</p>\r\n', 'jadeGreenHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(72, 'KBHPP', '3-4-1-1-4KuroBlackHighPolishPebbles', 'Kuro Black High Polish Pebbles', '<p>The Kuro Black Highly Polished Pebbles are an assortment of jet-black stones. Strikingly beautiful accents in any landscape, including shallow creeks, water accents and borders. Natural shine on the pebbles is fade resistant even over time.\r\n</p>\r\n<p>Kuro Black High Polished Pebbles come pre-bagged, 55 pounds each.</p>\r\n', '3-4-1-1-4KuroBlackHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(73, 'NPP', '2-5-2-8NijiPebbles', 'Niji Pebbles', '<p>Niji means rainbow in Japanese. Although the Niji Pebbles do not contain all the colors of the rainbow, they do have a combination of red, blue and white pebbles. An attractive choice for various landscaping projects, gardens, edging on walks and drives, and even fountains and water features.\r\n</p>\r\n<p>Niji Pebbles are available in two sizes: 3/8\" - 5/8\" (1 cm - 1  1/2  cm) and  3/4 \" - 1  1/4 \" (2 cm - 3 cm). Both sizes are available in pre-bagged 44 lbs. bags. For large quantity bulk orders, please contact us directly.</p>\r\n', '2-5-2-8NijiPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(74, 'TFWHPP', 'tufaWhiteHighPolishPebbles', 'Tufa White High Polish Pebbles', '<p>The Tufa White High Polish Pebbles are an assortment of white, grey stones. Strikingly beautiful accents in any landscape. 3/4\" to 1 1/4\" in size, they offer a bright finish to any landscaping project.  For use internal or outdoor projects.\r\n</p>\r\n<p>Tufa White High Polish Pebbles come pre-bagged, 55 pounds each.</p><p></p>\r\n', 'tufaWhiteHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(75, 'WGPP', 'wasabiGreenPebbles', 'Wasabi Green Pebbles', '<p>Marbled soft greens and blue pebbles add an interesting and beautiful color palette to both indoor and outdoor applications.  Non-shiny surface offers a natural appearance.  Looks great in both indoor and outdoor landscaping applications.\r\n</p>\r\n<p>Wasabi Green Pebbles come pre-bagged in 44 lbs. bags</p>\r\n', 'wasabiGreenPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(76, 'WHPP', 'woodgrainHighPolishPebbles', 'Woodgrain High Polish Pebbles', '<p>Natural woodgrain brown with white high polish pebbles give an earthy appearance with a fine finish.  Natural looking ground cover of eye-catching pebbles with natural striation in multiple brown tones, remarkably similar to wood grain.  The color palette of these pebbles is a warm beige with caramel and chocolate highlights. Polished to a satin sheen.\r\n</p>\r\n<p>Woodgrain High Polished Pebbles come pre-bagged in 44 lbs. bags</p>\r\n', 'woodgrainHighPolishPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(77, 'WBHPP', 'wuyiBrownHighPolishPebbles', 'Wuyi Brown High Polish Pebbles', '<p>Rich brown tones from our wuyi brown polished pebbles provide an elegant finish to indoor and outdoor landscaping and water features.  These are special order materials so contact our landscaping experts to determine the correct quantity for your application.\r\n</p>\r\n', 'wuyiBrownHighPolishPebbles.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(78, 'AGB', 'amadorGraniteBoulders', 'Amador Granite Boulder', '<ul><li>Origin: North America</li><li>Classification: Granite</li><li>Color Range: Greys, Whites, Tans</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Coarse grain granite boulders with an interesting angular and sculptural elements. Many boulders might contain plug & feather marks. Reclaimed quarry tailings. Remnants of mid-1800s mining operations. Natural local stone.\r\n</p>\r\n<p>Amador Granite Boulders may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n', 'amadorGraniteBoulders.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(79, 'AWGB', 'atwaterGraniteBoulder', 'Atwater Granite Boulder', '<ul><li>Origin: North America</li><li>Classification: Granite</li><li>Color Range: Greys, Whites, Tans</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Atwater Granite Boulders have a smooth sculptural element that make a beautiful statement piece in any landscape.\r\n</p>\r\n', 'atwaterGraniteBoulder.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(80, 'BCSB', 'basaltColumnsSawnBottom', 'Basalt Columns Sawn Bottom', '<ul><li>Origin: North America</li><li>Classification: Basalt </li><li>Color Range: Blacks, Greys</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Basalt Columns are large columnar shape rocks used where vertical landscape features are desired. Monolithic pieces of art, primarily gray in color with some brown or taupe color variations, sawn bottoms make for easy placement and reduced labor costs.\r\n</p>\r\n', 'basaltColumnsSawnBottom.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(81, 'BCSBD', 'basaltColumnsSawnBottom-Drilled', 'Basalt Columns Sawn Bottom - Drilled', '<ul><li>Origin: North America</li><li>Classification: Basalt </li><li>Color Range: Blacks, Greys</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Basalt Columns are large columnar rocks cored to be used as water features. Monolithic pieces of art, primarily gray in color with some brown or taupe color variations, sawn bottoms make for easy placement and reduced labor costs. These columns have been drilled to be used as water features. Group them in threes or more to create a unique and attractive water feature.\r\n</p>\r\n', 'basaltColumnsSawnBottom-Drilled.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(83, 'CCB', 'chiefcliffBoulders-1', 'Chiefcliff Boulders', '<ul><li>Origin: North America</li><li>Classification: Argillite </li><li>Color Range: Grays, Blues, Tans</li><li>Finish: Natural</li><li>Application: Accents</li></ul>\r\n<p>Chiefcliff Boulders are decorative gray angular Argillite landscape boulders. These are sedimentary rocks with green moss and lichen highlights. Blocky and irregular shapes. Weight is from 150 pounds to over 4,000 pounds. Size range varies from 16 inches wide by 18 inches tall by 18 inches long to 30 inches wide by 48 inches tall by 60 inches long. Colors range from light grays, blue grays to browns.</p>\r\n', 'chiefcliffBoulders-1.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Inactive'),
(84, 'SWP2-3CM', 'snowWhitePebbles', 'Snow White Pebbles', '<p>Snow White Pebbles are unique chalky white pebbles. The surface carries minuscule reflective particles that give this stone the appearance of snow.  The White Pebbles are opaque with a flat finish.  Brighten up dark corners of your yard or gardens, mix with other colors, or add in water features and fountains for a clean appearance.</p>\r\n', 'snowWhitePebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(85, 'BB1', 'blackAquaCovePebbles1', 'Black Aqua Cove Pebbles', '<p>Our Black Aqua Cove Pebbles are irregular decorative beach pebbles. These are the darkest matte black pebble, unlike La Paz, Aqua Cove is non-uniform in shape, imported pebbles.</p><p>Sizes slightly vary from shipment to shipment. Hand-sorted materials. Not screened.</p><p>Available in the following nominal sizes:</p><ul><li>BB1: 1/2\" - 1\" (1-2cm; 10-20mm)</li><li>BB3: 3/4\" - 1 1/4\" (2-3cm; 20-30mm)</li><li>BB5: 1\" - 2\" (3-5cm; 30-50mm)</li></ul>\r\n', 'blackAquaCovePebbles1.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(86, 'BBBLP', 'blackButtonLaPazPebbles', 'Black Button La Paz Pebbles', '<p>Black Button La Paz Pebbles are smaller than their standard brother, La Paz Pebbles.  La Paz Pebbles are often called Mexican Beach Pebbles, hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, blacks, grays, and charcoals in this set, La Paz pebbles will make a statement in your landscape design.</p><p>La Paz pebbles are oval in shape. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p><p>Please note:</p><p>Actual Button size La Paz range from 3/4\" to 1 1/4\".\r\n</p><p>As an alternative to Black Button La Paz Pebbles, consider our Hama Pebbles.</p>\r\n', 'blackButtonLaPazPebbles.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(87, 'OSM', 'oysterShellBocceBlend', 'Oyster Shell Bocce Blend', '<p>Oyster Shell Bocce Blend is specially formulated for use in bocce ball courts. A mixture of crushed oyster shells and fines for a natural, traditional surface. This bocce blend provides the players with a smooth rolling surface and has proper drainage when it rains.</p><p>As an alternative to Bocce Blend, you may want to consider using our Path Fines to construct your Bocce Ball Court.</p>\r\n', 'oysterShellBocceBlend.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(88, 'OSTM', 'osterShellFlour', 'Oyster Shell Flour', '<p>Oyster Shell Flour consists of approximately 96% calcium carbonate. The Oyster Shell Flour is sprinkled over the oyster shell, and helps to create a smooth surface once the Oyster Shell Bocce Blend has been applied to the court\'s surface.</p>\r\n', 'osterShellFlour.jpg', '{\"width\": \"50px\", \"height\": \"50px\"}', NULL, 'Active'),
(89, 'TF', 'taffyFine', 'Taffy Fines', '<p>Taffy Fines are 3/16\" minus rhyolite and felsite fines that have buff, orange and pink hues. Taffy Fines are attractive as pathways or as a decorative mulch.  Apply 2\" deep, water and roll, then add a 1\" - 2\" layer to complete the project. Taffy Fines, once compacted, will still have some fines.\r\n</p>\r\n<p>We sell the Taffy Fines in one cubic foot bag; we supply the bags and you fill them. For larger areas, you\'ll want to purchase by the ton. We can load your truck or for a fee, have us deliver to your home or jobsite. For orders over 20 tons, please call us for direct pricing.</p>\r\n<p>Taffy Fines may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>', 'taffyFine.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(90, 'B-BLP', '3-5BlackLaPazPebbles', 'Black La Paz Pebbles', '<p>La Paz Pebbles, often called Mexican Beach Pebbles, are indeed hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, La Paz pebbles will make a statement in your landscape design.\r\n</p>\r\n<p>Available in Black, Buff, Red and mixed colors (has green and some shells). Buff La Paz and Red La Paz are special order and are not in-stock materials. La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p>\r\n\r\n<p>Please note actual sizes</p>\r\n<ul><li>1/2\" - 1\" La Paz range from 3/4\"-2\"</li><li> 1\" - 2\" La Paz range from 1\"-3\"</li><li> 2\" - 3\" La Paz range from 2\"-4\"  </li><li> 3\" - 5\" La Paz range from 3\"-6\"  </li></ul>\r\n\r\n<p>As an alternative to Black La Paz Pebbles, consider our Hama Pebbles.</p>\r\n\r\n\r\n\r\n', '3-5BlackLaPazPebbles.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(91, 'B-BUFFLP', '1-2-1BuffLaPazPebbles', 'Buff La Paz Pebbles - Special Order', '<p>Buff La Paz are special order and are not in-stock materials. These pebbles have unique colors and surface textures. Great for natural water features, ground cover and unique landscape settings.\r\n</p>\r\n<p>La Paz Pebbles, often called Mexican Beach Pebbles, are indeed hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, La Paz pebbles will make a statement in your landscape design.</p>\r\n<p>Available in Black, Buff, Red and mixed colors (has green and some shells). Buff La Paz and Red La Paz are special order and are not in-stock materials. La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand-sorted, not screened.</p>\r\n\r\n\r\n\r\n\r\n<p>Please note actual sizes</p>\r\n<ul><li>1/2\" - 1\" La Paz range from 3/4\"-2\"</li><li> 1\" - 2\" La Paz range from 1\"-3\"</li><li> 2\" - 3\" La Paz range from 2\"-4\"  </li><li> 3\" - 5\" La Paz range from 3\"-6\"  </li></ul>\r\n\r\n\r\n\r\n\r\n', '1-2-1BuffLaPazPebbles.jpeg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(92, 'BT1', '1-2-2-1-2GreenAquaCovePebbles', 'Green Aqua Cove Pebbles', '<p>Lyngso\'s Green Aqua Cove Pebbles have tones of white, green and gray providing a bright and less formal display of colors.  The green aqua cove pebbles come in a variety of sizes, from 1/2\" to 3 1/2\".  They are perfect for indoor and outdoor landscaping, water features and decorative edging.</p>\r\n\r\n\r\n\r\n', '1-2-2-1-2GreenAquaCovePebbles.jpeg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(93, 'HTP1-2CM', 'hamaPebbles', 'Hama Pebbles', '<p>The Hama Pebbles are an assortment of matte-black tumbled stones. Strikingly beautiful accents in any landscape.</p>\r\n<p>Hama Pebbles are available in bulk and in U-Sacks.</p>\r\n\r\n\r\n\r\n', 'hamaPebbles.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(94, 'BL-LP', '1-4-1-2MixedLaPazPebbles', 'Mixed La Paz Pebbles', '<p>La Paz Pebbles, often called Mexican Beach Pebbles, are indeed hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, our Mixed La Paz pebbles will make a statement in your landscape design. Mixed colors in the stones, they have green, brown, grays and tans, and some shells.</p>\r\n<p>La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p>\r\n\r\n\r\n\r\n', '1-4-1-2MixedLaPazPebbles.jpeg', '{\"width\": \"24px\", \"height\": \"24px\"}', NULL, 'Active'),
(95, 'B-RLP', '1-2-1RedLaPazPebbles', 'Red La Paz Pebbles - Special Order', '<p>Red La Paz are special order and are not in-stock materials. These pebbles have more reddish, brown and maroon tones in them with naturally shaped surfaces.\r\n</p>\r\n<p>La Paz Pebbles, often called Mexican Beach Pebbles, are  hand collected on the beaches of Mexico. These natural beach pebbles are one of kind, sculpted by oceanic currents. Smooth with natural matte hues, La Paz pebbles will make a statement in your landscape design.</p>\r\n<p>Available in Black, Buff, Red and mixed colors (has green and some shells). Buff La Paz and Red La Paz are special order and are not in-stock materials. La Paz pebbles are oval in shape, in various sizes. Sizes may vary slightly from shipment to shipment. Hand sorted, not screened.</p>\r\n\r\n<p>Actual size:</p>\r\n<ul><li>1/2\" - 1\" La Paz range from 3/4\"-2\"</li><li>1\" - 2\" La Paz range from 1\"-3\"</li><li>2\" - 3\" La Paz range from 2\"-4\"</li><li> 3\" - 5\" La Paz range from 3\"-6\"  </li></ul>\r\n\r\n\r\n', '1-2-1RedLaPazPebbles.jpg', '{\"width\": \"24px\", \"height\": \"24px\"}', NULL, 'Active'),
(96, 'BASALT-C-ND', 'BasaltColumnsNotDrilled', 'Basalt Columns, Not Drilled', '<p>Basalt columns not drilled. Diameter 6-10\"</p>\r\n\r\n\r\n', 'BasaltColumnsNotDrilled.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(97, 'BASALT-NT', 'BasaltFountainNaturalTop', 'Basalt Fountain Natural Top', '<p>Drilled basalt column. Diameter 6-10\", natural top.</p>\r\n\r\n\r\n', 'BasaltFountainNaturalTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(98, 'BASALT-FPT', 'BasaltFountainPolishedTop', 'Basalt Fountain Polished Top', '<p>Drilled basalt column. Diameter 6-10\", polished top.</p>\r\n\r\n\r\n', 'BasaltFountainPolishedTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(99, 'LBASALT-FNT', 'LargeBasaltFountainNaturalTop', 'Large Basalt Fountain Natural Top', '<p>Large drilled basalt column, natural top. Diameter 12-18\"</p>\r\n\r\n\r\n', 'LargeBasaltFountainNaturalTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(100, 'LBASALT-FPT', 'LargeBasaltFountainPolishedTop', 'Large Basalt Fountain Polished Top', '<p>Large drilled basalt column, polished top. Diameter 12-18\"</p>\r\n\r\n\r\n', 'LargeBasaltFountainPolishedTop.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(101, 'BASALT-FSET', 'BasaltFountainSet', 'Basalt Fountain Set', '<p>Basalt fountain 2pc set, polished inside.</p>\r\n\r\n\r\n', 'BasaltFountainSet.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(102, 'BASALT-SCF', 'SpecialCarvingBasaltFountain', 'Special Carving Basalt Fountain', '<p>SPECIAL CARVING BASALT FOUNTAIN</p>\r\n\r\n\r\n', 'SpecialCarvingBasaltFountain.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(103, 'SWIRL-PAT-BASALT-F', 'SwirlPatternBasaltFountain', 'Swirl Pattern Basalt Fountain', '<p>SWIRL BASALT FOUNTAIN</p>\r\n\r\n\r\n', 'SwirlPatternBasaltFountain.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(104, 'P9207', 'CalistogaPlanter', 'Calistoga Planter', '<p>Calistoga Planter is a linear ribbed pottery that compliments both modern and traditional landscape designs. </p>\n<p>Available in the following glazes and sizes:</p>\n<ul>\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 13\" Belly, 22\" Height</li><li>Medium: 21\" Belly, 30\" Height</li>\n</ul><p></p>\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'CalistogaPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active');
INSERT INTO `product` (`id`, `sku`, `url_key`, `title`, `description`, `image`, `image_lens_size`, `extended`, `status`) VALUES
(105, 'P7288', 'CupertinoPlanter', 'Cupertino Planter', '<p>Cupertino Planter is a sleek, tall vase like pottery that compliments both modern and traditional landscape designs. </p>\r\n<p>Available in the following glazes and sizes:</p>\r\n<ul>\r\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 14\" Belly, 23\" Height</li><li>Medium: 15\" Belly, 32\" Height</li><li>Large: 22\" Belly, 39\" Height</li>\r\n</ul><p></p>\r\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'CupertinoPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active'),
(106, 'P9900', 'LarkspurPlanter', 'Larkspur Planter', '<p>Larkspur Planter is a traditional tall vase-like pottery that is perfect as landscape statement pieces for entryways, walkways or even as water features! </p>\r\n<p>Larkspur Planter is available in the following glazes and sizes: </p>\r\n<ul>\r\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 19\" Belly, 30\" Height</li><li>Medium: 20\" Belly, 39\" Height</li><li>Large: 22\" Belly, 47\" Height</li><li>X-Large: 24\" Belly, 55\" Height</li>\r\n</ul><p></p>\r\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'LarkspurPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active'),
(107, 'P9367', 'OaklandPlanter', 'Oakland Planter ', '<p>Oakland Planter is a traditional wide pottery that is perfect for layered planting arrangements or for dwarf  trees.</p>\r\n<p>Available in the following glazes and sizes:</p>\r\n<ul>\r\n<li>Yellow, Blue, Green, Ivory </li><li>Small: 20\" Belly, 21\" Height</li><li>Medium: 30\" Belly, 28\" Height</li><li>Large: 36\" Belly, 33\" Height</li>\r\n</ul><p></p>\r\n<p>Due to the colors being hand glazed, no two pottery are exactly alike and will have subtle unique characteristics. Please visit our store to see these handmade pottery in person.</p>', 'OaklandPlanter.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', '[{\"name\": \"colors\", \"input\": {\"type\": \"select\"}, \"rules\": [{\"output\": {\"fields\": [{\"field\": \"sku\", \"action\": \"append\", \"hyphen\": true}, {\"field\": \"title\", \"action\": \"append\", \"hyphen\": true}]}}], \"title\": \"Glazes\", \"labels\": [\"Select Color\", \"Blue Glaze\", \"Green Glaze\", \"Ivory Glaze\", \"Yellow Glaze\"], \"values\": [\"\", \"blue\", \"green\", \"ivory\", \"yellow\"]}]', 'Active'),
(108, 'WC', 'LehighWhiteCement94Lbs', 'Lehigh White Cement 94 Lbs ', '<p>Lehigh White Type I meets ASTM C150 Standard Specification for Portland Cement.</p>\r\n<p>Uses:</p>\r\n<ul><li>Precast and prestressed architectural concrete</li><li>Cast-in-place architectural and structural concrete</li><li>Architectural concrete masonry, cast stone, and terrazzo</li><li>Swimming pools and spas</li><li>Tile grout and concrete countertops</li></ul>\r\n\r\n\r\n', 'LehighWhiteCement94Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(109, 'PGG', 'PerkgroutGrey', 'Perkgrout Grey', '<p>PerkGrout™ is a polymer modified pervious concrete using a non-shrink cement to produce a durable, crack-resistant, pervious grout for flagstone set in compacted base rock (crushed stone) or pervious concrete.</p><p>PerkGrout™</p>\r\n\r\n<ul><li>Eliminates messy fines and washouts</li><li>Crack-resistant and long lasting</li><li>Reduces weeds, critters and other maintenance</li><li>Permeable</li></ul>\r\n\r\n<p>PerkGrout™ is supplied in 30 lb. sacks in either ‘Grey’ or ‘Tan’ color. Exactly one full quart of water is mixed with each sack, either in a mortar type mixer, in a bucket with a drill mixer, or in a tub by hand.</p><p>Custom colors for large orders are possible and one can add their own powder concrete color pigment.</p><p>Coverage:</p><p>Each 30 lb. sack covers approximately 17 square feet of flagstone area. This assumes mostly larger, 18” size flagstone pieces, 1” to 2” wide joints and 2”depth.</p><p>Handy homeowners and landscape professionals can install PerkGrout™.</p><p>How to Install PerkGrout Video: https://perviousproducts.com/perkgrout-how-to-video/</p><p></p><p></p>\r\n\r\n\r\n', 'PerkgroutGrey.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(110, 'PGT', 'PerkgroutGreyTan', 'Perkgrout Tan', '<p>PerkGrout™ is a polymer modified pervious concrete using a non-shrink cement to produce a durable, crack-resistant, pervious grout for flagstone set in compacted base rock (crushed stone) or pervious concrete.</p><p>PerkGrout™</p>\r\n\r\n<ul><li>Eliminates messy fines and washouts</li><li>Crack-resistant and long lasting</li><li>Reduces weeds, critters and other maintenance</li><li>Permeable</li></ul>\r\n\r\n<p>PerkGrout™ is supplied in 30 lb. sacks in either ‘Grey’ or ‘Tan’ color. Exactly one full quart of water is mixed with each sack, either in a mortar type mixer, in a bucket with a drill mixer, or in a tub by hand.</p><p>Custom colors for large orders are possible and one can add their own powder concrete color pigment.</p><p>Coverage:</p><p>Each 30 lb. sack covers approximately 17 square feet of flagstone area. This assumes mostly larger, 18” size flagstone pieces, 1” to 2” wide joints and 2”depth.</p><p>Handy homeowners and landscape professionals can install PerkGrout™.</p><p>How to Install PerkGrout Video: https://perviousproducts.com/perkgrout-how-to-video/</p><p></p><p></p>\r\n\r\n\r\n', 'PerkgroutGreyTan.jpg', '{\"width\": \"25px\", \"height\": \"25px\"}', NULL, 'Active'),
(111, 'QKS', 'QuikreteBaseCoatStucco60Lbs', 'Quikrete Base Coat Stucco 60 Lbs ', '<p>QUIKRETE Scratch and Brown Base Coat Stucco (No. 1139) is a portland cement based stucco used for construction and repair of stucco walls. Complies with ASTM C 926 requirements for cement based plaster.</p>\r\n<p>Use For:</p>\r\n<ul><li>Scratch and brown coat in a three coat stucco application</li><li>Apply directly to masonry walls in a two coat stucco application</li></ul>\r\n\r\n', 'QuikreteBaseCoatStucco60Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(112, 'QKFSCM', 'QuikreteBaseCoatStucco80Lbs', 'Quikrete Concrete Mix 80 Lbs', '<p>QUIKRETE Concrete Mix (No. 1101) is the original 4000 psi average compressive strength blend of portland cement, sand, and gravel or stone. Just add water. Use for any general concrete work.</p>\r\n<p>Use for Setting Posts and Building:</p>\r\n<ul><li>Sidewalks</li><li>Floors</li><li>Steps</li><li>Patios</li><li>Curbs</li><li>Downspout Troughs</li></ul>\r\n\r\n', 'QuikreteBaseCoatStucco80Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(113, 'QKFPC			', 'QuikreteFencePostMix80Lbs', 'Quikrete Fence Post Mix 80 Lbs', '<p>Quikrete 80 lbs. Concrete Mix can be used for building or repairing foundation walls, sidewalks, curbs, steps and ramps and for setting posts. This mix designed for pouring concrete 2 in. thick or more. Quikrete 80 lbs. Concrete Mix consists of a uniformly blended, properly proportioned mixture of gravel, sand and Portland cement.</p><p>Use for making repairs to foundation walls, walkways or steps and setting mailboxes and posts.</p>\r\n<p>For pouring concrete 2 in. thick or more:</p>\r\n<ul><li>Just add water</li><li>60 minute working time</li><li> High-strength 4000 psi concrete</li><li>Meets ASTM C 387 compressive strength requirements</li><li>Curbs</li></ul>\r\n\r\n', 'QuikreteFencePostMix80Lbs.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(114, 'QKA', 'QuikreteHighPerformanceBlacktopRepair50', 'Quikrete High Performance Blacktop Repair 50 Lbs', '<p>QUIKRETE High Performance Blacktop Repair (No. 1701-52, -62) is a specifically formulated high performance asphalt cold patch material for repairing potholes and cracks over 1\" (25.4 mm) wide in asphalt pavements. It is suitable for use on roads, driveways, parking lots, and walkways. All-season formulation is suitable for making permanent repairs in wet or dry conditions.</p>\r\n\r\n', 'QuikreteHighPerformanceBlacktopRepair50.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(115, 'OKMM', 'QuikreteMasonsMix80', 'Quikrete Masons Mix 80 Lbs', '<p>QUIKRETE Mason Mix (No. 1136) is a high strength Commercial Grade dry pre-blended mixture of sand and cements specially selected for masonry applications. Meets N, S, M requirements as specified in ASTM C270. Just add water.</p>\r\n<p>Use for Structural Masonry Applications both Above and Below</p>\r\n<ul><li>Grade</li><li>Walls</li><li>Tuck-Pointing</li><li>Columns</li><li>Brick/Stone Veneers</li></ul>\r\n', 'QuikreteMasonsMix80.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(116, 'QKM', 'QuikreteMortarMix80', 'Quikrete Mortar Mix 80 Lbs', '<p>QUIKRETE Mortar Mix (No. 1102) is a blend of masonry cement and graded sand , designed to meet ASTM C 270 for Type N Mortar. Just add water.</p>\r\n<p>Use For Construction & Repair of Brick, Block & Stone:</p>\r\n<ul><li>Barbecues</li><li>Pillars</li><li>Walls</li><li>Tuck-pointing mortar joints</li><li>Planters</li></ul>\r\n', 'QuikreteMortarMix80.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(117, 'GTS', 'QuikreteThinSetSandedGray50', 'Quikrete Thin Set Sanded - Gray 50 Lbs', '<p>QUIKRETE Thin Set Multi-Purpose (No. 1550) is a blend of portland cement, sand and special polymer additives for the installation of tiles over a variety of surfaces, including properly prepared exterior grade plywood. Requires no additional latex or fortifiers.</p>\r\n<p>Apply over:</p>\r\n<ul><li>Plywood</li><li>Concrete</li><li>Concrete block</li><li>Cementitious backer units</li><li>Wall board</li><li>Portland Cement Plaster</li></ul>\r\n', 'QuikreteThinSetSandedGray50.png', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(118, '47#C', 'QuikretePortlandCement94', 'Quikrete Portland Cement 94 Lbs', '<p>QUIKRETE Portland Cement (No. 1124) complies with current ASTM C150 and Federal Specifications for portland cement. Can be mixed with aggregate and other ingredients to make concrete mix, mortar mix, and base coat stucco. Available in Type I, Type I/II and Type III.</p>\r\n<p>To make Concrete Mix:</p>\r\n<ul><li>3 parts All-Purpose Gravel (No. 1151)</li><li>2 parts All-Purpose Sand (No. 1152)</li><li>1 part Portland Cement (by volume)</li></ul>\r\n<p>To make Type S Mortar Mix:</p>\r\n<ul><li>3 1/2 to 4 1/2 parts Mason Sand (No. 1952)</li><li>1/2 part Hydrated Lime</li><li>1 part Portland Cement (by volume)</li></ul>\r\n', 'QuikretePortlandCement94.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(119, 'QKPMSVMG', 'QuikretePlasticCement94', 'Quikrete Plastic Cement 94 Lbs', '<p>QUIKRETE Plastic Cement (No. 2121) complies with ASTM C 1328 Type M and S. Blended cement specifically designed for use with plaster sand to make Base Coat Stucco.</p>\r\n<p>To make Scratch and Base Coat Stucco Mix:</p>\r\n<ul><li>3 to 4 parts Plaster Sand</li><li>1 part Plastic Cement (by volume)</li></ul>\r\n', 'QuikretePlasticCement94.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(120, 'CGS5035		', 'CoregravelDriveway', 'Coregravel Driveway ', '<ul><li>CORE Gravel™ 50-35HD</li><li>Use: Heavy Duty - commercial paths, residential driveways, </li><li>restaurant patios, and more</li><li>Gravel size: 7 – 15 mm</li><li>Cell Size: 50 mm wide x 35 mm deep</li><li>Cell Wall Thickness: 2.0 mm</li><li>Sheet Size: 1.15 m x .78 m (= 9.7 sq.ft.)</li><li>Cell Colour: White (virgin plastic) </li><li>Geotextile Fabric: Yes</li><li>Compressive Strength: 150 t/m2 (empty)</li><li>Suitable for vehicles: Yes</li></ul>\r\n\r\n<p>CORE Gravel™ is a gravel stabilizing system that consists of a foundation of connected honeycomb-celled panels with a geotextile backing. Once filled with gravel this system is ideal for public spaces, vehicle or pedestrian traffic with no compromise in strength and durability. This eco-friendly system costs less than other parking systems, including asphalt, concrete and block pavers.</p>\r\n<p>CORE Gravel™ solves the problems associated with loose gravel; sinking, migrating and forming ruts. This is a proven solution for hassle-free gravel paving for all types of vehicle or pedestrian traffic with no compromise in strength and durability. The underside incorporates a durable geotextile which is heat welded to each cell, allowing water to drain easily while preventing weed growth. All panel edges have an interlocking system that makes for easy installation, even on steep grades.</p>\r\n<p>Proprietary manufacturing process provides a rigid honeycomb core design that holds its uniform hexagon shape while providing maximum load bearing. When filled with gravel the product is practically invisible, making for attractive driveways, pathways and patio installations. This porous and eco-friendly surface allows for storm water to permeate into the soil, dramatically reducing runoff problems.</p>\r\n<p>CORE Gravel™ is an excellent gravel stabilizing system.</p>\r\n\r\n<span id=\"pdf-link\"><a href=\"http://localhost:5001/pdf/50-35_gravel_spec_sheet-1.pdf\" target=\"_blank\"><span class=\"pdf-ico\"></span><span class=\"pdf-view\">View Product Information</span></a></span>\r\n\r\n\r\n', 'CoregravelDriveway.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(121, 'CGS3818			', 'CoregravelPathway', 'Coregravel Pathway ', '<ul><li>CORE Path™ 38-18</li><li>Use: Heavy Duty - commercial paths, residential driveways, </li><li>restaurant patios, and more</li><li>Gravel size: 3 - 10 mm</li><li>Cell Size: 38 mm wide x 18 mm deep/li><li>Cell Wall Thickness: 1.0 mm</li><li>Sheet Size: 1.15 m x .8 m (= 9.9 sq. ft.)</li><li>Cell Colour: White (virgin plastic) </li><li>Geotextile Fabric: Yes</li><li>Compressive Strength: 40 t/m2 (empty)</li><li>Suitable for vehicles: No, pedestrian traffic only</li></ul>\r\n\r\n<p>CORE Gravel™ is a gravel stabilizing system that consists of a foundation of connected honeycomb-celled panels with a geotextile backing. Once filled with gravel this system is ideal for public spaces, vehicle or pedestrian traffic with no compromise in strength and durability. This eco-friendly system costs less than other parking systems, including asphalt, concrete and block pavers.</p>\r\n<p>CORE Gravel™ solves the problems associated with loose gravel; sinking, migrating and forming ruts. This is a proven solution for hassle-free gravel paving for all types of vehicle or pedestrian traffic with no compromise in strength and durability. The underside incorporates a durable geotextile which is heat welded to each cell, allowing water to drain easily while preventing weed growth. All panel edges have an interlocking system that makes for easy installation, even on steep grades.</p>\r\n<p>Proprietary manufacturing process provides a rigid honeycomb core design that holds its uniform hexagon shape while providing maximum load bearing. When filled with gravel the product is practically invisible, making for attractive driveways, pathways and patio installations. This porous and eco-friendly surface allows for storm water to permeate into the soil, dramatically reducing runoff problems.</p>\r\n<p>CORE Gravel™ is an excellent gravel stabilizing system.</p>\r\n\r\n<span id=\"pdf-link\"><a href=\"http://localhost:5001/pdf/38-18_core_path_spec_sheet-1.pdf\" target=\"_blank\"><span class=\"pdf-ico\"></span><span class=\"pdf-view\">View Product Information</span></a></span>\r\n\r\n\r\n', 'CoregravelPathway.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(122, 'GATORNW', 'GatorGeotextileFabric', 'Gator Geotextile Fabric', '<p>GATOR FABRIC GF4.4 (100 lbf) is a needle punched non-woven geotextile made of polypropylene fibers. GATOR FABRIC GF4.4 geotextile is ideal for drainage, filtration and will allow water flow of 135 gallons per minutes per square foot (613 L/min/sq. m.) in paver or retaining wall applications. Its filament fibers are used for soil separation and drainage. They combine high durability along with excellent physical and hydraulic properties. It is non-biodegradable and resistant to most soil chemicals. Great for patios, walkways and driveways.\r\n</p>\r\n\r\n<p>IDEAL FOR: </p>\r\n\r\n<ul>\r\n<li>Drainage control</li>\r\n<li>Protection against erosion </li>\r\n<li>Behind retaining walls</li>\r\n<li>Paver sub base foundation</li>\r\n<li>Gator Base foundation application</li>\r\n<li>General landscape</li>\r\n<li>Soil separation</li>\r\n</ul>\r\n<p>FEATURES</p>\r\n<ul>\r\n<li>Specially treated to be hydrophilic, it allows high-water flow</li>\r\n<li>(135 Gal/min/sq. ft. (613 L/min/sq. m.))</li>\r\n<li>Drainage and filtration</li>\r\n<li>Soil separation</li>\r\n<li>Erosion control</li>\r\n<li>UV-Resistance</li>\r\n<li>Inert to soil chemicals (Alkalis, Acids)</li>\r\n<li>Inert to biological degradation</li>\r\n<li>Easy to handle</li>\r\n<li>High strength/dimensionally stable</li>\r\n</ul>\r\n\r\n<p>PLEASE NOTE: </p>\r\n<p>Gator Geotextile Fabric is sold in 6’ width and in 1’ lineal foot increments. It is cut to order and only comes in 6\' width.  </p>\r\n<p>Full rolls of 300\' length can be purchased by special order. </p>\r\n\r\n<p><a href=\"https://alliancegator.com/gator-grids-fabrics/gator-fabric-gf4-4/\" target=\"_blank\">Information Link<a></p>\r\n\r\n\r\n', 'GatorGeotextileFabric.png', NULL, NULL, 'Active'),
(123, 'PBB			', 'PlasticBenderBoard1x4x20', 'Plastic Bender Board 1\"x4\"x20’ ', '<p>PLASTIC BENDER BOARD 1\"x4\"x20\'</p>\r\n', 'PlasticBenderBoard1x4x20.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(124, '24PBB', 'PlasticBenderBoard2x4x20', 'Plastic Bender Board 2\"x4\"x20’ ', '<p>PLASTIC BENDER BOARD 2\"x4\"x20\'</p>\r\n', 'PlasticBenderBoard2x4x20.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(125, 'PBBS', 'PlasticBenderBoardStakes', 'Plastic Bender Stakes', '<p>PLASTIC BENDER BOARD STAKES</p>\r\n', 'PlasticBenderBoardStakes.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(126, '30S', '030LapisLustreSand100', '#0/30 Lapis Lustre Sand 100 Lbs ', '<p>CEMEX Lapis Lustre Specialty Sands provide customized blends for uses such as well packing, sandblasting, artificial turf installment, and sports fields. </p> \n<p>CEMEX Lapis Lustre Sands are top quality products that are washed, graded, dried, and certain products are packaged to ensure quality and are tested to be compliant with California ARB Certification standards and NSF 61 Standards. Lapis Lustre Sands are preferred over other manufactured sands due to low dust content and eco-friendly attributes.</p>\n<p>Coarse/Medium Aquarium: NO #0/30</p>\n<p>Aquarium, Custom Work: Epoxy Mixes, Sandblasting, All Purpose</p>\n', '030LapisLustreSand100.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(127, '20S', '1-20LapisLustreSand100', '#1/20 Lapis Lustre Sand 100 Lbs ', '<p>CEMEX Lapis Lustre Specialty Sands provide customized blends for uses such as well packing, sandblasting, artificial turf installment, and sports fields. </p> \r\n<p>CEMEX Lapis Lustre Sands are top quality products that are washed, graded, dried, and certain products are packaged to ensure quality and are tested to be compliant with California ARB Certification standards and NSF 61 Standards. Lapis Lustre Sands are preferred over other manufactured sands due to low dust content and eco-friendly attributes.</p>\r\n\r\n<p>Coarse/Medium Aquarium: NO #1/20</p>\r\n<p>Aquarium, Custom Work: Epoxy Mixes, Sandblasting, All Purpose</p>\r\n', '1-20LapisLustreSand100.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(128, '216S', '2-16LapisLustreSand100', '#2/16 Lapis Lustre Sand 100 Lbs ', '<p>CEMEX Lapis Lustre Specialty Sands provide customized blends for uses such as well packing, sandblasting, artificial turf installment, and sports fields. </p> \r\n<p>CEMEX Lapis Lustre Sands are top quality products that are washed, graded, dried, and certain products are packaged to ensure quality and are tested to be compliant with California ARB Certification standards and NSF 61 Standards. Lapis Lustre Sands are preferred over other manufactured sands due to low dust content and eco-friendly attributes.</p>\r\n\r\n<p>Coarse/Medium Aquarium: NO #2/16</p>\r\n<p>Aquarium, Custom Work: Epoxy Mixes, Sandblasting, All Purpose</p>\r\n', '2-16LapisLustreSand100.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(129, 'AZOMITEP', 'azomitePowder', 'Azomite Powder 44 Lbs ', '<p>Azomite is a natural fertilizer (described in Secrets of the Soil as rock dust) that is actually an ancient deposit of aluminum silicate clay and marine minerals. In use for over 50 years as a source of available potash (0.2%) and over 70 trace minerals, including calcium (1.8%), sodium (0.1%), and magnesium (0.5%).\r\n</p><p>APPLICATION RATE: 0.25-2 tons per acre, or 0.25-2 lb per 10 sq. ft.</p>\r\n<p>Use as an annual top dressing on citrus trees, where soil pH is 6.5 or lower, at 5 lb/tree, or 15 lb on blight-stricken trees./p><p>Azomite can also used in animal feeds at a rate of 0.5% of feed mixture, as a trace mineral supplement and a natural anti-caking agent.</p>', 'azomitePowder.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(130, 'BOBQ', 'BlackOwlBiochar', 'Black Owl Biochar', '<p>As one of the few  Black Owl Biochar (\"B.O.B\") has become the sought after biochar, due to its consistency of its optimally-designed characteristics for:\r\n</p>\r\n<ul><li>Building healthy soil</li><li> Hosting beneficial microbes and fungi</li><li>Reducing acidity Improving tilth and aeration</li><li>Retaining nutrients</li><li>Water-holding capacity = 5-6x its weight, good in droughts</li><li>Saving on irrigation water</li></ul>\r\n<br/>\r\n<p>An application rate of 5%-10% is typical to maximize the utility of your potting mix/soil.  BOB\'s particle size remains in the essential root area and won\'t wash through the soil like other amendments. It is therefore, typically a one-time application.</p>\r\n<p>All Black Owl Biochar (TM) products have greater than 70% Organic Carbon. IBI defines a Class One biochar as any biochar consisting of anything greater than 60% Organic Carbon. Black Owl Biochar\'s Pure & Natural, Premium Organic Biochar is OMRI-Listed.</p>', 'BlackOwlBiochar.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(131, 'BOBEUQ', 'BlackOwlBiocharEnvironmentalUltra', 'Black Owl Biochar Environmental Ultra', '<p>Black Owl Biochar Environmental Ultra (TM) is a premiere biochar ideal for environmental cleanup.  This OMRI-Listed and Washington State Registered for Organic Use biochar has a surface area of approximately 800 square meters per gram, high porosity, ideal particle-size and can:\r\n</p>\r\n<ul><li>Remediate sediments and wetlands</li><li>Remove 99.5% of most problem heavy metals</li><li>Filter stormwater</li><li>Remove DOD, TSS, Toxins</li><li>Immobilize biopathogens such as E.coli/Salmonella</li></ul>\r\n<br/>\r\n<p>Black Owl Biochar\'s Environmental Ultra, for use in biorention systems and L.I.D. solutions is a \"green\" and affordable alternative to activated carbon.  Environmental Ultra has been used in several large-scale projects including municipal and private rain gardens, marine protection and soil detoxification and revegetation.</p>\r\n<p>Our OMRI-Listed Black Owl Biochar Environmental Ultra has greater than 80% Organic Carbon.  IBI defines a Class One biochar as any biochar consisting of anything greater than 60% Organic Carbon.</p>', 'BlackOwlBiocharEnvironmentalUltra.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(132, 'BSF', 'FilledBurlapSandBag', 'Filled Burlap Sand Bag', '<p>Burlap bags are filled to order with 50 lbs. of sand. Great for flood control.</p>\r\n<p>Please call us ahead of time to prepare your order as it takes time and labor for us to fill the sandbags. </p>', 'FilledBurlapSandBag.jpg', NULL, NULL, 'Active'),
(133, 'QKSANDBAG', 'PrefilledPokyWovenSanBag50lbs', 'Prefilled Poly Woven Sand Bag 50 Lbs', '<p>Poly bags are filled to order with 50 lbs. of sand. Great for flood control.</p>\r\n<p>Please call us ahead of time to prepare your order as it takes time and labor for us to fill the sandbags. </p>', 'PrefilledPokyWovenSanBag50lbs.jpg', NULL, NULL, 'Active'),
(134, 'ATOBL', 'AntigoBolder', 'Antigo Boulder ', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Limestone</li>\r\n<li>Color Range: White, Cream, Light Gray, Buff</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents, Focal Features</li>\r\n</ul>\r\n\r\n<p>Antigo Boulders are a natural cream and buff colored limestone boulders. Attractive as a focal feature in a garden. </p>\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'AntigoBolder.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(135, 'BCBL', 'bouquetCanyonBoulders', 'Bouquet Canyon Boulders', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Schist</li>\r\n<li>Color Range: Greens, Greys, Tans, Rusts</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents</li>\r\n</ul>\r\n\r\n<p>Bouquet Canyon Boulders are green-gray schist boulders with natural rust bronze coloration. Natural local stone.</p>\r\n<p>Bouquet Canyon Boulders may qualify for LEED Local/Regional Materials credit. Distances vary for each project location. Please verify the materials accordingly.</p>\r\n\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:\r\n</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'bouquetCanyonBoulders.jpg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(136, 'CCBL', 'ChiefcliffBoulders', 'Chiefcliff Boulders', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Argillite </li>\r\n<li>Color Range: Grays, Blues, Tans</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents</li>\r\n</ul>\r\n\r\n<p>Chiefcliff Boulders are decorative gray angular Argillite landscape boulders. These are sedimentary rocks with green moss and lichen highlights. Blocky and irregular shapes. Weight is from 150 pounds to over 4,000 pounds. Size range varies from 16 inches wide by 18 inches tall by 18 inches long to 30 inches wide by 48 inches tall by 60 inches long. Colors range from light grays, blue grays to browns.</p>\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:\r\n</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'ChiefcliffBoulders.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active'),
(137, 'CFGB', 'CrawfordGraniteBoulder', 'Crawford Granite Boulder', '<ul>\r\n<li>Origin: North America</li>\r\n<li>Classification: Granite </li>\r\n<li>Color Range: Charcoal Gray, Dark Blue, Red, Rusts</li>\r\n<li>Finish: Natural</li>\r\n<li>Application: Accents, Focal Features</li>\r\n</ul>\r\n\r\n<p>Crawford Granite Boulders have an unique rust coloration making this an attractive focal feature in a garden.</p>\r\n<p>Boulder densities vary depending on the geological makeup. Therefore, it is hard to accurately predict the weight of the boulders without weighing them. However, as a general approximation, please use the following size and weight guide:\r\n</p>\r\n\r\n<ul>\r\n<li>1\' x 1\' x 1\' = 165 lbs. (0.08 tons)</li>\r\n<li>1\' x 1\' x 1.5\' = 248 lbs. (0.12 tons)</li>\r\n<li>1\' x 2\' x 1.5\' = 495 lbs. (0.25 tons)</li>\r\n<li>1.5\' x 2\' x 1.5\' = 743 lbs. (0.37 tons)</li>\r\n<li>1.5\' x 2\' x 2\' = 990 lbs. (0.51 tons)</li>\r\n<li>2\' x 2\' x 2\' = 1320 lbs. (0.66 tons)</li>\r\n<li>2\' x 2\' x 2.5\' = 1650 lbs. (0.85 tons)</li>\r\n<li>2\' x 2\' x 3\' = 1980 lbs. (0.99 tons)</li>\r\n<li>2\' x 3\' x 2.5\' = 2475 lbs. (1.24 tons)</li>\r\n<li>2\' x 3\' x 3\' = 2970 lbs. (1.49 tons)</li>\r\n<li>2.5\' x 3\' x 2.5\' = 3094 lbs. (1.55 tons)</li>\r\n<li>2.5\' x 3\' x 3\' = 3713 lbs. (1.86 tons)</li>\r\n<li>3\' x 3\' x 3\' = 4455 lbs. (2.23 tons)</li>\r\n</ul>\r\n\r\n\r\n', 'CrawfordGraniteBoulder.jpeg', '{\"width\": \"141px\", \"height\": \"141px\"}', NULL, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int NOT NULL,
  `sku` varchar(30) DEFAULT NULL,
  `product_order` int DEFAULT NULL,
  `category` int NOT NULL,
  `product` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `sku`, `product_order`, `category`, `product`) VALUES
(1, 'C2BR', 1, 21, 1),
(2, '34C2', 2, 21, 2),
(3, '14-FB', 1, 28, 5),
(4, 'AFBF', 1, 16, 4),
(5, '14PG', 2, 20, 3),
(6, '1OS', 1, 19, 6),
(7, '2OS', 2, 19, 7),
(8, 'CS', 3, 19, 8),
(9, 'CBSB', 2, 16, 9),
(10, 'AL', 3, 16, 10),
(11, 'GBLT', 5, 16, 11),
(12, 'LGS', 6, 16, 12),
(13, '516RL', 2, 28, 13),
(14, 'LIGNA PEAT', 3, 28, 14),
(15, 'ORGANIC-AMENDMENT', 4, 28, 15),
(16, 'RS', 4, 28, 16),
(17, 'COMPOST-MULCH', 4, 31, 17),
(18, 'GRB', 5, 31, 18),
(19, 'MA CHIP', 6, 31, 19),
(20, 'MMFB', 7, 31, 20),
(21, 'MOCHA CHIP', 8, 31, 21),
(22, 'PF', 8, 31, 22),
(23, 'PAM', 9, 31, 23),
(24, 'SCB', 10, 31, 24),
(25, 'SFB', 11, 31, 25),
(26, 'WOB', 10, 31, 26),
(27, 'TWC', 11, 31, 27),
(28, 'AACT', 10, 29, 28),
(29, 'BBBC', 10, 29, 29),
(30, 'DDOC', 11, 29, 30),
(31, 'HOWC', 12, 29, 31),
(32, 'SCCOB', 13, 29, 32),
(33, 'OBULL', 14, 29, 33),
(34, 'OAM', 15, 29, 34),
(35, 'DIESTEL', 16, 29, 35),
(36, 'OC', 17, 29, 36),
(37, 'WEBB', 18, 29, 37),
(38, 'BIOSWALE', 19, 32, 38),
(39, 'BBBPS', 19, 32, 39),
(40, 'BBBPS', 20, 32, 40),
(41, 'ES', 21, 32, 41),
(42, 'LM', 22, 32, 42),
(43, 'OAM', 23, 32, 43),
(44, '38-FB', 30, 20, 44),
(45, '34CDR', 31, 20, 45),
(46, 'BBF', 1, 22, 46),
(47, 'BBFS', 1, 22, 47),
(48, 'BF', 2, 22, 48),
(49, 'BFS', 3, 22, 49),
(50, 'DBF', 4, 22, 50),
(51, 'SGPF', 5, 22, 51),
(52, 'SGPFS', 6, 22, 52),
(53, 'SGPFS', 6, 23, 53),
(54, 'MBTSC', 7, 23, 54),
(55, '1278GGR', 8, 23, 55),
(56, '38CBB', 3, 23, 56),
(57, '18DG', 3, 23, 57),
(58, '38T', 3, 23, 58),
(59, '21CBB', 6, 23, 59),
(60, '34CDR', 7, 23, 45),
(61, '38CRG', 8, 23, 60),
(62, '38Y', 9, 23, 61),
(63, '24LCC', 1, 24, 62),
(64, '112LC', 1, 24, 63),
(65, '38LODI', 3, 24, 64),
(66, '38PAMI', 4, 24, 65),
(67, '12QP', 5, 24, 66),
(68, '12SB', 5, 24, 67),
(69, 'BYHPP', 1, 25, 68),
(70, 'FSHPP', 2, 25, 69),
(71, 'HRHPP', 3, 25, 70),
(72, 'JGPP', 3, 25, 71),
(73, 'KBHPP', 4, 25, 72),
(74, 'NPP', 6, 25, 73),
(75, 'TFWHPP', 8, 24, 74),
(76, 'WGPP', 9, 24, 75),
(77, 'WHPP', 10, 24, 76),
(78, 'WBHPP', 11, 24, 77),
(79, 'AGB', 1, 11, 78),
(80, 'AWGB', 1, 11, 79),
(81, 'BCSB', 3, 11, 80),
(82, 'BCSBD', 4, 11, 81),
(84, 'CCB', 6, 11, 83),
(85, 'SWP2-3CM', 8, 25, 84),
(86, 'TFWHPP', 8, 25, 74),
(87, 'WGPP', 9, 25, 75),
(88, 'WHPP', 10, 25, 76),
(89, 'WBHPP', 11, 25, 77),
(90, 'BB1', 1, 26, 85),
(91, 'BBBLP', 2, 26, 86),
(92, 'BBF', 1, 27, 46),
(93, 'BFS', 1, 27, 49),
(94, '34C2P', 3, 27, 2),
(95, 'C2BR', 5, 27, 1),
(96, 'OSM', 6, 27, 87),
(97, 'OSTM', 7, 27, 88),
(98, 'SGPF', 5, 27, 51),
(99, 'TF', 5, 22, 89),
(100, 'TF', 5, 27, 89),
(101, 'B-BLP', 3, 26, 90),
(102, 'B-BUFFLP', 4, 26, 91),
(103, 'BT1', 6, 26, 92),
(104, 'HTP1-2CM', 7, 26, 93),
(105, 'B-LP', 9, 26, 94),
(106, 'B-RLP', 9, 26, 95),
(107, 'BASALT-C-ND', 1, 44, 96),
(109, 'BASALT-NT', 3, 44, 97),
(110, 'BASALT-FPT', 3, 44, 98),
(111, 'LBASALT-FNT', 6, 44, 99),
(112, 'LBASALT-FPT', 8, 44, 100),
(113, 'BASALT-FSET', 10, 44, 101),
(114, 'BASALT-SCF', 12, 44, 102),
(115, 'SWIRL-PAT-BASALT-F', 14, 44, 103),
(116, 'CAL-PLANTER', 2, 41, 104),
(118, 'CUPER-PLANTER', 3, 41, 105),
(119, 'LARKS-PLANTER', 4, 41, 106),
(120, 'OAKLAND-PLANTER', 5, 41, 107),
(121, 'WC', 1, 51, 108),
(122, 'PGG', 2, 51, 109),
(123, 'PGT', 2, 51, 110),
(124, 'QKS', 3, 51, 111),
(125, 'QKFSCM', 4, 51, 112),
(126, 'QKFPC', 4, 51, 113),
(127, 'QKA', 8, 51, 114),
(128, 'OKMM', 10, 51, 115),
(129, 'QKM', 12, 51, 116),
(130, 'GTS', 14, 51, 117),
(131, '47#C', 16, 51, 118),
(132, 'QKPMSVMG', 18, 51, 119),
(133, 'CGS5035', 2, 54, 120),
(134, 'CGS3818', 4, 54, 121),
(135, 'GATORNW', 6, 54, 122),
(136, 'PBB', 8, 54, 123),
(137, '24PBB', 10, 54, 124),
(138, 'BBBS', 12, 54, 125),
(139, '30S', 2, 52, 126),
(140, '20S', 2, 52, 127),
(141, '216S', 6, 52, 128),
(142, 'AZOMITEP', 1, 33, 129),
(143, 'BOBQ', 1, 33, 130),
(144, 'BOBUQ', 1, 33, 131),
(145, 'BSF', 4, 52, 132),
(146, 'QKSANDBAG', 5, 52, 133),
(147, 'ATOBL', 3, 11, 134),
(148, 'BCBL', 10, 11, 135),
(149, 'CCB', 11, 11, 136),
(150, 'CFGB', 11, 11, 137);

-- --------------------------------------------------------

--
-- Table structure for table `units_of_measure`
--

CREATE TABLE `units_of_measure` (
  `id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `units_of_measure`
--

INSERT INTO `units_of_measure` (`id`, `title`, `description`) VALUES
(1, 'ton', 'Tons'),
(2, 'u-sack', 'U-Sack');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `customer_type` enum('Registered','Guest') NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `refreshToken` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `resetToken` varchar(300) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `customer_type`, `username`, `first_name`, `last_name`, `email`, `password`, `phone`, `isAdmin`, `refreshToken`, `resetToken`, `created_at`, `updated_at`) VALUES
('1e5e590e-1f15-4058-9c81-5d036efa19aa', 'Registered', 'dogger1', 'Dogger', 'One', 'doggerone@dogger.com', '$2a$12$wSvTE854.gaso3GYAim7ZOFRz90Sxil7EE2/J8IVbaHU3SkQ7GbSi', '', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxZTVlNTkwZS0xZjE1LTQwNTgtOWM4MS01ZDAzNmVmYTE5YWEiLCJlbWFpbCI6ImRvZ2dlcm9uZUBkb2dnZXIuY29tIiwiaWF0IjoxNjYyMTQwMzA4LCJleHAiOjE2NjIyMjY3MDh9.onxQbHXY2puisWzXqxFsEufoi5ZIPNApheIzzGei2EY', NULL, '2022-09-02 09:57:01', '2022-09-02 10:38:28'),
('25176827-7f64-4c6f-8618-42c1421bdf0b', 'Registered', 'jose279', 'Joseph', 'McClintock', 'jose279@test.com', '$2a$12$N8xW74CGkhMJTU2eMBFbPuiWDor0h6AVTK6hSnnEQyelTDrZ1zNqy', NULL, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIyNTE3NjgyNy03ZjY0LTRjNmYtODYxOC00MmMxNDIxYmRmMGIiLCJlbWFpbCI6Impvc2UyNzlAdGVzdC5jb20iLCJpYXQiOjE2Njg1NTYzNTUsImV4cCI6MTY2ODY0Mjc1NX0._D6oWBo0gijlVc9OIIjAua16vBWkb92XEP64LNokAhI', NULL, '2022-11-13 10:32:52', '2022-11-15 15:52:35'),
('35a42b63-13db-40b8-97e0-f7a86ea9aef2', 'Registered', 'joeman3', 'Jose', 'Man', 'man@test.com', '$2a$12$xfpR7QHHRdarFh42UB9cTeVSvGjKc0C7k8qfjJCGE6yquUHK9Bx8W', '', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIzNWE0MmI2My0xM2RiLTQwYjgtOTdlMC1mN2E4NmVhOWFlZjIiLCJlbWFpbCI6Im1hbkB0ZXN0LmNvbSIsImlhdCI6MTY1OTczMTcwNCwiZXhwIjoxNjU5ODE4MTA0fQ.MfN7yY7Td7ouwbyeYvbssXtGdKI5in5u-sL2NwiyS8E', NULL, '2022-08-04 18:51:55', '2022-08-05 13:38:23'),
('42cb3c48-20d8-444a-a183-27558c87fd6b', 'Guest', 'guest', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-09-01 10:34:35', NULL),
('489de46b-d2c2-4f76-b8c9-c5d4199798f2', 'Registered', 'joemoeman', 'Joe', 'Moeman', 'joemoeman@test.com', '$2a$12$ZtasMYe0Pb8QA576OnvGqOnSFt0lNoxfAks5zFBJxtvc0rXdcij0i', '650 123-4567', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI0ODlkZTQ2Yi1kMmMyLTRmNzYtYjhjOS1jNWQ0MTk5Nzk4ZjIiLCJlbWFpbCI6ImpvZW1vZW1hbkB0ZXN0LmNvbSIsImlhdCI6MTY2MjIyNDIwMywiZXhwIjoxNjYyMzEwNjAzfQ.BUxUoFLqfQl-jRwSeMaCMzXjCMOgOZ969IDy0mQdC1M', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI0ODlkZTQ2Yi1kMmMyLTRmNzYtYjhjOS1jNWQ0MTk5Nzk4ZjIiLCJlbWFpbCI6ImpvZW1vZW1hbkB0ZXN0LmNvbSIsImlhdCI6MTY2MjIyNDI4MiwiZXhwIjoxNjYyMjI3ODgyfQ.kE2Vbf6ksRLu47U00K9QlzpIj-JTLj3pd6_ODVfQPDU', '2022-09-01 10:35:42', '2022-09-03 09:58:02'),
('8063b644-5c1d-46dd-8444-41f46774576e', 'Guest', 'guest', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-09-01 10:32:54', NULL),
('81a477ab-e32e-4caf-b3ea-a4740a1e9713', 'Registered', 'jessieone', 'Jessie', 'Mark', 'jessiem@test.com', '$2a$12$aeBeJ7mOPP.xz6IJjC4CJuAe.w6yxmhZ14uqp8JXKoI7ysv37KVse', NULL, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4MWE0NzdhYi1lMzJlLTRjYWYtYjNlYS1hNDc0MGExZTk3MTMiLCJlbWFpbCI6Implc3NpZW1AdGVzdC5jb20iLCJpYXQiOjE2NjYxMTM1ODIsImV4cCI6MTY2NjE5OTk4Mn0.0Vqj2EuR-UZ8-Nb3SVQrsydbkdEaHx6sctniKxqjGXU', NULL, '2022-10-18 10:19:26', '2022-10-18 10:19:42'),
('81c7e896-274d-4615-ae96-44ac8a8226a3', 'Guest', 'guest', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-09-01 10:36:15', NULL),
('89325b79-cc53-40a9-9fa5-cbd8d11dd56f', 'Registered', 'drummerone', 'Drummer', 'Tom', 'drummertom@test.com', '$2a$12$oLYr45vRBJnT2MrtyPpzZeWxd8nWwPFd4Bhi3CPpJSgZGiLv5rFL.', NULL, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4OTMyNWI3OS1jYzUzLTQwYTktOWZhNS1jYmQ4ZDExZGQ1NmYiLCJlbWFpbCI6ImRydW1tZXJ0b21AdGVzdC5jb20iLCJpYXQiOjE2NjMxNzM2MzUsImV4cCI6MTY2MzI2MDAzNX0.qmJvf1MKewEOiaapiCLk962de3JBJPUmsauQoxu7O60', NULL, '2022-09-09 17:37:25', '2022-09-14 09:40:35'),
('8c390b6c-242d-4d57-aff5-593bda5b00d5', 'Registered', 'mattone', 'Matt', 'McClintock', 'mattman@test.com', '$2a$12$gilqkrqL5zgGPNriczWXnuiePVTmC0KZax4Y6nU.Hu/86M5YQBt/W', '6507033736', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4YzM5MGI2Yy0yNDJkLTRkNTctYWZmNS01OTNiZGE1YjAwZDUiLCJlbWFpbCI6Im1hdHRtYW5AdGVzdC5jb20iLCJpYXQiOjE2NTk5NjA2OTUsImV4cCI6MTY2MDA0NzA5NX0.LZDBRbSagWeMeior2Z--JAgSb2ln7yfKTMz4HdT_qXU', NULL, '2022-08-08 05:09:33', '2022-08-08 05:11:35'),
('8fa649b2-2fe7-4734-83a3-3da8f81e6804', 'Registered', 'joeman', 'Joseph', 'McClintock', 'norman.man@test.com', '$2a$12$Ik4IQXysc3PJIyTZjJlhkOu23LVUgEJE5ZoOzVtWk0Ka.r.0YEXiW', '6507033736', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4ZmE2NDliMi0yZmU3LTQ3MzQtODNhMy0zZGE4ZjgxZTY4MDQiLCJlbWFpbCI6Im5vcm1hbi5tYW5AdGVzdC5jb20iLCJpYXQiOjE2Njg2MTkzNTksImV4cCI6MTY2ODcwNTc1OX0.Lx-G_5CsT514cvgrKKWhlwIhLtn1eTSTlFa3BEXWayg', NULL, '2022-08-03 10:36:03', '2022-11-16 09:22:39'),
('91f0b9c5-a3a1-4a7c-a6ee-46153dad3418', 'Registered', 'jmcclnt279', 'Joe', 'McClintock', 'jmcclint279@gmail.com', '$2a$12$Un0v5EV9BaczlrY76HHGze8zBtjWAH1KCie4ufvXuxP5V8zwHppMq', NULL, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI5MWYwYjljNS1hM2ExLTRhN2MtYTZlZS00NjE1M2RhZDM0MTgiLCJlbWFpbCI6ImptY2NsaW50Mjc5QGdtYWlsLmNvbSIsImlhdCI6MTY2NTg4MzQ3NSwiZXhwIjoxNjY1OTY5ODc1fQ.HP2AaPoznByK-pnUPQCe7_wB31k2ENjfQHyAE1dgSDI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI5MWYwYjljNS1hM2ExLTRhN2MtYTZlZS00NjE1M2RhZDM0MTgiLCJlbWFpbCI6ImptY2NsaW50Mjc5QGdtYWlsLmNvbSIsImlhdCI6MTY2ODM2NDE0NiwiZXhwIjoxNjY4MzY3NzQ2fQ.ImuqhthU9ltZatjVuwTZoSdzM6hDn9QAnATFaK8ukCo', '2022-10-15 17:03:03', '2022-11-13 10:29:06'),
('9c03b8a9-9b36-4f6a-88f0-12d52afbc17c', 'Registered', 'SusanOne', 'Susan', 'One', 'susanone@est.com', '$2a$12$te.Lujol5Vi2ZgYZNoXoXu/H.637izpxgrJBvq1yvT00SRx6F5VWe', '', 0, NULL, NULL, '2022-08-08 10:57:00', NULL),
('9fa6d65a-999a-4d59-9373-60cbcbe13ea5', 'Guest', 'guest', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-09-01 10:31:59', NULL),
('a60777af-987e-4529-86d6-70e4371a43a1', 'Registered', 'cameronM', 'Cameron', 'McClintock', 'test2@test.com', '$2a$12$hjQsGV09UBouNEPhH7roTu7fbCWBozOFHstdQa3mK/rSrV4Vn4Wke', '6507033736', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhNjA3NzdhZi05ODdlLTQ1MjktODZkNi03MGU0MzcxYTQzYTEiLCJpYXQiOjE2NTM0MTMyNjEsImV4cCI6MTY1MzQ5OTY2MX0.FyWR2bC2qsBH3ePK00V8Xeb-NMNsjDmQkGczbzh3x_Y', NULL, '2022-05-24 10:26:04', '2022-05-24 10:27:41'),
('ac5b94d2-4eeb-486e-9acc-955ca87c0dc6', 'Registered', 'danaM', 'Dana', 'McClintock', 'dana@test.com', '$2a$12$0Y3DCxWZksSqZFdhg54ySut3KdI3LnhPrtKZNAr0.LBQ5GOJHhI7O', '659 5968 866', 0, NULL, NULL, '2022-08-04 05:30:39', '2022-08-04 05:32:40'),
('ad95db04-4a63-4648-9a1a-8c62f500e4bc', 'Registered', 'Testuser', 'Ted', 'Ted', 'teduser@test.com', '$2a$12$qyUM7LTKO9avcrPCWkKR7e1x5Bp65TpG4auOb1x2WpsgKvND2pn9S', '', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJhZDk1ZGIwNC00YTYzLTQ2NDgtOWExYS04YzYyZjUwMGU0YmMiLCJlbWFpbCI6InRlZHVzZXJAdGVzdC5jb20iLCJpYXQiOjE2NjI4NTM3MjksImV4cCI6MTY2Mjk0MDEyOX0.-wMKFT_kkmalP0LXeojNmapN07pUKXyoLHovqFVl4qo', NULL, '2022-08-08 13:18:43', '2022-09-10 16:53:14'),
('b2919210-d5c0-4e37-8ca0-994eae120102', 'Registered', 'Billman', 'Bill', 'Man', 'bill@test.com', '$2a$12$y06/SISLGiN2s6LWyGe27OGObt28NsF5AByoADNjzIGxttrInklpq', '650 789 5678', 0, NULL, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiMjkxOTIxMC1kNWMwLTRlMzctOGNhMC05OTRlYWUxMjAxMDIiLCJlbWFpbCI6ImJpbGxAdGVzdC5jb20iLCJpYXQiOjE2NTk5Nzk1MzIsImV4cCI6MTY1OTk4MzEzMn0.u3flwdahp3_cwa0E1LIDheBQRQtcGoA2HwVCXkPgnuM', '2022-08-08 10:10:24', '2022-08-08 10:25:32'),
('b5fc6031-c627-49a9-83cf-2b5287630466', 'Registered', 'hoggerone', 'Hooger', 'One', 'hogger@test.com', '$2a$12$FG1AfziyWacc0hBD2wQA/.yZoDXHjI835CNbSDGBHagG7IXL2wzu6', NULL, 0, NULL, NULL, '2022-09-09 11:08:27', NULL),
('b6a19327-e5d5-4b06-aba6-3607d81671a6', 'Registered', 'jmcclint', 'Joseph', 'McClintock', 'joseph@nativemeadow.com', '$2a$12$nvhF66tK1YrMLfAJo0vOMesGBIo.0fP1dSmypsDU54HUMvwhe0wQ6', '(650) 703 3736', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJiNmExOTMyNy1lNWQ1LTRiMDYtYWJhNi0zNjA3ZDgxNjcxYTYiLCJlbWFpbCI6Impvc2VwaEBuYXRpdmVtZWFkb3cuY29tIiwiaWF0IjoxNjcyNjk3MDMwLCJleHAiOjE2NzI3ODM0MzB9.PCsM_23NWTe3Ek0llIpRjha2-6gaD19EokucULFOWzk', NULL, '2022-04-30 18:52:56', '2023-01-02 14:03:50'),
('c5c683e2-97e1-43aa-a2d5-899317af045e', 'Registered', 'jessietwo', 'Jessie', 'Two', 'jessiet@text.com', '$2a$12$CYmr.jXWXC02H0l/aJlJ8eIEMaRiFFqj2.VSbuJ.aParEDsIJhlWu', NULL, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjNWM2ODNlMi05N2UxLTQzYWEtYTJkNS04OTkzMTdhZjA0NWUiLCJlbWFpbCI6Implc3NpZXRAdGV4dC5jb20iLCJpYXQiOjE2NjYxMTU2MTEsImV4cCI6MTY2NjIwMjAxMX0.bJl75SZqH5ftwK4jD1O3zLOdNrl3XvOwLSiY6EMt1Zs', NULL, '2022-10-18 10:53:15', '2022-10-18 10:53:31'),
('c885de3f-6373-4d62-96a1-c9f47d24656e', 'Registered', 'birdman', 'Bird', 'Man', 'birdman@test.com', '$2a$12$sl.omGgEQEV59WyOkL3TWO1WJLaIzNMLyBSvqF.D2dx9VPFGpwnfm', '585 858 5858', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjODg1ZGUzZi02MzczLTRkNjItOTZhMS1jOWY0N2QyNDY1NmUiLCJlbWFpbCI6ImJpcmRtYW5AdGVzdC5jb20iLCJpYXQiOjE2NjI3NDU0NDYsImV4cCI6MTY2MjgzMTg0Nn0.mCSPVkNaPCaZJNNpzVTSxISrrjwfhFt3utjKRi3sWOo', NULL, '2022-09-09 10:43:48', '2022-09-09 10:44:06'),
('e3d7bae3-9656-4667-b7d6-c9f9c5892df6', 'Guest', 'guest', 'Mary', 'Anderson', 'maderson@test.com', NULL, '650 123-4567', 0, NULL, NULL, '2022-09-01 10:35:13', '2022-09-01 10:51:16'),
('e446cf5e-3149-432f-9bd7-bc7cb072e715', 'Registered', 'annone', 'Ann', 'Cushing', 'testann@test.com', '$2a$12$k5K4t5cnxBBXzET4lAkDPO6enm51Zl.IrddO8RK.XNgM.PiUWcOje', '567 757 7578', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlNDQ2Y2Y1ZS0zMTQ5LTQzMmYtOWJkNy1iYzdjYjA3MmU3MTUiLCJlbWFpbCI6InRlc3Rhbm5AdGVzdC5jb20iLCJpYXQiOjE2NTk5NjE5MjgsImV4cCI6MTY2MDA0ODMyOH0.YzAcK2wHFRhTyrz-T9Z1yyvO7cYSR3sKEMOOqMf5T7A', NULL, '2022-08-08 05:31:46', '2022-08-08 05:32:53'),
('ff71c138-f7d7-4bb1-9ffc-e901e11fcaa5', 'Guest', 'guest', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, '2022-10-22 16:50:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('Billing','Shipping','BillingShipping') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `state_province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `postal_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `country` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `company` varchar(29) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `user_id`, `name`, `type`, `phone`, `address`, `city`, `state_province`, `postal_code`, `country`, `company`, `created_at`, `updated_at`) VALUES
(4, '1e5e590e-1f15-4058-9c81-5d036efa19aa', NULL, 'Billing', '', '', '', 'CA', '', 'US', '', '2022-10-02 17:46:30', NULL),
(5, '35a42b63-13db-40b8-97e0-f7a86ea9aef2', NULL, 'Billing', '', '', '', 'CA', '', 'US', '', '2022-10-02 17:46:30', NULL),
(6, '489de46b-d2c2-4f76-b8c9-c5d4199798f2', NULL, 'Billing', '650 123-4567', 'West 21 Jump Street', 'San Jose', 'CA', '90070', 'USA', NULL, '2022-10-02 17:46:30', NULL),
(7, '8c390b6c-242d-4d57-aff5-593bda5b00d5', NULL, 'Billing', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', '', '2022-10-02 17:46:30', NULL),
(8, '8fa649b2-2fe7-4734-83a3-3da8f81e6804', NULL, 'Billing', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', 'Test', '2022-10-02 17:46:30', NULL),
(9, '9c03b8a9-9b36-4f6a-88f0-12d52afbc17c', NULL, 'Billing', '', '', '', 'CA', '', 'US', '', '2022-10-02 17:46:30', NULL),
(10, 'a60777af-987e-4529-86d6-70e4371a43a1', NULL, 'Billing', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', '', '2022-10-02 17:46:30', NULL),
(11, 'ac5b94d2-4eeb-486e-9acc-955ca87c0dc6', NULL, 'Billing', '659 5968 866', '201 B Street', 'Belmont', 'CA', '94022', 'US', '', '2022-10-02 17:46:30', NULL),
(12, 'ad95db04-4a63-4648-9a1a-8c62f500e4bc', NULL, 'Billing', '650 678 4578', '13 Miller Way', 'San Carlos', 'CA', '94002', 'US', '', '2022-10-02 17:46:30', NULL),
(13, 'b2919210-d5c0-4e37-8ca0-994eae120102', NULL, 'Billing', '650 789 5678', '', '', 'CA', '', 'US', '', '2022-10-02 17:46:30', NULL),
(14, 'b6a19327-e5d5-4b06-aba6-3607d81671a6', NULL, 'Billing', '(650) 703 3736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', 'Test', '2022-10-02 17:46:30', '2022-10-17 13:46:23'),
(15, 'e3d7bae3-9656-4667-b7d6-c9f9c5892df6', NULL, 'Billing', '650 123-4567', '21 Jump Street', 'San Carlos', 'CA', '94070', 'USA', NULL, '2022-10-02 17:46:30', NULL),
(16, 'e446cf5e-3149-432f-9bd7-bc7cb072e715', NULL, 'Billing', '567 757 7578', 'Somewhere St', 'Somewhere', 'CA', '47575', 'US', '', '2022-10-02 17:46:30', NULL),
(19, 'c885de3f-6373-4d62-96a1-c9f47d24656e', NULL, 'Billing', '585 858 5858', '347 Birch Street', 'Olander', 'FL', '08457', 'US', '', '2022-10-02 17:46:30', NULL),
(22, 'b5fc6031-c627-49a9-83cf-2b5287630466', NULL, 'Billing', '650 858 5858', '14 Somewhere Blvd', 'Somewhere', 'CA', '94575', 'US', '', '2022-10-02 17:46:30', NULL),
(23, '89325b79-cc53-40a9-9fa5-cbd8d11dd56f', NULL, 'Billing', '678 585 8585', '8264 Elseware Lane', 'Lucious', 'CA', '90456', 'US', '', '2022-10-02 17:46:30', NULL),
(30, '91f0b9c5-a3a1-4a7c-a6ee-46153dad3418', NULL, 'Billing', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', '', '2022-10-15 17:03:03', NULL),
(31, 'b6a19327-e5d5-4b06-aba6-3607d81671a6', NULL, 'Billing', '(650) 703 3736', '1772 Terrace Drive', 'Belmont', 'CA', '94002', 'US', 'Test', '2022-10-15 17:03:03', '2022-10-17 13:46:23'),
(32, '81a477ab-e32e-4caf-b3ea-a4740a1e9713', NULL, 'Billing', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', 'Done', '2022-10-18 10:19:26', '2022-10-18 10:26:10'),
(33, 'c5c683e2-97e1-43aa-a2d5-899317af045e', NULL, 'Billing', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', '', '2022-10-18 10:53:15', NULL),
(34, '25176827-7f64-4c6f-8618-42c1421bdf0b', NULL, 'Billing', '6507033736', '201 Burns Valley Road', 'Loma Mar', 'CA', '94021', 'US', '', '2022-11-13 10:32:52', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user-cart` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `cart_item_category` (`category_id`),
  ADD KEY `cart_item_product` (`product_id`) USING BTREE,
  ADD KEY `parent_cart` (`cart_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category-key` (`url_key`),
  ADD KEY `parent_category` (`parent_category`);

--
-- Indexes for table `customer_cc`
--
ALTER TABLE `customer_cc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cc_address` (`address_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user-order` (`user_id`),
  ADD KEY `user_address_id` (`address_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_order_item` (`category_id`),
  ADD KEY `product_order_item` (`product_id`),
  ADD KEY `order_order_item` (`order_id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent-product` (`product`);
ALTER TABLE `price` ADD FULLTEXT KEY `title` (`title`,`description`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_key-idx` (`url_key`);
ALTER TABLE `product` ADD FULLTEXT KEY `search_text` (`title`,`description`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`) USING BTREE,
  ADD KEY `product` (`product`);

--
-- Indexes for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_addesses` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `customer_cc`
--
ALTER TABLE `customer_cc`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3065;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `units_of_measure`
--
ALTER TABLE `units_of_measure`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `user-cart` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `parent_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

--
-- Constraints for table `customer_cc`
--
ALTER TABLE `customer_cc`
  ADD CONSTRAINT `cc_address` FOREIGN KEY (`address_id`) REFERENCES `user_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `user-order` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `user_address_id` FOREIGN KEY (`address_id`) REFERENCES `user_address` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `category_order_item` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_order_item` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_order_item` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `parent-product` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_addesses` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
