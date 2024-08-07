<%--Beatified by jj
 Optmised the import
 changed the code for jira issue CMS-3435 --%>

<%@ page import="com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.limit.proxy.ILimitProxy,
                 com.integrosys.cms.app.limit.proxy.LimitProxyFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.limit.LimitsAction,
                 com.integrosys.cms.ui.limit.LimitsForm,             
                 com.integrosys.cms.ui.limit.LimitFSVBalanceHelper,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.List,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.Locale" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/limit/view_coborrower_detail.jsp,v 1.16 2004/04/13 13:55:19 lyng Exp $
     * @author $Author: lyng $<br>
     * @version $Revision: 1.16 $
     * @since $Date: 2004/04/13 13:55:19 $
     * Tag: $Name:  $
     */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    LimitsForm aForm = (LimitsForm) request.getAttribute("LimitsForm");
    
    String outerLimitRef = aForm.getOuterLimitRef();
    
    String event = (String)request.getParameter("event");
	boolean isLimitEditAllowed = false;
	/*if (event.equals(LimitsAction.VIEW_CO_BORROWER_LIMIT_DETAILS)) {
	    String roleType = (String) session.getAttribute(
	    		ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);

		long teamTypeMshipID = (roleType == null) ? ICMSConstant.LONG_INVALID_VALUE : Long.parseLong(roleType);
	  	if (teamTypeMshipID == ICMSConstant.TEAM_TYPE_SSC_MAKER) {
	  		isLimitEditAllowed = true;
	  	}
	}*/
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    
    <!-- InstanceBeginEditable name="CssStyle" -->

    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script language="JavaScript" type="text/JavaScript">
<!--
        function MM_jumpMenu(targ, selObj, restore) { //v3.0
            eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
            if (restore) selObj.selectedIndex = 0;
        }

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

        function MM_jumpMenu(targ, selObj, restore) { //v3.0
            eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
            if (restore) selObj.selectedIndex = 0;
        }
        function cancel(customerID, limitProfileID) {
            document.forms[0].action = "Limits.do?event=viewlimits&customerID=" + customerID + "&limitProfileID=" + limitProfileID;
            document.forms[0].submit();
        }
        
		function editLimit() {
			document.forms[0].event.value = "<%=LimitsAction.PREPARE_EDIT_CO_BORROWER_LIMITS%>";
			document.forms[0].submit();
		}
		
		function close_co_borrower_limits() {
			document.forms[0].event.value="close_co_borrower_limits";
			document.forms[0].submit();
		}
-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<html:form action="Limits.do">
<input type="hidden" name="event"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="90%"><h3>Co-Borrower Limit Details</h3></td>
        <%
            String fromPage = (String) request.getAttribute("fromPage");
            String trxID = (String) request.getParameter("trxID");
            //get team and user from session to test..
            String customerID = "";
            String externalSystem = "";
            String limitProfileID = "";

			ICMSCustomer test = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."
				+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

            if (test != null) {
                if (test.getCustomerID() != Long.MIN_VALUE)
                    customerID = Long.toString(test.getCustomerID());
            }
			ILimitProfile limitprofileOb = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."
				+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

            if (limitprofileOb != null) {
                if (limitprofileOb.getLimitProfileID() != Long.MIN_VALUE)
                    limitProfileID = Long.toString(limitprofileOb.getLimitProfileID());
            }
        %>
		<% if (isLimitEditAllowed) { %>
		<td align="right"><input type="button" name="Button" value="Edit" class="btnNormal" style="width:50"
		                         onclick="editLimit()"/></td>
		<% } %>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                    <td width="20%" class="fieldname"><bean:message key="label.global.main.borrower"/> <bean:message key="label.customer.id"/>
                    <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                    /<bean:message key="label.customer.subprofile.id"/>
                    <% } %>
                    </td>
                    <td width="30%">
                        <integro:empty-if-null value="<%=aForm.getLeID()%>"/>
                        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                        /<integro:empty-if-null value="<%=aForm.getSubProfileID()%>"/>&nbsp;
                        <% } %>
                        </td>
                    <td width="20%" class="fieldname"><bean:message key="label.global.main.borrower"/> <bean:message key="label.security.aptmnt.le.name"/></td>
                    <td width="30%"><integro:empty-if-null value="<%=aForm.getMainBorrowerName()%>"/>&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname">Co-Borrower <bean:message key="label.customer.id"/>
                    <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                    /<bean:message key="label.customer.subprofile.id"/>
                    <% } %>
                    </td>
                    <td><integro:empty-if-null value="<%=aForm.getCoLeID()%>"/>
                        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                        /<integro:empty-if-null value="<%=aForm.getCoBorrowerSubProfileID()%>"/>&nbsp;
                        <% } %>
                        </td>
                    <td class="fieldname">Co-Borrower Name</td>
                    <td><integro:empty-if-null value="<%=aForm.getCoBorrowerName()%>"/>&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Co-Borrower Limit ID</td>
                    <td><integro:empty-if-null value="<%=aForm.getLimitRef()%>"/>&nbsp;</td>
                    <td class="fieldname">Outer Limit ID</td>
                    <td><%=outerLimitRef%>&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname">Product Description</td>
                    <td colspan="3"><integro:empty-if-null value="<%=aForm.getProductDesc()%>"/>&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Limit Booking Location</td>
                    <td colspan="3"><%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getBookingLoc())+ " ("+aForm.getBookingLoc()+")"%>&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname">Limit Amount</td>
                    <td><bean:write scope="request" property="currencyCode" name="LimitsForm"/>&nbsp;
                    	<bean:write scope="request" property="approvedLimitAmt" name="LimitsForm"/>&nbsp;</td>
                    <td class="fieldname">Limit Status</td>
                    <td><bean:write scope="request" property="limitStatus" name="LimitsForm"/>&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname">Drawing Amount</td>
                    <td colspan="3">
                    	<bean:write scope="request" property="currencyCode" name="LimitsForm"/>&nbsp;
                    	<bean:write scope="request" property="drawingLimitAmt" name="LimitsForm"/>&nbsp;</td>
                </tr>
            </tbody>
        </table>
        </td>
    </tr>
</thead>
<tbody>
</tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
			<%
				if ("to_track_coborrower".equals(event)) {
			%>	
				<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" 
					onmouseover="MM_swapImage('Image4411','','img/return1.gif',1)">
					<img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
			<%
				} 
				else if ("prepare_close_co_borrower_limits".equals(event)) {
			%>
			    <a href="javascript:close_co_borrower_limits();" onMouseOut="MM_swapImgRestore()" 
			    		onMouseOver="MM_swapImage('Image8','','img/close2a.gif',1)">
			    		<img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a>&nbsp;			    		
				<a href="ToDo.do?event=prepare&isMenu=Y" onmouseout="MM_swapImgRestore()" 
					onmouseover="MM_swapImage('Image4411','','img/return1.gif',1)">
					<img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
			<%
				}
				else {    
			%>
                <a href="javascript:cancel('<%=customerID%>','<%=limitProfileID%>');" onmouseout="MM_swapImgRestore()"
                    onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image2"/></a>
            <% } %>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>