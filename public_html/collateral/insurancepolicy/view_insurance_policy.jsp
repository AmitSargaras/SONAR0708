<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.common.Constants,
				 com.integrosys.cms.ui.collateral.InsuranceTypeList,
				 com.integrosys.cms.ui.collateral.InsurerNameList,    
				 com.integrosys.cms.ui.collateral.insurancepolicy.InsurancePolicyForm,             
				 com.integrosys.cms.ui.collateral.CollateralAction"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insurancepolicy/view_insurance_policy.jsp,v 1.7 2006/10/27 08:34:44 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.7 $
* Date: $Date: 2006/10/27 08:34:44 $
* Tag: $Name:  $
*/
%>

<%
	String indexID = (String)request.getParameter("indexID");	
	InsurancePolicyForm aForm = (InsurancePolicyForm)request.getAttribute(formStr);	
	InsurerNameList insurerList = InsurerNameList.getInstance();
	InsuranceTypeList insuranceTypeList = InsuranceTypeList.getInstance();
	String le_id_bca_ref_num = (String)request.getAttribute("le_id_bca_ref_num");
	String actionDo = actionNameStr;
	
	String[] style = {"even", "odd"};
	int count = 0;
	
    String subtypeCode = (String)request.getAttribute("getSubtypeCode");
    
    HashMap insuranceCoverageMap = new HashMap(); 
	if(prefix.equals("Asset")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageMap");
	}
	else if(prefix.equals("Other")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageMap");
	}
	else if(prefix.equals("Property")){
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageMap");
	}
    
%>

<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>


<%@page import="java.util.HashMap"%>
<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
function returnPage() {
    document.forms[0].submit();
}
</script>

</head>

<body>
<html:form action="<%=actionNameStr%>">
<input type="hidden" name="event" value="<%=CollateralAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr> 
      <td width="81%" ><h3><bean:message key="label.view.insurance"/></h3></td>
      <td width="19%" align="right" valign="bottom" >&nbsp; </td>
    </tr>
    <tr> 
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      	  <tbody>
            <tr class="<%=style[count++%2] %>"> 
              <td class="fieldname">
              <bean:message key="label.insurance.policy.num"/>
			</span>&nbsp;</td>
              <td >
              	<bean:write name="<%=formStr%>" property="insPolicyNum"/>&nbsp;
              </td>
               <td  class="fieldname"><bean:message key="label.insurance.policy.cover.note"/></td>
              <td><bean:write name="<%=formStr%>" property="coverNoteNumber"/>&nbsp;</td>
            </tr>
            <tr class="<%=style[count++%2] %>"> 
              <td class="fieldname" width="20%"><bean:message key="label.insurer.name"/></span>&nbsp;<span class="mandatoryperfection">*</span></td>
              <td valign="top" width="30%">
              <integro:empty-if-null value="<%=insuranceCoverageMap.get(aForm.getInsurerName())%>"/> &nbsp;
              </td>
               <td class="fieldname"><bean:message key="label.insurance.policy.currency"/></td>
              <td><bean:write name="<%=formStr%>" property="insPolicyCurrency"/>&nbsp;
              </td>
            </tr>
            
             <tr class="<%=style[count++%2] %>">
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.type.perils1"/><span class="mandatoryPerfection"> * </span></td>
            	<td>
                <html:select property="typeOfPerils1" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.type.perils2"/></td>
                <td>
                <html:select property="typeOfPerils2" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
                
            </tr>
            
            <tr class="<%=style[count++%2] %>">
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.type.perils3"/></td>
            	<td>
                <html:select property="typeOfPerils3" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.type.perils4"/></td>
                <td>
                <html:select property="typeOfPerils4" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
            </tr>
                    
            <tr class="<%=style[count++%2] %>"> 
             
              <td class="fieldname"><bean:message key="label.insurable.amt"/><span class="mandatoryPerfection"> * </span></td>
              <td><bean:write name="<%=formStr%>" property="insurableAmt"/>&nbsp;
              </td>
              
               <td  class="fieldname"><bean:message key="label.insured.amt"/></span>&nbsp;<span class="mandatoryperfection">*</span></td>
              <td colspan="3"><bean:write name="<%=formStr%>" property="insuredAmt"/>&nbsp;
              </td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">
              <td height="21" class="fieldname"><bean:message key="label.insurance.received.date"/></span><span class="mandatoryPerfection"> * </span></td>
              <td><bean:write name="<%=formStr%>" property="receivedDate"/>&nbsp;
              </td>
            
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">
              <td height="21" class="fieldname"><bean:message key="label.insurance.effective.date"/></span>&nbsp;<span class="mandatoryperfection">*</span></td>
              <td><bean:write name="<%=formStr%>" property="effectiveDateIns"/>&nbsp;
              </td>
            
              <td class="fieldname"><bean:message key="label.insurance.expiry.date"/></span>&nbsp;<span class="mandatoryperfection">*</span></td>
              <td><bean:write name="<%=formStr%>" property="expiryDateIns"/>&nbsp;
              </td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.insurance.defaulted"/></td>
                <td>
					<integro:yesno-display value="<%=aForm.getNonSchemeScheme() %>" />
                </td>
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.premium"/></td>
                <td>
                    <bean:write name="<%=formStr%>" property="insurancePremium"/>&nbsp;
                </td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.remark1"/></td>
                <td colspan="3">
                    <bean:write name="<%=formStr%>" property="remark1"/>&nbsp;
                </td>
            </tr>
            <tr class="<%=style[count++%2] %>">
                <td height="21" class="fieldname"><bean:message key="label.insurance.policy.remark2"/></td>
                <td colspan="3">
                    <bean:write name="<%=formStr%>" property="remark2"/>&nbsp;
                </td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">
              <td height="21" class="fieldname"><bean:message key="label.insured.addr"/></td>
              <td colspan="3"><integro:wrapper value="<%=aForm.getInsuredAddress()%>" lineLength="150" />

              		&nbsp;
              </td>
            </tr>   
                     
            <tr  class="<%=style[count++%2] %>">
              <td height="21" class="fieldname"><bean:message key="label.insured.against"/></td>
              <td colspan="3"><integro:wrapper value="<%=aForm.getInsuredAgainst()%>" lineLength="150" />&nbsp;
              </td>
            </tr>
          </tbody>
        </table>
		</td>
	</tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    
    <tr>
    <td colspan="2" width="100" valign="baseline" align="center">
        <a href="<%=actionNameStr%>?event=<%=CollateralAction.EVENT_READ_RETURN%>&from_event=<%=request.getParameter("from_event")%>&subtype=<%=request.getParameter("subtype")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
    </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>
 
</body>	
</html>
