--DROP FUNCTION format_sequence
--@

--DROP FUNCTION si_get_subtype_by_stock_code_and_exchange
--@

CREATE FUNCTION format_sequence(p_seq INT)
    RETURNS BIGINT
BEGIN ATOMIC
    DECLARE v_seq_char VARCHAR(20);
    
    SET v_seq_char = TS_FMT(CURRENT_TIMESTAMP, 'yyyymmdd') || LPAD(RTRIM(CAST(p_seq AS CHAR(9))), 9, '0');

    RETURN CAST(v_seq_char AS BIGINT);
END
@

CREATE FUNCTION si_get_subtype_by_stock_code_and_exchange
		(p_stock_code VARCHAR(20), p_stock_exchange VARCHAR(10))
	RETURNS VARCHAR(10)
	LANGUAGE SQL
BEGIN ATOMIC
	DECLARE v_board_type VARCHAR(10);
	DECLARE v_subtype_code VARCHAR(10);
	DECLARE v_feed_id BIGINT;
	
	SET v_feed_id = (SELECT feed_id FROM cms_price_feed
					  WHERE stock_code = p_stock_code
					    AND exchange = p_stock_exchange);
	
	SET v_board_type = (SELECT board_type FROM cms_credit_risk_param
						 WHERE feed_id = v_feed_id);

	
	IF (p_stock_exchange = 'KLS') THEN
		IF (v_board_type = '002') THEN
			SET v_subtype_code = 'MS600';
		ELSE
			SET v_subtype_code = 'MS605';
		END IF;
	ELSEIF (p_stock_exchange = 'SES') THEN
		IF (v_board_type = '005') THEN
			SET v_subtype_code = 'MS601';
		ELSE
			SET v_subtype_code = 'MS606';
		END IF;
	ELSE
		IF (v_feed_id IS NULL) THEN
			SET v_subtype_code = 'MS607';
		ELSE
			-------------------------------------------------------
			-- Unknown Stock Exchange
			-- Need to be enhanced if new Stock Exchange Introduced
			-------------------------------------------------------
			SET v_subtype_code = 'MS606';
		END IF;
	END IF;
	
	RETURN v_subtype_code;
END
@

CREATE FUNCTION SI_BVL(p_value VARCHAR(200), p_msg VARCHAR(200))
  RETURNS VARCHAR(200)
  LANGUAGE SQL
BEGIN ATOMIC
	DECLARE v_msg VARCHAR(200);

	IF (LENGTH(p_value) = 0) THEN
		SET v_msg = p_msg;
	ELSE
		SET v_msg = '';
	END IF;
	
	return v_msg;
END
@

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
from tmp
@


commit work
@
