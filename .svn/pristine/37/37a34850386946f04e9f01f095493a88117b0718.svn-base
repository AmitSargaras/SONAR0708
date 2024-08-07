UPDATE CMS_PROPERTY_STATE_TEMP pt 
SET CMS_COLLATERAL_ID = (SELECT sec.CMS_COLLATERAL_ID 
                         FROM CMS_SECURITY sec 
                         WHERE sec.SCI_SECURITY_DTL_ID = pt.SCI_SECURITY_DTL_ID 
                         and sec.SCI_SECURITY_TYPE_VALUE = 'PT'
                         and sec.IS_MIGRATED_IND = 'Y')
WHERE EXISTS (SELECT 1 
              FROM CMS_SECURITY sec1 
              WHERE sec1.SCI_SECURITY_DTL_ID = pt.SCI_SECURITY_DTL_ID 
              and sec1.SCI_SECURITY_TYPE_VALUE = 'PT'
              and sec1.IS_MIGRATED_IND = 'Y');

UPDATE CMS_PROPERTY_STATE_TEMP pt
SET CMS_STG_COLLATERAL_ID = (SELECT trans.STAGING_REFERENCE_ID 
                             FROM TRANSACTION trans 
                             WHERE trans.TRANSACTION_TYPE = 'COL' 
                             AND trans.REFERENCE_ID = pt.CMS_COLLATERAL_ID
                             AND pt.CMS_COLLATERAL_ID IS NOT NULL)
WHERE EXISTS (SELECT trans1.STAGING_REFERENCE_ID 
              FROM TRANSACTION trans1 
              WHERE trans1.TRANSACTION_TYPE = 'COL' 
              AND trans1.REFERENCE_ID = pt.CMS_COLLATERAL_ID
              AND pt.CMS_COLLATERAL_ID IS NOT NULL);


UPDATE CMS_PROPERTY actPt
SET actPt.STATE = (SELECT pt.STATE_CODE 
                   FROM CMS_PROPERTY_STATE_TEMP pt 
                   WHERE pt.CMS_COLLATERAL_ID IS NOT NULL
                   AND pt.CMS_COLLATERAL_ID = actPt.CMS_COLLATERAL_ID fetch first rows only)
WHERE EXISTS (SELECT 1 
              FROM CMS_PROPERTY_STATE_TEMP pt1 
              WHERE pt1.CMS_COLLATERAL_ID IS NOT NULL
              AND pt1.CMS_COLLATERAL_ID = actPt.CMS_COLLATERAL_ID fetch first rows only);

UPDATE CMS_STAGE_PROPERTY actPt
SET actPt.STATE = (SELECT pt.STATE_CODE 
                   FROM CMS_PROPERTY_STATE_TEMP pt 
                   WHERE pt.CMS_STG_COLLATERAL_ID IS NOT NULL
                   AND pt.CMS_STG_COLLATERAL_ID = actPt.CMS_COLLATERAL_ID fetch first rows only)
WHERE EXISTS (SELECT 1 
              FROM CMS_PROPERTY_STATE_TEMP pt1 
              WHERE pt1.CMS_STG_COLLATERAL_ID IS NOT NULL
              AND pt1.CMS_STG_COLLATERAL_ID = actPt.CMS_COLLATERAL_ID fetch first rows only);

delete from CMS_VALUATION where CMS_COLLATERAL_ID IN (select CMS_COLLATERAL_ID from CMS_PROPERTY_STATE_TEMP where CMS_COLLATERAL_ID is not null)
and SOURCE_TYPE = 'A';

update CMS_SECURITY set NEXT_REMARGIN_DATE = null, VALUATED_DATE = null where CMS_COLLATERAL_ID IN (select CMS_COLLATERAL_ID from CMS_PROPERTY_STATE_TEMP where CMS_COLLATERAL_ID is not null);