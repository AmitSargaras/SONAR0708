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
 actionPackName2 =actionPackName1+".listSystemBankBranch";
 
  List collateralList = (List)session.getAttribute(actionPackName1+".collateralList");
 pageContext.setAttribute("currencyList",currencyList);
 pageContext.setAttribute("collateralList",collateralList);
 
 %>
<%
String monitorProcess="";

if(propertyValuation2.getMonitorProcess()!=null && !propertyValuation2.getMonitorProcess().equals("")){	
	if(propertyValuation2.getMonitorProcess().equals("Y")){	
		monitorProcess="Yes";
	}else if(propertyValuation2.getMonitorProcess().equals("N")){		
		monitorProcess="No";
	}
	
}

%>
<%@page import="java.util.HashMap"%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="fieldname"><span >
		<bean:message key="label.cms.host.security.id"/> 
    	</span></td>
	<td width="30%">
		<integro:empty-if-null value="<%= ((propertyValuation2.getCollateralId() == ICMSConstant.LONG_INVALID_VALUE ) ? null : String.valueOf(propertyValuation2.getCollateralId()))%>"/> 
	<td width="20%" class="fieldname">
	<bean:message key="label.security.backend.security.reference.note"/></td>
	<td width="30%"><integro:empty-if-null value="<%=propertyValuation2.getSciRefNote()%>"/>&nbsp;
    </td>	
</tr>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
  	<td width="20%"  class="fieldname">
  		<bean:message key="label.security.type"/></td>
  	<td width="30%" ><integro:empty-if-null value="<%=propertyValuation2.getTypeName()%>"/></td>
  	<td width="20%" class="fieldname">
  		<bean:message key="label.security.sub.type"/></td>
  	<td width="30%"><integro:empty-if-null value="<%=propertyValuation2.getSubTypeName()%>"/></td>
</tr>       
<%
	if (!ICMSConstant.COLTYPE_NOCOLLATERAL.equals(propertyValuation2.getSubTypeName())) {
%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
  	<td width="20%"class="fieldname">

     	<span > <bean:message key="label.security.currency"/>&nbsp;</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
 <td>
  <%String brCode = "";
	if(propertyValuation2.getSecurityCurrency()!=null){
		brCode = propertyValuation2.getSecurityCurrency().trim();
	}
	 %>
  <html:select property="collateralCurrency" value="<%=brCode.trim()%>" disabled="true" >
		      		 <option value="">Please Select </option>	
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                   </html:select>&nbsp;
		    	   <html:errors property="collateralCurrency" />
              </td>
              <td width="20%" class="fieldname">
              		<bean:message key="label.security.asset.priority"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td width="30%" >
              	<%if(propertyValuation2.getSecPriority()!=null){ %>
              	 <%=propertyValuation2.getSecPriority().equalsIgnoreCase("y")?"Primary":"Secondary"%>&nbsp;
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
<%if(propertyValuation2.getMonitorFrequency()!=null && !propertyValuation2.getMonitorFrequency().equals("")){ %>
            <td><integro:common-code-single entryCode="<%=propertyValuation2.getMonitorFrequency()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
            <%}else{ %>
             <td>-</td>
            <%} %>
</tr>
<% } %>
<%	if (!ICMSConstant.COLTYPE_NOCOLLATERAL.equals(propertyValuation2.getSubTypeName()) 
	) { %>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<%@ include file="/collateral/common/commonSecurityCustPrevVal2.jsp" %>
</tr>
<% } %>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname">
		<bean:message key="label.security.loc"/> </td>
	<td width="30%"><%--<integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(propertyValuation2.getCollateralLocation())%>" />&nbsp; --%>
	<integro:empty-if-null value="<%=countryNme%>" />&nbsp;
	</td>
	
	<td class="fieldname">
		<bean:message key="label.security.backend.code.name"/> </td>
	<td width="30%">
	<%String collCode = "";
	System.out.println("propertyValuation2.getCollateralCode():"+propertyValuation2.getCollateralCode());
	if(propertyValuation2.getCollateralCode()!=null){
	collCode = propertyValuation2.getCollateralCode();
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
	<td width="20%" class="fieldname">
		<%if(prefix.equals("Property")){ %>
		<span ><bean:message key="label.branch.name"/>&nbsp;<span class="mandatoryPerfection">*</span></span>
		<%}else{ %>
		<span ><bean:message key="label.branch.name"/></span>
		<%} %>
		</td>
	<td >
		<%if(propertyValuation2.getSecOrganization()!=null && orgMap != null){ %>
		<integro:empty-if-null value="<%=orgMap.get(propertyValuation2.getSecOrganization())%>" />&nbsp;(<integro:empty-if-null value="<%=propertyValuation2.getSecOrganization()%>" />)

		<%}else{%>-<%} %>
		&nbsp; </td>
		
		
		<%	if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(propertyValuation2.getSubTypeName())) { %>

	<td class="fieldname">Type of Charge<font color="#FF0000">*
	</font>
	</td>
    
    	<td>
            <html:select property ="typeOfCharge" styleId="typeOfCharge" value ="<%=propertyValuation2.getChangeType()%>" disabled="true">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_TYPE_CHARGE%>" descWithCode="false" />
			</html:select>
			<html:errors property="typeOfCharge" />
	</td> 
		<% } %>
</tr> 

