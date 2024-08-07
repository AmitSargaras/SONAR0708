<%@page import="com.integrosys.cms.ui.checklist.CheckListHelper"%>
<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.*,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    String previous = request.getParameter("previous");
    String flag = request.getParameter("flag");
    ICheckListItem itemOb = (ICheckListItem)request.getAttribute("itemOb");
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.allCreditApproverList");
    SecurityReceiptForm form = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm");
    
    System.out.println("form image id == "+itemOb.getSecImageTagUntagId());
    /* form.setSecImageTagUntagId(itemOb.getSecImageTagUntagId());
    form.setSecImageTagUntagImgName(itemOb.getSecImageTagUntagImgName());
    form.setSecImageTagUntagStatus(itemOb.getSecImageTagUntagStatus()); */
    
 String secListImages = itemOb.getSecImageTagUntagImgName();
    
   	String tagImagesNames = "";
       
       String untagImagesNames = "";
       if(secListImages != null && !"".equals(secListImages)){
       	String[] secListImages1 = secListImages.split(",");
       	System.out.println(secListImages1[0]);
       	
       	 ArrayList secImageListAdd = new ArrayList();
       	    for(int i=0;i<secListImages1.length;i=i+3){
       	    	System.out.println("Tagged or untagged status =="+secListImages1[i+1].trim()+"*");
       	    	if("Tagged".equals(secListImages1[i+1].trim())){
       	    		tagImagesNames = tagImagesNames + secListImages1[i].trim()+",";
       	    	}else if("UnTagged".equals(secListImages1[i+1].trim())){
       	    		untagImagesNames = untagImagesNames + secListImages1[i].trim()+",";
       	    	}
       	    }
       }
    
    
    if(!"".equals(tagImagesNames)){
  if(",".equals(tagImagesNames.substring(tagImagesNames.length() - 1))){
	  tagImagesNames = tagImagesNames.substring(0, tagImagesNames.length() - 1);
  }}
  
    if(!"".equals(untagImagesNames)){
  if(",".equals(untagImagesNames.substring(untagImagesNames.length() - 1))){
	  untagImagesNames = untagImagesNames.substring(0, untagImagesNames.length() - 1);
  }
    }
  
  
    itemOb.setSecImageTagUntagId(tagImagesNames);
   // form.setFacImageTagUntagImgName(imageName);
    itemOb.setSecImageTagUntagStatus(untagImagesNames);
    
    form.setSecImageTagUntagId(tagImagesNames);
    form.setSecImageTagUntagImgName(secListImages);
    form.setSecImageTagUntagStatus(untagImagesNames);
    
    
    
    
    
    String lableDocDate = "Doc Expiry Date";
    boolean state=false;
    if(form.getItemStatus().equals("DEFERRED")||form.getItemStatus().equals("PENDING_DEFER")){
    	state=true;
    }
    
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

if((form.getItemStatus().equals("PENDING_DISCREPANCY")||form.getItemStatus().equals("DISCREPANCY")||form.getItemStatus().equals("UPDATE_DISCREPANCY")) && form.getDocumentStatus().equals("ACTIVE") ) {
    titleStatusDisplay = "Discrepancy";
}
    /*String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if(isPolicy == null|| isPolicy.trim().length()==0)
	{
		
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}
	if(monitorType!=null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))
	{
				lableDocDate = "Due Date to Receive Premium Receipt";
	}*/
	
	int bb = 0;
	String taggedFileNames = (String) request.getAttribute(ITagUntagImageConstant.TAGGED_FILE_NAMES);
	String unTaggedFileNames = (String) request.getAttribute(ITagUntagImageConstant.UN_TAGGED_FILE_NAMES);
	List rocChargeList = (List)session.getAttribute(SecurityReceiptAction.class.getName() + "." + "rocChargeList" );

%>
<%
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


<%@page import="java.util.List"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Locale"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
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
<script>

function returnPage(num) {
    document.forms["SecurityReceiptForm"].event.value = "view_return";
    document.forms["SecurityReceiptForm"].submit();
}

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




</script>

<style>
table.tblInput tbody tr td.fieldname {
	width : 150 px;
}
</style>
<!-- InstanceEndEditable --></head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="SecurityReceipt" >
<html:hidden property="event" />

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="actionTypeName" />
<html:hidden property="index" />
<html:hidden property="secType" />
<html:hidden property="secSubType" />
<html:hidden property="secName"/>
<html:hidden property="collateralID" />
<html:hidden property="collateralRef" />
<html:hidden property="secImageTagUntagId"/>
<html:hidden property="secImageTagUntagImgName"/>
<html:hidden property="secImageTagUntagStatus"/>

<input type="hidden" name="previous" value="<%=previous%>"/>
<input type="hidden" name="flag" value="<%=flag%>"/>
<input type="hidden" name="checkListID"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Update Security Doc Receipt </h3></td>
    </tr>
    <tr>
      <td>
      <h3> View Doc Description - <%=titleStatusDisplay%></h3>
    </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
          <%String aa = "even"; %>
            <tr class=<%=aa%> >
              <td class="fieldname">Code</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docCode" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
          <%--   <tr class=<%=aa%> >
              <td class="fieldname">Doc No</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docNo" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr> --%>
            <tr class=<%=aa%> >
              <td class="fieldname">Description</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docDesc" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
              <tr class="even">
              <td class="fieldname">Doc Amount</td>
              <%if(form.getDocAmt()!=null){ %>
              <td>&nbsp;<integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(form.getDocAmt()))%>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">HDFC Amount</td>
              <%if(form.getHdfcAmt()!=null){ %>
              <td>&nbsp;<integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(form.getHdfcAmt()))%>" /></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Currency</td>
               <%if(form.getCurrency()!=null){ %>
              <td>&nbsp;<%=form.getCurrency() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
<%-- 
            <tr class="even">
              <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docRef" /></td>
            </tr>

            <tr class=<%=aa%> >
              <td class="fieldname">Document Type</td>
              <%if(form.getMonitorType()==null||form.getMonitorType().equals("")){ %>
              <td>-</td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
              <%}else{ %>
              <td>&nbsp;<integro:common-code categoryCode="MONITOR_TYPE" entryCode="<%=form.getMonitorType()%>" display="true" descWithCode="false"/></td>
            	<% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            	<%} %>
        </tr>
            <tr class=<%=aa%> >
              <td class="fieldname">Form No</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="formNo" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>--%>
            <tr class=<%=aa%> >
              <td class="fieldname">Doc Date</td>
              <%if(form.getDocDate()!=null && !form.getDocDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getDocDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
            <tr class="even">
              <td class="fieldname">Original Target Date</td>
              <%if(form.getOriginalTargetDate()!=null && !form.getOriginalTargetDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getOriginalTargetDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
<%--
           <%
				if(isPolicy!=null && isPolicy.equals("true"))
				{
	
			%>
			<tr class="odd">
              <td class="fieldname">Document Effective Date&nbsp;<font color="#0000FF">* </font></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docEffDate" /></td>
            </tr>
            
            <%
       			 }
       		%>
--%>
            <tr class=<%=aa%> >
              <td class="fieldname"><%=lableDocDate%></td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="docExpDate" /></td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
<%--
            <tr class="even">
              <td class="fieldname">Identify Date</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="identifyDate" /></td>
            </tr>
--%>
             <%if(form.getItemStatus().equals("PENDING_DEFER")&& !form.getDeferCount().equals("1")){ %>
             <tr class="even">
              <td class="fieldname">Last Due Date </td>
              <%if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getExpectedReturnDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Next Due Date </td>
              <%if(form.getDeferExtendedDate()!=null && !form.getDeferExtendedDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getDeferExtendedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <%}else{ %>
            <tr class="even">
              <td class="fieldname">Next Due Date </td>
              <%if(form.getExpectedReturnDate()!=null && !form.getExpectedReturnDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getExpectedReturnDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <%} %>
             <tr class="even">
              <td class="fieldname">Date Deferred&nbsp;</td>
              <%if(form.getDeferDate()!=null && !form.getDeferDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getDeferDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Date Waived&nbsp;</td>
             <%if(form.getWaivedDate()!=null && !form.getWaivedDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getWaivedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
             <tr class="even">
              <td class="fieldname">Doc Received Date&nbsp;</td>
              <%if(form.getReceivedDate()!=null && !form.getReceivedDate().trim().equals("")){ %>
              <td>&nbsp;<%=form.getReceivedDate() %></td>
              <%}else{ %>
              <td>&nbsp;-</td>
              <%} %>
            </tr>
            <tr class="even">
              <td class="fieldname">Defer Counter</td>
             <%if(form.getDeferCount()!=null && !form.getDeferCount().equals("") && !form.getDeferCount().equals("0")){ %>
             <td>&nbsp;<%=form.getDeferCount() %></td>
             <%}else{ %>
              <td>&nbsp;-</td>
             <%} %>
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
              
              
             <%--  <tr class="even">
              <td class="fieldname">Image Id</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="secImageTagUntagId" /></td>
            </tr> 
            
            <tr class="even">
              <td class="fieldname">Image Name</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="secImageTagUntagImgName" /></td>
            </tr>
            
            <tr class="even">
              <td class="fieldname">Image Status</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="secImageTagUntagStatus" /></td>
            </tr>
             --%>
            
            <%-- <tr class="even">
              <td class="fieldname">Tagged Image Name</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="secImageTagUntagStatus" /></td>
            </tr>
            
            <tr class="even">
              <td class="fieldname">Untagged Image Name</td>
              <td>&nbsp;<bean:write name="SecurityReceiptForm" property="secImageTagUntagId" /></td>
            </tr> --%> 
            
            <tr class="even">
              <td class="fieldname"><bean:message key="label.tagged.image.name"/></td>
              <td>&nbsp;<integro:empty-if-null value="<%=taggedFileNames%>"/> </td>
            </tr>
            
            <tr class="even">
              <td class="fieldname"><bean:message key="label.untagged.image.name"/></td>
              <td>&nbsp;<integro:empty-if-null value="<%=unTaggedFileNames%>"/></td>
            </tr>
              
            <tr class="even">
              <td class="fieldname"><bean:message key="label.roc.charge"/></td>
              <td>&nbsp;<integro:empty-if-null value="<%=CheckListHelper.getLabelByLabelValue(itemOb.getRocCharge(), rocChargeList)%>"/></td>
            </tr>  

            <tr class="even">
              <td class="fieldname">Credit Approver</td>
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
            </tr>
<%--
            <tr class="even">
              <td class="fieldname" >Shared</td>
              <td >
                   <html:radio property="shared" disabled="true" value="true" />Yes
                   <html:radio property="shared" disabled="true" value="false"  />No
              </td>
              </tr>
--%>
            </tbody>
        </table>
<%-- 
        <jsp:include page="/checklist/secreceipt/ViewShareCheckList.jsp" />
--%>
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
           <tbody>
                <tr class=<%=(bb++%2!=0)?"even":"odd"%> >
              <td class="fieldname">Remarks</td>
              <td>
                   <% SecurityReceiptForm aForm = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm"); %>
                    <integro:htmltext value="<%=aForm.getDocRemarks()%>" lineLength="80" />&nbsp;
              </td>
              <% bb++; if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
            </tr>
           </tbody>
        </table>
        <table width="100%">
                <tr>
				<td>
				<br></br>
 <jsp:include page="view_audit_details_individual.jsp"></jsp:include>
				</td>
				
			</tr>
			</table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
             <%   if (previous != null && previous.equals("view")) { %>
                <td align="center" valign="middle"><a href="#" onclick="returnPage(0)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a></td>
             <% } else { %>
                <td align="center" valign="middle"><a href="#" onclick="returnPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"  border="0" id="Image1" /></a></td>
             <% } %>
              </tr>
        </table>
        </td>
    </tr>
  </tbody>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
