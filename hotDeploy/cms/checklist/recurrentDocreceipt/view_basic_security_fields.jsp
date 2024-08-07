<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="java.util.List,org.apache.struts.util.LabelValueBean,java.util.Iterator"%>
<%@ page import="java.util.ArrayList,com.integrosys.cms.app.systemBankBranch.bus.ISystemBankBranch"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>

<%
    int rowIdx = 0;
    ISystemBankBranch systemBankBranch = (ISystemBankBranch) request.getAttribute("systemBankBranch");
    LabelValueBean lvBean = null;
    String branchName = "-";
    String custodian1 = null;
    String custodian2 = null;
    String countryNme = "";
    countryNme = (String)request.getAttribute("countryNme");
      
    if(systemBankBranch!=null){
    branchName = systemBankBranch.getSystemBankBranchName();
    custodian1 = systemBankBranch.getCustodian1();
    custodian2 = systemBankBranch.getCustodian2();
    }
    HashMap orgMap = (HashMap)request.getAttribute("orgMap");
    
  
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.orgMap");

   
   if(orgMap!=null){
	pageContext.setAttribute("orgMap",orgMap);
	}
%>
<%
 String actionPackName1="";
 String actionPackName2="";
 String actionPackName3="";
 
	 actionPackName1 = "com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction"; 

	System.out.println("@@@@@@@@@@@###########7777777777777777777################");
 actionPackName3 =actionPackName1+".currencyList";
 List currencyList = (List)session.getAttribute(actionPackName3);
 actionPackName2 =actionPackName1+".listSystemBankBranch";
 //List listSystemBankBranch = (List)session.getAttribute(actionPackName2);
 pageContext.setAttribute("currencyList",currencyList);
// pageContext.setAttribute("listSystemBankBranch",listSystemBankBranch);
 %>

<%@page import="java.util.HashMap"%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="fieldname"><span >
		<bean:message key="label.cms.host.security.id"/> 
    	</span></td>
	<!--  <td width="30%" nowrap="nowrap">-->
	<td width="30%">
		<integro:empty-if-null value="<%= (itrxValue.getCollateral() == null || itrxValue.getCollateral().getCollateralID() == ICMSConstant.LONG_INVALID_VALUE) ? null : String.valueOf(itrxValue.getCollateral().getCollateralID())%>"/> 
<%--
      <% 
      	if (oldCollateral != null) {
      	List sourceSysNameList = oldCollateral.getSecSystemName();
          if (sourceSysNameList ==null){
              sourceSysNameList= new ArrayList();
          }
        for ( int j=0 ; j < sourceSysNameList.size() ; j++ ) {
            String  sourceSysName = (String) sourceSysNameList.get (j) ;
        %>
        <integro:empty-if-null value="<%=sourceSysName%>"/>&nbsp;<br>
        <% } }%> &nbsp;
--%>
	<td width="20%" class="fieldname">
	<bean:message key="label.security.backend.security.reference.note"/></td>
	<td width="30%"><integro:empty-if-null value="<%=iCol.getSCIReferenceNote()%>"/>&nbsp;
    </td>	

<%--Govind S: Commented as required for HDFC Dev 04/07/2011
	<td width="20%" class="fieldname"><span class=stp>
	<bean:message key="label.security.collateral.name"/></span>&nbsp;<span class="mandatory">*</span></td>
	<td width="30%"><integro:empty-if-null value="<%=iCol.getSCIReferenceNote()%>"/>&nbsp;
        <html:errors property="collateralName"/>
    </td>
--%>

</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
  	<td width="20%"  class="fieldname">
  		<bean:message key="label.security.type"/></td>
  	<td width="30%" ><integro:empty-if-null value="<%=iCol.getCollateralType().getTypeName()%>"/></td>
  	<td width="20%" class="fieldname">
  		<bean:message key="label.security.sub.type"/></td>
  	<td width="30%"><integro:empty-if-null value="<%=iCol.getCollateralSubType().getSubTypeName()%>"/></td>
</tr>       
                 
<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
  	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"sourceSecuritySubType")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp><bean:message key="label.security.backend.code.val"/></span><span class="mandatory">*</span></td>  
  	<td width="30%">
		integro:common-code categoryCode="<%= ICMSConstant.COMMON_CODE_SOURCE_CMS_SEC_TYPE_MAP%>" refEntryCode="<%= iCol.getSCISubTypeValue()%>" descWithCode="true" entryCode="<%=iCol.getSourceSecuritySubType() %>" display="true"/>
	<integro:empty-if-null value="<%= iCol.getCollateralCode()%>"/>
	</td>
	<td width="20%" class="fieldname">
              		<bean:message key="label.security.asset.priority"/></td>
              	<td width="30%" colspan="3">
              	<%if(iCol.getSecPriority()!=null){ %>
              	 <%=iCol.getSecPriority().equalsIgnoreCase("y")?"Primary":"Secondary"%>&nbsp;
              	 <%} else { %>
              	 -
              	 <%} %>
   </td>

</tr>
--%>
<%
	if (!ICMSConstant.COLTYPE_NOCOLLATERAL.equals(iCol.getCollateralSubType().getSubTypeCode())) {
%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
<%--Govind S: Commented as required by HDFC Dev 04/07/2011 
  	<td class="fieldname"><bean:message key="label.security.ori.currency"/> </td>
  	<td><integro:empty-if-null value="<%=iCol.getSCICurrencyCode()%>" />&nbsp;</td>
  	--%>
  	<td width="20%"class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"currencyCode")?"fieldname":"fieldnamediff"):"fieldname"%>">

     	<span > <bean:message key="label.security.currency"/>&nbsp;</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
 <td>
  <%String brCode = "";
	if(iCol.getCurrencyCode()!=null){
		brCode = iCol.getCurrencyCode().trim();
	}
	 %>
  <html:select property="collateralCurrency" value="<%=brCode.trim()%>" disabled="true" >
		      		 <option value="">Please Select </option>	
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                   </html:select>&nbsp;
		    	   <html:errors property="collateralCurrency" />
              </td><%--
  	<td width="30%" ><integro:empty-if-null value="<%=iCol.getCurrencyCode()%>" />&nbsp;</td>
--%><td width="20%" class="fieldname">
              		<bean:message key="label.security.asset.priority"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td width="30%" >
              	<%if(iCol.getSecPriority()!=null){ %>
              	 <%=iCol.getSecPriority().equalsIgnoreCase("y")?"Primary":"Secondary"%>&nbsp;
              	 <%} else { %>
              	 -
              	 <%} %>
   </td>
</tr>
<% } %>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralStatus")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp><bean:message key="label.security.collateral.status"/></span>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
	<td width="30%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.COLLATERAL_STATUS,iCol.getCollateralStatus())%>" />&nbsp;</td>
	<td width="20%" class="fieldname">&nbsp;</td>
    <td width="30%">&nbsp;</td>
</tr> 

--%><%	if (!ICMSConstant.COLTYPE_NOCOLLATERAL.equals(iCol.getCollateralSubType().getSubTypeCode()) 
	) { %>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
</tr>
<% } %>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.loc"/> </td>
	<td width="30%"><%--<integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getCollateralLocation())%>" />&nbsp; --%>
	<integro:empty-if-null value="<%=countryNme%>" />&nbsp;
	</td>
	
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.backend.code.name"/> </td>
	<td width="30%">
	<%String collCode = "";
	if(iCol.getCollateralCode()!=null){
	collCode = iCol.getCollateralCode();
	}
	 
	 %>
	 
	<html:select property="collateralCode"  value="<%=collCode%>" disabled="true">
		      <option value="">Please Select </option>	
                      <html:options collection="collateralList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="collateralCode" />	
	</td>

</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"securityOrganization")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<%if(prefix.equals("Property")){ %>
		<span ><bean:message key="label.branch.name"/>&nbsp;<span class="mandatoryPerfection">*</span></span>
		<%}else{ %>
		<span ><bean:message key="label.branch.name"/></span>
		<%} %>
		</td>
	<td colspan="3">
		<%if(iCol.getSecurityOrganization()!=null && orgMap != null){ %>
		<integro:empty-if-null value="<%=orgMap.get(iCol.getSecurityOrganization())%>" />&nbsp;(<integro:empty-if-null value="<%=iCol.getSecurityOrganization()%>" />)

		<%}else{%>-<%} %>
		&nbsp; </td>
</tr> 

