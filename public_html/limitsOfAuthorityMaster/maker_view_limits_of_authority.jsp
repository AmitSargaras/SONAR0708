<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.limitsOfAuthorityMaster.LimitsOfAuthorityMasterForm"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
	LimitsOfAuthorityMasterForm loaMasterForm = (LimitsOfAuthorityMasterForm) request.getAttribute("LimitsOfAuthorityMasterForm");
	String context = request.getContextPath() + "/";
	int sno = 0;
	int startIndex = 0;
    String event = request.getParameter("event");
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
    document.forms[0].action="LimitsOfAuthorityMaster.do?event=maker_list_limits_of_authority";
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
						<h3>View Limits of Authority (LOA) Master</h3>
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
				<td>
					<center>
						<a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
						</a>
					</center> &nbsp;
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