<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String docStatus = (String) request.getAttribute("docStatus");
    Date docDate1 = (Date) request.getAttribute("docDate");
    String docDate = "-";
    Locale localy1 = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    if (docDate1 != null ){
      docDate = DateUtil.formatDate(localy1, docDate1) ;
    }
    if (docStatus != null && docDate != null) {
        pageContext.setAttribute("docStatus", docStatus);
        pageContext.setAttribute("docDate", docDate);
    }
%>


<html>
<head>  

</head>

<body>
<html:form action="CCCheckList">
    <input type="hidden" name="event"/>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3>Documentation Status</h3></td>
            </tr>
            <tr>
                <td><hr/></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                        <thead>
                            <tr>
                                <td class="fieldname" width="4%" align="left">Documentation Status </td>
                                <td class="fieldname" width="3%" align="left">Date</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="odd">
                                <td><%=docStatus%>&nbsp;</td>
                                <td><%=docDate%>&nbsp;</td>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</html:form>
</body>
</html>
