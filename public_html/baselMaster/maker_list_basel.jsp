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
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> EVENT>"+event);
//SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.baselmaster.MaintainBaselMasterAction.baselList");
String search = (String)session.getAttribute("com.integrosys.cms.ui.baselmaster.MaintainBaselMasterAction.session.searchbaselName");;
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> search>"+search);
String ind="";



List baselList=(ArrayList)session.getAttribute("com.integrosys.cms.ui.baselmaster.MaintainBaselMasterAction.baselList");;
if(baselList!=null){
	//baselList = new ArrayList(sr.getResultList());
	
	pageContext.setAttribute("baselList",baselList);
}
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> baselList>"+baselList.size());
    
    
    int sno = 0;
    int startIndex = 0;
  
    if("search_basel".equals(event)||"return_search_basel".equals(event)||"search_basel_next".equals(event)){
    	ind= (String)session.getAttribute("com.integrosys.cms.ui.baselmaster.MaintainBaselMasterAction.session.startIndex");	
    }
    else{
    	ind= (String) request.getAttribute("startIndex");
    }
	if(ind!=null && (!ind.equals(""))){
		startIndex = Integer.parseInt(ind);
		
	    } 
    
    
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);
	
	boolean isMaker= false;
	boolean isChecker= false;
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	if((user.getTeamTypeMembership().getMembershipID()==1004) || (user.getTeamTypeMembership().getMembershipID()==1014)
			||(user.getTeamTypeMembership().getMembershipID()==1031) || (user.getTeamTypeMembership().getMembershipID()==1033)){
    	isMaker=true;
    }else {
    	isChecker=true;
    }
    
%>





<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
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
function createBasel() {	
	
    document.forms[0].action="baselmaster.do?event=maker_prepare_create_basel&session.startIndex=<%=ind%>";
    document.forms[0].submit();
}

function searchBasel(){
	
	  var searchbaselName = document.getElementById('system1').value;
	//  alert("searchbaselName "+searchbaselName);
	  //searchcomponentName = escape(searchcomponentName);
	 
	  document.forms[0].action="baselmaster.do?event=search_basel&searchbaselName="+searchbaselName;
	//  alert("componentName "+document.forms[0].action);
		  document.forms[0].submit();
}
function handleEnter (field, event) {
	var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
	//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

	if (keyCode == 13) {
		if (field.value == null) {
			//
		}
		else {
			searchBasel();
		}
		return false;
	} 
	else
	return true;
}
 

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='baselmaster.do?'>
<input type="hidden" name="event" />
<input type="hidden" name="searchcomponentName" />
<input type="hidden" name="startIndex" />
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
                    <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>Basel System Master</h3></td>
                          
						  <td>&nbsp;</td>      
						<% //if (isEditAccess) { %>                    
                          
						<%// } else { %>
						  <td>&nbsp;</td>
						<%// } %>
                        </tr>
                        <tr>
										<td colspan="2">
										<hr />
										</td>
									</tr>
                         <tr>
                         <td>&nbsp;</td>
                         <td>&nbsp;</td>
                       </tr>
                       <tr>
                         <td><b>System Name:</b> 
                         &nbsp;                       
                         
                        <html:select property="system1" styleId="system1" value="<%=search %>">
								<integro:common-code 
									categoryCode="<%=CategoryCodeConstant.BASEL_MASTER%>"
									descWithCode="false" />
							</html:select>&nbsp;
                      <a onclick="searchBasel()" href="#">
                                <img align="middle" src="img/search1a.gif" name="Image1" border="0" id="Image1"/></a>
                         
                         </td>
                         
                                                
                         
                    

                    <%if(isMaker){%>                   
                    <td  valign="bottom" align="right">
						<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createBasel()"/>
					</td>
	                   
                     <%} %>
                    
                    
                </tr>
                <tr>
                <td>
                <br />
                </td>
                </tr>
                        
                      </thead>
                      <tbody>
                      
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="4%">S/N</td>
                                  <td width="20%">System</td>
                                  <td width="10%">Value</td>
                                  <td width="20%">Exposure source system</td>
                                  <td width="20%">Basel validations</td>
                                  <td width="20%">To be listed in hand off</td>
                                  <td width="15%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="baselList">
                    <logic:iterate id="ob" name="baselList" 
                    length="10" 
                    offset="<%=String.valueOf(startIndex)%>"
                    indexId="counter"
                     type="com.integrosys.cms.app.baselmaster.bus.OBBaselMaster" scope="page">
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
                                  <td><%=ob.getSystem() %></td>
								<td><%=ob.getSystemValue()%>&nbsp;</td>
								<td><%=ob.getExposureSource()%>&nbsp;</td>
								<%String validation=ob.getBaselValidation();
             						if(validation.equals("L")){
            						 validation="Limit";
           							  }else{
            						 validation="Account";
           							  }%>
                			 <td><%=validation %> </td> 
                			 <%String report=ob.getReportHandOff();
             				 if(report.equals("Y")){
            	  				report="Yes";
              					}else{
            	 				 report="No";
             					 }%>
            				  <td ><%=report %> </td> 
            				  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if(isMaker){%>
                                       
                                      <option value='baselmaster.do?event=maker_view_basel&baselCode=<%=ob.getId()%>&startIndex=<%=ind%>'>View</option>
								
                                      <option value='baselmaster.do?event=maker_edit_basel_read&baselCode=<%=ob.getId()%>&startIndex=<%=ind%>'>Edit</option>
                                       <option value='baselmaster.do?event=maker_delete_basel_read&baselCode=<%=ob.getId()%>&startIndex=<%=ind%>'>Delete</option>
                                      
                                       <%}else{ %>
                                     
                                      <option value='baselmaster.do?event=checker_view_basel&baselCode=<%=ob.getId()%>&startIndex=<%=ind%>'>View</option>
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
                </logic:present><!--
                <logic:notPresent name="componentList">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                              --></tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              
              <logic:present name="baselList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                         
                         <% if(baselList != null) {
                        	 if((event.equals("checker_list_basel_master"))){
                         
                         
                         %>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, baselList.size())%>"
					                            url="baselmaster.do?event=search_basel_next&startIndex="/>
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
					                            pageIndex="<%=new PageIndex(startIndex, 10,baselList.size())%>"
					                            url="baselmaster.do?event=search_basel_next&startIndex="/>
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
