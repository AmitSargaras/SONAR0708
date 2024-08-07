<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.custgrpi.CustGroupUIHelper" %>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="com.integrosys.component.user.app.bus.OBCommonUser" %>
<%@ page import="java.util.Locale" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/javascript" src="js/itgUtilities.js"></script>

<%

    System.out.println("Loading popview_accountmanager.jsp");
    String context = request.getContextPath() + "/";

    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    String userID = (String) request.getParameter("userID");
    System.out.println("userID = " + userID);
    ICommonUser user = null;
   try {
        if (userID != null && !"".equals(userID)){
            user = CustGroupUIHelper.getUserByPK(userID);
            System.out.println("user.getUserName() = " + user.getUserName());
        }
   }catch (Exception e) {
      System.out.println("Errror in getting user details " + e);
   }
    if (user == null){
        user = new OBCommonUser();
    }

%>

<html>
<head>
   <link rel="stylesheet" type="text/css" media="all" href="<%=context%>calendar-blue.css" />
   <script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>

</head>

<body>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <thead>
            <tr>
                <td><h3>Account Manager Detail </h3></td>
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
                        </thead>
                        <tbody>
                            <tr class="even">
                                <td width="20%" class="fieldname">Full Name</td>
                                <td width="30%"><integro:empty-if-null value="<%=user.getUserName()%>"/>&nbsp;</td>
                                <td width="20%" class="fieldname">Contact No</td>
                                <td width="30%"><integro:empty-if-null value="<%=user.getPhoneNumber()%>"/>&nbsp;</td>
                            </tr>
                            <tr class="odd">
                                <td class="fieldname">Employee ID</td>
                                <td><integro:empty-if-null value="<%=user.getEmployeeID()%>"/>&nbsp;</td>
                                <td class="fieldname">Email</td>
                                <td><integro:empty-if-null value="<%=user.getEmail()%>"/>&nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <p align="center">
        <a href="#">
            <img src="<%=context%>img/closeb.gif" name="Image42" width="70" height="20" border="0" id="Image42" onclick="window.close();"/>
        </a>
    </p>
</body>
</html>
