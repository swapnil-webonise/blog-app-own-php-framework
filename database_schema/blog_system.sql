-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 05, 2013 at 04:41 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `blog_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `isApprove` enum('Yes','No') NOT NULL DEFAULT 'No',
  `user_id` int(10) NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_blog_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`id`, `title`, `description`, `isApprove`, `user_id`, `created_on`, `modified_on`) VALUES
(5, 'Geek', 'It is energetic&lt;br&gt;', 'Yes', 22, '2013-08-05 14:20:15', '2013-08-05 08:59:17'),
(6, 'Technical', 'Hi this peter i am talking jquery&lt;br&gt;', 'Yes', 22, '2013-08-05 14:20:15', '2013-08-05 08:50:15'),
(7, 'Java', 'It is a string&lt;br&gt;', 'Yes', 22, '2013-08-05 14:20:15', '2013-08-05 08:50:15'),
(15, 'My Blog', 'It is blog&lt;br&gt;', 'Yes', 22, '2013-08-05 15:25:12', '2013-08-05 09:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `blogtag`
--

CREATE TABLE IF NOT EXISTS `blogtag` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL,
  `blog_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_blogtag_blog` (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `blogtag`
--

INSERT INTO `blogtag` (`id`, `tag_name`, `blog_id`) VALUES
(8, 'My', 15);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `isApprove` enum('Yes','No') NOT NULL,
  `blog_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_blog` (`blog_id`),
  KEY `FK_comment_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `comment`, `isApprove`, `blog_id`, `user_id`) VALUES
(1, 'dsfr', 'Yes', 5, 22),
(2, 'sdf', 'No', 5, 22),
(4, 'Hi this nitest\r\n', 'Yes', 5, 22);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `random_no` varchar(8) NOT NULL,
  `activation_code` varchar(8) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `user_role_id` int(10) NOT NULL,
  `isActivated` enum('Yes','No') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id` (`email_id`),
  KEY `FK_user_userrole` (`user_role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email_id`, `password`, `random_no`, `activation_code`, `gender`, `user_role_id`, `isActivated`) VALUES
(22, 'swapnil', 'patil', 'swapnil.patil@weboniselab.com', 'b9988616c86c4b16274819f03e3dbd02', '45033495', '48117311', 'Male', 1, 'Yes'),
(23, 'Priyanka', 'Bhoir', 'priyanka.bhoir@weboniselab.com', '0af1c4460c6b0c5ddbac32539bcdc449', '26011482', '10091459', 'Female', 2, 'Yes'),
(24, 'swapnil', 'patil', 'swapnil@yopmail.com', '7fa23a0144936688ff2031ee1326b89c', '13221185', '21615219', 'Male', 3, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE IF NOT EXISTS `userrole` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`id`, `user_role`) VALUES
(1, 'Admin'),
(2, 'Moderator'),
(3, 'Normal');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `FK_blog_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blogtag`
--
ALTER TABLE `blogtag`
  ADD CONSTRAINT `FK_blogtag_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_comment_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_user_userrole` FOREIGN KEY (`user_role_id`) REFERENCES `userrole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
