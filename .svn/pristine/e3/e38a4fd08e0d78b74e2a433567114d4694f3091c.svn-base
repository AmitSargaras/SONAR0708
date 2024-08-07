<%@ page
	import="com.integrosys.cms.app.feed.bus.gold.IGoldFeedGroup,
	com.integrosys.cms.app.feed.trx.gold.IGoldFeedGroupTrxValue,
	com.integrosys.cms.ui.common.CurrencyList,java.util.HashMap,
	com.integrosys.cms.ui.feed.gold.list.GoldListForm,
	com.integrosys.cms.ui.feed.gold.list.GoldListAction,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.cms.app.feed.bus.gold.IGoldFeedEntry,java.util.List,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.cms.ui.feed.FeedUtils,
	com.integrosys.cms.ui.collateral.CategoryCodeConstant,
	com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%
	// Get the gold feed group trx value from session.
	IGoldFeedGroupTrxValue feedGroupTrxValue = (IGoldFeedGroupTrxValue) session
			.getAttribute("com.integrosys.cms.ui.feed.gold.GoldAction.goldFeedGroupTrxValue");

	String lastActionBy = feedGroupTrxValue.getUserInfo();
	String lastRemarksMade = feedGroupTrxValue.getRemarks();
	if (lastRemarksMade == null) {
		lastRemarksMade = "";
	}

	String status = feedGroupTrxValue.getStatus();
	boolean forApproveAndReject = status.equals(ICMSConstant.STATE_PENDING_UPDATE);
	//boolean forClose = status.equals(ICMSConstant.STATE_REJECTED);

	// Get the staging feed group.
	IGoldFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingGoldFeedGroup();
	// Get the actual feed group.
	IGoldFeedGroup actualFeedGroup = feedGroupTrxValue.getGoldFeedGroup();

	pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

	GoldListForm actionForm = (GoldListForm) pageContext.findAttribute("goldListForm");

	if (actionForm == null) {
		DefaultLogger.debug(this, "actionForm is null.");
	}

	String event = actionForm.getEvent();
	if (event.equals(GoldListAction.EVENT_READ_CHECKER_APPROVE_REJECT)) {
		event = GoldListAction.EVENT_LIST_CHECKER_APPROVE_REJECT;
	}
	else if (event.equals(GoldListAction.EVENT_READ_MAKER_CLOSE)) {
		event = GoldListAction.EVENT_LIST_MAKER_CLOSE;
	}

	// Get the record markers.
	//int offset = Integer.parseInt(actionForm.getOffset());
	//int length = Integer.parseInt(actionForm.getLength());
	int offset = ((Integer) session.getAttribute("com.integrosys.cms.ui.feed.gold.GoldAction.offset"))
			.intValue();
	int length = ((Integer) session.getAttribute("com.integrosys.cms.ui.feed.gold.GoldAction.length"))
			.intValue();
	//int targetOffset = Integer.parseInt(actionForm.getTargetOffset());

	String cssClass = "odd";

	CurrencyList currencyList = CurrencyList.getInstance();

	/*
	 DefaultLogger.debug(this, "actual:");
	 for (int r = 0; r < actualFeedGroup.getFeedEntries().length; r++) {
	 DefaultLogger.debug(this, "buy rate " + r + " = " + String.valueOf(actualFeedGroup.getFeedEntries()[r].getBuyRate()));
	 DefaultLogger.debug(this, "ref " + r + " = " + String.valueOf(actualFeedGroup.getFeedEntries()[r].getGoldFeedEntryRef()));
	 }
	 DefaultLogger.debug(this, "staging:");
	 for (int s = 0; s < stagingFeedGroup.getFeedEntries().length; s++) {
	 DefaultLogger.debug(this, "buy rate " + s + " = " + String.valueOf(stagingFeedGroup.getFeedEntries()[s].getBuyRate()));
	 DefaultLogger.debug(this, "ref " + s + " = " + String.valueOf(stagingFeedGroup.getFeedEntries()[s].getGoldFeedEntryRef()));
	 }

	 DefaultLogger.debug(this, "control reached here.");
	 */
	List compareResultsList = (List) session
			.getAttribute("com.integrosys.cms.ui.feed.gold.GoldAction.compareResultsList");
	pageContext.setAttribute("compareResultsList", compareResultsList);

	int totalEntries = compareResultsList.size();

	DefaultLogger.debug(this, "offset = " + offset);
	DefaultLogger.debug(this, "length = " + length);
	DefaultLogger.debug(this, "total entries = " + totalEntries);

	HashMap goldGradeCodeMap = new HashMap();
	HashMap goldUOMCodeMap = new HashMap();
	goldGradeCodeMap = CommonDataSingleton
			.getCodeCategoryValueLabelMap(CategoryCodeConstant.CATEGORY_GOLD_GRADE);
	goldUOMCodeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.CATEGORY_GOLD_UOM);
%>


<html>
<!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceBeginEditable name="Cssstyle" -->


<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function gotopage(aLocation) {
window.location = aLocation;
}

function approve() {
document.forms[0].event.value = "<%=GoldListAction.EVENT_APPROVE%>"
document.forms[0].submit();
}
function reject() {
document.forms[0].event.value = "<%=GoldListAction.EVENT_REJECT%>"
document.forms[0].submit();
}
function closeForm() {
document.forms[0].event.value = "<%=GoldListAction.EVENT_CLOSE%>"
document.forms[0].submit();
}
function goPageIndex(targetOffset) {
document.forms[0].event.value = "<%=event%>"
document.forms[0].targetOffset.value = targetOffset;
document.forms[0].submit();
}

//-->
    </script>
<!-- InstanceEndEditable -->
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp"%>
<br>


<html:form action="feed_gold_list.do">
	<input type="hidden" name="event" />
	<%-- Fake value. --%>
	<input type="hidden" name="targetOffset" value="<%=offset%>" />


	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<!--DWLayoutTable-->


		<tr id="envCanvas">

			<td width="100%" valign="top" id="envCanvasContent">
			<table id="window" border="0" cellpadding="0" cellspacing="0">


				<tr id="winCanvas">
					<td>

					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0" id="contentWindow">
						<!--DWLayoutTable-->


						<tr>
							<td colspan="3" valign="top" style="height: 100%; width: 100%;">
							<div id="contentCanvas"
								style="height: 100%; width: 100%; border: 0"><!-- InstanceBeginEditable name="contentCanvas" -->

							<table width="98%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="tblFormSection" style="margin-top: 10px">
								<thead>
									<tr>
										<td height="34">
										<h3>Process Gold</h3>
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<hr />
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="2">
										<table id="tblGold" width="100%" border="0" cellpadding="0"
											cellspacing="0" class="tblinfo" style="margin-top: 0">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="25%">Gold Grade</td>
													<td width="17%">Unit of Measurement</td>
													<td width="18%">Currency Code</td>
													<td width="15%">Updated Unit Price&nbsp;<font
														color="#00AAFF">* </font></td>
													<td width="20%">Last Updated Date</td>
												</tr>
											</thead>
											<tbody>

												<%
													// Check that offset + length cannot exceed the total.
														int iterateLength = 0;
														if (offset + length > totalEntries) {
															iterateLength = totalEntries - offset;
														}
														else {
															iterateLength = length;
														}
												%>
												<logic:iterate id="result" name="compareResultsList"
													indexId="counter" offset="<%=String.valueOf(offset)%>"
													length="<%=String.valueOf(iterateLength)%>"
													type="com.integrosys.base.techinfra.diff.CompareResult">
													<%
														IGoldFeedEntry feedEntry = (IGoldFeedEntry) result.getObj();

																		String originalUnitPrice = null;
																		String updatedPrice = FeedUtils.padFractionDigits(String.valueOf(feedEntry.getUnitPrice()),
																				1, 2);

																		if (result.isAdded()) {
																			updatedPrice = originalUnitPrice = String.valueOf(feedEntry.getUnitPrice());
																		}
																		else if (result.isModified()) {
																			// Get the original value from the original obj.
																			originalUnitPrice = String.valueOf(((IGoldFeedEntry) result.getOriginal())
																					.getUnitPrice());
																		}
																		else if (result.isUnmodified()) {
																			// Original value still the same.
																			originalUnitPrice = String.valueOf(feedEntry.getUnitPrice());
																		}
																		else if (result.isDeleted()) {
																			// The obj is the deleted entry itself, so original should come from that.
																			originalUnitPrice = "";
																		}

																		originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
																		updatedPrice = FeedUtils.padFractionDigits(String.valueOf(updatedPrice), 1, 2);

																		DefaultLogger.debug(this, "counter is now " + counter.intValue());

																		DefaultLogger.debug(this, "ref id of getObj = " + feedEntry.getGoldFeedEntryRef());
													%>
													<tr class="<%=cssClass%>">
														<td class="<%=result.getKey()%>" valign="top"><%=counter.intValue() + 1%></td>
														<td>&nbsp;<integro:empty-if-null
															value="<%=goldGradeCodeMap.get(feedEntry.getGoldGradeNum())%>" /></td>
														<td>&nbsp;<integro:empty-if-null
															value="<%=goldUOMCodeMap.get(feedEntry.getUnitMeasurementNum())%>" /></td>
														<td>&nbsp;<integro:empty-if-null
															value="<%=currencyList.getCountryName(feedEntry.getCurrencyCode())%>" />
														<td class="amount">&nbsp;<integro:empty-if-null
															value="<%=updatedPrice%>" /></td>
														<td style="text-align: center">&nbsp;<integro:date
															object="<%=feedEntry.getLastUpdatedDate()%>" /></td>
													</tr>

													<%
														if (cssClass.equals("odd")) {
																			cssClass = "even";
																		}
																		else {
																			cssClass = "odd";
																		}
													%>
												</logic:iterate>
											</tbody>
										</table>
										</td>
									<tr>
										<td colspan="2">&nbsp;</td>
									</tr>


									</tr>
									<tr>
										<td>
										<table width="100%" border="0" align="center" cellpadding="0"
											cellspacing="0" class="tblInfo">
											<tbody>
												<tr>
													<td class="fieldname">Remarks</td>
													<td class="odd"><html:textarea property="remarks" rows="4" style="width:90%" /> 
													<html:errors property="remarks" /></td>
												</tr>
												<tr>
													<td class="fieldname">Last Action By</td>
													<td class="even">&nbsp;<integro:empty-if-null
														value="<%=lastActionBy%>" /></td>
												</tr>
												<tr class="odd">
													<td class="fieldname">Last Remarks Made</td>
													<td>&nbsp;<integro:wrapper
														value="<%=lastRemarksMade%>" /></td>
												</tr>
											</tbody>
										</table>
										</td>

									</tr>

								</tbody>
							</table>

							<%
								if (forApproveAndReject) {
							%>
							<table width="150" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td valign="baseline" align="center">&nbsp;</td>
									<td valign="baseline" align="center">&nbsp;</td>
									<td valign="baseline" align="center">&nbsp;</td>
								</tr>
								<tr>
									<td><a href="#" onclick="approve()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
										src="img/approve1.gif" name="Image8" width="80" height="20"
										border="0" id="Image8" /></a></td>
									<td><a href="#" onclick="reject()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
										src="img/reject1.gif" name="Image9" width="70" height="20"
										border="0" id="Image9" /></a></td>
									<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img
										src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a>
									</td>
								</tr>
								<tr>
									<td valign="baseline" align="center">&nbsp;</td>
									<td valign="baseline" align="center">&nbsp;</td>
									<td valign="baseline" align="center">&nbsp;</td>
								</tr>
							</table>
							<%
								}
							%> <!-- InstanceEndEditable --></div>
							</td>
						</tr>

						<tr>
							<td>
							<table id="generalPurposeBar" width="100%"
								style="margin-left: 10px" border="0" cellspacing="0"
								cellpadding="5" align="center">

								<tr>
									<td valign="middle"><integro:pageindex
										pageIndex="<%=new PageIndex(offset, length, compareResultsList.size())%>"
										url="feed_gold_list.do" submitFlag="true" /></td>
								</tr>
							</table>

							</td>
						</tr>
					</table>

					</td>
				</tr>


			</table>
			</td>
		</tr>


	</table>


</html:form>

</body>
<!-- InstanceEnd -->
</html>