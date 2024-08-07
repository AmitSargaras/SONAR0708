<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
                 com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeForm,
                 com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.component.commondata.app.Constants"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    OBCommonCodeTypeTrxValue trxVal = (OBCommonCodeTypeTrxValue)session.getAttribute("com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeAction.OBCommonCodeTypeTrxValue");
	String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    OBCommonCodeType stageOb = (OBCommonCodeType)trxVal.getStagingCommonCodeType();
    OBCommonCodeType ob = (OBCommonCodeType)trxVal.getCommonCodeType();
    MaintainCommonCodeTypeForm aForm = (MaintainCommonCodeTypeForm)request.getAttribute("MaintainCommonCodeTypeForm");
    boolean isCategoryCodePresent = false;
    if(aForm!=null){
        String categoryCode = aForm.getCategoryCode();
        if(categoryCode!=null && categoryCode.length() >0){
            isCategoryCodePresent = true;
        }
    }

%>





<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="checker_approve_edit";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="checker_reject_edit";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="MaintainCommonCodeTypes.do">
<input type="hidden" name="event" />
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Maintain Common Code Type - View</h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
          <% if(isCategoryCodePresent) { %>
            <tr class="even">
              <td class="fieldname">Common Code Type Value</td>
              <td>&nbsp;<bean:write name="MaintainCommonCodeTypeForm" scope="request" property="categoryCode" /></td>
            </tr>
            <% } %>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"commonCategoryName")? "fieldname":"fieldnamediff"%>" >Common Code Type Description&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="MaintainCommonCodeTypeForm" scope="request" property="categoryName" /></td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"activeStatus")? "fieldname":"fieldnamediff"%>" >Active</td>
              <td>
                   <%
                   String statusDescription = "Inactive";
                   if (aForm.getCategoryStatus() != null && Constants.STATUS_ACTIVE.equals(aForm.getCategoryStatus()))
                   {
                        statusDescription = "Active";
                   }
                   out.print(statusDescription);
                   %>
                    </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<p/>
<p/>
<p/>
				<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="80"></textarea></td>
					</tr>
					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>

<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
