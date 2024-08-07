--------------------------------------------------------
--  File created - Monday-March-28-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function ADD_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADD_DATE" (v_date DATE, unit NUMBER ,frequency VARCHAR)
RETURN DATE   is
RESULT DATE;
BEGIN 
    IF frequency = '1'  THEN 
            RESULT := (v_date + unit );--
    END IF;--
 
return RESULT;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function ADD_DATE_A
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADD_DATE_A" (v_date DATE, frequency VARCHAR,frequency1 VARCHAR,unit NUMBER ,unit2 NUMBER )
RETURN DATE   is
RESULT DATE;
BEGIN
    IF frequency = '1'  THEN
            RESULT := (v_date + unit ) ;
    ELSIF frequency = '2' THEN
            RESULT := (v_date + unit+1 );
    END IF;--
return RESULT;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function AUTOIDGENERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "AUTOIDGENERATION" (
   tablename    VARCHAR2,
   columnname   VARCHAR2
)
   RETURN VARCHAR2
IS
   rec_array   sys_refcursor;
   autoid      VARCHAR (19);
   sql_stmt    VARCHAR2 (4000);
BEGIN
   sql_stmt :=
         'SELECT (SubStr(TO_CHAR (CURRENT_TIMESTAMP,''YYYYMMDD''),0,4)||
                   SubStr(TO_CHAR (CURRENT_TIMESTAMP,''YYYYMMDD''),5,2)||
                   SubStr(TO_CHAR (CURRENT_TIMESTAMP,''YYYYMMDD''),7,2)||
                   TO_CHAR(DECODE(MAX(SUBSTR('
      || columnname
      || ',9,LENGTH('
      || columnname
      || '))+0), NULL,0,MAX(SUBSTR('
      || columnname
      || ',9,LENGTH('
      || columnname
      || '))+0))+1,''FM000000000'')) 
                    AUTONUMBER FROM '
      || tablename;

---DBMS_OUTPUT.put_line (sql_stmt);

   OPEN rec_array FOR sql_stmt;

   LOOP
      FETCH rec_array
       INTO autoid;

      EXIT WHEN rec_array%NOTFOUND;
   END LOOP;

   
   CLOSE rec_array;

   RETURN autoid;
END; 
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function AUTOMAXIDGENERATION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "AUTOMAXIDGENERATION" (
   tablename    VARCHAR2,
   columnname   VARCHAR2
)
   RETURN VARCHAR2
IS
   rec_array   sys_refcursor;
   autoid      VARCHAR (19);
   sql_stmt    VARCHAR2 (4000);
BEGIN
   sql_stmt :=
      'SELECT DECODE(MAX('
      || columnname
      || '),NULL,0,MAX('
      || columnname
      || '))+1 AUTONUMBER FROM '
      || tablename;

---DBMS_OUTPUT.put_line (sql_stmt);

   OPEN rec_array FOR sql_stmt;

   LOOP
      FETCH rec_array
       INTO autoid;

      EXIT WHEN rec_array%NOTFOUND;
   END LOOP;

   
   CLOSE rec_array;

   RETURN autoid;
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function CALCULATE_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CALCULATE_DATE" (p_date  timestamp, freq varchar2)
RETURN timestamp is
reval_date timestamp;

BEGIN 	
            IF freq       = 'DAILY' THEN
          reval_date := TRUNC(p_date) + 1 ;
        
        ELSIF freq    = 'WEEKLY' THEN
          reval_date := TRUNC(p_date) + 7 ;
          
        ELSIF freq    = 'FORTNIGHTLY' THEN
          reval_date := TRUNC(p_date) + 15 ;
          
        ELSIF freq    = 'MONTH' THEN
          reval_date := Add_Months(TRUNC(p_date),1) ;
          
        ELSIF freq    = 'BI_MONTH' THEN
          reval_date := Add_Months(TRUNC(p_date),2) ;  
          
        ELSIF freq    = 'QUARTERLY' THEN
          reval_date := Add_Months(TRUNC(p_date),3) ;
          
        ELSIF freq    = 'HALF_YEARLY' THEN
          reval_date := Add_Months(TRUNC(p_date),6) ;
          
        ELSIF freq    = 'YEARLY' THEN
          reval_date := Add_Months(TRUNC(p_date), 12) ;
        
        ELSE
        reval_date := TRUNC(p_date) ;
        
          
        END IF;
        
RETURN  reval_date;
END;
 
 
 

/
--------------------------------------------------------
--  DDL for Function CALCULATE_DP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CALCULATE_DP" (gc_det_id_in NUMBER,FUNDED_AMT_PERCENTAGE NUMBER) RETURN VARCHAR2 AS
DP_AMOUNT varchar2(25);
SUM_CURR_LIABI NUMBER;
SUM_CURR_ASSET NUMBER;
BEGIN
  select coalesce(sum(lonable),0) into SUM_CURR_LIABI from cms_asset_gc_stock_det where gc_det_id=gc_det_id_in and stock_type='CurrentLiabilities';
  select coalesce(sum(lonable),0) into SUM_CURR_ASSET from cms_asset_gc_stock_det where gc_det_id=gc_det_id_in and stock_type='CurrentAsset';
  DP_AMOUNT:=((SUM_CURR_ASSET-SUM_CURR_LIABI)*FUNDED_AMT_PERCENTAGE)/100;
  RETURN DP_AMOUNT;
END CALCULATE_DP;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function CALCULATE_DP_TEMP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CALCULATE_DP_TEMP" (gc_det_id_in NUMBER,FUNDED_AMT_PERCENTAGE NUMBER) RETURN VARCHAR2 AS
DP_AMOUNT varchar2(25);
SUM_CURR_LIABI NUMBER;
SUM_CURR_ASSET NUMBER;
BEGIN
  select coalesce(sum(lonable),0) into SUM_CURR_LIABI from cms_security_stock_temp where gc_det_id=gc_det_id_in and stock_type='CurrentLiabilities';
  select coalesce(sum(lonable),0) into SUM_CURR_ASSET from cms_security_stock_temp where gc_det_id=gc_det_id_in and stock_type='CurrentAsset';
  DP_AMOUNT:=((SUM_CURR_ASSET-SUM_CURR_LIABI)*FUNDED_AMT_PERCENTAGE)/100;
  return dp_amount;
END calculate_dp_temp;
  
  
  
  CREATE INDEX GC_DET_ID_TYPE ON CMS_ASSET_GC_STOCK_DET
    (
      "GC_DET_ID",
      "STOCK_TYPE"
    );
    
drop index GC_DET_ID_TYPE;
  
  
  
  
  
  
  
  
  
  
  
  
  
 
 
 

/
--------------------------------------------------------
--  DDL for Function CALCULATE_REC_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CALCULATE_REC_DATE" (
      CUST_ID NUMBER,
      docCode VARCHAR2)
    RETURN DATE
  AS
    REC_DATE DATE;
  BEGIN
    SELECT max(chkitem.received_date)
    INTO REC_DATE
    FROM CMS_CHECKLIST_ITEM chkItem,
      CMS_DOCUMENT_GLOBALLIST recMaster
    WHERE chkitem.checklist_id IN
      (SELECT chk.checklist_id
      FROM CMS_CHECKLIST chk
      WHERE chk.cms_lsp_lmt_profile_id =
        (SELECT pf.cms_lsp_lmt_profile_id
        FROM sci_lsp_lmt_profile pf,
          sci_le_sub_profile sp
        WHERE sp.cms_le_sub_profile_id = pf.cms_customer_id
        AND pf.cms_customer_id         = CUST_ID
        )
      AND chk.category='REC'
      )
    AND chkitem.document_code   =recmaster.document_code
    AND recmaster.category      ='REC'
    AND recmaster.statement_type='STOCK_STATEMENT'
    AND chkitem.status          = 'RECEIVED'
    AND chkitem.document_code   = docCode;
    RETURN REC_DATE;
  END CALCULATE_REC_DATE;

/
--------------------------------------------------------
--  DDL for Function CALCULATE_REC_DATE1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CALCULATE_REC_DATE1" (
      CUST_ID NUMBER,
      docCode VARCHAR2)
    RETURN DATE
  AS
    REC_DATE DATE;
  BEGIN
    SELECT chkitem.received_date
    INTO REC_DATE
    FROM CMS_CHECKLIST_ITEM chkItem,
      CMS_DOCUMENT_GLOBALLIST recMaster
    WHERE chkitem.checklist_id IN
      (SELECT chk.checklist_id
      FROM CMS_CHECKLIST chk
      WHERE chk.cms_lsp_lmt_profile_id =
        (SELECT pf.cms_lsp_lmt_profile_id
        FROM sci_lsp_lmt_profile pf,
          sci_le_sub_profile sp
        WHERE sp.cms_le_sub_profile_id = pf.cms_customer_id
        AND pf.cms_customer_id         = CUST_ID
        )
      AND chk.category='REC'
      )
    AND chkitem.document_code   =recmaster.document_code
    AND recmaster.category      ='REC'
    AND recmaster.statement_type='STOCK_STATEMENT'
    AND chkitem.status          = 'RECEIVED'                         
    AND chkitem.document_code   = docCode;
    RETURN REC_DATE;
  END CALCULATE_REC_DATE1;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function CALENDAR_DAYS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CALENDAR_DAYS" (p_to_date  DATE, p_from_date  DATE)

   RETURN NUMBER IS
   caldays NUMBER;
  
BEGIN 
	 caldays := TRUNC(p_to_date) - TRUNC(p_from_date);--
	
  RETURN caldays;	--
END ;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function CAL_DIFF_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CAL_DIFF_DATE" (
      CaseReceivedDateBR  VARCHAR,
      CaseReceivedTimeBR  VARCHAR,
      CaseProcessedDateBR VARCHAR,
      CaseProcessedTimeBR VARCHAR,
      cutOffStartTime     VARCHAR,
      cutOffEndTime       VARCHAR,
      dayDiff             VARCHAR)
    RETURN VARCHAR
  IS
    reval_date VARCHAR(100);
    hr         VARCHAR(100);
    mn         VARCHAR(100);
    addHr      VARCHAR(100);
    addMn      VARCHAR(1000);
    finalHr    VARCHAR(100);
    finalMn    VARCHAR(100);
    finalHr1   VARCHAR(100);
    finalMn1   VARCHAR(100);
  BEGIN
    CASE
    WHEN (CaseReceivedTimeBR IS NULL OR CaseProcessedTimeBR IS NULL) THEN
      reval_date             := '';
    WHEN (CaseReceivedTimeBR < cutOffStartTime AND CaseProcessedTimeBR < cutOffEndTime)
    THEN
      reval_date             := ((to_date(CaseProcessedDateBR|| ' ' ||CaseProcessedTimeBR, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||cutOffStartTime, 'dd-mm-yyyy HH24:MI') )*24 || ':' || mod((to_date(CaseProcessedDateBR|| ' ' ||CaseProcessedTimeBR, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||cutOffStartTime, 'dd-mm-yyyy HH24:MI') )*24*60,60));
    WHEN (CaseReceivedTimeBR > cutOffStartTime AND CaseProcessedTimeBR > cutOffEndTime)
    THEN
      reval_date             := ((to_date(CaseProcessedDateBR|| ' ' ||cutOffEndTime, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||CaseReceivedTimeBR, 'dd-mm-yyyy HH24:MI') )*24 || ':' || mod((to_date(CaseProcessedDateBR|| ' ' ||cutOffEndTime, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||CaseReceivedTimeBR, 'dd-mm-yyyy HH24:MI') )*24*60,60));
    WHEN (CaseReceivedTimeBR >= cutOffStartTime AND CaseProcessedTimeBR <= cutOffEndTime ) 
    THEN
      reval_date             := ((to_date(CaseProcessedDateBR|| ' ' ||CaseProcessedTimeBR, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||CaseReceivedTimeBR, 'dd-mm-yyyy HH24:MI') )*24 || ':' || mod((to_date(CaseProcessedDateBR|| ' ' ||CaseProcessedTimeBR, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||CaseReceivedTimeBR, 'dd-mm-yyyy HH24:MI') )*24*60,60));
    WHEN (CaseReceivedTimeBR <= cutOffStartTime AND CaseProcessedTimeBR<= cutOffEndTime) 
    THEN
      reval_date             := ((to_date(CaseProcessedDateBR|| ' ' ||CaseProcessedTimeBR, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||cutOffStartTime, 'dd-mm-yyyy HH24:MI') )*24 || ':' || mod((to_date(CaseProcessedDateBR|| ' ' ||CaseProcessedTimeBR, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||cutOffStartTime, 'dd-mm-yyyy HH24:MI') )*24*60,60));
    WHEN (CaseReceivedTimeBR <= cutOffStartTime AND CaseProcessedTimeBR >= cutOffEndTime) 
    THEN
      reval_date             := ((to_date(CaseProcessedDateBR|| ' ' ||cutOffStartTime, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||cutOffEndTime, 'dd-mm-yyyy HH24:MI') )*24 || ':' || mod((to_date(CaseProcessedDateBR|| ' ' ||cutOffStartTime, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||cutOffEndTime, 'dd-mm-yyyy HH24:MI') )*24*60,60));
    WHEN (CaseReceivedTimeBR >= cutOffStartTime AND CaseProcessedTimeBR >= cutOffEndTime) 
    THEN
      reval_date             := ((to_date(CaseProcessedDateBR|| ' ' ||cutOffEndTime, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||CaseReceivedTimeBR, 'dd-mm-yyyy HH24:MI') )*24 || ':' || mod((to_date(CaseProcessedDateBR|| ' ' ||cutOffEndTime, 'dd-mm-yyyy HH24:MI') - to_date(CaseProcessedDateBR|| ' ' ||CaseReceivedTimeBR, 'dd-mm-yyyy HH24:MI') )*24*60,60));
    END CASE;
    hr       := TRUNC(REPLACE( SUBSTR(reval_date,1,instr(reval_date,':',1,1)-1), ':', ''));
    mn       := TO_CHAR(SUBSTR(reval_date, instr(reval_date, ':')           + 1),'00');
    addHr    := floor(dayDiff);
    addMn    := (dayDiff                                          -floor(dayDiff))*60;
    finalHr  := to_number(TRUNC(COALESCE(hr,0)), '9,999.99')      + to_number(TRUNC(COALESCE(addHr,0)), '9,999.99');
    finalMn  := to_number(TRUNC(COALESCE(mn,0)), '9,999.99')      + to_number(TRUNC(COALESCE(addMn,0)), '9,999.99');
    finalHr1 := to_number(TRUNC(COALESCE(finalHr,0)), '9,999.99') + to_number(TRUNC(COALESCE(finalMn,0)/60), '9,999.99');
    finalMn1 := mod(COALESCE(finalMn,0),60);
    if to_number(finalHr1)<10 then
    finalHr1:='0'||finalHr1;
 
    end if;
     if to_number(finalMn1)<10 then
    finalMn1:='0'||finalMn1;
 
    end if;
    
    RETURN finalHr1||':'||finalMn1;
  END;
 

/
--------------------------------------------------------
--  DDL for Function CAL_DIFF_IN_MIN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CAL_DIFF_IN_MIN" (CaseReceivedDateBR    varchar,CaseProcessedDateBR    varchar,
                                         event   varchar)
RETURN varchar is
diff_in_min varchar(100);

BEGIN 	
	
      SELECT distinct ( ( (to_date('04-DEC-2013','DD-MM-YYYY') - to_date('25-NOV-2013','DD-MM-YYYY')) - (COALESCE (
  (SELECT SUM((TRUNC(end_date)                  -TRUNC(start_date)+1)- (next_day(TRUNC(end_date), 'MONDAY')-next_day(TRUNC(start_date), 'MONDAY'))/7 )
  FROM cms_holiday h
  WHERE TRUNC(h.start_date) BETWEEN to_date('25-NOV-2013','DD-MM-YYYY') AND to_date('04-DEC-2013','DD-MM-YYYY')
  OR TRUNC(h.end_date) BETWEEN to_date('25-NOV-2013','DD-MM-YYYY') AND to_date('04-DEC-2013','DD-MM-YYYY')
  ),0)                                                            +
  (SELECT (next_day(to_date('04-DEC-2013','DD-MM-YYYY'), 'MONDAY')-next_day(to_date('25-NOV-2013','DD-MM-YYYY'), 'MONDAY'))/7
  FROM dual
  ) ) ) * ((to_date('04-DEC-2013'
  || ' '
  ||
  (SELECT end_timing FROM cms_tat_master WHERE event_code = 'LIMIT'
  ), 'dd-mm-yyyy HH24:MI') - to_date('04-DEC-2013'
  || ' '
  ||
  (SELECT start_timing FROM cms_tat_master WHERE event_code = 'LIMIT'
  ), 'dd-mm-yyyy HH24:MI') )*24 ))
  
  into diff_in_min
FROM cms_holiday;
       
RETURN  diff_in_min;
END;
 
 
 

/
--------------------------------------------------------
--  DDL for Function CAL_EXPIRY_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CAL_EXPIRY_DATE" (p_date  timestamp, n_freq  NUMBER,freq varchar2)
RETURN timestamp is
reval_date timestamp;

BEGIN 	
	--reval_date := Trunc(p_date) + n_freq ;--
    IF freq = '1' or freq = 'D' THEN
   	    reval_date := Trunc(p_date) + n_freq ;		
   ELSIF freq = '2' or freq = 'W' THEN
   	    reval_date := Trunc(p_date) + (n_freq * 7) ;				--
   ELSIF freq = '3' or freq = 'M' THEN
       reval_date := Add_Months(Trunc(p_date),n_freq)  ;--
   ELSIF freq = '4' or freq = 'Y' THEN
       reval_date := Add_Months(Trunc(p_date),(n_freq * 12))  ;--
   END IF;	--
RETURN  reval_date;--
END;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function CHEKERDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CHEKERDATE" 
(
  COL_ID IN NUMBER  
) RETURN DATE 
AS
    REC_DATE DATE;
BEGIN

select transaction_date  INTO REC_DATE  from (
                              SELECT rownum n ,a.* 
                              FROM
                                (select * from trans_history hist where hist.transaction_id =
                                (select transaction_id from transaction trx where trx.transaction_type='COL' and  trx.reference_id = COL_ID)
                                ORDER BY tr_history_id desc
                                
                                ) a
                              WHERE rownum <=2
                              )
                              WHERE n =1 ;

  RETURN REC_DATE;
END CHEKERDATE;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function COMPARE_BRANCH_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "COMPARE_BRANCH_DETAILS" (stg_br_code varchar2,act_br_code varchar2,from_state varchar2,to_state varchar2)
RETURN varchar2 is
  br_code varchar2(30);
BEGIN 	
  IF from_state = 'ND' and to_state = 'PENDING_CREATE' THEN
       br_code := '' ;			
  
  ELSIF from_state = 'PENDING_CREATE' and to_state = 'ACTIVE' THEN
      br_code := '' ;
  
  ELSIF from_state = 'ACTIVE' and to_state = 'PENDING_UPDATE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--
  
  ELSIF from_state = 'PENDING_UPDATE' and to_state = 'ACTIVE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--
  ELSIF from_state = 'PENDING_UPDATE' and to_state = 'REJECTED' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'REJECTED' and to_state = 'PENDING_UPDATE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--     
  
  ELSIF from_state = 'ACTIVE' and to_state = 'PENDING_DELETE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--
  
  ELSIF from_state = 'PENDING_DELETE' and to_state = 'ACTIVE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--
  ELSIF from_state = 'PENDING_DELETE' and to_state = 'REJECTED' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'REJECTED' and to_state = 'PENDING_DELETE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--       
  END IF;     
      
RETURN  br_code;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function COMPARE_NEW_BRANCH_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "COMPARE_NEW_BRANCH_DETAILS" (stg_br_code varchar2,act_br_code varchar2,from_state varchar2,to_state varchar2)
RETURN varchar2 is
  br_code varchar2(30);
BEGIN 	
  IF from_state = 'ND' and to_state = 'PENDING_CREATE' THEN
       br_code := '' ;			
  
  ELSIF from_state = 'PENDING_CREATE' and to_state = 'ACTIVE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := act_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'ACTIVE' and to_state = 'PENDING_UPDATE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := act_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'PENDING_UPDATE' and to_state = 'ACTIVE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := act_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  ELSIF from_state = 'PENDING_UPDATE' and to_state = 'REJECTED' THEN
      IF stg_br_code = act_br_code THEN
            br_code := act_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'REJECTED' and to_state = 'PENDING_UPDATE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--     
  
  ELSIF from_state = 'ACTIVE' and to_state = 'PENDING_DELETE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := stg_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'PENDING_DELETE' and to_state = 'ACTIVE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := act_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  ELSIF from_state = 'PENDING_DELETE' and to_state = 'REJECTED' THEN
      IF stg_br_code = act_br_code THEN
            br_code := act_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--

  ELSIF from_state = 'PENDING_DELETE' and to_state = 'DELETED' THEN
      IF stg_br_code = act_br_code THEN
            br_code := act_br_code ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'REJECTED' and to_state = 'PENDING_DELETE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := stg_br_code ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--       
  END IF;     
      
RETURN  br_code;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function COMPARE_OLD_BRANCH_DETAILS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "COMPARE_OLD_BRANCH_DETAILS" (stg_br_code varchar2,act_br_code varchar2,from_state varchar2,to_state varchar2)
RETURN varchar2 is
  br_code varchar2(30);
BEGIN 	
  IF from_state = 'ND' and to_state = 'PENDING_CREATE' THEN
       br_code := '' ;			
  
  ELSIF from_state = 'PENDING_CREATE' and to_state = 'ACTIVE' THEN
      br_code := '' ;
  
  ELSIF from_state = 'ACTIVE' and to_state = 'PENDING_UPDATE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'PENDING_UPDATE' and to_state = 'ACTIVE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  ELSIF from_state = 'PENDING_UPDATE' and to_state = 'REJECTED' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'REJECTED' and to_state = 'PENDING_UPDATE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--     
  
  ELSIF from_state = 'ACTIVE' and to_state = 'PENDING_DELETE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--
  
  ELSIF from_state = 'PENDING_DELETE' and to_state = 'ACTIVE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--
  ELSIF from_state = 'PENDING_DELETE' and to_state = 'REJECTED' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := stg_br_code;
       END IF;	--
  
  ELSIF from_state = 'REJECTED' and to_state = 'PENDING_DELETE' THEN
      IF stg_br_code = act_br_code THEN
            br_code := '' ;		
       ELSE 
           br_code := act_br_code;
       END IF;	--       
  END IF;     
      
RETURN  br_code;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function CONVERT_AMT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CONVERT_AMT" 
(
in_amt  NUMBER,
in_currency_code VARCHAR2 ,
to_currency_code  VARCHAR2
)
   RETURN NUMBER IS
    v_base_currency_code VARCHAR2(3);--
	  v_ret_amt NUMBER(20,2) ;--
	  v_convert_rate NUMBER(21,6);--

   BEGIN
			v_base_currency_code := 'INR';--

  		v_convert_rate := 1;--
  		v_ret_amt := 0;--

        IF in_currency_code <> to_currency_code THEN
            IF in_currency_code <> v_base_currency_code THEN
                IF (in_amt IS NOT NULL AND in_currency_code IS NOT NULL) THEN

                        FOR REC IN (SELECT BUY_RATE
                                        FROM CMS_FOREX
                                        WHERE BUY_CURRENCY = in_currency_code
                                        AND SELL_CURRENCY = v_base_currency_code)

                        LOOP
                            v_convert_rate := REC.BUY_RATE; --
                            v_ret_amt := (in_amt * v_convert_rate);--
                        END Loop;--


                          SELECT NULL INTO v_ret_amt FROM dual ;
                END IF;--
            ELSE
                v_ret_amt := in_amt;--
            END IF;--


            IF to_currency_code <> v_base_currency_code THEN
                IF (in_amt IS NOT NULL AND to_currency_code IS NOT NULL) THEN
                        FOR rec IN (SELECT BUY_RATE
                                        FROM CMS_FOREX
                                        WHERE BUY_CURRENCY = to_currency_code
                                        AND SELL_CURRENCY = v_base_currency_code)
                        LOOP
                        v_convert_rate := REC.BUY_RATE; --
                        v_ret_amt := v_ret_amt / v_convert_rate;--
                        END loop;
                                  SELECT NULL INTO v_ret_amt FROM dual;
                END IF;--
            END IF;--
        ELSE
            v_ret_amt := in_amt; --
        END IF; --
  RETURN v_ret_amt;	--
END;

/
--------------------------------------------------------
--  DDL for Function CONVERT_AMT_TO_BASE_CURRENCY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CONVERT_AMT_TO_BASE_CURRENCY" 
(
in_amt  NUMBER,
in_currency_code VARCHAR2
)
   RETURN NUMBER IS
    v_base_currency_code VARCHAR2(3);
	  v_ret_amt NUMBER(20,2) ;
	  v_convert_rate NUMBER(21,6);

   BEGIN
			v_base_currency_code := 'INR';

  		v_convert_rate := 1;
  		v_ret_amt := 0;

        
            IF in_currency_code <> v_base_currency_code THEN
                IF (in_amt IS NOT NULL AND in_currency_code IS NOT NULL) THEN

                        FOR REC IN (SELECT BUY_RATE
                                        FROM CMS_FOREX
                                        WHERE BUY_CURRENCY = in_currency_code
                                        AND SELL_CURRENCY = v_base_currency_code)

                        LOOP
                            v_convert_rate := REC.BUY_RATE;
                            v_ret_amt := (in_amt * v_convert_rate);
                        END Loop;

                          --SELECT NULL INTO v_ret_amt FROM dual ;
                END IF;
            ELSE
                v_ret_amt := in_amt;--
  
        END IF;
  RETURN v_ret_amt;
END;

/
--------------------------------------------------------
--  DDL for Function CUSTOMERCHEKERDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CUSTOMERCHEKERDATE" 
(
  COL_ID IN NUMBER  
) RETURN DATE 
AS
    REC_DATE DATE;
BEGIN

select transaction_date  INTO REC_DATE  from (
                              SELECT rownum n ,a.* 
                              FROM
                                (select * from trans_history hist where hist.transaction_id =
                                (select transaction_id from transaction trx where trx.transaction_type='CUSTOMER' and  trx.reference_id = COL_ID)
                                ORDER BY tr_history_id desc
                                
                                ) a
                              WHERE rownum <=2
                              )
                              WHERE n =1 ;

  RETURN REC_DATE;
END CUSTOMERCHEKERDATE;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function CUSTOMERMAKERDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "CUSTOMERMAKERDATE" 
(
  COL_ID IN NUMBER  
) RETURN DATE 
AS
    REC_DATE DATE;
BEGIN

select transaction_date  INTO REC_DATE  from (
                              SELECT rownum n ,a.* 
                              FROM
                                (select * from trans_history hist where hist.transaction_id =
                                (select transaction_id from transaction trx where trx.transaction_type='CUSTOMER'  and  trx.reference_id = COL_ID)
                                ORDER BY tr_history_id desc
                                
                                ) a
                              WHERE rownum <=2
                              )
                              WHERE n =2;

  RETURN REC_DATE;
END CUSTOMERMAKERDATE;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function DIR_NAME_NO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DIR_NAME_NO" 
(
  COL_ID IN NUMBER,
  ROWNumb IN NUMBER,
  Valtype IN NUMBER
) RETURN varchar2 
AS
    REC_NAME varchar2(100);
    var varchar2(100);
 sql_var varchar2(1000);
 countRec NUMBER(19);
BEGIN

select count(1) into countRec from sci_le_director dir where dir.cms_le_main_profile_id =COL_ID;
if countRec >= ROWNumb then
      if Valtype = 1 then
        sql_var := 'select  DIR_NAME  from 
        (select rownum n,dir.* from sci_le_director dir where dir.cms_le_main_profile_id = '|| COL_ID ||
        ' order by dir.cms_le_director_id asc)
        where n ='|| ROWNumb ;
     end if;
      if Valtype = 2 then
        sql_var := 'select  DIN_NO  from 
        (select rownum n,dir.* from sci_le_director dir where dir.cms_le_main_profile_id = '|| COL_ID ||
        ' order by dir.cms_le_director_id asc)
        where n ='|| ROWNumb ;
     end if;


EXECUTE IMMEDIATE sql_var into  REC_NAME ;
end if;
  RETURN REC_NAME;
END DIR_NAME_NO;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function DORMANCY_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "DORMANCY_TYPE" (status varchar2) RETURN VARCHAR AS 
dormancytype varchar(10);
BEGIN

   IF status = 'R' THEN
   	    dormancytype := 'Normal';				--
   ELSIF status = 'NR' THEN
       dormancytype := 'New'  ;--
   END IF;	
  RETURN dormancytype;
END DORMANCY_TYPE;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function FINDDPVALUE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FINDDPVALUE" 
   ( col_id IN varchar2 )
   RETURN number
IS
   cnumber number;

   cursor c1 is
   SELECT CALCULATEDDP FROM CMS_ASSET_GC_DET WHERE GC_DET_ID = 
  (SELECT MAX(GC_DET_ID) FROM CMS_ASSET_GC_DET WHERE DUE_DATE = 
  (SELECT MAX(DUE_DATE) FROM CMS_ASSET_GC_DET WHERE CMS_COLLATERAL_ID =col_id) AND CMS_COLLATERAL_ID =col_id); 

BEGIN

   open c1;
   fetch c1 into cnumber;

   if c1%notfound then
      cnumber := 0;
   end if;

   close c1;

RETURN cnumber;

EXCEPTION
WHEN OTHERS THEN
   raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
END;

/
--------------------------------------------------------
--  DDL for Function FIND_SECPRIORITY_PRIORSEC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FIND_SECPRIORITY_PRIORSEC" (sec_priority varchar2) RETURN VARCHAR AS
sec_pri_name varchar(10);
BEGIN

   IF sec_priority = 'Y' THEN
   	    sec_pri_name := 'Primary';
   ELSIF sec_priority = 'N' THEN
       sec_pri_name := 'Secondary';
   ELSE
       sec_pri_name := null;
   END IF;
  RETURN sec_pri_name;
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function FORMAT_KEY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FORMAT_KEY" (TS TIMESTAMP, SEQ NUMBER)
   RETURN NUMBER  IS
   formated_key   NUMBER;
BEGIN 
    	
    formated_key := CAST((SubStr(TO_CHAR (TS,'YYYYMMDD'),0,4)||
                   SubStr(TO_CHAR (TS,'YYYYMMDD'),5,2)||
                   SubStr(TO_CHAR (TS,'YYYYMMDD'),7,2)|| 
                   substr(SEQ, 14))  AS NUMBER );--
    RETURN formated_key;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function FUN_GEN_DOC_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FUN_GEN_DOC_ID" 
RETURN VARCHAR2 is
sourceRefNumber VARCHAR2(100);
  sourceNumber VARCHAR2(100);
  strlength NUMBER;
  concatZero VARCHAR2(10);
  today_date VARCHAR2(50);
BEGIN
  strlength := 0;
  select to_char(CHECKLIST_ITEM_SEQ.nextval) into sourceNumber  from dual;
  strlength := length(sourceNumber);
  concatZero := '';
  if( (sourceNumber IS NOT null) and  (strlength < 9) ) then
  SELECT LPAD('0',9-strlength,'0') into concatZero FROM DUAL;
   end if;
   sourceNumber := concatZero||sourceNumber;
   SELECT TO_CHAR(SYSDATE, 'yyyyMMdd') into today_date FROM dual;
 sourceRefNumber :=today_date||sourceNumber;
 
 RETURN  sourceRefNumber;
END;

/
--------------------------------------------------------
--  DDL for Function FUN_GEN_SOURCE_NUMBER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FUN_GEN_SOURCE_NUMBER" 
RETURN VARCHAR2 is
sourceRefNumber VARCHAR2(100);
  sourceNumber VARCHAR2(100);
  strlength NUMBER;
  concatZero VARCHAR2(10);
  today_date VARCHAR2(50);
BEGIN
  strlength := 0;
  select to_char(FCUBS_SOURCESEQNO_SEQ.nextval) into sourceNumber  from dual;
  strlength := length(sourceNumber);
  concatZero := '';
  if( (sourceNumber IS NOT null) and  (strlength <> 5) ) then
  SELECT LPAD('0', 5-strlength,'0') into concatZero FROM DUAL;
   end if;
   sourceNumber := concatZero||sourceNumber;
   SELECT TO_CHAR(SYSDATE, 'yyMMdd') into today_date FROM dual;
 sourceRefNumber :='CAD'||today_date||sourceNumber;
 DBMS_OUTPUT.PUT_LINE('sourceRefNumber' || sourceRefNumber);
 RETURN  sourceRefNumber;
END;

/
--------------------------------------------------------
--  DDL for Function FUN_INSURANCE_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FUN_INSURANCE_STATUS" 
(
  P_CMS_COLLATERAL_ID IN VARCHAR2 
) RETURN VARCHAR2 AS 
V_SECURITY_SUB_TYPE_ID varchar2(100);
V_GC_DET_ID varchar2(100);
V_stock_val number(30,6);
type V_REC_SUM_ASSU_gc is record(INSURANCE_STATUS varchar2(50),
INSURED_AMOUNT number(30,6));
type tbl_V_REC_SUM_ASSU_gc is table of V_REC_SUM_ASSU_gc;
V_SUM_ASSU_gc tbl_V_REC_SUM_ASSU_gc;

type V_REC_SUM_ASSU is record(INSURANCE_STATUS varchar2(50),
INSURED_AMOUNT number(38));
type tbl_V_REC_SUM_ASSU is table of V_REC_SUM_ASSU;
V_SUM_ASSU tbl_V_REC_SUM_ASSU;


type V_CR_assure is ref cursor;-- RETURN V_REC_SUM_ASSU;
CR_assure V_CR_assure;
v_SQL_statment varchar2(1000);
V_FUN_INSURANCE_STATUS varchar2(100);
BEGIN
  begin
  select SEC.SECURITY_SUB_TYPE_ID into V_SECURITY_SUB_TYPE_ID  from CMS_SECURITY SEC where CMS_COLlateral_Id =P_CMS_COLLATERAL_ID;
  exception when others then
    V_SECURITY_SUB_TYPE_ID  :='';
  end;
  
  begin
    select GC_DET_ID into V_GC_DET_ID  from  (select  GC_DET_ID, CMS_COLlateral_Id,due_date, ROW_NUMBER() over (order by due_date desc) as rownumber from CMS_ASSET_GC_DET  where CMS_COLlateral_Id=P_CMS_COLLATERAL_ID)
    where rownumber=1;
  exception when others then
    V_GC_DET_ID  :='';
  end;
  
  
  if V_SECURITY_SUB_TYPE_ID='AB100' then
    v_SQL_statment:='select INSURANCE_STATUS,nvl(sum(nvl(INSURED_AMOUNT,0)),0) INSURED_AMOUNT  from cms_GC_insurance where CMS_COLlateral_Id=:B1 and DEPRECATED=''N'' and INSURANCE_STATUS is not null group by INSURANCE_STATUS'; ---sum assu
    BEGIN
      select nvl(sum(nvl(sto.COMPONENT_AMOUNT,0)),0) into V_stock_val from CMS_asset_gc_stock_det sto, CMS_COMPONENT cm where sto.GC_DET_ID = V_GC_DET_ID and   CM.COMPONENT_CODE=STO.component
      and  cm.HAS_INSURANCE='Yes' and cm.component_type='Current_Asset' and sto.STOCK_TYPE='CurrentAsset';---stock val
    exception when others then
      V_stock_val   :=0;
    end;
  elsIF V_SECURITY_SUB_TYPE_ID IN( 'PT701','AB109','AB101') THEN
    v_SQL_statment:='select INSURANCE_STATUS,nvl(sum(nvl(INSURED_AMT,0)),0) INSURED_AMOUNT  from CMS_INSURANCE_POLICY where CMS_COLlateral_Id=:B1 and status=''ACTIVE''  and INSURANCE_STATUS is not null group by INSURANCE_STATUS'; ---sum assu
    BEGIN
      select nvl(sum(nvl(cmv,0)),0) into V_stock_val from CMS_SECURITY where cms_collateral_id=P_CMS_COLLATERAL_ID;---stock val
    exception when others then
      V_stock_val   :=0;
    end;
  ELSE
    RETURN '';
  end if;
  open CR_assure for v_SQL_statment using P_CMS_COLLATERAL_ID;
  IF V_SECURITY_SUB_TYPE_ID='AB100' then
    fetch CR_assure bulk collect into V_SUM_ASSU_gc;
  ELSIF V_SECURITY_SUB_TYPE_ID IN( 'PT701','AB109','AB101') THEN
    fetch CR_assure bulk collect into V_SUM_ASSU;
  END IF;
  IF V_SECURITY_SUB_TYPE_ID='AB100' THEN
    IF V_SUM_ASSU_GC.COUNT=0 THEN
      V_FUN_INSURANCE_STATUS:='Deferral Not Tracked';
    elsif V_SUM_ASSU_gc.count=1 then
      if V_SUM_ASSU_gc(1).INSURANCE_STATUS='WAIVED' then
        V_FUN_INSURANCE_STATUS:='WAIVED';
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS='DEFERRED' then
        V_FUN_INSURANCE_STATUS:='DEFERRED';
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS='AWAITING' then
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' then
        if V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;
      end if;
    elsif V_SUM_ASSU_gc.count=2 then
      if V_SUM_ASSU_gc(1).INSURANCE_STATUS in('DEFERRED','WAIVED'  ) and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('DEFERRED','WAIVED'  )   then
        V_FUN_INSURANCE_STATUS:='DEFERRED';
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('AWAITING','WAIVED'  ) and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('AWAITING','WAIVED'  )  then
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('AWAITING' ,'DEFERRED') and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('AWAITING' ,'DEFERRED') then
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('RECEIVED','WAIVED'  )  and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('RECEIVED','WAIVED'  ) then
        if V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='WAIVED';
        end if;
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('RECEIVED','DEFERRED'  )  and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('RECEIVED','DEFERRED'  ) then  
         if V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='DEFERRED';
        end if;
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('RECEIVED','AWAITING'  )  and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('RECEIVED','AWAITING'  ) then  
        if V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;  
      end if;
    elsif V_SUM_ASSU_gc.count=3 then
      if V_SUM_ASSU_gc(1).INSURANCE_STATUS in('DEFERRED','AWAITING','WAIVED'  )  and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('DEFERRED','AWAITING' ,'WAIVED' ) and V_SUM_ASSU_gc(3).INSURANCE_STATUS in('DEFERRED','AWAITING' ,'WAIVED' )  then  
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('RECEIVED','AWAITING','WAIVED'  )  and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'WAIVED' )  and V_SUM_ASSU_gc(3).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'WAIVED' )  then  
        if V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(3).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;  
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('RECEIVED','AWAITING','DEFERRED'  )  and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'DEFERRED' ) and V_SUM_ASSU_gc(3).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'DEFERRED' ) then  
        if V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(3).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if; 
      elsif V_SUM_ASSU_gc(1).INSURANCE_STATUS in('RECEIVED','WAIVED','DEFERRED'  )  and V_SUM_ASSU_gc(2).INSURANCE_STATUS in('RECEIVED','WAIVED' ,'DEFERRED' ) and V_SUM_ASSU_gc(3).INSURANCE_STATUS in('RECEIVED','WAIVED' ,'DEFERRED' ) then  
          if V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
            V_FUN_INSURANCE_STATUS:='RECEIVED';
          elsif V_SUM_ASSU_gc(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(2).INSURED_AMOUNT>V_stock_val then
            V_FUN_INSURANCE_STATUS:='RECEIVED';
          elsif V_SUM_ASSU_gc(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(3).INSURED_AMOUNT>V_stock_val then
            V_FUN_INSURANCE_STATUS:='RECEIVED';  
          else
            V_FUN_INSURANCE_STATUS:='DEFERRED';
          end if;   
      END IF;       
    elsif V_SUM_ASSU_gc.count=4 then
        if V_SUM_ASSU_gc(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU_gc(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(3).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        elsif V_SUM_ASSU_gc(4).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU_gc(4).INSURED_AMOUNT>V_stock_val then  
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;
    
    end if;
  END IF;  
   IF V_SECURITY_SUB_TYPE_ID IN( 'PT701','AB109','AB101')THEN
    IF V_SUM_ASSU.COUNT=0 THEN
      V_FUN_INSURANCE_STATUS:='Deferral Not Tracked';
    elsif V_SUM_ASSU.count=1 then
      if V_SUM_ASSU(1).INSURANCE_STATUS='WAIVED' then
        V_FUN_INSURANCE_STATUS:='WAIVED';
      elsif V_SUM_ASSU(1).INSURANCE_STATUS='DEFERRED' then
        V_FUN_INSURANCE_STATUS:='DEFERRED';
      elsif V_SUM_ASSU(1).INSURANCE_STATUS='AWAITING' then
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' then
        if V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;
      end if;
    elsif V_SUM_ASSU.count=2 then
      if V_SUM_ASSU(1).INSURANCE_STATUS in('DEFERRED','WAIVED'  ) and V_SUM_ASSU(2).INSURANCE_STATUS in('DEFERRED','WAIVED'  )   then
        V_FUN_INSURANCE_STATUS:='DEFERRED';
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('AWAITING','WAIVED'  ) and V_SUM_ASSU(2).INSURANCE_STATUS in('AWAITING','WAIVED'  )  then
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('AWAITING' ,'DEFERRED') and V_SUM_ASSU(2).INSURANCE_STATUS in('AWAITING' ,'DEFERRED') then
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('RECEIVED','WAIVED'  )  and V_SUM_ASSU(2).INSURANCE_STATUS in('RECEIVED','WAIVED'  ) then
        if V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='WAIVED';
        end if;
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('RECEIVED','DEFERRED'  )  and V_SUM_ASSU(2).INSURANCE_STATUS in('RECEIVED','DEFERRED'  ) then  
         if V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='DEFERRED';
        end if;
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('RECEIVED','AWAITING'  )  and V_SUM_ASSU(2).INSURANCE_STATUS in('RECEIVED','AWAITING'  ) then  
        if V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;  
      end if;
    elsif V_SUM_ASSU.count=3 then
      if V_SUM_ASSU(1).INSURANCE_STATUS in('DEFERRED','AWAITING','WAIVED'  )  and V_SUM_ASSU(2).INSURANCE_STATUS in('DEFERRED','AWAITING' ,'WAIVED' ) and V_SUM_ASSU(3).INSURANCE_STATUS in('DEFERRED','AWAITING' ,'WAIVED' ) then  
        V_FUN_INSURANCE_STATUS:='PENDING';
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('RECEIVED','AWAITING','WAIVED'  )  and V_SUM_ASSU(2).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'WAIVED' ) and V_SUM_ASSU(3).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'WAIVED' ) then  
        if V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(3).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;  
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('RECEIVED','AWAITING','DEFERRED'  )  and V_SUM_ASSU(2).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'DEFERRED' )  and V_SUM_ASSU(3).INSURANCE_STATUS in('RECEIVED','AWAITING' ,'DEFERRED' ) then  
        if V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(3).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if; 
      elsif V_SUM_ASSU(1).INSURANCE_STATUS in('RECEIVED','WAIVED','DEFERRED'  )  and V_SUM_ASSU(2).INSURANCE_STATUS in('RECEIVED','WAIVED' ,'DEFERRED' ) and V_SUM_ASSU(3).INSURANCE_STATUS in('RECEIVED','WAIVED' ,'DEFERRED' )  then  
          if V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
            V_FUN_INSURANCE_STATUS:='RECEIVED';
          elsif V_SUM_ASSU(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(2).INSURED_AMOUNT>V_stock_val then
            V_FUN_INSURANCE_STATUS:='RECEIVED';
          elsif V_SUM_ASSU(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(3).INSURED_AMOUNT>V_stock_val then
            V_FUN_INSURANCE_STATUS:='RECEIVED';  
          else
            V_FUN_INSURANCE_STATUS:='DEFERRED';
          end if;   
      END IF;       
    elsif V_SUM_ASSU.count=4 then
        if V_SUM_ASSU(1).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(1).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(2).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(2).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';
        elsif V_SUM_ASSU(3).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(3).INSURED_AMOUNT>V_stock_val then
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        elsif V_SUM_ASSU(4).INSURANCE_STATUS='RECEIVED' and V_SUM_ASSU(4).INSURED_AMOUNT>V_stock_val then  
          V_FUN_INSURANCE_STATUS:='RECEIVED';  
        else
          V_FUN_INSURANCE_STATUS:='PENDING';
        end if;
    
    end if;
  END IF; 
  RETURN V_FUN_INSURANCE_STATUS;
END FUN_INSURANCE_STATUS;

/
--------------------------------------------------------
--  DDL for Function FUN_ROC_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FUN_ROC_STATUS" 
(
  CMS_CUSTOMER_ID IN VARCHAR2
 ) RETURN VARCHAR2 AS  
  ROC_STATUS VARCHAR2(40);
  --V_STATUS varchar2(40);
  cursor CR_assure is 
  with det as (SELECT  CUSTOMER_ID,CREATION_DATE,STATUS, rank() over (partition by CUSTOMER_ID order by CREATION_DATE desc ) as lastrec
  FROM   CMS_DISCREPENCY
  where DISCREPENCY IN (SELECT ENTRY_CODE FROM COMMON_CODE_CATEGORY_ENTRY WHERE 
  category_code = 'DISCREPENCY' and entry_name='CHG-1')
  and CUSTOMER_ID=CMS_CUSTOMER_ID
  )
  select LISTAGG(STATUS, ', ') WITHIN GROUP (ORDER BY lastrec ) as liststatus  from det where lastrec=1 ;--group by  STATUS;
  RC_assure CR_assure%rowtype;
  BEGIN
    open CR_assure;
    fetch CR_assure into RC_assure;

  if CR_assure%notfound then
    ROC_STATUS := 'Deferral Not Tracked';
  elsif RC_assure.liststatus is null then
    ROC_STATUS := 'Deferral Not Tracked';
  elsif instr(RC_assure.liststatus,',')=0 then
    IF RC_assure.liststatus = 'DEFERED' THEN ROC_STATUS:='Deferred';
    ELSIF RC_assure.liststatus = 'CLOSED' THEN ROC_STATUS:='Received';
    ELSIF RC_assure.liststatus = 'WAIVED' THEN ROC_STATUS:='Waived';
    ELSIF RC_assure.liststatus = 'ACTIVE' THEN ROC_STATUS:='Pending';
    else  
      ROC_STATUS := 'Deferral Not Tracked';
    end if;
else
  if RC_assure.liststatus like '%ACTIVE%' then
    ROC_STATUS:='Pending';
  elsif RC_assure.liststatus like '%DEFERED%' and  RC_assure.liststatus not like '%ACTIVE%'  then
    ROC_STATUS:='Deferred';
  elsif RC_assure.liststatus like '%CLOSED%' and  RC_assure.liststatus not like '%ACTIVE%'  and  RC_assure.liststatus not like '%DEFERED%'  then
    ROC_STATUS:='Received';
  elsif RC_assure.liststatus like '%WAIVED%' and  RC_assure.liststatus not like '%ACTIVE%' and  RC_assure.liststatus not like '%CLOSED%'  and  RC_assure.liststatus not like '%DEFERED%'  then
    ROC_STATUS:='Waived';
    
  else
      ROC_STATUS := 'Deferral Not Tracked';
  end if;
end if;
close CR_assure;
return ROC_STATUS;
--SELECT distinct STATUS into V_STATUS FROM CMS_DISCREPENCY WHERE CREATION_DATE IN (SELECT MAX(CREATION_DATE) FROM CMS_DISCREPENCY 
--WHERE DISCREPENCY IN (SELECT ENTRY_CODE FROM COMMON_CODE_CATEGORY_ENTRY WHERE 
-- category_code = 'DISCREPENCY' and entry_name='CHG-1') GROUP BY 
--CUSTOMER_ID HAVING CUSTOMER_ID= CMS_CUSTOMER_ID) and CUSTOMER_ID=CMS_CUSTOMER_ID and DISCREPENCY IN (SELECT ENTRY_CODE FROM COMMON_CODE_CATEGORY_ENTRY WHERE 
-- category_code = 'DISCREPENCY' and entry_name='CHG-1');
--EXCEPTION
--WHEN NO_DATA_FOUND THEN
--ROC_STATUS := 'Deferral Not Tracked';
--
--end;
--
--    
--IF V_STATUS = 'DEFERED' THEN ROC_STATUS:='Deferral';
--ELSIF V_STATUS = 'CLOSED' THEN ROC_STATUS:='Received';
--ELSIF V_STATUS = 'WAIVED' THEN ROC_STATUS:='Waived';
--ELSIF V_STATUS = 'ACTIVE' THEN ROC_STATUS:='Pending';
--
--end if;
      
  
end FUN_ROC_STATUS;

/
--------------------------------------------------------
--  DDL for Function FUN_ROC_STATUS_OLD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FUN_ROC_STATUS_OLD" 
(
  CMS_CUSTOMER_ID IN VARCHAR2
 ) RETURN VARCHAR2 AS  
  ROC_STATUS VARCHAR2(40);
  V_STATUS varchar2(40);

BEGIN

begin
SELECT STATUS into V_STATUS FROM CMS_DISCREPENCY WHERE CREATION_DATE IN (SELECT MAX(CREATION_DATE) FROM CMS_DISCREPENCY 
WHERE DISCREPENCY IN (SELECT ENTRY_CODE FROM COMMON_CODE_CATEGORY_ENTRY WHERE 
 category_code = 'DISCREPENCY' and entry_name='CHG-1') GROUP BY 
CUSTOMER_ID HAVING CUSTOMER_ID= CMS_CUSTOMER_ID);
EXCEPTION
WHEN NO_DATA_FOUND THEN
ROC_STATUS := 'Deferral Not Tracked';

end;

    
IF V_STATUS = 'DEFERED' THEN ROC_STATUS:='Deferral';
ELSIF V_STATUS = 'CLOSED' THEN ROC_STATUS:='Received';
ELSIF V_STATUS = 'WAIVED' THEN ROC_STATUS:='Waived';
ELSIF V_STATUS = 'ACTIVE' THEN ROC_STATUS:='Pending';

end if;
      
  RETURN ROC_STATUS;  
  
end FUN_ROC_STATUS_old;

/
--------------------------------------------------------
--  DDL for Function FUN_UPDATE_DOC_ITEM_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "FUN_UPDATE_DOC_ITEM_STATUS" 
RETURN VARCHAR2 is
docRefNumber VARCHAR2(100);
  docNumber VARCHAR2(100);
  strlength NUMBER;
  concatZero VARCHAR2(10);
  today_date VARCHAR2(50);
BEGIN
 strlength := 0;
  select to_char(CHECKLIST_ITEM_SEQ.nextval) into docNumber  from dual;
  strlength := length(docNumber);
  concatZero := '';
  if( (docNumber IS NOT null) and  (strlength <> 9) ) then
  SELECT LPAD('0', 9-strlength,'0') into concatZero FROM DUAL;
   end if;
   docNumber := concatZero||docNumber;
   SELECT TO_CHAR(SYSDATE, 'yyyyMMdd') into today_date FROM dual;
 docRefNumber :=today_date||docNumber;
 DBMS_OUTPUT.PUT_LINE('docRefNumber' || docRefNumber);
 RETURN  docRefNumber;
END;

/
--------------------------------------------------------
--  DDL for Function GET_ACTIVITY_MESSAGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_ACTIVITY_MESSAGE" 
(
fromState VARCHAR2 ,
toState  VARCHAR2
)
   RETURN VARCHAR2 IS
    v_activity_message VARCHAR2(200);--

   BEGIN
	IF fromState IS NOT NULL and fromState <> ' ' and 
	   toState IS NOT NULL and toState <> ' ' THEN
			IF fromState = 'ACTIVE' THEN
				IF toState ='DRAFT' THEN
					v_activity_message:='Record Drafted';
				elsif toState ='PENDING_DELETE' THEN
					v_activity_message:='Pending Record Delete';
				elsif toState ='PENDING_DISABLE' THEN
					v_activity_message:='Pending Record  Disable';
				elsif toState ='PENDING_UPDATE' THEN
					v_activity_message:='Pending Record Update';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'ND' THEN
				IF toState ='ACTIVE' THEN
					v_activity_message:='New Record Approved';
				elsif toState ='NEW' or toState ='PENDING_CREATE' THEN
					v_activity_message:='New Record Created';
        elsif toState ='NEW' or toState ='PENDING_INSERT' THEN
					v_activity_message:='Pending Approval';

				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'DISABLE' THEN
				IF toState ='PENDING_ENABLE' THEN
					v_activity_message:='Pending Record Enable';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'DRAFT' THEN
				IF toState ='PENDING_UPDATE' THEN
					v_activity_message:='Record Updated';
        elsif toState ='PENDING_CREATE' THEN
					v_activity_message:='Record Created';
        elsif toState ='ACTIVE' THEN
					v_activity_message:='Record Activated';  
        elsif toState ='CLOSED' THEN
					v_activity_message:='Record Closed';  
        elsif toState ='DRAFT' THEN
					v_activity_message:='Record Drafted';    
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'REJECTED' THEN
				IF toState ='ACTIVE' THEN
					v_activity_message:='Accepted Rejection';
				elsif toState ='PENDING_UPDATE' THEN
					v_activity_message:='Resubmit  Rejected Record';
        elsif toState ='CLOSED' THEN
					v_activity_message:='Record Closed';
        elsif toState ='PENDING_CREATE' THEN
					v_activity_message:='Record Created';
        elsif toState ='PENDING_ENABLE' THEN
					v_activity_message:='Record Enabled';  
        elsif toState ='PENDING_DISABLE' THEN
					v_activity_message:='Record Disabled';
        elsif toState ='PENDING_DELETE' THEN
					v_activity_message:='Record Deleted';
        elsif toState ='PENDING_ACTIVATE' THEN
					v_activity_message:='Record Activated';  
        elsif toState ='DELETED' THEN
					v_activity_message:='Record DELETED';   
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'PENDING_CREATE' THEN
				IF toState ='ACTIVE' THEN
					v_activity_message:='New Record Approved';
				elsif toState ='REJECTED' THEN
					v_activity_message:='New Record Creation Rejected';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'PENDING_DELETE' THEN
				IF toState ='DELETED' THEN
					v_activity_message:='Record Deleted';
        elsif toState ='REJECTED' THEN
					v_activity_message:='Delete Record Rejected';
        elsif toState ='ACTIVE' THEN
					v_activity_message:='Record Activated';  
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'PENDING_DISABLE' THEN
				IF toState ='DISABLE' THEN
					v_activity_message:='Record Disabled';
        elsif toState ='REJECTED' THEN
					v_activity_message:='DISABLE Record Rejected';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'PENDING_ENABLE' THEN
				IF toState ='ACTIVE' THEN
					v_activity_message:='Record  Enabled';
        elsif toState ='REJECTED' THEN
					v_activity_message:='Enable Record Rejected';
        elsif toState ='ENABLE' THEN
					v_activity_message:='Record Enabled';  
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
			elsif fromState = 'PENDING_UPDATE' THEN
				IF toState ='ACTIVE' THEN
					v_activity_message:='Updated Record Approved';
				elsif toState ='REJECTED' THEN
					v_activity_message:='Update Record Rejected';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;

			elsif fromState = 'PENDING_PERFECTION' THEN
				IF toState ='PENDING_UPDATE' THEN
					v_activity_message:='Record Updated';
        elsif toState ='REJECTED' THEN
					v_activity_message:='Update Record Rejected';
        elsif toState ='DRAFT' THEN
					v_activity_message:='Record Drafted';  
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
      
      elsif fromState = 'CLOSED' THEN
				IF toState ='DRAFT' THEN
					v_activity_message:='Record Drafted';
        elsif toState ='PENDING_UPDATE' THEN
					v_activity_message:='Record Updated';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
        
      elsif fromState = 'DELETED' THEN
				IF toState ='PENDING_ACTIVATE' THEN
					v_activity_message:='Record Activated';
        elsif toState ='PENDING_ENABLE' THEN
					v_activity_message:='Record Enabled';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;  
      
      elsif fromState = 'PENDING_ACTIVATE' THEN
				IF toState ='ACTIVE' THEN
					v_activity_message:='Record Activated';
        elsif toState ='REJECTED' THEN
					v_activity_message:='Record Rejected';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF; 
     
     elsif fromState = 'PENDING_ENABLE' THEN
				IF toState ='ENABLE' THEN
					v_activity_message:='Record Enabled';        
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
     
     elsif fromState = 'ENABLE' THEN
				IF toState ='PENDING_DISABLE' THEN
					v_activity_message:='Record Disabled';        
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;       
             
      elsif fromState = 'PENDING_INSERT' THEN
				IF toState ='ACTIVE' THEN
					v_activity_message:='Record Approved';
        elsif toState ='REJECTED' THEN
					v_activity_message:='New Record Creation Rejected';
				else
					v_activity_message:='Message Not defined for '||fromState||' to '||toState;
				END IF;
        
			else
			  v_activity_message:='Message Not defined for '||fromState||' to '||toState;
			END IF; --
		else
			v_activity_message:='Invalid fromState = '||fromState||' and toState = '||toState;
	END IF; 
  RETURN v_activity_message;	--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function GET_COMMON_CODE_DESC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_COMMON_CODE_DESC" (
   i_ENTRY_CODE   NVARCHAR2,
   i_CATEGORY_CODE   NVARCHAR2
)
RETURN NVARCHAR2 IS
	result NVARCHAR2(255);--
BEGIN
	SELECT ENT.ENTRY_NAME into result
	FROM COMMON_CODE_CATEGORY_ENTRY ENT        
	WHERE ENT.CATEGORY_CODE = i_CATEGORY_CODE
		AND ENT.ENTRY_CODE = i_ENTRY_CODE
        AND ROWNUM < 2 ;--

   return result;--
EXCEPTION
	WHEN no_data_found THEN return null;
end GET_COMMON_CODE_DESC;

/
--------------------------------------------------------
--  DDL for Function GET_DOC_ITEM_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_DOC_ITEM_ID" (sub_profile_id varchar2) RETURN VARCHAR AS
OUT_DOC_ITEM_ID VARCHAR2(20);
BEGIN
    SELECT DOC_ITEM_ID into OUT_DOC_ITEM_ID from (SELECT DOC_ITEM_ID,ROWNUM RM from(
          SELECT DOC_ITEM_ID  FROM CMS_CHECKLIST_ITEM WHERE 
                       CHECKLIST_ID IN ( SELECT CHECKLIST_ID FROM CMS_CHECKLIST 
                            WHERE CMS_LSP_LMT_PROFILE_ID = sub_profile_id AND CATEGORY = 'LAD'
                           ) 
          
          ORDER BY DOC_ITEM_ID desc)) where RM = 2;
                                           
  RETURN OUT_DOC_ITEM_ID;
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function GET_GUARANTOR_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_GUARANTOR_TYPE" (sub_profile_id varchar2) RETURN VARCHAR AS
out_guarantor_type VARCHAR2(20);
BEGIN
    SELECT distinct grnt.guarantor_type
      FROM
                CMS_LIMIT_SECURITY_MAP lsm,
                SCI_LSP_APPR_LMTS lmts,
                SCI_LSP_LMT_PROFILE pf,
                SCI_LE_SUB_PROFILE sp,
                CMS_SECURITY cs,
                CMS_GUARANTEE grnt
      WHERE			
                cs.CMS_COLLATERAL_ID = lsm.CMS_COLLATERAL_ID					
                AND sp.CMS_LE_SUB_PROFILE_ID = pf.CMS_CUSTOMER_ID
                AND pf.CMS_LSP_LMT_PROFILE_ID = lmts.CMS_LIMIT_PROFILE_ID
                AND lmts.CMS_LSP_APPR_LMTS_ID = lsm.CMS_LSP_APPR_LMTS_ID
                AND cs.CMS_COLLATERAL_ID = grnt.CMS_COLLATERAL_ID
                AND CS.TYPE_NAME = 'Guarantees'
                AND sp.CMS_LE_SUB_PROFILE_ID IN (20110926000000379,
20111130000000954,
20111226000001036,
20111227000001040,
20110920000000354,
20111021000000534,
20111021000000536,
20111109000000753,
20111022000000550,
20111108000000731,
20111109000000743,
20111022000000550,
20111109000000771,
20111115000000851,
20111109000000750,
20111110000000799,
20111116000000859,
20110905000000253,
20110923000000372,
20111108000000724,
20111107000000691,
20111114000000842,
20111021000000548,
20111021000000549,
20111213000001006);
                                           
  RETURN out_guarantor_type;
END;          
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function GET_MON_DAYS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_MON_DAYS" (mon varchar2)
RETURN varchar2 is
reval_date varchar2(50);
BEGIN 	
   IF mon = 'JAN' or mon = 'MAR' or mon = 'MAY' or mon = 'JUL' or mon = 'AUG' or mon = 'OCT' or mon = 'DEC' THEN
   	    reval_date := '31' ;				--
   ELSIF mon = 'APR' OR mon = 'JUN' or mon = 'SEP' or mon = 'NOV' THEN
       reval_date := '30' ;--
   ELSIF mon = 'FEB' THEN
       reval_date := '28' ;--
   ELSE
       reval_date := 'INVALID MONTH' ;--  
   END IF;	--
RETURN  reval_date;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function GET_OLD_FROM_STATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_OLD_FROM_STATE" (trans_id varchar2) RETURN VARCHAR AS
OUT_FROM_STATE VARCHAR2(20);
BEGIN
    select FROM_STATE into OUT_FROM_STATE from ( select FROM_STATE,ROWNUM RM from (         
      select trans_his.FROM_STATE from TRANS_HISTORY trans_his
          where trans_his.transaction_id = trans_id
          ORDER BY trans_his.TR_HISTORY_ID desc)) where RM = 2;
                                           
  RETURN OUT_FROM_STATE;
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function GET_OLD_USER_ID_DETAIL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_OLD_USER_ID_DETAIL" (in_usr_login_id varchar2,IN_ROWNUM number) RETURN VARCHAR AS
OUT_USER_ID NUMBER(19,0);
BEGIN
    select USER_ID into OUT_USER_ID from ( select USER_ID,ROWNUM RM from (         
      select STG_USR.USER_ID from stage_user STG_USR
          where STG_USR.login_id = in_usr_login_id
          ORDER BY STG_USR.USER_ID desc)) where RM =IN_ROWNUM;
                                           
  RETURN OUT_USER_ID;
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function GET_RELEASED_AMOUNT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "GET_RELEASED_AMOUNT" ( p_cms_lsp_appr_lmts_id IN NUMBER, p_serial_no IN VARCHAR2) RETURN NUMBER
  IS
    v_released_amount NUMBER;
    
  BEGIN
    v_released_amount := NULL;
   
    select sys_xref.RELEASED_AMOUNT into v_released_amount from SCI_LSP_APPR_LMTS lmts 
    INNER JOIN SCI_LSP_LMTS_XREF_MAP lmt_xref on lmts.CMS_LSP_APPR_LMTS_ID = lmt_xref.CMS_LSP_APPR_LMTS_ID
    INNER JOIN SCI_LSP_SYS_XREF sys_xref on lmt_xref.CMS_LSP_SYS_XREF_ID = sys_xref.CMS_LSP_SYS_XREF_ID 
    where lmt_xref.CMS_LSP_APPR_LMTS_ID = p_cms_lsp_appr_lmts_id AND sys_xref.SERIAL_NO = p_serial_no;

    RETURN v_released_amount;
    
END get_released_amount;

/
--------------------------------------------------------
--  DDL for Function IF_LAD_FILTER_EXISTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "IF_LAD_FILTER_EXISTS" 
(
  Rm_Id_Value In Varchar2  
, Party_Id_Value In Varchar2  
, Due_Month_Value In Varchar2  
, Due_Year_Value In Varchar2 
,segment_id_value IN Varchar2
) return number As L_Exst number:=0;

Begin

  Select Count(*)
  INTO l_exst
  FROM CMS_LAD_FILTER c
  WHERE c.Rm_Id  =Rm_Id_Value
  AND C.Party_Id =Party_Id_Value
  And C.Due_Month=Due_Month_Value
  And C.Due_Year =Due_Year_Value
   AND C.Segment_Id =segment_id_value;
  Return L_Exst;
end if_lad_filter_exists;

/
--------------------------------------------------------
--  DDL for Function ISEXCLUDEDFORSTPOFSRM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ISEXCLUDEDFORSTPOFSRM" (P_CMS_LSP_SYS_XREF_ID in number, P_LINE_CODE IN VARCHAR2)
  return varchar2 as
  mst_cnt number;
  sblc_cnt number;
begin
  select count(*) into mst_cnt from CMS_EXC_LINE_FR_STP_SRM t1 where t1.LINE_CODE  = P_LINE_CODE and t1.EXCLUDED = 'on' 
  and t1.STATUS = 'ACTIVE' AND t1.DEPRECATED = 'N';

  if(mst_cnt > 0) then
     return 'FALSE';
  end if;
  
  select count(*) into sblc_cnt from CMS_SECURITY where CMS_COLLATERAL_ID in (
    SELECT CMS_COLLATERAL_ID FROM CMS_LIMIT_SECURITY_MAP WHERE CMS_LSP_APPR_LMTS_ID 
    in (
    select DISTINCT t1.CMS_LSP_APPR_LMTS_ID from SCI_LSP_APPR_LMTS t1 
	  inner join SCI_LSP_LMTS_XREF_MAP t2 on t2.CMS_LSP_APPR_LMTS_ID = t1.CMS_LSP_APPR_LMTS_ID
    where t1.CMS_LIMIT_STATUS = 'ACTIVE' and t2.CMS_STATUS = 'ACTIVE' 
	  and t2.CMS_LSP_SYS_XREF_ID = P_CMS_LSP_SYS_XREF_ID	and t1.LINE_NO = P_LINE_CODE
    )
    and update_status_ind !='D'
  )
  and SECURITY_SUB_TYPE_ID in ('GT402', 'GT403') and CMV > 0;
  
  if(sblc_cnt > 0) then
     return 'FALSE';
  end if;
  
  return 'TRUE';
end;

/
--------------------------------------------------------
--  DDL for Function ISNUMBER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ISNUMBER" (p_num VARCHAR2) RETURN NUMBER
AS
 a NUMBER;
BEGIN
 a := p_num;
 RETURN 1;
EXCEPTION WHEN OTHERS THEN
 RETURN 0;
END;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function IS_A_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "IS_A_DATE" 
    ( p_date in varchar2 )
    return varchar2
is
    d date;
begin
    d := to_date(p_date,  'dd-mon-yyyy')  ;
    if d != p_date then
        return '1';
    else
        return '0';
    end if;
exception
    when others  then
        return '1';
end;
 
 
 

/
--------------------------------------------------------
--  DDL for Function IS_A_NUMBER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "IS_A_NUMBER" 
    ( p_number in varchar2 )
    return varchar2
is
    d number;
begin
    d := to_char(to_number(p_number))  ;
  
        return '0';
   
exception
    when others  then
        return '1';
end;
 
 
 

/
--------------------------------------------------------
--  DDL for Function LATEST_GC_DOCCODE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "LATEST_GC_DOCCODE" (
      v_in_collateral_id NUMBER)
    RETURN VARCHAR2  
  AS
    v_DOC_CODE VARCHAR2(20);
  BEGIN
    SELECT document_code
    INTO v_DOC_CODE
    FROM
      (SELECT chkItem.expiry_date,
        chkItem.document_code,
        chkItem.checklist_id
      FROM cms_checklist_item chkItem,
        CMS_DOCUMENT_GLOBALLIST recMaster
      WHERE chkItem.checklist_id IN
        (SELECT chk.checklist_id
        FROM CMS_CHECKLIST chk
        WHERE chk.cms_lsp_lmt_profile_id =
          (SELECT cms_lsp_lmt_profile_id
          FROM cms_limit_security_map
          WHERE cms_collateral_id=v_in_collateral_id
          and rownum=1 -- GC is allocated to one customer only
          )
        AND chk.category='REC'
        )
      AND recmaster.category      ='REC'
      AND recmaster.statement_type='STOCK_STATEMENT'
      AND recmaster.document_code =chkitem.document_code
      AND chkitem.status          = 'RECEIVED'
      ORDER BY chkItem.expiry_date DESC
      )
    WHERE rownum=1 ;
    RETURN v_DOC_CODE ;
  END LATEST_GC_DOCCODE;

/
--------------------------------------------------------
--  DDL for Function LIMITCHEKERDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "LIMITCHEKERDATE" 
(
  COL_ID IN NUMBER  
) RETURN DATE 
AS
    REC_DATE DATE;
BEGIN

select transaction_date  INTO REC_DATE  from (
                              SELECT rownum n ,a.* 
                              FROM
                                (select * from trans_history hist where hist.transaction_id =
                                (select transaction_id from transaction trx where  trx.transaction_type='LIMIT' and  trx.reference_id = COL_ID)
                                ORDER BY tr_history_id desc
                                
                                ) a
                              WHERE rownum <=2
                              )
                              WHERE n =1 ;

  RETURN REC_DATE;
END LIMITCHEKERDATE;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function LIMITMAKERDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "LIMITMAKERDATE" 
(
  COL_ID IN NUMBER  
) RETURN DATE 
AS
    REC_DATE DATE;
BEGIN

select transaction_date  INTO REC_DATE  from (
                              SELECT rownum n ,a.* 
                              FROM
                                (select * from trans_history hist where hist.transaction_id =
                                (select transaction_id from transaction trx where  trx.transaction_type='LIMIT'  and  trx.reference_id = COL_ID)
                                ORDER BY tr_history_id desc
                                
                                ) a
                              WHERE rownum <=2
                              )
                              WHERE n =2;

  RETURN REC_DATE;
END LIMITMAKERDATE;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function MAKERDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "MAKERDATE" 
(
  COL_ID IN NUMBER  
) RETURN DATE 
AS
    REC_DATE DATE;
BEGIN

select transaction_date  INTO REC_DATE  from (
                              SELECT rownum n ,a.* 
                              FROM
                                (select * from trans_history hist where hist.transaction_id =
                                (select transaction_id from transaction trx where trx.transaction_type='COL' and  trx.reference_id = COL_ID)
                                ORDER BY tr_history_id desc
                                
                                ) a
                              WHERE rownum <=2
                              )
                              WHERE n =2;

  RETURN REC_DATE;
END MAKERDATE;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function NEXT_VAL_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "NEXT_VAL_DATE" (p_date  timestamp, n_freq  NUMBER,freq varchar2)
RETURN timestamp is
reval_date timestamp;

BEGIN 	
	reval_date := Trunc(p_date) + n_freq ;--
	
   IF freq = '2' or freq = 'W' THEN
   	    reval_date := Trunc(p_date) + (n_freq * 7) ;				--
   ELSIF freq = '3' or freq = 'M' THEN
       reval_date := Add_Months(Trunc(p_date),n_freq)  ;--
   ELSIF freq = '4' or freq = 'Y' THEN
       reval_date := Add_Months(Trunc(p_date),(n_freq * 12))  ;--
   END IF;	--
RETURN  reval_date;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function NEXT_VAL_DATE_1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "NEXT_VAL_DATE_1" (freq varchar2)
RETURN timestamp is
reval_date timestamp;

BEGIN 	
	--reval_date := Trunc(p_date) + n_freq ;--
	
   IF freq = '2' or freq = 'W' THEN
   	    reval_date := sysdate ;				--
   ELSIF freq = '3' or freq = 'M' THEN
       reval_date := sysdate ;--
   ELSIF freq = '4' or freq = 'Y' THEN
       reval_date := sysdate ;--
   END IF;	--
RETURN  reval_date;--
END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function PMC_STATS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PMC_STATS" 
(pStatDate Date) RETURN pmc_tab IS

MyArray pmc_tab;
vstat1 NUMBER;
vstat2 NUMBER;
vstat3 NUMBER;

BEGIN

MyArray := pmc_tab();

select sum(Field1), sum(field2),sum(field3)
into vstat1, vstat2,vstat3 
from v_stats_daily
where Start_date = pStatDate;

MyArray.extend;
MyArray(1) := vstat1;
MyArray.extend;
MyArray(2) := vstat2;
MyArray.extend;
MyArray(3) := vstat3;

RETURN MyArray;

END;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function TOTAL_COMP_AMT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TOTAL_COMP_AMT" (
      gc_det_id_v         NUMBER ,
      cms_collateral_id_v NUMBER)
    RETURN NUMBER
  AS
    TOT_AMT NUMBER;
  BEGIN
    SELECT SUM(component_amount)
    INTO TOT_AMT
    FROM
      (SELECT DISTINCT(det.gc_stock_det_id),
        DET.COMPONENT_AMOUNT
      FROM cms_asset_gc_stock_det det,
        cms_gc_insurance ins
      WHERE det.gc_stock_det_id IN
        (SELECT gc_stock_det_id
        FROM cms_asset_gc_stock_det
        WHERE gc_det_id= gc_det_id_v
        )
      AND (ins.deprecated          = 'N'
      OR ins.deprecated           IS NULL)
      AND (ins.expiry_date        >= sysdate
      OR ins.expiry_date          IS NULL)
      AND ins.cms_collateral_id(+) = cms_collateral_id_v
      AND det.stock_type           = 'CurrentAsset'

              AND det.component IN
                (SELECT upper(component_code)
                FROM cms_component comp
                WHERE 0 <>
                  (SELECT instr(ins.ins_select_component, comp.component_code) FROM dual
                  )
                  AND comp.has_insurance = 'Yes'
               )
      );
    RETURN TOT_AMT ;
  END TOTAL_COMP_AMT;

/
--------------------------------------------------------
--  DDL for Function TOTAL_COMP_AMT1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TOTAL_COMP_AMT1" (
       gc_det_id_v NUMBER , cms_collateral_id_v NUMBER)
    RETURN NUMBER
  AS
    TOT_AMT NUMBER;
  BEGIN
       SELECT SUM(component_amount) 
    into TOT_AMT
    from
      (select distinct(det.gc_stock_det_id),DET.COMPONENT_AMOUNT
      FROM cms_asset_gc_stock_det det,cms_gc_insurance ins
      WHERE det.gc_stock_det_id IN
        (SELECT gc_stock_det_id
        FROM cms_asset_gc_stock_det
        WHERE gc_det_id= gc_det_id_v
        )
        and ins.deprecated = 'N'
        and ins.expiry_date >=  sysdate
        and ins.cms_collateral_id = cms_collateral_id_v
	      and det.stock_type = 'CurrentAsset'
      AND det.component not IN
        (SELECT upper(component_code)
        FROM cms_component comp
        WHERE 0 <>
          (SELECT instr( ( SELECT wm_concat(ins.ins_select_component) 
FROM   cms_gc_insurance ins where ins.cms_collateral_id = cms_collateral_id_v
GROUP BY ins.cms_collateral_id), comp.component_code) FROM dual
          )
        ));
    RETURN TOT_AMT ;
  END TOTAL_COMP_AMT1;
 
 
 

/
--------------------------------------------------------
--  DDL for Function TOTAL_COMP_AMT123
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TOTAL_COMP_AMT123" (
       gc_det_id_v NUMBER , cms_collateral_id_v NUMBER)
    RETURN NUMBER
  AS
    TOT_AMT NUMBER;
  BEGIN
       SELECT SUM(component_amount) 
    into TOT_AMT
    from
      (select distinct(det.gc_stock_det_id),DET.COMPONENT_AMOUNT
      FROM cms_asset_gc_stock_det det,cms_gc_insurance ins
      WHERE det.gc_stock_det_id IN
        (SELECT gc_stock_det_id
        FROM cms_asset_gc_stock_det
        WHERE gc_det_id= gc_det_id_v
        )
         and (ins.deprecated = 'N' or ins.deprecated is null)
        and (ins.expiry_date >=  sysdate  or ins.expiry_date is null)
      --  and ins.cms_collateral_id(+) = cms_collateral_id_v
	and det.stock_type = 'CurrentAsset'
--      AND det.component IN
--        (SELECT upper(component_code)
--        FROM cms_component comp
--        WHERE 0 <>
--          (SELECT instr(ins.ins_select_component, comp.component_code) FROM dual
--          )
--        )  
);
    RETURN TOT_AMT ;
  END TOTAL_COMP_AMT123;
 
 
 

/
--------------------------------------------------------
--  DDL for Function TOTAL_COMP_AMT_INS_NULL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TOTAL_COMP_AMT_INS_NULL" (
       gc_det_id_v NUMBER , cms_collateral_id_v NUMBER)
    RETURN NUMBER
  AS
    TOT_AMT NUMBER;
  BEGIN
       SELECT SUM(component_amount)
    into TOT_AMT
    from
      (select distinct(det.gc_stock_det_id),DET.COMPONENT_AMOUNT
      FROM cms_asset_gc_stock_det det,cms_gc_insurance ins
      WHERE det.gc_stock_det_id IN
        (SELECT gc_stock_det_id
        FROM cms_asset_gc_stock_det
        WHERE gc_det_id= gc_det_id_v
        )
         and (ins.deprecated = 'N' or ins.deprecated is null)
       -- and (ins.expiry_date >=  sysdate  or ins.expiry_date is null)
      --  and ins.cms_collateral_id(+) = cms_collateral_id_v
	and det.stock_type = 'CurrentAsset'
AND det.component IN  (SELECT upper(component_code) FROM cms_component comp
where has_insurance = 'Yes')
--        (SELECT upper(component_code)
--        FROM cms_component comp
--        WHERE 0 <>
--          (SELECT instr(ins.ins_select_component, comp.component_code) FROM dual
--          )
--        )
);
    RETURN TOT_AMT ;
  END TOTAL_COMP_AMT_INS_NULL;

/
--------------------------------------------------------
--  DDL for Function TOTAL_LAD_COUNT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "TOTAL_LAD_COUNT" 
(
  Rm_Id In Varchar2  ,
  Party_Id In Varchar2,
  Due_Month_Value In Varchar2,
  Due_Year_Value In Varchar2,
  segment_value In varchar2
) return number as     result_count number := 0;
BEGIN
SELECT COUNT(1) INTO RESULT_COUNT FROM 
  (SELECT DISTINCT Sl.Cms_lsp_lmt_Profile_Id Limit_Id,
    S.LSP_SHORT_NAME profile_name,
    Sl.Cms_Customer_Id cust_id
  FROM Sci_Le_Sub_Profile S,
    SCI_LSP_LMT_PROFILE Sl
  WHERE SL.CMS_CUSTOMER_ID                   =S.CMS_LE_SUB_PROFILE_ID
  AND EXISTS(SELECT 1 FROM CMS_CHECKLIST INNER JOIN CMS_CHECKLIST_ITEM ON CMS_CHECKLIST_ITEM.CHECKLIST_ID =CMS_CHECKLIST.CHECKLIST_ID
    WHERE CMS_CHECKLIST.CMS_LSP_LMT_PROFILE_ID =SL.CMS_LSP_LMT_PROFILE_ID
    AND CMS_CHECKLIST.CATEGORY               = 'LAD'
    AND CMS_CHECKLIST.IS_DISPLAY                           = 'Y' 
    and CMS_CHECKLIST_ITEM.COMPLETED_DATE between to_timestamp(to_char(to_date('01-'||Due_Month_Value||'-'||Due_Year_Value||' 00:00:00','DD-MON-YYYY HH24:MI:SS'))) 
    and add_months(to_timestamp(to_char(to_date('01-'||Due_Month_Value||'-'||Due_Year_Value||' 23:59:59','DD-MON-YYYY HH24:MI:SS'))),1)-1
    AND EXISTS (SELECT 1 FROM TRANSACTION WHERE REFERENCE_ID = CMS_CHECKLIST.CHECKLIST_ID
    AND TRANSACTION.TRANSACTION_TYPE         = 'CHECKLIST' AND Transaction.Status                 <>'OBSOLETE'))
  AND s.cycle_nm                           ='LAD'
  AND S.Status                        ='ACTIVE'
  AND S.Lsp_Le_Id = CASE WHEN Party_Id <>'ALL' THEN Party_Id ELSE S.Lsp_Le_Id END
  AND S.Relation_Mgr = CASE WHEN Rm_Id <>'ALL' THEN Rm_Id ELSE S.Relation_Mgr END
  AND S.Lsp_Sgmnt_Code_Value = CASE WHEN Segment_Value <>'ALL' THEN Segment_Value ELSE S.Lsp_Sgmnt_Code_Value END
  );
  Return Result_Count;
end total_lad_count;

/
--------------------------------------------------------
--  DDL for Function UDFDATA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "UDFDATA" 
(
  COL_ID IN NUMBER,
  udf in varchar2
) RETURN varchar2 
AS
    REC_UDF varchar2(100);
    var varchar2(100);
 sql_var varchar2(1000);

BEGIN
REC_UDF := null;
if udf is not null then
 var := 'UDF'||udf;
 
sql_var := 'select '|| var ||' from  sci_le_udf where CMS_LE_MAIN_PROFILE_ID = '||COL_ID ;
EXECUTE IMMEDIATE sql_var into  REC_UDF ;
if REC_UDF = '-'
then
REC_UDF := null;
end if;
end if;
  RETURN REC_UDF;
END UDFDATA;
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function VAR1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "VAR1" (
   tablename    VARCHAR2,
   columnname1   VARCHAR2,
   columnname2   VARCHAR2,
   columnname3   VARCHAR2
)
   RETURN number
IS
    sql_stmt    VARCHAR2 (4000);

BEGIN
sql_stmt:=
    'CURSOR cur
    IS
      SELECT *
      FROM ' ||tablename ||';
      rec cur%ROWTYPE;
      BEGIN
    OPEN cur;
    LOOP
      FETCH cur INTO rec;
      EXIT WHEN cur%NOTFOUND';
     'ADDED_VALUE := SELECT((TO_NUMBER(regexp_replace(rec.'||columnname1||',''[ABCDEFGHIJKLMNOPQRSTUVWXYZ]'',''''))) + rec.'||columnname2||') FROM'|| tablename;
            
      'IF ADDED_VALUE = rec.'||columnname3
      'then
      dbms_output.put_line(''match'')';
       '
      ELSE
       dbms_output.put_line(''does not match'');
      END IF;
    END LOOP;
    CLOSE cur';
    RETURN null;
  END;
 
 
 
 
 

/
--------------------------------------------------------
--  DDL for Function WEIGHEDAVG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "WEIGHEDAVG" 
(
  COL_ID IN NUMBER 

) RETURN NUMBER 
AS
    amt NUMBER;
    var varchar2(100);   
 sql_var varchar2(1000);

BEGIN

var := ' and CD1.STATUS = ''ACTIVE''  and cd1.ACTIVE = ''active'' and sec1.status = ''ACTIVE'' ' ;
sql_var := '(select (case when sum(cl1.lien_amount) = 0 then 0 when sum(cl1.lien_amount) <> 0 then round((sum(cd1.deposit_interest_rate * cl1.lien_amount)/sum(cl1.lien_amount)),2) end) as amt from cms_lien cl1,cms_cash_deposit cd1 ,
cms_security sec1 where sec1.cms_collateral_id = cd1.cms_collateral_id and cl1.cash_deposit_id = cd1.cash_deposit_id
and sec1.cms_collateral_id = '|| COL_ID ||' and cd1.cms_collateral_id = '|| COL_ID ||' '||var||' )';

EXECUTE IMMEDIATE sql_var into  amt ;

  RETURN amt;
END weighedAvg;
 
 
 

/
