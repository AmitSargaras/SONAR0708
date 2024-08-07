<%@ page import="com.integrosys.cms.app.limit.bus.*,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.ForexHelper,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.constant.ICategoryEntryConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.common.Constants,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 java.util.*,
				 java.math.BigDecimal,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.limit.LimitFSVBalanceHelper" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
    <title>View Limits</title>
    

    <script language="JavaScript" src="js/imageLoad.js"></script>
    <script language="JavaScript" type="text/JavaScript">
    <!--
        function editLimits() {
            document.forms[0].event.value = "prepare_edit_limits";
            document.forms[0].customerID.value = <%=ICMSConstant.LONG_INVALID_VALUE%>;
            document.forms[0].submit();
        }

        function editCoBorrowerLimits(customerID) {
            document.forms[0].event.value = "prepare_edit_co_borrower_limits";
            document.forms[0].customerID.value = customerID;
            document.forms[0].submit();
        }
     -->
    </script>
    <%
		ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);    
    
        HashMap outerlimitObHash = (HashMap) session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.innerOuterBcaObList");
        ILimitProfile limitProfile = (ILimitProfile) session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.limitObList");
        //ICoBorrowerLimitTrxValue coBorrowerLimitTrxValue = (ICoBorrowerLimitTrxValue) session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.coBorrowerLimitTrxValue");
        ICoBorrowerLimit[] coBorrowerLimitObList = (ICoBorrowerLimit[]) session.getAttribute(
        		"com.integrosys.cms.ui.limit.LimitsAction.coBorrowerLimitObList");
        Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + Constants.GLOBAL_LOCALE_KEY);
        ICMSCustomer cust = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
        ILimit limits[] = limitProfile.getLimits();
        CurrencyCode usd = new CurrencyCode(CommonUtil.getBaseCurrency(user));
        
        ForexHelper fr = new ForexHelper();
        CountryList cList = CountryList.getInstance();
        boolean isLimitEditAllowed = false;
        boolean isCoboEditAllowed = false;
        boolean isEditAllowed = false;

/*
        String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
        long teamTypeMshipID = roleType == null ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong(roleType);

        ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);

        boolean isEditAllowed = true;
        if (teamTypeMshipID == ICMSConstant.TEAM_TYPE_CPC_CHECKER || teamTypeMshipID == ICMSConstant.TEAM_TYPE_SSC_CHECKER)
        {
            isEditAllowed = false;
        }

        boolean isLimitEditAllowed = isEditAllowed;
        boolean isCoboEditAllowed = isEditAllowed;

        IDataProtectionProxy dpProxy = DataProtectionProxyFactory.getProxy();
        if (isEditAllowed) {
            // as long as any of it can be accessed, then show the edit button.
            for (int i = limits.length - 1; i >= 0; i--) {
                isLimitEditAllowed = dpProxy.isLocationAccessibleByUser(userTeam, cust.getCMSLegalEntity().getCustomerSegment(), limits[i].getBookingLocation());
                if (isLimitEditAllowed) {
                    isLimitEditAllowed = dpProxy.isDataAccessAllowed(ICMSConstant.INSTANCE_LIMIT, IDataProtectionProxy.DAP_EDIT, teamTypeMshipID,
                            new String[]{limits[i].getBookingLocation().getCountryCode()}, new String[]{limits[i].getBookingLocation().getOrganisationCode()}, true);
                    if (isLimitEditAllowed) {
                        break;
                    }
                }
            }
        }
*/
      String BCACustomerID = "";
      if(cust != null) {
          if(cust.getCustomerID()!=Long.MIN_VALUE)
                 BCACustomerID =Long.toString(cust.getCustomerID());
      }

	boolean isMR = false;
	String roleType = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMshipID = roleType == null ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong(roleType);
	ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
	if (teamTypeMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER || teamTypeMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER)
	{
		isMR = true;
	}	
	
	request.setAttribute("limitProfileID",request.getAttribute("limitProfileID"));
	request.setAttribute("customerID",request.getAttribute("customerID"));
    %>
</head>

<body>
<html:form action="Limits.do">
<input name="event" type="hidden" value=""/>
<input name="customerID" type="hidden" value="<%=cust.getCustomerID() %>"/>
<input name="BCACustomerID" type="hidden" value="<%=BCACustomerID%>"/>

<input name="limitProfileID" type="hidden" value="<%=request.getAttribute("limitProfileID") %>"/>
<input name="customerID" type="hidden" value="<%=request.getAttribute("customerID") %>"/>
<%
    if (limits != null && limits.length != 0) {
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Limit List</h3></td>
    </tr>
    <% if (isLimitEditAllowed) { %>
    <tr>
        <td align="right"><input type="button" name="Button" value="Edit" class="btnNormal" style="width:50"
                                 onclick="editLimits()"/></td>
    </tr>
    <% } %>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td>
<table width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
<thead>
    <tr>
        <td width="3%"><bean:message key="label.global.sn"/></td>
        <td width="9%"><bean:message key="label.limit.id"/></td>
        <!-- <td width="8%"><bean:message key="label.limit.facility.description"/></td> -->
        <%--<td width="9%"><bean:message key="label.customer.id"/> /<br> Customer Name </td>--%>
        <td width="9%"><bean:message key="label.facility.name"/></td>
        <td width="8%"><bean:message key="label.facility.type"/></td>
        <%-- <td width="8%">Facility Currency</td>--%>
        <td width="6%"><bean:message key="label.facility.sanctionedamount"/></td>
        <td width="7%"><bean:message key="label.facility.releasableamount"/></td>
        <td width="7%"><bean:message key="label.facility.releasedamount"/>  </td>
        <%-- <td width="7%">Coverage Amount</td>--%>
        <%-- <td width="15%">Limit Location</td>--%>
        <%-- <td width="9%"><bean:message key="label.global.outer.limit.id"/></td>--%>
        <%-- <td width="9%"><bean:message key="label.global.aa"/> 
        	<bean:message key="label.global.reference"/>/<br> <bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/>
             </td>--%>
        <%-- <td width="12%"><bean:message key="label.limit.approved.limit"/></td>--%>
        <%-- <td width="12%"><bean:message key="label.limit.authorised.limit"/></td>--%>
        <%-- <td width="9%"><bean:message key="label.limit.drawing.limit"/></td>--%>
        <%-- <td width="9%"><bean:message key="label.limit.outstanding.balance"/></td>--%>
        <%-- <td width="9%"><bean:message key="label.security.id.cms"/></td>--%>
        <td width="7%"><bean:message key="label.facility.securityid"/></td>
        <%-- <td><bean:message key="label.limit.required.security.coverage"/></td>--%>
        <td width="10%" nowrap="nowrap">Security Type/Subtype</td>
        <td width="9%">Limit-Security Linkage</td>
        <td width="5%"><bean:message key="label.global.action"/></td>
    </tr>
</thead>
<tbody>
<%
    String color = "";
    double totalAppLimitAmt = 0;
    double totalActLimitAmt = 0;
    double totalDrawLimitAmt = 0;
    double totalOutLimitAmt = 0;
    if (limits != null && limits.length != 0) {
        String reason = limits[0].getZerorisedReason();
        String zerorisedDate = limits[0].getZerorisedDate() == null ? "" : DateUtil.convertToDisplayDate(limits[0].getZerorisedDate());
        boolean isZerorised = limits[0].getIsLimitZerorised();
        for (int i = 0; i < limits.length; i++) {
			String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_SOURCE_SYSTEM, (limits[i].getSourceId() == null)?"":limits[i].getSourceId());	
			String limitID = String.valueOf(limits[i].getLimitID());		
            String limitRef = limits[i].getLimitRef() + ((sourceDesc == null)?"":(" - " + sourceDesc));
            /*String productKey = limits[i].getProductDesc();
            if (productKey == null)
                productKey = "";
            String productDesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, productKey);
            if (productDesc == null)
                productDesc = "-";
			*/  	              
            HashMap outerLimitMisc = (HashMap) outerlimitObHash.get(String.valueOf(limitID));	
            String leID = (String) outerLimitMisc.get("leId");
            String custName = (String) outerLimitMisc.get("custName");
            String limitCountryCode = limits[i].getBookingLocation().getCountryCode();
			String limitOrgCode = limits[i].getBookingLocation().getOrganisationCode();
//            String limitLocation = cList.getInstance().getCountryName(limitCountryCode);
			String limitLocation = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,limitOrgCode)+ " ("+limitOrgCode+")";
            String outerLimitID = String.valueOf(limits[i].getOuterLimitID());
            String bcaRef = (String) outerLimitMisc.get("bcaRef");
            String bkgLoc = cList.getCountryName((String) outerLimitMisc.get("bkgLoc"));
            boolean isSameBCA = limits[i].getIsInnerOuterSameBCA();
            String outerLimitRef = limits[i].getOuterLimitRef();
            if (outerLimitRef == null || outerLimitRef.trim().length() == 0)
                outerLimitRef = "0";
            String limitStatus = limits[i].getLimitStatus();
            Amount appLimitAmt = limits[i].getApprovedLimitAmount();
            Amount actLimitAmt = limits[i].getActivatedLimitAmount();	
			Amount outstandingLimitAmt = limits[i].getOutstandingAmount();
            Amount drawingLimitAmt = limits[i].getDrawingLimitAmount();
			if (outerLimitRef.equals("0") && limitStatus != null && !limitStatus.equals(ICMSConstant.STATE_DELETED)) {
		        try{
		            if (appLimitAmt != null && appLimitAmt.getCurrencyCode()!=null){
			                    totalAppLimitAmt += fr.convert(appLimitAmt, usd).getAmount();
					}
			        if (actLimitAmt != null){
			                    totalActLimitAmt += fr.convert(actLimitAmt, usd).getAmount();
					}
					if (outstandingLimitAmt != null){
		                totalOutLimitAmt += fr.convert(outstandingLimitAmt, usd).getAmount();
		            }
					if (drawingLimitAmt != null){
		                totalDrawLimitAmt += fr.convert(drawingLimitAmt, usd).getAmount();
		            }
                }catch(Exception e){
					appLimitAmt = fr.getForexErrorAmount();
				}
            }	
           
            Amount actualSecCoverageAmt = limits[i].getActualSecCoverageAmt();
			String actualSecCoveragePercent = "-";
			if (actualSecCoverageAmt != null && 
					actualSecCoverageAmt.getCurrencyCode() != null && 
					actualSecCoverageAmt.getAmount() >= 0 	
				) {
				
				
				if (outstandingLimitAmt != null && 
					outstandingLimitAmt.getCurrencyCode() != null && 
					outstandingLimitAmt.getAmount() >= 0 	
				) {
					// sec coverage amt / outstanding value *100 = x%							
					BigDecimal result = 
						actualSecCoverageAmt.getAmountAsBigDecimal().divide( 
								outstandingLimitAmt.getAmountAsBigDecimal(), 4, BigDecimal.ROUND_HALF_UP ).multiply( new BigDecimal( 100 ) );
					
					result = result.setScale( 2 );				
					actualSecCoveragePercent = result.toString();
				}
			} 
				
            //String actualSecurityCoverage = "-";
            //if (limits[i].getActualSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
            //    actualSecurityCoverage = MapperUtil.mapDoubleToString(limits[i].getActualSecurityCoverage(), 2, locale);
            //}
            ICollateralAllocation[] collaterals = limits[i].getCollateralAllocations();
            String securityID = "";
            String linkage = "";
            String securityType = "";
            String location = "";
            String orgCode = "";
            String facilityType = limits[i].getFacilityType();
            if (collaterals != null) {
                for (int x = 0; x < collaterals.length; x++) {				
					securityID += String.valueOf(collaterals[x].getCollateral().getCollateralID()) + "<br>";
					/*
				    List sourceAlias = collaterals[x].getCollateral().getSourceSecIdAliases();	
				    if (sourceAlias != null)
				    {
						for(int n=0; n<sourceAlias.size(); n++)
						{ 				
			                securityID += (String)(sourceAlias.get(n)) + "<br>";
						}
				    }
					*/
					
                    String hostStatus = collaterals[x].getHostStatus();
                    if (hostStatus != null && hostStatus.equals( ICMSConstant.HOST_STATUS_DELETE )) {
                        linkage += "<span class=deleted> " + "Deleted" + "</span><br>";
                    } else
                        linkage += "Active" + "<br>";
                    String type = collaterals[x].getCollateral().getCollateralType().getTypeName();
                    String subType = collaterals[x].getCollateral().getCollateralSubType().getSubTypeName();
                    securityType += type + "/" + subType + "<br>";
                    
//                    for (int k = 0; k < ctryLbls.size(); k++) {
                        if (collaterals[x].getCollateral().getCollateralLocation() != null)
                            location += cList.getInstance().getCountryName(collaterals[x].getCollateral().getCollateralLocation()) + "<br>";
//                    }
                    if (collaterals[x].getCollateral().getSecurityOrganization() != null) {
                        orgCode += CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,collaterals[x].getCollateral().getSecurityOrganization()) + "<br>";
                    }
                }
            }
			if("".equals(orgCode)) {
				orgCode=null;
			}
            String displayDel = "";
            if (limits[i].getLimitStatus() != null && limits[i].getLimitStatus().equals(ICMSConstant.STATE_DELETED))
                displayDel = "Deleted";
            String requiredSecurityCoverage = "-";
            //if (limits[i].getRequiredSecurityCoverage() != ICMSConstant.FLOAT_INVALID_VALUE) {
             //   requiredSecurityCoverage = MapperUtil.mapDoubleToString(limits[i].getRequiredSecurityCoverage(), 0, locale);
           // } //Shiv 210911
             if (limits[i].getRequiredSecurityCoverage() != null || !limits[i].getRequiredSecurityCoverage().equals("")) {
                requiredSecurityCoverage = limits[i].getRequiredSecurityCoverage();
            } //Shiv 210911
            String strReleasableAmount = "-";
            if (null != limits[i].getReleasableAmount() && ! "".equals(limits[i].getReleasableAmount().trim())) {
              strReleasableAmount = limits[i].getReleasableAmount();
           }
            String strTotalReleasedAmount = "-";
            if (null != limits[i].getTotalReleasedAmount() && ! "".equals(limits[i].getTotalReleasedAmount().trim())) {
              strTotalReleasedAmount = limits[i].getTotalReleasedAmount();
           }
           String strLimitCur = "-";
           if (null != limits[i].getCurrencyCode() && ! "".equals(limits[i].getCurrencyCode().trim())) {
        	   strLimitCur = limits[i].getCurrencyCode();
           }
            if (i % 2 == 0)
                color = "even";
            else
                color = "odd";
%>
<tr class="<%=color%>">
    <td class="index"><%=i + 1%></td>
    <td nowrap="nowrap"><a href="MILimitList.do?event=show_lmt_cust_detail&limitId=<%=limitID%>&limitProfileID=<%=request.getAttribute("limitProfileID")%>" ><integro:empty-if-null value="<%=limitRef%>"/><font color="#FF0000" size="1"><%=displayDel%></font></a></td>
    <%-- <td><integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limits[i].getProductCode() %>" descWithCode="false"/>&nbsp;</td> --%>
    <%--<td><integro:empty-if-null value="<%=leID%>"/>&nbsp;<br><integro:empty-if-null value="<%=custName%>"/></td>--%>
    <td nowrap="nowrap"><integro:empty-if-null value="<%=limits[i].getFacilityName()%>"/></td>
    <td nowrap="nowrap"><integro:empty-if-null value="<%=facilityType%>"/>&nbsp;</td>
    <%-- <td nowrap="nowrap"><integro:empty-if-null value="<%=strLimitCur%>"/>&nbsp;</td>--%>
    <td class="amount"><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(requiredSecurityCoverage) %>" /></td>
    <td class="amount"><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(strReleasableAmount) %>" /></td>
    <td class="amount"><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(strTotalReleasedAmount) %>"/></td>
    <%-- <td class="amount">&nbsp;-&nbsp;</td>--%>
    <%--  <td nowrap="nowrap"><integro:empty-if-null value="<%=limitLocation%>"/>&nbsp;</td>--%>
    <%----------------------
    <%
        if (outerLimitRef.equals("0")) {
    %>
    <td>-&nbsp;</td>
    <%
    } else if (isSameBCA) {
    %>
    <td><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
    <%
    } else {
    %>
    <td class="outerlimit"><integro:empty-if-null value="<%=outerLimitRef%>"/>&nbsp;</td>
    <%
        }
    %>    
    -------------------------%>
    <%--<td><integro:empty-if-null value="<%=bcaRef%>"/>&nbsp;<br><integro:empty-if-null value="<%=bkgLoc%>"/></td>--%>
     <%----------------------
    <%
        if (appLimitAmt != null) {
    %>
    <td class="amount"><integro:currency amount="<%=appLimitAmt%>" param="currency"/>&nbsp;
        <%
            if (outerLimitRef == null || outerLimitRef.equals("0")) {
        %>
        <integro:amount amount="<%=appLimitAmt%>" param="amount" decimal="2" />
        <%
        } else {
        %>
        (<integro:amount amount="<%=appLimitAmt%>" param="amount" decimal="2" />)
        <%
            }
        %>
    </td>
    <%
    } else {
    %>
    <td class="amount">-&nbsp;</td>
    <%
        }
    %>

    <%
       // if (actLimitAmt != null) {
    %>
    <!--<td class="amount"><integro:currency amount="<%=actLimitAmt%>" param="currency"/>&nbsp;
        <%
        //    if (outerLimitRef == null || outerLimitRef.equals("0")) {
        %>
        <integro:amount amount="<%=actLimitAmt%>" param="amount" decimal="2"/>
        <%
       // } else {
        %>
        (<integro:amount amount="<%=actLimitAmt%>" param="amount" decimal="2"/>)
        <%
          //  }
        %>
    </td>-->
    <%
   // } else {
    %>
    <!--<td class="amount">-&nbsp;</td>-->
    <%
      //  }
    %>

    <%
        if (drawingLimitAmt != null) {
    %>
    <td class="amount"><integro:currency amount="<%=drawingLimitAmt%>" param="currency"/>&nbsp;
    <%
			if (outerLimitRef == null || outerLimitRef.equals("0")) {
	%>		
		<integro:amount amount="<%=drawingLimitAmt%>" param="amount" decimal="2"/>
	<% 		} else { %>
		(<integro:amount amount="<%=drawingLimitAmt%>" param="amount" decimal="2"/>)
    <% 		} %>
	</td>    
    <%
    } else {
    %>
    <td class="amount">-&nbsp;</td>
    <%
        }
    %>

    <%
        if (outstandingLimitAmt != null) {
    %>
	
    <td class="amount"><integro:currency amount="<%=outstandingLimitAmt%>" param="currency"/>&nbsp;
     <%
			if (outerLimitRef == null || outerLimitRef.equals("0")) {
	%>
	<integro:amount amount="<%=outstandingLimitAmt%>" param="amount" decimal="2"/>
	<% 		} else { %>
	(<integro:amount amount="<%=outstandingLimitAmt%>" param="amount" decimal="2"/>)
    <% 		} %>
	</td>
    <%
    } else {
    %>
    <td class="amount">-&nbsp;</td>
    <%
        }
    %>
	-------------------------%>
    <td nowrap="nowrap"><integro:empty-if-null value="<%=securityID%>"/>&nbsp;</td>    
    <%-- <td class="amount"><integro:empty-if-null value="<%= requiredSecurityCoverage %>" /></td>--%>
    <td nowrap="nowrap"><integro:empty-if-null value="<%=securityType%>"/>&nbsp;</td>
    <td><integro:empty-if-null value="<%=linkage%>"/>&nbsp;</td>
    <td width="5%"><a href="MILimitList.do?event=show_lmt_cust_detail&customerID=<%=request.getAttribute("customerID")%>&limitId=<%=limitID%>&limitProfileID=<%=request.getAttribute("limitProfileID")%>">View</a>
    </td>
</tr>
<%
    } // End of for (int i = 0; i < limits.length; i++) 
%>
<!--
<tr class="odd">
    <td colspan="2" class="fieldname">Limit reduced to Zero</td>
    <td><integro:boolean-display style="yn" value="<%=isZerorised%>"/>&nbsp;</td>
    <td colspan="2" class="fieldname">Date Limit reduced to Zero</td>
    <td colspan="2"><integro:empty-if-null value="<%=zerorisedDate%>"/>&nbsp;</td>
    <td colspan="9">&nbsp;</td>
</tr>
<tr class="odd">
    <td colspan="2" class="fieldname">Reasons for Limit Reduced to Zero</td>
    <td colspan="14"><integro:empty-if-null value="<%=reason%>"/>&nbsp;</td>
</tr>
-->
<%
    } // End of if (limits != null && limits.length != 0) 
%>
<tr class="odd">
<%--
    <td class="total" valign="top">&nbsp;</td>
    <td class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalAppLimitAmt,usd)%>" param="amount" decimal="2"/></td>
    <!--<td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalActLimitAmt,usd)%>" param="amount" decimal="2"/></td>-->
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalDrawLimitAmt,usd)%>" param="amount" decimal="2"/></td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalOutLimitAmt,usd)%>" param="amount" decimal="2"/></td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <%--<td valign="top" class="total">&nbsp;</td> --%>

</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<%
} else {
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Limit List</h3></td>
    </tr>
    <% if (isLimitEditAllowed) { %>
    <tr>
        <td align="right"><input type="button" name="Button" value="Edit" class="btnNormal" style="width:50"
                                 onclick="editLimits()"/></td>
    </tr>
    <% } %>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td>

<table width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
<thead>
    <tr>
        <td width="3%"><bean:message key="label.global.sn"/></td>
        <td width="9%"><bean:message key="label.limit.id"/></td>
        <td width="9%"><bean:message key="label.facility.name"/></td>
        <td width="8%"><bean:message key="label.facility.type"/></td>
        <td width="6%"><bean:message key="label.facility.sanctionedamount"/></td>
        <td width="7%"><bean:message key="label.facility.releasableamount"/></td>
        <td width="7%"><bean:message key="label.facility.releasedamount"/>  </td>
        <td width="7%">Coverage Amount</td>
        <td width="7%"><bean:message key="label.facility.securityid"/></td>
        <td width="10%" nowrap="nowrap">Security Type/Subtype</td>
        <td width="9%">Limit-Security Linkage</td>
        <td width="5%"><bean:message key="label.global.action"/></td>
    </tr>
</thead>
<tbody>
        <tr class="odd">
            <td colspan="18">
                <bean:message key="label.global.not.found"/>
            </td>
        </tr>
    </tbody>
</table>
</td>
</tr>
</tbody>
</table>
<%
    }
%>
<%----------------------------Co-Borrower/Hirer Limits 1.1 Commented on 24/11/2011
<br>
<%
if (!isMR)
{
    if (coBorrowerLimitObList.length != 0) {
%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3><bean:message key="label.global.co.borrower"/> Limits</h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<%
    HashMap customerIDMap = new HashMap();
    for (int x = 0; x < coBorrowerLimitObList.length; x++) {
        ICoBorrowerLimit coBorrowerLimit = coBorrowerLimitObList[x];
        String customerID = String.valueOf(coBorrowerLimit.getCustomerID());
        if (customerIDMap.containsKey(customerID)) {
            ArrayList coBorrowerList = (ArrayList) customerIDMap.get(customerID);
            coBorrowerList.add(coBorrowerLimit);
        } else {
            ArrayList coBorrowerList = new ArrayList();
            coBorrowerList.add(coBorrowerLimit);
            customerIDMap.put(customerID, coBorrowerList);
        }
    }
    String color1 = "";

    Iterator iterator = customerIDMap.keySet().iterator();
    while (iterator.hasNext()) {
        String customerID = (String) iterator.next();
        ArrayList coBorrowerList = (ArrayList) customerIDMap.get(customerID);
        int size = coBorrowerList.size();
        if (isEditAllowed) {
            for (int i = 0; i < size; i++) {
                ICoBorrowerLimit coBorrowerLimit = (ICoBorrowerLimit) coBorrowerList.get(0);
//                isCoboEditAllowed = dpProxy.isLocationAccessibleByUser(userTeam, cust.getCMSLegalEntity().getCustomerSegment(), coBorrowerLimit.getBookingLocation());
//                if (isCoboEditAllowed) {
                    String coBorrowBkgLctnCntry = "";
                    String coBorrowBkgLctnOrg = "";
                    if (coBorrowerLimit.getBookingLocation() != null){
                        if (coBorrowerLimit.getBookingLocation().getCountryCode() != null)
                            coBorrowBkgLctnCntry = coBorrowerLimit.getBookingLocation().getCountryCode();
                        if (coBorrowerLimit.getBookingLocation().getOrganisationCode() != null)
                            coBorrowBkgLctnOrg = coBorrowerLimit.getBookingLocation().getOrganisationCode();
                    }
/*                    
                    isCoboEditAllowed = dpProxy.isDataAccessAllowed(ICMSConstant.INSTANCE_LIMIT, IDataProtectionProxy.DAP_EDIT, teamTypeMshipID,
                            new String[]{coBorrowBkgLctnCntry}, new String[]{coBorrowBkgLctnOrg}, true);
                    if (isCoboEditAllowed) {
                        break;
                    }
*/                    
//                }
            }
        }
%>
<tr><td>&nbsp;</td></tr>
<% if (isCoboEditAllowed) { %>

<tr>
    <td align="right"><input type="button" name="Button" value="Edit" class="btnNormal" style="width:50"
                             onclick="editCoBorrowerLimits('<%=customerID%>')"/></td>
</tr>
<tr><td>&nbsp;</td></tr>
<% } %>
<tr>
<td>
<table width="100%" class="tblInfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
<thead>
    <tr>
        <td width="3%"><bean:message key="label.global.sn"/></td>
        <td width="9%"><bean:message key="label.global.co.borrower"/><bean:message key="label.limit.id"/></td>
        <td width="8%"><bean:message key="label.product.desc"/></td>
        <td width="9%"><bean:message key="label.global.outer.limit.id"/></td>
        <td width="12%"><bean:message key="label.limit.approved.limit"/></td>
        <td width="12%"><bean:message key="label.limit.drawing.limit"/></td>
        <td width="9%"><bean:message key="label.customer.id"/><br/>
        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
        <bean:message key="label.customer.subprofile.id"/>
        <% } %>
        </td>
        <td width="15%"><bean:message key="label.global.legal.name"/><br/>
        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
        <bean:message key="label.customer.subprofile.name"/>
        <% } %>
        </td>
        <!--
        <td width="9%"><bean:message key="label.security.id"/></td>
        <td>Required Security Coverage (%)</td>
        <td width="9%">Limit-Security Linkage</td>
        <td width="10%" nowrap="nowrap"><bean:message key="label.security.type"/>/<bean:message key="label.security.sub.type"/></td>
        <td width="15%"><bean:message key="label.security.loc"/></td>
	<td width="4%"><bean:message key="label.org.code "/></td>
	-->
        <td width="5%"><bean:message key="label.global.action"/></td>
    </tr>
</thead>
<%
    double totalAppLimitAmt1 = 0;
    double totalActLimitAmt1 = 0;
    if (coBorrowerList.size() != 0) {
        ICoBorrowerLimit coBorrowerLimit1 = (ICoBorrowerLimit) coBorrowerList.get(0);
        String reason1 = coBorrowerLimit1.getZerorisedReasons();
        String zerorisedDateStr1 = coBorrowerLimit1.getZerorisedDate() == null ? "" : DateUtil.convertToDisplayDate(coBorrowerLimit1.getZerorisedDate());
        boolean isZerorised1 = coBorrowerLimit1.getLimitZerorised();
        // start cr 035
        ICollateralAllocation[] coBorrowerSecurities;
        int rowNum = 0;
        for (int x = 0; x < coBorrowerList.size(); x++) {
            ICoBorrowerLimit coBorrowerLimit = (ICoBorrowerLimit) coBorrowerList.get(x);
            String coSecurityID = "";
            String coLinkage = "";
            String coSecurityType = "";
            String coLocation = "";
			String coOrgCode="";
            /*try {
                if(coBorrowerLimit.getCollateralAllocations()!=null){
	                coBorrowerSecurities = coBorrowerLimit.getCollateralAllocations();
	
	                for (int coSec = 0; coSec < coBorrowerSecurities.length; coSec++) {
						if(coSec != 0){
							coSecurityID = coSecurityID + "<br>";
						}
	                    coSecurityID = coSecurityID +coBorrowerSecurities[coSec].getCollateral().getSCISecurityID();
	                    String hostStatus = coBorrowerSecurities[coSec].getHostStatus();
	                    if (hostStatus != null && hostStatus.equals( ICMSConstant.HOST_STATUS_DELETE )) {
	                        coLinkage += "<span class=deleted> "+"Deleted" + "</span><br>";
	                    } else
	                        coLinkage += "Active" + "<br>";
	                    String type = coBorrowerSecurities[coSec].getCollateral().getCollateralType().getTypeName();
	                    String subType = coBorrowerSecurities[coSec].getCollateral().getCollateralSubType().getSubTypeName();
	                    coSecurityType += type + "/" + subType + "<br>";
	                        if (coBorrowerSecurities[coSec].getCollateral().getCollateralLocation() != null)
	                            coLocation += cList.getInstance().getCountryName(coBorrowerSecurities[coSec].getCollateral().getCollateralLocation()) + "<br>";
						    if (coBorrowerSecurities[coSec].getCollateral().getSecurityOrganization() != null) {
	                        coOrgCode += CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,coBorrowerSecurities[coSec].getCollateral().getSecurityOrganization()) + "<br>";
	                    }
	                }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }*/
            //end of cr 035
			
			coOrgCode = ("".equals(coOrgCode)) ? null : "";

            rowNum++;
            String limitRef1 = coBorrowerLimit.getLimitRef();
            String limitStatus1 = "";
            if (coBorrowerLimit.getStatus() != null && coBorrowerLimit.getStatus().equals(ICMSConstant.STATE_DELETED)) {
                limitStatus1 = "Deleted";
            }

            String productKey1 = coBorrowerLimit.getProductDesc()+"|"+(coBorrowerLimit.getApprovedLimitAmount() != null ? coBorrowerLimit.getApprovedLimitAmount().getCurrencyCode():"");

            if (productKey1 == null) {
                productKey1 = "";
            }

            String productDesc1 = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.COMMON_CODE_PRODUCT_TYPE, productKey1);
            if (productDesc1 == null) {
                productDesc1 = "-";
            }

            String outerLimitRef1 = coBorrowerLimit.getOuterLimitRef();
            if (outerLimitRef1 == null) {
                outerLimitRef1 = "0";
            }

            Amount appLimitAmt1 = coBorrowerLimit.getApprovedLimitAmount();
            Amount actLimitAmt1 = coBorrowerLimit.getActivatedLimitAmount();
            if (outerLimitRef1.equals("0") 
            		&& coBorrowerLimit.getStatus() != null 
            		&& !coBorrowerLimit.getStatus().equals(ICMSConstant.STATE_DELETED)) {
		        if (appLimitAmt1 != null && appLimitAmt1.getCurrencyCode()!=null) {
	                totalAppLimitAmt1 += fr.convert(appLimitAmt1, usd).getAmount();
				}
            }

	        if (actLimitAmt1 != null) {
                totalActLimitAmt1 += fr.convert(actLimitAmt1, usd).getAmount();
			}
            
            ICMSCustomer customer = coBorrowerLimit.getCustomer();

            String leID = customer.getCMSLegalEntity().getLEReference();
            String subProfileID = customer.getCustomerReference();
            String leName = customer.getCMSLegalEntity().getLegalName();
            String subProfileName = customer.getCustomerName();
            
            color1 = (x%2 == 0) ? "even" : "odd";

%>
<tbody>
    <tr class="<%=color1%>">
        <td class="index"><%=rowNum%></td>
        <td><integro:empty-if-null value="<%=limitRef1%>"/>&nbsp;<font color="#FF0000" size="1"><%=limitStatus1%></font>
        </td>
        <td><integro:empty-if-null value="<%=productDesc1%>"/></td>
        <%
            String requiredSecurityCoverage = "-"; 
            if (coBorrowerLimit.getRequiredSecurityCoverages() != ICMSConstant.FLOAT_INVALID_VALUE) {
                requiredSecurityCoverage = MapperUtil.mapDoubleToString(coBorrowerLimit.getRequiredSecurityCoverages(), 0, locale);
            }
            if (outerLimitRef1.equals("0")) {
        %>
        <td>-&nbsp;</td>
        <%
        } else {
        %>
        <td><integro:empty-if-null value="<%=outerLimitRef1%>"/>&nbsp;</td>
        <%
            }
        %>

        <%
            if (appLimitAmt1 != null) {
        %>
        <td class="amount"><integro:currency amount="<%=appLimitAmt1%>" param="currency"/>&nbsp;
            <%
                if (outerLimitRef1.equals("0")) {
            %>
            <integro:amount amount="<%=appLimitAmt1%>" param="amount" decimal="2"/>
            <%
            } else {
            %>
            (<integro:amount amount="<%=appLimitAmt1%>" param="amount" decimal="2"/>)
            <%
                }
            %>
        </td>
        <%
        } else {
        %>
        <td class="amount">-&nbsp;</td>
        <%
            }
        %>

        <%
            if (actLimitAmt1 != null) {
        %>
        <td class="amount"><integro:currency amount="<%=actLimitAmt1%>" param="currency"/>&nbsp;
            <%
                if (outerLimitRef1.equals("0")) {
            %>
            <integro:currency amount="<%=actLimitAmt1%>" param="amount"/>
            <%
            } else {
            %>
            (<integro:currency amount="<%=actLimitAmt1%>" param="amount"/>)
            <%
                }
            %>
        </td>
        <%
        } else {
        %>
        <td class="amount">-&nbsp;</td>
        <%
            }
         
        %>

        <td><integro:empty-if-null value="<%=leID%>"/><br>
        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
        <integro:empty-if-null value="<%=subProfileID%>"/>&nbsp;
        <% } %>
        </td>
        <td nowrap="nowrap"><integro:empty-if-null value="<%=leName%>"/><br>
        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
        <integro:empty-if-null value="<%=subProfileName%>"/>&nbsp;
        <% } %>
        </td>
        
        <td nowrap="nowrap"><%=coSecurityID%>&nbsp;</td>
        <td class="amount">100<integro:empty-if-null value="<%=requiredSecurityCoverage  %>"/></td>
        Co-Borrower/Hirer Limits 1.1 End Commented on 24/11/2011-----------------------------%>
        <%--------------------Co-Borrower/Hirer Limits 1.2 Commented on 24/11/2011
        <td><integro:empty-if-null value="<%=coLinkage%>"/>&nbsp;</td>
        <td nowrap="nowrap"><integro:empty-if-null value="<%=coSecurityType%>"/>&nbsp;</td>
        <td nowrap="nowrap"><integro:empty-if-null value="<%=coLocation%>"/>&nbsp;</td>
		<td nowrap="nowrap"><integro:empty-if-null value="<%=coOrgCode%>"/>&nbsp;</td>
		
        <td width="5%"><a
                href="Limits.do?event=view_co_borrower_limit_details&limitID=<%=coBorrowerLimit.getLimitID()%>">View</a>
        </td>
    </tr>
</tbody>
<%
    }

    }
%>

<tr class="odd">
    <td class="total" valign="top">&nbsp;</td>
    <td class="total" valign="top">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalAppLimitAmt1,usd)%>" param="amount" decimal="2"/></td>
    <td class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%>&nbsp;
        <integro:amount amount="<%=new Amount(totalActLimitAmt1,usd)%>" param="amount" decimal="2"/></td>
    <td class="total" valign="top">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <!--
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
    <td valign="top" class="total">&nbsp;</td>
	<td valign="top" class="total">&nbsp;</td>
	-->
</tr>
</table>
</td>
</tr>

<%
    }    // while loop
%>
</tbody>
</table>
<%
} else {
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3><bean:message key="label.global.co.borrower"/> Limits</h3></td>
        </tr>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    </thead>
    <tbody>
        <td><strong><font size="2"><br/><bean:message key="label.global.not.found"/></font></strong></td>
    </tbody>
</table>
<%
    }
}  // End-if (!isMR)
%>
Co-Borrower/Hirer Limits 1.2 End Commented on 24/11/2011---------------%>
<br>
<table border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:30px">
    <tr>
        <% 
         	String limitProfileID = (String) request.getAttribute("limitProfileID");
    		String customerID = (String) request.getAttribute("customerID"); 
        	String transactionID = (String)session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.S_TRX_ID");
        	if (transactionID != null) {%>
        <td>
            <a href="ToDo.do?event=customertodo&customerID=<%=customerID%>&limitprofileID=<%=limitProfileID%>&transactionID=<%=transactionID%>&taskFlag=M"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1"/></a></td>
        <%} else {%>
        <td width="100" valign="middle" style="text-align:center">
            <a href="CustomerSearch.do?event=return" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif"
                                                                                   name="Image4411" border="0"
                                                                                   id="Image4411"/></a>
        </td>
        <%}%>
    </tr>
</table>

</html:form>
</body>
</html>