// JavaScript Document

// Default regular expression;
var DEF_DATE_FORMAT = "DD/MM/YYYY";
var DEF_CURR_FORMAT = "999,999.99";
var DEF_TIME_FORMAT = "24:00";
var DEF_ZIP_CODE_FORMAT = "999999";
var DEF_PHONE_FORMAT = "(55[5])55555555";
var DEF_EMAIL_FORMAT = "john@integrosys.com";
var DEF_CSS_FORMAT = "John Smith, Peter Butler, ... "; // Comma Separated Strings
var DEF_CSN_FORMAT = "123, 4567, 891011..., ..."; // Comma Separated Number
var DEF_DEBUG_FLAG = true;

// Debug flag -- set to 'false' to by pass validation checking & formatting
function getDebugFlag() { return DEF_DEBUG_FLAG; }

// Input Text Field formats
function getDateFormat(format){
	if(typeof(format)!="undefined") DEF_DATE_FORMAT = format;;
	switch(DEF_DATE_FORMAT){
		case 'DD.MM.YYYY':
			return "^\([0-9][0-9]\)\\.\([0-9][0-9]\)\\.\([0-9]{4}\)$#1#2#3";
		case 'MM.DD.YYYY':
			return "^\([0-9][0-9]\)\\.\([0-9][0-9]\)\\.\([0-9]{4}\)$#2#1#3";
		case 'DD/MM/YYYY':						
			return "^\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9]{4}\)$#1#2#3";
		case 'MM/DD/YYYY':
			return "^\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9]{4}\)$#2#1#3";
		case 'MM-DD-YYYY':
			return "^\([0-9][0-9]\)\\-\([0-9][0-9]\)\\-\([0-9]{4}\)$#2#1#3";
		case 'YYYY-MM-DD':
			return "^\([0-9]{4}\)\\-\([0-9][0-9]\)\\-\([0-9][0-9]\)$#3#2#1";
		case 'MM/YYYY':
			return "^\([0-9][0-9]\)\/\([0-9]{4}\)$#2#3";
		case 'MM-YYYY':
			return "^\([0-9][0-9]\)\\-\([0-9]{4}\)$#2#3";														
		default:
			return "^\([0-9][0-9]\)\\-\([0-9][0-9]\)\\-\([0-9]{4}\)$#1#2#3"; //DD-MM-YYYY									
	}
}
	
function getTimeFormat(format){
	if(typeof(format)!="undefined") DEF_TIME_FORMAT = format;
	switch(DEF_TIME_FORMAT){
		case '12:00':
			return "^\(0[0-2]|1[0-2]|0?[0-9]\)\:\([0-5][0-9]\)$";
		case '12:00pm':
			return "^\(0[0-2]|1[0-2]|0?[0-9]\)\:\([0-5][0-9]\)\(p|a\)m$"
		case '24:00':
			return "^\(0[0-9]|1[0-9]|2[0-3]\)\:\([0-5][0-9]\)$"		
		default:
			return "^\(0[0-9]|1[0-9]|2[0-3]\)\:\([0-5][0-9]\)$" //24:00
	}
} 

function getCurrencyFormat(format){
	if(typeof(format)!="undefined") DEF_CURR_FORMAT = format;
	switch(DEF_CURR_FORMAT){
		case '999,999.99':
			return "^((\\d{1,3})*(,\\d{3})*$)|^(\\d{1,3}(,*\\d{3})*\\.\\d{2}$)|(^\\(\\d{1,3}(\,*\\d{3})*(\\.\\d{2})*\\)$)";
		case '999.999,99':
			return "^(\\d{1,3}(.\\d{3})*\\,\\d{2}$)|(^\\(\d{1,3}(.\\d{3})*\\,\\d{2}\\)$)";
		case '999,999':
			return "^(\\d{1,3}(,\\d{3})*\$)|(^\\(\d{1,3}(,\\d{3})*\\)$)";		
		default:
			return "^((\\d{1,3})*(,\\d{3})*$)|^(\\d{1,3}(,*\\d{3})*\\.\\d{2}$)|(^\\(\\d{1,3}(\,*\\d{3})*(\\.\\d{2})*\\)$)";
	}
}
	
function getZipCodeFormat(format){
	if(typeof(format)!="undefined") DEF_ZIP_CODE_FORMAT = format;
	switch(DEF_ZIP_CODE_FORMAT){
		case '99999':
			return "(^\\d{5}$)";
		case '999999':
			return "(^\\d{6}$)";
		case '99999-9999':
			return "(^\\d{5}-\\d{4}$)";	
		default:
			return "(^\\d{6}$)"; //999999
	}
}
	
function getPhoneFormat(){
	if(typeof(format)!="undefined") DEF_PHONE_FORMAT = format;
	switch(DEF_PHONE_FORMAT){
		case '5555555555':
			return "^(\\d{10})$";
		case '555-555-5555':
			return "^(\\d{3}-\\d{3}-\\d{4})$";
		case '(555) 555-5555':
			return "^(\\(\\d{3}\\)\\s*\\d{3}-\\d{4})$";
		default:
			return "^(\\(\\d{2,3}\\)\\s*\\d{8})$"; //(55[5])55555555		
	}
}

function getAlphabetsFormat() {
	return "^[a-zA-Z ]*$";
}

function getAlphaNumericFormat() {
	return "^[a-zA-Z0-9 \/!@#$%^&*()_+-]*$";
}
function getEmailFormat() {
		return "^[\\w\.=-]+@[\\w\\.-]+\\.[a-z]{2,4}$";
}

function getCSSFormat() {
	//return "^[a-zA-Z ]*$|^(\\s*\[a-zA-Z]*\\s*\\,*\\s*\[a-zA-Z]*\\s*\\,*\\s*)*$";
	return "^([a-zA-Z ]*$)|^([a-zA-Z ]*\\,*\[a-zA-Z ]*)$";
}

function getCSNFormat() {
	return "^\\s*\\d*\\s*$|^(\\s*\\d*\\.*\\d*\\s*\\,*\\s*\\d*\\.*\\d+\\s*\\,*\\s*)*$";
}

// Error Messages

function getErrorMessage(sFieldName, nErrType, nMinLen, nMaxLen) {
	switch(nErrType){
		// ERROR MESSAGES FOR INPUT TEXT TYPE OBJECT
		case 0: // error type for required field
			return "This field is required";
		case 1: // error type for Alphabets/Letters only field
			if(typeof(nMinLen)!="undefined" && typeof(nMaxLen)!="undefined" && nMinLen!='' && nMaxLen!='')
				return "The length should between " + nMinLen + " and " + nMaxLen; 
			else if(nMinLen =='' && nMaxLen!= '')
				return " Can't exceed the Maximum length : " + nMaxLen;
			else if(nMinLen !='' && nMaxLen == '')
				return " Can't exceed the Minimum length : " + nMinLen;
			else		
				return " The field can only contain letters and spaces" ; 
		case 2: // error type for  number field 
			if(typeof(nMinLen)!="undefined" && typeof(nMaxLen)!="undefined" && nMinLen!='' && nMaxLen!='')
				return "The value should between " + nMinLen + " and " + nMaxLen; 
			else if(nMinLen =='' && nMaxLen!= '')
				return " Can't exceed the Maximum value : " + nMaxLen;
			else if(nMinLen !='' && nMaxLen == '')
				return " Can't exceed the Minimum value : " + nMinLen;
			else		
				return " The field can't contain any letters" ; 
		case 3: // error type for currency field
			return " The format of the field is : '"  + DEF_CURR_FORMAT +"'";
		case 4: // error type for email field
			return " The format of the field is : '" + DEF_EMAIL_FORMAT +"'";		
		case 5: // error type for date field
			return " The format of the field is : '" + DEF_DATE_FORMAT +"'";
		case 6: // error type for time field
			return " The format of the field is : '" + DEF_TIME_FORMAT +"'";	
		case 7:	// error type for zip/postal code field
			return " The format of '" + sFieldName + "' field is : '" + DEF_ZIP_CODE_FORMAT +"'";
		case 8: // error type for phone field
			return " The format of the field is : '" + DEF_PHONE_FORMAT +"'";
		case 9:
			return " The format of the field is : '" + DEF_CSN_FORMAT +"'";
		case 10:
			return " The format of the field is : '" + DEF_CSS_FORMAT +"'";			
		
		// ERROR MESSAGES FOR RADIO TYPE OBJECT
		case 11:
			return "Must choose one of the values !!!";
		// ERROR MESSAGES FOR CHECK BOX TYPE OBJECT	
		case 12:
			return "Must check one of the values !!!";
		// ERROR MESSAGES FOR SELECT OPTION TYPE OBJECT
		case 13:	
			return "Must select one of the values !!!";
		// ERROR MESSAGES FOR TEXT AREA OBJECT	
		case 14:
			return "Total chracters exceed the maximum length";
				
	}
}

