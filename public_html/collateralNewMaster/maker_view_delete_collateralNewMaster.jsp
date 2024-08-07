<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%
	
	MaintainCollateralNewMasterForm collateralNewMasterForm = (MaintainCollateralNewMasterForm) request
			.getAttribute("MaintainCollateralNewMasterForm");
	pageContext.setAttribute("collateralNewMasterList", collateralNewMasterForm);
	List timeFreqList = (List)session.getAttribute("com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterAction.timeFreqList");	
	
	
	pageContext.setAttribute("timeFreqList",timeFreqList);
	
	String event = request.getParameter("event");
	String rejectEvent;
	if (event.equals("checker_view_collateralNewMaster")) {
		rejectEvent = "checker_list_collateralNewMaster";
	} else {
		rejectEvent = "maker_list_collateralNewMaster";
	}
	int sno = 0;	
	String ind= (String) request.getAttribute("startIndex");
	int startIndex=0;
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);
%>
<%
String actionStr1 = "com.integrosys.cms.ui.collateralNewMaster.MaintainCollateralNewMasterAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>


<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
    document.forms[0].action="collateralNewMaster.do?event=<%=rejectEvent%>&startIndex="+<%=startIndex%>+"&go=N";
    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='user.do?'>
<body>
<!-- InstanceBeginEditable name="Content" -->
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
      <td><h3>View Collateral Master</h3></td><!-- Heading changes added by Uma Khot -->
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">

												<td class="fieldname" width="20%">
													Collateral Code
												</td>
												<td width="30%"><%=collateralNewMasterForm.getNewCollateralCode() %>&nbsp;
												</td>
												<td class="fieldname">
													Collateral Description
												</td>
												<td><%=collateralNewMasterForm.getNewCollateralDescription() %>
												</td>
												
											</tr>
											
          									 <tr class="even">

												<td class="fieldname">
													Collateral Type
												</td><td>
													<integro:common-code-single entryCode="<%=collateralNewMasterForm.getNewCollateralMainType()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE%>" descWithCode="false" /></td>
												<td class="fieldname">
													Collateral Sub Type
												</td>
												<td><integro:common-code-single entryCode="<%=collateralNewMasterForm.getNewCollateralSubType()%>" descWithCode="false"  display="true" refEntryCode="<%=collateralNewMasterForm.getNewCollateralMainType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>"  />
												</td>
												
											</tr>
											<tr class="odd">

												<td class="fieldname">
													Insurance Required
												</td>
												<td><html:checkbox name="MaintainCollateralNewMasterForm" property="insurance" disabled="true"  />
												</td>
												<td class="fieldname">
													Revaluation Frequency
												</td>
												<td><%=collateralNewMasterForm.getRevaluationFrequencyCount() %> &nbsp;&nbsp;&nbsp;
									                     <integro:common-code-single  categoryCode="<%= CategoryCodeConstant.TIME_FREQ %>" entryCode="<%=collateralNewMasterForm.getRevaluationFrequencyDays() %>" display="true"  descWithCode="false"/>
												</td>
												
											</tr>
											<tr class="odd">
											 <td class="fieldname" >Status&nbsp;</td>
              <td ><%if(collateralNewMasterForm.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
              <td class="fieldname" ></td>
              <td>&nbsp;</td>
              </tr>	
              
              
              <tr class="even">
              	<td class="fieldname" >Collateral Category&nbsp;</td>
              	<td ><%if("IMMOVABLE".equals(collateralNewMasterForm.getNewCollateralCategory())){ %>Immovable
              <%}else{ %>Movable<%} %>&nbsp;</td>
                 </td>
                 
                 <td class="fieldname" >CERSAI Charge Applicable&nbsp;</td>
                 <td>
                 	<% if(null != collateralNewMasterForm && ICMSConstant.YES.equals(collateralNewMasterForm.getIsApplicableForCersaiInd())){ %>
                 		Yes
                 	<%}else{ %>
                 		No
                 	<%} %>
                 </td>
                 
              </tr>		



					</tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
