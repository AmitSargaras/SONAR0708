<%@ page import="com.integrosys.cms.ui.collateral.commodity.loanagency.LoanAgencyAction,
                 com.integrosys.cms.app.checklist.bus.OBCheckList,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/view_security_doc.jsp,v 1.9 2006/10/27 08:31:13 hmbao Exp $
*
* Purpose: Read the data of the commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.9 $
* Date: $Date: 2006/10/27 08:31:13 $
* Tag: $Name:  $
*/
%>
<%
    String event = LoanAgencyAction.EVENT_RETURN;
    String from_event = request.getParameter("event");
    if (request.getParameter("from_page") != null) {
        from_event = request.getParameter("from_page");
    }
%>

<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage() {
document.forms[0].event.value="<%=event%>";
    document.forms[0].submit();
}

//-->
</script>

</head>
<body>
<html:form action="LoanAgency.do">
<input type="hidden" name="event" value="<%=LoanAgencyAction.EVENT_RETURN%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="77%">
      <h3><bean:message key="label.security.doc.list"/></h3>
    </td>
    <td valign="bottom" colspan="2">
      <table width="80"  border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="80" valign="baseline" align="center">&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="4%"><bean:message key="label.global.sn"/></td>
          <td width="32%"><bean:message key="label.security.doc.desc"/></td>
          <td width="15%"><bean:message key="label.security.doc.num"/></td>
          <td width="25%"><bean:message key="label.security.doc.code"/></td>
          <td width="12%"><bean:message key="label.security.doc.status"/></td>
          <td width="12%"><bean:message key="label.security.cust.status"/></td>
        </tr>
        </thead>
        <tbody>
               <%   OBCheckList securityDocList = (OBCheckList)request.getAttribute("checkList");
            if (!(securityDocList!= null )) {
        %>
        <tr class="odd"><td colspan="6">There is no Security Document.</td></tr>
        <%
             }  else {
                if(securityDocList.getCheckListItemList()!=null && securityDocList.getCheckListItemList().length>0)
                {
                    int count = 0;
                for (int i = 0; i < securityDocList.getCheckListItemList().length; i++) {
                    String itemStatus = securityDocList.getCheckListItemList()[i].getItemStatus();
                    String custodianStatus = securityDocList.getCheckListItemList()[i].getCustodianDocStatus();
        %>
         <% if (itemStatus!=null && (itemStatus.equals(ICMSConstant.STATE_ITEM_COMPLETED) ||
                 itemStatus.equals(ICMSConstant.STATE_ITEM_EXPIRED)) &&
                 custodianStatus != null && (custodianStatus.equals(ICMSConstant.STATE_LODGED) ||
                 custodianStatus.equals(ICMSConstant.STATE_TEMP_UPLIFTED))) {%>
        <tr class="<%=count%2==0?"odd":"even"%>">
           <td class="index" style="text-align:center" width="4%"><%=count + 1%></td>
          <td width="32%" ><integro:empty-if-null value="<%=securityDocList.getCheckListItemList()[i].getItemDesc()%>"/>&nbsp;</td>
          <td width="15%" >
          <% if(securityDocList.getCheckListItemList()[i].getCheckListItemRef()>0){ %>
             <integro:empty-if-null value="<%=(Long.toString(securityDocList.getCheckListItemList()[i].getCheckListItemRef()))%>"/>&nbsp;
          <%} else {%>
          -&nbsp;
          <%}%>
          </td>
          <td width="25%"><integro:empty-if-null value="<%=securityDocList.getCheckListItemList()[i].getItemCode()%>"/>&nbsp;</td>
          <td width="12%"><integro:empty-if-null value="<%=itemStatus%>"/>&nbsp;</td>
          <td width="12%"><integro:empty-if-null value="<%=custodianStatus%>"/>&nbsp;</td>
        </tr>
        <%      count++;
            }
        %>
        <%
                }
                }
            }
        %>
        </tbody>
      </table>
    </td>
  </tr>
</table>
<table width="83" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="83">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td style="text-align:center" width="83">&nbsp;</td>
  </tr>
</table>

</html:form>
</body>
<!-- InstanceEnd -->
</html>
