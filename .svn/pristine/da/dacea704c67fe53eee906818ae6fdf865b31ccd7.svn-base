<%@page import="com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterForm"%>
<%@page import="com.integrosys.cms.app.facilityNewMaster.bus.OBFacilityNewMaster"%>



<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.facilityNewMaster.bus.IFacilityNewMaster"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.*,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%
IFacilityNewMaster obj=new OBFacilityNewMaster();
MaintainFacilityNewMasterForm facilityNewMasterForm = (MaintainFacilityNewMasterForm) request
.getAttribute("MaintainFacilityNewMasterForm");

List actualRiskTypeIds =(List) session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.actualRiskTypeIds");

String riskTypeAllowed=facilityNewMasterForm.getSelectedRiskTypes();
List actualRiskTypeIds1=new ArrayList();

if(null!=riskTypeAllowed && null!=actualRiskTypeIds) {
	List<String> items = Arrays.asList(riskTypeAllowed.split(","));
 	for(int i=0;i<actualRiskTypeIds.size();i++) {
 		LabelValueBean lvBean=(LabelValueBean)actualRiskTypeIds.get(i);
 		if(items.contains(lvBean.getValue())) {
 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
 			actualRiskTypeIds1.add(lvBean1);
 
 		}
 	}
}
pageContext.setAttribute("actualRiskTypeIds1",actualRiskTypeIds1);


	String event = request.getParameter("event");
	  int startIndex = 0;
	    String ind= (String) request.getAttribute("startIndex");
		if(ind!=null && (!ind.equals("")))
			 startIndex = Integer.parseInt(ind);
		
	
	String rejectEvent;
	if (event.equals("checker_view_facilityNewMaster")) {
		rejectEvent = "checker_list_facilityNewMaster";
	} else {
		rejectEvent = "maker_list_facilityNewMaster";
	}
	int sno = 0;
	
%>
<%
String actionStr1 = "com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>


<%@page import="java.text.DecimalFormat"%>
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
    document.forms[0].action="facilityNewMaster.do?event=<%=rejectEvent%>&go=N";
    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='user.do?'>
<body>
<input type="hidden" name="startIndex" id="startIndex" value="<%=startIndex %>">
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
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
      <td><h3>View FacilityNewMaster</h3></td>
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
													Facility Code
												</td>
												<td width="30%"><%=facilityNewMasterForm.getNewFacilityCode()%>
												</td>
												<td class="fieldname">
													Facility Name
												</td>
												<td style="white-space:pre"><%=facilityNewMasterForm.getNewFacilityName()%></td>
												
											</tr>
											
											
											
											<tr class="even">

												<td class="fieldname">
													Facility Category
												</td>
												<td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY %>" entryCode="<%=facilityNewMasterForm.getNewFacilityCategory()%>" display="true" descWithCode="false" />&nbsp;
												</td>
												<td class="fieldname">
													Facility Type
												</td>
												<td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE %>" entryCode="<%=facilityNewMasterForm.getNewFacilityType()%>" display="true" descWithCode="false" />&nbsp;
												</td>
												
											</tr>
											<tr class="odd">

												<td class="fieldname">
													System
												</td>
												<td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.SYSTEM %>" entryCode="<%=facilityNewMasterForm.getNewFacilitySystem()%>" display="true"/>&nbsp;
												</td>
												<td class="fieldname">
													Line no.
												</td>
												<td><integro:empty-if-null value="<%=facilityNewMasterForm.getLineNumber()%>"/>&nbsp;
												</td>
												
											</tr>
											<tr class="even">

												<td class="fieldname">
													Purpose
												</td>
												<td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.PURPOSE %>" entryCode="<%=facilityNewMasterForm.getPurpose()%>" display="true" descWithCode="false"/>&nbsp;
												</td>
												<td class="fieldname">
													Weightage %
												</td>
												<td>
												<%
												if(facilityNewMasterForm.getWeightage()!=null){
													DecimalFormat f = new DecimalFormat("0.00");
													
												 
												%>
												<%= f.format(new Double(facilityNewMasterForm.getWeightage()))%>
												
												<%} %>
												&nbsp;
												</td>
												
											</tr>
										<tr class="odd">
											 <td class="fieldname" >Status&nbsp;</td>
              <td ><%if(facilityNewMasterForm.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
             <td class="fieldname">
													Rule Id
												</td>
												<td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.NPA_RULE_ID %>" entryCode="<%=facilityNewMasterForm.getRuleId()%>" display="true" descWithCode="false" />&nbsp;
												</td>
              </tr>	
              <tr class="even">
              <td class="fieldname">
												Product Allowed
												</td>
												<td><integro:empty-if-null value="<%=facilityNewMasterForm.getProductAllowed()%>"/>&nbsp;
												</td>
											 <td class="fieldname" >Currency Restriction&nbsp;</td>
              <td ><%if("Yes".equalsIgnoreCase(facilityNewMasterForm.getCurrencyRestriction())){ %>Yes
              <% }else if("No".equalsIgnoreCase(facilityNewMasterForm.getCurrencyRestriction())){ %>No
              <%}else{ %>-<%} %>&nbsp;</td>              </tr>	
              
              <tr class="even">
              <td class="fieldname" >Revolving Line&nbsp;</td>
              <td ><%if(facilityNewMasterForm.getRevolvingLine().trim().equalsIgnoreCase("Yes")){ %>Yes
              <%}else{ %>No<%} %>&nbsp;</td>
              <td class="fieldname">
												 Line Currency 
												</td>
												<td><integro:empty-if-null value="<%=facilityNewMasterForm.getLineCurrency()%>"/>&nbsp;
												</td>
			 </tr>	
			 <tr class="even">
              <td class="fieldname" >Eligible for Intraday Limit&nbsp;</td>
              <td ><%if(facilityNewMasterForm.getIntradayLimit().trim().equalsIgnoreCase("Yes")){ %>Yes
              <%}else{ %>No<%} %>&nbsp;</td>
              <td class="fieldname" >STL Flag&nbsp;</td>
              <td ><%if(facilityNewMasterForm.getStlFlag().trim().equalsIgnoreCase("Yes")){ %>Yes
              <%}else{ %>No<%} %>&nbsp;</td>
			 </tr>
			 <tr class="even">
			 <td class="fieldname">Line Description </td>
			  <td><integro:empty-if-null value="<%=facilityNewMasterForm.getLineDescription()%>"/>&nbsp;</td>
			  <td class="fieldname" >SCM Flag&nbsp;</td>
             <td ><% if(facilityNewMasterForm.getScmFlag()==null){%>-
              <%}else if(facilityNewMasterForm.getScmFlag().trim().equalsIgnoreCase("Yes")){ %>Yes
              <%}else{ %>No<%} %>&nbsp;</td>
			 </tr>
			 						
			 <tr>
			 
												
												<td class="fieldname">
													Line Exclude from LOA Master
												</td>
												<td>
													<html:checkbox name="MaintainFacilityNewMasterForm" property="lineExcludeFromLoa" value="Y" disabled="true"/>
												</td>
												<td class="fieldname" >IDL Applicable</td>
              <td ><%if(null !=facilityNewMasterForm.getIdlApplicableFlag() && "Yes".equalsIgnoreCase(facilityNewMasterForm.getIdlApplicableFlag().trim())){ %>Yes
              <%}else{ %>No<%} %>&nbsp;</td>
			 </tr>						

			<tr class="odd">
                  <td class="fieldname">Availability & Option Applicable</td>
  				     <% if(null !=facilityNewMasterForm.getAvailAndOptionApplicable()  && ("Yes".equalsIgnoreCase(facilityNewMasterForm.getAvailAndOptionApplicable().trim() ) || "on".equalsIgnoreCase( facilityNewMasterForm.getAvailAndOptionApplicable().trim() ))){%> 
                 	<td>	 <input type="checkbox" name="availAndOptionApplicable" property="availAndOptionApplicable" disabled="true"  checked="true" ></input>
                 	</td>
					<% }else {%> 
					<td><input type="checkbox"  name="availAndOptionApplicable" property="availAndOptionApplicable" disabled="true"  ></input></td>
								<%} %>
								
				<td class="fieldname" >&nbsp;</td>
                <td>&nbsp;</td>
                </tr>					
             
             <tr class="even">	
              <td class="fieldname">Risk Type Master </td>
            	<%
            	if(null!=facilityNewMasterForm.getSelectedRiskTypes() && !facilityNewMasterForm.getSelectedRiskTypes().equals(obj.getSelectedRiskTypes())){ %>
            	
            	<td><html:select name="MaintainFacilityNewMasterForm" multiple="multiple" style="width:260" property="riskTypeNames" disabled="true">
					<html:options collection="actualRiskTypeIds1" property="value" labelProperty="label"/> 
				</html:select> 
			</td> 	
            	
            	<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
            	
             	<td class="fieldname">&nbsp;</td>
             	<td>&nbsp;</td>
												
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
