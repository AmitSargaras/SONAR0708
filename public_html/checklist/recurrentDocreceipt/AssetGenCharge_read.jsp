<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsAction"%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeAction,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.cms.app.collateral.proxy.CollateralProxyFactory,
                 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
                 com.integrosys.cms.ui.collateral.CollateralUiUtil,
                 java.util.List"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/AssetGenCharge_read.jsp,v 1.21 2006/11/24 17:58:57 lini Exp $
    *
    * Purpose: Read Collateral
    * Description: Type - Asset Based
    *
    * @author $Author: lini $<br>
    * @version $Revision: 1.21 $
    * Date: $Date: 2006/11/24 17:58:57 $
    * Tag: $Name: DEV_20060126_B286V1 $
    */
%>

<%	
System.out.println("@@@@@@@@@@@###########11111111111111################");
String teamTypeMemIDNew=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
long membershipIDNew = Long.parseLong(teamTypeMemIDNew);
System.out.println("@@@@@@@@@@@###########membershipID################"+membershipIDNew);
String trxID=(String)request.getAttribute("trxID");
	String parentPageFrom = "ASSET_READ";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.serviceColObj");
	IGeneralCharge iCol = (IGeneralCharge) itrxValue.getCollateral();
    String from_page = (String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.from_page");
    if("cancle_stock_detail".equals(from_page)
    		|| AssetGenChargeStockDetailsAction.EVENT_FILTER_LOCATIONS.equals(from_page)
    		|| AssetGenChargeStockDetailsAction.EVENT_VIEW_STOCKS.equals(from_page)
    		){
    	from_page=AssetGenChargeAction.EVENT_READ;
    }
	if (!AssetGenChargeAction.EVENT_READ.equals(from_page)) {
    	iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
	}

    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;        
    String liquidationIsNPL = (String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.liquidationIsNPL");
	String actionStr = "com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction";
	String prefix1 = "Asset";
	System.out.println("@@@@@@@@@@@###########11111111111111################");
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>

<!--
function submitPage(num, index) {
    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    document.forms[0].submit();
}

//-->
<script>
function saveForm() {
	document.forms["RecurrentDocReceiptForm"].event.value="view_ok";
	document.forms["RecurrentDocReceiptForm"].submit();
}
function saveFormChecker() {
    document.forms["RecurrentDocReceiptForm"].event.value = "view_return";
    document.forms["RecurrentDocReceiptForm"].submit();
}
</script>

</head>

<body>
<html:form action="RecurrentDocReceipt.do">
<input type="hidden" name="parentPageFrom" value="<%=parentPageFrom%>">
<%-- 
<input type="hidden" name="event" value="<%=AssetGenChargeAction.EVENT_FORWARD%>">
 --%>
 <input type="hidden" name="next_page">

<%@ include file="/collateral/checkIsSSC.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%
 	ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
 	List onlyBcaLocList= (List)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.onlyBcaLocList");	
    String colLocation=iCol.getCollateralLocation();
	if (userAccess) {		
		if (AssetGenChargeAction.EVENT_READ.equals(from_page)
				|| AssetGenChargeStockDetailsAction.EVENT_FILTER_LOCATIONS.equals(from_page)
				|| AssetGenChargeStockDetailsAction.EVENT_VIEW_STOCKS.equals(from_page)
				) 
	        {
			    userAccess = true;
			} else {
				userAccess = false;
			}
						
	      if(userAccess)
		    {
				if(isSSC)
				{
					userAccess=CollateralUiUtil.isColCanUpdateBySSC(userTeam, onlyBcaLocList,colLocation);						
			    }
			    else  
			    {	  
			      //cpc     
				}
            }		
				
  }	
	System.out.println("@@@@@@@@@@@###########555555555555555################");
%>

<input type="hidden" name="isSSC" value="<%=String.valueOf(isSSC)%>"/>
<input type="hidden" name="userAccess" value="<%=String.valueOf(userAccess)%>"/>
<input type="hidden" name="event"/>
<input type="hidden" name="from_event"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="subtype" value="AssetGenCharge"/>
<input type="hidden" name="itemType"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td colspan="2"><h3><%=AssetGenChargeAction.EVENT_READ.equals(from_page)?"View":"Edit"%> <bean:message key="label.security.asset.title"/></h3></td>
      <td width="50%" align="right" valign="baseline">
      </td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  
<%@ include file="AssetGenCharge_read_helper.jsp" %>

<table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center"><td colspan="3">
  	<html:errors property="drawingpowerErr"/><br>
  	<html:errors property="totalgrossErr"/>
  </td></tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
<%
  	if (AssetGenChargeAction.EVENT_READ.equals(from_page) 
  			|| AssetGenChargeStockDetailsAction.EVENT_FILTER_LOCATIONS.equals(from_page)
  			|| AssetGenChargeStockDetailsAction.EVENT_VIEW_STOCKS.equals(from_page)
  			) { %>
  			 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
              <tr>
              <% if (membershipIDNew==ICMSConstant.CPU_MAKER 
              ||membershipIDNew==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
              || membershipIDNew==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
              || membershipIDNew==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
              || membershipIDNew==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
              || membershipIDNew==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
  			  ||membershipIDNew==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
  			  ||membershipIDNew==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH) { %>
   <td align="center" valign="middle">
                    <a href="#" onClick="saveForm()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                </td>
    <% } else { %>
    <td align="center" valign="middle">
                    <a href="#" onClick="saveFormChecker()" ><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                </td>
    <% } %>
                
              </tr>
        </table>
  <% }  %>
  	 

  </tr>
</table>
</html:form>
<%
  if (request.getAttribute("org.apache.struts.action.ERROR") !=null)
  {
     org.apache.struts.action.ActionErrors errors = (org.apache.struts.action.ActionErrors)(request.getAttribute("org.apache.struts.action.ERROR"));
     if (errors.get("apportionmentError").hasNext())
     {
%>
  <script>
      document.location.hash = "apportionanchor"; 
      alert("Warning: Priority Ranking Amount exceeds FSV amount");  
      document.forms[0].action = document.forms[0].action + "?skipPraChecking=Y";
      document.forms[0].event.value="submit";
      document.forms[0].submit();  
  </script>
<%
     } 
  }
%>

</body>
</html>
