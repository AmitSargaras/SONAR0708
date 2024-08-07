<%@page import="com.integrosys.cms.ui.limitsOfAuthorityMaster.LimitsOfAuthorityMasterForm"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.limitsOfAuthorityMaster.ILimitsOfAuthorityMasterConstant"%>
<%@page import="com.integrosys.cms.ui.limitsOfAuthorityMaster.LimitsOfAuthorityMasterAction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
	String context = request.getContextPath() + "/";
	
	List<LabelValueBean> rankingSeqList = (List<LabelValueBean>)session.getAttribute(LimitsOfAuthorityMasterAction.class.getName() + "." + ILimitsOfAuthorityMasterConstant.SESSION_RANKING_SEQUENCE_LIST);
	
	String event = request.getParameter("event");
	
	pageContext.setAttribute(ILimitsOfAuthorityMasterConstant.SESSION_RANKING_SEQUENCE_LIST ,rankingSeqList);
	
	List<String> empGradeRankingSequenceList = (List<String>) session.getAttribute(LimitsOfAuthorityMasterAction.class.getName() + "." + ILimitsOfAuthorityMasterConstant.SESSION_EMP_GRADE_SORTED_RANKING_SEQUENCE);
	
%>
<html>
<head>
<title>Untitled Document</title>
 <script language="JavaScript" type="text/javascript"	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="<%=context%>js/enableFields.js"></script>
<script language="JavaScript" type="text/JavaScript">

var rankingSeqList =new Array();

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

function submitForm() {
		enableAllFormElements();
		document.forms[0].action = "LimitsOfAuthorityMaster.do?event=maker_create_limits_of_authority";
		document.forms[0].submit();
}

function saveForm() {
		enableAllFormElements();
		document.forms[0].action = "LimitsOfAuthorityMaster.do?event=maker_draft_limits_of_authority";
		document.forms[0].submit();
}

function populateRankingSequence(){
	var employeeGrade = document.getElementById('employeeGrade').value;
	
	var selectedRankingSequence = '';
	
	for(var i=0; i<rankingSeqList.length;i++){
		if(employeeGrade == rankingSeqList[i]){
			selectedRankingSequence = i+1;
			break;
		}
	}
	
	document.getElementById('rankingOfSequence').value = selectedRankingSequence;
}

window.onload = function() {
	
	<% if(empGradeRankingSequenceList!=null){ 
		for(String empGradeRankingSequence :empGradeRankingSequenceList){
			%>
			rankingSeqList.push('<%=empGradeRankingSequence%>');
	<% 	} }%>	
	
}

</script>
</head>
<html:form action='LimitsOfAuthorityMaster.do'>
	<html:errors property="master"/>
	<body>
		<table width="70%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
					<td>
						<h3>Add Limits of Authority (LOA) Details</h3>
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
								  <td class="fieldname" >Employee Grade <font color="red">*</font></td>
				                  <td width="20%">
				                  	<html:select property="employeeGrade" styleId="employeeGrade" onchange="javascript:populateRankingSequence()">
										<integro:common-code categoryCode="<%=CategoryCodeConstant.EMPLOYEE_GRADE%>" descWithCode="false" />
									</html:select>
				                  	<br><html:errors property="employeeGradeError"/>
				                  </td>
				                  
				                <td class="fieldname" width="30%">Ranking Sequence<font color="red">*</font></td>
								<td width="20%">
							
								<html:select property="rankingOfSequence" styleId="rankingOfSequence" disabled="true">
											<option value=""><bean:message
													key="label.please.select" /></option>
											<html:options
												collection="<%=ILimitsOfAuthorityMasterConstant.SESSION_RANKING_SEQUENCE_LIST%>"
												labelProperty="label" property="value" />
								</html:select>
								<br>	<html:errors property="rankingOfSequenceError"/>
							
										
						    	</td>
				                  
						<tr class="odd">
							<td class="fieldname" width="30%">Segment<font color="red">*</font></td>
				                  <td width="20%">
										<html:select property="segment" >
                                    	<integro:common-code 
                                    		categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" descWithCode="false" />
                                    	</html:select>	
										&nbsp; &nbsp;
				                  		<html:errors property="segmentError"/>
									
								</td>
								
							<td class="fieldname" width="30%">Limit Release Amount(Delta)</td>
							<td width="20%">
							
											<html:text property="limitReleaseAmt" styleId="limitReleaseAmt" size="20" styleClass="amtClass" 
												onblur="javascript:formatAmountAsCommaSeparatedOnlyDigit(this)"/>&nbsp;
											<br>	
											<html:errors property="limitReleaseAmtError"/>						
							
						    
						    </td>
						</tr>
						
						<tr class="odd">
							<td class="fieldname" width="30%">Total Sanctioned Limit</td>
				                  <td width="20%">
				                  
								
											<html:text property="totalSanctionedLimit"
												styleId="totalSanctionedLimit" size="20"
												styleClass="amtClass"
												onblur="javascript:formatAmountAsCommaSeparatedOnlyDigit(this)" />
											<html:errors property="totalSanctionedLimitError" />
											&nbsp;					
									
								</td>
								
							<td class="fieldname" width="30%">Property Valuation</td>
							<td width="20%">
							
											<html:text property="propertyValuation"
												styleId="propertyValuation" size="20"
												styleClass="amtClass"
												onblur="javascript:formatAmountAsCommaSeparatedOnlyDigit(this)" />
											<html:errors property="propertyValuationError" />
											&nbsp;					
									
						    </td>
						</tr>
						
						<tr class="odd">
							<td class="fieldname" width="30%">FD Amount</td>
				                <td width="20%">
				                
											<html:text property="fdAmount"
												styleId="fdAmount" size="20"
												styleClass="amtClass"
												onblur="javascript:formatAmountAsCommaSeparatedOnlyDigit(this)" />
											<html:errors property="fdAmountError" />
											&nbsp;					
								
								
								</td>
								
							<td class="fieldname" width="30%">Drawing Power</td>
							<td width="20%">
						    
											<html:text property="drawingPower"
												styleId="drawingPower" size="20"
												styleClass="amtClass"
												onblur="javascript:formatAmountAsCommaSeparatedOnlyDigit(this)" />
											<html:errors property="drawingPowerError" />
											&nbsp;					
						    
						    </td>
						</tr>
						
						<tr class="odd">
							<td class="fieldname" width="30%">SBLC Security OMV</td>
				                <td width="20%">
								
											<html:text property="sblcSecurityOmv"
												styleId="sblcSecurityOmv" size="20"
												styleClass="amtClass"
												onblur="javascript:formatAmountAsCommaSeparatedOnlyDigit(this)" />
											<html:errors property="sblcSecurityOmvError" />
											&nbsp;					
								
								</td>
								
							<td class="fieldname" width="30%">Facility CAM Covenant</td>
							<td width="20%">
							
								<html:radio property="facilityCamCovenant" value="Y">Yes</html:radio>
								<html:radio property="facilityCamCovenant" value="N">No</html:radio>
							
								&nbsp;
								<br>	<html:errors property="facilityCamCovenantError"/>
							
							
						    </td>
						</tr>
								
								
								<html:hidden name="LimitsOfAuthorityMasterForm" property="id" />
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
						<a href="javascript:saveForm();" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
							src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a>
					</center> &nbsp;					
				</td>
				<td>
					<center>
						<a href="javascript:submitForm();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
							<img src="img/submit1.gif" name="Image3311" border="0"
							id="Image3311" />
						</a>
					</center> &nbsp;
				</td>
				<td>
					<center>
					<a href="javascript:cancelPage();"
					   onmouseout="MM_swapImgRestore()"
					   onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
					   src="img/cancel1.gif" name="Image1" border="0" id="Image1" />
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