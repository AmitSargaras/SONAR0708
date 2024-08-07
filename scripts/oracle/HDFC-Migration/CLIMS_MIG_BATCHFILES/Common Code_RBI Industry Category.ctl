LOAD DATA
INFILE 'FILES\Common Code_RBI Industry Category.csv'
 "str '~~~'"
BADFILE 'PARTIAL_ERROR_LOG\Common Code_RBI Industry Category.bad'
DISCARDFILE 'PARTIAL_ERROR_LOG\Common Code_RBI Industry Category.dsc'
DISCARDMAX 1241513983
APPEND INTO TABLE MIG_COMMON_CODE_CATEGORY_IND
FIELDS TERMINATED BY '|||'
TRAILING NULLCOLS
(
COMMONID "REPLACE(REPLACE(DECODE(UPPER(:COMMONID),'NULL',NULL,:COMMONID), CHR(10),''), CHR(13),'')",
COMMONNAME "DECODE(UPPER(:COMMONNAME),'NULL',NULL,:COMMONNAME)"
)