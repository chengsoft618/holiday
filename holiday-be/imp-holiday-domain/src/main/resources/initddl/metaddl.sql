####################
--	组件1
####################
-- ----------------------------
-- Table structure for imp_plm_test_holiday
-- ----------------------------
CREATE TABLE  IF NOT EXISTS `imp_plm_test_holiday` (
	`returncount` smallint NOT NULL COMMENT '退回次数',
	`verifystate` smallint NOT NULL COMMENT '审批状态',
	`leavetype` varchar(256) NOT NULL COMMENT '请假类型',
	`leavestarttime` varchar(256) NOT NULL COMMENT '请假开始时间',
	`leavedays` decimal(16,2) NOT NULL COMMENT '请假天数',
	`creator` varchar(60) NOT NULL COMMENT '创建人',
	`code` varchar(256) COMMENT '编码',
	`org` varchar(36) NOT NULL COMMENT '主组织',
	`isWfControlled` bit NOT NULL DEFAULT 0 COMMENT '是否审批流控制',
	`modifier` varchar(60) NOT NULL COMMENT '修改人',
	`leavestartdate` varchar(256) NOT NULL COMMENT '请假开始日期',
	`leavehours` decimal(16,2) NOT NULL COMMENT '请假小时数',
	`certiflag` varchar(256) COMMENT '是否取得证明',
	`leaveenddate` varchar(256) COMMENT '请假结束日期',
	`bustype` varchar(36) COMMENT '交易类型',
	`leaveendtime` varchar(256) COMMENT '请假结束时间',
	`modifiedtime` datetime NOT NULL COMMENT '修改时间',
	`billnumber` varchar(256) COMMENT '单据类型',
	`name` varchar(256) COMMENT '名称',
	`files` varchar(256) COMMENT '附件',
	`creationtime` datetime NOT NULL COMMENT '创建时间',
	`id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`pubts` timestamp NOT NULL COMMENT '时间戳' NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`desc` varchar(256) COMMENT '描述',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 row_format=DYNAMIC;
