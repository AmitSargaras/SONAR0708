<%@ page import="com.integrosys.cms.app.custgrpi.trx.ICustGrpIdentifierTrxValue,
                 com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.base.uiinfra.tag.PageIndex" %>


<%
    ICustGrpIdentifierTrxValue trxValue = (ICustGrpIdentifierTrxValue) session.getAttribute("com.integrosys.cms.ui.custgrpi.CustGrpIdentifierAction." + CustGroupUIHelper.service_groupTrxValue);
    CustGroupUIHelper.printChildMembers(trxValue);
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    int records_per_page = 10;
%>

<script language="Javascript" type="text/javascript">

    function submitSearch() {
        document.forms[0].submit();
    }

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
        document.forms[0].action = "GroupMember.do?event=list_customer";
        }
        document.forms[0].submit();
    }


</script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<body>

<html:form action="GroupMember.do">

    <%--<html:hidden property="customerSeach" value="true"/>--%>
    <input type="hidden" name="event" value="first_search">
    <input type="hidden" value="" name="gobutton">
    <html:hidden property="itemType"/>

    <%
        String source = request.getParameter("source");
        if (source == null) {
            source = "";
        }
    %>
    <input type="hidden" name="source" value="<%= source %>"/>

    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td valign="bottom"><h3>Add Member</h3></td>
        </tr>
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
                                <option value="">Please Select</option>
                                <html:options name="sourceTypeCodes" labelName="sourceTypeLabels"/>
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
                            <html:text property="legalID" maxlength="20" />
                            <html:errors property="legalID"/>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
                        <td>
                            <html:text property="idNO" maxlength="100" /> <html:errors property="idNO"/>
                        </td>
                        <td><input onclick="submitPage(3)" name="AddNew4" type="button" id="AddNew4" value="Go"
                                   class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                        </td>
                    </tr>
                </tbody>
            </table>
                <%--
                <table class="tblInput" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.customer.id.source"/>
                                <font color="#0000FF">*</font></td>
                            <td colspan="2">
                                <html:select name="GroupMemberForm" property="sourceType">
                                    <option value="">Please Select</option>
                                    <html:options name="sourceTypeCodes" labelName="sourceTypeLabels"/>
                                </html:select>
                                <html:errors property="sourceType"/>
                            </td>
                        </tr>

                        <tr class="even">
                            <td class="fieldname" width="50%"><bean:message key="label.customer.name"/></td>
                            <td width="30%"><html:text name="GroupMemberForm" property="customerName" maxlength="40"/>
                                <html:errors property="cusName"/></td>
                            <td rowspan="3" width="20%">
                                <input onclick="submitSearch()"
                                       name="AddNew3" type="button" id="AddNew3" value="Go" class="btnNormal"
                                       style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.customer.id"/></td>
                            <td>
                                <html:text name="GroupMemberForm" property="legalID" maxlength="20"/>
                                <html:errors property="legalID"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
                            <td>
                                <html:text name="GroupMemberForm" property="idNO" maxlength="100"/>
                                <html:errors property="idNO"/>
                            </td>
                        </tr>
                        <tr class="">
                            <td class="" colspan="3">

                                <html:errors property="searchError"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                --%>

            </td>
        </tr>
    </table>
</html:form>
</body>



