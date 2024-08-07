<%@ page import="com.integrosys.cms.app.ddn.trx.IDDNTrxValue,
                 com.integrosys.cms.app.ddn.bus.IDDN,
                 com.integrosys.cms.app.ddn.bus.DDNCollateralInfo,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.ddn.bus.IDDNCustomerDetail,
                 com.integrosys.cms.ui.genddn.GenerateDDNForm,                 
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,                 
				 com.integrosys.cms.app.common.util.*,
                 java.util.*,
                 com.integrosys.cms.app.ddn.bus.IDDNItem,
                 com.integrosys.base.techinfra.util.DateUtil"
                 %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeld" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateral" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.OBDocumentHeld" %>
<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckList" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.ICheckListProxyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%!
public Hashtable getDocumentDeferDateList(List deferredList){
	
 Hashtable dateList = new Hashtable();
 
 Date latestDeferExpiryDate = null;
 Date latestExtendedDate = null;

 for (int x = 0; x < deferredList.size(); x++) {
	 
                ICheckListItem item = (ICheckListItem) deferredList.get(x); 
                
	            if(item.getDeferExpiryDate()!=null){
		        if(latestDeferExpiryDate!=null)
	            latestDeferExpiryDate = ((latestDeferExpiryDate.after(item.getDeferExpiryDate()))? latestDeferExpiryDate : item.getDeferExpiryDate());
	            else
	            latestDeferExpiryDate = item.getDeferExpiryDate(); 
                }
	            
	            if(item.getDeferExtendedDate()!=null){
		        if(latestExtendedDate!=null)
	            latestExtendedDate = ((latestExtendedDate.after(item.getDeferExtendedDate()))? latestExtendedDate : item.getDeferExtendedDate());
	            else
	            latestExtendedDate = item.getDeferExtendedDate();
                }
            }
 if(latestDeferExpiryDate!=null)
 dateList.put("latestDeferExpiryDate", latestDeferExpiryDate);
 if(latestExtendedDate!=null)
 dateList.put("latestExtendedDate", latestExtendedDate);
 
 return dateList;  
 
 
}
%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/genddn/generate_ddn.jsp,v 1.79 2006/11/23 07:58:09 nkumar Exp $
*
* Generate DDN Display page
* Purpose: Display DDN Details
* Description:
*
* @author $Author: nkumar $<br>
* @version $Revision: 1.79 $
* Date: $Date: 2006/11/23 07:58:09 $
* Tag: $Name: DEV_20061123_B286V1 $
*/
%>
<%
	try {
        Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

	    List deferredList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredList");
        HashMap deferredMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredMap");
        HashMap facilityMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.facilityMap");
        ArrayList deferCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferCreditApproverList");

	    //Hashtable documentDeferDate = getDocumentDeferDateList(deferredList);

	    //Date latestDeferExpiryDate = (Date) documentDeferDate.get("latestDeferExpiryDate");
        //Date latestExtendedDate = (Date) documentDeferDate.get("latestExtendedDate");
 
	    List deferredApprovalList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredApprovalList");
	    ILimitProfile limit = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	    IDDNTrxValue certTrxVal = (IDDNTrxValue)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.certTrxVal");
	
	    IDDN cert = (IDDN)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.cert");
	    IDDNCustomerDetail custDetail = (IDDNCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.custDetail");
	    if(custDetail!=null){
	        pageContext.setAttribute("custDetail",custDetail);
	    } 
	    if(cert!=null) {
	        pageContext.setAttribute("cert",cert);
	    }
	    //int row = 0;
	
	    String remarks = "";
        String lastRemarksMade = "";
        String lastActionBy = "";
	    String status = "";
	    if(certTrxVal!=null)	   {
	     DefaultLogger.debug(this,">>>>> "+certTrxVal.getFromState());
	     DefaultLogger.debug(this,">>>>> "+certTrxVal.getStatus());
	     }
	    if(certTrxVal!=null 
//	    && (
//	    	!(ICMSConstant.STATE_REJECTED.equals(certTrxVal.getFromState())) &&
//	        (ICMSConstant.STATE_ACTIVE.equals(certTrxVal.getStatus()))
//	        )
	       ){
	        status = certTrxVal.getStatus();
            //remarks = certTrxVal.getRemarks();
            remarks = (request.getParameter("remarks") == null) ? certTrxVal.getRemarks() : request.getParameter("remarks");
            lastRemarksMade = certTrxVal.getRemarks();
            lastActionBy = certTrxVal.getUserInfo();
	    }

	    if(lastActionBy==null) lastActionBy = "";
	    if (remarks==null) remarks= "";
        /*
	    Amount cleanAppAmt = null;
	    Amount notCleanAppAmt = null;
	    Amount cleanActAmt = null;
	    Amount notCleanActAmt = null;
	    Amount cleanDDNAmt = null;
	    Amount notCleanDDNAmt = null;
	    
	    if(cert!=null){
	        cleanAppAmt = cert.getCleanApprovalAmount();
	        notCleanAppAmt = cert.getApprovalAmount();        
	        cleanActAmt = cert.getCleanActivatedAmount();
	        notCleanActAmt = cert.getActivatedAmount();        
	        cleanDDNAmt = cert.getCleanDDNAmount();
	        notCleanDDNAmt = cert.getDDNAmount();
	    }
	    */
	    GenerateDDNForm aForm = (GenerateDDNForm)request.getAttribute("GenerateDDNForm");
	    if(request.getParameter("event").equals("update_return")) {
		    aForm.setRemarks(request.getParameter("remarks"));
	    }
        /*
	    String ddnAmtAry[] = aForm.getDdnLimit();  
	    String actAmtCurrCode[] = aForm.getAppAmtCurrCode();
        String maturityDate[] = aForm.getMaturityDate();
	    String ddnChecked = aForm.getCheckedIndexes();
		*/
		// tokenise the string n create an array of ddnChecked, then the checkbox checked value will be based on the array values
        /*
		StringTokenizer st = new StringTokenizer(ddnChecked, ",");
		HashMap ddnCheckedMap = new HashMap();
		while (st.hasMoreTokens()) {
			ddnCheckedMap.put(st.nextToken(),"ooo");
		}		
        */
		// loop thru the array of clean n unclean items then set the true/false values in the array
		// the display of the checkedbox will be based on the array
        /*
		boolean checkboxSelected[] = null;
		if (ddnAmtAry != null) {
			checkboxSelected = new boolean[ddnAmtAry.length];
		}
		for (int i=0; checkboxSelected != null && i < checkboxSelected.length; i++) {
			if (ddnCheckedMap.containsKey(String.valueOf(i))) {
				checkboxSelected[i] = true;
			}
			else {
				checkboxSelected[i] = false;
			}
		}
		*/
        /*
	    String creditgrade = null;
	    String creditGradeName = "-";    
	
	    if(custDetail!=null) {
	        if (custDetail.getCreditGrade() != null){
	            creditgrade = custDetail.getCreditGrade().getCGCode();
	            if (creditgrade != null) {
	                creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
	            }
	        }
	    }
	    CountryList cList = CountryList.getInstance();
	
	    Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
	            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();
       */	
	   // GregorianCalendar cal = new GregorianCalendar();
	   // cal.setTime(bcaApprovedDate);
	
	
		// get BFL final issue date.
        /*
		String bflFinalIssueDateStr = (String) request.getAttribute("bflFinalIssueDate");
		DefaultLogger.debug(this," * bflFinalIssueDateStr = "+bflFinalIssueDateStr);
		if(bflFinalIssueDateStr==null || bflFinalIssueDateStr.equals("")) bflFinalIssueDateStr="-";
		*/
		
		// Get DDN Valid for duration
        /*
		String warning = "";
		String validFor = "";
		validFor = aForm.getDdnDays();
		if(validFor==null || validFor.equals("")){
			validFor="0";
		}
		DefaultLogger.debug(this,"RENEWAL INDEX -"+ String.valueOf(limit.getRenewalInd()));
		DefaultLogger.debug(this,"CCC COMPLETE INDEX -"+ String.valueOf(limit.getCCCCompleteInd()));
		*/
		
		//CMS 1995 by Hai Tao
        /*
	    boolean anyDeletedLimit = false ;
        int i=0; // index for maturity date
        */

        // list out all the checklist (CC & Security) for particular CUSTOMER
        HashMap docListMap = (HashMap) request.getAttribute("docsHeldMap");

        /**
         * will list down all the deferred list base on the checklist level...starting from CC to Security
         * for CC , here is the category for listing , [Main Borrower, Joint Borrower, Co Borrower, Pledger, Non Borrower]
         * for Security , get the list from docListMap by key SECURITY
         * */
        ArrayList ccList = new ArrayList();
        ccList.add(ICMSConstant.CHECKLIST_MAIN_BORROWER);
        ccList.add(ICMSConstant.CHECKLIST_JOINT_BORROWER);
        ccList.add(ICMSConstant.CHECKLIST_CO_BORROWER);
        ccList.add(ICMSConstant.CHECKLIST_PLEDGER);
        ccList.add(ICMSConstant.CHECKLIST_NON_BORROWER);

        ArrayList securityList = new ArrayList();
        securityList.add(ICMSConstant.CHECKLIST_SECURITY);
        ArrayList facilityList = new ArrayList();
        facilityList.add(ICMSConstant.CHECKLIST_FACILITY);
        ArrayList camList = new ArrayList();
        camList.add(ICMSConstant.CHECKLIST_CAM);
        
%>




<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
<%--
var latestDeferExpiryDate = null;
var latestExtendedDate = null;

<%
if(latestDeferExpiryDate!=null){
%>
latestDeferExpiryDate = '<integro:date object="<%=latestDeferExpiryDate%>"/>';
<%
}
%>
<%
if(latestExtendedDate!=null){
%>
latestExtendedDate = '<integro:date object="<%=latestExtendedDate%>"/>';
<%
}
%>
--%>
/*
function remindExpiryDateValidation(){

    var expiryDate = document.forms[0].ddnDate.value;
    var expiryExtDate = document.forms[0].ddnExtDate.value;
    
    
    var convertedDocExpiryDate = null;
    if(latestDeferExpiryDate!=null){
		if(latestDeferExpiryDate!=''){
    	convertedDocExpiryDate = new Date();
		convertedDocExpiryDate.setMonth(months[latestDeferExpiryDate.substring(3,6)]);
		convertedDocExpiryDate.setFullYear(latestDeferExpiryDate.substring(7,11));
		convertedDocExpiryDate.setDate(latestDeferExpiryDate.substring(0,2));
		//alert("Date DeferExpiry converted: " + convertedDocExpiryDate);
  	   }
   } 

    var convertedDocExtendDate = null;
    if(latestExtendedDate!=null){
	    if(latestExtendedDate!=''){
    	convertedDocExtendDate = new Date();
		convertedDocExtendDate.setMonth(months[latestExtendedDate.substring(3,6)]);
		convertedDocExtendDate.setFullYear(latestExtendedDate.substring(7,11));
		convertedDocExtendDate.setDate(latestExtendedDate.substring(0,2));
	 //alert("Date DeferExpiry converted: " + convertedDocExtendDate);
     }
    }

    var convertedExpiryDate = null;
    if(expiryDate!=null){
	 if(expiryDate!=''){
      convertedExpiryDate = new Date();
	  convertedExpiryDate.setMonth(months[expiryDate.substring(3,6)]);
	  convertedExpiryDate.setFullYear(expiryDate.substring(7,11));
	  convertedExpiryDate.setDate(expiryDate.substring(0,2));
	  //alert("Date DeferExpiry converted: " + convertedExpiryDate);
     }
    }

    var convertedExpiryExtDate = null;
    if(expiryExtDate!=null){
	     if(expiryExtDate!=''){
         convertedExpiryExtDate = new Date();
		 convertedExpiryExtDate.setMonth(months[expiryExtDate.substring(3,6)]);
		 convertedExpiryExtDate.setFullYear(expiryExtDate.substring(7,11));
		 convertedExpiryExtDate.setDate(expiryExtDate.substring(0,2));
		 //alert("Date DeferExpiry converted: " + convertedExpiryExtDate);
    	}
    }

    if(convertedDocExpiryDate!=null&&convertedDocExtendDate==null){
              convertedDocExpiryDate = convertedDocExpiryDate.getTime();

              if(convertedExpiryDate!=null){
                convertedExpiryDate = convertedExpiryDate.getTime();
                if(convertedExpiryDate > convertedDocExpiryDate){
                document.all['warning91'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> The DDN expiry date should not be later than the deferred document expiry date.</font>';
                //alter("ExpiryDate is greater than DocExpiryDate");
                }
                else{
                document.all['warning91'].innerHTML = '';
                }
                
                var todaydate = new Date();
                todaydate = todaydate.getTime();
                if (( todaydate > convertedDocExpiryDate) || (todaydate > convertedExpiryDate)){
                document.all['warning93'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> Deferral has expired.</font>';
	            }
	            else{
                document.all['warning93'].innerHTML = '';
                }
                
              }

              if(convertedExpiryExtDate!=null){
                convertedExpiryExtDate = convertedExpiryExtDate.getTime();
                if(convertedExpiryExtDate > convertedDocExpiryDate){
                document.all['warning92'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> The DDN extended expiry date should not be later than the deferred document expiry date.</font>';
                //alter("ExpiryExtDate is greater than DocExpiryDate");
                }
                else{
                document.all['warning92'].innerHTML = '';
                }
                
                var todaydate = new Date();
                todaydate = todaydate.getTime();
                if (( todaydate > convertedDocExpiryDate) || (todaydate > convertedExpiryExtDate)){
                document.all['warning94'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> Deferral has expired.</font>';
	            }
	            else{
                document.all['warning94'].innerHTML = '';
                }
                
              }
    }
    else if(convertedDocExpiryDate!=null&&convertedDocExtendDate!=null){

             convertedDocExpiryDate = convertedDocExpiryDate.getTime();
             convertedDocExtendDate = convertedDocExtendDate.getTime();

             var isExtValid = (convertedDocExpiryDate <= convertedDocExtendDate);

             if(isExtValid){
                   if(convertedExpiryDate!=null){
                  convertedExpiryDate = convertedExpiryDate.getTime();
                    if(convertedExpiryDate > convertedDocExtendDate){
                    document.all['warning91'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> The DDN expiry date should not be later than the document extended deferment date.</font>';
                    //alert("ExpiryDate is greater than DocExtendDate");
                    }
                    else{
                     document.all['warning91'].innerHTML = '';
                    }
                    
                    var todaydate = new Date();
                	todaydate = todaydate.getTime();
                	if (( todaydate > convertedDocExtendDate) || (todaydate > convertedExpiryDate)){
                	document.all['warning93'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> Deferral has expired.</font>';
	           		 }
	           		 else{
		           	 document.all['warning93'].innerHTML = ''
	           		 }
                    
                  }

                  if(convertedExpiryExtDate!=null){
                  convertedExpiryExtDate = convertedExpiryExtDate.getTime();
                    if(convertedExpiryExtDate > convertedDocExtendDate){
                    document.all['warning92'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> The DDN extended expiry date should not be later than the document extended deferment date.</font>';
                    //alert("ExpiryExtDate is greater than DocExtendDate");
                    }
                    else{
                    document.all['warning92'].innerHTML = '';
                    }
                    
                    var todaydate = new Date();
                	todaydate = todaydate.getTime();
                	if (( todaydate > convertedDocExtendDate) || (todaydate > convertedExpiryExtDate)){
                	document.all['warning94'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> Deferral has expired.</font>';
	           		 }
	           		 else{
		           	 document.all['warning94'].innerHTML = ''
	           		 }                  
                    
                 }
             }
             else{
              if(convertedExpiryDate!=null){
                  convertedExpiryDate = convertedExpiryDate.getTime();
                    if(convertedExpiryDate > convertedDocExpiryDate){
                    document.all['warning91'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> The DDN expiry date should not be later than the document deferment expiry date.</font>';
                    //alert("ExpiryDate is greater than DocExpDate");
                    }
                    else{
                     document.all['warning91'].innerHTML = '';
                    }
                  }

                  if(convertedExpiryExtDate!=null){
                    convertedExpiryExtDate = convertedExpiryExtDate.getTime();
                    if(convertedExpiryExtDate > convertedDocExpiryDate ){
                    document.all['warning92'].innerHTML = '<font color="#FF0000" size="1"><br><strong>Warning:</strong> The DDN extended expiry date should not be later than the document deferment expiry date.</font>';
                    //alert("ExpiryExtDate is greater than DocExpDate");
                    }
                    else{
                    document.all['warning92'].innerHTML = '';
                    }
                 }
             }
    }

}
*/
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
/*
function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
	if (doPartial(1)) {
		document.forms[0].event.value="update_view_outer_limit_bca";
		document.forms[0].outerLimitID.value=outerLimitID;
		document.forms[0].limitID.value=limitID;
		document.forms[0].outerLimitProfileID.value=outerLimitProfileID;
		document.forms[0].submit();
	}
}
*/
//var calResult = true;
function submitPage() {
	// Construct list of checked indexes before submitting
	//if(doPartial(2)) {
    	document.forms[0].event.value="submit_ddn";
    	document.forms[0].submit();
	//}
/*	
	var chkResult = checkExtendedDate();
	var chkApprovalExpiryDate = true;
	var expiryDate = document.forms[0].ddnDate.value;
    var approvalDate = document.forms[0].appDate.value;

    if ((expiryDate == null || expiryDate == '') || (approvalDate == null || approvalDate == '')) {
    	chkApprovalExpiryDate = false;
    }

    if(chkApprovalExpiryDate==false){
		alert('The Deferral Approval Date or DDN Expiry Date is missing. Please verify.');
    }else if(chkResult==false || calResult==false){
       	alert('The DDN Expiry Date or DDN Extended Expiry Date is invalid. Please verify.');
	}else{
        if(doPartial(2)) {
        	document.forms[0].event.value="submit_ddn";
        	document.forms[0].submit();
    	}
    }
    calResult = true;
*/
}
/*
function notsubmitPage() {
	var isLimiteDeleted = true; 
    if(isLimiteDeleted){
	    alert('Limit(s) in this BCA has / have been deleted. Hence, this is a null and void transaction and has to be rejected / closed.');
        return false;
    }    
}
*/

function refreshPage(){
    if(doPartial(1)) {
    	document.forms[0].event.value="refresh_gen_ddn";
    	document.forms[0].submit();
    }
}
/*
function makeTotal() {
    if(doPartial(1)) {
        document.forms[0].event.value="total_ddn";
        document.forms[0].submit();
    }
}
*/
function doPartial(ind) {
  var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	var checkedIndexes="";
	for (var i=0; i<formObj.elements.length; i++) {
		var type = formObj.elements[i].type;
		var name = formObj.elements[i].name;
		if (type == 'checkbox' && name == 'issueDDN') {
			k++;
	  }
	}
  j = 0;
	if( k > 1) {
		for (var i=0; i<formObj.elements.length; i++) {
			var type = formObj.elements[i].type;
			var name = formObj.elements[i].name;
			if (type == 'checkbox' && name == 'issueDDN') {
				var obj = formObj.elements[i];
				if (obj.checked) {
					temp = temp + "," + formObj.issueDDN[j].value  ;
					checkedIndexes = checkedIndexes + "," + j;
				}
			j++;
	    }
		}
	}
	else {
	  for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
	    if (type == 'checkbox' && name == 'issueDDN') {
        	var obj = formObj.elements[i];
		    if (obj.checked) {
					temp = temp + "," + formObj.issueDDN.value;
					checkedIndexes="0";
				}
	    }
		}
	}
  temp=temp.substring(1);
  if(temp=="" && ind==2) {
        alert('Please select the limits to generate DDN.');
      return false;
  }
	formObj.ddnIssuedIndex.value=temp;
	formObj.checkedIndexes.value=checkedIndexes;
	return true;
}
/*
function days_between(date1, date2) {

    // The number of middnseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to middnseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();

    // Calculate the difference in middnseconds
    var difference_ms = Math.abs(date1_ms - date2_ms);

    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY);

}
*/
/*
     months = new Array();
     months['Jan'] = 0;
     months['Feb'] = 1;
     months['Mar'] = 2;
     months['Apr'] = 3;
     months['May'] = 4;
     months['Jun'] = 5;
     months['Jul'] = 6;
     months['Aug'] = 7;
     months['Sep'] = 8;
     months['Oct'] = 9;
     months['Nov'] = 10;
     months['Dec'] = 11;

function calculateDaysDiff() {
    remindExpiryDateValidation();
    ddnExpiry = document.forms[0].ddnDate.value;
    ddnExtended = document.forms[0].ddnExtDate.value;
    ddnApproval = document.forms[0].appDate.value;
	var userExtend = false;
	calResult = true;
    date1 = new Date();
    date2 = new Date();
    if ((ddnExtended == null || ddnExtended == '') && (ddnExpiry == null || ddnExpiry == '')) {
       document.forms[0].ddnDays.value = '';
    } else {
       	if(ddnApproval == null || ddnApproval == ''){
         	document.forms[0].ddnDays.value = '';
         	document.all['appDate'].innerHTML = '<font color="#FF0000" size="1">Deferral Approval Date cannot be empty.</font>';
        }else{
        	document.all['appDate'].innerHTML = '';
            if (ddnExtended != null && ddnExtended != '') {
            	extendedDate = new Date(ddnExtended.substring(7,11), months[ddnExtended.substring(3,6)], ddnExtended.substring(0,2));
            	expiryDate = new Date(ddnExpiry.substring(7,11), months[ddnExpiry.substring(3,6)], ddnExpiry.substring(0,2));
            	if(expiryDate <= extendedDate){
            		date1 = extendedDate;
                	userExtend = true;
            	}else{
					document.all['extDate'].innerHTML = '<font color="#FF0000" size="1">The DDN Extended Expiry Date must be later than the DDN Expiry Date.</font>';
					date1 = expiryDate;
					calResult = false;
                }
            } else {
              	date1 = new Date(ddnExpiry.substring(7,11), months[ddnExpiry.substring(3,6)], ddnExpiry.substring(0,2));
            }

            date2 = new Date(ddnApproval.substring(7,11), months[ddnApproval.substring(3,6)], ddnApproval.substring(0,2));
			if (date1 < date2) {
                document.forms[0].ddnDays.value = 0;
                if(userExtend==false){
                	document.all['warning90'].innerHTML = '<font color="#FF0000" size="1">The DDN Expiry Date cannot be earlier than the Deferral Approval Date.</font>';
                }else{
                	document.all['extDate'].innerHTML = '<font color="#FF0000" size="1">The DDN Extended Expiry Date cannot be earlier than the Deferral Approval Date.</font>';
                }
                calResult = false;
            } else {
                daysDiff = days_between(date1, date2);
                document.forms[0].ddnDays.value = daysDiff;
                if (daysDiff > 90){
                	if(userExtend==false){
                  		document.all['warning90'].innerHTML = '<font color="#FF0000" size="1"><% if (limit.getRenewalInd()) { %>Deferral<% } else {%>DDN Expiry <%}%> Date is more than 90 calendar days from Deferral approval date.</font>';
                  	}else{
                  		document.all['extDate'].innerHTML = '<font color="#FF0000" size="1"><% if (limit.getRenewalInd()) { %>Deferral<% } else {%>DDN Extended Expiry<%}%> Date is more than 90 calendar days from Deferral approval date.</font>';
                  	}
                }else{
                	if(userExtend==false){
                  		document.all['warning90'].innerHTML = '';
                  	}else{
                  		document.all['extDate'].innerHTML = '';
                  	}
                }
            }
          }
    }
    //remindExpiryDateValidation();
}

function checkExtendedDate(){
    expiredate = document.forms[0].ddnDate.value;
    extenddate = document.forms[0].ddnExtDate.value;
    var expDate = new Date();
    var extDate = new Date();
    var initialWarning = document.all['extDate'].innerHTML;
    document.all['extDate'].innerHTML = '';

    if(expiredate == null || expiredate == ''){
    	document.forms[0].ddnExtDate.value = '';
    	document.all['extDate'].innerHTML = initialWarning+ '<font color="#FF0000" size="1"><br>Expiry Date is blank, Extended Expiry Date is not allowed.</font>';
    	return false;
    }else if (extenddate != null && extenddate != '' ) {

        expDate = new Date(expiredate.substring(7,11), months[expiredate.substring(3,6)], expiredate.substring(0,2));
        extDate = new Date(extenddate.substring(7,11), months[extenddate.substring(3,6)], extenddate.substring(0,2));
        if(extDate < expDate){
//        	document.forms[0].ddnExtDate.value ='';
//        	document.all['extDate'].innerHTML = initialWarning + '<font color="#FF0000" size="1"><br>DDN Extended Expiry Date should not be earlier than DDN Expiry Date.</font>';
        	return false;
        }
	}
	return true;
}
*/
function checkTextSize() {
	var text = document.forms[0].remarks.value;
	if(text==''){
		//alert('empty text');
	}else{
		if(text.length>2000){
			document.all['warningRemarks'].innerHTML = '<font color="#FF0000" size="1"><br>Remarks is too long. Please restrict to 2000 characters.</font>';
			document.forms[0].remarks.value = text.substring(0, 2000);
		}else{
			document.all['warningRemarks'].innerHTML = '';
		}
	}
}
/*
function setUpdatedDate (cal, date)
{
    var todayDate = new Date();
    todayDate.setHours(0);
    todayDate.setMinutes(0);
    todayDate.setSeconds(0);
    todayDate.setMilliseconds(0);
    var expDate = new Date(date.substring(7,11), months[date.substring(3,6)], date.substring(0,2));

    if (expDate.getTime() < todayDate.getTime()) {
        if (!confirm ("Care! Limit Maturity Date is an expired date.")) {
            return false;
        }
    }
    cal.sel.value = date;
    var name = cal.sel.name;
    var num = parseInt (name.substring (12, name.length));
    if (document.forms[0].maturityDate.length+'' == 'undefined') {
        document.forms[0].maturityDate.value = date;
    } else {
        document.forms[0].maturityDate[num].value = date;
    }
}
*/
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/calendarb.gif','img/cancel2.gif')" onmousemove="calculateDaysDiff();">
<html:form action="GenerateDDN" >
<input type="hidden" name="event" />
<input type="hidden" name="actionName" value="GenerateDDN"/>
<%--<html:hidden property="bcaAppDate" />--%>
<%--<input type="hidden" name="ddnIssuedIndex" />--%>
<%--<input type="hidden" name="checkedIndexes" />--%>
<%--<input type="hidden" name="outerLimitID"/>--%>
<%--<input type="hidden" name="limitID"/>--%>
<%--<input type="hidden" name="outerLimitProfileID"/>--%>
<%--<input type="hidden" name="renewBCAInd" value="<%=String.valueOf(limit.getRenewalInd())%>"/>--%>
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<!-- InstanceeginEditable name="Content" -->
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Document Deferral Note (DDN)</h3></td>
    </tr>
    <%--
    <tr>
      <td><hr />
        </td>
    </tr>
    --%>
  </thead>
  <tbody>
    <%--
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td height="22" class="fieldname">LE ID<br /> </td>
              <td>&nbsp;<bean:write name="custDetail" property="legalID" /></td>
              <td class="fieldname">Legal Name</td>
              <td>&nbsp;<bean:write name="custDetail" property="legalName" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Customer Sub-Profile Name<br /> </td>
              <td>&nbsp;<bean:write name="custDetail" property="customerName" /></td>
              <td class="fieldname">Sub-Profile ID</td>
              <td>&nbsp;<bean:write name="custDetail" property="customerReference" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<%=creditGradeName%></td>
              <td class="fieldname">Customer BFL Issue Date</td>
              <td>&nbsp;<%=bflFinalIssueDateStr%></td>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM</td>
              <%
              //String fam = custDetail.getFamCode() + ", " + custDetail.getFamName();
              	String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
	      		String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
    	      	String fam = famCode + ", " + famName ;
              %>
              <td><integro:empty-if-null value="<%=fam %>" /></td>
              <td class="fieldname">DDN Ref. No.</td>
              <td>
              <% if (cert.getDDNRef() != null){ %>
					<%=custDetail.getLegalID()%>/<%= cert.getDDNRef()%>
              <% }else { %>
              		-
              <% }	%>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    --%>
  </tbody>
</table>
<%--Let inject the deferred list base on checklist level--%>
<!--<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">-->
<!--    <tr>-->
<!--        <td><h3>Constitutional / Contractual Checklist</h3></td>-->
<!--    </tr>-->
<!--    <tr>-->
<!--        <td>-->
<!--            <hr/>-->
<!--        </td>-->
<!--    </tr>-->
<!--</table>-->
<%--CC--%>
<%
    boolean hasCCCheckList = false;
    for (int x = 0; x < ccList.size(); x++) {//Main Borrower, Co-Borrower....
        if (!docListMap.containsKey(ccList.get(x))) continue;

        List list = (List) docListMap.get(ccList.get(x));

        //System.out.println("Total Document : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
            if (!hasCCCheckList) hasCCCheckList = true;

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);

            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            if (hasDeferredItem) {
            %>
            <!--<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Customer Category</td>
                                    <td width="30%">
                                        <%
                                        String custCat = (String)ccList.get(x);
                                        String showCustCat = null;
                                        if (custCat.equals(ICMSConstant.CHECKLIST_MAIN_BORROWER)) {
                                            showCustCat = "Main Borrower/Hirer";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_JOINT_BORROWER)) {
                                            showCustCat = "Joint Borrower";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_CO_BORROWER)) {
                                            showCustCat = "Co-Borrower";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_PLEDGER)) {
                                            showCustCat = "Pledgor/Guarantor";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_NON_BORROWER)) {
                                            showCustCat = "Non-Borrower";
                                        }
                                        %>
                                        <integro:empty-if-null value="<%=showCustCat%>"/>&nbsp;
                                    </td>
                                    <td class="fieldname" width="20%">Customer Name</td>
                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalName()%>"/>&nbsp;</td>
                                </tr>
                                <tr class="even">
                                    <td class="fieldname" width="20%">CIF No</td>
                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalID()%>"/>&nbsp;</td>
                                    <td class="fieldname" width="20%">Checklist ID</td>
                                    <td width="30%"><%=docHeld.getCheckListID()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Status</td>
                                    <td width="30%">
                                        <%        
                                        String checkListStatus = (PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus()) == null) ?
                                                docHeld.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus());
                                        %>
                                        <integro:empty-if-null value="<%=checkListStatus%>"/>&nbsp;
                                    </td>
                                    <td class="fieldname" width="20%">&nbsp;</td>
                                    <td width="30%">&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                            <thead>
                                <tr>
                                    <td><h3>Deferral Requested For</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr/>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%--Inject the deferred item here--%>
                                <%
                                //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                //if (hasDeferredItem) {
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
                                                        <td width="12%">Doc Number</td>
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Date Defer</td>
                                                        <td width="5%">Expected Date of Return</td>
                                                        <td width="5%">Doc Status</td>
                                                        <td width="15%">Action Party</td>
                                                        <td width="10%">Approval Date</td>
                                                        <td width="12%">Approved By</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);

                                                        OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                        if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                            log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

                                                        String rowClass = "";
                                                        _row++;
                                                        if (_row % 2 != 0) {
                                                            rowClass = "odd";
                                                        } else {
                                                            rowClass = "even";
                                                        }
                                                             
                                                        %>
                                                        <tr class="<%=rowClass%>">
                                                            <td class="index"><%=_row%></td>
                                                            <td><%=item.getCheckListItemRef()%>&nbsp;<input type="hidden" name="docNumber" value="<%=item.getCheckListItemRef()%>"/></td>
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getActionParty()%>"/>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
                                                            <%
                                                            Calendar cal2 = null;
                                                            if (log.getLogDate()!= null) {
                                                                //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                                                                String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                                                                String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                                                                String year = null;
                                                                String month = null;
                                                                String day = null;
                                                                if (temp != null) {
                                                                    day = temp[0];
                                                                    month = temp[1];
                                                                    year = temp[2];

                                                                    cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                                                                }
                                                            }
                                                            %>
                                                            <td><% if (cal2 != null) { %><integro:date object="<%=cal2.getTime()%>"/><input type="hidden" name="theApprovalDate" value="<%=cal2.getTime()%>"/><% } else { %>&nbsp;<% } %></td>
                                                            <%
                                                            String approvedBy = "";
                                                            String userName = log.getLogUserName() == null ? "-" : log.getLogUserName();
                                                            String groupName = log.getLogGroupName() == null ? "-" : log.getLogGroupName();
                                                            approvedBy = userName + " (" + groupName + ")";
                                                            %>
                                                            <td><%--<integro:empty-if-null value="<%=log.getLogUserName()%>"/>&nbsp;(<integro:empty-if-null value="<%=log.getLogGroupName()%>"/>)--%><%=approvedBy%><input type="hidden" name="approvedBy" value="<%=approvedBy%>"/></td>
                                                        </tr>
                                                        <%
                                                    }
                                                    %>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                //} else {
                                    %>
                                    <%--
                                    <tr class="odd">
                                        <td>There is no deferred document.</td>
                                    </tr>
                                    --%>
                                    <%
                                //}
                                %>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
            </table>
            --><%
            }
        }
    }

    if (!hasCCCheckList) {
        %>
<!--        <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">-->
<!--            <tr class="odd">-->
<!--                <td>There is no CC checklist.</td>-->
<!--            </tr>-->
<!--        </table>-->
        <%
    }
%>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>CAM Checklist</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%--CAM--%>
<%
    boolean hasCamCheckList = false;
    for (int x = 0; x < camList.size(); x++) {//Main Borrower, Co-Borrower....
        if (!docListMap.containsKey(camList.get(x))) continue;

        List list = (List) docListMap.get(camList.get(x));

        System.out.println("Total Document cam  : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
           

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);

            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            if (hasDeferredItem) {
            	hasCamCheckList = true;
            %>
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
<!--                                <tr class="odd">-->
<!--                                    <td class="fieldname" width="20%">Customer Category</td>-->
<!--                                    <td width="30%">-->
                                        <%
                                        String custCat = (String)ccList.get(x);
                                        String showCustCat = null;
                                        if (custCat.equals(ICMSConstant.CHECKLIST_MAIN_BORROWER)) {
                                            showCustCat = "Main Borrower/Hirer";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_JOINT_BORROWER)) {
                                            showCustCat = "Joint Borrower";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_CO_BORROWER)) {
                                            showCustCat = "Co-Borrower";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_PLEDGER)) {
                                            showCustCat = "Pledgor/Guarantor";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_NON_BORROWER)) {
                                            showCustCat = "Non-Borrower";
                                        }
                                        %>
<!--                                        <integro:empty-if-null value="<%=showCustCat%>"/>&nbsp;-->
<!--                                    </td>-->
<!--                                    <td class="fieldname" width="20%">Customer Name</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalName()%>"/>&nbsp;</td>-->
<!--                                </tr>-->
                                <tr class="even">
<!--                                    <td class="fieldname" width="20%">CIF No</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalID()%>"/>&nbsp;</td>-->
                                    <td class="fieldname" width="20%">Checklist ID</td>
                                    <td width="30%"><%=docHeld.getCheckListID()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Status</td>
                                    <td width="30%">
                                        <%        
                                        String checkListStatus = (PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus()) == null) ?
                                                docHeld.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus());
                                        %>
                                        <integro:empty-if-null value="<%=checkListStatus%>"/>&nbsp;
                                    </td>
                                    
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Type</td>
                                    <td width="30%">
                                        CAM&nbsp;
                                    </td>
                                    
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                            <thead>
                                <tr>
                                    <td><h3>Deferral Requested For</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr/>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%--Inject the deferred item here--%>
                                <%
                                //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                //if (hasDeferredItem) {
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Original Date Defer</td>
                                                        <td width="5%">Next Due Date</td>
                                                        <td width="5%">Doc Status</td>
                                                        <td width="5%">Defer Counter</td>
                                                         <td width="5%"> Total Defered Days</td>
<!--                                                        <td width="15%">Action Party</td>-->
														<td width="8%">Credit Approver</td>
														<td width="8%">Remarks</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);

                                                        OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                        if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                            log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

                                                        String rowClass = "";
                                                        _row++;
                                                        if (_row % 2 != 0) {
                                                            rowClass = "odd";
                                                        } else {
                                                            rowClass = "even";
                                                        }
                                                             
                                                        %>
                                                        <tr class="<%=rowClass%>">
                                                            <td class="index"><%=_row%></td>
                                                       
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferCount()%>"/>&nbsp;<input type="hidden" name="deferCount" value="<%=item.getDeferCount()%>"/></td>
                                                           <td><integro:empty-if-null value="<%=item.getDeferedDays()%>"/>&nbsp;<input type="hidden" name="deferedDays" value="<%=item.getDeferedDays()%>"/></td>
                                                            <td>
															<% for(int i=0; i<deferCreditApproverList.size();i++){
            	 
												            	 LabelValueBean  creditApproval= (LabelValueBean) deferCreditApproverList.get(i);
												            	 if(creditApproval.getValue()!=null){
												            	 if(creditApproval.getValue().trim().equals(item.getCreditApprover())){
												            	%>	 
												            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
												            	<% 
												            	 }
												            	
												            	 }
												             }  %>
															&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
															<td><integro:empty-if-null value="<%=item.getRemarks()%>"/>&nbsp;<input type="hidden" name="remarks" value="<%=item.getRemarks()%>"/></td>

													
                                                            <%
                                                            Calendar cal2 = null;
                                                            if (log.getLogDate()!= null) {
                                                                //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                                                                String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                                                                String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                                                                String year = null;
                                                                String month = null;
                                                                String day = null;
                                                                if (temp != null) {
                                                                    day = temp[0];
                                                                    month = temp[1];
                                                                    year = temp[2];

                                                                    cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                                                                }
                                                            }
                                                            %>
                                                        </tr>
                                                        <%
                                                    }
                                                    %>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                //} else {
                                    %>
                                    <%--
                                    <tr class="odd">
                                        <td>There is no deferred document.</td>
                                    </tr>
                                    --%>
                                    <%
                                //}
                                %>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
            </table>
            <%
            }
        }
    }

    if (!hasCamCheckList) {
        %>
        <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no CAM checklist.</td>
            </tr>
        </table>
        <%
    }
%>

<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>Facility Checklist</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%--FACILITY--%>
<%
    boolean hasFacilityCheckList = false;
    for (int x = 0; x < facilityList.size(); x++) {//Main Borrower, Co-Borrower....
        if (!docListMap.containsKey(facilityList.get(x))) continue;

        List list = (List) docListMap.get(facilityList.get(x));

        System.out.println("Total Document facility : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
            if (!hasFacilityCheckList) hasFacilityCheckList = true;

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);
            System.out.println("Total Document facility : " + docHeld.getCheckListID());
            ILimit iLimit=(ILimit) facilityMap.get(String.valueOf(docHeld.getCheckListID()));
            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            System.out.println("Total Document facility : " + hasDeferredItem);
            if (hasDeferredItem) {
            %>
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
<!--                                <tr class="odd">-->
<!--                                    <td class="fieldname" width="20%">Customer Category</td>-->
<!--                                    <td width="30%">-->
                                        <%
                                        String custCat = (String)ccList.get(x);
                                        String showCustCat = null;
                                        if (custCat.equals(ICMSConstant.CHECKLIST_MAIN_BORROWER)) {
                                            showCustCat = "Main Borrower/Hirer";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_JOINT_BORROWER)) {
                                            showCustCat = "Joint Borrower";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_CO_BORROWER)) {
                                            showCustCat = "Co-Borrower";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_PLEDGER)) {
                                            showCustCat = "Pledgor/Guarantor";
                                        } else if (custCat.equals(ICMSConstant.CHECKLIST_NON_BORROWER)) {
                                            showCustCat = "Non-Borrower";
                                        }
                                        %>
<!--                                        <integro:empty-if-null value="<%=showCustCat%>"/>&nbsp;-->
<!--                                    </td>-->
<!--                                    <td class="fieldname" width="20%">Customer Name</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalName()%>"/>&nbsp;</td>-->
<!--                                </tr>-->
                                <tr class="even">
<!--                                    <td class="fieldname" width="20%">CIF No</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalID()%>"/>&nbsp;</td>-->
                                    <td class="fieldname" width="20%">Checklist ID</td>
                                    <td width="30%"><%=docHeld.getCheckListID()%>&nbsp;</td>
                                </tr>
                                 <tr class="odd">
                                    <td class="fieldname" width="20%">Facility ID</td>
                                    <td width="30%"><%=iLimit.getLimitID()%>&nbsp;</td>
                                </tr>
                                 <tr class="even">
                                    <td class="fieldname" width="20%">Facility Name</td>
                                    <td width="30%"><%=iLimit.getFacilityName()%>&nbsp;</td>
                                </tr>
                                
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Status</td>
                                    <td width="30%">
                                        <%        
                                        String checkListStatus = (PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus()) == null) ?
                                                docHeld.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus());
                                        %>
                                        <integro:empty-if-null value="<%=checkListStatus%>"/>&nbsp;
                                    </td>
                                    
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Type</td>
                                    <td width="30%">
                                        Facility&nbsp;
                                    </td>
                                    
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                            <thead>
                                <tr>
                                    <td><h3>Deferral Requested For</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr/>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%--Inject the deferred item here--%>
                                <%
                                //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                //if (hasDeferredItem) {
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Original Date Defer</td>
                                                        <td width="5%">Next Due Date
                                                        </td>
                                                        <td width="5%">Doc Status</td>
                                                         <td width="5%">Defer Counter</td>
                                                         <td width="5%">Total Defered Days</td>
<!--                                                        <td width="15%">Action Party</td>-->
  														<td width="8%">Credit Approver</td>
  														<td width="8%">Remarks</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);

                                                        OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                        if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                            log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

                                                        String rowClass = "";
                                                        _row++;
                                                        if (_row % 2 != 0) {
                                                            rowClass = "odd";
                                                        } else {
                                                            rowClass = "even";
                                                        }
                                                             
                                                        %>
                                                        <tr class="<%=rowClass%>">
                                                            <td class="index"><%=_row%></td>
                                                           
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferCount()%>"/>&nbsp;<input type="hidden" name="deferCount" value="<%=item.getDeferCount()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferedDays()%>"/>&nbsp;<input type="hidden" name="deferedDays" value="<%=item.getDeferedDays()%>"/></td>
                                                            <td>
																<% for(int i=0; i<deferCreditApproverList.size();i++){
            	 
												            	 LabelValueBean  creditApproval= (LabelValueBean) deferCreditApproverList.get(i);
												            	 if(creditApproval.getValue()!=null){
												            	 if(creditApproval.getValue().trim().equals(item.getCreditApprover())){
												            	%>	 
												            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
												            	<% 
												            	 }
												            	
												            	 }
												             }  %>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
												             
												              <td><integro:empty-if-null value="<%=item.getRemarks()%>"/>&nbsp;<input type="hidden" name="remarks" value="<%=item.getRemarks()%>"/></td>
                                                            <%
                                                            Calendar cal2 = null;
                                                            if (log.getLogDate()!= null) {
                                                                //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                                                                String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                                                                String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                                                                String year = null;
                                                                String month = null;
                                                                String day = null;
                                                                if (temp != null) {
                                                                    day = temp[0];
                                                                    month = temp[1];
                                                                    year = temp[2];

                                                                    cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                                                                }
                                                            }
                                                            %>
                                                        </tr>
                                                        <%
                                                    }
                                                    %>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                //} else {
                                    %>
                                    <%--
                                    <tr class="odd">
                                        <td>There is no deferred document.</td>
                                    </tr>
                                    --%>
                                    <%
                                //}
                                %>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
            </table>
            <%
            }
        }
    }

    if (!hasFacilityCheckList) {
        %>
        <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no Facility checklist.</td>
            </tr>
        </table>
        <%
    }
%>
<%--Security--%>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>Security Checklist</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%
    boolean hasSecurityCheckList = false;
    for (int x = 0; x < securityList.size(); x++) {
        if (!docListMap.containsKey(securityList.get(x))) continue;

        List list = (List) docListMap.get(securityList.get(x));

        System.out.println("Total Document : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
            if (!hasSecurityCheckList) hasSecurityCheckList = true;

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);
            ICollateral collateral = ((OBDocumentHeld)docHeld).getCollateral();

            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            if (hasDeferredItem) {

                //yea this is bad, revise this when gt time
                ICheckListProxyManager checkListProxyManager = CheckListProxyManagerFactory.getCheckListProxyManager();
                ICheckList checkList= checkListProxyManager.getCheckListByID(docHeld.getCheckListID());

            %>
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
                                <tr class="odd">
                                    <td width="20%" class="fieldname">Security Type</td>
                                    <td width="30%"><integro:empty-if-null value="<%=collateral.getCollateralSubType().getTypeName()%>"/>&nbsp;</td>
                                    <td width="20%" class="fieldname">Security Sub-Type</td>
                                    <td width="30%"><integro:empty-if-null value="<%=collateral.getCollateralSubType().getSubTypeName()%>"/>&nbsp;</td>
                                </tr>
                                <tr class="even">
                                    <td width="20%" class="fieldname">Source Security ID</td>
                                    <td width="30%"><integro:empty-if-null value="<%=String.valueOf(collateral.getCollateralID())%>"/>&nbsp;</td>
                                    <td width="20%" class="fieldname">Checklist ID</td>
                                    <td width="30%"><%=docHeld.getCheckListID()%></td>
                                </tr>
                                <tr class="odd">
                                    <td width="20%" class="fieldname">Checklist Status</td>
                                    <td width="30%">
                                        <%
                                        String colCheckListStatus = (PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus()) ==null) ?
                                                docHeld.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus());
                                        %>
                                        <integro:empty-if-null value="<%=colCheckListStatus%>"/>&nbsp;
                                    </td>
                                    <td width="20%" class="fieldname">&nbsp;</td>
                                    <td width="30%">&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
         <%--       <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                                <tr align="left">
                                    <td colspan="2" class="fieldname" style="text-align:left">View Security Details - <integro:empty-if-null value="<%=collateral.getCollateralSubType().getTypeName()%>"/></td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd">
                                    <td width="30%" class="fieldname">Collateral Details</td>
                                    <td><integro:empty-if-null value="<%=collateral.getSCIReferenceNote()%>"/>&nbsp;</td>
                                </tr>
                                <tr class="even">
                                    <td width="30%" class="fieldname">Remarks</td>
                                    <td><integro:empty-if-null value="<%=checkList.getRemarks()%>"/>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>     --%>
                <tr><td></td></tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                            <thead>
                                <tr>
                                    <td><h3>Deferral Requested For</h3></td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr/>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%--Inject the deferred item here--%>
                                <%
                                //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                //if (hasDeferredItem) {
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Original Date Defer</td>
                                                        <td width="5%">Next Due Date</td>
                                                        <td width="5%">Doc Status</td>
                                                         <td width="5%">Defer Counter</td>
                                                         <td width="5%">Total Defered Days</td>
<!--                                                        <td width="15%">Action Party</td>-->
														<td width="8%">Credit Approver</td>
														<td width="8%">Remarks</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);
                                                                                   
                                                        OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                        if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                            log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

                                                        String rowClass = "";
                                                        _row++;
                                                        if (_row % 2 != 0) {
                                                            rowClass = "odd";
                                                        } else {
                                                            rowClass = "even";
                                                        }
                                                           
                                                        %>
                                                        <tr class="<%=rowClass%>">
                                                            <td class="index"><%=_row%></td>
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferCount()%>"/>&nbsp;<input type="hidden" name="deferCount" value="<%=item.getDeferCount()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferedDays()%>"/>&nbsp;<input type="hidden" name="deferedDays" value="<%=item.getDeferedDays()%>"/></td>
                                                            <td>
															<% for(int i=0; i<deferCreditApproverList.size();i++){
            	 
												            	 LabelValueBean  creditApproval= (LabelValueBean) deferCreditApproverList.get(i);
												            	 if(creditApproval.getValue()!=null){
												            	 if(creditApproval.getValue().trim().equals(item.getCreditApprover())){
												            	%>	 
												            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
												            	<% 
												            	 }
												            	
												            	 }
												             }  %>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
												             
												             <td><integro:empty-if-null value="<%=item.getRemarks()%>"/>&nbsp;<input type="hidden" name="remarks" value="<%=item.getRemarks()%>"/></td>
                                                            <%
                                                            Calendar cal2 = null;
                                                            if (log.getLogDate()!= null) {
                                                                //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                                                                String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                                                                String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                                                                String year = null;
                                                                String month = null;
                                                                String day = null;
                                                                if (temp != null) {
                                                                    day = temp[0];
                                                                    month = temp[1];
                                                                    year = temp[2];

                                                                    cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                                                                }
                                                            }
                                                            %>
                                                        </tr>
                                                        <%
                                                    }
                                                    %>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <%
                                //} else {
                                    %>
                                    <%--
                                    <tr class="odd">
                                        <td>There is no deferred document.</td>
                                    </tr>
                                    --%>
                                    <%
                                //}
                                %>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr><td></td></tr>
                <tr><td></td></tr>
            </table>
            <%
            }
        }
    }

    if (!hasSecurityCheckList) {
        %>
        <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no Security checklist.</td>
            </tr>
        </table>
        <%
    }
%>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <%--
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname" >DDN Expiry Date&nbsp;<font color="#0000FF">* </font>
              </td>
              <td width="30%"  > <html:text property="ddnDate" size="12" maxlength="11" readonly="false"/>
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image11" onclick="return showCalendar('ddnDate', 'dd/mm/y'); " onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                	<%//warning%>
                	<span id="warning90"></span>
                    <span id="warning91"></span>
                    <span id="warning93"></span>
                	<html:errors property="ddnDate" />
              </td>
              <td  width="20%" class="fieldname" >DDN Extended Expiry Date</td>
              <td width="30%" > <html:text  property="ddnExtDate" size="12" maxlength="11" readonly="false"/>
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image11" onclick="return showCalendar('ddnExtDate', 'dd/mm/y'); " onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="ddnExtDate" />
             	<span id="warning92"></span>
             	<span id="warning94"></span>
                <span id="extDate"></span>
              </td>
            </tr>
            <tr class="odd">
              <td width="20%"  class="fieldname" >DDN valid for </td>
              <td width="30%"  >
              		<html:text property="ddnDays" size="5" readonly="false" value="<%=validFor%>"/> &nbsp;&nbsp;<a href="#" onclick="calculateDaysDiff()">Days</a><html:errors property="ddnDays"/>
              </td>
              <td width="20%" class="fieldname"  >Deferral Approval Date</td>
              <td width="30%"  >
              		<html:text  property="appDate" size="12" maxlength="11" readonly="false"/>
              		<img src="img/calendara.gif"  name="Image11" border="0" id="Image11" onclick="return showCalendar('appDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" /><html:errors property="ddnAppDate"/><html:errors property="appDate"/>
                     <span id="appDate"></span>
              </td>
            </tr>
          </tbody>
        </table>
        </td>
    </tr>
    <tr><td>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		  <tbody> 
		    <tr>
		      <td class="fieldname">
		      We certify that all pre-conditions (relating to Contractual & Constitutional and Security Documents) for the draw down of the following limits as detailed in the Business Credit Application dated ?
		      <bean:write name="GenerateDDNForm" property="bcaAppDate" />  (as read in conjunction with the deferral approved in respect thereof) have been complied with, physically checked and confirmed to be in order.
		      </td>
		    </tr> 
		  </tbody>
		</table>    
    </td></tr>
    --%>
    <%--
<%  if (cert.getCleanDDNItemList() != null)
    {
        int sno = 0;

%>  <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>The following are Un-Secured Limits:</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Limit Maturity Date</td>
              <td>DDN Limit&nbsp;<font color="#FFAAFF">* </font></td>
              <td>Issue DDN</td>
            </tr>
          </thead>
          <tbody>

<logic:present name="cert"  >
   <logic:iterate id="OB" name="cert"  property="cleanDDNItemList" type="com.integrosys.cms.app.ddn.bus.IDDNItem"  >
<%
    	String rowClass="";
    	row++;
        sno++;
        if(sno%2!=0){
       		rowClass="odd";
    	}else{
       		rowClass="even";
    	}
    	
    	//CMS 1995 By Hai Tao
        boolean isDeletedLimit = false;
        if (OB.getLimitStatus() != null) {
    	    isDeletedLimit = OB.getLimitStatus().equalsIgnoreCase(ICMSConstant.STATE_DELETED);
        }

   		if(isDeletedLimit){
    	anyDeletedLimit = true;
    	}
       
		String temp = "ddnLimit"+(row-1);
		String chktemp = "issueDDN"+(row-1);
		boolean partial = checkboxSelected[row-1];
    
    	String prodDesc= "-";
		if(OB.getProductDesc()!=null) {
			prodDesc = OB.getProductDesc();
			if(prodDesc !=null)
			{
				if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
				 prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
			}
		}

%>
        <tr class="<%=rowClass%>">
              
              <td class="index"><%=sno%></td>
              
              <td>&nbsp;<%=OB.getLimitRef()%>
              <%if(isDeletedLimit){%>
                  <br><font color="#FF0000" size="1"><br><strong>(Deleted)</strong></font>
                  <%}%>
              </td>
              
              <td>
              	<integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
              	<br>
              	<integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
              </td>
              
              <td>
              	&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%>
              	 - <%= OB.getLimitBookingLocation().getOrganisationCode()%>
              </td>
              
              <td>&nbsp;<%=prodDesc%></td>
              
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %>
              			<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              	<% 	} %>
              		<%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %> 
              			</a> 
				<% 	} %>
              </td>
              
              <td class="amount">
              	<input type="hidden" name="appLimit" value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>" />
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              	<%	if (OB.isInnerLimit())	{ %>
                    (<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />)
              	<%	} else { %>
                    <integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />
              	<%	}	%>
              </td>
              <td>
                <html:text property="maturityDate" readonly="false" size="12" maxlength="11" value="<%= maturityDate[i] %>"/>
                <%
                    String updatedDate = "maturityDate" + String.valueOf(i);
                    i++;
                %>
                <input type="hidden" name="<%=updatedDate%>"/>
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%= updatedDate %>', 'dd/mm/y', setUpdatedDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="<%= updatedDate %>"/>
              </td>

              <td class="amount">
              	<input type="hidden" name="appAmtCurrCode" value="<%=actAmtCurrCode[row-1]%>"/>
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
                <% if (OB.isInnerLimit()) { %>
                    (<input text-align="right" type="text" name="ddnLimit" value="<%=ddnAmtAry[row-1]%>" />)
                <% } else { %>
                    <input text-align="right" type="text" name="ddnLimit" value="<%=ddnAmtAry[row-1]%>" />
                <% } %>
                <html:errors property="<%=temp%>" />
              </td>
              
  <td style="text-align:center"><input name="issueDDN" type="checkbox" value="<%=OB.getDDNItemRef()%><%=OB.getLimitID()%>" <%if(partial) { %>checked  <% }%> />
              	<html:errors property="<%= chktemp %>" />
              </td>
            </tr>
</logic:iterate>
</logic:present>
<%if(row > 0) {%>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px"><a href="#" onClick="makeTotal()">Total</a></td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=cleanAppAmt%>" /></td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=cleanDDNAmt%>" /></td>
              <td class="total">&nbsp;</td>
            </tr>
<% }else {%>
            <tr class="odd">
                <td colspan="9">There is no limit</td>
            </tr>
<% } %>
          </tbody>
        </table>
        </td>
    </tr>
<%}%>
    <tr>
      <td>&nbsp;</td>
    </tr>
<%  if (cert.getNotCleanDDNItemList() != null)
    {
        int sno = 0;

%>  <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>The following are Secured Limits:</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Limit Maturity Date</td>
              <td>DDN Limit&nbsp;<font color="#00AAFF">* </font></td>
              <td>Security ID</td>
              <td>Security Type</td>
              <td>Issue DDN</td>
            </tr>
          </thead>
          <tbody>

<logic:present name="cert"  >
   <logic:iterate id="OB" name="cert"  property="notCleanDDNItemList" type="com.integrosys.cms.app.ddn.bus.IDDNItem"  >
<%
    String rowClass="";
    row++;
    sno++;
    if(sno%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    
    //CMS 1995 By Hai Tao
    boolean isDeletedLimit = false;
    if (OB.getLimitStatus() != null) {
        isDeletedLimit = OB.getLimitStatus().equalsIgnoreCase(ICMSConstant.STATE_DELETED);
    }

   		if(isDeletedLimit){
    	anyDeletedLimit = true;
    	}
    	
	String temp = "ddnLimit"+(row-1);
	String chktemp = "issueDDN"+(row-1);
	boolean partial = checkboxSelected[row-1];

    String prodDesc= "-";
	if(OB.getProductDesc()!=null) {
		prodDesc = OB.getProductDesc();
		if(prodDesc !=null){
			if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
				 prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
		}
	}

%>
        <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              
              <td>&nbsp;<%=OB.getLimitRef()%>
              <%if(isDeletedLimit){%>
                  <br><font color="#FF0000" size="1"><br><strong>(Deleted)</strong></font>
                  <%}%>
              </td>
              
              <td>
              	<integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
              	<br>
              	<integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />           
              </td>
              
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              
              <td>&nbsp;<%=prodDesc%></td>
              
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %>
              			<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              	<% 	} %>
              		<%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %> 
              			</a> 
				<% 	} %>
              </td>
              
              <td class="amount">
              	<input type="hidden" name="appLimit" value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>" />
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
              	<% if (OB.isInnerLimit()) { %>
                    (<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />)
              	<%	} else { 	%>
                    <integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />
              	<%	}			%>
              </td>

                <td>
                  <html:text property="maturityDate" readonly="true" size="12" maxlength="11" value="<%= maturityDate[i] %>"/>
                  <%
                      String updatedDate = "maturityDate" + String.valueOf(i);
                      i++;
                  %>
                  <input type="hidden" name="<%=updatedDate%>"/>
                  <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%= updatedDate %>', 'dd/mm/y', setUpdatedDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                  <html:errors property="<%= updatedDate %>"/>
                </td>

              <td class="amount">
              	<input type="hidden" name="appAmtCurrCode" value="<%=actAmtCurrCode[row-1]%>"/>
                <integro:currency param="currency" amount="<%=OB.getApprovedLimitAmount()%>" />
                <% if (OB.isInnerLimit()) { %>
                    (<input type="text" name="ddnLimit" value="<%= ddnAmtAry[row-1] == null ? "" : ddnAmtAry[row-1] %>" />)
                <% } else { %>
                    <input type="text" name="ddnLimit" value="<%=ddnAmtAry[row-1] == null ? "" : ddnAmtAry[row-1] %>" />
                <% } %>
                <html:errors property="<%=temp%>" />
              </td>
              
              <td>
              	<logic:iterate id="temp0" name="OB" property="DDNCollateralInfoList" >                
                	<%=((DDNCollateralInfo)temp0).getCollateralRef() %>
                	<br>
              	</logic:iterate>
              </td>
              
              <td>
              	<logic:iterate id="temp1" name="OB" property="DDNCollateralInfoList" >              
                	<bean:write name="temp1" property="collateralType.typeName" />
                	<br>
              	</logic:iterate>
              </td>              
              
              <td style="text-align:center">
              	<input name="issueDDN" type="checkbox" value="<%=OB.getDDNItemRef()%><%=OB.getLimitID()%>" <%if(partial) { %>checked  <% }%> />
              	<html:errors property="<%= chktemp %>" />
              </td>
              
            </tr>
	</logic:iterate>
</logic:present>
<%if(row > 0) {%>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px"><a href="#" onClick="makeTotal()">Total</a></td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=notCleanAppAmt%>" /></td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=notCleanDDNAmt%>" /></td>
              <td class="total">&nbsp;</td>              
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
            </tr>
<% }else {%>
            <tr class="odd">
                <td colspan="11">There is no limit</td>
            </tr>
<% } %>
          </tbody>
        </table>
        </td>
    </tr>
<%}%>
--%>
    <%--TODO : REFER HERE FOR DEFFER LIST
    <tr>
      <td><h3>Deferral Requested for</h3></td>
    </tr>
    <tr> 
      <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead> 
            <tr> 
              <td width="5%">S/N</td>
              <td width="12%">Doc Number</td>
              <td width="10%">Doc Code</td>
              <td width="21%">Doc Description</td>
              <td width="10%">Expiry of Deferment</td>
              <td width="10%">Extended Deferment Date</td>
              <!--td width="10%">DDN Valid For</td-->
              <td width="10%">Approval Date</td>
              <td width="12%">Approved By</td>
            </tr>
            </thead> 
            <tbody>
             <%
             int rowc=0;
             if (deferredList != null) {
	         
             for (int x = 0; x < deferredList.size(); x++) {
                OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
	            ICheckListItem item = (ICheckListItem) deferredList.get(x); 
	            if (deferredApprovalList != null && deferredApprovalList.size() > x)
	              log = (OBCMSTrxHistoryLog) deferredApprovalList.get(x);
                System.out.println("Log Date : " + log.getLogDate());
	            String rowClass="";
				rowc++;
				if(rowc%2!=0){
				  rowClass="odd";
				}else{
				  rowClass="even";
				}
             %>
              <tr class="<%=rowClass%>">
                  <td class="index"><%=rowc%></td>
	              <td ><%= item.getCheckListItemRef()%>&nbsp;</td>
	              <td ><%= item.getItemCode() %>&nbsp;</td>
	              <td ><%= item.getItemDesc() %>&nbsp;</td>
	              <td ><integro:date object="<%= item.getDeferExpiryDate() %>"/>&nbsp;</td>
	              <td ><integro:date object="<%= item.getDeferExtendedDate() %>"/>&nbsp;</td>
	              <!--td >
	              <%// if (bcaApprovedDate == null) { %>
	                 0&nbsp;
	              <%/* } else {
		               Date d1 = null;
	                   if (item.getDeferExtendedDate() != null) {
	                     d1 = item.getDeferExtendedDate();
                       } else {
 	                     d1 = item.getDeferExpiryDate();
                       }
 	                   Date d2 = cal.getTime();
 	                   if (d1.before(d2)) {		*/
		          %>
		             0         
	              <%//   } else { %>
		              <!--%= CommonUtil.dateDiff(d1, d2, Calendar.DATE)%-->
	              <%
/*                       }
                     } */
                  %>
                  </td-->
				  <%
                     Calendar cal2 = null;
                     if (log.getLogDate()!= null) {
                     	 //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                         String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                         System.out.println("Log Date 2 : " + logDate);
                         String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                         System.out.println("TEMP : " + temp);
                         String year = null;
                         String month = null;
                         String day = null;
                         System.out.println("Year : " + year + " Month : " + month + " Day : " + day);
                         if (temp != null) {
                             day = temp[0];
                             month = temp[1];
                             year = temp[2];

                             cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                         }                         
                     }   
                  %>
	                                                    
	              <td ><% if (cal2 != null) { %><integro:date object="<%=cal2.getTime()%>"/><% } else { %>&nbsp;<% } %></td>
	              <td ><integro:empty-if-null value="<%=log.getLogUserName()%>"/>&nbsp;
          (<integro:empty-if-null value="<%=log.getLogGroupName()%>"/>)</td>
              </tr>
             <% } } %>
             <% if (rowc==0) { %>
               <tr> 
                 <td colspan="9">There is no document.</td>
               </tr>             
             <% } %>
            </tbody>
           </table>
      </td>
    </tr>
    --%>
    <tr><td></td></tr>
<!--    <tr>-->
<!--        <td>-->
<!--            <table width="100%" align="center" class="tblInfo" border="0" cellSpacing="0" cellPadding="0">-->
<!--                <TBODY>-->
<!--                    <TR>-->
<!--                        <TD class="fieldname">Released To</TD>-->
<!--                        <TD class="odd"><SPAN class="even"><%--<INPUT size="50">--%><html:text property="releaseTo" maxlength="" size="50"/></SPAN></TD>-->
<!--                    </TR>-->
<!--                    <TR class="odd">-->
<!--                        <TD class="fieldname">Reason / Remarks</TD>-->
<!--                        <TD>&nbsp;</TD>-->
<!--                    </TR>-->
<!--                    <tr>-->
<!--                        <td colspan="2" width="100%" class="odd"><textarea onkeyup="checkTextSize()" name="remarks" rows=10 cols=100><%=remarks%></textarea>-->
<!--                        <span id="warningRemarks"></span></td>-->
<!--                    </tr>-->
<!--                </TBODY>-->
<!--            </table>-->
<!--            <%--<textarea style="width: 100%;" rows="5" name="remarksSCC"></textarea>--%>-->
<!--            <html:textarea property="remarksSCC" rows="5" cols="100"/>-->
<!--        </td>-->
<!--    </tr>-->
<!--    <tr>-->
<!--      <td><hr /></td>-->
<!--    </tr>-->
    <tr>
      <td>
<!--      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">-->
<!--          <thead>-->
<!--            <tr>-->
<!--              <td colspan="4" style="text-align:left">Authorised Personnel 1</td>-->
<!--            </tr>-->
<!--          </thead>-->
<!--          <tbody>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Name<%--&nbsp;<font color="#0000FF">* </font>--%></td>-->
<!--              <td>-->
<!--              	<html:text property="creditOfficerName" maxlength="50" size="30" />-->
<!--              	<html:errors property="creditOfficerName"/>-->
<!--              </td>-->
<!--              <td class="fieldname">Signing Number<%--&nbsp;<font color="#0000FF">* </font>--%></td>-->
<!--              <td>-->
<!--              	<html:text property="creditOfficerSgnNo" maxlength="20" size="30" />-->
<!--              	<html:errors property="creditOfficerSgnNo"/>-->
<!--              </td>-->
<!--            </tr>-->
            <%--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>              
                  <html:select property="creditOfficerLocationCountry"  onchange="refreshPage()">
                    <option value="" >Please Select </option>				
                    <html:options name="countryValues" labelName="countryLabels"/>
    			  </html:select>
			  </td>
			  <td class="fieldname">Location Org Code</td>
              <td>              
                  <html:select property="creditOfficerLocationOrgCode" >
                    <option value="" >Please Select </option>				
                    <html:options name="creditOrgCodeValues" labelName="creditOrgCodeLabels"/>
    			  </html:select>
			  </td>
            </tr>
            --%>
<!--          </tbody>-->
<!--        </table>-->
<!--        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">-->
<!--          <thead>-->
<!--            <tr>-->
<!--              <td colspan="4" style="text-align:left">Authorise Personnel 2</td>-->
<!--            </tr>-->
<!--          </thead>-->
<!--          <tbody>-->
<!--            <tr class="odd">-->
<!--              <td class="fieldname">Name</td>-->
<!--              <td><html:text property="seniorCreditOfficerName" maxlength="50" size="30" /></td>-->
<!--              <td class="fieldname">Signing Number</td>-->
<!--              <td><html:text property="seniorCreditOfficerSgnNo" maxlength="20" size="30" /></td>-->
<!--            </tr>-->
            <%--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>              
                  <html:select property="seniorCreditOfficerLocationCountry"  onchange="refreshPage()">
                    <option value="" >Please Select </option>				
                    <html:options name="countryValues" labelName="countryLabels"/>
    			  </html:select>
			  </td>
			  <td class="fieldname">Location Org Code</td>
              <td>              
                  <html:select property="seniorCreditOfficerLocationOrgCode" >
                    <option value="" >Please Select </option>				
                    <html:options name="seniorOrgCodeValues" labelName="seniorOrgCodeLabels"/>
    			  </html:select>
			  </td>
            </tr>
            --%>
<!--          </tbody>-->
<!--        </table>-->
        
        </td>
    </tr>
  </tbody>
</table>
</p>
</p>
</p>


<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
  </tr>
  <tr><%
  //if(!anyDeletedLimit){
   %>
<!--  <td><a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/submit2.gif',0)"><img src="img/submit1.gif" name="Image2" border="0" id="Image2" /></a></td>-->
  <%//}
  //else{
  %>
  <%--<td><a href="#" onclick="notsubmitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/submit2.gif',0)"><img src="img/submit1.gif" name="Image2" border="0" id="Image2" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;</td>--%>
  <%
  //}
  %>    
   <td><a href="#"                        onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/print2.gif',0)"><img src="img/print1.gif" name="Image1" border="0" id="Image1" onclick="MM_openBrWindow('GenerateDDN.do?event=print_doc','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=450,left=5,top=5')"/></a></td>

  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
<%
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>