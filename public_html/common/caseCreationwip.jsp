
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationForm,com.integrosys.cms.app.caseCreationUpdate.trx.ICaseCreationTrxValue,com.integrosys.cms.app.caseCreationUpdate.trx.OBCaseCreationTrxValue"%>

<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.cms.app.checklist.bus.ICheckListItem"%>
<%@page import="com.integrosys.cms.app.checklist.bus.OBCheckListItem"%>
<%@page import="com.integrosys.cms.app.caseCreationUpdate.bus.ICaseCreation"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="java.util.Iterator"%>


<%

ICaseCreationTrxValue caseCreationUpdateTrx = (ICaseCreationTrxValue)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.ICaseCreationTrxValue");
String userInfo="";

if(caseCreationUpdateTrx!=null){
	userInfo= caseCreationUpdateTrx.getUserInfo();
}

%>
<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable --> 
</head>

<body>
<!-- InstanceBeginEditable name="Content" --> 
<table width="460" height="260" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd"> 
      <td style="text-align:center" valign="middle"><table width="400" height="200" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr> 
              <td class="even" style="text-align:center" valign="middle"> 
                <table width="350" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                  <tr class="even"> 
                      <td style="border:none;text-align:right;padding-right:5px" width="100"><strong><img src="img/warning3.gif" width="32" height="32" /></strong></td>
                      <td style="border:none" width="200"><strong><font size="2">Work in Progress</font></strong></td>
                    </tr>
                    <tr class="even"> 
                      
                    <td colspan="2" style="border:none;text-align:center"><br />
                      The transaction is being processed by another user. <br /> 
                        <br />
                       <b> User Information : <%=userInfo %> </b>
                       <br/>
                       <br/>
			Please check with your immediate supervisor. 
		    </td>
                    </tr>
                </table> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>
