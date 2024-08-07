<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%

SearchResult sr = (SearchResult)request.getAttribute("LeiDateValidationList");

if(sr!=null){
	 List leiDateValidationList = new ArrayList(sr.getResultList());
		pageContext.setAttribute("LeiDateValidationList",leiDateValidationList);

		System.out.print(" ind sr "+leiDateValidationList);
	}

    String event = (String)request.getParameter("event");
    int sno = 0;
    int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);

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
function createLeiDateValidation() {
	
 	document.forms[0].action = "leiDateValidation.do?event=maker_prepare_create_lei_date_validation&startIndex=<%=startIndex%>";
 	
    document.forms[0].submit();
}

	function searchLeiDateValidation()
	{
		var searchType = document.getElementById("selType").value;
		var searchText = document.getElementById("srcText").value;

		if(searchType == '' && searchText == '')
        {
	        document.forms[0].action            = "leiDateValidation.do";
	        document.forms[0].event.value       = "maker_list_lei_date_validation";
	        document.forms[0].submit();
        }
        else
        {
	        if(searchType !='' && searchText!='')
		    {	        	
		        document.forms[0].action            = "leiDateValidation.do?type="+searchType +"&"+ "text="+searchText;		        
		        document.forms[0].event.value       = "maker_list_lei_date_validation";		              
				document.forms[0].submit();
	        }	       
	    }      
	}

</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='leiDateValidation.do?'>
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
						<h3>Lei Date Validation Period Master</h3>
						</td>
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
	                   	<option value="partyID">Party ID</option>
	                   	<option value="partyName">Party Name</option>
                   	</select> 
	           		&nbsp;<input type="text" id="srcText" maxlength="30"/>
	           		&nbsp;<img alt="Search" src="./img/search.gif" onclick="javascript:searchLeiDateValidation()">
                   </td>
                   <td>&nbsp;</td>
                   <td  valign="bottom" align="right">						
						<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createLeiDateValidation()" />
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
									<td width="20%">Party ID</td>
									<td width="20%">Party Name</td>
									<td width="25%">Lei Date Validation Period (in Months)</td>
									<td width="15%">Status</td>
									<td width="15%">Action</td>
								</tr>
							</thead>
							<tbody>
								<logic:present name="LeiDateValidationList">
                    <logic:iterate id="ob" name="LeiDateValidationList"  
                    length="10" 
                    offset="<%=String.valueOf(startIndex)%>"
                    indexId="counter"
                     type="com.integrosys.cms.app.leiDateValidation.bus.OBLeiDateValidation" scope="page">
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
                                  
                                    <td><center><%=ob.getPartyID()%>&nbsp;</center></td>                                  
                                    <td><center><%=ob.getPartyName()%>&nbsp;</center></td>
                                    <td><center><%=ob.getLeiDateValidationPeriod()%>&nbsp;</center></td> 
                                  <td ><%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if((event.equals("checker_lei_date_validation"))||event.equals("checker_list_pagination")){%>
                                      <option value='leiDateValidation.do?event=checker_view_lei_date_validation&id=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
                                       <%}else{ %>
                                      
                                      <option value='leiDateValidation.do?event=maker_view_lei_date_validation&id=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
								
                                      <option value='leiDateValidation.do?event=maker_edit_lei_date_validation_read&id=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
                                      
									  <%} %>
                                    </select> </td>
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <%} %>
                </logic:present>
                 <logic:notPresent name="LeiDateValidationList">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
							</tbody>
						</table>
						</td>
					</tr>
					 <!-- General Purpose Bar -->
                     


	</table>
	
</td></tr>

<logic:present name="LeiDateValidationList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table  width="100%" border="0" cellspacing="0" cellpadding="0">
                         
                         <% if(sr != null) {
                        	 if((event.equals("checker_list_lei_date_validation"))
                        			 ||event.equals("checker_search_list_lei_date_validation")
                        			 ||event.equals("checker_list_pagination")){
                         
                         
                         %>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, sr.getResultList().size())%>"
					                            url="leiDateValidation.do?event=checker_list_lei_date_validation&startIndex=&go=Y"/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					<%}else{ %>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, sr.getResultList().size())%>"
					                            url="leiDateValidation.do?event=maker_list_lei_date_validation&startIndex="/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					<%}} %>
                      </table>
                 </td>
              </tr>
              </logic:present>
</table>

	</body>
</html:form>
<!-- InstanceEnd -->
</html>
