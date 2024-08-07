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
                 com.integrosys.cms.app.valuationAgency.bus.OBValuationAgency,
                 java.util.List,
                 java.util.Vector"%>

<%
   List sr = (List)request.getAttribute("valuationAgencyList");
   String code=(String)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.valuationAgencyCodeSearch");
   String name=(String)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.valuationAgencyNameSearch");

System.out.println("sr :::::::::::::::::: " + sr);
String event = request.getParameter("event");
if(null!=sr)
    pageContext.setAttribute("valuationAgencyList",sr);
    int sno = 0;
    int startIndex=0;
    
    String ind= (String) request.getAttribute("startIndex");
    if( ind == null || ind.equals("null") ||  ind.equals(""))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
	
    
   
%>





<%@page import="java.util.ArrayList"%><html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
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

function searchPage(){
document.forms[0].action="ValuationAgency.do?event=checker_list_valuation&go=Y";
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



function createValuationAgency() {

 	document.forms[0].action="ValuationAgency.do?event=maker_create_valuation_agency";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ValuationAgency.do" >
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
                    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td colspan="4"><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                       <tr><td >
                      <table id="choiceTable" width="100%"  border="0" cellspacing="0" cellpadding="0" class="tblInput" >
                       <THEAD> <TR><TD colSpan=4 width="100%">Please enter search criteria</TD></TR></THEAD>
                       <tr class="odd">
                      <td width="30%" class="fieldname">Valuation Agency Code : </td>
                      <td width="30%"><html:text property="valuationAgencyCodeSearch" value="<%= code %>" maxlength="10"/>
                      <html:errors property="valuationAgencyCodeError" />
                      </td>
                      <td width="30%" class="fieldname">Valuation Agency Name : </td>
                      <td width="30%"><html:text property="valuationAgencyNameSearch" value="<%= name %>"/>
                      <html:errors property="valuationAgencyNameError" />
                      </td>
                      </tr>
                      <tr><td colspan="4"><center><input class=btnNormal style="margin-left: 60px;height:30px; WIDTH: 70px;"  type="button" value="Go" onclick='searchPage()'></center></td></tr>
                      </table></td></tr><tr></tr><tr></tr>
                        <tr>
                          <td ><h3>Valuation Agency</h3></td>
                          <td  align="right" valign="bottom">
							
						  </td>
                        </tr>
                        <tr></tr>
                        <tr><td><hr/></td></tr>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="5%">S/N</td>
                                  <td width="16%">Valuation Agency Code</td>
                                  <td width="21%">Valuation Agency Name</td>
                                  <td width="16%">City</td>
                                  <td width="16%">State</td>
                                  <td width="16%">Region</td>
                                  <td width="16%">Country</td>
                                  <td width="16%">Status</td>
                                  <td width="16%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                              <%if(null==sr){ %>
                               <tr class="odd">
                                	<td colspan="9">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                              <%} %>
                                <logic:present name="valuationAgencyList">
                    <logic:iterate id="ob" name="valuationAgencyList"  type="com.integrosys.cms.app.valuationAgency.bus.OBValuationAgency" scope="page"
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
                                  <td class="index"><%=startIndex+sno%></td>
                                  <td><%= ob.getValuationAgencyCode() %>&nbsp;</td>
                                  <td><%=ob.getValuationAgencyName() %>&nbsp;</td>
                              <%if(ob.getCityTown()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                     <td><%= ob.getCityTown().getCityName() %>&nbsp;</td>
                                   <%} %>
                                     <%if(ob.getState()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                    <td><%=ob.getState().getStateName() %>&nbsp;</td>
                                    <%} %>
                                      <%if(ob.getRegion()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                     <td><%=ob.getRegion().getRegionName() %>&nbsp;</td>
                                      <%} %>
                                      
                                      <%if(ob.getCountry()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                      <td><%=ob.getCountry().getCountryName() %>&nbsp;</td>
                                      
                                       <%} %>
                                      
                                    <%! String status=null;
                                         %>
                         <%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE"))
                       {
                    	  status="disable";
                       }
                       else
                       {
                    	  status="enable";
                       }
                         
                       %> 
                                      
                             <td><% if(ob.getStatus().equals("ACTIVE")){%>Enable
                        	<%}else{ %>Disable<%}%></td>
                                      
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if(event.equals("checker_list_valuation")){%>
                                        <option value='ValuationAgency.do?event=checker_view_valuationAgency&branchCode=<%=ob.getId()%>'>View</option>
                                     <%}else{ %>
								   
                                      <option value='ValuationAgency.do?event=checker_view_valuationAgency&branchCode=<%=ob.getId()%>&startIndex=<%= startIndex %>'>View</option>
								
                       
                       
                                         <%} %>
									
                                    </select> </td>
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="9">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                </logic:present>
                
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              
              
 <tr>
    <td height="25">


        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">

            <tr>
            
             <%
                            String pageIndexUrl=null;
                            
                                pageIndexUrl = "ValuationAgency.do?event=checker_list_pagination&startIndex=";
                           
                        %>
                <td valign="middle">
                    <integro:pageindex
                            pageIndex="<%=new PageIndex(startIndex,10,sr.size())%>"
                            url="ValuationAgency.do?event=checker_list_pagination&startIndex=" />
                </td>
            </tr>
        </table>

    </td>
</tr>             
              
              
              
              
</table>

</body>
</html:form>
<!-- InstanceEnd --></html>
