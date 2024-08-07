<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.user.MaintainUserForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 com.integrosys.component.user.app.bus.CommonUserSearchCriteria,
                 java.util.*,
                 java.util.Vector"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.cms.app.checklist.trx.ICheckListTrxValue"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="java.util.Locale"%>

<%
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
ICMSCustomer cust = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
ILimitProfile limit = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
ICheckListTrxValue checkListTrxVal = (ICheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptAction.checkListTrxVal");
HashMap docListMap = (HashMap) request.getAttribute("docsHeldMap");
ArrayList waiverCreditApproverList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.document.DocumentCheckListAction.allCreditApproverList");
ArrayList finalViewList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.checklist.document.DocumentCheckListAction.finalList");
HashMap checkListIDMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.checklist.document.DocumentCheckListAction.checkListIDMap"); 
String status = (String) request.getAttribute("status");
String description = (String) request.getAttribute("description");
String category = (String) request.getAttribute("category");

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> status "+status);
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> description "+description);
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> category "+category);
int sno = 0;

String defaultEvent = (String) request.getAttribute("event");
if (defaultEvent == null) {
    defaultEvent = "";
}
%>







<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->
 <script type="text/javascript" src="js/imageNavigation.js"></script>
<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable --> <!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" --> <!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" --> <!-- InstanceParam name="contentHeight" type="text" value="100%" -->
<!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
<!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

function searchDoc(){
	//alert("in method search");
	var category = document.getElementById("category").value;
	var description=document.getElementById("description").value;		
	var status=document.getElementById("status").value;	
		//alert(category+" "+description+" "+status);
	if(category=="" && description=="" && status==""){
		alert("Please Enter Search Criteria !");
	}
	else{
	document.forms[0].action      	= "DocumentCheckList.do?event="+"search_checklist"+"&category="+category+"&description="+description+"&status="+status;
 	//document.forms[0].event.value 	= "search_checklist";
 	document.forms[0].submit();
	}
}
function refreshDoc(){
	//alert("in method refresh");	
	document.forms[0].action      	= "DocumentCheckList.do?event=list"
 //	document.forms[0].event.value 	= "list";
 	document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<html:form action="DocumentCheckList.do">
<input type="hidden" name="defaultEvent" value="print_list_all"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
       style="margin-top:10px">
       <tr>
        <td width="82%"><h3>View Complete CheckList</h3></td>
        <td>&nbsp;</td>        
       </tr>
        <tr>
        <td>
            <hr/>
        </td>
    </tr>
    <tr><td>
    <table width="110%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<!--<tr>
<td class="fieldname" width="100%" colspan="3"><center>Please Select Search Criteria</center></td>
</tr>
--><!--<tr>
<td width="20%" class="even"><b>Document Type :</b></td>
<td width="40%" class="even">
<select id="category">
<%if(null==category || category.equals("")){ %>
		<option value="" selected="selected">Please Select</option>
		<%}else{ %>
		<option value="">Please Select</option>
		<%}if(null!=category && category.equals("F")){  %>
		<option value="F" selected="selected">Facility</option>
		<%}else{ %>
		<option value="F">Facility</option>
		<%}if(null!=category && category.equals("S")){ %>
		<option value="S" selected="selected">Security</option>
		<%}else{ %>
		<option value="S">Security</option>
		<%}if(null!=category && category.equals("CAM")){ %>
		<option value="CAM" selected="selected">CAM</option>
		<%}else{ %>
		<option value="CAM">CAM</option>
		<%}if(null!=category && category.equals("O")){ %>
		<option value="O" selected="selected">Other</option>
		<%}else{ %>
		<option value="O">Other</option>
		<%}if(null!=category && category.equals("LAD")){ %>
		<option value="LAD" selected="selected">LAD</option>
		<%}else{ %>
		<option value="LAD">LAD</option>
		<%} %>
</select>
</td>
<td rowspan="3">
<input onclick="searchDoc()"    type="Button" value="Go" class="btnNormal" style="margin-right:5px;margin-left:10;width:50px">
<input onclick="refreshDoc()"    type="Button" value="Refresh" class="btnNormal" style="margin-right:5px;margin-left:10;width:50px">
</td>
</tr>
--><!--<tr>
<td width="20%" class="odd"><b>Document Description :</b></td>
<td width="40"><input type="text" size="60" id="description" <%if(description!=null){ %>value="<%=description %>" <%} %>></input> &nbsp;</td>

</tr>
--><!--<tr>
<td width="20%" class="even"><b>Document Status :</b></td>
<td width="40%" class="even">
<select id="status">
<%if(null==status || status.equals("")){ %>
		<option value="" selected="selected">Please Select</option>
		<%}else{ %>
		<option value="">Please Select</option>
		<%}if(null!=status && status.equals("AWAITING")){ %>
		<option value="AWAITING" selected="selected">Pending</option>
		<%}else{ %>
		<option value="AWAITING">Pending</option>
		<%}if(null!=status && status.equals("RECEIVED")){ %>
		<option value="RECEIVED" selected="selected">Received</option>
		<%}else{ %>
		<option value="RECEIVED">Received</option>
		<%} if(null!=status && status.equals("WAIVED")){%>
		<option value="WAIVED" selected="selected">Waived</option>
		<%}else{ %>
		<option value="WAIVED">Waived</option>
		<%}if(null!=status && status.equals("DEFERRED")){ %>
		<option value="DEFERRED" selected="selected">Defered</option>
		<%}else{ %>
		<option value="DEFERRED">Defered</option>
		<%}if(null!=status && status.equals("ACTIVE")){ %>
		<option value="ACTIVE" selected="selected">Active</option>
		<%}else{ %>
		<option value="ACTIVE">Active</option>
		<%}if(null!=status && status.equals("INACTIVE")){ %>
		<option value="INACTIVE" selected="selected">Inactive</option>
		<%}else{ %>
		<option value="INACTIVE">Inactive</option>
		<%} %>
</select>
</td>
</tr>
--></tbody>
</table>
    </td></tr>
    <tr><td>&nbsp;</td></tr>
    
<tr>
<td>
<%
    if (finalViewList == null || finalViewList.size() == 0) {
%>
<table width="110%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
       style="margin-top:10px">
    <tr>
        <td>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                <tbody>
                <tr class="odd">
                    <td width="100%">No document(s) found.</td>
                </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<% } else { %>
	<%pageContext.setAttribute("finalViewList",finalViewList); %>
	<table width="100%" border="1" cellspacing="0" cellpadding="0" >
	<tr>
                          <td ><table width="100%" border="1" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="6%"><b>S/N</b></td>
                                  <td width="8%"><b>Doc Type</b></td>
                                  <td width="10%"><b>Type</b></td>
                                  <td width="26%"><b>Description</b></td>
                                  <td width="5%"><b>Version</b></td>
                                  <td width="10%"><b>Doc Status</b></td>
                                  <td width="10%"><b>Doc Date</b></td>
                                  <td width="10%"><b>Doc Expiry</b></td>
                                  <td width="10%"><b>Doc Amount</b></td>
                                  <td width="5%"><b>Active</b></td>
                                  
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="finalViewList">
                    <logic:iterate id="ob" name="finalViewList"       
                    indexId="counter"
                     type="com.integrosys.cms.ui.checklist.document.OBViewCompleteCheckList" scope="page">
                      <%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                           // boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                        %>
                        <tr class="<%=rowClass%>">
                                  <td class="index"><%=counter.intValue()+1%></td>
                                  <td><%=ob.getDocType() %>&nbsp;</td>
                                  <%String docType="";
                                  if(ob.getDocType().equals("Facility")){
                                	  docType="FACILITY_DOC";
                                  } else if(ob.getDocType().equals("Security")){
                                	  docType="SECURITY_DOC";
                                  }else if(ob.getDocType().equals("Other")){
                                	  docType="OTHER_DOC";
                                  }else if(ob.getDocType().equals("CAM")){
                                	  docType="CAM_DOC";
                                  }else if(ob.getDocType().equals("LAD")){
                                	  docType="LAD_DOC";
                                  }else if(ob.getDocType().equals("REC")){
                                	  docType="RECURRENTDOC_DOC";
                                  } %>
                                  
                                  <td><%=ob.getType() %>&nbsp;</td>
                                  <td><%=ob.getDescription() %>&nbsp;</td>
                                  <td>V-<%=ob.getVersion() %>&nbsp;</td>
                                  <%if(null!=ob.getStatus()){
                                	  String objStatus=ob.getStatus();
                                	  if(objStatus.equals("AWAITING")){
                                		  objStatus="PENDING";}%>
                                  <td><%=objStatus %>&nbsp;</td>
                                  <%}else{ %>
                                  <td>-&nbsp;</td>
                                  <%} %>
                                  <%if(null !=ob.getDocDate()){ %>
                                  <td><integro:date object="<%=ob.getDocDate()%>" />&nbsp;</td>
                                  <%}else{ %>
                                  <td>-&nbsp;</td>
                                  <%}if(null!=ob.getDocExpDate()){ %>
                                  <td><integro:date object="<%=ob.getDocExpDate()%>" />&nbsp;</td>
                                  <%}else{ %>
                                    <td>-&nbsp;</td>
                                  <%}if(null!=ob.getDocAmount() && !ob.getDocAmount().equals("")){ %>
                                  <td> <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getDocAmount()))%>" />&nbsp;</td>
                                  <%}else{ %>
                                  <td>-&nbsp;</td>
                                  <%} if(null !=ob.getActive() && !ob.getActive().equals("")){%>
                                  <%String active="Y";
                                  if(ob.getActive().equals("INACTIVE")){
                                	  active="N";}%>
                                  <td><%=active %>&nbsp;</td>
                                  <%}else{ %>
                                  <td>-&nbsp;</td>
                                  <%} %>
                                  
              
                                  
                                  </tr>
                                </logic:iterate>
                                
                </logic:present>
                
                              </tbody>
                            </table></td>
                        </tr>
	</table>
<%} %>

</td>
</tr>
<tr><td>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="top">&nbsp;</td>
    </tr>
     <tr>
        
        <td valign="top">&nbsp;<input type="button" value="Confirm" onclick="window.print()"></td>
      
    </tr>
    <tr>
        <td valign="top">&nbsp;</td>
    </tr>
</table>
</td>
</tr>
</table>
</html:form>
</body>
<!-- InstanceEnd --></html>
