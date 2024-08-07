-- Update ISIC Code to non 'P' values from temporary table (loaded with data)

update SCI_LE_ISIC_DTL
set LID_ISIC_CODE_VALUE = (select ISIC_CODE from mig_temp_table 
                            where CIF_ID = LID_LE_ID)
where LID_ISIC_CODE_VALUE = '';