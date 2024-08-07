Day 0 migration for LOA Master:

Procedure name : pro_loa_master_emp_grade

Step 1: Run following sql query to clear LOA Master data:

	delete from DAY_ZERO_MIG_EMP_GRADE_LOA;
	delete from cms_loa_master;
	delete from cms_stage_loa_master;
	commit;

Step 2: Once data is filled by the user in the LOA_Master.csv file, import the updated csv into the DAY_ZERO_MIG_EMP_GRADE_LOA table,
	(Note: if RANKING_OF_SEQUENCE column available in LOA_Master.csv then delete this column and save csv file then import data)

Step 3: Run procedure pro_loa_master_emp_grade

Step 4: Check "STATUS" column in DAY_ZERO_MIG_EMP_GRADE_LOA table:
		STATUS : P-Pending, S-Success, F-Fail
		If Status is 'P' then given row in pending status means no procedure runs on it yet. Day0  migration not done yet for a given row.
		If Status is 'S' then Day0 migration for a given row is successful.
		If Status is 'F' then Day0 migration for a given row is failed.
	** Please check status for every row in a DAY_ZERO_MIG_EMP_GRADE_LOA table.
	** Please check REASON_FOR_FAIL column for every row in a DAY_ZERO_MIG_EMP_GRADE_LOA table.

Step 5: Repeat cycle for new data.
