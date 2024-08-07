<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page
	import="com.integrosys.cms.ui.pincodemapping.PincodeMappingForm"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%
	PincodeMappingForm pincodeMappingForm = (PincodeMappingForm) request.getAttribute("PincodeMappingForm");
	SearchResult searchResult =(SearchResult) session.getAttribute("com.integrosys.cms.ui.pincodemapping.PincodeMappingAction.pincodeMappingList");
	String event = request.getParameter("event");
	int counter = 1;
	int noofItems = 0;	
	int index = 0;
	
	int startInd = 0;
	
	int sno = 0;
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else
		 startIndex = Integer.parseInt(ind);
	
	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;
	if (searchResult != null) {
		resultList = searchResult.getResultList();
		startInd = searchResult.getStartIndex();
		totalCount = searchResult.getNItems();
		listSize = resultList.size();
		pageContext.setAttribute("pincodeMappingSize", Integer.toString(listSize));
		pageContext.setAttribute("pincodeMappingList", resultList);
	}else
		System.out.print("searchResult : "+searchResult);
%>




<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.Collection"%><html>
<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" -->
<!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" -->
<!-- InstanceParam name="contentHeight" type="text" value="100%" -->
<!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
<!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function createPincodeMapping() {
	
 	document.forms[0].action = "StatePincodeMapping.do?event=maker_prepare_create_state_pincode_mapping&startIndex=<%=startIndex%>";
 	
    document.forms[0].submit();
}

	function searchPincode()
	{
		var searchType = document.getElementById("selType").value;
		var searchText = document.getElementById("srcText").value;
	
		if(searchType == '' && searchText == '')
	    {
	        document.forms[0].action            = "StatePincodeMapping.do";
	        document.forms[0].event.value       = "checker_list_state_pincode_mapping";
	        document.forms[0].submit();
	    }
	    else
	    {
	        if(searchType !='' && searchText!='')
		    {	        	
		        document.forms[0].action            = "StatePincodeMapping.do?type="+searchType +"&"+ "text="+searchText;		        
		        document.forms[0].event.value       = "checker_list_state_pincode_mapping";		              
				document.forms[0].submit();
	        }	       
	    }      
	}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='StatePincodeMapping.do?'>
<html:hidden property="event"/>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<!-- InstanceBeginEditable name="menuScript" -->
	<!-- InstanceEndEditable -->
	<table width="100%" height="100%" cellspacing="0" cellpadding="0"
		border="0">
		<tr>
			<td valign="top">
			<table width="95%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td width="82%">
						<h3>State Pincode Mapping</h3>
						</td>
						<td width="18%" valign="bottom" align="right"></td>
						<td>&nbsp;</td>
						<%
							//if (isEditAccess) {
						%>
						<td width="18%" align="right" valign="bottom"></td>
						<%
							// } else {
						%>
						<td>&nbsp;</td>
						<%
							// }
						%>
					</tr>
					<tr>
						<td colspan="4">
						<hr />
						</td>
					</tr>
						<tr>                   
                   <td><label>Search :&nbsp;</label>
                   	<select id="selType">
	                   	<option value="">--Select--</option>	
	                   	<option value="stateId">State Name</option>                
	                   	<option value="pincode">PinCode</option>
	                    
                   	</select> 
	           		&nbsp;<input type="text" id="srcText" maxlength="30"/>
	           		&nbsp;<img alt="Search" src="./img/search.gif" onclick="javascript:searchPincode()">
                   </td>    
               </tr>
               <tr>
                   <td><html:errors property="searchTextError"/>&nbsp;</td>
               </tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblInfo">
							<thead>
								<tr>
									<td width="5%">S/N</td>
									<td width="32%">State Name</td>
									<td width="37%">PinCode</td>
									<td width="16%">Status</td>
									<td width="16%">Action</td>
								</tr>
							</thead>
							<tbody>
								<logic:present name="pincodeMappingList">
									<logic:iterate id="ob" name="pincodeMappingList"
										length="10" offset="<%=String.valueOf(startIndex)%>"
										type="com.integrosys.cms.app.pincodemapping.bus.OBPincodeMapping"
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
											<td><center><%=ob.getStateId().getStateName()%>&nbsp;</center></td>
											<td><center><%=ob.getPincode()%>&nbsp;</center></td>
											 <td><% if(ob.getStatus().equals("ACTIVE")){%>Enable
                        					 <%}else{ %>Disable<%}%></td>

											<td><select name="menu1"
												onchange="MM_jumpMenu('self',this,0)" style="width: 110">
												<option value="#" selected>Please Select</option>
												<%
													if (event.equals("checker_list_state_pincode_mapping")) {
												%>
												<option
													value='StatePincodeMapping.do?event=checker_view_state_pincode_mapping&trxId=<%=ob.getId()%>'>View</option>
												<%
													} else {
												%>
												<option
													value='StatePincodeMapping.do?event=checker_view_state_pincode_mapping&trxId=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>


												<%
													if (ob.getStatus().equals("ACTIVE")) {
												%>
												<!-- <option
													value='StatePincodeMapping.do?event=maker_edit_state_pincode_mapping_read&trxId=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
												<option
													value='StatePincodeMapping.do?event=maker_disable_state_pincode_mapping&trxId=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Disable</option>
												--><%
													} else {
												%>
												<!--<option
													value='StatePincodeMapping.do?event=maker_enable_state_pincode_mapping&trxId=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Enable</option>
												--><%
													}
												%>
												<%
													}
												%>

											</select></td>
										</tr>
									</logic:iterate>
									<%
										if (sno == 0) {
									%>
									<tr class="odd">
										<td colspan="8"><bean:message
											key="label.global.not.found" /></td>
									</tr>
									<%
										}
									%>
								</logic:present>
								<logic:notPresent name="pincodeMappingList">
									<tr class="odd">
										<td colspan="8"><bean:message
											key="label.global.not.found" /></td>
									</tr>
								</logic:notPresent>
							</tbody>
						</table>
						</td>
					</tr>
					 <!-- General Purpose Bar -->
                     


	</table>
	
</td></tr>

<tr id="generalPurposeBarTR">
<td height="25">
	<table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">

	<tr>
   
 <%
                            String pageIndexUrl=null;
                            
                                pageIndexUrl = "StatePincodeMapping.do?event=checker_list_pagination&startIndex=";
                           
                        %>
<% if (searchResult!=null) { %>


	<td valign="middle">  
	 <integro:pageindex pageIndex='<%=new PageIndex(startIndex,10, listSize)%>'
	 					url='<%=pageIndexUrl%>'/>             
	</td>
<% } %>
	 </tr>

	</table>
</td>
</tr>
</table>

	</body>
</html:form>
<!-- InstanceEnd -->
</html>
