# Host: localhost  (Version: 5.5.53)
# Date: 2018-04-11 17:25:05
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

INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$kRVgwblkmlJk$1RBJbZzrNa3YA/q4cB66Us+u0/YwBoV5/E//J2Q6xBo=','2018-04-09 12:42:41',1,'admin','','','!@163.com',1,1,'2018-04-09 03:04:17');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "blog_category"
#

INSERT INTO `blog_category` VALUES (5,'mac下测试标签'),(6,'测试'),(7,'testuser1'),(8,'知识讲解'),(9,'java'),(10,'计算机'),(11,'怎么去读书'),(12,'精华'),(13,'爬虫'),(14,'算法');

#
# Structure for table "blog_post"
#

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `created_time` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `views` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_b583a629` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "blog_post"
#

INSERT INTO `blog_post` VALUES (1,'elasticsearch入门知识讲解','一个运行中的Elasticsearch实例称为一个节点，而集群是由一个或者多个拥有相同cluster.name配置额节点组成，它们共同承担数据和负载的压力。当有新的节点加入集群或者有节点删除时集群将会重新平均分布所有的数据。\r\n当有一个节点成为主节点时，它将负责管理集群范围内的所有变更，例如增加和删除，索引，增加删除节点。而主节点不涉及文档级别的变更和搜索操作。所以当集群只有一个节点时，即使流量增加，也不会成为瓶颈。任何节点都可以成为主节点，作为用户，我们可以将请求发送到 集群中的任何节点 ，包括主节点。 每个节点都知道任意文档所处的位置，并且能够将我们的请求直接转发到存储我们所需文档的节点。 无论我们将请求发送到哪个节点，它都能负责从各个包含我们所需文档的节点收集回数据，并将最终结果返回給客户端。 Elasticsearch 对这一切的管理都是透明的。','2018-04-11',8,14),(2,'Java编程思想学习笔记十：内部类','如上我们创建了一个内部类，内部类与其它类的区别在于将类隐藏在了另一个类的内部，同时如contents方法所示，外部类的方法还可以返回一个指向内部类的引用，这也是很常见的一种用法。此外我们看到main（）方法中创建的内部类对象是使用外部类的引用关联创建的，这一点在下一节中会说到。\r\n\r\n···python\r\npackage com.chenxyt.java.test;  \r\npublic class Parcell {  \r\n    class Contents{  \r\n        private int i = 11;  \r\n        public int value(){  \r\n            return i;  \r\n        }  \r\n    }  \r\n    class Destination{  \r\n        private String label;  \r\n        public Destination(String whereto) {  \r\n            // TODO Auto-generated constructor stub  \r\n            label = whereto;  \r\n        }  \r\n        String readLabel(){  \r\n            return label;  \r\n        }  \r\n    }  \r\n    public Contents contents(){  \r\n        return new Contents();  \r\n    }  \r\n    public Destination destination(String s){  \r\n        return new Destination(s);  \r\n    }  \r\n    public void ship(String dest){  \r\n        Contents c = new Contents();  \r\n        Destination d = new Destination(dest);  \r\n        System.out.println(d.readLabel());  \r\n    }  \r\n    public static void main(String[] args) {  \r\n        Parcell p1 = new Parcell();  \r\n        p1.ship(\"Inner Class\");  \r\n        Parcell p2 = new Parcell();  \r\n        Contents c = p2.contents();  \r\n        Parcell.Destination d = p2.destination(\"Class Inner\");  \r\n    }  \r\n}  \r\n···','2018-04-11',9,15),(3,'计算机底层是如何访问显卡的？','1. 显卡驱动是怎么控制显卡的, 就是说, 使用那些指令控制显卡, 通过端口么?\r\n2. DirectX 或 OpenGL 或 CUDA 或 OpenCL 怎么找到显卡驱动, 显卡驱动是不是要为他们提供接口的实现, 如果是, 那么DirectX和OpenGL和CUDA和OpenCL需要显卡驱动提供的接口都是什么, 这个文档在哪能下载到? 如果不是, 那么DirectX, OpenGL, CL, CUDA是怎么控制显卡的?\r\n3. 显卡中的流处理器具体是做什么的, 是执行某些特殊运算么, 还是按某些顺序执行一组运算, 具体是什么, 光栅单元呢, 纹理单元呢?\r\n4. 显卡 ( 或其他设备 ) 可以访问内存么? 内存地址映射的原理是什么, 为什么 B8000H 到 C7FFFH 是显存的地址, 向这个地址空间写入数据后, 是直接通过总线写入显存了么, 还是依然写在内存中, 显卡到内存中读取, 如果直接写到显存了, 会出现延时和等待么?\r\n5. 以上这些知识从哪些书籍上可以获得?\r\nJet Chen\r\n针对赞同最多的Belleve的答案，我必须要说几句。他的答案内容有一些是明显的错误。我是知乎新用户，不懂规矩，但是不希望这样的答案误导其他人。为什么我这么肯定我的答案是对的？因为我们就是这么干的！我在全球知名计算机芯片公司为主流平台的主流操作系统提供graphics驱动的支持工作。\r\n我在这里回答一下第一个，第二个，第四个和第五个问题。\r\n在回答这个问题之前，必须要有一些限定。因为显卡是有很多种，显卡所在平台也很多种，不能一概而论。我的回答都是基于Intel x86平台下的Intel自家的GEN显示核心单元（也就是市面上的HD 4000什么的）。操作系统大多数以Linux为例。','2018-04-11',10,8),(13,'怎样阅读一本书','##为什么要读书？\r\n看到这个题目时，是不是有的人会不以为意，认为读书有什么用呢？我们应该会经常听到有人说：“读书有个卵用？”、“读书能让你有钱吗？”等等之类的话。\r\n\r\n是的，我们大多数人不爱读书，一是因为不会读，而是根本不知道读书有什么用。\r\n\r\n那么接下来我先给你说几个观点：\r\n1.读书有什么用？\r\n如果你来问我读书有什么用？我给你的回答是：“你活着就是要死的，你活着有什么用？”、“不是读书没用，而是你没用”。\r\n\r\n2.你是否见过有的人经常在说“书读少了”\r\n而很少见到有人说“书读多了”，\r\n但你会听到有人说“书读傻了”。\r\n这只能总结出一个结论：不是读书的问题，而是你的问题。\r\n\r\n3.现在养成读书的习惯，从内到外一点点改变。\r\n有一句话叫做：种一颗树最好的时间是十年前，其次是现在。所以从现在起养成读书的习惯一点也不晚，当你读完一本两本书后，可能根本发现不了有什么变化，读完十本二十本后也许也不会有太多成长，但是当你能读完一百本书后，或许你就会发现，你可以很好地控制自己的情绪了，你的三观发生了一些变化，你真正地从内到外的蜕变了。\r\n\r\n4.读书会不会让你变得有钱？\r\n这个问题想想其实很有意思，难道读书不能让我们变有钱我们就不读了吗？这就好比我们吃饭睡觉也不会让我们变有钱，难道我们就不去做了吗？\r\n或许你会对我说，你这就是抬杠。好，那我们来正视这个问题。\r\n在过去那个时代，读书也许真的不能让你变有钱，但是会让你变得“富裕”。而在当今时代，社会发展如此之快，读书还真的能让你变有钱。想想看，读书能给我们带来什么？不仅能向上面提到的从内向外改变你自己，更重要的是可以提高你的认知，扩展你的思维，增强你的写作能力。如今我们正处在一个“知识付费”的时代，我们不去看那些职业写作的作家，写手等。你去看看有多少普通人在这个“知识付费”的时代下，用自己的文字，靠自己的认知从而获得了很多额外收入。\r\n\r\n怎样去阅读？','2018-04-11',11,0),(14,'Laravel / PHP 精华文章','这段代码乍一看没毛病，但是如果你向它传递「任意」参数，它就会出问题。\r\n\r\n写出好的代码是一个学无止境的过程。让我们来改进我们编写 PHP 函数的方式。 看下上面的代码，想想第二个函数调用那里会发生什么情况？ 它会接受你输入的任何参数，并且尝试执行然后抛出一个数学错误。 但是我们怎么才能让一个函数严格接收能使其正确执行的参数呢？ 现代的 PHP 解决了这个问题，并且有更多妙法能让你的代码质量更进一层，没有 bug。\r\n![alt text](/path/to/img.jpg \"Title\")','2018-04-11',12,11),(15,'分析天猫iphonX的销售数据','##01.引言\r\n　　这篇文章是我最近刚做的一个项目，会带领大家使用多种技术实现一个非常有趣的项目，该项目是关于苹果机（iphoneX）的销售数据分析，是网络爬虫和数据分析的综合应用项目。本项目会分别从天猫和京东抓取iphoneX的销售数据（利用 Chrome 工具跟踪 Web 数据），并将这些数据保存到 Mysql 数据库中，然后对数据进行清洗，最后通过 SQL 语句、Pandas 和 Matplotlib 对数据进行数据可视化分析。我们从分析结果中可以得出很多有趣的结果，例如，大家最爱买的颜色是，最喜欢的是多少G内存的iphoneX等等，当然本文介绍的只是一个小的应用，时间够的话如果大家刚兴趣可以进一步进行推广。\r\n\r\n　　废话不多说，马上开始。\r\n\r\n##02.分析\r\n　　首先从马云粑粑的天猫“取“点数据，取数据的第一步即使要分析一下 Web 页面中数据是如何来的。也就是说数据，数据是通过何种方式发送到客户端浏览器的。天猫和京东的数据基本上没采用什么有意义的反爬技术，所以抓取数据相对比较容易（针对于复杂的后期会介绍抓包工具以及Scrapy框架自动爬取的方式）。\r\n\r\n　　进到天猫苹果的官方旗舰店后，开始使用 Chrome 浏览器或者火狐都可以，他们都有很方便的调试工具。开始搜索”iphoneX“关键字，然后页面就会弹出iphoneX的商品详情页，浏览商品页面，在页面的右键菜单中点击“检查”菜单项，打开调试窗口，切换到“Network”选项卡，这个选项卡可以实时显示出当前页面向服务端发送的所有请求，以及这些请求的请求头、响应头、响应内容以及其他与调试有关的信息。对于调试和跟踪 Web 应用相当方便。\r\n\r\n　　打开“Network”选项卡后，进到商品评论处，切换到下一页，会看到“Network”选项卡下方出现很多 URL，这就是切换评论页时向服务端新发出的请求。我们要找的东西就在这些 URL 中。至于如何找到具体的 URL，那就要依靠经验了。可以一个一个点击寻找（在右侧的“Preview”选项卡中显示 URL 的响应内容），也可以根据 URL 名判断，一般程序员不会起无意义的名字，这样很不好维护。这里我们找到一个”list_detail_rate.htm?“的URL，点开后，我们发现如图1所示，ratelist中的信息正是一条条的评论信息，所以也正是我们需要的Url。','2018-04-11',13,6),(16,'K-近邻算法概述(k-Nearest Neighbor，KNN)','K-近邻算法采用测量不同的特征值之间的距离方法进行分类。该方法的思路是：如果一个样本在特征空间中的k个最相似(即特征空间中最邻近)的样本中的大多数属于某一个类别，则该样本也属于这个类别。\r\n\r\n*优点：精度高、对异常数据不敏感、无数据输入假定。\r\n*缺点：计算复杂度高、空间复杂度高。\r\n*适用数据范围：数值型和标称型。\r\nKNN工作原理是：存在一个样本数据集合（训练样本集），并且样本集中每个数据都存在标签，即我们知道样本集中每一数据与所属分类的对应关系。输入没有标签的新数据后，将新数据每个特征与样本集中数据对应的特征进行比较，然后算法提取样本集中特征最相似的数据（最近邻）的分类标签。\r\n\r\n一般来说我们只选择样本数据集中前k个最相似的数据。通常k是不大于20的整数。最后选择k个最相似数据中出现次数最多的分类，作为新数据的分类。','2018-04-11',14,1);

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Data for table "blog_post_tags"
#

INSERT INTO `blog_post_tags` VALUES (12,10,10),(13,11,11),(14,12,12),(15,12,13),(16,13,10),(17,14,12),(18,15,14),(19,16,15);

#
# Structure for table "blog_tag"
#

CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "blog_tag"
#

INSERT INTO `blog_tag` VALUES (8,'测试'),(9,'工具'),(10,'入门'),(11,'java'),(12,'计算机'),(13,'显卡'),(14,'python'),(15,'算法');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "comments_comment"
#

INSERT INTO `comments_comment` VALUES (7,'22222','22333@113.com','wwee','2018-04-10 01:04:59',5),(8,'大力','2@163.com','大力评测','2018-04-10 02:06:52',5),(9,'haha','dd@112.com','ssdads','2018-04-10 02:38:22',5),(10,'wo','ss@174.com','评论测试可用','2018-04-11 09:09:08',2),(11,'11','33@163.com','测试评论可用','2018-04-11 09:23:21',14);

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
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

#
# Data for table "django_admin_log"
#

INSERT INTO `django_admin_log` VALUES (1,'2018-04-09 03:05:09','1','???',1,'[{\"added\": {}}]',8,1),(2,'2018-04-09 03:05:19','1','??',1,'[{\"added\": {}}]',9,1),(3,'2018-04-09 03:05:21','1','???',1,'[{\"added\": {}}]',7,1),(4,'2018-04-09 03:13:11','2','??',1,'[{\"added\": {}}]',8,1),(5,'2018-04-09 03:13:16','2','??',1,'[{\"added\": {}}]',9,1),(6,'2018-04-09 03:13:19','2','????',1,'[{\"added\": {}}]',7,1),(7,'2018-04-09 07:32:59','3','??',1,'[{\"added\": {}}]',8,1),(8,'2018-04-09 07:33:06','3','????',1,'[{\"added\": {}}]',9,1),(9,'2018-04-09 07:33:07','3','?????',1,'[{\"added\": {}}]',7,1),(10,'2018-04-09 07:36:16','3','?????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(11,'2018-04-09 07:41:59','3','?????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(12,'2018-04-09 07:42:53','3','?????',2,'[]',7,1),(13,'2018-04-09 07:48:52','4','??',1,'[{\"added\": {}}]',9,1),(14,'2018-04-09 07:49:19','4','????',1,'[{\"added\": {}}]',7,1),(15,'2018-04-09 07:50:22','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(16,'2018-04-09 07:51:10','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(17,'2018-04-09 07:53:23','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(18,'2018-04-09 07:54:28','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(19,'2018-04-09 08:01:54','4','????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(20,'2018-04-09 08:52:36','3','?????',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(21,'2018-04-09 12:43:49','4','??mac',1,'[{\"added\": {}}]',8,1),(22,'2018-04-09 12:43:57','5','??mac',1,'[{\"added\": {}}]',9,1),(23,'2018-04-09 12:44:00','5','mac?????',1,'[{\"added\": {}}]',7,1),(24,'2018-04-10 00:52:03','5','mac下测试标签',1,'[{\"added\": {}}]',8,1),(25,'2018-04-10 00:52:13','6','测试mac',1,'[{\"added\": {}}]',9,1),(26,'2018-04-10 00:52:28','5','mac测试的标题',2,'[{\"changed\": {\"fields\": [\"title\", \"body\", \"created_time\", \"category\"]}}]',7,1),(27,'2018-04-10 06:20:04','6','测试',1,'[{\"added\": {}}]',8,1),(28,'2018-04-10 06:20:09','7','测试',1,'[{\"added\": {}}]',9,1),(29,'2018-04-10 06:20:14','8','目录文章测试',1,'[{\"added\": {}}]',7,1),(30,'2018-04-10 06:21:19','3','hello 单车',3,'',7,1),(31,'2018-04-10 06:51:23','8','目录文章测试',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(32,'2018-04-10 07:29:14','8','目录文章测试',2,'[]',7,1),(33,'2018-04-10 07:29:29','7','testuser1',1,'[{\"added\": {}}]',8,1),(34,'2018-04-10 07:29:32','5','mac测试的标题',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',7,1),(35,'2018-04-10 07:29:38','4','百度云',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',7,1),(36,'2018-04-10 07:29:44','2','石墨文章',2,'[{\"changed\": {\"fields\": [\"body\", \"category\"]}}]',7,1),(37,'2018-04-10 07:29:50','1','测试文章',2,'[{\"changed\": {\"fields\": [\"body\", \"category\"]}}]',7,1),(38,'2018-04-10 07:41:01','4','??mac',3,'',8,1),(39,'2018-04-10 07:41:01','3','??',3,'',8,1),(40,'2018-04-10 07:41:01','2','??',3,'',8,1),(41,'2018-04-10 07:41:01','1','???',3,'',8,1),(42,'2018-04-10 07:42:04','7','测试',3,'',9,1),(43,'2018-04-10 07:42:04','5','百度',3,'',9,1),(44,'2018-04-10 07:42:04','4','石墨',3,'',9,1),(45,'2018-04-10 07:42:04','3','云',3,'',9,1),(46,'2018-04-10 07:42:04','2','测试',3,'',9,1),(47,'2018-04-10 07:42:31','6','测试mac',3,'',9,1),(48,'2018-04-10 07:42:31','1','合法',3,'',9,1),(49,'2018-04-10 07:42:55','8','测试',1,'[{\"added\": {}}]',9,1),(50,'2018-04-10 07:43:03','9','工具',1,'[{\"added\": {}}]',9,1),(51,'2018-04-10 07:43:28','2','石墨文章',2,'[{\"changed\": {\"fields\": [\"created_time\"]}}]',7,1),(52,'2018-04-10 07:43:41','1','测试文章',2,'[{\"changed\": {\"fields\": [\"category\"]}}]',7,1),(53,'2018-04-11 03:41:37','8','知识讲解',1,'[{\"added\": {}}]',8,1),(54,'2018-04-11 03:41:44','10','入门',1,'[{\"added\": {}}]',9,1),(55,'2018-04-11 03:41:54','10','elasticsearch入门知识讲解',1,'[{\"added\": {}}]',7,1),(56,'2018-04-11 03:43:46','9','java',1,'[{\"added\": {}}]',8,1),(57,'2018-04-11 03:43:52','11','java',1,'[{\"added\": {}}]',9,1),(58,'2018-04-11 03:43:55','11','Java编程思想学习笔记十：内部类',1,'[{\"added\": {}}]',7,1),(59,'2018-04-11 03:45:26','10','计算机',1,'[{\"added\": {}}]',8,1),(60,'2018-04-11 03:45:36','12','计算机',1,'[{\"added\": {}}]',9,1),(61,'2018-04-11 03:45:43','13','显卡',1,'[{\"added\": {}}]',9,1),(62,'2018-04-11 03:45:48','12','计算机底层是如何访问显卡的？',1,'[{\"added\": {}}]',7,1),(63,'2018-04-11 04:38:07','9','测试标题',3,'',7,1),(64,'2018-04-11 04:38:07','2','石墨文章',3,'',7,1),(65,'2018-04-11 04:38:07','1','测试文章',3,'',7,1),(66,'2018-04-11 06:35:15','2','Java编程思想学习笔记十：内部类',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(67,'2018-04-11 06:35:44','2','Java编程思想学习笔记十：内部类',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(68,'2018-04-11 06:36:12','2','Java编程思想学习笔记十：内部类',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(69,'2018-04-11 06:52:52','11','怎么去读书',1,'[{\"added\": {}}]',8,1),(70,'2018-04-11 06:53:02','13','怎样阅读一本书',1,'[{\"added\": {}}]',7,1),(71,'2018-04-11 06:55:08','12','精华',1,'[{\"added\": {}}]',8,1),(72,'2018-04-11 06:55:15','14','Laravel / PHP 精华文章',1,'[{\"added\": {}}]',7,1),(73,'2018-04-11 06:56:07','13','爬虫',1,'[{\"added\": {}}]',8,1),(74,'2018-04-11 06:56:12','14','python',1,'[{\"added\": {}}]',9,1),(75,'2018-04-11 06:56:14','15','python爬虫——分析天猫iphonX的销售数据',1,'[{\"added\": {}}]',7,1),(76,'2018-04-11 06:57:04','14','算法',1,'[{\"added\": {}}]',8,1),(77,'2018-04-11 06:57:08','15','算法',1,'[{\"added\": {}}]',9,1),(78,'2018-04-11 06:57:11','16','K-近邻算法概述(k-Nearest Neighbor，KNN)',1,'[{\"added\": {}}]',7,1),(79,'2018-04-11 06:59:16','1','elasticsearch入门知识讲解',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',7,1),(80,'2018-04-11 08:36:02','15','分析天猫iphonX的销售数据',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',7,1);

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Data for table "django_migrations"
#

INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-04-09 03:02:15'),(2,'auth','0001_initial','2018-04-09 03:02:16'),(3,'admin','0001_initial','2018-04-09 03:02:16'),(4,'admin','0002_logentry_remove_auto_add','2018-04-09 03:02:16'),(5,'contenttypes','0002_remove_content_type_name','2018-04-09 03:02:16'),(6,'auth','0002_alter_permission_name_max_length','2018-04-09 03:02:16'),(7,'auth','0003_alter_user_email_max_length','2018-04-09 03:02:16'),(8,'auth','0004_alter_user_username_opts','2018-04-09 03:02:16'),(9,'auth','0005_alter_user_last_login_null','2018-04-09 03:02:16'),(10,'auth','0006_require_contenttypes_0002','2018-04-09 03:02:16'),(11,'auth','0007_alter_validators_add_error_messages','2018-04-09 03:02:16'),(12,'auth','0008_alter_user_username_max_length','2018-04-09 03:02:16'),(13,'blog','0001_initial','2018-04-09 03:02:16'),(14,'sessions','0001_initial','2018-04-09 03:02:16'),(15,'comments','0001_initial','2018-04-09 09:04:30'),(16,'blog','0002_auto_20180410_1046','2018-04-10 02:46:28');

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

INSERT INTO `django_session` VALUES ('0yd6iqbm2k6nv6wtttlovaqg8i16jcaz','ODA5ZDg5ZjVlMmI3ZDgzMmVhY2NiNWUzNDc4ZGE3NmY3MzQ2YWRmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTM2M2I0NGFmNGNkNzJhMGI0NjMxNzk5YTdiM2E5MmQ5NjU2ZTdjIn0=','2018-04-23 03:04:44'),('9swdcssiw1jhj7vcjmyhegwlm4vlpqhk','ODA5ZDg5ZjVlMmI3ZDgzMmVhY2NiNWUzNDc4ZGE3NmY3MzQ2YWRmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1YTM2M2I0NGFmNGNkNzJhMGI0NjMxNzk5YTdiM2E5MmQ5NjU2ZTdjIn0=','2018-04-23 12:42:41');
