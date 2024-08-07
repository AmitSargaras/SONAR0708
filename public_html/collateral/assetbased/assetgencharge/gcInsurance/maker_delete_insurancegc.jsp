<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC,
					com.integrosys.cms.app.collateral.trx.ICollateralTrxValue" %>    
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>					

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
OBInsuranceGC insuranceObj = (OBInsuranceGC) request.getAttribute("insuranceObj");
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
String dp=(String)request.getAttribute("calculatedDP");
System.out.println("/////////////////**********************  OBJ "+insuranceObj);
System.out.println("/////////////////**********************  calculatedDP "+dp);
System.out.println("/////////////////**********************  itrxValue "+itrxValue.getReferenceID());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="JavaScript" type="text/JavaScript">

function submitForm () {
	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_delete_list_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>&insuranceCode=<%=insuranceObj.getInsuranceCode()%>';
    document.forms[0].submit();
}



function cancelPage(){
	document.forms[0].action='AssetInsuranceCollateral.do?event=maker_cancle_create_insurance&collateralID=<%=itrxValue.getReferenceID()%>&calculatedDP=<%=dp%>';
    document.forms[0].submit();
}

</script>


</head>
<body>
<html:form action="AssetInsuranceCollateral.do">
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
      <td><h3>View Insurance</h3></td>
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
           <tr class="even">
             
              <td class="fieldname" width="50%">Insurance Code</td>
              <td width="30%"><%=insuranceObj.getInsuranceCode()%></td>      </tr>
            
            <tr class="odd">             
              <td class="fieldname" width="20%">Insurance Type</td>
              <td width="30%"><%=insuranceObj.getInsuranceType()%> 
              </td>             
            </tr>
            
           

					</tbody>
        </table> </td>
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
			<td colspan="2"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/delete2.gif',1)"
				onClick="submitForm()"><img src="img/delete1.gif"
				name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;</td>
			<td colspan="2">
			<center><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
				src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
			</a></center>
			&nbsp;</td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>
</html:form>
</body>
</html>