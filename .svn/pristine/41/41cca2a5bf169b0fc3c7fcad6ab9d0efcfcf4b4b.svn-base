/* Post migration patching for Net Realizable Price */

DROP TABLE MIG_SEC_REAL;

CREATE TABLE MIG_SEC_REAL (
    CMS_ACT_COL_ID              BIGINT,
    CMS_STG_COL_ID              BIGINT,
	IS_VALID                    CHAR(1) DEFAULT 'Y',
	SECURITY_ID                 VARCHAR(19),
	NET_REALIZABLE_VALUE		DECIMAL(30,2)
) in CMS_MIG index in CMS_MIG_INDEX;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 422132
select count(*) from cms_security where NET_REALIZABLE_VALUE is null;

-- 474300
select count(*) from CMS_STAGE_SECURITY where NET_REALIZABLE_VALUE is null;

-- Update net realizable price to 0 if emoty
update CMS_SECURITY 
set NET_REALIZABLE_VALUE = 0
where NET_REALIZABLE_VALUE is null;

update CMS_STAGE_SECURITY 
set NET_REALIZABLE_VALUE = 0
where NET_REALIZABLE_VALUE is null;

select count(*) from CMS_SECURITY sec where sec.NET_REALIZABLE_VALUE = 0;

select count(*) from CMS_STAGE_SECURITY sec where sec.NET_REALIZABLE_VALUE = 0;

			
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------			
-- Validation process		
			
update MIG_SEC_REAL net
set net.IS_VALID = 'N'
where not exists (select 1 from CMS_SECURITY sec
					where sec.CMS_COLLATERAL_ID = net.CMS_COLLATERAL_ID fetch first row only);
			
		
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update actual and staging collateral id

update MIG_SEC_REAL net
set (CMS_ACT_COL_ID) = (select sec.CMS_COLLATERAL_ID from CMS_SECURITY sec
						where sec.SCI_SECURITY_DTL_ID = net.SECURITY_ID)
where exists (select 1 from CMS_SECURITY sec1
			where sec1.SCI_SECURITY_DTL_ID = net.SECURITY_ID fetch first row only)
and net.NET_REALIZABLE_VALUE = 0
and net.IS_VALID = 'Y';

update MIG_SEC_REAL net
set (CMS_STG_COL_ID) = (select trx.STAGING_REFERENCE_ID from transaction trx
						where sec.REFERENCE_ID = net.CMS_ACT_COL_ID)
where exists (select 1 from transaction trx
			where trx.REFERENCE_ID = net.CMS_ACT_COL_ID fetch first row only)
and net.NET_REALIZABLE_VALUE = 0
and net.IS_VALID = 'Y';

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Update security net realizable proce based on the values derived

update CMS_SECURITY sec
set sec.NET_REALIZABLE_VALUE = (select NET_REALIZABLE_VALUE from MIG_SEC_REAL net
								where net.CMS_COLLATERAL_ID = sec.CMS_ACT_COL_ID
								and net.IS_VALID = 'Y')
where exists (select 1 from MIG_SEC_REAL net
				where net.CMS_COLLATERAL_ID = sec.CMS_ACT_COL_ID
				and net.IS_VALID = 'Y' fetch first row only)
and sec.NET_REALIZABLE_VALUE = 0;

update CMS_STAGE_SECURITY sec
set sec.NET_REALIZABLE_VALUE = (select NET_REALIZABLE_VALUE from MIG_SEC_REAL net
								where net.CMS_COLLATERAL_ID = sec.CMS_STG_COL_ID
								and net.IS_VALID = 'Y')
where exists (select 1 from MIG_SEC_REAL net
				where net.CMS_COLLATERAL_ID = sec.CMS_STG_COL_ID
				and net.IS_VALID = 'Y' fetch first row only)
and sec.NET_REALIZABLE_VALUE = 0;


