<%@page import="com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingForm"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingForm,com.integrosys.cms.app.valuationAmountAndRating.trx.IValuationAmountAndRatingTrxValue,com.integrosys.cms.app.valuationAmountAndRating.trx.OBValuationAmountAndRatingTrxValue"%>
<%

 ValuationAmountAndRatingForm valuationAmountAndRatingForm = (ValuationAmountAndRatingForm) request.getAttribute("ValuationAmountAndRatingForm");
/*IValuationAmountAndRatingTrxValue valuationAmountAndRatingTrx = (IValuationAmountAndRatingTrxValue)session.getAttribute("com.integrosys.cms.ui.valuationAmountAndRating.ValuationAmountAndRatingAction.IValuationAmountAndRatingTrxValue"); */
	
String event = request.getParameter("event");
String rejectEvent;
if (event.equals("checker_view_valuation_amount_and_rating")) {
	rejectEvent = "checker_list_valuation_amount_and_rating";
} else {
	rejectEvent = "maker_list_valuation_amount_and_rating";
}
	
	
%>



<%@page import="com.integrosys.cms.app.valuationAmountAndRating.bus.IValuationAmountAndRating"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html>
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

function cancelPage() {
	document.forms[0].action = "ToDo.do?event=prepare";
	document.forms[0].action="valuationAmountAndRating.do?event=<%=rejectEvent %>&go=N";
	document.forms[0].submit();
}

function submitPage() {
	document.forms[0].action = "valuationAmountAndRating.do?event=maker_confirm_resubmit_delete";
	document.forms[0].submit();
}
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='valuationAmountAndRating.do?'>
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="80%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<br>
				<br>
				<br>
				<tr>
					<td>
						<h3>Delete Valuation amount and Rating Master</h3>
					</td>
				</tr>
				<tr>
					<td>
						<hr />
						<br>
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
									<td class="fieldname" >Criteria</td>
									<td style="width: 200px;"><%=valuationAmountAndRatingForm.getCriteria()%> &nbsp;</td>

									<td class="fieldname" >Valuation Amount</td>
									<td style="width: 200px;"><%=valuationAmountAndRatingForm.getValuationAmount()%>&nbsp;</td>
								</tr>
								<tr class="even">
									<td class="fieldname" >RAM Rating</td>
									<td style="width: 200px;"><%=valuationAmountAndRatingForm.getRamRating()%> &nbsp;</td>
									<td class="fieldname" >Exclude Party ID</td>
									<%if(valuationAmountAndRatingForm.getExcludePartyId() != null){ %>
									<td style="width: 200px; word-break: break-all;"><%=valuationAmountAndRatingForm.getExcludePartyId()%> &nbsp;</td>
									<%}else{ %>
									<td style="width: 200px;">-</td>
									<%} %>
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
			
			
			
					<td colspan="4">
						<center>
							<a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/delete2.gif',1)">
								<img
										src="img/delete1.gif" name="Image3311" border="0"
										id="Image3311" />
							</a>
						</center>
						&nbsp;
					</td>
					
 					<td colspan="4">
						<center>
							<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
								<img src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
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
<!-- InstanceEnd -->
</html>
