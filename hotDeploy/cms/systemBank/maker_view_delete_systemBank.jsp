
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,
	java.util.List,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.ui.systemBank.MaintainSystemBankForm"%>
<%

String contactNumber=null;
String faxNumber=null;
ISystemBankTrxValue systemBankTrx = (ISystemBankTrxValue)session.getAttribute("com.integrosys.cms.ui.systemBank.MaintainSystemBankAction.ISystemBankTrxValue");
	if(systemBankTrx!=null){
		if(systemBankTrx.getSystemBank()!=null){
			if(systemBankTrx.getSystemBank().getContactNumber()!=0){
				contactNumber=String.valueOf(systemBankTrx.getSystemBank().getContactNumber());
			}
			if(systemBankTrx.getSystemBank().getFaxNumber()!=0){
				faxNumber=String.valueOf(systemBankTrx.getSystemBank().getFaxNumber());
			}
		}
	}
		 
	SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.systemBank.MaintainSystemBankAction.systemBankBranchList");
	if(sr!=null){
	 List systemBankBranchList = new ArrayList(sr.getResultList());
		pageContext.setAttribute("systemBankBranchList",systemBankBranchList);
	}
	MaintainSystemBankForm systemBankForm = (MaintainSystemBankForm) request.getAttribute("MaintainSystemBankForm");
	 String event1 = request.getParameter("event");
	 String rejectEvent = "";
	 if((event1.equals("checker_list_systemBankBranch"))
   		  ||event1.equals("checker_view_systemBank") 
   		  ||event1.equals("checker_search_list_systemBankBranch")
   		  ||event1.equals("checker_list_pagination")
   		  ||event1.equals("checker_list_systemBank"))
		 rejectEvent = "checker_list_systemBank";
	 else
		 rejectEvent = "maker_list_systemBank";
//int sno = 0;
	//int startIndex = 0;
%>



<%@page import="com.integrosys.cms.app.systemBank.trx.ISystemBankTrxValue"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		<script language="JavaScript" type="text/JavaScript">
<!--
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
function cancelPage(){
    document.forms[0].action="systemBank.do?event=<%=rejectEvent%>";
    
    document.forms[0].submit();
}


//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='systemBank.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					
					<tr>
						<td>
							<h3>
								View System Bank
							</h3>
						</td>
					</tr>
					<tr>
						<td>
							<hr />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>
									
											<tr class="odd">

												<td class="fieldname" width="20%">
													Bank Code
												</td>
												<td width="30%"><%=systemBankTrx.getSystemBank().getSystemBankCode()%>&nbsp;
												</td>
												<td class="fieldname" width="20%">
													Bank Name
												</td>
												<td width="30%"><%=systemBankTrx.getSystemBank().getSystemBankName()%>&nbsp;
												</td>
											</tr>
											<tr class="even">
												<td class="fieldname">
													Address
												</td>
												<td><integro:empty-if-null value="<%=systemBankTrx.getSystemBank().getAddress()%>" />&nbsp;
												</td>
												<td class="fieldname">
													Country
												</td>
												<td><integro:empty-if-null value="<%=systemBankTrx.getSystemBank().getCountry().getCountryName()%>" />&nbsp;
												</td>
											</tr>
											<tr class="odd">
											<td class="fieldname">
													Region
												</td>
												<td><%=systemBankTrx.getSystemBank().getRegion().getRegionName()%>&nbsp;
												</td>
												<td class="fieldname">
													State
												</td>
												<td><%=systemBankTrx.getSystemBank().getState().getStateName()%>&nbsp;
												</td>
												
											</tr>
											<tr class="even">

												<td class="fieldname">
													City/Town
												</td>
												<td><%=systemBankTrx.getSystemBank().getCityTown().getCityName()%>&nbsp;
												</td>
												<td class="fieldname">
													Contact Number
												</td>
												<td><integro:empty-if-null value="<%=contactNumber%>" />&nbsp;
												</td>
											</tr>
											<tr class="odd">
												<td class="fieldname">
													Contact Mail
												</td>
												<td><integro:empty-if-null value="<%=systemBankTrx.getSystemBank().getContactMail()%>" />&nbsp;
												</td>
												  <td class="fieldname">
													Fax Number
												</td>
												<td><integro:empty-if-null value="<%=faxNumber%>" />&nbsp;
												</td>

											</tr>



										
								</tbody>
							</table>
						</td>
					</tr>


				</tbody>
			</table>

			<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
				<tr>


					<td colspan="4">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
					</td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
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

<%


    String event = request.getParameter("event");
    System.out.println("event" +event);
    
    
  //  int offset = ((Integer)session.getAttribute( "com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.offset")).intValue();
    //int length = ((Integer)session.getAttribute( "com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.length")).intValue();    
    int sno = 0;
    int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
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
	        
	      
	       
	      
	       document.forms[0].action="systemBank.do?event=maker_search_list_systemBankBranch&searchBy="+searchBy+"&searchText="+searchText;
    
    document.forms[0].submit();
			}
	    }

 function searchBankBranch()
 {	
	var BranchCode = document.getElementById("txtBranchCode").value;
    var BranchName = document.getElementById("txtBranchName").value;
    var State = document.getElementById("txtState").value;
    var City = document.getElementById("txtCity").value;
    
	    	document.forms[0].action  = "systemBank.do?event=maker_search_list_systemBankBranch&BranchCode="+BranchCode+"&BranchName="+BranchName+"&State="+State+"&City="+City;
		    document.forms[0].submit();
           
 }
 function searchBankBranchChecker()
 {	
	 var BranchCode = document.getElementById("txtBranchCode").value;
     var BranchName = document.getElementById("txtBranchName").value;
     var State = document.getElementById("txtState").value;
     var City = document.getElementById("txtCity").value;
    
	    	document.forms[0].action  = "systemBank.do?event=checker_search_list_systemBankBranch&BranchCode="+BranchCode+"&BranchName="+BranchName+"&State="+State+"&City="+City;
		    document.forms[0].submit();
           
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

 function uploadMasterFile() {
		document.forms[0].action="systemBankBranch.do?event=maker_prepare_upload_systemBankBranch";
	    document.forms[0].submit();
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
                    <table width="87%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
                         <tr >
                         <%if(!(event.equals("checker_view_systemBank")||event.equals("checker_search_list_systemBankBranch")
                        		 ||event.equals("checker_paginate"))){ %>
							<td ><br />
								Branch Code:<input type="text" size="20" id="txtBranchCode"  maxlength="30"/>
								Branch Name:<input type="text" size="20" id="txtBranchName"  maxlength="50"/>
								State:<input type="text" size="20" id="txtState" maxlength="30"/>
								City:<input type="text" size="20" id="txtCity" maxlength="30" />
								
								<a href="#" target="_self"><img src="img/search.gif" border="0"
								onclick="searchBankBranch()" /></a> 
								</br>
								&nbsp;<html:errors property="branchInvalidCodeError" />
								&nbsp;<html:errors property="branchInvalidNameError" />
								&nbsp;<html:errors property="stateInvalidNameError" />
								&nbsp;<html:errors property="cityInvalidNameError" /></td>
								<td  valign="bottom" align="right">
									<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createSystemBankBranch()"/>&nbsp;
									<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadMasterFile()"/>
								</td>
					<%}else{ %>
						<td ><br />
								Branch Code:<input type="text" size="20" id="txtBranchCode"  maxlength="30"/> &nbsp;
								Branch Name:<input type="text" size="20" id="txtBranchName"  maxlength="50"/> &nbsp;
								State:<input type="text" size="20" id="txtState" maxlength="30"/> &nbsp; 
								City:<input type="text" size="20" id="txtCity" maxlength="30" />&nbsp;
								<a href="#" target="_self"><img src="img/search.gif" border="0"
								onclick="searchBankBranchChecker()" /></a>
								</br>
								&nbsp;<html:errors property="branchInvalidCodeError" />
								&nbsp;<html:errors property="branchInvalidNameError" />
								&nbsp;<html:errors property="stateInvalidNameError" />
								&nbsp;<html:errors property="cityInvalidNameError" />
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
                                  <td width="16%">Status</td>
                                  <td width="16%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="systemBankBranchList">
                    <logic:iterate id="ob"
						offset="<%=String.valueOf(startIndex)%>"
        length="10"               
                     name="systemBankBranchList"  
                    indexId="counter"
                    type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch" scope="page">
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
                                   <td><%=ob.getSystemBankBranchCode()%>&nbsp;</td>
                                  <td><%=ob.getSystemBankBranchName()%>&nbsp;</td>
                                  <td><%=ob.getSystemBankCode().getSystemBankCode()%>&nbsp;</td>
                                  <td><%=ob.getSystemBankCode().getSystemBankName()%>&nbsp;</td>
                                   <td><%=ob.getCityTown().getCityName()%>&nbsp;</td>
                                    <td><%=ob.getState().getStateName()%>&nbsp;</td>
                                     <td><%=ob.getRegion().getRegionName()%>&nbsp;</td>
                                  <td><%=ob.getCountry().getCountryName()%>&nbsp;</td>
                                   </td>
         
              <td ><%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if((event.equals("checker_list_systemBankBranch"))
                                    		  ||event.equals("checker_view_systemBank") 
                                    		  ||event.equals("checker_search_list_systemBankBranch")
                                    		  ||event.equals("checker_list_pagination")
                                    		  ||event.equals("checker_list_systemBank")
                                    		  ||event.equals("checker_paginate")){%>
                                      <option value='systemBankBranch.do?event=checker_view_systemBankBranch&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
                                       <%}else{ 
                                       
                                       %>
                                      
                                      <option value='systemBankBranch.do?event=maker_view_systemBankBranch&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
								
                                      <option value='systemBankBranch.do?event=maker_edit_systemBankBranch_read&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
                                       <option value='systemBankBranch.do?event=maker_delete_systemBankBranch_read&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Delete</option>
                                      
									  <%} %>
                                    </select> </td>
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="11">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                </logic:present>
                <logic:notPresent name="systemBankBranchList">
                                <tr class="odd">
                                	<td colspan="11">
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
                        
<!--                            Index:&nbsp;<integro:alphaindex url='<%="systemBankBranch.do?event=checker_list_pagination&loginId="%>' />-->
<!--                             -->
<!--                              Index:&nbsp;<integro:alphaindex url='<%="systemBankBranch.do?event=list_pagination&loginId="%>' />-->
                             
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        
                        <%
                            String pageIndexUrl=null;
                        String id= String.valueOf(systemBankTrx.getSystemBank().getId()); 
                        if((event.equals("checker_list_systemBankBranch"))
                        		||event.equals("checker_view_systemBank") 
                        		||event.equals("checker_search_list_systemBankBranch")
                        		||event.equals("checker_list_pagination")
                        		||event.equals("checker_list_systemBank")
                        		||event.equals("checker_paginate")){
                                pageIndexUrl = "systemBank.do?event=checker_paginate&bankCode="+id+"&startIndex=";
                                }else{
                                	pageIndexUrl = "systemBank.do?event=paginate&bankCode="+id+"&startIndex=";
                                }
                        %>
                        <td width="86" valign="middle">
                           &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,10,sr.getNItems())%>'
                                url='<%=pageIndexUrl%>' />

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
			



			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
