-- MySQL dump 10.13  Distrib 5.5.33, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: web_data
-- ------------------------------------------------------
-- Server version	5.5.33-0+wheezy1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `menu_tb`
--

DROP TABLE IF EXISTS `menu_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_tb` (
  `menu` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `submenu` varchar(30) DEFAULT NULL COMMENT '子菜单名称',
  `count` int(11) DEFAULT NULL COMMENT '点击次数',
  `link` varchar(100) DEFAULT NULL COMMENT '链接地址',
  `tips` varchar(50) DEFAULT NULL COMMENT '提示信息',
  `idx` int(11) DEFAULT NULL COMMENT '菜单索引号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_tb`
--

LOCK TABLES `menu_tb` WRITE;
/*!40000 ALTER TABLE `menu_tb` DISABLE KEYS */;
INSERT INTO `menu_tb` VALUES ('站内普通资料','授权访问',0,'./test.php','授权访问资料',0),('站内普通资料','C函数索引',0,'./linux_C/left.htm','linux C函数索引',0),('站内普通资料','fedora',0,'./other.php','原fedora页面相关资料',0),('站内普通资料','VIM指令',0,'./vim.html','一个网上抓取的vim操作指南',0),('站内普通资料','系统安装杂记',1,'./setup.php','一些老旧的系统安装记录',0),('站内普通资料','linux内核选项',0,'./kernel_options.html','网上摘取的linux2.6.19内核选项简介',0),('站内普通资料','debian学习笔记',0,'./debian.htm','网上摘取的debian学习笔记',0),('站内编程资料','欢乐农场源代码',0,'./so_about.php','本人2010年开发的一款类似与QQ农场的gtk程序源代码',1),('站内编程资料','QT资料',2,'./qt.php','个人前期QT学习总结',1),('站内编程资料','linux 汇编',0,'./linux_about/alllinux.html','AT&T汇编学习资料及代码',1),('站内编程资料','mysql 编程',0,'./qqfarm.php','个人总结的mysql编程的相关问题',1),('站内编程资料','unix编程相关',0,'./unixfaq/book1.htm','UNIX Programming',1),('站内编程资料','gtk文档',0,'./gtkabout.php','网络获取及个人总结的gtk文档',1),('站内编程资料','Android开发',0,'./android.php','Android开发',1),('站内编程资料','php相关',0,'./php_about.php','php相关资料',1),('站内编程资料','内核准备',0,'./kernel/k_main.php','个人搜集整理的一些内核编程资料',1),('站内常用资料','我喜欢的WM',2,'./mywm.php','记录了我所钟爱的几款wm的操作和配置',2),('站内常用资料','VIM杂记',0,'./vimp/vimhelp.php','记录了我常用的vim配置和操作',2),('站内常用资料','debian安装',0,'./debian/setup_debian.php','个人debian安装经验及问题总结',2),('站内常用资料','linux实用命令',0,'./debian/order.php','linux下一些实用命令',2),('站内常用资料','mysql本地手册',0,'./refman-5.1-zh.html-chapter/index.html','一个从网上wget下来的mysql手册',2),('站内常用资料','杂项记录',1,'./linux_about/lab.php','linux下各类实用的命令和操作介绍',2),('站内常用资料','动态域名解析',5,'./dns_01.php','动态域名解析以及我的网盘链接',2),('实用工具软件','git介绍',0,'./all_tools/git/book/zh/index.html','git 介绍',3),('实用工具软件','git社区精华',0,'./all_tools/gitbook.liuhui998.com/index.html','git社区精华',3),('实用工具软件','邮件收发',4,'./all_tools/mutt/mutt.php','在debian下搭建邮件服务器的个人总结',3),('实用工具软件','GNU Make',0,'./all_tools/GNUmake_v3.80-zh_CN_html/index.html','GNU make中文手册',3),('实用工具软件','Bash',0,'./all_tools/abs-guide-3.7-cnhtml/HTML/index.html','高级bash脚本编程指南',3),('实用工具软件','vimdoc',0,'./all_tools/vimcdoc.sourceforge.net/doc/help.html','另一个网上获取的vim文档',3),('实用工具软件','feh',1,'./all_tools/feh/feh.php','小巧实用的看图软件feh介绍',3),('实用工具软件','udev编写规则',0,'./all_tools/udev/writing_udev_rules.html','udev编写规则',3),('实用工具软件','w3m简介',0,'./all_tools/w3m/w3m.php','w3m-基于文本的网页浏览器介绍',3),('实用工具软件','apt常用功能',0,'./all_tools/apt/apt.php','apt常用功能简介',3),('实用工具软件','ssh基本应用',0,'./all_tools/ssh/ssh.php','ssh基本应用',3),('实用工具软件','grub rescure',0,'./all_tools/grub.php','grub rescure简介',3),('实用工具软件','python3',0,'./diveintopython3/index.html','python3教程',3),('实用工具软件','python',0,'./woodpecker.org.cn/abyteofpython_cn/chinese/index.html','python教程',3),('站内娱乐','丁丁历险记',0,'./tin.php','丁丁历险记-月球探险',4),('站内娱乐','全球摄像头',1,'./newyork.php','纽约街头监控',4),('站内娱乐','全景图',1,'./googlemap/vieww.php','世界各地全景图',4),('站内娱乐','豆瓣音乐',0,'http://douban.fm/radio','豆瓣音乐',4),('常用链接','5566',8,'http://www.5566.org/','5566门户网站',5),('常用链接','卫星云图',6,'http://www.zjwater.gov.cn/wxyt/','浙江水利卫星云图',5),('常用链接','地震台网',1,'http://bulletin.gddsn.org.cn/seisbulletin/main.seam','虚拟地震台网',5),('常用链接','在线翻译',1,'http://translate.google.cn/','google翻译',5),('常用链接','google',0,'https://www.google.com.hk/','你懂得网站',5),('常用链接','百度2012',4,'http://tieba.baidu.com/f?kw=2012','百度2012吧',5),('常用链接','百度linux',0,'http://tieba.baidu.com/f?kw=linux','百度linux吧',5),('常用链接','ok模拟网',0,'http://www.okemu.com/default.html','ok模拟网',5),('常用链接','飞鸟娱乐',0,'http://bbs.hdbird.com/','飞鸟娱乐',5),('常用链接','ip查询',0,'http://www.ip138.com/','ip查询',5),('常用链接','webQQ',1,'http://web2.qq.com/','webqq',5),('常用链接','QQ',7,'http://i.qq.com/','QQ空间登录',5),('常用链接','debian',0,'http://www.debian.org/releases/stable/i386/index.html.zh_CN','debian安装手册',5),('常用链接','gentoo',0,'http://www.gentoo.org/doc/zh_cn/','gentoo',5),('常用链接','php中文手册',0,'http://docs.php.net/manual/zh/','php手册',5),('常用链接','mysql5.1手册',0,'http://dev.mysql.com/doc/refman/5.1/zh/index.html','MySQL 5.1参考手册',5),('常用链接','我的行宫',2,'http://tieba.baidu.com/f?kw=捣蛋的行宫','我的行宫',5),('常用链接','中国linux论坛',0,'http://www.linuxforum.net/','中国linux论坛',5);
/*!40000 ALTER TABLE `menu_tb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-16 15:31:33
