<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.list.CommProfileListAction,
                 com.integrosys.cms.app.commodity.main.trx.profile.IProfileTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.commodityglobal.commodityprofile.CMDTProfHelper,
                 java.util.HashMap,
                 java.util.Collection,
                 java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/commodityprofile/list/update_commprofile_list.jsp,v 1.10 2006/10/05 06:11:47 nkumar Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: nkumar $<br>
    * @version $Revision: 1.10 $
    * Date: $Date: 2006/10/05 06:11:47 $
    * Tag: $Name:  $
    */
%>
<%
    IProfileTrxValue trxValue  = (IProfileTrxValue) session.getAttribute("com.integrosys.cms.ui.commodityglobal.commodityprofile.CommProfileAction.commProfileTrxValue");	
%>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage(num) {
    if (num == '1') {
        document.forms[0].event.value = "submit";
    }

    if (num == '2') {
        document.forms[0].event.value = "update";
    }

    if (num == '3') {
        document.forms[0].event.value = "prepare_add";
        document.forms[0].indexID.value = "-1";
    }

    if (num == '4') {
        var delObj = document.forms[0].chkDeletes;
        var valid = false;
        if(delObj!=null){
	        if (!delObj.length) {
	            valid = delObj.checked;
	        } else {
	            for (i = 0; i < delObj.length; i++) {
	                if (delObj[i].checked) {
	                    valid = true;
	                }
	            }
	        }
        }
        else{
           alert('At least one commodity profile must be checked');
            return false;
        }
        if (!valid) {
            alert('At least one commodity profile must be checked');
            return false;
        }

        document.forms[0].event.value = "delete";
    }

    document.forms[0].submit();
}

function editItem(index, itemStatus) {
    document.forms[0].event.value = "edit_item";
    document.forms[0].indexID.value = index;
    document.forms[0].isNewItem.value = itemStatus;
    
    document.forms[0].submit();
}
//-->
</script>

<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif','img/save2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="CommProfileList.do">
<input type="hidden" name="event" value="<%=CommProfileListAction.EVENT_SUBMIT%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="isNewItem"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Maintain Commodity Profile</h3></td>
      <td valign="bottom"><html:errors property="profileList"/></td>
      <td width="42%" valign="bottom">
          <table width="160"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="80" valign="baseline" align="center">
                <input name="Submit2" type="button" class="btnNormal" value="Add New" onclick="javascript:submitPage(3)"/>
            </td>
            <td width="80" valign="baseline" align="center">
                <input name="Submit2" type="button" class="btnNormal" value="Delete" onclick="javascript:submitPage(4)"/>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="3"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
                <td width="4%">S/N</td>                
                <td width="15%"><bean:message key="label.cmdt.profile.cmdt.sub.type"/></td>
                <td width="15%"><bean:message key="label.cmdt.profile.cmdt.prd.type"/></td>
                <td width="15%"><bean:message key="label.cmdt.profile.cmdt.pri.type"/></td>
                <td width="15%"><bean:message key="label.cmdt.profile.cmdt.ric.code"/></td>
                <td width="15%"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/></td>
                <td width="13%">Action</td>
                <td width="8%">Delete</td>
            </tr>
          </thead>
          <tbody>
          <%
              Collection profileCol = new ArrayList();
              if (trxValue.getProfile() != null) {
                  IProfile[] tmpList = trxValue.getProfile();
                  for (int i = 0; i < tmpList.length; i++) {
                      profileCol.add(String.valueOf(tmpList[i].getCommonRef()));
                  }
              }

              IProfile[] profileList = trxValue.getStagingProfile();
              if (profileList == null || profileList.length == 0) {
          %>
              <tr class="odd">
              <td colspan="8">There is no Commodity Profile.</td>
              </tr>
          <%
              } else {
                  for (int i = 0; i < profileList.length; i++ ) {
                      IProfile profile = profileList[i];
                      String priceType = CMDTProfHelper.getPriceTypeDesc(profile.getPriceType());
                      boolean isNew = (profile.getProfileID() <= 0 || !profileCol.contains(String.valueOf(profile.getCommonRef())));
          %>
            <tr class="<%=i%2==0?"odd":"even"%>">
              <td class="index" width="4%"><%=i + 1%></td>
              <td width="15%"><integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommCategoryItem(profile.getCategory())%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(profile.getCategory(), profile.getProductType())%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=priceType%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=profile.getReuterSymbol()%>"/></td>
              <td width="15%"><integro:empty-if-null value="<%=profile.getProductSubType()%>"/></td>
              <td width="13%"><a href="javascript:editItem(<%=i%>, '<%=isNew%>')">View/Edit</a></td>
              <td width="8%" style="text-align:center">
              <%
                      if (isNew) {
              %>
                <html:multibox property="chkDeletes" value="<%=String.valueOf(i)%>"/>
              <% } %>&nbsp;
              </td>
            </tr>
            <%
                  }
              }
            %>
          </tbody>
        </table></td>
    </tr>
    <tr><td colspan="3">&nbsp;</td></tr>
  </tbody>
</table>
<% if (trxValue != null && trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr>
        <td class="fieldname" width="39%">Remarks</td>
        <td class="odd" width="61%"><html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="remarks"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">Last Action By</td>
        <td class="even"><%=trxValue!=null?trxValue.getUserInfo():""%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="fieldname">Last Remarks Made</td>
        <td><% if (trxValue != null) { %>
            <integro:wrapper value="<%=trxValue.getRemarks()%>"/>
            <% } %>&nbsp;
       </td>
    </tr>
    </tbody>
</table>
<% } %>
<%
    String colspan = "2";
    if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
            trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
        colspan = "3";
    }
%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="<%=colspan%>">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image41" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','img/save2.gif',1)"><img src="img/save1.gif" name="Image31" border="0" id="Image3" /></a></td>
    <%
        if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
    %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } %>
  </tr>
  <tr>
    <td colspan="<%=colspan%>">&nbsp;</td>
  </tr>
</table>
</html:form>
