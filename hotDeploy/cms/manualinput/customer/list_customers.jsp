<%@ page
	import="java.util.*,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
String event= (String) request.getAttribute("event");
String customerNameShort= (String) request.getAttribute("customerNameShort");
request.setAttribute("customeNameShort",customerNameShort);
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
boolean isUserCpcMaker = false;       
if(Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_SSC_MAKER 
||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
|| Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
|| Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH
|| Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_PARTY_MAKER
|| Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
|| Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
	isUserCpcMaker = true;
} else {
	isUserCpcMaker=false;
}
	int sno = 0;
int startIndex=0;
String ind= (String) request.getAttribute("startIndex");
if(ind!=null && (!ind.equals("")))
{
	 startIndex = Integer.parseInt(ind);
	
}
	ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request
			.getAttribute("ManualInputCustomerInfoForm");
	List list = (List) request.getAttribute("customerList");
	pageContext.setAttribute("customerList", list);
	//String customerID = (String )request.getAttribute("customerId");  
	System.out.println("customer     "+  list.getClass());
//	for(int i=0 ;i<list.size() ;i++){
//		String[] customer = (String[]) list.get(i);
//	System.out.println("customer     "+  list.size());
//	System.out.println("customer     "+  customer[1]);
//	}
	if (form != null) {
		DefaultLogger.debug(this, "form :" + form.getSource());
		DefaultLogger.debug(this, "getSubProfileId :"
				+ form.getSubProfileId() + "<<<<<<");
	} else {

	}
%>



<%@page import="com.integrosys.cms.ui.common.CountryList"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">

function createNewCustomer(name){
	document.forms[0].action = "ManualInputCustomer.do";
	document.forms[0].event.value = name;
	document.forms[0].customerNameShort.value = "";
    document.forms[0].submit();	
}
function goAlphaIndex(ind) {

    document.forms[0].customerNameShort.value=ind;
  if (ind == '')
  {
   document.forms[0].all.value = 'Y';
  }
  var event = "<%=event%>";
    document.forms[0].indicator.value='*';
    document.forms[0].startIndex.value='0';
    if(event == 'checker_list_party_detail' || event == 'list_customer_checker')
    {   
	document.forms[0].event.value = "list_customer_checker";
    }
    else if(event == 'brchecker_list_party_detail' || event == 'list_customer_brchecker')
    {
    	document.forms[0].event.value = "list_customer_brchecker";
    }
    else if(event == 'list_customers_brmaker')
    {
    	document.forms[0].event.value = "list_customers_brmaker";
    }
    else
    {
    	document.forms[0].event.value = "list_customers";
    }
    document.forms[0].submit();
 }
function getAction(id, cif, ind) {

	 var event = "<%=event%>";
	var type = document.getElementById("actionType"+ind).value;
	if( type == "View"){
		document.forms[0].action = "ManualInputCustomer.do?legalId=" + cif +"&customerId="+id;
		document.forms[0].event.value = "view_customer";
		document.forms[0].submit();
	}
	else if( type == "checkerView"){
		
		document.forms[0].action = "ManualInputCustomer.do?legalId=" + cif +"&customerId="+id;
		if(event=="list_customer_checker" || event=="checker_list_party_detail")
		{
		document.forms[0].event.value = "view_customer_checker";
		}else
		{
			document.forms[0].event.value = "view_customer_brchecker";
		}
		document.forms[0].submit();
	}
	else if( type == "Edit"){
		document.forms[0].action = "ManualInputCustomer.do?legalId=" + id +"&customerId="+id;
		if(event=="list_customers_brmaker")
				{
			document.forms[0].event.value = "edit_customer_details_brmaker";  
				}
		else{
    	document.forms[0].event.value = "edit_customer_details";  
		}	
    	document.forms[0].submit();
	}
	else if( type == "Delete"){	

		document.forms[0].action = "ManualInputCustomer.do?legalId=" + id +"&customerId="+id;
    	document.forms[0].event.value = "prepare_delete_customer";
		document.forms[0].submit();
	}	    
}

</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ManualInputCustomer.do">
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<input type="hidden" name="event">
	  <input type="hidden" name="indicator" >
	   <input type="hidden" name="startIndex" >
	  
        <input type="hidden" name="all">
	<!-- InstanceBeginEditable name="Content" -->
	<table width="100%" height="100%" cellspacing="0" cellpadding="0"
		border="0">
		<tr>
			<td valign="top">
	<table width="95%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		
			
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
			
			<%if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker")){ %>
				<td align="right"></td>
				<%}else if(event.equals("brchecker_list_party_detail") || event.equals("list_customer_brchecker")){ %>
						<td align="right"></td>
					<%}else if(event.equals("list_customers_brmaker")){ %>
					 <%if(isUserCpcMaker) { %>
					<td align="right">
					<input type="button" id="AddNew" value="Add"
					onclick="javascript:createNewCustomer('prepare_create_customer_brmaker')" class="btnNormal"
					style="margin-right: 5px; margin-left: 10; width: 50px" />
					</td>
					<%} %>
					<%}else { %>
					 <%if(isUserCpcMaker) { %>
					<td align="right"><input type="button" id="AddNew" value="Add"
					onclick="javascript:createNewCustomer('prepare_create_customer')" class="btnNormal"
					style="margin-right: 5px; margin-left: 10; width: 50px" /></td>
					<%} %>
					<%} %>
					
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		

		
			<tr>
				<td colspan="2">
				<table width="100%" class="tblinfo" style="margin-top: 0" border="0"
					cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<td width="5%">S/N</td>
							<td width="30%" nowrap="nowrap">Party Name</td>
							<td width="20%">Party ID</td>
							<td width="20%">Status</td>
							<td width="20%">Action</td>
						</tr>
					</thead>
					<tbody>
						<logic:present name="customerList">
									<logic:iterate id="ob" name="customerList"
										
										type="com.integrosys.cms.app.customer.bus.OBCMSCustomer"
										length="10" offset="<%=String.valueOf(startIndex)%>"
										scope="page">
										<%
										
											String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
							
														%>
										<tr class="<%=rowClass%>">
											<td class="index"><%=sno+startIndex%></td>
											<td><center><integro:empty-if-null value="<%=ob.getCustomerName()%>"/>&nbsp;</center></td>
											<td><center><%=ob.getCifId()%>&nbsp;</center></td>
											
											<td><center><%=ob.getStatus()%>&nbsp;</center></td>
											<%if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker") || event.equals("brchecker_list_party_detail") || event.equals("list_customer_brchecker")){ %>
											<td><center><select id="actionType<%=sno+startIndex%>" onchange="getAction('<%=ob.getCustomerID() %>','<%=ob.getCifId() %>','<%=sno+startIndex%>')">
              		<option value="">Please Select</option>
              		<option value="checkerView">View</option>
              	
              		<!--<option value="Delete">InActive</option>              	
              	--></select></center></td>
              	<%}else{ %>
              	<td><center><select id="actionType<%=sno+startIndex%>" onchange="getAction('<%=ob.getCustomerID() %>','<%=ob.getCifId() %>','<%=sno+startIndex%>')">
              		<option value="">Please Select</option>
              		<option value="View">View</option>
              		 <%if(isUserCpcMaker) { %>
              			<option value="Edit">Edit</option>
              			<%} %>
              		<!--<option value="Delete">InActive</option>              	
              	--></select></center></td>
              	<%} %>
						</tr></logic:iterate></logic:present>
						<%if(list != null && list.size()==0) {%>
									<tr class="odd">
										<td colspan="8"><bean:message
											key="label.global.not.found" /></td>
									</tr>
							<%} %>
					</tbody>
				</table>
				</td>
			</tr>
		
	</table>
	</td></tr>
	<tr id="generalPurposeBarTR">
<td height="25">
	<table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">

	<tr>
   
 <%
                            String pageIndexUrl=null;
 if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker")){
                                pageIndexUrl = "ManualInputCustomer.do?event=list_customer_checker&customerNameShort="+customerNameShort+"&startIndex=";
 }
 else if(event.equals("brchecker_list_party_detail") || event.equals("list_customer_brchecker")){
                                pageIndexUrl = "ManualInputCustomer.do?event=list_customer_brchecker&customerNameShort="+customerNameShort+"&startIndex=";
 }
 else if(event.equals("list_customers_brmaker"))
 {
	 pageIndexUrl = "ManualInputCustomer.do?event=list_customers_brmaker&customerNameShort="+customerNameShort+"&startIndex=";
 }
 else{
	 pageIndexUrl = "ManualInputCustomer.do?event=list_customers&customerNameShort="+customerNameShort+"&startIndex=";
 }
                           
                        %>
<% if (list!=null) { %>

 
 <% if(event.equals("checker_list_party_detail") || event.equals("list_customer_checker")){%>
   <td width="580" valign="middle">
                <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customer_checker"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
                  <%}else if(event.equals("list_customers_brmaker")){ %>
                   <td width="580" valign="middle">
                 <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customers_brmaker"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
                    <%}else if(event.equals("list_customers_brchecker") || event.equals("brchecker_list_party_detail") ){ %>
                   <td width="580" valign="middle">
                 <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customers_brchecker"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
               <%  }else{ %>
               <td width="580" valign="middle">
                 <integro:alphaindex url='<%="ManualInputCustomer.do?event=list_customers"%>' submitFlag='<%=new Boolean(true)%>'/>
                  </td>
                <%} %>
             
              <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
	<td valign="middle">  
	 <integro:pageindex pageIndex='<%=new PageIndex(startIndex,10, list.size())%>'
	 					url='<%=pageIndexUrl%>'/>             
	</td>
<% } %>
	 </tr>

	</table>
	</td></tr>
	</table>
	

	<!-- InstanceEndEditable -->
	<!--<html:hidden property="legalConstitution"/>
<html:hidden property="CIFId"/>
<html:hidden property="legalName"/>
<html:hidden property="cifId"/>
-->
	<html:hidden property="subProfileId" />
	<!--<html:hidden property="customerNameShort"/>
<html:hidden property="domicileCountry"/>
<html:hidden property="blacklisted"/>
<html:hidden property="source"/>
<html:hidden property="cifId"/>
<html:hidden property="address1"/>
<html:hidden property="address2"/>
<html:hidden property="officeAddress1"/>
<html:hidden property="officeAddress2"/>
<html:hidden property="state"/>
<html:hidden property="city"/>
<html:hidden property="officeState"/>
<html:hidden property="officeCity"/>
<html:hidden property="officeEmail"/>
<html:hidden property="officeTelephoneNo"/>
<html:hidden property="email"/>
<html:hidden property="telephoneNo"/>
<html:hidden property="country"/>
<html:hidden property="officeCountry"/>

<html:hidden property="postcode"/>
-->
	<html:hidden property="legalId" value="<%=form.getCifId() %>" />
	<html:hidden property="customerNameShort" value="<%=customerNameShort%>" />
	</body>
</html:form>

<!-- InstanceEnd -->
</html>
