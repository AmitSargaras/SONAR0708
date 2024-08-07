drop procedure gen_mig_qc_report_2a@
drop procedure gen_mig_qc_report_3d@
drop procedure gen_mig_qc_report_3f@
drop procedure gen_mig_qc_report_3h@
drop procedure gen_mig_qc_report_4@
drop procedure gen_mig_qc_report_5@

----------------------------------------------
-- Create procedure generate 2a sql
----------------------------------------------
create procedure gen_mig_qc_report_2a(in v_interface varchar(20), in v_source varchar(20), in v_table varchar(20), in v_region varchar(50))
	language sql
begin
	declare v_sql varchar(500);
	declare v_stmt statement;

	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
			    '(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES ' ||
				' (''LoadCount'', ''QC Report 2a for Migration'', ''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
			    '(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''LoadCount'', ''Report for manual migration template: '||v_region||''', ''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;	
	
	set v_sql  = 'INSERT INTO MAN_MIG_QC_REPORT '||
				 '(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				 '(''LoadCount'', ''Report Date: '' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10)'', '||
				 ' ''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''LoadCount'', ''Total Number of Records'', ''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) '||
				'(SELECT ''LoadCount'', CHAR(COUNT(*)), ''MIG-'||v_source||''', '''||v_interface||''''||
				' FROM '||v_table||' WHERE SOURCE_ID = '''||v_source||''' AND REGION = '''||region||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
end
@

----------------------------------------------
-- Create procedure generate 3d sql
----------------------------------------------
create procedure gen_mig_qc_report_3d(in v_interface varchar(20), in v_source varchar(20), in v_table varchar(20), in v_region varchar(50))
	language sql
begin

	declare v_sql varchar(500);
	declare v_stmt statement;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrTech'', ''QC Report 3d for Migration'', ''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
			    '(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrTech'', ''Report for migration template: '||v_region||', ''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrTech'', ''Report Date: '' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), '||
				'''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrTech'', ''CIF / AA number / Facility ID / Security ID / ID / Key , Missing Mandatory data', ''||
				'''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) '||
				'(SELECT ''ErrTech'', '''' || COALESCE(KEY1_VALUE,''-'') || '','' || ERROR_MSG, '||
				'''MIG-'||v_source||''', '''||v_interface||''' FROM MIG_ERROR_LOG '||
				' WHERE SYSTEM_ID = ''MIG-'||v_source||''' AND INTERFACE_ID= '''||v_table||'''-'''||v_region||''' AND ERROR_CODE = ''QC3d'')';

	prepare v_stmt from v_sql;
	execute v_stmt;
end
@

----------------------------------------------
-- Create procedure generate 3f sql
----------------------------------------------
create procedure gen_mig_qc_report_3f(in v_interface varchar(20), in v_source varchar(20), in v_table varchar(20), in v_region varchar(50))
	language sql
begin

	declare v_sql varchar(500);
	declare v_stmt statement;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrLink'', ''QC Report 3f for Migration'', ''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
			    '(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrLink'', ''Report for migration template: '||v_region||', ''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrLink'', ''Report Date: '' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), '||
				'''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrLink'', ''CIF / AA number / Facility ID / Security ID / ID / Key , Missing Mandatory data', ''||
				'''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) '||
				'(SELECT ''ErrLink'', '''' || COALESCE(KEY1_VALUE,''-'') || '','' || ERROR_MSG, '||
				'''MIG-'||v_source||''', '''||v_interface||''' FROM MIG_ERROR_LOG '||
				' WHERE SYSTEM_ID = ''MIG-'||v_source||''' AND INTERFACE_ID= '''||v_table||'''-'''||v_region||''' AND ERROR_CODE = ''QC3f'')';

	prepare v_stmt from v_sql;
	execute v_stmt;
end
@

----------------------------------------------
-- Create procedure generate 3h sql
----------------------------------------------
create procedure gen_mig_qc_report_3h(in v_interface varchar(20), in v_source varchar(20), in v_table varchar(20), in v_region varchar(50))
	language sql
begin

	declare v_sql varchar(500);
	declare v_stmt statement;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrOthers'', ''QC Report 3h for Migration'', ''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
			    '(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrOthers'', ''Report for migration template: '||v_region||', ''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrOthers'', ''Report Date: '' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), '||
				'''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''ErrOthers'', ''CIF / AA number / Facility ID / Security ID / ID / Key , Missing Mandatory data', ''||
				'''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) '||
				'(SELECT ''ErrOthers'', '''' || COALESCE(KEY1_VALUE,''-'') || '','' || ERROR_MSG, '||
				'''MIG-'||v_source||''', '''||v_interface||''' FROM MIG_ERROR_LOG '||
				' WHERE SYSTEM_ID = ''MIG-'||v_source||''' AND INTERFACE_ID= '''||v_table||'''-'''||v_region||''' AND ERROR_CODE = ''QC3h'')';

	prepare v_stmt from v_sql;
	execute v_stmt;
end
@

----------------------------------------------
-- Create procedure generate 4 sql
----------------------------------------------
create procedure gen_mig_qc_report_4(in v_interface varchar(20), in v_source varchar(20), in v_table varchar(20), in v_region varchar(50))
	language sql
begin
	declare v_sql varchar(500);
	declare v_stmt statement;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '
				'(''IsValid'', ''QC Report 4 for Migration'', '''||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '
				'(''IsValid'', ''Report for migration template: '||v_region||', ''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;	
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''IsValid'', ''Report Date: '' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), '||
				'''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;	

	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''IsValid'', ''Total Number of Records'', ''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;					
				
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) '||
				'(SELECT ''IsValid'', CHAR(COUNT(*)), ''MIG-'||v_source||''', '''||v_interface||''''|| 
				' FROM '||v_table||' WHERE IS_VALID = ''Y'')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
end
@

----------------------------------------------
-- Create procedure generate 5 sql
----------------------------------------------
create procedure gen_mig_qc_report_5(in v_interface varchar(20), in v_source varchar(20), in v_table varchar(20), in v_region varchar(50))
	language sql
begin
	declare v_sql varchar(500);
	declare v_stmt statement;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '
				'(''Migrated'', ''QC Report 5 for Migration'', '''||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '
				'(''Migrated'', ''Report for migration template: '||v_region||', ''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;	
	
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT '||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''Migrated'', ''Report Date: '' || char(current date)  || chr(13) || chr(10) || chr(13) || chr(10), '||
				'''MIG-'||v_source||''', '''||v_interface||''')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;	

	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) VALUES '||
				'(''Migrated'', ''Total Number of Records'', ''MIG-'||v_source||''', '''||v_interface||''')';

	prepare v_stmt from v_sql;
	execute v_stmt;					
				
	set v_sql = 'INSERT INTO MAN_MIG_QC_REPORT ' ||
				'(RECORD_TYPE, TEXT, SYSTEM_ID, INTERFACE_ID) '||
				'(SELECT ''Migrated'', CHAR(COUNT(*)), ''MIG-'||v_source||''', '''||v_interface||''''|| 
				' FROM '||v_table||' WHERE IS_VALID = ''Y'')';
	
	prepare v_stmt from v_sql;
	execute v_stmt;
end
@