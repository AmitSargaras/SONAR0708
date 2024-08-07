<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@page import="com.integrosys.cms.app.customer.proxy.CustomerProxyFactory"%>
<%@page import="com.integrosys.cms.app.customer.bus.CustomerSearchCriteria"%>
<%@page import="com.integrosys.cms.app.customer.proxy.ICustomerProxy"%>
<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%><html>
<head>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">

	function generateReport(selObj){ //v3.0
	  //alert("Hi");
	  //alert(selObj.options[selObj.selectedIndex].value);
	  var reportID=selObj.options[selObj.selectedIndex].value
	  //document.forms[0].event.value="generate_report_"+reportID;
	  document.forms[0].event.value="prepare_filter";
	  document.forms[0].submit();
	}
	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}


</script>
<%
ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);

ArrayList excludeListSMS = new ArrayList();
ArrayList excludeListOthers= new ArrayList();


CommonCodeList reportsList = CommonCodeList.getInstance("REPORTS");

if (reportsList != null && reportsList.getCommonCodeValues() != null
        && reportsList.getCommonCodeValues().size() > 0) {
     Iterator itr = reportsList.getCommonCodeValues().iterator();
    while (itr.hasNext()) {
        String code = (String)itr.next();
        
        if(code.equals("RPT0039")){
        	//do Nothing
        }else if(code.equals("RPT0038")||code.equals("RPT0040")
        		||code.equals("RPT0041")||code.equals("RPT0042")
        		||code.equals("RPT0043")||code.equals("RPT0044")){
        	excludeListOthers.add(code);
        }else{
        	excludeListSMS.add(code);
        }
    }
}

%>
</head>
<body>
<html:form action="poiReport.do">
<%-- <table border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td >
				Reports
			</td>
			<td >
			<html:hidden property="event"/>
			<html:select property="reportId" onchange="generateReport(this)">
				<integro:common-code 
         			categoryCode="REPORTS" descWithCode="false" />
			</html:select>
			</td>
		</tr>
</table>
 --%>	
 
 <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
        <thead>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                        <thead>
                            <tr>
                                <td colspan="2">Please select the report</td>
                            </tr>
                        </thead>
                        <tbody>

                            <tr class="even">
                                <td class="fieldname">Reports <font color="red">* </font></td>
                                <td>
                                   <html:hidden property="event"/>
                                <%if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SYS_ADMIN_MAKER
                                	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SYS_ADMIN_CHECKER
                                	||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SYS_ADMIN_VIEW
                                	) {
                                %>
									<html:select property="reportId" onchange="generateReport(this)">
										<integro:common-code 
						         			categoryCode="REPORTS" descWithCode="false"  excludeList="<%=excludeListSMS%>" />
									</html:select>
								<%}else{ %>
								<html:select property="reportId" onchange="generateReport(this)">
										<integro:common-code 
						         			categoryCode="REPORTS" descWithCode="false" excludeList="<%=excludeListOthers%>"  />
									</html:select>
								<%} %>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </tbody>
    </table>
 
 
 
 </html:form>
</body>
</html>

