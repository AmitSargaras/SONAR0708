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
SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.componentList");
String searchcomponentName="";
String ind="";
if("search_component".equals(event)||"return_search_component".equals(event)||"search_component_next".equals(event)){
	searchcomponentName=(String)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.searchcomponentName");	
}
if(searchcomponentName==null){
	searchcomponentName="";
}


List componentList=null;
if(sr!=null){
	componentList = new ArrayList(sr.getResultList());
	
	pageContext.setAttribute("componentList",componentList);
}

    
    
    int sno = 0;
    int startIndex = 0;
  
    
    if("search_component".equals(event)||"return_search_component".equals(event)||"search_component_next".equals(event)){
    	ind= (String)session.getAttribute("com.integrosys.cms.ui.component.MaintainComponentAction.session.startIndex");	
    }
    else{
    	ind= (String) request.getAttribute("startIndex");
    }
    System.out.println("//////////////*******************  ind "+ind+"**********");
	if(ind!=null && (!ind.equals(""))){
		startIndex = Integer.parseInt(ind);
		
	    } 
	
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);
	
	boolean isMaker= false;
	boolean isChecker= false;
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    if((user.getTeamTypeMembership().getMembershipID()==1004) || (user.getTeamTypeMembership().getMembershipID()==1014) ||
    		(user.getTeamTypeMembership().getMembershipID()==1031) || (user.getTeamTypeMembership().getMembershipID()==1033)
      ){
    	isMaker=true;
    }else {
    	isChecker=true;
    }
%>





<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%><html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
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
function createComponent() {	
	
    document.forms[0].action="component.do?event=maker_prepare_create_component&session.startIndex=<%=ind%>&session.searchcomponentName=<%=searchcomponentName%>";
    document.forms[0].submit();
}

function searchComponent(){
	
	  var searchcomponentName = document.getElementById('componentName1').value;
	
	  searchcomponentName = escape(searchcomponentName);
	 //alert("componentName "+searchcomponentName);
	  document.forms[0].action="component.do?event=search_component&searchcomponentName="+searchcomponentName;
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
			searchComponent();
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
<html:form action='component.do?'>
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
                          <td width="82%"><h3>Component List Master</h3></td>
                          
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
                         <td><b>Search :</b> 
                         &nbsp; <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                         <option value="#" selected>Component</option>
                         </select>&nbsp;
                         <input type="text" size="25" maxlength="50" id="componentName1" onkeypress="return handleEnter(this, window.event||event);" value="<%=searchcomponentName %>"/>&nbsp;
                       <a onclick="searchComponent()"><img src="img/search.gif" border="0" /></a>
                         <html:errors property="componentName"/>
                         
                         </td>
                         
                                                
                         
                    

                    <%if(isMaker){%>                   
                    <td  valign="bottom" align="right">
						<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createComponent()"/>
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
                                  <td width="6%">S/N</td>
                                  <td width="20%">Components</td>
                                  <td width="20%">Component Type</td>
                                  <td width="20%">Insured</td>
                                  <td width="8%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="componentList">
                    <logic:iterate id="ob" name="componentList" 
                    length="10" 
                    offset="<%=String.valueOf(startIndex)%>"
                    indexId="counter"
                     type="com.integrosys.cms.app.component.bus.OBComponent" scope="page">
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
                                   <td><%=ob.getComponentName()%>&nbsp;</td>
                                   <%String comType="";
                                   if(ob.getComponentType().equalsIgnoreCase("Current_Asset")){
                                	   comType="Current Asset";
                                	   }
                                	   else if(ob.getComponentType().equalsIgnoreCase("Current_Liability")){
                                		   comType="Current Liability";  
                                	   }%>  
                                   
                                  <td><%=comType%>&nbsp;</td>
                                  <td><%=ob.getHasInsurance()%>&nbsp;</td>
                                   </td>
         
             
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if(isMaker){%>
                                       
                                      <option value='component.do?event=maker_view_component&componentCode=<%=ob.getId()%>&startIndex=<%=ind%>&searchcomponentName=<%=searchcomponentName %>'>View</option>
								
                                      <option value='component.do?event=maker_edit_component_read&componentCode=<%=ob.getId()%>&startIndex=<%=ind%>&searchcomponentName=<%=searchcomponentName %>'>Edit</option>
                                       <option value='component.do?event=maker_delete_component_read&componentCode=<%=ob.getId()%>&startIndex=<%=ind%>&searchcomponentName=<%=searchcomponentName %>'>Delete</option>
                                      
                                       <%}else{ %>
                                     
                                      <option value='component.do?event=checker_view_component&componentCode=<%=ob.getId()%>&startIndex=<%=ind%>&searchcomponentName=<%=searchcomponentName %>'>View</option>
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
                <logic:notPresent name="componentList">
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
              
              <logic:present name="componentList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                         
                         <% if(sr != null) {
                        	 if((event.equals("checker_list_component"))){
                         
                         
                         %>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, sr.getResultList().size())%>"
					                            url="component.do?event=search_component_next&startIndex="/>
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
					                            url="component.do?event=search_component_next&startIndex="/>
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
