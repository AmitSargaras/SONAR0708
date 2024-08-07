<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.reassignment.ReassignmentConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.checklist.CheckListAction,
                 com.integrosys.cms.app.common.util.*,
                 java.util.*,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant
                 " %>
                 <%@page import="com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptAction"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	CAMReceiptForm form = (CAMReceiptForm)request.getAttribute("CAMReceiptForm");
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    ICheckListItem stageOb = (ICheckListItem) request.getAttribute("stagingOb");
    ICheckListItem ob = (ICheckListItem) request.getAttribute("actualOb");
    ICheckListTrxValue checkListTrxVal = (ICheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptAction.checkListTrxVal");
    String previous = request.getParameter("previous");
    boolean state=false;
    if(form.getItemStatus().equals("DEFERRED")||form.getItemStatus().equals("PENDING_DEFER")){
    	state=true;
    }
    // cr 131
    String lableDocDate = "Doc Expiry Date";
    String monitorType = stageOb.getItem().getMonitorType();
    String isPolicy = (monitorType != null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
    String isReceipt = (monitorType != null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT)) ? "true" : "";
    if (isReceipt.equals("true")) {
        lableDocDate = "Due Date to Receive Premium Receipt";
    }
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptAction.allCreditApproverList");
    if(allCreditApproverList!=null){
    	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
    }
    // cr 36
    /*Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();
    GregorianCalendar cal = new GregorianCalendar();
    cal.setTime(bcaApprovedDate);*/
    String titleStatusDisplay = "Receive";
    ICheckListItem item = (ICheckListItem) session.getAttribute("com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptAction.checkListItem");
    if((form.getItemStatus().equals("AWAITING")) && form.getDocumentStatus().equals("ACTIVE")) {
        titleStatusDisplay = "Pending";
    }
    if((form.getItemStatus().equals("PENDING_DEFER")||form.getItemStatus().equals("DEFERRED")) && form.getDocumentStatus().equals("ACTIVE")) {
        titleStatusDisplay = "Defer";
    }
    if((form.getItemStatus().equals("PENDING_UPDATE")) && form.getDocumentStatus().equals("ACTIVE")) {
        titleStatusDisplay = "Update";
    }
    if((form.getItemStatus().equals("PENDING_VERSION")) && form.getDocumentStatus().equals("ACTIVE")) {
        titleStatusDisplay = "Version";
    }
    if((form.getItemStatus().equals("PENDING_WAIVER")||form.getItemStatus().equals("WAIVED")) && form.getDocumentStatus().equals("ACTIVE") ) {
        titleStatusDisplay = "Waive";
    }
if( form.getDocumentStatus().equals("PENDING_INACTIVE")||form.getDocumentStatus().equals("INACTIVE")){
	titleStatusDisplay = "Inactive";
}

String itemRef =(String)request.getAttribute("itemRef");
//long itemRef = Long.parseLong((String) map.get("itemRef"));
System.out.println("itemRef=>"+itemRef);
pageContext.setAttribute("itemRef",itemRef);

    int bb = 0;
    String taggedFileNames = (String) request.getAttribute(ITagUntagImageConstant.TAGGED_FILE_NAMES);
	String unTaggedFileNames = (String) request.getAttribute(ITagUntagImageConstant.UN_TAGGED_FILE_NAMES);
%>
<%
DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String nextDate="";
String deferDate="";
String otdDate="";
if(!state || form.getDeferCount().equals("1")){
	if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().equals("")){
		nextDate=form.getExpectedReturnDate();
	}
	}
	else{
		if(form.getDeferExtendedDate()!=null && !form.getDeferExtendedDate().equals("")){
			nextDate=form.getDeferExtendedDate();
		}
	}
if(form.getDeferDate()!=null && !form.getDeferDate().equals("")){
	deferDate=form.getDeferDate();	
}
if(form.getOriginalTargetDate()!=null && !form.getOriginalTargetDate().equals("")){
	otdDate=form.getOriginalTargetDate();
}

%>


<%@page import="com.integrosys.cms.ui.checklist.camreceipt.CAMReceiptForm"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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

        function submitPage(trxID) {
            document.forms[0].event.value = "chk_view_return";
            document.forms[0].submit()
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
	
	var today_date = "<%=otdDate%>";
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
	document.forms["CAMReceiptForm"].event.value = "<%=CAMReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_VIEW%>";
    document.forms["CAMReceiptForm"].submit();
}



</script>
    
    <!-- InstanceEndEditable --></head>

<body onload="MM_preloadImages('img/cancel2.gif','img/return2.gif')">
<html:form action="CAMReceipt.do">

    <input type="hidden" name="previous" value="<%=previous%>"/>
    <input type="hidden" name="event"/>

    <html:hidden property="limitProfileID"/>
    <html:hidden property="legalID"/>
    <html:hidden property="custCategory"/>
    <html:hidden property="limitBkgLoc"/>
    <html:hidden property="secType"/>
    <html:hidden property="secSubType"/>
    <html:hidden property="secName"/>
    <html:hidden property="collateralID"/>

<!--<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>-->
<!-- InstanceBeginEditable name="Content" -->
<table width="620" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Update CAM Doc Receipt </h3></td>
    </tr>
    <tr>
        <td><h3> View Doc Description - <%=titleStatusDisplay%></h3></td>
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
    <%String aa = "odd"; %>
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"itemCode")? "fieldname":"fieldnamediff"%>">Code</td>
            <td>&nbsp;<bean:write name="CAMReceiptForm" property="docCode"/></td>
            <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
    <%--    <tr class=<%=aa%> >
            <td class="fieldname">Doc No</td>
            <td>&nbsp;<bean:write name="CAMReceiptForm" property="docNo"/></td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        
         --%>
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"itemDesc")? "fieldname":"fieldnamediff"%>">Description</td>
            <td>&nbsp;<bean:write name="CAMReceiptForm" property="docDesc"/></td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"docAmt")? "fieldname":"fieldnamediff"%>">Doc Amount</td>
              <%if(form.getDocAmt()!=null && !form.getDocAmt().equals("")){ %>
              <td>&nbsp;<integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(form.getDocAmt()))%>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"hdfcAmt")? "fieldname":"fieldnamediff"%>">HDFC Amount</td>
              <%if(form.getHdfcAmt()!=null && !form.getHdfcAmt().equals("")){ %>
              <td>&nbsp;<integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(form.getHdfcAmt()))%>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"currency")? "fieldname":"fieldnamediff"%>">Currency</td>
               <%if(form.getCurrency()!=null && !form.getCurrency().equals("")){ %>
              <td>&nbsp;<%=form.getCurrency() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>

    
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"docDate")? "fieldname":"fieldnamediff"%>">Doc Date</td>
            <%if(form.getDocDate()!=null && !form.getDocDate().equals("")){ %>
              <td>&nbsp;<%=form.getDocDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
		
		<tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"originalTargetDate")? "fieldname":"fieldnamediff"%>">Original Target Date</td>
              <%if(form.getOriginalTargetDate()!=null && !form.getOriginalTargetDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getOriginalTargetDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
		
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expiryDate")? "fieldname":"fieldnamediff"%>"><%=lableDocDate%></td>
           <%if(form.getDocExpDate()!=null && !form.getDocExpDate().equals("")){ %>
              <td>&nbsp;<%=form.getDocExpDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
         <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"waivedDate")? "fieldname":"fieldnamediff"%>">Date Waived
            </td>
             <%if(form.getWaivedDate()!=null && !form.getWaivedDate().equals("")){ %>
              <td>&nbsp;<%=form.getWaivedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        	 <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"receivedDate")? "fieldname":"fieldnamediff"%>">Doc Received Date
            </td>
             <%if(form.getReceivedDate()!=null && !form.getReceivedDate().equals("")){ %>
              <td>&nbsp;<%=form.getReceivedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
          <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferExpiryDate")? "fieldname":"fieldnamediff"%>">Date Deferred
            </td>
            <%if(form.getDeferDate()!=null && !form.getDeferDate().equals("")){ %>
              <td>&nbsp;<%=form.getDeferDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
            <%-- // cr 36 --%>
            
         <% boolean isDefer = false;
         if(stageOb.getDeferCount()!=null && !stageOb.getDeferCount().equals("")){
	        if (stageOb.getItemStatus().equals("PENDING_DEFER")&& !stageOb.getDeferCount().equals("1")){
	        	isDefer = true; 	
        }
         }
        %>
            <%if(isDefer){ %>
            
             <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expectedReturnDate")? "fieldname":"fieldnamediff"%>">Last Due Date
            </td>
            <%if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().equals("")){ %>
              <td>&nbsp;<%=form.getExpectedReturnDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
            
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferExtendedDate")? "fieldname":"fieldnamediff"%>">Next Due Date</td>
             <%if(form.getDeferExtendedDate()!=null && !form.getDeferExtendedDate().equals("")){ %>
              <td>&nbsp;<%=form.getDeferExtendedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        <%}else{ %>
         <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expectedReturnDate")? "fieldname":"fieldnamediff"%>">Next Due Date</td>
             <%if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().equals("")){ %>
              <td>&nbsp;<%=form.getExpectedReturnDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        <%} %>
        <tr class=<%=aa%>>
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferCount")? "fieldname":"fieldnamediff"%>">Defer Counter</td>
               <%if(form.getDeferCount()!=null && !form.getDeferCount().equals("")){ %>
              <td>&nbsp;<%=form.getDeferCount() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferedDays")? "fieldname":"fieldnamediff"%>">Aging of Deferred date from Original Target date</td>
              <td class="even" >
											&nbsp;
										<p><b id='valTotalDeferedDays'></b> </p>
               <script type="text/javascript">
               setDifferenceBetDate();
               </script>
								            
								            </td>
            </tr>
              <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferedDays")? "fieldname":"fieldnamediff"%>">Aging of Next Due date from Original Target date</td>
                 <td class="even" >
											&nbsp;
											
											
											<p><b id='valOriginalDeferedDays'></b> </p>
               <script type="text/javascript">
               originalDeferedDaysCal();
               </script>
											
								            
								            </td>
            </tr>  
            
            <tr class=<%=aa%>>
                        <td class="fieldname">Image TAG/UNTAG</td>
                        <td>
                         <input type="button" value="Image Tag/Untag" onclick="tagUntagImage()" title="<bean:message key="label.img.tag.untag"/>"/>
                        </td>
                        </tr>
            
            <tr class=<%=aa%>>
              <td class="<%=StringUtils.isBlank(taggedFileNames)? "fieldname":"fieldnamediff"%>"><bean:message key="label.tagged.image.name"/></td>
              <td>&nbsp;<integro:empty-if-null value="<%=taggedFileNames%>"/> </td>
            </tr>
            
            <tr class=<%=aa%>>
              <td class="<%=StringUtils.isBlank(unTaggedFileNames)? "fieldname":"fieldnamediff"%>"><bean:message key="label.untagged.image.name"/></td>
              <td>&nbsp;<integro:empty-if-null value="<%=unTaggedFileNames%>"/></td>
            </tr>
            
<!--        <tr class=<%=aa%> >-->
<!--            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"actionParty")? "fieldname":"fieldnamediff"%>">Action Party</td>-->
<!--            <td>&nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=form.getActionParty()%>" display="true" descWithCode="false"/></td>-->
<!--             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>-->
<!--        </tr>-->
         <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"creditApprover")? "fieldname":"fieldnamediff"%>">Credit Approver</td>
            <td>&nbsp;
            
           <%
           if(allCreditApproverList!=null){
        	for(int a=0; a<allCreditApproverList.size();a++){   
           LabelValueBean bean=(LabelValueBean) allCreditApproverList.get(a);
           if(bean.getValue()!=null){
          	 if(bean.getValue().trim().equals(form.getCreditApprover())){
          		
          	%>	 
          		 <integro:empty-if-null value="<%=bean.getLabel()%>"/>
          	<% 
          	 }
          	 }          
        	}
        	} %> 
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        <tr class=<%=aa%> >
            <td style="width:116" class="<%=CompareOBUtil.compOB(stageOb,ob,"remarks")? "fieldname":"fieldnamediff"%>">Remarks</td>
            <td><integro:htmltext value="<%=stageOb.getRemarks()%>" lineLength="80"/>&nbsp;</td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>

    </tbody>
</table>


</td>
</tr>
</tbody>
</table>
 <table width="620" align="center">
                <tr>
				<td>
				<br></br>
 <table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">			
	<tr>
		<td valign="top">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
						
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								<tbody>
													<tr class="odd">													
													
										<td class="fieldname" width="20%">Edited By</td>
									
										
										<td width="30%">	
										<%if(ob!=null){ %>
										<integro:empty-if-null value="<%=ob.getUpdatedBy()%>"/>
										<%}else{ %>
										-
										<%} %>
											</td>
											
										<td class="fieldname" width="20%">Last Approved By</td>
										
										<td width="30%">
										<%if(ob!=null){ %>
										<integro:empty-if-null value="<%=ob.getApprovedBy()%>"/>
										<%}else{ %>
										-
										<%} %>
											</td>
									</tr>
									<tr class="even">
								
										<td class="fieldname" width="20%">Edited On</td>
										
										<td width="30%">
										<%if(ob!=null){ %>
										<%if(ob.getUpdatedDate()!=null){ %>
										<%=df.format(ob.getUpdatedDate()) %>
										<%}else{ %>
										-&nbsp;
										<%} %>
										<%}else{ %>
										-
										<%} %>
											</td>
											
										<td class="fieldname" width="20%">Last Approved On </td>
										
										<td width="30%">
										<%if(ob!=null){ %>
										<%if(ob.getApprovedDate()!=null){ %>
										<%=df.format(ob.getApprovedDate()) %>
										<%}else{ %>
										-&nbsp;
										<%} %>
										<%}else{ %>
										-
										<%} %>
											</td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>
					</table>
					</td>
				</tr>
		</table>
		</td>
	</tr>
</table>
				</td>
				
			</tr>
			</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <%
            if (previous != null && previous.equals(ReassignmentConstant.TASK_EVENT)) {
        %>
            <td width="100" valign="baseline" align="center">
                <a href="#" onclick="submitPage('<%=checkListTrxVal.getTransactionID()%>')"
                        onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image1" width="60" height="22" border="0" id="Image1"/></a>
             </td>
        <% } else if (false) {
//      if (request.getParameter("event") != null && "view_receipt".equals(request.getParameter("event"))) {
            String checkListID = request.getParameter("checkListID");
            String secType = request.getParameter("secType");
            String secSubType = request.getParameter("secSubType");
            String limitBkgLoc = request.getParameter("limitBkgLoc");
            String collateralID = request.getParameter("collateralID");
            String limitProfileID = request.getParameter("limitProfileID");
        %>
             <td width="75" valign="baseline" align="center">
                <a href="CAMReceipt.do?event=view&checkListID=<%=checkListID%>&limitBkgLoc=<%=limitBkgLoc%>&secType=<%=secType%>&secSubType=<%=secSubType%>&collateralID=<%=collateralID%>&limitProfileID=<%=limitProfileID%>"
                    onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image11"   border="0" id="Image11"/></a>
              </td>
        <% } else { %>
            <td width="75" valign="baseline" align="center">
                <a href="#" onclick="submitPage('<%=checkListTrxVal.getTransactionID()%>')" onmouseout="MM_swapImgRestore()"
                         onmouseover="MM_swapImage('Image12','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image12" border="0"  id="Image12"/></a>
             </td>
        <% } %>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
