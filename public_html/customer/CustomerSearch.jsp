<%@ page import="com.integrosys.cms.ui.customer.CustomerSearchForm,
                 java.util.Collection,
                 java.util.Vector,
                 java.util.Iterator,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
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
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%!
    int records_per_page = 10;

%>
<!-- InstanceBeginEditable name="head" -->

<script>
   // <!--

    var submitCustomerSearch = function submitPage(params) {
        var gobutton = params;
        
        document.forms[0].gobutton.value = gobutton;
        if (gobutton == 1) {
            //document.forms[0].leIDType.value="";
            document.forms[0].legalID.value = "";
            document.forms[0].facilitySystem.value = "";
            document.forms[0].facilitySystemID.value = "";
            //document.forms[0].idCountry.value="";
        } else if (gobutton == 2) {
            document.forms[0].customerName.value = "";
            document.forms[0].facilitySystem.value = "";
            document.forms[0].facilitySystemID.value = "";
            //document.forms[0].aaNumber.value = "";
            //document.forms[0].idCountry.value="";
        } else if (gobutton == 3) {
            document.forms[0].customerName.value = "";
            //document.forms[0].leIDType.value="";
            document.forms[0].legalID.value = "";
           // document.forms[0].aaNumber.value = "";
        } else if (gobutton == 4) {
            document.forms[0].customerName.value = "";
            //document.forms[0].leIDType.value="";
            document.forms[0].legalID.value = "";
        } else if (gobutton == 5) {
        	if(document.forms[0].customerName.value=="" && document.forms[0].legalID.value=="" && document.forms[0].facilitySystem.value=="" && document.forms[0].facilitySystemID.value=="") {
        		 document.forms[0].action = "MICustomerSearch.do?event=rejectedFlow_list_limit&rejectedFlow=true&searchFlag=false";
        	} 
        	else {
        		 document.forms[0].action = "MICustomerSearch.do?event=rejectedFlow_list_limit&rejectedFlow=true&searchFlag=true";
        	}
        }
        else {
        }


        if (document.forms[0].source.value != "" && gobutton != 5 ) {
            document.forms[0].action = "MICustomerSearch.do?event=list_customer";
        }
        document.forms[0].submit();
    }

    function submitEnterWrapper(event, gobutton) {
        var params = new Array();
        params = gobutton;
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

<html:form action="CustomerSearch.do?event=list">
    <%--html:hidden property="userID" /--%>
    <input type="hidden" name="event" value="prepare">

    <input type="hidden" value="" name="gobutton">
    <%
        String source = request.getParameter("source");
        if (source == null) {
            source = "";
        }
        System.out.println("<<<<<<<<<<>>>>>>>>"+source);
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
                                <html:text property="customerName" maxlength="100" onkeypress="submitEnterWrapper(event, 1);" />
								<html:errors property="cusName"/>
							</td>
                            <td><input onclick="submitCustomerSearch(1);" name="AddNew3" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
						
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.party.id"/></td>
                            <td>
                                <html:text property="legalID" maxlength="20" onkeypress="submitEnterWrapper(event, 2);" />
                                <html:errors property="legalID"/>
                            </td>
							<td> <input onclick="submitCustomerSearch(2);" name="AddNew2" type="button" id="AddNew2" value="Go"
                                       class="btnNormal"   style="margin-right:5px;margin-left:10;width:50px"/>
							</td>
                        </tr>
                        
						 <tr class="odd">
                            <td class="fieldname">System</td>
                            <td>
								 <html:select property="facilitySystem" onkeypress="submitEnterWrapper(event, 3);">
                  					<integro:common-code	categoryCode="<%=CategoryCodeConstant.SYSTEM%>" descWithCode="false" />   
									</html:select><html:errors property="facilitySystem"/>
							<br/>
                                <html:text property="facilitySystemID" maxlength="20" onkeypress="submitEnterWrapper(event, 2);" />
                                <html:errors property="facilitySystemID"/>
                            </td>
                            <td><input onclick="submitCustomerSearch(3);" name="AddNew3" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                          <%if("limit".equals(source)){ %>
                          <tr class="even">
                            <td class="fieldname">Search Rejected Facilities</td>
							<td> <input onclick="submitCustomerSearch(5);" name="AddNew4" type="button" id="AddNew4" value="Search"
                                       class="btnNormal"   style="margin-right:5px;margin-left:10;width:70px"/>
							</td>
							<td></td>
                        </tr> 
                        <%} %>
                        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.customer.subprofile"/>   <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;<I><bean:message key="label.customer.id"/> : <br><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="label.customer.subprofile.id"/> :</I>
                            </td>
                            <td><br><html:text property="legalIdSub" maxlength="10"/> <html:errors property="legalId1"/><br>
                                <html:text property="subProfileID" maxlength="4"/> <html:errors property="subProfileId"/></td>
                            <td><input onclick="submitCustomerSearch(3)" name="AddNew5" type="button" id="AddNew5" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <% } %>
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



