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
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant, 
				 com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function addNew() {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=prepare_create_type_item";
    document.forms[0].submit();
}
function editCodeId(transactionId) {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=maker_edit_common_code_type_read&transactionId=" + transactionId;
    document.forms[0].submit();
}
function submitPage() {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=maker_edit_common_code_type";
    document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action="MaintainCommonCodeTypes.do?event=maker_cncl_reject_edit";
    document.forms[0].submit();
}
-->
</script>

<!-- InstanceEndEditable -->

</head>
<%
    int sno = 0;
	
	boolean canEdit = true;	
	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long oneTeamMshipID = Long.parseLong(teamTypeMemID);
	
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER||oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH) {	
      canEdit = false;
    }
	
%>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="MaintainCommonCodeTypes.do?">

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><%=(canEdit)?"Maintain":"View"%> Common Code Types</h3></td>
      
      <td align="right" valign="bottom">&nbsp;
           <!-- <input type="button" name="Submit" value="Add New" class="btnNormal" onClick="addNew()"/> -->
        </td>
        
    </tr>
    <tr>
      <td colspan="2"><hr />
      </td>
    </tr>    
   </thead>
   <tbody>

    <tr>
      <td colspan="2">

      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="10%">S/N</td>
              <td width="50%">Common Code Type Description</td>
              <td width="30%">Common Code Type Value</td>
			  <% if( canEdit ) {%>
              <td width="10%">Action</td>
			   <% } %>
            </tr>
          </thead>
              <tbody>

<logic:present name="commonCategoryList">
   <logic:iterate id="OB" name="commonCategoryList"  type="com.integrosys.cms.app.commoncode.bus.CommonCodeTypeSearchResultItem" >
                                <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }
                                %>

                            <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <td><bean:write property="commonCategoryName" name="OB"/> </td>
                          <td><bean:write property="commonCategoryCode" name="OB"/> </td>
						  <% if( canEdit ) {%>
                          <td align="center">&nbsp;

							<% if( ICMSConstant.STATE_ACTIVE.equals(OB.getTrxStatus())) {%>
                            <select name="menu1" onchange="editCodeId('<%=OB.getTrxID()%>')">
                                <option value="0" selected>Please Select</option>
                                <option value="edit">Edit</option>
                            </select>
                            <% }
                               else
                            	  out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-");
                              
                            %>

<%--                            <% if(ICMSConstant.STATE_ACTIVE.equals(OB.getTrxStatus())) {%>--%>
<%--                            <input type=button name=Edit value=Edit onclick="editCodeId('<%=OB.getTrxID()%>')">--%>
<%--                             <% }%>--%>
                          </td>
						  <% } %>
                        </tr>
</logic:iterate>
</logic:present>
              </tbody>
         </table>
        </td>
       </tr>
    </tbody>
  </table>

<br>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
