# Host: localhost  (Version: 5.5.53)
# Date: 2018-04-12 17:34:24
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "auth_group"
#

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_group"
#


#
# Structure for table "auth_group_permissions"
#

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_group_permissions"
#


#
# Structure for table "auth_permission"
#

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "auth_permission"
#

INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add post',7,'add_post'),(20,'Can change post',7,'change_post'),(21,'Can delete post',7,'delete_post'),(22,'Can add category',8,'add_category'),(23,'Can change category',8,'change_category'),(24,'Can delete category',8,'delete_category'),(25,'Can add tag',9,'add_tag'),(26,'Can change tag',9,'change_tag'),(27,'Can delete tag',9,'delete_tag'),(28,'Can add comment',10,'add_comment'),(29,'Can change comment',10,'change_comment'),(30,'Can delete comment',10,'delete_comment');

#
# Structure for table "auth_user"
#

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "auth_user"
#

INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$kRVgwblkmlJk$1RBJbZzrNa3YA/q4cB66Us+u0/YwBoV5/E//J2Q6xBo=','2018-04-12 11:23:39',1,'admin','','','!@163.com',1,1,'2018-04-09 03:04:17');

#
# Structure for table "auth_user_groups"
#

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_groups"
#


#
# Structure for table "auth_user_user_permissions"
#

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "auth_user_user_permissions"
#


#
# Structure for table "blog_category"
#

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "blog_category"
#

INSERT INTO `blog_category` VALUES (5,'mac下测试标签'),(6,'测试'),(7,'testuser1');

#
# Structure for table "blog_post"
#

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `created_time` datetime NOT NULL,
  `category_id` int(11) NOT NULL,
  `views` int(10) unsigned NOT NULL,
  `excerpt` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_b583a629` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "blog_post"
#

INSERT INTO `blog_post` VALUES (1,'测试文章','经典名著，灿烂文化，读之不尽，取之不竭。读书的好处？丰富学识，增加自信，生活生存。阅读的习惯，像吃饭一样不可或缺。这是一篇没有主题的文章，也是没有中心思想的文章。所有的美文，和鸡汤，读来都感觉很有道理，可是没有什么大用。然而，不用去在乎，只要去读，读就好了。电子书，纸质书。有区别吗？有的。说实话，内容本质上没有任何区别，不同点在于读的方式。都是时代的产物，萝卜白菜各有所爱。电子书是方便的，随时随地，想看就看，想读就读，就是很任性。纸质书带有独特的味道，是电子书所无法拥有的，书的香味往往能够增加阅读的兴趣，光是味道就令人陶醉了。\r\n\r\n每次提到写什么，其实就是读什么。写什么不重要，读什么才重要。关于读书，关于文学，关于文化，关于传统。中心主题是没有的，因为，这里是写给robot看的。文章的分类，是一个令人无法理解的问题，与初衷总是相悖，是不是只要提到，我写的是美文呀，故事也有写的，可是傻傻分不清，把我分到别的领域去了，到底是怎么回事吗？找不到答案，所以咯，我在写非常好看的美文呢，不信？这就是了。\r\n\r\n好吧，我承认。读书总是好的，只要读书就好了。时间是不会骗人的，它把最好的文化带到我们的身边，是最大的恩赐了。为何不好好珍惜这短短的人生呢？一直有啊！我想也是的吧。怀着一颗虔诚的心面对生活，把每一天的都当作弥足珍贵的日子来过，活在此时此刻，不好吗？有故事和酒，就是最幸福的状态了吧。不要为明天忧愁，有什么用呢？今天，有书相伴，有愉悦的心情不就好了？','2018-04-09 00:00:00',7,34,''),(2,'石墨文章','经典名著，灿烂文化，读之不尽，取之不竭。读书的好处？丰富学识，增加自信，生活生存。阅读的习惯，像吃饭一样不可或缺。这是一篇没有主题的文章，也是没有中心思想的文章。所有的美文，和鸡汤，读来都感觉很有道理，可是没有什么大用。然而，不用去在乎，只要去读，读就好了。电子书，纸质书。有区别吗？有的。说实话，内容本质上没有任何区别，不同点在于读的方式。都是时代的产物，萝卜白菜各有所爱。电子书是方便的，随时随地，想看就看，想读就读，就是很任性。纸质书带有独特的味道，是电子书所无法拥有的，书的香味往往能够增加阅读的兴趣，光是味道就令人陶醉了。\r\n\r\n每次提到写什么，其实就是读什么。写什么不重要，读什么才重要。关于读书，关于文学，关于文化，关于传统。中心主题是没有的，因为，这里是写给robot看的。文章的分类，是一个令人无法理解的问题，与初衷总是相悖，是不是只要提到，我写的是美文呀，故事也有写的，可是傻傻分不清，把我分到别的领域去了，到底是怎么回事吗？找不到答案，所以咯，我在写非常好看的美文呢，不信？这就是了。\r\n\r\n好吧，我承认。读书总是好的，只要读书就好了。时间是不会骗人的，它把最好的文化带到我们的身边，是最大的恩赐了。为何不好好珍惜这短短的人生呢？一直有啊！我想也是的吧。怀着一颗虔诚的心面对生活，把每一天的都当作弥足珍贵的日子来过，活在此时此刻，不好吗？有故事和酒，就是最幸福的状态了吧。不要为明天忧愁，有什么用呢？今天，有书相伴，有愉悦的心情不就好了？','2018-04-10 00:00:00',6,57,''),(9,'测试标题','这是一篇测试文档','2018-04-10 00:00:00',6,8,''),(10,'测试','这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文这是正文','2018-04-12 11:24:00',6,0,'顶顶顶顶顶顶顶顶顶顶顶顶顶'),(11,'这是一篇测试文章的标题','这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文','2018-04-12 11:33:00',6,0,'这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文这是测试文章的正文');

#
# Structure for table "blog_post_tags"
#

CREATE TABLE `blog_post_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_post_tags_post_id_4925ec37_uniq` (`post_id`,`tag_id`),
  KEY `blog_post_tags_f3aa1999` (`post_id`),
  KEY `blog_post_tags_76f094bc` (`tag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "blog_post_tags"
#

INSERT INTO `blog_post_tags` VALUES (10,2,8),(11,1,9),(12,10,8),(13,11,8);

#
# Structure for table "blog_tag"
#

CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "blog_tag"
#

INSERT INTO `blog_tag` VALUES (8,'测试'),(9,'工具');

#
# Structure for table "comments_comment"
#

CREATE TABLE `comments_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `text` longtext NOT NULL,
  `created_time` datetime NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_comment_f3aa1999` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

#
# Data for table "comments_comment"
#

INSERT INTO `comments_comment` VALUES (1,'haha','1@163.com','nicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenicenice','2018-04-09 21:49:11',2),(2,'wo','2@132.com','????','2018-04-09 14:26:39',2),(3,'wo1','3@11.com','??????','2018-04-09 14:30:33',2),(4,'11111222222222','22@11.com','????','2018-04-09 14:33:54',2),(5,'11????','d@116.com','??','2018-04-09 14:38:46',2),(6,'hhhhhhh','hhhh@163.com','hhhhhhdhjhafsdkfha;lksdjfhaklsdfhjklsd','2018-04-09 15:03:13',2),(7,'22222','22333@113.com','wwee','2018-04-10 01:04:59',5),(8,'大力','2@163.com','大力评测','2018-04-10 02:06:52',5),(9,'haha','dd@112.com','ssdads','2018-04-10 02:38:22',5);

#
# Structure for table "django_admin_log"
#

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

#
# Data for table "django_admin_log"
#

INSERT INTO `django_admin_log` VALUES (1,'2018-04-09 03:05:09','1','???',1,'[{\"added\": {}}]',8,1),(2,'2018-04-09 03:05:19','1','??',1,'[{\"added\": {}}]',9,1),(3,'2018-04-09 03:05:21','1','???',1,'[{\"added\": {}}]',7,1),(4,'2018-04-09 03:13:11','2','??',1,'[{\"added\": {}}]',8,1),(5,'2018-04-09 03:13:16','2','??',1,'[{\"added\": {}}]',9,1),(6,'2018-04-09 03:13:19','2','????',1,'[{\"added\": {}}]',7,1),(7,'2018-04-09 07:32:59','3','??',1,'[{\"added\": {}}]',8,1),(8,'2018-04-09 07:33:06','3','????',1,'[{\"added\": {}}]',9,1),(9,'2018-04-09 07:33:07','3','?????',1,'[{\"added\": {}}]',7,1),(10,'2018-04-09 07:36:16','3','?????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(11,'2018-04-09 07:41:59','3','?????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(12,'2018-04-09 07:42:53','3','?????',2,'[]',7,1),(13,'2018-04-09 07:48:52','4','??',1,'[{\"added\": {}}]',9,1),(14,'2018-04-09 07:49:19','4','????',1,'[{\"added\": {}}]',7,1),(15,'2018-04-09 07:50:22','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(16,'2018-04-09 07:51:10','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(17,'2018-04-09 07:53:23','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(18,'2018-04-09 07:54:28','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(19,'2018-04-09 08:01:54','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(20,'2018-04-09 08:52:36','3','?????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(21,'2018-04-09 12:43:49','4','??mac',1,'[{\"added\": {}}]',8,1),(22,'2018-04-09 12:43:57','5','??mac',1,'[{\"added\": {}}]',9,1),(23,'2018-04-09 12:44:00','5','mac?????',1,'[{\"added\": {}}]',7,1),(24,'2018-04-10 00:52:03','5','mac下测试标签',1,'[{\"added\": {}}]',8,1),(25,'2018-04-10 00:52:13','6','测试mac',1,'[{\"added\": {}}]',9,1),(26,'2018-04-10 00:52:28','5','mac测试的标题',2,'[{\"changed\": {\"fields\": [\"title\", \"body\", \"created_time\", \"category\"]}}]',7,1),(27,'2018-04-10 06:20:04','6','测试',1,'[{\"added\": {}}]',8,1),(28,'2018-04-10 06:20:09','7','测试',1,'[{\"added\": {}}]',9,1),(29,'2018-04-10 06:20:14','8','目录文章测试',1,'[{\"added\": {}}]',7,1),(30,'2018-04-10 06:21:19','3','hello 单车',3,'',7,1),(31,'2018-04-10 06:51:23','8','目录文章测试',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(32,'2018-04-10 07:29:14','8','目录文章测试',2,'[]',7,1),(33,'2018-04-10 07:29:29','7','testuser1',1,'[{\"added\": {}}]',8,1),(34,'2018-04-10 07:29:32','5','mac测试的标题',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',7,1),(35,'2018-04-10 07:29:38','4','百度云',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',7,1),(36,'2018-04-10 07:29:44','2','石墨文章',2,'[{\"changed\": {\"fields\": [\"body\", \"category\"]}}]',7,1),(37,'2018-04-10 07:29:50','1','测试文章',2,'[{\"changed\": {\"fields\": [\"body\", \"category\"]}}]',7,1),(38,'2018-04-10 07:41:01','4','??mac',3,'',8,1),(39,'2018-04-10 07:41:01','3','??',3,'',8,1),(40,'2018-04-10 07:41:01','2','??',3,'',8,1),(41,'2018-04-10 07:41:01','1','???',3,'',8,1),(42,'2018-04-10 07:42:04','7','测试',3,'',9,1),(43,'2018-04-10 07:42:04','5','百度',3,'',9,1),(44,'2018-04-10 07:42:04','4','石墨',3,'',9,1),(45,'2018-04-10 07:42:04','3','云',3,'',9,1),(46,'2018-04-10 07:42:04','2','测试',3,'',9,1),(47,'2018-04-10 07:42:31','6','测试mac',3,'',9,1),(48,'2018-04-10 07:42:31','1','合法',3,'',9,1),(49,'2018-04-10 07:42:55','8','测试',1,'[{\"added\": {}}]',9,1),(50,'2018-04-10 07:43:03','9','工具',1,'[{\"added\": {}}]',9,1),(51,'2018-04-10 07:43:28','2','石墨文章',2,'[{\"changed\": {\"fields\": [\"created_time\"]}}]',7,1),(52,'2018-04-10 07:43:41','1','测试文章',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',7,1),(53,'2018-04-12 11:24:19','9','测试标',2,'[{\"changed\": {\"fields\": [\"title\", \"excerpt\"]}}]',7,1),(54,'2018-04-12 11:29:35','10','拒绝',1,'[{\"added\": {}}]',7,1),(55,'2018-04-12 11:31:17','10','测试',2,'[{\"changed\": {\"fields\": [\"title\", \"body\", \"excerpt\"]}}]',7,1),(56,'2018-04-12 11:34:02','11','这是一篇测试文章的标题',1,'[{\"added\": {}}]',7,1);

#
# Structure for table "django_content_type"
#

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "django_content_type"
#

INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'blog','post'),(8,'blog','category'),(9,'blog','tag'),(10,'comments','comment');

#
# Structure for table "django_migrations"
#

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "django_migrations"
#

INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-09 03:02:15'),(2,'auth','0001_initial','2018-04-09 03:02:16'),(3,'admin','0001_initial','2018-04-09 03:02:16'),(4,'admin','0002_logentry_remove_auto_add','2018-04-09 03:02:16'),(5,'contenttypes','0002_remove_content_type_name','2018-04-09 03:02:16'),(6,'auth','0002_alter_permission_name_max_length','2018-04-09 03:02:16'),(7,'auth','0003_alter_user_email_max_length','2018-04-09 03:02:16'),(8,'auth','0004_alter_user_username_opts','2018-04-09 03:02:16'),(9,'auth','0005_alter_user_last_login_null','2018-04-09 03:02:16'),(10,'auth','0006_require_contenttypes_0002','2018-04-09 03:02:16'),(11,'auth','0007_alter_validators_add_error_messages','2018-04-09 03:02:16'),(12,'auth','0008_alter_user_username_max_length','2018-04-09 03:02:16'),(13,'blog','0001_initial','2018-04-09 03:02:16'),(14,'sessions','0001_initial','2018-04-09 03:02:16'),(15,'comments','0001_initial','2018-04-09 09:04:30'),(16,'blog','0002_auto_20180410_1046','2018-04-10 02:46:28'),(17,'blog','0003_auto_20180411_2131','2018-04-12 11:21:50'),(18,'blog','0004_post_excerpt','2018-04-12 11:21:50'),(19,'blog','0005_auto_20180412_1130','2018-04-12 11:31:04'),(20,'blog','0006_auto_20180412_1132','2018-04-12 11:32:52');

#
# Structure for table "django_session"
#

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "django_session"
#

INSERT INTO `django_session` VALUES ('0yd6iqbm2k6nv6wtttlovaqg8i16jcaz','ODA5ZDg5ZjVlMmI3ZDgzMmVhY2NiNWUzNDc4ZGE3NmY3MzQ2YWRmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTM2M2I0NGFmNGNkNzJhMGI0NjMxNzk5YTdiM2E5MmQ5NjU2ZTdjIn0=','2018-04-23 03:04:44'),('9swdcssiw1jhj7vcjmyhegwlm4vlpqhk','ODA5ZDg5ZjVlMmI3ZDgzMmVhY2NiNWUzNDc4ZGE3NmY3MzQ2YWRmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTM2M2I0NGFmNGNkNzJhMGI0NjMxNzk5YTdiM2E5MmQ5NjU2ZTdjIn0=','2018-04-23 12:42:41'),('i9r3h82f4jp980r8t7tjqxf6t9isnwyr','ODA5ZDg5ZjVlMmI3ZDgzMmVhY2NiNWUzNDc4ZGE3NmY3MzQ2YWRmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTM2M2I0NGFmNGNkNzJhMGI0NjMxNzk5YTdiM2E5MmQ5NjU2ZTdjIn0=','2018-04-26 11:23:39');
