DROP FUNCTION BVL@
DROP FUNCTION MS_GET_SUBTYPE@
--DROP FUNCTION MS_GET_SUBTYPE_NEW@
DROP FUNCTION GET_INVALID_COMMON_CODE_MSG@
DROP FUNCTION GET_INVALID_VALUE_MSG@

CREATE FUNCTION BVL(p_value VARCHAR(200), p_msg VARCHAR(200))
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

END@

--CREATE FUNCTION MS_GET_SUBTYPE
--		(p_source_security_sub_type VARCHAR(3), p_equity_type VARCHAR(1), 
--         p_stock_code VARCHAR(20), p_stock_exchange VARCHAR(10))
--	RETURNS VARCHAR(10)
--	LANGUAGE SQL
--BEGIN ATOMIC
--	DECLARE v_board_type VARCHAR(10);
--	DECLARE v_subtype_code VARCHAR(10);
--	DECLARE v_feed_id BIGINT;
	
--	IF (p_source_security_sub_type = 'C40') THEN
--        SET v_subtype_code = 'MS602';
--    ELSEIF(p_source_security_sub_type = 'C20') THEN
--        SET v_subtype_code = 'MS607';
--    ELSEIF(upper(p_equity_type) = 'U') THEN
--        SET v_subtype_code = 'MS605';
--    ELSEIF(upper(p_equity_type) = 'S') THEN
    	
--        SET (v_feed_id, v_board_type) 
--        = (SELECT feed_id, board_type FROM cms_price_feed
--    		WHERE stock_code = p_stock_code
--    		AND exchange = p_stock_exchange);
        
--        IF (v_feed_id IS NULL) THEN
--			SET v_subtype_code = 'MS607';
--        ELSEIF(v_board_type = '5') THEN
--			SET v_subtype_code = 'MS600';
--        ELSEIF(v_board_type IN ('1', '2', '3', '4')) THEN
--			SET v_subtype_code = 'MS605';
--        END IF;
        
--	END IF;
    
--	RETURN v_subtype_code;
--END
--@


CREATE FUNCTION MS_GET_SUBTYPE
		(p_source_security_sub_type VARCHAR(3), p_equity_type VARCHAR(1), 
         p_stock_code VARCHAR(20), p_stock_exchange VARCHAR(10))
	RETURNS VARCHAR(10)
	LANGUAGE SQL
BEGIN ATOMIC
	DECLARE v_board_type VARCHAR(10);
	DECLARE v_subtype_code VARCHAR(10);
	DECLARE v_feed_id BIGINT;

	IF (p_source_security_sub_type = 'C20') THEN
        SET v_subtype_code = 'MS607';
    ELSEIF(p_source_security_sub_type = 'C40') THEN
        SET v_subtype_code = 'MS602';
    ELSEIF(p_source_security_sub_type = 'C60') THEN
        SET v_subtype_code = 'MS605';
    ELSEIF(p_stock_code = 'UNQUOTED') THEN
        SET v_subtype_code = 'MS607';
    ELSE
    	
        SET (v_feed_id, v_board_type) 
        = (SELECT feed_id, board_type FROM cms_price_feed
    		WHERE stock_code = p_stock_code
    		AND exchange = p_stock_exchange);
        
        IF (v_feed_id IS NULL) THEN
			SET v_subtype_code = 'MS606';
        ELSEIF(v_board_type = '5') THEN
			SET v_subtype_code = 'MS600';
        ELSEIF(v_board_type IN ('1', '2', '3', '4')) THEN
			SET v_subtype_code = 'MS605';
        END IF;
        
	END IF;
	
	RETURN v_subtype_code;
END
@


CREATE FUNCTION GET_INVALID_COMMON_CODE_MSG (i_FIELD_NAME   VARCHAR(100), i_ENTRY_CODE   VARCHAR(40), i_CATEGORY_CODE   VARCHAR(40))
RETURNS VARCHAR(255)
LANGUAGE SQL SPECIFIC GET_INVALID_COMMON_CODE_MSG NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC
  
	DECLARE v_msg VARCHAR(255);

    IF (GET_COMMON_CODE_DESC(i_ENTRY_CODE, i_CATEGORY_CODE) IS NULL) THEN
        --SET v_msg = ' [(' || i_ENTRY_CODE || ' | ' || i_CATEGORY_CODE || ') IS INVALID] ';
        SET v_msg = ' ['|| i_FIELD_NAME || '(' || i_ENTRY_CODE || ' | ' || i_CATEGORY_CODE || ') IS INVALID] ';
    ELSE 
        SET v_msg = '';
    END IF;
  
	return v_msg;

END@


CREATE FUNCTION GET_INVALID_VALUE_MSG (FIELD_NAME  VARCHAR(50),  VALUE_GIVEN  VARCHAR(40), ACCEPTED_VALUES VARCHAR(250))
RETURNS VARCHAR(255)
LANGUAGE SQL SPECIFIC GET_INVALID_VALUE_MSG NOT DETERMINISTIC READS SQL DATA
BEGIN ATOMIC
  
	DECLARE v_msg VARCHAR(255);
    SET v_msg = FIELD_NAME || ' [' || VALUE_GIVEN || '] IS INVALID. ACCEPTED VALUES [' || ACCEPTED_VALUES || '] ';  
	return v_msg;

END@


