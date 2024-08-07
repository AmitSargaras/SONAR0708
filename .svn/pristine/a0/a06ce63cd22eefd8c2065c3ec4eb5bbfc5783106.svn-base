
---------------------------------
-- DDL statements for User Defined Functions
---------------------------------

DROP FUNCTION GET_BANK_ENTITY;

CREATE FUNCTION GET_BANK_ENTITY
(
  p_branch_code VARCHAR(20)
)
   RETURNS VARCHAR(2)
   LANGUAGE SQL
   SPECIFIC GET_BANK_ENTITY
   DETERMINISTIC READS SQL DATA
   BEGIN ATOMIC   
   
    DECLARE r_entity_type VARCHAR(2) ;--
    DECLARE conv_entity_type VARCHAR(2)  DEFAULT '2';--
    
	SET r_entity_type = (SELECT ENTITY_TYPE 
	FROM CMS_BANK_ENTITY_PARAM 
	WHERE BRANCH_CODE  = p_branch_code
	AND status <> 'DELETED' );--
   
    IF r_entity_type IS NULL THEN
       RETURN conv_entity_type;--
    END IF;--
    RETURN r_entity_type;--
END;


/**************************************************************************
 Requestor : Priya
 Desc : Function to retrieve country name based on country code
 Date : 22 October 2008
*************************************************************************/

DROP FUNCTION GET_COUNTRY_NAME;

CREATE FUNCTION GET_COUNTRY_NAME 
(
	I_COUNTRY_CODE	VARCHAR(2) 
)
  	RETURNS VARCHAR(60)
  	SPECIFIC GET_COUNTRY_NAME
  	LANGUAGE SQL
  	NOT DETERMINISTIC
  	EXTERNAL ACTION
  	READS SQL DATA
  	CALLED ON NULL INPUT
  	INHERIT SPECIAL REGISTERS

  	BEGIN ATOMIC 
  	
  	DECLARE result VARCHAR(60);-- 
  		
  		SET result = (
  		SELECT SC.CTR_CNTRY_NAME
  		FROM SCI_COUNTRY SC 
  		WHERE SC.CTR_CNTRY_ISO_CODE = I_COUNTRY_CODE FETCH FIRST 1 ROW ONLY ); --
  
  		RETURN result;-- 
END;

  
COMMIT WORK;