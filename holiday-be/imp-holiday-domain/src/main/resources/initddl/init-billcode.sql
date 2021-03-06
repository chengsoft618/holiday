
--
-- Create table `aa_billreturn`
--
CREATE TABLE IF NOT EXISTS aa_billreturn (
  autoid INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  tenant_id BIGINT(20) DEFAULT 0 COMMENT '租户',
  orgId INT(11) NOT NULL DEFAULT -1 COMMENT '组织',
  cbillnum VARCHAR(100) DEFAULT NULL COMMENT '表单编码',
  ownerorg BIGINT(20) DEFAULT NULL COMMENT '所属组织',
  cglide VARCHAR(250) DEFAULT NULL COMMENT '前缀名称',
  cgliderule VARCHAR(250) DEFAULT NULL COMMENT '取值规则',
  cseed VARCHAR(250) NOT NULL COMMENT '编号前缀',
  inumber INT(11) NOT NULL COMMENT '流水号',
  totalBasis VARCHAR(500) NOT NULL COMMENT '总依据(依据1|依据2|依据3|...)',
  billnumberid INT(11) NOT NULL COMMENT '规则id（外键）',
  dr TINYINT(1) DEFAULT NULL COMMENT '删除标记',
  pubts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  yhtTenantId VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (autoid)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = '退号表',
ROW_FORMAT = COMPACT;

--
-- Create table `aa_billprefix`
--
CREATE TABLE IF NOT EXISTS `aa_billprefix` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT '0' COMMENT '租户',
  `orgId` int(11) NOT NULL DEFAULT '-1' COMMENT '组织',
  `cprefix` varchar(50) NOT NULL COMMENT '编码段名称：如门店代码，手工输入等',
  `iprefixlen` int(11) NOT NULL COMMENT '长度',
  `cprefixrule` varchar(50) DEFAULT NULL COMMENT '取值规则(例如yyyymmdd)',
  `cprefixseed` varchar(50) DEFAULT NULL COMMENT '依据参数：如y，ym，ymd',
  `iorder` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `bfix` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否依据',
  `cprefixid` varchar(50) DEFAULT NULL COMMENT '关联前缀预设的id',
  `cprefixtype` int(11) NOT NULL DEFAULT '1' COMMENT '前缀类型 0(字符字段)、1（日期字段）、2（常量）、3(系统时间)，4（单据参照属性），5 随机码',
  `cprefixsep` varchar(10) DEFAULT NULL COMMENT '分隔符',
  `cfieldname` varchar(50) DEFAULT NULL COMMENT '取值字段',
  `csourcename` varchar(50) DEFAULT NULL,
  `ipurpose` tinyint(4) DEFAULT NULL,
  `fillstyle` tinyint(4) DEFAULT NULL COMMENT '补位方式（0-不补位，1-左补位，2-右补位）',
  `fillsign` varchar(4) DEFAULT NULL COMMENT '补位符（最长4位）  ',
  `billnumberid` int(11) DEFAULT NULL COMMENT '规则id',
  `dr` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  `pubts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  `cbillnum` varchar(100) DEFAULT NULL,
  `yhtTenantId` varchar(20) DEFAULT NULL,
  `formula` varchar(500) DEFAULT NULL COMMENT '公式',
  `formuladisplay` varchar(500) DEFAULT NULL COMMENT '公式显示',
  PRIMARY KEY (`autoid`),
  KEY `ix_aa_billprefix_cbillnum_cprefix` (`cbillnum`,`cprefix`,`orgId`)
) ENGINE=InnoDB AUTO_INCREMENT=24663 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=334 ROW_FORMAT=COMPACT COMMENT='编码规则子表';

--
-- Create table `aa_billprefabricate`
--
CREATE TABLE IF NOT EXISTS `aa_billprefabricate` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT,
  `cbillnum` varchar(100) NOT NULL COMMENT '表单编码',
  `cprefix` varchar(50) NOT NULL COMMENT '前缀名字',
  `cprefixid` varchar(50) NOT NULL COMMENT '唯一uid',
  `cprefixtype` int(11) NOT NULL COMMENT '前缀类型 0=字符串 1=date 2=文本',
  `iprefixtype` tinyint(4) DEFAULT NULL,
  `ipurpose` tinyint(4) DEFAULT NULL,
  `csourcename` varchar(50) DEFAULT NULL,
  `cfieldname` varchar(50) DEFAULT NULL COMMENT '取值字段',
  `carchname` varchar(50) DEFAULT NULL,
  `carchfieldname` varchar(50) DEFAULT NULL,
  `carchclsfieldname` varchar(50) DEFAULT NULL,
  `ckeyword` varchar(50) DEFAULT NULL,
  `ckeywordnamefield` varchar(50) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `yhtTenantId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`autoid`),
  KEY `ix_aa_billprefabricate_cbillnum_cprefix` (`cbillnum`,`cprefix`)
) ENGINE=InnoDB AUTO_INCREMENT=17667 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=4096 ROW_FORMAT=COMPACT COMMENT='预置表单';

--
-- Create table `aa_billprecode`
--
CREATE TABLE IF NOT EXISTS aa_billprecode (
  autoid INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  tenant_id BIGINT(20) DEFAULT 0 COMMENT '租户',
  orgId INT(11) NOT NULL DEFAULT -1 COMMENT '组织',
  cbillnum VARCHAR(100) DEFAULT NULL COMMENT '表单编码',
  ownerorg BIGINT(20) DEFAULT NULL COMMENT '所属组织',
  cglide VARCHAR(250) DEFAULT NULL COMMENT '前缀名称',
  cgliderule VARCHAR(250) DEFAULT NULL COMMENT '取值规则',
  cseed VARCHAR(250) NOT NULL COMMENT '编号前缀',
  inumber INT(11) NOT NULL COMMENT '流水号',
  totalBasis VARCHAR(500) NOT NULL COMMENT '总依据(依据1|依据2|依据3|...)',
  billnumberid INT(11) NOT NULL COMMENT '规则id（外键）',
  billcode VARCHAR(250) DEFAULT NULL COMMENT '编码号',
  dr TINYINT(1) DEFAULT NULL COMMENT '删除标记',
  pubts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  yhtTenantId VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (autoid)
)
ENGINE = INNODB,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_general_ci,
COMMENT = '预取表',
ROW_FORMAT = COMPACT;

--
-- Create table `aa_billnumber`
--
CREATE TABLE IF NOT EXISTS `aa_billnumber` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT '0' COMMENT '租户',
  `orgId` int(11) NOT NULL DEFAULT '-1' COMMENT '组织',
  `cbillnum` varchar(100) NOT NULL COMMENT '作为规则编码，表单模式下是表单编码，元数据模式下是元数据ID，自定义实体模式下是自定义实体主键ID',
  `cbillname` varchar(50) NOT NULL COMMENT '表单名称',
  `csubid` varchar(20) DEFAULT NULL,
  `ballowhandwork` tinyint(4) NOT NULL COMMENT '允许手动编码',
  `brepeatredo` tinyint(4) NOT NULL COMMENT '允许手工可改',
  `istartnumber` int(11) NOT NULL COMMENT '流水号初始值',
  `iseriallen` tinyint(4) NOT NULL COMMENT '流水号长度',
  `billnumLen` int(11) NOT NULL DEFAULT '8' COMMENT '流水号长度',
  `billnumInit` int(11) NOT NULL DEFAULT '1' COMMENT '流水号初始值',
  `billnumTruncatType` int(11) NOT NULL DEFAULT '0' COMMENT '截断类型0 = 左截断 1 = 右截断',
  `billnumFillType` int(11) NOT NULL DEFAULT '0' COMMENT '补位类型0=不补位 1=左补位 2=右补位',
  `billnumFillMark` varchar(20) NOT NULL DEFAULT '0' COMMENT '补位符',
  `billnumMode` int(11) NOT NULL DEFAULT '0' COMMENT '0=手工编号 1=自动编号 2=自动编号 手工可改',
  `billnumRule` int(11) NOT NULL DEFAULT '0' COMMENT '使用规则 0 企业默认 1 自定义规则',
  `isReuse` tinyint(1) DEFAULT '0' COMMENT '是否开启退号补号',
  `sysid` varchar(40) NOT NULL COMMENT '系统ID',
  `datatype` tinyint(4) NOT NULL DEFAULT '2' COMMENT '编码实体类型，1：表单，2：元数据，3：自定义实体',
  `rulecode` varchar(100) NOT NULL COMMENT '规则编码',
  `rulename` varchar(255) DEFAULT NULL COMMENT '规则名称',
  `dr` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `pubts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  `yhtTenantId` varchar(20) DEFAULT NULL,
  `sntype` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`autoid`),
  UNIQUE KEY `ix_aa_billnumber_cbillnum_orgid` (`cbillnum`,`orgId`,`yhtTenantId`),
  KEY `ix_aa_billnumber_cbillnum` (`cbillnum`),
  KEY `ix_aa_billnumber_rulecode` (`rulecode`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=496 ROW_FORMAT=COMPACT COMMENT='编码规则-主表';

--
-- Create table `aa_billhistory`
--
CREATE TABLE IF NOT EXISTS `aa_billhistory` (
  `autoid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT '0' COMMENT '租户',
  `orgId` int(11) NOT NULL DEFAULT '-1' COMMENT '组织',
  `cbillnum` varchar(100) NOT NULL COMMENT '表单编码',
  `ownerorg` bigint(20) DEFAULT NULL COMMENT '所属组织',
  `cglide` varchar(100) DEFAULT NULL COMMENT '前缀名称',
  `cgliderule` varchar(100) DEFAULT NULL COMMENT '取值规则',
  `cseed` varchar(100) NOT NULL COMMENT '编号前缀',
  `inumber` int(11) NOT NULL COMMENT '流水号',
  `totalBasis` varchar(100) NOT NULL COMMENT '总依据(依据1|依据2|依据3|...)',
  `billnumberid` int(11) NOT NULL COMMENT '规则id（外键）',
  `dr` tinyint(1) DEFAULT NULL COMMENT '删除标记',
  `pubts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  `yhtTenantId` varchar(20) DEFAULT NULL COMMENT '友户通租户Id',
  PRIMARY KEY (`autoid`),
  KEY `cbillnum` (`tenant_id`,`cbillnum`,`cseed`),
  KEY `ix_aa_billhistory_cbillnum_cglide` (`cbillnum`,`cglide`)
) ENGINE=InnoDB AUTO_INCREMENT=5580 DEFAULT CHARSET=utf8mb4 AVG_ROW_LENGTH=606 ROW_FORMAT=COMPACT COMMENT='流水号';

--
-- Create table `aa_billcode_obj`
--
CREATE TABLE IF NOT EXISTS aa_billcode_obj (
  pk_billobj VARCHAR(40) NOT NULL,
  code VARCHAR(40) DEFAULT NULL,
  name VARCHAR(40) DEFAULT NULL,
  name2 VARCHAR(40) DEFAULT NULL,
  name3 VARCHAR(40) DEFAULT NULL,
  name4 VARCHAR(40) DEFAULT NULL,
  name5 VARCHAR(40) DEFAULT NULL,
  name6 VARCHAR(40) DEFAULT NULL,
  name_ext VARCHAR(40) DEFAULT NULL,
  createdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  tenantid VARCHAR(64) DEFAULT NULL COMMENT '租户id，当租户值为''system''时，表示该实体为系统级',
  sysid VARCHAR(64) DEFAULT NULL,
  classify_code VARCHAR(64) DEFAULT NULL COMMENT '该编码实体所属的二级分类树code',
  service_code VARCHAR(64) DEFAULT NULL COMMENT '关联diwork的原子服务code',
  PRIMARY KEY (pk_billobj)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 103,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create table `aa_billcode_mappingchild`
--
CREATE TABLE IF NOT EXISTS aa_billcode_mappingchild (
  autoid INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  pk_map_id INT(11) DEFAULT NULL COMMENT '映射主表主键值',
  pk_ref VARCHAR(200) DEFAULT NULL COMMENT '属性值（参照属性主键值）',
  map_val VARCHAR(200) DEFAULT NULL COMMENT '编码',
  ref_code VARCHAR(255) DEFAULT NULL,
  ref_name VARCHAR(255) DEFAULT NULL,
  pubts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  ref_code_display VARCHAR(200) DEFAULT NULL,
  tenantid VARCHAR(200) DEFAULT NULL,
  sysid VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (autoid)
)
ENGINE = INNODB,
AUTO_INCREMENT = 132,
AVG_ROW_LENGTH = 252,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create table `aa_billcode_mapping`
--
CREATE TABLE IF NOT EXISTS aa_billcode_mapping (
  autoid INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  name VARCHAR(200) DEFAULT NULL COMMENT '名称',
  domain VARCHAR(200) NOT NULL COMMENT '应用编码',
  ref_code VARCHAR(200) NOT NULL COMMENT '参照编码',
  md_en_id VARCHAR(200) NOT NULL COMMENT '元数据实体ID',
  map_length INT(11) NOT NULL COMMENT '映射值长度',
  fill_style TINYINT(1) NOT NULL DEFAULT 0 COMMENT '补位方式，0不补位 1左补位 2右补位',
  fill_char VARCHAR(1) DEFAULT NULL COMMENT '补位符号',
  map_prop_type TINYINT(1) NOT NULL DEFAULT 0 COMMENT '映射的值是mappingchild中的pk，code还是name，pk为0 code为1  name为2',
  pubts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  tenantid VARCHAR(255) NOT NULL,
  sysid VARCHAR(255) DEFAULT NULL,
  default_map_value VARCHAR(255) DEFAULT NULL COMMENT '默认映射值',
  label VARCHAR(255) DEFAULT NULL COMMENT '标签 (为了处理组织类的元数据通过标签来匹配)',
  PRIMARY KEY (autoid)
)
ENGINE = INNODB,
AUTO_INCREMENT = 20,
AVG_ROW_LENGTH = 1820,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = '编码映射主表';

--
-- Create table `aa_billcode_candidateprop`
--
CREATE TABLE IF NOT EXISTS aa_billcode_candidateprop (
  autoid INT(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  pk_bcr_obj VARCHAR(200) DEFAULT NULL COMMENT '编码对象主键',
  en_prop_name VARCHAR(200) DEFAULT NULL COMMENT '实体属性名',
  display_name VARCHAR(200) DEFAULT NULL COMMENT '显示名称',
  elem_type VARCHAR(200) DEFAULT NULL COMMENT '类型（时间，字符，参照）',
  mapping_entity VARCHAR(200) DEFAULT NULL COMMENT '所属编码映射实体',
  pubts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (autoid)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1260,
CHARACTER SET utf8,
COLLATE utf8_general_ci,
COMMENT = '候选属性表',
ROW_FORMAT = COMPACT;
