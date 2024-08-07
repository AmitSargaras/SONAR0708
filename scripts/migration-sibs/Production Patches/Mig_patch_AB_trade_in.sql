/* Patch Trade In information which had been miss out during migration  and was required for STP */

-- 6289
select count(*) from CMS_ASSET ab, CMS_ASSET_VEHICLE veh, CMS_SECURITY sec
where ((veh.CMS_COLLATERAL_ID between 20090801000000000 and 20090801999999999)
or (veh.CMS_COLLATERAL_ID between 20090808000000000 and 20090808999999999))
and sec.CMS_COLLATERAL_ID = ab.CMS_COLLATERAL_ID
and ab.CMS_COLLATERAL_ID = veh.CMS_COLLATERAL_ID
and veh.DOWNPAYMENT_TRADEIN > 0
and sec.SOURCE_SECURITY_SUB_TYPE in ('F70', 'F71', 'F72', 'F74', 'F75', 'F76')
and ab.CMS_COLLATERAL_ID not in (select COLLATERAL_ID from CMS_ASSET_TRADE_IN);

--------------------------------------------------------------------------------------------------------------------------------------------
-- Inser into cms asset trade in for all the migration record with valid downpayment amount
insert into CMS_ASSET_TRADE_IN (ID, COLLATERAL_ID, MAKE, MODEL, YEAR_OF_MANUFACTURE, REGISTRATION_NO, CURRENCY_CODE, VERSION_TIME) 
    (select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_ASSET_TRADE_IN_A_SEQ), 2)) as BIGINT),
		veh.CMS_COLLATERAL_ID, ab.BRAND, ab.MODEL_NO, ab.MANUFACTURE_YEAR, ab.REG_NO, sec.CMV_CURRENCY, sec.VERSION_TIME
    from CMS_ASSET ab, CMS_ASSET_VEHICLE veh, CMS_SECURITY sec
    where ((veh.CMS_COLLATERAL_ID between 20090801000000000 and 20090801999999999)
    or (veh.CMS_COLLATERAL_ID between 20090808000000000 and 20090808999999999))
    and sec.CMS_COLLATERAL_ID = ab.CMS_COLLATERAL_ID
    and ab.CMS_COLLATERAL_ID = veh.CMS_COLLATERAL_ID
    and veh.DOWNPAYMENT_TRADEIN > 0
    and sec.SOURCE_SECURITY_SUB_TYPE in ('F70', 'F71', 'F72', 'F74', 'F75', 'F76')
    and ab.CMS_COLLATERAL_ID not in (select COLLATERAL_ID from CMS_ASSET_TRADE_IN));

-- Inser into STAGE  asset trade in for all the migration record with valid downpayment amount
insert into STAGE_ASSET_TRADE_IN (ID, COLLATERAL_ID, MAKE, MODEL, YEAR_OF_MANUFACTURE, REGISTRATION_NO, CURRENCY_CODE, VERSION_TIME) 
	(select CAST((TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || SUBSTR(DIGITS(NEXT VALUE FOR CMS_ASSET_TRADE_IN_S_SEQ), 2)) as BIGINT),
		veh.CMS_COLLATERAL_ID, ab.BRAND, ab.MODEL_NO, ab.MANUFACTURE_YEAR, ab.REG_NO, sec.CMV_CURRENCY, sec.VERSION_TIME
	from CMS_STAGE_ASSET ab, CMS_STAGE_ASSET_VEHICLE veh, CMS_STAGE_SECURITY sec
	where ((veh.CMS_COLLATERAL_ID between 20090801000000000 and 20090801999999999)
	or (veh.CMS_COLLATERAL_ID between 20090808000000000 and 20090808999999999))
	and sec.CMS_COLLATERAL_ID = ab.CMS_COLLATERAL_ID
	and ab.CMS_COLLATERAL_ID = veh.CMS_COLLATERAL_ID
	and veh.DOWNPAYMENT_TRADEIN > 0
	and sec.SOURCE_SECURITY_SUB_TYPE in ('F70', 'F71', 'F72', 'F74', 'F75', 'F76')
	and ab.CMS_COLLATERAL_ID not in (select COLLATERAL_ID from STAGE_ASSET_TRADE_IN));

-- Update reference id to ID for actual table
update CMS_ASSET_TRADE_IN 
set REF_ID = ID 
where ((COLLATERAL_ID between 20090801000000000 and 20090801999999999)
or (COLLATERAL_ID between 20090808000000000 and 20090808999999999))
and REF_ID is null;

-- Update reference id in staging table to ID from actual table
update STAGE_ASSET_TRADE_IN stgtrade
set REF_ID = (select trade.ID from CMS_ASSET_TRADE_IN trade, transaction trx
				where trade.COLLATERAL_ID = trx.REFERENCE_ID
				and trx.STAGING_REFERENCE_ID = stgtrade.COLLATERAL_ID
                and trx.TRANSACTION_TYPE = 'COL'
				and ((trade.COLLATERAL_ID between 20090801000000000 and 20090801999999999)
				or (trade.COLLATERAL_ID between 20090808000000000 and 20090808999999999)) fetch first row only)
where ((stgtrade.COLLATERAL_ID between 20090801000000000 and 20090801999999999)
or (stgtrade.COLLATERAL_ID between 20090808000000000 and 20090808999999999))
and stgtrade.REF_ID is null;
