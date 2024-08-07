<%@ page import="com.integrosys.cms.ui.diaryitem.DiaryItemAction,
                 com.integrosys.base.techinfra.util.DateUtil,
                   java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.diaryitem.DiaryItemForm,
                 java.util.Date,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.diaryitem.ODSchedule"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/diaryitem/view_diary_item.jsp,v 1.13 2006/08/25 12:56:49 wltan Exp $
     * @author $Author: wltan $
     * @version $Revision: 1.13 $
     * @since $Date: 2006/08/25 12:56:49 $
     * Tag: $Name:  $
     */
%>

<html>
<body>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<style>
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
</style>

<%
    DiaryItemForm diaryForm = (DiaryItemForm) request.getAttribute("DiaryItemForm");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    String fromPage = (String) request.getAttribute("frompage");
    System.out.println(">>>>>>>>on view od schedule frompage<<<<<<<<< "+fromPage);
    String fromEvent = (String) request.getAttribute("fromEvent");
    System.out.println(">>>>>>>>on view od schedule fromEvent<<<<<<<<< "+fromEvent);
    List listOfRecrods = (ArrayList) request.getAttribute("listOfRecrods");
    ODSchedule od =(ODSchedule)listOfRecrods.get(0);
    String date=od.getToBeReducedOn();
   	String toBeReducedOn=date.substring(0, 2)+"th of Every Month";;
   	if("0".equals(toBeReducedOn.substring(0,1)))
   		toBeReducedOn=toBeReducedOn.substring(1);
    int alertSent=0;
    for(int i=0;i<listOfRecrods.size();i++){
    	ODSchedule temp=(ODSchedule)listOfRecrods.get(i);
    	if("Y".equals(temp.getIsClosed()))
    		alertSent++;
		String str = temp.getCalBal().replaceAll("\\s+","");  
    	if(".00".equals(str)){
    		temp.setCalBal("0.00");
    		listOfRecrods.set(i, temp);
    	}
    }
    if (fromPage == null) {
        fromPage = request.getParameter("frompage");
    }

    String startIndex = (String) request.getAttribute("startIndex");
    if (startIndex == null) {
        startIndex = request.getParameter("startIndex");
    }

    String customerIndex = (String) request.getAttribute("customerIndex");
    if (customerIndex == null) {
        customerIndex = diaryForm.getCustomerIndex();
    }

    DefaultLogger.debug(this, "fromPage >>>>>>>>>> " + fromPage);
    DefaultLogger.debug(this, "startIndex >>>>>>>>>> " + startIndex);
    DefaultLogger.debug(this, "customerIndex >>>>>>>>>> " + customerIndex);
    String itemDueDate =  (String) request.getAttribute("itemDueDate");
    pageContext.setAttribute("itemDueDate", itemDueDate);
%>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
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

function cancelForm() {
    document.forms[0].event.value = "<%=DiaryItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}
</script>
</head>
<html:form action="DiaryItem.do">
<input type="hidden" name="event" value="<%=DiaryItemAction.EVENT_UPDATE%>"/>
<input type="hidden" name="itemId" value="<%=diaryForm.getItemId()%>" />
<input type="hidden" name="frompage" value="<%=fromPage%>" />
<input type="hidden" name="startIndex" value="<%=startIndex%>" />
<input type="hidden" name="customerIndex" value="<%=customerIndex%>" />

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblinfo">
  		<tr>
      		<td colspan=2 class="fieldname" style="background-color: #B0C4DE">&nbsp;&nbsp;OD Schedule</td>
  		</tr>
  		
  		<tr class="odd">
      		<td colspan=2  style="border-width: 0px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  		</tr>
	<tbody>
  		<tr>
    		<td style="border-width: 0px; background-color:FFFFFF" >
      			<table style="padding-left: 80" width="80%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      				<tr class="even">
      					<td width="20%" class="fieldname" style="background-color: #B0C4DE">Loan Amount</td>
      					<td width="20%" class="fieldname" style="background-color: #FAE29C"><%=od.getLoanAmount()%></td>
  					</tr>
  					<tr>
      					<td width="20" class="fieldname" style="background-color: #B0C4DE">Interest Rate</td>
      					<td width="20" class="fieldname" style="background-color: #FAE29C"><%=od.getInterestRate()%>%</td>
  					</tr>
  					<tr>
      					<td width="20" class="fieldname" style="background-color: #B0C4DE">To be Reduced on</td>
      					<td width="20" class="fieldname" style="background-color: #FAE29C"><%=toBeReducedOn%></td>
  					</tr>
      			</table>
    		</td>
    		
    		<td style="border-width: 0px; background-color:FFFFFF">
      			<table width="80%" border="1" cellspacing="0" cellpadding="0" class="tblInput">
      				<tr class="even">
      					<td width="20%" class="fieldname" style="background-color: #B0C4DE">Total Months</td>
      					<td width="20%" class="fieldname" style="background-color: #FFFFFF"><%=listOfRecrods.size() %></td>
  					</tr>
  					<tr>
      					<td width="20" class="fieldname" style="background-color: #B0C4DE">Closed</td>
      					<td width="20" class="fieldname" style="background-color: #FFFFFF"><%=alertSent%></td>
  					</tr>
  					<tr>
      					<td width="20" class="fieldname" style="background-color: #B0C4DE">Pending for close</td>
      					<td width="20" class="fieldname" style="background-color: #FFFFFF"><%=listOfRecrods.size()-alertSent %></td>
  					</tr>
      			</table>
    		</td>
  		</tr>
  		<tr class="odd">
      		<td style="border-width: 0px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  		</tr>
	</tbody>
</table>

<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" class="tblinfo">
  <tbody>
  	<tr>
  		<td style="border-width: 0px; background-color:FFFFFF">
      		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      			<tr class="even">
      				<td  class="fieldname" style="background-color: #B0C4DE">Month</td>
      				<td  class="fieldname" style="background-color: #B0C4DE">Op Bal</td>
      				<td  class="fieldname" style="background-color: #B0C4DE">EMI</td>
      				<td  class="fieldname" style="background-color: #B0C4DE">Interest</td>
      				<td  class="fieldname" style="background-color: #B0C4DE">Principle</td>
      				<td  class="fieldname" style="background-color: #B0C4DE">Cl.Bal</td>
  				</tr>
  				<logic:present name="listOfRecrods" scope="request">
  				<logic:iterate name="listOfRecrods" id="element" indexId="ind">
  						<%ODSchedule temp =(ODSchedule)listOfRecrods.get(ind.intValue()); 
  						if("0".equals(ind.toString())){%>
  							<tr>
  								<td  class="fieldname" style="background-color: #FFFFFF"></td>
      							<td  class="fieldname" style="background-color: #FFFFFF"></td>
      							<td  class="fieldname" style="background-color: #FFFFFF"></td>
      							<td  class="fieldname" style="background-color: #FFFFFF"></td>
      							<td  class="fieldname" style="background-color: #FFFFFF"></td>
      							<td  class="fieldname" style="background-color: #FFFFFF"><bean:write name="element" property="opBal"/></td>
  							</tr>
  						<%}
  						%>
  					<tr>
  					<%if("Y".equals(temp.getIsClosed())){%>
  						<td  class="fieldname" style="background-color: #CAE1FF"><bean:write name="element" property="month"/></td>
      					<td  class="fieldname" style="background-color: #CAE1FF"><bean:write name="element" property="opBal"/></td>
      					<td  class="fieldname" style="background-color: #CAE1FF"><bean:write name="element" property="emi"/></td>
      					<td  class="fieldname" style="background-color: #CAE1FF"><bean:write name="element" property="interest"/></td>
      					<td  class="fieldname" style="background-color: #CAE1FF"><bean:write name="element" property="principal"/></td>
      					<td  class="fieldname" style="background-color: #CAE1FF"><bean:write name="element" property="calBal"/></td>
  					<%}else{ %>
  						<td  class="fieldname" style="background-color: #FFFFFF"><bean:write name="element" property="month"/></td>
      					<td  class="fieldname" style="background-color: #FFFFFF"><bean:write name="element" property="opBal"/></td>
      					<td  class="fieldname" style="background-color: #FFFFFF"><bean:write name="element" property="emi"/></td>
      					<td  class="fieldname" style="background-color: #FFFFFF"><bean:write name="element" property="interest"/></td>
      					<td  class="fieldname" style="background-color: #FFFFFF"><bean:write name="element" property="principal"/></td>
      					<td  class="fieldname" style="background-color: #FFFFFF"><bean:write name="element" property="calBal"/></td>
  					<%} %>
      				</tr>
				</logic:iterate>
				</logic:present>
      		</table>
    	</td>
  	</tr>
  </tbody>
</table>

<table width="72" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="72">&nbsp;</td>
  </tr>
  <tr>
    <%
    StringBuffer sb = new StringBuffer("DiaryItem.do?event="+fromEvent+"&itemId="+diaryForm.getItemId()+"&frompage="+fromPage+"&itemDueDate="+itemDueDate);
        if (customerIndex != null && customerIndex.trim().length() > 0) {
            sb.append("&customerIndex="+customerIndex);
        } 

        if (startIndex != null && startIndex.trim().length() > 0){
            sb.append("&startIndex="+startIndex);
        }
        String cancelURL = sb.toString();
        System.out.println("<<<<<<<view od cancelURL>>>>>"+cancelURL);
    %>
    
    <td width="72"><a href="<%=cancelURL%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" /></a></td>
  
  </tr>
</table>
</html:form>
</body>
</html>
