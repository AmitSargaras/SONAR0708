<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,java.util.*,com.integrosys.base.techinfra.logger.DefaultLogger" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	
ICollateralTrxValue itrxValue2 = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String calculatedDP = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.calculatedDP");
String fundedShare = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.fundedShare");
String dueDate = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dueDate");
String dpCalculateManually = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.dpCalculateManually");
String stockdocMonth = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocMonth");
String stockdocYear = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stockdocYear");

String migrationFlag = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.migrationFlag");
String totalLonable = (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.totalLonable");

System.out.println("add_insurance.jsp  stockDocMonth="+stockdocMonth+" stockdocYear="+stockdocYear);
String insuranceStatusRadio=(String)request.getAttribute("insuranceStatusRadio");
DefaultLogger.debug(this,"itrxValue2:"+itrxValue2+" calculatedDP:"+calculatedDP+" fundedShare:"+fundedShare+" dueDate:"+dueDate+"insuranceStatusRadio:"+insuranceStatusRadio);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Untitled Document</title>
 
<script language="JavaScript" type="text/JavaScript">

function submitForm() {

	var insuranceStatusRadio="";
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
			document.forms[0].action="AssetInsuranceCollateral.do?event=maker_create_insurance_pending&securityId=<%=itrxValue2.getReferenceID()%>&calculatedDP=<%=calculatedDP%>&fundedShare=<%=fundedShare%>&dueDate=<%=dueDate%>&dpCalculateManually=<%=dpCalculateManually%>&stockdocMonth=<%=stockdocMonth%>&stockdocYear=<%=stockdocYear%>&insuranceStatusRadio="+insuranceStatusRadio;
   			document.forms[0].submit();
		}else if(insuranceStatusRadio == 'Deferred'){
			document.forms[0].action="AssetInsuranceCollateral.do?event=maker_create_insurance_deferred&securityId=<%=itrxValue2.getReferenceID()%>&calculatedDP=<%=calculatedDP%>&fundedShare=<%=fundedShare%>&dueDate=<%=dueDate%>&dpCalculateManually=<%=dpCalculateManually%>&stockdocMonth=<%=stockdocMonth%>&stockdocYear=<%=stockdocYear%>&insuranceStatusRadio="+insuranceStatusRadio;
   			document.forms[0].submit();
		}else if(insuranceStatusRadio == 'Received'){
			document.forms[0].action="AssetInsuranceCollateral.do?event=maker_create_insurance_received&securityId=<%=itrxValue2.getReferenceID()%>&calculatedDP=<%=calculatedDP%>&fundedShare=<%=fundedShare%>&dueDate=<%=dueDate%>&dpCalculateManually=<%=dpCalculateManually%>&stockdocMonth=<%=stockdocMonth%>&stockdocYear=<%=stockdocYear%>&insuranceStatusRadio="+insuranceStatusRadio;
   			document.forms[0].submit();
		} else if(insuranceStatusRadio == 'Waived'){
			document.forms[0].action="AssetInsuranceCollateral.do?event=maker_create_insurance_waived&securityId=<%=itrxValue2.getReferenceID()%>&calculatedDP=<%=calculatedDP%>&fundedShare=<%=fundedShare%>&dueDate=<%=dueDate%>&dpCalculateManually=<%=dpCalculateManually%>&stockdocMonth=<%=stockdocMonth%>&stockdocYear=<%=stockdocYear%>&insuranceStatusRadio="+insuranceStatusRadio;
   			document.forms[0].submit();
		}
	}
}

function cancleForm() {

	
 	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_cancle_create_insurance&collateralID=<%=itrxValue2.getReferenceID()%>&calculatedDP=<%=calculatedDP%>&dpCalculateManually=<%=dpCalculateManually%>';
    document.forms[0].submit();
}
</script>

</head>
<body>
<html:form action="AssetInsuranceCollateral.do" >
<input type="hidden" name="calculatedDP" value="<%=calculatedDP %>"></input>
<input type="hidden" name="fundedShare" value="<%=fundedShare %>"></input>
<input type="hidden" name="dueDate" value="<%=dueDate %>"></input>

<input type="hidden" name="migrationFlag" value="<%=migrationFlag %>"></input>
<input type="hidden" name="totalLonable" value="<%=totalLonable %>"></input>


<input type="hidden" name="insuranceStatusRadio" value="<%=insuranceStatusRadio %>"></input>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
                        <tr>
                          <td><h3>Add New Insurance</h3></td>
                          <td align="right" valign="bottom"></td>
						  <td>&nbsp;</td>      
						  <td>&nbsp;</td>
						
                        </tr>
                        <tr><td colspan="4"><hr/></td></tr>
    </thead>
           <tbody>
                        <tr>
                          <td width="10%" ><html:radio property="insuranceStatusRadio" styleId="insuranceStatusRadio" value="Pending"/>&nbsp;Pending</td>
                          <td width="10%"><html:radio property="insuranceStatusRadio" styleId="insuranceStatusRadio" value="Deferred"/>&nbsp;Deferred</td>
                          <td width="10%"><html:radio property="insuranceStatusRadio" styleId="insuranceStatusRadio" value="Received"/>&nbsp;Received</td>
                          <td width="10%"><html:radio property="insuranceStatusRadio" styleId="insuranceStatusRadio" value="Waived"/>&nbsp;Waived</td>
                        </tr>
                        <tr><td>&nbsp;</td>      
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>      
						  <td>&nbsp;</td>
						</tr>
						<tr><td>&nbsp;</td>      
						  <td>&nbsp;</td>
						  <td>&nbsp;</td>      
						  <td>&nbsp;</td>
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