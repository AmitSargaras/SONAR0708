<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%
		ValuationAgencyForm valuationAgencyForm = (ValuationAgencyForm) request
			.getAttribute("ValuationAgencyForm");

IValuationAgencyTrxValue valuationAgencyTrx = (IValuationAgencyTrxValue)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.IValuationAgencyTrxValue");


	String event = request.getParameter("event");
	String rejectEvent;

	int sno = 0;
	int startIndex = 0;
%>
<%
String actionStr1 = "com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
<%@page import="com.integrosys.cms.ui.valuationAgency.ValuationAgencyForm"%>
<%@page import="com.integrosys.cms.app.valuationAgency.trx.IValuationAgencyTrxValue"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>Untitled Document</title>
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
    document.forms[0].action="ValuationAgency.do?event=maker_list_valuation&startIndex=<%=request.getAttribute("startIndex")%>&go=N&valuationAgencyCode=&valuationAgencyName=";
    document.forms[0].submit();
}
function submitForm() {
	document.forms[0].action="ValuationAgency.do?event=maker_disable_valuationAgency";
	var r=confirm("Would you like to Disable the record ? \n Please press OK or Cancel button");
	if (r==true)
	  {
	
	  document.forms[0].submit();
	  }
	else
	  {
	
	  }
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

	<html:form action='ValuationAgency.do?'>
		<body>
		
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
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<br>
					<br>
					<br>
					<br>
					<tr>
						<td>
							<h3>
								Disable Valuation Agency
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
													Valuation Agency Code 
												</td>
												<td width="30%"><%=valuationAgencyForm.getValuationAgencyCode()%>&nbsp;
												</td>
												<td class="fieldname" width="20%">
													Valuation Agency Name 
												</td>
												<td width="30%"><%=valuationAgencyForm.getValuationAgencyName()%>&nbsp;
												</td>
											</tr>									
																			
											<tr class="even">
												<td class="fieldname">
													Address
												</td>
												<td><%=valuationAgencyForm.getAddress()%>&nbsp;
												</td>
												<td class="fieldname">
													City/Town
												</td>
												
													<%if(valuationAgencyTrx.getStagingValuationAgency().getCityTown()!=null &&!valuationAgencyTrx.getStagingValuationAgency().getCityTown().equals("")){ %>
												<td><%=valuationAgencyTrx.getStagingValuationAgency().getCityTown().getCityName()%>&nbsp;
												</td>
												<%}else{ %>
													<td> &nbsp;
												</td>
												<%} %>
											</tr>
											<tr class="odd">
												<td class="fieldname">
													State
												</td>
														<%if(valuationAgencyTrx.getStagingValuationAgency().getState()!=null && !valuationAgencyTrx.getStagingValuationAgency().getState().equals("")){ %>
												<td><%=valuationAgencyTrx.getStagingValuationAgency().getState().getStateName() %>&nbsp;
												</td>
												<%}else{ %>
													<td> &nbsp;
												</td>
												<%} %>
												<td class="fieldname">
													Region
												</td>
																<%if(valuationAgencyTrx.getStagingValuationAgency().getRegion()!=null && !valuationAgencyTrx.getStagingValuationAgency().getRegion().equals("")){ %>
												<td><%=valuationAgencyTrx.getStagingValuationAgency().getRegion().getRegionName() %>&nbsp;
												</td>
												<%}else{ %>
													<td> &nbsp;
												</td>
												<%} %>
											</tr>
											<tr class="even">

												<td class="fieldname">
													Country
												</td>
																		<%if(valuationAgencyTrx.getStagingValuationAgency().getCountry()!=null && !valuationAgencyTrx.getStagingValuationAgency().getCountry().equals("")){ %>
												<td><%=valuationAgencyTrx.getStagingValuationAgency().getCountry().getCountryName() %>&nbsp;
												</td>
												
													<%}else{ %>
													<td> &nbsp;
												    </td>
												<%} %>
									    	<td class="fieldname">
													
												</td>
												<td>&nbsp;
												</td>
											</tr>


						<html:hidden name="ValuationAgencyForm" property="masterId" />
						<html:hidden name="ValuationAgencyForm" property="createBy"
							value="SC_MAKER" />
						<html:hidden name="ValuationAgencyForm" property="lastUpdateBy"
							value="SC_MAKER" />
						<html:hidden name="ValuationAgencyForm" property="lastUpdateDate" />
						<html:hidden name="ValuationAgencyForm" property="creationDate" />
						<html:hidden name="ValuationAgencyForm" property="deprecated"
							value="N" />
						<html:hidden name="ValuationAgencyForm" property="id" />
						<html:hidden name="ValuationAgencyForm" property="status"
							value="ACTIVE" />
						<html:hidden name="ValuationAgencyForm"
							property="valuationAgencyCode"
							value="<%=valuationAgencyForm.getValuationAgencyCode()%>" />
						<html:hidden name="ValuationAgencyForm"
							property="valuationAgencyName"
							value="<%=valuationAgencyForm.getValuationAgencyName()%>" />
						<html:hidden name="ValuationAgencyForm" property="address"
							value="<%=valuationAgencyForm.getAddress()%>" />
						<html:hidden name="ValuationAgencyForm" property="cityTown"
							value="<%=valuationAgencyForm.getCityTown()%>" />
						<html:hidden name="ValuationAgencyForm" property="state"
							value="<%=valuationAgencyForm.getState()%>" />
						<html:hidden name="ValuationAgencyForm" property="country"
							value="<%=valuationAgencyForm.getCountry()%>" />
						<html:hidden name="ValuationAgencyForm" property="region"
							value="<%=valuationAgencyForm.getRegion()%>" />





					</tbody>
							</table>
						</td>
					</tr>
						
 								
		

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
 <tr align="center">
						 <td colspan="4">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;
					</td>
						<td colspan="4">
								<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						&nbsp;
					</td>
					</tr>	
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html:form>
</html>
