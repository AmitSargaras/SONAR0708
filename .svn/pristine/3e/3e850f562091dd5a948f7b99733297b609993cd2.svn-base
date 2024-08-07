<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.component.commondata.app.Constants,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeForm,
                 com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
                 com.integrosys.cms.app.commoncode.bus.ICommonCodeTypeGroup,
                 com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
                 com.integrosys.cms.app.commoncode.bus.OBCommonCodeTypeGroup,
                 com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<%

    String remarks= "";
    String lastActionBy= "";
    String status= "";
    String event= "";

    OBCommonCodeTypeTrxValue trxVal = (OBCommonCodeTypeTrxValue)session.getAttribute("com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeAction.OBCommonCodeTypeTrxValue");
    if (trxVal == null)
    {
    }
    else
    {
        remarks = trxVal.getRemarks();
        lastActionBy = trxVal.getUserInfo();
        if(lastActionBy==null) lastActionBy = "";
        if (remarks==null) remarks= "";

        status = trxVal.getStatus();
        event = "maker_edit_common_code_type";
        if(ICMSConstant.STATE_REJECTED.equals(status)){
            event = "maker_edit_reject_edit";
        }
    }


    MaintainCommonCodeTypeForm aForm = (MaintainCommonCodeTypeForm)request.getAttribute("MaintainCommonCodeTypeForm");
    if (aForm!= null && Constants.STATUS_ACTIVE.equals(aForm.getCategoryStatus()))
    {
        aForm.setCategoryStatus("on");
    }
    boolean showCategoryCode = true;
    if(aForm.getCategoryCode()==null || aForm.getCategoryCode().trim().length() < 1){
        if(trxVal!=null && trxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)){
            showCategoryCode = false;
        }
   } 


%>


<script language="JavaScript" type="text/JavaScript">

function submitPage() {
    checkStatus();
    document.forms[0].action="MaintainCommonCodeTypes.do?event=<%=event%>";
    document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=maker_cncl_reject_edit";
    document.forms[0].submit();
}

function checkStatus()
{
    if (document.forms[0].categoryStatus.checked)
    {
        document.forms[0].categoryStatus.value = "<%=Constants.STATUS_ACTIVE%>";
    }
    else
    {
        document.forms[0].categoryStatus.value = "<%=Constants.STATUS_INACTIVE%>";
    }
}
</script>

<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->

<html:form action="MaintainCommonCodeTypes.do?">
<input type="hidden" name="event" />
<input type="hidden" name="transactionId" value="<%=request.getParameter("transactionId")%>" />
<html:hidden property="categoryId" />
<html:hidden property="categoryCode" />
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Edit Common Code Type</h3></td>
    </tr>
    <tr>
      <td colspan="2"><hr />
      </td>
    </tr>
   </thead>
  <tbody>
    <tr>
      <td> <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
                <%if(showCategoryCode) { %>
            <tr class="even">
              <td class="fieldname">Common Code Type</td>
              <td>
                <bean:write name="MaintainCommonCodeTypeForm" scope="request" property="categoryCode" />
              </td>
            </tr>
                <% } %>
            <tr class="odd">
              <td class="fieldname">Common Code Type Description&nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="categoryName" size="80" maxlength="255" /><html:errors property="categoryName" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Active</td>
              <td>
                <html:checkbox name="MaintainCommonCodeTypeForm"  property="categoryStatus" onclick="checkStatus();"/>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%if(ICMSConstant.STATE_REJECTED.equals(status)) { %>
<p/>
<p/>
<p/>
				<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr class="odd">
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="80"></textarea></td>
					</tr>
					<tr class="even">
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>

<% } %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>

    <td width="100" valign="baseline" align="center"> <a href="#"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                        <td width="100" valign="baseline" align="center">
                        <%if(ICMSConstant.STATE_REJECTED.equals(status)) { %>
                        <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        <% } else {%>
                        <a href="MaintainCommonCodeTypes.do?event=maker_list_common_code_type" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        <% } %>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
