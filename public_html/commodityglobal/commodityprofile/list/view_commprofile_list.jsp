<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.list.CommProfileListAction,
                 com.integrosys.cms.app.commodity.main.trx.profile.IProfileTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfHelper"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityprofile/list/view_commprofile_list.jsp,v 1.9 2006/10/27 08:41:29 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.9 $
    * Date: $Date: 2006/10/27 08:41:29 $
    * Tag: $Name:  $
    */
%>
<%
    String from_event = request.getParameter("event");
    if (request.getParameter("from_event") != null &&
            request.getParameter("from_event").length() > 0) {
        from_event = request.getParameter("from_event");
    }
    String event = request.getParameter("event");
    IProfileTrxValue trxValue  = (IProfileTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityprofile.CommProfileAction.commProfileTrxValue");
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


function submitPage() {
  	document.forms[0].event.value="close";

    document.forms[0].submit();
}

function viewItem(index) {
    document.forms[0].event.value = "view";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}
//-->
</script>

<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommProfileList.do">
<input type="hidden" name="event" value="<%=CommProfileListAction.EVENT_CLOSE%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Commodity Profile Summary</h3></td>
      <td width="42%" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
                <td width="4%">S/N</td>
                <td width="23%"><bean:message key="label.cmdt.profile.cmdt.sub.type"/></td>
                <td width="23%"><bean:message key="label.cmdt.profile.cmdt.prd.type"/></td>
                <td width="15%"><bean:message key="label.cmdt.profile.cmdt.pri.type"/></td>
                <td width="15%"><bean:message key="label.cmdt.profile.cmdt.ric.code"/></td>
                <td width="23%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/></td>
                <td width="12%">Action</td>
            </tr>
          </thead>
          <tbody>
<%
    IProfile[] profileList = null;
    if (from_event.equals(CommProfileListAction.EVENT_READ)) {
        profileList = trxValue.getProfile();
    } else {
        profileList = trxValue.getStagingProfile();
    }
    if (profileList == null || profileList.length == 0) {
%>
<%
    } else {
        for (int i = 0; i < profileList.length; i++) {
        IProfile profile = profileList[i];
        String priceType =  CMDTProfHelper.getPriceTypeDesc(profile.getPriceType());
%>
            <tr class="<%=i%2==0?"odd":"even"%>">
              <td class="index" width="4%"><%=i + 1%></td>
              <td width="23%"><integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommCategoryItem(profile.getCategory())%>"/></td>
              <td width="23%"><integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(profile.getCategory(), profile.getProductType())%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=priceType%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=profile.getReuterSymbol()%>"/></td>
              <td width="23%"><integro:empty-if-null value="<%=profile.getProductSubType()%>"/></td>
              <td width="12%"><a href="javascript:viewItem(<%=String.valueOf(i)%>)">View</a></td>
            </tr>
<%
        }
    }
%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (event.equals(CommProfileListAction.EVENT_PRE_CLOSE) ||
              event.equals(CommProfileListAction.EVENT_CLOSE_RETURN)) {
  %>
        <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } else if (event.equals(CommProfileListAction.EVENT_TO_TRACK) ||
          event.equals(CommProfileListAction.EVENT_TRACK_RETURN)) { %>
  <td colspan="2"><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
  <% } %>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
