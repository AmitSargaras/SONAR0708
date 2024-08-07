<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
<!-- InstanceBeginEditable name="head" -->

<script>
    <!--

    function submitPage(gobutton) {
        document.forms[0].gobutton.value=gobutton;
        if(gobutton==1)  {
            document.forms[0].leIDType.value="";
            document.forms[0].legalID.value="";
            document.forms[0].idNO.value="";
            //document.forms[0].idCountry.value="";
        } else if(gobutton==2){
            document.forms[0].customerName.value="";
            document.forms[0].idNO.value="";
            //document.forms[0].idCountry.value="";
			
			//change the legalID to uppercase
			var legalIDstr = document.forms[0].legalID.value;
			document.forms[0].legalID.value=legalIDstr.toUpperCase();
			
           }else if(gobutton==3){
            document.forms[0].customerName.value="";
            document.forms[0].leIDType.value="";
            document.forms[0].legalID.value="";
           }else{
          //error...
        }
        if (document.forms[0].source.value != "")
        {
        document.forms[0].action = "ELCustomerSearch.do.do?event=list_customer";
        }
        document.forms[0].submit();
    }
    //-->
</script>
<%
	String event = request.getParameter("event");

	if ("customer_add".equals(event)) {
		event = "add_customer_search";
	}
%>
<!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
<!-- InstanceEndEditable -->
<body>
<!-- InstanceBeginEditable name="Content" -->

<html:form action="ELCustomerSearch.do">
    <%--html:hidden property="userID" /--%>

    <input type="hidden" value="" name="gobutton">
    <input type="hidden" name="event" value="<%=event%>">
    
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
                            <td class="fieldname"><bean:message key="label.customer.name"/></td>
                            <td><html:text property="customerName" maxlength="40"/> <html:errors property="cusName"/></td>
                            <td><input onclick="submitPage(1)" name="AddNew3" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.customer.id.source"/></td>
                            <td>
                                <html:select property="leIDType">
                                    <option value=""><bean:message key="label.please.select"/></option>
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
                            <td class="fieldname"><bean:message key="label.security.pledgor.le.id"/></td>
                            <td>
                                <html:text property="legalID" maxlength="20"/>
                                <html:errors property="legalID"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
                            <td>
                                <html:text property="idNO" maxlength="100"/> <html:errors property="idNO"/>
                            </td>
                            <td><input onclick="submitPage(3)" name="AddNew4" type="button" id="AddNew4" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                            <%--
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.id.country"/>
                                                              </td>
                              <td>
                                                                  <html:select property="idCountry" >
                                                                      <option value="" ><bean:message key="label.please.select"/></option>
                                                                      <html:options name="countryValues" labelName="countryLabels"/>
                                                                  </html:select>
                                                                  <html:errors property="idCountry" />
                              </td>
                            </tr>
                            --%>
                        <% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.customer.subprofile"/>   <br>
                                &nbsp;&nbsp;&nbsp;&nbsp;<I><bean:message key="label.security.pledgor.le.id"/> : <br><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="label.customer.subprofile.id"/> :</I>
                            </td>
                            <td><br><html:text property="legalIdSub" maxlength="10"/> <html:errors property="legalId1"/><br>
                                <html:text property="subProfileID" maxlength="4"/> <html:errors property="subProfileId"/></td>
                            <td><input onclick="submitPage(3)" name="AddNew5" type="button" id="AddNew5" value="Go"
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





