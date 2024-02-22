-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 22, 2024 at 03:25 AM
-- Server version: 10.11.6-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u304447791_newsportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) DEFAULT NULL,
  `AdminPassword` varchar(255) DEFAULT NULL,
  `AdminEmailId` varchar(255) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `userType`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', 'phpgurukulofficial@gmail.com', 1, '2021-05-26 18:30:00', '2021-11-11 16:23:15'),
(3, 'subadmin', 'f925916e2754e5e03f75dd58a5733251', 'sudamin@gmail.in', 0, '2021-11-10 18:28:11', NULL),
(4, 'suadmin2', 'f925916e2754e5e03f75dd58a5733251', 'sbadmin@test.com', 0, '2021-11-10 18:28:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 'વીડિયો સ્ટોરી', 'Video Stories', '2021-06-05 18:30:00', '2024-02-20 18:11:27', 0),
(5, 'મનોરંજન', 'Entertainment related  News', '2021-06-13 18:30:00', '2024-02-20 18:11:37', 0),
(6, 'મિજાજ સ્પેશિયલ', 'Mijaj special news', '2021-06-21 18:30:00', '2024-02-15 02:24:25', 1),
(7, 'રમત-ગમત', 'Sports and games related news\r\n', '2021-06-21 18:30:00', '2024-02-15 02:28:19', 1),
(8, 'શેરબજાર', 'Stock market related news', '2021-11-07 18:17:28', '2024-02-15 02:27:11', 1),
(9, 'શિક્ષણ', 'Education related news', '2024-02-07 14:54:23', '2024-02-15 02:27:55', 1),
(10, 'આરોગ્ય', 'Health related news', '2024-02-15 02:28:41', '2024-02-20 18:13:12', 0),
(11, 'આદિવાસી ભારત', 'Tribals related news', '2024-02-15 02:29:06', NULL, 1),
(12, 'ક્રાઇમ', 'Crime related news', '2024-02-15 02:29:49', '2024-02-20 18:13:05', 0),
(13, 'યુવા અને રાજકારણ', 'Youth and politics related news', '2024-02-15 02:30:28', NULL, 1),
(14, 'સાહિત્ય', 'Literature related news', '2024-02-15 02:31:21', NULL, 1),
(15, 'ખેડૂત આંદોલન ', 'ખેડૂત આંદોલન ', '2024-02-20 17:13:07', NULL, 1),
(16, 'Top News ', 'India ', '2024-02-20 17:58:46', NULL, 1),
(17, 'મનોરંજન ', 'મનોરંજન ', '2024-02-21 09:03:37', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` int(11) DEFAULT NULL,
  `name` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `comment` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PageTitle` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'About News Portal', '<font color=\"#7b8898\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, 微软雅黑, 宋体, SimSun, STXihei, 华文细黑, serif\"><span style=\"font-size: 26px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></font><br>', '2021-06-29 18:30:00', '2021-11-06 18:30:00'),
(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Address :&nbsp; </b>New Delhi India</p><p><b>Phone Number : </b>+91 -01234567890</p><p><b>Email -id : </b>phpgurukulofficial@gmail.com</p>', '2021-06-29 18:30:00', '2021-11-06 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostImage` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `viewCounter` int(11) DEFAULT NULL,
  `postedBy` varchar(255) DEFAULT NULL,
  `lastUpdatedBy` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`, `viewCounter`, `postedBy`, `lastUpdatedBy`) VALUES
(19, 'સરકારી ગૌચર જમીનોમાં ખાણકામ મુદ્દે સાત વર્ષ પછી પણ તપાસ અહેવાલ નથી. : રોમેલ સુતરિયા', 11, 13, '<p>\" તાપી જીલ્લામાં ચીફ સેક્રેટરી અને કલેકટરે ગૌચર જમીનો પર મામલતદારોને સોંપેલ તપાસ ના થતા રોમેલ સુતરિયા એ આજરોજ પત્ર પાઠવી અંતિમ કાર્યવાહી કરવા રજૂઆત કરી.હાઈવે ૫૬ ના નામે આદિવાસીઓની જમીનો લેવી છે પણ ખનન માફિયાઓ પાસેથી ગૌચર ખાલી નથી કરાવવું આ કેવી વિચિત્ર નીતિ? \"</p><p><br></p><p>\"તાપી જીલ્લામાં રાજ કોનું કાયદાનું કે લુટારાઓ નું તે એક ગંભીર પ્રશ્ન હું આપ સહુ સામે મુકી રહ્યો છું જેનો જવાબ હવે જીલ્લા કલેક્ટર ગૌચર જમીનમાં ચાલતા ખાણકામ બંદ કરાવી આપશે?\"&nbsp;</p><p><br></p><p>સમગ્ર મામલે હકીકત તેમ છે કે રોમેલ સુતરિયા દ્વારા વર્ષ ૨૦૧૫ માં તાપી જીલ્લામાં ચાલતા ખનન બાબતે મંજુરી આપવામાં આવેલ ખાણોની વિગતો એકત્ર કરેલ હતી જે બાબતે તાપી જીલ્લા ભૂસ્તર વિભાગ દ્વારા પાઠવવામાં આવેલ વિગતો જોતા જીલ્લામાં સરકારી તેમજ ગૌચર જમીનોમા મોટા પાયે નિયમો વિરુદ્ધ બ્લેક ટ્રેપ ખાણકામ ની મંજુરીઓ આપવાનું કૌભાંડ આચરનારા આવતું હોવાની વિગતો પકડાઈ હતી. જે બાબતે ખાણકામ કરનારા માલિકો ના નામ , ગામના નામ ,જમીનના સર્વે નંબર સહિતની વિગતો RTI માં બહાર આવતા ગૌચર જમીનોને સરકારી પડતરમાં ફેરબદલ કરી ને પણ ખાણકામ માટે ફાળવી , સરકારી જમીનો ને ખાણકામ માટે ફાળવી તેમજ નદીના પટમાં ખાણકામ ની મંજુરીઓ આપી પર્યાવરણ તેમજ ગ્રામ જનોને આર્થિક રીતે ભરપાઈ ના થઈ શકે તેવું તેમજ જે રાજ્ય માં ગૌચર બચાવવાં ગૌચર વિકાસ બોર્ડ બનાવામાં આવ્યુ હોય , પશુધન અને ગાય માતા નામે ઓળખાતી તેમના માટે રાખવામાં આવેલ ગૌચર જમીનો જે ગરીબોને રહેવા , ખેડવા પણ આપી શકાતી નથી તેવી કડક નિયમો,કાયદા હોવા છતાં તાપી જીલ્લામાં ૧૪ જેટલા ખાણકામ ગૌચર જમીનો માં કરી તે જમીનો માં થયેલ નુકશાન નું ભારણ સરકાર ઉપર આવતું હોય છે. જે ખનન માફિયાઓ પાસેથી વસૂલવામાં આવે તે જરૂરી છે.આમ નિયમો નેવે મુકી કાયદો વ્યવસ્થા ના ડર વગર ગેરકાયદેસર ખનન કરતા ખનન માફિયાઓ સામે રોમેલ સુતરિયા એ બાયો ચડાવી હતી.&nbsp;</p><p><br></p><p>સમગ્ર મામલે એક જાગૃત નાગરિક અને AKSM ના અધ્યક્ષ તરીકે રોમેલ સુતરિયા એ વિગતો નો અભ્યાસ કર્યા બાદ પોતાની રજૂઆત ગુજરાત રાજ્ય ના ચીફ સેક્રેટરી ને મોકલી આપી હતી જે બાબતે ગુજરાત રાજ્ય ના ચીફ સેક્રેટરી ના પત્ર સંદર્ભે તત્કાલીન સેક્શન અધિકારી દ્વારા સમગ્ર મામલે વધુ તપાસ કરવા તાપી જીલ્લા કલેક્ટર ને ૫ ફેબ્રુઆરી ૨૦૧૬ ના રોજ હુકમ કરવામાં આવ્યો હતો.જે બાબતે તત્કાલીન કલેકટર દ્વારા સમગ્ર મામલે અભ્યાસ તથા કર્મશીલ રોમેલ સુતરિયા સાથે અનેક મુદ્દત માં પુરાવાઓ ચકાસી સંવાદ કર્યા બાદ સંપૂર્ણ તપાસ તાપી જીલ્લામાં આવેલ વ્યારા , ડોલવણ , વાલોડ , સોનગઢ ના તાલુકાના મામલતદારોને રોમેલ સુતરિયા દ્રારા ચીફ સેક્રેટરી ને કરવામાં આવેલ ફરિયાદ ના સાધનિક પુરાવા સહિતની રજુઆત મોકલી આપી દિન ૧૦ માં હકીકત લક્ષી અહેવાલ દિન ૧૦ માં તૈયાર કરવા હુકમ કરેલ હતો. જે બાબતે કોઈ પણ પ્રકારનો અહેવાલ આજ દિન સુધી તૈયાર કરવામાં આવેલ નથી કે એક પણ ખનન માફિયાઓ સામે ગૌચર ને થયેલ નુકશાન બાબતે વળતર વસુલવા માટે કાર્યવાહી થયેલ નથી. જેથી આજે રોજ રોમેલ સુતરિયા દ્વારા વર્તમાન કલેકટર તાપી ને ચીફ સેક્રેટરી તેમજ તત્કાલીન કલેકટર ના બંન્ને હુકમ સંદર્ભે મામલતદારો દ્વારા કોઈ અહેવાલ તૈયાર કરેલ ના હોય તપાસ કરવા પત્ર પાઠવવામાં આવેલ છે.જે બાબતે રોમેલ સુતરિયા નો સંપર્ક કરતા તેઓએ જણાવેલ છે કે આ ખનન માફિયાઓ માં સરકાર , પ્રશાસન તેમજ કાયદાનો ભય રહેશે તો જ પર્યાવરણ થતું નુકશાન, ગ્રામ્ય જનોની હેરાનગતિ , ભુગર્ભ જળને થતું નુકશાન, નિયમોનું ઉલ્લંઘન અટકાવી શકાશે બાકી જીલ્લા કલેક્ટર અને મામલતદાર કક્ષાના અધિકારી તાપી જીલ્લામાં ગૌચર જમીનો ચાલતા ખાણકામ બંધ ના કરાવી શકતા હોય તો આ બાબત ખુબ ચિંતાજનક સ્થિતિ નો ઈશારો કરી રહી છે.ગૌચર ખાલી કરાવવા ગુજરાત હાઈકોર્ટે અને સુપ્રીમ કોર્ટે ની સ્પષ્ટ ગાઈડ લાઈન છે જે મુજબ કોઇ પણ પ્રકારની નોટિસ પણ પાઠવવાની રહેતી નથી અને ગૌચર જમીનો પરના દબાણો હટાવવામાં આવી શકે છે. જો આમ ના થાય તો પછી ગરીબ આદિવાસીઓ ની જમીનો રોડના નામે છીનવવા પોલીસ પ્રશાસન નું જોર વાપરી શકાય પણ ખનન માફિયાઓ સામે સાત સાત વર્ષ સુધી તપાસ ના થાય તો તાપી જીલ્લામાં રાજ કોનું કાયદાનું કે લુટારાઓ નું તે એક ગંભીર પ્રશ્ન હું આપ સહુ સામે મુકી રહ્યો છું જેનો જવાબ હવે જીલ્લા કલેક્ટર ગૌચર જમીનમાં ચાલતા ખાણકામ બંદ કરાવી આપશે તેવી આશા છે બાકી ન્યાય તંત્ર ના દરવાજા છે લૂંટારાઓ જીલ્લામાં ગમે તેટલા અધિકારી ઓ ને ખરીદી શકે છે પણ હવે તેમને હાઈકોર્ટ માં દોડાવી દોડાવીને પણ ગૌચર ખાલી કરાવીશું.</p><div><br></div>', '2024-02-18 18:02:32', '2024-02-21 12:10:15', 1, 'સરકારી-ગૌચર-જમીનોમાં-ખાણકામ-મુદ્દે-સાત-વર્ષ-પછી-પણ-તપાસ-અહેવાલ-નથી.-:-રોમેલ-સુતરિયા', '9382df02436cb2cc5bebb4ee96298f92.jpg', 99, 'admin', NULL),
(21, 'કંપની સરકાર\" સામે ફરી શરૂ થયું કિસાન આંદોલન શું આવશે પરિણામ ?', 15, 15, '<p>:-&nbsp; અખિલ ચૌધરી<br></p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; એવો સમય પણ આવી શકે છે જ્યારે આપણે અન્યાય ને રોકવા માટે અસમર્થ થઈ જઈએ પણ એવો સમય ક્યારેય પણ નહિ આવો જોઈએ કે આપણે અન્યાયનો વિરોધ કરવામાં અસફળ થઈ જઈએ,આ શબ્દો મૈં કયાંક વાંચ્યા હતા આજે એટલા માટે કહી રહ્યો છું દોસ્તો આજના સમયમાં મારા મતે કયાંક આ શબ્દો ની કડી ગોઠવાઈ રહી છે તમે ઠીક સમજ્યા આ વાત દેશની રાજધાની ખાતે સરકારની સામે ફરી પોંહચી ચૂકેલા કિસાન આંદોલનની છે દેશના કિસાનોને મોદી સરકારે આપેલી ગેરંટીઓ ખોટી પડી છે માટે દેશનો કિસાન ફરી પોતાના ન્યાયની લડત લડવા રાજધાની દિલ્હીમાં પ્રવેશી રહ્યા છે અને આંદોલનની શરૂઆત કરી રહ્યા છે આજે દેશનો કિસાન સડક પર ખાડા તથા તાર ના કાટા,વોટર કેનન અને દંડા ખાઈને પોતાનો પથ કાપી દિલ્હીમાં પ્રવેશ કરવા પ્રયત્ન કરી રહ્યો છે ન્યાયની આશા માટે આંદોલન ફરી શરૂ કરી રહ્યા છે MSP ની માંગણી અને ખેડૂતના દેવા નાબૂદીની માંગ સાથે&nbsp; પોતે અડીખમ યોદ્ધાની જેમ જજુમી રહ્યા છે અને મહાત્મા ગાંધીજીના ચિંધ્યા માર્ગે અહિંસક લડત લડવા નીકળી પડ્યા છે&nbsp; ત્યારે ખેડૂત વિરોધી કેન્દ્ર સરકાર એમને દિલ્હીમાં પ્રવેશતા રોકી રહી છે બેરિકેડ સાથે રસ્તાઓ પર ખીલા અને આંસુ ગેસના ગોળાઓ સાથે ખેડૂતોનું સ્વાગત કેન્દ્ર સરકાર કરી રહી છે એનો સારાંશ એટલોજ છેકે કોર્પોરેટ મુડીદારો દેશની જીવાદોરી સમાન જમીનો અને ખેતીના ક્ષેત્રમાં હસ્તક્ષેપ કરીને મોટા હજારો ગોડાઉન બનાવી બહેતર લૂંટ કરી મોંઘા મુલે અનાજ વેચી ફાયદો કમાવાની દિશામાં છે અને બે ટંક નો રોટલો મેળવતા ખેડૂતોની થાળીનો કોળિયો ખાઈ જઈ પોતે લૂંટ ચલાવી મૂડીવાદી બની પોતે પોતાનો વિકાસ કરવા માંગે છે</p><p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; જગતનો તાત જમીનમાં હળ ચલાવી ને દેશ માટે અન્ન ઉપજાવે છે અને ખવડાવે છે પેટ ભરે છે અને લોકજીવન ને તારે છે એ વાત નાની સુની નથી આ હિંમત એ પોતાના બાહુનાં બાવડા ના જોરે કરી રહેલ છે પોતાનું જતું કરી ને બીજા ને જીતાડનાર તાત આજે નોધારા આંસુ પાડી લડત લડી રહ્યો છે જીવન મરણની હોડ માં જીવી રહેલો ખેડૂત આજે નિરાધાર બન્યો છે માટે દેશની સમગ્ર સમાજ ના માટે એક સમાનતા ની લાગણી ઉપજે તેવી નમ્ર અને અતિ આદર કરે એવી નીતિ અપનાવી સરકારે પોતાના નિર્ણય ને યોગ્ય વણાક વાડી દિશા માં લઇ જઇ ને બેધડક ન્યાય અને ખેડૂતો ના હિતોના રક્ષક બની એક ફરજ બજાવી MSP ની ગેરંટી અને ખેડતોના દેવા માફી ન્યાયિક રીતે આપે એમાંજ ખેડૂતો અને દેશનું હીત છે અને અંતમાં એટલું કહીશ કે આંદોલન એ લોકતંત્રના જીવંતતા નું પ્રતિક છે માટે જે આંદોલનજીવી છે એ લોકતંત્રજીવી છે...&nbsp;</p><div><br></div>', '2024-02-20 17:25:02', '2024-02-21 16:41:43', 1, 'કંપની-સરકાર\"-સામે-ફરી-શરૂ-થયું-કિસાન-આંદોલન-શું-આવશે-પરિણામ-?', '94c90f284c8688735cd5ecb273d9206d.jpg', 16, 'admin', NULL),
(22, 'ખેલ મહાકુંભ ૨૦૨૪ : “ ખેલ મહાકુંભના પરિણામે ગુજરાતમાં રાષ્ટ્રીય – આંતરાષ્ટ્રીય સ્તરના ખેલાડીઓ તૈયાર થયા. ', 7, 14, '<p class=\"MsoNormal\"><span lang=\"GU\" style=\"font-family: Shruti, sans-serif;\">ખેલ મહાકુંભની સફળતા અંગે રાજ્યના રમતગમત\nમંત્રી હર્ષ </span><span lang=\"GU\" style=\"font-family: Shruti, sans-serif;\">સંઘવીએ\nજણાવ્યું હતું કે ખેલ મહાકુંભના આયોજનના પરિણામે રાજ્યના દૂર-સુદૂર અને અંતરિયાળ વિસ્તારોમાં\nર્હત ખેલાડીઓની પ્રતિભા રાષ્ટ્રીય અને આંતરાષ્ટ્રીય સ્તરે ઉજાગર થઈ છે.</span></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\"><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif;\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">રાજ્યમાં ખેલ મહાકુંભની જે આશયથી શરૂઆત\nકરવામાં આવી હતી તે સફળ થઈ રહ્યું હોય તેમ લાગી રહ્યું છે.ઇન સ્કૂલ , </span><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif\">ડી.એલ.એસ.એસ. શક્તિદૂત જેવી યોજનાઓ\nઅને ખેલ મહાકુંભના આયોજનથી રાજ્યના દૂર-સુદૂર અને અંતરિયાળ વિસ્તારોમાં રેહતા ખેલાડીઓની\nપ્રતિભા </span><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif;mso-ascii-font-family:\nCalibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;\nmso-hansi-theme-font:minor-latin\">રાષ્ટ્રીય-આંતરાષ્ટ્રીય સ્તરે ઉજાગર થઈ છે. ખેલ\nમહાકુંભ ૨.૦ માં ૪ નવીન રમતો ઉમેરાઈ છે. એક ખેલાડી બે રમતમાં ભાગ લઈ શકે છે. </span><o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\"><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif;\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin;mso-bidi-theme-font:minor-bidi\">ગીર સોમનાથ\nજીલ્લામાં ૧.૩૩ લાખથી વધુ ખેલાડીઓએ રજીસ્ટ્રેશન કરાવ્યું. </span><o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\"><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif;\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">રમતગમત મંત્રી હર્ષ સંઘવીએ જણાવ્યું છે\nકે , ખેલ મહાકુંભ ૨.૦ માં ૪ નવીન રમતોનો ઉમેરો કરાયો છે અને એક ખેલાડી બે રમતમાં ભાગ\nલઈ શકે છે. </span><o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\"><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif;\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">વધુમાં ખેલ મહાકુંભમાં વિજેતા ખેલાડીઓને\nમળતા રોકડ પુરસ્કારની રકમ પણ વધારવામાં આવી છે. વિધાનસભામાં ઇન-સ્કુલ શાળાઓ અને રાજ્યના\nખેલાડીઓની રાષ્ટ્રીય-આંતરાષ્ટ્રીય સ્તરના પ્રદર્શનના જવાબમાં તેમણે કહ્યું હતું કે\n, રાજ્યમાં ઇન સ્કૂલ શાળાઓ , </span><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif\">ડી.એલ.એસ.એસ.\nશક્તિદૂત જેવી યોજનાઓ અને ખેલ મહાકુંભના આયોજનથી રાજ્યના દૂર-સુદૂર અને અંતરિયાળ વિસ્તારોમાં\nરેહતા ખેલાડીઓની પ્રતિભા </span><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif;\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">રાષ્ટ્રીય-આંતરાષ્ટ્રીય સ્તરે ઉજાગર થઈ\nછે.</span><o:p></o:p></p>\n\n<p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p>\n\n<p class=\"MsoNormal\"><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif;\nmso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-hansi-font-family:\nCalibri;mso-hansi-theme-font:minor-latin\">ગામ અને તાલુકા સ્તરની સ્પર્ધામાં પોતાની\nપ્રતિભા ઉજાગર કરીને ખેલાડીઓનો આંતરાષ્ટ્રીય સ્તર સુધી ગુજરાત અને ભારત દેશનો ડંકો\nવાગી રહ્યો છે.ગીર સોમનાથ જીલ્લાના સંદર્ભમાં મંત્રીશ્રી એ જણાવ્યું હતું કે , આ વર્ષે\nખેલ મહાકુંભ ૨.૦ માટે ગીર સોમનાથ </span><span lang=\"GU\" style=\"font-family:&quot;Shruti&quot;,sans-serif\">જીલ્લામાં\n૧.૩૩ લાખથી વધુ ખેલાડીઓએ રજીસ્ટ્રેશન કરાવ્યું છે. અગાઉ પણ ટેલેન્ટ પુલ અને ઇન સ્કૂલના\nકારણે ગીર સોમનાથ જીલ્લાના ૫ જેટલા ખેલાડીઓએ રાજ્ય અને રાષ્ટ્રીય સ્તરના મેડલ પ્રાપ્ત\nકર્યા છે.&nbsp;</span><o:p></o:p></p>', '2024-02-20 17:29:40', '2024-02-21 12:10:49', 1, 'ખેલ-મહાકુંભ-૨૦૨૪-:-“-ખેલ-મહાકુંભના-પરિણામે-ગુજરાતમાં-રાષ્ટ્રીય-–-આંતરાષ્ટ્રીય-સ્તરના-ખેલાડીઓ-તૈયાર-થયા.-', '5d300c15bf0f47e932756a73873c51db.jpg', 77, 'admin', 'admin'),
(25, 'જી હા બહનો ઓર , મે આપકા દોસ્ત અમીન સયાની ‘ રેડિયોની યાદગાર અવાજ એક રેડિયો યુગનો અંત ', 17, 18, '<p>નમસ્કાર બહેનો ઔર ભાઈઓ , મેં આપકા દોસ્ત અમીન સયાની બોલ રહા હું , આ શબ્દો સાથે પોતાના કાર્યક્રમની શરૂઆત કરનાર અમીન સયાની ના દેહાંતના સમાચારથી સમગ્ર દેશમાં એક દુ:ખદ મોજું ફરી વળ્યું છે. આ અવાજ હંમેશા માટે શાંત થઈ ગયો છે.&nbsp;</p><p>રેડિયો ઉપર ૩૦ મિનિટ ના ગીતમાલા કાર્યક્રમ ઉપર હવે આ અવાજ સાંભળવા નહીં મળી શકે. તેમના પ્રશંસકોમા શોકની લાગણી જોવા મળી રહી છે. લાંબા સમય સુધી તેમણે રેડિયોની દુનિયામાં પોતાનું યોગદાન આપ્યું છે , માટે જ અમીન સયાની નું જવું રેડિયો ની દુનિયામાં એક યુગનો અંત માનવામાં આવી રહ્યોં છે.&nbsp;</p><p>રેડિયો ઉપર ૩૦ મિનિટ ના ગીતમાલા કાર્યક્રમ ઉપર હવે આ અવાજ સાંભળવા નહીં મળી શકે. તેમના પ્રશંસકોમા શોકની લાગણી જોવા મળી રહી છે. લાંબા સમય સુધી તેમણે રેડિયોની દુનિયામાં પોતાનું યોગદાન આપ્યું છે , માટે જ અમીન સયાની નું જવું રેડિયો ની દુનિયામાં એક યુગનો અંત માનવામાં આવી રહ્યોં છે.&nbsp;</p><p>રેડિયો ઉપર ૩૦ મિનિટ ના ગીતમાલા કાર્યક્રમ ઉપર હવે આ અવાજ સાંભળવા નહીં મળી શકે. તેમના પ્રશંસકોમા શોકની લાગણી જોવા મળી રહી છે. લાંબા સમય સુધી તેમણે રેડિયોની દુનિયામાં પોતાનું યોગદાન આપ્યું છે , માટે જ અમીન સયાની નું જવું રેડિયો ની દુનિયામાં એક યુગનો અંત માનવામાં આવી રહ્યોં છે.&nbsp;</p><p>રેડિયો ઉપર ૩૦ મિનિટ ના ગીતમાલા કાર્યક્રમ ઉપર હવે આ અવાજ સાંભળવા નહીં મળી શકે. તેમના પ્રશંસકોમા શોકની લાગણી જોવા મળી રહી છે. લાંબા સમય સુધી તેમણે રેડિયોની દુનિયામાં પોતાનું યોગદાન આપ્યું છે , માટે જ અમીન સયાની નું જવું રેડિયો ની દુનિયામાં એક યુગનો અંત માનવામાં આવી રહ્યોં છે.&nbsp;</p><p>રેડિયો ઉપર ૩૦ મિનિટ ના ગીતમાલા કાર્યક્રમ ઉપર હવે આ અવાજ સાંભળવા નહીં મળી શકે. તેમના પ્રશંસકોમા શોકની લાગણી જોવા મળી રહી છે. લાંબા સમય સુધી તેમણે રેડિયોની દુનિયામાં પોતાનું યોગદાન આપ્યું છે , માટે જ અમીન સયાની નું જવું રેડિયો ની દુનિયામાં એક યુગનો અંત માનવામાં આવી રહ્યોં છે.&nbsp;</p><p>રેડિયો ઉપર ૩૦ મિનિટ ના ગીતમાલા કાર્યક્રમ ઉપર હવે આ અવાજ સાંભળવા નહીં મળી શકે. તેમના પ્રશંસકોમા શોકની લાગણી જોવા મળી રહી છે. લાંબા સમય સુધી તેમણે રેડિયોની દુનિયામાં પોતાનું યોગદાન આપ્યું છે , માટે જ અમીન સયાની નું જવું રેડિયો ની દુનિયામાં એક યુગનો અંત માનવામાં આવી રહ્યોં છે.&nbsp;</p><p>રેડિયો ઉપર ૩૦ મિનિટ ના ગીતમાલા કાર્યક્રમ ઉપર હવે આ અવાજ સાંભળવા નહીં મળી શકે. તેમના પ્રશંસકોમા શોકની લાગણી જોવા મળી રહી છે. લાંબા સમય સુધી તેમણે રેડિયોની દુનિયામાં પોતાનું યોગદાન આપ્યું છે , માટે જ અમીન સયાની નું જવું રેડિયો ની દુનિયામાં એક યુગનો અંત માનવામાં આવી રહ્યોં છે.&nbsp;<br></p><p><br></p><div><br></div>', '2024-02-21 09:55:57', '2024-02-21 16:41:35', 1, 'જી-હા-બહનો-ઓર-,-મે-આપકા-દોસ્ત-અમીન-સયાની-‘-રેડિયોની-યાદગાર-અવાજ-એક-રેડિયો-યુગનો-અંત-', '398884a6571a6e796be327fe9daa215f.jpg', 14, 'admin', 'admin'),
(26, 'આદિવાસી સમુદાય ના પડકારો અને વિચાર શું કહે છે ? : Tribal Special ', 11, 13, '<p>તાત્યા ભીલ થી લઈ બિરસા મુંડા અને બિરસા મુંડા થી બંધારણ સમિતિ ના સભ્ય આદિવાસી સમાજ પ્રથમ રાજનાયક જયપાલસિંહ મુંડા નો ઈતિહાસ આદિવાસી સમાજ ની ધરોહર છે.</p><p><br></p><p>અંગ્રેજો જે ભારત ને લુંટવા આવ્યા તે આપણા કુદરતી સંસાધનો હતા.જેની સાક્ષી પૂરે છે અંગ્રેજોએ સ્થાપેલી રેલ્વે લાઈનો જે જંગલો થી નીકળી દરિયા કિનારા ના બંદરો સુધી પહોચે છે.&nbsp;</p><p><br></p><p>સદીઓ થી લુંટાતા જંગલો , મોટા મોટા પ્રોજેકટ માં જતી જમીનો , ડેમના નામે ડૂબતા ગામ અને નદીઓની ઈકો સીસ્ટમ ખોરવાઈ જાય તેવી યોજનાઓ આપણા પર્યાવરણથી લઈ આદિવાસી સંસ્કૃતિ નુ નીકંદન કાઢતા રહ્યા છે.</p><p><br></p><p>ભારતના બંધારણ માં આદિવાસીઓ માટે પાંચમી અને છઠ્ઠી અનુસૂચ વિસ્તાર તરીકે સ્પષ્ટ જોગવાઈ કરવામાં આવી.પરંતુ આઝાદીની સદીઓ પછી પણ બંધારણમાં આદિવાસીઓના હક અધિકાર ની જોગવાઈ ઓ અમલ કરવામાં દરેક સરકાર નિષ્ફળ રહી.આદિવાસીઓ ને હંમેશા વોટ મેળવવા પુરતા ખુશ કરતા રહ્યા અને બીજી બાજુ બંધારણીય જોગવાઈ ઓ નુ આઝાદીના વર્ષો પછી પણ છડે ચોક ઉલ્લંઘન થતુ રહ્યુ.</p><p><br></p><p>જેના પરિણામ સ્વરૂપ આદિવાસી આંદોલનોએ જળ, જંગલ , જમીન બચાવવાની લડાઈ ને કાયદા નુ સ્વરૂપ અપાવવા અવાજ બુલંદ બનાવ્યો. ૧૯૯૫ ભારૌઈય સંસદ માં ભુરિયા સમિતી ના રિપોર્ટ સ્વરુપ ભલામણો ના આધારે PESA (\"The Provisions of the Panchayats (Extension to the Scheduled Areas) Act, 1996\" બનાવવા માં આવ્યો હતો.</p><p><br></p><p>જેના આધારે જળ , જંગલ , જમીન ના રક્ષણ માટે પંચાયતી રાજ એ જ નોબલ મંત્રાલય છે.આદિવાસી વિસ્તારમાં આવનાર કોઈપણ નિર્ણય , કાયદા , યોજના માટે પ્રાથમિક મંજુરી પંચાયતી રાજ મુજબ ગ્રામ સભા માં પારિત બને તે અનિવાર્ય છે. તેમ છતા ગ્રામસભા અને PESA act ને અવગણી તૈયાર થનારી યોજનાઓ આદિવાસીઓ ની મંજુરી વગર અમલમાં લાવવામાં આવે તે બંધારણ અને પેરા કાયદા નુ સ્પષ્ટ હનન છે.</p><p><br></p><p>આથી હવે સમય પાકી ગયો છે તાત્યા ભીલ , બિરસા મુંડા , જયપાલસિંહ મુંડાએ એ આપેલ જળ , જંગલ&nbsp; ,જમીન બચાવવાની લડત ને આપણે અંતિમ પડાવમાં લઈ જઈએ.&nbsp;</p><p><br></p><p>આપણે કહેવુ પડશે \" ના સંસદ ના વિધાન સભા - સબસે ઊચી હૈ ગ્રામ સભા \" પાંચમી અનુસૂચ વિસ્તાર માં ગ્રામ સભા ની મંજુરી વિરુદ્ધ કોઈ યોજના , કંપની , કાયદો ચલાવી લેવામાં નહી આવે.સરકાર કડકાઈ થી આમ નિર્ણય કરશે તો જ આઝાદી બાદ લુંટાતા આપણા જળ , જંગલ&nbsp; ,&nbsp; જમીન , આદિવાસી સંસ્કૃતિ અને આપણા પર્યાવરણ સમાન આપણી ધરોહરની રક્ષા કરી આવનારી પેઢીઓને સારુ જીવન આપી શકીશું.</p><p><br></p><p>તો ચાલો એક થઈ આપણો અવાજ બુલંદ બનાવીએ અંગ્રેજી હુકમત થી લઈ આઝાદીના આટલા વર્ષો સુધી આદિવાસી હક અધિકાર ની રક્ષા માટે સંઘર્ષ કરનાર આપણા પુર્વજોની લડાઈને આગળ ધપાવીએ અને કહીએ પાંચમી અનુસૂચિ વિસ્તાર માં પંચાયત - ગ્રામ સભા ની મંજુરી સિવાય કોઈ યોજના મંજુર નહી.</p><p><br></p><p>ચાલો ઊર્લગુલાન કરીએ વર્તમાન જ નહી આપણી આવનારી પેઢીઓ ના સારા જીવન માટે , જળ ,જંગલ, જમીન ની રક્ષા માટે , પર્યાવરણ ના જતન માટે પાંચમી અનુસૂચિ અને ગ્રામસભા ને પ્રાધાન્ય આપવાની વાત ને કાયદોનુ સ્વરુપ આપીએ.</p><p><br></p><p>પૈસા ઉલ્લંઘન કરનાર ને કડક માં કડક સજાની જોગવાઈ કરવામાં આવે તે માટે ઉમરગામ થી અંબાજી સુધી તમામ આદિવાસીઓ , આદિવાસી સંગઠનો , આંદોલનકારીઓ&nbsp; , પર્યાવરણવાદીઓ , સંસ્થાઓ , સામાજીક - રાજકીય નેતાઓ , ગામના યુવાન ભાઈઓ બહેનો દરેક સંગઠિત થઈ આપણુ અને આપણી આવનાર પેઢીઓનુ જીવન સુરક્ષિત બનાવવા તાત્ય ભીલ , બિરસા મુંડા , જયપાલસિંહ મુંડા ના વિચારો ને મજબુત બનાવીએ.</p><div><br></div>', '2024-02-21 11:15:17', '2024-02-21 16:41:24', 1, 'આદિવાસી-સમુદાય-ના-પડકારો-અને-વિચાર-શું-કહે-છે-?-:-Tribal-Special-', 'a30bbf0c0f55724b7e1565b1367c84ae.jpg', 60, 'admin', 'admin'),
(28, 'જી હા બહનો ઓર , મે આપકા દોસ્ત અમીન સયાની ‘ રેડિયોની યાદગાર અવાજ એક રેડિયો યુગનો અંત ', 17, 18, '<p>“ જી હા બહનો ઓર , મે આપકા દોસ્ત અમીન સયાની ‘ રેડિયોની યાદગાર અવાજ એક રેડિયો યુગનો અંત&nbsp;</p><p><br></p><p>નમસ્કાર બહેનો ઔર ભાઈઓ , મેં આપકા દોસ્ત અમીન સયાની બોલ રહા હું , આ શબ્દો સાથે પોતાના કાર્યક્રમની શરૂઆત કરનાર અમીન સયાની ના દેહાંતના સમાચારથી સમગ્ર દેશમાં એક દુ:ખદ મોજું ફરી વળ્યું છે. આ અવાજ હંમેશા માટે શાંત થઈ ગયો છે.&nbsp;</p><p><br></p><p><br></p>', '2024-02-22 03:00:49', NULL, 1, 'જી-હા-બહનો-ઓર-,-મે-આપકા-દોસ્ત-અમીન-સયાની-‘-રેડિયોની-યાદગાર-અવાજ-એક-રેડિયો-યુગનો-અંત-', '1fd7969fe47b160eac77f5bbd6543700.png', NULL, 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SubCatDescription` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 5, 'Bollywood ', 'Bollywood masala', '2021-06-21 18:30:00', '2024-02-14 14:02:28', 0),
(4, 3, 'Cricket', 'Cricket\r\n\r\n', '2021-06-29 18:30:00', '2024-02-14 14:02:31', 0),
(5, 3, 'Football', 'Football', '2021-06-29 18:30:00', '2024-02-14 14:02:33', 0),
(6, 5, 'Television', 'TeleVision', '2021-06-30 18:30:00', '2024-02-14 14:02:36', 0),
(7, 6, 'National', 'National', '2021-06-30 18:30:00', '2024-02-14 14:02:37', 0),
(8, 6, 'International', 'International', '2021-06-30 18:30:00', '2024-02-14 14:02:47', 0),
(9, 7, 'India', 'India', '2021-06-30 18:30:00', '2024-02-14 14:02:48', 0),
(10, 8, 'Vaccination', 'Vaccination', '2021-11-07 18:18:25', '2024-02-14 14:02:49', 0),
(11, 9, 'asdad', 'adasdasd', '2024-02-14 14:04:55', NULL, 1),
(12, 7, 'ક્રિકેટ', 'ક્રિકેટ', '2024-02-18 17:35:45', NULL, 1),
(13, 11, 'Romel Sutariya', 'Ilegal Mining ', '2024-02-18 18:00:55', NULL, 1),
(14, 7, 'Gujarat State ', 'State Gujarat', '2024-02-20 16:37:18', NULL, 1),
(15, 15, 'ભારત ', 'ભારત ', '2024-02-20 17:13:28', NULL, 1),
(16, 15, 'ગુજરાત ', 'ગુજરાત \r\n', '2024-02-20 17:13:48', NULL, 1),
(17, 16, 'Gujarat ', 'Gujarat ', '2024-02-20 17:59:13', NULL, 1),
(18, 17, 'મરણ ', 'મરણ ', '2024-02-21 09:04:19', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AdminUserName` (`AdminUserName`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postId` (`postId`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `postcatid` (`CategoryId`),
  ADD KEY `postsucatid` (`SubCategoryId`),
  ADD KEY `subadmin` (`postedBy`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`),
  ADD KEY `catid` (`CategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD CONSTRAINT `pid` FOREIGN KEY (`postId`) REFERENCES `tblposts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD CONSTRAINT `postcatid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `postsucatid` FOREIGN KEY (`SubCategoryId`) REFERENCES `tblsubcategory` (`SubCategoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `subadmin` FOREIGN KEY (`postedBy`) REFERENCES `tbladmin` (`AdminUserName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD CONSTRAINT `catid` FOREIGN KEY (`CategoryId`) REFERENCES `tblcategory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
