<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.*,
				 java.util.*,
				 org.apache.commons.lang.StringUtils,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptForm" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%

List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.allCreditApproverList");
if(allCreditApproverList!=null){
	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
}

List currencyList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.currencyList");
if(currencyList!=null){
	pageContext.setAttribute("currencyList",currencyList);
}

FacilityReceiptForm aForm = (FacilityReceiptForm)request.getAttribute("FacilityReceiptForm");
request.setAttribute("FacilityReceiptForm",aForm);
System.out.println("**aForm ===== "+aForm+"      aForm.getcollateralid == "+aForm.getCollateralID()+" aForm.getItemStatus()"+aForm.getItemStatus());
List llist = (List)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.taguntagimage");

/* String skipImgTag = (String) session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.skipImgTag");

System.out.println("<<<<<<<<<<<<<<<<<<<<<<<<<skipImgTag>>>>>>>>>>>>>>>>>>>>>>>>>"+skipImgTag);
 */


String docCode =(String) aForm.getDocNo();
String dcode = (String) aForm.getDocCode();
String ddesc = (String) aForm.getDocDesc();
System.out.println("DCODE ==== "+dcode);
System.out.println("Description  ==== "+ddesc);

String event1 = (String)request.getAttribute("event");
System.out.println("Event == "+event1);

String ddcode1 = (String)request.getAttribute("dcodes");
String ddesc1 = (String)request.getAttribute("ddescs");
System.out.println("After tagging done  ddcode1 ==== "+ddcode1+"  and ddesc1 == "+ddesc1);

String fileNamed = (String)request.getAttribute("fileNamed");
String imageIdes = (String)request.getAttribute("imageIdes");
String taggUntagg = (String)request.getAttribute("taggUntagg");

System.out.println("Image Tagging Details are == fileNamed == "+fileNamed+" , imageIdes == "+imageIdes+" , taggUntagg == "+taggUntagg);
String index = (String)request.getAttribute("index");

System.out.println("Index == "+index);

System.out.println("List in string facility name == "+aForm.getFacImageTagUntagImgName());

/* String facListImages = aForm.getFacImageTagUntagImgName();
System.out.println("facility List Images = facListImages => "+facListImages);
String[] facListImages1 = facListImages.split(","); */

//System.out.println(facListImages1[0]);

ArrayList facImageListAdd = new ArrayList();
/*if((event1.equals("facilityreceipt_image_tag_untag_submit") || event1.equals("save_receive_prepare")) && !"".equals(facListImages) ){
 for(int i=0;i<facListImages1.length;i=i+3){
	System.out.println("facListImages1.length == "+facListImages1.length+"  facListImages1 == "+facListImages1);
	FacilityReceiptForm aForms = new FacilityReceiptForm();
	aForms.setFacImageTagUntagImgName(facListImages1[i]);
	System.out.println("Adding in list == "+facListImages1[i]);
	aForms.setFacImageTagUntagStatus(facListImages1[i+1]);
	System.out.println("Adding in list == "+facListImages1[i+1]);
	aForms.setFacImageTagUntagId(facListImages1[i+2]);
	System.out.println("Adding in list == "+facListImages1[i+2]);
	facImageListAdd.add(aForms);
} 

for(int j=0;j<facImageListAdd.size();j++){
	FacilityReceiptForm aForm12 =(FacilityReceiptForm) facImageListAdd.get(j);
	System.out.println("aForm12 information  == "+aForm12.getFacImageTagUntagId()+"  "+aForm12.getFacImageTagUntagImgName()+"   "+aForm12.getFacImageTagUntagStatus());
}
aForm.setFacImageTagUntagList(facImageListAdd);
}*/



/* if(event1.equalsIgnoreCase("facilityreceipt_image_tag_untag_submit")){
	taggUntagg = taggUntagg.trim();
	/* if(taggUntagg.equalsIgnoreCase("tagged")){
		taggUntagg = "N";
	}else{
		taggUntagg = "Y";
	} 
	dcode = ddcode1;
	ddesc = ddesc1;
	aForm.setDocCode(ddcode1);
	aForm.setDocDesc(ddesc1);
	aForm.setFacImageTagUntagId(imageIdes);
	aForm.setFacImageTagUntagImgName(fileNamed);
	aForm.setFacImageTagUntagStatus(taggUntagg);
} */

/* if(dcode != null && !dcode.equalsIgnoreCase("")){
	session.setAttribute("DCODE",aForm.getDocCode());
}else{
	String ss=(String)session.getAttribute("DCODE");
	System.out.println("DCODE from request==== "+ss);
} */
ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

String hdfcAmt="";

if(aForm.getHdfcAmt()!=null && !aForm.getHdfcAmt().trim().equals("")){
	hdfcAmt=aForm.getHdfcAmt();
}
String docAmt="";
if(aForm.getDocAmt()!=null && !aForm.getDocAmt().trim().equals("")){
	docAmt=aForm.getDocAmt();
}
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
String isImageTagged =(String)request.getAttribute("isImageTagged");
System.out.println("<<<<<<<<<<in facility Receipt isImageTagged>>>>>>>>>>"+request.getAttribute("isImageTagged"));

String isSkipImgTag =(String)session.getAttribute("com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptAction.isSkipImgTag");
System.out.println("<<<<<<<<<<isSkipImgTag>>>>>>>>>>"+isSkipImgTag); 
%>
<%


String docDate=aForm.getDocDate();
String expiryDate=aForm.getDocExpDate();
DateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy");
String nextDate="";
String deferDate="";
String otdDate="";
if(aForm.getExpectedReturnDate()!=null && !aForm.getExpectedReturnDate().equals("")){
	nextDate=aForm.getExpectedReturnDate();
}
if(aForm.getDeferDate()!=null && !aForm.getDeferDate().equals("")){
	deferDate=aForm.getDeferDate();	
}
if(aForm.getOriginalTargetDate()!=null && !aForm.getOriginalTargetDate().equals("")){
	otdDate=aForm.getOriginalTargetDate();
}

String defaultDate="";
defaultDate=df1.format(new Date());

Boolean isImageTagPending = (Boolean) session.getAttribute(FacilityReceiptAction.class.getName()+"."+ ITagUntagImageConstant.IS_IMAGE_TAG_PENDING);
if(isImageTagPending == null){
	isImageTagPending = Boolean.FALSE;
}
%>

<%@page import="com.integrosys.cms.ui.checklist.facilityreceipt.FacilityReceiptForm"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
    <script language="JavaScript" src="js/validation.js"></script>

    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">
        <!--
        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p,i,x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }

        function saveFormOnSkipDisable() {
        	var isImageTagPending = <%=isImageTagPending%>;
        	if(isImageTagPending){
        		alert("Image tagging is not done for this facility");
        		return;
        	}
        	else { 
        		 if (document.forms["FacilityReceiptForm"].isPolicy.value == "true"){
                     if (document.forms["FacilityReceiptForm"].docEffDate.value != document.forms["FacilityReceiptForm"].docOldEffDate.value) {
                         document.forms["FacilityReceiptForm"].isEffDateChanged.value = "true";

                     }
                 }
        		 document.forms["FacilityReceiptForm"].event.value = "save_receive";
                 document.forms["FacilityReceiptForm"].submit();
        	}
        }
        
        function saveFormOnSkipEnable() {
        	
        	if (document.forms["FacilityReceiptForm"].isPolicy.value == "true"){
                     if (document.forms["FacilityReceiptForm"].docEffDate.value != document.forms["FacilityReceiptForm"].docOldEffDate.value) {
                         document.forms["FacilityReceiptForm"].isEffDateChanged.value = "true";

                     }
                 }
                 document.forms["FacilityReceiptForm"].event.value = "save_receive";
                 document.forms["FacilityReceiptForm"].submit();
        	
        }

        function cancelForm() {
            document.forms["FacilityReceiptForm"].event.value = "view_ok";
            document.forms["FacilityReceiptForm"].submit();
        }

        function verifyDocEffDateChanged() {
            if (document.forms["FacilityReceiptForm"].isPolicy.value == "true") {
                if (document.forms["FacilityReceiptForm"].docEffDate.value != document.forms["FacilityReceiptForm"].docOldEffDate.value) {
                    document.forms["FacilityReceiptForm"].isEffDateChanged.value = "true";
                }
            }
        }
        
        function callSubmit() {
        	<%-- var faclist = <%=facImageListAdd%>
        	  formObj.facImageTagUntagList = faclist;--%>
        	formObj = document.forms["FacilityReceiptForm"]; 
        	selObj = 'RECEIVE';
        	ind = <%=index%>;
        	shared = 'false';
        	docNo = '<%=docCode%>';
        	    temp = selObj;
        	   // alert("Hi "+temp);
        	              
        	    var found = false;
        	        formObj.event.value = 'imagetaguntaglist';
        	        //alert(selObj.options[selObj.selectedIndex].value);
        			formObj.index.value = ind;
        	        formObj.actionTypeName.value = selObj;
        	      
        			formObj.submit();
        	    }
        
        
        
        //-->
    </script>
    <script language="JavaScript" type="text/JavaScript">
function setDifferenceBetDate() {
    
	
    
	   var user_date ="<%=deferDate%>";
	
		//alert("user_date :"+user_date);
	
	var today_date ="<%=otdDate%>";
	//alert("today_date :"+today_date);
	
	 if((isNaN(user_date))&&(isNaN(today_date)))
  {
	 
	  var udate_month = user_date.substring(3,6);
	  var tdate_month = today_date.substring(3,6);
	 switch(udate_month)
	 {
	 case 'Jan':
		 udate_month='00';
         break;
	 case 'Feb':
		 udate_month='01';
		 break;
	 case 'Mar':
		 udate_month='02';
		 break;
	 case 'Apr':
		 udate_month='03';
		 break;
	 case 'May':
		 udate_month='04';
		 break;
	 case 'Jun':
		 udate_month='05';
		 break;
	 case 'Jul':
		 udate_month='06';
		 break;
	 case 'Aug':
		 udate_month='07';
		 break;
	 case 'Sep':
		 udate_month='08';
		 break;
	 case 'Oct':
		 udate_month='09';
		 break;
	 case 'Nov':
		 udate_month='10';
		 break;
	 case 'Dec':
		 udate_month='11';
		 break;
		
		
		 }
	
	  var toDate = new Date(user_date.substring(7,11),
			  udate_month,
			  user_date.substring(0,2));
	  //alert("fromDate"+toDate);

	  switch(tdate_month)
		 {
		 case 'Jan':
			 tdate_month='00';
             break;
		 case 'Feb':
			 tdate_month='01';
			 break;
		 case 'Mar':
			 tdate_month='02';
			 break;
		 case 'Apr':
			 tdate_month='03';
			 break;
		 case 'May':
			 tdate_month='04';
			 break;
		 case 'Jun':
			 tdate_month='05';
			 break;
		 case 'Jul':
			 tdate_month='06';
			 break;
		 case 'Aug':
			 tdate_month='07';
			 break;
		 case 'Sep':
			 tdate_month='08';
			 break;
		 case 'Oct':
			 tdate_month='09';
			 break;
		 case 'Nov':
			 tdate_month='10';
			 break;
		 case 'Dec':
			 tdate_month='11';
			 break;
			
			
			 }
	  var fromDate   = new Date(today_date.substring(7,11),
			  tdate_month,
			  today_date.substring(0,2));
	  
	//  alert("toDate"+fromDate);
	  if(fromDate <= toDate)
	  {
	//var ts =  timeSpan(fromDate, toDate,  "years,months,days");
	//document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
		  var difference_ms = Math.abs(toDate - fromDate);
		   

		  document.getElementById('valTotalDeferedDays').innerHTML = (Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
          

			  }
	  else if(toDate<fromDate){
		  var difference_ms = Math.abs(toDate - fromDate);
		   

		  document.getElementById('valTotalDeferedDays').innerHTML ="-"+(Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
	  }
	  else{
		  document.getElementById('valTotalDeferedDays').innerHTML = "-";
		  }
 


  }
  else
  {
  document.getElementById('valTotalDeferedDays').innerHTML = "-";
  }
	
}


function originalDeferedDaysCal() {
    
    
    
	   var user_date ="<%=nextDate%>";
	
	//alert("user_date :"+user_date);
	
	var today_date ="<%=otdDate%>";
	//alert("today_date :"+today_date);
	
	 if((isNaN(user_date))&&(isNaN(today_date)))
	  {
		 
		  var udate_month = user_date.substring(3,6);
		  var tdate_month = today_date.substring(3,6);
		 switch(udate_month)
		 {
		 case 'Jan':
			 udate_month='00';
          break;
		 case 'Feb':
			 udate_month='01';
			 break;
		 case 'Mar':
			 udate_month='02';
			 break;
		 case 'Apr':
			 udate_month='03';
			 break;
		 case 'May':
			 udate_month='04';
			 break;
		 case 'Jun':
			 udate_month='05';
			 break;
		 case 'Jul':
			 udate_month='06';
			 break;
		 case 'Aug':
			 udate_month='07';
			 break;
		 case 'Sep':
			 udate_month='08';
			 break;
		 case 'Oct':
			 udate_month='09';
			 break;
		 case 'Nov':
			 udate_month='10';
			 break;
		 case 'Dec':
			 udate_month='11';
			 break;
			
			
			 }
		
		  var toDate = new Date(user_date.substring(7,11),
				  udate_month,
				  user_date.substring(0,2));
		  //alert("fromDate"+toDate);

		  switch(tdate_month)
			 {
			 case 'Jan':
				 tdate_month='00';
	             break;
			 case 'Feb':
				 tdate_month='01';
				 break;
			 case 'Mar':
				 tdate_month='02';
				 break;
			 case 'Apr':
				 tdate_month='03';
				 break;
			 case 'May':
				 tdate_month='04';
				 break;
			 case 'Jun':
				 tdate_month='05';
				 break;
			 case 'Jul':
				 tdate_month='06';
				 break;
			 case 'Aug':
				 tdate_month='07';
				 break;
			 case 'Sep':
				 tdate_month='08';
				 break;
			 case 'Oct':
				 tdate_month='09';
				 break;
			 case 'Nov':
				 tdate_month='10';
				 break;
			 case 'Dec':
				 tdate_month='11';
				 break;
				
				
				 }
		  var fromDate   = new Date(today_date.substring(7,11),
				  tdate_month,
				  today_date.substring(0,2));
		  
		//  alert("toDate"+fromDate);
		  if(fromDate <= toDate)
		  {
		//var ts =  timeSpan(fromDate, toDate,  "years,months,days");
		//document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
			  var difference_ms = Math.abs(toDate - fromDate);
			   

			  document.getElementById('valOriginalDeferedDays').innerHTML = (Math.round(difference_ms/(1000 * 60 * 60 * 24))) + " days";
           

				  }
		  else{
			  
			  document.getElementById('valOriginalDeferedDays').innerHTML = "-";
			  }
	 
	
	
	  }
	  else
	  {
		  
	  document.getElementById('valOriginalDeferedDays').innerHTML = "-";
	  }
	
}

function tagUntagImage(){
	document.forms["FacilityReceiptForm"].event.value = "<%=FacilityReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE%>";
    document.forms["FacilityReceiptForm"].submit();
}



</script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/calendarb.gif','img/cancel2.gif')">

<html:form action="FacilityReceipt">

    <!--Hidden variables-->
    <html:hidden property="event"/>

    <html:hidden property="limitProfileID"/>
    <html:hidden property="legalID"/>
    <html:hidden property="custCategory"/>
    <html:hidden property="limitBkgLoc"/>
    <html:hidden property="actionTypeName" />
    <html:hidden property="index"/>
    <html:hidden property="secType"/>
    <%if("RECEIVED".equals(aForm.getItemStatus())){ %>
    <html:hidden property="documentStatus"  value="UPDATE_RECEIVED"/>
    <%}else{ %>
    <html:hidden property="documentStatus"  value="PENDING_RECEIVED"/>
    <%} %>
    <html:hidden property="secSubType"/>
    <html:hidden property="secName"/>
    <html:hidden property="collateralID"/>
    <html:hidden property="collateralRef" />
    <html:hidden property="docCode"/>
    <html:hidden property="docNo"/>
    <html:hidden property="docDesc"/>
    <html:hidden property="deferCount"/>
    <!-- <html:hidden property="identifyDate"/> -->
    <html:hidden property="docOldEffDate"/>
    <html:hidden property="isEffDateChanged"/>
    <%if(aForm.getItemStatus().equalsIgnoreCase("DEFERRED") ){ %>
 <html:hidden property="originalTargetDate"/>
 <html:hidden property="docDate"/>
    <html:hidden property="originalTargetDate"/>
    <html:hidden property="docExpDate"/>
    <html:hidden property="creditApprover" />
  
<%} %>
  
    
<html:hidden property="expectedReturnDate" />
<html:hidden property="deferDate" />
<html:hidden property="itemStatus"/>
<html:hidden property="facImageTagUntagId"/>
<html:hidden property="facImageTagUntagImgName"/>
<html:hidden property="facImageTagUntagStatus"/>


<%
    String monitorType = (String) request.getAttribute("monitorType");
    String lableDocDate = "Doc Expiry Date";
    String isPolicy = request.getParameter("isPolicy");
    if (isPolicy == null || isPolicy.trim().length() == 0) {
        isPolicy = (monitorType != null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
    }
    if ((isPolicy != null && isPolicy.equals("false")) || (monitorType != null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))) {
        isPolicy = "false";
        lableDocDate = "Due Date to Receive Premium Receipt";
    }
    
	
	ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.FacilityReceiptAction.checkList");
	
	//UIUtil.mapOBAmount_FormString(locale, UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),totalFundedLimit));
	//System.out.println(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"+ UIUtil.mapOBAmount_FormString(locale, UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),totalFundedLimit)));
	ICheckListItem[] checkListItems = null;
	String reNewDocOldExpDate = null;
	if(checkList!=null){
		checkListItems = checkList.getCheckListItemList();
	}
	if(checkListItems!=null&&StringUtils.isNotBlank(aForm.getParentCheckListItemRef())){
		for(int i=0;i<checkListItems.length;i++){
			if(Long.valueOf(aForm.getParentCheckListItemRef()).longValue()==checkListItems[i].getCheckListItemRef()){
				reNewDocOldExpDate = DateUtil.formatDate(locale, checkListItems[i].getExpiryDate());
				break;
			}
		}
	}
	
	ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	//System.out.println("CUSTOMER ID ===== "+customer);
	if(customer != null){
		//System.out.println("ID Of Customer is ==--=-=-=-= "+ customer.getCustomerName());
	}else{
		//System.out.println("Customer Id Is not Getting as it is null *******************");
	}
	
%>
<html:hidden property="isPolicy" value="<%=isPolicy%>"/>
<html:hidden property="reNewDocOldExpDate" value="<%=reNewDocOldExpDate %>" />
<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3>Update Facility Doc Receipt </h3></td>
        </tr>
        <tr>
            <td><h3> Doc Description - Receive</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname">Code</td>
                        <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docCode"/></td>
                    </tr>
<!--                    <tr class="even">-->
<!--                        <td class="fieldname">Doc No</td>-->
<!--                        <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docNo"/></td>-->
<!--                    </tr>-->
                    <tr class="odd">
                        <td class="fieldname">Description</td>
                        <td>&nbsp;<bean:write name="FacilityReceiptForm" property="docDesc"/></td>
                    </tr>
                     <tr class="even">
              <td class="fieldname">Doc Amount</td>
              <td><html:text property="docAmt" size="31" maxlength="21" styleId="docAmt" onblur="javascript:formatAmountAsCommaSeparated(this)" />
               
                <html:errors property="docAmt" />
              </td>
            </tr>
            
            <tr class="even">
              <td class="fieldname">HDFC Amount</td>
              <td><html:text property="hdfcAmt" size="31" maxlength="21"  styleId="hdfcAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                <html:errors property="hdfcAmt" />
              </td>
            </tr>
            
            <tr class="even">
              <td class="fieldname">Currency</td>
               <td>
              <html:select property="currency">
              <option value="">Please Select </option>	
                       <%
              
              String selected="INR";
              
              
              if(aForm.getCurrency()!=null && !aForm.getCurrency().trim().equals("")){
            	  selected=aForm.getCurrency();
              }
              for(int i =0;i<currencyList.size();i++){ 
              
              LabelValueBean labelValueBean=(LabelValueBean)currencyList.get(i);
              
              %>
              
              <%if(labelValueBean.getValue().trim().equalsIgnoreCase(selected.trim())){ 
            	 // System.out.println("=======================:"+labelValueBean.getLabel());
              %>
               <option value="<%=labelValueBean.getValue()%>" selected="selected"><%=labelValueBean.getLabel()%></option>	
              
              <%}else{ %>
              <option value="<%=labelValueBean.getValue()%>"><%=labelValueBean.getLabel()%></option>	
              
              <%}} %>
<!--                      <html:options collection="currencyList" property="value" labelProperty="label" filter="" />-->
              </html:select>
              </td>
            </tr>
<%--
                    <tr class="even">
                        <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
                        <td><html:text property="docRef" size="30"/><html:errors property="docRef"/></td>
                    </tr>
--%>

<!--                    <tr class="even">-->
<!--                        <td class="fieldname">Document Type</td>-->
<!--                        <td><html:select property="monitorType">-->
<!--                                <integro:common-code categoryCode="MONITOR_TYPE"/>                            -->
<!--                            </html:select>-->
<!--                        </td>-->
<!--                    </tr>-->
<!---->
<!--                    <tr class="odd">-->
<!--                        <td class="fieldname">Form No</td>-->
<!--                        <td><html:text property="formNo" size="30" maxlength="50"/><html:errors property="formNo"/></td>-->
<!--                    </tr>-->
                    <tr class="even">
                        <td class="fieldname">Doc Received Date&nbsp;<font color="RED">*</font></td>
                        <td><html:text property="receivedDate" size="12" maxlength="12" readonly="true" value="<%=defaultDate %>" />
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('receivedDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                                 <html:errors property="receivedDate"/>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Doc Date<font color="RED"> *</font></td>
                        <td><html:text property="docDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docDate"/>
                        </td>
                    </tr>
                   <tr class="even">
              <td class="fieldname">Original Target Date &nbsp;</td>
               <%if(aForm.getItemStatus().equalsIgnoreCase("DEFERRED") ){ %>
               <%if(aForm.getOriginalTargetDate()!=null && !aForm.getOriginalTargetDate().trim().equals("")){ %>
               <td>&nbsp;<%=aForm.getOriginalTargetDate() %></td>
               <%}else{ %>
               <td>&nbsp;-</td>
               <%} }else{%>
              <td><html:text property="originalTargetDate" size="12" maxlength="12" readonly="true" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('originalTargetDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
                <html:errors property="originalTargetDate" />
              </td>
              <%} %>
              </tr>
 <%--
                    <%  if (isPolicy != null && isPolicy.equals("true")) {   %>
                    <tr class="even">
                        <td class="fieldname">Document Effective Date<font color="#0000FF">* </font></td>
                        <td><html:text property="docEffDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docEffDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docEffDate"/>
                        </td>
                    </tr>
                    <%  }  %>
--%>
                      <tr class="even">
                        <td class="fieldname"><%=lableDocDate%></td>
                        <td><html:text property="docExpDate" size="12" maxlength="12" readonly="true" value="<%=expiryDate %>"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docExpDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docExpDate"/>
                        </td>
                    </tr>
                     <%if(aForm.getItemStatus().equalsIgnoreCase("DEFERRED")||(aForm.getDeferDate()!=null && !aForm.getDeferDate().equals("") ) ){ %>
               <tr>
               <td class="fieldname">Date Deferred&nbsp; </td>
               <%if(aForm.getDeferDate()!=null && !aForm.getDeferDate().trim().equals("")){ %>
              <td>&nbsp;<%=aForm.getDeferDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
               </tr>
               <tr>
               <td class="fieldname">Next Due Date </td>
               <%if(aForm.getExpectedReturnDate()!=null && !aForm.getExpectedReturnDate().trim().equals("")){ %>
              <td>&nbsp;<%=aForm.getExpectedReturnDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
               </tr>
               <tr class="even">
              <td class="fieldname">Defer Counter</td>
              <td><bean:write name="FacilityReceiptForm" property="deferCount"/>&nbsp; 
               
              </td>
            </tr>
              <tr class="even">
              <td class="fieldname">Aging of Deferred date from Original Target date</td>
              <td class="even" >
											&nbsp;
										<p><b id='valTotalDeferedDays'></b> </p>
               <script type="text/javascript">
               setDifferenceBetDate();
               </script>
								            
								            </td>
            </tr>
              <tr class="even">
              <td class="fieldname">Aging of Next Due date from Original Target date</td>
              <td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
            </tr>
           <%} %>
             
<%--
                    <tr class="even">
                        <td class="fieldname">Identify Date</td>
                        <td><html:text property="identifyDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1"
                                 onclick="return showCalendar('identifyDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="identifyDate"/>
                        </td>
                    </tr>
--%>
<!--                    <tr class="odd">-->
<!--                        <td class="fieldname">Action Party </td>-->
<!--                        <td><html:select property="actionParty">-->
<!--                            <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                            </html:select>-->
<!--                        </td>-->
<!--                    </tr>-->


					<tr class="odd">
                        <td class="fieldname">Image TAG/UNTAG<font color="RED"> *</font></td>
                        <td>
                         <input type="button" value="Image Tag/Untag" onclick="tagUntagImage()" title="<bean:message key="label.img.tag.untag"/>"/>
                        </td>
                        </tr>
                        <%-- <td>
                         <!-- <a href="FacilityReceipt.do?event=imagetaguntaglist&dcodes=<%=dcode%>&ddescs=<%=ddesc%>&index=<%=index%>" title="Image TAG/UNTAG">Image Tag/Untag</a> -->
                        <input type="button" value="Image Tag/Untag" onclick="callSubmit()" title="Image TAG/UNTAG"/>
                      <!--   Image Tag/Untag--> 
                        <%
                        	/* if((event1.equalsIgnoreCase("facilityreceipt_image_tag_untag_submit") || event1.equalsIgnoreCase("save_receive_prepare")) && !"".equals(aForm.getFacImageTagUntagId()) 
                                    && !"".equals(aForm.getFacImageTagUntagImgName()) && !"".equals(aForm.getFacImageTagUntagStatus())){ */
                        		if((event1.equalsIgnoreCase("facilityreceipt_image_tag_untag_submit") || event1.equalsIgnoreCase("save_receive_prepare"))
                                    && !"".equals(aForm.getFacImageTagUntagImgName())){
                        %>
                        <tr class="odd">
						 <td class="fieldname">Image id</td>
						 <td>
						 <html:text property="facImageTagUntagId"  readonly="true" value="<%=imageIdes%>"/>
						 </td>
						 </tr>
						 <tr class="odd">
						 
						 <td class="fieldname">Image Name</td>
						 <td>
						 <html:text property="facImageTagUntagImgName"  readonly="true" value="<%=fileNamed%>"/>
						 </td>
						 </tr>
						 <tr class="odd">
						 <td class="fieldname">Image Status</td>
						 <td>
						 <html:text property="facImageTagUntagStatus"  readonly="true" value="<%=taggUntagg%>"/>
						 </td>   
						                   
                        </tr>
                        <td>
						 <html:hidden property="facImageTagUntagImgName" value="<%=fileNamed%>" readOnly="readOnly"/>
						 </td>
                        
                        <%} %>
                         <html:errors property="imagetaguntag"/>
                        </td> --%>
                    


                    <tr class="even">
                        <td class="fieldname">Credit Approver</td>
                        <td><html:select property="creditApprover"  >
											<option value="">Please Select</option>
											<html:options collection="allCreditApproverList" labelProperty="label" property="value" />
											</html:select>
                        </td>
                    </tr>
<%--
                    <tr class="even">
                        <td class="fieldname">Shared</td>
                        <td>
                            <html:radio property="shared" value="true"/>Yes
                            <html:radio property="shared" value="false"/>No
                            <html:errors property="shared"/>
                        </td>
                    </tr>
--%>
                </tbody>
            </table>
            <html:hidden property="actionParty" />
<%--
                <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp"/>
--%>
                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="odd">
                            <td class="fieldname">Remarks</td>
                            <td><html:textarea name="FacilityReceiptForm" rows="5" cols="80" property="docRemarks"
                                               onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks"/></td>
                        </tr>
                    </tbody>
                </table>
                 <table width="100%">
                <tr>
				<td>
				<br></br>
 <jsp:include page="view_audit_details_individual.jsp"></jsp:include>
				</td>
				<html:hidden property="documentStatus"  value="PENDING_RECEIVED"/>
				<html:hidden property="itemStatus" />
			</tr>
			</table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                          <% if(null !=isSkipImgTag &&   "ENABLE".equalsIgnoreCase(isSkipImgTag)){ %>
                            <a href="#" onmouseout="MM_swapImgRestore()" onclick="saveFormOnSkipEnable()"
                               onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                            <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                            <%}else{ %>
                             <a href="#" onmouseout="MM_swapImgRestore()" onclick="saveFormOnSkipDisable()"
                               onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                            <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                            <%} %>
                            
                                 
                            <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image4" border="0" id="Image4"/></a></td>
                    </tr>
                </table>
                    <%-- End here for cr-17 --%>
            </td>
        </tr>
    </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
