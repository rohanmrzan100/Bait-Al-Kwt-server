-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: defaultdb
-- ------------------------------------------------------
-- Server version	8.0.37-0ubuntu0.22.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `defaultdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `defaultdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `defaultdb`;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('3f63eff2-8be2-45ab-a50b-e5456152c6ed','e36b6a10d5b74a18c32c2ff4ef1788ecfe3f265b8fccbd172c25251fd78919e2','2024-06-30 07:33:38.020','20240604143637_init',NULL,NULL,'2024-06-30 07:33:37.908',1),('82eb3cba-ccf7-4a39-9233-51feb0ca5225','e961c26987677bda295d714e12727c97bed7edb58e16d37749d85dd12a7ef3ff','2024-06-30 07:33:37.906','20240604080500_init',NULL,NULL,'2024-06-30 07:33:37.724',1),('9287264e-b7a4-4fa4-8db3-e9a4dcced1aa','99151c604aae4787d15071d2d84d63aacc2725e4b967be9e9398b29b4c3af6d7','2024-06-30 07:33:38.091','20240607074703_init',NULL,NULL,'2024-06-30 07:33:38.076',1),('e9cb6f0e-3783-4146-8ab1-6fd2b13db43c','72d5e18cbce358c138bfae6075d5bb271e26823c075cdadd411a7ee3445b9e7f','2024-06-30 07:33:38.074','20240607074521_init',NULL,NULL,'2024-06-30 07:33:38.022',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streetAddress` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postalCode` int NOT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_userId_fkey` (`userId`),
  CONSTRAINT `address_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `colorCode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_productId_fkey` (`productId`),
  CONSTRAINT `image_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('018479cb-85d8-4c37-ba1c-14e96c84977d','http://202.51.82.22:8001/1720872863345image30.jpg','Black','#000000','85e5c849-3ed5-422e-a73c-eb725169ea12'),('08457cd7-7ec7-45ed-9cb3-63fbd59d88a5','http://202.51.82.22:8001/1720873574728image4.png','White','#FFFFFF','90b13916-b2cb-436e-9cc1-f8c4cd8998bb'),('08e2d94b-0724-44e7-a116-21714ed5006e','http://202.51.82.22:8001/1720872801058image26.jpg','White','#FFFFFF','940bd32b-4ecb-43c2-a2f5-3bb9108606fb'),('0e7a8c68-9f03-47c4-9d1d-fdcedb7da945','http://202.51.82.22:8001/1720872947483image21.jpg','Silver','#C0C0C0','8a8a615c-5995-400b-8f21-f71b4b494c2a'),('0ec86ce7-7165-429b-9cd6-540f7cfa9993','http://202.51.82.22:8001/1720874069810image19.jpg','White','#FFFFFF','ca0bc6b0-5ce3-4f64-8071-8f4544e47dff'),('0ede33f5-4e77-4ce0-b8a8-5fd344556616','http://202.51.82.22:8001/1720939446303image63.png','Blue','#0000FF','b4652c63-a044-42fc-a92d-24ef250e1715'),('13911de1-221d-4210-821a-2c716db92e49','http://202.51.82.22:8001/1720936731183image66.jpg','Blue','#0000FF','c8d1edc5-80e1-4042-a531-6289386d6227'),('22659a5c-0add-4f97-a3fb-a16ae5fbc397','http://202.51.82.22:5000/1719733882411093b777a4bf884d194d423a8e5fbb6b2.jpg','Blue','#0000FF','6c8331e6-16b0-438e-b0c9-939486429d09'),('2650e95e-2622-4b34-8a55-60c65e35ba21','http://202.51.82.22:8001/1720872589111image8.jpg','Black','#000000','af6879f2-6ac3-4fc6-bb41-ec69de58f273'),('2760bc62-ea9e-4315-9938-107443b78aa7','http://202.51.82.22:8001/1720936621356image69.jpg','Blue','#0000FF','eda92b55-c5cd-4f5a-ae63-f11e6bf2765e'),('2ccf7238-fa77-428f-b927-6b41277052df','http://202.51.82.22:8001/1720937797522image28.png','Silver','#C0C0C0','ce088c14-6a7f-4181-89c6-d507929efe4c'),('2d7d3cde-d4c9-4508-906f-2f02933c2af2','http://202.51.82.22:5000/17197335152869da22701125d949ac9090d305269feab.jpg','Silver','#C0C0C0','e9396bc4-1083-4caf-bfca-6aab1a219cf8'),('2ee3dd19-11c9-4c66-ac71-5b6e5162d45c','http://202.51.82.22:8001/1720873766840image32.png','White','#FFFFFF','53498098-f2ab-4808-badf-b126d7e18df4'),('3207df61-a49b-4f86-982a-edec157210bc','http://202.51.82.22:8001/1720937211121image18.png','Black','#000000','82bb3cbc-8a1d-499f-b4b5-c42661892ca8'),('366291d1-236f-4d9a-9641-378c9a12c03d','http://202.51.82.22:8001/1720872751019image34.png','Black','#000000','9ec23cea-8803-4819-b2c4-4527bafe7a1d'),('36de0493-8025-4b8a-a5ab-0f8c7b3338a1','http://202.51.82.22:8001/1720936698631image67.jpg','Silver','#C0C0C0','663a4694-cbe7-4aaa-a91a-81de18e331c2'),('3720e288-9a06-4093-942b-61745f409234','http://202.51.82.22:8001/1720873315226image17.jpg','Silver','#C0C0C0','ec107741-6834-4197-8c9a-3ca7d3cd6a45'),('386f0cba-90ca-4633-b22f-a8e5f7ee22a0','http://202.51.82.22:8001/1720873945369image31.png','White','#FFFFFF','c34173b9-19a0-40b6-b126-6ad1643d6498'),('3dda6a64-a10b-489e-810f-17fc52c2bf84','http://202.51.82.22:8001/1720939571703image57.png','Black','#000000','50f4bd86-fb07-43fe-813c-7a55513f7c4c'),('41495eb3-cf6b-41d1-abaa-3667f16a2583','http://202.51.82.22:8001/1720872983027image20.jpg','White','#FFFFFF','c29a037a-fe60-49b9-81e0-a59688b5b734'),('4186187a-6981-4e8c-979b-abdf952d02e0','http://202.51.82.22:8001/1720873051080image20.jpg','Silver','#C0C0C0','34cadd23-0fbd-4fff-9a10-6d952203ae79'),('41b800d2-a350-427b-a45d-a9057b128ee9','http://202.51.82.22:8001/1720936585602image9.jpg','Blue','#0000FF','8f6231c7-bb99-4609-9fec-2b6c7cdd1ecf'),('460aa392-abbb-4d84-894e-2408c4b1ac8f','http://202.51.82.22:8001/1720873992667image29.jpg','White','#FFFFFF','e63c1829-ffbf-4de7-a158-edc01d7be9a8'),('481e65d2-fbb2-4f46-92fc-307eadd3b9c2','http://202.51.82.22:8001/1720938308301image76.jpg','White','#FFFFFF','6ee046ae-ee27-408d-afc9-fb360e31b1ed'),('4c162794-9d45-49d7-b20d-785e828ff604','http://202.51.82.22:8001/1720873112609image16.png','White','#FFFFFF','323af197-5343-46f3-b3f1-9561f6247425'),('4e9f4451-4bc6-44c9-a58d-4b678e138d1a','http://202.51.82.22:8001/1720872713812image2.jpg','White','#FFFFFF','24034ecf-8489-439d-9479-63db6ef62461'),('4f24f1ef-8756-4e0d-b332-f0079b8b4751','http://202.51.82.22:8001/1720872525763image5.jpg','Red','#FF0000','65bd04dd-456e-4018-8ba3-8342e2ffba3d'),('4f52f291-2ea2-40a3-ba0e-f4a944fbc75f','http://202.51.82.22:8001/1720938465998image41.jpg','Black','#000000','e82d0ba9-4e87-4085-8cf5-f65490486e5d'),('55c53ac8-b17e-495a-8d67-ecc94552924b','http://202.51.82.22:5000/1719733580701ed88dfaf3b58cf56b501d3683e5acfd7.jpg','Red','#FF0000','01d56764-bacc-4ba3-8387-8809b983fea0'),('57b471a3-9f6b-40be-a2c2-3ef80c84e9c7','http://202.51.82.22:5000/1719733285084b26da769626fadc7629f0ced10632294.jpg','Yellow','#FFFF00','a575ddff-445f-4821-9256-f4eaf40ce36e'),('57e9138a-a945-4cf3-8dfb-b8983aea84d4','http://202.51.82.22:8001/1720872890315image28.jpg','White','#FFFFFF','d2cc4f7f-264f-40cd-aa5d-a413d67f307c'),('583dddff-d9c0-4245-9dc3-d105efa25adf','http://202.51.82.22:5000/17197335807075a35b8985922a0b60eed4f3de676c282.jpg','Gray','#808080','01d56764-bacc-4ba3-8387-8809b983fea0'),('58c2a24f-4cd7-4fc8-82cb-fc564f27c1ab','http://202.51.82.22:8001/1720936671968image70.jpg','Red','#FF0000','cdfe5877-36df-457a-85b5-b6a244fe67df'),('5b36d9d0-cdfa-4922-a33f-ca7a9b60fad3','http://202.51.82.22:8001/1720937949321image26.jpg','Blue','#0000FF','34403c70-0db4-4a27-9d5c-d3c83c7cba29'),('5e78130d-cb2d-48c5-90af-f833bd756734','http://202.51.82.22:5000/17197337493075f78e4533d6a496d279891c0cc02b561.jpg','White','#FFFFFF','21ac927b-1225-42e6-abe5-415c22b1c50c'),('60b712ea-5982-47fe-b548-fba1b2c515b1','http://202.51.82.22:5000/17197337493025f78e4533d6a496d279891c0cc02b561.jpg','Black','#000000','21ac927b-1225-42e6-abe5-415c22b1c50c'),('60b7b010-0960-4f17-b547-ba90ae34a80d','http://202.51.82.22:8001/1720936645167image71.jpg','Yellow','#FFFF00','c39d5b9c-6452-4797-8281-d8a17e25dc10'),('632cb34f-d0a0-49c3-8ec1-bab49a8e5624','http://202.51.82.22:8001/1720872479089image14.png','White','#FFFFFF','0570c9ab-4abd-47e6-9711-fb20153b531d'),('63fd5576-950a-4389-aa50-51796a2f88d3','http://202.51.82.22:8001/1720872832354image24.jpg','Blue','#0000FF','0d6f555e-7198-4007-9fe8-f10af8e9fdd0'),('65ebf44a-4b8e-4860-b233-72ec87d1150a','http://202.51.82.22:8001/1720937133673image17.png','Green','#008000','951b83ea-3db9-4bf4-a7f9-709327304c1c'),('692ecf1e-32dd-47e2-a897-af3f82a7db77','http://202.51.82.22:8001/1720937764155image30.png','Silver','#C0C0C0','ac8462fe-3730-4a36-8613-800aba6000d9'),('6b4f0f96-aa38-4193-9dcf-62cdb21f5e22','http://202.51.82.22:8001/1720874012869image22.png','White','#FFFFFF','49e5b579-b6b2-41bf-90a4-f6d2f559051e'),('6ca5685b-6213-4764-b41a-ab6bf01e3e89','http://202.51.82.22:5000/1719733467852e42c7aa90c06146ecc99bc6f30504430.jpg','Blue','#0000FF','6d641335-281b-4bb1-aa79-a9018c882a54'),('7050f12a-c2ee-4c60-b7e8-29d3e41ad06d','http://202.51.82.22:5000/17197332851036d6b675ee98e8405952e0325a6cf86de.jpg','Gray','#808080','a575ddff-445f-4821-9256-f4eaf40ce36e'),('71ce136e-6095-4dad-ac4f-98d0250bb807','http://202.51.82.22:5000/1719733628785e549d667eed5982975d053a8508a2bf9.jpg','Red','#FF0000','e84f1b5a-439b-479d-8e10-c6f2851d2e0b'),('726a8113-bc7e-4c78-b179-89f23e180b9e','http://202.51.82.22:5000/1719733882394093b777a4bf884d194d423a8e5fbb6b2.jpg','Black','#000000','6c8331e6-16b0-438e-b0c9-939486429d09'),('820c609a-5578-424b-8018-feefa1ab2cf5','http://202.51.82.22:8001/1720873734139image33.png','White','#FFFFFF','cf91ded6-03db-4077-86ed-2c09c89495e2'),('86e37ee7-9c92-4669-9589-c3bffef0b516','http://202.51.82.22:8001/1720873475745image15.png','White','#FFFFFF','d7f86da5-0843-4167-a2ca-2678235243a5'),('8a967853-a94c-403a-b397-079893d8b70e','http://202.51.82.22:8001/1720936753127image68.png','Blue','#0000FF','ecbeab46-f914-49f1-8dcc-53e0419af83a'),('8b94906d-bc39-4a2a-a0d1-289ef231fec0','http://202.51.82.22:8001/1720938308301image76.jpg','Red','#FF0000','6ee046ae-ee27-408d-afc9-fb360e31b1ed'),('901c3156-55da-4299-b0ef-7fc919fcd356','http://202.51.82.22:8001/1720938280101image74.jpg','Silver','#C0C0C0','623e0c84-d7b3-403f-bbe8-081d9a5b02ae'),('9062508a-58b9-4449-9a41-4bd039428180','http://202.51.82.22:8001/1720937261730image26.png','Red','#FF0000','a0704731-9486-450d-8fc2-aec1adf31e93'),('950492df-3d21-48e2-9c60-734b42720ddd','http://202.51.82.22:8001/1720937330381image29.jpg','White','#FFFFFF','d4b1a08c-f4a1-4768-b157-8aa608bc2c74'),('9654ca49-ab5a-411c-b5eb-c4d7adc6b1cc','http://202.51.82.22:8001/1720938422772image44.jpg','Blue','#0000FF','0d92039f-6e73-4926-a1fd-f3f54df527d0'),('98293465-3e27-472e-9cb1-951523a3fe5d','http://202.51.82.22:8001/1720873510000image18.png','Black','#000000','234e0220-8a8e-4edd-bdc6-e4bc26b93cbd'),('9849f493-356b-492a-9f2f-6aff3f379223','http://202.51.82.22:5000/1719733628793fff123dc8b1889d9b4c7d6e17b028da6.jpg','Blue','#0000FF','e84f1b5a-439b-479d-8e10-c6f2851d2e0b'),('98aceca2-55b5-4966-85b5-11e730ea8421','http://202.51.82.22:8001/1720937907590image23.jpg','White','#FFFFFF','6a19f22e-1080-4277-bfee-6b8c59fdef6b'),('99a9af7d-e61c-4eef-a8f3-e5a006e0eb92','http://202.51.82.22:8001/1720937156999image19.png','Blue','#0000FF','4742d387-d292-46e4-8b55-0a344054f909'),('9ffee4f9-1c28-4e89-8c8f-a27b18743881','http://202.51.82.22:8001/1720872630180image7.jpg','Black','#000000','27eb951e-0f76-4fef-881e-a25759bd3993'),('a03017f2-b271-4c58-b6f9-f4d0fa75566c','http://202.51.82.22:8001/1720937304139image30.png','Blue','#0000FF','6052669b-3cf8-46c8-9bd9-44b18861f98b'),('a26d2dbe-a288-4f55-b008-c625d00c0bcc','http://202.51.82.22:8001/1720873011519image23.jpg','Black','#000000','506cd355-bed7-4fa5-ae5b-b64d1d55b388'),('a67ace1f-a879-4ca0-9bd1-971f9e95d055','http://202.51.82.22:8001/1720938335424image73.jpg','Gray','#808080','482cd0bf-9f52-4874-9a35-e9a25fe852da'),('a72cbb62-8d35-4f14-ae66-afe4ad1b02eb','http://202.51.82.22:8001/1720874053069image19.jpg','White','#FFFFFF','ba684511-b620-4c7b-9a99-809b7c1c0e20'),('a81c5603-a161-4350-aa95-76d360d70eb3','http://202.51.82.22:8001/1720938422772image44.jpg','Gray','#808080','0d92039f-6e73-4926-a1fd-f3f54df527d0'),('bb83e506-5108-43f3-981d-a2faa182a95c','http://202.51.82.22:8001/1720873914728image25.jpg','White','#FFFFFF','75122d6d-75b2-4e1b-a3d5-c505494ce084'),('bc120717-eaf2-4bed-b0c5-35c164dae2f9','http://202.51.82.22:8001/1720937236732image21.png','Red','#FF0000','c0fae3e6-0e7e-42e7-b758-5cc99d80b7ae'),('bcfe40e2-59b7-4003-9d2e-a6c33e7368d9','http://202.51.82.22:8001/1720937190383image18.png','Black','#000000','e2bc9d1b-2147-4a19-af66-89c9705dc6d2'),('bf53293a-d175-4246-a53d-4df96312a387','http://202.51.82.22:5000/1719733793478bb5366b5d2ec46f9aef13b57fe73f46c.jpg','White','#FFFFFF','3d2611e8-ffaa-438b-a80c-8b76ca907ed9'),('c1d61396-b4f2-4829-81a1-77fbfb48fd57','http://202.51.82.22:8001/1720939498687image68.png','White','#FFFFFF','9281e9ba-6665-4cb3-b6de-67d0e1c0f5aa'),('c3e46fc9-f8b7-4409-a815-a3399440c1e4','http://202.51.82.22:8001/1720873890633image27.png','White','#FFFFFF','c69dc237-f10f-4d34-b388-e92de1906617'),('cbf983f5-6dab-4244-9b95-83978a60521d','http://202.51.82.22:5000/171973366821115a717728d5260a33f35575e797ea1b8.jpg','Gray','#808080','3535c0c2-671c-4729-95ef-d6a017ec4878'),('cef1dd7a-acac-44ea-9b17-1f5aa32629b7','http://202.51.82.22:8001/1720939472486image63.png','Blue','#0000FF','87e35668-d274-46ce-b0d5-f62fdc9f6945'),('cf14d7b9-1d4f-42d1-b710-6dd599f44f7c','http://202.51.82.22:8001/1720937832445image23.jpg','White','#FFFFFF','0a8f238e-da1b-48de-b0c2-35e3a3259275'),('d2962167-48e2-40ba-9523-e64541ef6a3c','http://202.51.82.22:8001/1720872479088image12.png','Black','#000000','0570c9ab-4abd-47e6-9711-fb20153b531d'),('d2fef430-60bc-4cd5-8217-5dbe342242ce','http://202.51.82.22:5000/171973320814685ede3dac52422b74050e069894afbc2.jpg','Red','#FF0000','6bcd269c-130f-4a10-bc75-868be470a2dd'),('dafa218c-b3b0-431a-96ad-5601e923e799','http://202.51.82.22:5000/1719733835287b27aa195f8ece8b7e6879eaa15fae43f.jpg','White','#FFFFFF','f6887f18-dbe5-4cb2-9864-7a212407bc8f'),('db06b09f-223c-4dc8-9f7d-d5d6ecfc396e','http://202.51.82.22:8001/1720938539872image43.png','Blue','#0000FF','deb4370d-b6bc-4b0b-8a21-eb8a5c2a414e'),('e0ab0188-e77d-4aff-b03d-cc44e731db18','http://202.51.82.22:8001/1720936354512image8.jpg','Red','#FF0000','7563aca9-6c6e-4598-b318-7f32529a0681'),('e1192adf-ad21-401d-8d04-7b82cfa37ad1','http://202.51.82.22:8001/1720937282693image23.jpg','White','#FFFFFF','a771e248-4e50-4749-8ba9-b60c69bb15c8'),('e7c425b3-d180-45de-b482-6859e2ef9e11','http://202.51.82.22:8001/1720939516642image68.png','White','#FFFFFF','31aa953c-2680-4149-a0bf-8d5bf9512434'),('e9885416-855c-480e-a124-2191535c348e','http://202.51.82.22:8001/1720939343329image59.jpg','Blue','#0000FF','4d6559e3-abc3-4636-a33d-efe05112dc21'),('eb299fcb-859d-46ec-bb23-468fb757e1d9','http://202.51.82.22:5000/1719733702659d17c813cb9e8bf42c0dad99ae7d5364b.jpg','Green','#008000','3e7a0698-a6ad-4023-b5b0-ae8e2c320ac0'),('ecc6aa21-402f-4666-b457-6853f70b4c17','http://202.51.82.22:8001/1720939388679image98.png','Blue','#0000FF','022db654-dc28-40ec-aadb-996b27b14ad8'),('ed329432-8bd1-47ad-9e94-aae78e428658','http://202.51.82.22:8001/1720873550235image6.png','White','#FFFFFF','5c8100cb-91f2-4cae-8498-0d513acdf959'),('eefc88d6-f0fb-4747-87fa-fc471a4f58bf','http://202.51.82.22:8001/1720938025590image46.jpg','White','#FFFFFF','5017bbd5-575c-426a-a59d-6b40d64a4634'),('f110dc4a-5ecb-46c6-b775-b5d9db4a8a03','http://202.51.82.22:8001/1720937857062image23.jpg','White','#FFFFFF','d7148ff4-c197-47ca-965b-f012b65ab77b'),('f22a478b-e1f7-4d86-a7f5-6837228514cd','http://202.51.82.22:8001/1720872713812image8.jpg','Black','#000000','24034ecf-8489-439d-9479-63db6ef62461'),('f483fbfe-e93e-4172-ac48-41bbe779df01','http://202.51.82.22:8001/1720873816870image35.png','Black','#000000','6ac1e6f6-f494-4888-85b1-2f4c5b9fbcc1'),('f652a692-7b37-42b2-9420-99ecc6c0b14b','http://202.51.82.22:8001/1720873816870image36.jpg','White','#FFFFFF','6ac1e6f6-f494-4888-85b1-2f4c5b9fbcc1'),('f7606406-4d07-4a0f-92fc-421b0b102cf3','http://202.51.82.22:8001/1720873415940image10.png','Black','#000000','b2c57e7a-f55e-4eb3-973d-84eeed9051c8'),('f8f7765c-8c91-477b-8bb5-c031a33199a3','http://202.51.82.22:8001/1720872589111image3.jpg','White','#FFFFFF','af6879f2-6ac3-4fc6-bb41-ec69de58f273'),('fa6eedda-6728-4613-b3b9-45bdab7feeb0','http://202.51.82.22:8001/1720939413843image99.png','Black','#000000','4a76d572-a384-49c8-ad8f-2862b4b5072d'),('fa85422b-a5d8-404a-9267-01b54a348fc4','http://202.51.82.22:8001/1720873112609image13.jpg','Black','#000000','323af197-5343-46f3-b3f1-9561f6247425'),('fb72d127-05b7-4e2a-9d10-ef51688a0f3f','http://202.51.82.22:8001/1720873601939image9.jpg','Black','#000000','e17e1b2c-b431-40ff-a8bb-d102af625b72'),('fd793d74-852d-4e50-a6ed-5cc1718518de','http://202.51.82.22:8001/1720873415938image15.png','White','#FFFFFF','b2c57e7a-f55e-4eb3-973d-84eeed9051c8'),('fe156eab-910d-4886-81da-dd6e24dcc93e','http://202.51.82.22:8001/1720938490346image40.png','Black','#000000','3c29d4bb-44ab-4cd4-9ade-7597eab05930'),('ff853157-3b35-434e-a6d8-3258b45e3511','http://202.51.82.22:8001/1720936386805image10.jpg','Blue','#0000FF','ec09517f-0abc-40b5-9f7a-2b15e6cd37e0');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inStock` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('01d56764-bacc-4ba3-8387-8809b983fea0','Double Bucket Trolley Chrome',16,'Trolley','Product Name: 60L Mop wringer trolley\r\nMeasurement: 86 x 41 x 90 (cm)\r\nPackage: 2pcs/ctn\r\nColor: Red & Blue bucket',1,'2024-06-30 07:46:20.724'),('022db654-dc28-40ec-aadb-996b27b14ad8','Mop Set Self Tighten 32cm',2.5,'Cleaning Tool','Mop Set Self Tighten 32cm',1,'2024-07-14 06:43:08.693'),('0570c9ab-4abd-47e6-9711-fb20153b531d','Dispenser Metered Aerosol – Digital Automatic',6,'Dispensers','Dispenser Metered Aerosol – Digital Automatic',1,'2024-07-13 12:07:59.101'),('0a8f238e-da1b-48de-b0c2-35e3a3259275','Plastic Tea Spoon',4.25,'Catering Consumables','Plastic Tea Spoon\r\n20x100pcs',1,'2024-07-14 06:17:12.449'),('0d6f555e-7198-4007-9fe8-f10af8e9fdd0','Dispenser Toilet Tissue Mini T.Box – Transparent Black Code. MJ1TB',3.25,'Dispensers','Dispenser Toilet Tissue Mini T.Box – Transparent Black\r\nCode. MJ1TB\r\n',1,'2024-07-13 12:13:52.362'),('0d92039f-6e73-4926-a1fd-f3f54df527d0','Garbage bin with Moving Lid – 20Ltrs Capacity Color: Blue/Grey',2.75,'Trash Bin','Garbage bin with Moving Lid – 20Ltrs Capacity\r\nColor: Blue/Grey\r\n',1,'2024-07-14 06:27:02.773'),('21ac927b-1225-42e6-abe5-415c22b1c50c','Manual Dispenser Soap/Foam/Sanitizer',5,'Dispensers','Color: White\r\n\r\nCapacity: 750ml\r\n\r\nPacking: Each',1,'2024-06-30 07:49:09.313'),('234e0220-8a8e-4edd-bdc6-e4bc26b93cbd','Super Compact Sensor Autocut Paper Towel Dispenser –  Translucent Black Color',19,'Dispensers','Super Compact Sensor Autocut Paper Towel Dispenser – \r\nTranslucent Black Color\r\n',1,'2024-07-13 12:25:10.001'),('24034ecf-8489-439d-9479-63db6ef62461','Dispenser Mini Towel Center Pull',3,'Dispensers','Dispenser Mini Towel Center Pull',1,'2024-07-13 12:11:53.814'),('27eb951e-0f76-4fef-881e-a25759bd3993','Dispenser Towel Center Pull',4.5,'Dispensers','Dispenser Towel Center Pull',1,'2024-07-13 12:10:30.181'),('31aa953c-2680-4149-a0bf-8d5bf9512434','Microfiber Mop Cloth 40cm With Shade Lining',1.5,'Cleaning Tool','Microfiber Mop Cloth 40cm\r\nWith Shade Lining\r\n',1,'2024-07-14 06:45:16.704'),('323af197-5343-46f3-b3f1-9561f6247425','Dispenser Towel C-Fold  600 Sheets Capacity Translucent White Color',6,'Dispensers','Dispenser Towel C-Fold \r\n600 Sheets Capacity\r\nTranslucent White Color\r\n',1,'2024-07-13 12:18:32.611'),('34403c70-0db4-4a27-9d5c-d3c83c7cba29','Face Mask Disposable – 50pc/Pkt',0.5,'Catering Consumables','Face Mask Disposable – 50pc/Pkt\r\n1x50pcs',1,'2024-07-14 06:19:09.322'),('34cadd23-0fbd-4fff-9a10-6d952203ae79','Dispenser Towel C-Fold – Metallic Chrome - 200 Sheets Capacity Code. K40M',5,'Dispensers','Dispenser Towel C-Fold – Metallic Chrome - 200 Sheets Capacity\r\nCode. K40M\r\n',1,'2024-07-13 12:17:31.082'),('3535c0c2-671c-4729-95ef-d6a017ec4878','Window Squeeze 18\".14\".10\"',1.5,'Cleaning Tool','Size: 18\".14\".10\"',1,'2024-06-30 07:47:48.271'),('3c29d4bb-44ab-4cd4-9ade-7597eab05930','Garbage bin with Push Lid – 60Ltrs Capacity – AF07309',6,'Trash Bin','Garbage bin with Push Lid – 60Ltrs Capacity – AF07309',1,'2024-07-14 06:28:10.350'),('3d2611e8-ffaa-438b-a80c-8b76ca907ed9','Dispenser Z Folder Paper Towel White',4.5,'Dispensers','Color: White\r\n\r\nCapacity: 200 Paper',1,'2024-06-30 07:49:53.491'),('3e7a0698-a6ad-4023-b5b0-ae8e2c320ac0','Garbage Bag Plastic Black',5,'Cleaning Tool','Color: Black\r\nSize: 110x85\r\nweight: 10Kg\r\nPacking: Each',1,'2024-06-30 07:48:22.682'),('4742d387-d292-46e4-8b55-0a344054f909','All Purpose Cleaner, Clean Care Brand – 25Ltrs/Drum',3.25,'Cleaning Chemicals','All Purpose Cleaner, Clean Care Brand – 25Ltrs/Drum',1,'2024-07-14 06:05:57.166'),('482cd0bf-9f52-4874-9a35-e9a25fe852da','Garbage bin with Moving Lid – 10Ltrs Capacity – Code. AF07026',1.75,'Trash Bin','Garbage bin with Moving Lid – 10Ltrs Capacity – Code. AF07026',1,'2024-07-14 06:25:35.425'),('49e5b579-b6b2-41bf-90a4-f6d2f559051e','Hand Dryer Automatic – ABS White Color 1600W, 220-240V, 50/60 HZ  Model. BY804',20,'Dispensers','Hand Dryer Automatic – ABS White Color\r\n1600W, 220-240V, 50/60 HZ \r\nModel. BY804\r\n',1,'2024-07-13 12:33:32.885'),('4a76d572-a384-49c8-ad8f-2862b4b5072d','Microfiber Damp Mop Complete Set – 60cm',5.75,'Cleaning Tool','Microfiber Damp Mop Complete Set – 60cm',1,'2024-07-14 06:43:33.853'),('4d6559e3-abc3-4636-a33d-efe05112dc21','Mop Refill 40cm for Spray Mop Wax Applicator',1.5,'Cleaning Tool','Mop Refill 40cm for Spray Mop Wax Applicator',1,'2024-07-14 06:42:23.330'),('5017bbd5-575c-426a-a59d-6b40d64a4634','Shoe Cover – White/Blue',26,'Catering Consumables','Shoe Cover – White/Blue\r\n20x100pcs',1,'2024-07-14 06:20:25.591'),('506cd355-bed7-4fa5-ae5b-b64d1d55b388','Dispenser Towel C-Fold – Black 200 Sheets Capacity Code. K40B',4,'Dispensers','Dispenser Towel C-Fold – Black\r\n200 Sheets Capacity\r\nCode. K40B\r\n',1,'2024-07-13 12:16:51.520'),('50f4bd86-fb07-43fe-813c-7a55513f7c4c','Microfiber Cloth, Size: 40x40cm Color: Blue, Green, Red & Yellow',0,'Cleaning Tool','Microfiber Cloth, Size: 40x40cm\r\nColor: Blue, Green, Red & Yellow\r\n',1,'2024-07-14 06:46:11.722'),('53498098-f2ab-4808-badf-b126d7e18df4','Sensor Dispenser Liquid Soap/Foam/Sanitizer,  500ml Capacity Code. SA-7600A',12,'Dispensers','Sensor Dispenser Liquid Soap/Foam/Sanitizer, \r\n500ml Capacity\r\nCode. SA-7600A\r\n',1,'2024-07-13 12:29:26.850'),('5c8100cb-91f2-4cae-8498-0d513acdf959','Manual Dispenser Soap/Foam/Sanitizer – White – 750ml Capacity Model. SA-7600M',5,'Dispensers','Manual Dispenser Soap/Foam/Sanitizer – White – 750ml Capacity\r\nModel. SA-7600M\r\nمل  750 جهاز صابون  – ابيض\r\n',1,'2024-07-13 12:25:50.240'),('6052669b-3cf8-46c8-9bd9-44b18861f98b','Hand Liquid Soap, Clean Care Brand – 500ml/Pump Bottle',9,'Cleaning Chemicals','Hand Liquid Soap, Clean Care Brand – 500ml/Pump Bottle',1,'2024-07-14 06:08:24.277'),('623e0c84-d7b3-403f-bbe8-081d9a5b02ae','Garbage Bin Steel Net Black',1,'Trash Bin','Garbage Bin Steel Net Black',1,'2024-07-14 06:24:40.102'),('65bd04dd-456e-4018-8ba3-8342e2ffba3d','Refill Aerosol Can for Automatic Dispenser, Green World Brand – Assorted Fragrances',0,'Dispensers','Refill Aerosol Can for Automatic Dispenser, Green World Brand – Assorted Fragrances',1,'2024-07-13 12:08:45.768'),('663a4694-cbe7-4aaa-a91a-81de18e331c2','Plastic Spin Mop Pail with Wringer with Mop Complete',6,'Trolley','Plastic Spin Mop Pail with Wringer with Mop Complete',1,'2024-07-14 05:58:18.632'),('6a19f22e-1080-4277-bfee-6b8c59fdef6b','Cutlery Set  (D.Spoon+Fork+Knife+Napkin)',5,'Catering Consumables','Cutlery Set  (D.Spoon+Fork+Knife+Napkin)\r\n1x250 Set',1,'2024-07-14 06:18:27.596'),('6ac1e6f6-f494-4888-85b1-2f4c5b9fbcc1','Sensor Dispenser Liquid Soap/Foam/Sanitizer,  1100ml Capacity Translucent White Color',12.5,'Dispensers','Sensor Dispenser Liquid Soap/Foam/Sanitizer, \r\n1100ml Capacity\r\nTranslucent White Color\r\n',1,'2024-07-13 12:30:16.871'),('6bcd269c-130f-4a10-bc75-868be470a2dd','Pedal Dust Bin Plastic – 70Ltrs Green/Blue/Red',5,'Trash Bin','Pedal Dust Bin Plastic – 70Ltrs\r\nColor: Blue\r\nCapacity: 70Liter​​​',1,'2024-06-30 07:40:08.170'),('6c8331e6-16b0-438e-b0c9-939486429d09','Vinyle Gloves Powder BLACK',1.75,'Catering Consumables','color: BLACK\r\n1x50',1,'2024-06-30 07:51:22.426'),('6d641335-281b-4bb1-aa79-a9018c882a54','Hand Washing Liquid 5Ltr Lavender Scent',1,'Cleaning Chemicals','Hand Washing Liquid 5Ltr Lavender Scent\r\nLavender Flavor\r\nPacking:5 Liter',1,'2024-06-30 07:44:27.862'),('6ee046ae-ee27-408d-afc9-fb360e31b1ed','Garbage Bin Plastic Net (07-414)',0.65,'Trash Bin','Garbage Bin Plastic Net (07-414)',1,'2024-07-14 06:25:08.304'),('75122d6d-75b2-4e1b-a3d5-c505494ce084','Dispenser Soap, ST/ST – Vertical – 1000ml Capacity Code. FD-923B',8.5,'Dispensers','Dispenser Soap, ST/ST – Vertical – 1000ml Capacity\r\nCode. FD-923B\r\n',1,'2024-07-13 12:31:54.729'),('7563aca9-6c6e-4598-b318-7f32529a0681','Double Bucket Trolley - Chromed – Complete Set with Mop ',16,'Trolley','Double Bucket Trolley - Chromed – Complete Set with Mop ',1,'2024-07-14 05:52:34.513'),('82bb3cbc-8a1d-499f-b4b5-c42661892ca8','Pine Disinfectant, Clean Care Brand – 25Ltrs/Gallon',3.5,'Cleaning Chemicals','Pine Disinfectant, Clean Care Brand – 25Ltrs/Gallon',1,'2024-07-14 06:06:51.151'),('85e5c849-3ed5-422e-a73c-eb725169ea12','Dispenser Toilet Tissue Mini T.Box –Black Code. MJ1B',4.5,'Dispensers','Dispenser Toilet Tissue Mini T.Box –Black\r\nCode. MJ1B\r\n',1,'2024-07-13 12:14:23.346'),('87e35668-d274-46ce-b0d5-f62fdc9f6945','Damp Mop Frame with Wings – 40cm Color – Blue',2.5,'Cleaning Tool','Damp Mop Frame with Wings – 40cm\r\nColor – Blue\r\n',1,'2024-07-14 06:44:32.523'),('8a8a615c-5995-400b-8f21-f71b4b494c2a','Toilet Tissue Holder – Stainless Steel',1,'Dispensers','Toilet Tissue Holder – Stainless Steel',1,'2024-07-13 12:15:47.484'),('8f6231c7-bb99-4609-9fec-2b6c7cdd1ecf','Single Bucket Trolley Chromed –   – Complete Set with Mop + Bottom Basket',12,'Trash Bin','Single Bucket Trolley Chromed –   – Complete Set with Mop + Bottom Basket',1,'2024-07-14 05:56:25.604'),('90b13916-b2cb-436e-9cc1-f8c4cd8998bb','Manual Dispenser  900ml Capacity  Soap/Foam/Sanitizer – Translucent White Color ',4,'Dispensers','Manual Dispenser \r\n900ml Capacity \r\nSoap/Foam/Sanitizer – Translucent White Color \r\n',1,'2024-07-13 12:26:14.733'),('9281e9ba-6665-4cb3-b6de-67d0e1c0f5aa','Microfiber Mop Cloth 60cm With Shade Lining ',1.75,'Cleaning Tool','Microfiber Mop Cloth 60cm\r\nWith Shade Lining \r\n',1,'2024-07-14 06:44:58.715'),('940bd32b-4ecb-43c2-a2f5-3bb9108606fb','Dispenser Toilet Tissue Mini T.Box – White Code. MJ1W',4.5,'Dispensers','Dispenser Toilet Tissue Mini T.Box – White\r\nCode. MJ1W\r\n',1,'2024-07-13 12:13:21.063'),('951b83ea-3db9-4bf4-a7f9-709327304c1c','All Purpose Cleaner, Clean Care Brand – 5Ltrs/Gallon',3.25,'Cleaning Chemicals','All Purpose Cleaner, Clean Care Brand – 5Ltrs/Gallon',1,'2024-07-14 06:05:33.679'),('9ec23cea-8803-4819-b2c4-4527bafe7a1d','Dispenser Toilet Tissue Mini T.Box ',3.5,'Dispensers','Dispenser Toilet Tissue Mini T.Box ',1,'2024-07-13 12:12:31.021'),('a0704731-9486-450d-8fc2-aec1adf31e93','Hand Liquid Soap, Clean Care Brand – 25Ltrs/Gallon',5.5,'Cleaning Chemicals','Hand Liquid Soap, Clean Care Brand – 25Ltrs/Gallon',1,'2024-07-14 06:07:41.750'),('a575ddff-445f-4821-9256-f4eaf40ce36e','Pedal Dust Bin Plastic 45Ltrs',5,'Trash Bin','Color: Grey\r\nCapacity: 45Ltrs',1,'2024-06-30 07:41:25.118'),('a771e248-4e50-4749-8ba9-b60c69bb15c8','Hand Liquid Soap, Silverpot Brand – 5Ltrs/Gallon Rose/Lavender',5,'Cleaning Chemicals','Hand Liquid Soap, Silverpot Brand – 5Ltrs/Gallon\r\nRose/Lavender\r\n',1,'2024-07-14 06:08:02.694'),('ac8462fe-3730-4a36-8613-800aba6000d9','Cling Film – 45cm Wide',9,'Catering Consumables','Cling Film – 45cm Wide\r\n1x6Rolls',1,'2024-07-14 06:16:04.167'),('af6879f2-6ac3-4fc6-bb41-ec69de58f273','Dispenser Towel Center Pull – Color: White',3.5,'Dispensers','Dispenser Towel Center Pull – Color: White',1,'2024-07-13 12:09:49.113'),('b2c57e7a-f55e-4eb3-973d-84eeed9051c8','Manual Autocut Paper Towel Dispenser',16,'Dispensers','Manual Autocut Paper Towel Dispenser\r\nTranslucent White Color\r\nTranslucent Black Color\r\n',1,'2024-07-13 12:23:35.943'),('b4652c63-a044-42fc-a92d-24ef250e1715','Damp Mop Frame with Wings – 60cm Color – Blue',3,'Cleaning Tool','Damp Mop Frame with Wings – 60cm\r\nColor – Blue\r\n',1,'2024-07-14 06:44:06.352'),('ba684511-b620-4c7b-9a99-809b7c1c0e20','Batteries Energizer - AA',0.195,'Dispensers','Batteries Energizer - AA',1,'2024-07-13 12:34:13.070'),('c0fae3e6-0e7e-42e7-b758-5cc99d80b7ae','Hand Liquid Soap, Clean Care Brand – 5Ltrs/Gallon',5.25,'Cleaning Chemicals','Hand Liquid Soap, Clean Care Brand – 5Ltrs/Gallon',1,'2024-07-14 06:07:16.763'),('c29a037a-fe60-49b9-81e0-a59688b5b734','Dispenser Towel C-Fold – White 200 Sheets Capacity Code. K40',3.5,'Dispensers','Dispenser Towel C-Fold – White\r\n200 Sheets Capacity\r\nCode. K40\r\n',1,'2024-07-13 12:16:23.028'),('c34173b9-19a0-40b6-b126-6ad1643d6498','Dispenser Soap, ST/ST – Horizontal– 1000ml Capacity Code. FD-913B',7,'Dispensers','Dispenser Soap, ST/ST – Horizontal– 1000ml Capacity\r\nCode. FD-913B\r\n',1,'2024-07-13 12:32:25.378'),('c39d5b9c-6452-4797-8281-d8a17e25dc10','Single Bucket Trolley – Yellow (AF08079) Size: 50x39x81cm',12.5,'Trolley','Single Bucket Trolley – Yellow (AF08079)\r\nSize: 50x39x81cm\r\n',1,'2024-07-14 05:57:25.168'),('c69dc237-f10f-4d34-b388-e92de1906617','Dispenser Soap, ST/ST – Vertical – 1000ml Capacity',6,'Dispensers','Dispenser Soap, ST/ST – Vertical – 1000ml Capacity\r\n',1,'2024-07-13 12:31:30.647'),('c8d1edc5-80e1-4042-a531-6289386d6227','Plastic Mop Pail with Wringer – 20Ltr ',2.5,'Trolley','Plastic Mop Pail with Wringer – 20Ltr ',1,'2024-07-14 05:58:51.184'),('ca0bc6b0-5ce3-4f64-8071-8f4544e47dff','Batteries Energizer - AAA',0.195,'Dispensers','Batteries Energizer - AAA',1,'2024-07-13 12:34:29.811'),('cdfe5877-36df-457a-85b5-b6a244fe67df','Mini Bucket w/Wringer - 20 Ltr, Color: Blue/Green/Red/Yellow',7,'Trolley','Mini Bucket w/Wringer - 20 Ltr, Color: Blue/Green/Red/Yellow',1,'2024-07-14 05:57:51.970'),('ce088c14-6a7f-4181-89c6-d507929efe4c','Alluminium Foil – 45cm Wide',12.5,'Catering Consumables','Alluminium Foil – 45cm Wide\r\n1x6Rolls',1,'2024-07-14 06:16:37.526'),('cf91ded6-03db-4077-86ed-2c09c89495e2','Manual Dispenser  1200ml Capacity  Foam Pump – White Color',2,'Dispensers','Manual Dispenser \r\n1200ml Capacity \r\nFoam Pump – White Color\r\n',1,'2024-07-13 12:28:54.140'),('d2cc4f7f-264f-40cd-aa5d-a413d67f307c','Dispenser Toilet Tissue Mini T.Box – Metallic Chrome Code. MJ1M',4.5,'Dispensers','Dispenser Toilet Tissue Mini T.Box – Metallic Chrome\r\nCode. MJ1M\r\n',1,'2024-07-13 12:14:50.316'),('d4b1a08c-f4a1-4768-b157-8aa608bc2c74','Hand Foam Soap, Clean Care Brand – 5Ltrs/Gallon',12,'Cleaning Chemicals','Hand Foam Soap, Clean Care Brand – 5Ltrs/Gallon',1,'2024-07-14 06:08:50.382'),('d7148ff4-c197-47ca-965b-f012b65ab77b','Plastic Dinner Spoon',6,'Catering Consumables','Plastic Dinner Spoon\r\n40x50pcs',1,'2024-07-14 06:17:37.074'),('d7f86da5-0843-4167-a2ca-2678235243a5','Super Compact Sensor Autocut Paper Towel Dispenser – SL-860-4D',25,'Dispensers','Super Compact Sensor Autocut Paper Towel Dispenser – SL-860-4D\r\nTranslucent White Color\r\n\r\n',1,'2024-07-13 12:24:35.746'),('deb4370d-b6bc-4b0b-8a21-eb8a5c2a414e','Garbage Container with Lid + Wheels – 50Ltrs',5,'Trash Bin','Garbage Container with Lid + Wheels – 50Ltrs\r\nColors: Blue/Green/Red/Yellow/Black\r\nSize: L48.0 x W42.0 x H63.0 cm\r\n',1,'2024-07-14 06:28:59.884'),('e17e1b2c-b431-40ff-a8bb-d102af625b72','Manual Dispenser  900ml Capacity Soap/Foam/Sanitizer – Translucent Black Color',3,'Dispensers','Manual Dispenser \r\n900ml Capacity Soap/Foam/Sanitizer – Translucent Black Color\r\n',1,'2024-07-13 12:26:41.940'),('e2bc9d1b-2147-4a19-af66-89c9705dc6d2','Pine Disinfectant, Clean Care Brand – 5Ltrs/Gallon',3,'Cleaning Chemicals','Pine Disinfectant, Clean Care Brand – 5Ltrs/Gallon',1,'2024-07-14 06:06:30.423'),('e63c1829-ffbf-4de7-a158-edc01d7be9a8','Lav-Basin Soap Dispenser, 1000ml Chrome Plated Brass for Spout and 51mm dia.cover. Unbreakable Polyethylene Container',12.5,'Dispensers','Lav-Basin Soap Dispenser, 1000ml\r\nChrome Plated Brass for Spout and 51mm dia.cover. Unbreakable Polyethylene Container\r\n',1,'2024-07-13 12:33:12.668'),('e82d0ba9-4e87-4085-8cf5-f65490486e5d','Garbage bin with Moving Lid – 40Ltrs Capacity',4.5,'Trash Bin','Garbage bin with Moving Lid – 40Ltrs Capacity',1,'2024-07-14 06:27:45.999'),('e84f1b5a-439b-479d-8e10-c6f2851d2e0b','Multi-Functional Cleaning Janitor cart',125,'Trolley','Product Name: Janitor cart (housekeeping cart)\r\nColor: Grey - white door\r\nProduct Size: 48.2*38.6*16.5 cm\r\nPackage: 1PC/CTN',1,'2024-06-30 07:47:08.842'),('e9396bc4-1083-4caf-bfca-6aab1a219cf8','Surface Sanitizer 5Ltr',3.5,'Cleaning Chemicals','Surface Sanitizer 5 Liter\r\nPacking:5 Liter',1,'2024-06-30 07:45:15.303'),('ec09517f-0abc-40b5-9f7a-2b15e6cd37e0','Double Bucket Trolley - Chromed – Complete Set with Mop',17,'Trolley','Double Bucket Trolley - Chromed – Complete Set with Mop',1,'2024-07-14 05:53:06.806'),('ec107741-6834-4197-8c9a-3ca7d3cd6a45','Dispenser Towel C-Fold – ST/ST Code. 0903F Size: 27X12X27cm',8.5,'Dispensers','Dispenser Towel C-Fold – ST/ST\r\nCode. 0903F\r\nSize: 27X12X27cm\r\n',1,'2024-07-13 12:21:55.228'),('ecbeab46-f914-49f1-8dcc-53e0419af83a','Wringer – Plastic',8,'Trolley','Wringer – Plastic',1,'2024-07-14 05:59:13.177'),('eda92b55-c5cd-4f5a-ae63-f11e6bf2765e','Single Bucket Trolley– Chromed – Complete Set with Mop',16,'Trolley','Single Bucket Trolley– Chromed – Complete Set with Mop',1,'2024-07-14 05:57:01.357'),('f6887f18-dbe5-4cb2-9864-7a212407bc8f','All-Purpose Cleaner 5 Liter + 250 ml Free',20.5,'Catering Consumables','All-Purpose Cleaner 5 Liter\r\nBrand: Eya Clean Naturel Pro\r\nPacking:5 Liter + 250 ml',1,'2024-06-30 07:50:35.298');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `comment` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_userId_fkey` (`userId`),
  KEY `review_productId_fkey` (`productId`),
  CONSTRAINT `review_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_key` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('53d37753-1844-4482-b83d-95ec6c409bc6','info@baitalkwt.com','Support','$2b$10$mi0rsSOR0e8zZN4moUw/8.HOrUVG7v6DE5ExZg.XHIwg1S24a344e',NULL,'admin','2024-06-30 07:34:42.268');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-16  1:35:18
