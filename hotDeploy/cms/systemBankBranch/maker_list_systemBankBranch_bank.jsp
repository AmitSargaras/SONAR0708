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
                 java.util.List,
                 java.util.Vector"%>

<%
System.out.print("@@@@@@@@@@@@@###################################@@@@@@@@@@@@@@@@@@@@");
   //List sr = (List)request.getAttribute("systemBankBranchList");
    String event = request.getParameter("event");
   // pageContext.setAttribute("systemBankBranchList",sr);
    int sno = 0;
    int startIndex = 0;
    int counter = 0;
   // if (form != null)
    //    counter = form.getStartIndex();
   // String startIndex = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.startIndex");
   // if (form == null && startIndex != null &&  !startIndex.equals(""))
    //    counter = Integer.parseInt(startIndex);
  //  int lStartIndex = counter;
%>




<html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

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
function createSystemBankBranch() {

 	document.forms[0].action="systemBankBranch.do?event=maker_prepare_create_systemBankBranch";
    document.forms[0].submit();
}
 function searchBranch()
	    {	
	    
		    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
			    {
					alert("Please Enter Value For Search" );
			    }	
		    else
			{    
	     
	        var searchText = document.getElementById("searchText").value;
	        var searchBy = document.getElementById("searchByCriteria").value;
	        
	      
	       
	      
	       document.forms[0].action="systemBankBranch.do?event=maker_search_list_systemBankBranch&searchBy="+searchBy+"&searchText="+searchText;
    
    document.forms[0].submit();
			}
	    }
 function checkerSearchBranch()
 {	
 
	    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
		    {
				alert("Please Enter Value For Search" );
		    }	
	    else
		{    
  
     var searchText = document.getElementById("searchText").value;
     var searchBy = document.getElementById("searchByCriteria").value;
     
   
    
   
    document.forms[0].action="systemBankBranch.do?event=checker_search_list_systemBankBranch&searchBy="+searchBy+"&searchText="+searchText;

document.forms[0].submit();
		}
 }

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='systemBankBranch.do?'>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
                    <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>System Bank Branch</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  <td>&nbsp;</td>      
						<% //if (isEditAccess) { %>                    
                          
						<%// } else { %>
						  <td>&nbsp;</td>
						<%// } %>
                        </tr>
                         <tr>
                    <td colspan="2">
                    Search By:<select id="searchByCriteria">
                     <option value="" >--Please Select--</option>
                    <option value="system_bank_branch_code">Branch Code</option>
                    <option value="system_bank_branch_name">Branch Name</option>
                    <option value="system_bank_code">Bank Code</option>
                                                                          
                    
                    </select>
                    
                    
                    Search Text: <input type="text"  id="searchText" /> 
                    <%if((event.equals("checker_list_systemBankBranch"))||event.equals("checker_search_list_systemBankBranch")||event.equals("checker_list_pagination")||event.equals("checker_list_systemBankBranch")){%>
                    <input class="btnNormal" type="button" value="GO" onclick="javascript:checkerSearchBranch();"/>
                    <%}else{ %>
                    <input class="btnNormal" type="button" value="GO" onclick="javascript:searchBranch();"/>
                    </td>
                    <td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createSystemBankBranch()"/>
										</td>
                     <%} %>
                    
                    
                </tr>
                        <tr>
                          <td colspan="4"><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="5%">S/N</td>
                                  <td width="16%">Branch Code</td>
                                  <td width="30%">Branch Name</td>
                                  <td width="16%">Bank Code</td>
                                  <td width="30%">Bank Name</td>
                                  <td width="16%">City</td>
                                  <td width="16%">State</td>
                                  <td width="16%">Region</td>
                                  <td width="16%">Country</td>
                                  <td width="16%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="systemBankBranchList">
                    <logic:iterate id="ob" name="systemBankBranchList"  type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch" scope="page">
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
                                  <td class="index"><%=sno%></td>
                                   <td><%=ob.getSystemBankBranchCode()%>&nbsp;</td>
                                  <td><%=ob.getSystemBankBranchName()%>&nbsp;</td>
                                  <td><%=ob.getSystemBankCode().getSystemBankCode()%>&nbsp;</td>
                                  <td><%=ob.getSystemBankCode().getSystemBankName()%>&nbsp;</td>
                                   <td><%=ob.getCityTown()%>&nbsp;</td>
                                    <td><%=ob.getState()%>&nbsp;</td>
                                     <td><%=ob.getRegion()%>&nbsp;</td>
                                  <td><%=ob.getCountry()%>&nbsp;</td>
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if((event.equals("checker_list_systemBankBranch"))||event.equals("checker_search_list_systemBankBranch")||event.equals("checker_list_pagination")){%>
                                      <option value='systemBankBranch.do?event=checker_view_systemBankBranch&branchCode=<%=ob.getId()%>'>View</option>
                                       <%}else{ %>
                                      
                                      <option value='systemBankBranch.do?event=maker_view_systemBankBranch&branchCode=<%=ob.getId()%>'>View</option>
								
                                      <option value='systemBankBranch.do?event=maker_edit_systemBankBranch_read&branchCode=<%=ob.getId()%>'>Edit</option>
                                       <option value='systemBankBranch.do?event=maker_delete_systemBankBranch_read&branchCode=<%=ob.getId()%>'>Delete</option>
                                      
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
                                <% } %>
                </logic:present>
                <logic:notPresent name="systemBankBranchList">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              <logic:present name="systemBankBranchList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="564" valign="middle">
                         <%if((event.equals("checker_list_systemBankBranch"))||event.equals("checker_search_list_systemBankBranch")||event.equals("checker_list_pagination")){%>
                            Index:&nbsp;<integro:alphaindex url='<%="systemBankBranch.do?event=checker_list_pagination&loginId="%>' />
                             <%}else{ %>
                              Index:&nbsp;<integro:alphaindex url='<%="systemBankBranch.do?event=list_pagination&loginId="%>' />
                             <%} %>
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        
                       
                         <td width="94" valign="middle" id="orgpanel">
                         </td>
                        
                      </tr>
                    </table>
                 </td>
              </tr>
              </logic:present>
</table>

</body>
</html:form>
<!-- InstanceEnd --></html>
