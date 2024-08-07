<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustShareholder,
                 com.integrosys.cms.app.custrelationship.trx.shareholder.ICustShareholderTrxValue,
                 com.integrosys.cms.app.custrelationship.trx.shareholder.OBCustShareholderTrxValue,
                 java.util.HashMap,
                 com.integrosys.cms.ui.custrelationship.shareholder.ShareHolderListForm,
                 com.integrosys.cms.ui.custrelationship.shareholder.ShareHolderListAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.custrelationship.shareholder.ShareHolderListMapper,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.custrelationship.CustRelUtils,
                 com.integrosys.cms.ui.custrelationship.CustRelConstants,
                 com.integrosys.cms.ui.common.CountryList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	System.out.println(">>>> shareholder track.jsp");

    ShareHolderListForm actionForm = (ShareHolderListForm)pageContext.findAttribute("ShareHolderListForm");

    String event = actionForm.getEvent();

    boolean forClose = event.equals(ShareHolderListAction.EVENT_READ_MAKER_CLOSE) ||
    					event.equals(ShareHolderListAction.EVENT_LIST_MAKER_CLOSE);

	boolean forRead = ShareHolderListAction.EVENT_TOTRACK.equals(event) ||
						ShareHolderListAction.EVENT_LIST_READ.equals(event);
	
    // Get the cust relationship trx value from session.
    ICustShareholderTrxValue custShareHolderTrxValue = (ICustShareholderTrxValue)session.
            getAttribute("com.integrosys.cms.ui.custrelationship.CustRelAction.CustShareHolderTrxValue");
	
    if (custShareHolderTrxValue == null)
    	custShareHolderTrxValue = new OBCustShareholderTrxValue();
    
    ICustShareholder[] stagingCustShareHolderArr = custShareHolderTrxValue.getStagingCustShareholder();
    ICustShareholder[] actualCustShareHolderArr = custShareHolderTrxValue.getCustShareholder();
    
    if (stagingCustShareHolderArr == null)stagingCustShareHolderArr = new ICustShareholder[0];
    if (actualCustShareHolderArr == null)actualCustShareHolderArr = new ICustShareholder[0];
    
    pageContext.setAttribute("stagingCustShareHolderArr", stagingCustShareHolderArr);

    int totalEntries = stagingCustShareHolderArr.length;
    
    // Get the record markers.
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.custrelationship.CustRelAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.custrelationship.CustRelAction.length")).intValue();
    
    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
    
    String subProfileId = (String)session.getAttribute(
    		"com.integrosys.cms.ui.custrelationship.CustRelAction.sub_profile_id");    
    
    DefaultLogger.debug(this, "subProfileId = " + subProfileId);
    
	String customerType = (String)session.getAttribute(
		"com.integrosys.cms.ui.custrelationship.CustRelAction.customerType");    
		
    // Get transaction user and date
    String lastActionBy = custShareHolderTrxValue.getUserInfo();
    java.util.Date lastUpdateDate = custShareHolderTrxValue.getTransactionDate();

    DefaultLogger.debug(this, "userId = " + lastActionBy);
    DefaultLogger.debug(this, "lastUpdateDate = " + lastUpdateDate);  
    
    CommonCodeList commonCode = CommonCodeList .getInstance(null, null, ICMSUIConstant.ENTITY_REL, null);
    
    CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

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
		document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_LIST_MAKER_CLOSE%>"
	<% } else if (forRead) { %>
		document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_LIST_READ%>"
	<% } else { %>
		document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_LIST_VIEW%>"
	<% } %>

    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}

function closeForm() {
	document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_CLOSE%>"
	document.forms[0].submit();
}

function editForm()
{
	document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_READ_MAKER_EDIT%>";
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


<html:form action="CRShareHolder.do">
<input type="hidden" name="event"/>
<input type="hidden" name="sub_profile_id" value="<%=subProfileId %>"/>
<input type="hidden" name="customerType" value="<%=customerType %>"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
<!--  td height="34"> <h3>Customer Relationship Information</h3></td -->
      <td height="34" width="70%"><h3>Shareholder Information</h3></td>
      <td valign="baseline" style="text-align:right">
        &nbsp;
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
                <td width="5%"><bean:message key="label.global.sn" /></td>
                <td width="20%"><bean:message key="label.global.name"/>&nbsp;</td>
                <td width="9%"><bean:message key="label.group.leid.source"/></td>
                <td width="8%"><bean:message key="label.customer.id" /></td>
                <td width="15%"><bean:message key="label.col.owner.id.no" /></td>
                <td width="12%"><bean:message key="label.cust.relationship.id.country" /></td>
                <td width="15%"><bean:message key="label.group.percentowned" /></td>
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
		<logic:iterate id="custShareHolder" name="stagingCustShareHolderArr"
		        offset="<%=String.valueOf(offset)%>"
		        length="<%=String.valueOf(iterateLength)%>" indexId="counter"
		        type="com.integrosys.cms.app.custrelationship.bus.ICustShareholder">
		<%
		    DefaultLogger.debug(this, "counter is now " + counter.intValue());
			Double percentageOwn = custShareHolder.getPercentageOwn();
			String percentageOwnStr = (percentageOwn == null) ? "" : CustRelUtils.formatDouble("#0.00",percentageOwn);
			DefaultLogger.debug(this, "percentageOwnStr : " + percentageOwnStr); 
			
			String customerName = "";
			String sourceId = "";
			String lEReference = "";
			String legalRegNumber = "";
			String legalRegCountry = "";
			
			if (custShareHolder.getCustomerDetails() != null &&
					custShareHolder.getCustomerDetails().getCMSLegalEntity() != null) {
				sourceId = custShareHolder.getCustomerDetails().getCMSLegalEntity().getSourceID();
				sourceId = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);
				
				customerName = custShareHolder.getCustomerDetails().getCustomerName();
				lEReference = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLEReference();
				legalRegNumber = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegNumber();
				legalRegCountry = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegCountry();
			}
        	
		%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="index" valign="top"><%=counter.intValue() + 1%></td>
                <td>&nbsp;<integro:empty-if-null value="<%=customerName%>"/></td>
                <td>&nbsp;<integro:empty-if-null value="<%=sourceId%>" /></td>
                <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=lEReference%>" /></td>
                <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=legalRegNumber%>" /></td>
                
                <%
                      String cty = null;
                      if (!(legalRegCountry == null || legalRegCountry.equals(""))) {
                      	cty = CountryList.getInstance().getCountryName(legalRegCountry);
                      }
                %> 
                        
                <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=cty%>"/></td>
                <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=percentageOwnStr %>" /></td>
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
          <td colspan="2" class="fieldname"> Last Updated User</td>
          <td colspan="6">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
		</tr>
		<tr class="odd">
          <td colspan="2" class="fieldname">Last Updated Date</td>
          <td colspan="6">&nbsp;<integro:date object="<%=lastUpdateDate%>"/></td>
        </tr>
	   </table>
	 </td>
	 </tr>
	</tbody>
</table>	
<% if (forRead) { %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td width="100" valign="baseline" align="center">
<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
</td>
</tr>
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
		 pageIndex="<%=new PageIndex(offset, length, stagingCustShareHolderArr.length)%>"
		 url="CustRelationship.do" submitFlag="true"/>
		</td>
		</tr>
		</table>

</td>

</table>

</body>
</html>