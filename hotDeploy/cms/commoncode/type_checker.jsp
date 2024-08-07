<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.Collections,
                 java.util.Collection,
                 java.util.Arrays,
                 java.util.Comparator,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
                 com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
                 com.integrosys.component.commondata.app.Constants"%>
<%
    String event = request.getParameter("event");
    com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeForm aForm = (com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeForm) request.getAttribute("MaintainCommonCodeTypeForm");
    DefaultLogger.debug("type_checker.jsp","event from getParameter is > "+event);

    String approveEvent=null;
    String rejectEvent=null;
    String cancelEvent="checker_view";

    if(event.equals("checker_add_read")){
        approveEvent="checker_approve_add";
        rejectEvent="checker_reject_add";
    }else if(event.equals("checker_edit_read")){
        approveEvent="checker_approve_edit";
        rejectEvent="checker_reject_edit";
    }
    OBCommonCodeTypeTrxValue obCommonCodeTypeTrxValue = (OBCommonCodeTypeTrxValue)session.getAttribute("com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeAction.OBCommonCodeTypeTrxValue");
    ICommonCodeType iCommonCodeType = obCommonCodeTypeTrxValue.getCommonCodeType();
    ICommonCodeType stageCommonCodeType = obCommonCodeTypeTrxValue.getStagingCommonCodeType();

%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

function approvePage() {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=<%=approveEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    //document.forms[0].action="MaintainCommonCodeTypes.do?event=<%=cancelEvent%>";
    //document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=maker_cncl_reject_edit";
    document.forms[0].submit();
}

</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="MaintainCommonCodeTypes.do?" >

<body>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><%=event.equals("to_track")?"View":"Process"%> Common Code Type</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
            <tbody>
            <tr class="even">
              <td class="fieldname">Common Code Type Value</td>
              <td>&nbsp;<bean:write name="MaintainCommonCodeTypeForm" scope="request" property="categoryCode" /></td>
            </tr>
            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stageCommonCodeType,iCommonCodeType,"commonCategoryName")? "fieldname":"fieldnamediff"%>" >Common Code Type Description&nbsp;<font color="#0000FF">* </font></td>
              <td><bean:write name="MaintainCommonCodeTypeForm" scope="request" property="categoryName" /></td>
            </tr>
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stageCommonCodeType,iCommonCodeType,"activeStatus")? "fieldname":"fieldnamediff"%>" >Active</td>
              <td>

                   <%
                   String statusDescription = "Inactive";
                   if (aForm.getCategoryStatus() != null && Constants.STATUS_ACTIVE.equals(aForm.getCategoryStatus()))
                   {
                        statusDescription = "Active";
                   }
                   out.print(statusDescription);
                   %>
<%--                    <bean:write name="MaintainCommonCodeTypeForm" scope="request" property="categoryStatus" /> --%>
                </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
	<% if(!event.equals("to_track")) {%>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr>
              <td class="fieldname">Remarks</td>
              <td class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
            </tr>
            <tr>
              <td class="fieldname">Last Action By</td>
              <td class="even"><%=((OBCommonCodeTypeTrxValue)obCommonCodeTypeTrxValue).getUserInfo()%>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Last Remarks Made</td>
              <td><integro:wrapper value="<%=obCommonCodeTypeTrxValue.getRemarks()%>"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
	<% } %>
  </thead>
  <tbody>
  </tbody>
</table>
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>
   <%if((event!=null) && !(event.equals("to_track"))){%>
    <%if(obCommonCodeTypeTrxValue.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)){%>
    <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:history.go(-1);" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%}else{%>
        <td>&nbsp;</td>

         <td><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="100" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
         <%}%>
   <%}else {%>
             <td width="100" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
             <td>&nbsp;</td>
        <%}%>
       <td>&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->

</html:form>

</body>
<!-- InstanceEnd --></html>
