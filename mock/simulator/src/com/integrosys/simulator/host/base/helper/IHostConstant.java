package com.integrosys.simulator.host.base.helper;

public interface IHostConstant {

	// Base Constants
	public String HOST_CONSTANT_RLOS = "RLOS";

	public String HOST_CONSTANT_SEND = "S";

	public String HOST_CONSTANT_RESEND = "R";

	public String HOST_TRX_STS_INITIAL = "0";

	public String HOST_TRX_STS_PENDING = "1";

	public String HOST_TRX_STS_SUCCESS = "2";

	public String HOST_TRX_STS_FAIL = "3";

	public String HOST_TRX_STS_TIMEOUT = "4";

	public static final String LOG_CONTENT_ALIAS_NAME = "Content";

	// Marshaller parameter
	public String TRANSFORM_TYPE_XML = "TRANSFORM_TYPE_XML";

	public String TRANSFORM_TYPE_DELIMITER = "TRANSFORM_TYPE_DELIMITER";

	public String TRANSFORM_TYPE_FIX_LENGTH = "TRANSFORM_TYPE_FIX_LENGTH";

	// Request Response Object Constant
	public String HOST_REQUEST_OBJECT = "HOST_REQ_OBJ";

	public String HOST_RESPONSE_OBJECT = "HOST_RES_OBJ";

	// Transaction Index
	// CCRIS - Constants
	public String CCRIS_LOSADD_TRX_INDEX = "8001";

	public String CCRIS_LOSUPDATE_TRX_INDEX = "8002";

	public String CCRIS_LOSDETAIL_TRX_INDEX = "8003";

	public String CCRIS_LOSSUM_TRX_INDEX = "8004";

	public String CCRIS_LOSSUP_TRX_INDEX = "8005";

	// SIBS
	public String SIBS_SEARCH_TRX_INDEX = "5001";

	public String SIBS_CIF_DETAIL_TRX_INDEX = "5002";

	public String SIBS_CIF_ADDRESS_TRX_INDEX = "5003";

	public String SIBS_CIF_CREATE_TRX_INDEX = "5004";

	public String SIBS_CIF_ADDRESS_CREATE_TRX_INDEX = "5005";

	public String SIBS_CIF_SCL_INQ_TRX_INDEX = "5006";

	public String SIBS_DEALER_INQ_TRX_INDEX = "5010";

	public String SIBS_COLL_FD_INQ_TRX_INDEX = "5011";

	public String SIBS_APP_SEARCH_TRX_INDEX = "5007";

	public String SIBS_APP_DETAIL_TRX_INDEX = "5008";

	public String SIBS_APP_CREATE_TRX_INDEX = "5009";

	public String SIBS_CIF_EXP_INQ_TRX_INDEX = "5012";

	public String SIBS_CIF_EXP_SEC_INQ_TRX_INDEX = "5013";

	public String SIBS_CIF_EXP_COND_INQ_TRX_INDEX = "5014";

	public String SIBS_ACF_INQ_TRX_INDEX = "5015";

	// CTOS
	public String CTOS_LOSENQ_TRX_INDEX = "7001";

	// FIS
	public String FIS_LOSENQ_TRX_INDEX = "6001";

	// SEMA
	public String SEMA_CUST_INFO_REQ_TRX_INDEX = "9001";

	public String SEMA_APPROVED_APP_TRX_INDEX = "9002";

	// SEMA Fixed length template code
	public String SEMA_HEADER_REQ_TEMPLATE = "SEMA_MSG_HEADER";

	public String SEMA_CUST_INFO_REQ_TEMPLATE = "SEMA_CUST_INFO_REQ";

	public String SEMA_HEADER_0011_RES_TEMPLATE = "SEMA_MSG_0011_HEADER";

	public String SEMA_CUST_INFO_RES_TEMPLATE = "SEMA_CUST_INFO_RES";

	public String SEMA_APPROVED_CARD_REQ_TEMPLATE = "SEMA_APPROVED_CARD_REQ";

	public String SEMA_APPROVED_CARD_RES_TEMPLATE = "SEMA_APPROVED_CARD_RES";

	// SEMA Header keyValue
	public String SEMA_HEADER_MESSAGE_ID = "SEMAHeaderMessageID";

	public String SEMA_HEADER_NO_OF_TRANSACTION = "SEMAHeaderNoOfTransaction";

	public String SEMA_HEADER_MORE_RECORD_INDICATOR = "SEMAMoreRecordIndicator";

	public String SEMA_LAST_RECORD_KEY = "SEMALastRecordKey";

	// SEMA keyValue for customer info request
	public String SEMA_CUSTOMER_INFO_DETAIL_HEADER = "SEMACustomerInfoDetailHeader";

	public String SEMA_CUSTOMER_INFO_LIST = "SEMACustomerInfoList";

	// SEMA keyValue for Approved Card
	public String SEMA_APPROVED_CARD_LIST = "SEMAApprovedCardList";

	public String SEMA_APPROVED_CARD_SEND_STATUS = "SEMAApprovedCardSendStatus";

	public String SEMA_APPROVED_CARD_SEND_STATUS_MSG = "Approved Card Successfully Created by SEMA.";

	// SIBS
	// Fixed length template code
	public String SIBS_HEADER_REQ_TEMPLATE = "SIBS_MSG_HEADER";

	public String SIBS_HEADER_RES_TEMPLATE = "SIBS_MSG_HEADER";

	public String SIBS_CIF_SEARCH_REQ_TEMPLATE = "SIBS_CIF_SEARCH_REQ";

	public String SIBS_CIF_SEARCH_RES_TEMPLATE = "SIBS_CIF_SEARCH_RES";

	public String SIBS_CIF_DETAIL_REQ_TEMPLATE = "SIBS_CIF_DETAIL_REQ";

	public String SIBS_CIF_DETAIL_RES_TEMPLATE = "SIBS_CIF_DETAIL_RES";

	public String SIBS_CIF_ADDRESS_REQ_TEMPLATE = "SIBS_CIF_ADDRESS_REQ";

	public String SIBS_CIF_ADDRESS_RES_TEMPLATE = "SIBS_CIF_ADDRESS_RES";

	public String SIBS_CIF_CREATE_REQ_TEMPLATE = "SIBS_CIF_CREATE_REQ";

	public String SIBS_CIF_CREATE_RES_TEMPLATE = "SIBS_CIF_CREATE_RES";

	public String SIBS_CIF_ADDRESS_CREATE_REQ_TEMPLATE = "SIBS_CIF_ADDRESS_CREATE_REQ";

	public String SIBS_CIF_ADDRESS_CREATE_RES_TEMPLATE = "SIBS_CIF_ADDRESS_CREATE_RES";

	public String SIBS_DEALER_REQ_TEMPLATE = "SIBS_DEALER_REQ";

	public String SIBS_DEALER_RES_TEMPLATE = "SIBS_DEALER_RES";

	public String SIBS_COLL_FD_REQ_TEMPLATE = "SIBS_COLL_FD_REQ";

	public String SIBS_COLL_FD_RES_TEMPLATE = "SIBS_COLL_FD_RES";

	public String SIBS_APP_SEARCH_REQ_TEMPLATE = "SIBS_APP_SEARCH_REQ";

	public String SIBS_APP_SEARCH_RES_TEMPLATE = "SIBS_APP_SEARCH_RES";

	public String SIBS_APP_DETAIL_REQ_TEMPLATE = "SIBS_APP_DETAIL_REQ";

	public String SIBS_APP_DETAIL_RES_TEMPLATE = "SIBS_APP_DETAIL_RES";

	public String SIBS_APP_CREATE_REQ_TEMPLATE = "SIBS_APP_CREATE_REQ";

	public String SIBS_APP_CREATE_RES_TEMPLATE = "SIBS_APP_CREATE_RES";

	public String SIBS_CIF_SCL_REQ_TEMPLATE = "SIBS_CIF_SCL_REQ";

	public String SIBS_CIF_SCL_RES_TEMPLATE = "SIBS_CIF_SCL_RES";

	public String SIBS_ACF_REQ_TEMPLATE = "SIBS_ACF_REQ";

	public String SIBS_ACF_RES_TEMPLATE = "SIBS_ACF_RES";

	// Request Response Map Key Constant
	public String KEY_ID_NUMBER = "KEY_ID_NUMBER";

	public String KEY_ID_TYPE = "KEY_ID_TYPE";

	public String KEY_ID_ISSUE_COUNTRY = "KEY_ID_ISSUE_COUNTRY";

	public String HOST_CUSTOMER_NUMBER = "HOST_CUSTOMER_NUMBER";

	public String HOST_APPLICATION_NUMBER = "HOST_APPLICATION_NUMBER";

	public String HOST_CUSTOMER_ADDRESS_SEQ = "HOST_CUSTOMER_ADDRESS_SEQUENCE";

	public String CONCAT_HOST_CUSTOMER_NUMBER = "CONCAT_HOST_CUSTOMER_NUMBER";

	public String HOST_ACF_NUMBER = "HOST_ACF_NUMBER";

	public String ADDRESS_CREATE_FROM_WORKFLOW = "ADDRESS_CREATE_FROM_WORKFLOW";

	public String CIF_SEARCH_REQUEST_OBJECT = "CIF_SEARCH_REQ_OBJ";

	public String CIF_SEARCH_RESPONSE_OBJECT = "CIF_SEARCH_RES_OBJ";

	// Host Adapter configurator - hostService.xml
	public String HOST_XML_FILE = "hostService.xml";

	// public String HOST_XML_FILE = "SIT_hostService.xml";
	public String XML_ADAPTERS = "adapters";

	public String XML_GLOBAL_TIME = "duration";

	public String XML_TRXN_ID = "trxn_index";

	public String XML_TYPE = "type";

	public String XML_LOG = "log";

	public String XML_HOST_NAME = "hostName";

	public String XML_PORT = "port";

	public String XML_TIME_OUT = "timeout";

	public String XML_SSL_FLAG = "sslFlag";

	public String XML_USER_NAME = "userName";

	public String XML_PASSWORD = "password";

	public String XML_URL = "url";

	public String XML_PROXY_FLAG = "proxyFlag";

	public String XML_PROXY_HOST = "proxyHost";

	public String XML_PROXY_PORT = "proxyPort";

	public String KEY_ENCRYTION = "ENCRYPT";

	public String KEY_DECRYTION = "DECRYPT";

	// Type in hostService.xml
	public String TCP_CONNECTOR = "TCP";

	public String HTTP_CONNECTOR = "HTTP";

	public String XML_TCP_CONNECTOR = "XML_TCP";

	public String SIBS_TCP_CONNECTOR = "SIBS_TCP";

	public String SEMA_TCP_CONNECTOR = "SEMA_TCP";

	// Error message
	public String ERR_HOST_ADAPTER_SETTING_NOT_CONFIGURED = "Host Adapter Not Configure : ";

	public String ERR_HOST_TRANSACTION_TIMEOUT = "Host Transaction TimeOut.";

	public String ERR_HOST_CONNECTION_CLASS_NOT_AVAILABLE = "Host Connection Class Unavailable.";

	public String ERR_HOST_REQUEST_TYPE_NOT_AVAILABLE = "Host Request Type Unavailable.";

	public String ERR_STRING_TRANSFORM_OBJECT = "Error On String Transform to Object.";

	public String ERR_OBJECT_TRANSFORM_STRING = "Error On Object Transform to String.";

	public String ERR_HOST_CONNECTION_FAILURE = "Host Connection Failure: Unable to send a request.";

	public String ERR_HOST_ADAPTER_CONNECTION_FAILURE = "Host Connection Down";

	public String ERR_HOST_ADAPTER_PORT_ADDRESS_UNAVAILABLE = "Host Adapter Connection Error: Host name and Port is Mandatory";

	public String ERR_HOST_ADAPTER_LOGIN_UNAVAILABLE = "Host Adapter Connection Error: Login name and Password is Mandatory";

	public String ERR_NO_RESPONSE = "No Available Response Return from Host";

	public String ERR_ON_REMOTE = "Could Not Connect Over HTTP/HTTPS To Server";

	public String ERR_HOST_RESPONSE_TYPE_NOT_AVAILABLE = "Host Response Type Unavailable.";

	public String CTOS_XSL_DATA_SHEET = "ctos/defaultori.xsl";

	public String ERR_ON_TCP_REMOTE = "Could Not Connect Over TCP To Server";

	public String ERR_TRANSACTION = "Transaction Unsuccessful";

	public String ERR_CODE_NO_RECORD_FOUND = "MBM2001";

	public String ERR_FIS_BRANCH_NOT_CONFIGURED = "FIS Branch Not Configure.";

	public String ERR_SEMA_SAVE_FAIL = "SEMA Failed To Create The Approved Card.";

	// Parameter CTOS Name Value Pair
	public String NVP_XML_STRING = "XML_STRING";

	// Parameter FIS Name Value Pair
	public String NVP_INPUT_XML = "inputXML";

	public String FIS_DOUBLE_FIN_TAB_INDICATOR = "FIS_DOUBLE_FIN_TAB_INDICATOR";

	public String FIS_DOUBLE_FIN_VEHICLE_EQUIP = "FIS_DOUBLE_FIN_VEHICLE_EQUIP";

	public String FIS_DOUBLE_FIN_BLOCK_DISOUNT = "FIS_DOUBLE_FIN_BLOCK_DISOUNT";

	public String FIS_DOUBLE_FIN_REFERRAL = "FIS_DOUBLE_FIN_REFERRAL";

	public String FIS_DOUBLE_FIN_PREV_ENQUIRY = "FIS_DOUBLE_FIN_PREV_ENQUIRY";

	// CCRIS Constants
	public String CCRIS_DET_RPT_FLG = "ccrisDetRptFlag";

	public String INDV_GRP_CODE = "11";

	public String CORP_GRP_CODE = "24";

	public String ERR_HEADER = "ERR";

	public String CCRIS_ADD_HEADER = "LOSADD";

	public String CCRIS_DETAIL_HEADER = "LOSDETAIL";

	public String CCRIS_UPDATE_HEADER = "LOSUPDATE";

	public String CCRIS_SUPP_HEADER = "LOSSUPP";

	// common
	public String YES_FLAG = "Y";

	public String NO_FLAG = "N";

	// ID Type
	public String ID_TYPE_NEW_IC = "IN";

	public String ID_TYPE_OLD_IC = "IO";

	public String ID_TYPE_PASSPORT = "PP";

	public String ID_TYPE_POLICE = "IP";

	public String ID_TYPE_ARMY = "IT";

	public String ID_TYPE_SABAH = "BH";

	public String ID_TYPE_SARAWAK = "BS";

	// search method
	public String SEARCH_METHOD_I = "I";

	// role
	public String APPLICANT = "A";

	public String GUARANTOR = "G";

	// bank number
	public String BANK_CODE = "0223";

	// los_cif_check host_id
	public String HOST_CCRIS_ID = "CCRIS";

	public String HOST_CTOS_ID = "CTOS";

	public String HOST_FIS_ID = "FIS";

	public String HOST_SIBS_ID = "SIBS";

	// error message application resources
	public String ERROR_BASE_HOST_MSG = "error.base.host.message";

	// key value for account number and type
	public String CONST_ACCOUNT_NUMBER = "accountNumber";

	public String CONST_ACCOUNT_TYPE = "accountType";

	public String MAIN_EXP_LIST = "mainExposureList";

	public String MAIN_EXP_SEC_LIST = "mainExposureSecList";

	public String CONDUCT_EXP_LIST = "conductExposureList";

	public String CONST_COLLATERAL_ID = "collateralId";

	// SIBS Exposure Inquiry
	public String SIBS_CIF_EXP_INQ_REQ_TEMPLATE = "SIBS_CIF_EXP_INQ_REQ";

	public String SIBS_CIF_EXP_INQ_RES_TEMPLATE = "SIBS_CIF_EXP_INQ_RES";

	public String SIBS_CIF_EXP_SEC_INQ_REQ_TEMPLATE = "SIBS_CIF_EXP_SEC_INQ_REQ";

	public String SIBS_CIF_EXP_SEC_INQ_RES_TEMPLATE = "SIBS_CIF_EXP_SEC_INQ_RES";

	public String SIBS_CIF_COND_EXP_INQ_REQ_TEMPLATE = "SIBS_CIF_COND_EXP_INQ_REQ";

	public String SIBS_CIF_COND_EXP_INQ_RES_TEMPLATE = "SIBS_CIF_COND_EXP_INQ_RES";

	// keyValue MoreIndicator
	public String SIBS_HEADER_MORE_INDICATOR = "mbaseMoreRecordIndicator";

	// SIBS Constants Value
	public String BANK_NO = "23";

	public String BANK_NAME = "EONBANK";

	public String ACCOUNT_TYPE = "D";

	public String APP_SEARCH_LIST = "APP_SEARCH_LIST";

	public String CIF_INDV_CLASS = "I";

	public String CIF_INDV_EMAIL = "EM";

	public String CIF_INDV_HOUSE_NO = "RP";

	public String CIF_INDV_MOBILE_NO = "HP";

	public String CIF_INDV_OFFICE_NO = "OF";

	public String CIF_CURRENT_EMP_STATUS = "C";

	public String CIF_PREVIOUS_EMP_STATUS = "P";

	public String CIF_ADDR_MAILING_TYPE = "M";

	public String CIF_ADDR_EMPLOYMENT_TYPE = "E";

	public String CIF_ADDR_PERMANENT_TYPE = "P";

	public String CIF_ADDR_INQ_LIST_MAILING_TYPE = "M";

	public String CIF_ADDR_INQ_LIST_PERMANENT_TYPE = "P";

	public String CIF_ADDR_INQ_LIST_EMPLOYMENT_TYPE = "E";

	// CCRIS Reject Reason Constants
	public String CCRIS_REJECT_REASON = "rejectReason";

	// GOODS Constants Value
	public String GOODS_REGISTRATION_NO = "registrationNo";

	public String GOODS_CHASSIS_NO = "chassisNo";

	public String GOOD_ENGINE_NO = "engineNo";

	// FD Constants Value
	public String FD_GRP_NUM = "groupNumber";

	public String FD_ACCT_NUM = "accountNumber";

	public String CONST_FD_ACCT_TYP = "T";

	// Dealer Constant Value
	public String DEALER_NUMBER = "dealerNumber";

	// SIBS Header: R-resend, S-send
	public String CONST_RESEND_INDICATOR = "R";

	public String CONST_SEND_INDICATOR = "S";

	// CCRIS End Tag for every req/res transaction
	public String CONS_END_TAG = "~";

	// SIBS Header: Transaction Date Time indicator type
	public String MBASE_TRANSACTION_DATE_TYPE = "MBASE_TRANS_DATE";

	public String MBASE_TRANSACTION_TIME_TYPE = "MBASE_TRANS_TIME";

	public String DATE_TYPE_DDMMYY = "ddMMyy";

	public String DATE_TYPE_DDMMYYYY = "ddMMyyyy";

	public String DATE_TYPE_YYYYMMDD = "yyyyMMdd";

	public String DATE_TYPE_YYMMDD = "yyMMdd";

	public String DATE_TYPE_HHMMSS = "HHmmss";

	// SIBS - Collateral FD Interest Disposition
	public String COLLATERAL_FD_ADD_PRINCIPAL = "A";

	public String COLLATERAL_FD_ISSUE_CO = "C";

	public String COLLATERAL_FD_TRANSFER = "D";

	public String COLLATERAL_FD_WITHDRAW_INTEREST = "T";

	// CCRIS Status Code
	public String CONS_CCRIS_PENDING_STS = "P";

	public String CONS_CCRIS_APPROVE_STS = "A";

	public String CONS_CCRIS_DECLINED_STS = "R";

	public String CONS_CCRIS_CANCEL_STS = "X";

	public String CONS_CCRIS_ABORTED_STS = "D";

	public String KEY_VALUE_STS = "status";

	// header error code- No record found on Exposure Security
	public String NO_RECORD_ERR_CODE = "MBM2001";

	// header error code- No record found on Customer Search
	public String NO_CUSTOMER_SEARCH_RECORD_ERR_CODE = "MBM2001";

	// FIS Credit Inquiry - Constant Value
	public String CONS_COMPANY_CODE = "9998";

	public String CONS_BRANCH_CODE = "001";

	public String CONS_CREDIT_ENQUIRY_TYPE = "C";

	public String CONS_DOUBLE_FINANCE_TYPE = "D";

	// New IC Dash Character
	public String NEW_IC_DASH = "-";

	public String INVALID_NEW_IC_MESSAGE = "Invalid New IC Number";

	// CCRIS status
	public String SUCCESS_STS = "SUCCESS";

	public String UNSUCCESS_STS = "UNSUCCESSFUL";

	public String PENDING_STS = "PENDING";

	// Account Loan
	public String PERFORMING = "Performing";

	public String NON_PERFORMING = "Non-Performing";

	// cris no of user request
	public String NO_USER_REQUEST = "noUserRequest";

	public String SYSTEM_RESULT = "systemResult";

	// use for manual retrieve flag in credit report screen, determine is from
	// system or user
	public String RETRIEVE_FLAG = "Y";

	// CCRIS
	public String NO_DETAIL_REPORT = "NO DETAIL REPORT FOUND";

	// For Insert CCRIS,CTOS,FIS
	public String CIF_REF_CODE = "cif_ref_code";

	public String APPL_TYPE = "appl_type";

	// CTOS,FIS
	public String RETENTION_PERIOD = "Data Enquiry Is Under Retention Period.";

	// CCRIS
	public String SYSTEM_USER_ID = "99999999999999";
}
