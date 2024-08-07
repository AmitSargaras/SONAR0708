
---------------------------------
-- DDL statements for User Defined Functions
---------------------------------

DROP FUNCTION TO_CHAR;

CREATE FUNCTION TO_CHAR (DI DECIMAL(31,10), FMT VARCHAR(50))
 RETURNS VARCHAR(50)
 SPECIFIC TO_CHAR
 LANGUAGE SQL
 CONTAINS SQL
 NO EXTERNAL ACTION
 DETERMINISTIC

BEGIN ATOMIC
DECLARE Retv    VARCHAR(50);--
DECLARE DId     CHAR(31);--
DECLARE Posd    SMALLINT;--
DECLARE Posf    SMALLINT;--
DECLARE SigInd  SMALLINT;--
 
IF length(rtrim(translate(FMT, '     ', ',.90S'))) > 0
OR length(ltrim(rtrim(translate(FMT, '    ', ',90S')))) > 1
OR posstr(FMT, 'S') NOT IN (0, 1, length(FMT))
THEN
   RETURN '*** Format Error. ***';--
END IF;--

SET DId    = digits(DI);--
SET Posd   = 22 - length( replace( substr(FMT, 1, posstr(FMT||'.', '.') - 1), ',', '') )
                + sign(posstr(substr(FMT, 1, posstr(FMT||'.', '.') - 1),'S'));--
SET Posf   = 1;--
SET SigInd = 0;--
SET Retv   = '';--
 
WHILE Posf <= length(FMT) DO
   IF substr(FMT,Posf,1) IN ('0', '.')
   OR substr(FMT,Posf,1) = '9' AND substr(DId,Posd,1) <> '0' THEN
      SET SigInd = 1;--
   END IF;--
 
   IF SigInd = 1 THEN
      IF substr(FMT,Posf,1) IN ('0', '9') THEN
         SET Retv = Retv || substr(DId,Posd,1);--
      ELSEIF substr(FMT,Posf,1) IN (',', '.') THEN
         SET Retv = Retv || substr(FMT,Posf,1);--
      END IF;--
   ELSEIF Posf = length(FMT) THEN
      SET Retv = Retv || '0';--
   ELSE
      SET Retv = Retv || ' ';--
   END IF;--
 
   IF substr(FMT,Posf,1) IN ('0', '9') THEN
      SET Posd = Posd + 1;--
   END IF;--
 
   IF substr(FMT,Posf,1) = 'S' THEN
      SET Retv = Retv || CASE
                         WHEN sign(DI) > 0 THEN '+'
                         WHEN sign(DI) < 0 THEN '-'
                         ELSE ' '
                         END;--
   END IF;--
 
   SET Posf = Posf + 1;--
END WHILE;--

RETURN Retv;--
END;


DROP FUNCTION diff_days;

CREATE FUNCTION diff_days(
p_to_date  DATE, 
p_from_date  DATE
)
RETURNS BIGINT
   LANGUAGE SQL SPECIFIC diff_days DETERMINISTIC 
   BEGIN ATOMIC 
      DECLARE n_days BIGINT;      --
      SET n_days  = days( p_to_date ) - days( p_from_date );--
    RETURN n_days ;--
 END;

DROP FUNCTION ADD_DAYS_CALLER;
 
CREATE FUNCTION ADD_DAYS_CALLER 
(
P_DATE  DATE, 
N_DAYS  INT, 
COUNTRY  VARCHAR(30) 
)
   RETURNS DATE
   LANGUAGE SQL SPECIFIC ADD_DAYS_CALLER NOT DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC 
	
      DECLARE CURRDATE DATE;--
      DECLARE THEDAY VARCHAR(10);--
      DECLARE PUBLICHOLIDAY INT DEFAULT 0 ;--
      DECLARE ADJUST INT DEFAULT 0 ;--
      DECLARE PASSDATE DATE;--
			
      DECLARE AT_END INT DEFAULT 0 ;--
      DECLARE AT_N_DAYS INT DEFAULT 0 ;--
			
			SET CURRDATE =P_DATE;--
			
      IF P_DATE IS NULL THEN
         RETURN NULL;--
      END IF;--
      IF N_DAYS <= 0 THEN
         RETURN CURRDATE;--
      END IF;--
			
      WHILE AT_N_DAYS = 0 DO
         SET THEDAY = (SELECT DAYNAME (CURRDATE) FROM SYSIBM.SYSDUMMY1);--
         SET PUBLICHOLIDAY = (SELECT COUNT (*)
															FROM CMS_PUBLIC_HOLIDAY
															WHERE DATE (HOLIDAY_DATE) = CURRDATE
																AND COUNTRY_ISO_CODE = COUNTRY
																AND DAYNAME (HOLIDAY_DATE) NOT IN ('Saturday', 'Sunday'));--
										
         IF THEDAY = 'Saturday' OR THEDAY = 'Sunday' OR PUBLICHOLIDAY <> 0 THEN
            SET ADJUST = ADJUST + 1;--
         END IF;				--
				
         IF (AT_N_DAYS = N_DAYS) THEN
            SET AT_N_DAYS = 1;--
         ELSE
            SET AT_N_DAYS = AT_N_DAYS + 1;--
         END IF;				--
				SET CURRDATE = DATE(currdate)  + 1 DAY;--
				
      END WHILE;--
			
      SET PASSDATE = CURRDATE;--
			
      WHILE AT_END = 0 DO
         IF (ADJUST = 0) THEN
            RETURN CURRDATE;--
         END IF;--
				--add_days (P_DATE  DATE, N_DAYS  INT, COUNTRY  VARCHAR (26))
				--SET CURRDATE= ADD_DAYS(current_date, 1, 'SG');       --
				IF ((PASSDATE) != (CURRDATE)) THEN
            SET AT_END = 1;--
         END IF;--
      END WHILE;--
			
      RETURN CURRDATE;--
   END;

DROP FUNCTION ADD_DAYS;
   
CREATE FUNCTION ADD_DAYS 
(
P_DATE  DATE, 
N_DAYS  INT, 
COUNTRY  VARCHAR(30) 
)
   RETURNS DATE
   LANGUAGE SQL SPECIFIC add_days NOT DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC 
	
      DECLARE CURRDATE DATE;--
      DECLARE THEDAY VARCHAR(10);--
      DECLARE PUBLICHOLIDAY INT DEFAULT 0 ;--
      DECLARE ADJUST INT DEFAULT 0 ;--
      DECLARE PASSDATE DATE;--
			
      DECLARE AT_END INT DEFAULT 0 ;--
      DECLARE AT_N_DAYS INT DEFAULT 0 ;--
			
			SET CURRDATE =P_DATE;--
			
      IF P_DATE IS NULL THEN
         RETURN NULL;--
      END IF;--
      IF N_DAYS <= 0 THEN
         RETURN CURRDATE;--
      END IF;--
			
      WHILE AT_N_DAYS = 0 DO
         SET THEDAY = (SELECT DAYNAME (CURRDATE) FROM SYSIBM.SYSDUMMY1);--
         SET PUBLICHOLIDAY = (SELECT COUNT (*)
															FROM CMS_PUBLIC_HOLIDAY
															WHERE DATE (HOLIDAY_DATE) = CURRDATE
																AND COUNTRY_ISO_CODE = COUNTRY
																AND DAYNAME (HOLIDAY_DATE) NOT IN ('Saturday', 'Sunday'));--
										
         IF THEDAY = 'Saturday' OR THEDAY = 'Sunday' OR PUBLICHOLIDAY <> 0 THEN
            SET ADJUST = ADJUST + 1;--
         END IF;				--
				
         IF (AT_N_DAYS = N_DAYS) THEN
            SET AT_N_DAYS = 1;--
         ELSE
            SET AT_N_DAYS = AT_N_DAYS + 1;--
         END IF;				--
				SET CURRDATE = DATE(currdate)  + 1 DAY;--
				
      END WHILE;--
			
      SET PASSDATE = CURRDATE;--
			
      WHILE AT_END = 0 DO
         IF (ADJUST = 0) THEN
            RETURN CURRDATE;--
         END IF;--
				--add_days (P_DATE  DATE, N_DAYS  BIGINT, COUNTRY  VARCHAR (26))
				--SET CURRDATE= (SELECT add_days(passdate, adjust, country)  FROM SYSIBM.SYSDUMMY1);       --
				IF ((PASSDATE) != (CURRDATE)) THEN
            SET AT_END = 1;--
         END IF;--
      END WHILE;--
			
      RETURN CURRDATE;--
   END;

DROP FUNCTION DATE_CHECK;

CREATE FUNCTION DATE_CHECK(
date1 DATE,
date2  DATE 
)
RETURNS DATE
LANGUAGE SQL SPECIFIC Date_Check NOT DETERMINISTIC

BEGIN ATOMIC 

			IF ( date1 = date2 ) THEN
					RETURN date1;--
			ELSEIF (date1 < date2 ) THEN
						RETURN date2;--
			ELSE
					RETURN date1;--
			END IF;	--
END;

DROP FUNCTION DT_FMT;

CREATE FUNCTION DT_FMT(TS DATE, fmt varchar(20)) 
RETURNS VARCHAR(50) 
SPECIFIC DT_FMT
return 
with tmp (dd,mm,yyyy) as 
( 
    select 
    substr( digits (day(TS)),9), 
    substr( digits (month(TS)),9) , 
    rtrim(char(year(TS))) 
    from sysibm.sysdummy1 
    ) 
select 
case fmt 
    when 'yyyymmdd' 
        then yyyy || mm || dd 
    when 'ddmmyyyy' 
        then dd || mm || yyyy 
	when 'mmyyyy' 
        then mm || yyyy    
    when 'yyyy-mm'
        then yyyy || '-' || mm
    when 'mm/dd/yyyy' 
        then mm || '/' || dd || '/' || yyyy 
    when 'yyyy/dd/mm' 
        then yyyy || '/' || mm || '/' || dd 
    else 
        'date format ' || coalesce(fmt,' <null> ') ||  
        ' not recognized.' 
    end 
from tmp;

DROP FUNCTION GET_CREDIT_GRADE;

CREATE FUNCTION GET_CREDIT_GRADE (
   i_le_id   VARCHAR(20)
)
RETURNS VARCHAR(255)
LANGUAGE SQL SPECIFIC get_credit_grade NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC
  
	DECLARE result VARCHAR(255);--
	
	SET result = (SELECT ENTRY_NAME
		FROM COMMON_CODE_CATEGORY_ENTRY ENT
		WHERE ENT.CATEGORY_CODE = '19' 
		AND ENT.ENTRY_CODE =(SELECT *
			FROM (SELECT CG.LCG_CRDT_GRADE_CODE_VALUE
				FROM SCI_LE_CREDIT_GRADE CG
					WHERE LCG_CRDT_GRADE_TYPE_VALUE = 'INTERNAL'
					AND (UPDATE_STATUS_IND <> 'D' OR UPDATE_STATUS_IND IS NULL)
					AND CG.LCG_LE_ID = i_le_id
					ORDER BY CG.CMS_LE_CREDIT_GRADE_ID DESC) TEMP
				FETCH FIRST 1 ROW ONLY)		
		);--
   return result;--
end;

DROP FUNCTION GETLASTEVALUATIONDATE;

CREATE FUNCTION GETLASTEVALUATIONDATE
(
collateral_id     BIGINT ,
last_trx_date  DATE
)
RETURNS DATE
LANGUAGE SQL SPECIFIC getLastEvaluationDate DETERMINISTIC  READS SQL DATA

BEGIN ATOMIC

  DECLARE   last_evaluation_date    DATE ;--
  DECLARE  second_last_trx_date    TIMESTAMP ;--
  DECLARE  trx_id   VARCHAR(20);--

  FOR vl AS
      select max(transaction_date) AS last_trx_date ,transaction_id
       from trans_history  hist ,
       cms_stage_security col
       where         
			-- filter out system_update
			hist.FROM_STATE  <> 'ACTIVE'									
			-- filter out delete trx
			AND hist.OPSDESC NOT IN ('PART_DELETE', 'FULL_DELETE')
							AND hist.STATUS = 'ACTIVE'
							AND DATE(hist.transaction_date)  <   DATE(last_trx_date)
							AND hist.transaction_type = 'COL'
							AND DECIMAL(hist.REFERENCE_ID) =  col.CMS_COLLATERAL_ID
							AND col.status not in ('DELETED', 'PENDING_DELETE')
						group by transaction_id							
    DO
   SET second_last_trx_date = last_trx_date  ;--
   SET trx_id = transaction_id  ;--
  END FOR ;--

   SET last_evaluation_date = (SELECT DATE(stageval.valuation_date) AS last_evaluation_date
		FROM trans_history hist,
			cms_stage_security col,
			cms_stage_valuation stageval
		WHERE hist.TRANSACTION_ID =trx_id
		AND hist.TRANSACTION_DATE =   second_last_trx_date
		AND collateral_id = DECIMAL(hist.REFERENCE_ID)
		AND col.CMS_COLLATERAL_ID  = DECIMAL(hist.staging_reference_id)
		AND stageval.CMS_COLLATERAL_ID = col.CMS_COLLATERAL_ID
    );--
RETURN last_evaluation_date ;--
END;

DROP FUNCTION GETPREVACTIVATEDLIMITAMOUNT;

CREATE FUNCTION GETPREVACTIVATEDLIMITAMOUNT
(
 trxid         VARCHAR(20),
 trxhistid      BIGINT,
 btype          VARCHAR(40)
)
RETURNS BIGINT
LANGUAGE SQL SPECIFIC getprevactivatedlimitamount NOT DETERMINISTIC

BEGIN ATOMIC 
	   DECLARE l_to_date     date  ; --
     DECLARE l_from_date   date ; --
		 DECLARE noofdays BIGINT; --
		
		 DECLARE amount            BIGINT DEFAULT 0;--
     DECLARE  max_tr_hist_id   BIGINT DEFAULT 0;--

  
	  SET max_tr_hist_id =  (SELECT MAX (tr_history_id) 
			FROM trans_history
			WHERE transaction_id = trxid
				AND tr_history_id < trxhistid
				AND from_state = 'PENDING_UPDATE'
				AND to_state = 'ACTIVE' );--
		
	 
	IF max_tr_hist_id IS NULL THEN
      RETURN 0;--
  END IF;--

   IF btype = 'MB' THEN
      SET amount = (SELECT lmt.cms_activated_limit      
			FROM stage_limit lmt, 
					 TRANS_HISTORY hist
		WHERE lmt.CMS_LSP_APPR_LMTS_ID = DECIMAL(hist.STAGING_REFERENCE_ID)
			AND hist.TR_HISTORY_ID = max_tr_hist_id); --
   ELSE
     SET amount = (SELECT lmt.lcl_activated_limit        
		FROM stage_co_borrower_limit lmt, 
						 trans_history hist
				WHERE lmt.cms_lsp_co_borrow_lmt_id = DECIMAL(hist.STAGING_REFERENCE_ID)
					AND hist.tr_history_id = max_tr_hist_id );--
											
   END IF;--
	
RETURN amount;--
END;

DROP FUNCTION GREATER_DATE;

CREATE FUNCTION GREATER_DATE
(
date1  DATE,
date2  DATE
)
RETURNS DATE
LANGUAGE SQL SPECIFIC Greater_Date DETERMINISTIC 

BEGIN ATOMIC

		IF (date1 IS NULL AND date2 IS NULL )THEN
				RETURN NULL;--
		ELSEIF( date1 = date2) THEN
			RETURN date1;--
		ELSEIF(date1 IS NOT NULL AND date2 IS NOT NULL) THEN
			IF(date1 < date2 )THEN
				RETURN date2;--
			ELSE
				RETURN date1;--
			END IF;--
		ELSEIF(date1 IS NOT NULL) THEN
			RETURN date1;--
		ELSEIF(date2 IS NOT NULL) THEN
			RETURN date2;--
		END IF;--

END;

DROP FUNCTION INSTR;

CREATE FUNCTION INSTR (search VarChar(4000), Input VarChar(4000))
 RETURNS Integer
 SPECIFIC INSTR
 LANGUAGE SQL
 CONTAINS SQL
 NO EXTERNAL ACTION
 DETERMINISTIC
BEGIN ATOMIC

		DECLARE Pos INT DEFAULT 0 ;--
  
		DECLARE M INT DEFAULT 0 ;--
		DECLARE N INT DEFAULT 0 ;--

		SET M = LENGTH(search);--
		SET N = LENGTH(Input);--
  
	 IF (N > 0 AND M > 0 ) THEN
	    SET Pos = Locate (search, Input);--
	 END IF ;  --
   RETURN Pos ;--
END;

DROP FUNCTION LAST_DAY;

CREATE FUNCTION LAST_DAY(v_date date)
RETURNS DATE
SPECIFIC LAST_DAY
LANGUAGE SQL
CONTAINS SQL
NO EXTERNAL ACTION
DETERMINISTIC
RETURN (v_date + 1 MONTHS) - DAY(v_date + 1 MONTHS) DAYS;

DROP FUNCTION LPAD;

CREATE FUNCTION LPAD (C1 VarChar(4000), N integer, C2 VarChar(4000))
 RETURNS VARCHAR(4000)
 LANGUAGE SQL
 SPECIFIC LPAD
 DETERMINISTIC
 CONTAINS SQL
 NO EXTERNAL ACTION
BEGIN ATOMIC
RETURN
 CASE
   WHEN N > length(C1) THEN substr(repeat(C2,(N-length(C1)+length(C2))/(length(C2)+1-sign(length(C2)))),1,N-length(C1)) || C1
   ELSE substr(C1,1,N)
 END;--
end;

DROP FUNCTION MONTHS_BETWEEN;

CREATE FUNCTION MONTHS_BETWEEN(d1 TIMESTAMP, d2 TIMESTAMP)
RETURNS FLOAT
SPECIFIC MONTHS_BETWEEN
LANGUAGE SQL
DETERMINISTIC
NO EXTERNAL ACTION
CONTAINS SQL
RETURN 12*(year(d1) - year(d2)) + month(d1) - month(d2)
+ (TIMESTAMPDIFF(2,CHAR(d1 - (d2 + (12*(year(d1) - year(d2))
+ month(d1) - month(d2)) MONTHS))) / 2678400.0);

DROP FUNCTION NEXT_VAL_DATE;

CREATE FUNCTION NEXT_VAL_DATE
(
p_date  DATE, 
n_freq  BIGINT,
freq BIGINT
)
RETURNS DATE
LANGUAGE SQL SPECIFIC next_val_date DETERMINISTIC  READS SQL DATA

BEGIN ATOMIC

  DECLARE  reval_date DATE;--
	
	SET reval_date = p_date + n_freq DAYS;--
	
   IF freq = 2 THEN
   	    SET reval_date = p_date + (n_freq * 7) DAYS;				--
   ELSEIF freq = 3 THEN
        SET reval_date = p_date + n_freq month;--
   ELSEIF freq = 4 THEN
       SET reval_date =  p_date + (n_freq * 12) month ;--
   END IF;	--
	
	RETURN  reval_date;--
END;

DROP FUNCTION NVL2;

CREATE FUNCTION NVL2
(
expr1 VARCHAR(200), 
expr2 VARCHAR(200), 
expr3 VARCHAR(200)
)
RETURNS VARCHAR(200)
LANGUAGE SQL 
SPECIFIC NVL2
DETERMINISTIC  

BEGIN ATOMIC

IF expr1 IS NULL THEN
 RETURN expr3 ;--
ELSE 
 RETURN expr2 ;--
END IF ;--

END;

DROP FUNCTION ROUND(Timestamp, VARCHAR(5));

CREATE FUNCTION ROUND(inTS Timestamp, Fmt VARCHAR(5))
 RETURNS Timestamp
 LANGUAGE SQL
 SPECIFIC ROUND
 CONTAINS SQL
 NO EXTERNAL ACTION
 DETERMINISTIC
BEGIN ATOMIC
DECLARE Jan01, Mon01 DATE;--
DECLARE UCASE_Fmt VarChar(5);--

SET UCASE_Fmt = UCASE(Fmt);--

IF UCASE_Fmt  = 'WW' THEN
   SET Jan01 = DATE(SUBSTR(CHAR(inTS),1,4)||'001');--
ELSEIF UCASE_Fmt = 'W' THEN
   SET Mon01 = DATE(inTS) - (DAY(inTS)-1) DAYS;--
END IF;--

RETURN
CASE
WHEN UCASE_Fmt IN ('CC', 'BCC') THEN
     TIMESTAMP(SUBSTR(DIGITS(YEAR(inTS)+100),7,2) || '00-01-01-00.00.00.000000')
WHEN UCASE_Fmt IN ('SYYYY', 'YYYY', 'YEAR', 'SYEAR', 'YYY', 'YY', 'Y') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS + 7 MONTHS),1, 4) || '-01-01-00.00.00.000000')
WHEN UCASE_Fmt IN ('MONTH', 'MON', 'MM', 'RM') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS + 1 MONTH - 15 DAYS),1, 7) || '-01-00.00.00.000000')
WHEN UCASE_Fmt IN ('DDD', 'DD', 'J') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1,10) || '-00.00.00.000000')
WHEN UCASE_Fmt = 'WW' THEN
     TIMESTAMP(CHAR(Jan01 + MOD(DAYOFWEEK(inTS)-DAYOFWEEK(Jan01)+7,7) DAYS,ISO) || '-00.00.00.000000')
WHEN UCASE_Fmt = 'W' THEN
     TIMESTAMP(CHAR(Mon01 + MOD(DAYOFWEEK(inTS)-DAYOFWEEK(Mon01)+7,7) DAYS,ISO) || '-00.00.00.000000')
WHEN UCASE_Fmt IN ('DAY', 'DY', 'D') THEN
     TIMESTAMP(CHAR(DATE(inTS) - (DAYOFWEEK(inTS)-1) DAYS,ISO) || '-00.00.00.000000')
WHEN UCASE_Fmt IN ('HH', 'HH12', 'HH24') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1,13) || '.00.00.000000')
WHEN UCASE_Fmt = 'MI' THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1,16) || '.00.000000')
END;--

END;

DROP FUNCTION ROUND(Timestamp);

DROP FUNCTION RPAD;

CREATE FUNCTION ROUND(inTS Timestamp)
 RETURNS Timestamp
 LANGUAGE SQL
 SPECIFIC ROUND_ORACLE_TS
 CONTAINS SQL
 NO EXTERNAL ACTION
 DETERMINISTIC
RETURN
     TIMESTAMP(SUBSTR(CHAR(inTS), 1, 10) || '-00.00.00.000000');


CREATE FUNCTION RPAD 
(
	C1 VARCHAR(4000), 
  N integer, 
	C2 VARCHAR(4000)
	)
 RETURNS VARCHAR(4000)
 SPECIFIC RPAD
 LANGUAGE SQL
 DETERMINISTIC
 CONTAINS SQL
 NO EXTERNAL ACTION

BEGIN ATOMIC

DECLARE RESULT   VARCHAR(4000);--
DECLARE cLength   int;--

DECLARE temp   int;--
DECLARE temp1   int;--
DECLARE temp2   int;--

 SET cLength = length(C1) ;--

  SET temp =  (( sign( N-length(C1))+1)/2 )  ;--
  SET temp1 = (length(C2)+1-sign(length(C2)))  ;--
  SET temp2 = ( N-length(C1)+length(C2))  ;--

 SET RESULT = substr( C1 || repeat( C2, temp * temp2 / temp1 ), 1, N);--
 RETURN  RESULT	 ;	--
END;

DROP FUNCTION TO_DB2_DATE;

CREATE FUNCTION TO_DB2_DATE(param1 varchar(30) , param2 varchar(30))
LANGUAGE SQL 
SPECIFIC to_db2_date
RETURNS timestamp

BEGIN ATOMIC
  declare str1 varchar(30);--
	declare val int;--

	set str1 = substr(param1,7,4);--
  set str1 = concat(str1,'-');--
	set str1  = concat(str1,substr(param1,1,2));--
	set str1  = concat(str1,'-');--
	set str1  = concat(str1,substr(param1,4,2));--
	set str1  = concat(str1,' ');--
	if substr(param1,21,2)= 'PM' and int(substr(param1,12,2)) < 12 then
	  set val = int(substr(param1,12,2))+12;--
		  set str1  = concat(str1, cast(val as char(2)));--
	else	
	  set str1  = concat(str1,substr(param1,12,2));	--
	end if;	--
	set str1  = concat(str1,':');--
	set str1  = concat(str1,substr(param1,15,2));--
	set str1  = concat(str1,':');--
	set str1  = concat(str1,substr(param1,18,2));--
  RETURN timestamp(str1);--
END;

DROP FUNCTION CONVERT_CURRENCY;

CREATE FUNCTION CONVERT_CURRENCY(
i_from_currency varchar(20), 
i_to_currency   varchar(20),
i_amount       DECIMAL(14)
) 
SPECIFIC convert_currency1
returns DECIMAL(14)
return select 
      1
    from sysibm.sysdummy1;

DROP FUNCTION CONVERT_CURRENCY_DOUBLE;

CREATE FUNCTION CONVERT_CURRENCY_DOUBLE(
i_from_currency varchar(20), 
i_to_currency   varchar(20),
i_amount       DECIMAL(14)
) 
SPECIFIC convert_currency_double
returns DOUBLE
return select 
      1
    from sysibm.sysdummy1;
    
DROP FUNCTION CONVERT_CURRENCY_CHAR;   

CREATE FUNCTION CONVERT_CURRENCY_CHAR(
	 i_from_currency VARCHAR(20), 
	 i_to_currency   VARCHAR(20),
	 i_amount       DECIMAL(14)
	 ) 
	 SPECIFIC convert_currency_char
     returns DECIMAL(14)
	 return select 
	       1
    from sysibm.sysdummy1;

DROP FUNCTION CONVERT_CURRENCY_LMTS;  

CREATE FUNCTION CONVERT_CURRENCY_LMTS(
i_from_currency CHAR(20), 
i_to_currency   varchar(20),
i_amount       DECIMAL(14)
) 
SPECIFIC convert_currency_lmts1
returns DOUBLE
return select 
      1
    from sysibm.sysdummy1;

DROP FUNCTION CONVERT_CURRENCY_LMTS;  
    
CREATE FUNCTION CONVERT_CURRENCY_LMTS(
i_from_currency VARCHAR(20), 
i_to_currency   VARCHAR(20),
i_amount        DOUBLE
) 
SPECIFIC convert_currency_lmts
returns DECIMAL(14)
return select 
      1
    from sysibm.sysdummy1;

DROP FUNCTION GET_HISTORY_ID_BY_ORDER;  

CREATE FUNCTION GET_HISTORY_ID_BY_ORDER(p_trx_id VARCHAR(20),p_order
BIGINT)
 RETURNS BIGINT
  LANGUAGE SQL
  SPECIFIC get_history_id_by_order
	BEGIN ATOMIC 	
   DECLARE	v_num 		BIGINT DEFAULT 0;--
	 DECLARE v_hist_id 	BIGINT;--
	 DECLARE v_is_found	VARCHAR(5) DEFAULT 'false';--

 for_loop:
	FOR hist_loop AS
	 		SELECT tr_history_id
		     FROM trans_history
		  WHERE transaction_id = p_trx_id
		    AND from_state IN ('PENDING_CREATE', 'PENDING_UPDATE')
		    AND to_state = 'ACTIVE'
		  ORDER BY transaction_date DESC
	DO
		SET v_num = v_num + 1;--
		SET v_hist_id = hist_loop.tr_history_id;--

		IF v_num = p_order THEN
		  LEAVE for_loop;--
		END IF;	--
	END FOR;--
 RETURN v_hist_id;--
END;

DROP FUNCTION GREATER_DATE;  

CREATE FUNCTION GREATER_DATE
(
date1  TIMESTAMP,
date2  TIMESTAMP
)
RETURNS TIMESTAMP
SPECIFIC greater_date1
LANGUAGE SQL  

BEGIN ATOMIC

		IF (date1 IS NULL AND date2 IS NULL )THEN
				RETURN NULL;--
		ELSEIF( date1 = date2) THEN
			RETURN date1;--
		ELSEIF(date1 IS NOT NULL AND date2 IS NOT NULL) THEN
			IF(date1 < date2 )THEN
				RETURN date2;--
			ELSE
				RETURN date1;--
			END IF;--
		ELSEIF(date1 IS NOT NULL) THEN
			RETURN date1;--
		ELSEIF(date2 IS NOT NULL) THEN
			RETURN date2;--
		END IF;--

END;

DROP FUNCTION TS_TO_CHAR;  

CREATE FUNCTION TS_TO_CHAR(ts timestamp, formatstr varchar(30))
returns varchar(60) LANGUAGE SQL SPECIFIC ts_to_char 
BEGIN ATOMIC 
	IF formatstr = 'dd/mm/yyyy hh24:mi'
		THEN return rtrim(char(day(ts))) || '/' || rtrim(char(month(ts))) || '/'
			|| rtrim(char(year(ts))) || ' ' || rtrim(char(hour(ts))) || ':' || rtrim(char(minute(ts)));--
	ELSEIF formatstr = 'dd/mm/yyyy' 
		THEN return rtrim(char(day(ts))) || '/'
			|| rtrim(char(month(ts))) || '/' || rtrim(char(year(ts)));-- 
	ELSE return char(ts);-- 
	END IF;-- 
END;


DROP FUNCTION SYSDATE;  

CREATE FUNCTION SYSDATE()
 RETURNS Timestamp
 LANGUAGE SQL
 SPECIFIC SYSDATE
 NOT DETERMINISTIC
 CONTAINS SQL
 NO EXTERNAL ACTION
 RETURN 
CURRENT TIMESTAMP;

DROP FUNCTION TO_DATE;  

CREATE FUNCTION TO_DATE (inCH Varchar(50), inFMT Varchar(50))
 RETURNS Timestamp
 SPECIFIC TO_DATE
 LANGUAGE SQL
 CONTAINS SQL
 EXTERNAL ACTION
 DETERMINISTIC
BEGIN ATOMIC

DECLARE RetDate      DATE;--
DECLARE RetTime      TIME;--

DECLARE cYear        CHAR(4)     default '0001';--
DECLARE cMonth       VARCHAR(2)  default '01';--
DECLARE cDay         VARCHAR(2)  default '01';--
DECLARE cHour        VARCHAR(2)  default '00';--
DECLARE cMinute      CHAR(2)     default '00';--
DECLARE cSecond      CHAR(2)     default '00';--
DECLARE cDayOfYear   CHAR(3)     default '';--
DECLARE MicroSecond  INTEGER default 0;--
DECLARE MidnightSecond INTEGER default NULL;--

DECLARE adjustHour   INTEGER     default 0;--

DECLARE FMT          CHAR(50)    default '';--
DECLARE FMTlen       INTEGER     default 1;--
DECLARE normCH       CHAR(50)    default '';--

DECLARE Diag_text    VARCHAR(70) default '';--

DECLARE Fpos         INTEGER;--
DECLARE Cpos         INTEGER;--
DECLARE Nlen         INTEGER;--
DECLARE Flen         INTEGER;--
DECLARE FFdigit      INTEGER;--

SET FMT    = TRANSLATE(inFMT);--
SET FMTlen = LENGTH(inFMT);--
SET normCH = TRANSLATE(inCH) || '@@@@@@';--

SET Fpos = 1;--
SET Cpos = 1;--
MainLoop: WHILE Fpos <= FMTlen DO

   SET Nlen = 6 - LENGTH(LTRIM(TRANSLATE(LTRIM(SUBSTR(normCH,Cpos,6)),'*          ',' 0123456789')));--

   IF SUBSTR(FMT, Fpos, 2) = 'YY' THEN
      IF SUBSTR(FMT, Fpos, 4) = 'YYYY' THEN
         SET cYear = SUBSTR(inCH, Cpos, 4);--
         SET Fpos = Fpos + 4;--
         SET Cpos = Cpos + 4;--
      ELSEIF SUBSTR(FMT, Fpos, 3) = 'YYY' THEN
         SET cYear = '2' || SUBSTR(inCH, Cpos, 3);--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + 3;--
      ELSE
         SET cYear = '20' || SUBSTR(inCH, Cpos, 2);--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + 2;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'DD' THEN
      IF SUBSTR(FMT, Fpos, 3) = 'DDD' THEN
         SET cDayOfYear = SUBSTR('000', 1, 3 - Nlen) || TRANSLATE(SUBSTR(inCH, Cpos, Nlen),'0',' ');--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + Nlen;--
      ELSE
         SET cDay = TRANSLATE(SUBSTR(inCH, Cpos, Nlen),'0',' ');--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + Nlen;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'MM' THEN
      SET cMonth = TRANSLATE(SUBSTR(inCH, Cpos, Nlen),'0',' ');--
      SET Fpos = Fpos + 2;--
      SET Cpos = Cpos + Nlen;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'HH' THEN
      SET cHour = TRANSLATE(SUBSTR(inCH, Cpos, Nlen),'0',' ');--
      IF SUBSTR(FMT, Fpos, 4) = 'HH24' THEN
         SET Fpos = Fpos + 4;--
      ELSE
         IF cHour = '12' THEN
            SET cHour = '00';--
         END IF;--
         SET Fpos = Fpos + 2;--
      END IF;--
      SET Cpos = Cpos + Nlen;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'MI' THEN
      SET cMinute = TRANSLATE(SUBSTR(inCH, Cpos, 2),'0',' ');--
      SET Fpos = Fpos + 2;--
      SET Cpos = Cpos + 2;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'SS' THEN
      IF SUBSTR(FMT, Fpos, 5) = 'SSSSS' THEN
         SET MidnightSecond  = INTEGER(SUBSTR(inCH, Cpos, Nlen));--
         SET Fpos = Fpos + 5;--
         SET Cpos = Cpos + Nlen;--
      ELSE
         SET cSecond = TRANSLATE(SUBSTR(inCH, Cpos, 2),'0',' ');--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + 2;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 3) = 'MON' THEN
      IF SUBSTR(FMT, Fpos, 5) = 'MONTH' THEN
         SET cMonth = CASE SUBSTR(normCH, Cpos, 9)
                      WHEN 'JANUARY  ' THEN '01'
                      WHEN 'FEBRUARY ' THEN '02'
                      WHEN 'MARCH    ' THEN '03'
                      WHEN 'APRIL    ' THEN '04'
                      WHEN 'MAY      ' THEN '05'
                      WHEN 'JUNE     ' THEN '06'
                      WHEN 'JULY     ' THEN '07'
                      WHEN 'AUGUST   ' THEN '08'
                      WHEN 'SEPTEMBER' THEN '09'
                      WHEN 'OCTOBER  ' THEN '10'
                      WHEN 'NOVEMBER ' THEN '11'
                      WHEN 'DECEMBER ' THEN '12'
                      ELSE                  'XX'
                      END;--
         IF cMonth = 'XX' THEN
            SET Diag_text = 'Specified month "' || SUBSTR(normCH, Cpos, 9) || '" is invalid.';--
            SIGNAL SQLSTATE 'U1843' SET MESSAGE_TEXT = Diag_text;--
         END IF;--
         SET Fpos = Fpos + 5;--
         SET Cpos = Cpos + 9;--
      ELSE
         SET cMonth = CASE SUBSTR(normCH, Cpos, 3)
                      WHEN 'JAN' THEN '01'
                      WHEN 'FEB' THEN '02'
                      WHEN 'MAR' THEN '03'
                      WHEN 'APR' THEN '04'
                      WHEN 'MAY' THEN '05'
                      WHEN 'JUN' THEN '06'
                      WHEN 'JUL' THEN '07'
                      WHEN 'AUG' THEN '08'
                      WHEN 'SEP' THEN '09'
                      WHEN 'OCT' THEN '10'
                      WHEN 'NOV' THEN '11'
                      WHEN 'DEC' THEN '12'
                      ELSE            'YY'
                      END;--
         IF cMonth = 'YY' THEN
            SET Diag_text = 'Specified month "' || SUBSTR(normCH, Cpos, 3) || '" is invalid.';--
            SIGNAL SQLSTATE 'U1843' SET MESSAGE_TEXT = Diag_text;--
         END IF;--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + 3;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 1) = 'A' THEN
      IF SUBSTR(FMT, Fpos, 4) = 'A.M.' THEN
         IF SUBSTR(normCH, Cpos, 4) = 'P.M.' THEN
            SET adjustHour = 12;--
         END IF;--
         SET Fpos = Fpos + 4;--
         SET Cpos = Cpos + 4;--
      ELSE
         IF SUBSTR(normCH, Cpos, 2) = 'PM' THEN
               SET adjustHour = 12;--
         END IF;--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + 2;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'FF' THEN
      IF SUBSTR(FMT, Fpos+2, 1) IN ('1','2','3','4','5','6') THEN
         SET FFdigit = INTEGER(SUBSTR(FMT, Fpos+2, 1));--
         SET MicroSecond = INTEGER(SUBSTR(inCH, Cpos, FFdigit))*POWER(10,6-FFdigit);--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + FFdigit;--
      ELSE
         SET MicroSecond = INTEGER(SUBSTR(inCH, Cpos, Nlen))*POWER(10,6-Nlen);--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + Nlen;--
      END IF;--
 
   ELSE
      SET Fpos = Fpos + 1;--
      SET Cpos = Cpos + 1;--

   END IF;--

END WHILE;--

IF cDayOfYear <> '' THEN
   SET RetDate = DATE(cYear || cDayOfYear);--
ELSE
   SET RetDate = DATE(cYear || '-' || cMonth || '-' || cDay);--
END IF;--

IF MidnightSecond IS NOT NULL THEN
   SET RetTime = TIME('00:00:00') + (MidnightSecond) SECONDS;--
ELSE
   SET RetTime = TIME(cHour || ':' || cMinute || ':' || cSecond);--
END IF;--

SET RetTime = RetTime + (adjustHour) HOURS;--

RETURN TIMESTAMP(RetDate, RetTime) + (MicroSecond) MICROSECONDS;--

END;

DROP FUNCTION TRUNC(Timestamp);  

CREATE FUNCTION TRUNC(inTS Timestamp)
 RETURNS Timestamp
 LANGUAGE SQL
 SPECIFIC TRUNC_TS
 CONTAINS SQL
 NO EXTERNAL ACTION
 DETERMINISTIC
RETURN  TIMESTAMP(SUBSTR(CHAR(inTS), 1, 10) || '-00.00.00.000000');

DROP FUNCTION TRUNC(DATE);  

CREATE FUNCTION TRUNC(inTS DATE)
 RETURNS DATE
 SPECIFIC TRUNC_DATE
 LANGUAGE SQL 
 CONTAINS SQL
 NO EXTERNAL ACTION
 DETERMINISTIC
RETURN   DATE(SUBSTR(CHAR(inTS), 1, 10));

DROP FUNCTION TRUNC(Timestamp, VarChar(5));  

CREATE FUNCTION TRUNC(inTS Timestamp, Fmt VarChar(5))
 RETURNS Timestamp
 LANGUAGE SQL
 SPECIFIC TRUNC_TS_FMT
 CONTAINS SQL
 NO EXTERNAL ACTION
 DETERMINISTIC
BEGIN ATOMIC
DECLARE Jan01, Mon01 DATE;--
DECLARE UCASE_Fmt VarChar(5);--

SET UCASE_Fmt = UCASE(Fmt);--

IF UCASE_Fmt  = 'WW' THEN
   SET Jan01 = DATE(SUBSTR(CHAR(inTS),1,4)||'001');--
ELSEIF UCASE_Fmt = 'W' THEN
   SET Mon01 = DATE(inTS) - (DAY(inTS)-1) DAYS;--
END IF;--

RETURN
CASE
WHEN UCASE_Fmt IN ('CC', 'BCC') THEN
     TIMESTAMP(SUBSTR(DIGITS(YEAR(inTS)+100),7,2) || '00-01-01-00.00.00.000000')
WHEN UCASE_Fmt IN ('SYYYY', 'YYYY', 'YEAR', 'SYEAR', 'YYY', 'YY', 'Y') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1, 4) || '-01-01-00.00.00.000000')
WHEN UCASE_Fmt IN ('MONTH', 'MON', 'MM', 'RM') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1, 7) || '-01-00.00.00.000000')
WHEN UCASE_Fmt IN ('DDD', 'DD', 'J') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1,10) || '-00.00.00.000000')
WHEN UCASE_Fmt = 'WW' THEN
     TIMESTAMP(CHAR(Jan01 + MOD(DAYOFWEEK(inTS)-DAYOFWEEK(Jan01)+7,7) DAYS,ISO) || '-00.00.00.000000')
WHEN UCASE_Fmt = 'W' THEN
     TIMESTAMP(CHAR(Mon01 + MOD(DAYOFWEEK(inTS)-DAYOFWEEK(Mon01)+7,7) DAYS,ISO) || '-00.00.00.000000')
WHEN UCASE_Fmt IN ('DAY', 'DY', 'D') THEN
     TIMESTAMP(CHAR(DATE(inTS) - (DAYOFWEEK(inTS)-1) DAYS,ISO) || '-00.00.00.000000')
WHEN UCASE_Fmt IN ('HH', 'HH12', 'HH24') THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1,13) || '.00.00.000000')
WHEN UCASE_Fmt = 'MI' THEN
     TIMESTAMP(SUBSTR(CHAR(inTS),1,16) || '.00.000000')
END;--

END;

DROP FUNCTION TRUNC(Timestamp, VarChar(20));  

CREATE FUNCTION TS_FMT(TS TIMESTAMP, FMT VARCHAR(20)) 
returns varchar(50) 
SPECIFIC TS_FMT_ORACLE
return 
with tmp (dd,mm,yyyy,hh,mi,ss,nnnnnn) as 
( 
    select 
    substr( digits (day(TS)),9), 
    substr( digits (month(TS)),9) , 
    rtrim(char(year(TS))) , 
    substr( digits (hour(TS)),9), 
    substr( digits (minute(TS)),9), 
    substr( digits (second(TS)),9), 
    rtrim(char(microsecond(TS))) 
    from sysibm.sysdummy1 
    ) 
select 
case fmt 
    when 'yyyymmdd' 
        then yyyy || mm || dd 
	when 'mmyyyy' 
        then mm || yyyy 		
	when 'ddmmyyyy' 
        then dd|| mm || yyyy 		
    when 'mm/dd/yyyy' 
        then mm || '/' || dd || '/' || yyyy 
    when 'dd/mm/yyyy' 
        then dd || '/' || mm || '/' || yyyy 
	when 'dd/mm/yyyy hh:mi:ss' 
        then dd || '/' || mm || '/' || yyyy || ' ' ||  
               hh || ':' || mi || ':' || ss
    when 'yyyy/dd/mm hh:mi:ss' 
        then yyyy || '/' || mm || '/' || dd || ' ' ||  
               hh || ':' || mi || ':' || ss 
    when 'nnnnnn' 
        then nnnnnn 
    else 
        'date format ' || coalesce(fmt,' <null> ') ||  
        ' not recognized.' 
    end 
from tmp;


DROP FUNCTION ADD_MONTHS_EXACT(DATE, BIGINT);  

CREATE FUNCTION ADD_MONTHS_EXACT
(
date_in  DATE,
months_shift  BIGINT
)
RETURNS DATE
LANGUAGE SQL SPECIFIC Add_Months_Exact_BigInt NOT DETERMINISTIC READS SQL DATA
	
   BEGIN ATOMIC				
		
		DECLARE return_value DATE;  --
		DECLARE day_of_month VARCHAR(20);--
		DECLARE month_year  VARCHAR(20);--
		DECLARE end_of_month DATE;--
		DECLARE end_of_month1 DATE;--
		
		DECLARE lasy_day  DATE ;--

    SET return_value = date_in +  months_shift MONTH;--
		SET lasy_day = LAST_DAY (date_in ) ;--
		
		IF (date_in = lasy_day) THEN 
		 SET day_of_month = DT_FMT (date_in,'dd');		--
		 SET month_year = DT_FMT (return_value, 'mmyyyy');--
		
				--	SET end_of_month = TO_DATE (month_year , 'MMYYYYDD');--
					--end_of_month := TO_DATE (month_year || day_of_month, 'MMYYYYDD');--
					
          -- set return_value  = LEAST (return_value, end_of_month);--
					
		END IF;--

       
 RETURN return_value;--

END;


DROP FUNCTION ADD_MONTHS_EXACT(DATE, INT);  

CREATE FUNCTION ADD_MONTHS_EXACT
(
date_in  DATE,
months_shift  INT
)
RETURNS DATE
LANGUAGE SQL SPECIFIC Add_Months_Exact NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC				

     RETURN ADD_MONTHS_EXACT(date_in, CAST(months_shift as BIGINT));--

END;

DROP FUNCTION NEXT_VAL_DATE_EXACT; 

CREATE FUNCTION NEXT_VAL_DATE_EXACT(DATE, BIGINT, VARCHAR(20))
(
p_date DATE, 
n_freq BIGINT,
freq  VARCHAR(20)
)
RETURNS DATE
LANGUAGE SQL SPECIFIC Next_Val_Date_Exact DETERMINISTIC 

BEGIN ATOMIC

DECLARE reval_date DATE;--

		SET reval_date = p_date + n_freq DAYS;--
		
   IF freq = '2' THEN
     SET reval_date = p_date + (n_freq * 7) DAYS;--
   END IF;--
   IF freq = '3' THEN
        SET reval_date = Add_Months_Exact(p_date, n_freq);--
   END IF;--
   IF freq = '4' THEN
       SET reval_date  = Add_Months_Exact(p_date, (n_freq * 12));--
   END IF;--
	
	 RETURN reval_date;--

END;

DROP FUNCTION NEXT_VAL_DATE_EXACT(DATE, INT, INT); 

CREATE FUNCTION NEXT_VAL_DATE_EXACT
(
p_date DATE, 
n_freq INT,
freq  INT
)
RETURNS DATE
LANGUAGE SQL SPECIFIC Next_Val_Date_Exact_fint DETERMINISTIC 

BEGIN ATOMIC
	
	 RETURN NEXT_VAL_DATE_EXACT(p_date, CAST(n_freq as BIGINT), char(freq));--

END;

DROP FUNCTION NEXT_VAL_DATE_EXACT(TIMESTAMP, BIGINT, VARCHAR(20)); 

CREATE FUNCTION NEXT_VAL_DATE_EXACT
(
p_date TIMESTAMP, 
n_freq BIGINT,
freq  VARCHAR(20)
)
RETURNS DATE
LANGUAGE SQL SPECIFIC Next_Val_Date_Exact_TS DETERMINISTIC 

BEGIN ATOMIC
    RETURN NEXT_VAL_DATE_EXACT(date(p_date), n_freq, freq);--
END;

DROP FUNCTION CONVERT_AMT(DECIMAL(20,2), CHAR(3), CHAR(3)); 

CREATE FUNCTION CONVERT_AMT
(
in_amt  DECIMAL(20,2), 
in_currency_code CHAR(3), 
to_currency_code  CHAR(3)
)
   RETURNS DECIMAL(20,2)
   LANGUAGE SQL
   SPECIFIC CONVERT_AMT
   DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC
	
			DECLARE v_base_currency_code CHAR(3);--
			DECLARE v_ret_amt DECIMAL(20,2);--
			DECLARE v_convert_rate DECIMAL(21,6);--
			
			SET v_base_currency_code = 'MYR';--
			
  		SET v_convert_rate = 1;--
  		SET v_ret_amt = 0;--

        IF in_currency_code <> to_currency_code THEN 
            IF in_currency_code <> v_base_currency_code THEN
                IF (in_amt IS NOT NULL AND in_currency_code IS NOT NULL) THEN

                        FOR REC AS SELECT BUY_RATE 
                                        FROM CMS_FOREX 
                                        WHERE BUY_CURRENCY = in_currency_code
                                        AND SELL_CURRENCY = v_base_currency_code

                        DO 
                            SET v_convert_rate = REC.BUY_RATE; --	
                            SET v_ret_amt = (in_amt * v_convert_rate);--
                        END FOR;--

                END IF;--
            ELSE
                SET v_ret_amt = in_amt;--
            END IF;--
	

            IF to_currency_code <> v_base_currency_code THEN
                IF (in_amt IS NOT NULL AND to_currency_code IS NOT NULL) THEN
                        FOR REC AS SELECT BUY_RATE 
                                        FROM CMS_FOREX 
                                        WHERE BUY_CURRENCY = to_currency_code
                                        AND SELL_CURRENCY = v_base_currency_code										
                        DO 
                        SET v_convert_rate = REC.BUY_RATE; --	
                        SET v_ret_amt = v_ret_amt / v_convert_rate;--
                        END FOR;--
                END IF;--
            END IF;--
        ELSE
            SET v_ret_amt = in_amt; --
        END IF; --
  RETURN v_ret_amt;	--
END;

DROP FUNCTION CONVERT_AMT(DECIMAL(20,2), VARCHAR(3), VARCHAR(3)); 

CREATE FUNCTION CONVERT_AMT 
(
in_amt  DECIMAL(20,2), 
in_currency_code VARCHAR(3), 
to_currency_code  VARCHAR(3)
)
RETURNS DECIMAL(20,2)
LANGUAGE SQL
SPECIFIC CONVERT_AMT_VARCHAR
DETERMINISTIC READS SQL DATA
BEGIN ATOMIC
      
        RETURN CONVERT_AMT(in_amt, CHAR(in_currency_code), CHAR(to_currency_code));--
   
END;   

DROP FUNCTION CONVERT_AMT(DECIMAL(20,2), CHAR(3), VARCHAR(3)); 
		  
CREATE FUNCTION CONVERT_AMT 
(
in_amt  DECIMAL(20,2), 
in_currency_code CHAR(3), 
to_currency_code VARCHAR(3)
)
RETURNS DECIMAL(20,2)
LANGUAGE SQL
SPECIFIC CONVERT_AMT_CHARVARCHAR
DETERMINISTIC READS SQL DATA
BEGIN ATOMIC
      
        RETURN CONVERT_AMT(in_amt, in_currency_code, CHAR(to_currency_code));--
   
END;   

DROP FUNCTION CONVERT_AMT_BYCTRY;

CREATE FUNCTION CONVERT_AMT_BYCTRY 
(
in_amt  DECIMAL(20,2), 
in_currency_code VARCHAR(3), 
to_country  VARCHAR(3)
)
RETURNS DECIMAL(20,2)
LANGUAGE SQL
SPECIFIC CONVERT_AMT_BYCTRY
DETERMINISTIC READS SQL DATA
BEGIN ATOMIC   
    RETURN CONVERT_AMT(in_amt, CHAR(in_currency_code), (SELECT CUR_CRRNCY_ISO_CODE FROM SCI_CURRENCY WHERE CUR_CNTRY_ISO_CODE = to_country));--
END;   

DROP FUNCTION CALENDAR_DAYS;

CREATE FUNCTION CALENDAR_DAYS
(p_to_date  DATE, 
 p_from_date  DATE
)

   RETURNS BIGINT
   LANGUAGE SQL
   SPECIFIC CALENDAR_DAYS
   DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC
	
	DECLARE caldays BIGINT;--
	
	 set caldays = (DAYS(DATE(p_to_date)) - DAYS(DATE(p_from_date)));--
	
  RETURN(caldays);	--
  END;
  
DROP FUNCTION BUSINESS_DAYS(DATE, DATE, VARCHAR(20));
  
CREATE FUNCTION BUSINESS_DAYS
(p_to_date  DATE,
p_from_date  DATE,
p_country VARCHAR(20) )
RETURNS BIGINT
LANGUAGE SQL SPECIFIC business_days_ NOT DETERMINISTIC

BEGIN ATOMIC 

	   DECLARE l_to_date     date  ; --
     DECLARE l_from_date   date ; --
		 DECLARE noOfDays BIGINT; --

		 IF ( p_country is null ) then
        SET noOfDays = ( SELECT COUNT(*) 
													FROM ( select rnum from nlist
																			where (rnum <= diff_days(p_to_date,p_from_date)) 
																)TEMP
													WHERE DAYNAME( p_from_date  + rnum DAYS ) not in ( 'Saturday', 'Sunday' )
											);--
				--SIGNAL SQLSTATE '71001'	;						--
     ELSE
					SET noOfDays = (select COUNT(*) 
													FROM ( select rnum from nlist
																			where (rnum <= diff_days(p_to_date,p_from_date))
																) TEMP
											WHERE DAYNAME( p_from_date  + rnum DAYS ) not in ( 'Saturday', 'Sunday' )
											 AND NOT EXISTS ( select 1 from cms_public_holiday
																				where DATE(holiday_date) = DATE(p_from_date)  + rnum DAYS
																				AND country_iso_code = p_country 
																				)
											);	--
											
			END IF; 		--
	 
return noofdays;--
END;

DROP FUNCTION BUSINESS_DAYS(DATE, DATE, VARCHAR(40));

CREATE FUNCTION business_days(
	p_to_date        DATE,
	p_from_date      DATE,
	country          VARCHAR(40) 
	)
RETURNS BIGINT
LANGUAGE SQL SPECIFIC business_days DETERMINISTIC

   BEGIN ATOMIC 
	   DECLARE l_to_date     date  ; --= trunc ( p_to_date );--
     DECLARE l_from_date   date ; --= trunc ( p_from_date );--
		 DECLARE n_days BIGINT; --

		SET  l_to_date = DATE( p_to_date );	--
		SET  l_from_date = DATE( p_from_date );	--
		
		if ( l_to_date is null or l_from_date is null )then
      return null;--
   end if;--
	
	 if ( l_to_date = l_from_date ) then
      return 0;--
   elseif ( l_to_date < l_from_date ) then	  
      return -1 * business_days_( l_from_date, l_to_date, country );--
   else
      return business_days_( l_to_date, l_from_date, country );		 --
   end if;--
			
RETURN n_days ;--
		
 END;

DROP FUNCTION DUE_DAYS;
 
CREATE FUNCTION DUE_DAYS (P_TO_DATE  DATE, P_FROM_DATE  DATE, P_REF_DAY
 BIGINT, COUNTRY  VARCHAR (40))
   RETURNS BIGINT
   LANGUAGE SQL SPECIFIC due_days
   DETERMINISTIC
   BEGIN ATOMIC
	
      DECLARE N_BUSI_DAYS BIGINT DEFAULT 0 ;--
      DECLARE N_DAYS BIGINT DEFAULT 0 ;--
			
      SET N_BUSI_DAYS = (BUSINESS_DAYS (P_TO_DATE,   P_FROM_DATE,    COUNTRY));--
      SET N_DAYS = (N_BUSI_DAYS - P_REF_DAY);--
			
      RETURN N_DAYS;--
   END;

DROP FUNCTION getMaxNotificationIDByDetails;

CREATE function getMaxNotificationIDByDetails(dtl VARCHAR(400), filter_date
TIMESTAMP,
	   i_user_id BIGINT, i_group_id BIGINT)
 LANGUAGE SQL  SPECIFIC getMaxNotificationIDByDetails
 RETURNS BIGINT 
 BEGIN ATOMIC
  DECLARE notify_id BIGINT;--
  SET notify_id = 0;--
  SET notify_id = (select fn.notification_id
	 	  from notification fn, notification_recipient fnr
		  where fn.DETAILS = dtl
		    and fn.notification_id = fnr.notification_id
		    and trunc(fn.expiry_date) >= trunc(filter_date)
		    and fnr.user_id in (-999999999, i_user_id)
		    and fnr.group_id = i_group_id
		  order by fn.creation_date desc, fn.notification_id
		 fetch first 1 rows only);--
   return notify_id;--
 end;

DROP FUNCTION FORMAT_DATE;

-- Convert Timestamp to specific Date Format String
create function FORMAT_DATE(TS timestamp, fmt varchar(25)) 
returns varchar(50) 
return 
with tmp (dd,mm,yyyy,hh,mi,ss,nnnnnn) as 
( 
    select 
    substr( digits (day(TS)),9), 
    substr( digits (month(TS)),9) , 
    rtrim(char(year(TS))) , 
    substr( digits (hour(TS)),9), 
    substr( digits (minute(TS)),9), 
    substr( digits (second(TS)),9), 
    rtrim(char(microsecond(TS))) 
    from sysibm.sysdummy1 
    ) 
select 
case fmt 
    when 'yyyymmdd' 
        then yyyy || mm || dd 
    when 'mm/dd/yyyy' 
        then mm || '/' || dd || '/' || yyyy 
    when 'dd/mm/yyyy' 
        then dd || '/' || mm || '/' || yyyy 
    when 'yyyy/dd/mm hh:mi:ss' 
        then yyyy || '/' || mm || '/' || dd || ' ' ||  
               hh || ':' || mi || ':' || ss 
    when 'nnnnnn' 
        then nnnnnn 
    when 'DD-Mon-YYYY'
        then dd || '-' || mm || '-' || yyyy 
    when 'HH24:MI:SS'
        then hh || ':' || mi || ':' || ss 
    when 'hh24:mi:ss'
        then hh || ':' || mi || ':' || ss 
    when 'YYYY-MM-DD HH24:MI:SS'    
        then yyyy || '-' || mm || '-' || dd || ' ' ||  
               hh || ':' || mi || ':' || ss 
    when 'YYYY-MM-DD'    
        then yyyy || '-' || mm || '-' || dd
    else 
        'date format ' || coalesce(fmt,' <null> ') ||  
        ' not recognized.' 
    end 
from tmp ;


-- Parse String to Timestamp 
-- DROP FUNCTION PARSE_DATE ( Varchar(50),  Varchar(50));

DROP FUNCTION PARSE_DATE;

CREATE FUNCTION PARSE_DATE (inCH Varchar(50), inFMT Varchar(50))
 RETURNS Timestamp
 SPECIFIC PARSE_DATE
 LANGUAGE SQL
 CONTAINS SQL
 EXTERNAL ACTION
 DETERMINISTIC
BEGIN ATOMIC

DECLARE RetDate      DATE;--
DECLARE RetTime      TIME;--

DECLARE cYear        CHAR(4)     default '0001';--
DECLARE cMonth       VARCHAR(2)  default '01';--
DECLARE cDay         VARCHAR(2)  default '01';--
DECLARE cHour        VARCHAR(2)  default '00';--
DECLARE cMinute      CHAR(2)     default '00';--
DECLARE cSecond      CHAR(2)     default '00';--
DECLARE cDayOfYear   CHAR(3)     default '';--
DECLARE MicroSecond  INTEGER default 0;--
DECLARE MidnightSecond INTEGER default NULL;--

DECLARE adjustHour   INTEGER     default 0;--

DECLARE FMT          CHAR(50)    default '';--
DECLARE FMTlen       INTEGER     default 1;--
DECLARE normCH       CHAR(50)    default '';--

DECLARE Diag_text    VARCHAR(70) default '';--

DECLARE Fpos         INTEGER;--
DECLARE Cpos         INTEGER;--
DECLARE Nlen         INTEGER;--
DECLARE Flen         INTEGER;--
DECLARE FFdigit      INTEGER;--

SET FMT    = TRANSLATE(inFMT);--
SET FMTlen = LENGTH(inFMT);--
SET normCH = TRANSLATE(inCH) || '@@@@@@';--

SET Fpos = 1;--
SET Cpos = 1;--
MainLoop: WHILE Fpos <= FMTlen DO

   SET Nlen = 6 - LENGTH(LTRIM(TRANSLATE(LTRIM(SUBSTR(normCH,Cpos,6)),'*          ',' 0123456789')));--

   IF SUBSTR(FMT, Fpos, 2) = 'YY' THEN
      IF SUBSTR(FMT, Fpos, 4) = 'YYYY' THEN
         SET cYear = SUBSTR(inCH, Cpos, 4);--
         SET Fpos = Fpos + 4;--
         SET Cpos = Cpos + 4;--
      ELSEIF SUBSTR(FMT, Fpos, 3) = 'YYY' THEN
         SET cYear = '2' || SUBSTR(inCH, Cpos, 3);--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + 3;--
      ELSE
         SET cYear = '20' || SUBSTR(inCH, Cpos, 2);--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + 2;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'DD' THEN
      IF SUBSTR(FMT, Fpos, 3) = 'DDD' THEN
         SET cDayOfYear = SUBSTR('000', 1, 3 - Nlen) || TRANSLATE(SUBSTR(inCH, Cpos, Nlen),'0',' ');--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + Nlen;--
      ELSE
         SET cDay = TRANSLATE(SUBSTR(inCH, Cpos, 2),'0',' ');--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + 2;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'MM' THEN
      SET cMonth = TRANSLATE(SUBSTR(inCH, Cpos, 2),'0',' ');--
      SET Fpos = Fpos + 2;--
      SET Cpos = Cpos + 2;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'HH' THEN
      SET cHour = TRANSLATE(SUBSTR(inCH, Cpos, Nlen),'0',' ');--
      IF SUBSTR(FMT, Fpos, 4) = 'HH24' THEN
         SET Fpos = Fpos + 4;--
      ELSE
         IF cHour = '12' THEN
            SET cHour = '00';--
         END IF;--
         SET Fpos = Fpos + 2;--
      END IF;--
      SET Cpos = Cpos + Nlen;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'MI' THEN
      SET cMinute = TRANSLATE(SUBSTR(inCH, Cpos, 2),'0',' ');--
      SET Fpos = Fpos + 2;--
      SET Cpos = Cpos + 2;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'SS' THEN
      IF SUBSTR(FMT, Fpos, 5) = 'SSSSS' THEN
         SET MidnightSecond  = INTEGER(SUBSTR(inCH, Cpos, Nlen));--
         SET Fpos = Fpos + 5;--
         SET Cpos = Cpos + Nlen;--
      ELSE
         SET cSecond = TRANSLATE(SUBSTR(inCH, Cpos, 2),'0',' ');--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + 2;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 3) = 'MON' THEN
      IF SUBSTR(FMT, Fpos, 5) = 'MONTH' THEN
         SET cMonth = CASE SUBSTR(normCH, Cpos, 9)
                      WHEN 'JANUARY  ' THEN '01'
                      WHEN 'FEBRUARY ' THEN '02'
                      WHEN 'MARCH    ' THEN '03'
                      WHEN 'APRIL    ' THEN '04'
                      WHEN 'MAY      ' THEN '05'
                      WHEN 'JUNE     ' THEN '06'
                      WHEN 'JULY     ' THEN '07'
                      WHEN 'AUGUST   ' THEN '08'
                      WHEN 'SEPTEMBER' THEN '09'
                      WHEN 'OCTOBER  ' THEN '10'
                      WHEN 'NOVEMBER ' THEN '11'
                      WHEN 'DECEMBER ' THEN '12'
                      ELSE                  'XX'
                      END;--
         IF cMonth = 'XX' THEN
            SET Diag_text = 'Specified month "' || SUBSTR(normCH, Cpos, 9) || '" is invalid.';--
            SIGNAL SQLSTATE 'U1843' SET MESSAGE_TEXT = Diag_text;--
         END IF;--
         SET Fpos = Fpos + 5;--
         SET Cpos = Cpos + 9;--
      ELSE
         SET cMonth = CASE SUBSTR(normCH, Cpos, 3)
                      WHEN 'JAN' THEN '01'
                      WHEN 'FEB' THEN '02'
                      WHEN 'MAR' THEN '03'
                      WHEN 'APR' THEN '04'
                      WHEN 'MAY' THEN '05'
                      WHEN 'JUN' THEN '06'
                      WHEN 'JUL' THEN '07'
                      WHEN 'AUG' THEN '08'
                      WHEN 'SEP' THEN '09'
                      WHEN 'OCT' THEN '10'
                      WHEN 'NOV' THEN '11'
                      WHEN 'DEC' THEN '12'
                      ELSE            'YY'
                      END;--
         IF cMonth = 'YY' THEN
            SET Diag_text = 'Specified month "' || SUBSTR(normCH, Cpos, 3) || '" is invalid.';--
            SIGNAL SQLSTATE 'U1843' SET MESSAGE_TEXT = Diag_text;--
         END IF;--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + 3;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 1) = 'A' THEN
      IF SUBSTR(FMT, Fpos, 4) = 'A.M.' THEN
         IF SUBSTR(normCH, Cpos, 4) = 'P.M.' THEN
            SET adjustHour = 12;--
         END IF;--
         SET Fpos = Fpos + 4;--
         SET Cpos = Cpos + 4;--
      ELSE
         IF SUBSTR(normCH, Cpos, 2) = 'PM' THEN
               SET adjustHour = 12;--
         END IF;--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + 2;--
      END IF;--

   ELSEIF SUBSTR(FMT, Fpos, 2) = 'FF' THEN
      IF SUBSTR(FMT, Fpos+2, 1) IN ('1','2','3','4','5','6') THEN
         SET FFdigit = INTEGER(SUBSTR(FMT, Fpos+2, 1));--
         SET MicroSecond = INTEGER(SUBSTR(inCH, Cpos, FFdigit))*POWER(10,6-FFdigit);--
         SET Fpos = Fpos + 3;--
         SET Cpos = Cpos + FFdigit;--
      ELSE
         SET MicroSecond = INTEGER(SUBSTR(inCH, Cpos, Nlen))*POWER(10,6-Nlen);--
         SET Fpos = Fpos + 2;--
         SET Cpos = Cpos + Nlen;--
      END IF;--
 
   ELSE
      SET Fpos = Fpos + 1;--
      SET Cpos = Cpos + 1;--

   END IF;--

END WHILE;--

IF cDayOfYear <> '' THEN
   SET RetDate = DATE(cYear || cDayOfYear);--
ELSE
   SET RetDate = DATE(cYear || '-' || cMonth || '-' || cDay);--
END IF;--

IF MidnightSecond IS NOT NULL THEN
   SET RetTime = TIME('00:00:00') + (MidnightSecond) SECONDS;--
ELSE
   SET RetTime = TIME(cHour || ':' || cMinute || ':' || cSecond);--
END IF;--

SET RetTime = RetTime + (adjustHour) HOURS;--

RETURN TIMESTAMP(RetDate, RetTime) + (MicroSecond) MICROSECONDS;--

END;


DROP FUNCTION NEXT_VAL_DATE;

CREATE FUNCTION NEXT_VAL_DATE
(
p_date  timestamp, 
n_freq  BIGINT,
freq varchar(20)
)
RETURNS timestamp
LANGUAGE SQL 
SPECIFIC NEXT_VAL_DATE2  
NO EXTERNAL ACTION 
DETERMINISTIC  
READS SQL DATA

BEGIN ATOMIC

  DECLARE  reval_date timestamp;--
	
	SET reval_date = p_date + n_freq DAYS;--
	
   IF freq = '2' or freq = 'W' THEN
   	    SET reval_date = p_date + (n_freq * 7) DAYS;				--
   ELSEIF freq = '3' or freq = 'M' THEN
        SET reval_date = p_date + n_freq month;--
   ELSEIF freq = '4' or freq = 'Y' THEN
       SET reval_date =  p_date + (n_freq * 12) month ;--
   END IF;	--
	
	RETURN  reval_date;--
END;	
  

DROP FUNCTION format_key;

CREATE FUNCTION format_key (TS TIMESTAMP, SEQ BIGINT)
   RETURNS BIGINT
   SPECIFIC format_key
   LANGUAGE SQL
   CONTAINS SQL
   NO EXTERNAL ACTION
   DETERMINISTIC

BEGIN ATOMIC
    DECLARE key BIGINT;--	
    SET key = CAST((rtrim(char(year(TS))) ||
               substr(digits (month(TS)),9) || 
               substr(digits (day(TS)),9) || 
               substr(digits(SEQ), 14)) AS BIGINT);--
    
    RETURN key;--
END;




COMMIT WORK;


/**************************************************************************
 Requestor : Cynthia Zhou
 Desc : Schema patches required for concentration report
 Task : Concentration Reports Module
 Date : 19/04/2007
*************************************************************************/
    
    


/**************************************************************************
 Requestor : Hui Sieng
 Desc : RPT_BIMONTHLY_DAY 
 Task : Report Module
 Date : 30 May 2007
*************************************************************************/

DROP FUNCTION RPT_BIMONTHLY_DAY;

CREATE FUNCTION RPT_BIMONTHLY_DAY 
(
  p_date  DATE, 
  p_report_master_id VARCHAR(20)
)
   RETURNS DATE
   LANGUAGE SQL
   SPECIFIC Rpt_Bimonthly_Day
   DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC
 
     DECLARE  currdate DATE ;--
   DECLARE fday_1   INT;--
   DECLARE fday_2   INT;--
   DECLARE currday   INT;--
   DECLARE CHECKING INT  DEFAULT 0;--
 
   SET currdate = p_date ;--
   
      FOR VL AS SELECT freq.FREQ_DAY_1 AS fday_11, freq.FREQ_DAY_2 AS fday_22
        FROM CMS_REPORT_FREQUENCY freq
        WHERE freq.report_master_id  = p_report_master_id
        AND freq.status = 'ACTIVE'
      DO
         SET fday_2 = fday_22; --
         SET fday_1 = fday_11;--
     SET CHECKING = 1;--
      END FOR;--
   
   IF p_date IS NULL THEN
       RETURN NULL;--
     END IF;--
   
   IF CHECKING = 1 THEN
       SET fday_1 = 1;--
       SET fday_2 = 15;--
     END IF;--
 
   
   IF (fday_1 <= currday AND currday < fday_2) THEN
     SET currdate = currdate - (currday - fday_1) DAYS ;--
   ELSEIF (currday >= fday_2) THEN
     SET currdate = currdate - (currday - fday_2) DAYS;--
   ELSE
     SET currdate = (currdate -1 MONTH) + (fday_2 - currday) DAYS;--
   END IF;--
   
  RETURN currDate;--
  END;
  
  
  
/**************************************************************************
 Requestor : Jitendra
 Desc : ADD_MONTHS 
 Task : Report Module
 Date : 30 May 2007
*************************************************************************/  

DROP FUNCTION ADD_MONTHS;

CREATE FUNCTION ADD_MONTHS(v_date DATE, noOfMonths INT)
RETURNS DATE
SPECIFIC ADD_MONTHS
LANGUAGE SQL
CONTAINS SQL
NO EXTERNAL ACTION
DETERMINISTIC
BEGIN ATOMIC
    RETURN (v_date + noOfMonths months);--
END;


/**************************************************************************
 Requestor : Allen
 Desc : Function to retrieve common code description in report
 Date : 31 May 2007
*************************************************************************/

DROP FUNCTION GET_COMMON_CODE_DESC;

CREATE FUNCTION GET_COMMON_CODE_DESC (
   i_ENTRY_CODE   VARCHAR(40),
   i_CATEGORY_CODE   VARCHAR(40)
)
RETURNS VARCHAR(255)
LANGUAGE SQL SPECIFIC GET_COMMON_CODE_DESC NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC
  
 DECLARE result VARCHAR(255);--
 
 SET result = (SELECT ENT.ENTRY_NAME 
  FROM COMMON_CODE_CATEGORY_ENTRY ENT        
  WHERE ENT.CATEGORY_CODE = i_CATEGORY_CODE
  AND ENT.ENTRY_CODE = i_ENTRY_CODE
        FETCH FIRST 1 ROW ONLY
  ) ;--
 
   return result;--
end
;


/*********************************************************************
   Build       : GCMS_R1.0_B001V38
   Type        : Schema Patch
   Date        : 02/07/2007
   Patch       : Build 38 - UAT  
   Start Email : Friday, June 29, 2007 4:03 PM
                          [Allen Teoh <ateoh@integrosys.com>]
                          [Code Patch for Build #B001V38 (Report)]
   End Email   : Friday, June 29, 2007 4:14 PM
                          [Allen Teoh <ateoh@integrosys.com>]
                          [Code Patch for Build #B001V38 (Report)]
   
*********************************************************************/  

/**************************************************************************
 Requestor : Allen Teoh
 Desc :  Report
 Date : 29 June 2007
*************************************************************************/

DROP FUNCTION ADD_DATE(DATE, VARCHAR(3));

CREATE FUNCTION ADD_DATE(v_date DATE, unit BIGINT,frequency VARCHAR(3))
RETURNS DATE
SPECIFIC ADD_DATE_BIGINT
BEGIN ATOMIC
DECLARE RESULT DATE;--
    IF frequency = '1'  THEN 
            set RESULT= (v_date + unit days);--
    ELSEIF frequency = '2'  THEN 
            set RESULT= (v_date + (unit*7) days);--
    ELSEIF frequency = '3'  THEN 
            set RESULT= (v_date + unit month);--
     ELSEIF frequency = '4'  THEN 
            set RESULT= (v_date + unit year);--
    ELSE         
            set RESULT= (v_date);--
    END IF;--
 
return RESULT;--
END;

DROP FUNCTION ADD_DATE(DATE, VARCHAR(10), INT);

CREATE FUNCTION ADD_DATE(v_date DATE, unitV VARCHAR(10),frequency INT)
RETURNS DATE
SPECIFIC ADD_DATE
BEGIN ATOMIC
DECLARE RESULT DATE;--
DECLARE unit INT;--
    set unit=INT(unitV);--    
    return ADD_DATE(v_date, unit, CHAR(frequency));--
END;


/*********************************************************************
   Build       : GCMS_R1.0_B001V43
   Type        : Schema Patch
   Date        : 06/07/2007
   Patch       : Build 43 - UAT  
   Start Email : Friday, July 06, 2007 3:11 PM
                          [Eric <ehue@integrosys.com>]
                          [DB Patch for Build #B001V43]   
   End Email   : Friday, July 06, 2007 3:53 PM
                          [kl <kltan@integrosys.com]
                          [DB patch for build B001V43 (DW)]   
   
*********************************************************************/  


/**************************************************************************
 Requestor : Tan Pei Cheng
 Desc : Schema patches required for Datawarehouse export file
 Task : Datawarehouse Module 
 Date : 06/07/2007
*************************************************************************/

DROP FUNCTION REMOVE_LINE;

CREATE FUNCTION REMOVE_LINE (MLINE VARCHAR(2500))

   RETURNS VARCHAR(2500)
   LANGUAGE SQL
   SPECIFIC REMOVE_LINE
   DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC
	
   RETURN REPLACE( REPLACE( MLINE, CHR(13), '' ), CHR(10), ' ' );--
END;

DROP FUNCTION IS_DUEDATE_VALID_RPT(date, date, VARCHAR(10), VARCHAR(1));

CREATE FUNCTION IS_DUEDATE_VALID_RPT(
        p_chk_date date,
        p_param_date date, 
        p_mis_rpt_id VARCHAR(10),
        p_incl_overdue_ind VARCHAR(1) )
RETURNS VARCHAR(10)  LANGUAGE SQL
SPECIFIC IS_DUEDATE_VALID_RPT
BEGIN ATOMIC
    declare v_valid_freq    decimal;--
    declare v_valid_freq_unit   CHAR;--

    IF (p_incl_overdue_ind = 'Y') THEN
        IF (p_chk_date < p_param_date) THEN
            RETURN 'TRUE';--
        END IF;--
    END IF;--

	  set v_valid_freq = (select valid_freq from cms_report_duedate_param 
				where mis_report_id = p_mis_rpt_id 
				and status = 'ACTIVE');--

	  set v_valid_freq_unit = (select valid_freq_unit from cms_report_duedate_param 
					where mis_report_id = p_mis_rpt_id 
					and status = 'ACTIVE');--											

    IF (v_valid_freq_unit = 'Y') THEN
		
        IF p_chk_date BETWEEN p_param_date and
						p_param_date + (12 * v_valid_freq) months
        THEN RETURN 'TRUE';--
        ELSE RETURN 'FALSE';--
        END IF;--
				
    ELSEIF (v_valid_freq_unit = 'M') THEN
		
        IF p_chk_date BETWEEN p_param_date 
						and p_param_date  + v_valid_freq months
        THEN RETURN 'TRUE';--
        ELSE RETURN 'FALSE';--
        END IF;--
				
    ELSEIF (v_valid_freq_unit = 'W') THEN
       
		IF p_chk_date BETWEEN p_param_date and p_param_date + (7 * v_valid_freq) days
        THEN RETURN 'TRUE';--
        ELSE RETURN 'FALSE';--
        END IF;--
				
    ELSEIF (v_valid_freq_unit = 'D') THEN
        
		IF p_chk_date BETWEEN p_param_date AND p_param_date + v_valid_freq days
        THEN RETURN 'TRUE';--
        ELSE RETURN 'FALSE';--
        END IF;--
				
    ELSE RETURN 'FALSE';--
    END IF;--

END;

DROP FUNCTION IS_DUEDATE_VALID_RPT(timestamp, date, VARCHAR(10), VARCHAR(1));

CREATE FUNCTION IS_DUEDATE_VALID_RPT(
        p_chk_date timestamp,
        p_param_date date, 
        p_mis_rpt_id VARCHAR(10),
        p_incl_overdue_ind VARCHAR(1) )
        RETURNS VARCHAR(10)  
LANGUAGE SQL
SPECIFIC IS_DUEDATE_VALID_RPT_TS
BEGIN ATOMIC
    RETURN IS_DUEDATE_VALID_RPT(date(p_chk_date), p_param_date, p_mis_rpt_id, p_incl_overdue_ind);--
END;

DROP FUNCTION GET_BRANCHES_FROM_TEAMID;

CREATE FUNCTION GET_BRANCHES_FROM_TEAMID(TEAMID BIGINT)
RETURNS VARCHAR(10000) 
BEGIN ATOMIC 
	DECLARE result VARCHAR(10005);--
	
	SET result='';--
	FOR REC AS 
		SELECT DISTINCT CC.ENTRY_NAME ENTRYNAME 
			FROM CMS_TEAM_ORGANISATION_CODE A LEFT JOIN 
				(SELECT ENTRY_CODE, ENTRY_NAME FROM COMMON_CODE_CATEGORY_ENTRY 
					WHERE CATEGORY_CODE='40' AND (ENTRY_SOURCE = 'ARBS' or ENTRY_SOURCE = 'MIMB')) CC 
				ON A.ORGANISATION_CODE=CC.ENTRY_CODE 
			WHERE A.TEAM_ID=TEAMID
	DO
		SET RESULT=RESULT||', '||REC.ENTRYNAME;--
	END FOR;--
	
	IF LENGTH(RESULT)>2 THEN
		IF LENGTH(RESULT)>10002 THEN
			SET RESULT=SUBSTR(RESULT,3,10000);--
		ELSE
			SET RESULT=SUBSTR(RESULT,3);--
		END IF;--
	END IF;--
  
  RETURN result;--
END;


DROP FUNCTION GET_CENTRES_FROM_TEAMID;

CREATE FUNCTION GET_CENTRES_FROM_TEAMID(TEAMID BIGINT)
RETURNS VARCHAR(10000) 
BEGIN ATOMIC 
	DECLARE result VARCHAR(10005);--
	
	SET result='';--
	FOR REC AS 
		SELECT DISTINCT CC.ENTRY_NAME ENTRYNAME 
		FROM CMS_TEAM_ORG_GROUP_CODE A LEFT JOIN 
			(SELECT ENTRY_CODE, ENTRY_NAME FROM COMMON_CODE_CATEGORY_ENTRY WHERE CATEGORY_CODE='CENTRE') CC 
			ON A.ORG_GROUP_CODE=CC.ENTRY_CODE 
		WHERE A.TEAM_ID=TEAMID
	DO
		SET RESULT=RESULT||', '||REC.ENTRYNAME;--
	END FOR;--
	
	IF LENGTH(RESULT)>2 THEN
		IF LENGTH(RESULT)>10002 THEN
			SET RESULT=SUBSTR(RESULT,3,10000);--
		ELSE
			SET RESULT=SUBSTR(RESULT,3);--
		END IF;--
	END IF;--
  
  RETURN result;--
END;

DROP FUNCTION MAX_NUMBER_DRAFT_DATE;

CREATE FUNCTION MAX_NUMBER_DRAFT_DATE ( 
	INPUT_DRAFT_STAGE VARCHAR(100),
	INPUT_CMS_LSP_LMT_PROFILE_ID BIGINT)
  RETURNS DATE
  SPECIFIC MAX_NUMBER_DRAFT_DATE
  LANGUAGE SQL
  DETERMINISTIC
  EXTERNAL ACTION
  READS SQL DATA
  CALLED ON NULL INPUT
  INHERIT SPECIAL REGISTERS
BEGIN ATOMIC
    declare final_draft_date DATE;--  
		set final_draft_date = (
			select tdd.draft_date
			from cms_tat_document td, cms_tat_document_draft tdd
			where td.tat_id = tdd.tat_id 
			and tdd.doc_draft_stage = input_draft_stage 
			and td.cms_lsp_lmt_profile_id = input_cms_lsp_lmt_profile_id
			and tdd.draft_number = (select max(draft_number)
					from cms_tat_document_draft t1
					where t1.tat_id = td.tat_id
					and t1.doc_draft_stage = input_draft_stage)
		);--
	RETURN final_draft_date;--	
END;

DROP FUNCTION GET_PLEDGORLIST_CIFNO;

CREATE FUNCTION GET_PLEDGORLIST_CIFNO(COLLATERALID BIGINT)
RETURNS VARCHAR(100) 
BEGIN ATOMIC 
	DECLARE result VARCHAR(100);--
	
	SET result='';--
	FOR REC AS 
		SELECT DISTINCT PLG.PLG_LE_ID
		FROM SCI_PLEDGOR_DTL PLG, SCI_SEC_PLDGR_MAP PLGM, CMS_SECURITY SC
		WHERE SC.CMS_COLLATERAL_ID=PLGM.CMS_COLLATERAL_ID
			AND PLGM.CMS_PLEDGOR_DTL_ID=PLG.CMS_PLEDGOR_DTL_ID
			AND SC.CMS_COLLATERAL_ID=COLLATERALID
	DO
		SET RESULT=RESULT||' / '||REC.PLG_LE_ID;--
	END FOR;--
	
	IF LENGTH(RESULT)>3 THEN
		SET RESULT=SUBSTR(RESULT,4);--
	ELSE
		SET RESULT='-';--
	END IF;--
  
  RETURN result;--
END;

DROP FUNCTION GET_PLEDGORLIST_NAME;

CREATE FUNCTION GET_PLEDGORLIST_NAME(COLLATERALID BIGINT)
RETURNS VARCHAR(100) 
BEGIN ATOMIC 
	DECLARE result VARCHAR(100);--
	
	SET result='';--
	FOR REC AS 
		SELECT DISTINCT PLG.PLG_LEGAL_NAME
		FROM SCI_PLEDGOR_DTL PLG, SCI_SEC_PLDGR_MAP PLGM, CMS_SECURITY SC
		WHERE SC.CMS_COLLATERAL_ID=PLGM.CMS_COLLATERAL_ID
			AND PLGM.CMS_PLEDGOR_DTL_ID=PLG.CMS_PLEDGOR_DTL_ID
			AND SC.CMS_COLLATERAL_ID=COLLATERALID
	DO
		SET RESULT=RESULT||' / '||REC.PLG_LEGAL_NAME;--
	END FOR;--
	
	IF LENGTH(RESULT)>3 THEN
		SET RESULT=SUBSTR(RESULT,4);--
	ELSE
		SET RESULT='-';--
	END IF;--
  
  RETURN result;--
END;

DROP FUNCTION GET_PLEDGORLIST_ICNO;

CREATE FUNCTION GET_PLEDGORLIST_ICNO(SOURCE_ID VARCHAR(10), 
	LE_ID VARCHAR(20))
RETURNS VARCHAR(100) 
BEGIN ATOMIC 
	DECLARE result VARCHAR(100);--
	
	SET result='';--
	FOR REC AS 
		SELECT DISTINCT plgp.LMP_INC_NUM_TEXT
		FROM SCI_LE_MAIN_PROFILE plgp
		WHERE plgp.SOURCE_ID=SOURCE_ID 
			AND plgp.LMP_LE_ID=LE_ID
	DO
		SET RESULT=RESULT||' / '||REC.LMP_INC_NUM_TEXT;--
	END FOR;--
	
	IF LENGTH(RESULT)>3 THEN
		SET RESULT=SUBSTR(RESULT,4);--
	ELSE
		SET RESULT='-';--
	END IF;--
  
  RETURN result;--
END;

DROP FUNCTION COMFORM_CHAR;

CREATE FUNCTION COMFORM_CHAR (
    input_char1	VARCHAR(100),
    input_char2	VARCHAR(100),
    input_char3	VARCHAR(100),
		input_char4	VARCHAR(100),
		input_char5	VARCHAR(100)
		)
  RETURNS VARCHAR(600)
  SPECIFIC COMFORM_CHAR
  LANGUAGE SQL
  DETERMINISTIC
  EXTERNAL ACTION
  READS SQL DATA
  CALLED ON NULL INPUT
  INHERIT SPECIAL REGISTERS
BEGIN ATOMIC

DECLARE return_char	VARCHAR(600);--  
		set return_char = '';--
		if input_char1 is not null and input_char1 <>''  then  set return_char = input_char1||';';  end if;--
		
		if input_char2 is not null and input_char2 <>''  then  set return_char = return_char||input_char2||';';  end if;--
		
		if input_char3 is not null and input_char3 <>''  then  set return_char = return_char||input_char3||';';  end if;--
		
		if input_char4 is not null and input_char4 <>''  then  set return_char = return_char||input_char4||';';  end if;--
		
		if input_char5 is not null and input_char5 <>''  then  set return_char = return_char||input_char5||';';  end if;--
	RETURN return_char;--
END;


DROP FUNCTION SI_TSFMT;

CREATE FUNCTION SI_TSFMT(TS timestamp, fmt varchar(20)) 
returns varchar(50) 
return 
with tmp (dd,mm,yyyy,hh,mi,ss,nnnnnn) as 
( 
  select 
  substr( digits (day(TS)),9), 
  substr( digits (month(TS)),9) , 
  rtrim(char(year(TS))) , 
  substr( digits (hour(TS)),9), 
  substr( digits (minute(TS)),9), 
  substr( digits (second(TS)),9), 
  rtrim(char(microsecond(TS))) 
  from sysibm.sysdummy1 
  ) 
select 
case fmt 
  when 'ddmmyyyy' 
    then dd || mm || yyyy
  when 'dd/mm/yyyy' 
    then dd || '/' || mm || '/' || yyyy 
  when 'yyyy/dd/mm hh:mi:ss' 
    then yyyy || '/' || mm || '/' || dd || ' ' ||  
      hh || ':' || mi || ':' || ss 
  when 'nnnnnn' 
    then nnnnnn 
  else 
   'date format ' || coalesce(fmt,' <null> ') || ' not recognized.'
  end 
from tmp;



---------------------------------- Marketable Security Valuation Helpers --------------------------------

DROP FUNCTION IS_WORKING_DAY;

CREATE FUNCTION IS_WORKING_DAY(DATE_PARAM DATE, BRANCH_PARAM VARCHAR(40)) 
RETURNS CHAR
LANGUAGE SQL SPECIFIC IS_WORKING_DAY NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC 

    DECLARE BIZ_DAY_FLAG CHAR(1);--

    set BIZ_DAY_FLAG = (SELECT COALESCE(BIZ_DAY_FLAG, 'N') FROM CMS_WORKING_DAYS 
                        WHERE DATE(PROCESSING_DATE) = DATE_PARAM
                        AND BRANCH = BRANCH_PARAM
                        AND (STATUS IS NULL OR STATUS <> 'DELETED')
                        FETCH FIRST 1 ROW ONLY);--
    
    IF (BIZ_DAY_FLAG is null) THEN
        SET BIZ_DAY_FLAG = 'N';--
    END IF;--

    RETURN BIZ_DAY_FLAG;--

END;

DROP FUNCTION GET_LAST_WORKING_DAY_OF_MONTH;

CREATE FUNCTION GET_LAST_WORKING_DAY_OF_MONTH(DATE_PARAM DATE, BRANCH_PARAM VARCHAR(40)) 
RETURNS DATE
LANGUAGE SQL SPECIFIC GET_LAST_WORKING_DAY_OF_MONTH NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC 

    return (select DATE(MAX(PROCESSING_DATE)) from cms_working_days wk
            where branch = BRANCH_PARAM
            and BIZ_DAY_FLAG = 'Y'
            and (status is null or status <> 'DELETED')
            and YEAR(PROCESSING_DATE) = YEAR(DATE_PARAM)
            and MONTH(PROCESSING_DATE)=MONTH(DATE_PARAM));--
    
END;

DROP FUNCTION IS_LAST_WORKING_DAY_OF_MONTH;

CREATE FUNCTION IS_LAST_WORKING_DAY_OF_MONTH(DATE_PARAM DATE, BRANCH_PARAM VARCHAR(40)) 
RETURNS CHAR
LANGUAGE SQL SPECIFIC IS_LAST_WORKING_DAY_OF_MONTH NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC 

    DECLARE LAST_WORKING_DAY DATE;--
    SET LAST_WORKING_DAY = GET_LAST_WORKING_DAY_OF_MONTH(DATE_PARAM, BRANCH_PARAM);--
    
    IF(LAST_WORKING_DAY = DATE_PARAM) THEN
        RETURN 'Y';--    
    ELSE 
        RETURN 'N';--
    END IF;--

END;


DROP FUNCTION GET_REST_DAY;

CREATE FUNCTION GET_REST_DAY (
    FIRST_DATE_PARAM	DATE,
		SECOND_DATE_PARAM	DATE,
    BRANCH_PARAM	VARCHAR(40) )
  RETURNS BIGINT
  SPECIFIC GET_REST_DAY
  LANGUAGE SQL
  NOT DETERMINISTIC
  EXTERNAL ACTION
  READS SQL DATA
  CALLED ON NULL INPUT
  INHERIT SPECIAL REGISTERS
BEGIN ATOMIC 

    DECLARE total_rest_day BIGINT;--   
    set total_rest_day = (SELECT distinct count(*) FROM CMS_WORKING_DAYS 
                        WHERE (DATE(PROCESSING_DATE) between FIRST_DATE_PARAM and SECOND_DATE_PARAM)
                        and BRANCH = BRANCH_PARAM
												and (BIZ_DAY_FLAG is null or BIZ_DAY_FLAG = 'N')
                        and (STATUS IS NULL OR STATUS <> 'DELETED'));--          
    RETURN total_rest_day;--   
END;

DROP FUNCTION get_product_type;

create function get_product_type (i_account_type char(1), i_product_type varchar(60), i_ccy char(3))
	returns varchar(250)
	language sql
begin atomic
	return get_common_code_desc((case when i_account_type is null 
					then i_product_type || '|' || i_ccy
					else i_product_type || '|' || i_ccy || '|' || i_account_type
					end), 'PRODUCT_TYPE');--
end;

DROP FUNCTION calc_tat_draft_days;

create function calc_tat_draft_days
	(i_tat_id bigint,
	i_draft_num_1 bigint,
	i_draft_stage_1 varchar(100),	
	i_draft_num_2 bigint,
	i_draft_stage_2 varchar(100),
	i_extra_days bigint)
returns bigint
specific calc_tat_draft_days
language sql

begin atomic
	declare tat_draft_result bigint default 0;--
	declare draft_date_1 date;--
	declare draft_date_2 date;--
	
	set draft_date_1 = (select draft_date from cms_tat_document_draft
											where tat_id = i_tat_id
											and draft_number = i_draft_num_1
											and doc_draft_stage = i_draft_stage_1);--
											
	if draft_date_1 is not null then 
		set draft_date_2 = (select draft_date from cms_tat_document_draft
											where tat_id = i_tat_id
											and draft_number = i_draft_num_2
											and doc_draft_stage = i_draft_stage_2);--
		if draft_date_2 is not null then
			set tat_draft_result = diff_days(draft_date_2, draft_date_1) - i_extra_days;--
			
			if tat_draft_result < 0 then set tat_draft_result = 0;--
			end if;--
		end if;--	
			
	end if;--
	
	return tat_draft_result;--
end;

DROP FUNCTION calc_pre_disbursement_tat;
	  
create function calc_pre_disbursement_tat
	(i_tat_id bigint, 
	i_receive_date date, 
	i_doc_execute_date date,
	i_branch varchar(40))
returns bigint
specific calc_pre_disbursement_tat
language sql

begin atomic
	declare return_result bigint default 0;--
	declare docRec1 date;--
	
	set docRec1 = (select draft_date from cms_tat_document_draft 
				where tat_id = i_tat_id
				and draft_number = 1
				and doc_draft_stage = 'DocRec');--			
	
	if docRec1 is null or docRec1 < i_receive_date then
			set docRec1 = i_receive_date;--
	end if;--
	
	set return_result = calc_tat_draft_days(i_tat_id, 1, 'DocToLegal', 1, 'DocFromLegal', 3);--
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 1, 'DocRet', 2, 'DocRec', 1);--
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 2, 'DocToLegal', 2, 'DocFromLegal', 1);--
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 2, 'DocRet', 3, 'DocRec', 1);--
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 3, 'DocToLegal', 3, 'DocFromLegal', 1);--
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 3, 'DocRet', 4, 'DocRec', 1);--
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 4, 'DocToLegal', 4, 'DocFromLegal', 1);--	
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 4, 'DocRet', 5, 'DocRec', 1);--
	set return_result = return_result + calc_tat_draft_days(i_tat_id, 5, 'DocToLegal', 5, 'DocFromLegal', 1);--	
	
	set return_result = diff_days(i_doc_execute_date,docRec1) - return_result - GET_REST_DAY(docRec1,i_doc_execute_date, i_branch);--
	
	return return_result;--
end;

COMMIT WORK;



/**************************************************************************
 Requestor : Cynthia Zhou
 Desc : Schema patches required for concentration report
 Task : Concentration Reports Module 
 Date : 19/04/2007
*************************************************************************/

  
    
/*******************************************************************
Create Functions, dependent on view created at gcms_create_views.sql
********************************************************************/

DROP FUNCTION SUM_TOTAL_SHARE_GROUP_TRADE_EXP;

CREATE FUNCTION SUM_TOTAL_SHARE_GROUP_TRADE_EXP (feed_id_param BIGINT)

   RETURNS DECIMAL(25,0)
   LANGUAGE SQL
   SPECIFIC SUM_TOTAL_SHARE_GROUP_TRADE_EXP
   DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC
	
   DECLARE v_ret_amt        DECIMAL(25,0);--
   DECLARE v_stock_code     VARCHAR(10);--
   DECLARE v_stock_exchange VARCHAR(40);--
   DECLARE v_stock_board    VARCHAR(20);--
   DECLARE v_country        VARCHAR(2);--

   FOR FD AS SELECT vw.stock_code, vw.exchange, vw.board_code, vw.country
             FROM vw_stock_info vw
             where vw.feed_id = feed_id_param   
             and vw.stock_type = '001'
   DO 
        SET v_stock_code = FD.stock_code;--
        SET v_stock_exchange = FD.exchange;--
        SET v_stock_board = FD.board_code;--
        SET v_country = FD.country;--
   END FOR;--

   FOR REC AS SELECT sum(nom.TOTAL_NO_OF_UNITS) share_group_trade_exp
               FROM 
                    (select feed_id 
                    from cms_price_feed fd
                    where locate(v_stock_code, fd.stock_code) > 0
                    and COUNTRY = v_country
                    and EXCHANGE = v_stock_exchange) share_group, 
                    cms_nominees nom, cms_credit_risk_param crp
               WHERE share_group.feed_id = nom.feed_id
               AND share_group.feed_id = crp.feed_id
               AND crp.board_type = v_stock_board
               AND nom.FACILITY_IND = '001'

   DO 
        SET v_ret_amt = REC.share_group_trade_exp;--
   END FOR;--

  RETURN v_ret_amt;	--
END;

/*******************************************
Create Functions getCurrentCustDocItemStatus
********************************************/

DROP VIEW DUAL;

CREATE VIEW DUAL (sysdate) as select CURRENT TIMESTAMP from SYSIBM.SYSDUMMY1;

DROP FUNCTION getCurrentCustDocItemStatus;

CREATE FUNCTION getCurrentCustDocItemStatus (custTrxStatus VARCHAR(200), stageStatus VARCHAR(200), actualStatus VARCHAR(200))

  RETURNS VARCHAR(200)
  LANGUAGE SQL
  SPECIFIC getCurrentCustDocItemStatus
  NOT DETERMINISTIC READS SQL DATA

BEGIN ATOMIC
DECLARE currentStatus VARCHAR(200);--
DECLARE pendingPrefixLength NUM(1);--
DECLARE temp NUM(1);--
declare temp1 VARCHAR(200);--
declare temp2 VARCHAR(200);--
DECLARE temp3 integer;--

    set temp=(SELECT length('PENDING_') pendingPrefixLength from dual);--
    set temp3=temp+1;--

	if  SUBSTR(actualStatus, 1, length(SUBSTR(stageStatus,temp3)))=SUBSTR(stageStatus, temp3)
      then set temp1=actualStatus;--
	else
	  set temp1=stageStatus;--
	end if;--
		
	if actualStatus='DELETED' then set temp1='RECEIVED';--
      else return temp1;--
	end if;--

	if custTrxStatus is null then set temp1= 'RECEIVED';--
      else return temp1;--
	end if ;--

	set currentStatus=temp1;--

    RETURN currentStatus;--
END;

/******************************************
Create Functions getReversalCurrentCustDocItemStatus
*******************************************/

DROP FUNCTION getReversalCurrentCustDocItemStatus;

CREATE FUNCTION getReversalCurrentCustDocItemStatus
(custTrxStatus  VARCHAR(200), stageStatus VARCHAR(200), actualStatus  VARCHAR(200), cpc_custodian_status VARCHAR(200))
RETURNS VARCHAR(200) LANGUAGE SQL SPECIFIC getReversalCurrentCustDocItemStatus NOT DETERMINISTIC READS SQL DATA


BEGIN ATOMIC
declare temp1 VARCHAR(200);--

		
	if custTrxStatus = 'PENDING_UPDATE'
	then set temp1 = stageStatus;--
	return temp1;--
	end if;--

	if custTrxStatus = 'ACTIVE' and actualStatus = cpc_custodian_status
	then set temp1 = actualStatus;--
	return temp1;--
	end if;--

	if custTrxStatus = 'ACTIVE' and actualStatus <> cpc_custodian_status
	then set temp1 = cpc_custodian_status;--
	return temp1;--
	end if;--

	if custTrxStatus = ''
	then set temp1=cpc_custodian_status;--
	return temp1;--
	end if;--

END;