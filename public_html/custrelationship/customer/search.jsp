<%@ page import="java.util.ArrayList,
                 com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.custrelationship.customer.CRCustSearchForm"%>
                 
                 
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<jsp:include page="printTransValue.jsp"/>

<%!
    int records_per_page = 10;
%>
<%

	org.apache.struts.action.ActionMapping am=(org.apache.struts.action.ActionMapping
	)request.getAttribute("org.apache.struts.action.mapping.instance");

	String actionPath=am.getPath();

	CRCustSearchForm actionForm = (CRCustSearchForm)pageContext.findAttribute("CRCustSearchForm");
	System.out.println("actionForm.getEvent() : " + actionForm.getEvent());

	String customerSeach = request.getParameter("customerSeach");
	if( customerSeach == null || customerSeach.equals("") )
	{
		customerSeach = "true";
	}
	
	String event = request.getParameter("event");
	
	if ("customer_add".equals(event) || "add_customer_search".equals(event)) {
		event = "add_customer_search";
	} else if ("customer_add_frame".equals(event) || "add_customer_search_frame".equals(event)) {
		event = "add_customer_search_frame";		
	} else if ("cust_shareholder_add".equals(event) || "add_cus_sh_search".equals(event)) {
		event = "add_cus_sh_search";
	} else if ("cust_shareholder_add_frame".equals(event) || "add_cus_sh_search_frame".equals(event)) {
		event = "add_cus_sh_search_frame";
	} else {
		event = "search_customer";
	}
	
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="Javascript" type="text/javascript">
<!--
    var submitSearch = function submitPage(params) {

        var gobutton = params[0];

        document.forms[0].gobutton.value = gobutton;
        legalIdSearch = document.getElementById("legalID").value;
        legalSourceSearch = document.getElementById("leIDType").value;
        customerNameSearch = document.getElementById("customerName").value;
        idNOSearch = document.getElementById("idNO").value;

        document.forms[0].submit();
    }

    function submitEnterWrapper(event, gobutton) {
        var params = new Array();
        params[0] = gobutton;

        submitEnter(event, submitSearch, params);
    }
    
// TODO: To be replace by loca form submit action
function submitSearch() {
	document.forms[0].submit()
}    
     


//-->
</script>

<!-- InstanceEndEditable -->
<body>

<html:form action="<%=actionPath%>" onsubmit="return false">

    <html:hidden property="customerSeach" value="true"/>

    <input type="hidden" name="event" value="<%=event%>">
	<input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>">
    <input type="hidden" value="" name="gobutton">
    <%
        String source = request.getParameter("source");
        if (source == null) {
            source = "";
        }
    %>
    <input type="hidden" name="source" value="<%= source %>"/>
    <br>
    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                <table class="tblInput" id="custsearch" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                         <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                    </thead>
                    <tbody>
						<tr class="odd">
                            <td class="fieldname"><bean:message key="label.customer.name"/></td>
                            <td><html:text name="CRCustSearchForm" property="customerName" maxlength="40" size="40" onkeypress="submitEnterWrapper(event, 1);"/>
                                <html:errors property="cusName"/></td>
                            <td><input onclick="submitPage(1);return false" name="AddNew" type="button" id="AddNew" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>

                            </td>
                        </tr>
						
                        <tr class="even">
                            <td class="fieldname" ><bean:message key="label.customer.id.source"/>
                            </td>
                            <td>
                                <html:select name="CRCustSearchForm" property="leIDType">
                                    <option value="">Please Select</option>
                                    <html:options name="leTypeValues" labelName="leTypeLabels"/>
                                </html:select>
                                <html:errors property="leIDType"/>
                            </td>
							<td rowspan="2">
                                <input onclick="submitPage(2)" name="AddNew2" type="button" id="AddNew2" value="Go"
                                       class="btnNormal"   style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>

                       
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.customer.id"/></td>
                            <td>
                                <html:text name="CRCustSearchForm" property="legalID" maxlength="20" onkeypress="submitEnterWrapper(event, 2);"/>
                                <html:errors property="legalID"/>
                            </td>
							
                        </tr>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
                            <td>
                                <html:text name="CRCustSearchForm" property="idNO" maxlength="100" onkeypress="submitEnterWrapper(event, 3);"/> <html:errors property="idNO"/>
                            </td>
							<td><input onclick="submitPage(3)" name="AddNew4" type="button" id="AddNew4" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="" colspan="3"><html:errors property="searchError"/></td>
                        </tr>
                    </tbody>
                </table>
                 <label id="responseLabel"/>
            </td>
        </tr>
    </table>
</html:form>
<!-- InstanceEndEditable -->
</body>
</html>



