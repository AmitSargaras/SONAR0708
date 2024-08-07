create or replace
PROCEDURE SP_UPDATE_PARTY_CAM_UPLOAD
(IN_FILE_ID IN VARCHAR2 )
AS
  CURSOR CR_FILEUPLOAD
  IS
    SELECT ID,
      FILE_ID,
      PARTY_ID,
      CAM_DATE,
      CAM_LOGIN_DATE,
      RAM_RATING,
      RAM_RATING_YEAR,
      CUSTOMER_RAM_ID,
      CAM_EXPIRY_DATE,
      CAM_EXTENSION_DATE,
      RATING_TYPE,
      RAM_RATING_FINALIZATION_DATE,
      TOTAL_FUNDED_LIMIT
    FROM CMS_PARTYCAM_FILE_UPLOAD
    WHERE UPLOAD_STATUS='Y'
    AND FILE_ID        =IN_FILE_ID;
  RC_FILEUPLOAD CR_FILEUPLOAD%ROWTYPE;
  V_LLP_EXTD_NEXT_RVW_DATE DATE;
BEGIN
  OPEN CR_FILEUPLOAD;
  LOOP
    FETCH CR_FILEUPLOAD INTO RC_FILEUPLOAD;
    EXIT
  WHEN CR_FILEUPLOAD%NOTFOUND;
    UPDATE SCI_LE_CRI STG
    SET STG.CUSTOMER_RAM_ID =(
      CASE
        WHEN RC_FILEUPLOAD.CUSTOMER_RAM_ID IS NOT NULL
        THEN RC_FILEUPLOAD.CUSTOMER_RAM_ID
        ELSE STG.CUSTOMER_RAM_ID
      END),
      STG.UPLOAD_STATUS               ='Y'
    WHERE STG.CMS_LE_MAIN_PROFILE_ID IN
      (SELECT CMS_LE_MAIN_PROFILE_ID
      FROM SCI_LE_MAIN_PROFILE
      WHERE LMP_LE_ID=RC_FILEUPLOAD.PARTY_ID
      );
    UPDATE SCI_LSP_LMT_PROFILE LMT
    SET LMT.LLP_BCA_REF_APPR_DATE =(
      CASE
        WHEN RC_FILEUPLOAD.CAM_DATE IS NOT NULL
        THEN RC_FILEUPLOAD.CAM_DATE
        ELSE LMT.LLP_BCA_REF_APPR_DATE
      END),
      LMT.CAM_LOGIN_DATE =(
      CASE
        WHEN RC_FILEUPLOAD.CAM_LOGIN_DATE IS NOT NULL
        THEN RC_FILEUPLOAD.CAM_LOGIN_DATE
        ELSE LMT.CAM_LOGIN_DATE
      END),
      LMT.CMS_APPR_OFFICER_GRADE =(
      CASE
        WHEN RC_FILEUPLOAD.RAM_RATING IS NOT NULL
        THEN RC_FILEUPLOAD.RAM_RATING
        ELSE LMT.CMS_APPR_OFFICER_GRADE
      END),
      LMT.RATING_YEAR =(
      CASE
        WHEN RC_FILEUPLOAD.RAM_RATING_YEAR IS NOT NULL
        THEN RC_FILEUPLOAD.RAM_RATING_YEAR
        ELSE LMT.RATING_YEAR
      END),
      LMT.LLP_NEXT_ANNL_RVW_DATE =(
      CASE
        WHEN RC_FILEUPLOAD.CAM_EXPIRY_DATE IS NOT NULL
        THEN RC_FILEUPLOAD.CAM_EXPIRY_DATE
        ELSE LMT.LLP_NEXT_ANNL_RVW_DATE
      END),
      LMT.LLP_EXTD_NEXT_RVW_DATE =(
      CASE
        WHEN RC_FILEUPLOAD.CAM_EXTENSION_DATE IS NOT NULL
        THEN RC_FILEUPLOAD.CAM_EXTENSION_DATE
        ELSE LMT.LLP_EXTD_NEXT_RVW_DATE
      END),
      LMT.RATING_TYPE =(
      CASE
        WHEN RC_FILEUPLOAD.RATING_TYPE IS NOT NULL
        THEN
          (SELECT entry_CODE
          FROM common_code_category_entry
          WHERE category_code='SEC_RATING_TYPE'
          AND active_status  ='1'
          AND ENTRY_NAME     =RC_FILEUPLOAD.RATING_TYPE
          )
        ELSE LMT.RATING_TYPE
      END),
      LMT.RAM_RATING_FINALIZATION_DATE =(
      CASE
        WHEN RC_FILEUPLOAD.RAM_RATING_FINALIZATION_DATE IS NOT NULL
        THEN RC_FILEUPLOAD.RAM_RATING_FINALIZATION_DATE
        ELSE LMT.RAM_RATING_FINALIZATION_DATE
      END),
      LMT.UPLOAD_STATUS ='Y'
    WHERE LMT.LLP_LE_ID = RC_FILEUPLOAD.PARTY_ID ;
    SELECT LLP_EXTD_NEXT_RVW_DATE
    INTO V_LLP_EXTD_NEXT_RVW_DATE
    FROM SCI_LSP_LMT_PROFILE
    WHERE llp_le_id                       = RC_FILEUPLOAD.PARTY_ID;
    IF (RC_FILEUPLOAD.CAM_EXTENSION_DATE IS NOT NULL) THEN
      UPDATE SCI_LSP_SYS_XREF LSP
      SET LSP.DATE_OF_RESET = (
        CASE
          WHEN RC_FILEUPLOAD.CAM_EXTENSION_DATE IS NOT NULL AND LSP.DATE_OF_RESET < sysdate AND LSP.AVAILABLE = 'No' 
          THEN RC_FILEUPLOAD.CAM_EXTENSION_DATE
          WHEN RC_FILEUPLOAD.CAM_EXTENSION_DATE IS NOT NULL AND LSP.DATE_OF_RESET > sysdate AND LSP.AVAILABLE = 'Yes' 
          THEN RC_FILEUPLOAD.CAM_EXTENSION_DATE
          ELSE LSP.DATE_OF_RESET
        END),
        LSP.SENDTOCORE               = 'N',
        LSP.SENDTOFILE               = 'Y',
        LSP.STATUS                   = 'PENDING',
        LSP.ACTION                   = 'MODIFY',
        LSP.AVAILABLE                = (
        CASE
          WHEN RC_FILEUPLOAD.CAM_EXTENSION_DATE IS NOT NULL AND LSP.DATE_OF_RESET < sysdate AND LSP.AVAILABLE = 'No' 
          THEN 'Yes'
          WHEN RC_FILEUPLOAD.CAM_EXTENSION_DATE IS NOT NULL AND LSP.DATE_OF_RESET > sysdate AND LSP.AVAILABLE = 'No' 
          THEN 'Yes'
          ELSE LSP.AVAILABLE
        END)
      WHERE LSP.CMS_LSP_SYS_XREF_ID IN
        (SELECT cms_lsp_sys_xref_id
        FROM sci_lsp_lmts_xref_map
        WHERE cms_lsp_appr_lmts_id IN
          (SELECT cms_lsp_appr_lmts_id
          FROM sci_lsp_appr_lmts
          WHERE CMS_LIMIT_STATUS   ='ACTIVE'
          AND cms_limit_profile_id =
            (SELECT cms_lsp_lmt_profile_id
            FROM SCI_LSP_LMT_PROFILE
            WHERE llp_le_id=RC_FILEUPLOAD.PARTY_ID
            )
          AND line_no NOT LIKE '%225%'
          and line_no NOT LIKE '%125%' 
          and line_no NOT LIKE '%625%' 
          and line_no NOT LIKE '%525%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%195%' 
          and line_no NOT LIKE '%295%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%595%'
          and line_no NOT LIKE '%163%'
          and line_no NOT LIKE '%165%'
          and line_no NOT LIKE '%265%'
		  AND LINE_NO NOT LIKE '%223%'
          AND LINE_NO NOT LIKE '%221%'
          AND LINE_NO NOT LIKE '%121%'
          AND LINE_NO NOT LIKE '%158%'
          AND is_adhoc    <> 'Y'
          )
        )
      AND LSP.FACILITY_SYSTEM IN('FCUBS-LIMITS','UBS-LIMITS')
      AND LSP.RELEASED_AMOUNT  > 0
      AND LSP.CLOSE_FLAG      <> 'Y';
      
      
      UPDATE SCI_LSP_SYS_XREF LSP
      SET 
        LSP.SENDTOCORE               = 'N',
        LSP.SENDTOFILE               = 'Y',
        LSP.STATUS                   = 'PENDING',
        LSP.ACTION                   = 'MODIFY',
        LSP.AVAILABLE                = (
        CASE
          WHEN RC_FILEUPLOAD.CAM_EXTENSION_DATE IS NOT NULL 
   --       AND LSP.DATE_OF_RESET > sysdate
          
          AND LSP.AVAILABLE = 'No' 
          THEN 'Yes'
          ELSE LSP.AVAILABLE
        END)
      WHERE LSP.CMS_LSP_SYS_XREF_ID IN
        (SELECT cms_lsp_sys_xref_id
        FROM sci_lsp_lmts_xref_map
        WHERE cms_lsp_appr_lmts_id IN
          (SELECT cms_lsp_appr_lmts_id
          FROM sci_lsp_appr_lmts
          WHERE CMS_LIMIT_STATUS   ='ACTIVE'
          AND cms_limit_profile_id =
            (SELECT cms_lsp_lmt_profile_id
            FROM SCI_LSP_LMT_PROFILE
            WHERE llp_le_id=RC_FILEUPLOAD.PARTY_ID
            )
          AND line_no NOT LIKE '%225%'
          and line_no NOT LIKE '%125%' 
          and line_no NOT LIKE '%625%' 
          and line_no NOT LIKE '%525%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%195%' 
          and line_no NOT LIKE '%295%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%595%'
          and line_no NOT LIKE '%163%'
          and line_no NOT LIKE '%165%'
          and line_no NOT LIKE '%265%'
		  AND LINE_NO NOT LIKE '%223%'
          AND LINE_NO NOT LIKE '%221%'
          AND LINE_NO NOT LIKE '%121%'
          AND LINE_NO NOT LIKE '%158%'
          AND is_adhoc    = 'Y'
          )
        )
      AND LSP.FACILITY_SYSTEM IN('FCUBS-LIMITS','UBS-LIMITS')
      AND LSP.RELEASED_AMOUNT  > 0
      AND LSP.CLOSE_FLAG      <> 'Y';

      
      
      
      UPDATE SCI_LSP_SYS_XREF LSP
      SET LSP.DATE_OF_RESET = RC_FILEUPLOAD.CAM_EXTENSION_DATE,
        LSP.SENDTOCORE               = (
        CASE
          WHEN LSP.STATUS = 'SUCCESS'
          THEN 'N'
          ELSE LSP.SENDTOCORE
        END),
        LSP.SENDTOFILE               = (
        CASE
          WHEN LSP.STATUS = 'SUCCESS'
          THEN 'Y'
          ELSE LSP.SENDTOFILE
        END),
        LSP.STATUS                   = (
        CASE
          WHEN LSP.STATUS = 'SUCCESS'
          THEN 'PENDING'
          ELSE LSP.STATUS
        END),
        LSP.ACTION                   = (
        CASE
          WHEN LSP.STATUS = 'SUCCESS'
          THEN 'MODIFY'
          ELSE LSP.ACTION
        END)

      WHERE LSP.CMS_LSP_SYS_XREF_ID IN
        (SELECT cms_lsp_sys_xref_id
        FROM sci_lsp_lmts_xref_map
        WHERE cms_lsp_appr_lmts_id IN
          (SELECT cms_lsp_appr_lmts_id
          FROM sci_lsp_appr_lmts
          WHERE CMS_LIMIT_STATUS   ='ACTIVE'
          AND cms_limit_profile_id =
            (SELECT cms_lsp_lmt_profile_id
            FROM SCI_LSP_LMT_PROFILE
            WHERE llp_le_id=RC_FILEUPLOAD.PARTY_ID
            )
          )
        )
      AND to_date(to_char(LSP.DATE_OF_RESET, 'YYYY-MM-DD'),'YYYY-MM-DD') < to_date(to_char(RC_FILEUPLOAD.CAM_EXTENSION_DATE, 'YYYY-MM-DD'),'YYYY-MM-DD') 
      AND LSP.FACILITY_SYSTEM IN('ET')
   --   AND LSP.RELEASED_AMOUNT  > 0
      AND LSP.CLOSE_FLAG      <> 'Y';
      
      
      
      SP_SOURCEREF_NO(RC_FILEUPLOAD.PARTY_ID);
      COMMIT;      
      
    END IF;
    
    UPDATE SCI_LE_SUB_PROFILE SUB
    SET SUB.TOTAL_FUNDED_LIMIT =(
      CASE
        WHEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT IS NOT NULL
        THEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT
        ELSE SUB.TOTAL_FUNDED_LIMIT
      END),
      SUB.TOTAL_SANCTIONED_LIMIT =(
      CASE
        WHEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT IS NOT NULL
        THEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT + SUB.MEMO_EXPOSURE + SUB.TOTAL_NON_FUNDED_LIMIT
        ELSE SUB.TOTAL_SANCTIONED_LIMIT
      END),
      SUB.FUNDED_SHARE_LIMIT=(
      CASE
        WHEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT IS NOT NULL AND SUB.FUNDED_SHARE_PERCENT IS NOT NULL
        THEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT * SUB.FUNDED_SHARE_PERCENT / 100
        ELSE SUB.FUNDED_SHARE_LIMIT
      END)
    WHERE SUB.LSP_LE_ID = RC_FILEUPLOAD.PARTY_ID;
    
    UPDATE SCI_LE_MAIN_PROFILE MPRO
    SET MPRO.TOTAL_FUNDED_LIMIT =(
      CASE
        WHEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT IS NOT NULL
        THEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT
        ELSE MPRO.TOTAL_FUNDED_LIMIT
      END),
      MPRO.TOTAL_SANCTIONED_LIMIT =(
      CASE
        WHEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT IS NOT NULL
        THEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT + MPRO.MEMO_EXPOSURE + MPRO.TOTAL_NON_FUNDED_LIMIT
        ELSE MPRO.TOTAL_SANCTIONED_LIMIT
      END),
      MPRO.FUNDED_SHARE_LIMIT=(
      CASE
        WHEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT IS NOT NULL AND MPRO.FUNDED_SHARE_PERCENT IS NOT NULL
        THEN RC_FILEUPLOAD.TOTAL_FUNDED_LIMIT * MPRO.FUNDED_SHARE_PERCENT / 100
        ELSE MPRO.FUNDED_SHARE_LIMIT
      END)
    WHERE MPRO.LMP_LE_ID = RC_FILEUPLOAD.PARTY_ID;
    COMMIT;
  END LOOP;
  CLOSE CR_FILEUPLOAD;
  COMMIT;
END SP_UPDATE_PARTY_CAM_UPLOAD;
/

create or replace
PROCEDURE SP_SOURCEREF_NO
(PARTY_ID IN VARCHAR2 )
AS
  CURSOR CR_SOURCEREF_NO1
  IS
    SELECT CMS_LSP_SYS_XREF_ID,
      SOURCE_REF_NO,DATE_OF_RESET
    FROM SCI_LSP_SYS_XREF LSP
    WHERE LSP.CMS_LSP_SYS_XREF_ID IN
      (SELECT cms_lsp_sys_xref_id
      FROM sci_lsp_lmts_xref_map
      WHERE cms_lsp_appr_lmts_id IN
        (SELECT cms_lsp_appr_lmts_id
        FROM sci_lsp_appr_lmts
        WHERE CMS_LIMIT_STATUS   ='ACTIVE'
        AND cms_limit_profile_id =
          (SELECT cms_lsp_lmt_profile_id
          FROM SCI_LSP_LMT_PROFILE
          WHERE llp_le_id=PARTY_ID
          )
       and  line_no NOT LIKE '%225%'
          and line_no NOT LIKE '%125%' 
          and line_no NOT LIKE '%625%' 
          and line_no NOT LIKE '%525%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%195%' 
          and line_no NOT LIKE '%295%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%595%'
          and line_no NOT LIKE '%163%'
	      and line_no NOT LIKE '%165%'
          and line_no NOT LIKE '%265%'
		  AND LINE_NO NOT LIKE '%223%'
          AND LINE_NO NOT LIKE '%221%'
          AND LINE_NO NOT LIKE '%121%'
          AND LINE_NO NOT LIKE '%158%'
      AND is_adhoc    <> 'Y'
        )
      )
    AND LSP.FACILITY_SYSTEM IN('FCUBS-LIMITS','UBS-LIMITS')
    AND LSP.RELEASED_AMOUNT  > 0
    AND LSP.CLOSE_FLAG      <> 'Y';
    
    CURSOR CR_SOURCEREF_NO2
  IS
    SELECT CMS_LSP_SYS_XREF_ID,
      SOURCE_REF_NO,DATE_OF_RESET
    FROM SCI_LSP_SYS_XREF LSP
    WHERE LSP.CMS_LSP_SYS_XREF_ID IN
      (SELECT cms_lsp_sys_xref_id
      FROM sci_lsp_lmts_xref_map
      WHERE cms_lsp_appr_lmts_id IN
        (SELECT cms_lsp_appr_lmts_id
        FROM sci_lsp_appr_lmts
        WHERE CMS_LIMIT_STATUS   ='ACTIVE'
        AND cms_limit_profile_id =
          (SELECT cms_lsp_lmt_profile_id
          FROM SCI_LSP_LMT_PROFILE
          WHERE llp_le_id=PARTY_ID
          )
       and  line_no NOT LIKE '%225%'
          and line_no NOT LIKE '%125%' 
          and line_no NOT LIKE '%625%' 
          and line_no NOT LIKE '%525%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%195%' 
          and line_no NOT LIKE '%295%' 
          and line_no NOT LIKE '%695%' 
          and line_no NOT LIKE '%595%'
          and line_no NOT LIKE '%163%'
	      and line_no NOT LIKE '%165%'
          and line_no NOT LIKE '%265%'
		  AND LINE_NO NOT LIKE '%223%'
          AND LINE_NO NOT LIKE '%221%'
          AND LINE_NO NOT LIKE '%121%'
          AND LINE_NO NOT LIKE '%158%'
      AND is_adhoc    = 'Y'
        )
      )
    AND LSP.FACILITY_SYSTEM IN('FCUBS-LIMITS','UBS-LIMITS')
    AND LSP.RELEASED_AMOUNT  > 0
    AND LSP.CLOSE_FLAG      <> 'Y'
 --   AND LSP.DATE_OF_RESET > sysdate
    AND LSP.AVAILABLE = 'Yes';
    
    
    
     CURSOR CR_SOURCEREF_NO3
  IS
    SELECT CMS_LSP_SYS_XREF_ID,
      SOURCE_REF_NO,DATE_OF_RESET
    FROM SCI_LSP_SYS_XREF LSP
    WHERE LSP.CMS_LSP_SYS_XREF_ID IN
      (SELECT cms_lsp_sys_xref_id
      FROM sci_lsp_lmts_xref_map
      WHERE cms_lsp_appr_lmts_id IN
        (SELECT cms_lsp_appr_lmts_id
        FROM sci_lsp_appr_lmts
        WHERE CMS_LIMIT_STATUS   ='ACTIVE'
        AND cms_limit_profile_id =
          (SELECT cms_lsp_lmt_profile_id
          FROM SCI_LSP_LMT_PROFILE
          WHERE llp_le_id=PARTY_ID
          )
        )
      )
    AND LSP.FACILITY_SYSTEM IN('ET')
  --  AND LSP.RELEASED_AMOUNT  > 0
    AND LSP.CLOSE_FLAG      <> 'Y';
 --   AND LSP.DATE_OF_RESET > sysdate
  --  AND LSP.AVAILABLE = 'Yes';
    
    
    
  
    
    RC_SOURCEREF_NO1 CR_SOURCEREF_NO1%ROWTYPE;
    RC_SOURCEREF_NO2 CR_SOURCEREF_NO2%ROWTYPE;
    RC_SOURCEREF_NO3 CR_SOURCEREF_NO3%ROWTYPE;
    SOURCE_REF_NO_New VARCHAR2(50);
    OLD_SOURCE_REF_NO_New VARCHAR2(50);
    SYS_XREF_ID NUMBER(19,0);
    BEGIN
    OPEN CR_SOURCEREF_NO1;
    LOOP
      FETCH CR_SOURCEREF_NO1 INTO RC_SOURCEREF_NO1;
      EXIT
    WHEN CR_SOURCEREF_NO1%NOTFOUND;
      IF (RC_SOURCEREF_NO1.SOURCE_REF_NO IS NOT NULL) THEN
        SOURCE_REF_NO_New := FUN_GEN_SOURCE_NUMBER();
        OLD_SOURCE_REF_NO_New := RC_SOURCEREF_NO1.SOURCE_REF_NO;
        SYS_XREF_ID := RC_SOURCEREF_NO1.CMS_LSP_SYS_XREF_ID;
     --    DBMS_OUTPUT.PUT_LINE(OLD_SOURCE_REF_NO_New ||' '||SOURCE_REF_NO_New);
         UPDATE SCI_LSP_SYS_XREF 
        SET SOURCE_REF_NO       = SOURCE_REF_NO_New
        WHERE SOURCE_REF_NO     = OLD_SOURCE_REF_NO_New;
        
     --   AND LSP.CMS_LSP_SYS_XREF_ID = SYS_XREF_ID.VALUE;
        --COMMIT;
        UPDATE CMS_STAGE_LSP_SYS_XREF STGLSP
        SET STGLSP.SOURCE_REF_NO    = SOURCE_REF_NO_New,
         STGLSP.DATE_OF_RESET =(
        CASE
          WHEN RC_SOURCEREF_NO1.DATE_OF_RESET IS NOT NULL AND STGLSP.DATE_OF_RESET < sysdate AND STGLSP.AVAILABLE = 'No' 
          THEN RC_SOURCEREF_NO1.DATE_OF_RESET
          WHEN RC_SOURCEREF_NO1.DATE_OF_RESET IS NOT NULL AND STGLSP.DATE_OF_RESET > sysdate AND STGLSP.AVAILABLE = 'Yes' 
          THEN RC_SOURCEREF_NO1.DATE_OF_RESET
          ELSE RC_SOURCEREF_NO1.DATE_OF_RESET
        END),
        STGLSP.SENDTOCORE = 'N',
         STGLSP.SENDTOFILE = 'Y',
         STGLSP.STATUS = 'PENDING',
         STGLSP.ACTION = 'MODIFY',
         STGLSP.AVAILABLE = (
        CASE
          WHEN RC_SOURCEREF_NO1.DATE_OF_RESET IS NOT NULL AND STGLSP.DATE_OF_RESET < sysdate AND STGLSP.AVAILABLE = 'No' 
          THEN 'Yes'
          WHEN RC_SOURCEREF_NO1.DATE_OF_RESET IS NOT NULL AND STGLSP.DATE_OF_RESET > sysdate AND STGLSP.AVAILABLE = 'No' 
          THEN 'Yes'
          ELSE STGLSP.AVAILABLE
        END)
        WHERE STGLSP.SOURCE_REF_NO     =OLD_SOURCE_REF_NO_New
        AND STGLSP.CMS_LSP_SYS_XREF_ID =(select max(xr.CMS_LSP_SYS_XREF_ID) from cms_stage_lsp_sys_xref xr where xr.SOURCE_REF_NO = OLD_SOURCE_REF_NO_New);
        --COMMIT;
      END IF;
    END LOOP;
    --COMMIT;
    CLOSE CR_SOURCEREF_NO1;
    
     OPEN CR_SOURCEREF_NO2;
    LOOP
      FETCH CR_SOURCEREF_NO2 INTO RC_SOURCEREF_NO2;
      EXIT
    WHEN CR_SOURCEREF_NO2%NOTFOUND;
      IF (RC_SOURCEREF_NO2.SOURCE_REF_NO IS NOT NULL) THEN
        SOURCE_REF_NO_New := FUN_GEN_SOURCE_NUMBER();
        OLD_SOURCE_REF_NO_New := RC_SOURCEREF_NO2.SOURCE_REF_NO;
        SYS_XREF_ID := RC_SOURCEREF_NO2.CMS_LSP_SYS_XREF_ID;
     --    DBMS_OUTPUT.PUT_LINE(OLD_SOURCE_REF_NO_New ||' '||SOURCE_REF_NO_New);
         UPDATE SCI_LSP_SYS_XREF 
        SET SOURCE_REF_NO       = SOURCE_REF_NO_New
        WHERE SOURCE_REF_NO     = OLD_SOURCE_REF_NO_New;
        
     --   AND LSP.CMS_LSP_SYS_XREF_ID = SYS_XREF_ID.VALUE;
        --COMMIT;
        UPDATE CMS_STAGE_LSP_SYS_XREF STGLSP
        SET STGLSP.SOURCE_REF_NO    = SOURCE_REF_NO_New,
        -- STGLSP.DATE_OF_RESET =RC_SOURCEREF_NO2.DATE_OF_RESET,
         STGLSP.SENDTOCORE = 'N',
         STGLSP.SENDTOFILE = 'Y',
         STGLSP.STATUS = 'PENDING',
         STGLSP.ACTION = 'MODIFY',
         STGLSP.AVAILABLE = (
        CASE
          WHEN RC_SOURCEREF_NO2.DATE_OF_RESET IS NOT NULL AND STGLSP.AVAILABLE = 'No' 
          THEN 'Yes'
          ELSE STGLSP.AVAILABLE
        END)
        WHERE STGLSP.SOURCE_REF_NO     =OLD_SOURCE_REF_NO_New
        AND STGLSP.CMS_LSP_SYS_XREF_ID =(select max(xr.CMS_LSP_SYS_XREF_ID) from cms_stage_lsp_sys_xref xr where xr.SOURCE_REF_NO = OLD_SOURCE_REF_NO_New);
        --COMMIT;
      END IF;
    END LOOP;
    --COMMIT;
    CLOSE CR_SOURCEREF_NO2;
    
    
    
    
    
     OPEN CR_SOURCEREF_NO3;
    LOOP
      FETCH CR_SOURCEREF_NO3 INTO RC_SOURCEREF_NO3;
      EXIT
    WHEN CR_SOURCEREF_NO3%NOTFOUND;
     -- IF (RC_SOURCEREF_NO3.SOURCE_REF_NO IS NOT NULL) THEN
        SOURCE_REF_NO_New := FUN_GEN_SOURCE_NUMBER();
        OLD_SOURCE_REF_NO_New := RC_SOURCEREF_NO3.SOURCE_REF_NO;
        SYS_XREF_ID := RC_SOURCEREF_NO3.CMS_LSP_SYS_XREF_ID;
        DBMS_OUTPUT.PUT_LINE('OLD'||OLD_SOURCE_REF_NO_New ||'JAY'||SOURCE_REF_NO_New||'NEW');
        
        IF (RC_SOURCEREF_NO3.SOURCE_REF_NO IS NOT NULL) THEN
         UPDATE SCI_LSP_SYS_XREF 
        SET SOURCE_REF_NO       = SOURCE_REF_NO_New
         WHERE SOURCE_REF_NO     = OLD_SOURCE_REF_NO_New and CMS_LSP_SYS_XREF_ID=SYS_XREF_ID ;
         ELSE
           UPDATE SCI_LSP_SYS_XREF 
        SET SOURCE_REF_NO       = SOURCE_REF_NO_New
         WHERE SOURCE_REF_NO     is null and CMS_LSP_SYS_XREF_ID=SYS_XREF_ID ;
          END IF;
        
     --   AND LSP.CMS_LSP_SYS_XREF_ID = SYS_XREF_ID.VALUE;
        --COMMIT;
        DBMS_OUTPUT.PUT_LINE('1..............');
        UPDATE CMS_STAGE_LSP_SYS_XREF STGLSP
        SET STGLSP.SOURCE_REF_NO    = (
        CASE
          WHEN STGLSP.STATUS = 'SUCCESS'
          THEN SOURCE_REF_NO_New
          ELSE STGLSP.SOURCE_REF_NO
        END),
         STGLSP.DATE_OF_RESET =RC_SOURCEREF_NO3.DATE_OF_RESET,
        STGLSP.SENDTOCORE               = (
        CASE
          WHEN STGLSP.STATUS = 'SUCCESS'
          THEN 'N'
          ELSE STGLSP.SENDTOCORE
        END),
        STGLSP.SENDTOFILE               = (
        CASE
          WHEN STGLSP.STATUS = 'SUCCESS'
          THEN 'Y'
          ELSE STGLSP.SENDTOFILE
        END),
        STGLSP.STATUS                   = (
        CASE
          WHEN STGLSP.STATUS = 'SUCCESS'
          THEN 'PENDING'
          ELSE STGLSP.STATUS
        END),
        STGLSP.ACTION                   = (
        CASE
          WHEN STGLSP.STATUS = 'SUCCESS'
          THEN 'MODIFY'
          ELSE STGLSP.ACTION
        END)
        WHERE STGLSP.SOURCE_REF_NO     =OLD_SOURCE_REF_NO_New and
        STGLSP.CMS_LSP_SYS_XREF_ID =(select max(xr.CMS_LSP_SYS_XREF_ID) from cms_stage_lsp_sys_xref xr where xr.SOURCE_REF_NO = OLD_SOURCE_REF_NO_New)
         
         
--         STGLSP.CMS_LSP_SYS_XREF_ID IN
-- (SELECT CMS_LSP_SYS_XREF_ID
-- FROM STAGE_LIMIT_XREF
-- WHERE CMS_LSP_APPR_LMTS_ID IN
--   (SELECT cms_lsp_appr_lmts_id
--   FROM STAGE_LIMIT
--   WHERE CMS_LIMIT_STATUS   ='ACTIVE'
--   AND cms_limit_profile_id =
--     (SELECT cms_lsp_lmt_profile_id
--     FROM SCI_LSP_LMT_PROFILE
--     WHERE llp_le_id=PARTY_ID
--     )
--   AND FACILITY_SYSTEM IN('ET')
--   )
-- 
-- ) 
-- and CMS_LSP_SYS_XREF_ID = RC_SOURCEREF_NO3.CMS_LSP_SYS_XREF_ID
         
--        STGLSP.CMS_LSP_SYS_XREF_ID in ( select CMS_LSP_SYS_XREF_ID from STAGE_LIMIT_XREF where CMS_LSP_APPR_LMTS_ID in (select STAGING_REFERENCE_ID from  transaction where REFERENCE_ID in (SELECT distinct CMS_LSP_APPR_LMTS_ID
--  FROM sci_lsp_lmts_xref_map
--  WHERE cms_lsp_appr_lmts_id IN
--    (SELECT cms_lsp_appr_lmts_id
--    FROM sci_lsp_appr_lmts
--    WHERE CMS_LIMIT_STATUS   ='ACTIVE'
--    AND cms_limit_profile_id =
--     (SELECT cms_lsp_lmt_profile_id
--      FROM SCI_LSP_LMT_PROFILE
--      WHERE llp_le_id=PARTY_ID
--      )
--       AND FACILITY_SYSTEM IN('ET')
--   )
--   --  and CMS_LSP_SYS_XREF_ID = RC_SOURCEREF_NO3.CMS_LSP_SYS_XREF_ID
--    )
--   )
--    )         
    --  and  STGLSP.DATE_OF_RESET < RC_SOURCEREF_NO3.DATE_OF_RESET;
        AND to_date(to_char(STGLSP.DATE_OF_RESET, 'YYYY-MM-DD'),'YYYY-MM-DD') < to_date(to_char(RC_SOURCEREF_NO3.DATE_OF_RESET, 'YYYY-MM-DD'),'YYYY-MM-DD') ;
 DBMS_OUTPUT.PUT_LINE('2..............');
     --   COMMIT;
   --   END IF;
    END LOOP;
    --COMMIT;
    CLOSE CR_SOURCEREF_NO3;
    
    
    
    
    
    
    
    
    
    
    COMMIT;
  END SP_SOURCEREF_NO;
/  
  
 create or replace
PROCEDURE SP_CMS_BASEL_MONTHLY_P2
AS
  V_EXTRACTNAME VARCHAR2(30);
  D_PROCESSTARTTIME DATE;
  D_PROCESSENDTIME DATE      := SYSDATE;
  N_NOOFRECORDS NUMBER(25,5) := 0;
  V_STATUSFLAG  VARCHAR2(1);
  D_EXTRACTDATE DATE;
  D_RUNDATE DATE:= SYSDATE;
  V_CHECKSUM_COLUMN_NAME VARCHAR2(30);
 -- N_CHECKSUM_COLUMN_id        NUMBER(30);
  N_TOT_CHECKSUM_COLUMN_VALUE NUMBER(19):=0;
  N_CUR_CHECKSUM_COLUMN_VALUE NUMBER(19);
  b_delete_basel              VARCHAR2(2):= '1';
  v_application_date_basel DATE;
  v_app_day_of_month varchar2(2);
  maturity_date DATE;
  -- V_N_F_MKT_MITIGANT_VALUE    NUMBER (22,3);
  --V_Native_SQL Varchar2(200);
 -- Rec_No NUMBER(5):=0;
BEGIN
  --SELECT PARAM_VALUE into N_CHECKSUM_COLUMN_id FROM CMS_GENERAL_PARAM WHERE PARAM_CODE = 'CHECKSUM_COLUMN_VALUE' ;
  --SELECT COLUMN_NAME INTO V_CHECKSUM_COLUMN_NAME
  --FROM USER_TAB_COLS
  --WHERE TABLE_NAME = 'CMS_BASEL_MONTHLY_P2' AND COLUMN_ID=N_CHECKSUM_COLUMN_id ;


 select to_date (param_value,'dd/mm/yyyy hh24:mi')
  into v_application_date_basel
  from cms_general_param where param_code = 'APPLICATION_DATE';

  dbms_output.put_line('v_application_date_basel::::'||v_application_date_basel);

  SELECT to_char(to_date(param_value,'dd-MM-yyyy'),'DD') into v_app_day_of_month 
  FROM cms_general_param where param_code = 'APPLICATION_DATE';

  dbms_output.put_line('v_app_day_of_month::::'||v_app_day_of_month);

  if v_app_day_of_month between 1 and 10 then 
    SELECT ADD_MONTHS(LAST_DAY(v_application_date_basel), -1) into maturity_date
    FROM cms_general_param where param_code = 'APPLICATION_DATE';

  else 

    SELECT v_application_date_basel into maturity_date
    FROM cms_general_param where param_code = 'APPLICATION_DATE';

  end if;

  dbms_output.put_line('maturity_date::::'||maturity_date);

  SELECT COLUMN_NAME
  INTO V_CHECKSUM_COLUMN_NAME
  FROM USER_TAB_COLS
  WHERE TABLE_NAME = 'CMS_BASEL_MONTHLY_P2'
  AND COLUMN_ID    =
    (SELECT PARAM_VALUE
    FROM CMS_GENERAL_PARAM
    WHERE PARAM_CODE = 'CHECKSUM_COLUMN_VALUE'
    );
  V_EXTRACTNAME := TO_CHAR(v_application_date_basel, 'MON-YYYY');
  V_STATUSFLAG  := '0';

    -- Rec_No:=Rec_No+1;
   IF b_delete_basel   ='1' THEN
      D_PROCESSTARTTIME:=SYSDATE;
      INSERT INTO AUDIT_CMS_BASEL_MONTHLY_P2
      SELECT * FROM cms_basel_monthly_P2;
      --EXECUTE immediate 'TRUNCATE TABLE cms_basel_monthly_P2;';
      DELETE cms_basel_monthly_P2;
      B_DELETE_BASEL:='0' ;
    commit;
    END IF;

    V_STATUSFLAG:= '0';

 -- FD
FOR r1        IN
-------------------------------------------------new--------------------------------------------
(
 -- FD
(
SELECT

  DP.DEPOSIT_MATURITY_DATE   AS D_F_MATURITY_DATE ,
  NULL   AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
 -- sysdate AS FIC_MIS_DATE ,
  v_application_date_basel AS FIC_MIS_DATE ,
   ''      AS N_F_MKT_MITIGANT_VALUE ,

    TO_CHAR(ln.LIEN_AMOUNT,'999999999999999999999.999')   AS GROSS_VALUE ,                                    --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'

    Months_between (DP.DEPOSIT_MATURITY_DATE,DP.ISSUE_DATE)       AS N_F_ORIGINAL_MATURITY , -----Differece in Months
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data

    (CASE
         WHEN MONTHS_BETWEEN(DP.DEPOSIT_MATURITY_DATE,V_APPLICATION_DATE_BASEL) < 0
         --WHEN Months_between(DP.DEPOSIT_MATURITY_DATE,sysdate) < 0
         THEN
              0
         WHEN MONTHS_BETWEEN(DP.DEPOSIT_MATURITY_DATE,V_APPLICATION_DATE_BASEL) >= 0
        -- WHEN Months_between(DP.DEPOSIT_MATURITY_DATE,sysdate) >= 0
         THEN
              MONTHS_BETWEEN(DP.DEPOSIT_MATURITY_DATE,V_APPLICATION_DATE_BASEL)
            --  Months_between(DP.DEPOSIT_MATURITY_DATE,sysdate)
         END )
   AS N_F_RESIDUAL_MATURITY,
  null AS N_F_REVAL_FREQUENCY , -------no data
  sec.sci_security_currency ----CCY code coming from Security module
     AS V_F_CCY_CODE , ---changed
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
    TO_CHAR (DP.DEPOSIT_REFERENCE_NUMBER)      || TO_CHAR(ln.basel_serial)  AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED

basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || (
--   TO_CHAR (DP.DEPOSIT_REFERENCE_NUMBER)      || TO_CHAR(ln.basel_serial) ) AS V_F_MITIGANT_CODE,

   (
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
 || (
   TO_CHAR (DP.DEPOSIT_REFERENCE_NUMBER)      || TO_CHAR(ln.basel_serial) )
 AS V_F_MITIGANT_CODE ,

--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' --------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,
  (
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,

    'SEC0001066'   AS V_F_MITIGANT_TYPE_CODE , ------changed

  NULL AS V_F_RATING_ID ,
    DP.ISSUE_DATE   AS D_F_START_DATE,
   DP.SYSTEM_ID    AS V_F_TPFD_CUST_ID ,
 null AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
  null AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
 null AS F_F_RATING_TYPE ,
  null AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,     ------------Facility Sec/Primary Field
cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS SECOND_YEAR_TURNOVER,
cri.THIRD_YEAR AS THIRD_YEAR,
CRI.THIRD_YEAR_TURNOVER AS THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID
FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  SCI_LSP_LMTS_XREF_MAP MAPSS,-- By sachin 27/06/2012
  CMS_LIMIT_SECURITY_MAP MAPS,
  /*(SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )

    )
  ) MAPSS,*/
  -- By sachin 27/06/2012
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  sci_le_cri  cri,
  (select * from cms_cash_deposit where status = 'ACTIVE' and ACTIVE = 'active') dp,

  CMS_LIEN LN--,
 -- TRANSACTION trx
 ,(select system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master
 WHERE
 SUB.SECURITY_SUB_TYPE_ID = 'CS202'
 and SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND CRI.CMS_LE_MAIN_PROFILE_ID(+) = MAN.CMS_LE_MAIN_PROFILE_ID
--AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
--AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID
--AND SEC.CMS_COLLATERAL_ID       = DP.CMS_COLLATERAL_ID(+) -- By sachin 27/06/2012
AND sec.CMS_COLLATERAL_ID       = dp.cms_collateral_id
AND DP.CASH_DEPOSIT_ID          = LN.CASH_DEPOSIT_ID(+)
--AND TRX.REFERENCE_ID            = spro.cms_le_sub_profile_id
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
--and SUB.SECURITY_SUB_TYPE_ID = 'CS202'
AND SEC.CMS_COLLATERAL_ID IN (SELECT CMS_COLLATERAL_ID FROM CMS_CASH_DEPOSIT)


--  AND MAPS.CHARGE_ID            = (SELECT MAX(CHARGE_ID)
--    FROM CMS_LIMIT_SECURITY_MAP MAPS1 WHERE MAPS1.CMS_COLLATERAL_ID=SEC.CMS_COLLATERAL_ID )
   AND MAPS.CHARGE_ID   in 
                (SELECT MAX(MAPS2.CHARGE_ID)
		        from cms_limit_security_map maps2
		        where maps2.cms_lsp_appr_lmts_id = SCI.cms_lsp_appr_lmts_id
		        AND maps2.cms_collateral_id      =sec.cms_collateral_id
		        ) 
  AND SCI.CMS_LSP_APPR_LMTS_ID  = MAPSS.CMS_LSP_APPR_LMTS_ID(+)
  AND MAPSS.CMS_LSP_SYS_XREF_ID = XREF.CMS_LSP_SYS_XREF_ID(+)
  AND MAPS.UPDATE_STATUS_IND = 'I'

--AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)
--AND (MAPS.update_status_ind <> 'D')
--group by
--DP.DEPOSIT_MATURITY_DATE ,
--DP.ISSUE_DATE,
--DP.SYSTEM_ID ,
--DP.DEPOSIT_REFERENCE_NUMBER,
--ln.LIEN_AMOUNT,
--ln.SERIAL_NO,
--
--sec.sci_security_currency ,
--SEC.SEC_PRIORITY,
--
--XREF.FACILITY_SYSTEM,
--XREF.FACILITY_SYSTEM_ID,
--XREF.LINE_NO,
--XREF.SERIAL_NO,
--
--spro.PARTY_GRP_NM,
--
--cri.FIRST_YEAR,
--cri.FIRST_YEAR_TURNOVER ,
--cri.SECOND_YEAR ,
--cri.SECOND_YEAR_TURNOVER ,
--cri.THIRD_YEAR ,
--CRI.THIRD_YEAR_TURNOVER ,
--cri.CUSTOMER_RAM_ID

)


)

  LOOP
   -- Rec_No:=Rec_No+1;
   -- dbms_output.Put_line('Inside Loop for the ********* '|| Rec_No || ' Time');

   -- dbms_output.Put_line('1');
    V_STATUSFLAG:= '0';
   -- dbms_output.Put_line(R1.FIC_MIS_DATE);
   -- dbms_output.Put_line(R1.V_F_SECURITY_ID);
   -- dbms_output.Put_line(R1.V_F_MITIGANT_SOURCE_SYS);
   -- dbms_output.Put_line(R1.V_F_SYSTEM_EXP_IND);
   -- dbms_output.Put_line(R1.N_F_LINE_SERIAL);
    --dbms_output.Put_line(R1.V_F_MITIGANT_CODE);
    --dbms_output.Put_line(R1.V_F_MITIGANT_TYPE_CODE);
    INSERT
    INTO cms_basel_monthly_P2
    (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS
      )
      VALUES
      (
        DECODE(R1.D_F_MATURITY_DATE,null,v_application_date_basel,R1.D_F_MATURITY_DATE),
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        R1.RAM_ID,
        'Not Applicable',
       'Not Applicable',
       'Not Applicable',
       'Not Applicable',
       'Not Applicable'
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

---------- guarantee Null control  -'GT406','GT408','GT405'----------


 FOR r1        IN
-------------------------------------------------new--------------------------------------------

(

---------- guarantee Null control -------'GT406','GT408','GT405'----

(
SELECT
  SEC.SECURITY_MATURITY_DATE
      AS D_F_MATURITY_DATE ,
  null   AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
--SYSDATE AS FIC_MIS_DATE ,
  v_application_date_basel AS FIC_MIS_DATE ,
    ''                                        -- for guarantee this should be null
      AS N_F_MKT_MITIGANT_VALUE ,
  TO_CHAR(sec.cmv,'999999999999999999999.999')
      AS GROSS_VALUE ,                        --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'

  null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data
  null AS N_F_RESIDUAL_MATURITY,
  null AS N_F_REVAL_FREQUENCY , -------no data
   sec.sci_security_currency ----CCY code coming from Security module
      AS V_F_CCY_CODE , ---changed
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
  TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || TO_CHAR (SEC.CMS_COLLATERAL_ID)  AS V_F_MITIGANT_CODE,

   (
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,

--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,
  (
  CASE

     WHEN SUB.SECURITY_SUB_TYPE_ID IN ('GT402','GT400')
   THEN TO_CHAR(sec.COLLATERAL_CODE)

    WHEN grnte.GUARANTOR_TYPE IN ('1','BUSENTIN')  --------------Business Entity Registered in India
    THEN 'STY0000009'
    WHEN grnte.GUARANTOR_TYPE IN ('2','RESINDV')     ------------Resident Indian Individual
    THEN 'STY0000008'
    WHEN grnte.GUARANTOR_TYPE IN ('3','BUSENTOUT') --------------Business Entity Registered Outside India
    THEN 'STY0000009'
    WHEN grnte.GUARANTOR_TYPE IN ('4','FRGNONREGI') -------------Foreign/Non-Resident Indian Individual
    THEN 'STY0000008'
  END )
  AS V_F_MITIGANT_TYPE_CODE , ------changed

  NULL AS V_F_RATING_ID ,
    grnte.GUARANTEE_DATE

  /*XREF.RELEASE_DATE*/
  AS D_F_START_DATE,
  NULL AS V_F_TPFD_CUST_ID ,
  null AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
  (

    CASE
        WHEN GRNTE.RAMID = 0 THEN
          ''
        WHEN GRNTE.RAMID != 0 THEN
          TO_CHAR(GRNTE.RAMID)
      END
   ) AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
  CASE
    WHEN TYP.SECURITY_TYPE_ID = 'GT'
    THEN 'L'
    ELSE NULL
  END AS F_F_RATING_TYPE ,
  CASE
    WHEN TYP.SECURITY_TYPE_ID = 'GT'
    THEN 'Y'
    ELSE NULL
  END AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code  
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,    ------------Facility Sec/Primary Field

  cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
CRI.THIRD_YEAR AS THIRD_YEAR,
cri.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
'' AS TYPE_OF_CHARGE,

case when ROC_MAP.COLLATERAL_ROC_CODE is not null then 'Applicable' else 'Not Applicable' end ROC,

CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE is not null 
    THEN
        FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
'Not Applicable' as INSURANCE_STATUS

FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )

    )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
    sci_le_cri  cri,

  cms_guarantee grnte
  ,(select 
system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master,
  (select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP


 WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID

AND sec.CMS_COLLATERAL_ID       = grnte.CMS_COLLATERAL_ID(+)
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
and SUB.SECURITY_SUB_TYPE_ID in('GT406','GT408','GT405')
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_GUARANTEE)
AND (MAPS.UPDATE_STATUS_IND <> 'D' OR MAPS.UPDATE_STATUS_IND IS NULL)
and (grnte.GUARANTEE_AMT <> 0 or sec.cmv <> 0 or
                                    grnte.SECURED_PORTION <> 0 or
                                    grnte.UNSECURED_PORTION <> 0 or
                                    grnte.TELEPHONE_NUMBER <> 0 or
                                    grnte.TELEPHONE_AREA_CODE <> 0 or
                                    GRNTE.RAMID <> 0
                                    OR GRNTE.COUNTRY IS NOT NULL)

AND SEC.COLLATERAL_CODE       = ROC_MAP.COLLATERAL_ROC_CODE(+)

GROUP BY
SEC.SECURITY_MATURITY_DATE,
sec.cmv,
sec.sci_security_currency,
SEC.CMS_COLLATERAL_ID,
XREF.FACILITY_SYSTEM ,
XREF.FACILITY_SYSTEM_ID,
XREF.LINE_NO ,
XREF.SERIAL_NO,
SEC.CMS_COLLATERAL_ID,
SUB.SECURITY_SUB_TYPE_ID ,
sec.COLLATERAL_CODE,
grnte.GUARANTOR_TYPE,
grnte.GUARANTEE_DATE,
GRNTE.RAMID ,
TYP.SECURITY_TYPE_ID,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER,
CRI.THIRD_YEAR ,
cri.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
basel_master.SYSTEM_VALUE,
ROC_MAP.COLLATERAL_ROC_CODE,
ROC_MAP.INSURANCE_APPLICABLE,
pf.cms_customer_id
))

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS
      )
      VALUES
      (
        NULL,
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.TYPE_OF_CHARGE,'Not Applicable'),
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;


-- GUARANTEE SBSL SBBG GT400 GT402

 FOR r1        IN
-------------------------------------------------new--------------------------------------------

(

---------- guarantee Null control -----------

(
SELECT
  SEC.SECURITY_MATURITY_DATE
      AS D_F_MATURITY_DATE ,
  null   AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
--SYSDATE AS FIC_MIS_DATE ,
  v_application_date_basel AS FIC_MIS_DATE ,
    ''                                       -- for guarantee this should be null
      AS N_F_MKT_MITIGANT_VALUE ,
  TO_CHAR
(sec.cmv,'999999999999999999999.999')
      AS GROSS_VALUE ,                       --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'

  null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data
  null AS N_F_RESIDUAL_MATURITY,
  null AS N_F_REVAL_FREQUENCY , -------no data
   sec.sci_security_currency ----CCY code coming from Security module
      AS V_F_CCY_CODE , ---changed
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
  TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || TO_CHAR (SEC.CMS_COLLATERAL_ID)  AS V_F_MITIGANT_CODE,
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,

(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,

  TO_CHAR(sec.COLLATERAL_CODE)   AS V_F_MITIGANT_TYPE_CODE , ------changed

  NULL AS V_F_RATING_ID ,
    grnte.GUARANTEE_DATE

  /*XREF.RELEASE_DATE*/
  AS D_F_START_DATE,
  NULL AS V_F_TPFD_CUST_ID ,
  null AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
  (

    CASE
        WHEN GRNTE.RAMID = 0 THEN
          ''
        WHEN GRNTE.RAMID != 0 THEN
          TO_CHAR(GRNTE.RAMID)
      END
   ) AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
  CASE
    WHEN TYP.SECURITY_TYPE_ID = 'GT'
    THEN 'L'
    ELSE NULL
  END AS F_F_RATING_TYPE ,
  CASE
    WHEN TYP.SECURITY_TYPE_ID = 'GT'
    THEN 'Y'
    ELSE NULL
  END AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code 
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,   ------------Facility Sec/Primary Field

  cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
CRI.THIRD_YEAR AS THIRD_YEAR,
cri.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
''  AS TYPE_OF_CHARGE,

case when ROC_MAP.COLLATERAL_ROC_CODE is not null then 'Applicable' else 'Not Applicable' end ROC,

CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE is not null 
    THEN
       FUN_ROC_STATUS(pf.cms_customer_id)

    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
'Not Applicable' AS INSURANCE_STATUS

FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )

    )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
    sci_le_cri  cri,

  cms_guarantee grnte
,(select 
system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master,
(select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP

 WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID

AND sec.CMS_COLLATERAL_ID       = grnte.CMS_COLLATERAL_ID(+)
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
and SUB.SECURITY_SUB_TYPE_ID in('GT400','GT402')
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_GUARANTEE)
AND (MAPS.UPDATE_STATUS_IND <> 'D' OR MAPS.UPDATE_STATUS_IND IS NULL)
and (grnte.GUARANTEE_AMT <> 0 or sec.cmv IS NOT NULL OR
                                    grnte.SECURED_PORTION <> 0 or
                                    grnte.UNSECURED_PORTION <> 0 or
                                    grnte.TELEPHONE_NUMBER <> 0 or
                                    grnte.TELEPHONE_AREA_CODE <> 0 or
                                    grnte.RAMID <> 0 )
AND SEC.COLLATERAL_CODE       = ROC_MAP.COLLATERAL_ROC_CODE(+)     

GROUP BY
SEC.SECURITY_MATURITY_DATE,
sec.cmv,
sec.sci_security_currency,
SEC.CMS_COLLATERAL_ID,
XREF.FACILITY_SYSTEM ,
XREF.FACILITY_SYSTEM_ID,
XREF.LINE_NO ,
XREF.SERIAL_NO,
SEC.CMS_COLLATERAL_ID,
SUB.SECURITY_SUB_TYPE_ID ,
sec.COLLATERAL_CODE,
grnte.GUARANTOR_TYPE,
grnte.GUARANTEE_DATE,
GRNTE.RAMID ,
TYP.SECURITY_TYPE_ID,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER,
CRI.THIRD_YEAR ,
cri.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
basel_master.SYSTEM_VALUE,
ROC_MAP.COLLATERAL_ROC_CODE,
ROC_MAP.INSURANCE_APPLICABLE,
pf.cms_customer_id
))

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS
      )
      VALUES
      (
        NULL,
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.TYPE_OF_CHARGE,'Not Applicable'),
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

--------- property Null control --------

 FOR r1        IN
-------------------------------------------------new--------------------------------------------

(


--------- property Null control --------

(SELECT
  maturity_date AS D_F_MATURITY_DATE ,
  prty.VALUATION_DATE     AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
  v_application_date_basel AS FIC_MIS_DATE ,
  --SYSDATE AS FIC_MIS_DATE ,
  TO_CHAR(sec.cmv,'999999999999999999999.999')   AS N_F_MKT_MITIGANT_VALUE ,
  TO_CHAR(sec.cmv,'999999999999999999999999999999.999') AS GROSS_VALUE ,                          --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'
  null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data
  null AS N_F_RESIDUAL_MATURITY,
  null AS N_F_REVAL_FREQUENCY , -------no data
  'INR'    AS V_F_CCY_CODE , ---changed
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
  TO_CHAR(SEC.CMS_COLLATERAL_ID)   AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  ||    TO_CHAR(SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE,

(
 case 
 when basel_master.BASEL_VALIDATION = 'L'then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' --------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,

(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,

  (SELECT TRY.ENTRY_CODE
      FROM COMMON_CODE_CATEGORY_ENTRY TRY ,
        COMMON_CODE_CATEGORY CAT
      WHERE prty.PROPERTY_TYPE = TRY.ENTRY_CODE
      AND CAT.CATEGORY_ID      = TRY.CATEGORY_CODE_ID
      AND CAT.CATEGORY_CODE    = 'PROPERTY_TYPE'
      )  AS V_F_MITIGANT_TYPE_CODE , ------changed

  NULL AS V_F_RATING_ID ,
 -- XREF.RELEASE_DATE  AS D_F_START_DATE,
  PF.llp_bca_ref_appr_date  AS D_F_START_DATE,
  null AS V_F_TPFD_CUST_ID ,

      (SELECT SUBSTR(TRY.ENTRY_NAME,1,1)
      FROM COMMON_CODE_CATEGORY_ENTRY TRY ,
        COMMON_CODE_CATEGORY CAT
      WHERE prty.PROPERTY_TYPE = TRY.ENTRY_CODE
      AND CAT.CATEGORY_ID      = TRY.CATEGORY_CODE_ID
      AND CAT.CATEGORY_CODE    = 'PROPERTY_TYPE'
      )
       AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
  null AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
  null AS F_F_RATING_TYPE ,
  NULL AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code  
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT  ,  ------------Facility Sec/Primary Field
cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
cri.THIRD_YEAR AS THIRD_YEAR,
CRI.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
sec.change_type as claim,

   CASE
                when  ROC_MAP_PRO.COLLATERAL_ROC_CODE is not null and ROC_MAP_COL.COLLATERAL_ROC_CODE is not null and ROC_MAP_PRO.IRB_CATEGORY=ROC_MAP_COL.IRB_CATEGORY  and prty.CONSTITUTION in ('22','PVT.LTD.','LIMITED') 

                THEN 
                    'Applicable'  
                ELSE
                   'Not Applicable'
    END
                AS ROC,

    CASE WHEN ROC_MAP_PRO.COLLATERAL_ROC_CODE is not null and ROC_MAP_COL.COLLATERAL_ROC_CODE is not null  and ROC_MAP_PRO.IRB_CATEGORY=ROC_MAP_COL.IRB_CATEGORY and prty.CONSTITUTION in ('22','PVT.LTD.','LIMITED') 
    THEN
        FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

    CASE WHEN ROC_MAP_PRO.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP_PRO.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
   --  CASE WHEN ROC_MAP_COL.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP_COL.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
  --   FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID) as INSURANCE_STATUS   
 --  CASE WHEN ROC_MAP_COL.COLLATERAL_ROC_CODE IS NULL THEN 'Not Applicable' ELSE FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID) END INSURANCE_STATUS  
  -- CASE WHEN   ROC_MAP_COL.COLLATERAL_ROC_CODE IS NOT NULL THEN 
-- CASE WHEN ROC_MAP_COL.INSURANCE_APPLICABLE ='Applicable' THEN FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID)
  CASE WHEN   ROC_MAP_PRO.COLLATERAL_ROC_CODE IS NOT NULL THEN 
 CASE WHEN ROC_MAP_PRO.INSURANCE_APPLICABLE ='Applicable' THEN FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID)
 ELSE 'Not Applicable' END 
 ELSE 'Not Applicable' END INSURANCE_STATUS

FROM (SELECT * FROM CMS_COLLATERAL_ROC_MAP WHERE COLLATERAL_CATEGORY='COLLATERAL' AND DEPRECATED = 'N') ROC_MAP_COL,
 (select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='PROPERTY_TYPE' and deprecated = 'N') ROC_MAP_PRO,
CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )

    )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  sci_le_cri  cri,
  cms_property prty
  ,(select system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master

 WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID
AND prty.cms_collateral_id(+)   = sec.cms_collateral_id
AND SEC.COLLATERAL_CODE       = ROC_MAP_COL.COLLATERAL_ROC_CODE(+)
and prty.PROPERTY_TYPE       = ROC_MAP_PRO.COLLATERAL_ROC_CODE(+) ---

AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')

and SUB.SECURITY_SUB_TYPE_ID = 'PT701'
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_PROPERTY)

AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)
and (           prty.IS_PHY_INSPECT <>'N' or
                prty.PHY_INSPECT_FREQ <> 0 or
                prty.LAND_AREA <> 0 or
                prty.TENURE <> 0 or
                prty.REMAINING_TENURE <> 0 or
                prty.QUIT_RENT_PAID <> '-1' or
                prty.BUILTUP_AREA <> 0 or
                prty.SALE_PURCHASE_VALUE <> '-1' or
                prty.STD_QUIT_RENT <> 'N' or
                prty.NON_STD_QUIT_RENT <> 'N' or
                prty.QUIT_RENT_RECEIPT <> 'N' or
                prty.ASSESSMENT <> 'N' or
                prty.COMBINED_VALUE_AMT <> 0 or
                prty.VALUE_NUMBER <> 0 or
                PRTY.ASSESSMENT_PERIOD <>0 OR
                PRTY.ASSUMPTION  <> 'N' 
                 OR PRTY.PROPERTY_TYPE IS NOT NULL
                 OR PRTY.MARGAGE_TYPE IS NOT NULL
)

GROUP BY
prty.VALUATION_DATE,
sec.cmv,
SEC.CMS_COLLATERAL_ID,
XREF.FACILITY_SYSTEM ,
XREF.FACILITY_SYSTEM_ID   ,
XREF.LINE_NO              ,
XREF.SERIAL_NO,
XREF.FACILITY_SYSTEM ,
XREF.FACILITY_SYSTEM_ID,
XREF.LINE_NO,
XREF.SERIAL_NO,
SEC.CMS_COLLATERAL_ID,
XREF.RELEASE_DATE  ,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR ,
cri.FIRST_YEAR_TURNOVER ,
cri.SECOND_YEAR ,
cri.SECOND_YEAR_TURNOVER ,
cri.THIRD_YEAR ,
CRI.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID ,
prty.PROPERTY_TYPE,
PF.llp_bca_ref_appr_date,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
basel_master.SYSTEM_VALUE,
SEC.COLLATERAL_CODE,
ROC_MAP_COL.COLLATERAL_ROC_CODE,
ROC_MAP_PRO.COLLATERAL_ROC_CODE,
ROC_MAP_COL.IRB_CATEGORY,
ROC_MAP_PRO.IRB_CATEGORY,
prty.CONSTITUTION,
sec.change_type,
ROC_MAP_PRO.INSURANCE_APPLICABLE,
pf.cms_customer_id
)

)

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS
      )
      VALUES
      (
        DECODE(R1.D_F_MATURITY_DATE,null,v_application_date_basel,R1.D_F_MATURITY_DATE),
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.CLAIM,'Not Applicable'),
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

-------gold-- Asset Null control --------
  FOR r1        IN
-------------------------------------------------new--------------------------------------------

(

-------gold-- Asset Null control --------

(SELECT
SEC.SECURITY_MATURITY_DATE    AS D_F_MATURITY_DATE ,
null  AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
 v_application_date_basel AS FIC_MIS_DATE ,
 -- sysdate AS FIC_MIS_DATE ,
 TO_CHAR(sec.cmv,'999999999999999999999.999')     AS N_F_MKT_MITIGANT_VALUE ,
 TO_CHAR(sec.cmv,'999999999999999999999999999999.999')    AS GROSS_VALUE ,                       --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'
 null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data
 null AS N_F_RESIDUAL_MATURITY,
  null AS N_F_REVAL_FREQUENCY , -------no data
  sec.sci_security_currency  AS V_F_CCY_CODE ,----CCY code coming from Security module
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
 TO_CHAR (SEC.CMS_COLLATERAL_ID)  AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || (
--  TO_CHAR (SEC.CMS_COLLATERAL_ID) ) AS V_F_MITIGANT_CODE, --------15
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,
   TO_CHAR(sec.COLLATERAL_CODE)  AS V_F_MITIGANT_TYPE_CODE , ------changed

  NULL AS V_F_RATING_ID ,
  null AS D_F_START_DATE,
  null AS V_F_TPFD_CUST_ID ,
  null AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
 null AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
  null AS F_F_RATING_TYPE ,
 null AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code 
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,   
  ------------Facility Sec/Primary Field
cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
cri.THIRD_YEAR AS THIRD_YEAR,
CRI.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
sec.change_type as claim,
case when ROC_MAP.COLLATERAL_ROC_CODE is not null then 'Applicable' else 'Not Applicable' end ROC,

  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE is not null 
    THEN
        FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

   CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
  'Not Applicable' AS INSURANCE_STATUS

FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )
    )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  sci_le_cri  cri,
  CMS_ASSET AST
  ,(select 
system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master,
  (select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP

 WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id (+)= MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID
AND AST.cms_collateral_id(+)    = SEC.CMS_COLLATERAL_ID
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
and SUB.SECURITY_SUB_TYPE_ID  in('AB110')
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_ASSET)
AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)

AND SEC.COLLATERAL_CODE       = ROC_MAP.COLLATERAL_ROC_CODE(+)


GROUP BY SEC.SECURITY_MATURITY_DATE  ,
sec.cmv,
sec.sci_security_currency ,
SEC.CMS_COLLATERAL_ID,
XREF.FACILITY_SYSTEM,
XREF.FACILITY_SYSTEM_ID,
XREF.LINE_NO ,
XREF.SERIAL_NO,
sec.COLLATERAL_CODE,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR ,
cri.FIRST_YEAR_TURNOVER ,
cri.SECOND_YEAR ,
cri.SECOND_YEAR_TURNOVER ,
cri.THIRD_YEAR ,
CRI.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
BASEL_MASTER.SYSTEM_VALUE,
sec.change_type ,
ROC_MAP.COLLATERAL_ROC_CODE,
ROC_MAP.INSURANCE_APPLICABLE,
pf.cms_customer_id
)
)

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS--, commented by ayyaz
      --  INSURANCE commented by ayyaz
      )
      VALUES
      (
        DECODE(R1.D_F_MATURITY_DATE,null,v_application_date_basel,R1.D_F_MATURITY_DATE),
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.CLAIM,'Not Applicable'),
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS--,commented by ayyaz
      --  R1.INSURANCE commented by ayyaz
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

--- Plant and machi----
  FOR r1        IN
-------------------------------------------------new--------------------------------------------

(
--- Plant and machi----
(SELECT
SEC.SECURITY_MATURITY_DATE AS D_F_MATURITY_DATE ,
  null AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
  v_application_date_basel AS FIC_MIS_DATE ,
--  sysdate AS FIC_MIS_DATE ,
  TO_CHAR(sec.cmv,'999999999999999999999.999') AS N_F_MKT_MITIGANT_VALUE ,
 TO_CHAR(sec.cmv,'999999999999999999999999999999.999') AS GROSS_VALUE ,
  null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data
  null AS N_F_RESIDUAL_MATURITY,
  null AS N_F_REVAL_FREQUENCY , -------no data
  sec.sci_security_currency     AS V_F_CCY_CODE , ---changed
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
  TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || (
-- TO_CHAR (SEC.CMS_COLLATERAL_ID))--------15
--AS V_F_MITIGANT_CODE,

(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,
  TO_CHAR(sec.COLLATERAL_CODE)  AS V_F_MITIGANT_TYPE_CODE , ------changed
  NULL AS V_F_RATING_ID ,
 -- PLNT.invoice_date  AS D_F_START_DATE,
  PF.llp_bca_ref_appr_date  AS D_F_START_DATE,
  null AS V_F_TPFD_CUST_ID ,
  null AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
  TO_CHAR(PLNT.RAM_ID)   AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
  null AS F_F_RATING_TYPE ,
  NULL AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code  
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,   ------------Facility Sec/Primary Field
cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
cri.THIRD_YEAR AS THIRD_YEAR,
CRI.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
sec.change_type as claim,

case when ROC_MAP.COLLATERAL_ROC_CODE is not null then 'Applicable' else 'Not Applicable' end ROC,

CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE is not null 
    THEN
        FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
  --FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID) as INSURANCE_STATUS
--  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NULL THEN 'Not Applicable'
--   WHEN (ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL AND ROC_MAP.INSURANCE_APPLICABLE='Not Applicable' ) THEN 'Not Applicable' 
--   ELSE FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID) END INSURANCE_STATUS

   CASE WHEN   ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN 
 CASE WHEN ROC_MAP.INSURANCE_APPLICABLE ='Applicable' THEN FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID)
 ELSE 'Not Applicable' END 
 ELSE 'Not Applicable' END INSURANCE_STATUS

FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )
  )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  sci_le_cri  cri,
  CMS_ASSET_PLANT_EQUIP PLNT,
  CMS_ASSET AST
  ,(select system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master,
  (select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP

  WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID
AND PLNT.CMS_COLLATERAL_ID (+) = SEC.CMS_COLLATERAL_ID

AND AST.cms_collateral_id(+)    = SEC.CMS_COLLATERAL_ID
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
and SUB.SECURITY_SUB_TYPE_ID  in('AB101')
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_ASSET)
AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)
and (
        AST.PHY_INSPECTION_FREQ <> '-1' or
                                    AST.MANUFACTURE_YEAR <> 0 or
                                    AST.LAST_USED_ID_IDX_STOCK <> 0 or
                                    AST.LAST_USED_ID_IDX_FAO <> 0 or
                                    AST.LAST_USED_ID_IDX_INSR <> 0 or
                                    AST.RESIDUAL_ASSET_LIFE <> 0 or
                                    AST.DOC_PERFECT_AGE <> 0 or
                                    AST.REPOSSESSION_AGE <> 0
                                    or sec.cmv IS NOT NULL
)
AND SEC.COLLATERAL_CODE       = ROC_MAP.COLLATERAL_ROC_CODE(+)

group by
SEC.SECURITY_MATURITY_DATE ,
sec.cmv,
sec.sci_security_currency  ,
SEC.CMS_COLLATERAL_ID ,
XREF.FACILITY_SYSTEM ,
XREF.FACILITY_SYSTEM_ID  ,
XREF.LINE_NO   ,
XREF.SERIAL_NO,
SEC.CMS_COLLATERAL_ID,
sec.COLLATERAL_CODE,
PLNT.invoice_date  ,
PLNT.RAM_ID,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR ,
cri.FIRST_YEAR_TURNOVER ,
cri.SECOND_YEAR ,
cri.SECOND_YEAR_TURNOVER ,
cri.THIRD_YEAR ,
CRI.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
PF.llp_bca_ref_appr_date,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
BASEL_MASTER.SYSTEM_VALUE,
sec.change_type,
ROC_MAP.COLLATERAL_ROC_CODE,
ROC_MAP.INSURANCE_APPLICABLE,
pf.cms_customer_id
)


)

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS--,commented by ayyaz
        --INSURANCE commented by ayyaz
      )
      VALUES
      (
        DECODE(R1.D_F_MATURITY_DATE,null,v_application_date_basel,R1.D_F_MATURITY_DATE),
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.CLAIM,'Not Applicable') ,
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS--, commented by ayyaz
        --R1.INSURANCE  commented by ayyaz
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

-----------------vehical and specific asset ----------------
  FOR r1        IN
-------------------------------------------------new--------------------------------------------

(
-----------------vehical and specific asset ----------------

(

SELECT
(
  CASE
    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB109'
    THEN AIR.MATURITY_DATE
    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB102'
    THEN SEC.SECURITY_MATURITY_DATE
  END) AS D_F_MATURITY_DATE ,
  null   AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
  v_application_date_basel AS FIC_MIS_DATE ,
 TO_CHAR(sec.cmv,'999999999999999999999.999') AS N_F_MKT_MITIGANT_VALUE ,
  TO_CHAR(sec.cmv,'999999999999999999999999999999.999') AS GROSS_VALUE ,                          --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'
  null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data
  null AS N_F_RESIDUAL_MATURITY,
  null AS N_F_REVAL_FREQUENCY , -------no data
  sec.sci_security_currency ----CCY code coming from Security module
    AS V_F_CCY_CODE , ---changed
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
  TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || (
-- TO_CHAR (SEC.CMS_COLLATERAL_ID)--------15
--
-- ) AS V_F_MITIGANT_CODE,
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,

(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,
  TO_CHAR(sec.COLLATERAL_CODE)  AS V_F_MITIGANT_TYPE_CODE , ------changed
  NULL AS V_F_RATING_ID ,
--  CASE
--    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB109'
--    THEN AIR.START_DATE
--    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB102'
--    THEN VHCL.START_DATE
--  END
--  /*XREF.RELEASE_DATE*/
--  AS D_F_START_DATE,
  PF.llp_bca_ref_appr_date  AS D_F_START_DATE,
  null AS V_F_TPFD_CUST_ID ,
  null AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
  (
  CASE
    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB102'
    THEN TO_CHAR(VHCL.RAM_ID)
    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB109'
    THEN TO_CHAR(AIR.RAMID)

  END) AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
  null AS F_F_RATING_TYPE ,
  null AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code  
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT,    ------------Facility Sec/Primary Field
cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
cri.THIRD_YEAR AS THIRD_YEAR,
CRI.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
sec.change_type as claim,

case when ROC_MAP.COLLATERAL_ROC_CODE is not null then 'Applicable' else 'Not Applicable' end ROC,

  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE is not null
    THEN
        FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
  (
  CASE
    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB102'
    THEN 'Not Applicable'
    WHEN SUB.SECURITY_SUB_TYPE_ID = 'AB109'
    THEN  (
  --  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NULL THEN 'Not Applicable' ELSE FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID) END
  CASE WHEN   ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN 
 CASE WHEN ROC_MAP.INSURANCE_APPLICABLE ='Applicable' THEN FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID)
 ELSE 'Not Applicable' END 
 ELSE 'Not Applicable' END
    )

  END) as  INSURANCE_STATUS

FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )

    )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  sci_le_cri  cri,
  CMS_ASSET_AIRCRAFT AIR,
  CMS_ASSET_VEHICLE VHCL ,
  CMS_ASSET AST
,(select system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master,
(select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP

 WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID
AND AIR.CMS_COLLATERAL_ID (+)  = SEC.CMS_COLLATERAL_ID
AND VHCL.CMS_COLLATERAL_ID (+) = SEC.CMS_COLLATERAL_ID
AND AST.cms_collateral_id(+)    = SEC.CMS_COLLATERAL_ID
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
and SUB.SECURITY_SUB_TYPE_ID  in('AB102','AB109')
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_ASSET)

AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)
and (
                AST.PHY_INSPECTION_FREQ <>'-1' or
                AST.MANUFACTURE_YEAR <> 0 or
                AST.PHY_INSPECTION_DONE <> 'N' or
                AST.LAST_USED_ID_IDX_STOCK <> 0 or
                AST.LAST_USED_ID_IDX_FAO <> 0 or
                AST.LAST_USED_ID_IDX_INSR <> 0 or
                AST.RESIDUAL_ASSET_LIFE <> 0 or
                AST.DOC_PERFECT_AGE <> 0 or
                AST.REPOSSESSION_AGE <> 0
                OR sec.cmv IS NOT NULL
)
AND SEC.COLLATERAL_CODE       = ROC_MAP.COLLATERAL_ROC_CODE(+)

group by
SUB.SECURITY_SUB_TYPE_ID,
AIR.MATURITY_DATE,
SEC.SECURITY_MATURITY_DATE,
sec.cmv,
sec.sci_security_currency ,
SEC.CMS_COLLATERAL_ID,
XREF.FACILITY_SYSTEM,
XREF.FACILITY_SYSTEM_ID ,
XREF.LINE_NO ,
XREF.SERIAL_NO,
sec.COLLATERAL_CODE,
AIR.START_DATE,
VHCL.START_DATE,
VHCL.RAM_ID,
AIR.RAMID,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER ,
cri.SECOND_YEAR ,
cri.SECOND_YEAR_TURNOVER ,
cri.THIRD_YEAR ,
CRI.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
PF.llp_bca_ref_appr_date,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
BASEL_MASTER.SYSTEM_VALUE,
sec.change_type,
ROC_MAP.COLLATERAL_ROC_CODE,
ROC_MAP.INSURANCE_APPLICABLE,
pf.cms_customer_id
)
)

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS--, commented by ayyaz
        --INSURANCE commented by ayyaz

      )
      VALUES
      (
        DECODE(R1.D_F_MATURITY_DATE,null,v_application_date_basel,R1.D_F_MATURITY_DATE),
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.CLAIM,'Not Applicable')  ,
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS--, commented by ayyaz
        --R1.INSURANCE commented by ayyaz
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

--------- Insurance Null control --------
  FOR r1        IN
-------------------------------------------------new--------------------------------------------

(

--------- Insurance Null control --------

(SELECT
INS.expiry_date AS D_F_MATURITY_DATE ,
null    AS D_F_VALUE_DATE,
  NULL    AS F_F_AGREEMENT_FLAG,
  v_application_date_basel AS FIC_MIS_DATE ,
TO_CHAR(sec.cmv,'999999999999999999999.999') AS N_F_MKT_MITIGANT_VALUE ,
TO_CHAR(sec.cmv,'999999999999999999999999999999.999')  AS GROSS_VALUE ,                         --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'
null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
''   AS N_F_REMARGIN_FREQUENCY, ------no data
null AS N_F_RESIDUAL_MATURITY,
null AS N_F_REVAL_FREQUENCY , -------no data
sec.sci_security_currency ----CCY code coming from Security module
     AS V_F_CCY_CODE , ---changed
  'INDIA' AS V_F_COUNTRY_ID,
  NULL    AS V_F_CREDIT_RATING ,
  NULL    AS V_F_ISSUER_CODE ,
  TO_CHAR (SEC.CMS_COLLATERAL_ID)  AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || (TO_CHAR (SEC.CMS_COLLATERAL_ID)--------15
--
--  ) AS V_F_MITIGANT_CODE,
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,
  (
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,

  TO_CHAR(sec.COLLATERAL_CODE)  AS V_F_MITIGANT_TYPE_CODE , ------changed
  NULL AS V_F_RATING_ID ,
  INS.EFFECTIVE_DATE  AS D_F_START_DATE,
  null AS V_F_TPFD_CUST_ID ,
  null AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY ,
  null AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
  null AS F_F_RATING_TYPE ,
  NULL AS F_F_RECOURSE_AVAILABLE ,
  (SELECT G.party_group_code  
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
  /*SCI.PURPOSE*/
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT,    ------------Facility Sec/Primary Field
cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
CRI.THIRD_YEAR AS THIRD_YEAR,
CRI.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
sec.change_type as claim,

case when ROC_MAP.COLLATERAL_ROC_CODE is not null then 'Applicable' else 'Not Applicable' end ROC,

  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE is not null
    THEN
        FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

 CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
 'Not Applicable' as INSURANCE_STATUS
FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )

    )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  sci_le_cri  cri,

  CMS_INSURANCE INS
,(select system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master,

(select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP

 WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID
AND INS.CMS_COLLATERAL_ID (+)  = SEC.CMS_COLLATERAL_ID
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
and SUB.SECURITY_SUB_TYPE_ID = 'IN501'
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_INSURANCE)
--AND SEC.CMS_COLLATERAL_ID IN (20120112000002225,20120119000002285,20120107000002150)-- 20120208000002368
AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)
and (
            INS.BANK_RISK_CONFIRMATION <>'N' or
            INS.BANK_INT_NOTED <> 'N'or
            INS.INSURED_AMOUNT <> 0 or
            INS.INSURANCE_PREMIUM <> 0
            OR INS.POLICY_NO IS NOT NULL
            OR sec.cmv IS NOT NULL

            )


AND SEC.COLLATERAL_CODE       = ROC_MAP.COLLATERAL_ROC_CODE(+)

group by
INS.expiry_date ,
sec.cmv,
sec.sci_security_currency ,
SEC.CMS_COLLATERAL_ID,
XREF.FACILITY_SYSTEM ,
XREF.FACILITY_SYSTEM_ID   ,
XREF.LINE_NO    ,
XREF.SERIAL_NO ,
SEC.CMS_COLLATERAL_ID,
sec.COLLATERAL_CODE,
INS.EFFECTIVE_DATE ,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER ,
cri.SECOND_YEAR ,
cri.SECOND_YEAR_TURNOVER ,
cri.THIRD_YEAR ,
CRI.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
BASEL_MASTER.SYSTEM_VALUE,
sec.change_type ,
ROC_MAP.COLLATERAL_ROC_CODE,
ROC_MAP.INSURANCE_APPLICABLE,
pf.cms_customer_id
 )
)

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS--,commented by ayyaz
        --INSURANCE commented by ayyaz

      )
      VALUES
      (
        DECODE(R1.D_F_MATURITY_DATE,null,v_application_date_basel,R1.D_F_MATURITY_DATE),
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.CLAIM,'Not Applicable')  ,
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS--, commented by ayyaz
        --R1.INSURANCE commented by ayyaz
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

--------- PDC security migreted pri control  --------

 FOR r1        IN
-------------------------------------------------new--------------------------------------------

(

--------- PDC security migreted pri control  --------

(
SELECT
PDC.MATURITY_DATE AS D_F_MATURITY_DATE ,
null    AS D_F_VALUE_DATE,
NULL    AS F_F_AGREEMENT_FLAG,
v_application_date_basel AS FIC_MIS_DATE ,
--sysdate AS FIC_MIS_DATE ,
TO_CHAR(sec.cmv,'999999999999999999999.999') AS N_F_MKT_MITIGANT_VALUE ,
TO_CHAR(sec.cmv,'999999999999999999999999999999.999')  AS GROSS_VALUE ,                         --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT'
null AS N_F_ORIGINAL_MATURITY , -----Differece in Months
''   AS N_F_REMARGIN_FREQUENCY, ------no data
null AS N_F_RESIDUAL_MATURITY,
null AS N_F_REVAL_FREQUENCY , -------no data
sec.sci_security_currency AS V_F_CCY_CODE , ---changed
'INDIA' AS V_F_COUNTRY_ID,
NULL    AS V_F_CREDIT_RATING ,
NULL    AS V_F_ISSUER_CODE ,
TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS ,
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND ,
  XREF.LINE_NO              AS V_F_LINE_CODE ,
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL ,
  -----21 = 22+15----
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS'
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS'
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END )  ----22
--  || (
-- TO_CHAR (SEC.CMS_COLLATERAL_ID)--------15
--
--) AS V_F_MITIGANT_CODE,
(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
  || TO_CHAR (SEC.CMS_COLLATERAL_ID) AS V_F_MITIGANT_CODE ,
--  (
--  CASE
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno
--    THEN 'UBS'
--      ||XREF.FACILITY_SYSTEM_ID
--      ||XREF.LINE_NO
--      ||XREF.SERIAL_NO
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid
--    THEN 'FW'
--      ||XREF.FACILITY_SYSTEM_ID
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid
--    THEN 'FN'
--      ||XREF.FACILITY_SYSTEM_ID
--  END ) AS V_F_MAP_ID ,
  (
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,

TO_CHAR(sec.COLLATERAL_CODE)  AS V_F_MITIGANT_TYPE_CODE , ------changed
NULL AS V_F_RATING_ID ,
PDC.START_DATE AS D_F_START_DATE,
null AS V_F_TPFD_CUST_ID ,
null AS F_F_PROPERTY_TYPE ,
''  AS V_F_RATING_AGENCY ,
TO_CHAR(PDC.RAM_ID) AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED
null AS F_F_RATING_TYPE ,
NULL AS F_F_RECOURSE_AVAILABLE ,
(SELECT G.party_group_code  
  FROM cms_party_group g
  WHERE g.id = spro.PARTY_GRP_NM
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code)
'' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed
  (
  CASE
    WHEN SEC.SEC_PRIORITY= 'Y'
    THEN 'P'
    WHEN SEC.SEC_PRIORITY= 'N'
    THEN 'S'
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT,    ------------Facility Sec/Primary Field
cri.FIRST_YEAR AS FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER,
cri.SECOND_YEAR AS SECOND_YEAR,
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER,
cri.THIRD_YEAR AS THIRD_YEAR,
CRI.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER,
cri.CUSTOMER_RAM_ID as RAM_ID,
''  AS TYPE_OF_CHARGE,

case when ROC_MAP.COLLATERAL_ROC_CODE is not null then 'Applicable' else 'Not Applicable' end ROC,

CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE is not null
    THEN
       FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

  CASE WHEN ROC_MAP.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
  'Not Applicable' as INSURANCE_STATUS
FROM CMS_SECURITY SEC,
  CMS_SECURITY_SUB_TYPE SUB,
  SECURITY_TYPE TYP,
  SCI_LSP_APPR_LMTS SCI,
  SCI_LSP_SYS_XREF XREF,
  --SCI_LSP_LMTS_XREF_MAP MAPSS,
  CMS_LIMIT_SECURITY_MAP MAPS,
  (SELECT *
  FROM SCI_LSP_LMTS_XREF_MAP
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID)
    FROM SCI_LSP_LMTS_XREF_MAP
    WHERE CMS_LSP_APPR_LMTS_ID IN
      (SELECT CMS_LSP_APPR_LMTS_ID
      FROM SCI_LSP_LMTS_XREF_MAP
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID
      )

    )
  ) MAPSS,
  SCI_LSP_LMT_PROFILE PF,
  SCI_LE_SUB_PROFILE SPRO ,
  SCI_LE_MAIN_PROFILE MAN,
  sci_le_cri  cri,
  CMS_ASSET_PDC PDC ,
  CMS_ASSET AST
  ,(select system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master,
  (select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP

WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID
AND cri.cms_le_main_profile_id (+)= MAN.CMS_LE_MAIN_PROFILE_ID
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID
AND PDC.CMS_COLLATERAL_ID (+)  = SEC.CMS_COLLATERAL_ID
AND AST.cms_collateral_id(+)    = SEC.CMS_COLLATERAL_ID
AND spro.status               = 'ACTIVE'
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS')
and basel_master.system= XREF.FACILITY_SYSTEM
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL')
and SUB.SECURITY_SUB_TYPE_ID  in('AB108')
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_ASSET)
AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL)
and(
        AST.LAST_USED_ID_IDX_STOCK <> 0 or
                                    AST.LAST_USED_ID_IDX_FAO <> 0 or
                                    AST.LAST_USED_ID_IDX_INSR <> 0 or
                                    AST.INTEREST_RATE <> 0
                                    OR sec.cmv IS NOT NULL
)

AND SEC.COLLATERAL_CODE       = ROC_MAP.COLLATERAL_ROC_CODE(+)

group by
PDC.MATURITY_DATE ,
sec.cmv,
sec.sci_security_currency ,
SEC.CMS_COLLATERAL_ID,
XREF.FACILITY_SYSTEM ,
XREF.FACILITY_SYSTEM_ID   ,
XREF.LINE_NO            ,
XREF.SERIAL_NO,
SEC.CMS_COLLATERAL_ID,
sec.COLLATERAL_CODE,
PDC.START_DATE ,
PDC.RAM_ID,
spro.PARTY_GRP_NM ,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR,
cri.FIRST_YEAR_TURNOVER ,
cri.SECOND_YEAR ,
cri.SECOND_YEAR_TURNOVER ,
cri.THIRD_YEAR ,
CRI.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
BASEL_MASTER.SYSTEM_VALUE,
ROC_MAP.COLLATERAL_ROC_CODE,
ROC_MAP.INSURANCE_APPLICABLE,
pf.cms_customer_id
)
)

  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS--, commented by ayyaz
        --INSURANCE commented by ayyaz
      )
      VALUES
      (
        DECODE(R1.D_F_MATURITY_DATE,null,v_application_date_basel,R1.D_F_MATURITY_DATE),
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.TYPE_OF_CHARGE,'Not Applicable') ,
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS--, commented by ayyaz
        --R1.INSURANCE commented by ayyaz
      );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

---------- GC Null control -----------

FOR r1        IN
-------------------------------------------------new--------------------------------------------
(SELECT 
---------- GC Null control ----------- 
 maturity_date AS D_F_MATURITY_DATE , 
   MAX(det.due_date)    AS D_F_VALUE_DATE, 
  NULL    AS F_F_AGREEMENT_FLAG, 
  v_application_date_basel AS FIC_MIS_DATE , 
  --sysdate AS FIC_MIS_DATE , 
  TO_CHAR(((GC.COMPONENT_AMOUNT) * NVL(SPRO.FUNDED_SHARE_PERCENT,0)/100),'999999999999999999999999999999.999')   AS N_F_MKT_MITIGANT_VALUE , 
  TO_CHAR(((GC.COMPONENT_AMOUNT) * NVL(SPRO.FUNDED_SHARE_PERCENT,0)/100),'999999999999999999999999999999.999')  AS GROSS_VALUE ,                                    --------GROSS_VALUE IS SAME AS FOR N_F_MKT_MITIGANT_VALUE EXCEPT FOR 'GT' 
  null AS N_F_ORIGINAL_MATURITY , -----Differece in Months 
  ''   AS N_F_REMARGIN_FREQUENCY, ------no data 
  null AS N_F_RESIDUAL_MATURITY, 
  30 AS N_F_REVAL_FREQUENCY , -------no data 
  'INR'    AS V_F_CCY_CODE , ---changed 
  'INDIA' AS V_F_COUNTRY_ID, 
  NULL    AS V_F_CREDIT_RATING , 
  NULL    AS V_F_ISSUER_CODE , 
   TO_CHAR(SEC.CMS_COLLATERAL_ID) 
    || (SELECT substr(TRY.ENTRY_ID, 11, length(TRY.ENTRY_ID))   FROM COMMON_CODE_CATEGORY_ENTRY TRY 
      WHERE   try.ENTRY_CODE    = TO_CHAR(GC.COMPONENT) and try.category_code = 'CURRENT_ASSET' 
      ) ------newly added_06_feb 
     AS V_F_SECURITY_ID ,                   -----COLUMN NO - 15 
--  ( 
--  CASE 
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS' 
--    THEN 'UBS' 
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS' 
--    THEN 'FW' 
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--    THEN 'FN' 
--  END )                     AS V_F_EXP_SOURCE_SYS ,           --------HARD CODED 
basel_master.EXPOSURE_SOURCE  AS V_F_EXP_SOURCE_SYS ,
  'LSS'                     AS V_F_MITIGANT_SOURCE_SYS , 
  XREF.FACILITY_SYSTEM_ID   AS V_F_SYSTEM_EXP_IND , 
  XREF.LINE_NO              AS V_F_LINE_CODE , 
  to_number(XREF.SERIAL_NO) AS N_F_LINE_SERIAL , 
  -----21 = 22+15---- 
--  ( 
--  CASE 
--    WHEN XREF.FACILITY_SYSTEM = 'UBS-LIMITS' 
--    THEN 'UBS' 
--      ||XREF.FACILITY_SYSTEM_ID 
--      ||XREF.LINE_NO 
--      ||XREF.SERIAL_NO 
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS' 
--    THEN 'FW' 
--      ||XREF.FACILITY_SYSTEM_ID 
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--    THEN 'FN' 
--      ||XREF.FACILITY_SYSTEM_ID 
--  END )  ----22 
--  || ( 
--  
--    TO_CHAR(SEC.CMS_COLLATERAL_ID) 
--    || --TO_CHAR(GC.COMPONENT) 
--    (SELECT substr(TRY.ENTRY_ID, 11, length(TRY.ENTRY_ID)) 
--      FROM COMMON_CODE_CATEGORY_ENTRY TRY 
--      WHERE 
--      try.ENTRY_CODE    = TO_CHAR(GC.COMPONENT) and try.category_code = 'CURRENT_ASSET' 
--      ) ------newly added_06_feb 
-- ) AS V_F_MITIGANT_CODE, 

 (
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end) 
 || ( 

    TO_CHAR(SEC.CMS_COLLATERAL_ID) 
    || --TO_CHAR(GC.COMPONENT) 
    (SELECT substr(TRY.ENTRY_ID, 11, length(TRY.ENTRY_ID)) 
      FROM COMMON_CODE_CATEGORY_ENTRY TRY 
      WHERE 
      try.ENTRY_CODE    = TO_CHAR(GC.COMPONENT) and try.category_code = 'CURRENT_ASSET' 
      ) ------newly added_06_feb 
 )
 AS V_F_MITIGANT_CODE ,


--  ( 
--  CASE 
--    WHEN XREF.FACILITY_SYSTEM ='UBS-LIMITS'  ----------'UBS' + a.systemid + f.creditlineno + a.creditsrno 
--    THEN 'UBS' 
--      ||XREF.FACILITY_SYSTEM_ID 
--      ||XREF.LINE_NO 
--      ||XREF.SERIAL_NO 
--    WHEN XREF.FACILITY_SYSTEM = 'FW-LIMITS'----------------'FW' + a.systemid 
--    THEN 'FW' 
--      ||XREF.FACILITY_SYSTEM_ID 
--    WHEN XREF.FACILITY_SYSTEM = 'FINNESS' 
--------------------'FN' + a.systemid 
--    THEN 'FN' 
--      ||XREF.FACILITY_SYSTEM_ID 
--  END ) AS V_F_MAP_ID , 

(
 case 
 when basel_master.BASEL_VALIDATION = 'L' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID|| XREF.LINE_NO|| XREF.SERIAL_NO
 when basel_master.BASEL_VALIDATION = 'A' then
 basel_master.SYSTEM_VALUE || XREF.FACILITY_SYSTEM_ID
 end)  AS V_F_MAP_ID ,

  GC.COMPONENT   AS V_F_MITIGANT_TYPE_CODE , ------changed 

  NULL AS V_F_RATING_ID , 
  --XREF.RELEASE_DATE AS D_F_START_DATE,
  (case when gc.debtors = 'Y'
  then DET.due_date - GC.age
  else PF.llp_bca_ref_appr_date
  end ) as D_F_START_DATE,  
  NULL                     AS V_F_TPFD_CUST_ID ,
  NULL                     AS F_F_PROPERTY_TYPE ,
  ''  AS V_F_RATING_AGENCY , 
  null AS V_F_GURANTOR_RAM_ID , -----GOLD TO BE ADDED 
  null AS F_F_RATING_TYPE , 
  NULL AS F_F_RECOURSE_AVAILABLE , 
  (SELECT G.party_group_code   
  FROM cms_party_group g 
  WHERE g.id = spro.PARTY_GRP_NM 
  ) AS V_F_LSSEXTAG_PARTY_GROUP_ID, ----------------ptygroupid from Party Master(Party Group Code) 
  /*SCI.PURPOSE*/ 
  '' AS V_F_LSSEXTAG_LOAN_PURPOSE, ---changed 
  ( 
  CASE 
    WHEN SEC.SEC_PRIORITY= 'Y' 
    THEN 'P' 
    WHEN SEC.SEC_PRIORITY= 'N' 
    THEN 'S' 
  END) AS F_F_LSSEXTAG_PRIMSEC_COLL_STAT,    ------------Facility Sec/Primary Field 
cri.FIRST_YEAR AS FIRST_YEAR, 
cri.FIRST_YEAR_TURNOVER AS 
FIRST_YEAR_TURNOVER, 
cri.SECOND_YEAR AS SECOND_YEAR, 
cri.SECOND_YEAR_TURNOVER AS 
SECOND_YEAR_TURNOVER, 
cri.THIRD_YEAR AS THIRD_YEAR, 
CRI.THIRD_YEAR_TURNOVER AS 
THIRD_YEAR_TURNOVER, 
  cri.CUSTOMER_RAM_ID      AS RAM_ID,
  GC.COMPONENT,
--  CASE WHEN 
--  (SELECT COUNT(1) FROM CMS_COLLATERAL_ROC_MAP WHERE COLLATERAL_ROC_CODE=GC.COMPONENT THEN 'APPLICABLE' ELSE 'NOT APPLICABLE') AS V_ROC,
--    SEC.TYPE_OF_CHARGE AS CLAIM ,
sec.type_of_charge as claim,

   CASE
                WHEN  
--                ROC_MAP_COMP.COLLATERAL_ROC_CODE IS NOT NULL AND 
                ROC_MAP_COL.COLLATERAL_ROC_CODE is not null

                THEN 
                    'Applicable'  
                ELSE
                   'Not Applicable'
    END
                AS ROC,

    CASE WHEN 
--    ROC_MAP_COMP.COLLATERAL_ROC_CODE IS NOT NULL AND 
    ROC_MAP_COL.COLLATERAL_ROC_CODE is not null
    THEN
        FUN_ROC_STATUS(pf.cms_customer_id)
    ELSE 'Not Applicable'
    END
    AS ROC_STATUS,

  CASE WHEN ROC_MAP_COL.COLLATERAL_ROC_CODE IS NOT NULL THEN ROC_MAP_COL.INSURANCE_APPLICABLE ELSE 'Not Applicable' END INSURANCE,
 --  FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID) AS INSURANCE_STATUS
 --  CASE WHEN ROC_MAP_COL.COLLATERAL_ROC_CODE IS NULL THEN 'Not Applicable' ELSE FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID) END  INSURANCE_STATUS
  CASE WHEN   ROC_MAP_COL.COLLATERAL_ROC_CODE IS NOT NULL THEN 
 CASE WHEN ROC_MAP_COL.INSURANCE_APPLICABLE ='Applicable' THEN FUN_INSURANCE_STATUS(SEC.CMS_COLLATERAL_ID)
 ELSE 'Not Applicable' END 
 ELSE 'Not Applicable' END INSURANCE_STATUS

FROM (select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COMPONENT' and deprecated = 'N') ROC_MAP_COL,
--(select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COLLATERAL' and deprecated = 'N') ROC_MAP_COL,
-- (select * from CMS_COLLATERAL_ROC_MAP where COLLATERAL_CATEGORY='COMPONENT')ROC_MAP_COMP,
CMS_SECURITY SEC, 
  CMS_SECURITY_SUB_TYPE SUB, 
  SECURITY_TYPE TYP, 
  SCI_LSP_APPR_LMTS SCI, 
  SCI_LSP_SYS_XREF XREF, 
  --SCI_LSP_LMTS_XREF_MAP MAPSS, 
  CMS_LIMIT_SECURITY_MAP MAPS, 
  (SELECT * 
  FROM SCI_LSP_LMTS_XREF_MAP 
  WHERE CMS_LSP_LMTS_XREF_MAP_ID IN 
    (SELECT (CMS_LSP_LMTS_XREF_MAP_ID) 
    FROM SCI_LSP_LMTS_XREF_MAP 
    WHERE CMS_LSP_APPR_LMTS_ID IN 
      (SELECT CMS_LSP_APPR_LMTS_ID 
      FROM SCI_LSP_LMTS_XREF_MAP 
      GROUP BY CMS_LSP_APPR_LMTS_ID,CMS_LSP_LMTS_XREF_MAP_ID 
      ) 

    ) 
  ) MAPSS, 
  SCI_LSP_LMT_PROFILE PF, 
  SCI_LE_SUB_PROFILE SPRO , 
  SCI_LE_MAIN_PROFILE MAN, 
  sci_le_cri  cri, 
  (SELECT * FROM CMS_ASSET_GC_STOCK_DET gc1 ,CMS_COMPONENT cm
WHERE gc1.STOCK_TYPE = 'CurrentAsset'
and cm.component_type = 'Current_Asset'
and cm.component_code = gc1.component
and cm.status= 'ACTIVE'
and (( cm.debtors = 'Y' and cm.age < 365) or 
(cm.debtors = 'N'))
  ) GC,
  CMS_ASSET_GC_DET DET, 
  CMS_ASSET AST ,
--  CMS_COMPONENT cm,
  (select system,system_value,exposure_source,basel_validation from CMS_BASEL_MASTER where deprecated = 'N' and status = 'ACTIVE' and reported_handoff = 'Y') basel_master
 WHERE SEC.SECURITY_SUB_TYPE_ID  = SUB.SECURITY_SUB_TYPE_ID 
AND SUB.SECURITY_TYPE_ID        = TYP.SECURITY_TYPE_ID 
AND SEC.CMS_COLLATERAL_ID       = MAPS.CMS_COLLATERAL_ID 
AND MAPS.CMS_LSP_APPR_LMTS_ID   = SCI.CMS_LSP_APPR_LMTS_ID 
AND SCI.CMS_LIMIT_PROFILE_ID    = PF.CMS_LSP_LMT_PROFILE_ID 
AND PF.CMS_CUSTOMER_ID          = Spro.CMS_LE_SUB_PROFILE_ID 
AND SPRO.CMS_LE_MAIN_PROFILE_ID = MAN.CMS_LE_MAIN_PROFILE_ID 
AND cri.cms_le_main_profile_id(+) = MAN.CMS_LE_MAIN_PROFILE_ID 
AND SCI.CMS_LSP_APPR_LMTS_ID    = MAPSS.CMS_LSP_APPR_LMTS_ID 
AND MAPSS.CMS_LSP_SYS_XREF_ID   = XREF.CMS_LSP_SYS_XREF_ID 
AND GC.GC_DET_ID (+)            = DET.GC_DET_ID 
AND SEC.CMS_COLLATERAL_ID       = det.cms_collateral_id(+) 
AND AST.cms_collateral_id(+)    = SEC.CMS_COLLATERAL_ID 
AND spro.status               = 'ACTIVE' 
--and XREF.FACILITY_SYSTEM in ('UBS-LIMITS','FW-LIMITS','FINNESS') 
and basel_master.system= XREF.FACILITY_SYSTEM
AND det.due_date  = (SELECT MAX(sh.due_date) FROM cms_asset_gc_det sh WHERE sh.cms_collateral_id=DET.cms_collateral_id) 
--and XREF.FACILITY_SYSTEM in ('UBSL','Finware','FWL') 
AND SUB.security_sub_type_id = 'AB100' 
 and component not like 'DUMMY%' 
and sec.cms_collateral_id in (select CMS_COLLATERAL_ID from CMS_ASSET) 
 AND (MAPS.update_status_ind <> 'D' OR MAPS.update_status_ind IS NULL) 
 and ( 
 AST.PHY_INSPECTION_FREQ <> '0' or 
              AST.PHY_INSPECTION_DONE <> 'N' or 
              AST.LAST_USED_ID_IDX_STOCK <> 0 or 
              AST.LAST_USED_ID_IDX_FAO <> 0 or 
              AST.LAST_USED_ID_IDX_INSR <> 0 
              OR GC.COMPONENT IS NOT NULL 
 ) 

 --AND SEC.COLLATERAL_CODE       = ROC_MAP_COL.COLLATERAL_ROC_CODE(+)
  AND GC.COMPONENT       = ROC_MAP_COL.COLLATERAL_ROC_CODE(+)
-- and cm.component_code         = ROC_MAP_COMP.COLLATERAL_ROC_CODE


 GROUP BY det.due_date ,
GC.COMPONENT_AMOUNT,
SPRO.FUNDED_SHARE_PERCENT,
SEC.CMS_COLLATERAL_ID,
GC.COMPONENT,
XREF.FACILITY_SYSTEM,
XREF.FACILITY_SYSTEM_ID   ,
XREF.LINE_NO              ,
XREF.SERIAL_NO ,
XREF.RELEASE_DATE ,
spro.PARTY_GRP_NM,
SEC.SEC_PRIORITY,
cri.FIRST_YEAR ,
cri.FIRST_YEAR_TURNOVER ,
cri.SECOND_YEAR ,
cri.SECOND_YEAR_TURNOVER ,
cri.THIRD_YEAR ,
CRI.THIRD_YEAR_TURNOVER ,
cri.CUSTOMER_RAM_ID,
gc.age,
PF.llp_bca_ref_appr_date,
basel_master.EXPOSURE_SOURCE,
basel_master.BASEL_VALIDATION,
basel_master.SYSTEM_VALUE,
gc.debtors,
SEC.TYPE_OF_CHARGE,
--cm.COMPONENT_CODE,
SEC.COLLATERAL_CODE,
--ROC_MAP_COMP.COLLATERAL_ROC_CODE,
ROC_MAP_COL.COLLATERAL_ROC_CODE,
ROC_MAP_COL.INSURANCE_APPLICABLE,
pf.cms_customer_id
)



  LOOP

    INSERT
    INTO cms_basel_monthly_P2
      (
        D_F_MATURITY_DATE,
        GROSS_VALUE,
        D_F_VALUE_DATE,
        F_F_AGREEMENT_FLAG,
        FIC_MIS_DATE,
        N_F_MKT_MITIGANT_VALUE,
        N_F_ORIGINAL_MATURITY,
        N_F_REMARGIN_FREQUENCY,
        N_F_RESIDUAL_MATURITY,
        N_F_REVAL_FREQUENCY,
        V_F_CCY_CODE,
        V_F_COUNTRY_ID,
        V_F_CREDIT_RATING,
        V_F_ISSUER_CODE,
        V_F_SECURITY_ID,
        V_F_EXP_SOURCE_SYS,
        V_F_MITIGANT_SOURCE_SYS,
        V_F_SYSTEM_EXP_IND,
        V_F_LINE_CODE,
        N_F_LINE_SERIAL,
        V_F_MITIGANT_CODE,
        V_F_MAP_ID,
        V_F_MITIGANT_TYPE_CODE ,
        V_F_RATING_ID,
        D_F_START_DATE,
        V_F_TPFD_CUST_ID,
        F_F_PROPERTY_TYPE,
        V_F_RATING_AGENCY,
        V_F_GURANTOR_RAM_ID,
        F_F_RATING_TYPE,
        F_F_RECOURSE_AVAILABLE,
        V_F_LSSEXTAG_PARTY_GROUP_ID,
        V_F_LSSEXTAG_LOAN_PURPOSE,
        F_F_LSSEXTAG_PRIMSEC_COLL_STAT,
        FIRST_YEAR,
        FIRST_YEAR_TURNOVER,
        SECOND_YEAR,
        SECOND_YEAR_TURNOVER,
        THIRD_YEAR,
        THIRD_YEAR_TURNOVER,
        RAM_ID,
        CLAIM,
        ROC,
        ROC_STATUS,
        INSURANCE,
        INSURANCE_STATUS--, commented by ayyaz
        --INSURANCE commented by ayyaz
      )
      VALUES
      (
        NULL,
        R1.GROSS_VALUE,
        R1.D_F_VALUE_DATE,
        R1.F_F_AGREEMENT_FLAG,
        R1.FIC_MIS_DATE,
        R1.N_F_MKT_MITIGANT_VALUE,
        R1.N_F_ORIGINAL_MATURITY,
        R1.N_F_REMARGIN_FREQUENCY,
        R1.N_F_RESIDUAL_MATURITY,
        R1.N_F_REVAL_FREQUENCY,
        R1.V_F_CCY_CODE,
        R1.V_F_COUNTRY_ID,
        R1.V_F_CREDIT_RATING,
        R1.V_F_ISSUER_CODE,
        R1.V_F_SECURITY_ID,
        R1.V_F_EXP_SOURCE_SYS,
        R1.V_F_MITIGANT_SOURCE_SYS,
        R1.V_F_SYSTEM_EXP_IND,
        R1.V_F_LINE_CODE,
        R1.N_F_LINE_SERIAL,
        R1.V_F_MITIGANT_CODE,
        R1.V_F_MAP_ID,
        R1.V_F_MITIGANT_TYPE_CODE ,
        R1.V_F_RATING_ID,
        R1.D_F_START_DATE,
        R1.V_F_TPFD_CUST_ID,
        R1.F_F_PROPERTY_TYPE,
        R1.V_F_RATING_AGENCY,
        R1.V_F_GURANTOR_RAM_ID,
        R1.F_F_RATING_TYPE,
        R1.F_F_RECOURSE_AVAILABLE,
        R1.V_F_LSSEXTAG_PARTY_GROUP_ID,
        R1.V_F_LSSEXTAG_LOAN_PURPOSE,
        R1.F_F_LSSEXTAG_PRIMSEC_COLL_STAT ,
        R1.FIRST_YEAR,
        R1.FIRST_YEAR_TURNOVER,
        R1.SECOND_YEAR,
        R1.SECOND_YEAR_TURNOVER,
        R1.THIRD_YEAR,
        R1.THIRD_YEAR_TURNOVER,
        r1.ram_id,
        nvl(R1.CLAIM,'Not Applicable')  ,
        R1.ROC,
        R1.ROC_STATUS,
        R1.INSURANCE,
        R1.INSURANCE_STATUS--, commented by ayyaz
        --R1.INSURANCE commented by ayyaz
    );
  --  dbms_output.Put_line
   -- (      'Executed Insert'    )    ;
    N_NOOFRECORDS := N_NOOFRECORDS+1;
    V_STATUSFLAG  := '1';
    --dbms_output.Put_line
    --(      '2'    )    ;
    N_CUR_CHECKSUM_COLUMN_VALUE := 0;
    --V_Native_SQL :=  'select  R1.' || V_CHECKSUM_COLUMN_NAME || ' into N_CUR_CHECKSUM_COLUMN_VALUE from DUAL';
    --execute immediate V_Native_SQL;
   -- dbms_output.Put_line
    --(      '3'    )    ;
  -- dbms_output.put_line('N_F_MKT_MITIGANT_VALUE' || to_char(r1.N_F_MKT_MITIGANT_VALUE));
   N_CUR_CHECKSUM_COLUMN_VALUE:=  CASE
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_RESIDUAL_MATURITY'  THEN      NVL(R1.N_F_RESIDUAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_ORIGINAL_MATURITY'  THEN      NVL(R1.N_F_ORIGINAL_MATURITY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_LINE_SERIAL'        THEN      NVL(R1.N_F_LINE_SERIAL,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_MKT_MITIGANT_VALUE' THEN      NVL(R1.N_F_MKT_MITIGANT_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'GROSS_VALUE'            THEN      NVL(R1.GROSS_VALUE,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REMARGIN_FREQUENCY' THEN      NVL(R1.N_F_REMARGIN_FREQUENCY,0)
                                    WHEN upper(V_CHECKSUM_COLUMN_NAME) = 'N_F_REVAL_FREQUENCY'    THEN      NVL(R1.N_F_REVAL_FREQUENCY,0)
                                    else 0
                                  END;
 --dbms_output.put_line('N_CUR_CHECKSUM_COLUMN_VALUE' || to_char(N_CUR_CHECKSUM_COLUMN_VALUE));

   N_TOT_CHECKSUM_COLUMN_VALUE := N_TOT_CHECKSUM_COLUMN_VALUE + N_CUR_CHECKSUM_COLUMN_VALUE;
  -- dbms_output.put_line('N_TOT_CHECKSUM_COLUMN_VALUE' || to_char(N_TOT_CHECKSUM_COLUMN_VALUE));
COMMIT;
  END LOOP;

  UPDATE CMS_BASEL_MONTHLY_P2 SET V_F_LSSEXTAG_PARTY_GROUP_ID = NULL 
  WHERE V_F_LSSEXTAG_PARTY_GROUP_ID IN(select party_group_code from cms_party_group where party_group_name in('001 Not Applicable','Not Applicable'));
  COMMIT;


  SELECT TO_DATE(PARAM_VALUE,'dd-mON-YYYY')
  INTO D_EXTRACTDATE
  FROM CMS_GENERAL_PARAM
  WHERE UPPER(PARAM_CODE) = 'APPLICATION_DATE';
  --dbms_output.Put_line('out of loop');
 -- D_PROCESSENDTIME:= SYSDATE;
 -- D_RUNDATE := SYSDATE;

  INSERT
  INTO DWH_CONTROL_P2
  (
  EXTRACTNAME,
  PROCESSTARTTIME,
  PROCESSENDTIME,
  NOOFRECORDS,
  STATUSFLAG,
  EXTRACTDATE,
  RUNDATE ,
  CHECKSUM_COLUMN_NAME,
  CHECKSUM_COLUMN_VALUE
  )
  VALUES
  (
  V_EXTRACTNAME ,
  D_PROCESSTARTTIME,
  D_PROCESSENDTIME,
  N_NOOFRECORDS,
  V_STATUSFLAG,
  D_EXTRACTDATE ,
  D_RUNDATE ,
  V_CHECKSUM_COLUMN_NAME,
  N_TOT_CHECKSUM_COLUMN_VALUE
  );
  update cms_general_param set  PARAM_VALUE = V_APPLICATION_DATE_BASEL , ACTIVITY_PERFORMED = null where param_code= 'BASEL_UPDATE_BILLS_COL';
  commit;
END SP_CMS_BASEL_MONTHLY_P2;
