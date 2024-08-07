CREATE PROCEDURE SI_RUN_TEMP_WORKING_DAYS
   LANGUAGE SQL
   BEGIN
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_WORKING_DAYS', '', 1);
     commit;

    ------------------------------------
    -- Begin insert
    -- CMS_WORKING_DAYS
    --
    ------------------------------------
    insert into CMS_WORKING_DAYS
    (PROCESSING_DATE, BIZ_DAY_FLAG, BRANCH, STATUS, LAST_UPDATED_DATE)
    (select PROCESSING_DATE, BIZ_DAY_FLAG, BRANCH, STATUS, CURRENT_TIMESTAMP
    	FROM CMS_TEMP_WORKING_DAYS tmp
    	where not exists (select 1 from CMS_WORKING_DAYS act
    				where act.PROCESSING_DATE = tmp.PROCESSING_DATE
    				and act.BRANCH = tmp.BRANCH));
    commit;


    ------------------------------------
    -- Begin update 
    -- CMS_WORKING_DAYS
    --
    ------------------------------------
    UPDATE CMS_WORKING_DAYS act
    	set (BIZ_DAY_FLAG, STATUS, LAST_UPDATED_DATE) =
    	(select BIZ_DAY_FLAG, STATUS, CURRENT_TIMESTAMP
    		from CMS_TEMP_WORKING_DAYS temp
			where act.PROCESSING_DATE = temp.PROCESSING_DATE
    			and act.BRANCH = temp.BRANCH
			fetch first 1 row only)
    WHERE EXISTS (select 1 from CMS_TEMP_WORKING_DAYS tmp
			where act.PROCESSING_DATE = tmp.PROCESSING_DATE
			and act.BRANCH = tmp.BRANCH
			and act.BIZ_DAY_FLAG <> tmp.BIZ_DAY_FLAG);
    commit;


    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_WORKING_DAYS', '', 0);
    commit;

END@


CREATE PROCEDURE SI_RUN_TEMP_PUBLIC_HOLIDAY
   LANGUAGE SQL
   BEGIN
     CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_PUBLIC_HOLIDAY', '', 1);
     commit;

    ------------------------------------
    -- Begin insert
    -- CMS_PUBLIC_HOLIDAY
    --
    ------------------------------------
    insert into CMS_PUBLIC_HOLIDAY
    (HOLIDAY_DATE, COUNTRY_ISO_CODE, STATE_CODE, DESCRIPTION, STATUS, LAST_UPDATED_DATE)
    (select HOLIDAY_DATE, COUNTRY_ISO_CODE, STATE_CODE, DESCRIPTION, STATUS, CURRENT_TIMESTAMP
    	FROM CMS_TEMP_PUBLIC_HOLIDAY tmp
    	where not exists (select 1 from CMS_PUBLIC_HOLIDAY act
    				where act.HOLIDAY_DATE = tmp.HOLIDAY_DATE
    				and act.COUNTRY_ISO_CODE = tmp.COUNTRY_ISO_CODE
    				and act.STATE_CODE = tmp.STATE_CODE));
    commit;


    ------------------------------------
    -- Begin update
    -- CMS_PUBLIC_HOLIDAY
    --
    ------------------------------------
    UPDATE CMS_PUBLIC_HOLIDAY act
    	set (DESCRIPTION, STATUS, LAST_UPDATED_DATE) =
    	(select DESCRIPTION, STATUS, CURRENT_TIMESTAMP
    		from CMS_TEMP_PUBLIC_HOLIDAY temp
			where act.HOLIDAY_DATE = temp.HOLIDAY_DATE
			and act.COUNTRY_ISO_CODE = temp.COUNTRY_ISO_CODE
    			and act.STATE_CODE = temp.STATE_CODE
			fetch first 1 row only)
    WHERE EXISTS (select 1 from CMS_TEMP_PUBLIC_HOLIDAY tmp
			where act.HOLIDAY_DATE = tmp.HOLIDAY_DATE
			and act.COUNTRY_ISO_CODE = tmp.COUNTRY_ISO_CODE
    			and act.STATE_CODE = tmp.STATE_CODE);
    commit;


    CALL "SI_LOG_PROC_TIME"('SI_RUN_TEMP_PUBLIC_HOLIDAY', '', 0);
    commit;

END@