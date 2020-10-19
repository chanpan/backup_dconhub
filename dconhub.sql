/*
 Navicat Premium Data Transfer

 Source Server         : ksoft_พี่จิ
 Source Server Type    : MariaDB
 Source Server Version : 100320
 Source Host           : 139.180.128.92:3306
 Source Schema         : dconhub

 Target Server Type    : MariaDB
 Target Server Version : 100320
 File Encoding         : 65001

 Date: 19/10/2020 12:05:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth
-- ----------------------------
BEGIN;
INSERT INTO `auth` VALUES (57, 2147483647, 'facebook', '987094441437491');
INSERT INTO `auth` VALUES (58, 2147483648, 'line', '1654185510');
INSERT INTO `auth` VALUES (59, 2147483649, 'google', '107353042300061168577');
COMMIT;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`) USING BTREE,
  KEY `auth_assignment_user_id_idx` (`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
BEGIN;
INSERT INTO `auth_assignment` VALUES ('admin', '1', 1535696400);
INSERT INTO `auth_assignment` VALUES ('admin', '5', 1545922719);
INSERT INTO `auth_assignment` VALUES ('finance_manager', '3', 1545324894);
INSERT INTO `auth_assignment` VALUES ('finance_manager', '5', 1545922743);
INSERT INTO `auth_assignment` VALUES ('general_manager', '5', 1545922743);
INSERT INTO `auth_assignment` VALUES ('general_manager', '6', 1546421192);
INSERT INTO `auth_assignment` VALUES ('general_manager', '7', 1546421873);
INSERT INTO `auth_assignment` VALUES ('logistics_manager', '4', 1545324903);
INSERT INTO `auth_assignment` VALUES ('logistics_manager', '5', 1545922743);
INSERT INTO `auth_assignment` VALUES ('sales_manager', '2', 1545922207);
INSERT INTO `auth_assignment` VALUES ('sales_manager', '5', 1545922743);
INSERT INTO `auth_assignment` VALUES ('user', '2', 1545324910);
INSERT INTO `auth_assignment` VALUES ('user', '2147483647', 1548402183);
INSERT INTO `auth_assignment` VALUES ('user', '2147483648', 2020);
INSERT INTO `auth_assignment` VALUES ('user', '2147483649', 2020);
INSERT INTO `auth_assignment` VALUES ('user', '2147483650', 1602351745);
INSERT INTO `auth_assignment` VALUES ('user', '3', 1545324839);
INSERT INTO `auth_assignment` VALUES ('user', '4', 1545324879);
INSERT INTO `auth_assignment` VALUES ('user', '5', 1545911761);
INSERT INTO `auth_assignment` VALUES ('user', '6', 1545922452);
INSERT INTO `auth_assignment` VALUES ('user', '7', 1546421720);
COMMIT;

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
BEGIN;
INSERT INTO `auth_item` VALUES ('/admin/*', 2, NULL, NULL, NULL, 1535696373, 1535696373);
INSERT INTO `auth_item` VALUES ('/admin/user/logout', 2, NULL, NULL, NULL, 1545922390, 1545922390);
INSERT INTO `auth_item` VALUES ('/core-option/*', 2, NULL, NULL, NULL, 1545835765, 1545835765);
INSERT INTO `auth_item` VALUES ('/core/*', 2, NULL, NULL, NULL, 1535699352, 1535699352);
INSERT INTO `auth_item` VALUES ('/core/core-options/*', 2, NULL, NULL, NULL, 1545835702, 1545835702);
INSERT INTO `auth_item` VALUES ('/debug/*', 2, NULL, NULL, NULL, 1540701931, 1540701931);
INSERT INTO `auth_item` VALUES ('/gii/*', 2, NULL, NULL, NULL, 1535706951, 1535706951);
INSERT INTO `auth_item` VALUES ('/item-option/*', 2, NULL, NULL, NULL, 1544939119, 1544939119);
INSERT INTO `auth_item` VALUES ('/order-conditions/*', 2, NULL, NULL, NULL, 1547829645, 1547829645);
INSERT INTO `auth_item` VALUES ('/payment-types/*', 2, NULL, NULL, NULL, 1545895859, 1545895859);
INSERT INTO `auth_item` VALUES ('/payments/*', 2, NULL, NULL, NULL, 1545895841, 1545895841);
INSERT INTO `auth_item` VALUES ('/product/*', 2, NULL, NULL, NULL, 1540701804, 1540701804);
INSERT INTO `auth_item` VALUES ('/products/*', 2, NULL, NULL, NULL, 1540700726, 1540700726);
INSERT INTO `auth_item` VALUES ('/products/quotation/*', 2, NULL, NULL, NULL, 1545923261, 1545923261);
INSERT INTO `auth_item` VALUES ('/products/stock-brand/*', 2, NULL, NULL, NULL, 1545922874, 1545922874);
INSERT INTO `auth_item` VALUES ('/products/stock-brand/index', 2, NULL, NULL, NULL, 1546421092, 1546421092);
INSERT INTO `auth_item` VALUES ('/products/stock-category/*', 2, NULL, NULL, NULL, 1545922984, 1545922984);
INSERT INTO `auth_item` VALUES ('/site/*', 2, NULL, NULL, NULL, 1540832145, 1540832145);
INSERT INTO `auth_item` VALUES ('/site/clear-assets', 2, NULL, NULL, NULL, 1545837055, 1545837055);
INSERT INTO `auth_item` VALUES ('/site/logout', 2, NULL, NULL, NULL, 1545922390, 1545922390);
INSERT INTO `auth_item` VALUES ('/sliders/*', 2, NULL, NULL, NULL, 1548262121, 1548262121);
INSERT INTO `auth_item` VALUES ('/text-editor/file-upload-froala', 2, NULL, NULL, NULL, 1546602961, 1546602961);
INSERT INTO `auth_item` VALUES ('/text-editor/image-upload-froala', 2, NULL, NULL, NULL, 1546605295, 1546605295);
INSERT INTO `auth_item` VALUES ('/themes/*', 2, NULL, NULL, NULL, 1560268517, 1560268517);
INSERT INTO `auth_item` VALUES ('/user/*', 2, NULL, NULL, NULL, 1535697098, 1535697098);
INSERT INTO `auth_item` VALUES ('/user/admin/*', 2, NULL, NULL, NULL, 1545923082, 1545923082);
INSERT INTO `auth_item` VALUES ('/user/admin/index', 2, NULL, NULL, NULL, 1545923126, 1545923126);
INSERT INTO `auth_item` VALUES ('/user/security/logout', 2, NULL, NULL, NULL, 1545922390, 1545922390);
INSERT INTO `auth_item` VALUES ('/user/settings/profile', 2, NULL, NULL, NULL, 1546421144, 1546421144);
INSERT INTO `auth_item` VALUES ('admin', 1, 'Admin', NULL, NULL, 1535696302, 1540701593);
INSERT INTO `auth_item` VALUES ('finance_manager', 1, 'เจ้าหน้าที่การเงิน', NULL, NULL, 1545324377, 1545921942);
INSERT INTO `auth_item` VALUES ('general_manager', 1, 'Manager', NULL, NULL, 1535696315, 1545921962);
INSERT INTO `auth_item` VALUES ('logistics_manager', 1, 'เจ้าหน้าที่จัดส่งสินค้า', NULL, NULL, 1545324392, 1545922063);
INSERT INTO `auth_item` VALUES ('sales_manager', 1, 'เจ้าหน้าที่พิจารณาใบเสนอราคา', NULL, NULL, 1545922194, 1545922194);
INSERT INTO `auth_item` VALUES ('user', 1, 'ผู้ใช้งานที่เป็นสมาชิก', NULL, NULL, 1545324538, 1545324538);
COMMIT;

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`) USING BTREE,
  KEY `child` (`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
BEGIN;
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/core-option/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/core/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/core/core-options/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/item-option/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/order-conditions/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/payment-types/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/payments/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/product/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/products/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/products/stock-brand/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/products/stock-category/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/clear-assets');
INSERT INTO `auth_item_child` VALUES ('admin', '/sliders/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/text-editor/file-upload-froala');
INSERT INTO `auth_item_child` VALUES ('admin', '/text-editor/image-upload-froala');
INSERT INTO `auth_item_child` VALUES ('admin', '/themes/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/admin/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/admin/index');
INSERT INTO `auth_item_child` VALUES ('finance_manager', '/products/quotation/*');
INSERT INTO `auth_item_child` VALUES ('finance_manager', 'user');
INSERT INTO `auth_item_child` VALUES ('general_manager', '/products/*');
INSERT INTO `auth_item_child` VALUES ('general_manager', '/products/quotation/*');
INSERT INTO `auth_item_child` VALUES ('general_manager', '/products/stock-brand/*');
INSERT INTO `auth_item_child` VALUES ('general_manager', '/products/stock-brand/index');
INSERT INTO `auth_item_child` VALUES ('general_manager', '/user/settings/profile');
INSERT INTO `auth_item_child` VALUES ('general_manager', 'user');
INSERT INTO `auth_item_child` VALUES ('logistics_manager', '/products/quotation/*');
INSERT INTO `auth_item_child` VALUES ('logistics_manager', 'user');
INSERT INTO `auth_item_child` VALUES ('sales_manager', '/products/quotation/*');
INSERT INTO `auth_item_child` VALUES ('sales_manager', 'user');
INSERT INTO `auth_item_child` VALUES ('user', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('user', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('user', '/user/security/logout');
COMMIT;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for core_options
-- ----------------------------
DROP TABLE IF EXISTS `core_options`;
CREATE TABLE `core_options` (
  `option_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`option_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of core_options
-- ----------------------------
BEGIN;
INSERT INTO `core_options` VALUES ('backend_url', 'Backend Url', '1');
INSERT INTO `core_options` VALUES ('brand_all', 'Brand All', '<div class=\"row\"><div class=\"col-md-4\"><div class=\"col-md-12\"><h4><img src=\"https://storage.dconhub.com//source/brand/1539796727019379200.png\" class=\"fr-fic fr-dii\" style=\"width: 68px;\">SHERA เฌอร่า</h4><ul><li><a data-turbolinks=\"false\" href=\"/brand/detail?id=1545917257000291700\">ไม้ทดแทน เฌอร่า</a></li><li><a data-turbolinks=\"false\" href=\"/brand/detail?id=1551704232055706900\">ไม้ทดแทน เฌอร่า ไม้ตกแต่ง</a></li><li><a href=\"/brand/detail?id=1549696506082728000\">ผลิตภัณฑ์ทดแทนไม้ ประตูวงกบ</a></li><li><a href=\"/brand/detail?id=1545923960002445000\">เฌอร่าบอร์ด&nbsp;</a></li><li><a href=\"/brand/detail?id=1551705469094719300\">ไม้อัดเฌอร่า SHERA PLY</a></li><li><a href=\"/brand/detail?id=1549109648098443500\">เฌอร่าเพ้นท์</a></li><li><a href=\"/brand/detail?id=1549097788060708600\">หลังคาห้าห่วง&nbsp;</a></li></ul></div></div><div class=\"col-md-4\"><div class=\"col-md-12\"><h4><img src=\"https://storage.dconhub.com//source/brand/1539795957095646900.png\" class=\"fr-fic fr-dii\" style=\"width: 77px;\">เอสซีจี SCG</h4><ul><li><a href=\"/brand/detail?id=13\">เสือ</a>&nbsp;</li><li><a href=\"/brand/detail?id=14\">CPAC ซีแพค&nbsp;</a></li><li><a href=\"/brand/detail?id=12\">SCG เหล็กเส้น</a>&nbsp;</li><li><a href=\"/brand/detail?id=15\">Q-CON คิวคอน</a>&nbsp;</li><li><a href=\"/brand/detail?id=17\">SCG ยิปซัม&nbsp;</a></li><li><a href=\"/brand/detail?id=16\">SCG กระเบื้องหลังคา&nbsp;</a></li><li><a href=\"/brand/detail?id=18\">SCG สมาร์ทบอร์ด</a>&nbsp;</li><li><a href=\"/brand/detail?id=19\">SCG สมาร์ทวูด</a>&nbsp;</li><li><a href=\"/brand/detail?id=21\">SCG ท่อเอสซีจี</a>&nbsp;</li><li><a href=\"/brand/detail?id=22\">SCG แลนด์สเคป</a>&nbsp;</li><li><a href=\"/brand/detail?id=20\">Cylence</a></li></ul></div></div><div class=\"col-md-4\"><div class=\"col-md-12\"><br></div></div></div>');
INSERT INTO `core_options` VALUES ('brand_file_type', 'File Upload Brand', '[\"jpg\",\"jpeg\",\"png\",\"gif\"]');
INSERT INTO `core_options` VALUES ('brand_types', 'DropDown Brand', '{ \"1\": \"แบรนด์หลัก\", \"2\": \"แบรนด์ย่อย\"}');
INSERT INTO `core_options` VALUES ('category_all', 'Category All', '<div class=\"row\"><div class=\"col-md-3\"><div class=\"col-md-12\"><h4><img src=\"https://storage.dconhub.com//source/brand/1546825149061949400.jpg\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;ไม้ทดแทน</h4><ul><li><a href=\"/categorie/detail?id=508\">ไม้ฝาเฌอร่า&nbsp;</a></li><li><a href=\"/categorie/detail?id=509\">เชิงชาย</a></li><li><a href=\"/categorie/detail?id=599\">ไม้ระแนง</a>&nbsp;</li><li><a href=\"/categorie/detail?id=600\">ไม้มอบ , ไม้บัว</a>&nbsp;</li><li><a href=\"/categorie/detail?id=602\">ไม้รั้ว</a>&nbsp;</li><li><a href=\"/categorie/detail?id=604\">วงกบประตู, วงกบหน้าต่าง</a>&nbsp;</li><li><a href=\"/categorie/detail?id=605\">ประตูเฌอร่า&nbsp;</a></li><li><a href=\"/categorie/detail?id=613\">ไม้กันตก&nbsp;</a></li><li><a href=\"/categorie/detail?id=614\">ฉลุช่องลมเฌอร่า&nbsp;</a></li><li><a href=\"/categorie/detail?id=619\">ไม้ปิดกันนก&nbsp;</a></li><li><a href=\"/categorie/detail?id=622\">ไม้บันได</a>&nbsp;</li><li><a href=\"/categorie/detail?id=626\">ไม้พื้น&nbsp;</a></li><li><a href=\"/categorie/detail?id=627\">ไม้ตกแต่ง</a>&nbsp;</li><li><a href=\"/categorie/detail?id=628\">ไม้อัด</a>&nbsp;</li><li><a href=\"/categorie/detail?id=636\">ประตู หน้าต่าง และอุปกรณ์</a></li></ul></div></div><div class=\"col-md-3\"><div class=\"col-md-12\"><h4><img src=\"https://storage.dconhub.com//source/brand/1544890694055030000.png\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;ซีเมนต์บอร์ด</h4><ul><li><a href=\"/categorie/detail?id=200\">งานฝ้า</a>&nbsp;</li><li><a href=\"/categorie/detail?id=201\">งานผนัง</a>&nbsp;</li><li><a href=\"/categorie/detail?id=606\">งานพื้น&nbsp;</a></li><li><a href=\"/categorie/detail?id=608\">ไม้อัด</a>&nbsp;</li><li><a href=\"/categorie/detail?id=623\">งานตกแต่ง</a>&nbsp;</li></ul></div></div><div class=\"col-md-3\"><div class=\"col-md-12\"><h4><img src=\"https://storage.dconhub.com//source/brand/1544890803097500000.png\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;กระเบื้องมุง</h4><ul><li><a href=\"/categorie/detail?id=553\">ลอนคู่&nbsp;</a></li><li><a href=\"/categorie/detail?id=554\">ไตรลอน</a>&nbsp;</li><li><a href=\"/categorie/detail?id=555\">กระเบื้องคอนกรีต</a>&nbsp;</li><li><a href=\"/categorie/detail?id=630\">กระเบื้องไฟเบอร์ซีเมนต์</a>&nbsp;</li></ul></div></div><div class=\"col-md-3\"><div class=\"col-md-12\"><h4><img src=\"https://storage.dconhub.com//source/brand/1549857099044098300.png\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;เฌอร่าเพ้นท์</h4><ul><li><a href=\"/categorie/detail?id=632\">งานไม้ทดแทน&nbsp;</a></li><li><a href=\"/categorie/detail?id=633\">cn001</a>&nbsp;</li></ul></div></div></div><div class=\"row\"><div class=\"col-md-3\"><div class=\"col-md-12\"><br><h4><img src=\"https://storage.dconhub.com//source/brand/1549857494084294200.jpg\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;เหล็กเส้นก่อสร้าง</h4><ul><li><a href=\"/categorie/detail?id=487\">เหล็กเส้นกลม</a>&nbsp;</li><li><a href=\"/categorie/detail?id=581\">เหล็กเส้นข้ออ้อย</a>&nbsp;</li><li><a href=\"/categorie/detail?id=582\">ลวดมัดเหล็ก</a></li><li><a href=\"/categorie/detail?id=583\">ตะแกรงไวร์เมท</a> &nbsp;</li></ul></div></div><div class=\"col-md-3\"><div class=\"col-md-12\"><br><h4><img src=\"https://storage.dconhub.com//source/brand/1544890508043829400.png\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;เหล็กรูปพรรณ</h4><ul><li><a href=\"/categorie/detail?id=593\">ท่อเหล็ตัวซี</a>&nbsp;</li><li><a href=\"/categorie/detail?id=594\">ท่อเหล็กเหลี่ยม</a>&nbsp;</li><li><a href=\"/categorie/detail?id=595\">ท่อเหล็กแบน&nbsp;</a></li><li><a href=\"/categorie/detail?id=596\">ท่อเหล็กกลม</a>&nbsp;</li><li><a href=\"/categorie/detail?id=597\">เหล็กไอบีม<br></a></li><li><a href=\"/categorie/detail?id=598\">เหล็กไวด์แฟรงค์</a>&nbsp;</li></ul></div></div><div class=\"col-md-3\"><div class=\"col-md-12\"><br><h4><img src=\"https://storage.dconhub.com//source/brand/1544886411093678800.png\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;อิฐมวลเบา</h4><ul><li><a href=\"/categorie/detail?id=495\">Q-CON BLOCK&nbsp;</a></li><li><a href=\"/categorie/detail?id=612\">DIAMONE BLOCK</a>&nbsp;</li></ul></div></div><div class=\"col-md-3\"><div class=\"col-md-12\"><br><h4><img src=\"https://storage.dconhub.com//source/brand/1544886352032291000.png\" class=\"fr-fic fr-dii\" style=\"width: 56px;\">&nbsp;ปูน</h4><ul><li><a href=\"/categorie/detail?id=464\">ก่อฉาบทั่วไป&nbsp;</a></li><li><a href=\"/categorie/detail?id=609\">ปูนสำหรับฉาบ</a>&nbsp;</li><li><a href=\"/categorie/detail?id=610\">ปูนสำหรับงานโครงสร้าง</a>&nbsp;</li><li><a href=\"/categorie/detail?id=611\">ปูนกาว</a></li></ul></div></div></div>');
INSERT INTO `core_options` VALUES ('category_types', 'DropDown Brand', '{ \"1\": \"หมวดสินค้าหลัก\", \"2\": \"หมวดสินค้าย่อย\"}');
INSERT INTO `core_options` VALUES ('cn_brand', 'แบรนด์บริษัท', 'บจก. ดํารงค์พานิช คอนสตรัคชั่น');
INSERT INTO `core_options` VALUES ('cn_brand_address', 'ที่อยู่บริษัท', '92 หมู่ที่ 21 ต.หัวขวาง อ.โกสุมพิสัย จ.มหาสารคาม');
INSERT INTO `core_options` VALUES ('cn_brand_address2', 'เบอร์โทรศัพท์', '043761599');
INSERT INTO `core_options` VALUES ('cn_brand_email', 'Email บริษัท', 'admin@gmail.com');
INSERT INTO `core_options` VALUES ('cn_condition', 'เงื่อนไขการสั่งซื้อ', 'ราคาวัสดุ เป็นราคารับหน้าโรงงาน ยังไม่รวมค่าขนส่ง\r\nกรณีเงื่อนไขส่งฟรี เมื่อดำเนินการกรอกที่อยู่จัดส่งแล้ว ทางเจ้าหน้าที่จะติดต่อกลับไปเพื่อแก้ไขราคาค่าขนส่งให้\r\nค่าขนส่งที่ระบบคำนวณอัตโนมัติให้หลังการใส่ที่อยู่ เป็นเพียงการประมาณการเท่านั้น ทางบริษัทขอสงวนสิทธิ์เปลี่ยนแปลงโดยไม่แจ้งให้ทราบล่วงหน้า');
INSERT INTO `core_options` VALUES ('css_footer', 'css_footer', '/* Footer */\r\n@import url(\'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\');\r\nhtml {\r\n  height: 100%;\r\n  box-sizing: border-box;\r\n}\r\nbody {\r\n  position: relative;\r\n  margin: 0;\r\n  padding-bottom: 6rem;\r\n  min-height: 100%;\r\n  font-family: \"Helvetica Neue\", Arial, sans-serif;\r\n}\r\nsection {\r\n    padding: 20px 0;\r\n}\r\n\r\nsection .section-title {\r\n    text-align: center;\r\n    color: #007b5e;\r\n    margin-bottom: 50px;\r\n    text-transform: uppercase;\r\n}\r\n#footer {\r\n    background: #2b2b2b !important;\r\nmargin-top:20px; \r\n}\r\n#footer h5{\r\n	padding-left: 10px; \r\n    padding-bottom: 6px;\r\n    margin-bottom: 20px;\r\n    color:#ffffff;\r\n}\r\n#footer a {\r\n    color: #ffffff;\r\n    text-decoration: none !important;\r\n    background-color: transparent;\r\n    -webkit-text-decoration-skip: objects;\r\n}\r\n#footer ul.social li{\r\n	padding: 3px 0;\r\n}\r\n#footer ul.social li a i {\r\n    margin-right: 5px;\r\n	font-size:25px;\r\n	-webkit-transition: .5s all ease;\r\n	-moz-transition: .5s all ease;\r\n	transition: .5s all ease;\r\n}\r\n#footer ul.social li:hover a i {\r\n	font-size:30px;\r\n	margin-top:-10px;\r\n}\r\n#footer ul.social li a,\r\n#footer ul.quick-links li a{\r\n	color:#ffffff;\r\n}\r\n#footer ul.social li a:hover{\r\n	color:#eeeeee;\r\n}\r\n#footer ul.quick-links li{\r\n	padding: 3px 0;\r\n	-webkit-transition: .5s all ease;\r\n	-moz-transition: .5s all ease;\r\n	transition: .5s all ease;\r\n}\r\n#footer ul.quick-links li:hover{\r\n	padding: 3px 0;\r\n	margin-left:5px;\r\n	font-weight:700;\r\n}\r\n#footer ul.quick-links li a i{\r\n	margin-right: 5px;\r\n}\r\n#footer ul.quick-links li:hover a i {\r\n    font-weight: 700;\r\n}\r\n\r\n@media (max-width:767px){\r\n	#footer h5 {\r\n    padding-left: 0;\r\n    border-left: transparent;\r\n    padding-bottom: 0px;\r\n    margin-bottom: 10px;\r\n}\r\n}\r\n\r\n.product-grid:hover {\r\n    /* background: blue; */\r\n     box-shadow: 0px 4px 7px #92929a;\r\n}\r\n');
INSERT INTO `core_options` VALUES ('doc_logo', 'Logo ในเอกสาร', 'https://bn1305files.storage.live.com/y4mvIe7_8afjHcCPf92XY_ODuQyQIaWa7gwItZHjNssnJZmDHTZPkjOnevua_1-qNw9FscoPXhNaWZAv4_xvHmTHIIxa4WugMKDIKzbL33loI7prfRlW9lfh-snk7On8wAnprjG1DE35fZh84TrQ33FwCd4indq55Viz49R-xh5wnAQxxJ7nDcydDEPuKqJfFByJBlbtyX-6L22bnUdwcdb6A/IMG_0199.JPG?psid=1&width=2016&height=1309');
INSERT INTO `core_options` VALUES ('footer', 'footer', '<!-- Footer --><section class=\"container-fluid\" id=\"footer\"><div class=\"container\"><div class=\"row text-left text-xs-center text-sm-left text-md-left\"><div class=\"col-xs-12 col-sm-4 col-md-4\"><p><span style=\"font-size: 18px; color: rgb(255, 255, 255);\">แผนกบริการลูกค้า</span></p><ul class=\"list-unstyled quick-links\"><li><a href=\"/site/about\">เกี่ยวกับเรา</a></li><li><a href=\"/site/contact\">ติดต่อเรา</a></li><li><a href=\"/site/help\">ช่วยเหลือ</a></li><li><a href=\"/site/help\"></a></li><li><a href=\"javascript%3Avoid();\"></a></li></ul></div><div class=\"col-xs-12 col-sm-4 col-md-4\"><h5><span style=\"font-size: 18px;\">Dconhub คืออะไร</span></h5><ul class=\"list-unstyled quick-links\"><li><a href=\"javascript%3Avoid();\"></a><a data-ga-category=\"FooterLink\" data-ga-label=\"d_all_footer_lowPricePolicy\" href=\"https://dconhub.com\">ทำไมจึงขายวัสดุได้ถูก</a></li><li><a href=\"javascript%3Avoid();\"></a><a href=\"/product/how-to-by\">วิธีการสั่งซื้อ</a></li><li><a href=\"javascript%3Avoid();\"></a><a data-ga-category=\"FooterLink\" data-ga-label=\"d_all_footer_entireNationDeliveryCapability\" href=\"https://dconhub.com\">ความสามารถในการจัดส่งของเรา</a></li><li><a href=\"javascript%3Avoid();\"></a></li></ul></div><div class=\"col-xs-12 col-sm-4 col-md-4\"><h5><span style=\"font-size: 18px;\">ช่องทางในการชำระเงิน</span></h5><ul class=\"list-unstyled quick-links\"><li><a href=\"javascript%3Avoid();\"></a></li><li><a href=\"javascript%3Avoid();\"></a><a href=\"javascript%3Avoid();\"></a><br></li><li><a href=\"https://wwwe.sunlimetech.com\" title=\"Design and developed by\"></a></li></ul></div></div><div class=\"row\"><div class=\"col-md-6\"><ul class=\"list-unstyled list-inline social text-left\"><li class=\"list-inline-item\"><a href=\"javascript%3Avoid();\"><i class=\"fa fa-facebook\"></i></a></li><li class=\"list-inline-item\"><a href=\"javascript%3Avoid();\"><i class=\"fa fa-twitter\"></i></a></li><li class=\"list-inline-item\"><a href=\"javascript%3Avoid();\"><i class=\"fa fa-instagram\"></i></a></li><li class=\"list-inline-item\"><a href=\"javascript%3Avoid();\"><i class=\"fa fa-google-plus\"></i></a></li><li class=\"list-inline-item\"><a href=\"javascript%3Avoid();\" target=\"_blank\"><i class=\"fa fa-envelope\"></i></a></li></ul></div><div class=\"col-md-6\"><p class=\"h6\">&copy; Copyright <a href=\"https://dconhub.com/\">dconhub</a></p></div></div></div></section><!-- ./Footer -->');
INSERT INTO `core_options` VALUES ('help', 'help', 'ช่วยเหลือ');
INSERT INTO `core_options` VALUES ('how_to_pay', 'วิธีการสั่งซื้อ', '<h1>ตัวอย่างวิธีการสั่งซื้อ</h1><h2><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10bd366c.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10bd366c.png\"><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10e0cb8e.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10e0cb8e.png\"><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10cb7b4e.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10cb7b4e.png\"><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10b01855.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10b01855.png\"></h2><h2>วิธีการสั่งซื้อสินค้า</h2><p>ขั้นตอนการทำรายการสั่งซื้อ<br>ติดต่อสอบถามเพิ่มเติม กรุณาติดต่อ customer service center โทร&nbsp;<strong>02-308-4666</strong> หรือ&nbsp;<a href=\"mailto:ccare@cmart.co.th\" title=\"\">ccare@cmart.co.th</a></p><h3>1. เลือกสินค้าของคุณ</h3><p>คุณสามารถเลือกสินค้าที่คุณต้องการสั่งซื้อโดยการคลิกที่ปุ่ม&nbsp;<strong>&ldquo;หยิบใส่ตะกร้า&rdquo;</strong> หรือ หากคุณต้องการเลือกสินค้าเก็บไว้และชำระเงินภายหลัง ให้คลิกที่ปุ่ม &ldquo;เพิ่มรายการที่ชอบ&rdquo; ซึ่ง ณ ที่นี้ คุณต้องทำการเข้าสู่ระบบก่อน เพื่อที่ระบบจะได้บันทึกสินค้าไว้ใน &ldquo;สินค้าที่สนใจ&rdquo;</p><h3>2. ตรวจสอบหรือแก้ไขรายการสินค้า</h3><p>คุณสามารถทำการตรวจสอบหรือแก้ไขรายการสินค้าที่คุณต้องการสั่งซื้อได้ในหน้า&nbsp;<strong>&ldquo;ตะกร้าของฉัน&quot;</strong> หลังจากนั้นคลิกที่ปุ่ม &ldquo;สั่งซื้อสินค้า&rdquo; เพื่อดำเนินการ การสั่งซื้อสินค้า</p><h3>3. เลือกทำรายการสั่งซื้อสินค้า</h3><p>คุณสามารถเลือกได้ดังนี้<br><br><strong>ทำรายการโดยไม่เป็นสมาชิก:</strong> กรอกข้อมูลการเรียกเก็บเงิน และข้อมูลการจัดส่งสินค้าของคุณ โดยไม่ได้เป็นสมาชิกของ&nbsp;<a href=\"https://www.cmart.co.th/\" title=\"\"><strong>cmart.co.th</strong></a><br><br><strong>ลูกค้าใหม่:</strong> สำหรับการสั่งซื้อครั้งแรก เพียงกรอกข้อมูลการเรียกชำระเงิน และข้อมูลการจัดส่งสินค้าของคุณ โดยเป็นสมาชิกกับ&nbsp;<a href=\"https://www.cmart.co.th/\" title=\"\"><strong>cmart.co.th</strong></a> เพื่อให้ง่ายต่อการสั่งซื้อครั้งต่อไป และสะดวกต่อการติดตามการสั่งซื้อ นอกจากนี้ คุณยังสามารถสั่งซื้อสินค้าโดยเข้าสู่ระบบผ่านทางบัญชี Facebook ของคุณได้ง่ายๆ ทั้งนี้จะได้รับจดหมายข่าวสารและโปรโมชั่นที่ดีที่สุดที่เรามอบให้<br><br><strong>ลูกค้าเก่า:</strong> สำหรับลูกค้าที่เป็นสมาชิกกับ CMART ทำรายการสั่งซื้อผ่านระบบได้ง่ายๆ เพียงแค่เข้าสู่ระบบ โดยกรอกอีเมลและรหัสผ่าน และทำรายการสั่งซื้อโดยไม่ต้องกรอกข้อมูลอื่นๆเพิ่มเติม<br><br></p><h3>4. เลือกวิธีการจัดส่งสินค้า</h3><p>CMART มีตัวเลือกในการจัดส่ง 2 แบบ คือ ส่งแบบด่วน (<strong>Express</strong>) และ ส่งแบบธรรมดา (<strong>Standard</strong>) สำหรับแต่ละวิธีการจัดส่ง จะมีการคำนวณระยะทาง และน้ำหนักของสินค้า จากการยืนยันการสั่งซื้อของคุณ (คุณสามารถอ่านรายละเอียดเพิ่มเติมได้ที่หน้า&nbsp;<a href=\"https://www.cmart.co.th/shipping-policy\">&ldquo;วิธีการจัดส่งสินค้า&rdquo;</a>)</p><h3>5. เลือกวิธีการชำระเงิน</h3><p>คุณสามารถเลือกวิธีการชำระเงินได้หลากหลายวิธี เช่น เก็บเงินปลายทาง บัตรเครดิต/บัตรเดบิต ผ่านทางเคาน์เตอร์เซอร์วิส หรือผ่านทางระบบออนไลน์ ซึ่งมีบริษัท 2C2P เป็น<br>ผู้ดูแลระบบรักษาความปลอดภัย (คุณสามารถอ่านรายละเอียดเพิ่มเติมได้ที่หน้า&nbsp;<a href=\"https://www.cmart.co.th/payment-method\">&ldquo;ช่องทางการชำระเงิน&rdquo;</a>)<br>หากคุณมีรหัสคูปองส่วนลด คุณสามารถนำรหัสส่วนลดระบุในช่อง&nbsp;<strong>&ldquo;ใส่รหัสส่วนลด ถ้ามี&rdquo;</strong> และคลิก&nbsp;<strong>&ldquo;ใช้ส่วนลด&rdquo;<br></strong>และเมื่อคุณพร้อมทำการชำระเงินและสั่งซื้อสินค้า ให้คลิกที่ปุ่ม&nbsp;<strong>&ldquo;ซื้อสินค้า&rdquo;</strong></p><p>&nbsp;</p><h3>6. ยืนยันคำสั่งซื้อสินค้าทางอีเมล</h3><p>เมื่อคุณได้ทำรายการสั่งซื้อสินค้าเรียบร้อยแล้ว<br>คุณจะได้รับอีเมลเพื่อยืนยันคำสั่งซื้อสินค้าของคุณ วิธีการชำระเงินแบบ เรียกเก็บเงินปลายทาง ชำระเงินที่จุดรับสินค้า (Cash on Pick up Point)<br>กรุณาคลิกที่ &ldquo;ลิงค์ยืนยันคำสั่งซื้อ&rdquo; ตามลิงค์ที่แนบมาในอีเมลดังกล่าว<br>ภายใน 24 ชม. หากคุณไม่ดำเนินการ ภายในเวลาที่กำหนด<br>คำสั่งซื้อของคุณ จะถูกยกเลิกโดยอัตโนมัติ&nbsp;</p>');
INSERT INTO `core_options` VALUES ('logo', 'Logo', 'https://storage.dconhub.com/images/dconhub.png');
INSERT INTO `core_options` VALUES ('logo_text', 'Logo Text', 'https://storage.dconhub.com/images/logo_bg.JPG');
INSERT INTO `core_options` VALUES ('order_text_start', ' รหัสตัวหนังสือของใบเสนอราคา', 'QT');
INSERT INTO `core_options` VALUES ('order_txt', 'Order Text', 'BS');
INSERT INTO `core_options` VALUES ('page_about', 'About', '<p>เกี่ยวกับเรา นกน้อยทำรังแต่พอตัว</p><table style=\"width: 100%;\"><tbody><tr><td style=\"width: 50.0000%;\"><div style=\"text-align: center;\"><img src=\"https://storage.dconhub.com/images/5c2f5300dfbbe.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\" data-id=\"5c2f5300dfbbe.jpg\"></div></td><td style=\"width: 50.0000%;\"><span class=\"fr-video fr-fvc fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/-vqdW4IMTnE\" frameborder=\"0\" allowfullscreen=\"\" class=\"fr-draggable\"></iframe></span></td></tr></tbody></table><p>เราขาย <a href=\"http://www.shera.com/\" rel=\"noopener noreferrer\" target=\"_blank\">เฌอร่า</a> และ</p><p><br></p><p><span class=\"fr-emoticon fr-deletable fr-emoticon-img\" style=\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1/assets/svg/1f623.svg);\">&nbsp;</span>&nbsp;</p><p><img src=\"https://storage.dconhub.com/images/5c2f54745480c.gif\" style=\"width: 300px;\" class=\"fr-fic fr-fil fr-rounded fr-dii\" data-id=\"5c2f54745480c.gif\">refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p>refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p>refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p>refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p><span class=\"fr-video fr-fvc fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\"><iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/-vqdW4IMTnE?wmode=opaque\" frameborder=\"0\" allowfullscreen=\"\" class=\"fr-draggable\"></iframe></span>&nbsp;</p>');
INSERT INTO `core_options` VALUES ('page_contact', 'Contact', '<p>ติดต่อเรา เราคือใครเอ๋ย ให้ทาย</p><h3><span class=\"fr-video fr-fvc fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\">\r\n');
COMMIT;

-- ----------------------------
-- Table structure for file_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `file_storage_item`;
CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of file_storage_item
-- ----------------------------
BEGIN;
INSERT INTO `file_storage_item` VALUES (106, 'fileStorage', 'http://shop.local/source', '1/HfSgZ0jHjBR0T5af6q5XkXKWyeyEuz7O.png', 'image/png', 3556, 'HfSgZ0jHjBR0T5af6q5XkXKWyeyEuz7O', '::1', 1535699641);
INSERT INTO `file_storage_item` VALUES (107, 'fileStorage', 'http://storage.shop.local/source', '1/OuRcwvxrOLzLzvWR5QBNn6No1vd-2yf5.png', 'image/png', 4679, 'OuRcwvxrOLzLzvWR5QBNn6No1vd-2yf5', '::1', 1535700807);
INSERT INTO `file_storage_item` VALUES (109, 'fileStorage', 'http://storage.stock.local/source', '1/ANeTNpBPJCU9_eYobGtTOSj-ithgoKAI.jpg', 'image/jpeg', 894162, 'ANeTNpBPJCU9_eYobGtTOSj-ithgoKAI', '127.0.0.1', 1542004714);
INSERT INTO `file_storage_item` VALUES (110, 'fileStorage', 'http://storage.stock.local/source', '1/e3Rw_RpnEyltw63vQQ_wUbWjnV2SEs-J.jpg', 'image/jpeg', 894162, 'e3Rw_RpnEyltw63vQQ_wUbWjnV2SEs-J', '127.0.0.1', 1542017352);
INSERT INTO `file_storage_item` VALUES (111, 'fileStorage', 'http://storage.stock.local/source', '1/HJyVYEI6r5TVmrM49CK56web4Fs1J8AB.jpg', 'image/jpeg', 894162, 'HJyVYEI6r5TVmrM49CK56web4Fs1J8AB', '127.0.0.1', 1542017388);
INSERT INTO `file_storage_item` VALUES (112, 'fileStorage', 'http://storage.stock.local/source', '1/bFOF5DflGNIdknxXfSzTNgSFeFyL_sLx.jpg', 'image/jpeg', 894162, 'bFOF5DflGNIdknxXfSzTNgSFeFyL_sLx', '127.0.0.1', 1542017775);
INSERT INTO `file_storage_item` VALUES (113, 'fileStorage', 'http://storage.stock.local/source', '1/dUvBKcVptXxaHhUkoYWXMWPNzv7OEicC.jpg', 'image/jpeg', 894162, 'dUvBKcVptXxaHhUkoYWXMWPNzv7OEicC', '127.0.0.1', 1542018105);
INSERT INTO `file_storage_item` VALUES (114, 'fileStorage', 'http://storage.stock.local/source', '1/qfJdw-fPuH8EYjWyMLKvypSn15f64Bqa.png', 'image/png', 504776, 'qfJdw-fPuH8EYjWyMLKvypSn15f64Bqa', '127.0.0.1', 1542018140);
INSERT INTO `file_storage_item` VALUES (115, 'fileStorage', 'http://storage.stock.local/source', '1/zptBdNwgSATXJBcsG581wuq_7Vyez-bd.png', 'image/png', 504776, 'zptBdNwgSATXJBcsG581wuq_7Vyez-bd', '127.0.0.1', 1542018148);
INSERT INTO `file_storage_item` VALUES (116, 'fileStorage', 'http://storage.stock.local/source', '1/Ha1Chu_5-gUFZ1iGA9ayyMYybGHKcpoC.png', 'image/png', 504776, 'Ha1Chu_5-gUFZ1iGA9ayyMYybGHKcpoC', '127.0.0.1', 1542018182);
INSERT INTO `file_storage_item` VALUES (117, 'fileStorage', 'http://storage.stock.local/source', '1/628Sfw3nU3y28mBlD1BEpF5J_uJ-upfq.jpg', 'image/jpeg', 894162, '628Sfw3nU3y28mBlD1BEpF5J_uJ-upfq', '127.0.0.1', 1542018223);
INSERT INTO `file_storage_item` VALUES (118, 'fileStorage', 'http://storage.stock.local/source', '1/lWH0nqldF58wqngSPgXFHEp1EmKrGMHu.jpg', 'image/jpeg', 894162, 'lWH0nqldF58wqngSPgXFHEp1EmKrGMHu', '127.0.0.1', 1542018253);
INSERT INTO `file_storage_item` VALUES (119, 'fileStorage', 'http://storage.stock.local/source', '1/G9WSSCgVoRQG-Wfc42BPn69XURYuGN9g.jpg', 'image/jpeg', 894162, 'G9WSSCgVoRQG-Wfc42BPn69XURYuGN9g', '127.0.0.1', 1542018278);
INSERT INTO `file_storage_item` VALUES (120, 'fileStorage', 'http://storage.stock.local/source', '1/fpo1gwKWomZnH5NmLvZusRdANrWeXk1O.png', 'image/png', 504776, 'fpo1gwKWomZnH5NmLvZusRdANrWeXk1O', '127.0.0.1', 1542018318);
INSERT INTO `file_storage_item` VALUES (121, 'fileStorage', 'http://storage.stock.local/source', '1/hu-n_ZElBB1DctbEXNMvmcQ1xxwEf3KB.png', 'image/png', 504776, 'hu-n_ZElBB1DctbEXNMvmcQ1xxwEf3KB', '127.0.0.1', 1542018356);
INSERT INTO `file_storage_item` VALUES (122, 'fileStorage', 'http://storage.stock.local/source', '1/HnnMZ3I-hk_jSyYPtycXZhi90nwKDP5-.png', 'image/png', 504776, 'HnnMZ3I-hk_jSyYPtycXZhi90nwKDP5-', '127.0.0.1', 1542018372);
INSERT INTO `file_storage_item` VALUES (123, 'fileStorage', 'http://storage.stock.local/source', '1/o_BgG_-2ej7ZqIryKAxOl4uqdkGZldJj.jpg', 'image/jpeg', 51985, 'o_BgG_-2ej7ZqIryKAxOl4uqdkGZldJj', '127.0.0.1', 1543681803);
INSERT INTO `file_storage_item` VALUES (124, 'fileStorage', 'http://storage.stock.local/source', '1/jzW0cTBb5ZiNYNlXeiLoz3gJQS5eGCQ4.png', 'image/png', 18374, 'jzW0cTBb5ZiNYNlXeiLoz3gJQS5eGCQ4', '127.0.0.1', 1545324660);
INSERT INTO `file_storage_item` VALUES (125, 'fileStorage', 'https://storage.dconhub.com/source', '1/SC14xbokip4zfLs8v8HvUoNdfIDdriAr.gif', 'image/gif', 776425, 'SC14xbokip4zfLs8v8HvUoNdfIDdriAr', '223.24.189.20', 1545921257);
COMMIT;

-- ----------------------------
-- Table structure for frontend_setting
-- ----------------------------
DROP TABLE IF EXISTS `frontend_setting`;
CREATE TABLE `frontend_setting` (
  `id` bigint(20) DEFAULT NULL,
  `icon` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of frontend_setting
-- ----------------------------
BEGIN;
INSERT INTO `frontend_setting` VALUES (1000, '{\"path\":\"1/HnnMZ3I-hk_jSyYPtycXZhi90nwKDP5-.png\",\"name\":\"df38baee6ef6431719c209f994012ae7_2124.png\",\"size\":\"504776\",\"type\":\"image/png\",\"order\":\"\",\"base_url\":\"http://storage.stock.local/source\"}');
COMMIT;

-- ----------------------------
-- Table structure for how_to_by
-- ----------------------------
DROP TABLE IF EXISTS `how_to_by`;
CREATE TABLE `how_to_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` tinytext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of how_to_by
-- ----------------------------
BEGIN;
INSERT INTO `how_to_by` VALUES (1000, 'วิธีการสั่งซื้อ');
COMMIT;

-- ----------------------------
-- Table structure for item_options
-- ----------------------------
DROP TABLE IF EXISTS `item_options`;
CREATE TABLE `item_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1141 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of item_options
-- ----------------------------
BEGIN;
INSERT INTO `item_options` VALUES (1, 'unit', 'เส้น', NULL);
INSERT INTO `item_options` VALUES (2, 'unit', 'กก.', NULL);
INSERT INTO `item_options` VALUES (73, 'step', '1,2,3', 1);
INSERT INTO `item_options` VALUES (99, 'staff_confirm', 'รอเจ้าหน้าที่ยืนยัน', NULL);
INSERT INTO `item_options` VALUES (100, 'staff_confirm', 'ยืนยันราคาแล้ว', NULL);
INSERT INTO `item_options` VALUES (101, 'staff_confirm', 'ยืนยันใบเสนอราคาแล้ว', NULL);
INSERT INTO `item_options` VALUES (102, 'staff_confirm', 'ยืนยันการชำระเงินแล้ว', NULL);
INSERT INTO `item_options` VALUES (103, 'staff_confirm', 'ใบเสนอราคาถูกยกเลิก	\n', NULL);
INSERT INTO `item_options` VALUES (120, 'delivery_status', 'รอการจัดส่ง', NULL);
INSERT INTO `item_options` VALUES (121, 'delivery_status', 'จัดเตรียมของ', NULL);
INSERT INTO `item_options` VALUES (122, 'delivery_status', 'กำลังจัดส่ง', NULL);
INSERT INTO `item_options` VALUES (123, 'delivery_status', 'จัดส่งเรียบร้อย ', NULL);
INSERT INTO `item_options` VALUES (124, 'delivery_status', 'ยกเลิกการจัดส่ง', NULL);
INSERT INTO `item_options` VALUES (130, 'finance_confirm', 'ยังไม่ชำระเงิน', NULL);
INSERT INTO `item_options` VALUES (131, 'finance_confirm', 'ชำระเงินแล้ว', NULL);
INSERT INTO `item_options` VALUES (154, 'step', '1,2,3', 4);
INSERT INTO `item_options` VALUES (1005, 'order_step', '1,2,3,4,5', 20181226232338804);
INSERT INTO `item_options` VALUES (1006, 'order_step', '1,2', 20181227101940927);
INSERT INTO `item_options` VALUES (1008, 'order_step', '1,2,3,4,5', 20181227160553855);
INSERT INTO `item_options` VALUES (1009, 'order_step', '1,2,3,4,5', 20181227160802811);
INSERT INTO `item_options` VALUES (1010, 'order_step', '1,2', 20181227165923893);
INSERT INTO `item_options` VALUES (1011, 'order_step', '1,2,3,4,5', 20181227170014341);
INSERT INTO `item_options` VALUES (1012, 'step', '1,2,3', 5);
INSERT INTO `item_options` VALUES (1013, 'order_step', '1,2,3,4,5', 20181227185929651);
INSERT INTO `item_options` VALUES (1014, 'order_step', '1,2,3', 20181227200016158);
INSERT INTO `item_options` VALUES (1015, 'unit', 'แผ่น', NULL);
INSERT INTO `item_options` VALUES (1016, 'order_step', '1,2,3,4,5', 20181227205230212);
INSERT INTO `item_options` VALUES (1017, 'order_step', '1,2', 20181227194053611);
INSERT INTO `item_options` VALUES (1018, 'step', '1,2,3', 6);
INSERT INTO `item_options` VALUES (1019, 'order_step', '1,2,3,4,5', 20181230011246963);
INSERT INTO `item_options` VALUES (1020, 'order_step', '1,2,3,4,5,6', 20190102145127964);
INSERT INTO `item_options` VALUES (1021, 'order_step', '1,2,3,4,5,6', 20190104003226443);
INSERT INTO `item_options` VALUES (1022, 'order_step', '1,2,3,4', 20190104003604300);
INSERT INTO `item_options` VALUES (1023, 'step', '1,2,3', 7);
INSERT INTO `item_options` VALUES (1024, 'order_step', '1,2,3,4,5,6', 20190104131036557);
INSERT INTO `item_options` VALUES (1025, 'order_step', '1', 20190104200611681);
INSERT INTO `item_options` VALUES (1026, 'order_step', '1,2,3,4,5,6', 20190108144034456);
INSERT INTO `item_options` VALUES (1027, 'order_step', '1,2,3,4,5,6', 20190125115451559);
INSERT INTO `item_options` VALUES (1028, 'order_step', '1,2,3,4,5', 2019012512333330);
INSERT INTO `item_options` VALUES (1029, 'order_step', '1,2,3,4,5,6', 20190202202007916);
INSERT INTO `item_options` VALUES (1030, 'step', '1,2,3', 2147483647);
INSERT INTO `item_options` VALUES (1031, 'order_step', '1,2,3,4,5,6', 20190203111532403);
INSERT INTO `item_options` VALUES (1111, 'unit', 'ชุด', NULL);
INSERT INTO `item_options` VALUES (1112, 'unit', 'แพค', NULL);
INSERT INTO `item_options` VALUES (1113, 'unit', 'กล่อง', NULL);
INSERT INTO `item_options` VALUES (1114, 'unit', 'ถุง', NULL);
INSERT INTO `item_options` VALUES (1115, 'unit', 'บาน', NULL);
INSERT INTO `item_options` VALUES (1116, 'order_step', '1,2,3', 20190210121132799);
INSERT INTO `item_options` VALUES (1117, 'order_step', '1,2,3', 20190226143143587);
INSERT INTO `item_options` VALUES (1118, 'order_step', '1,2,3,4,5,6', 20190304202628118);
INSERT INTO `item_options` VALUES (1119, 'order_step', '1,2,3,4,5,6', 2019030619354962);
INSERT INTO `item_options` VALUES (1120, 'order_step', '1,2,3,4,5,6', 2019030911432129);
INSERT INTO `item_options` VALUES (1121, 'order_step', '1,2,3,4', 20190311074508717);
INSERT INTO `item_options` VALUES (1122, 'order_step', '1,2,3,4,5', 20190311214801184);
INSERT INTO `item_options` VALUES (1123, 'order_step', '1,2,3', 20190319190601295);
INSERT INTO `item_options` VALUES (1124, 'order_step', '1,2,3', 20190319195442437);
INSERT INTO `item_options` VALUES (1125, 'order_step', '1,2,3,4,5,6', 20190319203801983);
INSERT INTO `item_options` VALUES (1126, 'order_step', '1,2,3,4', 20190319210502594);
INSERT INTO `item_options` VALUES (1127, 'order_step', '1,2,3,4,5,6', 20190319214901489);
INSERT INTO `item_options` VALUES (1128, 'order_step', '1,2,3,4', 20190319221357762);
INSERT INTO `item_options` VALUES (1129, 'step', '1', NULL);
INSERT INTO `item_options` VALUES (1130, 'order_step', '1,2', 20190705132931790);
INSERT INTO `item_options` VALUES (1131, 'order_step', '1,2,3,4,5,6', 20190705192636814);
INSERT INTO `item_options` VALUES (1132, 'order_step', '1,2,3,4,5,6', 20190710070149234);
INSERT INTO `item_options` VALUES (1133, 'order_step', '1,2,3,4,5,6', 20190824120529144);
INSERT INTO `item_options` VALUES (1134, 'order_step', '1,2,3,4,5', 20190928170338254);
INSERT INTO `item_options` VALUES (1135, 'order_step', '1,2', 20191119160057974);
INSERT INTO `item_options` VALUES (1136, 'order_step', '1,2,3,4', 20191227141245383);
INSERT INTO `item_options` VALUES (1137, 'order_step', '1,2,3,4,5,6', 2020010411444846);
INSERT INTO `item_options` VALUES (1138, 'order_step', '1', 20200104115114500);
INSERT INTO `item_options` VALUES (1139, 'step', '1', 2147483648);
INSERT INTO `item_options` VALUES (1140, 'step', '1,2,3', 2147483649);
COMMIT;

-- ----------------------------
-- Table structure for keyword_search
-- ----------------------------
DROP TABLE IF EXISTS `keyword_search`;
CREATE TABLE `keyword_search` (
  `id` bigint(20) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of keyword_search
-- ----------------------------
BEGIN;
INSERT INTO `keyword_search` VALUES (1537036750059979800, '2018-09-16', 1, '2018-09-16 01:39:10');
INSERT INTO `keyword_search` VALUES (1537036778033130400, 'จักสานลิเภา', 1, '2018-09-16 01:39:38');
INSERT INTO `keyword_search` VALUES (1537036805035951100, 'พิพิธภัณฑ์', 1, '2018-09-16 01:40:05');
INSERT INTO `keyword_search` VALUES (1537036893030479800, '', 1, '2018-09-16 01:41:33');
INSERT INTO `keyword_search` VALUES (1537038350093378500, 'กฏระเบียบ', 1, '2018-09-16 02:05:50');
INSERT INTO `keyword_search` VALUES (1537038388039666300, 'ทดสอบ', 1, '2018-09-16 02:06:28');
INSERT INTO `keyword_search` VALUES (1537173533082049400, 'รายการงานที่ต้องแก้ไขเพิ่ม', 1, '2018-09-17 15:38:53');
INSERT INTO `keyword_search` VALUES (1537195213090220000, 'Role', 1, '2018-09-17 21:40:13');
INSERT INTO `keyword_search` VALUES (1537195807031736800, 'grep', 1, '2018-09-17 21:50:07');
INSERT INTO `keyword_search` VALUES (1537196427062948800, 'This is Heading', 1, '2018-09-17 22:00:27');
INSERT INTO `keyword_search` VALUES (1537237407024947600, 'canon', 1, '2018-09-18 09:23:27');
INSERT INTO `keyword_search` VALUES (1537340753018619300, 'โรงพยาบาล', 1, '2018-09-19 14:05:53');
INSERT INTO `keyword_search` VALUES (1537340784065779500, 'xxx', 1, '2018-09-19 14:06:24');
INSERT INTO `keyword_search` VALUES (1537341194092896400, 'siriraj', 1, '2018-09-19 14:13:14');
INSERT INTO `keyword_search` VALUES (1537499852096136000, 'เรือ', 1, '2018-09-21 10:17:32');
INSERT INTO `keyword_search` VALUES (1537500175054186600, 'ศิริราช', 1, '2018-09-21 10:22:55');
INSERT INTO `keyword_search` VALUES (1537501706007565600, 'ซีอุย', 1, '2018-09-21 10:48:26');
INSERT INTO `keyword_search` VALUES (1537501726077823100, 'ซีอุย ปรสิต', 1, '2018-09-21 10:48:46');
INSERT INTO `keyword_search` VALUES (1537501732009000300, 'เรือ โบราณ', 1, '2018-09-21 10:48:52');
INSERT INTO `keyword_search` VALUES (1537501741029894400, 'เรือ รับน้องข้ามฟาก', 1, '2018-09-21 10:49:01');
INSERT INTO `keyword_search` VALUES (1537501747032982700, 'รับน้อง', 1, '2018-09-21 10:49:07');
INSERT INTO `keyword_search` VALUES (1537501754002304300, 'รับน้อง ข้ามฟาก', 1, '2018-09-21 10:49:14');
INSERT INTO `keyword_search` VALUES (1537501768088928700, 'ข้ามฟาก', 1, '2018-09-21 10:49:28');
INSERT INTO `keyword_search` VALUES (1537847377040812900, 'ค่าเข้าชม', 1, '2018-09-25 10:49:37');
INSERT INTO `keyword_search` VALUES (1537847494038668600, 'เรือโบราณ', 1, '2018-09-25 10:51:34');
INSERT INTO `keyword_search` VALUES (1537847651060140500, 'พิมุขสถาน', 1, '2018-09-25 10:54:11');
INSERT INTO `keyword_search` VALUES (1537848758075085300, 'cannon', 1, '2018-09-25 11:12:38');
INSERT INTO `keyword_search` VALUES (1538099378019608800, 'ประชุม', 1, '2018-09-28 08:49:38');
INSERT INTO `keyword_search` VALUES (1538099462002819100, 'ห้องปฏิบัติ', 1, '2018-09-28 08:51:02');
INSERT INTO `keyword_search` VALUES (1538099557008371500, 'พื้นที่ด้านใต้', 1, '2018-09-28 08:52:37');
INSERT INTO `keyword_search` VALUES (1538112237021280400, 'บันได', 1, '2018-09-28 12:23:57');
INSERT INTO `keyword_search` VALUES (1538112331085165700, 'โรงกระโจม', 1, '2018-09-28 12:25:31');
INSERT INTO `keyword_search` VALUES (1538187867079496100, 'ต้อหิน', 1, '2018-09-29 09:24:27');
INSERT INTO `keyword_search` VALUES (1538276636069626000, 'i Endnotes', 1, '2018-09-30 10:03:56');
INSERT INTO `keyword_search` VALUES (1538276650068497000, 'excep', 1, '2018-09-30 10:04:10');
INSERT INTO `keyword_search` VALUES (1538316521005844700, 'test', 1, '2018-09-30 21:08:41');
INSERT INTO `keyword_search` VALUES (1538318659097773300, 'คน', 1, '2018-09-30 21:44:20');
INSERT INTO `keyword_search` VALUES (1538318719053844500, 'นิทรรศการ', 1, '2018-09-30 21:45:19');
INSERT INTO `keyword_search` VALUES (1538324275011689100, 'ที่พักของนางพยาบาล', 1, '2018-09-30 23:17:55');
INSERT INTO `keyword_search` VALUES (1538360443097793000, 'อวย', 1, '2018-10-01 09:20:43');
INSERT INTO `keyword_search` VALUES (1538416095091716800, 'เรือนคนไข้', 1, '2018-10-02 00:48:15');
INSERT INTO `keyword_search` VALUES (1538458516054978500, 'ตึกกายวิภาค', 1, '2018-10-02 12:35:16');
INSERT INTO `keyword_search` VALUES (1538538576051157800, 'อาจารย์ใหญ่', 1, '2018-10-03 10:49:36');
INSERT INTO `keyword_search` VALUES (1538539543055350800, 'สมัยแรก', 1, '2018-10-03 11:05:43');
INSERT INTO `keyword_search` VALUES (1538539683043243600, 'พ.ศ. 2431', 1, '2018-10-03 11:08:03');
INSERT INTO `keyword_search` VALUES (1538555453010067400, 'สึนามิ', 1, '2018-10-03 15:30:53');
INSERT INTO `keyword_search` VALUES (1538663178097089900, 'เรือน', 1, '2018-10-04 21:26:19');
INSERT INTO `keyword_search` VALUES (1538712123026112500, 'รับน้องข้ามฟาก', 1, '2018-10-05 11:02:03');
INSERT INTO `keyword_search` VALUES (1538713048025528500, 'มาโดยรถยนต์ส่วนตัว', 1, '2018-10-05 11:17:28');
INSERT INTO `keyword_search` VALUES (1538713066073986200, 'การบริการข้อมูล', 1, '2018-10-05 11:17:46');
INSERT INTO `keyword_search` VALUES (1539073066047968400, '1539071291014173700', 1, '2018-10-09 15:17:46');
INSERT INTO `keyword_search` VALUES (1539684920082094800, 'ghjj', 1, '2018-10-16 17:15:20');
INSERT INTO `keyword_search` VALUES (1539838687019125300, 'ginv', 1, '2018-10-18 11:58:10');
INSERT INTO `keyword_search` VALUES (1539854480047384300, 'ฉลาม', 1, '2018-10-18 16:21:20');
INSERT INTO `keyword_search` VALUES (1539854546066685300, 'น', 1, '2018-10-18 16:22:26');
INSERT INTO `keyword_search` VALUES (1539854551024075100, 'นงฤดี', 1, '2018-10-18 16:22:31');
INSERT INTO `keyword_search` VALUES (1539854561085669500, 'สวย', 1, '2018-10-18 16:22:41');
INSERT INTO `keyword_search` VALUES (1539854759001788800, 'เก่า', 1, '2018-10-18 16:25:59');
INSERT INTO `keyword_search` VALUES (1540524166043774800, 'sf', 1, '2018-10-26 10:22:46');
INSERT INTO `keyword_search` VALUES (1540620718075697800, 'อาคาร', 1, '2018-10-27 13:11:58');
INSERT INTO `keyword_search` VALUES (1540644391087439300, 'ศ.', 1, '2018-10-27 19:46:32');
INSERT INTO `keyword_search` VALUES (1540646904032851800, 'เอลลิส', 1, '2018-10-27 20:28:24');
INSERT INTO `keyword_search` VALUES (1540885980055798400, 'ทารก', 1, '2018-10-30 14:53:00');
INSERT INTO `keyword_search` VALUES (1540889587081960100, 'วัดเกาะ', 1, '2018-10-30 15:53:07');
INSERT INTO `keyword_search` VALUES (1540889698061358100, 'คลองบางเชือกหนัง', 1, '2018-10-30 15:54:58');
INSERT INTO `keyword_search` VALUES (1540897330061619500, 'กล้องส่อง หลอดลม', 1, '2018-10-30 18:02:10');
INSERT INTO `keyword_search` VALUES (1540897340002065800, 'กล้องส่องหลอดลม', 1, '2018-10-30 18:02:20');
INSERT INTO `keyword_search` VALUES (1540977458005743100, 'สมเด็จพระบรม', 1, '2018-10-31 16:17:38');
INSERT INTO `keyword_search` VALUES (1541045803098333000, 'มหิดล', 1, '2018-11-01 11:16:43');
INSERT INTO `keyword_search` VALUES (1541046317038032900, ':uv6p', 1, '2018-11-01 11:25:17');
INSERT INTO `keyword_search` VALUES (1541401141082496300, 'วังหลัง', 1, '2018-11-05 13:59:01');
INSERT INTO `keyword_search` VALUES (1541401150029489000, 'สุนทรภู่', 1, '2018-11-05 13:59:10');
INSERT INTO `keyword_search` VALUES (1541472846066739600, 'ตึกเสาวภาคย์', 1, '2018-11-06 09:54:06');
INSERT INTO `keyword_search` VALUES (1541622165081929600, 'demo', 1, '2018-11-08 03:22:45');
INSERT INTO `keyword_search` VALUES (1543160363083964800, 'พิพิธภัณฑ์ศิริราช', 1, '2018-11-25 22:39:23');
INSERT INTO `keyword_search` VALUES (1543162307070803900, 'ประวัติพิพิธภัณฑ์นิติเวชศาสตร์', 1, '2018-11-25 23:11:47');
INSERT INTO `keyword_search` VALUES (1543331460089829200, 'รอบ', 1, '2018-11-27 22:11:00');
INSERT INTO `keyword_search` VALUES (1543331471003876800, 'รอบรั้วศิริราช', 1, '2018-11-27 22:11:11');
INSERT INTO `keyword_search` VALUES (1543331488035033300, 'กรุงธ', 1, '2018-11-27 22:11:28');
INSERT INTO `keyword_search` VALUES (1547689113048780200, 'เฌอร่า', 1, '2019-01-17 08:38:33');
INSERT INTO `keyword_search` VALUES (1547690139012545100, 'เหล็กข้ออ้อย SD40T DB 32 ยาว 10ม. 63.13กก./เส้น', 1, '2019-01-17 08:55:39');
INSERT INTO `keyword_search` VALUES (1547690396038959300, 'เหล็ก', 1, '2019-01-17 08:59:56');
INSERT INTO `keyword_search` VALUES (1547744184051164200, 'เฌอ', 1, '2019-01-17 23:56:24');
INSERT INTO `keyword_search` VALUES (1547825980027498100, ' เฌอร่า', 1, '2019-01-18 22:39:40');
INSERT INTO `keyword_search` VALUES (1548393276086478800, 'แนง', 1, '2019-01-25 12:14:36');
INSERT INTO `keyword_search` VALUES (1549616536094781800, 'ซีดา', 1, '2019-02-08 16:02:16');
INSERT INTO `keyword_search` VALUES (1549618613042162200, 'ซีดาร์', 1, '2019-02-08 16:36:53');
INSERT INTO `keyword_search` VALUES (1549618614032781500, 'ซีรา', 1, '2019-02-08 16:36:54');
INSERT INTO `keyword_search` VALUES (1549622131025778900, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองชายน์ไลท์', 1, '2019-02-08 17:35:31');
INSERT INTO `keyword_search` VALUES (1549622302002649200, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นโมเดิร์นสแทกเกอร์', 1, '2019-02-08 17:38:22');
INSERT INTO `keyword_search` VALUES (1549622403025439200, ' เหลืองกา', 1, '2019-02-08 17:40:03');
INSERT INTO `keyword_search` VALUES (1549622407097451100, ' เหลือง', 1, '2019-02-08 17:40:07');
INSERT INTO `keyword_search` VALUES (1549622423080428600, 'แดงเช', 1, '2019-02-08 17:40:23');
INSERT INTO `keyword_search` VALUES (1550737204044028000, 'spf', 1, '2019-02-21 15:20:04');
INSERT INTO `keyword_search` VALUES (1550737216054979600, 'หยด', 1, '2019-02-21 15:20:16');
INSERT INTO `keyword_search` VALUES (1551177816094865600, 'ฝา สัก ธรรม', 1, '2019-02-26 17:43:36');
INSERT INTO `keyword_search` VALUES (1551177856013144700, 'ไม้ฝา เฌอร่า สัก ธรรม', 1, '2019-02-26 17:44:16');
INSERT INTO `keyword_search` VALUES (1551177866057437100, 'ไม้ฝาเฌอร่า สัก ธรรม', 1, '2019-02-26 17:44:26');
INSERT INTO `keyword_search` VALUES (1551177875021845500, 'ไม้ฝาเฌอร่า', 1, '2019-02-26 17:44:35');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent` (`parent`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of migration
-- ----------------------------
BEGIN;
INSERT INTO `migration` VALUES ('m000000_000000_base', 1535696053);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1535696058);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1535696059);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1535696063);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1535696064);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1535696065);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1535696065);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1535696065);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1535696066);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1535696068);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1535696068);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1535696069);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1535696069);
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', 1535696117);
INSERT INTO `migration` VALUES ('m160312_050000_create_user', 1535696117);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1535696133);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1535696133);
COMMIT;

-- ----------------------------
-- Table structure for order_conditions
-- ----------------------------
DROP TABLE IF EXISTS `order_conditions`;
CREATE TABLE `order_conditions` (
  `id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เงือนไขการสั่งซื้อ',
  `default` int(1) DEFAULT NULL COMMENT 'ค่าเริ่มต้น',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of order_conditions
-- ----------------------------
BEGIN;
INSERT INTO `order_conditions` VALUES (1, '<p>เงื่อนไขราคาสินค้า\r\nกรณีเป็นผู้จัดส่ง ราคาสินค้าเป็นราคาหน้าโรงงาน&nbsp;</p><p>ค่าขนส่งจะถูกคำนวณอัตโนมัติหลังจากมีการใส่ตะกร้าสินค้า และระบุสถานที่จัดส่ง</p><p>กรณีเป็นร้านเครือข่ายจัดส่ง ราคาสินค้าเป็นราคารวมส่ง</p><p>ราคาสินค้าเป็นราคาก่อนภาษีมูลค่าเพิ่ม 7%</p><p>ราคาสินค้าอาจมีการเปลี่ยนแปลงโดยไม่แจ้งให้ทราบล่วงหน้า</p>', 2);
INSERT INTO `order_conditions` VALUES (1549133467, '<p>hhhhh</p>', 1);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL COMMENT 'รหัสใบสั่งซื้อสินค้า',
  `quo_id` bigint(20) DEFAULT NULL COMMENT 'รหัสใบเสนอราคา',
  `rstat` int(10) DEFAULT NULL COMMENT 'สถานะ',
  `date` date DEFAULT NULL COMMENT 'วันที่ออกใบสั่งซื้อ',
  `forder` bigint(20) DEFAULT NULL COMMENT 'รหัสเรียงลำดับ',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `discount` decimal(20,0) DEFAULT NULL COMMENT 'ส่วนลดของลูกค้า',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (20190319100, 20190319214901489, 1, '2019-03-19', 100, 5, NULL);
INSERT INTO `orders` VALUES (20190319101, 20190319221357762, 1, '2019-03-19', 101, 2147483647, NULL);
INSERT INTO `orders` VALUES (20190706102, 20190705192636814, 1, '2019-07-06', 102, 5, NULL);
INSERT INTO `orders` VALUES (20190710103, 20190710070149234, 1, '2019-07-10', 103, 2147483647, NULL);
INSERT INTO `orders` VALUES (20190824104, 20190824120529144, 1, '2019-08-24', 104, 5, NULL);
INSERT INTO `orders` VALUES (20190928105, 20190928170338254, 1, '2019-09-28', 105, 5, NULL);
INSERT INTO `orders` VALUES (20191227106, 20191227141245383, 1, '2019-12-27', 106, 5, NULL);
INSERT INTO `orders` VALUES (20200104107, 2020010411444846, 1, '2020-01-04', 107, 6, NULL);
COMMIT;

-- ----------------------------
-- Table structure for payment_types
-- ----------------------------
DROP TABLE IF EXISTS `payment_types`;
CREATE TABLE `payment_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสธนาคาร',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อธนาคาร',
  `detail` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รายละเอียด',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รูปภาพ',
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อเจ้าของบัญชี',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of payment_types
-- ----------------------------
BEGIN;
INSERT INTO `payment_types` VALUES (1, 'ธนาคารไทยพาณิชย์', 'สาขา ขอนแก่น\r\n', '', 'ณัฐพล จันทร์ปาน เลขที่บัญชี 1409700109776 สาขา ขอนแก่น');
INSERT INTO `payment_types` VALUES (2, 'ธนาคารออมสิน', 'สาขาขอนแก่น', '', 'ณัฐพล จันทร์ปาน');
INSERT INTO `payment_types` VALUES (3, 'ธนาคารกรุงไทย', 'สาขาขอนแก่น', '', 'ณัฐพล จันทร์ปาน');
COMMIT;

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'รหัส',
  `quo_id` bigint(20) DEFAULT NULL COMMENT 'รหัสใบเสนอราคา',
  `image` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รูปภาพการชำระเงิน',
  `date` date DEFAULT NULL COMMENT 'วันที่ชำระเงิน',
  `payment_type` bigint(255) DEFAULT NULL COMMENT 'ชำระเงินผ่านธนาคาร',
  `note` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หมายเหตุ',
  `price` decimal(20,2) DEFAULT NULL COMMENT 'จำนวนเงิน',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1578113259083875901 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of payments
-- ----------------------------
BEGIN;
INSERT INTO `payments` VALUES (1553007597049446700, 20190319214901489, '1553007597049439700.jpg', '2019-12-03', 1, NULL, 30000.00);
INSERT INTO `payments` VALUES (1553008696094753300, 20190319221357762, '1553008696094746000.jpg', '2019-03-19', 1, NULL, 365.00);
INSERT INTO `payments` VALUES (1562398877005210500, 20190705192636814, '1562398877005202400.png', '2562-07-06', 1, NULL, 123456.00);
INSERT INTO `payments` VALUES (1562398879002459400, 20190705192636814, '1562398879002452600.png', '2562-07-06', 1, NULL, 123456.00);
INSERT INTO `payments` VALUES (1562717020079000800, 20190710070149234, '1562717020078993500.jpg', '2019-07-10', 1, NULL, 10000.00);
INSERT INTO `payments` VALUES (1566623344069523000, 20190824120529144, '1566623344069515200.png', '2019-08-24', 1, NULL, 52525.00);
INSERT INTO `payments` VALUES (1569665225092215700, 20190928170338254, '1569665225092208400.jpg', '2019-09-28', 1, NULL, 300000.00);
INSERT INTO `payments` VALUES (1569665227065404100, 20190928170338254, '1569665227065396200.jpg', '2019-09-28', 1, NULL, 300000.00);
INSERT INTO `payments` VALUES (1577431103056768800, 20191227141245383, '1577431103056761300.jpeg', '2019-12-27', 1, NULL, 111111.00);
INSERT INTO `payments` VALUES (1577431105000526900, 20191227141245383, '1577431105000518900.jpeg', '2019-12-27', 1, NULL, 111111.00);
INSERT INTO `payments` VALUES (1578113259083875900, 2020010411444846, '1578113259083868400.jpg', '2020-01-04', 1, NULL, 10000.00);
COMMIT;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitecode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of profile
-- ----------------------------
BEGIN;
INSERT INTO `profile` VALUES (1, 'nuttaphon chanpan', 'chanpan.nuttaphon1993@gmail.com', 'chanpan.nuttaphon1993@gmail.com', 'd70f6226ff8caba303baede9f0892c0e', '', '', 'admin', NULL, 'nuttaphon', 'chanpan', '0650859480', '1/o_BgG_-2ej7ZqIryKAxOl4uqdkGZldJj.jpg', 'http://storage.stock.local/source', NULL, NULL);
INSERT INTO `profile` VALUES (2, 'manager1 manager1', 'manager1@gmail.com', 'manager1@gmail.com', '94d9a02cb31595532795c2a82bacc0a5', NULL, NULL, '', NULL, 'manager1', 'manager1', '0984657463', '1/jzW0cTBb5ZiNYNlXeiLoz3gJQS5eGCQ4.png', 'http://storage.stock.local/source', NULL, NULL);
INSERT INTO `profile` VALUES (3, 'manager2 manager2', 'manager2@gmail.com', 'manager2@gmail.com', '92d34650cf207d766527887163433501', NULL, NULL, NULL, NULL, 'manager2', 'manager2', '0958695849', NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (4, 'manager3 manager3', 'manager3@gmail.com', 'manager3@gmail.com', '8a2b057c3cf5d00b9a8d7b10b361a284', '', '', 'manager3,user', NULL, 'manager3', 'manager3', '0495869504', NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (5, 'jirapong RR', 'jirapong_r@hotmail.com', 'jirapong_r@hotmail.com', '2b722c99c255accddf26e811da7baada', '', '', 'admin,finance_manager,general_manager,logistics_manager,sales_manager,user', NULL, 'jirapong', 'RR', '0819759387', '1/SC14xbokip4zfLs8v8HvUoNdfIDdriAr.gif', 'https://storage.dconhub.com/source', NULL, NULL);
INSERT INTO `profile` VALUES (6, 'manager manager', 'manage@gmail.com', 'manage@gmail.com', 'bc5e3592f51bf1a4d03733d9024e2eb6', NULL, NULL, '', NULL, 'manager', 'manager', '0862229416', NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (7, 'vipawan vry', 'damrong_con@hotmail.com', 'damrong_con@hotmail.com', 'a5fd925423cab56b665a51b0c815e969', NULL, NULL, NULL, NULL, 'vipawan', 'vry', '0850044429', NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (2147483647, 'Chanpan Natthaphon', 'nuttaphon07@hotmail.com', 'nuttaphon07@hotmail.com', '9c426104a977f81c80378326f960ba3e', '', '', 'users', NULL, 'Chanpan', 'Natthaphon', '', NULL, NULL, '00', NULL);
INSERT INTO `profile` VALUES (2147483648, 'Nuttaphon Chanpan', 'chanpan.nuttaphon@gmail.com', 'chanpan.nuttaphon@gmail.com', '926eec8d6926f51c37aedd9b3faa3702', NULL, NULL, NULL, NULL, 'Nuttaphon', 'Chanpan', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (2147483649, 'เบลล่า ฮานาโกะ', 'info.bellahanako@gmail.com', 'info.bellahanako@gmail.com', '9a96fe0b0ddba6be8d0052de9238cb54', NULL, NULL, NULL, NULL, 'เบลล่า', 'ฮานาโกะ', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (2147483650, 'mDtJOdjhGYMuv gzKdImXeuTHhcG', 'quibedssusi2009@gmail.com', 'quibedssusi2009@gmail.com', '04600b1d620e3e3842a00bb76f9fbe93', NULL, NULL, NULL, NULL, 'mDtJOdjhGYMuv', 'gzKdImXeuTHhcG', '2932249728', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for quotation_details
-- ----------------------------
DROP TABLE IF EXISTS `quotation_details`;
CREATE TABLE `quotation_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'รหัส',
  `quo_id` bigint(20) DEFAULT NULL COMMENT 'รหัสใบเสนอราคา',
  `product_id` bigint(20) DEFAULT NULL COMMENT 'รหัสสินค้า',
  `qty` int(11) DEFAULT NULL COMMENT 'จำนวน',
  `price` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ราคา',
  `price_total` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ราคาทั้งหมด',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of quotation_details
-- ----------------------------
BEGIN;
INSERT INTO `quotation_details` VALUES (129, 20190319214901489, 1546573329065529500, 290, '94.15', '27303.5');
INSERT INTO `quotation_details` VALUES (130, 20190319214901489, 1546938320055441600, 330, '45.21', '14919.3');
INSERT INTO `quotation_details` VALUES (131, 20190319221357762, 1546509171076391700, 9, '45.69', '411.21');
INSERT INTO `quotation_details` VALUES (132, 2019032217041159, 1546509171076391700, 4, '42.69', '170.76');
INSERT INTO `quotation_details` VALUES (133, 20190705132931790, 1546569431030593700, 175, '60', '10500');
INSERT INTO `quotation_details` VALUES (134, 20190705132931790, 1546569495052506500, 290, '80', '23200');
INSERT INTO `quotation_details` VALUES (135, 20190705192636814, 1546569431030593700, 175, '63', '11025');
INSERT INTO `quotation_details` VALUES (136, 20190705192636814, 1546569495052506500, 290, '84', '24360');
INSERT INTO `quotation_details` VALUES (137, 20190705193653882, 1546509171076391700, 12, '42.69', '512.28');
INSERT INTO `quotation_details` VALUES (138, 20190706143723377, 1546574542048552300, 350, '70.32', '24612');
INSERT INTO `quotation_details` VALUES (139, 20190706143723377, 1545918187014793900, 175, '56.39', '9868.25');
INSERT INTO `quotation_details` VALUES (140, 20190710070149234, 1546509171076391700, 4, '42.69', '170.76');
INSERT INTO `quotation_details` VALUES (141, 20190710070149234, 1546573677077300600, 5, '94.20', '471');
INSERT INTO `quotation_details` VALUES (142, 20190824120529144, 1546569562052442400, 220, '82', '18040');
INSERT INTO `quotation_details` VALUES (143, 20190824120529144, 1546569495052506500, 145, '84.25', '12216.25');
INSERT INTO `quotation_details` VALUES (144, 20190928170338254, 1546568163058892600, 145, '75.63', '10966.35');
INSERT INTO `quotation_details` VALUES (145, 20190928170338254, 1546832925057381600, 96, '152.80', '14668.8');
INSERT INTO `quotation_details` VALUES (146, 20191119160057974, 1546509171076391700, 6, '42.69', '256.14');
INSERT INTO `quotation_details` VALUES (147, 20191227141245383, 1546509171076391700, 175, '42.69', '7470.75');
INSERT INTO `quotation_details` VALUES (148, 20191227141245383, 1546508222063296100, 145, '57.33', '8312.85');
INSERT INTO `quotation_details` VALUES (149, 2020010411444846, 1546572844044168300, 40, '84.25', '3370');
INSERT INTO `quotation_details` VALUES (150, 20200104115114500, 1546568163058892600, 1, '75.63', '75.63');
INSERT INTO `quotation_details` VALUES (151, 20200205131004353, 1546509171076391700, 1, '42.69', '42.69');
INSERT INTO `quotation_details` VALUES (152, 20200211170415539, 1546572754089208000, 1, '63.02', '63.02');
INSERT INTO `quotation_details` VALUES (153, 20200508195300473, 1547083794011610400, 1000, '273.92', '273920');
INSERT INTO `quotation_details` VALUES (154, 2020061511510168, 1546509171076391700, 175, '42.69', '7470.75');
INSERT INTO `quotation_details` VALUES (155, 2020061511510168, 1546508222063296100, 145, '57.33', '8312.85');
INSERT INTO `quotation_details` VALUES (156, 20200724112120506, 1546509171076391700, 1, '42.69', '42.69');
INSERT INTO `quotation_details` VALUES (157, 20200916132449914, 1548732515020002600, 1, '560.25', '560.25');
COMMIT;

-- ----------------------------
-- Table structure for quotations
-- ----------------------------
DROP TABLE IF EXISTS `quotations`;
CREATE TABLE `quotations` (
  `id` bigint(20) NOT NULL COMMENT 'รหัสใบเสนอราคา',
  `order_id` bigint(20) DEFAULT NULL COMMENT 'รหัสการสั่งซื้อ',
  `staff_id` bigint(20) DEFAULT NULL COMMENT 'พนักงาน',
  `user_id` bigint(20) DEFAULT NULL COMMENT 'ลูกค้า',
  `staff_confirm` int(10) DEFAULT NULL COMMENT 'พนักงานยืนยัน',
  `user_confirm` int(10) DEFAULT NULL COMMENT 'ลูกค้ายืนยัน',
  `delivery_status` int(10) DEFAULT NULL COMMENT 'สถานะจัดส่ง',
  `create_date` datetime DEFAULT NULL COMMENT 'วันที่สร้าง',
  `update_date` datetime DEFAULT NULL COMMENT 'วันที่แก้ไข',
  `finance_confirm` int(11) DEFAULT NULL COMMENT 'เจ้าหน้าที่การเงินยืนยัน',
  `rstat` int(11) DEFAULT NULL COMMENT 'สถานะ',
  `price_confirm` int(11) DEFAULT NULL COMMENT 'ยืนยันราคา',
  `note` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หมายเหตุ',
  `payment_confirm` int(11) DEFAULT NULL COMMENT 'ยืนยันการชำระเงิน',
  `final_confirm` int(255) DEFAULT NULL COMMENT 'ยืนยันการจัดส่งสินค้า',
  `confirm_order` int(10) DEFAULT NULL COMMENT 'ยืนยันใบสั่งซื้อ',
  `discount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ส่วนลดของลูกค้า',
  `total_price` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'จำนวนเงินก่อนหักภาษี',
  `vat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ภาษีมูลค่าเพิ่ม',
  `total_price_all` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'จำนวนเงินทั้งหมด',
  `total_price_discount` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'จำนวนเงินรวมส่วนลด',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of quotations
-- ----------------------------
BEGIN;
INSERT INTO `quotations` VALUES (2019032217041159, 2019032217041159, NULL, 1, NULL, NULL, NULL, '2019-03-22 17:04:11', '2019-03-22 17:04:11', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (2020010411444846, 2020010411444846, NULL, 6, NULL, 1, NULL, '2020-01-04 11:44:48', '2020-01-04 11:44:48', NULL, 1, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (2020061511510168, 2020061511510168, NULL, 5, NULL, NULL, NULL, '2020-06-15 11:51:01', '2020-06-15 11:51:01', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20190319214901489, 20190319214901489, NULL, 5, NULL, 1, NULL, '2019-03-19 21:49:01', '2019-03-19 21:49:01', NULL, 1, 1, '<p>ไม่บอกไม้รู้?</p>', 1, 1, 1, '93.46', '42222.8', '2949.0538', '45078.3938', '42129.34');
INSERT INTO `quotations` VALUES (20190319221357762, 20190319221357762, NULL, 2147483647, NULL, 1, NULL, '2019-03-19 22:13:57', '2019-03-19 22:13:57', NULL, 1, 1, '', NULL, NULL, 1, '16', '411.21', '27.6647', '422.8747', '395.21');
INSERT INTO `quotations` VALUES (20190705132931790, 20190705132931790, NULL, 5, NULL, NULL, NULL, '2019-07-05 13:29:31', '2019-07-05 13:29:31', NULL, 1, 1, '', NULL, NULL, NULL, '0', '33700', '2359', '36059', '33700');
INSERT INTO `quotations` VALUES (20190705192636814, 20190705192636814, NULL, 5, NULL, 1, NULL, '2019-07-05 19:26:36', '2019-07-05 19:26:36', NULL, 1, 1, '<p>1234567898887878</p>', 1, 1, 1, '0', '35385', '2476.95', '37861.95', '35385');
INSERT INTO `quotations` VALUES (20190705193653882, 20190705193653882, NULL, 1, NULL, NULL, NULL, '2019-07-05 19:36:53', '2019-07-05 19:36:53', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20190706143723377, 20190706143723377, NULL, 5, NULL, NULL, NULL, '2019-07-06 14:37:23', '2019-07-06 14:37:23', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20190710070149234, 20190710070149234, NULL, 2147483647, NULL, 1, NULL, '2019-07-10 07:01:49', '2019-07-10 07:01:49', NULL, 1, 1, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20190824120529144, 20190824120529144, NULL, 5, NULL, 1, NULL, '2019-08-24 12:05:29', '2019-08-24 12:05:29', NULL, 1, 1, '', 1, 1, 1, '0', '30256.25', '2117.9375', '32374.1875', '30256.25');
INSERT INTO `quotations` VALUES (20190928170338254, 20190928170338254, NULL, 5, NULL, 1, NULL, '2019-09-28 17:03:38', '2019-09-28 17:03:38', NULL, 1, 1, '', 1, NULL, 1, '0', NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20191119160057974, 20191119160057974, NULL, 2147483647, NULL, NULL, NULL, '2019-11-19 16:00:57', '2019-11-19 16:00:57', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20191227141245383, 20191227141245383, NULL, 5, NULL, 1, NULL, '2019-12-27 14:12:45', '2019-12-27 14:12:45', NULL, 1, 1, '', NULL, NULL, 1, '0', '15783.6', '1104.852', '16888.452', '15783.6');
INSERT INTO `quotations` VALUES (20200104115114500, 20200104115114500, NULL, 6, NULL, 30, NULL, '2020-01-04 11:51:14', '2020-01-04 11:51:14', NULL, 1, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20200205131004353, 20200205131004353, NULL, 1, NULL, NULL, NULL, '2020-02-05 13:10:04', '2020-02-05 13:10:04', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20200211170415539, 20200211170415539, NULL, 1, NULL, NULL, NULL, '2020-02-11 17:04:15', '2020-02-11 17:04:15', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20200508195300473, 20200508195300473, NULL, 2147483647, NULL, NULL, NULL, '2020-05-08 19:53:00', '2020-05-08 19:53:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20200724112120506, 20200724112120506, NULL, 2147483647, NULL, NULL, NULL, '2020-07-24 11:21:20', '2020-07-24 11:21:20', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `quotations` VALUES (20200916132449914, 20200916132449914, NULL, 2147483649, NULL, NULL, NULL, '2020-09-16 13:24:49', '2020-09-16 13:24:49', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อไฟล์',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Url',
  `forder` int(11) DEFAULT NULL COMMENT 'เรียงลำดับ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of sliders
-- ----------------------------
BEGIN;
INSERT INTO `sliders` VALUES (1, '1590211535046922500.png', '/brand/detail?id=10', 1);
INSERT INTO `sliders` VALUES (4, '1590211506007765700.png', '/categorie/detail?id=4', 2);
INSERT INTO `sliders` VALUES (5, '1590211463084573100.png', '/categorie/detail?id=591', 3);
COMMIT;

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_unique` (`provider`,`client_id`) USING BTREE,
  UNIQUE KEY `account_unique_code` (`code`) USING BTREE,
  KEY `fk_user_account` (`user_id`) USING BTREE,
  CONSTRAINT `social_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for stock_brand
-- ----------------------------
DROP TABLE IF EXISTS `stock_brand`;
CREATE TABLE `stock_brand` (
  `id` bigint(20) NOT NULL COMMENT 'รหัสตราสินค้า',
  `type` tinyint(4) DEFAULT NULL COMMENT 'หลักหรือย่อย (1 หลัก 2 ย่อย)',
  `brand_id` int(11) DEFAULT NULL COMMENT 'รหัสแบรนด์หลัก',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อตราสินค้า',
  `icon` varchar(255) DEFAULT NULL COMMENT 'โลโก้',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รายละเอียด',
  `deleted` tinyint(4) DEFAULT NULL,
  `forder` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stock_brand
-- ----------------------------
BEGIN;
INSERT INTO `stock_brand` VALUES (3, 1, NULL, 'เอสซีจี SCG', '1588929071017979800.jpg', '<p>เอสซีจี SCG ประกอบไปด้วย 9 กลุ่มผลิตภัณฑ์ที่ ได้แก่ ปูนซีเมนต์ เหล็ก ท่อ หลังคาและอุปกรณ์หลังคา แผ่นฝ้าเพดานและฝาผนัง ไม้สังเคราะห์ ฉนวนกันความร้อน วัสดุอะคูสติก และวัสดุตกแต่งภูมิทัศน์ &quot;เอสซีจี SCG ก่อตั้งในประเทศไทยเมื่อปี พ.ศ. 2456 ตามพระบรมราชโองการในพระบาทสมเด็จพระมงกุฏเกล้าเจ้าอยู่หัว รัชกาลที่ 6 เพื่อผลิตปูนซีเมนต์ ซึ่งเป็นวัสดุก่อสร้างสำคัญในการพัฒนาประเทศในขณะนั้น และได้ผ่านการเรียนรู้ ปรับตัว พัฒนาองค์กรอย่างต่อเนื่องจนได้รับการยอมรับเป็นองค์กรต้นแบบชั้นนำในภูมิภาคอาเซียน และพร้อมก้าวสู่การแข่งขันในระดับโลก ปัจจุบันเอสซีจีดำเนินธุรกิจตามแนวทางการพัฒนาอย่างยั่งยืน ภายใต้หลักบรรษัทภิบาลที่ดี มีบริษัทย่อยภายใต้แบรนด์มากกว่า 200 บริษัท สร้างสรรค์และพัฒนานวัตกรรมผลิตภัณฑ์และบริการที่ตอบโจทย์ของผู้บริโภค ทั้งในปัจจุบันและอนาคต เอสซีจี มีอุดมการณ์ และบรรษัทภิบาล ในการดำเนินธุรกิจโดยยึดมั่นใน ความรับผิดชอบต่อผู้มีส่วนได้ ส่วนเสียทุกฝ่าย&quot; อ้างอิงจาก เอสซีจี</p>', 10, 110);
INSERT INTO `stock_brand` VALUES (4, 1, NULL, 'BISW บลกท', '1588928510037915500.jpg', '<p>โรงเหล็กกรุงเทพ เป็นโรงงานผลิตเหล็กเส้นที่ได้คุณภาพ มาตรฐาน และราคาสมเหตุสมผล มีความสามารถในการผลิตเหล็กได้ตรงตามมาตรฐาน มอก. ปัจจุบัน เริ่มได้มีการผลิตเหล็กดัดสำเร็จรูป ซึ่งจะช่วยให้หน้างานสามารถประหยัดค่าใช้จ่าย และค่าใช้จ่ายในการก่อสร้าง ค่าแรงในการก่อสร้างหน้างานได้อย่างมีนัยสำคัญ เหล็กเส้นทุกเส้นที่ผลิตล้วนได้รับมาตรฐาน มอก. บริษัท โรงงานเหล็กกรุงเทพฯ จำกัด (บลกท.) ผู้ผลิตเหล็กแท่ง(Billet)และจำหน่ายเหล็กเส้นเสริมคอนกรีตชนิดข้ออ้อยและเหล็กเส้นกลม,เหล็กลวด,เหล็กเพลาดำ ตามมาตรฐานผลิตภัณฑ์อุตสาหกรรม(มอก.) นโยบายคุณภาพ Quality Policy &ldquo;บริษัทฯ มีความมุ่งมั่นพัฒนาระบบบริหารคุณภาพอย่างต่อเนื่อง มั่งมั่นที่จะผลิตผลิตภัณฑ์ให้เป็นไปตามมาตรฐานสากล และตอบสนองความพึงพอใจของลูกค้า&rdquo; วัตถุประสงค์ด้านคุณภาพ Quality Objective เพื่อให้เข้าใจในทิศทางเดียวกันและสอดคล้องกับนโยบายคุณภาพ บริษัทฯ จึงกำหนดวัตถุประสงค์ด้านคุณภาพ ไว้ดังนี้ บริษัทฯ มุ่งมั่นควบคุม ดัชนีชี้วัดความสามารถของกระบวนการ(KPLs)ให้บรรลุเป้าหมายร้อยละ 80 ต่อเดือน บริษัทฯ มุ่งมั่นพัฒนาความพึงพอใจของลูกค้า ด้วยการควบคุมให้จำนวนข้อร้องเรียนจากลูกค้า น้อยกว่าหรือเท่ากับ 2 รายการต่อเดือน</p>', 10, 90);
INSERT INTO `stock_brand` VALUES (5, 1, NULL, 'PAP แปซิฟิกไพพ์', '1588928170095126100.jpg', '<p>&nbsp;บริษัท เหล็กเส้นและท่อเหล็กท่อเหล็กมุงหลังคาเหล็กสี่เหลี่ยมจัตุรัส เหล็กสี่เหลี่ยมผืนผ้าและเหล็กรูปพรรณด้วยประสบการณ์ในการผลิตท่อเหล็กมานานกว่า 35 ปีและการผลิตโดย เทคโนโลยีพร้อมระบบตรวจสอบและควบคุมโดยวิศวกรแต่ละผลิตภัณฑ์ทุกประเภทที่ผลิตจาก บริษัท ฯ ได้รับมาตรฐานสากลและได้รับการรับรองจากสถาบันที่มีความต้องการมากที่สุด อย่างทั่วถึงทั่วโลกและมากกว่า 10 ประเทศทั่วโลก บริษัท มีความมั่นใจว่าจะผลิตสินค้าที่มีคุณภาพสุง พร้อมทั้งผลิตภัณฑ์เพื่อการจัดส่งและจัดส่งสินค้าเพื่อตอบสนองความต้องการของลูกค้าให้มีความเหมาะสมกับความต้องการและความพึงพอใจของลูกค้า</p>', 10, 80);
INSERT INTO `stock_brand` VALUES (6, 1, NULL, 'TIW ไทยแลนด์ไอออนเวิคส์', '1588928857021980300.jpg', '<p>บริษัทได้รับการก่อตั้งขึ้นในปี พ.ศ.2501 ชื่อว่า บริษัท ไทยแลนด์ไอออนเวิคส์ จำกัด มีสำนักงานและโรงงาน ตั้งอยู่ในเขตกรุงเทพมหานคร การจัดตั้งบริษัทขึ้นนั้น เป็นการร่วมลงทุนกันระหว่างผู้ลงทุนชาวไทยและชาวญี่ปุ่น โดยมีวัตถุประสงค์ในการผลิตแผ่นเหล็กชุบสังกะสีขึ้นเองภายในประเทศ เพื่อทดแทนการนำเข้าผลิตภัณฑ์ดังกล่าวจากต่างประเทศ เนื่องจากในขณะนั้น บริษัทเป็นผู้ผลิตผลิตภัณฑ์แผ่นเหล็กชุบสังกะสีเป็นรายแรกของประเทศ บริษัทจึงได้รับการส่งเสริมการลงทุนภายใต้พระราชบัญญัติส่งเสริมการลงทุนที่มีผลบังคับใช้อยู่ในเวลานั้น โดยสำนักงานคณะกรรมการส่งเสริมการลงทุน เป็นผู้รับรองการได้รับการส่งเสริมการลงทุนดังกล่าวแก่บริษัท ในปี พ.ศ.2503 เป็นปีแรกที่สายการผลิตซึ่ง ประกอบไปด้วยเครื่องมือและอุปกรณ์ที่ทันสมัยอย่างครบครัน ได้เริ่มผลิตผลิตภัณฑ์แผ่นเหล็ก ชุบสังกะสีเป็นครั้งแรก ทั้งนี้บริษัทได้ทูลเกล้า ทูลกระหม่อมถวายผลิตภัณฑ์ที่ผลิตได้จำนวน 1,000 แผ่นแรกแด่ พระบาทสมเด็จพระเจ้าอยู่หัวของปวง ชนชาวไทย</p>', 10, 100);
INSERT INTO `stock_brand` VALUES (7, 1, NULL, 'อินทรี', '1588927462025754800.jpg', '', 10, 50);
INSERT INTO `stock_brand` VALUES (8, 1, 1, 'VIVA Board วีว่าบอร์ด', '1539796634087308000.png', '<p>บริษัท วิบูลย์วัฒนอุตสาหกรรม จำกัด ผู้ผลิตผลิตภัณฑ์ วีว่าบอร์ด VIVA BOARD ก่อตั้งขึ้นเมื่อปี 2526 เพื่อนำวัสดุก่อสร้างอเนกประสงค์นี้สู่วงการก่อสร้างไทย และทำการผลิตวู้ดซีเมนต์บอร์ด (Wood Cement Board หรือ Cement Bonded Particle Board) และออกจำหน่ายเป็นครั้งแรกในปี 2529 โดยได้มีการปรับสูตรผสมและดัดแปลงเครื่องจักรและกระบวนการผลิต ให้เข้ากับวัตถุดิบ ภูมิอากาศ และความต้องการของตลาดในประเทศไทย บริษัท วิบูลย์วัฒนอุตสาหกรรม จำกัด ทำการค้นคว้าวิจัยและพัฒนา เพื่อปรับปรุงคุณภาพของผลิตภัณฑ์และพัฒนาการใช้งานอย่างต่อเนื่อง ด้วยความเชี่ยวชาญนี้ วีว่า บอร์ด จึงป็นวู้ดซีเมนต์บอร์ดที่มีคุณภาพดีที่สุดในโลกแบรนด์หนึ่ง นอกจากจะจำหน่ายในประเทศไทยแล้ววีว่า บอร์ด ได้ถูกส่งไปจำหน่ายยังต่างประเทศ เช่น อังกฤษ ฝรั่งเศส ออสเตรเลีย จีน ไต้หวัน ฮ่องกง เกาหลี มาเลเซีย สิงคโปร์ เวียดนาม ลาว สาธารณรัฐอาหรับอิมิเรต และ หลายประเทศในแถบหมู่เกาะแปซิฟิก และ ได้รับความไว้วางใจ เลือกใช้ในโครงการใหญ่ที่มีชื่อเสียงไปทั่วโลก เช่น Venetian &ndash; Macou, Singapore Airport, FCC Tower &ndash; Hong Kong เป็นต้น ผู้ผลิตบอร์ดใช้งานภายนอกปราศจากใยหินรายแรกของประเทศ สู่ระบบการผลิตและก่อสร้างเพื่อธรรมชาติที่สมดุลย์ เพราะตระหนักถึงความสำคัญของธรรมชาติและสิ่งแวดล้อม วีว่า บอร์ด จึงถูกผลิตในกระบวนการผลิตที่ปราศจากสารใยหิน วางจำหน่ายตั้งแต่ปี 2529 นับเป็นผู้ผลิตบอร์ดสำหรับใช้งานภายนอกได้โดยปราศจากใยหินเป็นรายแรกของประเทศไทย วีว่า บอร์ด ผลิตขึ้นจากแนวคิดที่ต้องการหาวัสดุทนแทนไม้ธรรมชาติ ลดการพึ่งพิงทรัพยากรป่าไม้ เพื่อรักษาความสมดุลย์แห่งธรรมชาติ และรังสรรค์ผลิตภัณฑ์ที่มีคุณสมบัติพิเศษที่เหนือกว่า ภายใต้ระบบการผลิตที่เป็นมิตรกับสิ่งแวดล้อม นอกจากนี้ ระบบการก่อสร้างและตกแต่งบ้าน หรืออาคารด้วยวีว่า บอร์ด ยังช่วยให้มีความสะดวกรวดเร็ว สะอาด ลดของเสียที่เกิดขึ้นจากการก่อสร้าง และวัสดุไม่ก่อให้เกิดมลภาวะอันรบกวนความสมบูรณ์ของธรรมชาติ</p>', 30, 50);
INSERT INTO `stock_brand` VALUES (9, 1, NULL, 'SYS สยามยามาโตะ', '1588927884066469000.jpg', '<p>นับจากจุดเริ่มต้นในการเป็นผู้บุกเบิกผลิตเหล็กโครงสร้างรูปพรรณรีดร้อนเพื่อรองรับการขยายตัวของอุตสาหกรรมการก่อสร้าง และทดแทนการนำเข้า ทำให้ SYS มีโอกาสในการสร้างความมั่นคงทางเศรษฐกิจของประเทศ ซึ่งเป็นเวลากว่าหนึ่งทศวรรษที่ SYS ได้เติบโตและพัฒนาจนเป็นผู้ผลิตเหล็กโครงสร้างรูปพรรณรีดร้อนรายใหญ่ที่สุดของประเทศ และมีความมุ่งมั่นที่จะก้าวต่อไปให้เป็นผู้ผลิตเหล็กโครงสร้างรูปพรรณรีดร้อนในภูมิภาคอาเซียน บริษัท เหล็กสยามยามาโตะ จำกัด หรือ SYS (เอส-วาย-เอส) ดำเนินการก่อตั้งในปี 2535 มีวัตถุประสงค์ในการก่อตั้งเพื่อผลิตเหล็กโครงสร้างรูปพรรณรีดร้อน ซึ่งเป็นการร่วมทุนระหว่าง &bull; Yamato Kogyo Co., Ltd. &bull; Mitsui &amp; Co., Ltd. &bull; บริษัท ปูนซิเมนต์ไทย จำกัด (มหาชน) &bull; Sumitomo Corporation (Thailand) Co., Ltd. &bull; Mitsui &amp; Co. (Thailand) Co., Ltd.</p>', 10, 70);
INSERT INTO `stock_brand` VALUES (10, 1, NULL, 'SHERA เฌอร่า', '1588925303012484900.png', '<p>ใน พ.ศ. 2517 บริษัท โอลิมปิคกระเบื้องไทย จํากัด ได้ถูกตั้งขึ้นเพื่อผลิตและจําหน่ายหลังคาไฟเบอร์ซีเมนต์ ภายใต้ แบรนด์ &quot;ห้าห่วง&quot; อันเป็นรากฐานมั่นคง และเป็นแหล่งบ่มเพาะความมุ่งมั่น แรงบันดาลใจ ความเชี่ยวชาญให้กับพนักงาน จากรุ่นสู่รุ่นเพื่อจะเป็นส่วนหนึ่ง ในการสร้างฝันที่จะมีบ้านของคนไทยนับล้านครอบครัวให้เป็นจริงกว่า 38 ปี ของความมุ่งมั่น ได้หล่อหลอมองค์กรให้เติบกล้าขยายกิ่งก้านสาขาเป็นความมั่นคงของครัวเรือน และร่วมสรรค์สร้าง ความเจริญเข้มแข็งให้กับสังคมไทยและขยายก้าวไกลไปสู่ภูมิภาค ณ วันนี้ เราได้เติบใหญ่ ภายใต้แบรนด์ SHERA ที่มิใช่เพียงแค่หลังคา แต่ขยายต้นกล้าจนเจริญงอกงามไปสู่ ผนัง ฝ้าเพดาน งานพื้น และงานเฟอร์นิเจอร์ ด้วยกําลังการผลิตกว่า 1 ล้านตัน และทีมงานที่มีพลังการสร้างสรรค์ มุ่งมั่นพัฒนา ภายใต้เทคโนโลยี SHERA FCS (Fibre Composite Solution) ซึ่งตอบโจทย์ความต้องการที่อยู่อาศัยได้อย่างครบครันและมีสไตล์ อย่างลงตัวจากรากฐานนี้ เราจะมุ่งมั่นพัฒนาอย่างไม่หยุดยั้ง เป็นพลังในการขับเคลื่อนธุรกิจ เป็นมิตรกับสิ่งแวดล้อม สร้างความพร้อมให้กับการสร้างบ้าน และสอดประสานเป็นส่วนหนึ่งของความเข้มแข็งของสังคม</p>', 10, 10);
INSERT INTO `stock_brand` VALUES (11, 1, 1, 'Demo1', '1539799929014903600.png', '<p>Demo1</p>', 30, NULL);
INSERT INTO `stock_brand` VALUES (12, 2, 3, 'SCG เหล็กเส้น', '1540491027003346900.png', '', 10, 30);
INSERT INTO `stock_brand` VALUES (13, 2, 3, 'เสือ', '1541298571049359600.png', '<ul><li><a href=\"/product/detail?id=1544898741052574100\"> เหล็กเส้นกลม SR24 เหล็กข้ออ้อย SD40T BISW บลกท. RB6 RB9 RB12 DB12 DB16 DB20 DB25</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</li></ul>', 10, 10);
INSERT INTO `stock_brand` VALUES (14, 2, 3, 'CPAC ซีแพค', '1540491259001303600.png', '', 10, 20);
INSERT INTO `stock_brand` VALUES (15, 2, 3, 'Q-CON คิวคอน', '1540491282000485500.png', '', 10, 40);
INSERT INTO `stock_brand` VALUES (16, 2, 3, 'SCG กระเบื้องหลังคา', '1540491640079135800.png', '', 10, 60);
INSERT INTO `stock_brand` VALUES (17, 2, 3, 'SCG ยิปซัม', '1540491665018939300.png', '', 10, 50);
INSERT INTO `stock_brand` VALUES (18, 2, 3, 'SCG สมาร์ทบอร์ด', '1540491691052225700.png', '', 10, 70);
INSERT INTO `stock_brand` VALUES (19, 2, 3, 'SCG สมาร์ทวูด', '1540491720002120100.png', '', 10, 80);
INSERT INTO `stock_brand` VALUES (20, 2, 3, 'Cylence', '1540491747005776200.png', '', 10, 110);
INSERT INTO `stock_brand` VALUES (21, 2, 3, 'SCG ท่อเอสซีจี', '1540491773035963900.png', '', 10, 90);
INSERT INTO `stock_brand` VALUES (22, 2, 3, 'SCG แลนด์สเคป', '1540491796079124900.png', '', 10, 100);
INSERT INTO `stock_brand` VALUES (23, 2, 3, 'xxx', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (24, 2, 3, 'xxx2', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (25, 2, 3, 'demo1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (26, 2, 3, 'demo3', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (27, 2, 3, 'demo2', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (28, 2, 3, 'demo4', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (29, 2, 3, 'demo5', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (30, 2, 3, 'demo11', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (31, 2, 3, 'demo11', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541951291005056500, 2, 3, 'demo12', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541951330091583200, 2, 3, 'demo', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541951446032328000, 2, 3, 'Demo1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541951499089221300, 2, 3, 'Demo11', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541951564050562600, 2, 3, 'Demo5', '', '', 30, 10);
INSERT INTO `stock_brand` VALUES (1541951666066115800, 2, 3, 'demo33', '', '', 30, 10);
INSERT INTO `stock_brand` VALUES (1541960062032092000, 2, 9, 'demo1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960139017242400, 2, 9, 'Sck', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960188049806900, 2, 9, 'dsf', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960233067575600, 2, 9, 'xxx', '', '', 30, 40);
INSERT INTO `stock_brand` VALUES (1541960241080200200, 2, 9, 'xxx2', '', '', 30, 30);
INSERT INTO `stock_brand` VALUES (1541960250013103900, 2, 9, 'xxx3', '', '', 30, 10);
INSERT INTO `stock_brand` VALUES (1541960258005432600, 2, 9, 'xxx4', '', '', 30, 20);
INSERT INTO `stock_brand` VALUES (1541960453067870200, 2, 9, 'xxx1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960459058107200, 2, 9, 'xxx2', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960491089747800, 2, 9, 'xxx3', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960536047432700, 2, 9, 'xxx', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960540067826600, 2, 9, 'xxx2', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960623085600600, 2, 9, 'xxx', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960647087753800, 2, 9, 'xxx1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960689015222500, 2, 9, 'xxx1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960694007015400, 2, 9, 'xxx2', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960712060979800, 2, 9, 'xxx3', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960750052053200, 2, 9, 'demo1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960787080415200, 2, 9, 'demo1', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960801068383400, 2, 9, 'demo2', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960851052894800, 2, 9, 'xxx3', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960932037590600, 2, 9, 'demo3', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960947027990600, 2, 9, 'demo2', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1541960980025274000, 2, 9, 'demo3', '', '', 10, NULL);
INSERT INTO `stock_brand` VALUES (1542019612087898100, NULL, NULL, 'demo1', '1542019612087900500.png', '', 10, NULL);
INSERT INTO `stock_brand` VALUES (1542019638058095300, 1, NULL, 'demo2', '1542019638058097400.png', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1543691384038235900, 2, 4, 'BISW ย่อย', '', '', 10, NULL);
INSERT INTO `stock_brand` VALUES (1545917172098454000, 2, 10, 'ไม้ทดแทน เฌอร่า', '', '', 30, NULL);
INSERT INTO `stock_brand` VALUES (1545917257000291700, 2, 10, 'ไม้ทดแทน เฌอร่า', '1549870558020774600.jpg', '<div class=\"row\"><div class=\"col-md-3\"><div class=\"col-md-12\"><ul><li class=\"fr-text-spaced\"><span style=\"color: rgb(0, 0, 0); font-family: Tahoma, Geneva, sans-serif; font-size: 14px;\"><a href=\"/product/detail?id=1546418371030190700\">ไม้ฝาเฌอร่า ลายสัก กลุ่มสีธรรมชาติ</a><br></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1545918083028103900\">ไม้ฝาเฌอร่า ลายสัก กลุ่มสีมาตรฐาน&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/products/stock-product-group/detail?id=1546507592062076000\">ไม้ฝาเฌอร่า ลายสัก กลุ่มสีคลาสิค วู้ด</a> <a href=\"/brand/detail?id=1549696506082728000\"></a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/products/stock-product-group/detail?id=1546564362025650000\">ไม้ฝาเฌอร่า ลายสัก กลุ่มสีพิเศษ</a> <a href=\"/brand/detail?id=1545923960002445000\">&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546564452072110000\">ไม้ฝาเฌอร่า ลายสัก กลุ่มสีพรีเมี่ยม&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546508826076819800\">ไม้ฝาเฌอร่า ลายสัก กลุ่มสีคูลซีรีย์&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546528927031467300\">ไม้ฝาเฌอร่า ลายชัยพฤกษ์ กลุ่มสีธรรมชาติ &nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546828010075495700\">ไม้ฝาเฌอร่า รุ่นสเปลนดิด แพลงค์ ลายชัยพฤกษ์</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546565236069196700\">ไม้ฝาเฌอร่า รุ่นสเปลนดิด แพลงค์ ลายผิวเรียบ</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546565339004190800\">ไม้ฝาเฌอร่า รุ่นโมเดิร์นสแทกเกอร์ ลายผิวเรียบ</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546936105043521400\">ไม้ระแนงเฌอร่า รุ่นขอบตรง (ลายสัก) กว้าง 2 นิ้ว/ 3 นิ้ว</a>&nbsp;<br><br></span></span></span></li></ul></div></div><div class=\"col-md-3\"><div class=\"col-md-12\"><ul><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"https://backend.dconhub.com/product/detail?id=1546936246029411800\">ไม้ระแนงเฌอร่า รุ่นขอบวี (ผิวเรียบ) กว้าง 3 นิ้ว/ 4 นิ้ว</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"https://backend.dconhub.com/product/detail?id=1546936294031804100\">ไม้ระแนงเฌอร่า รุ่นขอบวี (ลานเสี้ยน) กว้าง 3 นิ้ว/ 4 นิ้ว</a><a href=\"/product/detail?id=1546936294031804100\">&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547084441078103200\">ไม้มอบเฌอร่า ผิวเรียบ กลุ่มสีธรรมชาติ&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547084336005476700\">ไม้บัวเฌอร่า ผิวเรียบ กลุ่มสีธรรมชาติ&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547084391002232100\">ไม้จบบัวเฌอร่า ผิวเรียบ กลุ่มสีธรรมชาติ</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547084492086941200\">ไม้บัวลามิเนต ผิวเรียบ รุ่นคลาสสิค</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547084678056291100\">ไม้บัวลามิเนต ผิวเรียบ รุ่นโมเดิร์น&nbsp;</a><a href=\"/product/detail?id=1546831176057707300\"><br></a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546831176057707300\">ไม้เชิงชายเฌอร่า รุ่นขอบบัว EA001 (ผิวเรียบ)&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546831396038173600\">ไม้เชิงชายเฌอร่า รุ่นลบขอบ EA006 (ผิวเรียบ)&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546831668092069400\">ไม้เชิงชายเฌอร่า ผิวเรียบ รุ่นโปร</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547428385096188700\">ไม้บันไดเฌอร่า ลายเสี้ยน : ลูกนอน กลุ่มสีธรรมชาติ&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546936164053219900\">ไม้ระแนงเฌอร่า รุ่นขอบตรง (ผิวเรียบ) กว้าง 3 นิ้ว/ 4 นิ้ว&nbsp;</a><br><br></span></span></span></li></ul></div></div><div class=\"col-md-3\"><ul><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1548728602060380900\">ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายชัยพฤกษ์ รุ่นขอบวี&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1548727627017284300\">ไม้พื้นเฌอร่า ลายเสี้ยนตรง รุ่นขอบวี (SHERA floor plank) กลุ่มสีธรรมชาติ&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1548728665070423000\">ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยนตรง รุ่นขอบวี</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547428318063363600\">ไม้บันไดเฌอร่า ลายชัยพฤกษ์ : ลูกนอน กลุ่มสีธรรมชาติ&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547428528085084400\">ไม้บันไดเฌอร่า ผิวเรียบ : ลูกตั้ง กลุ่มสีธรรมชาติ&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546920249009315500\">ไม้กันตกเฌอร่าลายโรส ผิวเรียบ</a>&nbsp;</span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547106933036728500\">ไม้รั้วเฌอร่า กลุ่มสีธรรมชาติ&nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1547106977067962800\">ไม้รั้วเฌอร่า กลุ่มใหม่ หนา 1.6 &nbsp;</a></span></span></span></li><li><span style=\"font-size: 14px;\"><span style=\"font-family: Tahoma,Geneva,sans-serif;\"><span style=\"color: rgb(0, 0, 0);\"><a href=\"/product/detail?id=1546934664077148900\">ไม้ปิดกันนกเฌอร่า สำหรับกระเบื้องลอนคู่ EA002 (ลายสัก)&nbsp;</a></span></span></span></li><li><span style=\"color: rgb(0, 0, 0); font-family: Tahoma, Geneva, sans-serif; font-size: 14px;\"><a href=\"/product/detail?id=1546934715073315400\">ไม้ปิดกันนกเฌอร่า สำหรับกระเบื้องไตรลอน EA005 (ลายสัก)</a></span></li></ul></div></div>', 10, 10);
INSERT INTO `stock_brand` VALUES (1545923960002445000, 2, 10, 'เฌอร่าบอร์ด', '1549871070039233000.jpg', '<p>บอร์ดทั่วไป</p><ul><li>&nbsp;<a href=\"/product/detail?id=1547780436096578200\">แผ่นฝ้า SHERA BOARD (ผิวเรียบ)</a>&nbsp;</li><li>&nbsp;<a href=\"/product/detail?id=1548147832017289700\">แผ่นฝ้า เฌอร่าบอร์ด &nbsp; Deco Ceilling&nbsp;</a>&nbsp;</li><li><a href=\"/product/detail?id=1547791557032501500\">&nbsp;แผ่นฝ้าระบายอากาศ รุ่นคลาสสิค / โมเดิร์น</a></li><li><a href=\"/product/detail?id=1548130457026405700\">&nbsp;แผ่นฝ้าลาย &nbsp;Deco Ceiling T-bar 3 ลาย&nbsp;</a></li><li>&nbsp;<a href=\"/product/detail?id=1548142388022844500\">แผ่นฝ้า &nbsp;Deco ceilling T-bar ขาวเรียบ&nbsp;</a></li><li>&nbsp;<a href=\"/product/detail?id=1548149420057763100\">แผ่นผนัง รุ่นขอบตรง &nbsp;wall Board (Material Group151)</a>&nbsp;</li><li><a href=\"/product/detail?id=1548149478045354000\">&nbsp;แผ่นผนัง รุ่นขอบลาด 2 ด้าน &nbsp;wall Board (Material Group151)&nbsp;</a></li></ul>', 10, 40);
INSERT INTO `stock_brand` VALUES (1547129402008438200, 1, NULL, 'TATA STEEL ทาทา สติล', '1588927126021311200.jpg', '', 10, 40);
INSERT INTO `stock_brand` VALUES (1547129566047072200, 1, NULL, 'ผลิตภัณฑ์ตราเพชร', '1588926700067600600.jpg', '', 10, 30);
INSERT INTO `stock_brand` VALUES (1547130098042665900, 1, NULL, 'CONWOOD คอนวูด ', '1588925677052555000.jpg', '', 10, 20);
INSERT INTO `stock_brand` VALUES (1547130270030057900, 1, NULL, 'ปูนดอกบัว', '1588927696082141200.jpg', '', 10, 60);
INSERT INTO `stock_brand` VALUES (1549097788060708600, 2, 10, 'หลังคาห้าห่วง', '1549870882053267400.jpg', '', 10, 70);
INSERT INTO `stock_brand` VALUES (1549109648098443500, 2, 10, 'เฌอร่าเพ้นท์', '1549696612054706300.png', '<p>สวยงามตามท้องเรื่อง. สมมุติ</p>', 10, 60);
INSERT INTO `stock_brand` VALUES (1549696506082728000, 2, 10, 'ผลิตภัณฑ์ทดแทนไม้ ประตูวงกบ', '1549870514006467600.jpg', '<ul><li>&nbsp;<a href=\"/product/detail?id=1547715290000763000\">ประตูเฌอร่า &nbsp;G-Series (ผิวเรียบ เว้นร่อง) เจาะรูลูกบิด&nbsp;</a></li><li>&nbsp;<a href=\"/product/detail?id=1547715337030293400\">ประตูเฌอร่า &nbsp;G-Series (ผิวเรียบ เว้นร่อง) ไม่เจาะรูลูกบิด</a>&nbsp;</li><li><a href=\"/product/detail?id=1548818815090656600\">&nbsp;วงกบประตูเฌอร่า ผิวเรียบ รุ่นคลาสสิค กลุ่มสีธรรมชาติ</a>&nbsp;</li><li>&nbsp;<a href=\"/product/detail?id=1548818934067611500\">วงกบหน้าต่างเฌอร่า ผิวเรียบ รุ่นคลาสสิค กลุ่มสีธรรมชาติ </a></li></ul>', 10, 30);
INSERT INTO `stock_brand` VALUES (1551704232055706900, 2, 10, 'ไม้ทดแทน เฌอร่า ไม้ตกแต่ง', '1551707951022189700.png', '<ul><li>&nbsp;<a href=\"/product/detail?id=1546852479055263500\">ไม้เชิงชายน้ำย้อยเฌอร่า สัก ลายบัวหลวง&nbsp;</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</li><li><a href=\"/product/detail?id=1546852017046928500\">&nbsp;ไม้เชิงชายน้ำหยดเฌอร่า เรียบ ลายหัวใจ</a>&nbsp;</li><li>&nbsp;<a href=\"/product/detail?id=1546852520020320800\">ไม้เชิงชายน้ำย้อยเฌอร่า สัก ลายดอกรัก</a>&nbsp;</li><li>&nbsp;<a href=\"/product/detail?id=1547516970083050600\">ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง&nbsp;</a></li><li>&nbsp;<a href=\"/product/detail?id=1546851091081274000\">ไม้เชิงชายน้ำหยดเฌอร่า สัก ลายคลาสสิค</a>&nbsp;</li><li><a href=\"/product/detail?id=1546851412089394100\">&nbsp;ไม้เชิงชายน้ำหยดเฌอร่า เรียบ ลายระฆังทอง</a></li><li><a href=\"/product/detail?id=1546852566058488000\">&nbsp;ไม้เชิงชายน้ำย้อยเฌอร่า สัก ลายทิวลิป</a></li><li><a href=\"/product/detail?id=1546852653055166100\">&nbsp;ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ ลายบานบุรี &nbsp;</a></li><li><a href=\"/product/detail?id=1546852608095141800\">&nbsp;ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ ลายหัวใจ &nbsp;</a></li><li>&nbsp;<a href=\"/product/detail?id=1546851174008734400\">ไม้เชิงชายน้ำหยดเฌอร่า สัก ลายพวงทอง</a>&nbsp;</li><li>&nbsp;<a href=\"/product/detail?id=1546852696092912100\">ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ ลายสร้อยอินทนิล</a>&nbsp;</li><li><a href=\"/product/detail?id=1546850611097754600\">&nbsp;ไม้เชิงชายน้ำหยดเฌอร่า สัก ลายดอกจิก</a>&nbsp;</li><li><a href=\"/product/detail?id=1546928175086540500\">&nbsp; ฉลุช่องลมเฌอร่า สีธรรมชาติ&nbsp;</a></li><li>&nbsp;<a href=\"/product/detail?id=1546920179086591200\">ไม้กันตกเฌอร่าลายลิลลี่ ผิวเรียบ</a> </li></ul>', 10, 20);
INSERT INTO `stock_brand` VALUES (1551705469094719300, 2, 10, 'ไม้อัดเฌอร่า SHERA PLY', '1551707611026949100.jpg', '<ul><li>&nbsp;<a href=\"/product/detail?id=1547083212073217900\">ไม้อัดเอ็นจิเนียร์เฌอร่า กลุ่มสีธรรมชาติ </a></li></ul>', 10, 50);
COMMIT;

-- ----------------------------
-- Table structure for stock_category
-- ----------------------------
DROP TABLE IF EXISTS `stock_category`;
CREATE TABLE `stock_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหมวดสินค้า',
  `type` tinyint(4) DEFAULT NULL COMMENT 'หลักหรือย่อย (1 หลัก 2 ย่อย 3 ย่อยสุด)',
  `category_id` int(11) DEFAULT NULL COMMENT 'รหัสหมวดสินค้าหลัก',
  `name` varchar(100) DEFAULT NULL COMMENT 'ชื่อหมวดสินค้า',
  `icon` varchar(50) DEFAULT NULL COMMENT 'โลโก้',
  `description` text DEFAULT NULL COMMENT 'รายละเอียด',
  `deleted` tinyint(4) DEFAULT NULL,
  `forder` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stock_category
-- ----------------------------
BEGIN;
INSERT INTO `stock_category` VALUES (3, 1, NULL, 'เหล็กเส้นก่อสร้าง', '1588936372013120800.jpg', '<p>เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง&nbsp;</p><p>เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง เหล็กสำหรับงานก่อสร้าง&nbsp;</p>', 10, 5);
INSERT INTO `stock_category` VALUES (4, 1, NULL, 'ปูน', '1588935577020350300.jpg', '<p>ปูน</p>', 10, 8);
INSERT INTO `stock_category` VALUES (5, 1, NULL, 'ซีเมนต์บอร์ด', '1588936665031279500.jpg', '<p>ซีเมนต์บอร์ด</p>', 10, 2);
INSERT INTO `stock_category` VALUES (6, 1, NULL, 'อิฐมวลเบา', '1588935026024928300.jpg', '<p>อิฐมวลเบา</p>', 10, 7);
INSERT INTO `stock_category` VALUES (7, 1, NULL, 'แผ่นซีเมนต์บอร์ด', '', '', 30, 8);
INSERT INTO `stock_category` VALUES (8, 1, NULL, 'กระเบื้องมุง', '1588933432064255300.jpg', '<p>กระเบื้องมุง</p>', 10, 3);
INSERT INTO `stock_category` VALUES (9, 1, NULL, 'ฉนวนกันความร้อน', '', '', 30, 9);
INSERT INTO `stock_category` VALUES (10, 1, NULL, 'ไม้เทียม ไฟเบอร์ซีเมนต์', '', '', 30, 10);
INSERT INTO `stock_category` VALUES (11, 1, NULL, 'ไม้เทียม ไฟเบอร์ซีเมนต์', '', '', 30, 11);
INSERT INTO `stock_category` VALUES (12, 1, NULL, 'ท่อพีวีซี', '', '', 30, 11);
INSERT INTO `stock_category` VALUES (13, 1, NULL, 'ไม้ทดแทน', '1588931333058160500.jpg', '<p><a class=\"fr-file\" href=\"https://storage.dconhub.com/files/5c2f4a43d65c0.pdf\" target=\"_blank\">shera-ใบสั่งซื้อเพื่อรับโรงงาน.pdf</a></p><p>ปัจจุบัน 1 2 3 4 5 6<u>&nbsp;7 8&nbsp;</u>9</p>', 10, 1);
INSERT INTO `stock_category` VALUES (14, 1, NULL, 'สินค้าทุกหมวดหมู่', '', '', 30, 14);
INSERT INTO `stock_category` VALUES (15, 2, 3, 'เหล็กเส้น', '', '', 10, 1);
INSERT INTO `stock_category` VALUES (16, 2, 3, 'เหล็กรูปพรรณรีดเย็น', '', '', 30, 2);
INSERT INTO `stock_category` VALUES (17, 2, 3, 'เหล็กรูปพรรณรีดร้อน', '', '', 30, 3);
INSERT INTO `stock_category` VALUES (18, 2, 3, 'เหล็กอื่นๆ', '', '', 30, 4);
INSERT INTO `stock_category` VALUES (19, 2, 4, 'ปูน', '', '', 10, 17);
INSERT INTO `stock_category` VALUES (20, 2, 4, 'คอนกรีต', '', '', 30, 18);
INSERT INTO `stock_category` VALUES (21, 2, 4, 'ปูนตราเสือ', '', '', 30, 19);
INSERT INTO `stock_category` VALUES (22, 2, 4, 'ปูนเสือมอร์ต้า', '', '', 30, 20);
INSERT INTO `stock_category` VALUES (23, 2, 4, 'เสือเดคอร์', '', '', 30, 21);
INSERT INTO `stock_category` VALUES (24, 2, 5, 'วัสดุไฟเบอร์ซีเมนต์', '', '', 30, 3);
INSERT INTO `stock_category` VALUES (25, 2, 5, 'วัสดุเซรามิค', '', '', 30, 2);
INSERT INTO `stock_category` VALUES (26, 2, 5, 'ซีเมนต์บอร์ด', '', '', 10, 1);
INSERT INTO `stock_category` VALUES (27, 2, 5, 'วัสดุเหล็ก', '', '', 30, 4);
INSERT INTO `stock_category` VALUES (28, 2, 6, 'อิฐมวลเบา', '', '', 30, 2);
INSERT INTO `stock_category` VALUES (29, 2, 6, 'อิฐขาว', '', '', 30, 3);
INSERT INTO `stock_category` VALUES (30, 2, 6, 'อิฐมวลเบา', '', '', 10, 1);
INSERT INTO `stock_category` VALUES (31, 2, 6, 'อิฐบล็อก', '', '', 30, 4);
INSERT INTO `stock_category` VALUES (32, 2, 7, 'บล็อกแก้ว', '', '', 10, 30);
INSERT INTO `stock_category` VALUES (33, 2, 6, 'บล็อกแก้ว', '', '', 30, 5);
INSERT INTO `stock_category` VALUES (34, 2, 7, 'งานพื้น', '', '', 10, 32);
INSERT INTO `stock_category` VALUES (35, 2, 7, 'งานผนัง', '', '', 10, 33);
INSERT INTO `stock_category` VALUES (36, 2, 7, 'งานฝ้า', '', '', 10, 34);
INSERT INTO `stock_category` VALUES (37, 2, 8, 'กระเบื้องมุง', '', '', 10, 35);
INSERT INTO `stock_category` VALUES (38, 2, 8, 'งานเฉพาะทาง', '', '', 30, 36);
INSERT INTO `stock_category` VALUES (39, 2, 8, 'งานฝ้าทีบาร์', '', '', 30, 37);
INSERT INTO `stock_category` VALUES (40, 2, 8, 'โครงคร่าว', '', '', 30, 38);
INSERT INTO `stock_category` VALUES (41, 2, 9, 'ฉนวนงานบ้าน', '', '', 10, 39);
INSERT INTO `stock_category` VALUES (42, 2, 9, 'ฉนวนหุ้มท่ออากาศ', '', '', 10, 40);
INSERT INTO `stock_category` VALUES (43, 2, 9, 'ฉนวนงานหลังคา', '', '', 10, 41);
INSERT INTO `stock_category` VALUES (44, 2, 9, 'งานบุท่อปรับอากาศ', '', '', 10, 42);
INSERT INTO `stock_category` VALUES (45, 2, 10, 'งานผนัง', '', '', 10, 43);
INSERT INTO `stock_category` VALUES (46, 2, 10, 'งานพื้น', '', '', 10, 44);
INSERT INTO `stock_category` VALUES (47, 2, 10, 'งานตกแต่ง', '', '', 10, 45);
INSERT INTO `stock_category` VALUES (48, 2, 10, 'งานหลังคา', '', '', 10, 46);
INSERT INTO `stock_category` VALUES (49, 2, 12, 'งานประปา', '', '', 10, 47);
INSERT INTO `stock_category` VALUES (50, 2, 12, 'งานน้ำร้อน', '', '', 10, 48);
INSERT INTO `stock_category` VALUES (51, 2, 12, 'งานเดินสายไฟ', '', '', 10, 49);
INSERT INTO `stock_category` VALUES (52, 2, 12, 'ถังพลาสติก', '', '', 10, 50);
INSERT INTO `stock_category` VALUES (53, 2, 13, 'บล็อกปูถนน', '', '', 30, 2);
INSERT INTO `stock_category` VALUES (54, 2, 13, 'ไม้ทดแทน', '', '', 10, 1);
INSERT INTO `stock_category` VALUES (55, 2, 13, 'หญ้าเทียม', '', '', 30, 4);
INSERT INTO `stock_category` VALUES (56, 2, 13, 'ขอบคันหิน', '', '', 30, 3);
INSERT INTO `stock_category` VALUES (57, 2, 15, 'new57dsd', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (58, 2, 15, 'new5111df', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (59, 2, 15, 'new59', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (60, 2, 15, 'new6222a', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (61, 2, 16, 'New Item', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (62, 2, 16, 'New Item', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (63, 2, 15, 'New Item', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (64, 2, 15, 'New Item1', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (65, 2, 16, 'New Item', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (66, 2, 18, 'New Item', NULL, NULL, 30, 64);
INSERT INTO `stock_category` VALUES (67, 2, 18, 'New Item', NULL, NULL, 30, 65);
INSERT INTO `stock_category` VALUES (68, 2, 17, 'New Item', NULL, NULL, 30, 66);
INSERT INTO `stock_category` VALUES (69, 2, 17, 'New Item', NULL, NULL, 30, 67);
INSERT INTO `stock_category` VALUES (70, 2, 17, 'New Item', NULL, NULL, 30, 68);
INSERT INTO `stock_category` VALUES (71, 2, 16, 'New Item', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (72, 2, 18, 'New Item', NULL, NULL, 30, 70);
INSERT INTO `stock_category` VALUES (73, 2, 17, 'New Item', NULL, NULL, 30, 71);
INSERT INTO `stock_category` VALUES (74, 2, 15, 'New Item', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (75, 2, 15, 'New Item1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (76, 2, 16, 'New Item', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (77, 2, 18, 'New Item', NULL, NULL, 30, 71);
INSERT INTO `stock_category` VALUES (78, 2, 23, 'New Item', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (79, 2, 23, 'New Item', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (80, 2, 23, 'New Item 3', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (81, 2, 23, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (82, 2, 23, 'New Item 5', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (83, 2, 23, 'New Item 6', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (84, 2, 56, 'New Item 1', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (85, 2, 56, 'New Item 2', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (86, 2, 15, 'New Item 9', NULL, NULL, 30, 10);
INSERT INTO `stock_category` VALUES (87, 2, 15, 'New Item 10', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (88, 2, 53, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (89, 2, 53, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (90, 2, 53, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (91, 2, 53, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (92, 2, 25, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (93, 2, 24, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (94, 2, 28, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (95, 2, 29, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (96, 2, 30, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (97, 2, 31, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (98, 2, 33, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (99, 2, 15, 'New Item 11', NULL, NULL, 30, 11);
INSERT INTO `stock_category` VALUES (100, 2, 15, 'New Item 12', NULL, NULL, 30, 12);
INSERT INTO `stock_category` VALUES (101, 2, 15, 'New Item 13', NULL, NULL, 30, 13);
INSERT INTO `stock_category` VALUES (102, 2, 15, 'New Item 14', NULL, NULL, 30, 14);
INSERT INTO `stock_category` VALUES (103, 2, 49, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (104, 2, 49, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (105, 2, 19, 'demo9', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (106, 2, 15, 'New Item 15', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (107, 2, 15, 'New Item 16', NULL, NULL, 30, 15);
INSERT INTO `stock_category` VALUES (108, 2, 15, 'New Item 15', NULL, NULL, 30, 15);
INSERT INTO `stock_category` VALUES (109, 2, 15, 'New Item 15', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (110, 2, 15, 'New Item 15', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (111, 2, 16, 'New Item 58', NULL, NULL, 30, 58);
INSERT INTO `stock_category` VALUES (112, 2, 16, 'New Item 57', NULL, NULL, 30, 57);
INSERT INTO `stock_category` VALUES (113, 2, 16, 'New Item 56', NULL, NULL, 30, 56);
INSERT INTO `stock_category` VALUES (114, 2, 16, 'New Item 55', NULL, NULL, 30, 55);
INSERT INTO `stock_category` VALUES (115, 2, 16, 'New Item 54', NULL, NULL, 30, 54);
INSERT INTO `stock_category` VALUES (116, 2, 16, 'New Item 53', NULL, NULL, 30, 53);
INSERT INTO `stock_category` VALUES (117, 2, 17, 'New Item 72', NULL, NULL, 30, 65);
INSERT INTO `stock_category` VALUES (118, 2, 17, 'New Item 72', NULL, NULL, 30, 64);
INSERT INTO `stock_category` VALUES (119, 2, 34, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (120, 2, 34, 'New Item 2', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (121, 2, 34, 'New Item 2', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (122, 2, 34, 'New Item 2', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (123, 2, 19, 'demo8', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (124, 2, 19, 'demo7', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (125, 2, 19, 'Demo6', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (126, 2, 19, 'Demo5', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (127, 2, 19, 'Demo4', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (128, 2, 20, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (129, 2, 20, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (130, 2, 20, 'Demo', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (131, 2, 20, 'Demo2', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (132, 2, 21, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (133, 2, 22, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (134, 2, 26, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (135, 2, 27, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (136, 2, 37, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (137, 2, 38, 'ทดสอบ', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (138, 2, 39, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (139, 2, 40, 'demo', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (140, 2, 55, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (141, 2, 54, 'xxx', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (142, 2, 41, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (143, 2, 42, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (144, 2, 43, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (145, 2, 44, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (146, 2, 17, 'New Item 72', NULL, NULL, 30, 72);
INSERT INTO `stock_category` VALUES (147, 2, 53, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (148, 2, 36, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (149, 2, 36, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (150, 2, 35, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (151, 2, 35, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (152, 2, 45, 'New Item 1', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (153, 2, 46, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (154, 2, 47, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (155, 2, 48, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (156, 2, 51, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (157, 2, 52, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (158, 2, 50, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (159, 2, 50, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (160, 2, 51, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (161, 2, 52, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (162, 2, 55, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (163, 2, 54, 'xxx', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (164, 2, 54, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (165, 2, 54, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (166, 2, 54, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (167, 2, 37, 'กำ', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (168, 2, 38, 'ทดสอบ', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (169, 2, 37, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (170, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (171, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (172, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (173, 1, NULL, 'ทดสอบหหห', '1540730921002900200.jpg', '<p>demos</p>', 30, 1);
INSERT INTO `stock_category` VALUES (174, 2, 173, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (175, 2, 174, 'New Item 1', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (176, 2, 174, 'New Item 2', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (177, 2, 174, 'New Item 3', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (178, 2, 174, 'New Item 4', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (179, 2, 174, 'New Item 5', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (180, 2, 174, 'New Item 6', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (181, 2, 174, 'New Item 7', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (182, 2, 174, 'New Item 8', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (183, 2, 30, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (184, 2, 30, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (185, 2, 30, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (186, 2, 30, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (187, 2, 30, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (188, 2, 30, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (189, 2, 30, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (190, 2, 30, 'New Item 9', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (191, 2, 30, 'New Item 10', NULL, NULL, 30, 10);
INSERT INTO `stock_category` VALUES (192, 2, 30, 'New Item 11', NULL, NULL, 30, 11);
INSERT INTO `stock_category` VALUES (193, 2, 26, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (194, 2, 26, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (195, 2, 26, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (196, 2, 26, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (197, 2, 26, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (198, 2, 26, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (199, 2, 26, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (200, 2, 26, 'งานฝ้า', '1588937553044062500.jpg', '', 10, 9);
INSERT INTO `stock_category` VALUES (201, 2, 26, 'งานผนัง', '1588937668022953800.jpg', '', 10, 10);
INSERT INTO `stock_category` VALUES (202, 2, 25, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (203, 2, 25, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (204, 2, 25, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (205, 2, 25, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (206, 2, 25, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (207, 2, 25, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (208, 2, 25, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (209, 2, 24, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (210, 2, 24, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (211, 2, 24, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (212, 2, 24, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (213, 2, 24, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (214, 2, 24, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (215, 2, 24, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (216, 2, 27, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (217, 2, 27, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (218, 2, 27, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (219, 2, 27, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (220, 2, 27, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (221, 2, 27, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (222, 2, 27, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (223, 2, 27, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (224, 2, 17, 'New Item 73', NULL, NULL, 30, 73);
INSERT INTO `stock_category` VALUES (225, 2, 17, 'New Item 74', NULL, NULL, 30, 74);
INSERT INTO `stock_category` VALUES (226, 2, 17, 'New Item 75', NULL, NULL, 30, 75);
INSERT INTO `stock_category` VALUES (227, 2, 17, 'New Item 76', NULL, NULL, 30, 76);
INSERT INTO `stock_category` VALUES (228, 2, 17, 'New Item 77', NULL, NULL, 10, 77);
INSERT INTO `stock_category` VALUES (229, 2, 16, 'New Item', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (230, 2, 16, 'New Item 76', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (231, 2, 16, 'New Item 77', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (232, 2, 16, 'New Item 78', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (233, 2, 16, 'New Item 79', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (234, 2, 15, 'New Item 16', NULL, NULL, 30, 16);
INSERT INTO `stock_category` VALUES (235, 2, 15, 'ตะแกรง ไวร์เมช', '', '<h1>เหล็กตะแกรง ไวร์เมช ราคาถูก</h1><p>เหล็กตะแกรง ไวร์เมช Wire Mesh ไวร์เมด ไวร์เมท วายเมด ราคาถูก</p><h2>การใช้เหล็กตะแกรงไวร์เมช&nbsp;</h2><p>การใช้เหล็กตะแกรง ไวร์เมช หรือเรียก ไวร์เมด วายเมด ไวร์เมท ตามหลัก คือการเสริมเหล็กเส้น เพื่อรับแรงดึงให้กับโครงสร้างนั้นๆ จะช่วยลดการแตกเสียหายของพื้นผิว และสามารถยึดให้คอนกรีตมีความแข็งแรงมากยิ่งขึ้น เหล็กไวร์เมชมีการผลิตหลายรูปแบบ ปัจจุบันนิยมใช้การผลิตแบบเชื่อมต่อไฟฟ้า อาร์คเชื่อมติดกัน ทำให้จุดตัดเป็นจุดหลอมละลายเป็นเนื้อเดียวกัน ตัววัสดุผลิตจากลวดเหล็กรีดเย็น Cold Drawn Steel Wire &nbsp;แล้วทอต่อกันเป็นผืน สามารถสั่งเป็นแผล หรือม้วนได้ ข้อดีของไวร์เมชสำเร็จรูปคือ ประหยัดเวลาการผูกเหล็กลวด เหล็กเส้นธรรมดา ประหยัดค่าแรงได้เป็นอย่างดี&nbsp;</p><p>ข้อดีคือ ประหยัด ไม่เปลืองเศษเหล็ก ลดขั้นตอนการก่อสร้าง ขนส่งขนย้ายสะดวก ไม่ต้เองเสียเวลาในการผูก แข็งแรงสม่ำเสมอ ลดปัญหาฝีมือขาดแคลนหน้าไซท์งานได้เป็นอย่างดี</p><h3>การใช้งานไวร์เมช&nbsp;</h3><p>เหล็กตะแกรงไวร์เมช ใช้เป็นโครงสร้างคอนกรีตสำหรับงานพื้นอาคาร โรงงาน ถนน เป็นต้น&nbsp;</p><h2>วิธีการเลือกซื้อเหล็กไวร์เมช วายเมท</h2><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/wiremesh/d314c3b65e8e9797dedef55dc10f6b47\" alt=\"wiremesh,เหล็กไวร์เมช,เหล็กวายเมด,เหล็กวายเมช,เหล็กวายเมท,เหล็กไวร์เมด,เหล็กวายเมช,เหล็กไวร์เมท\" class=\"fr-fic fr-dii\"></figure><h3>ข้อดีของการใช้เหล็กตะแกรงไวร์เมช&nbsp;</h3><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/wiremesh/936f181dce1895ccfad7a6ac7127e68c\" alt=\"wiremesh,ไวร์เมช,วายเหมด,วายเมช,เหล็กวายเมด,ราคาถูก,แผ่นตะแกรงไวร์เมชดีกว่าผูกเหล็กทั่วไปอย่างไร\" class=\"fr-fic fr-dii\"></figure><p><br></p><ul><li>สามารถเลือกขนาด ผืนตะแกรงเหล็กวายเมช ได้ตามต้องการ</li><li>ไม่ต้องตัด ดัด และผูกเหล็ก จำนวนมาก ก่อนเทคอนกรีต ทำให้ช่วยลดค่าแรงงานที่ต้องใช้ลง และประหยัดเวลาขึ้นอย่างเห็นได้ชัด</li><li>ไม่ต้องใช้ ความชำนาญพิเศษในการวางเหล็กตะแกรง จึงเป็นการลดปัญหา ฝีมือช่างในสนาม</li><li>เนื่องจากมีขนาด และระยะที่แน่นอน จึงทำให้การตรวจสอบง่าย ควบคุมง่าย และสะดวกในการใช้งาน</li><li>การก่อสร้างรวดเร็วขึ้น เนื่องจากใช้แรงงานน้อยลง การตรวจสอบง่าย ต่อการขนส่ง และเคลื่อนย้าย เนื่องจากมีลักษณะ เป็นแผงซึ่งสามารถถูกตัดความยาวได้ตามต้องการ</li><li>ง่ายต่อการควบคุม ตรวจสอบปริมาณวัสดุในสนาม</li></ul><h3>มอก. ที่เกี่ยวข้องกับ เหล็กตะแกรงวายเมช&nbsp;</h3><ul><li>มอก.747-2531 ลวดเหล็กกล้าดึงเย็นเสริมคอนกรีต</li><li>มอก.943-2533 ลวดเหล็กกล้าข้ออ้อยดึงเย็นเสริมคอนกรีต&nbsp;</li><li>มอก.737-2549 &nbsp;</li></ul><h2>ตารางน้ำหนัก ตะแกรงไวร์เมช</h2><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/wiremesh/9d0467de790f57a79b98595779527a13\" alt=\"ตารางไวร์เมช,ตารางน้ำหนักตะแกรงไวร์เมช\" class=\"fr-fic fr-dii\"></figure><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/wiremesh/b5bf6f990fb83d73cb2456e7c2bf6a22\" alt=\"เหล็กไวร์เมช\" class=\"fr-fic fr-dii\"></figure><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/wiremesh/faa7960a68a69cf455627b4e2f24838a\" alt=\"เหล็กวายเมท,ไวร์เมช,ไวเมท,ราคาถูก,\" class=\"fr-fic fr-dii\"></figure><p><br></p><p><br></p><p><button data-ga-category=\"ProductTypes\" data-ga-label=\"d_productType_productTypeContent_hideDetail\" name=\"button\" type=\"submit\">ซ่อนรายละเอียด</button></p><p><br></p>', 30, 6);
INSERT INTO `stock_category` VALUES (236, 2, 15, 'New Item 18', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (237, 2, 15, 'New Item 19', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (238, 2, 15, 'New Item 20', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (239, 2, 15, 'เหล็กเส้นกลม ข้ออ้อย', '', '<h1>เหล็กเส้นกลม เหล็กข้ออ้อย มอก. ราคาถูก ราคาโรงงาน</h1><p>เหล็กเส้นกลม เหล็กข้ออ้อย มอก. โรงใหญ่ เหล็กเต็ม ราคาถูก</p><h2>ด่วน อัพเดท 1 พ.ย. 61 ราคาเหล็ก เปิด 18.90 บาท+VAT7% ถ้า 30 ตัน มีราคาพิเศษ สำหรับบางขนาดเท่านั้น สถานการณ์วัตถุดิบค่าเงินบาทแข็งค่าขึ้นเช้านี้ บิลเล็ตแม้ต่อหน่วยราคาสูงขึ้น แต่ต้นทุนเป็นบาท ต่ำลง</h2><h2>แนวโน้ม ราคาเหล็ก เหล็กข้ออ้อย SD40T&nbsp;</h2><p>30 ต.ค. 61 เหล็กเส้น เหล็กข้ออ้อย ปรับราคาลดลงเล็กน้อย สวนกระแสต้นทุนน้ำมัน และต้นทุนค่าเงินบาทอ่อน</p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/26a19e6de520e6fef53fd04acf04645d\" alt=\"ราคาเหล็กวันนี้,ราคาถูก,แนวโน้มราคาเหล็กเส้น,ถูกจริง,ราคาเหล็ก\" class=\"fr-fic fr-dii\"></figure><p><br></p><h2>แนวโน้ม ราคาเหล็ก บิลเล็ต วันนี้&nbsp;</h2><p>1 พ.ย. 61 ราคาเหล็กบิลเล็ตวันนี้ ปรับตัวลดลง เพราะค่าเงินแข็งขึ้น ต้นทุนต่ำลง&nbsp;<a href=\"https://www.onestockhome.com/th/items/18128058/steel-billet\" target=\"_self\">ดูราคาบิลเล็ท ที่นี่</a></p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/3ca568f67d44171a025ae85f0256a694\" alt=\"ราคาเหล็กบิลเล็ต,ราคาเหล็ก,บิลเล๊ท\" class=\"fr-fic fr-dii\"></figure><p><br></p><p><br></p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/23325b8836d8d7893339b4a5fb71a8ef\" alt=\"เหล็กข้ออ้อย,ราคาถูก,deformed bars,db,ถูก,ข้ออ้อย,ปล้องอ้อย\" class=\"fr-fic fr-dii\"></figure><p><br></p><h1>เหล็กเส้นกลม มอก. (Round Bars RB) ราคาถูก</h1><p>เหล็กเส้นกลม มอก. ที่ผลิต ตามมาตรฐาน มอก. 24-2548 กำหนดให้ เหล็กเส้นกลม ที่มีชั้นคุณภาพ SR24 ซึ่งหมายถึงเหล็กต้องมีกำลังจุดคลากไม่ต่ำกว่า 2,400 กิโลกรัม/ตารางเซนติเมตร ขนาดของเหล็กมีตั้งแต่ 6มม. ถึง 25 มม. ส่วนความยาว มาตรฐาน คือ 10 ม. และ 12ม. หรือสามารถสั่งดัดพิเศษตามแบบที่ต้องการได้ เหล็กขนาด 6มม. และ 9มม. มักถูกใช้เป็นเหล็กปลอกในคานหรือในเสา ส่วนเหล็กขนาด 12มม. ขึ้นไป มักจะถูกใช้ในงาน เหล็กเสริมแกนในงานคอนกรีต เพื่อเพิ่มความแข็งแรงให้กับโครงสร้างนั้นๆ</p><h1>เหล็กข้ออ้อย มอก. (Deformed Bars DB) ราคาถูก</h1><p>เหล็กข้ออ้อย มีลักษณะ ผิวเหล็ก เป็นปล้องๆ คล้ายๆอ้อย จึงเรียกว่า เหล็กข้ออ้อย ตามมาตรฐาน มอก. 24-2536 กำหนดให้ เหล็กข้ออ้อย มีชั้นคุณภาพหลายชั้น เช่น SD30, SD40, SD50 และ SD60 ซึ่ง SD30 จะหมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 3,000 กิโลกรัม/ตารางเซนติเมตร หรือ SD40 หมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 4,000 กิโลกรัม/เซนติเมตร ขนาดของเหล็กมีตั้งแต่ 10มม. ถึง 40 มม. แต่ที่นิยมใช้สำหรับงานก่อสร้างบ้านเราคือขนาด 12มม. ถึง 25 มม. ความยาวมาตรฐานคือ 10ม. และ 12มม. เหล็กข้ออ้อย จะใช้ในงานก่อสร้างที่ต้องรับน้ำหนักมากๆ</p><figure><img data-fr-image-pasted=\"true\" alt=\"ภาพตัดเหล็กข้ออ้อย เหล็กเต็ม\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/76323991/add6182fbd93d6c4ae30c3512107d0ed\" class=\"fr-fic fr-dii\"></figure><h2>เหล็กเต็ม ดูได้อย่างไร</h2><p>ตัดเหล็กที่ต้องการวัด ความยาว 1 เมตร โดยใช้เครื่องชั่งที่ละเอียด 1 กรัม จะได้น้ำหนักเป็น กิโลกรัมต่อเมตร แล้วนำมาเปรียบเทียบกับตารางที่ มอก. กำหนด ตัวอย่างเช่น เหล็กข้ออ้อย 12 มม.น้ำหนักต่อเมตร 0.888 น้ำหนักความคลาดเคลื่อนของมวลต่อเมตรที่มอก.ยอมให้เท่ากับ + 5 และ-5 จะมีค่าอยู่ระหว่าง 1.93-0.843 ถือว่าเป็น เหล็กเต็ม&nbsp;</p><h2>อะไรคือ เหล็กเส้นกลม รีดซ้ำ? โปรดระวัง!&nbsp;</h2><p>หลายคนคงเคยได้ยินว่าท้องตลาด มีการจำหน่าย เหล็กเส้นกลม รีดซ้ำ เหล็กประเภทนี้ แม้จะมี มอก.รับรอง เพราะเป็นเหล็กที่ได้จากการนำเศษเหล็กไปหลอมแล้วรีดออกมาใหม่ จะมีสัญลักษณ์ว่า SRR24 มักจะใช้ได้กับงานเหล็กปลอกเท่านั้น แต่จะมีปัญหาคือ มีกำลังจุดคลากต่ำมาก</p><h2>ลักษณะเหล็กที่ดี มีคุณภาพ ควรมีข้อพิจารณาสำคัญ 2 หลักการใหญ่</h2><h3>การเลือก เหล็กเส้น SR24 เหล็กข้ออ้อย SD40 ทางผิวเหล็ก</h3><ul><li>เหล็กเส้นกลม ต้องผิวเรียบเกลี้ยง ไม่มีปีก ลุกคลื่น หน้าตัดกลม ไม่เบี้ยว ไม่มีรอยปริแตก</li><li>เหล็กข้ออ้อย ต้องมีบั้งระยะเท่ากัน สม่ำเสมอตลอดทั้งเส้น</li></ul><h3>การเลือก เหล็กเส้น SR24 เหล็กข้ออ้อย SD40 เส้นผ่านศูนย์กลางและน้ำหนัก ที่ได้มาตรฐาน</h3><ul><li>เมื่อดัดโค้ง งอ ต้องไม่ปริแตก หักง่าย</li><li>เช่น เหล็กเส้นกลม SR-24 ขนาดบนเนื้อเหล็ก 9 มม. เมื่อวัดเส้นผ่านศูนย์กลาง ต้องได้ 9 มม. ชั่งน้ำหนักต้องได้ 0.499 กก. ต่อความยาว 1 เมตร และความยาว เหล็กเส้นกลม มาตรฐานทั้งเส้นอยู่ที่ 10 เมตร</li><li>เหล็กต้องไม่เป็นสนิมขุมกินเข้าไปในเนื้อเหล็ก หมายเหตุ แต่ไม่ต้องวิตกกังวลที่เห็น ผิวเหล็กเป็นสนิม เพราะเป็นเรื่องปกติตามสภาพธรรมชาติร้อนชื้นของประเทศไทย &nbsp;</li></ul><h2>การผลิต เหล็กเส้น เหล็กข้ออ้อย</h2><p>การผลิตเหล็กเส้น เกิดจากการป้อนเศษเหล็ก ปูนขาว และถ่านโค๊กที่มีคุณภาพในประมาณที่เหมาะสมเข้าเตาอาร์คไฟฟ้า EAF ในระหว่างการหลอมเหล็กที่ได้ จะผ่านกรรมวิธีทางเคมี และความร้อนเพื่อปรุงส่วนผสม เมื่อน้ำเหล็กมีอุณหภูมิและส่วนผสมทางเคมีที่ถูกต้อง หลังจากการตรวจสอบจากห้องทดลองแล้ว น้ำเหล็กจะถูกส่งมายังเครื่องหล่อแบบต่อเนื่อง เพื่อผลิตบิลเล็ตที่มีคุณภาพสูงต่อไปบิลเล็ตที่ได้นี้ จะถูกนำเข้าตาอบที่อุณหภูมิสูง 1050 องศาเซลเซียส เพื่อปรับสภาพเนื้อเหล็กที่สามารถถูกรีดลดขนาดตามต้องการได้</p><h2>โลหะวิทยาของ เหล็กกล้า เพื่อทำเหล็กเส้น เหล็กข้ออ้อย มอก.</h2><p>เหล็กเส้นที่ผลิตในประเทศไทยนั้น ในเชิงวิชาการจัดได้ว่าอยู่ในหมวดเหล็กกล้าคาร์บอน ซึ่งเป็นเหล็กที่ได้คุณสมบัติการใช้งานจากธาตุผสมเพียง 3 ธาตุ อันได้แก่ คาร์บอน ซิลิกอน และ แมงกานีส นอกจากเหล็กกล้าคาร์บอนแล้ว เหล็กกลุ่มอื่นๆ ที่สำคัญได้แก่ เหล็กกล้าเครื่องมือและเหล็กกล้าผสม มีธาตุผสมของโครเมี่ยม นิกเกิล วาเนเดียม เหล็กกล้าความเร็วสูง อันได้แก่ เหล็กกล้าสำหรับงานเชื่อม ที่มีแมงกานีสสูง เป็นต้นเหล็กกล้าคาร์บอนที่ผลิตในประเทศไทย สามารถแบ่งย่อยได้เป็นสองกลุ่ม อันได้แก่ เหล็กกล้าที่มีธาตุคาร์บอนน้อยกว่า 0.25% เหล็กกล้าคาร์บอนต่ำนี้ นำมาทำเหล็กลวดและเหล็กเส้น กลุ่มที่สองนี้ได้แก่ เหล็กกล้าคาร์บอนปานกลาง มีคาร์บอนระหว่าง 0.25-0.35% เหล็กกลุ่มนี้เหมาะที่จะนำไปทำเหล็กข้ออ้อย</p><h3>ข้อกำหนดการใช้งานของ เหล็กกล้าคาร์บอน สำหรับเหล็กเส้น เหล็กข้ออ้อย มอก.</h3><p>โดยจะแบ่งได้เป็นสัดส่วนดังนี้&nbsp;</p><ol><li>ส่วนผสมและอัตราส่วนการผสมของคาร์บอน ซิลิกอน แมงกานีส และในบางกรณีมีธาตุวานาเดียมเพื่อเพิ่มประสิทธิภาพให้ความแข็งแรง แต่ขณะเดียวกัน ก็จะลดการยืดตัวของ เหล็กเส้นกลม เหล็กข้ออ้อย เช่นกัน ในขณะที่แมงกานีสจะมีผลในการเพิ่มแรงดึงสูงสุดและการยืดตัว อย่างไรก็ตาม การปรับปริมาณของธาตุทั้งสาม ต้องให้กิดความสมดุล มิฉะนั้นจะทำให้เหล็กไม่มีคุณสมบัติตามที่ต้องการ</li><li>คุณภาพของเนื้อ เหล็ก ระหว่างการหลอม และเท เป็นแท่ง เป็นส่วนสำคัญขั้นที่สอง เพื่อให้ได้เหล็กแท่งเนื้อสะอาด มีขนาดผลึก และการกระจายตัวทางเคมีที่สม่ำเสมอ</li><li>ประสิทธิภาพและวิศวกรรมของเครื่องรีดและการควบคุมการรีด เหล็กเส้น เหล็กข้ออ้อย โดยทางโรงงานเลือกใช้นวัตกรรมของเครื่องจักรสำหรับศตวรรษนี้ อันได้แก่เครื่องจักรทั้งชุด ควบคุมด้วยเครื่องคอมพิวเตอร์ แท่นรีด เป็นระบบ H-V และมีระบบการปรับลดอุณหภูมิของเหล็กที่แม่นยำ</li></ol><h3>ใบ Certificate มอก.&nbsp;สำหรับ เหล็กเส้น เหล็กข้ออ้อย</h3><figure><img data-fr-image-pasted=\"true\" alt=\"ใบ มอก. เหล็ก\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/76323991/fedc154d97ab7f0b748a5638f7c39827\" class=\"fr-fic fr-dii\"></figure><h2>เหล็ก ข้ออ้อย&nbsp;SD40 ต่างกับ SD40T อย่างไร?</h2><p>เหล็ก SD40 เป็นเหล็กเดิมที่ใช้กันมานาน ส่วนเหล็ก ข้ออ้อย SD40T ผลิตจากกระบวนการ Thermal Treatment ซึ่งต่างประเทศเรียกเหล็กเหล่านี้ว่า เหล็ก TMT บ้านเราเรียก tempt core ซึ่งใช้กระบวนการชุบแข็งด้วยความร้อน ปัจจุบัน ในการผลิตจะมีการใช้ spray สเปรย์น้ำลงบนเหล็กที่เพิ่งรีดขณะร้อนแดง ทำให้อุณหภูมิลดลงอย่างรวดเร็ว ดังนั้น เนื้อเหล็กจะไม่แข็งเท่ากันอีกต่อไป การผลิตเหล็ก SD40T นี้จะทำให้เนื้อเหล็ก ตรงกลางจะนิ่มและยืดหยุ่นได้ดี รอบๆจะมีวงแหวน เกิดจากการชุบแข็ง ให้แข็งเป็นพิเศษ เหล็กที่เป็น SD40T ใกล้เคียงกับ SD40 เดิม รับแรง ทนแรงดึงได้ประมาณเดิม ยืดหยุ่นใกล้เคียงกับแบบเดิม</p><h2>ข้อดีข้อเสียจากการนำเหล็ก ข้ออ้อย SD40T ไปใช้งาน&nbsp;</h2><p>เหล็ก SD40T รับแรงได้เท่าเดิม ความยืดหยุ่นได้ประมาณเดิม ไม่ได้แตกต่างไปจากเดิมเท่าไร แต่เนื่องจากผิวด้านนอกที่แข็งกว่าด้านใน การทำเกลียวหรือการดัดงอบางประเภท อาจจะทำให้ผิวแตกได้ การทำเกลียว จะต้องมีเทคนิคพิเศษ</p><h2>การยอมรับเหล็กข้ออ้อย SD40T ให้เทียบเท่ากับ SD40</h2><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/ad5e737a5d8a6ae710d9b4d231eab34e\" alt=\"sd40,sd40t,เหล็ก sd40 ไม่มี T,\" class=\"fr-fic fr-dii\"></figure><p><br></p><p>เนื้อหาเอกสาร มีดังต่อไปนี้ (อ้างอิงเพื่อให้สามารถค้นหาเจอผ่านระบบได้ จัดพิมพ์ข้อความด้านล่างโดย วันสต๊อกโฮม)</p><p>โดยสำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรม&nbsp;</p><p>เมื่อวันที่ ๑๕ มีนาคม ๒๕๖๑</p><p>ตามหนังสือที่อ้างถึง สมาคมอุตสาหกรรมเหล็กไทยขอให้สำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรมพิจารณาปร้ะเด็นปัญหาของผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย ที่เป็นไปตามมาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย มาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ และมีการแสดงอักษร T กำกับในเครื่องหมายและฉลากเพื่อระบุว่าผ่านกรรมวิธีทางความร้อน ซึ่งการแสดงสัญลักษณ์ดังกล่าว ทำให้เกิดปัญหาในการจัดซื้อจัดจ้าง เนื่องจากการประกาศราคากลางของกระทรวงพาณิชย์ มีระบบข้อกำหนดสำหรับชั้นคุณภาพของเหล็กข้ออ้อย SD 30 SD 40 และ SD 50 เท่านั้น แต่ไม่มีการระบุข้อกำหนด สำหรับ SD 30T SD 40T และ SD 50T ทำให้ผู้ใข้และผู้ทำผลิตภัณฑ์ที่มีการแสดงอักษร Tดังกล่าว ไม่สามารถดำเนินการตรวจรับและส่งมอบงานได้ ความละเอียดแจ้งแล้ว นั้น&nbsp;</p><p>สำนักงานขอเรียนว่า มาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อยมาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ ข้อ ๓.๑ ระบุชั้นคุณภาพ ๓ ชั้นคุณภาพ คือ SD 30 SD 40 และ SD 50 ส่วนการระบุสัญลักษณ์ &ldquo;T&rdquo; ตามข้อ ๗.๑ (๔) และข้อ ๗.๒(๔) เป็นการกำหนดให้ต้องทำบนเนื้อเหล็กข้ออ้อยและที่มัดหรือที่ขดของเหล็กข้ออ้อยเฉพาะผ่านกรรมวิธีทางความร้อน (Heat Treatment) ในระหว่างการผลิตและกำหนดให้แสดงเป็นลำดับถัดจากสัญลักษณ์ชั้นคุณภาพ ดังนั้น เหล็กข้ออ้อยที่มีชั้นคุณภาพเดียวกัน ทั้งที่มี และไม่มี สัญลักษณ์ &ldquo;T&rdquo; ต่อท้าย เป็นเหล็กข้ออ้อยชั้นคุณภาพเดียวกัน และมีเกณฑ์กกำหนดในการทดสอบตาม มอก. เหมือนกันทุกประการ</p><p>จึงเรียนมาเพื่อทราบ</p><p>กองกำหนดมาตรฐาน กลุ่มกำหนดมาตรฐาน ๑</p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/29bbd9186b0cdd29e862498052c0ae12\" alt=\"เหล็กข้ออ้อย,เหล็ก DB,DB,deformed bars,ถูก,ราคาโรงงาน,เหล็กเต็มโรงใหญ่\" class=\"fr-fic fr-dii\"></figure><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/57eea28dcbc0bd8f0a21200c61f3bc97\" alt=\"เหล็กเส้นกลม,round bar,rb,ราคาถูก\" class=\"fr-fic fr-dii\"></figure><p><br></p><p><br></p><p><button data-ga-category=\"ProductTypes\" data-ga-label=\"d_productType_productTypeContent_hideDetail\" name=\"button\" type=\"submit\">ซ่อนรายละเอียด</button></p><p><br></p>', 30, 4);
INSERT INTO `stock_category` VALUES (240, 2, 15, 'เหล็กดัด ปลอกเสา ปลอกคาน', '', '<h1>เหล็กดัดสำเร็จรูป เหล็กปลอกเสา ปลอกคาน ราคาถูก</h1><p>เหล็กดัดสำเร็จรูป ราคาถูก บลกท. เหล็กเต็ม</p><p>เหล็กดัดสำเร็จรูป เป็นหนึ่งในบริการของโรงเหล็ก เป็นการบริการ ตัดเหล็ก และดัดเหล็ก ที่จะทำให้คุณลดต้นทุนการจัดซื้อเหล็ก และเวลาการทำงานด้วยเหล็กเส้น เหล็กข้ออ้อยหน้างาน สามารถนับชิ้นส่วนได้ ของไม่หาย สามารถตัดตามความยาว รูปทรง และตามที่ดีไซน์ต้องการ สามารถลดเวลา ลดค่าแรง และต้นทุนในการก่อสร้างได้ด้วย</p><h2>ประหยัดค่าแรง เหล็กดัดสำเร็จรูป ลดค่าแรง ลดระยะเวลาการทำงานหน้างาน</h2><h2>ประหยัดเวลา ใช้งานได้จริงทันที เหล็กดัดพร้อมใช้งานทันที</h2><h2>ประหยัดต้นทุน เพราะเหล็กดัดสำเร็จรูป ไม่มีเศษ</h2><h2>เพิ่มคุณภาพสินค้า ด้วยการใช้เครื่องจักรที่ทันสมัย&nbsp;</h2><h2><br></h2><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/cut-and-bend-steel/555a77fbbbbad4aa76e58cde1e5fd38b\" alt=\"cut and bend steel cut,bend,steel,best,price,\" class=\"fr-fic fr-dii\"></figure><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/cut-and-bend-steel/5248f4dd12548a60eabdce9f7341cd46\" alt=\"เหล็กดัด,เหลกดัด,เหล้กดัดสำเร็จรูป,เหล็กดัด,สำเร็จณูป,สำเร็จรูป,ราคาถูก\" class=\"fr-fic fr-dii\"></figure><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/cut-and-bend-steel/1193b096e0f808b9da2e45022c7ffd25\" alt=\"เหล็กดัด,เหล็กดัดสำเร็จรูป,เหล็กดัด,gs]Hdfyf},เหล้กดัดสำเร็จรูป,เหล็กปลอก,ปลอกเหล็ก,ปอกเหล็ก,เหล็กปลอก\" class=\"fr-fic fr-dii\"></figure>', 30, 5);
INSERT INTO `stock_category` VALUES (241, 2, 18, 'New Item 72', NULL, NULL, 30, 72);
INSERT INTO `stock_category` VALUES (242, 2, 18, 'New Item 73', NULL, NULL, 30, 73);
INSERT INTO `stock_category` VALUES (243, 2, 18, 'New Item 74', NULL, NULL, 30, 74);
INSERT INTO `stock_category` VALUES (244, 2, 18, 'New Item 75', NULL, NULL, 30, 75);
INSERT INTO `stock_category` VALUES (245, 2, 18, 'New Item 76', NULL, NULL, 10, 76);
INSERT INTO `stock_category` VALUES (246, 2, 18, 'New Item 77', NULL, NULL, 30, 77);
INSERT INTO `stock_category` VALUES (247, 2, 174, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (248, 2, 174, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (249, 2, 173, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (250, 2, 249, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (251, 2, 249, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (252, 2, 249, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (253, 2, 173, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (254, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (255, 2, 254, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (256, 2, 254, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (257, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (258, 2, 257, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (259, 2, 257, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (260, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (261, 2, 260, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (262, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (263, 2, 262, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (264, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (265, 2, 264, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (266, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (267, 2, 266, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (268, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (269, 2, 268, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (270, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (271, 2, 270, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (272, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (273, 2, 272, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (274, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (275, 2, 274, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (276, 1, NULL, 'New Item 1', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (277, 2, 276, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (278, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (279, 2, 278, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (280, 2, 278, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (281, 2, 278, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (282, 2, 278, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (283, 2, 279, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (284, 2, 279, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (285, 2, 279, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (286, 2, 279, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (287, 2, 279, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (288, 2, 279, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (289, 2, 279, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (290, 2, 283, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (291, 2, 279, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (292, 2, 283, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (293, 2, 279, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (294, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (295, 2, 294, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (296, 2, 295, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (297, 2, 295, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (298, 2, 295, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (299, 2, 295, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (300, 2, 295, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (301, 2, 295, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (302, 2, 295, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (303, 2, 295, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (304, 2, 295, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (305, 2, 294, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (306, 2, 294, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (307, 2, 294, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (308, 2, 295, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (309, 2, 305, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (310, 2, 305, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (311, 2, 305, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (312, 2, 305, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (313, 2, 305, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (314, 2, 305, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (315, 2, 305, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (316, 2, 305, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (317, 2, 305, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (318, 2, 306, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (319, 2, 306, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (320, 2, 306, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (321, 2, 306, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (322, 2, 306, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (323, 2, 306, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (324, 2, 306, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (325, 2, 306, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (326, 2, 306, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (327, 2, 306, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (328, 2, 307, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (329, 2, 307, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (330, 2, 307, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (331, 2, 307, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (332, 2, 307, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (333, 2, 307, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (334, 2, 307, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (335, 2, 307, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (336, 2, 307, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (337, 2, 307, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (338, 2, 307, 'New Item 11', NULL, NULL, 10, 11);
INSERT INTO `stock_category` VALUES (339, 2, 307, 'New Item 12', NULL, NULL, 10, 12);
INSERT INTO `stock_category` VALUES (340, 2, 294, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (341, 2, 294, 'New Item 1', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (342, 2, 294, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (343, 2, 341, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (344, 2, 341, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (345, 2, 341, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (346, 2, 341, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (347, 2, 341, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (348, 2, 341, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (349, 2, 342, 'New Item 1', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (350, 2, 342, 'New Item 2', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (351, 2, 342, 'New Item 3', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (352, 2, 342, 'New Item 4', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (353, 2, 342, 'New Item 5', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (354, 2, 342, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (355, 2, 294, 'New Item 3', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (356, 2, 355, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (357, 2, 355, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (358, 2, 355, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (359, 2, 355, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (360, 2, 355, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (361, 2, 355, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (362, 2, 355, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (363, 2, 355, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (364, 2, 355, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (365, 2, 3, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (366, 1, NULL, 'New Item 1', '1540733682069267500.jpg', '', 30, 1);
INSERT INTO `stock_category` VALUES (367, 2, 366, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (368, 2, 367, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (369, 2, 367, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (370, 2, 367, 'New Item 3', NULL, NULL, 10, 3);
INSERT INTO `stock_category` VALUES (371, 2, 367, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (372, 2, 367, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (373, 2, 367, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (374, 2, 367, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (375, 2, 367, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (376, 2, 367, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (377, 2, 367, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (378, 2, 367, 'New Item 11', NULL, NULL, 10, 11);
INSERT INTO `stock_category` VALUES (379, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (380, 2, 379, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (381, 2, 32, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (382, 2, 32, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (383, 2, 32, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (384, 2, 32, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (385, 2, 32, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (386, 2, 32, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (387, 2, 32, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (388, 2, 32, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (389, 2, 32, 'New Item 9', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (390, 2, 34, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (391, 2, 34, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (392, 2, 34, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (393, 2, 34, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (394, 2, 34, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (395, 2, 34, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (396, 2, 35, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (397, 2, 35, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (398, 2, 35, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (399, 2, 35, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (400, 2, 35, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (401, 2, 35, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (402, 2, 35, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (403, 2, 36, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (404, 2, 36, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (405, 2, 36, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (406, 2, 36, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (407, 2, 36, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (408, 2, 36, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (409, 2, 36, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (410, 2, 36, 'New Item 10', NULL, NULL, 30, 10);
INSERT INTO `stock_category` VALUES (411, 2, 43, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (412, 2, 43, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (413, 2, 43, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (414, 2, 43, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (415, 2, 43, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (416, 2, 43, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (417, 2, 44, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (418, 2, 44, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (419, 2, 44, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (420, 2, 44, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (421, 2, 44, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (422, 2, 44, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (423, 2, 43, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (424, 2, 43, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (425, 2, 51, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (426, 2, 51, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (427, 2, 51, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (428, 2, 51, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (429, 2, 51, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (430, 2, 51, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (431, 2, 51, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (432, 2, 51, 'New Item 10', NULL, NULL, 30, 10);
INSERT INTO `stock_category` VALUES (433, 2, 52, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (434, 2, 52, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (435, 2, 52, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (436, 2, 52, 'New Item 6', NULL, NULL, 10, 6);
INSERT INTO `stock_category` VALUES (437, 2, 52, 'New Item 7', NULL, NULL, 10, 7);
INSERT INTO `stock_category` VALUES (438, 2, 52, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (439, 2, 56, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (440, 2, 56, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (441, 2, 56, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (442, 2, 56, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (443, 2, 56, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (444, 2, 56, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (445, 2, 56, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (446, 2, 56, 'New Item 10', NULL, NULL, 30, 10);
INSERT INTO `stock_category` VALUES (447, 2, 55, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (448, 2, 55, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (449, 2, 55, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (450, 2, 55, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (451, 2, 55, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (452, 2, 55, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (453, 2, 55, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (454, 2, 20, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (455, 2, 20, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (456, 2, 20, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (457, 2, 20, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (458, 2, 20, 'New Item 9', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (459, 2, 20, 'New Item 10', NULL, NULL, 30, 10);
INSERT INTO `stock_category` VALUES (460, 2, 20, 'New Item 11', NULL, NULL, 10, 11);
INSERT INTO `stock_category` VALUES (461, 2, 19, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (462, 2, 19, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (463, 2, 19, 'New Item 9', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (464, 2, 19, 'ก่อฉาบทั่วไป', '1588940605093600900.jpg', '', 10, 10);
INSERT INTO `stock_category` VALUES (465, 2, 21, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (466, 2, 21, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (467, 2, 21, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (468, 2, 21, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (469, 2, 21, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (470, 2, 21, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (471, 2, 21, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (472, 2, 21, 'New Item 9', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (473, 2, 21, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (474, 2, 22, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (475, 2, 22, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (476, 2, 22, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (477, 2, 22, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (478, 2, 22, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (479, 2, 22, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (480, 2, 22, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (481, 2, 22, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (482, 2, 23, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (483, 2, 23, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (484, 2, 23, 'New Item 9', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (485, 2, 23, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (486, 2, 15, 'demo', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (487, 2, 15, 'เหล็กเส้นกลม', '1588938654098587700.jpg', '<h1><span style=\"font-family: Georgia,serif;\"><span style=\"font-size: 24px;\">เหล็กเส้นกลม เหล็กข้ออ้อย มอก. ราคาถูก ราคาโรงงาน</span></span></h1><p><span style=\"font-family: Georgia,serif;\">เหล็กเส้นกลม เหล็กข้ออ้อย มอก. โรงใหญ่ เหล็กเต็ม ราคาถูก</span></p><h2><span style=\"font-family: Georgia,serif;\">ด่วน 13 ธ.ค. 61 ราคาเหล็ก เปิด 18.70 บาท+VAT7% ถ้า 30 ตัน มีราคาพิเศษ สถานการณ์วัตถุดิบราคาลดต่ำลง เป็นแรงเสริมให้อุปสงค์ขยับขึ้นได้เป็นอย่างดี</span></h2><h2><span style=\"font-family: Georgia,serif;\">แนวโน้ม ราคาเหล็ก เหล็กข้ออ้อย SD40T &nbsp;<a href=\"https://www.onestockhome.com/th/products/29375545/rebars-rb-sr24-db-sd40-no-t\" target=\"_self\">แบบ SD40 ไม่มีที มอก. เต็ม โรงใหญ่ ก็มีจำหน่าย</a></span></h2><p><span style=\"font-family: Georgia,serif;\">13 ธ.ค. 61 เหล็กเส้น เหล็กข้ออ้อย ราคาคงที่ สวนกระแสต้นทุนน้ำมัน บิลเล็ต และต้นทุนค่าเงินบาทอ่อน</span></p><p><span style=\"font-family: Georgia,serif;\"><br></span></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/8c6ef67bd31d59b42e8a09f1bdf629ec\" alt=\"ราคาเหล็กวันนี้,ราคาถูก\" class=\"fr-fic fr-dii\"></figure><p><br></p><h2>แนวโน้ม ราคาเหล็ก บิลเล็ต ซื้อขายกัน วันนี้&nbsp;</h2><p>13 ธ.ค.61 ราคาเหล็กบิลเล็ตวันนี้ ปรับตัวลดลง เพราะ ต้นทุนต่ำลง&nbsp;<a href=\"https://www.onestockhome.com/th/items/18128058/steel-billet\" target=\"_self\">ดูราคาบิลเล็ท ที่นี่</a></p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/5fd7d902aa6d86e01202c6ad92d0e95d\" alt=\"ราคาเหล็กบิลเล็ต,เหล็กบิลเล็ท,billet,best,price\" class=\"fr-fic fr-dii\"></figure><p><br></p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/23325b8836d8d7893339b4a5fb71a8ef\" alt=\"เหล็กข้ออ้อย,ราคาถูก,deformed bars,db,ถูก,ข้ออ้อย,ปล้องอ้อย\" class=\"fr-fic fr-dii\">&nbsp;</figure><p><br></p><h1>เหล็กเส้นกลม มอก. (Round Bars RB) ราคาถูก</h1><p>เหล็กเส้นกลม มอก. ที่ผลิต ตามมาตรฐาน มอก. 24-2548 กำหนดให้ เหล็กเส้นกลม ที่มีชั้นคุณภาพ SR24 ซึ่งหมายถึงเหล็กต้องมีกำลังจุดคลากไม่ต่ำกว่า 2,400 กิโลกรัม/ตารางเซนติเมตร ขนาดของเหล็กมีตั้งแต่ 6มม. ถึง 25 มม. ส่วนความยาว มาตรฐาน คือ 10 ม. และ 12ม. หรือสามารถสั่งดัดพิเศษตามแบบที่ต้องการได้ เหล็กขนาด 6มม. และ 9มม. มักถูกใช้เป็นเหล็กปลอกในคานหรือในเสา ส่วนเหล็กขนาด 12มม. ขึ้นไป มักจะถูกใช้ในงาน เหล็กเสริมแกนในงานคอนกรีต เพื่อเพิ่มความแข็งแรงให้กับโครงสร้างนั้นๆ</p><h1>เหล็กข้ออ้อย มอก. (Deformed Bars DB) ราคาถูก</h1><p>เหล็กข้ออ้อย มีลักษณะ ผิวเหล็ก เป็นปล้องๆ คล้ายๆอ้อย จึงเรียกว่า เหล็กข้ออ้อย ตามมาตรฐาน มอก. 24-2536 กำหนดให้ เหล็กข้ออ้อย มีชั้นคุณภาพหลายชั้น เช่น SD30, SD40, SD50 และ SD60 ซึ่ง SD30 จะหมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 3,000 กิโลกรัม/ตารางเซนติเมตร หรือ SD40 หมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 4,000 กิโลกรัม/เซนติเมตร ขนาดของเหล็กมีตั้งแต่ 10มม. ถึง 40 มม. แต่ที่นิยมใช้สำหรับงานก่อสร้างบ้านเราคือขนาด 12มม. ถึง 25 มม. ความยาวมาตรฐานคือ 10ม. และ 12มม. เหล็กข้ออ้อย จะใช้ในงานก่อสร้างที่ต้องรับน้ำหนักมากๆ</p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/76323991/add6182fbd93d6c4ae30c3512107d0ed\" alt=\"ภาพตัดเหล็กข้ออ้อย เหล็กเต็ม\" class=\"fr-fic fr-dii\">&nbsp;</figure><h2>เหล็กเต็ม ดูได้อย่างไร</h2><p>ตัดเหล็กที่ต้องการวัด ความยาว 1 เมตร โดยใช้เครื่องชั่งที่ละเอียด 1 กรัม จะได้น้ำหนักเป็น กิโลกรัมต่อเมตร แล้วนำมาเปรียบเทียบกับตารางที่ มอก. กำหนด ตัวอย่างเช่น เหล็กข้ออ้อย 12 มม.น้ำหนักต่อเมตร 0.888 น้ำหนักความคลาดเคลื่อนของมวลต่อเมตรที่มอก.ยอมให้เท่ากับ + 5 และ-5 จะมีค่าอยู่ระหว่าง 1.93-0.843 ถือว่าเป็น เหล็กเต็ม&nbsp;</p><h2>อะไรคือ เหล็กเส้นกลม รีดซ้ำ? โปรดระวัง!&nbsp;</h2><p>หลายคนคงเคยได้ยินว่าท้องตลาด มีการจำหน่าย เหล็กเส้นกลม รีดซ้ำ เหล็กประเภทนี้ แม้จะมี มอก.รับรอง เพราะเป็นเหล็กที่ได้จากการนำเศษเหล็กไปหลอมแล้วรีดออกมาใหม่ จะมีสัญลักษณ์ว่า SRR24 มักจะใช้ได้กับงานเหล็กปลอกเท่านั้น แต่จะมีปัญหาคือ มีกำลังจุดคลากต่ำมาก</p><h2>ลักษณะเหล็กที่ดี มีคุณภาพ ควรมีข้อพิจารณาสำคัญ 2 หลักการใหญ่</h2><h3>การเลือก เหล็กเส้น SR24 เหล็กข้ออ้อย SD40 ทางผิวเหล็ก</h3><ul><li>เหล็กเส้นกลม ต้องผิวเรียบเกลี้ยง ไม่มีปีก ลุกคลื่น หน้าตัดกลม ไม่เบี้ยว ไม่มีรอยปริแตก</li><li>เหล็กข้ออ้อย ต้องมีบั้งระยะเท่ากัน สม่ำเสมอตลอดทั้งเส้น</li></ul><h3>การเลือก เหล็กเส้น SR24 เหล็กข้ออ้อย SD40 เส้นผ่านศูนย์กลางและน้ำหนัก ที่ได้มาตรฐาน</h3><ul><li>เมื่อดัดโค้ง งอ ต้องไม่ปริแตก หักง่าย</li><li>เช่น เหล็กเส้นกลม SR-24 ขนาดบนเนื้อเหล็ก 9 มม. เมื่อวัดเส้นผ่านศูนย์กลาง ต้องได้ 9 มม. ชั่งน้ำหนักต้องได้ 0.499 กก. ต่อความยาว 1 เมตร และความยาว เหล็กเส้นกลม มาตรฐานทั้งเส้นอยู่ที่ 10 เมตร</li><li>เหล็กต้องไม่เป็นสนิมขุมกินเข้าไปในเนื้อเหล็ก หมายเหตุ แต่ไม่ต้องวิตกกังวลที่เห็น ผิวเหล็กเป็นสนิม เพราะเป็นเรื่องปกติตามสภาพธรรมชาติร้อนชื้นของประเทศไทย &nbsp;</li></ul><h2>การผลิต เหล็กเส้น เหล็กข้ออ้อย</h2><p>การผลิตเหล็กเส้น เกิดจากการป้อนเศษเหล็ก ปูนขาว และถ่านโค๊กที่มีคุณภาพในประมาณที่เหมาะสมเข้าเตาอาร์คไฟฟ้า EAF ในระหว่างการหลอมเหล็กที่ได้ จะผ่านกรรมวิธีทางเคมี และความร้อนเพื่อปรุงส่วนผสม เมื่อน้ำเหล็กมีอุณหภูมิและส่วนผสมทางเคมีที่ถูกต้อง หลังจากการตรวจสอบจากห้องทดลองแล้ว น้ำเหล็กจะถูกส่งมายังเครื่องหล่อแบบต่อเนื่อง เพื่อผลิตบิลเล็ตที่มีคุณภาพสูงต่อไปบิลเล็ตที่ได้นี้ จะถูกนำเข้าตาอบที่อุณหภูมิสูง 1050 องศาเซลเซียส เพื่อปรับสภาพเนื้อเหล็กที่สามารถถูกรีดลดขนาดตามต้องการได้</p><h2>โลหะวิทยาของ เหล็กกล้า เพื่อทำเหล็กเส้น เหล็กข้ออ้อย มอก.</h2><p>เหล็กเส้นที่ผลิตในประเทศไทยนั้น ในเชิงวิชาการจัดได้ว่าอยู่ในหมวดเหล็กกล้าคาร์บอน ซึ่งเป็นเหล็กที่ได้คุณสมบัติการใช้งานจากธาตุผสมเพียง 3 ธาตุ อันได้แก่ คาร์บอน ซิลิกอน และ แมงกานีส นอกจากเหล็กกล้าคาร์บอนแล้ว เหล็กกลุ่มอื่นๆ ที่สำคัญได้แก่ เหล็กกล้าเครื่องมือและเหล็กกล้าผสม มีธาตุผสมของโครเมี่ยม นิกเกิล วาเนเดียม เหล็กกล้าความเร็วสูง อันได้แก่ เหล็กกล้าสำหรับงานเชื่อม ที่มีแมงกานีสสูง เป็นต้นเหล็กกล้าคาร์บอนที่ผลิตในประเทศไทย สามารถแบ่งย่อยได้เป็นสองกลุ่ม อันได้แก่ เหล็กกล้าที่มีธาตุคาร์บอนน้อยกว่า 0.25% เหล็กกล้าคาร์บอนต่ำนี้ นำมาทำเหล็กลวดและเหล็กเส้น กลุ่มที่สองนี้ได้แก่ เหล็กกล้าคาร์บอนปานกลาง มีคาร์บอนระหว่าง 0.25-0.35% เหล็กกลุ่มนี้เหมาะที่จะนำไปทำเหล็กข้ออ้อย</p><h3>ข้อกำหนดการใช้งานของ เหล็กกล้าคาร์บอน สำหรับเหล็กเส้น เหล็กข้ออ้อย มอก.</h3><p>โดยจะแบ่งได้เป็นสัดส่วนดังนี้&nbsp;</p><ol><li>ส่วนผสมและอัตราส่วนการผสมของคาร์บอน ซิลิกอน แมงกานีส และในบางกรณีมีธาตุวานาเดียมเพื่อเพิ่มประสิทธิภาพให้ความแข็งแรง แต่ขณะเดียวกัน ก็จะลดการยืดตัวของ เหล็กเส้นกลม เหล็กข้ออ้อย เช่นกัน ในขณะที่แมงกานีสจะมีผลในการเพิ่มแรงดึงสูงสุดและการยืดตัว อย่างไรก็ตาม การปรับปริมาณของธาตุทั้งสาม ต้องให้กิดความสมดุล มิฉะนั้นจะทำให้เหล็กไม่มีคุณสมบัติตามที่ต้องการ</li><li>คุณภาพของเนื้อ เหล็ก ระหว่างการหลอม และเท เป็นแท่ง เป็นส่วนสำคัญขั้นที่สอง เพื่อให้ได้เหล็กแท่งเนื้อสะอาด มีขนาดผลึก และการกระจายตัวทางเคมีที่สม่ำเสมอ</li><li>ประสิทธิภาพและวิศวกรรมของเครื่องรีดและการควบคุมการรีด เหล็กเส้น เหล็กข้ออ้อย โดยทางโรงงานเลือกใช้นวัตกรรมของเครื่องจักรสำหรับศตวรรษนี้ อันได้แก่เครื่องจักรทั้งชุด ควบคุมด้วยเครื่องคอมพิวเตอร์ แท่นรีด เป็นระบบ H-V และมีระบบการปรับลดอุณหภูมิของเหล็กที่แม่นยำ</li></ol><h3>ใบ Certificate มอก.&nbsp;สำหรับ เหล็กเส้น เหล็กข้ออ้อย</h3><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/76323991/fedc154d97ab7f0b748a5638f7c39827\" alt=\"ใบ มอก. เหล็ก\" class=\"fr-fic fr-dii\">&nbsp;</figure><h2>เหล็ก ข้ออ้อย&nbsp;SD40 ต่างกับ SD40T อย่างไร?</h2><p>เหล็ก SD40 เป็นเหล็กเดิมที่ใช้กันมานาน ส่วนเหล็ก ข้ออ้อย SD40T ผลิตจากกระบวนการ Thermal Treatment ซึ่งต่างประเทศเรียกเหล็กเหล่านี้ว่า เหล็ก TMT บ้านเราเรียก tempt core ซึ่งใช้กระบวนการชุบแข็งด้วยความร้อน ปัจจุบัน ในการผลิตจะมีการใช้ spray สเปรย์น้ำลงบนเหล็กที่เพิ่งรีดขณะร้อนแดง ทำให้อุณหภูมิลดลงอย่างรวดเร็ว ดังนั้น เนื้อเหล็กจะไม่แข็งเท่ากันอีกต่อไป การผลิตเหล็ก SD40T นี้จะทำให้เนื้อเหล็ก ตรงกลางจะนิ่มและยืดหยุ่นได้ดี รอบๆจะมีวงแหวน เกิดจากการชุบแข็ง ให้แข็งเป็นพิเศษ เหล็กที่เป็น SD40T ใกล้เคียงกับ SD40 เดิม รับแรง ทนแรงดึงได้ประมาณเดิม ยืดหยุ่นใกล้เคียงกับแบบเดิม</p><h2>ข้อดีข้อเสียจากการนำเหล็ก ข้ออ้อย SD40T ไปใช้งาน&nbsp;</h2><p>เหล็ก SD40T รับแรงได้เท่าเดิม ความยืดหยุ่นได้ประมาณเดิม ไม่ได้แตกต่างไปจากเดิมเท่าไร แต่เนื่องจากผิวด้านนอกที่แข็งกว่าด้านใน การทำเกลียวหรือการดัดงอบางประเภท อาจจะทำให้ผิวแตกได้ การทำเกลียว จะต้องมีเทคนิคพิเศษ</p><h2>การยอมรับเหล็กข้ออ้อย SD40T ให้เทียบเท่ากับ SD40</h2><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/ad5e737a5d8a6ae710d9b4d231eab34e\" alt=\"sd40,sd40t,เหล็ก sd40 ไม่มี T,\" class=\"fr-fic fr-dii\">&nbsp;</figure><p><br></p><p>เนื้อหาเอกสาร มีดังต่อไปนี้ (อ้างอิงเพื่อให้สามารถค้นหาเจอผ่านระบบได้ จัดพิมพ์ข้อความด้านล่างโดย วันสต๊อกโฮม)</p><p>โดยสำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรม&nbsp;</p><p>เมื่อวันที่ ๑๕ มีนาคม ๒๕๖๑</p><p>ตามหนังสือที่อ้างถึง สมาคมอุตสาหกรรมเหล็กไทยขอให้สำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรมพิจารณาปร้ะเด็นปัญหาของผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย ที่เป็นไปตามมาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย มาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ และมีการแสดงอักษร T กำกับในเครื่องหมายและฉลากเพื่อระบุว่าผ่านกรรมวิธีทางความร้อน ซึ่งการแสดงสัญลักษณ์ดังกล่าว ทำให้เกิดปัญหาในการจัดซื้อจัดจ้าง เนื่องจากการประกาศราคากลางของกระทรวงพาณิชย์ มีระบบข้อกำหนดสำหรับชั้นคุณภาพของเหล็กข้ออ้อย SD 30 SD 40 และ SD 50 เท่านั้น แต่ไม่มีการระบุข้อกำหนด สำหรับ SD 30T SD 40T และ SD 50T ทำให้ผู้ใข้และผู้ทำผลิตภัณฑ์ที่มีการแสดงอักษร Tดังกล่าว ไม่สามารถดำเนินการตรวจรับและส่งมอบงานได้ ความละเอียดแจ้งแล้ว นั้น&nbsp;</p><p>สำนักงานขอเรียนว่า มาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อยมาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ ข้อ ๓.๑ ระบุชั้นคุณภาพ ๓ ชั้นคุณภาพ คือ SD 30 SD 40 และ SD 50 ส่วนการระบุสัญลักษณ์ &ldquo;T&rdquo; ตามข้อ ๗.๑ (๔) และข้อ ๗.๒(๔) เป็นการกำหนดให้ต้องทำบนเนื้อเหล็กข้ออ้อยและที่มัดหรือที่ขดของเหล็กข้ออ้อยเฉพาะผ่านกรรมวิธีทางความร้อน (Heat Treatment) ในระหว่างการผลิตและกำหนดให้แสดงเป็นลำดับถัดจากสัญลักษณ์ชั้นคุณภาพ ดังนั้น เหล็กข้ออ้อยที่มีชั้นคุณภาพเดียวกัน ทั้งที่มี และไม่มี สัญลักษณ์ &ldquo;T&rdquo; ต่อท้าย เป็นเหล็กข้ออ้อยชั้นคุณภาพเดียวกัน และมีเกณฑ์กกำหนดในการทดสอบตาม มอก. เหมือนกันทุกประการ</p><p>จึงเรียนมาเพื่อทราบ</p><p>กองกำหนดมาตรฐาน กลุ่มกำหนดมาตรฐาน ๑</p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/29bbd9186b0cdd29e862498052c0ae12\" alt=\"เหล็กข้ออ้อย,เหล็ก DB,DB,deformed bars,ถูก,ราคาโรงงาน,เหล็กเต็มโรงใหญ่\" class=\"fr-fic fr-dii\">&nbsp;</figure><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/57eea28dcbc0bd8f0a21200c61f3bc97\" alt=\"เหล็กเส้นกลม,round bar,rb,ราคาถูก\" class=\"fr-fic fr-dii\">&nbsp;</figure><p><br></p>', 10, 8);
INSERT INTO `stock_category` VALUES (488, 2, 25, 'New Item 9', NULL, NULL, 10, 9);
INSERT INTO `stock_category` VALUES (489, 2, 25, 'New Item 10', NULL, NULL, 10, 10);
INSERT INTO `stock_category` VALUES (490, 2, 28, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (491, 2, 28, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (492, 2, 28, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (493, 2, 28, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (494, 2, 28, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (495, 2, 30, 'Q-CON BLOCK', '1588940264013754900.jpg', '', 10, 5);
INSERT INTO `stock_category` VALUES (496, 2, 29, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (497, 2, 29, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (498, 2, 29, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (499, 2, 29, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (500, 2, 31, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (501, 2, 31, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (502, 2, 31, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (503, 2, 31, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (504, 2, 33, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (505, 2, 33, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (506, 2, 33, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (507, 2, 33, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (508, 2, 54, 'ไม้ฝาเฌอร่า', '1546837414074627600.png', '<p>ประกอบด้วย</p><h1>SHERA Ply ไม้อัด เฌอร่า พลาย</h1><p>เฌอร่า พลาย SHERA Ply ทำจากวัสดุผสมที่มีส่วนผสมของไฟเบอร์ สามารถใช้ในการตกแต่งภายในได้เป็นอย่างดี สามารถใช้ได้กับงานตกแต่ง ภายใน สามารถนำมาใช้แทนพวกไม้อัด เอ็มดีเอฟ MDF แผ่นปาร์ติเกิ้ลบอร์ด และไม้อัดธรรมชาติ &nbsp;</p><h2>SHERA Ply ไม้อัด เฌอร่าพลาย ไม่บวมน้ำ อัตราการบวมน้ำ = 0%&nbsp;</h2><p>แผ่น SHERA Ply เฌอร่าพลาย สามารถใช้ได้แม้กระทั่งกับน้ำอุ่น น้ำร้อน และพื้นที่ที่มีความชื้นสูง ทนน้ำ&nbsp;</p><h2>SHERA Ply ไม้อัด เฌอร่าพลาย ไม่ติดไฟ อัตราการติดไฟ = 0%</h2><p>SHERA Ply แผ่น เฌอร่าพลาย สามารถทนไฟ ไฟไม่ลาม ลดควันที่อาจจะเป็นอันตรายต่อร่างกายได้ &nbsp;</p><h2>SHERA Ply ไม้อัด เฌอร่าพลาย ปลอดภัย&nbsp;</h2><p>SHERA Ply แผ่นไม้อัด เฌอร่าพลาย ปราศจากสารกันแมลง ซึ่งเป็นสาเหตุที่ทำให้เกิดอันตรายต่อร่างกายได้ ซึ่งสารเหล่านี้พบโดยมากในการทำเฟอร์นิเจอร์&nbsp;</p><h2>SHERA Ply ไม้อัดเฌอร่าพลาย ทนปลวก ทนแมลง</h2><p>SHERA Ply มั่นใจได้ว่า การใช้ ไมัอัด เฌอร่าพลาย จะช่วยให้ ทนปลวก ทนแมลง แมลงไม่กัดกินตัวแผ่น&nbsp;</p>', 10, 1);
INSERT INTO `stock_category` VALUES (509, 2, 54, 'เชิงชาย', '1546833334010384900.png', '', 10, 2);
INSERT INTO `stock_category` VALUES (510, 2, 53, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (511, 2, 49, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (512, 2, 49, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (513, 2, 49, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (514, 2, 50, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (515, 2, 50, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (516, 2, 50, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (517, 2, 47, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (518, 2, 47, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (519, 2, 47, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (520, 2, 47, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (521, 2, 48, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (522, 2, 48, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (523, 2, 48, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (524, 2, 48, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (525, 2, 46, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (526, 2, 46, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (527, 2, 46, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (528, 2, 45, 'demo', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (529, 2, 45, 'New Item 3', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (530, 2, 45, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (531, 2, 45, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (532, 2, 46, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (533, 2, 44, 'New Item 8', NULL, NULL, 10, 8);
INSERT INTO `stock_category` VALUES (534, 2, 42, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (535, 2, 42, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (536, 2, 42, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (537, 2, 42, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (538, 2, 41, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (539, 2, 41, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (540, 2, 41, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (541, 2, 41, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (542, 2, 39, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (543, 2, 39, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (544, 2, 39, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (545, 2, 39, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (546, 2, 40, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (547, 2, 40, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (548, 2, 40, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (549, 2, 40, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (550, 2, 38, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (551, 2, 38, 'New Item 4', NULL, NULL, 10, 4);
INSERT INTO `stock_category` VALUES (552, 2, 38, 'New Item 5', NULL, NULL, 10, 5);
INSERT INTO `stock_category` VALUES (553, 2, 37, 'ลอนคู่', '1588937893011287400.jpg', '', 10, 4);
INSERT INTO `stock_category` VALUES (554, 2, 37, 'ไตรลอน', '1588938013084805500.jpg', '', 10, 5);
INSERT INTO `stock_category` VALUES (555, 2, 37, 'กระเบื้องคอนกรีต', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (556, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (557, 2, 556, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (558, 2, 4, 'New Item 22', NULL, NULL, 30, 22);
INSERT INTO `stock_category` VALUES (559, 2, 558, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (560, 2, 558, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (561, 2, 558, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (562, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (563, 2, 562, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (564, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (565, 2, 564, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (566, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (567, 2, 566, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (568, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (569, 2, 568, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (570, 2, 569, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (571, 2, 569, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (572, 2, 569, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (573, 2, 569, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (574, 2, 569, 'New Item 5', NULL, NULL, 30, 5);
INSERT INTO `stock_category` VALUES (575, 2, 569, 'New Item 6', NULL, NULL, 30, 6);
INSERT INTO `stock_category` VALUES (576, 2, 569, 'New Item 7', NULL, NULL, 30, 7);
INSERT INTO `stock_category` VALUES (577, 2, 569, 'New Item 8', NULL, NULL, 30, 8);
INSERT INTO `stock_category` VALUES (578, 2, 569, 'New Item 9', NULL, NULL, 30, 9);
INSERT INTO `stock_category` VALUES (579, 2, 568, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (580, 2, 568, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (581, 2, 15, 'เหล็กเส้นข้ออ้อย', '1588938743084331800.jpg', '', 10, 9);
INSERT INTO `stock_category` VALUES (582, 2, 15, 'ลวดมัดเหล็ก', '1588938904031367100.jpg', '', 10, 10);
INSERT INTO `stock_category` VALUES (583, 2, 15, 'ตะแกรงไวร์เมช', '1588938999066632500.jpg', '', 10, 11);
INSERT INTO `stock_category` VALUES (584, 1, NULL, 'New Item 1', NULL, NULL, 30, 1);
INSERT INTO `stock_category` VALUES (585, 2, 584, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (586, 2, 23, 'New Item 11', NULL, NULL, 10, 11);
INSERT INTO `stock_category` VALUES (587, 2, 23, 'New Item 12', NULL, NULL, 10, 12);
INSERT INTO `stock_category` VALUES (588, 2, 23, 'New Item 13', NULL, NULL, 10, 13);
INSERT INTO `stock_category` VALUES (589, 2, 23, 'New Item 14', NULL, NULL, 10, 14);
INSERT INTO `stock_category` VALUES (590, 2, 23, 'New Item 15', NULL, NULL, 10, 15);
INSERT INTO `stock_category` VALUES (591, 1, NULL, 'เหล็กรูปพรรณ', '1588934789082759900.jpg', '', 10, 6);
INSERT INTO `stock_category` VALUES (592, 2, 591, 'เหล็กรูปพรรณ', '', '', 10, 1);
INSERT INTO `stock_category` VALUES (593, 2, 592, ' ท่อเหล็กตัวซี', '1588939524096404800.jpg', '', 10, 1);
INSERT INTO `stock_category` VALUES (594, 2, 592, 'ท่อเหล็กเหลี่ยม', '1588939623006749000.jpg', '', 10, 2);
INSERT INTO `stock_category` VALUES (595, 2, 592, 'ท่อเหล็กแบน', '1588939723034345000.jpg', '', 10, 3);
INSERT INTO `stock_category` VALUES (596, 2, 592, 'ท่อเหล็กกลม', '1588939824072517800.jpg', '', 10, 4);
INSERT INTO `stock_category` VALUES (597, 2, 592, 'เหล็กตัน', '1588939898053169200.jpg', '', 10, 5);
INSERT INTO `stock_category` VALUES (598, 2, 592, 'เหล็กฉาก', '1588940015094273300.jpg', '', 10, 6);
INSERT INTO `stock_category` VALUES (599, 2, 54, 'ไม้ระแนง', '1546825764030684600.jpg', '', 10, 3);
INSERT INTO `stock_category` VALUES (600, 2, 54, 'ไม้มอบ , ไม้บัว', '1546834348026144600.png', '', 10, 4);
INSERT INTO `stock_category` VALUES (601, 2, 54, 'ไม้พื้น', '1546833209077516400.png', '', 30, 8);
INSERT INTO `stock_category` VALUES (602, 2, 54, 'ไม้รั้ว', '1546837303050233700.png', '', 10, 5);
INSERT INTO `stock_category` VALUES (603, 2, 607, 'ไม้ตกแต่ง', '1546833267082892400.png', '', 10, 10);
INSERT INTO `stock_category` VALUES (604, 2, 54, 'วงกบประตู, วงกบหน้าต่าง', '1546830284012796600.jpg', '', 10, 14);
INSERT INTO `stock_category` VALUES (605, 2, 54, 'ประตูเฌอร่า', '1546830322088490200.jpg', '', 10, 8);
INSERT INTO `stock_category` VALUES (606, 2, 26, 'งานพื้น', NULL, NULL, 10, 11);
INSERT INTO `stock_category` VALUES (607, 2, 26, 'งานตกแต่ง', '', '', 30, 12);
INSERT INTO `stock_category` VALUES (608, 2, 26, 'ไม้อัด', NULL, NULL, 10, 13);
INSERT INTO `stock_category` VALUES (609, 2, 19, 'ปูนสำหรับฉาบ', '1588940773086242500.jpg', '', 10, 11);
INSERT INTO `stock_category` VALUES (610, 2, 19, 'ปูนสำหรับงานโครงสร้าง', '1588940857057506200.jpg', '', 10, 12);
INSERT INTO `stock_category` VALUES (611, 2, 19, 'ปูนกาว', '1588940940085008200.jpg', '', 10, 13);
INSERT INTO `stock_category` VALUES (612, 2, 30, 'DIAMONE BLOCK', '1588940375010259700.png', '', 10, 6);
INSERT INTO `stock_category` VALUES (613, 2, 54, 'ไม้กันตก', '1546927126031756900.png', '', 10, 6);
INSERT INTO `stock_category` VALUES (614, 2, 54, 'ฉลุช่องลมเฌอร่า', '1546931234031521500.png', '', 10, 9);
INSERT INTO `stock_category` VALUES (615, 1, NULL, 'เฌอร่าเพ้นท์', '1588935953071857600.jpg', '', 10, 4);
INSERT INTO `stock_category` VALUES (616, 2, 616, 'สีเก็บงาน', '1549109893002852600.png', '<p>เก็บให้หมด อย่าให้เหลือ</p><p><br></p>', 10, 1);
INSERT INTO `stock_category` VALUES (617, 1, NULL, 'New Item 1', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (618, 2, 617, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (619, 2, 54, 'ไม้ปิดกันนก', '1546935893016390900.jpg', '', 10, 10);
INSERT INTO `stock_category` VALUES (620, 2, 608, 'ไม้อัดเอ็นจิเนียร์', '', '', 10, 16);
INSERT INTO `stock_category` VALUES (621, 2, 13, 'ไม้บันได', '', '', 30, 2);
INSERT INTO `stock_category` VALUES (622, 2, 54, 'ไม้บันได', '', '', 10, 11);
INSERT INTO `stock_category` VALUES (623, 2, 26, 'งานตกแต่ง', '1547779504078293100.png', '', 10, 1);
INSERT INTO `stock_category` VALUES (624, 2, 47, 'ไม้ตกแต่ง', '', '', 10, 1);
INSERT INTO `stock_category` VALUES (625, 2, 3, 'New Item 2', NULL, NULL, 10, 2);
INSERT INTO `stock_category` VALUES (626, 2, 54, 'ไม้พื้น', '', '', 10, 12);
INSERT INTO `stock_category` VALUES (627, 2, 54, 'ไม้ตกแต่ง', '', '', 10, 13);
INSERT INTO `stock_category` VALUES (628, 2, 54, 'ไม้อัด', '', '', 10, 16);
INSERT INTO `stock_category` VALUES (629, 2, 54, 'New Item 21', NULL, NULL, 30, 21);
INSERT INTO `stock_category` VALUES (630, 2, 37, 'กระเบื้องไฟเบอร์ซีเมนต์', '', '', 30, 7);
INSERT INTO `stock_category` VALUES (631, 2, 615, 'สีเก็บงาน', '1549110920014190700.png', '<p>เก็บได้ทุกอย่าง แหมมม</p>', 10, 1);
INSERT INTO `stock_category` VALUES (632, 2, 631, 'งานไม้ทดแทน', '1588938166021736900.jpg', '<p>เก็บงานไม้</p>', 10, 1);
INSERT INTO `stock_category` VALUES (633, 2, 631, 'cn001', '1549126123006567100.png', '', 30, 2);
INSERT INTO `stock_category` VALUES (634, 2, 631, 'New Item 3', NULL, NULL, 30, 3);
INSERT INTO `stock_category` VALUES (635, 2, 631, 'New Item 4', NULL, NULL, 30, 4);
INSERT INTO `stock_category` VALUES (636, 2, 54, 'ประตู หน้าต่าง และอุปกรณ์', '1549697417062206600.jpg', '', 10, 15);
INSERT INTO `stock_category` VALUES (637, 1, NULL, 'ผลิตภัณฑ์ทดแทนไม้', '1549870241007667800.jpg', '', 30, 1);
INSERT INTO `stock_category` VALUES (638, 2, 637, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (639, 1, NULL, 'หลังคาห้าห่วง', '1549857599037624800.jpg', '', 30, 1);
INSERT INTO `stock_category` VALUES (640, 2, 639, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (641, 1, NULL, 'เฌอร่าบอร์ด', '1549871523094208200.jpg', '', 30, 1);
INSERT INTO `stock_category` VALUES (642, 2, 641, 'New Item 1', NULL, NULL, 10, 1);
INSERT INTO `stock_category` VALUES (643, 2, 13, 'New Item 2', NULL, NULL, 30, 2);
INSERT INTO `stock_category` VALUES (644, 2, 54, 'ไม้ตกแต่ง', NULL, NULL, 30, 7);
COMMIT;

-- ----------------------------
-- Table structure for stock_product_docs
-- ----------------------------
DROP TABLE IF EXISTS `stock_product_docs`;
CREATE TABLE `stock_product_docs` (
  `id` bigint(20) NOT NULL COMMENT 'รหัสหมวดสินค้า',
  `filename` text DEFAULT NULL COMMENT 'รายละเอียด',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stock_product_docs
-- ----------------------------
BEGIN;
INSERT INTO `stock_product_docs` VALUES (1539805312050322100, '1539805312050323400.png');
INSERT INTO `stock_product_docs` VALUES (1539805312050441500, '1539805312050442900.png');
INSERT INTO `stock_product_docs` VALUES (1539805312050639900, '1539805312050641200.png');
INSERT INTO `stock_product_docs` VALUES (1539939479011488600, '1539939479011490500.png');
INSERT INTO `stock_product_docs` VALUES (1539939479014395200, '1539939479014397400.png');
INSERT INTO `stock_product_docs` VALUES (1539939479015674000, '1539939479015675400.png');
INSERT INTO `stock_product_docs` VALUES (1539939479017209800, '1539939479017211400.png');
COMMIT;

-- ----------------------------
-- Table structure for stock_product_group
-- ----------------------------
DROP TABLE IF EXISTS `stock_product_group`;
CREATE TABLE `stock_product_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหมวดสินค้า',
  `brand_id` int(11) DEFAULT NULL COMMENT 'ตราสินค้า',
  `category_id` int(11) DEFAULT NULL COMMENT 'รหัสหมวดสินค้าย่อยสุดเท่านั้น',
  `name` varchar(100) DEFAULT NULL COMMENT 'ชื่อหมวดสินค้า',
  `icon` text DEFAULT NULL COMMENT 'โลโก้',
  `description` longtext DEFAULT NULL COMMENT 'รายละเอียด',
  `deleted` tinyint(4) DEFAULT NULL COMMENT 'สถานะการลบ',
  `forder` int(11) DEFAULT NULL COMMENT 'เรียงลำดับ',
  `sub_brand_id` bigint(20) DEFAULT NULL COMMENT 'แบรนด์ย่อย',
  `sub_category_id` int(11) DEFAULT NULL COMMENT 'หมวดสินค้าย่อย',
  `sub_category_id2` int(11) DEFAULT NULL,
  `file_upload` longtext DEFAULT NULL COMMENT 'File Upload',
  `recommended_product` int(10) DEFAULT NULL COMMENT 'เสนอให้เป็นสินค้าแนะนำ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1549110775006774201 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stock_product_group
-- ----------------------------
BEGIN;
INSERT INTO `stock_product_group` VALUES (1544898741052574100, 3, 3, 'เหล็กเส้นกลม SR24 เหล็กข้ออ้อย SD40T BISW บลกท. RB6 RB9 RB12 DB12 DB16 DB20 DB25         ', ',1544898987073144800.png', '<h1><a class=\"fr-file\" href=\"https://storage.dconhub.com/files/5c2f49eecffef.pdf\" target=\"_blank\">shera-ใบสั่งซื้อเพื่อรับโรงงาน.pdf</a></h1><h1><span style=\"font-family: Georgia,serif;\"><span style=\"font-size: 24px;\">เหล็กเส้นกลม เหล็กข้ออ้อย มอก. ราคาถูก ราคาโรงงาน</span></span></h1><p><span style=\"font-family: Georgia,serif;\">เหล็กเส้นกลม เหล็กข้ออ้อย มอก. โรงใหญ่ เหล็กเต็ม ราคาถูก</span></p><h2><span style=\"font-family: Georgia,serif;\">ด่วน 13 ธ.ค. 61 ราคาเหล็ก เปิด 18.70 บาท+VAT7% ถ้า 30 ตัน มีราคาพิเศษ สถานการณ์วัตถุดิบราคาลดต่ำลง เป็นแรงเสริมให้อุปสงค์ขยับขึ้นได้เป็นอย่างดี</span></h2><h2><span style=\"font-family: Georgia,serif;\">แนวโน้ม ราคาเหล็ก เหล็กข้ออ้อย SD40T &nbsp;<a href=\"https://www.onestockhome.com/th/products/29375545/rebars-rb-sr24-db-sd40-no-t\" target=\"_self\">แบบ SD40 ไม่มีที มอก. เต็ม โรงใหญ่ ก็มีจำหน่าย</a></span></h2><p><span style=\"font-family: Georgia,serif;\">13 ธ.ค. 61 เหล็กเส้น เหล็กข้ออ้อย ราคาคงที่ สวนกระแสต้นทุนน้ำมัน บิลเล็ต และต้นทุนค่าเงินบาทอ่อน</span></p><p><span style=\"font-family: Georgia,serif;\"><br></span></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/8c6ef67bd31d59b42e8a09f1bdf629ec\" alt=\"ราคาเหล็กวันนี้,ราคาถูก\" class=\"fr-fic fr-dii\"></figure><p><br></p><h2>แนวโน้ม ราคาเหล็ก บิลเล็ต ซื้อขายกัน วันนี้&nbsp;</h2><p>13 ธ.ค.61 ราคาเหล็กบิลเล็ตวันนี้ ปรับตัวลดลง เพราะ ต้นทุนต่ำลง <a href=\"https://www.onestockhome.com/th/items/18128058/steel-billet\" target=\"_self\">ดูราคาบิลเล็ท ที่นี่</a></p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/5fd7d902aa6d86e01202c6ad92d0e95d\" alt=\"ราคาเหล็กบิลเล็ต,เหล็กบิลเล็ท,billet,best,price\" class=\"fr-fic fr-dii\"></figure><p><br></p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/23325b8836d8d7893339b4a5fb71a8ef\" alt=\"เหล็กข้ออ้อย,ราคาถูก,deformed bars,db,ถูก,ข้ออ้อย,ปล้องอ้อย\" class=\"fr-fic fr-dii\">&nbsp;</figure><p><br></p><h1>เหล็กเส้นกลม มอก. (Round Bars RB) ราคาถูก</h1><p>เหล็กเส้นกลม มอก. ที่ผลิต ตามมาตรฐาน มอก. 24-2548 กำหนดให้ เหล็กเส้นกลม ที่มีชั้นคุณภาพ SR24 ซึ่งหมายถึงเหล็กต้องมีกำลังจุดคลากไม่ต่ำกว่า 2,400 กิโลกรัม/ตารางเซนติเมตร ขนาดของเหล็กมีตั้งแต่ 6มม. ถึง 25 มม. ส่วนความยาว มาตรฐาน คือ 10 ม. และ 12ม. หรือสามารถสั่งดัดพิเศษตามแบบที่ต้องการได้ เหล็กขนาด 6มม. และ 9มม. มักถูกใช้เป็นเหล็กปลอกในคานหรือในเสา ส่วนเหล็กขนาด 12มม. ขึ้นไป มักจะถูกใช้ในงาน เหล็กเสริมแกนในงานคอนกรีต เพื่อเพิ่มความแข็งแรงให้กับโครงสร้างนั้นๆ</p><h1>เหล็กข้ออ้อย มอก. (Deformed Bars DB) ราคาถูก</h1><p>เหล็กข้ออ้อย มีลักษณะ ผิวเหล็ก เป็นปล้องๆ คล้ายๆอ้อย จึงเรียกว่า เหล็กข้ออ้อย ตามมาตรฐาน มอก. 24-2536 กำหนดให้ เหล็กข้ออ้อย มีชั้นคุณภาพหลายชั้น เช่น SD30, SD40, SD50 และ SD60 ซึ่ง SD30 จะหมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 3,000 กิโลกรัม/ตารางเซนติเมตร หรือ SD40 หมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 4,000 กิโลกรัม/เซนติเมตร ขนาดของเหล็กมีตั้งแต่ 10มม. ถึง 40 มม. แต่ที่นิยมใช้สำหรับงานก่อสร้างบ้านเราคือขนาด 12มม. ถึง 25 มม. ความยาวมาตรฐานคือ 10ม. และ 12มม. เหล็กข้ออ้อย จะใช้ในงานก่อสร้างที่ต้องรับน้ำหนักมากๆ</p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/76323991/add6182fbd93d6c4ae30c3512107d0ed\" alt=\"ภาพตัดเหล็กข้ออ้อย เหล็กเต็ม\" class=\"fr-fic fr-dii\">&nbsp;</figure><h2>เหล็กเต็ม ดูได้อย่างไร</h2><p>ตัดเหล็กที่ต้องการวัด ความยาว 1 เมตร โดยใช้เครื่องชั่งที่ละเอียด 1 กรัม จะได้น้ำหนักเป็น กิโลกรัมต่อเมตร แล้วนำมาเปรียบเทียบกับตารางที่ มอก. กำหนด ตัวอย่างเช่น เหล็กข้ออ้อย 12 มม.น้ำหนักต่อเมตร 0.888 น้ำหนักความคลาดเคลื่อนของมวลต่อเมตรที่มอก.ยอมให้เท่ากับ + 5 และ-5 จะมีค่าอยู่ระหว่าง 1.93-0.843 ถือว่าเป็น เหล็กเต็ม&nbsp;</p><h2>อะไรคือ เหล็กเส้นกลม รีดซ้ำ? โปรดระวัง!&nbsp;</h2><p>หลายคนคงเคยได้ยินว่าท้องตลาด มีการจำหน่าย เหล็กเส้นกลม รีดซ้ำ เหล็กประเภทนี้ แม้จะมี มอก.รับรอง เพราะเป็นเหล็กที่ได้จากการนำเศษเหล็กไปหลอมแล้วรีดออกมาใหม่ จะมีสัญลักษณ์ว่า SRR24 มักจะใช้ได้กับงานเหล็กปลอกเท่านั้น แต่จะมีปัญหาคือ มีกำลังจุดคลากต่ำมาก</p><h2>ลักษณะเหล็กที่ดี มีคุณภาพ ควรมีข้อพิจารณาสำคัญ 2 หลักการใหญ่</h2><h3>การเลือก เหล็กเส้น SR24 เหล็กข้ออ้อย SD40 ทางผิวเหล็ก</h3><ul><li>เหล็กเส้นกลม ต้องผิวเรียบเกลี้ยง ไม่มีปีก ลุกคลื่น หน้าตัดกลม ไม่เบี้ยว ไม่มีรอยปริแตก</li><li>เหล็กข้ออ้อย ต้องมีบั้งระยะเท่ากัน สม่ำเสมอตลอดทั้งเส้น</li></ul><h3>การเลือก เหล็กเส้น SR24 เหล็กข้ออ้อย SD40 เส้นผ่านศูนย์กลางและน้ำหนัก ที่ได้มาตรฐาน</h3><ul><li>เมื่อดัดโค้ง งอ ต้องไม่ปริแตก หักง่าย</li><li>เช่น เหล็กเส้นกลม SR-24 ขนาดบนเนื้อเหล็ก 9 มม. เมื่อวัดเส้นผ่านศูนย์กลาง ต้องได้ 9 มม. ชั่งน้ำหนักต้องได้ 0.499 กก. ต่อความยาว 1 เมตร และความยาว เหล็กเส้นกลม มาตรฐานทั้งเส้นอยู่ที่ 10 เมตร</li><li>เหล็กต้องไม่เป็นสนิมขุมกินเข้าไปในเนื้อเหล็ก หมายเหตุ แต่ไม่ต้องวิตกกังวลที่เห็น ผิวเหล็กเป็นสนิม เพราะเป็นเรื่องปกติตามสภาพธรรมชาติร้อนชื้นของประเทศไทย &nbsp;</li></ul><h2>การผลิต เหล็กเส้น เหล็กข้ออ้อย</h2><p>การผลิตเหล็กเส้น เกิดจากการป้อนเศษเหล็ก ปูนขาว และถ่านโค๊กที่มีคุณภาพในประมาณที่เหมาะสมเข้าเตาอาร์คไฟฟ้า EAF ในระหว่างการหลอมเหล็กที่ได้ จะผ่านกรรมวิธีทางเคมี และความร้อนเพื่อปรุงส่วนผสม เมื่อน้ำเหล็กมีอุณหภูมิและส่วนผสมทางเคมีที่ถูกต้อง หลังจากการตรวจสอบจากห้องทดลองแล้ว น้ำเหล็กจะถูกส่งมายังเครื่องหล่อแบบต่อเนื่อง เพื่อผลิตบิลเล็ตที่มีคุณภาพสูงต่อไปบิลเล็ตที่ได้นี้ จะถูกนำเข้าตาอบที่อุณหภูมิสูง 1050 องศาเซลเซียส เพื่อปรับสภาพเนื้อเหล็กที่สามารถถูกรีดลดขนาดตามต้องการได้</p><h2>โลหะวิทยาของ เหล็กกล้า เพื่อทำเหล็กเส้น เหล็กข้ออ้อย มอก.</h2><p>เหล็กเส้นที่ผลิตในประเทศไทยนั้น ในเชิงวิชาการจัดได้ว่าอยู่ในหมวดเหล็กกล้าคาร์บอน ซึ่งเป็นเหล็กที่ได้คุณสมบัติการใช้งานจากธาตุผสมเพียง 3 ธาตุ อันได้แก่ คาร์บอน ซิลิกอน และ แมงกานีส นอกจากเหล็กกล้าคาร์บอนแล้ว เหล็กกลุ่มอื่นๆ ที่สำคัญได้แก่ เหล็กกล้าเครื่องมือและเหล็กกล้าผสม มีธาตุผสมของโครเมี่ยม นิกเกิล วาเนเดียม เหล็กกล้าความเร็วสูง อันได้แก่ เหล็กกล้าสำหรับงานเชื่อม ที่มีแมงกานีสสูง เป็นต้นเหล็กกล้าคาร์บอนที่ผลิตในประเทศไทย สามารถแบ่งย่อยได้เป็นสองกลุ่ม อันได้แก่ เหล็กกล้าที่มีธาตุคาร์บอนน้อยกว่า 0.25% เหล็กกล้าคาร์บอนต่ำนี้ นำมาทำเหล็กลวดและเหล็กเส้น กลุ่มที่สองนี้ได้แก่ เหล็กกล้าคาร์บอนปานกลาง มีคาร์บอนระหว่าง 0.25-0.35% เหล็กกลุ่มนี้เหมาะที่จะนำไปทำเหล็กข้ออ้อย</p><h3>ข้อกำหนดการใช้งานของ เหล็กกล้าคาร์บอน สำหรับเหล็กเส้น เหล็กข้ออ้อย มอก.</h3><p>โดยจะแบ่งได้เป็นสัดส่วนดังนี้&nbsp;</p><ol><li>ส่วนผสมและอัตราส่วนการผสมของคาร์บอน ซิลิกอน แมงกานีส และในบางกรณีมีธาตุวานาเดียมเพื่อเพิ่มประสิทธิภาพให้ความแข็งแรง แต่ขณะเดียวกัน ก็จะลดการยืดตัวของ เหล็กเส้นกลม เหล็กข้ออ้อย เช่นกัน ในขณะที่แมงกานีสจะมีผลในการเพิ่มแรงดึงสูงสุดและการยืดตัว อย่างไรก็ตาม การปรับปริมาณของธาตุทั้งสาม ต้องให้กิดความสมดุล มิฉะนั้นจะทำให้เหล็กไม่มีคุณสมบัติตามที่ต้องการ</li><li>คุณภาพของเนื้อ เหล็ก ระหว่างการหลอม และเท เป็นแท่ง เป็นส่วนสำคัญขั้นที่สอง เพื่อให้ได้เหล็กแท่งเนื้อสะอาด มีขนาดผลึก และการกระจายตัวทางเคมีที่สม่ำเสมอ</li><li>ประสิทธิภาพและวิศวกรรมของเครื่องรีดและการควบคุมการรีด เหล็กเส้น เหล็กข้ออ้อย โดยทางโรงงานเลือกใช้นวัตกรรมของเครื่องจักรสำหรับศตวรรษนี้ อันได้แก่เครื่องจักรทั้งชุด ควบคุมด้วยเครื่องคอมพิวเตอร์ แท่นรีด เป็นระบบ H-V และมีระบบการปรับลดอุณหภูมิของเหล็กที่แม่นยำ</li></ol><h3>ใบ Certificate มอก.&nbsp;สำหรับ เหล็กเส้น เหล็กข้ออ้อย</h3><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/76323991/fedc154d97ab7f0b748a5638f7c39827\" alt=\"ใบ มอก. เหล็ก\" class=\"fr-fic fr-dii\">&nbsp;</figure><h2>เหล็ก ข้ออ้อย&nbsp;SD40 ต่างกับ SD40T อย่างไร?</h2><p>เหล็ก SD40 เป็นเหล็กเดิมที่ใช้กันมานาน ส่วนเหล็ก ข้ออ้อย SD40T ผลิตจากกระบวนการ Thermal Treatment ซึ่งต่างประเทศเรียกเหล็กเหล่านี้ว่า เหล็ก TMT บ้านเราเรียก tempt core ซึ่งใช้กระบวนการชุบแข็งด้วยความร้อน ปัจจุบัน ในการผลิตจะมีการใช้ spray สเปรย์น้ำลงบนเหล็กที่เพิ่งรีดขณะร้อนแดง ทำให้อุณหภูมิลดลงอย่างรวดเร็ว ดังนั้น เนื้อเหล็กจะไม่แข็งเท่ากันอีกต่อไป การผลิตเหล็ก SD40T นี้จะทำให้เนื้อเหล็ก ตรงกลางจะนิ่มและยืดหยุ่นได้ดี รอบๆจะมีวงแหวน เกิดจากการชุบแข็ง ให้แข็งเป็นพิเศษ เหล็กที่เป็น SD40T ใกล้เคียงกับ SD40 เดิม รับแรง ทนแรงดึงได้ประมาณเดิม ยืดหยุ่นใกล้เคียงกับแบบเดิม</p><h2>ข้อดีข้อเสียจากการนำเหล็ก ข้ออ้อย SD40T ไปใช้งาน&nbsp;</h2><p>เหล็ก SD40T รับแรงได้เท่าเดิม ความยืดหยุ่นได้ประมาณเดิม ไม่ได้แตกต่างไปจากเดิมเท่าไร แต่เนื่องจากผิวด้านนอกที่แข็งกว่าด้านใน การทำเกลียวหรือการดัดงอบางประเภท อาจจะทำให้ผิวแตกได้ การทำเกลียว จะต้องมีเทคนิคพิเศษ</p><h2>การยอมรับเหล็กข้ออ้อย SD40T ให้เทียบเท่ากับ SD40</h2><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/ad5e737a5d8a6ae710d9b4d231eab34e\" alt=\"sd40,sd40t,เหล็ก sd40 ไม่มี T,\" class=\"fr-fic fr-dii\">&nbsp;</figure><p><br></p><p>เนื้อหาเอกสาร มีดังต่อไปนี้ (อ้างอิงเพื่อให้สามารถค้นหาเจอผ่านระบบได้ จัดพิมพ์ข้อความด้านล่างโดย วันสต๊อกโฮม)</p><p>โดยสำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรม&nbsp;</p><p>เมื่อวันที่ ๑๕ มีนาคม ๒๕๖๑</p><p>ตามหนังสือที่อ้างถึง สมาคมอุตสาหกรรมเหล็กไทยขอให้สำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรมพิจารณาปร้ะเด็นปัญหาของผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย ที่เป็นไปตามมาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย มาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ และมีการแสดงอักษร T กำกับในเครื่องหมายและฉลากเพื่อระบุว่าผ่านกรรมวิธีทางความร้อน ซึ่งการแสดงสัญลักษณ์ดังกล่าว ทำให้เกิดปัญหาในการจัดซื้อจัดจ้าง เนื่องจากการประกาศราคากลางของกระทรวงพาณิชย์ มีระบบข้อกำหนดสำหรับชั้นคุณภาพของเหล็กข้ออ้อย SD 30 SD 40 และ SD 50 เท่านั้น แต่ไม่มีการระบุข้อกำหนด สำหรับ SD 30T SD 40T และ SD 50T ทำให้ผู้ใข้และผู้ทำผลิตภัณฑ์ที่มีการแสดงอักษร Tดังกล่าว ไม่สามารถดำเนินการตรวจรับและส่งมอบงานได้ ความละเอียดแจ้งแล้ว นั้น&nbsp;</p><p>สำนักงานขอเรียนว่า มาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อยมาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ ข้อ ๓.๑ ระบุชั้นคุณภาพ ๓ ชั้นคุณภาพ คือ SD 30 SD 40 และ SD 50 ส่วนการระบุสัญลักษณ์ &ldquo;T&rdquo; ตามข้อ ๗.๑ (๔) และข้อ ๗.๒(๔) เป็นการกำหนดให้ต้องทำบนเนื้อเหล็กข้ออ้อยและที่มัดหรือที่ขดของเหล็กข้ออ้อยเฉพาะผ่านกรรมวิธีทางความร้อน (Heat Treatment) ในระหว่างการผลิตและกำหนดให้แสดงเป็นลำดับถัดจากสัญลักษณ์ชั้นคุณภาพ ดังนั้น เหล็กข้ออ้อยที่มีชั้นคุณภาพเดียวกัน ทั้งที่มี และไม่มี สัญลักษณ์ &ldquo;T&rdquo; ต่อท้าย เป็นเหล็กข้ออ้อยชั้นคุณภาพเดียวกัน และมีเกณฑ์กกำหนดในการทดสอบตาม มอก. เหมือนกันทุกประการ</p><p>จึงเรียนมาเพื่อทราบ</p><p>กองกำหนดมาตรฐาน กลุ่มกำหนดมาตรฐาน ๑</p><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/29bbd9186b0cdd29e862498052c0ae12\" alt=\"เหล็กข้ออ้อย,เหล็ก DB,DB,deformed bars,ถูก,ราคาโรงงาน,เหล็กเต็มโรงใหญ่\" class=\"fr-fic fr-dii\">&nbsp;</figure><p><br></p><figure><img data-fr-image-pasted=\"true\" src=\"https://onestockhome-production.s3-ap-southeast-1.amazonaws.com/content_images/product_types/rb-db/57eea28dcbc0bd8f0a21200c61f3bc97\" alt=\"เหล็กเส้นกลม,round bar,rb,ราคาถูก\" class=\"fr-fic fr-dii\">&nbsp;</figure>', 10, 680, 13, 15, 487, '', 10);
INSERT INTO `stock_product_group` VALUES (1545887436036442500, 3, 3, 'demo2', '1539796514047454600.png', '<table style=\"width: 100%;\"><tbody><tr><td style=\"width: 7.5276%;\">Dconhub<br></td><td style=\"width: 18.0939%;\">ชื่อบริษัท</td><td style=\"width: 15.2625%;\">Dconhub</td><td style=\"width: 58.9779%;\"><br></td></tr><tr><td style=\"width: 7.5276%;\"><br></td><td style=\"width: 18.0939%;\">ที่อยู่</td><td style=\"width: 15.2625%;\"><br></td><td style=\"width: 58.9779%;\"><br></td></tr><tr><td><br></td><td style=\"width: 18.0939%;\">เบอร์โทรศัพท์</td><td style=\"width: 15.2625%;\"><br></td><td><br></td></tr><tr><td><br></td><td style=\"width: 18.0939%;\">เลขที่ประจำตัวผู้เสียภาษี</td><td style=\"width: 15.2625%;\"><br></td><td><br></td></tr></tbody></table><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p>', 30, NULL, 13, 15, 487, NULL, NULL);
INSERT INTO `stock_product_group` VALUES (1545917418066394100, 10, 13, 'ไม้ฝาเฌอร่า ลายสัก กลุ่มสีธรรมชาติ', '1545917418066381200.png', '<p>ขนาดความหน้า 8 มิล</p>', 30, NULL, 1545917257000291700, 54, 508, NULL, NULL);
INSERT INTO `stock_product_group` VALUES (1545918083028103900, 10, 13, 'ไม้ฝาเฌอร่า ลายสัก กลุ่มสีมาตรฐาน', '1545918083028091800.png,1546827241037916000.png', '<p><br></p><p><br></p>', 10, 20, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1545926109031097500, NULL, NULL, 'ทดสอบ', NULL, '', 30, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `stock_product_group` VALUES (1546418091047283400, 10, 13, 'ไม้ฝาเฌอร่า สีพิเศษ', '1546417035098713000.jpg', '', 30, NULL, 1545917257000291600, 54, 508, NULL, NULL);
INSERT INTO `stock_product_group` VALUES (1546418371030190700, 10, 13, 'ไม้ฝาเฌอร่า ลายสัก กลุ่มสีธรรมชาติ', '1546826225032301600.png', '<p>222555</p>', 10, 10, 1545917257000291700, 54, 508, '<p>11444</p>', 10);
INSERT INTO `stock_product_group` VALUES (1546507592062076000, 10, 13, 'ไม้ฝาเฌอร่า ลายสัก กลุ่มสีคลาสิค วู้ด', ',1546824728036291900.png', '<p><strong><em><u>ประกอบด้วยสี แดงเชอ.....</u></em></strong></p><p><br></p>', 10, 30, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1546508826076819800, 10, 13, 'ไม้ฝาเฌอร่า ลายสัก กลุ่มสีคูลซีรีย์', ',1546826739008699100.png', '', 10, 60, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1546528927031467300, 10, 13, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ กลุ่มสีธรรมชาติ', ',1546826286001656800.png', '', 10, 70, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1546530512029000000, 10, 13, 'ไม้ฝาเฌอร่า รุ่นสเปลนดิด แพลงค์ ลายชัยพฤกษ์', ',1546530685012979700.png,1546530976007967000.png', '', 30, NULL, 1545917257000291700, 54, 508, NULL, NULL);
INSERT INTO `stock_product_group` VALUES (1546564362025650000, 10, 13, 'ไม้ฝาเฌอร่า ลายสัก กลุ่มสีพิเศษ', ',1546824693091509200.png', '', 10, 40, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1546564452072110000, 10, 13, 'ไม้ฝาเฌอร่า ลายสัก กลุ่มสีพรีเมี่ยม', ',1546826157047799600.png', '', 10, 50, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1546565236069196700, 10, 13, 'ไม้ฝาเฌอร่า รุ่นสเปลนดิด แพลงค์ ลายผิวเรียบ', ',1546828718096473600.png', '<h3>ไม้ฝาเฌอร่า รุ่นสเปลนดิด แพลงค์ ลายผิวเรียบ</h3>', 10, 90, 1545917257000291700, 54, 508, '<p><a class=\"fr-file\" href=\"https://storage.dconhub.com/files/5c55e7489d323.txt\" target=\"_blank\">data.txt</a></p>', 10);
INSERT INTO `stock_product_group` VALUES (1546565339004190800, 10, 13, 'ไม้ฝาเฌอร่า รุ่นโมเดิร์นสแทกเกอร์ ลายผิวเรียบ', ',1546830410010581300.png', '', 10, 100, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1546828010075495700, 10, 13, 'ไม้ฝาเฌอร่า รุ่นสเปลนดิด แพลงค์ ลายชัยพฤกษ์', '1546828035034915700.png', '', 10, 80, 1545917257000291700, 54, 508, '', 10);
INSERT INTO `stock_product_group` VALUES (1546831176057707300, 10, 13, 'ไม้เชิงชายเฌอร่า รุ่นขอบบัว EA001 (ผิวเรียบ)', ',1546849789055568500.png', '', 10, 190, 1545917257000291700, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546831396038173600, 10, 13, 'ไม้เชิงชายเฌอร่า รุ่นลบขอบ EA006 (ผิวเรียบ)', ',1546850141082001400.png', '', 10, 200, 1545917257000291700, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546831668092069400, 10, 13, 'ไม้เชิงชายเฌอร่า ผิวเรียบ รุ่นโปร', ',1546850370016879000.png', '', 10, 210, 1545917257000291700, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546850611097754600, 10, 13, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก ลายดอกจิก', '1546850611097742400.jpg,1546851048055797900.jpg', '', 10, 490, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546851091081274000, 10, 13, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก ลายคลาสสิค', ',1549956572046714400.png', '', 10, 390, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546851174008734400, 10, 13, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก ลายพวงทอง', '1550737969084941900.jpg', '', 10, 470, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546851412089394100, 10, 13, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ ลายระฆังทอง', '1550223119069073500.jpg', '', 10, 430, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546852017046928500, 10, 13, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ ลายหัวใจ', ',1550217363029225800.jpg', '', 10, 230, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546852479055263500, 10, 13, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก ลายบัวหลวง', '1550223119069073500.jpg', '', 10, 220, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546852520020320800, 10, 13, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก ลายดอกรัก', ',1579320750049738200.jpg,1588906826011489700.png', '', 10, 240, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546852566058488000, 10, 13, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก ลายทิวลิป', ',1579326247016627600.jpg,1588910518099871000.jpg', '', 10, 440, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546852608095141800, 10, 13, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ ลายหัวใจ', ',1579326381064675800.jpg,1588910633015870000.jpg', '', 10, 460, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546852653055166100, 10, 13, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ ลายบานบุรี', ',1579326296044289000.jpg,1588910581014528900.jpg', '', 10, 450, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546852696092912100, 10, 13, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ ลายสร้อยอินทนิล', ',1579326525035824700.jpg,1588910735055750300.jpg', '', 10, 480, 1551704232055706900, 54, 509, '', 10);
INSERT INTO `stock_product_group` VALUES (1546920179086591200, 10, 13, 'ไม้กันตกเฌอร่าลายลิลลี่ ผิวเรียบ', ',1579326822043729300.jpg,1588910871058645400.jpg', '', 10, 510, 1551704232055706900, 54, 613, '', 10);
INSERT INTO `stock_product_group` VALUES (1546920249009315500, 10, 13, 'ไม้กันตกเฌอร่าลายโรส ผิวเรียบ', ',1579326160077517100.jpg,1588910241059473600.jpg', '', 10, 400, 1545917257000291700, 54, 613, '', 10);
INSERT INTO `stock_product_group` VALUES (1546928175086540500, 10, 13, 'ฉลุช่องลมเฌอร่า สีธรรมชาติ', ',1579326943061494000.jpg,1588910809059176200.jpg', '', 10, 500, 1551704232055706900, 54, 614, '', 10);
INSERT INTO `stock_product_group` VALUES (1546934664077148900, 10, 13, 'ไม้ปิดกันนกเฌอร่า สำหรับกระเบื้องลอนคู่ EA002 (ลายสัก)', ',1579323632001540600.jpg,1588912466001593100.jpg', '', 10, 520, 1545917257000291700, 54, 619, '', 10);
INSERT INTO `stock_product_group` VALUES (1546934715073315400, 10, 13, 'ไม้ปิดกันนกเฌอร่า สำหรับกระเบื้องไตรลอน EA005 (ลายสัก)', ',1579323577044564400.jpg,1588912521085312200.jpg', '', 10, 530, 1545917257000291700, 54, 619, '', 10);
INSERT INTO `stock_product_group` VALUES (1546936105043521400, 10, 13, 'ไม้ระแนงเฌอร่า รุ่นขอบตรง (ลายสัก) กว้าง 2 นิ้ว/ 3 นิ้ว', ',1579319694020515100.jpg,1588868694084232800.jpg', '', 10, 110, 1545917257000291700, 54, 599, '', 10);
INSERT INTO `stock_product_group` VALUES (1546936164053219900, 10, 13, 'ไม้ระแนงเฌอร่า รุ่นขอบตรง (ผิวเรียบ) กว้าง 3 นิ้ว/ 4 นิ้ว', ',1579321158036130400.jpg,1588907395014187200.png', '', 10, 270, 1545917257000291700, 54, 599, '', 10);
INSERT INTO `stock_product_group` VALUES (1546936246029411800, 10, 13, 'ไม้ระแนงเฌอร่า รุ่นขอบวี (ผิวเรียบ) กว้าง 3 นิ้ว/ 4 นิ้ว', ',1579319892083057800.jpg,1588868926057651700.png', '', 10, 120, 1545917257000291700, 54, 599, '', 10);
INSERT INTO `stock_product_group` VALUES (1546936294031804100, 10, 13, 'ไม้ระแนงเฌอร่า รุ่นขอบวี (ลายเสี้ยน) กว้าง 3 นิ้ว/ 4 นิ้ว', ',1579320072089711900.png,1588869218000512800.png', '', 10, 130, 1545917257000291700, 54, 599, '', 10);
INSERT INTO `stock_product_group` VALUES (1547083212073217900, 10, 13, 'ไม้อัดเอ็นจิเนียร์เฌอร่า กลุ่มสีธรรมชาติ', ',1579327132075171500.jpg,1588913232080161800.jpg', '', 10, 670, 1551705469094719300, 54, 628, '', 10);
INSERT INTO `stock_product_group` VALUES (1547084336005476700, 10, 13, 'ไม้บัวเฌอร่า ผิวเรียบ กลุ่มสีธรรมชาติ', '1549110920014190700.png,1579320346058158400.jpg,1588869721033190500.png,1588870738009463200.jpg', '', 10, 150, 1545917257000291700, 54, 600, '', 10);
INSERT INTO `stock_product_group` VALUES (1547084391002232100, 10, 13, 'ไม้จบบัวเฌอร่า ผิวเรียบ กลุ่มสีธรรมชาติ', ',1579320435028288400.png,1588869818047774700.png', '', 10, 160, 1545917257000291700, 54, 600, '', 10);
INSERT INTO `stock_product_group` VALUES (1547084441078103200, 10, 13, 'ไม้มอบเฌอร่า ผิวเรียบ กลุ่มสีธรรมชาติ', ',1579320242062225800.jpg,1588869555094989500.png', '', 10, 140, 1545917257000291700, 54, 600, '', 10);
INSERT INTO `stock_product_group` VALUES (1547084492086941200, 10, 13, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นคลาสสิค', ',1579320567043509800.jpg,1588870169081608200.png', '', 10, 170, 1545917257000291700, 54, 600, '', 10);
INSERT INTO `stock_product_group` VALUES (1547084678056291100, 10, 13, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นโมเดิร์น', ',1579320611049160300.jpg,1588870457061516600.jpg', '', 10, 180, 1545917257000291700, 54, 600, '', 10);
INSERT INTO `stock_product_group` VALUES (1547106933036728500, 10, 13, 'ไม้รั้วเฌอร่า กลุ่มสีธรรมชาติ', '1547271549083910700.jpg,1588910325025516100.jpg', '', 10, 410, 1545917257000291700, 54, 602, '', 10);
INSERT INTO `stock_product_group` VALUES (1547106977067962800, 10, 13, 'ไม้รั้วเฌอร่า กลุ่มใหม่ หนา 1.6 ', ',1579325880035257400.jpg,1588910437032663200.jpg', '', 10, 420, 1545917257000291700, 54, 602, '', 10);
INSERT INTO `stock_product_group` VALUES (1547428318063363600, 10, 13, 'ไม้บันไดเฌอร่า ลายชัยพฤกษ์ : ลูกนอน กลุ่มสีธรรมชาติ', ',1579326025059085800.jpg,1588909354048909300.jpg', '', 10, 370, 1545917257000291700, 54, 622, '', 10);
INSERT INTO `stock_product_group` VALUES (1547428385096188700, 10, 13, 'ไม้บันไดเฌอร่า ลายเสี้ยน : ลูกนอน กลุ่มสีธรรมชาติ', ',1579321101017312000.png,1588907191010188200.png', '', 10, 260, 1545917257000291700, 54, 622, '', 10);
INSERT INTO `stock_product_group` VALUES (1547428528085084400, 10, 13, 'ไม้บันไดเฌอร่า ผิวเรียบ : ลูกตั้ง กลุ่มสีธรรมชาติ', ',1579326098046212400.jpg,1588909418049115500.jpg', '', 10, 380, 1545917257000291700, 54, 622, '', 10);
INSERT INTO `stock_product_group` VALUES (1547516970083050600, 10, 13, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง', ',1579327083032213800.jpg,1588909260058799700.jpg', '', 10, 360, 1551704232055706900, 54, 627, '', 10);
INSERT INTO `stock_product_group` VALUES (1547517014054981700, 10, 13, 'ไม้ตกแต่งเฌอร่า ผิวเรียบ รุ่นขอบตรง', ',1579321231086477200.jpg,1588907496061977400.png', '', 10, 280, NULL, 54, 627, '', 10);
INSERT INTO `stock_product_group` VALUES (1547715290000763000, 10, 13, 'ประตูเฌอร่า  G-Series (ผิวเรียบ เว้นร่อง) เจาะรูลูกบิด', ',1579326701081108900.jpg,1588912588097307600.jpg', '', 10, 540, 1549696506082728000, 54, 605, '', 10);
INSERT INTO `stock_product_group` VALUES (1547715337030293400, 10, 13, 'ประตูเฌอร่า  G-Series (ผิวเรียบ เว้นร่อง) ไม่เจาะรูลูกบิด', ',1579326741057212200.jpg,1588912664006887300.jpg', '', 10, 550, 1549696506082728000, 54, 605, '', 10);
INSERT INTO `stock_product_group` VALUES (1547780436096578200, 10, 5, 'แผ่นฝ้า SHERA BOARD (ผิวเรียบ)', ',1579327332006663800.jpg,1588912829033991200.jpg', '', 10, 600, 1545923960002445000, 26, 200, '', 10);
INSERT INTO `stock_product_group` VALUES (1547791557032501500, 10, 5, 'แผ่นฝ้าระบายอากาศ รุ่นคลาสสิค / โมเดิร์น', ',1579327466014850200.jpg,1588913024000835800.jpg', '<h1>เหล็กเส้นกลม มอก. (Round Bars RB)</h1><p>ตามมาตรฐาน มอก. 24-2548 กำหนดให้เหล็กเส้นกลมที่มีชั้นคุณภาพ SR24 ซึ่งหมายถึงเหล็กต้องมีกำลังจุดคลากไม่ต่ำกว่า 2,400 กิโลกรัม/ตารางเซนติเมตร ขนาดของเหล็กมีตั้งแต่ 6มม. ถึง 25 มม. ส่วนความยาวมาตรฐานคือ 10 ม. และ 12ม. หรือสามารถสั่งดัดพิเศษตามแบบที่ต้องการได้ เหล็กขนาด 6มม. และ 9มม. มักถูกใช้เป็นเหล็กปลอกในคานหรือในเสา ส่วนเหล็กขนาด 12มม. ขึ้นไป มักจะถูกใช้ในงาน เหล็กเสริมแกนในงานคอนกรีต เพื่อเพิ่มความแข็งแรงให้กับโครงสร้างนั้นๆ</p><h1>เหล็กข้ออ้อย มอก. (Deformed Bars DB)</h1><p>เนื่องจากผิวของเหล็กมีลักษณะเป็นปล้องๆ คล้ายๆอ้อย จึงเรียกว่า เหล็กข้ออ้อย ตามมาตรฐาน มอก. 24-2536 กำหนดให้เหล็กข้ออ้อยมีชั้นคุณภาพหลายชั้น เช่น SD30, SD40, SD50 และ SD60 ซึ่ง SD30 จะหมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 3,000 กิโลกรัม/ตารางเซนติเมตร หรือ SD40 หมายถึงเหล็กที่ต้องมีกำลังจุดคลากไม่ต่ำกว่า 4,000 กิโลกรัม/เซนติเมตร ขนาดของเหล็กมีตั้งแต่ 10มม. ถึง 40 มม. แต่ที่นิยมใช้สำหรับงานก่อสร้างบ้านเราคือขนาด 12มม. ถึง 25 มม. ความยาวมาตรฐานคือ 10ม. และ 12มม. เหล็กข้ออ้อยจะใช้ในงานก่อสร้างที่ต้องรับน้ำหนักมากๆ</p><p><br></p><figure><br></figure><p><br></p><figure><img data-fr-image-pasted=\"true\" alt=\"เหล็กเส้น,เหล็กข้ออ้อย,เหล็กเส้นกลม,เหลกเส้นกลม,ราคาถูก\" data-original=\"https://static-marketing-3.onestockhome.com/content_images/products/76323991/03cb3134a725a0c8e6f5e70b0091ec74\" src=\"blob:http://backend.stock.local/67036e91-bada-4f59-8041-680207e99adc\" class=\"fr-fic fr-dii\"></figure><p><br></p><figure><img data-fr-image-pasted=\"true\" alt=\"เหล็กเส้นกลม,เหล็กข้ออ้อย,เหล็ก,บลกท,เหล็กกรุงเทพ,โรงเหล็กกรุงเทพ\" data-original=\"https://static-marketing-3.onestockhome.com/content_images/products/76323991/ead8c9b548aba0f31974e4eb973f41d3\" src=\"blob:http://backend.stock.local/239c14be-c4d3-4ef6-b5bc-74ef8fef1d3f\" class=\"fr-fic fr-dii\"></figure><p><br></p><h2>อะไรคือ เหล็กเส้นกลมรีดซ้ำ? โปรดระวัง!&nbsp;</h2><p>หลายคนคงเคยได้ยินว่าท้องตลาด มีการจำหน่ายเหล็กเส้นกลมรีดซ้ำ เหล็กประเภทนี้ แม้จะมี มอก.รับรอง เพราะเป็นเหล็กที่ได้จากการนำเศษเหล็กไปหลอม</p><p>แล้วรีดออกมาใหม่ จะมีสัญลักษณ์ว่า SRR24 มักจะใช้ได้กับงานเหล็กปลอกเท่านั้น แต่จะมีปัญหาคือ มีกำลังจุดคลากต่ำมาก</p><h2>ลักษณะเหล็กที่ดี มีคุณภาพ ควรมีข้อพิจารณาสำคัญ 2 หลักการใหญ่</h2><h3>ผิวเหล็ก</h3><ul><li>เหล็กเส้นกลม ต้องผิวเรียบเกลี้ยง ไม่มีปีก ลุกคลื่น หน้าตัดกลม ไม่เบี้ยว ไม่มีรอยปริแตก</li><li>เหล็กข้ออ้อย ต้องมีบั้งระยะเท่ากัน สม่ำเสมอตลอดทั้งเส้น</li></ul><h3>เส้นผ่านศูนย์กลางและน้ำหนัก ต้องได้ตรงตามมาตรฐาน</h3><ul><li>เมื่อดัดโค้ง งอ ต้องไม่ปริแตก หักง่าย</li><li>เช่นเหล็กเส้นกลม SR-24 ขนาดบนเนื้อเหล็ก 9 มม. เมื่อวัดเส้นผ่านศูนย์กลาง ต้องได้ 9 มม. ชั่งน้ำหนักต้องได้ 0.499 กก. ต่อความยาว 1 เมตร และความยาวเหล็กเส้นกลมมาตรฐานทั้งเส้นอยู่ที่ 10 เมตร</li><li>เหล็กต้องไม่เป็นสนิมขุมกินเข้าไปในเนื้อเหล็ก หมายเหตุ แต่ไม่ต้องวิตกกังวลที่เห็น ผิวเหล็กเป็นสนิม เพราะเป็นเรื่องปกติตามสภาพธรรมชาติร้อนชื้นของประเทศไทย &nbsp;</li></ul><h2>การผลิตเหล็กเส้น</h2><p>การผลิตเหล็กเส้น เกิดจากการป้อนเศษเหล็ก ปูนขาว และถ่านโค๊กที่มีคุณภาพในประมาณที่เหมาะสมเข้าเตาอาร์คไฟฟ้า EAF ในระหว่างการหลอมเหล็กที่ได้ จะผ่านกรรมวิธีทางเคมี และความร้อนเพื่อปรุงส่วนผสม เมื่อน้ำเหล็กมีอุณหภูมิและส่วนผสมทางเคมีที่ถูกต้อง หลังจากการตรวจสอบจากห้องทดลองแล้ว น้ำเหล็กจะถูกส่งมายังเครื่องหล่อแบบต่อเนื่อง เพื่อผลิตบิลเล็ตที่มีคุณภาพสูงต่อไป</p><p>บิลเล็ตที่ได้นี้ จะถูกนำเข้าตาอบที่อุณหภูมิสูง 1050 องศาเซลเซียส เพื่อปรับสภาพเนื้อเหล็กที่สามารถถูกรีดลดขนาดตามต้องการได้</p><h2>โลหะวิทยาของเหล็กกล้า</h2><p>เหล็กเส้นที่ผลิตในประเทศไทยนั้น ในเชิงวิชาการจัดได้ว่าอยู่ในหมวดเหล็กกล้าคาร์บอน ซึ่งเป็นเหล็กที่ได้คุณสมบัติการใช้งานจากธาตุผสมเพียง 3 ธาตุ อันได้แก่ คาร์บอน ซิลิกอน และ แมงกานีส นอกจากเหล็กกล้าคาร์บอนแล้ว เหล็กกลุ่มอื่นๆ ที่สำคัญได้แก่ เหล็กกล้าเครื่องมือและเหล็กกล้าผสม มีธาตุผสมของโครเมี่ยม นิกเกิล วาเนเดียม เหล็กกล้าความเร็วสูง อันได้แก่ เหล็กกล้าสำหรับงานเชื่อม ที่มีแมงกานีสสูง เป็นต้น</p><p>เหล็กกล้าคาร์บอนที่ผลิตในประเทศไทย สามารถแบ่งย่อยได้เป็นสองกลุ่ม อันได้แก่ เหล็กกล้าที่มีธาตุคาร์บอนน้อยกว่า 0.25% เหล็กกล้าคาร์บอนต่ำนี้ นำมาทำเหล็กลวดและเหล็กเส้น กลุ่มที่สองนี้ได้แก่ เหล็กกล้าคาร์บอนปานกลาง มีคาร์บอนระหว่าง 0.25-0.35% เหล็กกลุ่มนี้เหมาะที่จะนำไปทำเหล็กข้ออ้อย</p><h2>ค่าแรงดึง และการยึดตัวที่เป็นข้อกำหนดการใช้งานของเหล็กกล้าคาร์บอน</h2><p>โดยจะแบ่งได้เป็นสัดส่วนดังนี้&nbsp;</p><ol><li>ส่วนผสมและอัตราส่วนการผสมของคาร์บอน ซิลิกอน แมงกานีส และในบางกรณีมีธาตุวานาเดียมเพื่อเพิ่มประสิทธิภาพให้ความแข็งแรง แต่ขณะเดียวกัน ก็จะลดการยืดตัวของเหล็กเช่นกัน ในขณะที่แมงกานีสจะมีผลในการเพิ่มแรงดึงสูงสุดและการยืดตัว อย่างไรก็ตาม การปรับปริมาณของธาตุทั้งสาม ต้องให้กิดความสมดุล มิฉะนั้นจะทำให้เหล็กไม่มีคุณสมบัติตามที่ต้องการ</li><li>คุณภาพของเนื้อเหล็กระหว่างการหลอม และเท เป็นแท่ง เป็นส่วนสำคัญขั้นที่สอง เพื่อให้ได้เหล็กแท่งเนื้อสะอาด มีขนาดผลึก และการกระจายตัวทางเคมีที่สม่ำเสมอ</li><li>ประสิทธิภาพและวิศวกรรมของเครื่องรีดและการควบคุมการรีด โดยทางโรงงานเลือกใช้นวัตกรรมของเครื่องจักรสำหรับศตวรรษนี้ อันได้แก่เครื่องจักรทั้งชุด ควบคุมด้วยเครื่องคอมพิวเตอร์ แท่นรีด เป็นระบบ H-V และมีระบบการปรับลดอุณหภูมิของเหล็กที่แม่นยำ</li></ol><h2>ใบ Certificate มอก.&nbsp;</h2><p><br></p><figure><img alt=\"ใบ มอก. เหล็ก\" src=\"https://storage.dconhub.com/images/5c41e9c025539.png\" class=\"fr-fic fr-dii\" data-id=\"5c41e9c025539.png\"></figure><p>&nbsp;</p><h2>เหล็ก ข้ออ้อย&nbsp;SD40 ต่างกับ SD40T อย่างไร?</h2><p>เหล็ก SD40 เป็นเหล็กเดิมที่ใช้กันมานาน ส่วนเหล็ก ข้ออ้อย SD40T ผลิตจากกระบวนการ Thermal Treatment ซึ่งต่างประเทศเรียกเหล็กเหล่านี้ว่า เหล็ก TMT บ้านเราเรียก tempt core ซึ่งใช้กระบวนการชุบแข็งด้วยความร้อน ปัจจุบัน ในการผลิตจะมีการใช้ spray สเปรย์น้ำลงบนเหล็กที่เพิ่งรีดขณะร้อนแดง ทำให้อุณหภูมิลดลงอย่างรวดเร็ว ดังนั้น เนื้อเหล็กจะไม่แข็งเท่ากันอีกต่อไป การผลิตเหล็ก SD40T นี้จะทำให้เนื้อเหล็ก ตรงกลางจะนิ่มและยืดหยุ่นได้ดี รอบๆจะมีวงแหวน เกิดจากการชุบแข็ง ให้แข็งเป็นพิเศษ เหล็กที่เป็น SD40T ใกล้เคียงกับ SD40 เดิม รับแรง ทนแรงดึงได้ประมาณเดิม ยืดหยุ่นใกล้เคียงกับแบบเดิม</p><h2>ข้อดีข้อเสียจากการนำเหล็ก ข้ออ้อย SD40T ไปใช้งาน&nbsp;</h2><p>เหล็ก SD40T รับแรงได้เท่าเดิม ความยืดหยุ่นได้ประมาณเดิม ไม่ได้แตกต่างไปจากเดิมเท่าไร แต่เนื่องจากผิวด้านนอกที่แข็งกว่าด้านใน การทำเกลียวหรือการดัดงอบางประเภท อาจจะทำให้ผิวแตกได้ การทำเกลียว จะต้องมีเทคนิคพิเศษ</p><h2>การยอมรับอย่างเป็นทางการ ของคุณสมบัติ เหล็กข้ออ้อย SD40T ว่าเป็นชั้นเทียบเท่ากับ SD40</h2><p>เนื้อหาเอกสาร มีดังต่อไปนี้ (อ้างอิงเพื่อให้สามารถค้นหาเจอผ่านระบบได้ จัดพิมพ์ข้อความด้านล่างโดย วันสต๊อกโฮม)โดยสำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรม เมื่อวันที่ ๑๕ มีนาคม ๒๕๖๑ตามหนังสือที่อ้างถึง สมาคมอุตสาหกรรมเหล็กไทยขอให้สำนักงานมาตรฐานผลิตภัณฑ์อุตสาหกรรมพิจารณาปร้ะเด็นปัญหาของผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย ที่เป็นไปตามมาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อย มาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ และมีการแสดงอักษร T กำกับในเครื่องหมายและฉลากเพื่อระบุว่าผ่านกรรมวิธีทางความร้อน ซึ่งการแสดงสัญลักษณ์ดังกล่าว ทำให้เกิดปัญหาในการจัดซื้อจัดจ้าง เนื่องจากการประกาศราคากลางของกระทรวงพาณิชย์ มีระบบข้อกำหนดสำหรับชั้นคุณภาพของเหล็กข้ออ้อย SD 30 SD 40 และ SD 50 เท่านั้น แต่ไม่มีการระบุข้อกำหนด สำหรับ SD 30T SD 40T และ SD 50T ทำให้ผู้ใข้และผู้ทำผลิตภัณฑ์ที่มีการแสดงอักษร Tดังกล่าว ไม่สามารถดำเนินการตรวจรับและส่งมอบงานได้ ความละเอียดแจ้งแล้ว นั้น สำนักงานขอเรียนว่า มาตรฐานผลิตภัณฑ์อุตสาหกรรมเหล็กเส้นเสริมคอนกรีต : เหล็กข้ออ้อยมาตรฐานเลขที่ มอก. ๒๔-๒๕๕๙ ข้อ ๓.๑ ระบุชั้นคุณภาพ ๓ ชั้นคุณภาพ คือ SD 30 SD 40 และ SD 50 ส่วนการระบุสัญลักษณ์ &ldquo;T&rdquo; ตามข้อ ๗.๑ (๔) และข้อ ๗.๒(๔) เป็นการกำหนดให้ต้องทำบนเนื้อเหล็กข้ออ้อยและที่มัดหรือที่ขดของเหล็กข้ออ้อยเฉพาะผ่านกรรมวิธีทางความร้อน (Heat Treatment) ในระหว่างการผลิตและกำหนดให้แสดงเป็นลำดับถัดจากสัญลักษณ์ชั้นคุณภาพ ดังนั้น เหล็กข้ออ้อยที่มีชั้นคุณภาพเดียวกัน ทั้งที่มี และไม่มี สัญลักษณ์ &ldquo;T&rdquo; ต่อท้าย เป็นเหล็กข้ออ้อยชั้นคุณภาพเดียวกัน และมีเกณฑ์กกำหนดในการทดสอบตาม มอก. เหมือนกันทุกประการจึงเรียนมาเพื่อทราบกองกำหนดมาตรฐาน กลุ่มกำหนดมาตรฐาน ๑&nbsp;</p><p><br></p><figure><br></figure>', 10, 620, 1545923960002445000, 26, 200, '<p><a class=\"fr-file\" href=\"https://storage.dconhub.com/files/5c41e90e48cd1.xlsx\" target=\"_blank\">backup_data_default-module_2019_01_11 (2).xlsx</a><br><a class=\"fr-file\" href=\"https://storage.dconhub.com/files/5c41e91a28dc4.xlsx\" target=\"_blank\">backup_ezform_sitemap_v1_1547109781079317500.xlsx</a></p>', 10);
INSERT INTO `stock_product_group` VALUES (1548130457026405700, 10, 5, 'แผ่นฝ้าลาย  Deco Ceiling T-bar 3 ลาย', ',1579327537077596800.jpg,1588913076069711000.jpg', '', 10, 630, 1545923960002445000, 26, 200, '', 10);
INSERT INTO `stock_product_group` VALUES (1548142388022844500, 10, 5, 'แผ่นฝ้า  Deco ceilling T-bar ขาวเรียบ', ',1579327604016851900.jpg,1588913135092730500.jpg', '', 10, 640, 1545923960002445000, 26, 200, '', 10);
INSERT INTO `stock_product_group` VALUES (1548147832017289700, 10, 5, 'แผ่นฝ้า เฌอร่าบอร์ด   Deco Ceilling ', ',1579327412065833900.jpg,1588912917040096700.jpg', '', 10, 610, 1545923960002445000, 26, 200, '', 10);
INSERT INTO `stock_product_group` VALUES (1548149420057763100, 10, 5, 'แผ่นผนัง รุ่นขอบตรง  wall Board (Material Group151)', ',1579327698093567600.jpg,1588913172033609300.jpg', '', 10, 650, 1545923960002445000, 26, 201, '', 10);
INSERT INTO `stock_product_group` VALUES (1548149478045354000, 10, 5, 'แผ่นผนัง รุ่นขอบลาด 2 ด้าน  wall Board (Material Group151)', ',1579327739095096300.jpg,1588913208053545700.jpg', '', 10, 660, 1545923960002445000, 26, 201, '', 10);
INSERT INTO `stock_product_group` VALUES (1548209737057228900, 10, 13, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง (SHERA floor plank) กลุ่มสีธรรมชาติ', ',1579327006022106400.jpg,1588909190024742700.jpg', '', 10, 350, NULL, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548210280075015700, 10, 13, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง (SHERA floor plank) กลุ่มสีรองพื้น', ',1579321972073768200.jpg,1588909026080957800.jpg', '', 10, 340, NULL, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548210313056717900, 10, 13, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง (SHERA floor plank) กลุ่มสีพิเศษ', ',1579321709068180400.jpg,1588908893058274100.jpg', '', 10, 320, NULL, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548381551019428400, 10, 13, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง กลุ่มสีธรรมชาติ', ',1579320959067081100.jpg,1588907083094760200.png', '', 10, 250, NULL, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548381592051510600, 10, 13, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง กลุ่มสีรองพื้น', ',1579321305090267900.jpg,1588907715075923500.png', '', 10, 290, NULL, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548727627017284300, 10, 13, 'ไม้พื้นเฌอร่า ลายเสี้ยนตรง รุ่นขอบวี (SHERA floor plank) กลุ่มสีธรรมชาติ', ',1579321508011823000.jpg,1588907933056471800.png', '', 10, 310, 1545917257000291700, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548728602060380900, 10, 13, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายชัยพฤกษ์ รุ่นขอบวี', ',1579321397005669600.png,1588907805004644900.png', '', 10, 300, 1545917257000291700, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548728665070423000, 10, 13, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยนตรง รุ่นขอบวี', ',1579321828074935700.jpg,1588908355046263200.png', '', 10, 330, 1545917257000291700, 54, 626, '', 10);
INSERT INTO `stock_product_group` VALUES (1548735452067133300, 10, 13, 'ประตูเฌอร่า  G-Series (ผิวเรียบ เว้นร่อง) เจาะรูลูกบิด รุ่น GP02', '1546825149061949400.jpg', '', 30, 570, 1549696506082728000, 54, 605, '', 20);
INSERT INTO `stock_product_group` VALUES (1548735497085700000, 10, 13, 'ประตูเฌอร่า  G-Series (ผิวเรียบ เว้นร่อง) ไม่เจาะรูลูกบิด รุ่น  GP02', '1546825149061949400.jpg', '', 30, 560, 1549696506082728000, 54, 605, '', 20);
INSERT INTO `stock_product_group` VALUES (1548818815090656600, 10, 13, 'วงกบประตูเฌอร่า ผิวเรียบ รุ่นคลาสสิค กลุ่มสีธรรมชาติ', '1546825149061949400.jpg,1579328318086857400.jpg,1588912715087211800.jpg', '', 10, 560, 1549696506082728000, 54, 604, '', 10);
INSERT INTO `stock_product_group` VALUES (1548818934067611500, 10, 13, 'วงกบหน้าต่างเฌอร่า ผิวเรียบ รุ่นคลาสสิค กลุ่มสีธรรมชาติ', '1546918343044521400.jpg,1579328361092798100.jpg,1588912750069189100.jpg', '', 10, 580, 1549696506082728000, 54, 604, '', 10);
INSERT INTO `stock_product_group` VALUES (1548897497049922300, 10, 8, 'หลังคา ห้าห่วง ซีดาร์ เชค รุ่นมาตรฐาน(Zedar Shake) กลุ่มสีพิเศษ', ',1550131233080903700.jpg', '', 10, 590, 1549097788060708600, 37, 630, '', 10);
INSERT INTO `stock_product_group` VALUES (1548924450040985100, 10, 8, 'หลังคา ห้าห่วง ซีดาร์ เชค ผลิตภัณฑ์สั่งทำ(Zedar Shake) กลุ่มสีพิเศษ', '1550128291006336500.png,1550131214037665000.jpg', '', 10, 570, 1549097788060708600, 37, 630, '', 10);
INSERT INTO `stock_product_group` VALUES (1549110775006774200, 10, 615, 'cn001', ',1549126154068378100.png', '', 30, NULL, 1549109648098443500, 631, 632, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for stock_product_items
-- ----------------------------
DROP TABLE IF EXISTS `stock_product_items`;
CREATE TABLE `stock_product_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหมวดสินค้า',
  `group_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT 'ชื่อหมวดสินค้า',
  `icon` text DEFAULT NULL COMMENT 'โลโก้',
  `size` text DEFAULT NULL COMMENT 'ขนาด',
  `weight` text DEFAULT NULL COMMENT 'น้ำหนัก',
  `price` decimal(10,2) DEFAULT NULL,
  `price_update` decimal(10,0) DEFAULT NULL,
  `deleted` tinyint(2) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `sub_brand_id` bigint(20) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL COMMENT 'product_id',
  `product_detail` longtext DEFAULT NULL COMMENT 'รายละเอียดสินค้า',
  `forder` int(11) DEFAULT NULL COMMENT 'เรียงลำดับ',
  `file_upload` longtext DEFAULT NULL,
  `icon_preview` longtext DEFAULT NULL COMMENT 'รูปภาพสำหรับแสดงภาพเดียว',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1549677574051563301 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of stock_product_items
-- ----------------------------
BEGIN;
INSERT INTO `stock_product_items` VALUES (1544930962083475300, 1544898741052574100, 'เหล็กเส้นกลม SR24 RB 6 ยาว 10ม. 2.22กก./เส้น', '1544930962083446200.png', 'เหล็กเส้นกลม 2 หุน SR24 มีแบบ เหล็กเหยียด/พับ', '2.22', 44.41, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544930962083446200.png');
INSERT INTO `stock_product_items` VALUES (1544931008061872900, 1544898741052574100, 'เหล็กเส้นกลม SR24 RB 9 ยาว 10ม. 4.99กก./เส้น', '1544931008061843800.png', 'เหล็กเส้นกลม 3 หุน มีแบบ เหล็กเหยียด/พับ', '4.99', 96.82, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544931008061843800.png');
INSERT INTO `stock_product_items` VALUES (1544932622055765400, 1544898741052574100, 'เหล็กเส้นกลม SR24 RB 12 ยาว 10ม. 8.88กก./เส้น', '1544932622055694500.png', 'เหล็กเส้นกลม 4 หุน มีแบบ เหล็กเหยียด/พับ', '8.88', 168.73, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544932622055694500.png');
INSERT INTO `stock_product_items` VALUES (1544940966039897200, 1544898741052574100, 'เหล็กข้ออ้อย SD40T DB 12 ยาว 10ม. 8.88กก./เส้น', '1544940966039742200.png', 'เรียกว่า เหล็กข้ออ้อย 4 หุน หรือเหล็กปล้องอ้อยสี่หุน เหล็กเหยียด/พับ โดย SD40T มีประกาศให้เทียบเท่า SD40 โปรดตรวจสอบความเรียบร้อยก่อนการสั่งซื้อ', '8.88', 168.73, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544940966039742200.png');
INSERT INTO `stock_product_items` VALUES (1544941043063357800, 1544898741052574100, 'เหล็กข้ออ้อย SD40T DB 16 ยาว 10ม. 15.78กก./เส้น', '1544941043063323700.png', 'เหล็กข้ออ้อย 5 หุน เหล็กเหยียด/พับ โดย SD40T มีประกาศให้เทียบเท่า SD40 โปรดตรวจสอบความเรียบร้อยก่อนการสั่งซื้อ', '15.78', 295.10, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544941043063323700.png');
INSERT INTO `stock_product_items` VALUES (1544941104036735300, 1544898741052574100, 'เหล็กข้ออ้อย SD40T DB 20 ยาว 10ม. 24.66กก./เส้น', '1544941104036692500.png', 'เหล็กข้ออ้อย 6 หุน เหล็กเหยียด/พับ โดย SD40T มีประกาศให้เทียบเท่า SD40 โปรดตรวจสอบความเรียบร้อยก่อนการสั่งซื้อ', '24.66', 461.15, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544941104036692500.png');
INSERT INTO `stock_product_items` VALUES (1544941159059197600, 1544898741052574100, 'เหล็กข้ออ้อย SD40T DB 25 ยาว 10ม. 38.53กก./เส้น', '1544941159059118200.png', 'เหล็กข้ออ้อย 1 นิ้ว เหล็กเหยียด/พับ โดย SD40T มีประกาศให้เทียบเท่า SD40 โปรดตรวจสอบความเรียบร้อยก่อนการสั่งซื้อ', '38.53', 720.52, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544941159059118200.png');
INSERT INTO `stock_product_items` VALUES (1544941218033885300, 1544898741052574100, 'เหล็กข้ออ้อย SD40T DB 32 ยาว 10ม. 63.13กก./เส้น', '1544941218033846900.png', 'กรุณาแจ้ง เหล็กเหยียด/พับ และ SD40T มีประกาศให้เทียบเท่า SD40 โปรดตรวจสอบความเรียบร้อยก่อนการสั่งซื้อ', '63.13', 0.00, NULL, 10, NULL, NULL, 1, NULL, NULL, NULL, NULL, '1544941218033846900.png');
INSERT INTO `stock_product_items` VALUES (1545917514073636100, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีสักน้ำผึ้ง', '1546587438004560300.jpg', '0.8*15*300 ซม.', '5.4', 56.39, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530012', '', NULL, NULL, '1546587438004560300.jpg');
INSERT INTO `stock_product_items` VALUES (1545917722085384500, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีเหลืองการะเวก', '1546587424047369800.jpg', '0.8*20*400 ซม.', '9.6', 100.17, NULL, 10, 10, 1545917257000291700, 1015, '0040-010082040011', '', NULL, NULL, '1546587424047369800.jpg');
INSERT INTO `stock_product_items` VALUES (1545917821047604200, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีเหลืองการะเวก', '1546587413058880700.jpg', '0.8*20*300 ซม.', '7.2', 75.63, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030011', '', NULL, NULL, '1546587413058880700.jpg');
INSERT INTO `stock_product_items` VALUES (1545917887078546300, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีเหลืองการะเวก', '1546587401079406400.jpg,1549937895006355500.jpg', '0.8*15*400 ซม.', '7.2', 75.63, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540011', '', NULL, NULL, '1549937895006339700.jpg');
INSERT INTO `stock_product_items` VALUES (1545918187014793900, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีเหลืองการะเวก', '1546587391087442600.jpg', '0.8*15*300 ซม.', '5.4', 56.39, NULL, 10, 10, 1545923960002445000, 1015, '040-010081530011', '', NULL, NULL, '1546587391087442600.jpg');
INSERT INTO `stock_product_items` VALUES (1545918238015558000, 1546418371030190700, 'ไม้ฝาเฌอร่า ลายสัก สีธรรมชาติ', '1546587341096320100.jpg', '0.8*20*400 ซม.', '9.6', 76.24, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040001', '', NULL, NULL, '1546587341096320100.jpg');
INSERT INTO `stock_product_items` VALUES (1546417959037842700, 1546418371030190700, 'ไม้ฝาเฌอร่า ลายสัก สีธรรมชาติ', '1546587361044580800.jpg,1549937961095959200.jpg', '0.8*20*300 ซม.', '7.2', 57.33, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030001', '<p>xxx</p>', NULL, NULL, '1549937961095944500.jpg');
INSERT INTO `stock_product_items` VALUES (1546508222063296100, 1546418371030190700, 'ไม้ฝาเฌอร่า ลายสัก สีธรรมชาติ', '1546587308099743900.jpg,1549938013018066600.jpg', '0.8*15*400 ซม.', '7.2', 57.33, NULL, 10, 10, 1545917257000291700, 1015, '040-101081540001', '<p>แพค5 เลท175</p>', NULL, NULL, '1549938013018051800.jpg');
INSERT INTO `stock_product_items` VALUES (1546509171076391700, 1546418371030190700, 'ไม้ฝาเฌอร่า ลายสัก สีธรรมชาติ', '1546587292068296500.jpg,1549937990086322100.jpg', '0.8*15*300 ซม.', '5.4', 42.69, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530001', '', NULL, NULL, '1549937990086308000.jpg');
INSERT INTO `stock_product_items` VALUES (1546529267001500800, 1546528927031467300, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1546529267001487000.jpg', '0.8*15*300 ซม.', '5.4', 42.69, NULL, 10, 10, 1545917257000291700, 1015, '040-102081530001', '', NULL, NULL, '1546529267001487000.jpg');
INSERT INTO `stock_product_items` VALUES (1546529350003272800, 1546528927031467300, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1546529350003259600.jpg', '0.8*15*400 ซม.', '7.2', 57.33, NULL, 10, 10, 1545917257000291700, 1015, '040-102081540001', '', NULL, NULL, '1546529350003259600.jpg');
INSERT INTO `stock_product_items` VALUES (1546529414083107400, 1546528927031467300, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1546529414083093300.jpg', '0.8*20*300 ซม.', '7.2', 57.33, NULL, 10, 10, 1545917257000291700, 1015, '040-102082030001', '', NULL, NULL, '1546529414083093300.jpg');
INSERT INTO `stock_product_items` VALUES (1546529497023335300, 1546528927031467300, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1546529497023320100.jpg', '0.8*20*400 ซม.  ', '9.6', 76.24, NULL, 10, 10, 1545917257000291700, 1015, '040-102082040001', '', NULL, NULL, '1546529497023320100.jpg');
INSERT INTO `stock_product_items` VALUES (1546568163058892600, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีสักน้ำผึ้ง', '1546587236026277400.jpg', '0.8*15*400 ซม.', '7.2', 75.63, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540012', '', NULL, NULL, '1546587236026277400.jpg');
INSERT INTO `stock_product_items` VALUES (1546568230025264300, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีสักน้ำผึ้ง', '1546587225060579300.jpg', '0.8*20*300 ซม.', '7.2', 75.63, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030012', '', NULL, NULL, '1546587225060579300.jpg');
INSERT INTO `stock_product_items` VALUES (1546569120047019700, 1545918083028103900, 'ไม้ฝาเฌอร่า ลายสัก สีสักน้ำผึ้ง', '1546587214010618400.jpg', '0.8*20*400 ซม.', '9.6', 100.17, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040012', '', NULL, NULL, '1546587214010618400.jpg');
INSERT INTO `stock_product_items` VALUES (1546569431030593700, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงเชอรี่', '1546587196087820900.jpg', '0.8*15*300 ซม.', '5.4', 63.02, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530041', '', NULL, NULL, '1546587196087820900.jpg');
INSERT INTO `stock_product_items` VALUES (1546569495052506500, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงเชอรี่', '1546587185052515200.jpg', '0.8*15*400 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540041', '', NULL, NULL, '1546587185052515200.jpg');
INSERT INTO `stock_product_items` VALUES (1546569562052442400, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงเชอรี่', '1546587174039046000.jpg', '0.8*20*300 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030041', '', NULL, NULL, '1546587174039046000.jpg');
INSERT INTO `stock_product_items` VALUES (1546569622095878300, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงเชอรี่', '1546587162073411000.jpg', '0.8*20*400 ซม.', '9.6', 112.78, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040041', '', NULL, NULL, '1546587162073411000.jpg');
INSERT INTO `stock_product_items` VALUES (1546569711036827900, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลวอลนัท', '1546587135035955600.jpg', '0.8*15*300 ซม.', '5.4', 63.02, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530042', '', NULL, NULL, '1546587135035955600.jpg');
INSERT INTO `stock_product_items` VALUES (1546572311050997100, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลวอลนัท', '1546587123075320300.jpg', '0.8*15*400 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540042', '', NULL, NULL, '1546587123075320300.jpg');
INSERT INTO `stock_product_items` VALUES (1546572377005918000, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลวอลนัท', '1546587113020436000.jpg', '0.8*20*300 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030042', '', NULL, NULL, '1546587113020436000.jpg');
INSERT INTO `stock_product_items` VALUES (1546572430092859400, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลวอลนัท', '1546587095056111300.jpg', '0.8*20*400 ซม.', '9.6', 112.78, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040042', '', NULL, NULL, '1546587095056111300.jpg');
INSERT INTO `stock_product_items` VALUES (1546572508096367800, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทรายทอง', '1546587068037892600.jpg', '0.8*15*300 ซม.', '5.4', 63.02, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530043', '', NULL, NULL, '1546587068037892600.jpg');
INSERT INTO `stock_product_items` VALUES (1546572565023639200, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทรายทอง', '1546587051046148200.jpg', '0.8*15*400 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540043', '', NULL, NULL, '1546587051046148200.jpg');
INSERT INTO `stock_product_items` VALUES (1546572632011790300, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทรายทอง', '1546587034094139000.jpg', '0.8*20*300 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030043', '', NULL, NULL, '1546587034094139000.jpg');
INSERT INTO `stock_product_items` VALUES (1546572688018918900, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทรายทอง', '1546587019050995700.jpg', '0.8*20*400 ซม.', '9.6', 112.78, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040043', '', NULL, NULL, '1546587019050995700.jpg');
INSERT INTO `stock_product_items` VALUES (1546572754089208000, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลประดู่', '1546586997076568100.jpg', '0.8*15*300 ซม.', '5.4', 63.02, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530044', '', NULL, NULL, '1546586997076568100.jpg');
INSERT INTO `stock_product_items` VALUES (1546572800070343400, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลประดู่', '1546586984071727000.jpg', '0.8*15*400 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540044', '', NULL, NULL, '1546586984071727000.jpg');
INSERT INTO `stock_product_items` VALUES (1546572844044168300, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลประดู่', '1546586974008937600.jpg', '0.8*20*300 ซม.', '7.2', 84.25, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030044', '', NULL, NULL, '1546586974008937600.jpg');
INSERT INTO `stock_product_items` VALUES (1546572883049531900, 1546507592062076000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลประดู่', '1546586953015380300.jpg', '0.8*20*400 ซม.', '9.6', 112.78, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040044', '', NULL, NULL, '1546586953015380300.jpg');
INSERT INTO `stock_product_items` VALUES (1546573267079062200, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงมะฮอกกานี', '1546586930036201700.jpg', '0.8*15*300 ซม.', '5.4', 70.32, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530021', '', NULL, NULL, '1546586930036201700.jpg');
INSERT INTO `stock_product_items` VALUES (1546573329065529500, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงมะฮอกกานี', '1546586917030002600.jpg', '0.8*15*400 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540021', '', NULL, NULL, '1546586917030002600.jpg');
INSERT INTO `stock_product_items` VALUES (1546573394027564600, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงมะฮอกกานี', '1546586902085894300.jpg', '0.8*20*300 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030021', '', NULL, NULL, '1546586902085894300.jpg');
INSERT INTO `stock_product_items` VALUES (1546573459072501800, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงมะฮอกกานี', '1546586888035602600.jpg', '0.8*20*400 ซม.', '9.6', 126.05, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040021', '', NULL, NULL, '1546586888035602600.jpg');
INSERT INTO `stock_product_items` VALUES (1546573528050329500, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลไม้แดง', '1546586867043811200.jpg', '0.8*15*300 ซม.', '5.4', 70.32, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530022', '', NULL, NULL, '1546586867043811200.jpg');
INSERT INTO `stock_product_items` VALUES (1546573588044842600, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลไม้แดง', '1546586857044662800.jpg', '0.8*15*400 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540022', '', NULL, NULL, '1546586857044662800.jpg');
INSERT INTO `stock_product_items` VALUES (1546573677077300600, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลไม้แดง', '1546586843045833700.jpg', '0.8*20*300 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030022', '', NULL, NULL, '1546586843045833700.jpg');
INSERT INTO `stock_product_items` VALUES (1546573742071052300, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลไม้แดง', '1546586830099854100.jpg', '0.8*20*400 ซม.', '9.6', 126.05, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040022', '', NULL, NULL, '1546586830099854100.jpg');
INSERT INTO `stock_product_items` VALUES (1546573816087921100, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลเมอร์โบ', '1546586796001514100.jpg', '0.8*15*300 ซม.', '5.4', 70.32, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530023', '', NULL, NULL, '1546586796001514100.jpg');
INSERT INTO `stock_product_items` VALUES (1546573900051721600, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลเมอร์โบ', '1546586753004223900.jpg', '0.8*15*400 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540023', '', NULL, NULL, '1546586753004223900.jpg');
INSERT INTO `stock_product_items` VALUES (1546573947070915600, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลเมอร์โบ', '1546586740086296100.jpg', '0.8*20*300 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030023', '', NULL, NULL, '1546586740086296100.jpg');
INSERT INTO `stock_product_items` VALUES (1546574001005841400, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลเมอร์โบ', '1546586730063557900.jpg', '0.8*20*400 ซม.', '9.6', 126.05, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040023', '', NULL, NULL, '1546586730063557900.jpg');
INSERT INTO `stock_product_items` VALUES (1546574542048552300, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าดุสิตา', '1546586707092825700.jpg', '0.8*15*300 ซม.', '5.4', 70.32, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530031', '', NULL, NULL, '1546586707092825700.jpg');
INSERT INTO `stock_product_items` VALUES (1546574589054541000, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าดุสิตา', '1546586695083399100.jpg', '0.8*15*400 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540031', '', NULL, NULL, '1546586695083399100.jpg');
INSERT INTO `stock_product_items` VALUES (1546574641089844800, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าดุสิตา', '1546586684051113000.jpg', '0.8*20*300 ซม.', '7.2', 94.20, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030031', '', NULL, NULL, '1546586684051113000.jpg');
INSERT INTO `stock_product_items` VALUES (1546574693042085600, 1546564362025650000, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าดุสิตา', '1546586666043535200.jpg', '0.8*20*400 ซม.', '9.6', 126.05, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040031', '', NULL, NULL, '1546586666043535200.jpg');
INSERT INTO `stock_product_items` VALUES (1546574977020846600, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองแท้', '1546657485082232400.jpg,1549937844005759500.jpg', '0.8*15*300 ซม.', '5.4', 75.09, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530051', '', NULL, NULL, '1549937844005746300.jpg');
INSERT INTO `stock_product_items` VALUES (1546575032072890100, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองแท้', '1546586627022656800.jpg', '0.8*15*400 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540051', '', NULL, NULL, '1546586627022656800.jpg');
INSERT INTO `stock_product_items` VALUES (1546575103016560200, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองแท้', '1546586615090949700.jpg', '0.8*20*300 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030051', '', NULL, NULL, '1546586615090949700.jpg');
INSERT INTO `stock_product_items` VALUES (1546575154051982000, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองแท้', '1546586600080156300.jpg', '0.8*20*400 ซม.', '9.6', 133.43, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040051', '', NULL, NULL, '1546586600080156300.jpg');
INSERT INTO `stock_product_items` VALUES (1546575272035074000, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองชายน์ไลท์', '1546586571091623700.jpg', '0.8*15*300 ซม.', '5.4', 75.09, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530052', '', NULL, NULL, '1546586571091623700.jpg');
INSERT INTO `stock_product_items` VALUES (1546575366022018900, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองชายน์ไลท์', '1546586556012772200.jpg', '0.8*15*400 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540052', '', NULL, NULL, '1546586556012772200.jpg');
INSERT INTO `stock_product_items` VALUES (1546575411026755100, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองชายน์ไลท์', '1546586543026309000.jpg', '0.8*20*300 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030052', '', NULL, NULL, '1546586543026309000.jpg');
INSERT INTO `stock_product_items` VALUES (1546575462027173600, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีสักทองชายน์ไลท์', '1546586520056145400.jpg', '0.8*20*400 ซม.', '9.6', 133.43, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040052', '', NULL, NULL, '1546586520056145400.jpg');
INSERT INTO `stock_product_items` VALUES (1546575534055008700, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลชายน์ไลท์', '1546586489010569500.jpg', '0.8*15*300 ซม.', '5.4', 75.09, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530053', '', NULL, NULL, '1546586489010569500.jpg');
INSERT INTO `stock_product_items` VALUES (1546575602080276700, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลชายน์ไลท์', '1546586479059954200.jpg', '0.8*15*400 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540053', '', NULL, NULL, '1546586479059954200.jpg');
INSERT INTO `stock_product_items` VALUES (1546575659084628000, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลชายน์ไลท์', '1546586461092013600.jpg', '0.8*20*300 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030053', '', NULL, NULL, '1546586461092013600.jpg');
INSERT INTO `stock_product_items` VALUES (1546575713093735900, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลชายน์ไลท์', '1546657624010000900.jpg', '0.8*20*400 ซม.', '9.6', 133.43, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040053', '', NULL, NULL, '1550131902013830300.jpg');
INSERT INTO `stock_product_items` VALUES (1546575824056617700, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีแดงพะยูงชายน์ไลท์', '1550196117094995500.jpg', '0.8*15*300 ซม.', '5.4', 75.09, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530056', '', NULL, NULL, '1550196117094981300.jpg');
INSERT INTO `stock_product_items` VALUES (1546575889074000100, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีพะยูงแดงชายน์ไลท์', '1550196092068359800.jpg,1551754555048860400.jpg', '0.8*15*400 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540056', '', NULL, NULL, '1551754555048844000.jpg');
INSERT INTO `stock_product_items` VALUES (1546575932066106900, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีพะยูงแดงชายน์ไลท์', '1550196054005556900.jpg,1551754533057693800.jpg', '0.8*20*300 ซม.', '7.2', 100.54, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030056', '', NULL, NULL, '1551754533057679500.jpg');
INSERT INTO `stock_product_items` VALUES (1546575979072180900, 1546564452072110000, 'ไม้ฝาเฌอร่า ลายสัก สีพะยูงแดงชายน์ไลท์', '1550196009000089700.jpg', '0.8*20*400 ซม.', '9.6', 133.43, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040056', '', NULL, NULL, '1550196009000074800.jpg');
INSERT INTO `stock_product_items` VALUES (1546576257043593000, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าคูลไอรีส', '1546586037019301700.jpg', '0.8*15*300 ซม.', '5.4', 73.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530061', '', NULL, NULL, '1546586037019301700.jpg');
INSERT INTO `stock_product_items` VALUES (1546576317070560800, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าคูลไอรีส', '1546586026039914900.jpg', '0.8*15*400 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540061', '', NULL, NULL, '1546586026039914900.jpg');
INSERT INTO `stock_product_items` VALUES (1546576383065759600, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าคูลไอรีส', '1546586015050088800.jpg', '0.8*20*300 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030061', '', NULL, NULL, '1546586015050088800.jpg');
INSERT INTO `stock_product_items` VALUES (1546576459051452200, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีฟ้าคูลไอรีส', '1546586002069601900.jpg', '0.8*20*400 ซม.', '9.6', 131.13, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040061', '', NULL, NULL, '1546586002069601900.jpg');
INSERT INTO `stock_product_items` VALUES (1546576547012771300, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลคูลมอล์ต', '1546576560031119700.jpg,1549957666082263400.png', '0.8*15*300 ซม.', '5.4', 73.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530062', '', NULL, NULL, '1549957666082248800.png');
INSERT INTO `stock_product_items` VALUES (1546576616041970400, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลคูลมอล์ต', '1546576616041956800.jpg,1549957649050103800.png', '0.8*15*400 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540062', '', NULL, NULL, '1549957649050088700.png');
INSERT INTO `stock_product_items` VALUES (1546576664072795600, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลคูลมอล์ต', '1546576664072782900.jpg,1549957633021760000.png', '0.8*20*300 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030062', '', NULL, NULL, '1549957633021745300.png');
INSERT INTO `stock_product_items` VALUES (1546576720042687900, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีน้ำตาลคูลมอล์ต', '1546576720042676300.jpg,1549957614089645600.png', '0.8*20*400 ซม.', '9.6', 131.13, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040062', '', NULL, NULL, '1549957614089631700.png');
INSERT INTO `stock_product_items` VALUES (1546576818083220900, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีส้มคูลแอพริคอท', '1546585972058607200.jpg', '0.8*15*300 ซม.', '5.4', 73.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530063', '', NULL, NULL, '1546585972058607200.jpg');
INSERT INTO `stock_product_items` VALUES (1546576878083105800, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีส้มคูลแอพริคอท', '1546585937014632900.jpg', '0.8*15*400 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540063', '', NULL, NULL, '1546585937014632900.jpg');
INSERT INTO `stock_product_items` VALUES (1546576928034465400, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีส้มคูลแอพริคอท', '1546585880056667700.jpg', '0.8*20*300 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030063', '', NULL, NULL, '1546585880056667700.jpg');
INSERT INTO `stock_product_items` VALUES (1546576972037885500, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีส้มคูลแอพริคอท', '1546585841058752300.jpg', '0.8*20*400 ซม.', '9.6', 131.13, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040063', '', NULL, NULL, '1546585841058752300.jpg');
INSERT INTO `stock_product_items` VALUES (1546577046044336100, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีขาวบัวหิมะ', '1546585809007723600.jpg', '0.8*15*300 ซม.', '5.4', 73.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081530064', '', NULL, NULL, '1546585809007723600.jpg');
INSERT INTO `stock_product_items` VALUES (1546577091073046700, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีขาวบัวหิมะ', '1546585776037168400.jpg', '0.8*15*400 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010081540064', '', NULL, NULL, '1546585776037168400.jpg');
INSERT INTO `stock_product_items` VALUES (1546577188013713500, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีขาวบัวหิมะ', '1546585743064010700.jpg', '0.8*20*300 ซม.', '7.2', 98.80, NULL, 10, 10, 1545917257000291700, 1015, '040-010082030064', '', NULL, NULL, '1546585743064010700.jpg');
INSERT INTO `stock_product_items` VALUES (1546577411075172500, 1546508826076819800, 'ไม้ฝาเฌอร่า ลายสัก สีขาวบัวหิมะ', '1546585707022397500.jpg', '0.8*20*400 ซม.', '9.6', 131.13, NULL, 10, 10, 1545917257000291700, 1015, '040-010082040064', '', NULL, NULL, '1546585707022397500.jpg');
INSERT INTO `stock_product_items` VALUES (1546679467061793600, 1546828010075495700, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ รุ่นวิจิตรชงโค สีธรรมชาติ', '1546679467061780600.jpg', '1.0*15*300 ซม.', '6.73', 123.59, NULL, 10, 10, 1545917257000291700, 1015, '040-104101530001', '', 20, NULL, '1546679467061780600.jpg');
INSERT INTO `stock_product_items` VALUES (1546679659006840900, 1546828010075495700, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ รุ่นวิจิตรโกสน สีธรรมชาติ', '1546679659006826700.jpg', '1.0*15*300 ซม.', '5.77', 142.31, NULL, 10, 10, 1545917257000291700, 1015, '040-105101530001', '', 10, NULL, '1546679659006826700.jpg');
INSERT INTO `stock_product_items` VALUES (1546679761018887300, 1546828010075495700, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ รุ่นวิจิตรนนทรี สีธรรมชาติ', '1546679761018874100.jpg', '1.0*15*300 ซม.', '5.77', 157.29, NULL, 10, 10, 1545917257000291700, 1015, '040-106101530001', '', 40, NULL, '1546679761018874100.jpg');
INSERT INTO `stock_product_items` VALUES (1546679863090099800, 1546828010075495700, 'ไม้ฝาเฌอร่า ลายชัยพฤกษ์ รุ่นวิจิตรศรีตรัง สีธรรมชาติ', '1546679863090085600.jpg', '1.0*15*300 ซม.', '5.78', 179.76, NULL, 10, 10, 1545917257000291700, 1015, '040-107101530001', '', 30, NULL, '1546679863090085600.jpg');
INSERT INTO `stock_product_items` VALUES (1546680533056842400, 1546565236069196700, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นวิจิตรชงโค สีธรรมชาติ', '1546680533056830100.jpg', '1.0*15*300 ซม.', '6.73', 123.59, NULL, 10, 10, 1545917257000291700, 1015, '040-104101530002', '', NULL, NULL, '1546680533056830100.jpg');
INSERT INTO `stock_product_items` VALUES (1546680637069835900, 1546565236069196700, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นวิจิตรชงโค สีธรรมชาติ', '1546680637069822600.jpg', '1.0*20*300 ซม.', '8.97', 157.29, NULL, 10, 10, 1545917257000291700, 1015, '040-104102030002', '', NULL, NULL, '1546680637069822600.jpg');
INSERT INTO `stock_product_items` VALUES (1546680722026304500, 1546565236069196700, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นวิจิตรโกสน สีธรรมชาติ', '1546680722026290200.jpg', '1.0*15*300 ซม.', '5.77', 142.31, NULL, 10, 10, 1545917257000291700, 1015, '040-105101530002', '', NULL, NULL, '1546680722026290200.jpg');
INSERT INTO `stock_product_items` VALUES (1546680821072053800, 1546565236069196700, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นวิจิตรนนทรี สีธรรมชาติ', '1546680821072041100.jpg', '1.0*15*300 ซม.', '5.77', 157.29, NULL, 10, 10, 1545917257000291700, 1015, '040-106101530002', '', NULL, NULL, '1546680821072041100.jpg');
INSERT INTO `stock_product_items` VALUES (1546681259094239000, 1546565339004190800, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นโมเดิร์นสแทกเกอร์ ', '1546681259094224200.jpg', '1.0*10*300 ซม.', '3.71', 123.59, NULL, 10, 10, 1545917257000291700, 1015, '040-107101030002', '', NULL, NULL, '1546681259094224200.jpg');
INSERT INTO `stock_product_items` VALUES (1546681636015200300, 1546565339004190800, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นโมเดิร์นสแทกเกอร์ ', '1546681636015185300.jpg', '1.0*15*300 ซม.', '5.95', 146.06, NULL, 10, 10, 1545917257000291700, 1015, '040-107101530002', '', NULL, NULL, '1546681636015185300.jpg');
INSERT INTO `stock_product_items` VALUES (1546681831095627800, 1546565339004190800, 'ไม้ฝาเฌอร่า ลายผิวเรียบ รุ่นโมเดิร์นสแทกเกอร์ ', '1546681831095613800.jpg', '1.0*20*300 ซม.', '8.19', 179.76, NULL, 10, 10, 1545917257000291700, 1015, '040-107102030002', '', NULL, NULL, '1546681831095613800.jpg');
INSERT INTO `stock_product_items` VALUES (1546832304076451400, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีซีเมนต์ ', '1546844311070759400.jpg', '1.6*15*300 ซม.', '10.17', 147.40, NULL, 10, 10, 1545917257000291700, 1015, '040-111171530001', '', NULL, NULL, '1546844311070759400.jpg');
INSERT INTO `stock_product_items` VALUES (1546832519092167400, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีซีเมนต์ ', '1546844354085109200.jpg', '1.6*20*300 ซม.', '13.66', 199.53, NULL, 10, 10, 1545917257000291700, 1015, '040-111172030001', '', NULL, NULL, '1546844354085109200.jpg');
INSERT INTO `stock_product_items` VALUES (1546832654027913400, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีซีเมนต์ ', '1546844366048430300.jpg', '1.6*15*400 ซม.', '13.56', 197.74, NULL, 10, 10, 1545917257000291700, 1015, '040-111171540001', '', NULL, NULL, '1546844366048430300.jpg');
INSERT INTO `stock_product_items` VALUES (1546832726005234500, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีซีเมนต์ ', '1546844403031562800.jpg,1549956826064338100.jpg', '1.6*20*400 ซม.', '18.22', 254.66, NULL, 10, 10, 1545917257000291700, 1015, '040-111172040001', '', NULL, NULL, '1549956826064324200.jpg');
INSERT INTO `stock_product_items` VALUES (1546832925057381600, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีขาวปะการัง', '1546844437025282800.jpg', '1.6*15*300 ซม.', '10.17', 152.80, NULL, 10, 10, 1545917257000291700, 1015, '040-111171530012', '', NULL, NULL, '1546844437025282800.jpg');
INSERT INTO `stock_product_items` VALUES (1546832991066608800, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีขาวปะการัง', '1546844459052703900.jpg', '1.6*20*300 ซม.', '13.66', 207.32, NULL, 10, 10, 1545917257000291700, 1015, '040-111172030012', '', NULL, NULL, '1546844459052703900.jpg');
INSERT INTO `stock_product_items` VALUES (1546833050089229500, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีขาวปะการัง', '1546844482052061400.jpg', '1.6*15*400 ซม.', '13.56', 205.53, NULL, 10, 10, 1545917257000291700, 1015, '040-111171540012', '', NULL, NULL, '1546844482052061400.jpg');
INSERT INTO `stock_product_items` VALUES (1546833515035510600, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีขาวปะการัง', '1546844502075500700.jpg', '1.6*20*400 ซม.', '18.22', 263.65, NULL, 10, 10, 1545917257000291700, 1015, '040-111172040012', '', NULL, NULL, '1546844502075500700.jpg');
INSERT INTO `stock_product_items` VALUES (1546833660080365500, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีสักน้ำผึ้ง', '1546844543007220200.jpg', '1.6*15*300 ซม.', '10.17', 152.80, NULL, 10, 10, 1545917257000291700, 1015, '040-111171530016', '', NULL, NULL, '1546844543007220200.jpg');
INSERT INTO `stock_product_items` VALUES (1546833757055950600, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีสักน้ำผึ้ง', '1546844565091387700.jpg', '1.6*15*400 ซม.', '13.56', 205.53, NULL, 10, 10, 1545917257000291700, 1015, '040-111171540016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546833853093868300, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีสักน้ำผึ้ง', '1546844584098267100.jpg', '1.6*20*300 ซม.', '13.66', 207.32, NULL, 10, 10, 1545917257000291700, 1015, '040-111172030016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546833988006691000, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีสักน้ำผึ้ง', '1546844616078051000.jpg', '1.6*20*400 ซม.', '18.22', 372.70, NULL, 10, 10, 1545917257000291700, 1015, '040-111172040016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546840131018535600, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีแดงมะฮอกกานี', '1546844655045292900.jpg', '1.6*15*300 ซม.', '10.17', 215.71, NULL, 10, 10, 1545917257000291700, 1015, '040-117171530021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546840210082929000, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีแดงมะฮอกกานี', '1546844673014136100.jpg', '1.6*20*300 ซม.', '13.66', 289.41, NULL, 10, 10, 1545917257000291700, 1015, '040-111172030021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546840305054549800, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีแดงมะฮอกกานี', '1546844690062706400.jpg', '1.6*15*400 ซม.', '13.56', 279.23, NULL, 10, 10, 1545917257000291700, 1015, '040-111171540021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546840364094139800, 1546831176057707300, 'ไม้เชิงชายเฌอร่า ขอบบัว สีแดงมะฮอกกานี', '1546844707083961500.jpg', '1.6*20*400 ซม.', '18.22', 372.70, NULL, 10, 10, 1545917257000291700, 1015, '040-111172040021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546840855010637600, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีซีเมนต์', '1546845808086164800.jpg', '1.6*15*300 ซม.', '10.17', 122.84, NULL, 10, 10, 1545917257000291700, 1015, '040-116171530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546840948043496300, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีซีเมนต์', '1546846160020606100.jpg', '1.6*15*400 ซม.', '13.66', 164.18, NULL, 10, 10, 1545917257000291700, 1015, '040-116171540001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546841010022036100, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีซีเมนต์', '1546846186004120800.jpg', '1.6*20*300 ซม.', '13.56', 164.18, NULL, 10, 10, 1545917257000291700, 1015, '040-116172030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546841073002023200, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีซีเมนต์', '1546846204055840800.jpg', '1.6*20*400 ซม.', '18.22', 219.31, NULL, 10, 10, 1545917257000291700, 1015, '040-116172040001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546841199000485000, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีสักน้ำผึ้ง', '1546846233047112400.jpg', '1.6*15*300 ซม.', '10.17', 125.83, NULL, 10, 10, 1545917257000291700, 1015, '040-116171530016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546841264007383000, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีสักน้ำผึ้ง', '1546846262016331700.jpg', '1.6*15*400 ซม.', '13.66', 182.76, NULL, 10, 10, 1545917257000291700, 1015, '040-116171540016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546841330081703700, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีสักน้ำผึ้ง', '1546846437054383400.jpg', '1.6*20*300 ซม.', '13.56', 182.76, NULL, 10, 10, 1545917257000291700, 1015, '040-116172030016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546841391026042800, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีสักน้ำผึ้ง', '1546846457070452500.jpg', '1.6*20*400 ซม.', '18.22', 245.67, NULL, 10, 10, 1545917257000291700, 1015, '040-116172040016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546842515082369300, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีขาวปะการัง', '1546846483008060100.jpg', '1.6*15*300 ซม.', '10.17', 125.83, NULL, 10, 10, 1545917257000291700, 1015, '040-116171530012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546842593081939500, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีขาวปะการัง', '1546846504050895500.jpg', '1.6*15*400 ซม.', '13.66', 182.76, NULL, 10, 10, 1545917257000291700, 1015, '040-116171540012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546842704087626000, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีขาวปะการัง', '1546846519005950200.jpg', '1.6*20*300 ซม.', '13.56', 182.76, NULL, 10, 10, 1545917257000291700, 1015, '040-116172030012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546842808040411200, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีขาวปะการัง', '1546846536064865300.jpg', '1.6*20*400 ซม.', '18.22', 245.67, NULL, 10, 10, 1545917257000291700, 1015, '040-116172040012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546843036052928200, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีแดงมะฮอกกานี', '1546846563052900600.jpg', '1.6*15*300 ซม.', '10.17', 179.76, NULL, 10, 10, 1545917257000291700, 1015, '040-116171530021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546843204057515300, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีแดงมะฮอกกานี', '1546846580093422200.jpg', '1.6*15*400 ซม.', '13.66', 239.68, NULL, 10, 10, 1545917257000291700, 1015, '040-116171540021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546843293003154100, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีแดงมะฮอกกานี', '1546846595048039000.jpg', '1.6*20*300 ซม.', '13.56', 239.68, NULL, 10, 10, 1545917257000291700, 1015, '040-116172030021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546843533082790200, 1546831396038173600, 'ไม้เชิงชายเฌอร่า ลบขอบ สีแดงมะฮอกกานี', '1546846612053023900.jpg', '1.6*20*400 ซม.', '18.22', 320.57, NULL, 10, 10, 1545917257000291700, 1015, '040-116172040021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546843716013919000, 1546831668092069400, 'ไม้เชิงชายเฌอร่า รุ่นโปร สีสักน้ำผึ้ง', '1546846749065449700.jpg', '1.6*24*300 ซม.', '15.80', 303.35, NULL, 10, 10, 1545917257000291700, 1015, '040-1182430016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546843805087930600, 1546831668092069400, 'ไม้เชิงชายเฌอร่า รุ่นโปร สีสักน้ำผึ้ง', '1546846736071740400.jpg', '1.6*24*400 ซม.', '21.07', 377.50, NULL, 10, 10, 1545917257000291700, 1015, '040-1182440016', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546843903039324700, 1546831668092069400, 'ไม้เชิงชายเฌอร่า รุ่นโปร สีขาวปะการัง', '1546846816034961800.jpg', '1.6*24*300 ซม.', '15.80', 303.35, NULL, 10, 10, 1545917257000291700, 1015, '040-1182430012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546844012090502700, 1546831668092069400, 'ไม้เชิงชายเฌอร่า รุ่นโปร สีขาวปะการัง', '1546846825054744500.jpg', '1.6*24*400 ซม.', '21.07', 377.50, NULL, 10, 10, 1545917257000291700, 1015, '040-1182440012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546853455069352500, 1546852479055263500, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายบัวหลวง) สีธรรมชาติ', '1546853455069339600.jpg', '0.8*20*100 ซม.', '1.42', 125.19, NULL, 10, 10, 1545917257000291700, 1015, '040-171082010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546909959019806900, 1546852479055263500, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายบัวหลวง) สีเหลืองการะเวก', '1546909959019793500.jpg', '0.8*20*100 ซม.', '1.42', 153.01, NULL, 10, 10, 1545917257000291700, 1015, '040-171082010011', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546910184062415500, 1546852479055263500, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายบัวหลวง) สีเชอรี่เรด', '1546910184062400400.jpg', '0.8*20*100 ซม.', '1.42', 185.70, NULL, 10, 10, 1545917257000291700, 1015, '040-171082010041', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546910519026125800, 1546852479055263500, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายบัวหลวง) สีสักทรายทอง', '1546910519026110500.jpg', '0.8*20*100 ซม.', '1.42', 185.70, NULL, 10, 10, 1545917257000291700, 1015, '040-171082010043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546911047098390500, 1546852520020320800, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายดอกรัก) สีธรรมชาติ', '1546911047098377300.jpg', '0.8*20*100 ซม.', '1.76', 125.19, NULL, 10, 10, 1545917257000291700, 1015, '040-172082010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546911585057274300, 1546852520020320800, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายดอกรัก) สีเหลืองการะเวก', '1546911585057260100.jpg', '0.8*20*100 ซม.', '1.76', 153.01, NULL, 10, 10, 1545917257000291700, 1015, '040-172082010011', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546911673048792600, 1546852520020320800, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายดอกรัก) สีเชอรี่เรด', '1546911673048778500.jpg', '0.8*20*100 ซม.', '1.76', 185.70, NULL, 10, 10, 1545917257000291700, 1015, '040-172082010041', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546912189064246900, 1546852520020320800, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายดอกรัก) สีสักทรายทอง', '1546912189064231900.jpg', '0.8*20*100 ซม.', '1.76', 185.70, NULL, 10, 10, 1545917257000291700, 1015, '040-172082010043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546912314050751300, 1546852566058488000, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายทิวลิป) สีธรรมชาติ', '1546912314050738200.jpg', '0.8*20*100 ซม.', '1.56', 125.19, NULL, 10, 10, 1545917257000291700, 1015, '040-173082010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546912389008771900, 1546852566058488000, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายทิวลิป) สีเหลืองการะเวก', '1546912389008759000.jpg', '0.8*20*100 ซม.', '1.56', 153.01, NULL, 10, 10, 1545917257000291700, 1015, '040-173082010011', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546912494010538700, 1546852566058488000, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายทิวลิป) สีเชอรี่เรด', '1546912494010523500.jpg', '0.8*20*100 ซม.', '1.56', 185.70, NULL, 10, 10, 1545917257000291700, 1015, '040-173082010041', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546912607034348700, 1546852566058488000, 'ไม้เชิงชายน้ำย้อยเฌอร่า สัก (ลายทิวลิป) สีสักทรายทอง', '1546912607034335800.jpg', '0.8*20*100 ซม.', '1.56', 185.70, NULL, 10, 10, 1545917257000291700, 1015, '040-173082010043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546912726085690000, 1546852608095141800, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ (ลายหัวใจ) สีธรรมชาติ', '1546912726085677600.jpg', '0.8*30*100 ซม.', '2.83', 194.74, NULL, 10, 10, 1545917257000291700, 1015, '040-174083010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546912908024390800, 1546852608095141800, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ (ลายหัวใจ) สีเหลืองการะเวก', '1546912908024378000.jpg', '0.8*30*100 ซม.', '2.83', 243.43, NULL, 10, 10, 1545917257000291700, 1015, '040-174083010011', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546913076091911100, 1546852608095141800, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ (ลายหัวใจ) สีเชอรี่เรด', '1546913076091898200.jpg', '0.8*30*100 ซม.', '2.83', 295.59, NULL, 10, 10, 1545917257000291700, 1015, '040-174083010041', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546913243015892400, 1546852608095141800, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ (ลายหัวใจ) สีสักทรายทอง', '1546913243015878200.jpg', '0.8*30*100 ซม.', '2.83', 295.59, NULL, 10, 10, 1545917257000291700, 1015, '040-174083010043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546913361067732200, 1546852653055166100, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ (ลายบานบุรี) สีธรรมชาติ', '1546913361067714700.jpg', '0.8*20*100 ซม.', '1.68', 153.01, NULL, 10, 10, 1545917257000291700, 1015, '040-175082010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546913444031759600, 1546852696092912100, 'ไม้เชิงชายน้ำย้อยเฌอร่า เรียบ (ลายอินทนิล) สีธรรมชาติ', '1546913444031745700.jpg', '0.8*20*100 ซม.', '1.64', 153.01, NULL, 10, 10, 1545917257000291700, 1015, '040-176082010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546913781007407000, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีธรรมชาติ', '1546913781007393600.jpg,1549955433089960700.jpg', '0.8*15*50 ซม.', '0.70', 55.64, NULL, 10, 10, 1545917257000291700, 1015, '040-178081505001', '', NULL, NULL, '1549955433089945400.jpg');
INSERT INTO `stock_product_items` VALUES (1546913864048026700, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีเหลืองการะเวก', '1546913864048012400.jpg,1549955110014791100.png', '0.8*15*50 ซม.', '0.70', 69.55, NULL, 10, 10, 1545917257000291700, 1015, '040-178081505011', '', NULL, NULL, '1549955110014776900.png');
INSERT INTO `stock_product_items` VALUES (1546913947041983700, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีเชอรี่เรด', '1549954887095945400.png,1549955868073756000.png', '0.8*15*50 ซม.', '0.70', 129.47, NULL, 10, 10, 1545917257000291700, 1015, '040-178081505041', '', NULL, NULL, '1549955868073742100.png');
INSERT INTO `stock_product_items` VALUES (1546914090078924200, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีสักทรายทอง', '1549952389039677000.png,1551754784064725300.png', '0.8*15*50 ซม.', '0.70', 84.16, NULL, 10, 10, 1545917257000291700, 1015, '040-178081505043', '', NULL, NULL, '1551754784064709600.png');
INSERT INTO `stock_product_items` VALUES (1546914265005895000, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายดอกจิก) สีธรรมชาติ', '1546914265005882200.jpg', '0.8*15*50 ซม.', '0.68', 55.64, NULL, 10, 10, 1545917257000291700, 1015, '040-180081505001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546914350088510200, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายดอกจิก) สีเหลืองการะเวก', '1546914350088496100.jpg', '0.8*15*50 ซม.', '0.68', 69.55, NULL, 10, 10, 1545917257000291700, 1015, '040-180081505011', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546915240060706500, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายดอกจิก) สีเชอรี่เรด', '1546915240060692900.jpg', '0.8*15*50 ซม.', '0.68', 84.16, NULL, 10, 10, 1545917257000291700, 1015, '040-180081505041', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546915378007582700, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายดอกจิก) สีสักทรายทอง', '1546915378007566500.jpg', '0.8*15*50 ซม.', '0.68', 84.16, NULL, 10, 10, 1545917257000291700, 1015, '040-180081505043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546915496093546500, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีธรรมชาติ', '1550737316050069800.png', '0.8*15*50 ซม.', '0.64', 55.64, NULL, 10, 10, 1545917257000291700, 1015, '040-181081505001', '', NULL, NULL, '1550737316050057000.png');
INSERT INTO `stock_product_items` VALUES (1546915615090203400, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีเหลืองการะเวก', '1550737301031126600.png', '0.8*15*50 ซม.', '0.64', 69.55, NULL, 10, 10, 1545917257000291700, 1015, '040-181081505011', '', NULL, NULL, '1550737301031112400.png');
INSERT INTO `stock_product_items` VALUES (1546915704023751400, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีเชอรี่เรด', '1550737286092141000.png', '0.8*15*50 ซม.', '0.64', 84.16, NULL, 10, 10, 1545917257000291700, 1015, '040-181081505041', '', NULL, NULL, '1550737286092128000.png');
INSERT INTO `stock_product_items` VALUES (1546915826077199900, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีสักทรายทอง', '1550737270040134200.png', '0.8*15*50 ซม.', '0.64', 84.16, NULL, 10, 10, 1545917257000291700, 1015, '040-181081505043', '', NULL, NULL, '1550737270040120000.png');
INSERT INTO `stock_product_items` VALUES (1546915979084237200, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีธรรมชาติ', '1550222666090578800.png', '0.8*15*50 ซม.', '0.75', 50.08, NULL, 10, 10, 1545917257000291700, 1015, '040-182081505001', '', NULL, NULL, '1550222666090564700.png');
INSERT INTO `stock_product_items` VALUES (1546916139047213700, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีเหลืองการะเวก', '1550222652007261700.png', '0.8*15*50 ซม.', '0.75', 62.60, NULL, 10, 10, 1545917257000291700, 1015, '040-182081505011', '', NULL, NULL, '1550222652007248900.png');
INSERT INTO `stock_product_items` VALUES (1546916227005434100, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีเชอรี่เรด', '1550222624058184100.png', '0.8*15*50 ซม.', '0.75', 76.51, NULL, 10, 10, 1545917257000291700, 1015, '040-182081505041', '', NULL, NULL, '1550222624058171600.png');
INSERT INTO `stock_product_items` VALUES (1546916508041942400, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีสักทรายทอง', '1550222600092224600.png', '0.8*15*50 ซม.', '0.75', 76.51, NULL, 10, 10, 1545917257000291700, 1015, '040-182081505043', '', NULL, NULL, '1550222600092211200.png');
INSERT INTO `stock_product_items` VALUES (1546916731099389800, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีธรรมชาติ', '1546916731099376300.jpg,1550216972057984700.png', '0.8*20*50 ซม.', '1.01', 76.51, NULL, 10, 10, 1545917257000291700, 1015, '040-183082005001', '', NULL, NULL, '1550216972057971100.png');
INSERT INTO `stock_product_items` VALUES (1546916828050854000, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีเหลืองการะเวก', '1550217017062714100.png', '0.8*20*50 ซม.', '1.01', 97.37, NULL, 10, 10, 1545917257000291700, 1015, '040-183082005011', '', NULL, NULL, '1550217017062701500.png');
INSERT INTO `stock_product_items` VALUES (1546916965090057800, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีเชอรี่เรด', '1550216999015274600.png', '0.8*20*50 ซม.', '1.01', 119.63, NULL, 10, 10, 1545917257000291700, 1015, '040-183082005041', '', NULL, NULL, '1550216999015261600.png');
INSERT INTO `stock_product_items` VALUES (1546917137005334100, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีสักทรายทอง', '1550216872058316200.png', '0.8*20*50 ซม.', '1.01', 119.63, NULL, 10, 10, 1545917257000291700, 1015, '040-183082005043', '', NULL, NULL, '1550216872058302500.png');
INSERT INTO `stock_product_items` VALUES (1546917366017731900, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีธรรมชาติ', '1546917366017715300.jpg,1549955910026858100.jpg', '0.8*15*30 ซม.', '0.36', 32.69, NULL, 10, 10, 1545917257000291700, 1015, '040-178081503001', '', NULL, NULL, '1549955910026844500.jpg');
INSERT INTO `stock_product_items` VALUES (1546917472037274600, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีเหลืองการะเวก', '1549955926032914100.png,1551754851012435100.png', '0.8*15*30 ซม.', '0.36', 41.03, NULL, 10, 10, 1545917257000291700, 1015, '040-178081503011', '', NULL, NULL, '1551754851012420200.png');
INSERT INTO `stock_product_items` VALUES (1546917550004674900, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีเชอรี่เรด', '1549955943089875600.png', '0.8*15*30 ซม.', '0.36', 50.08, NULL, 10, 10, 1545917257000291700, 1015, '040-178081503041', '', NULL, NULL, '1549955943089861400.png');
INSERT INTO `stock_product_items` VALUES (1546917949098195900, 1546851091081274000, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีสักทรายทอง', '1546917949098181400.jpg,1549955965050848600.png', '0.8*15*30 ซม.', '0.36', 50.08, NULL, 10, 10, 1545917257000291700, 1015, '040-178081503043', '', NULL, NULL, '1549955965050833300.png');
INSERT INTO `stock_product_items` VALUES (1546918039057382200, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายดอกจิก) สีธรรมชาติ', '1546918039057368900.jpg', '0.8*15*30 ซม.', '0.38', 32.69, NULL, 10, 10, 1545917257000291700, 1015, '040-180081503001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546918163026310200, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายคลาสิค) สีเหลืองการะเวก', '1546918163026296400.jpg', '0.8*15*30 ซม.', '0.38', 41.03, NULL, 10, 10, 1545917257000291700, 1015, '040-180081503011', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546918343044535000, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายดอกจิก) สีเชอรี่เรด', '1546918343044521400.jpg', '0.8*15*30 ซม.', '0.38', 50.08, NULL, 10, 10, 1545917257000291700, 1015, '040-180081503041', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546918512012148200, 1546850611097754600, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายดอกจิก) สีสักทรายทอง', '1546918512012134500.jpg', '0.8*15*30 ซม.', '0.38', 50.08, NULL, 10, 10, 1545917257000291700, 1015, '040-180081503043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546918616072550700, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีธรรมชาติ', '1550736842022201700.png', '0.8*15*30 ซม.', '0.42', 32.69, NULL, 10, 10, 1545917257000291700, 1015, '040-181081503001', '', NULL, NULL, '1550736842022187500.png');
INSERT INTO `stock_product_items` VALUES (1546918697058560700, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีเหลืองการะเวก', '1550736824047690800.png', '0.8*15*30 ซม.', '0.42', 41.03, NULL, 10, 10, 1545917257000291700, 1015, '040-181081503011', '', NULL, NULL, '1550736824047676300.png');
INSERT INTO `stock_product_items` VALUES (1546918769098553600, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีเชอรี่เรด', '1550736809033816300.png', '0.8*15*30 ซม.', '0.42', 50.08, NULL, 10, 10, 1545917257000291700, 1015, '040-181081503041', '', NULL, NULL, '1550736809033801700.png');
INSERT INTO `stock_product_items` VALUES (1546918838033254700, 1546851174008734400, 'ไม้เชิงชายน้ำหยดเฌอร่า สัก (ลายพวงทอง) สีสักทรายทอง', '1550737336027732900.png', '0.8*15*30 ซม.', '0.42', 50.08, NULL, 10, 10, 1545917257000291700, 1015, '040-181081503043', '', NULL, NULL, '1550737336027720000.png');
INSERT INTO `stock_product_items` VALUES (1546918980076234100, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีธรรมชาติ', '1550222490043420300.png', '0.8*15*30 ซม.', '0.41', 29.91, NULL, 10, 10, 1545917257000291700, 1015, '040-182081503001', '', NULL, NULL, '1550222490043407900.png');
INSERT INTO `stock_product_items` VALUES (1546919052077775900, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีเหลืองการะเวก', '1550222429048695500.png', '0.8*15*30 ซม.', '0.41', 37.56, NULL, 10, 10, 1545917257000291700, 1015, '040-182081503011', '', NULL, NULL, '1550222510062087800.png');
INSERT INTO `stock_product_items` VALUES (1546919149008746000, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีเชอรี่เรด', '1550222549068506400.png', '0.8*15*30 ซม.', '0.41', 45.21, NULL, 10, 10, 1545917257000291700, 1015, '040-182081503041', '', NULL, NULL, '1550222549068492200.png');
INSERT INTO `stock_product_items` VALUES (1546919241087979600, 1546851412089394100, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายระฆังทอง) สีสักทรายทอง', '1550222353048484200.png', '0.8*15*30 ซม.', '0.41', 45.21, NULL, 10, 10, 1545917257000291700, 1015, '040-182081503043', '', NULL, NULL, '1550222353048472500.png');
INSERT INTO `stock_product_items` VALUES (1546919386043049000, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีธรรมชาติ', '1550216490068769800.png', '0.8*20*30 ซม.', '0.52', 48.69, NULL, 10, 10, 1545917257000291700, 1015, '040-183082003001', '', NULL, NULL, '1550216826082148500.png');
INSERT INTO `stock_product_items` VALUES (1546919531001966400, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีเหลืองการะเวก', '1550216471084826800.png', '0.8*20*30 ซม.', '0.52', 59.12, NULL, 10, 10, 1545917257000291700, 1015, '040-183082003011', '', NULL, NULL, '1550216556023435500.png');
INSERT INTO `stock_product_items` VALUES (1546919651005607900, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีเชอรี่เรด', '1550216380080089700.png', '0.8*15*30 ซม.', '0.52', 71.64, NULL, 10, 10, 1545917257000291700, 1015, '040-183081503041', '', NULL, NULL, '1550216380080075400.png');
INSERT INTO `stock_product_items` VALUES (1546919861047657400, 1546852017046928500, 'ไม้เชิงชายน้ำหยดเฌอร่า เรียบ (ลายหัวใจ) สีสักทรายทอง', '1550216525085709500.png', '0.8*20*30 ซม.', '0.52', 71.64, NULL, 10, 10, 1545917257000291700, 1015, '040-183082003043', '', NULL, NULL, '1550216525085696700.png');
INSERT INTO `stock_product_items` VALUES (1546920606086656700, 1546920179086591200, 'ไม้กันตกเฌอร่าลายลิลลี่ ผิวเรียบ สีธรรมชาติ', '1546920606086642600.jpg', '1.2*15*80 ซม.', '1.80', 146.06, NULL, 10, 10, 1545917257000291700, 1015, '040-138121508001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546920736045040000, 1546920249009315500, 'ไม้กันตกเฌอร่าลายโรส ผิวเรียบ สีธรรมชาติ', '1546920736045027200.jpg', '1.2*15*80 ซม.', '2.10', 146.06, NULL, 10, 10, 1545917257000291700, 1015, '040-140121508001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546928467067880100, 1546928175086540500, 'ช่องลมลายหัวใจ ผิวเรียบ สีธรรมชาติ', '1546928467067866300.jpg', '0.8*45*90 ซม.', '3.73', 459.03, NULL, 10, 10, 1545917257000291700, 1015, '040-179084509001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546928620031831400, 1546928175086540500, 'ช่องลมลายหัวใจ ผิวเรียบ สีธรรมชาติ', '1546928620031817700.jpg', '0.8*70*90 ซม.', '6.08', 660.73, NULL, 10, 10, 1545917257000291700, 1015, '040-179087009001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546929991089163600, 1546928175086540500, 'ช่องลมลายหลุยส์ ผิวเรียบ สีธรรมชาติ', '1546930056073196600.jpg', '0.8*60*60 ซม.', '2.84', 486.85, NULL, 10, 10, 1545917257000291700, 1015, '040-179086006001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546930226007371800, 1546928175086540500, 'ช่องลมลายบลอสซั่ม ผิวเรียบ สีธรรมชาติ', '1546930226007356500.jpg', '0.8*60*120 ซม.', '7.30', 1495.33, NULL, 10, 10, 1545917257000291700, 1015, '040-179086012001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546930346079457700, 1546928175086540500, 'ช่องลมลายเถาวัลย์ ผิวเรียบ สีธรรมชาติ', '1546930346079443900.jpg', '1.0*49*104 ซม.', '5.33', 1182.35, NULL, 10, 10, 1545917257000291700, 1015, '040-179104910401', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546930481092144200, 1546928175086540500, 'ช่องลมเฌอร่า ลายมลุลี-เล็ก สีธรรมชาติ', '1546930481092130600.jpg', '1.0*19*100 ซม.', '1.88', 333.84, NULL, 10, 10, 1545917257000291700, 1015, '040-179101910001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546930573051735900, 1546928175086540500, 'ช่องลมเฌอร่า ลายมลุลี-ใหญ่ สีธรรมชาติ', '1546930573051720600.jpg', '1.0*60*200 ซม.', '13.40', 1112.80, NULL, 10, 10, 1545917257000291700, 1015, '040-179106020001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546930706075061400, 1546928175086540500, 'ช่องลมเฌอร่า ลายหิรัญญิการ์ สีธรรมชาติ', '1546930706075045300.jpg', '1.0*60*200 ซม.', '11.71', 2295.15, NULL, 10, 10, 1545917257000291700, 1015, '040-180106020001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546930843018070100, 1546928175086540500, 'ช่องลมเฌอร่า ลายเพชร สีธรรมชาติ', '1546930843018056600.jpg', '1.0*30*152 ซม.', '3.83', 1008.48, NULL, 10, 10, 1545917257000291700, 1015, '040-179103015201', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546935032027175200, 1546934664077148900, 'ไม้ปิดกันนกเฌอร่า ลายสัก สีธรรมชาติ', '1546935032027160000.jpg', '0.8*15*300 ซม.', '3.50', 62.60, NULL, 10, 10, 1545917257000291700, 1015, '040-139081530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546935124063495600, 1546934664077148900, 'ไม้ปิดกันนกเฌอร่า  ลายสัก สีพิเศษ (แดงมะฮอกกานี)', '1546935124063482100.jpg', '0.8*15*300 ซม.', '3.50', 83.46, NULL, 10, 10, 1545917257000291700, 1015, '040-139081530021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546935220012576400, 1546934715073315400, 'ไม้ปิดกันนกเฌอร่า  ลายสัก สีธรรมชาติ', '1546935220012563000.jpg', '0.8*15*300 ซม.', '4', 62.60, NULL, 10, 10, 1545917257000291700, 1015, '040-140081530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546935497057499000, 1546934715073315400, 'ไม้ปิดกันนกเฌอร่า ลายสัก สีพิเศษ (แดงมะฮอกกานี)', '1546935497057483500.jpg', '0.8*15*300 ซม.', '4', 83.46, NULL, 10, 10, 1545917257000291700, 1015, '040-140081530021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546936746099988000, 1546936105043521400, 'ไม้ระแนงเฌอร่า ขอบตรง (ลายสัก) สีธรรมชาติ', '1546936746099972900.jpg', '0.8*5.0*300', '1.80', 20.87, NULL, 10, 10, 1545917257000291700, 1015, '040-121085030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546937088094235500, 1546936105043521400, 'ไม้ระแนงเฌอร่า ขอบตรง (ลายสัก) สีธรรมชาติ', '1546937088094222600.jpg', '0.8*7.5*300 ซม.', '2.70', 31.30, NULL, 10, 10, 1545917257000291700, 1015, '040-121087530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546937275060371800, 1546936105043521400, 'ไม้ระแนงเฌอร่า ขอบตรง (ลายสัก) สีแดงเชอรี่', '1546937275060356800.jpg', '0.8*7.5*300 ซม.', '2.70', 55.64, NULL, 10, 10, 1545917257000291700, 1015, '040-121087530041', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546937595052607400, 1546936164053219900, 'ไม้ระแนงเฌอร่า ขอบตรง (ผิวเรียบ) สีธรรมชาติ', '1546937595052593600.jpg', '0.8*7.5*300 ซม.', '2.70', 32.69, NULL, 10, 10, 1545917257000291700, 1015, '040-123087530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546937709066482900, 1546936164053219900, 'ไม้ระแนงเฌอร่า ขอบตรง (ผิวเรียบ) สีธรรมชาติ', '1546937709066469000.jpg', '0.8*10*300 ซม.', '3.60', 46.60, NULL, 10, 10, 1545917257000291700, 1015, '040-123081030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546937815076167700, 1546936164053219900, 'ไม้ระแนงเฌอร่า ขอบตรง (ผิวเรียบ) สีแดงมะฮอกกานี', '1546937815076154200.jpg', '0.8*7.5*300 ซม.', '2.70', 39.64, NULL, 10, 10, 1545917257000291700, 1015, '040-123087530021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546938074004567600, 1546936246029411800, 'ไม้ระแนงเฌอร่า ขอบวี (ผิวเรียบ) สีธรรมชาติ', '1546938074004553500.jpg', '0.8*7.5*300 ซม.', '2.70', 32.10, NULL, 10, 10, 1545917257000291700, 1015, '040-124087530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546938169023579900, 1546936246029411800, 'ไม้ระแนงเฌอร่า ขอบวี (ผิวเรียบ) สีธรรมชาติ', '1546938169023564400.jpg', '0.8*10*300 ซม.', '3.60', 44.94, NULL, 10, 10, 1545917257000291700, 1015, '040-124081030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546938320055441600, 1546936246029411800, 'ไม้ระแนงเฌอร่า ขอบวี (ผิวเรียบ) สีแดงมะฮอกกานี', '1546938320055427300.jpg', '0.8*7.5*300 ซม.', '2.70', 45.21, NULL, 10, 10, 1545917257000291700, 1015, '040-124087530021', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546938645034026900, 1546936294031804100, 'ไม้ระแนงเฌอร่า ขอบวี (ลายเซี้ยน) สีธรรมชาติ', '1546938645034012200.jpg', '0.8*7.5*300 ซม.', '2.70', 34.78, NULL, 10, 10, 1545917257000291700, 1015, '040-126087530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546938751087713100, 1546936294031804100, 'ไม้ระแนงเฌอร่า ขอบวี (ลายเสี้ยน) สีธรรมชาติ', '1546938751087699100.jpg', '0.8*10*300 ซม.', '3.60', 48.69, NULL, 10, 10, 1545917257000291700, 1015, '040-126081030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546938871043707400, 1546936294031804100, 'ไม้ระแนงเฌอร่า ขอบวี (ลายเสี้ยน) สีโอ๊คแดงไฉไล', '1546938871043691200.jpg', '0.8*7.5*300 ซม.', '2.70', 41.73, NULL, 10, 10, 1545917257000291700, 1015, '040-125087530052', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1546938952086890400, 1546936294031804100, 'ไม้ระแนงเฌอร่า ขอบวี (ลายเสี้ยน) สีโอ๊คไฉไล', '1546938952086876300.jpg', '0.8*7.5*300 ซม.', '2.70', 41.73, NULL, 10, 10, 1545917257000291700, 1015, '040-125087530053', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547083794011610400, 1547083212073217900, 'ไม้อัดเอ็นจิเนียร์เฌอร่า สีธรรมชาติ', '1547083794011597300.jpg', '4*1220*2440 มม.', '16', 273.92, NULL, 10, 10, 1545917257000291700, 1015, '040-270412224401', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547084013096168000, 1547083212073217900, 'ไม้อัดเอ็นจิเนียร์เฌอร่า สีธรรมชาติ', '1547084013096154700.jpg', '6*1220*2440 มม.', '24', 410.88, NULL, 10, 10, 1545917257000291700, 1015, '040-270612224401', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547084110051115200, 1547083212073217900, 'ไม้อัดเอ็นจิเนียร์เฌอร่า สีธรรมชาติ', '1547084110051101500.jpg', '8*1220*2440 มม.', '32', 547.84, NULL, 10, 10, 1545917257000291700, 1015, '040-270812224401', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547084168032885900, 1547083212073217900, 'ไม้อัดเอ็นจิเนียร์เฌอร่า สีธรรมชาติ', '1547084168032871700.jpg', '8*1220*2440 มม.', '40', 684.80, NULL, 10, 10, 1545917257000291700, 1015, '040-271012224401', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547085459024134700, 1547084336005476700, 'ไม้บัวเฌอร่า ผิวเรียบ รุ่นบัวคลาสสิค สีธรรมชาติ', '1547085459024121700.jpg', '1.2*10*300 ซม.', '5.33', 102.40, NULL, 10, 10, 1545917257000291700, 1015, '040-13101121030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547085550091013500, 1547084336005476700, 'ไม้บัวเฌอร่า ผิวเรียบ รุ่นบัวโมเดิร์น สีธรรมชาติ', '1547085550090999300.jpg', '1.2*10*300 ซม.', '5.33', 93.09, NULL, 10, 10, 1545917257000291700, 1015, '040-13102121030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547085641095886300, 1547084336005476700, 'ไม้บัวเฌอร่า ผิวเรียบ รุ่นบัวโคโลเนียล สีธรรมชาติ', '1547085641095872700.jpg', '1.2*10*300 ซม.', '5.33', 130.33, NULL, 10, 10, 1545917257000291700, 1015, '040-13103121030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547085993041070700, 1547084391002232100, 'ไม้จบบัวเฌอร่า ผิวเรียบ รุ่นบัวคลาสสิค สีธรรมชาติ', '1547085993041058100.jpg', '1.2*10*100 ซม.', '1.83', 70.62, NULL, 10, 10, 1545917257000291700, 1015, '040-13301121010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547086230016397700, 1547084391002232100, 'ไม้จบบัวเฌอร่า ผิวเรียบ รุ่นบัวโมเดิร์น สีธรรมชาติ', '1547086230016384300.jpg', '1.2*10*300 ซม.', '1.83', 70.62, NULL, 10, 10, 1545917257000291700, 1015, '040-13302121010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547086612010397400, 1547084441078103200, 'ไม้มอบเฌอร่า ผิวเรียบ รุ่นบัวคลาสสิค สีธรรมชาติ', '1547086612010383300.jpg', '0.8*50*300 ซม.', '1.80', 35.31, NULL, 10, 10, 1545917257000291700, 1015, '040-135010805030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547086706075473100, 1547084441078103200, 'ไม้มอบเฌอร่า ผิวเรียบ รุ่นบัวคลาสสิค สีธรรมชาติ', '1547086706075460700.jpg', '0.8*7.5*300 ซม.', '2.70', 55.91, NULL, 10, 10, 1545917257000291700, 1015, '040-135010807530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547086799081696000, 1547084441078103200, 'ไม้มอบเฌอร่า ผิวเรียบ รุ่นบัวโมเดิร์น สีธรรมชาติ', '1547086799081676200.jpg', '0.8*50*300 ซม.', '1.80', 29.43, NULL, 10, 10, 1545917257000291700, 1015, '040-135020805030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547086876021105500, 1547084441078103200, 'ไม้มอบเฌอร่า ผิวเรียบ รุ่นบัวโมเดิร์น สีธรรมชาติ', '1547086876021092500.jpg', '0.8*7.5*300 ซม.', '2.70', 55.91, NULL, 10, 10, 1545917257000291700, 1015, '040-135020807530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547087633030570100, 1547084492086941200, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นคลาสสิค สีเชอรี่', '1547087633030556500.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13201121030046', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547087764097928500, 1547084492086941200, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นคลาสสิค สีบีช', '1547087764097915800.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13201121030047', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547087967026696900, 1547084492086941200, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นคลาสสิค สีโอ๊ค', '1547087967026684200.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13201121030048', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547088034078510600, 1547084492086941200, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นคลาสสิค สีเมเบิ้ล', '1547088034078497300.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13201121030049', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547088503036586700, 1547084678056291100, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นโมเดิร์น สีเชอรี่', '1547088503036573700.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13202121030046', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547088582054002900, 1547084678056291100, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นโมเดิร์น สีบีช', '1547088582053983100.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13202121030047', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547088643084015100, 1547084678056291100, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นโมเดิร์น สีโอ๊ค', '1547088643084001700.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13202121030048', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547088694057585100, 1547084678056291100, 'ไม้บัวลามิเนต ผิวเรียบ รุ่นโมเดิร์น สีเมเบิ้ล', '1547088694057571800.jpg', '1.2*10*300 ซม.', '5.33', 186.18, NULL, 10, 10, 1545917257000291700, 1015, '040-13202121030049', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547107737027368300, 1547106933036728500, 'ไม้รั้วเฌอร่า รุ่น Modern ผิวเรียบ สีธรรมชาติ', '1550196436076580800.jpg,1551754695064606900.jpg', '1.2*10*150 ซม.', '2.60', 46.44, NULL, 10, 10, 1545917257000291700, 1015, '040-151121015001', '', NULL, NULL, '1551754695064593000.jpg');
INSERT INTO `stock_product_items` VALUES (1547107842009052700, 1547106933036728500, 'ไม้รั้วเฌอร่า รุ่น Modern ผิวเรียบ สีธรรมชาติ', '1547108026011116600.jpg', '1.2*10*300 ซม.', '5.33', 69.66, NULL, 10, 10, 1545917257000291700, 1015, '040-151121030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547107994074080800, 1547106933036728500, 'ไม้รั้วเฌอร่า รุ่น Classic ผิวเรียบ สีธรรมชาติ', '1547107994074066700.jpg', '1.2*10*150 ซม.', '2.50', 59.71, NULL, 10, 10, 1545917257000291700, 1015, '040-152121015001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547108110043925200, 1547106933036728500, 'ไม้รั้วเฌอร่า รุ่น Classic ผิวเรียบ สีธรรมชาติ', '1547108110043911700.jpg', '1.2*10*100 ซม.', '1.79', 43.12, NULL, 10, 10, 1545917257000291700, 1015, '040-152121010001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547271104091319200, 1547106977067962800, 'ไม้รั้วเฌอร่า รุ่น Modern ผิวเรียบ สีขาวปะการัง', '1547271104091303300.jpg', '1.6*10*150 ซม.', '3.60', 63.02, NULL, 30, 10, 1545917257000291700, 1015, '040-151161015010', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547271549083924200, 1547106977067962800, 'ไม้รั้วเฌอร่า รุ่น Modern ผิวเรียบ สีสักน้ำผึ้ง', '1547271549083910700.jpg', '1.6*10*150 ซม.', '3.60', 63.02, NULL, 30, 10, 1545917257000291700, 1015, '040-151161015012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547271972006162300, 1547106977067962800, 'ไม้รั้วรุ่นคลาสสิค ผิวเรียบ สีโอ๊คไฉไล', '1547271972006149100.jpg', '1.6*10*150 ซม.', '3.60', 63.02, NULL, 30, 10, 1545917257000291700, 1015, '040-151161015053', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547429594055014900, 1547106977067962800, 'ไม้รั้วเฌอร่า รุ่น Modern ผิวเรียบ สีขาวปะการัง', '1547429594055000600.jpg', '1.6*10*150 ซม.', '3.60', 63.02, NULL, 10, 10, 1545917257000291700, 1015, '040-151161015010', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547429723061703400, 1547106977067962800, 'ไม้รั้วเฌอร่า รุ่น Modern ผิวเรียบ สีสักน้ำผึ้ง', '1547429723061688100.jpg', '1.6*10*150 ซม.', '3.60', 63.02, NULL, 10, 10, 1545917257000291700, 1015, '040-151161015012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547429922004564100, 1547106977067962800, 'ไม้รั้วรุ่นคลาสสิค ผิวเรียบ สีขาวปะการัง', '1547429922004551100.jpg,1547429972077599000.jpg,1550196363005569300.jpg', '1.6*10*150 ซม.', '3.40', 107.00, NULL, 10, 10, 1545917257000291700, 1015, '040-151161015010', '', NULL, NULL, '1550196363005555000.jpg');
INSERT INTO `stock_product_items` VALUES (1547430241053970100, 1547106977067962800, 'ไม้รั้วรุ่นคลาสสิค ผิวเรียบ สีสักน้ำผึ้ง', '1547430241053955500.jpg', '1.6*10*150 ซม.', '3.40', 107.00, NULL, 10, 10, 1545917257000291700, 1015, '040-152161015012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547430319068997600, 1547106977067962800, 'ไม้รั้วรุ่นคลาสสิค ผิวเรียบ สีขาวปะการัง', '1547430319068983800.jpg', '1.6*10*100 ซม.', '2.20', 49.76, NULL, 10, 10, 1545917257000291700, 1015, '040-152161010010', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547430404093850600, 1547106977067962800, 'ไม้รั้วรุ่นคลาสสิค ผิวเรียบ สีสักน้ำผึ้ง', '1547430404093836900.jpg', '1.6*10*100 ซม.', '2.20', 49.76, NULL, 10, 10, 1545917257000291700, 1015, '040-152161010012', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547435272004802700, 1547106977067962800, 'ไม้รั้วรุ่นคลาสสิค ผิวเรียบ สีโอ๊คไฉไล', '1547435272004789300.jpg', '1.6*10*100 ซม.', '2.20', 53.93, NULL, 10, 10, 1545917257000291700, 1015, '040-153161010053', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547458901076800900, 1547428318063363600, 'ไม้บันไดเฌอร่า ลายชัยพฤกษ์ : ลูกนอน สีธรรมชาติ', '1547458901076788600.jpg', '2.5*25*120 ซม.', '11.56', 278.63, NULL, 10, 10, 1545917257000291700, 1015, '040-162252512001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459014097033300, 1547428318063363600, 'ไม้บันไดเฌอร่า ลายชัยพฤกษ์ : ลูกนอน สีธรรมชาติ', '1547459014097019500.jpg', '2.5*30*120 ซม.', '13.87', 298.53, NULL, 10, 10, 1545917257000291700, 1015, '040-162253012001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459079003756300, 1547428318063363600, 'ไม้บันไดเฌอร่า ลายชัยพฤกษ์ : ลูกนอน สีธรรมชาติ', '1547459079003742700.jpg', '3.5*25*120 ซม.', '16.23', 298.53, NULL, 10, 10, 1545917257000291700, 1015, '040-162352512001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459151093740600, 1547428318063363600, 'ไม้บันไดเฌอร่า ลายชัยพฤกษ์ : ลูกนอน สีธรรมชาติ', '1547459151093727100.jpg', '3.5*27*120 ซม.', '17.53', 298.53, NULL, 10, 10, 1545917257000291700, 1015, '040-162352712001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459219024626000, 1547428318063363600, 'ไม้บันไดเฌอร่า ลายชัยพฤกษ์ : ลูกนอน สีธรรมชาติ', '1547459219024612900.jpg', '3.5*30*120 ซม.', '19.47', 358.24, NULL, 10, 10, 1545917257000291700, 1015, '040-162353012001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459525020577900, 1547428385096188700, 'ไม้บันไดเฌอร่า ลายเสี้ยน : ลูกนอน สีธรรมชาติ', '1547459525020564900.jpg', '3.5*27*120 ซม.', '16.23', 298.53, NULL, 10, 10, 1545917257000291700, 1015, '040-163352712001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459583020904200, 1547428385096188700, 'ไม้บันไดเฌอร่า ลายเสี้ยน : ลูกนอน สีธรรมชาติ', '1547459583020890900.jpg', '3.5*30*120 ซม.', '19.47', 358.24, NULL, 10, 10, 1545917257000291700, 1015, '040-163353012001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459741035736800, 1547428528085084400, 'ไม้บันไดเฌอร่า ผิวเรียบ : ลูกตั้ง สีธรรมชาติ', '1547459741035723000.jpg', '1.6*15*120 ซม.', '4.45', 86.24, NULL, 10, 10, 1545917257000291700, 1015, '040-161161512001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547459821030560900, 1547428528085084400, 'ไม้บันไดเฌอร่า ผิวเรียบ : ลูกตั้ง สีธรรมชาติ', '1547459821030546600.jpg', '1.6*20*120 ซม.', '5.94', 111.45, NULL, 10, 10, 1545917257000291700, 1015, '040-161162012001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547517597044619900, 1547516970083050600, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรงสีธรรมชาติ', '1547714873038429600.jpg', '1.6*7.5*300 ซม.', '5.24', 112.78, NULL, 10, 10, 1545917257000291700, 1015, '040-141167530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547517726001832500, 1547516970083050600, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรงสีธรรมชาติ', '1547714846067688300.jpg', '2.5*5.0*300 ซม.', '5.46', 116.42, NULL, 10, 10, 1545917257000291700, 1015, '040-141252030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547517805003842000, 1547516970083050600, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรงสีธรรมชาติ', '1547714813090318800.jpg', '2.5*10*300 ซม.', '10.90', 155.52, NULL, 10, 10, 1545917257000291700, 1015, '040-141251030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547714631030845200, 1547517014054981700, 'ไม้ตกแต่งเฌอร่า ผิวเรียบ รุ่นขอบตรงสีธรรมชาติ', '1547714631030831100.jpg', '1.6*5.0*300 ซม.', '3.49', 83.67, NULL, 10, 10, 1545917257000291700, 1015, '040-142165030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547714708040139400, 1547517014054981700, 'ไม้ตกแต่งเฌอร่า ผิวเรียบ รุ่นขอบตรงสีธรรมชาติ', '1550196512014083600.jpg,1550196587080803600.jpg', '1.6*7.5*300 ซม.', '5.24', 112.78, NULL, 10, 10, 1545917257000291700, 1015, '040-152167530001', '', NULL, NULL, '1550196587080790500.jpg');
INSERT INTO `stock_product_items` VALUES (1547784894005653300, 1547780436096578200, 'แผ่นฝ้าเฌอร่าบอร์ด (แผ่นซีก สลิม)', '1547784894005639200.jpg', '3.2*600*2400 มม.', '7.05', 50.91, NULL, 10, 10, 1545923960002445000, 1015, '040-202326002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547784996094801500, 1547780436096578200, 'แผ่นฝ้าเฌอร่าบอร์ด (แผ่นเต็ม สลิม)', '1547784996094789300.jpg', '3.2*1200*2400 มม.', '14.10', 101.17, NULL, 10, 10, 1545923960002445000, 1015, '040-2023212002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547785112085160500, 1547780436096578200, 'แผ่นฝ้าเฌอร่าบอร์ด (แผ่นซีก)', '1547785112085147400.jpg', '4.0*600*2400 มม.', '8.81', 58.74, NULL, 10, 10, 1545923960002445000, 1015, '040-202406002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547785203000779300, 1547780436096578200, 'แผ่นฝ้าเฌอร่าบอร์ด (แผ่นเต็ม)', '1547785203000765800.jpg', '4.0*1200*2400 มม.', '17.62', 117.49, NULL, 10, 10, 1545923960002445000, 1015, '040-2024012002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547792206003374000, 1547791557032501500, 'แผ่นฝ้าระบายอากาศ รุ่นคลาสสิค เว้นร่อง 3\"', '1550196681094891400.jpg', '4*600*1200 มม.', '4.01', 46.60, NULL, 10, 10, 1545923960002445000, 1015, '040-21010460012003', '', NULL, NULL, '1550196681094877800.jpg');
INSERT INTO `stock_product_items` VALUES (1547792362051832500, 1547791557032501500, 'แผ่นฝ้าระบายอากาศ รุ่นคลาสสิค', '1547792362051819100.jpg', '4*600*120 มม.', '4.41', 39.43, NULL, 10, 10, 1545923960002445000, 1015, '040-2101046001200', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1547792560072279900, 1547791557032501500, 'แผ่นฝ้าระบายอากาศ รุ่นคลาสสิค', '1547792560072267400.jpg', '3.2*600*1200 มม.', '3.52', 35.85, NULL, 10, 10, 1545923960002445000, 1015, '040-2101326001200', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548133498002157900, 1548130457026405700, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาว ลายหยดน้ำ', '1548133498002145100.jpg', '0.35*59.5*59.5 มม.', '1.90', 28.68, NULL, 10, 10, 1545923960002445000, 1015, '040-2011355950595', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548140481057703400, 1548130457026405700, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาว ลายหินเกล็ด', '1548140481057690600.jpg', '0.35*59.5*59.5 มม.', '1.90', 28.68, NULL, 10, 10, 1545923960002445000, 1015, '040-2012355950595', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548140578082927700, 1548130457026405700, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาว ลายบลอสซั่ม', '1548140578082909900.jpg', '0.35*59.5*59.5 มม.', '1.90', 28.68, NULL, 10, 10, 1545923960002445000, 1015, '040-2013355950595', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548140942090145200, 1548130457026405700, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาว ลายหยดน้ำ', '1548140942090131700.jpg', '0.35*59.5*119.5 มม.', '3.85', 57.35, NULL, 10, 10, 1545923960002445000, 1015, '040-2011355951195', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548142044059990500, 1548130457026405700, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาว ลายหินเกล็ด', '1548142044059977200.jpg', '0.35*59.5*119.5 มม.', '3.85', 57.35, NULL, 10, 10, 1545923960002445000, 1015, '040-2012355951195', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548142144073738200, 1548130457026405700, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาว ลายบลอสซั่ม', '1548142144073723800.jpg', '0.35*59.5*119.5 มม.', '3.85', 57.35, NULL, 10, 10, 1545923960002445000, 1015, '040-2013355951195', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548147661063178900, 1548142388022844500, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาวเรียบ', '1548147661063166900.jpg', '0.32*59.5*59.5 มม.', '1.73', 22.94, NULL, 10, 10, 1545923960002445000, 1015, '040-2001325950595', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548147749069346000, 1548142388022844500, 'แผ่นฝ้าลาย  Deco Ceilling T-bar สีขาวเรียบ', '1548147749069333200.jpg', '0.32*59.5*119.5 มม.', '3.48', 45.88, NULL, 10, 10, 1545923960002445000, 1015, '040-2001325951195', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148217053514200, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายหยดน้ำ', '1548148217053500900.jpg', '3.5*600*2400 มม.', '7.71', 71.69, NULL, 10, 10, 1545923960002445000, 1015, '040-2051356002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148318058929000, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายหยดน้ำ', '1548148318058913500.jpg', '3.5*1200*1200 มม.', '7.71', 71.69, NULL, 10, 10, 1545923960002445000, 1015, '040-20513512001200', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148435006516100, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายหยดน้ำ', '1548148435006502400.jpg', '3.5*1200*2400 มม.', '15.42', 143.38, NULL, 10, 10, 1545923960002445000, 1015, '040-20513512002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148563036170500, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายหินเกล็ด', '1548148563036157400.jpg', '3.5*600*2400 มม.', '7.71', 71.69, NULL, 10, 10, 1545923960002445000, 1015, '040-2052356002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148650096671500, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายหินเกล็ด', '1548148650096657500.jpg', '3.5*1200*1200 มม.', '7.71', 71.69, NULL, 10, 10, 1545923960002445000, 1015, '040-20523512001200', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148725043160500, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายหินเกล็ด', '1548148725043147100.jpg', '3.5*1200*2400 มม.', '15.42', 143.38, NULL, 10, 10, 1545923960002445000, 1015, '040-20523512002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148811069609000, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายบลอสซั่ม', '1548148811069596400.jpg', '3.5*600*2400 มม.', '7.71', 75.27, NULL, 10, 10, 1545923960002445000, 1015, '040-5023356002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148898026020200, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายบลอสซั่ม', '1548148898026004900.jpg', '3.5*1200*1200 มม.', '7.71', 75.27, NULL, 10, 10, 1545923960002445000, 1015, '040-502312001200', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548148981047825400, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายบลอสซั่ม', '1548148981047811800.jpg', '3.5*1200*2400 มม.', '15.42', 150.55, NULL, 10, 10, 1545923960002445000, 1015, '040-50233512002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548149250042660400, 1548147832017289700, 'แผ่นฝ้า เฌอร่าบอร์ด Deco Ceilling ลายสักเว้นร่อง 3\"', '1548149250042647200.jpg', '4*600*120 มม.', '4.23', 43.01, NULL, 10, 10, 1545923960002445000, 1015, '040-20544600120', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548150024026049600, 1548149420057763100, 'แผ่นผนัง รุ่นขอบตรง เฌอร่าบอร์ด', '1548150024026036800.jpg', '6*1200*2400 มม.', '26.83', 196.45, NULL, 10, 10, 1545923960002445000, 1015, '040-202612002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548150105072157800, 1548149420057763100, 'แผ่นผนัง รุ่นขอบตรง เฌอร่าบอร์ด', '1548150105072144200.jpg', '6*1200*3000 มม.', '33.53', 247.38, NULL, 10, 10, 1545923960002445000, 1015, '040-202612003000', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548150212072507600, 1548149420057763100, 'แผ่นผนัง รุ่นขอบตรง เฌอร่าบอร์ด', '1548150212072495600.jpg', '8*1200*2400 มม.', '35.77', 269.21, NULL, 10, 10, 1545923960002445000, 1015, '040-202812002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548150275062138300, 1548149420057763100, 'แผ่นผนัง รุ่นขอบตรง เฌอร่าบอร์ด', '1548150275062124700.jpg', '8*1200*3000 มม.', '44.71', 341.97, NULL, 10, 10, 1545923960002445000, 1015, '040-202812003000', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548150755026612900, 1548149420057763100, 'แผ่นผนัง รุ่นขอบตรง เฌอร่าบอร์ด', '1548150755026600400.jpg', '10*1200*2400 มม.', '44.71', 349.25, NULL, 10, 10, 1545923960002445000, 1015, '040-2021012002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548150822039802600, 1548149420057763100, 'แผ่นผนัง รุ่นขอบตรง เฌอร่าบอร์ด', '1548150822039790500.jpg', '12*1200*2400 มม.', '53.65', 422.01, NULL, 10, 10, 1545923960002445000, 1015, '040-2021212002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548208880057918500, 1548149478045354000, 'แผ่นผนัง รุ่นขอบลาด 2 ด้าน เฌอร่าบอร์ด', '1548208880057905400.jpg', '6*1200*2400 มม.', '26.83', 193.56, NULL, 10, 10, 1545923960002445000, 1015, '040-204612002400', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548208993053622200, 1548149478045354000, 'แผ่นผนัง รุ่นขอบลาด 2 ด้าน เฌอร่าบอร์ด', '1548208993053610500.jpg,1549698583077138700.jpg', '8*1200*2400 มม.', '35.77', 265.25, NULL, 10, 10, 1545923960002445000, 1015, '040-204812002400', '<h1><span style=\"font-family: Arial, Helvetica, sans-serif; font-size: 24px;\">แผ่นไฟเบอร์ซีเมนต์ชนิดขอบลาด มีขอบลาดตลอดแนวยาวทั้ง 2 ด้าน เหมาะสำหรับงานฉาบเรียบ งานผนังภายในที่ต้องการความสวยงามเรียบเนียน เหนือกว่าแผ่นยิปซั่มทั่วไป ด้วยคุณสมบัติเด่นทนน้ำ ทนชื้น ทนแรงกระแทก และ ปลวกไม่กิน ไม่มีสารก่ออันตรายต่อสุขภาพ แผ่นผนัง เฌอร่าบอร์ด (รุ่นขอบลาด) มีความหนาตั้งแต่ 6-8 มม.</span></h1><h4>รหัสผลิตภัณฑ์:&nbsp;SCR000804900001</h4><h3><canvas height=\"22\" width=\"97\"><br></canvas>คุณสมบัติ</h3><ul><li><figure title=\"ดัดโค้งได้\"><img src=\"https://storage.dconhub.com/images/5c5e85051a4f2.png\" width=\"45\" height=\"45\" alt=\"ดัดโค้งได้\" class=\"fr-fic fr-dii\" data-id=\"5c5e85051a4f2.png\"><img src=\"https://storage.dconhub.com/images/5c5e850510b49.png\" width=\"45\" height=\"45\" alt=\"ทนต่อแผ่นดินไหว\" class=\"fr-fic fr-dii\" data-id=\"5c5e850510b49.png\"><img src=\"https://storage.dconhub.com/images/5c5e85051c64c.png\" width=\"45\" height=\"45\" alt=\"ติดตั้งรวดเร็ว\" class=\"fr-fic fr-dii\" data-id=\"5c5e85051c64c.png\"><img src=\"https://storage.dconhub.com/images/5c5e8505238aa.png\" width=\"45\" height=\"45\" alt=\"เรียบได้ระนาบ\" class=\"fr-fic fr-dii\" data-id=\"5c5e8505238aa.png\"><img src=\"https://storage.dconhub.com/images/5c5e850525658.png\" width=\"45\" height=\"45\" alt=\"ไม่เปราะแตกง่าย\" class=\"fr-fic fr-dii\" data-id=\"5c5e850525658.png\"><img src=\"https://storage.dconhub.com/images/5c5e8505f0c52.png\" width=\"45\" height=\"45\" alt=\"แข็งแรง ทนทาน\" class=\"fr-fic fr-dii\" data-id=\"5c5e8505f0c52.png\"><img src=\"https://storage.dconhub.com/images/5c5e8505e7973.png\" width=\"45\" height=\"45\" alt=\"กันเสียง\" class=\"fr-fic fr-dii\" data-id=\"5c5e8505e7973.png\"></figure></li><li><br></li><li>ดัดโค้งได้</li><li>ทนต่อแผ่นดินไหว</li><li>ติดตั้งรวดเร็ว</li><li>เรียบได้ระนาบ</li><li>ไม่เปราะแตกง่าย</li><li>แข็งแรง ทนทาน</li><li>กันเสียง</li></ul><h3><canvas height=\"22\" width=\"137\"><br></canvas>มาตรฐานคุณภาพ</h3><ul><li><figure title=\"ASTM C 1185\"><img src=\"https://storage.dconhub.com/images/5c5e8505ddaad.png\" width=\"60\" height=\"60\" alt=\"ASTM C 1185\" class=\"fr-fic fr-dii\" data-id=\"5c5e8505ddaad.png\"></figure>ASTM C 1185</li><li><figure title=\"ASTM C 177\"><img src=\"https://storage.dconhub.com/images/5c5e850618d1e.png\" width=\"60\" height=\"60\" alt=\"ASTM C 177\" class=\"fr-fic fr-dii\" data-id=\"5c5e850618d1e.png\"></figure>ASTM C 177</li><li><figure title=\"ASTM C E90-E97\"><img src=\"https://storage.dconhub.com/images/5c5e850622aa5.png\" width=\"60\" height=\"60\" alt=\"ASTM C E90-E97\" class=\"fr-fic fr-dii\" data-id=\"5c5e850622aa5.png\"></figure>ASTM C E90-E97</li><li><figure title=\"ASTM E 84-00a\"><img src=\"https://storage.dconhub.com/images/5c5e85062de2b.png\" width=\"60\" height=\"60\" alt=\"ASTM E 84-00a\" class=\"fr-fic fr-dii\" data-id=\"5c5e85062de2b.png\"></figure>ASTM E 84-00a</li><li><figure title=\"JIS A5414\"><img src=\"https://storage.dconhub.com/images/5c5e85069802f.png\" width=\"60\" height=\"60\" alt=\"JIS A5414\" class=\"fr-fic fr-dii\" data-id=\"5c5e85069802f.png\"></figure>JIS A5414</li></ul>', NULL, NULL, '1549698583077124600.jpg');
INSERT INTO `stock_product_items` VALUES (1548211079023100200, 1548209737057228900, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1548211079023086300.jpg', '3.0*10*300 ซม.', '13.09', 182.97, NULL, 10, 10, 1545923960002445000, 1015, '040-143301030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548211363059829600, 1548209737057228900, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1548211363059816400.jpg', '2.5*15*300 ซม.', '16.36', 231.76, NULL, 10, 10, 1545923960002445000, 1015, '040-145251530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548211581032892000, 1548209737057228900, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1548211581032878500.jpg', '2.5*20*300 ซม.', '21.82', 308.00, NULL, 10, 10, 1545923960002445000, 1015, '040-145252030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548211706031217000, 1548209737057228900, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1548211706031204600.jpg', '2.5*25*300 ซม.', '27.28', 384.24, NULL, 10, 10, 1545923960002445000, 1015, '040-145252530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548211768080732600, 1548209737057228900, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ สีธรรมชาติ', '1548211768080720000.jpg', '2.5*30*300 ซม.', '32.74', 463.52, NULL, 10, 10, 1545923960002445000, 1015, '040-143253030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548293246085819600, 1548210280075015700, 'ไม้พื้น เฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง สีรองพื้นขาวมะลิ', '1548293246085805900.jpg', '3.0*10*300 ซม.', '13.09', 192.12, NULL, 10, 10, 1545923960002445000, 1015, '040-143301030002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548293344039658600, 1548210280075015700, 'ไม้พื้น เฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง สีรองพื้นขาวมะลิ', '1548293344039644500.jpg', '2.5*15*300 ซม.', '16.36', 240.19, NULL, 10, 10, 1545923960002445000, 1015, '040-143251530002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548293417034189300, 1548210280075015700, 'ไม้พื้น เฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง สีรองพื้นขาวมะลิ', '1548293417034176700.jpg', '2.5*20*300 ซม.', '21.82', 326.30, NULL, 10, 10, 1545923960002445000, 1015, '040-143252030002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548293491006828800, 1548210280075015700, 'ไม้พื้น เฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง สีรองพื้นขาวมะลิ', '1548293491006815600.jpg', '2.5*25*300 ซม.', '27.28', 402.53, NULL, 10, 10, 1545923960002445000, 1015, '040-143252530002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548293566032982800, 1548210280075015700, 'ไม้พื้น เฌอร่า ลายชัยพฤกษ์ รุ่นขอบตรง สีรองพื้นขาวมะลิ', '1548293566032969500.jpg', '2.5*30*300 ซม.', '32.74', 487.92, NULL, 10, 10, 1545923960002445000, 1015, '040-143253030002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548380616018848500, 1548210313056717900, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ สีน้ำตาลเมอร์โบ', '1548380616018834800.jpg', '3.0*10*300 ซม.', '13.09', 256.16, NULL, 10, 10, 1545923960002445000, 1015, '040-143301030023', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548380915030461800, 1548210313056717900, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ สีน้ำตาลเมอร์โบ', '1548380915030448500.jpg', '2.5*15*300 ซม.', '16.36', 320.20, NULL, 10, 10, 1545923960002445000, 1015, '040-145251530023', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548381028084026900, 1548210313056717900, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ สีน้ำตาลเมอร์โบ', '1548381028084013900.jpg', '2.5*20*300 ซม.', '21.82', 426.93, NULL, 10, 10, 1545923960002445000, 1015, '040-145252030023', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548381191047198300, 1548210313056717900, 'ไม้ตกแต่งเฌอร่า ลายชัยพฤกษ์ สีน้ำตาลเมอร์โบ', '1548381191047183400.jpg', '2.5*25*300 ซม.', '27.28', 533.66, NULL, 10, 10, 1545923960002445000, 1015, '040-145252530023', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548381277024142000, 1548210313056717900, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ สีน้ำตาลเมอร์โบ', '1548381277024128600.jpg', '2.5*30*300 ซม.', '32.74', 640.40, NULL, 10, 10, 1545923960002445000, 1015, '040-143253030023', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548726049027830200, 1548381551019428400, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง 1 ร่อง สีธรรมชาติ', '1548726049027817300.jpg', '2.5*30*300 ซม.', '32.74', 463.52, NULL, 10, 10, 1545917257000291700, 1015, '040-14901253030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548727146015495300, 1548381551019428400, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง 2 ร่อง สีธรรมชาติ', '1548727146015481800.jpg', '2.5*30*300 ซม.', '32.74', 481.82, NULL, 10, 10, 1545917257000291700, 1015, '040-14902253030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548727213086140400, 1548381551019428400, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง 3 ร่อง สีธรรมชาติ', '1548727213086124600.jpg', '2.5*30*300 ซม.', '32.74', 494.02, NULL, 10, 10, 1545917257000291700, 1015, '040-14903253030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548727338029042900, 1548381592051510600, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง 1 ร่อง สีขาวมะลิ', '1548727338029029500.jpg', '2.5*30*300 ซม.', '32.74', 487.92, NULL, 10, 10, 1545917257000291700, 1015, '040-14901253030002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548727405066562900, 1548381592051510600, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง 2 ร่อง สีขาวมะลิ', '1548727405066547900.jpg', '2.5*30*300 ซม.', '32.74', 506.22, NULL, 10, 10, 1545917257000291700, 1015, '040-14902253030002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548727479054610900, 1548381592051510600, 'ไม้พื้นเฌอร่า ลายชัยพฤกษ์ รุ่นเซาะร่อง 3 ร่อง สีขาวมะลิ', '1548727479054596900.jpg', '2.5*30*300 ซม.', '32.74', 518.42, NULL, 10, 10, 1545917257000291700, 1015, '040-14903253030002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548728104076023900, 1548727627017284300, 'ไม้พื้น เฌอร่า ลายเสี้ยนตรง รุ่นขอบวี สีธรรมชาติ', '1548728104076011000.jpg', '2.5*15*300 ซม.', '16.36', 231.76, NULL, 10, 10, 1545917257000291700, 1015, '040-146251530001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548728160021119900, 1548727627017284300, 'ไม้พื้น เฌอร่า ลายเสี้ยนตรง รุ่นขอบวี สีธรรมชาติ', '1548728160021104800.jpg', '2.5*20*300 ซม.', '21.82', 308.00, NULL, 10, 10, 1545917257000291700, 1015, '040-146252030001', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548728249041546200, 1548727627017284300, 'ไม้พื้น เฌอร่า ลายเสี้ยนตรง รุ่นขอบวี สีรองพื้นขาวมะลิ', '1548728249041532100.jpg', '2.5*15*300 ซม.', '16.36', 240.91, NULL, 10, 10, 1545917257000291700, 1015, '040-146251530002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548728318021117800, 1548727627017284300, 'ไม้พื้น เฌอร่า ลายเสี้ยนตรง รุ่นขอบวี สีรองพื้นขาวมะลิ', '1548728318021104600.jpg', '2.5*20*300 ซม.', '21.82', 326.30, NULL, 10, 10, 1545917257000291700, 1015, '040-146252030002', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548729644091732000, 1548728602060380900, 'ไม้พื้น เฌอร่า ลายชัยพฤกษ์ รุ่นขอบวี สีน้ำตาลเชสนัท', '1548729644091714900.jpg', '2.5*15*300 ซม.', '16.38', 419.44, NULL, 10, 10, 1545917257000291700, 1015, '040-14501251530074', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548729765099897300, 1548728602060380900, 'ไม้พื้น เฌอร่า ลายชัยพฤกษ์ รุ่นขอบวี สีน้ำตาลเชสนัท', '1548729765099884300.jpg', '2.5*20*300 ซม.', '21.84', 560.25, NULL, 10, 10, 1545917257000291700, 1015, '040-14501252030074', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548732448041446100, 1548728665070423000, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยน รุ่นขอบวี สีทรอปิคัล โอ๊ค', '1548732448041432600.jpg', '2.5*15*300 ซม.', '16.38', 419.44, NULL, 10, 10, 1545917257000291700, 1015, '040-14502251530073', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548732515020002600, 1548728665070423000, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยน รุ่นขอบวี สีทรอปิคัล โอ๊ค', '1548732515019989300.jpg', '2.5*20*300 ซม.', '21.84', 560.25, NULL, 10, 10, 1545917257000291700, 1015, '040-14502252030073', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548732687043752200, 1548728665070423000, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยน รุ่นขอบวี สีบราวน์ เวงเก้', '1548732687043738400.jpg', '2.5*15*300 ซม.', '16.38', 419.44, NULL, 10, 10, 1545917257000291700, 1015, '040-14502251530061', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548732876051024100, 1548728665070423000, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยน รุ่นขอบวี สีบราวน์ เวงเก้', '1548732876051010600.jpg', '2.5*20*300 ซม.', '21.84', 560.25, NULL, 10, 10, 1545917257000291700, 1015, '040-14502252030061', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548732992049108100, 1548728665070423000, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยน รุ่นขอบวี สีสักทรายทอง', '1548732992049093200.jpg', '2.5*15*300 ซม.', '16.38', 419.44, NULL, 10, 10, 1545917257000291700, 1015, '040-14502251530043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548733059045617500, 1548728665070423000, 'ไม้พื้น เฌอร่า คัลเลอร์ทรู ลายเสี้ยน รุ่นขอบวี สีสักทรายทอง', '1548733059045605100.jpg', '2.5*20*300 ซม.', '21.84', 560.25, NULL, 10, 10, 1545917257000291700, 1015, '040-14502252030043', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548753417099957500, 1547715290000763000, 'รุ่น GP01 : ประตูผิวเรียบ เว้นร่องแนวขวาง (เจาะรูลูกบิด) สีรองพื้นขาว', '1551708488011278500.jpg,1588913531050658000.jpg', '3.5*70*200 ซม.', '20', 2156.05, NULL, 10, 10, 1545917257000291700, 1115, '040-16701357020001GP01', '', NULL, NULL, '1588913531050629900.jpg');
INSERT INTO `stock_product_items` VALUES (1548753787003339400, 1547715290000763000, 'รุ่น GP01 : ประตูผิวเรียบ เว้นร่องแนวขวาง (เจาะรูลูกบิด) สีรองพื้นขาว', '1548753787003326000.jpg', '3.5*80*200 ซม.', '22', 2295.15, NULL, 10, 10, 1545917257000291700, NULL, '040-16701358020001GP01', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548754015064588000, 1547715290000763000, 'รุ่น GP01 : ประตูผิวเรียบ เว้นร่องแนวขวาง (เจาะรูลูกบิด) สีรองพื้นขาว', '1548754015064574700.jpg', '3.5*90*200 ซม.', '24', 2434.25, NULL, 10, 10, 1545917257000291700, NULL, '040-16701359020001GP01', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548754151067215000, 1547715337030293400, 'รุ่น GP01 : ประตูผิวเรียบ เว้นร่องแนวขวาง (ไม่เจาะรูลูกบิด) สีรองพื้นขาว', '1548754151067199200.jpg', '3.5*70*200 ซม.', '20', 2156.05, NULL, 10, 10, 1545917257000291700, NULL, '040-16702357020001GP01', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548754251069392100, 1547715337030293400, 'รุ่น GP01 : ประตูผิวเรียบ เว้นร่องแนวขวาง (ไม่เจาะรูลูกบิด) สีรองพื้นขาว', '1548754251069379200.jpg', '3.5*80*200 ซม.', '22', 2295.15, NULL, 10, 10, 1545917257000291700, NULL, '040-16702358020001GP01', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548754324038969900, 1547715337030293400, 'รุ่น GP01 : ประตูผิวเรียบ เว้นร่องแนวขวาง (ไม่เจาะรูลูกบิด) สีรองพื้นขาว', '1548754324038956700.jpg', '3.5*90*200 ซม.', '24', 2434.25, NULL, 10, 10, 1545917257000291700, NULL, '040-16702359020001GP01', '', NULL, NULL, NULL);
INSERT INTO `stock_product_items` VALUES (1548754438000209300, 1547715290000763000, 'รุ่น GP02 : ประตูผิวเรียบ เว้นร่องแนวขวางและแนวตั้ง (เจาะรูลูกบิด) สีรองพื้นขาว', '1548754438000196200.jpg,1551708767099715100.jpg', '3.5*70*200 ซม.', '20', 2156.05, NULL, 10, 10, 1545917257000291700, 1115, '040-16701357020001GP02', '', NULL, NULL, '1551708767099700700.jpg');
INSERT INTO `stock_product_items` VALUES (1548754618087106800, 1547715290000763000, 'รุ่น GP02 : ประตูผิวเรียบ เว้นร่องแนวขวางและแนวตั้ง (เจาะรูลูกบิด) สีรองพื้นขาว', '1548754618087091800.jpg,1551708851039965700.jpg', '3.5*80*200 ซม.', '22', 2295.15, NULL, 10, 10, 1545917257000291700, 1115, '040-16701358020001GP02', '', NULL, NULL, '1551708851039953400.jpg');
INSERT INTO `stock_product_items` VALUES (1548754752022418400, 1547715290000763000, 'รุ่น GP02 : ประตูผิวเรียบ เว้นร่องแนวขวางและแนวตั้ง (เจาะรูลูกบิด) สีรองพื้นขาว', '1548754752022405500.jpg,1551708924007654600.jpg', '3.5*90*200 ซม.', '24', 2434.25, NULL, 10, 10, 1545917257000291700, 1115, '040-16701359020001GP02', '', NULL, NULL, '1551708924007641300.jpg');
INSERT INTO `stock_product_items` VALUES (1548754836061019700, 1547715337030293400, 'รุ่น GP02 : ประตูผิวเรียบ เว้นร่องแนวขวางและแนวตั้ง (ไม่เจาะรูลูกบิด) สีรองพื้นขาว', '1548754836061007500.jpg,1551709193099102500.jpg', '3.5*70*200 ซม.', '20', 2156.05, NULL, 10, 10, 1545917257000291700, 1115, '040-16702357020001GP02', '', NULL, NULL, '1551709193099089500.jpg');
INSERT INTO `stock_product_items` VALUES (1548755278031555100, 1547715337030293400, 'รุ่น GP02 : ประตูผิวเรียบ เว้นร่องแนวขวางและแนวตั้ง (ไม่เจาะรูลูกบิด) สีรองพื้นขาว', '1548755278031541100.jpg,1551709236034109800.jpg', '3.5*80*200 ซม.', '22', 2295.15, NULL, 10, 10, 1545917257000291700, 1115, '040-16702358020001GP02', '', NULL, NULL, '1551709236034096100.jpg');
INSERT INTO `stock_product_items` VALUES (1548755391080054300, 1547715337030293400, 'รุ่น GP02 : ประตูผิวเรียบ เว้นร่องแนวขวางและแนวตั้ง (ไม่เจาะรูลูกบิด) สีรองพื้นขาว', '1548755391080041400.jpg,1551709269005857600.jpg', '3.5*90*200 ซม.', '24', 2434.25, NULL, 10, 10, 1545917257000291700, 1115, '040-16702359020001GP02', '', NULL, NULL, '1551709269005844900.jpg');
INSERT INTO `stock_product_items` VALUES (1548820020019373200, 1548818815090656600, 'วงกบประตูเฌอร่า รุ่นคลาสสิค สีธรรมชาติ', '1548820020019358300.jpg', '3.5*10*70*210 ซม.', '27.50', 640.40, NULL, 10, 10, 1545917257000291700, 1111, '040-165351070210001', '', NULL, NULL, '1549621747049856500.jpg');
INSERT INTO `stock_product_items` VALUES (1548820175032849100, 1548818815090656600, 'ชุดวงกบประตูเฌอร่า รุ่นคลาสสิค พร้อมบานพับ 4 ชิ้น สีธรรมชาติ', '1548820175032835500.jpg,1549683481011738400.jpg', '3.5*10*70*210 ซม.', '27.50', 731.88, NULL, 10, 10, 1545917257000291700, 1111, '040-165351070210401', '', NULL, NULL, '1549683481011724400.jpg');
INSERT INTO `stock_product_items` VALUES (1548820374002730300, 1548818815090656600, 'วงกบประตูเฌอร่า รุ่นคลาสสิค สีธรรมชาติ', '1548820374002718000.jpg,1549683524099085700.jpg', '3.5*10*80*210 ซม.', '28.70', 640.40, NULL, 10, 10, 1545917257000291700, 1111, '040-165351080210001', '', NULL, NULL, '1549683524099071300.jpg');
INSERT INTO `stock_product_items` VALUES (1548820472046233800, 1548818815090656600, 'ชุดวงกบประตูเฌอร่า รุ่นคลาสสิค พร้อมบานพับ 4 ชิ้น สีธรรมชาติ', '1548820472046220600.jpg,1549683556066535300.jpg', '3.5*10*80*210 ซม.', '28.70', 731.88, NULL, 10, 10, 1545917257000291700, 1111, '040-165351080210401', '', NULL, NULL, '1549683556066522100.jpg');
INSERT INTO `stock_product_items` VALUES (1548820641087225500, 1548818815090656600, 'วงกบประตูเฌอร่า รุ่นคลาสสิค สีธรรมชาติ', '1548820641087213000.jpg,1549683601067073200.jpg', '3.5*10*90*210 ซม.', '29.30', 640.40, NULL, 10, 10, 1545917257000291700, 1111, '040-165351090210001', '', NULL, NULL, '1549683601067060200.jpg');
INSERT INTO `stock_product_items` VALUES (1548820753023773400, 1548818815090656600, 'ชุดวงกบประตูเฌอร่า รุ่นคลาสสิค พร้อมบานพับ 4 ชิ้น สีธรรมชาติ', '1548820753023761100.jpg,1549683695099725600.jpg', '3.5*10*90*210 ซม.', '29.30', 731.88, NULL, 10, 10, 1545917257000291700, 1111, '040-165351090210401', '', NULL, NULL, '1549683695099709100.jpg');
INSERT INTO `stock_product_items` VALUES (1548821247036873900, 1548818934067611500, 'ชุดวงกบหน้าต่างเฌอร่า รุ่นคลาสสิค แบบ 1 ช่อง ไม่รวมบานพับ สีธรรมชาติ', '1548821247036860100.jpg,1549684379012526400.jpg', '3.5*10*60*110 ซม.', '16.75', 603.80, NULL, 10, 10, 1545917257000291700, 1111, '050-8013510060110101', '', NULL, NULL, '1549684379012509200.jpg');
INSERT INTO `stock_product_items` VALUES (1548821361006481200, 1548818934067611500, 'ชุดวงกบหน้าต่างเฌอร่า รุ่นคลาสสิค แบบ 2 ช่อง ไม่รวมบานพับ สีธรรมชาติ', '1548821361006467000.jpg,1549684429086570700.jpg,1588913581098975800.jpg', '3.5*10*120*110 ซม.', '33.50', 847.76, NULL, 10, 10, 1545917257000291700, 1111, '050-8013510120110201', '', NULL, NULL, '1588913581098947200.jpg');
INSERT INTO `stock_product_items` VALUES (1548821459081117100, 1548818934067611500, 'ชุดวงกบหน้าต่างเฌอร่า รุ่นคลาสสิค แบบ 3 ช่อง ไม่รวมบานพับ สีธรรมชาติ', '1548821459081102500.jpg,1549698074086218900.jpg', '3.5*10*180*110 ซม.', '47.70', 1195.40, NULL, 10, 10, 1549696506082728000, 1111, '050-8013510180110301', '', NULL, NULL, '1549698074086204200.jpg');
INSERT INTO `stock_product_items` VALUES (1548923646074230200, 1548897497049922300, 'ซีดาร์ เชค สีเหลืองแซนเต้  คละขนาด', '1550126661045132100.png', 'คละขนาด', '33.23', 623.32, NULL, 10, 10, NULL, 1113, '070-5311210152035481', '<p>ซีดาร์ เชค คละขนาด สีเหลืองแซนเต้ 1 กล่อง ประกอบด้วย&nbsp;</p><p>- ขนาด 1.2*10*35 ซม. จำนวน 5 แผ่น/กล่อง ,</p><p>- ขนาด 1.2*15*35 ซม. จำนวน 10 แผ่น/กล่อง ,</p><p>- ขนาด 1.2*20*35 ซม. จำนวน 10 แผ่น/กล่อง</p>', NULL, NULL, '1550127836062171100.png');
INSERT INTO `stock_product_items` VALUES (1548923846074152500, 1548897497049922300, 'ซีดาร์ เชค สีบราวน์เชสนัท คละขนาด', '1550126682037693700.png', 'คละขนาด', '33.23', 623.32, NULL, 10, 10, NULL, 1113, '070-5311210152035482', '<p>ซีดาร์ เชค คละขนาด 1 กล่อง สีบราวน์เชสนัท ประกอบด้วย&nbsp;</p><p>- ขนาด 1.2*10*35 ซม. จำนวน 5 แผ่น/กล่อง ,</p><p>- ขนาด 1.2*15*35 ซม. จำนวน 10 แผ่น/กล่อง ,</p><p>- ขนาด 1.2*20*35 ซม. จำนวน 10 แผ่น/กล่อง</p>', NULL, NULL, '1550126682037680000.png');
INSERT INTO `stock_product_items` VALUES (1548923947020810900, 1548897497049922300, 'ซีดาร์ เชค สีแบล็คเวงเก้ คละขนาด', '1550126698096530900.png', 'คละขนาด', '33.23', 623.32, NULL, 10, 10, NULL, 1113, '070-5311210152035483', '<p>ซีดาร์ เชค คละขนาด 1 กล่อง สีแบล็คเวงเก้ ประกอบด้วย&nbsp;</p><p>- ขนาด 1.2*10*35 ซม. จำนวน 5 แผ่น/กล่อง ,</p><p>- ขนาด 1.2*15*35 ซม. จำนวน 10 แผ่น/กล่อง ,</p><p>- ขนาด 1.2*20*35 ซม. จำนวน 10 แผ่น/กล่อง</p>', NULL, NULL, '1550126698096513300.png');
INSERT INTO `stock_product_items` VALUES (1548993640038566100, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 4 นิ้ว สีเหลืองแซนเต้', '1550126724035589000.png', 'หน้ากว้าง 4 นิ้ว', '32.78', 640.40, NULL, 10, 10, NULL, 1113, '070-531014140481', '<p>ซีดาร์ เชค หน้ากว้าง 4 นิ้ว สีเหลืองแซนเต้ &nbsp;1 กล่อง มี 40 ชิ้น</p><p><br></p>', NULL, NULL, '1550126724035574900.png');
INSERT INTO `stock_product_items` VALUES (1548996001031901400, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 6 นิ้ว สีเหลืองแซนเต้', '1550126931085973900.png', 'หน้ากว้าง 6 นิ้ว', '38.55', 640.40, NULL, 10, 10, NULL, 1113, '070-531016130481', '<p>ซีดาร์ เชค หน้ากว้าง 6 นิ้ว สีเหลืองแซนเต้ &nbsp;1 กล่อง มี 30 ชิ้น</p>', NULL, NULL, '1550126931085960200.png');
INSERT INTO `stock_product_items` VALUES (1548996159040404100, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 8 นิ้ว สีเหลืองแซนเต้', '1550126769051034500.png', 'หน้ากว้าง 8 นิ้ว', '35.09', 640.40, NULL, 10, 10, NULL, 1113, '070-531018122481', '<p>ซีดาร์ เชค หน้ากว้าง 8 นิ้ว สีเหลืองแซนเต้ &nbsp;1 กล่อง มี 22 ชิ้น</p>', NULL, NULL, '1550126950098286100.png');
INSERT INTO `stock_product_items` VALUES (1548996349077646000, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 4 นิ้ว สีบราวน์เชสนัท', '1550129888018695400.png', 'หน้ากว้าง 4 นิ้ว', '32.78', 640.40, NULL, 10, 10, 1549097788060708600, 1113, '070-531014140482', '<p>ซีดาร์ เชค หน้ากว้าง 4 นิ้ว สีบราวน์เชสนัท &nbsp;1 กล่อง มี 40 ชิ้น</p>', NULL, NULL, '1550129888018681000.png');
INSERT INTO `stock_product_items` VALUES (1548996595090563100, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 6 นิ้ว สีบราวน์เชสนัท', '1550126300085327500.png', 'หน้ากว้าง 6 นิ้ว', '38.55', 640.40, NULL, 10, 10, NULL, 1113, '070-531016130482', '<p>ซีดาร์ เชค หน้ากว้าง 6 นิ้ว สีบราวน์เชสนัท &nbsp;1 กล่อง มี 30 ชิ้น</p>', NULL, NULL, '1550129183044038800.png');
INSERT INTO `stock_product_items` VALUES (1548996764048904100, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 8 นิ้ว สีบราวน์เชสนัท', '1550129943037873600.png', 'หน้ากว้าง 8 นิ้ว', '35.09', 640.40, NULL, 10, 10, 1549097788060708600, 1113, '070-531018122482', '<p>ซีดาร์ เชค หน้ากว้าง 8 นิ้ว สีบราวน์เชสนัท 1 กล่อง มี 22 ชิ้น</p>', NULL, NULL, '1550129943037859800.png');
INSERT INTO `stock_product_items` VALUES (1549007629021520200, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 4 นิ้ว สีแบล็คเวงเก้', '1550127148065809300.png', 'หน้ากว้าง 4 นิ้ว', '32.78', 640.40, NULL, 10, 10, NULL, 1113, '070-531014140483', '<p>ซีดาร์ เชค หน้ากว้าง 4 นิ้ว สีแบล็คเวงเก้&nbsp; 1 กล่อง มี 40 ชิ้น</p>', NULL, NULL, '1550127148065795100.png');
INSERT INTO `stock_product_items` VALUES (1549007797043991300, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 6 นิ้ว สีแบล็คเวงเก้', '1550127186007063700.png', 'หน้ากว้าง 6 นิ้ว', '38.55', 640.40, NULL, 10, 10, 1549097788060708600, 1113, '070-531016130483', '<p>ซีดาร์ เชค หน้ากว้าง 6 นิ้ว สีแบล็คเวงเก้ &nbsp;1 กล่อง มี 30 ชิ้น</p>', NULL, NULL, '1550127186007049700.png');
INSERT INTO `stock_product_items` VALUES (1549007923024363400, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 8 นิ้ว สีแบล็คเวงเก้', '1550126599009608800.png', 'หน้ากว้าง 8 นิ้ว', '35.09', 640.40, NULL, 10, 10, NULL, 1113, '070-531018122483', '<p>ซีดาร์ เชค หน้ากว้าง 8 นิ้ว สีแบล็คเวงเก้ &nbsp;1 กล่อง มี 22 ชิ้น</p>', NULL, NULL, '1550126599009595100.png');
INSERT INTO `stock_product_items` VALUES (1549097149045290800, 1548924450040985100, 'ซีดาร์ เชค คละขนาด รุ่นโชว์โครง สีเหลืองแซนเต้', '1550127654002444400.png', 'คละขนาด', '34', 770.40, NULL, 10, 10, NULL, 1113, '070-531020125481', '<p>ซีดาร์เชค คละขนาด รุ่นโชว์โครง&nbsp;</p><p>1 กล่อง มี 25 ชิ้น</p>', NULL, NULL, '1550127654002430800.png');
INSERT INTO `stock_product_items` VALUES (1549097483076515600, 1548924450040985100, 'ซีดาร์ เชค คละขนาด รุ่นโชว์โครง สีบราวน์เชสนัท', '1550127631011065000.png', 'คละขนาด', '34', 77.40, NULL, 10, 10, NULL, 1113, '070-531020125482', '<p>ซีดาร์เชค คละขนาด รุ่นโชว์โครง&nbsp;</p><p>1 กล่อง มี 25 ชิ้น</p>', NULL, NULL, '1550127631011050900.png');
INSERT INTO `stock_product_items` VALUES (1549097604016253500, 1548924450040985100, 'ซีดาร์ เชค คละขนาด รุ่นโชว์โครง สีแบล็คเวงเก้', '1550127608014137500.png', 'คละขนาด', '34', 770.40, NULL, 10, 10, NULL, 1113, '070-531020125483', '<p>ซีดาร์เชค คละขนาด รุ่นโชว์โครง&nbsp;</p><p>1 กล่อง มี 25 ชิ้น</p>', NULL, NULL, '1550127608014123100.png');
INSERT INTO `stock_product_items` VALUES (1549160867063511400, 1549110775006774200, 'CN001', '1549160867063472300.png,1549160867063485700.png,1549160867063491000.jpg,1549160867063494800.png,1549160867063501900.png,1549160867063505100.png,1549160867063508100.png', '0.8x15x400 cm', '2.22', 100.00, 100, 30, 10, 1549109648098443500, 1, 'CN001', '<p>ทดสอบ</p>', NULL, NULL, '1549160903042976700.png');
INSERT INTO `stock_product_items` VALUES (1549165116043363700, 1549110775006774200, 'CN002', '1549165116043350700.jpeg,1549165116043354500.jpeg,1549165116043357900.jpeg,1549165116043360900.jpeg', '0.8x20x300 cm', '2.22', 99.00, 100, 30, 10, 1549109648098443500, 1015, 'cn002', '', NULL, NULL, '1549165116043336700.jpeg');
INSERT INTO `stock_product_items` VALUES (1549249486042842700, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 4 นิ้ว รุ่นโชว์โครง สีเหลืองแซนเต้', '1550128456054768100.png', 'หน้ากว้าง 4 นิ้ว', '39.40', 770.40, NULL, 10, 10, 1549097788060708600, 1113, '070-531024140481', '<p>ซีดาร์ เชค หน้ากว้าง 4 นิ้ว รุ่นโชว์โครง สีเหลืองแซนเต้</p><p>1 กล่อง มี 40 ชิ้น</p>', NULL, NULL, '1550128456054753700.png');
INSERT INTO `stock_product_items` VALUES (1549677434047494400, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 4 นิ้ว รุ่นโชว์โครง สีบราวน์เชสนัท', '1550128365020080400.png', 'หน้ากว้าง 4 นิ้ว', '39.40', 770.40, NULL, 10, 10, 1549097788060708600, 1113, '070-531024140482', '<p>ซีดาร์ เชค หน้ากว้าง 4 นิ้ว รุ่นโชว์โครง สีบราวน์เชสนัท</p><p>1 กล่อง มี 40 ชิ้น</p>', NULL, NULL, '1550128398093061900.png');
INSERT INTO `stock_product_items` VALUES (1549677574051563300, 1548924450040985100, 'ซีดาร์ เชค หน้ากว้าง 4 นิ้ว รุ่นโชว์โครง สีแบล็คเวงเก้', '1550128291006336500.png', 'หน้ากว้าง 4 นิ้ว', '39.40', 770.40, NULL, 10, 10, 1549097788060708600, 1113, '070-531024140483', '<p>ซีดาร์ เชค หน้ากว้าง 4 นิ้ว รุ่นโชว์โครง สีแบล็คเวงเก้</p><p>1 กล่อง มี 40 ชิ้น</p>', NULL, NULL, '1550128291006321800.png');
COMMIT;

-- ----------------------------
-- Table structure for stock_product_items_history
-- ----------------------------
DROP TABLE IF EXISTS `stock_product_items_history`;
CREATE TABLE `stock_product_items_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหมวดสินค้า',
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT 'ชื่อหมวดสินค้า',
  `icon` varchar(50) DEFAULT NULL COMMENT 'โลโก้',
  `size` text DEFAULT NULL COMMENT 'ขนาด',
  `weight` text DEFAULT NULL COMMENT 'น้ำหนัก',
  `price` decimal(10,2) DEFAULT NULL,
  `price_update` datetime NOT NULL,
  PRIMARY KEY (`id`,`price_update`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for tbl_shipper
-- ----------------------------
DROP TABLE IF EXISTS `tbl_shipper`;
CREATE TABLE `tbl_shipper` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `firstname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ขื่อ',
  `lastname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุล',
  `tel` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `note` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `default` int(1) DEFAULT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ที่อยู่',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เลยที่ผู้เสียภาษี',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_shipper
-- ----------------------------
BEGIN;
INSERT INTO `tbl_shipper` VALUES (1581415453063253100, 1, 'ณัฐพล', 'จันทร์ปาน', '0862229416', 'ทดสอบระบบ', '2020-02-11', NULL, 1, '22 ม.5 ต.หินตั้ง อ.บ้านไผ่ จ.ขอนแก่น 40110', '');
INSERT INTO `tbl_shipper` VALUES (1545354404005224400, 4, 'ณัฐพล', 'จันทร์ปาน', '0862229416', 'ทดสอบระบบ', '2018-12-21', NULL, 1, '22 ม.5 ต.หินตั้ง อ.บ้านไผ่ จ.ขอนแก่น 40110', NULL);
INSERT INTO `tbl_shipper` VALUES (1592196658071617300, 5, 'จิรพงศ์', 'ดาวพุธ', '0815443322', 'ส่งพร้อมลงและจัดเก็บด้วย ครับ', '2020-06-15', NULL, 1, '123 หมู่  321 ตำบล 456 ', '1234567890123');
INSERT INTO `tbl_shipper` VALUES (1546933077000044200, 7, 'วิภาวรรณ', 'วิริญาติ', '0850044429', 'ส่งถึงหน้างาน พร้อมลงสินค้าให้ด้วย', '2019-01-08', NULL, 1, NULL, NULL);
INSERT INTO `tbl_shipper` VALUES (1595564475000787700, 2147483647, 'ณัฐพล', 'จันทร์ปาน', '0650859480', 'ทดสอบระบบนะครับ', '2020-07-24', NULL, 1, 'ขอนแก่น', '');
INSERT INTO `tbl_shipper` VALUES (1578113469061338800, 6, 'nuttaphon', 'chanpan', '0862229416', '', '2020-01-04', NULL, 1, 'ccccc', '1111111');
INSERT INTO `tbl_shipper` VALUES (1600237478030684100, 2147483649, 'ธงชัย', 'การดี', '0891224185', '', '2020-09-16', NULL, 1, '523 ถนนเฉลิมพระเกียรติ ร9 แขวงประเวศ เขตประเวศ กทม 10250', '');
COMMIT;

-- ----------------------------
-- Table structure for themes
-- ----------------------------
DROP TABLE IF EXISTS `themes`;
CREATE TABLE `themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัส',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อธีม',
  `default` int(1) DEFAULT NULL COMMENT 'กำหนดใช้งาน',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ภาพธีม',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of themes
-- ----------------------------
BEGIN;
INSERT INTO `themes` VALUES (1, 'Themes1', 1, 'theme1.png', '@frontend/themes/cnred');
INSERT INTO `themes` VALUES (2, 'Themes2', 0, 'theme2.png', '@frontend/themes/electro');
INSERT INTO `themes` VALUES (3, 'Themes3', 0, 'theme3.png', '@frontend/themes/market');
COMMIT;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `user_id` bigint(20) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`) USING BTREE,
  CONSTRAINT `token_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  `status` int(10) DEFAULT NULL,
  `getAt` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_unique_username` (`username`) USING BTREE,
  UNIQUE KEY `user_unique_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2147483651 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', 'chanpan.nuttaphon1993@gmail.com', '$2y$12$obnECeQ6R8r.lamu.Kdmo.S2OTh1Dh9TvsvfSpGQfpBChgFs3Tz6K', 'KSwmb0yFT6Jf14f82pSAnAedCN44uzAQ', 1535696234, NULL, NULL, '::1', 1535696234, 1588941472, 0, 1589461127, NULL, NULL, '2020-05-08 19:37:52');
INSERT INTO `user` VALUES (2, 'manager1', 'manager1@gmail.com', '$2y$12$qkwIPkQ7fTyFDyEbB34bg.qx5k6.g9cZM5A.pwN.kl/MpPJWy1nXq', 'jqhuCd-lBsBNDngQNLvEogJSuFLGKkYI', 1545324276, NULL, NULL, '127.0.0.1', 1545324276, 1545324276, 0, 1546418742, NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, 'manager2', 'manager2@gmail.com', '$2y$12$IT49JtRGPOSgBRjK45A6pudM0Xc8TJpipFJZQeE2.E7gPxM0PaIrW', '6hyPF2JTzs_AHvUV-nQbHS96zDrbFinF', 1545324839, NULL, NULL, '127.0.0.1', 1545324839, 1545324839, 0, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, 'manager3', 'manager3@gmail.com', '$2y$12$8ftHqO2..PT47/glwkYawuX6oO4MfEOGTOWcf/FYGqovbXwRq13h6', 'DImDQYO_iNouZrQrZgvhHZFwwLup27HA', 1545324879, NULL, NULL, '127.0.0.1', 1545324879, 1545324879, 0, 1545923210, NULL, NULL, NULL);
INSERT INTO `user` VALUES (5, 'JIRAPONG', 'jirapong_r@hotmail.com', '$2y$12$V0OxFs0KgDg6tih25.YetOtnlm8nSvtwAt1QRJ81acVNVZ3kT9Oou', '6TbwndNu9MlO1UPbPSMTUCGdVmNP93p2', 1545911760, NULL, NULL, '49.229.204.164', 1545911761, 1545911761, 0, 1598606537, NULL, NULL, NULL);
INSERT INTO `user` VALUES (6, 'manager', 'manage@gmail.com', '$2y$12$3Rs6p/WyW6tBhq7xgzyqhe7vo9EEcA1Ho4RG6A..V1G7EdTTQn2Ma', 'MOX5HeDPdsxtaQtSpqFeuBR1HSl3D8ZE', 1545922451, NULL, NULL, '223.24.189.20', 1545922452, 1545922452, 0, 1579337641, NULL, NULL, NULL);
INSERT INTO `user` VALUES (7, 'damrong', 'damrong_con@hotmail.com', '$2y$12$CvQAyAs4qH13THcBpKk3d.EzXcZS.lZ2Pb6CQc5IpYGMXUj6eTGgq', 'Dq9pz-v5lKbLXf0hK7XrYn7wP_f8WHBu', 1546421720, NULL, NULL, '180.183.17.205', 1546421720, 1546421720, 0, 1546933073, NULL, NULL, NULL);
INSERT INTO `user` VALUES (2147483647, '2019012514430354101548402183', 'nuttaphon07@hotmail.com', '$2y$12$NpDEOCqleNAKWz6aitrMD.n2YPQVEUNHXls8bYG.a..bWdZVqjtlG', '9p36AFqhuLrHctR8PtIp_spCy97hsAB8', 1574154047, NULL, NULL, '183.88.159.181', 1548402183, 1595564444, 0, NULL, 10, NULL, '2020-07-24 11:20:44');
INSERT INTO `user` VALUES (2147483648, 'o9JPhbdswuvh', 'chanpan.nuttaphon@gmail.com', '$2y$13$WQr./m3mzlWnco5byC5fR.amlCtzptw2WaFLdsQvOayvctctWnfc.', 'H9bsVeDmAo8AXR2I00UST3lcuzfg11uB', 1588940925, NULL, NULL, '223.206.242.55', 1588940925, 1588943209, 3, NULL, NULL, '2020-05-08 19:28:45', '2020-05-08 20:06:49');
INSERT INTO `user` VALUES (2147483649, 'HFsYKld0rOt3', 'info.bellahanako@gmail.com', '$2y$13$fhwuGJR9FUaAfluKdMKGmulyExV1TWN6DB44gOe75HztmQw8n8B8C', '9TGYnUYpkbHx_nIIEFjtxRMVJi57mgKM', 1600237409, NULL, NULL, '184.22.226.136', 1600237409, 1600237409, 2, NULL, NULL, '2020-09-16 13:23:29', '2020-09-16 13:23:29');
INSERT INTO `user` VALUES (2147483650, 'yOqwzWbxaDdnXmrh', 'quibedssusi2009@gmail.com', '$2y$12$G0T9GcevL9NJw2cjrsgWqeqrIky68yoGdVBM3iY5P4BXuKW9XkbVO', '5Gkmk9egb5llYjMxOqT0Jjc2SPq2YRHe', 1602351745, NULL, NULL, '200.41.86.195', 1602351745, 1602351745, 0, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
