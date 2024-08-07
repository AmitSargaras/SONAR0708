
<%
String actionPackNameMig ="";
if(prefix1.equals("Other"))
{
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.others.OthersAction";
}else if(prefix1.equals("Asset"))
{
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction"; 
}else if(prefix1.equals("Ins"))
{
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction"; 
}else if(prefix1.equals("Mark"))
{
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"; 
}else if(prefix1.equals("Cash"))
  {
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.cash.CashAction"; 
  }
else if(prefix1.equals("Gte"))
{
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction"; 
}
else if(prefix1.equals("NoCollateral"))
{
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction"; 
} 
else if(prefix1.equals("Property"))
  {
	  actionPackNameMig = "com.integrosys.cms.ui.collateral.property.PropertyAction"; 
  }





//String actionStr1 = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionPackNameMig+".migratedFlag");	 
	 if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
<table align="right" width="100%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<%
String errMsg = (String)request.getAttribute("errorMsg");
if(errMsg != null && !errMsg.equals("")) {
%>
<table align="right" width="100%">
  <tr>
    <td align=left class=required width="80%" rowspan="2"><font face=Tahoma size=2 color="#FF0000"><%=errMsg%></font></td>
	<td align=right class=required width="20%" nowrap="nowrap"><SPAN class="mandatoryPerfection">*</SPAN><bean:message key="label.security.mandatory.for.scc"/></td>
  </tr>
  <tr>
	<td align=right class=required width="20%" nowrap="nowrap"><SPAN class="mandatoryAdvSecSearch">*</SPAN><bean:message key="label.global.mandatory.for.submission"/></td>
  </tr>
</table>
<table class=tblFormSection style="MARGIN-TOP: 10px" cellSpacing=0 cellPadding=0 width="98%" align=center border=0>
  <thead>
	<tr><td>&nbsp;</td></tr>
  </thead>
</table>
<br/>
<%
}
else {
%>
<table align="right" width="100%">
  <tr>
    <td align=left class=required width="80%" rowspan="2"><html:errors property="pendingPerfectError" />&nbsp;</td>
	<td align=right class=required width="20%" nowrap="nowrap"><SPAN class="mandatoryPerfection">*</SPAN><bean:message key="label.security.mandatory.for.scc"/></td>
  </tr>
  <%--<tr>
	<td align=right class=required width="20%" nowrap="nowrap"><SPAN class="mandatoryAdvSecSearch">*</SPAN><bean:message key="label.global.mandatory.for.submission"/></td>
  </tr>
--%></table>
<table class=tblFormSection style="MARGIN-TOP: 10px" cellSpacing=0 cellPadding=0 width="98%" align=center border=0>
  <thead>
	<tr><td>&nbsp;</td></tr>
  </thead>
</table>
<br/>
<% } %>
