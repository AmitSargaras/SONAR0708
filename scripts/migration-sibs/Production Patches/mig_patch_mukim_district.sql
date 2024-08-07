/* Patching for mukim and district */



---------------------------------------------------------------------------------------------------------------------------------------------

create table CMS_PROPERTY_TEMP (
	CMS_COLLATERAL_ID BIGINT,
	SCI_SECURITY_DTL_ID VARCHAR(50),
	MUKIM VARCHAR(40),
	DISTRICT VARCHAR(40)
);

="insert into CMS_PROPERTY_TEMP (SCI_SECURITY_DTL_ID, MUKIM, DISTRICT) values ('"&A1&"', '"&B1&"', '"&C1&"');"

---------------------------------------------------------------------------------------------------------------------------------------------










