@echo off

call ..\set_mig_env.cmd %*

IF EXIST "%FILE_PATH%.ht" (
 call ..\hash_total.cmd check "%FILE_PATH%" "%FILE_PATH%.ht" 51,19 
)

IF NOT "%IS_PROCEED%"=="true" (
	goto end
)

db2 LOAD FROM "%FILE_PATH%" OF ASC MODIFIED BY TIMESTAMPFORMAT=\"DDMMYYYY\" DUMPFILE="%DUMP_PATH%" IMPLIEDDECIMAL STRIPTBLANKS NULLINDCHAR=Y METHOD L ( 1 1, 2 21, 22 41, 42 44, 45 47, 48 50, 51 69, 70 77, 78 85, 86 105, 106 118, 119 131, 132 144, 145 157, 158 170, 171 171, 172 172, 173 185, 186 193, 194 194, 195 207, 208 222, 223 230, 231 233, 234 283, 284 286, 287 295, 296 298, 299 301, 302 304, 305 307, 308 310, 311 370, 371 430, 431 490, 491 492, 493 500, 501 513, 514 516, 517 519, 520 522, 523 525, 526 528, 529 531, 532 550, 551 551 ) MESSAGES "%LOG_PATH%" REPLACE INTO "%DB_SCHEMA%".MIG_CO016_IN (RECORD_TYPE, SECURITY_ID, POLICY_NUMBER, INSURER_NAME_CODE, INSURANCE_TYPE_CODE, INSURANCE_POLICY_CURRENCY, INSURED_AMT, EFFECTIVE_DATE, EXPIRY_DATE, PROP_NO_COVER_NOTE_NUMBER, GROSS_PREMIUM, STAMP_DUTY, NET_PREMIUM_PAY_TO_INS_COMP, NET_PREMIUM_PAY_BY_BORROWER, COMMISSION_EARNED, BANK_CUST_ARRANGE_INS_IND, NONSCHEMA_SCHEMA, INS_PREMIUM, INS_ISSUE_DATE, AUTO_DEBIT, TAKAFUL_COMMISSION, NEW_AMT_INSURED, ENDORSEMENT_DATE, BUILDING_OCCUPATION_CODE, NATURE_OF_WORK, TYPE_OF_BUILDING, NUMBER_OF_STOREY, WALL, EXTENSION_WALL, ROOF, EXTENSION_ROOF, ENDORSEMENT_CODE, REMARK1, REMARK2, REMARK3, POLICY_CUSTODIAN_CODE, INSURANCE_CLAIM_DATE, INSURANCE_EXCHANGE_RATE, TYPE_OF_FLOOR, TYPE_OF_PERILS1, TYPE_OF_PERILS2, TYPE_OF_PERILS3, TYPE_OF_PERILS4, TYPE_OF_PERILS5, DEBITING_ACC_NO, ACC_TYPE_CODE) NONRECOVERABLE INDEXING MODE AUTOSELECT

:end