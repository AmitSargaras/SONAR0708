LOAD DATA
INFILE 'FILES\Security Type Master.csv'
 "str '~~~'"
BADFILE 'PARTIAL_ERROR_LOG\Security Type Master.bad'
DISCARDFILE 'PARTIAL_ERROR_LOG\Security Type Master.dsc'
DISCARDMAX 1241513983
APPEND INTO TABLE MIG_CMS_COLLATERAL
FIELDS TERMINATED BY '|||'
TRAILING NULLCOLS
(
SECTYPEID "REPLACE(REPLACE(DECODE(UPPER(:SECTYPEID),'NULL',NULL,:SECTYPEID), CHR(10),''), CHR(13),'')",
SECTYPEDESC "DECODE(UPPER(:SECTYPEDESC),'NULL',NULL,:SECTYPEDESC)",
SECNATURE "DECODE(UPPER(:SECNATURE),'NULL',NULL,:SECNATURE)",
SECURITYSUBTYPE "DECODE(UPPER(:SECURITYSUBTYPE),'NULL',NULL,:SECURITYSUBTYPE)",
INSURANCEREQUIRED "DECODE(UPPER(:INSURANCEREQUIRED),'NULL',NULL,:INSURANCEREQUIRED)",
REVELUTIONARYFREQUENCY "DECODE(UPPER(:REVELUTIONARYFREQUENCY),'NULL',NULL,:REVELUTIONARYFREQUENCY)",
SECSUBNATURE "DECODE(UPPER(:SECSUBNATURE),'NULL',NULL,:SECSUBNATURE)"
)