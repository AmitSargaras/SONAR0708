<%@ page import="com.integrosys.cms.ui.image.ImageUploadForm,
                 java.util.Collection,
                 java.util.Vector,
                 java.util.Iterator,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/CustomerSearch.jsp,v 1.16 2005/09/02 06:55:57 hshii Exp $
     * @author $Author: hshii $<br>
     * @version $Revision: 1.16 $
     * @since $Date: 2005/09/02 06:55:57 $
     * Tag: $Name:  $
     */
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    int records_per_page = 10;
%>

<!-- InstanceBeginEditable name="head" -->

<script>
    <!--

    var submitCustomerSearch = function submitPage(params) {
    var gobutton = params;
       // var gobutton = params[0];
        document.forms[0].gobutton.value = gobutton;
        if (gobutton == 1) {
            //document.forms[0].leIDType.value="";
            document.forms[0].legalID.value = "";
            //document.forms[0].idNO.value = "";
            //document.forms[0].aaNumber.value = "";
            //document.forms[0].idCountry.value="";
        } else if (gobutton == 2) {
            document.forms[0].customerName.value = "";
            //document.forms[0].idNO.value = "";
            //document.forms[0].aaNumber.value = "";
            //document.forms[0].idCountry.value="";
        } 
        else {
        }

        if (document.forms[0].source.value != "") {
            document.forms[0].action = "MICustomerSearch.do?event=list_customer";
        }
        document.forms[0].submit();
    }

    function submitEnterWrapper(event, gobutton) {
        var params = new Array();
        params[0] = gobutton;
        
        submitEnter(event, submitCustomerSearch, params);
    }

//	function handleEnter (field, event, itemPressed) {
//		var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
//		//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);
//
//		if (keyCode == 13) {
//			if (field.value == "" || field.value == null) {
//				//
//			}
//			else {
//				submitPage(itemPressed);
//			}
//			return false;
//		}
//		else
//		return true;
//	}      

    //-->
</script>


<!-- InstanceEndEditable -->
<body>
<!-- InstanceBeginEditable name="Content" -->

<html:form action="ImageUpload.do?event=list_image">
    <%--html:hidden property="userID" /--%>
    <input type="hidden" name="event" value="prepare">

    <input type="hidden" value="" name="gobutton">
    <%
        String source = request.getParameter("source");
        if (source == null) {
            source = "";
        }
    %>
    <input type="hidden" name="source" value="<%= source %>"/>
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
                            <td><%--<html:text property="customerName" maxlength="40" onkeypress="return handleEnter(this, window.event||event, 1);" />--%>
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
                                <%--<html:text property="legalID" maxlength="20" onkeypress="return handleEnter(this, window.event||event, 2);" />--%>
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
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->



