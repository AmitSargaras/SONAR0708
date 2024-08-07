<%@ page import="com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
				 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimitProfile,
                 com.integrosys.cms.ui.collateral.CollateralAction,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant" %>

<%
	CustomerSearchCriteria criteria = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." +IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
	
%>    	
    	
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <%
            OBCMSCustomer obCMSCustomer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
            OBLimitProfile obLimitProfile = (OBLimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
           // System.out.println("-------obLimitProfile--------->"+obLimitProfile);
            //System.out.println("-------obCMSCustomer--------->"+obCMSCustomer);
            
            String flag1 = (String) session.getAttribute(actionStr+".flag1");
            String link = "";
            String ipinPath = (String)request.getAttribute(ICommonEventConstant.IPIN_PATH);
            if (flag1 != null && flag1.equals("1")) {
            	System.out.println("-------1----------------------");
                    link = "CollateralSearch.do?event=list1&collateralId=" + String.valueOf(oldCollateral.getCollateralID());
            } else if (CollateralAction.COLLATERALLOADING.equals(session.getAttribute(ipinPath+".from"))) {
            	System.out.println("-------2----------------------");
            	link = "CollateralLoading.do?event=list";
            } else {
            	System.out.println("-------3----------------------");
                link = "CustomerProcess.do?event=viewsecurities&customerID=" + obCMSCustomer.getCustomerID() + "&limitProfileID=" + obLimitProfile.getLimitProfileID();
                if (criteria != null && criteria.getFrompage() != null &&
                	criteria.getFrompage().equals("pending_cases")) {
	                link += "&frompage=pending_cases";
                }
            }
        %>
        <td><a href="<%=link%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1"/></a></td>
    </tr>
</table>    	