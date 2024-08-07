<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.limitsOfAuthorityMaster.ILimitsOfAuthorityMasterConstant"%>
<%@page import="com.integrosys.cms.ui.limitsOfAuthorityMaster.LimitsOfAuthorityMasterAction"%>
<%@page import="com.integrosys.cms.ui.limitsOfAuthorityMaster.LimitsOfAuthorityMasterForm"%>
<%@page import="com.integrosys.cms.app.limitsOfAuthorityMaster.trx.ILimitsOfAuthorityMasterTrxValue"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
	String context = request.getContextPath() + "/";
	int sno = 0;
	int startIndex = 0;
    String event = request.getParameter("event");
    ILimitsOfAuthorityMasterTrxValue trx = (ILimitsOfAuthorityMasterTrxValue)session.getAttribute(LimitsOfAuthorityMasterAction.class.getName() 
    		+ "." +ILimitsOfAuthorityMasterConstant.LIMITS_OF_AUTHORITY_TRX_VAL);

    String submitEvent = "checker_approve_edit";
	String rejectEvent = "checker_reject_edit";
	LimitsOfAuthorityMasterForm loaMasterForm = (LimitsOfAuthorityMasterForm) request.getAttribute("LimitsOfAuthorityMasterForm");
%>
<html>
<head>
<title>Untitled Document</title>
 <script language="JavaScript" type="text/javascript"	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">

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
    document.forms[0].action="ToDo.do?event=prepare";
	document.forms[0].submit();
}

function approvePage() {
    document.forms[0].action="LimitsOfAuthorityMaster.do?event=<%=submitEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="LimitsOfAuthorityMaster.do?event=<%=rejectEvent%>";
	document.forms[0].submit();
}
</script>
</head>
<html:form action='LimitsOfAuthorityMaster.do'>
	<body>
		<table width="70%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
					<td>
						<h3>Limits of Authority (LOA) Master</h3>
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
							<td class="fieldname" width="30%">Employee Grade<font color="red">*</font></td>
				                  <td width="20%">
				                  
											<bean:write name="LimitsOfAuthorityMasterForm" property="employeeGrade" />
											<logic:empty name="LimitsOfAuthorityMasterForm" property="employeeGrade">-</logic:empty>
								  
								  </td>
								
							<td class="fieldname" width="30%">Ranking Sequence<font color="red">*</font></td>
							<td width="20%">
							
								<bean:write name="LimitsOfAuthorityMasterForm" property="rankingOfSequence" />
								<logic:empty name="LimitsOfAuthorityMasterForm" property="rankingOfSequence">-</logic:empty>
										
						    </td>
						</tr>
						
						<tr class="odd">
							<td class="fieldname" width="30%">Segment<font color="red">*</font></td>
				                  <td width="20%">
									<integro:common-code 
                                    		categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" entryCode="<%=loaMasterForm.getSegment() %>" descWithCode="false" display="true" />
									
								</td>
								
							<td class="fieldname" width="30%">Limit Release Amount(Delta)</td>
							<td width="20%">
							
										<span class="amtClassView">
											<bean:write name="LimitsOfAuthorityMasterForm" property="limitReleaseAmt" />
											<logic:empty name="LimitsOfAuthorityMasterForm" property="limitReleaseAmt">-</logic:empty>
										</span>
						    
						    </td>
						</tr>
						
						<tr class="odd">
							<td class="fieldname" width="30%">Total Sanctioned Limit</td>
				                  <td width="20%">
				                  
								
										<span class="amtClassView">
											<bean:write name="LimitsOfAuthorityMasterForm" property="totalSanctionedLimit" />
											<logic:empty name="LimitsOfAuthorityMasterForm" property="totalSanctionedLimit">-</logic:empty>
										</span>
								
								
								</td>
								
							<td class="fieldname" width="30%">Property Valuation</td>
							<td width="20%">
							
										<span class="amtClassView">
											<bean:write name="LimitsOfAuthorityMasterForm" property="propertyValuation" />
											<logic:empty name="LimitsOfAuthorityMasterForm" property="propertyValuation">-</logic:empty>
										</span>
							
						    
						    </td>
						</tr>
						
						<tr class="odd">
							<td class="fieldname" width="30%">FD Amount</td>
				                <td width="20%">
				                
				                	<span class="amtClassView">
				                		<bean:write name="LimitsOfAuthorityMasterForm" property="fdAmount" />
										<logic:empty name="LimitsOfAuthorityMasterForm" property="fdAmount">-</logic:empty>
				                	</span>
								
								</td>
								
							<td class="fieldname" width="30%">Drawing Power</td>
							<td width="20%">
						    
					                <span class="amtClassView">
					                	<bean:write name="LimitsOfAuthorityMasterForm" property="drawingPower" />
										<logic:empty name="LimitsOfAuthorityMasterForm" property="drawingPower">-</logic:empty>
					                </span>
						    
						    </td>
						</tr>
						
						<tr class="odd">
							<td class="fieldname" width="30%">SBLC Security OMV</td>
				                <td width="20%">
								
				                	<span class="amtClassView">
										<bean:write name="LimitsOfAuthorityMasterForm" property="sblcSecurityOmv" />
										<logic:empty name="LimitsOfAuthorityMasterForm" property="sblcSecurityOmv">-</logic:empty>
									</span>	
								
								</td>
								
							<td class="fieldname" width="30%">Facility CAM Covenant</td>
							<td width="20%">
							
								<%=ICMSConstant.YES.equals(loaMasterForm.getFacilityCamCovenant())?"Yes":ICMSConstant.NO.equals(loaMasterForm.getFacilityCamCovenant())?"No":"-"%>
								
								&nbsp;
							
							
						    </td>
						</tr>
								
								<html:hidden name="LimitsOfAuthorityMasterForm" property="id" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="employeeGrade" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="segment" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="rankingOfSequence" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="limitReleaseAmt" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="totalSanctionedLimit" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="propertyValuation" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="fdAmount" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="drawingPower" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="sblcSecurityOmv" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="facilityCamCovenant" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="versionTime" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="lastUpdateDate" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="creationDate" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="createdBy" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="lastUpdateBy" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="status" />
								<html:hidden name="LimitsOfAuthorityMasterForm" property="deprecated" />
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblInfo">
							<tbody>
								<tr>
									<td class="fieldname" width="20%">Remarks</td>
									<td class="odd"><textarea name="remarks" rows="4"
											style="width: 90%"></textarea></br>
									<html:errors property="remarksError" /></td>
								</tr>
								<tr>
									<td class="fieldname">Last Action By</td>
									<td class="even"><%=trx.getUserInfo()%>&nbsp;</td>
								</tr>
								<tr class="odd">
									<td class="fieldname">Last Remarks Made</td>
									<td class="even"><%=trx.getRemarks() != null ? trx.getRemarks() : ""%>&nbsp;</td>
								</tr>
								<tr>
									<td colSpan="2"><html:errors property="checkerLoaMaster"/></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
				<td><a href="javascript:approvePage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
						src="img/approve1.gif" name="Image8" width="80" height="20"
						border="0" id="Image8" /></a></td>
				<td><a href="javascript:rejectPage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
						src="img/reject1.gif" name="Image9" width="70" height="20"
						border="0" id="Image9" /></a></td>
				<td><a href="javascript:cancelPage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
						src="img/cancel1.gif" name="Image1" border="0" id="Image1" /></a></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
	</body>
</html:form>
</html>