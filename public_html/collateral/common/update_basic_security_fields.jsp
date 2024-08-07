<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page import="com.integrosys.cms.ui.common.CountryList"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="org.apache.commons.lang.StringUtils,com.integrosys.cms.app.systemBankBranch.bus.ISystemBankBranch" %>
<%
System.out.println("***********************************subtype "+subtype);
 %>
<%
	String actionName = "";
	String actionPathName = "";
	if(prefix.equals("Other"))
	{
		 actionName = "/cms/OthersaCollateral.do?event=refresh_branch_detail&branchCode="; 
		 actionPathName = "OthersaCollateral.do";
	}
	else if(prefix.equals("Asset"))
	{
		if(subtype.equals("AssetSpecVehicles"))
		{
			actionName = "/cms/AssetSpecVehiclesCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "AssetSpecVehiclesCollateral.do";
		}
		else if(subtype.equals("AssetSpecPlant"))
		{
			actionName = "/cms/AssetSpecPlantCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "AssetSpecPlantCollateral.do";
		}
		else if(subtype.equals("AssetSpecGold"))
		{
			actionName = "/cms/AssetSpecGoldCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "AssetSpecGoldCollateral.do";
		}
		else if(subtype.equals("AssetPostDatedChqs"))
		{
			actionName = "/cms/AssetPostDatedChqsCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "AssetPostDatedChqsCollateral.do";
		}
		else if(subtype.equals("AssetGenCharge"))
		{
			actionName = "/cms/AssetGenChargeCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "AssetGenChargeCollateral.do";
		}
		else if(subtype.equals("AssetAircraft"))
		{
			actionName = "/cms/AssetAircraftCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "AssetAircraftCollateral.do";
		}
		else{
			actionName = "/cms/AssetSpecOtherCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "AssetSpecOtherCollateral.do";
		}
	}
	else if(prefix.equals("Ins"))
	{
		 actionName = "/cms/InsKeymanCollateral.do?event=refresh_branch_detail&branchCode=";
		 actionPathName = "InsKeymanCollateral.do";
	}
	else if(prefix.equals("Mark"))
	{
		if(subtype.equals("MarksecBondLocal"))
		{
			actionName = "/cms/MarksecBondLocalCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "MarksecBondLocalCollateral.do";
		}
		else if(subtype.equals("MarksecMainLocal"))
		{
			actionName = "/cms/MarksecMainLocalCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "MarksecMainLocalCollateral.do";
		}
		else{
			actionName = "/cms/MarksecOtherListedLocalCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "MarksecOtherListedLocalCollateral.do";
		}
	}
	else if(prefix.equals("Cash"))
	{
		 actionName = "/cms/CashFdCollateral.do?event=refresh_branch_detail&branchCode=";
		 actionPathName = "CashFdCollateral.do";
	}
	else if(prefix.equals("Gte"))
	{
		if(subtype.equals("GteGovt"))
		{
			actionName = "/cms/GteGovtCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "GteGovtCollateral.do";
		}
		else if(subtype.equals("GteBankSame"))
		{
			actionName = "/cms/GteBankSameCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "GteBankSameCollateral.do";
		}
		else if(subtype.equals("GteIndiv"))
		{
			actionName = "/cms/GteIndivCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "GteIndivCollateral.do";
		}
		else if(subtype.equals("GteSLCSame"))
		{
			actionName = "/cms/GteSLCSameCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "GteSLCSameCollateral.do";
		}
		else{
			actionName = "/cms/GteCorp3rdCollateral.do?event=refresh_branch_detail&branchCode=";
			actionPathName = "GteCorp3rdCollateral.do";
		}	
	}
	else if(prefix.equals("NoCollateral"))
	{
		 actionName = "/cms/NoCollateral.do?event=refresh_branch_detail&branchCode="; 
		 actionPathName = "NoCollateral.do";
	}
	else if(prefix.equals("Property"))
	{
		 actionName = "/cms/PropCommGeneralCollateral.do?event=refresh_branch_detail&branchCode="; 
		 actionPathName = "PropCommGeneralCollateral.do";
	}
%>

<%@page import="java.util.Collection"%><script type="text/javascript" src="js/ajaxListCustodian.js"></script>
<script type="text/javascript">

function enableMonitorFrequency()
{
	document.getElementById('monitorFrequency').disabled=false;

}

function disableMonitorFrequency()
{
	document.getElementById('monitorFrequency').disabled=true;
	document.getElementById('monitorFrequency').value='';

}

function refreshBranchDetail(dropdown) {
if(dropdown.value==""){
     document.getElementById("custodian1").value="";
     document.getElementById("custodian2").value="";
    }
    var curSel = "";
    for(i=0; i < dropdown.options.length; i++)   {
        if (dropdown.options[i].selected == true) {
            curSel = dropdown.options[i].value;
        }
    }
    var actionName = document.getElementById("actionName").value;
    var dep = 'custodian1';
    var url = actionName+curSel;   
    if(curSel!="0" || curSel!="" || curSel!=null) 
    {    	
    	sendLoadListReqCustodian(dep, url);
    }
    }
    // Added By Dayananda to reset monitorFrequency value if monitoringProcess is checked NO.
    function moniteringProcessDisabled()
    {
    	//alert("Alert moniteringProcessDisabled");
    	document.getElementById('monitorFrequency').disabled=true;
    	document.getElementById('monitorFrequency').value="";
    }
    
    function moniteringProcessEnable()
    {
    	//alert("Alert moniteringProcessEnable");
    	document.getElementById('monitorFrequency').disabled=false;
    }
    
</script>
<%
String custodian1 = null;
String custodian2 = null;
String branchName = "-";
%>


<% 
	int rowIdx = 0;
	boolean isCreate = (itrxValue.getCollateral() == null);
    DefaultLogger.debug(this, "***** isCreate: " + isCreate);
    
    long cmsColId = (itrxValue.getCollateral() == null) ? 0 : itrxValue.getCollateral().getCollateralID();

    if (!isCreate) { //If actual was false
        if (!StringUtils.isNotEmpty(iCol.getSCISecurityID()))
            isCreate = true;
    }

    boolean isMarketSecCol = false;
    if (itrxValue.getStagingCollateral() instanceof com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableCollateral) {
	    isMarketSecCol = true;
    }

    boolean notNoCollateral = true;
	if (prefix != null && prefix.equals("NoCollateral")) {
		notNoCollateral = false;
	}
%>
<%
 ISystemBankBranch systemBankBranch = (ISystemBankBranch) request.getAttribute("systemBankBranch");
    LabelValueBean lvBean = null;
    
    String countryNme = "";
    countryNme = (String)request.getAttribute("countryNme");
      
    if(systemBankBranch!=null){
    branchName = systemBankBranch.getSystemBankBranchName();
    custodian1 = systemBankBranch.getCustodian1();
    custodian2 = systemBankBranch.getCustodian2();
    }
    
    
 %>
<%
boolean process=false;
if("AssetGenCharge".equals(subtype)||"CashFd".equals(subtype)){
	
	Collection frequencyList = (Collection) request.getAttribute("frequencyList");
	//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>frequencyList>"+frequencyList.size());
	request.setAttribute("frequencyList", frequencyList);
	//process=true;
}
%>
 <%
 String secPriority = "";
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
 //List listSystemBankBranch = (List)session.getAttribute(actionPackName2);
 pageContext.setAttribute("currencyList",currencyList);
// pageContext.setAttribute("listSystemBankBranch",listSystemBankBranch);
 %>
 

<%@ include file="/collateral/common/common_display_errors.jsp" %>

<%@page import="java.util.HashMap"%><input type="hidden" name="sourceID" value="<%= iCol.getSourceId()%>"/>
<html:hidden property="collateralName" value="<%=iCol.getSCIReferenceNote()%>" />
<input type="hidden" name="actionName" value="<%=actionName %>"></input>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<input type="hidden" name="isSSC" value="<%=String.valueOf(isSSC)%>"/>
    <td width="20%" class="fieldname">

    <span>
		<bean:message key="label.cms.host.security.id"/>  
    	</span></td>
	<td width="30%">
		<integro:empty-if-null value="<%= (cmsColId <= 0) ? null : String.valueOf(cmsColId)%>"/> 

	</td>
	<input type="hidden" name="collateralID" id="collateralID" value="<%=String.valueOf(iCol.getCollateralID())%>"/>
	<td width="20%" class="fieldname">
	<bean:message key="label.security.backend.security.reference.note"/></td>
	<td width="30%"><integro:empty-if-null value="<%=iCol.getSCIReferenceNote()%>"/>&nbsp;
    </td>	
	
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
 <td width="20%" class="fieldname"><bean:message key="label.security.type"/></td>
 <td width="30%"><integro:empty-if-null value="<%=iCol.getCollateralType().getTypeName()%>"/></td>
 <td width="20%"  class="fieldname"><bean:message key="label.security.sub.type"/></td>
 <td width="30%"><integro:empty-if-null value="<%=iCol.getCollateralSubType().getSubTypeName()%>"/></td>
</tr>     
                       


<% if (notNoCollateral) { %>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

<td class="fieldname"><span ><bean:message key="label.security.currency"/></span>&nbsp;<span class="mandatoryPerfection">*</span></td>
 <%if("GteIndiv".equals(subtype)||"GteBankSame".equals(subtype)||"GteCorp3rd".equals(subtype)||"GteGovt".equals(subtype)||"GteSLCSame".equals(subtype)){ %>
  <td>
  <%String currencyCode = "";
  
	if(iCol.getCurrencyCode()!=null){
		currencyCode = iCol.getCurrencyCode().trim();
	}
	if(iCol.getSecPriority()!=null){
		secPriority = iCol.getSecPriority().trim();
	}
	
//	brCode =  cForm.getCollateralCurrency().trim();
	 %>
  <html:select property="collateralCurrency" value="<%=currencyCode.trim()%>" onchange="javascript:refreshCurrency(this);exchangeRateINRCal();calculateLoanableAmount();" >
		      		 <option value="">Please Select </option>	
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                   </html:select>&nbsp;
		    	   <html:errors property="collateralCurrency" />
              </td>
<%}else{ %>
<td>
  <%String currencyCode = "";
  
	if(iCol.getCurrencyCode()!=null){
		currencyCode = iCol.getCurrencyCode().trim();
	}
	if(iCol.getSecPriority()!=null){
		secPriority = iCol.getSecPriority().trim();
	}
	
//	brCode =  cForm.getCollateralCurrency().trim();
	 %>
  <html:select property="collateralCurrency" value="<%=currencyCode.trim()%>" >
		      		 <option value="">Please Select </option>	
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                   </html:select>&nbsp;
		    	   <html:errors property="collateralCurrency" />
              </td>
<%} %>

<%--<td width="30%" ><integro:empty-if-null value="<%=iCol.getCurrencyCode()%>" />&nbsp;</td>
--%><td class="fieldname"><span ><bean:message key="label.security.asset.priority"/></span>&nbsp;<span class="mandatoryPerfection">*</span></td>
<%--<td width="30%" >
              	<%if(iCol.getSecPriority()!=null){ %>
              	 <%=iCol.getSecPriority().equalsIgnoreCase("y")?"Primary":"Secondary"%>&nbsp;
              	 <%} else { %>
              	 -
              	 <%} %>
              	  </td>
   --%>
   
  
<td width="30%"><html:radio property="secPriority" value="<%=ICMSConstant.TRUE_VALUE %>"></html:radio>
              Primary 
              <html:radio property="secPriority" value="<%=ICMSConstant.FALSE_VALUE%>"></html:radio>
              Secondary <html:errors property="secPriority" /></td>
</tr>
<%if(process){%>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
<td class="fieldname">Monitoring Process of Collaterals <font color="#FF0000">*</font></td>

<%if("Y".equalsIgnoreCase(iCol.getMonitorProcess())){ %>
 <td>
 <!-- <input type="radio" checked="checked" value="Y" onclick="document.getElementById('monitorFrequency').disabled=false" >Yes</input>
 <input type="radio" value="N" onclick="document.getElementById('monitorFrequency').disabled=false" >No</input> --> 
		 <input type="radio" checked="checked" value="Y" onclick="moniteringProcessEnable()" >Yes</input>
 		 <input type="radio" value="N" onclick="moniteringProcessDisabled()" >No</input>   		    
			<html:errors property="monitorProcess" />	</td>
			<%}else if("N".equalsIgnoreCase(iCol.getMonitorProcess())) {%>
			<td>
 <!-- <input type="radio" value="Y" onclick="document.getElementById('monitorFrequency').disabled=false" >Yes</input>
 <input type="radio" checked="checked"  value="N" onclick="document.getElementById('monitorFrequency').disabled=false" >No</input> -->
 		<input type="radio" value="Y" onclick="moniteringProcessEnable()" >Yes</input>
 		<input type="radio" checked="checked"  value="N" onclick="moniteringProcessDisabled()" >No</input>
		     		    
			<html:errors property="monitorProcess" />	</td>
			<%} %>
			
			
<td class="fieldname">Monitoring Frequency of Collaterals <font color="#FF0000">*</font></td>

  <%String frequency = "";
  
	if(iCol.getMonitorFrequency()!=null){
		frequency = iCol.getMonitorFrequency().trim();
	}
	if(iCol.getMonitorFrequency()!=null){
		frequency = iCol.getMonitorFrequency().trim();
	}
//	brCode =  cForm.getCollateralCurrency().trim();
	 %>

 <%if(iCol.getMonitorProcess()!=null && !"".equals(iCol.getMonitorProcess())){ %>            
            <%if("Y".equalsIgnoreCase(iCol.getMonitorProcess())){
            		%>
            		
            <td>
             <html:select property="monitorFrequency" styleId="monitorFrequency" value="<%=frequency.trim()%>" >
		      		 <option value="">Please Select </option>	
                      <html:options collection="frequencyList" property="value" labelProperty="label" />
                   </html:select>&nbsp;
                   <html:errors property="monitorFrequency" />
            
            
			
			</td>
			<%}else{
				%>
			<td>
			 <html:select property ="monitorFrequency" disabled="true">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%} }else{
				%>
			<td>
			<html:select property ="monitorFrequency" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%} %>
</tr>
	
<%}else{%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
<td class="fieldname">Monitoring Process of Collaterals <font color="#FF0000">*</font></td>
 <td>
		     <%-- <html:radio property="monitorProcess" value="Y" onclick="document.getElementById('monitorFrequency').disabled=false" ></html:radio>Yes
		     <html:radio property="monitorProcess" value="N" onclick="document.getElementById('monitorFrequency').disabled=true"></html:radio>No		 --%>    
		     <html:radio property="monitorProcess" value="Y" onclick="moniteringProcessEnable()" ></html:radio>Yes
		     <html:radio property="monitorProcess" value="N" onclick="moniteringProcessDisabled()"></html:radio>No
			<html:errors property="monitorProcess" />	</td>
<td class="fieldname">Monitoring Frequency of Collaterals <font color="#FF0000">*</font></td>
 <%if(iCol.getMonitorProcess()!=null && !iCol.getMonitorProcess().equals("")){ %>            
            <%if(iCol.getMonitorProcess().equalsIgnoreCase("Y")){
            		%>
            <td>
            <html:select property ="monitorFrequency" styleId="monitorFrequency" value ="<%=iCol.getMonitorFrequency()%>" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%}else{
				%>
			<td>
			 <html:select property ="monitorFrequency" styleId="monitorFrequency" disabled="true">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%} }else{
				%>
			<td>
			<html:select property ="monitorFrequency" styleId="monitorFrequency">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%} %>
</tr>
<html:hidden property="monitorProcess"  />
<html:hidden property="monitorFrequency"  />

<%}} %>


<% if (notNoCollateral ) { %>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<%@ include file="/collateral/common/common_security_custodian_update.jsp" %>
</tr>
<%} %>

<%@ include file="/collateral/collateral_org.jsp" %>


<script type="text/javascript">
	<%if (secPriority != null && secPriority.equals("Y")){ %>
		document.forms[0].elements["secPriority"][0].checked = true;			
	<%}else{%>			
		document.forms[0].elements["secPriority"][1].checked = true;
	<%}%>

	
   

    
</script>
