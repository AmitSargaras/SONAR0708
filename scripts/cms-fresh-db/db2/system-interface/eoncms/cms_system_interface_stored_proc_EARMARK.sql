--SET CURRENT PATH = SYSIBM,SYSFUN,SYSPROC,SYSIBMADM, EONCMS_LOCAL@
-- DROP PROCEDURE SI_RUN_TEMP_EARMARK_SH001@

CREATE PROCEDURE SI_RUN_TEMP_EARMARK_SH001
		LANGUAGE SQL
	BEGIN
	 CALL si_log_proc_time('SI_RUN_TEMP_EARMARK_SH001', 'MIMB', 1);--
	 
	UPDATE CMS_EARMARK_GROUP ear SET ear.STATUS = 'DELETED'
	WHERE NOT EXISTS (SELECT 1 FROM CMS_PRICE_FEED feed
						WHERE feed.FEED_ID = ear.FEED_ID);--
						
	commit;--

	UPDATE CMS_EARMARK_GROUP ear SET (TOTAL_NO_OF_UNITS, STATUS) =
		(SELECT sum(NO_OF_UNITS), 'ACTIVE' 
			FROM CMS_SECURITY sec, CMS_PORTFOLIO_ITEM port
            WHERE sec.CMS_COLLATERAL_ID = port.CMS_COLLATERAL_ID
			AND sec.security_sub_type_id like 'MS%'
			and sec.status = 'ACTIVE'
			AND port.status = 'ACTIVE'
			and port.type = 'S'
            AND exists (select 1 
            				from CMS_PRICE_FEED feed, CMS_FEED_GROUP grp
                            where feed.FEED_ID = ear.FEED_ID
							and feed.FEED_GROUP_ID = grp.FEED_GROUP_ID
							and grp.GROUP_TYPE = 'STOCK'
							and feed.ticker = port.stock_code)
			and ear.SOURCE_SYSTEM_ID = port.source_id)
	WHERE status <> 'DELETED';--
								
	commit;--
				
	INSERT INTO CMS_EARMARK_GROUP (
		EARMARK_GROUP_ID,
		FEED_ID,
		SOURCE_SYSTEM_ID,
		TOTAL_NO_OF_UNITS,
		COUNTER_CODE,
		STATUS)
		(SELECT CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_EARMARK_GROUP_SEQ), 2)) as BIGINT),
			feed.FEED_ID,
			port.SOURCE_ID,
			sum(NO_OF_UNITS),
			port.STOCK_CODE,
			'ACTIVE'
			FROM CMS_SECURITY sec, CMS_PORTFOLIO_ITEM port, CMS_PRICE_FEED feed, CMS_FEED_GROUP grp
			WHERE sec.CMS_COLLATERAL_ID = port.CMS_COLLATERAL_ID
			AND port.STOCK_CODE = feed.ticker
			AND port.type = 'S'
			AND sec.security_sub_type_id like 'MS%'
            AND feed.FEED_GROUP_ID = grp.FEED_GROUP_ID
            AND grp.GROUP_TYPE = 'STOCK'
            and sec.status = 'ACTIVE'
            AND port.status = 'ACTIVE'
			AND NOT EXISTS (select 1 from CMS_EARMARK_GROUP 
							where feed.FEED_ID = FEED_ID 
							and source_system_id = port.source_id fetch first row only)
		group by feed_id, port.stock_code, port.source_id);--
	 
	 CALL si_log_proc_time('SI_RUN_TEMP_EARMARK_SH001', 'MIMB', 0);--
END@


commit work@