

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
			com.integrosys.component.user.app.bus.ICommonUser,
			com.integrosys.component.user.app.constant.UserConstant,
			com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
			com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,
			com.integrosys.cms.ui.common.CountryList,
			com.integrosys.component.bizstructure.app.bus.ITeam,
			com.integrosys.cms.ui.common.constant.IGlobalConstant,
			com.integrosys.base.uiinfra.common.ICommonEventConstant,
			com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
			com.integrosys.base.techinfra.util.DateUtil,
			com.integrosys.base.techinfra.propertyfile.PropertyManager,
			java.util.HashMap,java.util.Locale,java.util.Arrays,java.util.HashMap,
			java.util.Locale,java.util.Arrays,com.integrosys.base.businfra.search.SearchResult,
			com.integrosys.base.uiinfra.tag.PageIndex,java.util.*,
			com.integrosys.cms.ui.holiday.MaintainHolidayForm,
			com.integrosys.cms.app.holiday.trx.IHolidayTrxValue,
			com.integrosys.cms.app.holiday.trx.OBHolidayTrxValue"%>
<%
	int rowMaxCount = 0;
	int totalRecords = 0;
	int errorRecords = 0;
	int validRecords = 0;
	String arowCount;
	HashMap errorList = null;
	String tvalidRecords = (String) request.getAttribute("validRecords");
	if (tvalidRecords != null)
		validRecords = Integer.parseInt(tvalidRecords);

	System.out.println("validRecords---" + validRecords);
	String fileType = (String) request.getAttribute("fileType");
	System.out.println("fileType---" + fileType);
	String preStatus = (String) request.getAttribute("fileUploadPending");
	System.out.println("fileUploadPending--" + preStatus);
	String fileCheckSum = (String) request.getAttribute("fileCheckSum");
	System.out.println("fileCheckSum--" + fileCheckSum);

	if (!fileType.equals("NOT_CSV") && !preStatus.equals("PENDING") && !fileCheckSum.equals("MISMATCH")) {
		errorList = (HashMap) request.getAttribute("errorList");
		System.out.println("errorList: " + errorList);
		arowCount = (String) request.getAttribute("rowCount");
		if (arowCount != null) {
			rowMaxCount = Integer.parseInt(arowCount);
		}
		System.out.println("rowMaxCount" + rowMaxCount);
		//System.out.println("rowMaxCount"+rowMaxCount);
		String event = request.getParameter("event");
		totalRecords = rowMaxCount - 2;
		if (errorList != null)
			errorRecords = errorList.size();

	}
	boolean showError = true;
	int sno = 0;
	int startIndex = 0;
	int counter = 0;
	System.out.println("fileCheckSum---------------");
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
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}

	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}
	function cancelPage() {

		document.forms[0].action = "user.do?event=maker_prepare_upload_user";

		document.forms[0].submit();
	}
	function downloadlog() {

		document.forms[0].action = "poiReport.do?event=generate_report_sms_upload&reportID=RPT0046";

		document.forms[0].submit();
	}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='holiday.do?'>
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="80%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">

			<tr>
				<td valign="top">
					<table width="80%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<thead>
							<br>
							<br>
							<tr>
								<td>
									<h3>Upload Confirmation Page</h3>
								</td>
							</tr>
							</br>
							<%
								if (fileType.equals("NOT_DAT")) {
							%>
							<tr class="odd">
								<td colspan="10"><bean:message
										key="label.global.userfile.format" /></td>
							</tr>
							<%
								} else if (preStatus.equals("PENDING")) {
							%>
							<tr class="odd">
								<td colspan="10"><bean:message key="label.global.file.wip" />
								</td>
							</tr>
							<%
								} else if (fileCheckSum.equals("MISMATCH")) {
							%>
							<tr class="odd">
								<td colspan="10"><bean:message
										key="label.global.file.mismatch" /></td>
							</tr>
							<%
								} else if (fileCheckSum.equals("MISMATCH_COL")) {
							%>
							<tr class="odd">
								<td colspan="10"><bean:message
										key="label.global.file.mismatch.col" /></td>
							</tr>
							<%
								} else {
							%>
							<tr class="odd">
								<td colspan="10"></br>Total Number Of Records: <%=totalRecords%>
									</br>Total Number Of Successful Records: <%=totalRecords - errorRecords%>
									</br>Total Number Of Unsuccessful Records: <%=errorRecords%>
								</td>
							</tr>
							<%
								}
							%>
							<tr>
								<td colspan="4">
									<hr />
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class="tblInfo">
										<thead>
											<tr>
												<td width="5%">S/N</td>
												<td width="16%">File row no.</td>
												<td width="30%">Column</td>
												<td width="16%">Error</td>
												<td width="16%">Employee Code</td>
											</tr>
										</thead>
										<tbody>
											<%
												for (int i = 0; i < rowMaxCount; i++) {

														String rowClass = "";
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														String[][] errorData = new String[errorList.size()][4];
														errorData = (String[][]) errorList.get(new Integer(i));
														//	System.out.println("errorData::::::::::::::::::::::::::::::::::::::::::::::::::::"+errorData);
														if (errorData != null) {
															//	System.out.println("eeeeeeeeeeeeeeeeerrorData:::::::::::::::::"+errorData[i][0]+":::::::::::"+errorData[i][1]+":::::::::::::::::::::::::::"+errorData[i][2]+"::::::::::::::::"+errorData[i][3]);
															for (int j = 0; j <= errorData.length - 1; j++) {
																if (errorData[j][0] != null) {
																	//	System.out.println(errorData[j][0]+" Value: " +errorData[j][1]);
																	sno++;
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=sno%></td>
												<td><%=i%>&nbsp;</td>
												<td><integro:empty-if-null value="<%=errorData[j][0]%>" />&nbsp;
												</td>
												<td><integro:empty-if-null value="<%=errorData[j][1]%>" />&nbsp;
												</td>
												<td><integro:empty-if-null value="<%=errorData[j][2]%>" />&nbsp;
												</td>
											</tr>

											<%
												}
															}
														}
													}
											%>

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
												<td></td>
											</tr>
											<tr>
												<td>


													<table width="130" border="0" align="center"
														cellpadding="0" cellspacing="0">
														<tr>
															<td width="65">&nbsp;</td>
															<td width="65">&nbsp;</td>
														</tr>
														<tr>
															<td colspan="2"><a href="#"
																onmouseout="MM_swapImgRestore()"
																onmouseover="MM_swapImage('Image3311','','img/download.jpg',1)"
																onClick="downloadlog()"> <img src="img/download.jpg"
																	name="Image3311" border="0" id="Image3311"
																	style="display: none;" />
															</a> &nbsp;&nbsp;</td>
															<td>
																<center>
																	<a href="javascript:cancelPage();"
																		onmouseout="MM_swapImgRestore()"
																		onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
																		src="img/return1.gif" name="Image4411" border="0"
																		id="Image4411" /> </a>
																</center> &nbsp;
															</td>

														</tr>
														<tr>
															<td>&nbsp;</td>
															<td>&nbsp;</td>
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
				</td>
			</tr>

		</table>


		<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
