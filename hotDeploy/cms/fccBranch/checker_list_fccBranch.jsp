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
SearchResult searchResult =(SearchResult) session.getAttribute("com.integrosys.cms.ui.fccBranch.FCCBranchAction.fccBranchList");
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
	pageContext.setAttribute("fccBranchSize", Integer.toString(listSize));
	pageContext.setAttribute("fccBranchList", resultList);
}else
	System.out.print("searchResult : "+searchResult);

    String event = request.getParameter("event");
    
  
%>







<%@page import="org.apache.struts.util.LabelValueBean"%><html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
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


function submitPage(){
	var url="fccBranch.do?event=checker_list_fccBranch&startIndex=0&go=Y";
	document.forms[0].action=url;
    document.forms[0].submit();
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


 
function searchFCCBranch()
{
	var searchType = document.getElementById("selType").value;
	var searchText = document.getElementById("srcText").value;

	if(searchType == '' && searchText == '')
    {
        document.forms[0].action            = "fccBranch.do";
        document.forms[0].event.value       = "checker_list_fccBranch";
        document.forms[0].submit();
    }
    else
    {
        if(searchType !='' && searchText!='')
	    {	        	
	        document.forms[0].action            = "fccBranch.do?type="+searchType +"&"+ "text="+searchText;		        
	        document.forms[0].event.value       = "checker_list_fccBranch";		              
			document.forms[0].submit();
        }	       
    }      
}
 


</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='fccBranch.do?'>
<html:hidden property="event"/>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                       
                      
                        <tr>
                          <td width="82%"><h3>FCC Branch Master</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  <td>&nbsp;</td>      
						
						  <td>&nbsp;</td>
						
                        </tr>
                         <tr>
                    <td colspan="4"></td></tr>
                        <tr>
                       <tr>
                     <td><label>Search :&nbsp;</label>
                   	<select id="selType">
	                   	<option value="">--Select--</option>	                
	                   	<option value="branchCode">Branch Code</option>
	                   	<option value="aliasBranchCode">Alias Branch Code</option>
	                   	<option value="branchName">Branch Name</option>
                   	</select> 
	           		&nbsp;<input type="text" id="srcText" maxlength="30"/>
	           		&nbsp;<img alt="Search" src="./img/search.gif" onclick="javascript:searchFCCBranch()">
                   </td>
                   <td colspan="2">&nbsp;</td>
                   </tr>
                     <tr>
                  <td><html:errors property="searchTextError"/></td>
               </tr>
               <tr>
                  <td  valign="bottom" align="right">
											
										</td>          
                  
                    
                </tr>
                        <tr>
                          <td colspan="4"><hr /></td>
                        </tr>
                        
                      <tbody>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="5%">S/N</td>
                                  <td width="16%">Branch Code</td>
                                  <td width="16%">Alias Branch Code</td>
                                  <td width="20%">Branch Name</td>
                                  <td width="20%">Status</td>
                                  <td width="10%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="fccBranchList">
                    <logic:iterate id="ob" name="fccBranchList" type="com.integrosys.cms.app.fccBranch.bus.OBFCCBranch" 
                             		scope="page" length="10" offset="<%=String.valueOf(startIndex) %>"> 
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
                                   <td><%=ob.getBranchCode()%>&nbsp;</td>
                                    <td><%=ob.getAliasBranchCode()%>&nbsp;</td>
                                  <td><%=ob.getBranchName()%>&nbsp;</td>
                                  
              <td ><%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if((event.equals("checker_list_fccBranch"))||event.equals("checker_search_list_fccBranch")||event.equals("checker_list_pagination")){%>
                                      <option value='fccBranch.do?event=checker_view_fccBranch&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
                                       <%}else{ %>
                                      
                                      <option value='fccBranch.do?event=checker_view_fccBranch&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
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
                <logic:notPresent name="fccBranchList">
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
                    <!-- InstanceEndEditable -->
			
              <logic:present name="fccBranchList">
              <tr>
                 <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        
                       <% //String pageIndexUrl = "user.do?event=maker_list_user&"+form.getName()!=null&&form.getName().trim().equals("")?"name="+form.getName():""+"&startIndex=";%>
                        <%
                            String pageIndexUrl=null;
                            
                                pageIndexUrl = "fccBranch.do?event=checker_list_pagination&startIndex=";
                           
                        %>
                        <td width="86" valign="middle">
                           &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,10,listSize)%>'
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
