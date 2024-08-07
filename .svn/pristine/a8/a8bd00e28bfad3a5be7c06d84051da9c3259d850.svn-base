<%@page import="java.util.Collection"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@page	import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page	import="com.integrosys.component.user.app.bus.OBSearchCommonUser"%>
<%@page	import="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingForm,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.app.valuationAmountAndRating.trx.IValuationAmountAndRatingTrxValue,com.integrosys.cms.app.valuationAmountAndRating.trx.OBValuationAmountAndRatingTrxValue"%>
<%
ValuationAmountAndRatingForm valuationAmountAndRatingForm = (ValuationAmountAndRatingForm) request
			.getAttribute("ValuationAmountAndRatingForm");
	IValuationAmountAndRatingTrxValue valuationAmountAndRatingTrx = (IValuationAmountAndRatingTrxValue) session
			.getAttribute("com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingAction.IValuationAmountAndRatingTrxValue");
	int sno = 0;
	int startIndex = 0;
	Collection riskGrade = (Collection) session.getAttribute("com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingAction.riskGrade");
	System.out.println("riskGrade="+riskGrade);
	request.setAttribute("riskGrade", riskGrade);
	String ids = valuationAmountAndRatingForm.getExcludePartyId();
	String context = request.getContextPath() + "/";
	OBCustomerSearchResult searchResult=(OBCustomerSearchResult)session.getAttribute("com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingAction.customerObject");
%>


<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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
    document.forms[0].action="valuationAmountAndRating.do?event=maker_list_valuation_amount_and_rating&go=N";
	document.forms[0].submit();
	}
function submitForm() {
		document.forms[0].action = "valuationAmountAndRating.do?event=maker_edit_valuation_amount_and_rating";
		document.forms[0].submit();
	}

function saveForm() {
		document.forms[0].action = "valuationAmountAndRating.do?event=maker_update_draft_valuation_amount_and_rating";
		document.forms[0].submit();
	}
function searchCustomer(){ //v3.0
	//alert("searchCustomerName  : "+document.forms[0].searchCustomerName.value);
	if(document.forms[0].searchCustomerName.value==null){
		alert("Please enter customer name to search.");
	}
	///alert(document.getElementById('criteriais').value);
	//alert(document.getElementById('ramRate').value);
	//alert(document.getElementById('valuamt').value);
	document.forms[0].criteria.value = document.getElementById('criteriais').value;
	document.forms[0].valuationAmount.value = document.getElementById('ramRate').value;
	document.forms[0].ramRating.value = document.getElementById('valuamt').value;
	document.forms[0].action = "valuationAmountAndRating.do?event=listEdit";
	document.forms[0].submit();
}

</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='valuationAmountAndRating.do'>
	<html:hidden property="startIndex" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>

				<tr>
					<td>
						<h3>Edit Valuation amount and Rating Master</h3>
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
								<tr class="even">
								  <td class="fieldname" >Criteria<font color="red">*</font></td>
				                  
				                   <td width="20%" style="width: 200px;"><html:select property="criteria" style='width: 270px;' styleId="criteriais">
									<html:option value="">Please select</html:option>
									<html:option value=">">></html:option>
									<html:option value="<"><</html:option>
									<html:option value="<="><=</html:option>
									<html:option value=">=">>=</html:option>
									<html:option value="=">=</html:option>
									</html:select> <br>
									<html:errors property="criteria" />
								</td>
				                  
				                   
								  <td class="fieldname" width="30%">Valuation Amount<font color="red">*</font></td>
								  <td width="20%" style="width: 200px;">
								  	<html:text property="valuationAmount" styleId="valuamt" size="50" maxlength="100"> 
								  	<%-- onblur="javascript:formatAmountAsCommaSeparated(this);" --%>
								  	</html:text>&nbsp; 
								  	<br><html:errors property="valuationAmount" />
								  </td>
								</tr>
								<tr class="even">
									<td class="fieldname">RAM Rating<font color="red">*</font></td>
									<td width="20%" style="width: 200px;">
								  	<html:select property="ramRating" style='width: 270px;' styleId="ramRate">
							<html:option value="">Please Select</html:option>                     
						    <html:options name ="riskGrade"/>
							</html:select> 
								  	 
								  	<br><html:errors property="ramRating" />
								  </td>
									<td class="fieldname">Party Name</td>
									<%-- <td width="20%">
								  	<html:text property="excludePartyId" size="50" maxlength="100"></html:text>&nbsp; 
								  	<br><html:errors property="excludePartyId" />
								  </td> --%>
								  
								  
			<td width="20%"><input type="text" name="searchCustomerName" <%if(searchResult!=null){ %> value="<%=searchResult.getCustomerName()%>" <%} %> />&nbsp;&nbsp;&nbsp; 
				<input class="btnNormal" id="searchCustomerButton" type="button"
				value="Search" onclick="searchCustomer()" /> &nbsp;
				<html:errors property="excludePartyId" />
				<html:errors property="customerNameError" />
				
			</td>
		</tr>
		
		
		<tr class="even">
             <td class="fieldname">
				Exclude Party ID
			</td>
			<td width="20%" style="width: 200px; word-break: break-all;">
								  	
			<integro:empty-if-null
					value="<%=ids%>" />
					<html:hidden property="excludePartyId"  />
			
								  	<br><html:errors property="excludePartyId" />
								  </td>
								  
								</tr>
								<html:hidden name="ValuationAmountAndRatingForm" property="status" />
								<html:hidden name="ValuationAmountAndRatingForm" property="criteria" />
								<html:hidden name="ValuationAmountAndRatingForm" property="valuationAmount" />
								<html:hidden name="ValuationAmountAndRatingForm" property="ramRating" />
								<html:hidden name="ValuationAmountAndRatingForm" property="excludePartyId" />
								<html:hidden name="ValuationAmountAndRatingForm" property="createBy" />
								<html:hidden name="ValuationAmountAndRatingForm" property="lastUpdateBy" />
								<html:hidden name="ValuationAmountAndRatingForm" property="lastUpdateDate" />
								<html:hidden name="ValuationAmountAndRatingForm" property="creationDate" />
								<html:hidden name="ValuationAmountAndRatingForm" property="id" />
								<html:hidden name="ValuationAmountAndRatingForm" property="deprecated" />
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
						<a href="javascript:saveForm();" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
							src="img/save1.gif" name="ImageSave" border="0" id="ImageSave" /></a>
					</center> &nbsp;
				</td>
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


		<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
