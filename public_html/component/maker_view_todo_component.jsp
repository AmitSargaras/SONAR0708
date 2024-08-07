<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.component.MaintainComponentForm"%>
<%
	MaintainComponentForm componentForm = (MaintainComponentForm) request
			.getAttribute("MaintainComponentForm");
	DefaultLogger.debug("maker_list_component.jsp", "size is "
			+ componentForm + "<<<<<<<<<<<<<<");
	String event = request.getParameter("event");
	pageContext.setAttribute("componentList", componentForm);
	int sno = 0;
	int startIndex = 0;
%>


<html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>

		<script type="text/javascript" src="js/imageNavigation.js"></script>
		<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript" src="js/calDriver.js"></script>
		<link rel="stylesheet" type="text/css" media="all"
			href="css/calendar-blue.css" />
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
function showSpanHub()   {
 	document.getElementById("linkedHub").style.visibility = "visible";
}

function hideSpanHub()   {
document.getElementById("linkedHub").style.visibility = "hidden"; 
}

function showSpanCustodian()   {

if(document.forms[0].isVault.checked==false){
	document.getElementById("cust1").className = "hiddenDiv";
	document.getElementById("cust2").className = "hiddenDiv";
	//document.getElementById("cust1").style.visibility = "hidden"; 
	// document.getElementById("cust2").style.visibility = "hidden"; 
	
	}else if(document.forms[0].isVault.checked==true){
		document.getElementById("cust1").className = "visibleDiv";
		document.getElementById("cust2").className = "visibleDiv";
	//	 document.getElementById("cust1").style.visibility = "visible"; 
	//	 document.getElementById("cust2").style.visibility = "visible"; 
		}
 
 	//document.getElementById("custodian").style.visibility = "visible";
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
	 document.forms[0].action="ToDo.do?event=totrack";
	    
	    document.forms[0].submit();
}



function saveForm() {

 	document.forms[0].action="component.do?event=maker_update_draft_component";
    document.forms[0].submit();
}
function submitForm(event) {
	
	if(event=="maker_prepare_resubmit_create")
		{
		
		document.forms[0].action="component.do?event=maker_confirm_resubmit_create";
		
    }else{
      
    	document.forms[0].action="component.do?event=maker_edit_component";
    }
    
    document.forms[0].submit();
}

//-->
</script>
		<style type="text/css">
<!--
.hiddenDiv {
	display: none;
}

.visibleDiv {
	display: block;
	border: 1px grey solid;
}

.style1 {
	color: #FF0000
}

.style5 {
	color: #FF0000
}

.style11 {
	color: #FF0000
}
-->
</style>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='component.do?'>
		<body>
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
								Component
							</h3>
						</td>


					</tr>
					<tr>
						<td>
							<hr />
						</td>
					</tr>
				</thead>


				<thead>
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

										<td class="fieldname" width="50%">
											Component Type
										</td>
										<td width="30%"><%=componentForm.getComponentType()%></td>
									</tr>

									<tr class="odd">
										<td class="fieldname" width="20%">
											Component Code
										</td>
										<td width="30%"><%=componentForm.getComponentCode()%>
										</td>
									</tr>

									<tr class="odd">
										<td class="fieldname" width="20%">
											Component Name
										</td>
										<td width="30%"><%=componentForm.getComponentName()%>
										</td>
									</tr>

									<%--Start:-------->Abhishek Naik --%>
	

									<%
										if (componentForm.getComponentType().equalsIgnoreCase(
													"Current_Asset")) {
												if (componentForm.getDebtors().equalsIgnoreCase("Y")) {
									%>
									<tr class="even">
										<td class="fieldname" width="20%">
											Is Book Debts/Debtors
										</td>
										<td width="30%">Yes</td>
									</tr>
									<%
										} else {
									%>
									<tr class="even">
										<td class="fieldname" width="20%">
											Is Book Debts/Debtors
										</td>
										<td width="30%">No</td>
									</tr>
									
									<%
										}
									%>
									<tr>
										<td class="fieldname" width="20%">
											If Yes then Aging
										</td>
										<td width="30%">
											<integro:empty-if-null value="<%=componentForm.getAge()%>" />
										</td>
									</tr>
									<%
										}
									%>
									
									<%--End:-------->Abhishek Naik --%>

									<tr class="even">
										<td class="fieldname" width="20%">
											Has Insurance
										</td>
										<td width="30%">
											<html:checkbox name="MaintainComponentForm"
												property="hasInsurance" disabled="true" />
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
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
				<tr>



					<td colspan="2">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" /> </a>
						</center>
						&nbsp;
					</td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
