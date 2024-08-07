
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="java.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<script language="JavaScript" type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgCheckForm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="javascript" type="text/javascript">
 <!--

	function submitPage() {
		document.forms[0].action="CollateralRedirect.do?event=prepare_create&frameRequested=true&subtype="+document.forms[0].securitySubType.value;
		document.forms[0].submit();
	}

	function refreshSubType(dropdown){	
		var currVal = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				currVal = dropdown.options[i].value;	
			}
		}	
		var dep = 'securitySubType';

		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name='+dep+'&code=<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>&ref='+currVal;

		//alert(url);
		sendLoadDropdownReq(dep, url);	
	}	

-->

</script>

<body >

<p class="required"><span class="mandatoryAdvSecSearch">*</span> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;</p><br>

<br>
<html:form action="CollateralSearch.do?event=list">
    <input type="hidden" value="" name="event">
    <input type="hidden" value="" name="listType">
    <html:hidden property="advanceSearchType"/>
    <html:hidden property="advanceSearch"/>



    <table width="73%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                <!--for basic search-->
                <table class="tblInput" id="custsearch" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <td colspan="2" align="center"><bean:message key="label.please.enter.information"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="even">
                            <td width="40%" class="fieldname" nowrap>
                                <bean:message key="label.security.type"/> &nbsp;<span class="mandatoryAdvSecSearch">*</span>
                            </td>
                            <td width="60%">
                                <html:select property="securityType" onchange="refreshSubType(this);">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE %>" descWithCode="false"/>

                                </html:select>
                                <html:errors property="securityType"/>
                            </td>
                        </tr>
						<tr class="odd">
							<td width="40%" class="fieldname">
                                <bean:message key="label.security.sub.type"/> <span class="mandatoryAdvSecSearch">*</span>
							</td>
							<td width="60%">								
                                <html:select property="securitySubType">
								<% if (request.getParameter("securityType") != null) { %>
                                    <integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>" refEntryCode='<%=request.getParameter("securityType") %>' />
								<% } else { %>
									<option value=""><bean:message key="label.please.select"/>
								<% } %>
                                </html:select>
                                <html:errors property="securitySubType"/>
							</td>
						</tr>
                    </tbody>
                </table>

                <table class="" width="70%" border="0" cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td> &nbsp </td>
					</tr>
                    <tr>
                        <td align="center">
							<input onClick="submitPage()" name="AddNew1" type="button" id="AddNew1" value="Create"  class="btnNormal" style="margin-right:5px;margin-left:5px;" />

                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
</html:form>

</body>
<!-- InstanceEnd -->

