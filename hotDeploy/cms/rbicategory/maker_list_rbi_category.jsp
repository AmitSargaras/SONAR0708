<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
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
                 java.util.Vector,
                 java.util.Iterator,
                 java.util.Set,
                 java.util.HashSet,
                 java.util.HashMap,
                 java.util.ArrayList,
                 java.util.Collections,
                 com.integrosys.cms.app.rbicategory.bus.OBRbiCodeCategory,
                 com.integrosys.cms.app.rbicategory.bus.OBRbiCategory,
                 com.integrosys.cms.app.rbicategory.bus.OBIndustryCodeCategory,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.util.CommonUtil"%>

<%
   List rbiCategoryList = (List)request.getAttribute("rbiCategoryList");
   SearchResult sr = (SearchResult)request.getAttribute("searchResultRbiCategory");
   List industryNameSaveValueList = (List)request.getAttribute("industryNameSaveValueList");	
   List rbiCodeCategorySaveList = (List)request.getAttribute("rbiCodeCategorySaveList");	
    String event = request.getParameter("event");
    pageContext.setAttribute("rbiCategoryList",rbiCategoryList);
    int sno = 0;
    int startIndex = 0;
    startIndex = Integer.parseInt(request.getAttribute("startIndex").toString());
    sno = startIndex;

%>




<html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

<script language="JavaScript" type="text/JavaScript">
<!--
function selectAction(targ,selObj,restore){
	eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
}

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
function createRbiCategory() {
 	document.forms[0].action="rbi_category.do?event=maker_prepare_create_rbi_category";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='rbi_category.do?'>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
                    <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>RBI Category Master</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  <td>&nbsp;</td>      
						<% //if (isEditAccess) { %>                    
                          
						<%// } else { %>
						  <td>&nbsp;</td>
						<%// } %>
                        </tr>
                        <%
                        
                        	 if((event.equals("checker_list_rbi_category"))||event.equals("checker_search_list_rbi_category")||event.equals("checker_list_pagination")){
                        	%><td></td><%
                        	 } else{ %>
                         <tr align="right">
                    <td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createRbiCategory()"/>
					</td> 
                </tr>
                <% }%>
                        <tr>
                          <td colspan="4"><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                               <thead>
                                    <tr>
                                    	<td width="10%">S/N</td>
                                    	<td width="15%">Industry</td>
                                    	<td width="15%">RBI Category Code</td>
                                    	<td width="15%">Action</td>
                                    </tr>
                              </thead>
                              <tbody>
                                <logic:present name="rbiCategoryList">
                    <logic:iterate id="obiCategory" 
                    offset="<%=String.valueOf(startIndex)%>" length="<%=String.valueOf(10)%>"
                    name="rbiCategoryList"  type="com.integrosys.cms.app.rbicategory.bus.OBRbiCategory" scope="page">
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
                                  <td class="<%=rowClass%>"><integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>" entryCode="<%=obiCategory.getIndustryNameId()%>" display="true" descWithCode="false"/></td> 
                                  
         <td class="<%=rowClass %>">
			<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
  			   <tr><td> 
  			   
  			   					<%HashMap rBICateCodeHashMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.HDFC_RBI_CODE);
                                   List rbiList =new ArrayList();             
                                   Set savedRbiCodeCategorySet = obiCategory.getStageIndustryNameSet();
                                   Iterator itSavedRbiCodeCategorySet = savedRbiCodeCategorySet.iterator();
                                  	OBIndustryCodeCategory obRbiCodeCategory = new OBIndustryCodeCategory();
                                 	 while(itSavedRbiCodeCategorySet.hasNext())
                                 	 {
                                 	 obRbiCodeCategory = (OBIndustryCodeCategory)itSavedRbiCodeCategorySet.next();
                                 	 
                                 	if(null!=rBICateCodeHashMap.get(obRbiCodeCategory.getRbiCodeCategoryId())){
                                  	 rbiList.add(rBICateCodeHashMap.get(obRbiCodeCategory.getRbiCodeCategoryId())+"("+obRbiCodeCategory.getRbiCodeCategoryId()+")");
                                 	 }
                                 	 }
                                 	 Collections.sort(rbiList);
                                 	 Iterator itRbiList = rbiList.iterator();
                                 	  while(itRbiList.hasNext())
                                 	 {%>
                                 	 <tr><td><%=itRbiList.next() %></td></tr>
                                 	 <%}
                              %>
                              
                              
</td></tr></table></td>        
 
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if((event.equals("checker_list_rbi_category"))||event.equals("checker_search_list_rbi_category")||event.equals("checker_list_pagination")){%>
                                      <option value='rbi_category.do?event=checker_view_rbi_category&id=<%=obiCategory.getId()%>'>View</option>
                                       <%}else{ %>
                                      
                                      <option value='rbi_category.do?event=maker_view_rbi_category&id=<%=obiCategory.getId()%>'>View</option>
								
                                      <option value='rbi_category.do?event=maker_edit_rbi_category_read&id=<%=obiCategory.getId()%>'>Edit</option>
                                       <option value='rbi_category.do?event=maker_delete_rbi_category_read&id=<%=obiCategory.getId()%>'>Delete</option>
                                      
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
                <logic:notPresent name="rbiCategoryList">
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
              <logic:present name="rbiCategoryList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <%
                            String pageIndexUrl=null;
                        if((event.equals("checker_list_rbi_category"))||event.equals("checker_search_list_rbi_category")||event.equals("checker_list_pagination")){
                                pageIndexUrl = "rbi_category.do?event=checker_list_pagination&startIndex=";
                        }
                        else
                        {
                        	pageIndexUrl = "rbi_category.do?event=list_pagination&startIndex=";
                        }
                        %>
                        <td width="86" valign="middle">&nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,10,sr.getNItems())%>'
                                url='<%=pageIndexUrl%>' />
                        </td>
                       <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>                       
                      </tr>
                    </table>
                 </td>
              </tr>
              </logic:present>
</table>

</body>
</html:form>
<!-- InstanceEnd --></html>
