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
                 java.util.Vector"%>

<%
   System.out.println("--------------------------1----------------------------");
    //SearchResult sr = (SearchResult)request.getAttribute("UserList");
//    MaintainUserForm form = (MaintainUserForm)request.getAttribute("MaintainUserForm");
	SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.UserList");
   System.out.println("--------------------------2----------------------------"+sr);
    //DefaultLogger.debug("UserList.jsp","size is "+sr.getResultList().size());

   System.out.println("--------------------------3----------------------------");
    Vector userList = null;
    if(sr!=null){
        userList = (Vector)sr.getResultList();
    }
    pageContext.setAttribute("UserList",userList);
    CommonUserSearchCriteria criteria = (CommonUserSearchCriteria)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.User_SearchCriteria");

   System.out.println("--------------------------4----------------------------");
    int sno = 0;
    int startIndex = 0;
    if (criteria != null) {
    	sno = criteria.getStartIndex();
    	startIndex = criteria.getStartIndex();
    }
   System.out.println("--------------------------5----------------------------");

    String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long teamTypeMembershipID = Long.parseLong(teamTypeMemID);    
	boolean isEditAccess = (teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SYS_ADMIN_MAKER);     
   System.out.println("--------------------------6----------------------------");
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

function uploadFile() {
	document.forms[0].action="user.do?event=maker_prepare_upload_user";
    document.forms[0].submit();
}

function addItems(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      if (type == 'radio') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
	      if (type == 'radio') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.itemID[j].value);
				temp = temp + "," + formObj.itemID[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
	      if (type == 'radio') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.itemID.value);
				temp = temp + "," + formObj.itemID.value;
			}
	      }
		}
	}
//    alert('j'+j);
    if(temp==""){
        alert('Please select atleast one to save.');
        return false;
    }
	temp=temp.substring(1);
//	alert(temp);
	formObj.hiddenItemID.value=temp;
	return true;
}

function submitForm(){
	var isadded =addItems();
	if(isadded){
		formObj = document.forms["ReportForm"];
	    formObj.event.value = "select_user";
		formObj.submit();
	}else{
		return false;
	}
}

function canclePage(){
	formObj = document.forms["ReportForm"];
    formObj.event.value = "cancleFilter";
   	formObj.submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<html:form action="poiReport.do?">
<input type="hidden" name="hiddenItemID" />
<input type="hidden" name="event">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3></h3></td>
                          <td width="18%" align="right" valign="bottom">
						  </td>
						  <td>&nbsp;</td>      
						  <td>&nbsp;</td>

                        </tr>
                        <tr>
                          <td colspan="5"><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td colspan="5"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="5%">S/N</td>
                                  <td width="36%">User ID</td>
                                  <td width="40%">Full Name</td>
<!--                                  <td width="44%">Team Name</td>-->
                                  <td width="10%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="UserList">
                    <logic:iterate id="ob" name="UserList" indexId="index"  type="com.integrosys.component.user.app.bus.OBSearchCommonUser" scope="page">
                        <%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                            System.out.println(":{::{{:{:{:{::{:{:{::{{:{:{::{:{{:{:{:"+ob.getStatus());
                            boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                        %>
                                <tr class="<%=rowClass%>">
                                  <td class="index"><%=sno%></td>
                                  <td><%=ob.getLoginID()%>&nbsp;</td>
                                  <td><%=ob.getUserName()%>&nbsp;</td>
<!--                                  <td><%if (ob.getBusinessUnitName()!=null && !("".equals(ob.getBusinessUnitName())) ) {%>
										<%=ob.getBusinessUnitName()%>
									<%}else{%><bean:message key='error.los.team.not.assigned'/><%}%>&nbsp;</td>-->
                                  <td> 
	                                    <input type="radio"  name="itemID" value="<%=index+1%>" />
                                   </td>
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="5">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                </logic:present>
                <logic:notPresent name="UserList">
                                <tr class="odd">
                                	<td colspan="5">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                              </tbody>
                            </table></td>
                        </tr>
                         <tr align="center">
    						<td colspan="4">
    						<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
							  <tr>
							    <td width="75">&nbsp;</td>
							    <td width="75">&nbsp;</td>
							  </tr>
							  <tr>
							    <td>
							    <a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image12" width="75" height="22" border="0" id="Image12" /></a>
							    </td>
							    <td>
									<a href="javascript:canclePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
										<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
									</a>
							    </td>
							  </tr>
							  <tr>
							    <td>&nbsp;</td>
							    <td>&nbsp;</td>
							  </tr>
							</table>
						    </td>
  						 </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              <logic:present name="UserList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="564" valign="middle">
                        </td>
                        <%
                            String pageIndexUrl="poiReport.do?event=list_user&startIndex=";
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
</html:form>
</body>
<!-- InstanceEnd --></html>
