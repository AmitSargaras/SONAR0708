<%@ page import="com.integrosys.cms.ui.imageTag.ImageTagForm,
                 java.util.Collection,
                 java.util.Vector,
                 java.util.Iterator,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    int records_per_page = 10;
%>

<!-- InstanceBeginEditable name="head" -->

<script>

    var submitCustomerSearch = function submitPage(params) {
    var gobutton = params;
        document.forms[0].gobutton.value = gobutton;
        if (gobutton == 1) {
            document.forms[0].legalID.value = "";
        } else if (gobutton == 2) {
            document.forms[0].customerName.value = "";
        } 
        else {
        }
        document.forms[0].submit();
    }

    function submitEnterWrapper(event, gobutton) {
        var params = new Array();
        params[0] = gobutton;
        
        submitEnter(event, submitCustomerSearch, params);
    }
</script>



<body>
<html:form action="ImageTag.do?event=untag_customer_search_list">
    <input type="hidden" name="event">
    <input type="hidden" value="" name="gobutton">
    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.party.name"/></td>
                            <td>
                                <html:text property="customerName" maxlength="40" onkeypress="submitEnterWrapper(event, 1);" />
								<html:errors property="customerNameError"/>
							</td>
                            <td><input onclick="submitCustomerSearch(1)" name="AddNew3" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.party.id"/></td>
                            <td>
                                <html:text property="legalID" maxlength="20" onkeypress="submitEnterWrapper(event, 2);" />
                                <html:errors property="legalIDError"/>
                            </td>
							<td> <input onclick="submitCustomerSearch(2)" name="AddNew2" type="button" id="AddNew2" value="Go"
                                       class="btnNormal"   style="margin-right:5px;margin-left:10;width:50px"/>
							</td>
                        </tr>
                       
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>


    </table>
</html:form>
</body>



