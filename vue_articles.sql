-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: vue_articles
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube_img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selected` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Timbaland feat. Veronica - Give It A Go OST Real Steel - Full song','HipHop','gn__Zu35z9w','https://youtu.be/gn__Zu35z9w','https://img.youtube.com/vi/gn__Zu35z9w/0.jpg','<h4 id=\"title\" class=\"style-scope ytd-metadata-row-renderer\">Licensed to YouTube by</h4>\n<div id=\"content\" class=\"style-scope ytd-metadata-row-renderer\">UMG (on behalf of Interscope); SOLAR Music Rights Management, Forward Music Publishing Co., Ltd., Anthem Entertainment (Publishing), Abramus Digital, LatinAutor - Warner Chappell, BMI - Broadcast Music Inc., CMRRA, ASCAP, IMPEL, UMPI, Reservoir Media (Publishing), UNIAO BRASILEIRA DE EDITORAS DE MUSICA - UBEM, AMRA, Warner Chappell, UMPG Publishing, Sony ATV Publishing, LatinAutor - SonyATV, LatinAutor - PeerMusic, PEDL, LatinAutorPerf, and 19 Music Rights Societies</div>','songs','','',0,'2021-03-22 07:39:24','2021-03-22 07:39:24'),(2,'Akon keep up','Rap','eyITke2zN9I','https://youtu.be/eyITke2zN9I','https://img.youtube.com/vi/eyITke2zN9I/0.jpg','<h4 id=\"title\" class=\"style-scope ytd-metadata-row-renderer\">Licensed to YouTube by</h4>\n<div id=\"content\" class=\"style-scope ytd-metadata-row-renderer\">INgrooves (on behalf of Kon Live Distribution, LLC); UMPI, Spirit Music Publishing, ARESA, The Royalty Network (Publishing), LatinAutor, LatinAutor - PeerMusic, AMRA, UNIAO BRASILEIRA DE EDITORAS DE MUSICA - UBEM, ASCAP, BMI - Broadcast Music Inc., Abramus Digital, LatinAutorPerf, IMPEL, BMG Rights Management (US), LLC, and 15 Music Rights Societies</div>','Song','','',0,'2021-03-22 07:40:25','2021-03-22 07:40:25'),(3,'Brothers Anthem Full Video - Akshay Kumar,Sidharth Malhotra|Vishal Dadlani|Ajay-Atul','motivational','IjBAgWKW12Y','https://youtu.be/IjBAgWKW12Y','https://img.youtube.com/vi/IjBAgWKW12Y/0.jpg','<p><span class=\"style-scope yt-formatted-string\" dir=\"auto\">The body achieves what the mind believes. The track \'Brothers Anthem\' - in the powerful voice of Vishal Dadlani, written by Amitabh Bhattacharya and composed by Ajay-Atul - from the upcoming film Brothers starring Akshay Kumar, Sidharth Malhotra and Jacqualine Fernandez will instill in you, an undying spirit to achieve things against all odds. Song Name - Brothers Anthem Movie - Brothers Singer - Vishal Dadlani Composer - Ajay-Atul Lyricists - Amitabh Bhattacharya Music Label - Sony Music Entertainment India Pvt. Ltd. &copy; 2015 Sony Music Entertainment India Pvt. Ltd. Subscribe: Vevo - </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" spellcheck=\"false\" href=\"http://www.youtube.com/user/sonymusicindiavevo?sub_confirmation=1\" rel=\"nofollow\">http://www.youtube.com/user/sonymusic...</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\">​</span><span class=\"style-scope yt-formatted-string\" dir=\"auto\"> Like us: Facebook: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqazJWT2ZvMHhWVlAxMlpBVHNPbTFFNFVXSXB3UXxBQ3Jtc0tsN3NCZDNVTlVCXzRCZE9OVnlKdkRwMDRqRjZUbWZxT203bnFYWnA4b25YeTV4VGxVQ3FkYzB2bHdBakhXc2NuTkNZRWg5bzM0ekVNb2ZoMVVxQVFnY2tLeFpxbFVYS2RjVERGc3J0Wm5wWFdnalpaWQ&amp;q=https%3A%2F%2Fwww.facebook.com%2FSonyMusicIndia\" target=\"_blank\" rel=\"nofollow noopener\">https://www.facebook.com/SonyMusicIndia</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\">​</span><span class=\"style-scope yt-formatted-string\" dir=\"auto\"> Follow us: Twitter: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbDBTUndELXU5dGlOWXpvd0Q4c3p0MWMxbkI5QXxBQ3Jtc0tsT183bDhidHp6aHNGZXJPTnNKSEEtQVp3d0UxekVjYXJHX3JzajRiM2d2MGFRMUpSTlZKU21sajRtU1pVcm5uLU9YN3dHYUJvdDdLZ3hCZXVWeGxoSWdJb0tzU2ZJTkpiWTJTT2RwYVhIbTUwazBGUQ&amp;q=https%3A%2F%2Ftwitter.com%2Fsonymusicindia\" target=\"_blank\" rel=\"nofollow noopener\">https://twitter.com/sonymusicindia</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\">​</span><span class=\"style-scope yt-formatted-string\" dir=\"auto\"> G+: </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbmFYaThOUUNVcUtneHdodzlLMlduTVIyUGdrUXxBQ3Jtc0ttcVVCLTJKSzVGM2t2M1VYRFNDZDJfMVFKNjlJZnJkNEFkRTBFYXNpREpZZG9uWWFLWDBUckdDajktVGhES2QxRHRQTWZRNmZ0OF9JTzk0MHNNSkFpc2VGdXUyT1l4Y1ZwenJheV9LTjNvOUlxVkF3RQ&amp;q=https%3A%2F%2Fplus.google.com%2F%2BSonyMusicIndia\" target=\"_blank\" rel=\"nofollow noopener\">https://plus.google.com/+SonyMusicIndia</a></p>','Motivation','','',0,'2021-03-22 07:41:23','2021-03-22 07:41:23'),(4,'50 Cent - Ready For War | HBO | Instrumental','motivational','1QJnhWmvk58','https://youtu.be/1QJnhWmvk58','https://img.youtube.com/vi/1QJnhWmvk58/0.jpg','<p><span class=\"style-scope yt-formatted-string\" dir=\"auto\">Triple mix of the ready for war music that HBO often use. I included a bunch of random clips from films and stuff, just so its not a blank screen. Beast Mode Activate! Follow me on social media </span><a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbnRWczNreWpxOTFvRE0xMC1pU2FHTm53cmRnZ3xBQ3Jtc0traVNyODQyTFN5RWExMF9zT01lZENvUHB4bzlNUXlOM0xzcUNESDlEbWVyV2U0M183Y3d0LVc4bWpVN1hRdjR0NVc4RVpyNW94MVU3QWdYOW9yOUY4TTJONEJLM2JWY1pZM0hMcEdzZnF5Z2VIQ3lXdw&amp;q=http%3A%2F%2Fwww.twitter.com%2Fmilofilm\" target=\"_blank\" rel=\"nofollow noopener\">http://www.twitter.com/milofilm</a><span class=\"style-scope yt-formatted-string\" dir=\"auto\">​</span> <a class=\"yt-simple-endpoint style-scope yt-formatted-string\" dir=\"auto\" spellcheck=\"false\" href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbEZnRDVuZnFlZnl1QjRyNjBaT0NiSDIyZTNPQXxBQ3Jtc0ttN1B3djhOOWRqSTBlckxEOFg3RTBsZGpINDVEcjdOT3NDU04wTDN5a096dHllcUZDNXJqUldZVWRCT0FCMUs3WjhKeXd1ejd4dnd1NHVWNVNXcWdTZEdzYmdmSkJJbjJJZWQyQS1CRVp4WjBCcUJrTQ&amp;q=http%3A%2F%2Fwww.instagram.com%2Flensedlondon\" target=\"_blank\" rel=\"nofollow noopener\">http://www.instagram.com/lensedlondon</a></p>','Instrumental','','',0,'2021-03-22 07:42:10','2021-03-22 07:42:10');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_12_07_122845_create_oauth_providers_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2021_03_19_192936_create_articles_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_providers`
--

DROP TABLE IF EXISTS `oauth_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_providers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_providers_user_id_foreign` (`user_id`),
  KEY `oauth_providers_provider_user_id_index` (`provider_user_id`),
  CONSTRAINT `oauth_providers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_providers`
--

LOCK TABLES `oauth_providers` WRITE;
/*!40000 ALTER TABLE `oauth_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tabish','tabish@email.com',NULL,'$2y$10$NYUq/63/HxqD/NgHX/8Am.FGC/fC3BzeqrHrwKHzWrDvYOfhzkDAe',NULL,0,'2021-03-22 05:23:53','2021-03-22 05:23:53'),(2,'admin','admin@articles.com',NULL,'$2y$10$L2A.7Pd4QFCSHp1eAP7MrOhAMczd7Tckcd/sFDCrqJDZ8J8Xu2QNG',NULL,1,'2021-03-22 05:39:42','2021-03-22 05:41:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 17:43:29
