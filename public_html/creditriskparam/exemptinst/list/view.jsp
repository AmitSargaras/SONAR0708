<%@ page import="com.integrosys.cms.app.creditriskparam.bus.exemptedinst.IExemptedInst,
                 com.integrosys.cms.app.creditriskparam.trx.exemptedinst.IExemptedInstTrxValue,
                 com.integrosys.cms.app.creditriskparam.trx.exemptedinst.OBExemptedInstTrxValue,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 java.util.HashMap,
                 com.integrosys.cms.ui.creditriskparam.exemptedinst.list.ExemptedInstListForm,
                 com.integrosys.cms.ui.creditriskparam.exemptedinst.list.ExemptedInstListAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.creditriskparam.exemptedinst.list.ExemptedInstListMapper,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.creditriskparam.exemptedinst.ExemptedInstHelper"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	System.out.println(">>>> view.jsp");

    ExemptedInstListForm actionForm = (ExemptedInstListForm)pageContext.findAttribute("ExemptedInstListForm");

    String event = actionForm.getEvent();

    boolean forClose = event.equals(ExemptedInstListAction.EVENT_READ_MAKER_CLOSE) ||
    					event.equals(ExemptedInstListAction.EVENT_LIST_MAKER_CLOSE);

	boolean forRead = ExemptedInstListAction.EVENT_READ.equals(event) ||
						ExemptedInstListAction.EVENT_LIST_READ.equals(event);
	
    // Get the exempted inst trx value from session.
    IExemptedInstTrxValue exemptedInstTrxValue = (IExemptedInstTrxValue)session.
            getAttribute("com.integrosys.cms.ui.creditriskparam.exemptedinst.ExemptedInstAction.ExemptedInstTrxValue");
    
    IExemptedInst[] stagingExemptedInst = exemptedInstTrxValue.getStagingExemptedInst();
    IExemptedInst[] actualExemptedInst = exemptedInstTrxValue.getExemptedInst();
    
    if (stagingExemptedInst == null)stagingExemptedInst = new IExemptedInst[0];
    if (actualExemptedInst == null)actualExemptedInst = new IExemptedInst[0];
    
    pageContext.setAttribute("stagingExemptedInst", stagingExemptedInst);

    int totalEntries = stagingExemptedInst.length;
    
    // Get the record markers.
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.exemptedinst.ExemptedInstAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.exemptedinst.ExemptedInstAction.length")).intValue();
    
    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);  
    
    // Get transaction user and date
    String lastActionBy = exemptedInstTrxValue.getUserInfo();
    String remarks = exemptedInstTrxValue.getRemarks();

    DefaultLogger.debug(this, "userId = " + lastActionBy);
    DefaultLogger.debug(this, "remarks = " + remarks);  
    
    CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->

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

function gotopage(aLocation) {
    window.location = aLocation;
}

function goPageIndex(targetOffset) {
	<% if (forClose) { %>
		document.forms[0].event.value = "<%=ExemptedInstListAction.EVENT_LIST_MAKER_CLOSE%>"
	<% } else if (forRead) { %>
		document.forms[0].event.value = "<%=ExemptedInstListAction.EVENT_LIST_READ%>"
	<% } else { %>
		document.forms[0].event.value = "<%=ExemptedInstListAction.EVENT_LIST_VIEW%>"
	<% } %>

    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}

function closeForm() {
	document.forms[0].event.value = "<%=ExemptedInstListAction.EVENT_CLOSE%>"
	document.forms[0].submit();
}

function editForm()
{
	document.forms[0].event.value = "<%=ExemptedInstListAction.EVENT_READ_MAKER_EDIT%>";
	document.forms[0].submit();

}

//-->
</script>
</head>

<body>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->


<html:form action="ExemptInst.do">
<input type="hidden" name="event"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
	<tr>
<!--  td height="34"> <h3>Customer Relationship Information</h3></td -->
      <td height="34" width="70%"><h3><bean:message key="title.crp.exemptinst.list"/></h3></td>
      <td valign="baseline" style="text-align:right">
      	<% if (!forClose) { %>
      	<input name="btnEdit" type="button" class="btnNormal" value="Edit" onClick="javascript:editForm();" style="margin-right:5px;margin-left:5px;width:100px">
        &nbsp;
        <% } %>
      </td>
	</tr>
	<tr>
	<td colspan="2"><hr /></td>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td colspan="2">
	<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
	<thead>
	       <tr>
	           <td width="5%"><bean:message key="label.global.sno"/></td>
	           <td width="40%"><bean:message key="label.customer.name"/>&nbsp;</td>
	           <td width="20%"><bean:message key="label.customer.id.source"/></td>
	           <td width="20%"><bean:message key="label.security.pledgor.le.id"/></td>
	       </tr>
	</thead> 
	<tbody>

		<%
		    // Check that offset + length cannot exceed the total.
		    int iterateLength = 0;
		    if (offset + length > totalEntries) {
		        iterateLength = totalEntries - offset;
		    } else {
		        iterateLength = length;
		    }
		%>
		<% 
		  if (iterateLength == 0) {
		%>
		 <tr>
		 	<td colspan="8" class="odd">
			  <bean:message key="label.global.not.found"/>
			</td>
		 </tr> 
		<%
		  }
		%>
		<logic:iterate id="exemptedInst" name="stagingExemptedInst"
		        offset="<%=String.valueOf(offset)%>"
		        length="<%=String.valueOf(iterateLength)%>" indexId="counter"
		        type="com.integrosys.cms.app.creditriskparam.bus.exemptedinst.IExemptedInst">
		<%
		    DefaultLogger.debug(this, "counter is now " + counter.intValue());
			String sourceId = exemptedInst.getCustIDSource();
			sourceId = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);

		%>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="index" valign="top"><%=counter.intValue()+1%></td>
			<td >&nbsp;<integro:empty-if-null value="<%=exemptedInst.getCustomerName()%>"/></td>
			<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=sourceId %>" /></td>
			<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=exemptedInst.getLEReference() %>" /></td>
		</tr>
		</logic:iterate>
		</tbody>
	</table>
	</td>
	</tr>
	<tr><td>&nbsp</td>
	<tr><td>&nbsp</td>
	</tr>
	<tr>
	<td colspan="2">
	<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <tr class="even">
          <td colspan="2" class="fieldname"><bean:message key="label.last.action.by"/></td>
          <td colspan="6">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
		</tr>
       	<tr class="odd">
            <td colspan="2" class="fieldname"><bean:message key="label.last.remarks.made"/></td>
            <td><integro:empty-if-null value="<%=remarks%>"/>
			</td>
        </tr>

	   </table>
	 </td>
	 </tr>
	</tbody>
</table>	

<%if (forClose) {%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td><a href="#" onclick="closeForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a></td>
</tr>
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>
<% } else if (!forRead) { %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<!-- 
<tr>
<td width="100" valign="baseline" align="center">
<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
</td>
</tr>
-->
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>
<% } %>

</html:form>
</td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->

<tr>
<td height="25">


		<table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">

		<tr>
		<td valign="middle">
		<integro:pageindex
		 pageIndex="<%=new PageIndex(offset, length, stagingExemptedInst.length)%>"
		 url="ExemptInst.do" submitFlag="true"/>
		</td>
		</tr>
		</table>

</td>
</tr>

</table>



</body>
</html>