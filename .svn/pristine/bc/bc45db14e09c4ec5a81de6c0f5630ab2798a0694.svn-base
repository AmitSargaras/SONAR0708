<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.user.MaintainUserForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 com.integrosys.component.user.app.bus.CommonUserSearchCriteria,
                 java.util.*,
                 java.util.Vector"%>

<%
	SearchResult searchResult = (SearchResult) session
			.getAttribute("com.integrosys.cms.ui.segmentWiseEmail.SegmentWiseEmailAction.segmentWiseEmailList");


	HashMap segmentMap = (HashMap)request.getAttribute("segmentMap");
	System.out.println("<<<<<<>>>>>>"+segmentMap.entrySet());
	pageContext.setAttribute("segmentMap", segmentMap);
	
	int counter = 1;
	int noofItems = 0;
	int index = 0;

	int startInd = 0;

	int sno = 0;
	int startIndex = 0;
	String ind = (String) request.getAttribute("startIndex");
	if (ind == null || ind.equals("null"))
		startIndex = 0;
	else
		startIndex = Integer.parseInt(ind);

	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;
	if (searchResult != null) {
		resultList = searchResult.getResultList();
		startInd = searchResult.getStartIndex();
		totalCount = searchResult.getNItems();
		listSize = resultList.size();
		pageContext.setAttribute("segmentWiseEmailListSize", Integer.toString(listSize));
		pageContext.setAttribute("segmentWiseEmailList", resultList);
	} else
		System.out.print("searchResult : " + searchResult);

	String event = request.getParameter("event");
%>





<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%><html>
<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" -->
<!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" -->
<!-- InstanceParam name="contentHeight" type="text" value="100%" -->
<!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
<!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

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

	function MM_jumpMenu(targ, selObj, restore) { //v3.0
		eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value
				+ "'");
		if (restore)
			selObj.selectedIndex = 0;
	}

	function gotopage(aLocation) {
		window.location.href = aLocation;
	}
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='segmentWiseEmail.do?'>
	<html:hidden property="event" />
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<!-- InstanceBeginEditable name="menuScript" -->
		<!-- InstanceEndEditable -->
		<table width="100%" height="100%" cellspacing="0" cellpadding="0"
			border="0">

			<tr>
				<td valign="top">
					<table width="70%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<thead>

							<tr>
								<br>
								<td width="82%"><h4>Segment Wise Email ID Mapping</h4></td>
								<td width="18%" align="right" valign="bottom"></td>
								<td>&nbsp;</td>

								<td>&nbsp;</td>

							</tr>
							<tr>
								<td colspan="4"></td>
							</tr>

						</thead>
						<tbody>
							<tr>
								<td colspan="4"><table width="100%" border="0"
										cellspacing="0" cellpadding="0" class="tblInfo">
										<thead>
											<tr>
												<td width="5%">S/N</td>
												<td width="16%">Segment</td>
												<td width="16%">Count of Email Ids mapped</td>
												<td width="10%">Action</td>
											</tr>
										</thead>
										<tbody>
													<% 
													TreeMap<String, Integer> sorted = new TreeMap<String, Integer>(); 
													sorted.putAll(segmentMap); 
													
													Set set = sorted.entrySet(); 
													Iterator itr = set.iterator(); 
													
													while (itr.hasNext())
													{
														Map.Entry<String, Integer> entry = (Map.Entry<String, Integer>)itr.next();
													%>
													<%
														String rowClass = "";
														sno++;
														if (sno % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
													%>
													
													<tr class="<%=rowClass%>">
														<td class="index"><%=sno + startIndex%></td>
														<td><%=entry.getKey()%></td>
														<td><%=entry.getValue()%></td>
														<td><select name="menu1"
															onchange="MM_jumpMenu('self',this,0)" style="width: 110">
																<option value="#" selected>Please Select</option>
																<%
																if ((event.equals("checker_list_segment_wise_email")) || event.equals("checker_list_pagination")) {
																	if(entry.getValue()>0){%>
																		<option
																			value='segmentWiseEmail.do?event=checker_view_segment_wise_email&segment=<%=entry.getKey()%>&startIndex=<%=startIndex%>'>View</option>
																<%}
																} else {
																	if(entry.getValue()>0){
																%>
																	<option
																		value='segmentWiseEmail.do?event=maker_edit_segment_wise_email_read&segment=<%=entry.getKey()%>&startIndex=<%=startIndex%>'>Add</option>
																	<option
																		value='segmentWiseEmail.do?event=maker_view_segment_wise_email&segment=<%=entry.getKey()%>&startIndex=<%=startIndex%>'>View</option>
																	<option 
																		value='segmentWiseEmail.do?event=maker_delete_segment_wise_email_read&segment=<%=entry.getKey()%>&startIndex=<%=startIndex%>'>Delete</option>
																<%	}else{%>
																	<option 
																		value='segmentWiseEmail.do?event=maker_prepare_create_segment_wise_email&segment=<%=entry.getKey()%>&startIndex=<%=startIndex%>'>Add</option>
																	<option disabled="disabled"
																		value='segmentWiseEmail.do?event=maker_view_segment_wise_email&segment=<%=entry.getKey()%>&startIndex=<%=startIndex%>'>View</option>
																	<option disabled="disabled"
																		value='segmentWiseEmail.do?event=maker_delete_segment_wise_email_read&segment=<%=entry.getKey()%>&startIndex=<%=startIndex%>'>Delete</option>
																	<%
																	}
																}
																%>
															</select>
														</td>
													</tr>
													<%} %>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table> <!-- InstanceEndEditable -->
				</td>
			</tr>
		<%-- 	<logic:present name="segmentWiseEmailList">
				<tr>
					<td height="25">
						<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
						<table id="generalPurposeBar" width="100%" border="0"
							cellspacing="0" cellpadding="0">
							<tr>




								<td width="3" valign="middle" style="padding-right: 5px"><img
									src="img/icon/seprate_bar.gif" /></td>


								<%
									String pageIndexUrl = null;

											pageIndexUrl = "segmentWiseEmail.do?event=list_pagination&startIndex=";
											System.out.println(pageIndexUrl);
								%>
								<td width="86" valign="middle">&nbsp;<integro:pageindex
										pageIndex='<%=new PageIndex(startIndex, 10, listSize)%>'
										url='<%=pageIndexUrl%>' />

								</td>

							</tr>
						</table>
					</td>
				</tr>
			</logic:present> --%>
		</table>

	</body>
</html:form>
<!-- InstanceEnd -->
</html>
