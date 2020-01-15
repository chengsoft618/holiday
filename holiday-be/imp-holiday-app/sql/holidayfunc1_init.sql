    
/*编码规则*/ 
delete from aa_billnumber where cbillnum = 'c0498b41-77f3-418b-ac9e-c7b26ed365d6'; 
INSERT INTO aa_billnumber (
 tenant_id,
 orgId,
 cbillnum,
 cbillname,
 csubid,
 ballowhandwork,
 brepeatredo,
 istartnumber,
 iseriallen,
 billnumLen,
 billnumInit,
 billnumTruncatType,
 billnumFillType,
 billnumFillMark,
 billnumMode,
 billnumRule,
 isReuse,
 sysid,
 datatype,
 rulecode,
 rulename,
 dr,
 pubts,
 yhtTenantId,
 sntype
)
VALUES
 (
  NULL,
  - 1,
  'c0498b41-77f3-418b-ac9e-c7b26ed365d6',
  '默认',
  NULL,
  0,
  1,
  1,
  8,
  8,
  1,
  0,
  1,
  '0',
  1,
  1,
  0,
  'diwork',
  1,
  'c0498b41-77f3-418b-ac9e-c7b26ed365d6',
  NULL,
  0,
  NOW(),
  '0',
  0
 ); 
INSERT INTO aa_billnumber (
 tenant_id,
 orgId,
 cbillnum,
 cbillname,
 csubid,
 ballowhandwork,
 brepeatredo,
 istartnumber,
 iseriallen,
 billnumLen,
 billnumInit,
 billnumTruncatType,
 billnumFillType,
 billnumFillMark,
 billnumMode,
 billnumRule,
 isReuse,
 sysid,
 datatype,
 rulecode,
 rulename,
 dr,
 pubts,
 yhtTenantId,
 sntype
)
VALUES
 (
  NULL,
  - 1,
  'c0498b41-77f3-418b-ac9e-c7b26ed365d6',
  '默认',
  NULL,
  0,
  1,
  1,
  8,
  8,
  1,
  0,
  1,
  '0',
  1,
  1,
  0,
  'diwork',
  1,
  'c0498b41-77f3-418b-ac9e-c7b26ed365d6',
  NULL,
  0,
  NOW(),
  'p42gpn5q',
  0
 ); 
delete from aa_billnumber where cbillnum = 'ad950725-9d4d-4935-998a-a4285c2a3018'; 
INSERT INTO aa_billnumber (
 tenant_id,
 orgId,
 cbillnum,
 cbillname,
 csubid,
 ballowhandwork,
 brepeatredo,
 istartnumber,
 iseriallen,
 billnumLen,
 billnumInit,
 billnumTruncatType,
 billnumFillType,
 billnumFillMark,
 billnumMode,
 billnumRule,
 isReuse,
 sysid,
 datatype,
 rulecode,
 rulename,
 dr,
 pubts,
 yhtTenantId,
 sntype
)
VALUES
 (
  NULL,
  - 1,
  'ad950725-9d4d-4935-998a-a4285c2a3018',
  '默认',
  NULL,
  0,
  1,
  1,
  8,
  8,
  1,
  0,
  1,
  '0',
  1,
  1,
  0,
  'diwork',
  1,
  'ad950725-9d4d-4935-998a-a4285c2a3018',
  NULL,
  0,
  NOW(),
  '0',
  0
 ); 
INSERT INTO aa_billnumber (
 tenant_id,
 orgId,
 cbillnum,
 cbillname,
 csubid,
 ballowhandwork,
 brepeatredo,
 istartnumber,
 iseriallen,
 billnumLen,
 billnumInit,
 billnumTruncatType,
 billnumFillType,
 billnumFillMark,
 billnumMode,
 billnumRule,
 isReuse,
 sysid,
 datatype,
 rulecode,
 rulename,
 dr,
 pubts,
 yhtTenantId,
 sntype
)
VALUES
 (
  NULL,
  - 1,
  'ad950725-9d4d-4935-998a-a4285c2a3018',
  '默认',
  NULL,
  0,
  1,
  1,
  8,
  8,
  1,
  0,
  1,
  '0',
  1,
  1,
  0,
  'diwork',
  1,
  'ad950725-9d4d-4935-998a-a4285c2a3018',
  NULL,
  0,
  NOW(),
  'p42gpn5q',
  0
 ); 

/*规则*/ 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024979,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'add', 'mddAddRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024980,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'delete', 'mddReferenceCheckRule', 20.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024981,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'delete', 'mddDeleteRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024982,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'detail', 'mddDetailRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024983,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'query', 'mddQueryRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024984,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'querytree', 'mddQueryTreeRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024985,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'refer', 'mddReferDataRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024986,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'printnow', 'mddPrintRule', 30.0, NULL, '0', NULL, 0, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024987,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'submit', 'mddSubmitRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024988,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'unsubmit', 'mddUnSubmitRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024989,'c0498b41-77f3-418b-ac9e-c7b26ed365d6', 'audit', 'mddAuditInfoBillRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024990,'ad950725-9d4d-4935-998a-a4285c2a3018', 'check', 'mddCheckUniqueRule', -1.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024991,'ad950725-9d4d-4935-998a-a4285c2a3018', 'delete', 'mddDeleteRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024992,'ad950725-9d4d-4935-998a-a4285c2a3018', 'detail', 'mddDetailRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024993,'ad950725-9d4d-4935-998a-a4285c2a3018', 'refer', 'mddReferDataRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024994,'ad950725-9d4d-4935-998a-a4285c2a3018', 'save', 'mddSaveRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024995,'ad950725-9d4d-4935-998a-a4285c2a3018', 'save', 'mddRefreshTsRule', 40.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024996,'ad950725-9d4d-4935-998a-a4285c2a3018', 'save', 'mddFillPKRule', 20.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024997,'ad950725-9d4d-4935-998a-a4285c2a3018', 'movefirst', 'mddMoveFirstRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024998,'ad950725-9d4d-4935-998a-a4285c2a3018', 'movelast', 'mddMoveLastRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2024999,'ad950725-9d4d-4935-998a-a4285c2a3018', 'movenext', 'mddMoveNextRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025000,'ad950725-9d4d-4935-998a-a4285c2a3018', 'moveprev', 'mddMovePrevRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025001,'ad950725-9d4d-4935-998a-a4285c2a3018', 'movefirst', 'mddDetailRule', 40.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025002,'ad950725-9d4d-4935-998a-a4285c2a3018', 'movelast', 'mddDetailRule', 40.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025003,'ad950725-9d4d-4935-998a-a4285c2a3018', 'movenext', 'mddDetailRule', 40.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025004,'ad950725-9d4d-4935-998a-a4285c2a3018', 'moveprev', 'mddDetailRule', 40.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025005,'ad950725-9d4d-4935-998a-a4285c2a3018', 'save', 'mddUpdateBillCodeRule', 10.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025006,'ad950725-9d4d-4935-998a-a4285c2a3018', 'save', 'mddSetupBillRule', 10.0, '', '0', '', 1, '', 0, 0, ''); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025007,'ad950725-9d4d-4935-998a-a4285c2a3018', 'save', 'mddAuditInfoBillRule', 5.0, '', '0', '', 1, '', 0, 0, ''); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025008,'ad950725-9d4d-4935-998a-a4285c2a3018', 'save', 'mddSaveBusinessLogRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025009,'ad950725-9d4d-4935-998a-a4285c2a3018', 'submit', 'mddSubmitRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025010,'ad950725-9d4d-4935-998a-a4285c2a3018', 'unsubmit', 'mddUnSubmitRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 
insert into billruleregister (id,billnum,action,ruleId,iorder,overrule,tenant_id,`key`,isSystem,url,isSync,isAsyn,config) values (2025011,'ad950725-9d4d-4935-998a-a4285c2a3018', 'audit', 'mddAuditInfoBillRule', 30.0, NULL, '0', NULL, 1, NULL, 0, 0, NULL); 

    
/*枚举*/ 

