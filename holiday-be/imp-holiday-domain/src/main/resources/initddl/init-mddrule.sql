SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for billruleregister
-- ----------------------------
CREATE TABLE IF NOT EXISTS `billruleregister`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `billnum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ruleId` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iorder` float(10, 2) NULL DEFAULT NULL,
  `overrule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tenant_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isSystem` bit(1) NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isSync` tinyint(1) NOT NULL DEFAULT 0,
  `isAsyn` tinyint(1) NOT NULL DEFAULT 0,
  `config` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_billruleregister_tenantid`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1397063 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

DELETE FROM billruleregister;
INSERT INTO `billruleregister`( `billnum`, `action`, `ruleId`, `iorder`, `overrule`, `tenant_id`, `key`, `isSystem`, `url`, `isSync`, `isAsyn`, `config`) VALUES ('common', 'uimeta', 'uimetaLoadRule', 30.00, NULL, '0', NULL, b'1', NULL, 0, 0, NULL);


-- ----------------------------
-- Table structure for rulelog
-- ----------------------------
CREATE TABLE IF NOT EXISTS `rulelog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ruleid` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billnum` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ruleaction` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iorder` float(10, 2) NULL DEFAULT NULL,
  `tenant_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `issuccess` int(5) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;


-- Dumping structure for table coding_cloud_mdf.gen_ten_ext_code
CREATE TABLE IF NOT EXISTS `gen_ten_ext_code` (
  `id` varchar(64) NOT NULL,
  `fileName` varchar(300) DEFAULT NULL,
  `fileContent` text,
  `tenantId` varchar(64) DEFAULT NULL,
  `billNo` varchar(100) DEFAULT NULL,
  `domain` varchar(64) DEFAULT NULL,
  `isEffect` int(2) DEFAULT '0' COMMENT '0：不生效 1：生效',
  `creater` varchar(255) DEFAULT NULL,
  `last_modified` varchar(255) DEFAULT NULL COMMENT '修改时间',
  `last_modify_user` varchar(64) DEFAULT NULL COMMENT '修改人',
  `last_modify_user_name` varchar(64) DEFAULT NULL COMMENT '修改人名称',
  `create_time` varchar(28) DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_user_name` varchar(64) DEFAULT NULL COMMENT '创建人名称',
  `dr` int(2) DEFAULT '0' COMMENT '删除标识',
  `ts` varchar(255) DEFAULT NULL COMMENT '日期',
  `tenant_Id` varchar(64) DEFAULT NULL,
  `source_flag` int(2) DEFAULT '1' COMMENT '脚本来源： 1：前端 2：后端',
  `fk_fun` varchar(64) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

