
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.*,com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchForm,com.integrosys.cms.app.systemBankBranch.trx.ISystemBankBranchTrxValue,com.integrosys.cms.app.systemBankBranch.trx.OBSystemBankBranchTrxValue"%>
<%
	MaintainSystemBankBranchForm systemBankBranchForm = (MaintainSystemBankBranchForm) request
			.getAttribute("MaintainSystemBankBranchForm");
	ISystemBankBranchTrxValue systemBankBranchTrx = (ISystemBankBranchTrxValue) session
			.getAttribute("com.integrosys.cms.ui.systemBankBranch.MaintainSystemBankBranchAction.ISystemBankBranchTrxValue");

	SearchResult sr = (SearchResult) request
			.getAttribute("systemBankBranchList");

	

	if (sr != null) {
		List systemBankBranchList = new ArrayList(sr.getResultList());
		pageContext.setAttribute("systemBankBranchList",
				systemBankBranchList);
	}

	String event = request.getParameter("event");

	int sno = 0;
	int startIndex = 0;
	String transId = (String) request.getAttribute("TrxId");
	startIndex = Integer.parseInt(request.getAttribute("startIndex")
			.toString());
	System.out.println("sr----" + startIndex);
	int counter = 0;
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
	<body>
		<html:form action='systemBankBranch.do?'>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<tr>
					<td valign="top">


						<!-- InstanceBeginEditable name="Content" -->

						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblFormSection">


							<tr>
								<td>
									<h3>
										View System Bank Branch
									</h3>
								</td>
							</tr>
							<tbody>
								<tr>
									<td colspan="4">
										<table width="100%" border="0" cellspacing="0" cellpadding="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">
														S/N
													</td>
													<td width="16%">
														Branch Code
													</td>
													<td width="30%">
														Branch Name
													</td>
													<td width="16%">
														Bank Code
													</td>
													<td width="30%">
														Bank Name
													</td>
													<td width="16%">
														City
													</td>
													<td width="16%">
														State
													</td>
													<td width="16%">
														Region
													</td>
													<td width="16%">
														Country
													</td>
												</tr>
											</thead>
											<tbody>
												<logic:present name="systemBankBranchList">
													<logic:iterate id="ob" name="systemBankBranchList"
														offset="<%=String.valueOf(startIndex)%>"
														length="<%=String.valueOf(10)%>"
														type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"
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
															<td class="index"><%=sno%></td>
															<td><%=ob.getSystemBankBranchCode()%>&nbsp;
															</td>
															<td><%=ob.getSystemBankBranchName()%>&nbsp;
															</td>
															<td><%=ob.getSystemBankCode()
											.getSystemBankCode()%>&nbsp;
															</td>
															<td><%=ob.getSystemBankCode()
											.getSystemBankName()%>&nbsp;
															</td>
															<td><%=ob.getCityTown().getCityName()%>&nbsp;
															</td>
															<td><%=ob.getState().getStateName()%>&nbsp;
															</td>
															<td><%=ob.getRegion().getRegionName()%>&nbsp;
															</td>
															<td><%=ob.getCountry().getCountryName()%>&nbsp;
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
												<logic:notPresent name="systemBankBranchList">
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
									<td>
										<table width="100%" border="0" align="center" cellpadding="0"
											cellspacing="0" class="tblFormSection">

											<tbody>
												<tr>
													<td><br><br></td>
												</tr>
												<tr>
													<td>
														<table width="100%" border="0" align="center"
															cellpadding="0" cellspacing="0" class="tblInfo">
															<tbody>
																<tr>
																	<td class="fieldname">
																		Remarks
																	</td>
																	<td class="odd">
																		<textarea name="remarks" rows="4" style="width: 90%"></textarea>
																	</td>
																</tr>
																<tr>
																	<td class="fieldname">
																		Last Action By
																	</td>
																	<td class="even"><%=systemBankBranchTrx.getUserInfo()%>&nbsp;
																	</td>
																</tr>
																<tr class="odd">
																	<td class="fieldname">
																		Last Remarks Made
																	</td>
																	<td><%=systemBankBranchTrx.getRemarks() != null ? systemBankBranchTrx
								.getRemarks()
								: ""%>&nbsp;
																	</td>
																</tr>
															</tbody>
														</table>
														<table width="130" border="0" align="center"
															cellpadding="0" cellspacing="0">
															<tr>
																<td width="65">
																	&nbsp;
																</td>
																<td width="65">
																	&nbsp;
																</td>
															</tr>
															<tr>


																<td colspan="4">
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
														</table>
													</td>
												</tr>

											</tbody>
										</table>
									</td>
								</tr>

							</tbody>
						</table>
						<!-- InstanceEndEditable -->

	<logic:present name="systemBankBranchList">
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
									String alphaIndexUrl = null;
									pageIndexUrl = "systemBankBranch.do?event=maker_rejected_delete_read&TrxId="
											+ transId + "&startIndex=";
									alphaIndexUrl = "systemBankBranch.do?event=maker_rejected_delete_read&TrxId="
											+ transId + "&loginId=";
						%>

						<td>
							&nbsp;
							<integro:alphaindex url='<%=alphaIndexUrl%>' />
						</td>
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
	</td>
	</tr>
	</table>
	</html:form>
	</body>
	
	<!-- InstanceEnd -->
</html>
