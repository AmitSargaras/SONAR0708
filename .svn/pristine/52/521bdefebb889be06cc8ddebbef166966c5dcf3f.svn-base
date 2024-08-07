<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="java.util.List,org.apache.struts.util.LabelValueBean,java.util.Iterator"%>
<%@ page import="java.util.ArrayList,com.integrosys.cms.app.systemBankBranch.bus.ISystemBankBranch"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm"%>

<%
	AssetGenChargeForm form = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
	pageContext.setAttribute("AssetGenChargeForm", form);
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
    
    if(prefix.equals("Other"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.orgMap");
	}
	else if(prefix.equals("Asset"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.orgMap"); 
	}
	else if(prefix.equals("Ins"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.orgMap"); 
	}
	else if(prefix.equals("Mark"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.orgMap"); 
	}
	else if(prefix.equals("Cash"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.orgMap"); 
	}
	else if(prefix.equals("Gte"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.orgMap"); 
	}
	else if(prefix.equals("NoCollateral"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.orgMap"); 
	}
	else if(prefix.equals("Property"))
	{
		  orgMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.orgMap"); 
	}
   
   if(orgMap!=null){
	pageContext.setAttribute("orgMap",orgMap);
	}
%>
<%
 String actionPackName1="";
 String actionPackName2="";
 String actionPackName3="";
 if(prefix.equals("Other"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.others.OthersAction";
 }else if(prefix.equals("Asset"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"; 
 }else if(prefix.equals("Ins"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction"; 
 }else if(prefix.equals("Mark"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"; 
 }
 else if(prefix.equals("Cash"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.cash.CashAction"; 
 }
 else if(prefix.equals("Gte"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction"; 
 }
 else if(prefix.equals("NoCollateral"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction"; 
 }
 else if(prefix.equals("Property"))
 {
	 actionPackName1 = "com.integrosys.cms.ui.collateral.property.PropertyAction"; 
 }
 actionPackName3 =actionPackName1+".currencyList";
 List currencyList = (List)session.getAttribute(actionPackName3);
 /* System.out.println("~~~~~~~~~~currencyList~~~~~~~~~~"+currencyList); */

 if(currencyList==null){
	 currencyList= new ArrayList();
 }
 
 actionPackName2 =actionPackName1+".listSystemBankBranch";
 //List listSystemBankBranch = (List)session.getAttribute(actionPackName2);
 pageContext.setAttribute("currencyList",currencyList);
// pageContext.setAttribute("listSystemBankBranch",listSystemBankBranch);
 %>
<%
String monitorProcess="";

if(iCol.getMonitorProcess()!=null && !iCol.getMonitorProcess().equals("")){	
	if(iCol.getMonitorProcess().equals("Y")){	
		monitorProcess="Yes";
	}else if(iCol.getMonitorProcess().equals("N")){		
		monitorProcess="No";
	}
	
}

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
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
<td class="fieldname">Monitoring Process of Collaterals <font color="#FF0000">*</font></td>
<%if(monitorProcess!=null && !monitorProcess.equals("")){ %>
<td><%=monitorProcess%></td>
<%}else{ %>
<td>-</td>
<%}%>
<td class="fieldname">Monitoring Frequency of Collaterals <font color="#FF0000">*</font></td>
<%if(iCol.getMonitorFrequency()!=null && !iCol.getMonitorFrequency().equals("")){ %>
            <td><integro:common-code-single entryCode="<%=iCol.getMonitorFrequency()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
            <%}else{ %>
             <td>-</td>
            <%} %>
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
	<%@ include file="/collateral/common/common_security_custodian_read.jsp" %>
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
	<td >
		<%if(iCol.getSecurityOrganization()!=null && orgMap != null){ %>
		<integro:empty-if-null value="<%=orgMap.get(iCol.getSecurityOrganization())%>" />&nbsp;(<integro:empty-if-null value="<%=iCol.getSecurityOrganization()%>" />)

		<%}else{%>-<%} %>
		&nbsp; </td>
		
		
		<%	if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(iCol.getCollateralSubType().getSubTypeCode())) { %>

	<td class="fieldname">Type of Charge<font color="#FF0000">*
	</font>
	</td>
    
    	<td>
            <html:select property ="typeOfCharge" styleId="typeOfCharge" value ="<%=iCol.getTypeOfCharge()%>" disabled="true">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_TYPE_CHARGE%>" descWithCode="false" />
			</html:select>
			<html:errors property="typeOfCharge" />
	</td> 
		<% } %>
</tr> 
<%	if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(iCol.getCollateralSubType().getSubTypeCode())) { %>
<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
	<td class="<%=isProcess
		? (CompareOBUtil.compOB(newCollateral, oldCollateral, "bankingArrangement") ? "fieldname" : "fieldnamediff")
		: "fieldname"%>">Banking Arrangement<font color="#FF0000">*</font>
	</td>
	<td><bean:write name="AssetGenChargeForm" property="bankingArrangement" /></td>
	<td class="fieldname"></td>
	<td></td>
</tr>
<%
	}
%>

