
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.*,com.integrosys.cms.ui.holiday.MaintainHolidayForm,com.integrosys.cms.app.holiday.trx.IHolidayTrxValue,com.integrosys.cms.app.systemBankBranch.trx.OBSystemBankBranchTrxValue"%>
<%
	StateForm stateForm = (StateForm) request.getAttribute("StateForm");
	IStateTrxValue stateTrxValue = (IStateTrxValue)session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.IStateTrxValue");


	SearchResult sr = (SearchResult) request
			.getAttribute("stateList");
	System.out.println("sr---------"+sr);
	if (sr != null) {
		List searchList = new ArrayList(sr.getResultList());
		pageContext.setAttribute("stateList",
				searchList);
	}
	String transId=(String)request.getAttribute("TrxId"); 
	String event = request.getParameter("event");

	int sno = 0;
	int startIndex = 0;
	startIndex = Integer.parseInt(request.getAttribute("startIndex").toString());
	System.out.println("sr----"+startIndex);
	int counter = 0;
%>



<%@page import="com.integrosys.cms.ui.geography.state.StateForm"%>
<%@page import="com.integrosys.cms.app.geography.state.trx.IStateTrxValue"%>
<%@page import="com.integrosys.cms.ui.geography.state.StateForm"%>
<%@page import="com.integrosys.cms.ui.geography.state.StateForm"%>
<%@page import="com.integrosys.cms.app.geography.state.trx.IStateTrxValue"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
	
    document.forms[0].action="ToDo.do?event=totrack";
    
    document.forms[0].submit();
}


//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='State.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="100%" height="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" >
				<tr>
					<td valign="top">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblFormSection">


					<tr>
						<td>
							<h3>
								View State
							</h3>
						</td>
					</tr>
					<tr>
						<td>
							<hr />
						</td>
					</tr>
							<tbody>
								<tr>
									<td colspan="4">
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="16%">State Code</td>
													<td width="30%">State Name</td>
													<td width="30%">Region Name</td>
												</tr>
											</thead>
											<tbody>
												<logic:present name="stateList">
													<logic:iterate id="ob" name="stateList"
													offset="<%=String.valueOf(startIndex)%>"
                               						length="<%=String.valueOf(10)%>"
														type="com.integrosys.cms.app.geography.state.bus.OBState"
														scope="page">
														<%
															String rowClass = "";
																			sno++;
																			if (sno % 2 != 0) {
																				rowClass = "odd";
																			} else {
																				rowClass = "even";
																			}
																			// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
														%>
														<tr class="<%=rowClass%>">
															<td class="index"><%=sno+startIndex%></td>
															<td><integro:empty-if-null value="<%=ob.getStateCode()%>" />&nbsp;
															</td>
															<td><integro:empty-if-null value="<%=ob.getStateName()%>" />
															</td>
															<td><integro:empty-if-null value="<%=ob.getRegionId().getRegionName()%>" />
															</td>																														
														</tr>
													</logic:iterate>
													<%
														if (sno == 0) {
													%>
													<tr class="odd">
														<td colspan="10">
															<bean:message key="label.global.not.found" />
														</td>
													</tr>
													<%
														}
													%>
												</logic:present>
												<logic:notPresent name="stateList">
													<tr class="odd">
														<td colspan="10">
															<bean:message key="label.global.not.found" />
														</td>
													</tr>
												</logic:notPresent>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="4">
									<br>
									<center><a href="javascript:cancelPage();"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
										src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
									</a></center>
									&nbsp;</td>
								</tr>
							</tbody>

						</table>
					</td>
				</tr>
				<logic:present name="stateList">
					<tr>
						<td height="25">
							<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
							<table id="generalPurposeBar" width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>

									<td width="3" valign="middle" style="padding-right: 5px">
										<img src="img/icon/seprate_bar.gif" />
									</td>
									<%
										String pageIndexUrl = null;
										pageIndexUrl = "State.do?event=maker_rejected_delete_read&TrxId="+transId+"&startIndex=";
									%>
												
									<td>
										&nbsp;
										<integro:pageindex
											pageIndex='<%=new PageIndex(startIndex, 10, sr.getNItems())%>'
											url='<%=pageIndexUrl%>' />
									</td>

								</tr>
							</table>
						</td>
					</tr>
				</logic:present>
			</table>


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
