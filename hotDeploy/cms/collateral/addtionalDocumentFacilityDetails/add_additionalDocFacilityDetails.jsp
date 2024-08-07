<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@ page import="com.integrosys.base.techinfra.util.PropertyUtil" %>
<%@ page import="com.integrosys.cms.host.stp.common.IStpConstants" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	

String insuranceStatusRadio=(String)request.getAttribute("insuranceStatusRadio");

String indexID = (String)request.getParameter("indexID");
/* String title = indexID.equals("-1")?"Add":"Edit"; 

String isStpStatus = (String) request.getAttribute("isStpStatus");
if (isStpStatus == null || isStpStatus.equals(""))
    isStpStatus = "fail";


String stpMode = PropertyUtil.getInstance("/stp.properties").getProperty(IStpConstants.STP_SWITCH_MODE); 

String subtypeCode = (String)request.getAttribute("getSubtypeCode"); */
List insuranceCoverageList = null;
	
if(session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList")!=null){
	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.insuranceCoverageList");
	}
else if(session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList")!=null){
	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
	}
else if(session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList")!=null){
	insuranceCoverageList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.insuranceCoverageList");
	}


pageContext.setAttribute("insuranceCoverageList", insuranceCoverageList);
%>
<%@page import="com.integrosys.cms.ui.collateral.addtionalDocumentFacilityDetails.AddtionalDocumentFacilityDetailsForm"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/JavaScript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
function submitForm() {

	<%-- var insuranceStatusRadio="";
	for(var i=1;i<5;i++){
		var checked=document.forms[0].insuranceStatusRadio[i].checked;
		
		if(checked == true){
			insuranceStatusRadio=document.forms[0].insuranceStatusRadio[i].value;
			
		} 
	} 

	if(insuranceStatusRadio == ""){
		alert("Please select the insurance status.");
	}else{
		if(insuranceStatusRadio == 'Pending'){
			document.forms[0].action="<%=actionNameStr%>?event=maker_create_insurance_pending";
			document.forms[0].submit();
		}
		 else if(insuranceStatusRadio == 'Deferred'){
			document.forms[0].action="<%=actionNameStr%>?event=maker_create_insurance_deferred";
   			document.forms[0].submit();
		}else if(insuranceStatusRadio == 'Received'){
			document.forms[0].action="<%=actionNameStr%>?event=maker_create_insurance_received";
   			document.forms[0].submit();
		} else if(insuranceStatusRadio == 'Waived'){
			document.forms[0].action="<%=actionNameStr%>?event=maker_create_insurance_waived";
   			document.forms[0].submit();
		} 
	} --%>
	
	document.forms[0].action='<%=actionNameStr%>?event=maker_create_add_fac_doc_det_submit';
    document.forms[0].submit();
}

function cancleForm() {

	//alert("cancel form");
 	document.forms[0].action='<%=actionNameStr%>?event=cancel';
    document.forms[0].submit();
}
</script>

</head>
<body>
<html:form action="<%=actionNameStr%>">

<input type="hidden" name="event"/>
 <input type="hidden" name="indexID" value="<%=indexID%>"/>
<%--<input type="hidden" name="stpMode" value="<%=stpMode%>"/>   --%>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<html:hidden property="addFacDocStatus"  value="PENDING_EDIT"/>



<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
                        <tr>
                          <td><h3>Add New Document Facility Details</h3></td>
                          <td align="right" valign="bottom"></td>  
						  <td>&nbsp;</td>      
						  <td>&nbsp;</td>
						
                        </tr>
                        <tr><td colspan="4"><hr/></td></tr>
    </thead>
           <tbody>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblInput">
							<thead>
							</thead>
							<tbody>
								<tr class="even">
								  <td class="fieldname" >Document Facility Category<font color="red">*</font></td>
				                  
				                   <td width="20%"><html:select property="docFacilityCategory" style='width: 270px;' styleId="criteriais">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY%>" descWithCode="false" />
									</html:select> <br>
									<html:errors property="docFacilityCategoryError" />
								</td>
								<td>
              
				                   
								  <td class="fieldname" width="30%">Document Facility Amount<font color="red">*</font></td>
								  <td width="20%" style="width: 200px;">
								  	<html:text property="docFacilityAmount" styleId="valuamt" size="50" maxlength="100" onblur="javascript:formatAmountAsCommaSeparated(this);">
								  	<%-- onblur="javascript:formatAmountAsCommaSeparated(this);" --%>
								  	</html:text>&nbsp; 
								  	<br><html:errors property="docFacilityAmountError" />
								  </td>
								</tr>
								
								<tr class="even">
								  <td class="fieldname" >Document Facility Type<font color="red">*</font></td>
				                  
				                   <td width="20%"><html:select property="docFacilityType" style='width: 270px;' styleId="criteriais">
									<%-- <html:option value="">Please select</html:option>
									<html:option value="FUNDED">Funded</html:option>
									<html:option value="NON_FUNDED">Non Funded</html:option>
									<html:option value="MEMO_EXPOSURE">Memo Exposure</html:option> --%>
									<integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE%>" descWithCode="false" />
									
									</html:select> <br>
									<html:errors property="docFacilityTypeError" />
								</td>
				                  
				                   
								  
								</tr>
								
		
		
		
								
								
							</tbody>
						</table>
					</td>
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
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
			
			<td colspan="4">
						
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0" onclick="cancleForm()"
									id="Image4411" />
							</a>
						
						&nbsp;&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
</body>
</html>