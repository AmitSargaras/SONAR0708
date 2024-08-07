 <%--Formatted by jj --%>
<%@ page import="com.integrosys.base.businfra.contact.IAddress,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.common.Constants,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.IInsurancePolicy,
                 com.integrosys.cms.ui.collateral.insurancepolicy.InsurancePolicyForm,
                 com.integrosys.cms.ui.collateral.InsuranceTypeList,
                 com.integrosys.cms.ui.collateral.InsurerNameList,
                 com.integrosys.cms.ui.common.UIUtil,
                 org.apache.commons.lang.StringUtils,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CollateralAction" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insurancepolicy/chk_view_insurance_policy.jsp,v 1.7 2006/10/27 08:34:44 hmbao Exp $
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
    String indexID = (String) request.getParameter("indexID");

    InsurancePolicyForm aForm = (InsurancePolicyForm) request.getAttribute(formStr);
    IInsurancePolicy originOB = (IInsurancePolicy) request.getAttribute("actualInsurance");
    IInsurancePolicy stagingOB = (IInsurancePolicy) request.getAttribute("stageInsurance");

    String le_id_bca_ref_num = (String) request.getAttribute("le_id_bca_ref_num");
    
	String[] style = {"even", "odd"};
	int count = 0;
	
    String subtypeCode = (String)request.getAttribute("getSubtypeCode");
    
    HashMap insuranceCoverageMap = new HashMap();
    if(prefix.equals("Property"))
    {
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageMap");
    }
    else if(prefix.equals("Asset"))
    {
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageMap");
    }
    else if(prefix.equals("Others"))
    {
		insuranceCoverageMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageMap");
    }
		
    
%>

<%@page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>


<%@page import="java.util.HashMap"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/JavaScript">
     <!--
        function returnPage() {
            document.forms[0].submit();
        }
        //-->
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
            <td width="81%"><h3><bean:message key="label.security.insurance"/></h3></td>
            <td width="19%" align="right" valign="bottom">&nbsp; </td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>
   
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                	<tbody>
                    <tr class="<%=style[count++%2] %>">
                        <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "policyNo")?"fieldname":"fieldnamediff"%>">
                            
			              <bean:message key="label.insurance.policy.num"/>
						   </span>&nbsp;<span class="mandatoryperfection">*</span></td>
                        <td width="30%">
                           <bean:write name="<%=formStr%>" property="insPolicyNum"/>&nbsp;
                        </td>
                        <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "coverNoteNumber")?"fieldname":"fieldnamediff"%>">
                            <bean:message key="label.insurance.policy.cover.note"/> &nbsp;<span class="mandatoryperfection">*</span></td>
                        <td width="30%">
                           <bean:write name="<%=formStr%>" property="coverNoteNumber"/>&nbsp;
                        </td>
                    </tr>
                    <tr class="<%=style[count++%2] %>">
                        <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "insurerName")?"fieldname":"fieldnamediff"%>">
                             <bean:message key="label.insurer.name"/> &nbsp;<span class="mandatoryperfection">*</span></td>
                        <td valign="top">
                            <integro:empty-if-null value="<%=insuranceCoverageMap.get(aForm.getInsurerName())%>"/> &nbsp;
                        </td>
                        
                        <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "currencyCode")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.currency"/></td>
                        <td><bean:write name="<%=formStr%>" property="insPolicyCurrency"/>&nbsp;
                        </td>

                    </tr>
                    
                    <tr class="<%=style[count++%2] %>">
                
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "typeOfPerils1")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.type.perils1"/></td>
                <td>
                <html:select property="typeOfPerils1" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
                
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "typeOfPerils2")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.type.perils2"/></td>
                <td>
                <html:select property="typeOfPerils2" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
            </tr>
            <tr class="<%=style[count++%2] %>">
                
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "typeOfPerils3")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.type.perils3"/></td>
                <td>
                <html:select property="typeOfPerils3" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
                
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "typeOfPerils4")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.type.perils4"/></td>
                <td>
                <html:select property="typeOfPerils4" disabled="true">	
					<integro:common-code categoryCode="INSURANCE_COMPANY_CATEGORY" descWithCode="false" />
				</html:select>
                &nbsp;</td>
            </tr>
                    
                    <tr class="<%=style[count++%2] %>">
                        <%
                            Amount stagingAmt = (stagingOB == null) ? null : stagingOB.getInsurableAmount();
                            Amount actualAmt = (originOB == null) ? null : originOB.getInsurableAmount();
                        %>
                        <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>">
                        <bean:message key="label.insurable.amt"/> &nbsp;<span class="mandatoryperfection">*</span></td>
                        <td><bean:write name="<%=formStr%>" property="insurableAmt"/>&nbsp;
                        </td>
                        <%
                            stagingAmt = stagingOB == null ? null : stagingOB.getInsuredAmount();
                            actualAmt = originOB == null ? null : originOB.getInsuredAmount();
                        %>
                        <td class="<%=UIUtil.isAmountUnChanged(stagingAmt, actualAmt)?"fieldname":"fieldnamediff"%>"><bean:message key="label.insured.amt"/></span><span class="mandatoryperfection">*</span></td>
                        <td><bean:write name="<%=formStr%>" property="insuredAmt"/>&nbsp;
                        </td>
                    </tr>
                    
                    <tr class="<%=style[count++%2] %>">
                        <td height="21"
                            class="<%=CompareOBUtil.compOB(stagingOB,originOB, "receivedDate")?"fieldname":"fieldnamediff"%>">
                       		<bean:message key="label.insurance.received.date"/> &nbsp;</td>
                        <td><bean:write name="<%=formStr%>" property="receivedDate"/>&nbsp;
                        </td>
                        <td class="fieldname">
                          &nbsp;</td>
                        <td>
                          &nbsp;
                        </td>
                    </tr>
                    
                    <tr class="<%=style[count++%2] %>">
                        <td height="21"
                            class="<%=CompareOBUtil.compOB(stagingOB,originOB, "effectiveDate")?"fieldname":"fieldnamediff"%>">
                       		<bean:message key="label.insurance.effective.date"/> &nbsp;<span class="mandatoryperfection">*</span></td>
                        <td><bean:write name="<%=formStr%>" property="effectiveDateIns"/>&nbsp;
                        </td>
                        <td class="<%=CompareOBUtil.compOB(stagingOB,originOB, "expiryDate")?"fieldname":"fieldnamediff"%>">
                          <bean:message key="label.insurance.expiry.date"/> &nbsp;<span class="mandatoryperfection">*</span></td>
                        <td>
                          <bean:write name="<%=formStr%>" property="expiryDateIns"/>&nbsp;
                        </td>
                    </tr>
                    
            <tr class="<%=style[count++%2] %>">
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "nonSchemeScheme")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.nonschema.schema"/></td>
                <td>
                    <bean:write name="<%=formStr%>" property="nonSchemeScheme"/>&nbsp;
                </td>
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "insurancePremium")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.premium"/></td>
                <td>
                    <bean:write name="<%=formStr%>" property="insurancePremium"/>&nbsp;
                </td>
            </tr>
            
            <tr class="<%=style[count++%2] %>">
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "remark1")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.remark1"/></td>
                <td colspan="3">
                    <bean:write name="<%=formStr%>" property="remark1"/>&nbsp;
                </td>
            </tr>
            <tr class="<%=style[count++%2] %>">
                <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "remark2")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insurance.policy.remark2"/></td>
                <td colspan="3">
                    <bean:write name="<%=formStr%>" property="remark2"/>&nbsp;
                </td>
            </tr>
                    
                        <%
                            IAddress stageAdd = (stagingOB==null)?null:stagingOB.getAddress();
                            IAddress actualAdd = (originOB==null)?null:originOB.getAddress();
                        %>
                    <tr class="<%=style[count++%2] %>">
                        <td height="21"
                            class="<%=CompareOBUtil.compOB(stageAdd,actualAdd, "address")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insured.addr"/> </td>
                        <td colspan="3"><integro:wrapper value="<%=aForm.getInsuredAddress()%>" lineLength="150" />&nbsp;
                        		
                        </td>
                    </tr>
                    <tr class="<%=style[count++%2] %>">
                        <td height="21" class="<%=CompareOBUtil.compOB(stagingOB,originOB, "insuredAgainst")?"fieldname":"fieldnamediff"%>"><bean:message key="label.insured.against"/> </td>
                        <td  colspan="3"><integro:wrapper value="<%=aForm.getInsuredAgainst()%>" lineLength="150" />&nbsp;</td>
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
       <a onclick="javascript: returnPage();"   onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
       	<img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" />
       </a>
    </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
	<tr><td height="50">&nbsp;</td></tr>
</table>

</html:form>

</body>
</html>
