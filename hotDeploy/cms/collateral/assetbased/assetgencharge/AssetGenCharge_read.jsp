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
                 <%@ page import="com.integrosys.component.user.app.bus.ICommonUser,                 
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,                 
                 com.integrosys.cms.app.sharesecurity.bus.IShareSecurity"%>

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
String trxID=(String)request.getAttribute("trxID");
	String parentPageFrom = "ASSET_READ";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
	IGeneralCharge iCol = (IGeneralCharge) itrxValue.getCollateral();
    String from_page = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.from_page");
    if("cancle_stock_detail".equals(from_page)
    		|| AssetGenChargeStockDetailsAction.EVENT_FILTER_LOCATIONS.equals(from_page)
    		|| AssetGenChargeStockDetailsAction.EVENT_VIEW_STOCKS.equals(from_page)
    		){
    	from_page=AssetGenChargeAction.EVENT_READ;
    }
	if (!AssetGenChargeAction.EVENT_READ.equals(from_page)) {
    	iCol = (IGeneralCharge) itrxValue.getStagingCollateral();
	}
	
	IGeneralCharge iCol1 = (IGeneralCharge) itrxValue.getStagingCollateral();
	 IGeneralChargeDetails chargeDetaills=null;
	IGeneralChargeStockDetails[] existingGeneralChargeStockDetails;
    IGeneralChargeDetails[] existingGeneralChargeDetails = iCol1.getGeneralChargeDetails();
	IGeneralChargeDetails existingChargeDetails;
   // if(existingGeneralChargeDetails!=null){
	//	for (int i = 0; i < existingGeneralChargeDetails.length; i++) {
	//		 existingChargeDetails = existingGeneralChargeDetails[i];
	//		if(existingChargeDetails!=null && existingChargeDetails.getDueDate().equals(dueDate)){
	//		if(existingChargeDetails!=null && existingChargeDetails.getDocCode().equals(dueDate.split(",")[1])){
	//		System.out.println("************ "+existingChargeDetails.getDueDate()+" "+existingChargeDetails.getDocCode());
	//			chargeDetaills = existingChargeDetails;
	//			System.out.println("************ "+existingChargeDetails.getLastUpdatedBy());
				
			//	break;
			//}
			//}
		//}
	//}   
    pageContext.setAttribute("obj", iCol);
    String from_event = "read";
    boolean isProcess = false;        
    String liquidationIsNPL = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.liquidationIsNPL");
	String actionStr = "com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction";
	String prefix1 = "Asset";
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeStockDetails"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralChargeDetails"%><html>
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
</script>

</head>

<body>
<html:form action="AssetGenChargeCollateral.do">
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
 	List onlyBcaLocList= (List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.onlyBcaLocList");	
    String colLocation=iCol.getCollateralLocation();
    System.out.println("userAccess=>"+userAccess);
    
    ICommonUser user2 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    String teamTypeMemID2=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMembershipID2 = Long.parseLong(teamTypeMemID2);
	String subTypeCodeOfCollateral = iCol.getSCISubTypeValue();
	System.out.println("iCol.getSCISubTypeValue() =============>"+iCol.getSCISubTypeValue());
	System.out.println("iCol.getCollateralSubType() =============>"+iCol.getCollateralSubType());
     
                System.out.println("teamTypeMembershipID2=>"+teamTypeMembershipID2);
                if(teamTypeMembershipID2==ICMSConstant.TEAM_TYPE_SSC_MAKER || teamTypeMembershipID2==ICMSConstant.TEAM_TYPE_CPU_MAKER_I){
                    userAccess = true;
                } else {
                  userAccess=false;
                }
                
                
              /*  if("AB100".equals(subTypeCodeOfCollateral)){ */
            	  if(teamTypeMembershipID2==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
            			  ||teamTypeMembershipID2==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
                      userAccess = true;
                  }
              /*  } */
                
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
		<%@ include file="/collateral/common/common_buttons.jsp"%>  
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
  			) {
  		System.out.println("/////////////////**********************  EVENT  1111");
  		%>
<%@ include file="/collateral/common/common_read_button.jsp" %>
  <% } else {
	  System.out.println("/////////////////**********************  EVENT 22222 ");
	  %>
  	<td><a href="javascript:submitPage(1, 0)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image142','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image142" width="75" height="22" border="0" id="Image142" /></a></td>
    <td><a href="javascript:submitPage(2, 0)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
    <% if (itrxValue.getStatus().equals(ICMSConstant.STATE_DRAFT) ||
            itrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
    <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
    <% } else { %>
    <td><a href="AssetGenChargeCollateral.do?event=read&collateralID=<%=itrxValue.getCollateral().getCollateralID()%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
    <% } %>
  <% } %>
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
