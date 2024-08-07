<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.user.MaintainUserForm,
                 com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 com.integrosys.component.user.app.bus.CommonUserSearchCriteria,
                 java.util.*,
                 java.util.Vector"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%
	String context = request.getContextPath() + "/";
	
String newCollateralCodeSearch=(String)request.getAttribute("newCollateralCodeSearch");
String newCollateralMainTypeSearch=(String)request.getAttribute("newCollateralMainTypeSearch");
String newCollateralSubTypeSearch=(String)request.getAttribute("newCollateralSubTypeSearch");
String newCollateralDescriptionSearch=(String)request.getAttribute("newCollateralDescriptionSearch");
	
//SearchResult sr = (SearchResult)request.getAttribute("UserList");
SearchResult sr = (SearchResult)request.getAttribute("collateralNewMasterList");
List collateralNewMasterList =null;
if(sr!=null){
 collateralNewMasterList = new ArrayList(sr.getResultList());
	pageContext.setAttribute("collateralNewMasterList",collateralNewMasterList);
}

//Vector collateralNewMasterList = null;
 //collateralNewMasterList = (Vector)sr.getResultList();
    String event = request.getParameter("event");
    int sno = 0;
    int counter = 0;
    int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);
   // if (form != null)
    //    counter = form.getStartIndex();
   // String startIndex = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.startIndex");
   // if (form == null && startIndex != null &&  !startIndex.equals(""))
    //    counter = Integer.parseInt(startIndex);
  //  int lStartIndex = counter;
  List collateralMainTypeList = (List)session.getAttribute("com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterAction.collateralMainTypeList");
  List collateralSubTypeList = (List)session.getAttribute("com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterAction.collateralSubTypeList");
  pageContext.setAttribute("collateralMainTypeList",collateralMainTypeList);
  pageContext.setAttribute("collateralSubTypeList",collateralSubTypeList);
%>





<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
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
function refreshSubType(dropdown){	
	var currVal = "";
	for(i=0; i<dropdown.options.length; i++){
		if (dropdown.options[i].selected == true){
			currVal = dropdown.options[i].value;	
		}
	}
	
	var dep = 'newCollateralSubTypeSearch';

	var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name='+dep+'&code=<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>&ref='+currVal;
	sendLoadDropdownReq(dep, url);	
}	

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function submitPage(){
	var url="collateralNewMaster.do?event=maker_list_collateralNewMaster&startIndex=0&go=Y";
document.forms[0].action=url;
    document.forms[0].submit();
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
function createCollateralNewMaster() {

 	document.forms[0].action="collateralNewMaster.do?event=maker_prepare_create_collateralNewMaster";
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
	        
	      
	       
	      
	       document.forms[0].action="collateralNewMaster.do?event=maker_search_list_collateralNewMaster&searchBy="+searchBy+"&searchText="+searchText;
    
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
     
   
    
   
    document.forms[0].action="collateralNewMaster.do?event=checker_search_list_collateralNewMaster&searchBy="+searchBy+"&searchText="+searchText;

document.forms[0].submit();
		}
 }

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='collateralNewMaster.do?'>
<html:hidden property="startIndex"/>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td colspan="4"></td>
                        </tr>
                        <tr><td colspan="4">
                        <table id="choiceTable" width="100%"  border="0" cellspacing="0" cellpadding="0" class="tblInfo" >
                       <thead>
                         <tr>
                         <td colspan="4">Please enter search criteria</td>
                        </tr>
                       </thead>
                      <tr class="odd">
                      <td  class="fieldname">Collateral Code </td>
                      <td><html:text property="newCollateralCodeSearch" value="<%= newCollateralCodeSearch %>" maxlength="10"/><html:errors property="newCollateralCodeError"/></td>
                      <td class="fieldname">Collateral Description </td>
                      <td><html:text property="newCollateralDescriptionSearch" value="<%= newCollateralDescriptionSearch%>"/> <html:errors property="newCollateralDescriptionError"/></td>
					  </tr>
					  <tr>
                     <td class="fieldname">
													Collateral Main Type 
												</td>
												<td>
												 <html:select property="newCollateralMainTypeSearch" onchange="refreshSubType(this);">
												 <html:option value=""> Please Select </html:option>
                                    	<%
                         if(null!=newCollateralMainTypeSearch||!"".equalsIgnoreCase(newCollateralMainTypeSearch)){
                        	 if(null!=collateralMainTypeList){
                         for(int i=0;i<collateralMainTypeList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)collateralMainTypeList.get(i);
                         if(labelValueBean.getValue().equals(newCollateralMainTypeSearch)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="collateralMainTypeList" labelProperty="label" property="value"  />
                           <%} %>
                                    </html:select><br/><html:errors property="newCollateralMainTypeError"/>
												</td>
                      <td class="fieldname">
													Collateral Sub Type 
												</td>
												<td >								
                                <html:select  value="<%= newCollateralSubTypeSearch %>"  property="newCollateralSubTypeSearch">
                                <html:option value=""> Please Select </html:option>
								<%
                         if((null!=newCollateralMainTypeSearch||!"".equalsIgnoreCase(newCollateralMainTypeSearch))&&(null!=newCollateralSubTypeSearch||!"".equalsIgnoreCase(newCollateralSubTypeSearch))){
                         if(null!=collateralSubTypeList){
                        	 for(int i=0;i<collateralSubTypeList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)collateralSubTypeList.get(i);
                         if(labelValueBean.getValue().equals(newCollateralSubTypeSearch)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="collateralSubTypeList" labelProperty="label" property="value"  />
                           <%} %>
                                </html:select>
                                <br/><html:errors property="newCollateralSubTypeError"/>
							</td>
					  </tr>
					  <tr>
					  <td colspan="4"><center><input align="center" class=btnNormal style="margin-left:7px;height:30px;WIDTH: 70px;"  type="button" value="Go" onclick='submitPage()'></center></td>
							</tr>
							</table>
							<tr>
                          <td width="82%"><h3>Collateral Master</h3></td> <!-- Heading changes added by Uma Khot -->
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
<!--                    Search By:<select id="searchByCriteria">-->
<!--                     <option value="" >--Please Select--</option>-->
<!--                    <option value="NEW_COLLATERAL_CODE">Collateral Code</option>-->
<!--                     <option value="NEW_COLLATERAL_NAME">Collateral Name</option>-->
<!--                      <option value="NEW_COLLATERAL_TYPE">Collateral Type</option>-->
<!--                       <option value="NEW_COLLATERAL_SYSTEM">Collateral System</option>-->
<!--                    -->
<!--                                                                          -->
<!--                    -->
<!--                    </select>-->
<!--                    -->
<!--                    -->
<!--                    Search Text: <input type="text"  id="searchText" /> -->
                    <%if((event.equals("checker_list_collateralNewMaster"))||event.equals("checker_search_list_collateralNewMaster")||event.equals("checker_list_pagination")||event.equals("checker_list_collateralNewMaster")){%>
<!--                    <input class="btnNormal" type="button" value="GO" onclick="javascript:checkerSearchBranch();"/>-->
                    <%}else{ %>
<!--                    <input class="btnNormal" type="button" value="GO" onclick="javascript:searchBranch();"/>-->
                    </td>
                    <%if(!event.equalsIgnoreCase("checker_list_collateralNewMaster")){ %>
                    <td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createCollateralNewMaster()"/>
										</td>
                     <%} }%>
                    
                    
                </tr>
                
							</td></tr>
                      </thead>
                      <tbody>
                       <tr><td colspan="4"><hr></td>
                       </tr>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="5%">S/N</td>
                                  <td width="16%">Collateral Code</td>
                                  <td width="16%">Collateral Description</td>
                                  <td width="16%">Collateral Main Type</td>
                                  <td width="16%">Collateral Sub Type</td>
                                  <td width="5%">Insurance</td>
                                  <td width="16%">Revaluation Frequency</td>
                                  <td width="20%">Status</td>
                                  <td width="16%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="collateralNewMasterList">
                    <logic:iterate id="ob" name="collateralNewMasterList"  type="com.integrosys.cms.app.collateralNewMaster.bus.OBCollateralNewMaster" scope="page" 
                    	length="10" offset="<%=String.valueOf(startIndex) %>">
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
                                  <td class="index"><%=sno+startIndex%></td>
                                   <td><%=ob.getNewCollateralCode()%>&nbsp;</td>
                                    <td><%=ob.getNewCollateralDescription()%>&nbsp;</td>
                                    <td>                                   
                                     	<integro:common-code-single entryCode="<%=ob.getNewCollateralMainType()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE%>" descWithCode="false" />&nbsp;
                                    </td>
                                    <td>
                                  		<integro:common-code-single entryCode="<%=ob.getNewCollateralSubType()%>" descWithCode="false"  display="true" refEntryCode="<%=ob.getNewCollateralMainType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>"  />&nbsp;
                                    </td>
                                  <td> <% 
											if(ob.getInsurance()!=null){                                  
                                  
                                  %><input type="checkbox" value=""  checked="checked" disabled="disabled">
                                  
                                  <% }else{ %>
                                  
                                  <input type="checkbox" value=""  disabled="disabled">
                                  
                                  &nbsp;
                                  
                                  <%} %></td>
                                  <td><%=ob.getRevaluationFrequencyCount()%>&nbsp;
                                  <integro:common-code-single entryCode="<%=ob.getRevaluationFrequencyDays()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" descWithCode="false" />&nbsp;
                                  </td>
                                 
         
              <td ><%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
                                 
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if((event.equals("checker_list_collateralNewMaster"))||event.equals("checker_search_list_collateralNewMaster")||event.equals("checker_list_pagination")){%>
                                      <option value='collateralNewMaster.do?event=checker_view_collateralNewMaster&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
                                       <%}else{ %>
                                      
                                      <option value='collateralNewMaster.do?event=maker_view_collateralNewMaster&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
								
                                      <option value='collateralNewMaster.do?event=maker_edit_collateralNewMaster_read&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
                                    
                                      <option value='collateralNewMaster.do?event=maker_delete_collateralNewMaster_read&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Delete</option>
                                                                
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
                <logic:notPresent name="collateralNewMasterList">
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
              <logic:present name="collateralNewMasterList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                         
                         <% if(sr != null) {
                        	 if((event.equals("checker_list_collateralNewMaster"))
                        			 ||event.equals("checker_search_list_collateralNewMaster")
                        			 ||event.equals("checker_list_pagination")){
                         
                         
                         %>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, collateralNewMasterList.size())%>"
					                            url="collateralNewMaster.do?event=list_pagination&startIndex="/>
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
					                            pageIndex="<%=new PageIndex(startIndex, 10, collateralNewMasterList.size())%>"
					                            url="collateralNewMaster.do?event=list_pagination&startIndex="/>
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
<!-- InstanceEnd --></html>
