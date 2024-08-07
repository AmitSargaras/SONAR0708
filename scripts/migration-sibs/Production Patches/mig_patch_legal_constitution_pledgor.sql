/* Patch Legal Constitution Type following Main Profile */

-- 618667
select count(*) from SCI_PLEDGOR_DTL
where PLG_LEGAL_TYPE_VALUE is null; 

-- 617926
select count(*) from SCI_LE_MAIN_PROFILE mainprf, SCI_PLEDGOR_DTL plg
where plg.PLG_LEGAL_TYPE_VALUE is null
and plg.PLG_LE_ID = mainprf.LMP_LE_ID;

--------------------------------------------------------------------------------------------------------------------------------------				
-- Update pledgor detail for actual table 				
update SCI_PLEDGOR_DTL plg
set (PLG_LEGAL_TYPE_NUM, PLG_LEGAL_TYPE_VALUE) = (select LMP_LEGAL_CONST_NUM, LMP_LEGAL_CONST_VALUE from SCI_LE_MAIN_PROFILE mainprf
                                                    where plg.PLG_LE_ID = mainprf.LMP_LE_ID)
where exists (select 1 from SCI_LE_MAIN_PROFILE mainprf1
				where plg.PLG_LE_ID = mainprf1.LMP_LE_ID)
and plg.PLG_LEGAL_TYPE_VALUE is null;

-- Update pledgor detail for staging table 				
update STAGE_PLEDGOR_DTL plg
set (PLG_LEGAL_TYPE_NUM, PLG_LEGAL_TYPE_VALUE) = (select LMP_LEGAL_CONST_NUM, LMP_LEGAL_CONST_VALUE from SCI_LE_MAIN_PROFILE mainprf
                                                    where plg.PLG_LE_ID = mainprf.LMP_LE_ID)
where exists (select 1 from SCI_LE_MAIN_PROFILE mainprf1
				where plg.PLG_LE_ID = mainprf1.LMP_LE_ID)
and plg.PLG_LEGAL_TYPE_VALUE is null;
