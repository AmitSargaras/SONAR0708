<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.CommDocAction,
                 com.integrosys.cms.app.checklist.bus.OBCheckList,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.checklist.bus.OBCheckListItem,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/view_security_doc.jsp,v 1.8 2006/10/27 08:38:53 hmbao Exp $
*
* Purpose: Read the data of the commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.8 $
* Date: $Date: 2006/10/27 08:38:53 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
    String event = "";
    if(from_event!=null)
    {
    if (from_event.equals(CommDocAction.EVENT_PROCESS)) {
        event = CommDocAction.EVENT_PROCESS_RETURN;
    } else if (from_event.equals(CommDocAction.EVENT_TRACK)) {
        event = CommDocAction.EVENT_TRACK_RETURN;        
    } else if (from_event.equals(CommDocAction.EVENT_PREPARE_UPDATE) ||
            from_event.equals(CommDocAction.EVENT_PREPARE_ADD_DEAL) ||
            from_event.equals(CommDocAction.EVENT_PROCESS_UPDATE)) {
        event = CommDocAction.EVENT_UPDATE_RETURN;
    } else if (from_event.equals(CommDocAction.EVENT_PREPARE_CLOSE) ||
            from_event.equals(CommDocAction.EVENT_PREPARE_CLOSE_DEAL)) {
        event = CommDocAction.EVENT_CLOSE_RETURN;
    } else {
        event = CommDocAction.EVENT_READ_RETURN;
    }
    }
  %>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


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

function returnPage() {
    document.forms[0].event.value="<%=event%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="CommodityDoc.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=CommDocAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="77%">
      <h3>Security Document List</h3>
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
          <td width="4%">S/N</td>
          <td width="32%">Document Description</td>
          <td width="15%">Doc No.</td>
          <td width="25%">Doc Code</td>
          <td width="12%">Doc Status</td>
          <td width="12%">Custodian Status</td>
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
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd -->
</html>
