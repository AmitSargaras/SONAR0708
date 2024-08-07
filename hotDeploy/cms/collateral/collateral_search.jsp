<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.base.uiinfra.common.AbstractCommonMapper" %>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralSearchForm" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="com.integrosys.cms.ui.common.CountryList" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="java.util.*" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%!
    int records_per_page = 10;
%>
<%
    //System.out.println("Entered collateral_Search.jsp");
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    CollateralSearchForm form = (CollateralSearchForm) request.getAttribute("CollateralSearchForm");

    

    List ctryDesc = (List) CountryList.getInstance().getCountryLabels();
    List ctryCode = (List) CountryList.getInstance().getCountryValues();
    int rowIdx = 0;

%>

<script language="JavaScript" type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgCheckForm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="javascript" type="text/javascript">
<!--
    function submitPage(event) {
        document.forms[0].action="CollateralSearch.do?event=" +event ;
        document.forms[0].submit() ;
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
	    
    function advanceSearchPage(){
		var form = document.forms[0] ;
		var securityType = form.securityType.options[form.securityType.selectedIndex].value;
		document.forms[0].advanceSearchType.value = securityType;

		var securitySubType = form.securitySubType.options[form.securitySubType.selectedIndex].value;

		if (securitySubType == "" ) {
			if (document.getElementById('span11') != null)
				document.getElementById('span11').innerText = "This is a mandatory field.";
		} 
		else {
			if (document.getElementById('span11') != null)
				document.getElementById('span11').innerText = "";

			document.forms[0].advanceSearch.value = <%=Boolean.TRUE %>;
			document.forms[0].action="CollateralSearch.do?event=refresh" ;
			document.forms[0].submit() ;
		}
    }
	
    function getStateDistrictMukim(listType) {
		var advanceSearch ='<% out.print(form.getAdvanceSearch()); %>';
		var securityType ='<% out.print(form.getSecurityType()); %>';
		if (advanceSearch=='true' && securityType=='PT' ) {
			document.forms[0].action="CollateralSearch.do?event=refresh" ;
			document.forms[0].listType.value =listType ;
			document.forms[0].submit();
		}
    }
-->
</script>


<body>

<html:form action="CollateralSearch.do?event=list">
    <input type="hidden" value="" name="event">
    <input type="hidden" value="" name="listType">
    <html:hidden property="advanceSearchType"/>
    <html:hidden property="advanceSearch"/>

<table align="right" width="100%">
  <tr>
	<td align=right class=required><SPAN class="mandatoryNormalSecSearch">*</SPAN><bean:message key="label.security.mandatory.for.nlseach"/></td>
	<td align=right class=required width="5"></td>
  </tr>
  <tr>
	<td align=right class=required><SPAN class="mandatoryAdvSecSearch">*</SPAN><bean:message key="label.security.mandatory.for.adseach"/></td>
	<td align=right class=required width="5"></td>
  </tr>
</table>
<table class=tblFormSection style="MARGIN-TOP: 10px" cellSpacing=0 cellPadding=0 width="98%" align=center border=0>
  <thead>
	<tr><td><h3>&nbsp;</h3></td></tr>
  </thead>
</table>
<br>

    <table width="73%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                <!--for basic search-->
                <table class="tblInput" id="custsearch" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <td colspan="2" align="center">Please enter either one of the following information </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="40%" class="fieldname" nowrap>
                                <bean:message key="label.security.type"/>/
                                <bean:message key="label.security.sub.type"/> <span class="mandatoryAdvSecSearch">*</span>
                            </td>
                            <td width="60%">
                                <html:select property="securityType" onchange="refreshSubType(this);">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE %>" descWithCode="false" />
                                </html:select>
                                <html:select property="securitySubType" onchange="advanceSearchPage();">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE %>" refEntryCode="<%= form.getSecurityType()%>" descWithCode="false"/>
                                </html:select>
                                <html:errors property="securityType"/>
                                <html:errors property="securitySubType"/>
                                <span class="errormsg" id="span11">&nbsp;</span>
                            </td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname"><bean:message key="label.source.security.id"/>
                                <span class="mandatoryNormalSecSearch"> * </span>
                            </td>
                            <td><!--<html:select property="securitySearchType">
									<integro:common-code categoryCode="<%=ICMSConstant.COMMON_CODE_SEARCH_TYPE_SEC %>" descWithCode="false" />
								</html:select>
								<html:errors property="securitySearchType"/>
                            --><html:text property="securityId" maxlength="50"/>
                                <html:errors property="securityID"/></td>
                        </tr>
                    </tbody>
                </table>
                <BR/>
                <!--

                <table class="" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <a onclick="advanceSearchPage()" href="#">
                                <img align="right" src="img/adv_search1.gif" name="Image2" border="0" id="Image2"/></a>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>

                --><!--for advance search-->

                <% if (form.getAdvanceSearch()) { %><!--
                    <jsp:include page="/collateral/advancesearch/advance_search_template.jsp"/>
                --><% } %>

                 <!--for end advance search-->

                <table class="" width="30%" border="0" cellspacing="0" cellpadding="0" align="center">
                    <tr>
                        <td align="center">
                            <a onclick="submitPage('list')" href="#">
                                <img align="middle" src="img/search1a.gif" name="Image1" border="0" id="Image1"/></a>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
</html:form>
<br>
</body>
<!-- InstanceEnd -->

