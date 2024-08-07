<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cci.CounterpartySearchForm,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.cms.app.cci.bus.CounterpartySearchCriteria" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="java.util.List" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    //System.out.println("Entered CustomerList.jsp");
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch (NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
    // System.out.println("value of records_per_page"+records_per_page);
%>

<%
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMR = false;
    boolean isSAC = false;
    DefaultLogger.debug(this, "Team Type ID = " + teamTypeID);

    if (teamTypeID == ICMSConstant.TEAM_TYPE_MR) {
        isMR = true;
    } else if (teamTypeID == ICMSConstant.TEAM_TYPE_SSC) {
        isSAC = true;
    }
    CounterpartySearchForm aForm = (CounterpartySearchForm) request.getAttribute("CounterpartySearchForm");
    int nItems = 0;
    List v = (List) aForm.getSearchResult();

    if (v != null) {
        pageContext.setAttribute("counterpartyList", v);
      //  System.out.println("v.size() = " + v.size());    
    }

    CounterpartySearchCriteria search = (CounterpartySearchCriteria) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_COUNTERPARTY_SEARCH_CRITERIA_OBJ);
//    SearchResult result = (SearchResult)session.getAttribute("com.integrosys.cms.ui.collateral.CollateralSearchAction.session_searchResult");
    if (search != null) {
        aForm.setStartIndex(search.getStartIndex());
        nItems = aForm.getStartIndex();
    }
    int rowIdx = 0;
    int sno = 0;
    int count = 1;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0) {
        prev = aForm.getStartIndex() - records_per_page;
    }
    int numItem = aForm.getNumItems();

%>

<%

    try

    {
%>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="JavaScript">

        function submitForm(){
         //alert(<%=rowIdx%>);
          var cstId  = <%=rowIdx%>;
            if (cstId =0){
                alert("Please select one record")
          //  } else if(document.forms[0].customerID.value == "undefined" ){
           //      alert("Please select one record")

            } else{
               // alert(document.forms[0].customerID.value );
                document.forms[0].action ="CounterpartyCCI.do?event=add";
                document.forms[0].submit();
            }
        }

        function cancelForm(){
        // alert(document.forms[0].customerID.value);
        document.forms[0].action ="CounterpartyCCI.do?event=cancel";
        document.forms[0].submit();
        }

        function JumpOnSelectactive(selectObj, customerID, limitProfileID, agreementID){
        var selectIndex = selectObj.selectedIndex;
        if (selectObj.options[selectIndex].value == "VIEW_CCI"){
        location.href = "CounterpartyCCI.do?event=read&customerID=" +customerID+"&limitProfileID="
        +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        }else if (selectObj.options[selectIndex].value == "DELETE_CCI") {
        location.href = "CounterpartyCCI.do?event=DelCCINo&customerID=" +customerID+"&limitProfileID="
        +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        }
        }

        function gotoPage() {
        parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
        }

        function goNextPrev(ind) {
        document.forms["CounterpartySearchForm"].cusName.value='';
        document.forms["CounterpartySearchForm"].startIndex.value=ind;
        document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
        }

        function goPageIndex(ind) {
        document.forms["CounterpartySearchForm"].startIndex.value=ind;
        document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
        document.forms["CounterpartySearchForm"].submit();
        }

        function goAlphaIndex(ind) {
        document.forms["CounterpartySearchForm"].customerName.value=ind;
        if (ind == ''){
        document.forms["CounterpartySearchForm"].all.value = 'Y';
        }
        document.forms[0].indicator.value='*';
        document.forms["CounterpartySearchForm"].startIndex.value=0;
        document.forms["CounterpartySearchForm"].submit();
        }
        function goPage(pageNo){
        document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
        document.forms[0].numItems.value = <%=numItem%>;
        }
    </script>

<body >
<table width="100%" align="center" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td valign="top">
        <html:form action="CounterpartyCCI.do?event=cc_customer_list">
            <html:hidden property="startIndex"/>
            <html:hidden property="numItems"/>
            <input type="hidden" name="customerName">
            <input type="hidden" name="legalName">
            <input type="hidden" name="indicator">
            <input type="hidden" name="all">
            <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" id="custsearch">
                <tr>
                    <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <tr>
                                <td valign="bottom"><h3><bean:message key="label.cci.search.result"/></h3></td>
                            </tr>
                        </table>
                        <table width="100%" class="tblinfo" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                                <tr>
                                    <td width="3%"><bean:message key="label.global.sn"/></td>
                                    <td width="25%"><bean:message key="label.customer.name"/></td>
                                    <td width="10%"><bean:message key="label.customer.id.source"/></td>
                                    <td width="10%"><bean:message key="label.customer.id"/></td>
                                    <td width="20%"><bean:message key="label.col.owner.id.no"/></td>
                                    <td width="12%"><bean:message key="title.cci.select"/></td>
                                </tr>

                            </thead>
                            <tbody>
                                <% if (v != null) {%>
                                <logic:present name="counterpartyList">
                                    <logic:iterate id="OB" name="counterpartyList"
                                                   type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
                                        <%
                                            String strSubprofileID = OB.getSubProfileID() + "";
                                        %>
                                        <%--<input type="hidden" name="customerID1" value ="<%=subprofileID%>">--%>
                                        <%--<input type="hidden" name="limitProfileID" value ="<%=instrID%>">--%>
                                        <%--<input type="hidden" name="agreementID" value ="<%=agreementID%>">--%>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td class="index"><%=count++%></td>
                                            <td><integro:empty-if-null value="<%=OB.getLegalName()%>"/></td>
                                            <td><integro:empty-if-null
                                                    value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, OB.getSourceID())%>"/>
                                                &nbsp; </td>
                                            <td><integro:empty-if-null value="<%=OB.getLmpLeID()%>"/>&nbsp; </td>
                                            <td><integro:empty-if-null value="<%=OB.getIdNo()%>"/>&nbsp; </td>
                                            <td><html:radio property="customerID" value="<%=strSubprofileID%>"/>
                                                    <%--<input type="radio" name="customerID" value="<%=subprofileID%>"  />--%>
                                            </td>
                                        </tr>
                                    </logic:iterate>
                                </logic:present>
                                <%} else {%>
                                <tr>
                                    <td colspan="6" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                                </tr>
                                <%}%>
                            </tbody>

                        </table>
                        <tr height="40">
                            <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                                                  onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                                <a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()"
                                   onmouseover="MM_swapImage('Image2','','img/cancel1.gif',1)">
                                    <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
                                <br>
                                <html:errors property="errDuplicate"/>
                            </td>
                        </tr>
                    </td>
                </tr>
            </table>
        </html:form>
    </td>
</tr>
<!-- End Content -->

<!-- General Purpose Bar -->
<%
    int index = 0;
    String sii = (String) request.getAttribute("startIndex");
    if (sii != null) {
        index = Integer.parseInt(sii);
    }
    String alphaURL = "/CounterpartyCCI.do?event=cc_customer_list";
%>
<tr>
    <td height="25">
        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="middle">
                    <integro:pageindex pageIndex='<%=new PageIndex(index, records_per_page, nItems)%>'
                                       url='<%=alphaURL %>' submitFlag='<%=new Boolean(true)%>'/>
                </td>
            </tr>
        </table>
    </td>
</tr>

</table>

</body>
</html>


<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

