<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.collateral.bus.OBCollateral,
                 java.util.*,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
                 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Collection,
                 java.util.HashMap,
                 java.util.Vector,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.CollateralComparator,
                 com.integrosys.cms.app.customer.bus.ICustomerSearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.limit.bus.OBCoBorrowerLimit" %>
<%@ page import="com.integrosys.cms.app.limit.proxy.ILimitProxy" %>
<%@ page import="com.integrosys.cms.app.limit.proxy.LimitProxyFactory" %>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimit" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/CustomerViewSecurities.jsp,v 1.63 2006/11/23 12:32:39 jzhan Exp $
     * @author $Author: jzhan $<br>
     * @version $Revision: 1.63 $
     * @since $Date: 2006/11/23 12:32:39 $
     * Tag: $Name: DEV_20061123_B286V1 $
     */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    Map rs = (Map) request.getAttribute("securityOb");
    String limitProfileID = (String) request.getAttribute("limitProfileID");
    String customerID = (String) request.getAttribute("customerID");
     Map collCodeDescMap = (Map) request.getAttribute("collCodeDescMap");
     Map countryCodeNameMap = (Map) request.getAttribute("countryCodeNameMap");
     Map sysBankBranchCodeNameMap = (Map) request.getAttribute("sysBankBranchCodeNameMap");
     //Added by Uma Khot: Start: Phase 3 CR:Search based on Active and deleted security
     String activeDeleteFlag=(String)request.getAttribute("activeDeleteFlag");
     System.out.println("activeDeleteFlag:"+activeDeleteFlag);
     //Added by Uma Khot: End: Phase 3 CR:Search based on Active and deleted security
    String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_TRX_ID);
    String startIndex = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "startIndex");
    OBCollateral obcol = new OBCollateral();
    Set set = rs.keySet();
    Collection col = rs.values();
    String limitid = new String();
    String outerid = "-";
    String SubType = new String();
    String path = new String();
    String viewPath = new String();
    int sno = 0;
 /*
    CountryList cList = CountryList.getInstance();
    List ctryLbls = (List) CountryList.getInstance().getCountryLabels();
    List ctryVals = (List) CountryList.getInstance().getCountryValues();
  */
    HashMap custResHash = (HashMap) request.getAttribute("customerObList");
    if (custResHash != null) {
        DefaultLogger.debug(this, "custResHash size=" + custResHash.size());
    } else {
        DefaultLogger.debug(this, "custResHash Null");
        custResHash = new java.util.HashMap();
    }
%>



<!-- InstanceBeginEditable name="CssStyle" -->
<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%>

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
    function MM_swapImgRestore() { //v3.0
        var i,x,a = document.MM_sr;
        for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
    }

    function MM_preloadImages() { //v3.0
        var d = document;
        if (d.images) {
            if (!d.MM_p) d.MM_p = new Array();
            var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
            for (i = 0; i < a.length; i++)
                if (a[i].indexOf("#") != 0) {
                    d.MM_p[j] = new Image;
                    d.MM_p[j++].src = a[i];
                }
        }
    }

    function MM_findObj(n, d) { //v4.01
        var p,i,x;
        if (!d) d = document;
        if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
            d = parent.frames[n.substring(p + 1)].document;
            n = n.substring(0, p);
        }
        if (!(x = d[n]) && d.all) x = d.all[n];
        for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
        for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
        if (!x && d.getElementById) x = d.getElementById(n);
        return x;
    }

    function MM_swapImage() { //v3.0
        var i,j = 0,x,a = MM_swapImage.arguments;
        document.MM_sr = new Array;
        for (i = 0; i < (a.length - 2); i += 3)
            if ((x = MM_findObj(a[i])) != null) {
                document.MM_sr[j++] = x;
                if (!x.oSrc) x.oSrc = x.src;
                x.src = a[i + 2];
            }
    }
    
    // Added by Uma Khot: Start: Phase 3 CR:Search based on Active and deleted security 
    function showSecurity(selectedObj,customerID,limitProfileID,startIndex){
    var index=	selectedObj.selectedIndex;
   // alert("Inside showSecurity");
    if(selectedObj.options[index].value == "Active"){
     //   alert("Active");
        location.href="CustomerProcess.do?event=viewsecurities&customerID="+customerID+"&limitProfileID="+limitProfileID+"&startIndex="+startIndex+"&activeDeleteFlag=Active";
    }
    else  if(selectedObj.options[index].value == "Deleted"){
    	//  alert("Deleted");
    	 location.href="CustomerProcess.do?event=viewsecurities&customerID="+customerID+"&limitProfileID="+limitProfileID+"&startIndex="+startIndex+"&activeDeleteFlag=Deleted";
    }
    }
    // Added by Uma Khot: End: Phase 3 CR:Search based on Active and deleted security
-->
</script>
<!-- InstanceEndEditable -->


<body>
<html:form action="CustomerProcess.do?event=viewsecurities">
<% if (set.size() != 0) { %>
<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Securities List</h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>


<tbody>
<!-- Added by Uma Khot: Start: Phase 3 CR:Search based on Active and deleted security  -->
<tr>
<td>
 <select name="activeDeleteSelection"  onchange="javascript:showSecurity(this, '<%=customerID %>', '<%=limitProfileID %>', '<%=startIndex %>')">
  					  <option value="" selected>Please Select</option>
                      <option value="Active" >Active</option>
                      <option value="Deleted">Deleted</option>
</select>
</td>
</tr>
<!-- Added by Uma Khot: End: Phase 3 CR:Search based on Active and deleted security  -->
<tr>
<td>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
    <tr>
        <td width="3%">S/N</td>
        <td width="7%">Source Security ID<%--<bean:message key="label.security.id.cms"/>--%></td>
        <td width="7%">Collateral Name</td>
        <td width="20%">Security Type /<br/>SubType</td>
        <!--Added by Uma Khot: PHASE 3 CR Start:For security list realignment   -->
        <td width="7%">Security Priority</td>
        <!--Added by Uma Khot: PHASE 3 CR End:For security list realignment   -->
        <td width="7%">Security Currency</td>
        <td width="9%">Open Market Value( OMV)<%--<bean:message key="label.valuation.omv"/>--%> </td>
        <td width="7%">Security Coverage (%)</td>
        <!--Added by Uma Khot: PHASE 3 CR Start:For security list realignment   -->
        <td width="9%">Security Limit Linkage Status</td>
        <td width="7%">Facility Name</td>
        <td width="7%">Insurance Coverage</td>
        <td width="6%">Action</td>
         <td width="9%">Facility ID</td>
        <td width="7%">Security Booking Location</td>
        <td width="7%">Security Branch Name</td>
        <!--Added by Uma Khot: PHASE 3 CR End:For security list realignment   -->
       <%--
        <td width="9%">Customer Category</td>
        <td width="9%">Security Location</td>
        <td width="6%">Organisation Code</td>
        --%>
        
        <%--
        <td width="9%"><bean:message key="label.valuation.fsv" /></td>
        --%>

        
        <%--
        <td width="8%">Product Desc</td>
        <td width="9%">Outer Limit ID</td>

        <!-- for R1.3 CR013 -->
        <%-- <td width="9%">CIF No. /<br> Customer Name </td>
        <td width="9%"><bean:message key="label.global.aa"/> <bean:message key="label.ref.no"/> /<br> <bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
        --%>
        <!-------------------->
  <%--
        <td width="5%">Security Details Completed</td>--%>
        
    </tr>
</thead>
<tbody>

<%
    ICollateral[] cols = (ICollateral[]) set.toArray(new ICollateral[0]);
    boolean isCoBorrowerInd = false;
    Arrays.sort(cols, new CollateralComparator());
    Iterator i = Arrays.asList(cols).iterator();
    String customerCategory = "";
	  String securityID;

    String rowClass = "";
    ArrayList arrayListforOBLimit = new ArrayList();
    Iterator j = col.iterator();
    while (i.hasNext()) {
        obcol = ((OBCollateral) i.next());

        //cap at zero instead of showing negative
        Amount fsvAmt = null;
        if (obcol.getFSV() != null)
        {
            fsvAmt = new Amount(Math.max(obcol.getFSV().getAmount(), 0), obcol.getFSV().getCurrencyCode());
		}

			securityID = String.valueOf(obcol.getCollateralID());
			/*
            List sourceAlias = obcol.getSecSystemName();
            if (sourceAlias != null)		    
		    {
				for(int n=0; n<sourceAlias.size(); n++)
				{
					securityID += (String)(sourceAlias.get(n)) + "<br>";
				}
			}
			*/
        arrayListforOBLimit = (ArrayList) rs.get(obcol);
        ArrayList newarrayList = new ArrayList();
        
       
        if(obcol.getCollateralLimits()[0]!=null){
        if ("MB".equals(obcol.getCollateralLimits()[0].getCustomerCategory()) && (obcol.getCollateralLimits()[0].getCoBorrowerLimitID() <= 0))
        {
            customerCategory = "Main Borrower";
            isCoBorrowerInd = false;
        } else {
            customerCategory = "Co-Borrower";
            isCoBorrowerInd = true;
        }
        }
        for (int l = 0; l < arrayListforOBLimit.size(); l++) {
            if (newarrayList.contains(arrayListforOBLimit.get(l))) {

            } else {
                newarrayList.add(arrayListforOBLimit.get(l));
            }
            
            
        }
        OBLimit oblimit[] = new OBLimit[arrayListforOBLimit.size()];

        OBCoBorrowerLimit[] obCoBorrowerLimit = new OBCoBorrowerLimit[arrayListforOBLimit.size()];
        sno++;
        String collaterallocation = "-";
        if (sno % 2 != 0) {
            rowClass = "odd";
        } else {
            rowClass = "even";
        }


%>
<tr class="<%=rowClass%>">

<td class="index" valign="top"><%=sno%></td>

<% 
		SubType = obcol.getCollateralSubType().getSubTypeCode();
    viewPath = SecuritySubTypeUtil.getUrl(SubType, 2);
    viewPath = viewPath + "&collateralID=" + obcol.getCollateralID() + "&from=" + CollateralAction.READ_SECURITIES_2;
%>

<td valign="top" nowrap="nowrap" ><a href="<%=viewPath%>"><%=securityID%><BR>
    <%if (obcol.getStatus() != null && (obcol.getStatus().equals(ICMSConstant.STATE_DELETED) || (obcol.getStatus().equals(ICMSConstant.STATE_PENDING_DELETE)))) {%>
    <font color="#FF0000" size="1">Deleted</font>
    <%}%>
</td>

<td nowrap="nowrap" valign="top">
	<integro:empty-if-null value="<%=collCodeDescMap.get(obcol.getCollateralCode()) %>"/>
</td>

<td nowrap="nowrap" valign="top">
    <integro:empty-if-null value="<%=obcol.getCollateralType().getTypeName()%>"/>/
    <integro:empty-if-null value="<%=obcol.getCollateralSubType().getSubTypeName()%>"/><br/>
     <%--<integro:empty-if-null value="<%=obcol.getCurrencyCode()%>"/>--%>
</td>
<!-- Phase 3 CR for Customer Process realignment security list -->
<td nowrap="nowrap" valign="top">
<!--Added by Uma Khot: PHASE 3 CR Start:For security list realignment   -->
      <%if(obcol.getSecPriority()!=null){ %>
              	 <%=obcol.getSecPriority().equalsIgnoreCase("y")?"Primary":"Secondary"%>&nbsp;
              	 <%} else { %>
              	 -
              	 <%} %>
<!--Added by Uma Khot: PHASE 3 CR End:For security list realignment   -->
</td>

<td nowrap="nowrap" valign="top">
    <integro:empty-if-null value="<%=obcol.getCurrencyCode()%>"/>
</td>


<td valign="top" class="amount"><integro:amount amount="<%=obcol.getCMV()%>" locale="<%=locale%>" decimal="2" />&nbsp;</td>

<%-- for (int k = 0; k < ctryLbls.size(); k++) {
    if ((obcol.getCollateralLocation() != null) && (obcol.getCollateralLocation()).equals(ctryVals.get(k))) {  //if this value not in selected value print..
        collaterallocation = (String) ctryLbls.get(k);
--%>
<%--
        }
    }
--%>

<%--<td nowrap="nowrap" valign="top"><integro:empty-if-null value="<%=customerCategory%>"/>&nbsp;</td>
<td nowrap="nowrap" valign="top"><integro:empty-if-null value="<%=collaterallocation%>"/>&nbsp;</td>
--%>
<%
    String securityOrg = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE, obcol.getSecurityOrganization());%><%--

<td nowrap="nowrap" valign="top"><integro:empty-if-null value="<%=securityOrg%>"/>&nbsp;</td>

--%>

<%--
<td valign="top" class="amount"><integro:amount amount="<%=fsvAmt%>" locale="<%=locale%>" decimal="2" />&nbsp;</td>
--%>
<%

    String limitRef[] = new String[arrayListforOBLimit.size()];
    String secLimitLinkage[] = new String[arrayListforOBLimit.size()];
    String productDesc[] = new String[arrayListforOBLimit.size()];
    String outerLimitRef[] = new String[arrayListforOBLimit.size()];
    String innerLimitID[] = new String[arrayListforOBLimit.size()];
    String limitSecName[] = new String[arrayListforOBLimit.size()];
    String limitSecCov[] = new String[arrayListforOBLimit.size()];
    boolean innerOuterSameBCA[] = new boolean[arrayListforOBLimit.size()];
    int counter = 0;
    if (isCoBorrowerInd) {
        for (int k = 0; k < newarrayList.size(); k++) {
            obCoBorrowerLimit[k] = (OBCoBorrowerLimit) newarrayList.get(k);
            if (obCoBorrowerLimit[k] != null) {
                if (obCoBorrowerLimit[k].getCollateralAllocations() != null) {
                    for (int m = 0; m < obCoBorrowerLimit[k].getCollateralAllocations().length; m++) {
                        if (obCoBorrowerLimit[k].getCollateralAllocations()[m].getCollateral() != null) {
                            if (obCoBorrowerLimit[k].getCollateralAllocations()[m].getCollateral().getCollateralID() == obcol.getCollateralID()) {
                            	
                                if(obCoBorrowerLimit[k].getLimitRef()!=null && ICMSConstant.LONG_INVALID_VALUE!=Long.parseLong(obCoBorrowerLimit[k].getLimitRef()))
								{
                                    limitRef[counter] = obCoBorrowerLimit[k].getLimitRef();
								}
                                else
                                    limitRef[counter] = "-";
                                if (obCoBorrowerLimit[k].getCollateralAllocations()[m].getHostStatus() != null && obCoBorrowerLimit[k].getCollateralAllocations()[m].getHostStatus().equals(ICMSConstant.HOST_STATUS_DELETE))
                                    secLimitLinkage[counter] = "<span class=deleted> "+ "Deleted" + " </span>";
                                else
                                    secLimitLinkage[counter] = "Active";

                                ILimitProxy limitproxy = LimitProxyFactory.getProxy();
                                ILimit limit = null;
                                if (obCoBorrowerLimit[k].getOuterLimitID() != ICMSConstant.LONG_INVALID_VALUE) {
                                    limit = limitproxy.getLimit(obCoBorrowerLimit[k].getOuterLimitID());
                                    productDesc[k] = limit.getProductCode();
                                    /*
                                    if (limit.getProductDesc() != null) {
                                        productDesc[k] = limit.getProductDesc()+"|"+(limit.getApprovedLimitAmount() != null ? limit.getApprovedLimitAmount().getCurrencyCode():"");
                                    }
                                    */
                                }

                                //if (CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.COMMON_CODE_PRODUCT_TYPE, productDesc[k]) != null)
                                    productDesc[counter] = CommonCodeList.getInstance(ICMSConstant.COMMON_CODE_PRODUCT_TYPE).getCommonCodeLabel(productDesc[k]);

                                if (obCoBorrowerLimit[k].getOuterLimitRef() != null) {
                                    outerid = obCoBorrowerLimit[k].getOuterLimitRef();
%>
<% if (outerid.equals("0")) {
    outerLimitRef[counter] = "-";
} else {
    outerLimitRef[counter] = obCoBorrowerLimit[k].getOuterLimitRef();
}
%>
<% } else {
    outerLimitRef[counter] = "-";
}
    innerLimitID[counter] = String.valueOf(obCoBorrowerLimit[k].getLimitID());
    //				innerOuterSameBCA[counter]=oblimit[k].getIsInnerOuterSameBCA();
%>
<% counter++;

}    //end of
}  // end of    if(oblimit[k].getCollateralAllocations()[m].getCollateral()!=null)
}    // end of for
}//end of  if( oblimit[k].getCollateralAllocations()!=null)
}     // end of     if(oblimit[k]!=null)
} // end of for
}


    if (!isCoBorrowerInd) {
        for (int k = 0; k < newarrayList.size(); k++) {
            oblimit[k] = (OBLimit) newarrayList.get(k);
            if (oblimit[k] != null) {
                if (oblimit[k].getCollateralAllocations() != null) {
                    for (int m = 0; m < oblimit[k].getCollateralAllocations().length; m++) {
                        if (oblimit[k].getCollateralAllocations()[m].getCollateral() != null) {
                            if (oblimit[k].getCollateralAllocations()[m].getCollateral().getCollateralID() == obcol.getCollateralID()) {
                                
								String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_SOURCE_SYSTEM, (oblimit[k].getSourceId() == null)?"":oblimit[k].getSourceId());
								limitRef[counter] = oblimit[k].getLimitRef() + ((sourceDesc == null)?"":(" - " + sourceDesc));
                                limitSecName[counter] = oblimit[k].getFacilityName() ;
                                
                                if (oblimit[k].getCollateralAllocations()[m].getHostStatus() != null && oblimit[k].getCollateralAllocations()[m].getHostStatus().equals(ICMSConstant.HOST_STATUS_DELETE)){
                                    secLimitLinkage[counter] = "<span class=deleted> " + "Deleted" + "</span>";
                                }else{
                                    secLimitLinkage[counter] = "Active";
                                    
                                }

                                if (oblimit[k].getCollateralAllocations()[m].getLmtSecurityCoverage() != null){
                                	limitSecCov[counter] = oblimit[k].getCollateralAllocations()[m].getLmtSecurityCoverage();
                                }

                               // if (oblimit[k].getProductDesc() != null) {
                               //     if (CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, oblimit[k].getProductDesc().toString()) != null)
                                        productDesc[counter] = CommonCodeList.getInstance(ICMSConstant.COMMON_CODE_PRODUCT_TYPE).getCommonCodeLabel(oblimit[k].getProductCode());
                               // }

                                if (oblimit[k].getOuterLimitRef() != null) {
                                    outerid = oblimit[k].getOuterLimitRef();
%>
<% if (outerid.equals("0")) {
    outerLimitRef[counter] = "-";
} else {
    outerLimitRef[counter] = oblimit[k].getOuterLimitRef();
}
%>
<% } else {
    outerLimitRef[counter] = "-";
}
    innerLimitID[counter] = String.valueOf(oblimit[k].getLimitID());
    innerOuterSameBCA[counter] = oblimit[k].getIsInnerOuterSameBCA();
%>
<% counter++;

}    //end of
}  // end of    if(oblimit[k].getCollateralAllocations()[m].getCollateral()!=null)
}    // end of for
}//end of  if( oblimit[k].getCollateralAllocations()!=null)
}     // end of     if(oblimit[k]!=null)
} // end of for
} %>

<td nowrap="nowrap" valign="top" class="amount">
<%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=limitSecCov[k]%>"/>&nbsp;<br>&nbsp;<br>	
    <%}%>
</td>

<td nowrap="nowrap" valign="top">
    <%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <!--Added by Uma Khot: PHASE 3 CR Start:For security list realignment   -->
    <integro:empty-if-null value="<%=secLimitLinkage[k]%>"/>&nbsp;<br>&nbsp;<br>
    <!--Added by Uma Khot: PHASE 3 CR End:For security list realignment   -->
    <%}%>
</td>

<td nowrap="nowrap">
<%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=limitSecName[k]%>"/>&nbsp;<br>&nbsp;<br>	
    <%}%>

</td>

<td valign="top" class="amount">&nbsp;-&nbsp;</td>



<%--<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=productDesc[k]%>"/>&nbsp;<br>&nbsp;<br>
    <%}%>
</td>

--%>
<%--
<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {
        if (innerOuterSameBCA[k]) { %>
    <font color="000000">
        <integro:empty-if-null value="<%=outerLimitRef[k]%>"/>
    </font>&nbsp;<br>&nbsp;<br>
    <% } else { %>
    <font color="000000">
        <integro:empty-if-null value="<%=outerLimitRef[k]%>"/>
    </font>&nbsp;<br>&nbsp;<br>
    <% } %>
    <% }%>
</td>
 --%>
<% String status = "No";
    if (obcol.getIsPerfected())
        status = "Yes";
%>

<!-- for R1.3 CR013 -->
<%
    HashMap bcaInfoMisc = null;
%>
<%--
<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {
        bcaInfoMisc = (HashMap) custResHash.get(String.valueOf(innerLimitID[k]));
        if (bcaInfoMisc != null) {
            //DefaultLogger.debug(this,"1> limitID ="+innerLimitID[k]+"\t bcaInfo ="+bcaInfoMisc);%>
    <%=((((String) bcaInfoMisc.get("leId")) == null) ? " " : ((String) bcaInfoMisc.get("leId")))%>&nbsp;<br>
    <%=((((String) bcaInfoMisc.get("custName")) == null) ? " " : ((String) bcaInfoMisc.get("custName")))%>&nbsp;<br>
    <% } else {%>
    &nbsp;<br>&nbsp;<br>
    <% } %>
    <% }%>
</td>

<td nowrap="nowrap" valign="top">
    <% for (int k = 0; k < arrayListforOBLimit.size(); k++) {
        bcaInfoMisc = (HashMap) custResHash.get(String.valueOf(innerLimitID[k]));
        if (bcaInfoMisc != null) {
            //DefaultLogger.debug(this,"2> limitID ="+innerLimitID[k]+"\t bcaInfo ="+bcaInfoMisc);%>
    <%=((((String) bcaInfoMisc.get("bcaRef")) == null) ? " " : ((String) bcaInfoMisc.get("bcaRef")))%>&nbsp;<br>
    <%=((((String) bcaInfoMisc.get("bkgLoc")) == null) ? " " : cList.getCountryName((String) bcaInfoMisc.get("bkgLoc")))%>
    &nbsp;<br>
    <% } else {%>
    &nbsp;<br>&nbsp;<br>
    <% }%>
    <% }%>
</td>
--%>

<!-------------------->

<%--<td nowrap="nowrap" valign="top">
    <integro:empty-if-null value="<%=status%>"/> &nbsp;
</td>

--%><% SubType = obcol.getCollateralSubType().getSubTypeCode();
    path = SecuritySubTypeUtil.getUrl(SubType, 2);
    path = path + "&collateralID=" + obcol.getCollateralID();
%>

<td valign="top"><a href="<%=path%>">View/Re-value</a>
</td>
<!--Added by Uma Khot: PHASE 3 CR Start:For security list realignment   -->
<td nowrap="nowrap" valign="top">
    <%for (int k = 0; k < arrayListforOBLimit.size(); k++) {%>
    <integro:empty-if-null value="<%=limitRef[k]%>"/>&nbsp;<br>&nbsp;<br>	
    <%}%>
</td>

<td nowrap="nowrap" valign="top">
     <integro:empty-if-null value="<%=countryCodeNameMap.get(obcol.getCollateralLocation())%>"/>
</td>

<td nowrap="nowrap" valign="top">
   <integro:empty-if-null value="<%=sysBankBranchCodeNameMap.get(obcol.getSecurityOrganization())%>"/>
</td>
<!--Added by Uma Khot: PHASE 3 CR End:For security list realignment   -->

<%}%>
</tr>

</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
    	<%
    		CustomerSearchCriteria criteria = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." +IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
    	%>
        <% if (transactionID != null) {%>
        <td>
            <a href="ToDo.do?event=customertodo&transactionID=<%=transactionID%>&customerID=<%=customerID%>&limitprofileID=<%=limitProfileID%>&taskFlag=M"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1"/></a></td>
        <%} 
        	else if (criteria != null && criteria.getFrompage() != null 
        		&& criteria.getFrompage().equals("pending_cases")) { 
	    %>
        <td><a href="ToDo.do?event=pending_cases&isMenu=N" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"
                                                                                width="70" height="22" border="0"
                                                                                id="Image1"/></a></td>
	    
	    <% } else { %>
        <td><a href="CustomerSearch.do?event=return&startIndex=<%=startIndex%>" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"
                                                                                width="70" height="22" border="0"
                                                                                id="Image1"/></a></td>
        <%}%>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
<%} else { if(null!=activeDeleteFlag && "Deleted".equals(activeDeleteFlag)){%>
<!-- //Added by Uma Khot: Start: Phase 3 CR:Search based on Active and deleted security -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Securities List</h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>


<tbody>
<tr>
<td>
 <select name="activeDeleteSelection"  onchange="javascript:showSecurity(this, '<%=customerID %>', '<%=limitProfileID %>', '<%=startIndex %>')">
  					  <option value="" selected>Please Select</option>
                      <option value="Active" >Active</option>
                      <option value="Deleted">Deleted</option>
</select>
</td>
</tr>
<tr>
<td>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
    <tr>
        <td width="3%">S/N</td>
        <td width="7%">Source Security ID<%--<bean:message key="label.security.id.cms"/>--%></td>
        <td width="7%">Collateral Name</td>
        <td width="20%">Security Type /<br/>SubType</td>
        <td width="7%">Security Priority</td>
        <td width="7%">Security Currency</td>
        <td width="9%">Open Market Value( OMV)<%--<bean:message key="label.valuation.omv"/>--%> </td>
        <td width="7%">Security Coverage (%)</td>
        <td width="9%">Security Limit Linkage Status</td>
        <td width="7%">Facility Name</td>
        <td width="7%">Insurance Coverage</td>
        <td width="6%">Action</td>
        <td width="9%">Facility ID</td>
        <td width="7%">Security Booking Location</td>
        <td width="7%">Security Branch Name</td>
        
     </tr>
</thead>
<tbody>
<tr><td colspan="15"><bean:message key="label.global.not.found"/></td></tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
    	<%
    		CustomerSearchCriteria criteria = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." +IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
    	%>
        <% if (transactionID != null) {%>
        <td>
            <a href="ToDo.do?event=customertodo&transactionID=<%=transactionID%>&customerID=<%=customerID%>&limitprofileID=<%=limitProfileID%>&taskFlag=M"
               onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1"/></a></td>
        <%} 
        	else if (criteria != null && criteria.getFrompage() != null 
        		&& criteria.getFrompage().equals("pending_cases")) { 
        %>
        <td><a href="ToDo.do?event=pending_cases&isMenu=N" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"
                                                                                width="70" height="22" border="0"
                                                                                id="Image1"/></a></td>
	    
	    <% } else {%>
        <td><a href="CustomerSearch.do?event=return&startIndex=<%=startIndex%>" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"
                                                                                width="70" height="22" border="0"
                                                                                id="Image1"/></a></td>
        <%}%>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
<!-- //Added by Uma Khot: End: Phase 3 CR:Search based on Active and deleted security -->
<%} else { %>
<table width="460" height="210" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo"
       style="margin-top:30px">
    <thead>
    </thead>
    <tbody>
        <tr class="odd">
            <td style="text-align:center" valign="middle">
                <table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="even" style="text-align:center" valign="middle">
                                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                    <tr class="even">
                                        <td style="border:none;text-align:center"><strong><img src="img/info.gif"/>
                                        </strong></td>
                                    </tr>
                                    <tr class="even">
                                        <td style="border:none;text-align:center">
                                          <strong><font size="2"><br/><bean:message key="label.global.not.found"/></font></strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
<%}}%>
</html:form>
<!-- InstanceEndEditable -->
</body>
