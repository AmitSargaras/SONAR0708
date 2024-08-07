<%@ page import="com.integrosys.cms.ui.collateral.CollateralUiUtil"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
<%@ page import ="com.integrosys.cms.app.common.constant.PropertiesConstantHelper"%>
	<%@ page import ="java.util.Enumeration,
	 com.integrosys.base.techinfra.logger.DefaultLogger,
	 com.integrosys.cms.ui.common.constant.IGlobalConstant,
     com.integrosys.base.uiinfra.common.ICommonEventConstant,
     com.integrosys.cms.app.customer.bus.ICMSCustomer,
     com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%
	String toSubmitActionName = CollateralUiUtil.getActionNameBySubType(iCol.getCollateralSubType().getSubTypeCode());
	String delURL = toSubmitActionName+".do?event=delete&collateralID="+String.valueOf(iCol.getCollateralID());
	String editURL = toSubmitActionName+".do?event=prepare_update&collateralID="+String.valueOf(iCol.getCollateralID());
	
	String flag = "2";
				    
	for (Enumeration e = session.getAttributeNames(); e.hasMoreElements();) {
		String id = (String)e.nextElement();
		if (id.indexOf("flag1") > 0) {
			flag = (String)session.getAttribute(id);
		}
	}
					
	String colSubTypeCode = iCol.getCollateralSubType().getSubTypeCode();
	String colTypeCode = iCol.getCollateralType().getTypeCode();
	String colCollateralID = String.valueOf(iCol.getCollateralID());
    String editMFChecklistURL = "MarketabilityFactor.do?event=read&colCollateralID="+colCollateralID+"&colTypeCode="+colTypeCode+"&colSubTypeCode="+colSubTypeCode+"&flag="+flag;
	
				String reminderPath = toSubmitActionName.substring(0,toSubmitActionName.indexOf("Collateral"));
				String reminderURL = toSubmitActionName+".do?event=reminder&path="+reminderPath;
				//System.out.println("P:"+reminderPath);
				//System.out.println("W:"+reminderURL);
				//System.out.println("U:"+userAccess);
				//System.out.println("I:"+isSSC);
				//System.out.println("R:"+hasReminder);
	boolean showLiquidation = PropertyManager.getBoolean("build.liquidation", false);
	String showMFChecklist = "true";
	System.out.println("Checking liquidationIsNPL :" + liquidationIsNPL);
	//String showMFChecklist = (String)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.showMFChecklist");

	  //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
	 ICMSCustomer iCustomer =
            (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	 	boolean isActive=true;
	    if(null!=iCustomer && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(iCustomer.getStatus())){
	    isActive=false;
	    	}
	    
	    DefaultLogger.debug(this,"Party Status: isActive:"+isActive);
	    //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
%>
<%if (userAccess && liquidationIsNPL != null && ICMSConstant.TRUE_VALUE.equals(liquidationIsNPL)){
%>
  <%@page import="java.util.Enumeration"%>
<table width="400" border="0" cellspacing="0" cellpadding="0">
<% }else {
%>
<table width="150" border="0" cellspacing="0" cellpadding="0">
<%}%>
	<tr>
		<td width="75">
		<%System.out.println("isDeleting==>"+isDeleting);
		System.out.println("isDeletable==>"+isDeletable);
		%>
		<% if ((isDeleting)&&(isDeletable)) { %>
			<p class="deletedItem">
		        DELETED
		    </p>
		<% } %>
		</td>
		<% 
			if (userAccess && !isSSC) { 			
		%>
		
        <% 	if (liquidationIsNPL != null && ICMSConstant.TRUE_VALUE.equals(liquidationIsNPL)) 
			{ 
				if (showLiquidation)
				{		    
				
		%>
		        <td width="75">
		            <input name="Submit" type="button" class="btnNormal" value="Liquidation Management" onClick="gotopage('Liquidation.do?event=list&collateralID=<%=String.valueOf(iCol.getCollateralID())%>&flag=<%=flag%>');" />&nbsp;
		        </td>
        <%
				}
			} 
		%>

		<!-- MBB-1256 reminder button
			<% if(hasReminder){ %>
		<td width="75">
			<input type="button" name="Button2" value="Reminder" class="btnNormal" style="width:70" onclick="gotopage('<%=reminderURL%>')"/>&nbsp;
		</td>
			<% } %> -->
            <%  if (isDeletable == true && isDeleting == false) {%>
			<% if (!PropertiesConstantHelper.isSTPRequired() ||
					(PropertiesConstantHelper.isSTPRequired() &&
						!PropertiesConstantHelper.isValidSTPSystem(iCol.getSourceId()))) { %>

        <td width="75">
        	<input type="button" name="Button_D" value="Delete" class="btnNormal" style="width:50" onclick="gotopage('<%=delURL%>')"/>&nbsp;
        </td>
	        <%	} } %>
	        <%  if (!isDeletable && !isDeleting) {%>
	     
	       			<% 
	       				//	if (colTypeCode.equals("PT")) { 
		       					if ((showMFChecklist != null)&& showMFChecklist.equals("true")){
		       		%>
		       		<!--Sandeep Shinde Commented Following Button -->
	 						<!--<td width="75">
								<input type="button" name="Button" value="Marketability Factor" class="btnNormal" style="width:150" onclick="gotopage('<%=editMFChecklistURL%>' )"/>&nbsp;
							</td>
					--><%			
							}
					%>
			<% if (!PropertiesConstantHelper.isSTPRequired() ||
					(PropertiesConstantHelper.isSTPRequired() &&
						!PropertiesConstantHelper.isValidSTPSystem(iCol.getSourceId()))) { 
						if(isActive){%>
				<td width="75">
					<input type="button" name="Button" value="Edit" class="btnNormal" style="width:50" onclick="gotopage('<%=editURL%>')"/>
				</td>
			<% }} %>
			<%	} %>
		<% } %>
	</tr>
</table>