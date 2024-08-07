<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.app.checklist.proxy.*,
                 com.integrosys.cms.app.checklist.bus.*,      
                 com.integrosys.cms.app.common.constant.ICMSConstant,   
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.IContext,
                 com.integrosys.cms.app.common.constant.PropertiesConstantHelper,
                 java.net.URLEncoder,
                 java.util.*"%>
    
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	HashMap[] preReminderMap = (HashMap[])session.getAttribute("com.integrosys.cms.ui.checklist.document.DocumentCheckListAction.preReminderMap");
	HashMap[] postReminderMap = (HashMap[])session.getAttribute("com.integrosys.cms.ui.checklist.document.DocumentCheckListAction.postReminderMap");
	Boolean canRetrieveLetterOfInstruction = (Boolean) request.getAttribute("canRetrieveLetterOfInstruction");
	
	ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	
	if(preReminderMap!=null){
		if(preReminderMap.length==0){
			preReminderMap = null;
		}
	}
	if(postReminderMap!=null){
		if(postReminderMap.length==0){
			postReminderMap = null;
		}
	}

	int row1 = 0;
	int row2 = 0;
	
	int row = 0;
	
	boolean requireMortgageLI = false;
	boolean requireShareFinanceLI = false;
	if (profile != null) { 
		System.out.println("<<<< profile.getApplicationType(): "+profile.getApplicationType());
		if (profile.getApplicationType().equals(ICMSConstant.APPLICATION_TYPE_MO)) {
			requireMortgageLI = true;
		} else if (profile.getApplicationType().equals(ICMSConstant.APPLICATION_TYPE_SF)) {
			requireShareFinanceLI = true;
		}
		
	}
	
%>
<script type="text/javascript" src="console/javascripts/prototype.js"></script>
<script language="JavaScript" type="text/JavaScript">

function printLetter(row) { 
	var action = 'DocumentCheckList.do?event=print_reminder_letter_doc&row='+row;
// 	alert(document.forms[0].name2.value);
//  alert(document.getElementById("address").value);
	MM_openBrWindow(action,'','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=450,left=5,top=5');
}

function viewLetterInstruction(aaRefNum, docGenCode) {
	var strURL = '<%=PropertiesConstantHelper.RLOS_DOCGEN_PATH%>?appRefNo='+aaRefNum+'&docgenCode='+docGenCode+'&event=view';
	
	displayReportFrame.location=strURL;
}

function printLetterInstruction(aaRefNum, docGenCode) {
	var strURL = '<%=PropertiesConstantHelper.RLOS_DOCGEN_PATH%>?appRefNo='+aaRefNum+'&docgenCode='+docGenCode;
	

	if (docGenCode == '<%=ICMSConstant.DOC_GEN_LI_SOLICITOR %>') {
		var url = './TatDocSolicitorInstruction.do?LosLimitProfileReference=' + aaRefNum;
		new Ajax.Request(url);
	}
	
	displayReportFrame.location=strURL;
}
</script>

<html>
<html:form action="DocumentCheckList.do">

<script type="text/javascript" src="js/imageNavigation.js"></script>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="95%"><h3><bean:message key="title.list.letter.instruction"/></h3></td>
      <td width="5%"><label></label></td>
    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblinfo">
  <thead>
  <tr>
    <td width="4%" class="index">S/N</td>
    <td width="31%">Document Name</td>
    <td colspan="2" width="5%" style="text-align:center">Action</td>
  </tr>
  </thead>
  <tbody>
  <%if(preReminderMap!=null){ 
     for(int i=0;i<preReminderMap.length;i++){
    	 String rowClass="";
    		row1++;
    		if(row1%2!=0){
    		   rowClass="odd";
    		}else{
    		   rowClass="even";
    		}	
    	String name = (String)preReminderMap[i].get("SOLICITOR_NAME");
    	String address = (String)preReminderMap[i].get("SOLICITOR_ADDRESS");
     	%>
  <tr class="<%=rowClass %>">
    <td class="index"><%=row1%></td>
    <td>Reminder to Lawyer - Pre-Disbursement&nbsp;</td>
    <td style="text-align:center"><a href="#" onclick="printLetter('<%=row1%>')" >Generate</a></td>
  </tr>
  <% } }%>
  <%if(postReminderMap!=null){ 
  	for(int i=0;i<postReminderMap.length;i++){
  		row2=row1+1;
  		row1++;
  		int ss = i ;
  		String rowClass= (row1%2!=0)?"odd":"even";
  		String name = (String)postReminderMap[i].get("SOLICITOR_NAME");
    	String address = (String)postReminderMap[i].get("SOLICITOR_ADDRESS");
  			%>
  <tr class="<%=rowClass %>">
    <td class="index"><%=row2%></td>
    <td>Reminder to Lawyer - Post-Disbursement&nbsp;</td>
    <td colspan="2" style="text-align:center"><a href="#" onclick="printLetter('<%=row2%>')">Generate</a></td>
  </tr>
  <%} }%>
	<% if (requireMortgageLI) {	%>
	<tr class='<%=(row1++%2!=0)?"odd":"even" %>'>
		<td width="10%" class="index"><%=row1%></td>
		<td width="70%"><bean:message key="label.checklist.print.reminder.li.insurer"/></td>
		<td width="10%" style="text-align:center">
			<a href="#" onclick="viewLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_INSURER %>')">
				<bean:message key="label.view"/>
			</a>
		</td>
		<td width="10%" style="text-align:center">
		<% if (canRetrieveLetterOfInstruction != null && canRetrieveLetterOfInstruction.booleanValue()) { %>
			<a href="#" onclick="printLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_INSURER %>')">
			<bean:message key="label.common.retrieve"/> </a>
		<%} else { %>
			<a href="#" onclick="javascript:alert('LI not generated')">
			<bean:message key="label.common.retrieve"/> </a>
		<%}%>
		</td>
	</tr>
	<tr class='<%=(row1++%2!=0)?"odd":"even" %>'>
		<td class="index"><%=row1%></td>
		<td><bean:message key="label.checklist.print.reminder.li.valuer"/></td>
		<td style="text-align:center">
			<a href="#" onclick="viewLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_VALUER %>')">
				<bean:message key="label.view"/>
			</a>
		</td>
		<td style="text-align:center">
		<% if (canRetrieveLetterOfInstruction != null && canRetrieveLetterOfInstruction.booleanValue()) { %>
			<a href="#" onclick="printLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_VALUER %>')">
			<bean:message key="label.common.retrieve"/> </a>
		<%} else { %>
			<a href="#" onclick="javascript:alert('LI not generated')">
			<bean:message key="label.common.retrieve"/> </a>
		<%}%>
		</td>
	</tr>
	<tr class='<%=(row1++%2!=0)?"odd":"even" %>'>
		<td class="index"><%=row1%></td>
		<td><bean:message key="label.checklist.print.reminder.li.solicitor"/></td>
		<td style="text-align:center">
			<a href="#" onclick="viewLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_SOLICITOR %>')">
				<bean:message key="label.view"/>
			</a>
		</td>
		<td style="text-align:center">
		<% if (canRetrieveLetterOfInstruction != null && canRetrieveLetterOfInstruction.booleanValue()) { %>
			<a href="#" onclick="printLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_SOLICITOR %>')">
			<bean:message key="label.common.retrieve"/> </a>
		<%} else { %>
			<a href="#" onclick="javascript:alert('LI not generated')">
			<bean:message key="label.common.retrieve"/> </a>
		<%}%>
		</td>
	</tr>
	<% } %>
	<% if (requireShareFinanceLI) {	%>
	<tr class='<%=(row1++%2!=0)?"odd":"even" %>'>
		<td class="index"><%=row1%></td>
		<td><bean:message key="label.checklist.print.reminder.li.ebnominee"/></td>
		<td style="text-align:center">
			<a href="#" onclick="viewLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_EB_NOMINEE %>')">
				<bean:message key="label.view"/>
			</a>
		</td>
		<td style="text-align:center">
		<% if (canRetrieveLetterOfInstruction != null && canRetrieveLetterOfInstruction.booleanValue()) { %>
			<a href="#" onclick="printLetterInstruction('<%=profile.getLosLimitProfileReference() %>', '<%=ICMSConstant.DOC_GEN_LI_EB_NOMINEE %>')">
			<bean:message key="label.common.retrieve"/> </a>
		<%} else { %>
			<a href="#" onclick="javascript:alert('LI not generated')">
			<bean:message key="label.common.retrieve"/> </a>
		<%}%>			
		</td>
	</tr>
	<% } %>
  <%if(preReminderMap==null&&preReminderMap==null && !requireMortgageLI && !requireShareFinanceLI){ %>
  <tr class="odd">
	<td colspan="9"><bean:message key="label.global.not.found"/></td>
  </tr>
  <%} %>
  </tbody>
</table>
</td>
    </tr>
</table>
</html:form>
<iframe name='displayReportFrame' src='refresh.gif' width='0' height='0' frameborder='0' scrolling='no'></iframe>
</html>