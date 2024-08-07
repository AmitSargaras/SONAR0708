----------------------------------------------
--- BUILDING_OCCUPATION_CODE PATCHES
----------------------------------------------
DELETE from common_code_category_entry where category_code = 'BO';

INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O01','OWNER OCCUPIED',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O02','RENT',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O03','LEASE',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';
INSERT INTO COMMON_CODE_CATEGORY_ENTRY (ENTRY_ID, ENTRY_CODE, ENTRY_NAME, CATEGORY_CODE_ID, CATEGORY_CODE, ACTIVE_STATUS, entry_source) select NEXT VALUE FOR COMMON_CODE_CATEGORY_ENTRY_SEQ,'O04','OTHERS',category_id, category_code, '1', '' from common_code_category where category_code = 'BO';


----------------------------------------------
--- SOURCE_CMS_SEC_TYPE_MAP CODE PATCHES
----------------------------------------------
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B50', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B50', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B50', 'PT706', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B50', 'PT707', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B50', 'PT708', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B50', 'PT709', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
 

-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B10', 'PT701', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B10', 'PT703', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B10', 'PT704', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B10', 'PT706', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B10', 'PT708', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B10', 'PT709', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
 

-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B41', 'PT700', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B41', 'PT701', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B41', 'PT703', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B41', 'PT706', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B41', 'PT708', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';
-- insert into common_code_category_entry (entry_id, entry_code, ref_entry_code, active_status, category_code, category_code_id) 
-- select next value for common_code_category_entry_seq, 'B41', 'PT709', '1', category_code, category_id from common_code_category where category_code = 'SOURCE_CMS_SEC_TYPE_MAP';