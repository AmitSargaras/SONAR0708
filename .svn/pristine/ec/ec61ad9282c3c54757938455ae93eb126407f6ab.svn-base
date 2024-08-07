<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.IDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 java.util.List,
				 java.util.Arrays,
                 com.integrosys.cms.ui.cccountry.CCCountryForm"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/cccountry/add_template.jsp,v 1.8 2006/10/27 08:12:22 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.8 $
 * @since $Date: 2006/10/27 08:12:22 $
 * Tag: $Name:  $
 */
 
 

 
CommonCodeList commonCode = CommonCodeList.getInstance("APPLICATION_TYPE");
	
List appCodeID   = (List) commonCode.getCommonCodeValues();
List appCodeValue   = (List) commonCode.getCommonCodeLabels();
 
 
 
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
String index = (String)request.getAttribute("index");
if(index == null) {
    CCCountryForm aForm = (CCCountryForm)request.getAttribute("CCCountryForm");
    index = aForm.getIndex();
}
if(index == null) index = "";


CCCountryForm aForm = (CCCountryForm) request.getAttribute("CCCountryForm");

String getEvent = request.getParameter("event");
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>

<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}

function selectLists(){
    List = document.forms[0].loanApplicationList;
    Append = document.forms[0].appendLoanList;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
        Append.value = List.options[i].value + "-" + Append.value;
    }

}

function add() {
	selectLists();
	document.forms[0].event.value="add_item";
	document.forms[0].submit();
}

function goCancel() {
	document.forms[0].event.value="cancel_list";
	document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="CCCountry" >
<input type="hidden" name="event" />
<%--to display correct country name--%>
<html:hidden property="countryCode" />
<html:hidden property="countryName" />

<input type="hidden" name="index" value="<%=index%>"/>
<input type="hidden" name="appendLoanList" value="" />

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" --> 
<table class="tblFormSection" width="60%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr> 
      <td> <h3><bean:write name="CCCountryForm" property="countryName" /> - <% if(index.equals("")) {%> Create New<%}else{%>Edit<%}%></h3></td>
    </tr>
    <tr> 
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead> </thead> <tbody>
        <% if(index.length()!=0){%>
			<tr class="even">
          		<td class="fieldname">Document Code&nbsp;<font color="#0000FF">* </font></td>
          		<td>
          		&nbsp;<bean:write property="docCode" name="CCCountryForm" />
          		<html:hidden property="docCode" name="CCCountryForm" />
          		</td>
        	</tr>
		<% }else{ %>
		<tr class="even">
			<td class="fieldname">Document Code&nbsp;<font color="#0000FF">* </font></td>
			<td>
				<html:text property="docCode" size="50" maxlength="20" />
				<html:errors property="docCode" />
			</td>
		</tr>
		<%}%>
        <tr class="odd"> 
          <td class="fieldname">Document Description&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:text property="docDesc" size="50" maxlength="500" />
            <html:errors property="docDesc" />
          </td>
        </tr>
        <tr class="even">
			<td class="fieldname">Document Version&nbsp;</td>
			<td><html:text property="docVersion" size="50" maxlength="7" /></td>
		</tr>
        <tr class="odd"> 
          <td class="fieldname">Expiry Date</td>
          <td>
            <html:text property="expDate" size="12" maxlength="12" readonly="true"/>
            <img src="img/calendara.gif"  name="Image32" border="0" id="Image32" onclick="return showCalendar('expDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
            <html:errors property="expDate" />
          </td>
        </tr>
		<tr class="even">
			<td class="fieldname"><bean:message key="label.cc.checklist.application.type"/></td>
			<td> <table border="0">
							<tr>
								<td>
									 <select id="loanApplicationTypeAvail" name="loanApplicationTypeAvail" size="10" multiple="multiple" style="width:260">
						                <% for(int i=0; i<appCodeID.size(); i++){
						                	if (aForm.getLoanApplicationList() == null)
						                	{
						                %>
						                	<option value='<%=appCodeID.get(i)%>'><%=appCodeValue.get(i)%></option>
						                <%
						                	}else
						                	if(aForm.getLoanApplicationList()!=null && !Arrays.asList(aForm.getLoanApplicationList()).contains(appCodeID.get(i)))
						                		{
						                %>
						                  	<option value='<%=appCodeID.get(i)%>'><%=appCodeValue.get(i)%></option>
						                  <%
						                		}
						                	}
						                  %>
		
		                			</select> 
		                		</td>

		                		<td>
		             				<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(loanApplicationTypeAvail,loanApplicationList, false),getOrgCodesByCtryCodes()" class="btnNormal"/>
			                		<br/> <br/> 
									<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(loanApplicationList,loanApplicationTypeAvail,false),delOrgCodesByCtryCodes()" class="btnNormal"/>
		                		</td>
		                		<td>
									 <select id="loanApplicationList" name="loanApplicationList" size="10" multiple="multiple" style="width:260">
		 								<% for(int i=0; i<appCodeID.size(); i++){
						                	if(aForm.getLoanApplicationList()!=null && Arrays.asList(aForm.getLoanApplicationList()).contains(appCodeID.get(i)))
						                		{
						                %>
						                  	<option value='<%=appCodeID.get(i)%>'><%=appCodeValue.get(i)%></option>
						                  <%
						                	 }}
						                  %>
		                			</select> 
		                		</td>
		                	</tr>
                			</table>
			</td>
		</tr>
        <tr class="odd">
			<td class="fieldname">Type&nbsp;<font color="#0000FF">*</font></td>
			<td>
			<html:checkbox  name="CCCountryForm" property="isForBorrower" value="isBorrower" />Borrower
			<html:checkbox  name="CCCountryForm" property="isForPledgor" value="isPledgor" />Chargor/Pledgor/Guarantor
			<html:errors property="forBorrowerOrForPledgor" />
			</td>
		</tr>
		<tr class="even">
			<td class="fieldname">Pre-Approval Document&nbsp;<font color="#0000FF">* </font></td>
			<td>
			<html:radio  name="CCCountryForm" property="isPreApprove" value="Y" />Yes
			<html:radio  name="CCCountryForm" property="isPreApprove" value="N" />No
			</td>
		</tr>
        </tbody>        
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="100" valign="baseline" align="center"> <a href="#"   onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)" onclick="add()" ><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                        </td>
                        <td width="100" valign="baseline" align="center"> <a href="#" onclick = "goCancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>

<!-- InstanceEndEditable --> 
</html:form>
</body>
<!-- InstanceEnd --></html>
