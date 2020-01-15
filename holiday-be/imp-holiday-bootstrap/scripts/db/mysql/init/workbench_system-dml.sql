INSERT ignore INTO `sys_application` (`application_id`, `create_time`, `creator`, `modified_time`, `modifier`, `tenant_id`, `ts`, `application_code`, `application_icon`, `application_name`, `enable`, `application_desc`, `client_status`, `phone_status`, `simple_status`, `web_status`, `orders`, `short_cut`, `eternal`, `multi_title_ext`, `multi_title_ext0`, `multi_title_ext1`, `multi_title_ext2`, `multi_title_ext3`, `multi_title_ext4`, `multi_title_ext5`, `application_Name_Ext2`, `application_Name_Ext3`, `application_Name_Ext4`, `application_Name_Ext5`, `label_type`, `label_domain`, `base_app`, `application_name_ext6`, `application_name_ext0`, `application_name_ext1`) VALUES (uuid(), NULL, NULL, '2019-10-23 04:47:20', NULL, NULL, NULL, 'holiday', '', 'holiday', b'1', '', b'0', b'0', b'0', b'1', '4', b'0', b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'SYSBMD', 'imp', b'0', '', NULL, NULL);

INSERT ignore INTO `sys_standard_relation` (`standard_relation_id`, `create_time`, `modified_time`, `modifier`, `relation_code`, `relation_type`, `standard_code`, `ts`, `creator`, `lease`, `copy_flag`) VALUES (uuid(), '2019-10-23 04:06:17', NULL, NULL, 'holiday', 'application', '050061', NULL, '毛坤', NULL, '0');
INSERT ignore INTO `sys_call_url` (
	`call_url_id`,
	`service_type`,
	`service_code`,
	`url`,
	`ts`,
	`creator`,
	`email`,
	`source`,
	`rate_limit`
)
VALUES
	(
		uuid(),
		'application',
		'holiday',
		'$WORKBENCH_HOST/../holiday-be/mddtenantinit/initdata',
		'2019-08-08 06:36:17.076',
		'测试人员',
		'test@yonyou.com',
		0,
		0
	);