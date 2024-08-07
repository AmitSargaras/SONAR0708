<%@ page
	import="com.integrosys.cms.app.feed.bus.gold.IGoldFeedGroup,
	com.integrosys.cms.app.feed.trx.gold.IGoldFeedGroupTrxValue,
	com.integrosys.cms.ui.common.CurrencyList,java.util.HashMap,
	java.math.BigDecimal,com.integrosys.cms.ui.feed.gold.list.GoldListForm,
	com.integrosys.cms.ui.feed.gold.list.GoldListAction,
	com.integrosys.cms.ui.feed.gold.item.GoldItemAction,
	com.integrosys.base.techinfra.logger.DefaultLogger,java.util.Enumeration,
	com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.cms.app.feed.bus.gold.IGoldFeedEntry,
	com.integrosys.cms.app.common.util.CommonUtil,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.cms.ui.feed.gold.list.GoldListMapper,
	com.integrosys.cms.ui.feed.FeedUtils,
	com.integrosys.cms.ui.common.UIUtil,
	com.integrosys.cms.ui.collateral.CategoryCodeConstant,
	com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>


<html>
<head>
<title>Untitled Document</title>


<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function gotopage(aLocation) {
    window.location = aLocation;
}

function addNew() {
    document.forms[0].event.value = "<%=GoldListAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=GoldListAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=GoldListAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=GoldListAction.EVENT_SAVE%>"
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=GoldListAction.EVENT_PAGINATE%>"
    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}

//-->
    </script>
</head>
<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp"%>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top"><!-- Content --> <%

    GoldListForm actionForm = (GoldListForm) pageContext.findAttribute("goldListForm");

    String event = actionForm.getEvent();

    // Get the gold feed group trx value from session.
    IGoldFeedGroupTrxValue feedGroupTrxValue = (IGoldFeedGroupTrxValue) session.
            getAttribute("com.integrosys.cms.ui.feed.gold.GoldAction.goldFeedGroupTrxValue");

    IGoldFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingGoldFeedGroup();

    IGoldFeedGroup actualFeedGroup = feedGroupTrxValue.getGoldFeedGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    int offset = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.gold.GoldAction.offset")).intValue();
    int length = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.gold.GoldAction.length")).intValue();

    /*CurrencyList currencyList = CurrencyList.getInstance();
    HashMap currenciesMap = currencyList.getCurrencyList();*/
    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
    
    HashMap goldGradeCodeMap = new HashMap();
    HashMap goldUOMCodeMap = new HashMap();
    goldGradeCodeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.CATEGORY_GOLD_GRADE);
    goldUOMCodeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.CATEGORY_GOLD_UOM);
    
    System.out.println("event = "+event);
%> <html:form action="feed_gold_list.do">
			<input type="hidden" name="event" />
			<%-- Fake value. --%>
			<input type="hidden" name="targetOffset" value="<%=offset%>" />


			<table width="98%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection" style="margin-top: 10px">
				<thead>
					<tr>
						<td height="34">
						<h3>Gold</h3>
						</td>
						<td align="right" valign="bottom">
						<table width="50" border="0" align="right" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="100" valign="bottom" align="center"><input
									type="button" name="Submit" value="<bean:message key='label.add.new'/>" class="btnNormal"
									onclick="addNew()" /></td>
								<td width="100" valign="bottom" align="center">
								<%if (stagingFeedGroup.getFeedEntries().length != 0) {%> &nbsp; <input
									type="button" name="Submit2" value="Remove" class="btnNormal"
									onclick="remove()" /> <html:errors property="chkDeletes" /> <%}%>
								</td>
							</tr>
						</table>
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
									<td width="5%"><bean:message key="label.global.sn"/></td>
									<td><bean:message key="label.feed.gold.grade"/></td>
									<td><bean:message key="label.feed.gold.unit.of.measurement"/></td>
									<td><bean:message key="label.currency.code"/></td>
									<td><bean:message key="label.feed.gold.unit.price"/>&nbsp;<bean:message key="label.mandatory"/></td>
									<td><bean:message key="label.global.last.updated.date"/></td>
									<td><bean:message key="label.global.delete"/></td>
								</tr>
							</thead>
							<tbody>

								<%
                    // Check that offset + length cannot exceed the total.
                    int iterateLength = 0;
                    if (offset + length > totalEntries) {
                        iterateLength = totalEntries - offset;
                    } else {
                        iterateLength = length;
                    }

                    String[] chkDeletesArr = actionForm.getChkDeletes();
                    int[] deletesArr = new int[ chkDeletesArr == null ?
                            0 : chkDeletesArr.length];

                    for (int i = 0; i < deletesArr.length; i++) {
                        deletesArr[i] = Integer.parseInt(chkDeletesArr[i]);
                    }
                %>
								<%
                    if (iterateLength == 0) {
                %>
								<tr>
									<td colspan="8" class="odd"><bean:message
										key="label.global.not.found" /></td>
								</tr>
								<%
                    }
                %>
								<logic:iterate id="feedEntry" name="stagingFeedGroup"
									property="feedEntries" offset="<%=String.valueOf(offset)%>"
									length="<%=String.valueOf(iterateLength)%>" indexId="counter"
									type="com.integrosys.cms.app.feed.bus.gold.IGoldFeedEntry">

									<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
										<td class="index" valign="top"><%=counter.intValue() + 1%>
										</td>
										<td>&nbsp;<integro:empty-if-null
											value="<%=goldGradeCodeMap.get(feedEntry.getGoldGradeNum())%>" /> 
											<input type="hidden" name="goldGrade"
											value="<%=feedEntry.getGoldGradeNum()%>"/></td>
										<td>&nbsp;<integro:empty-if-null
											value="<%=goldUOMCodeMap.get(feedEntry.getUnitMeasurementNum())%>" />
											<input type="hidden" name="unitMeasurement"
											value="<%=feedEntry.getUnitMeasurementNum()%>"/></td>
										<td>&nbsp;<integro:empty-if-null
											value="<%=feedEntry.getCurrencyCode()%>" /> <input
											type="hidden" name="currencyCodes"
											value="<%=feedEntry.getCurrencyCode() %>"/></td>

										<td class="amount"><input name="updatedUnitPrices"
											type="text"
											value="<%=FeedUtils.padFractionDigits(actionForm.getUpdatedUnitPrices(counter.intValue()-offset), 1, 2)%>"
											size="14" class="currency" maxlength="15" /> <html:errors
											property="<%=\"updatedUnitPrices.\"+String.valueOf(counter.intValue() - offset)%>" />
										</td>
										<td style="text-align: center">&nbsp;<integro:date
											object="<%=feedEntry.getLastUpdatedDate()%>" /></td>
										<td style="text-align: center"><input type="checkbox"
											name="chkDeletes"
											<%=GoldListMapper.inArray(counter.intValue(), deletesArr) ? "checked" : ""%>
											value="<%=counter.intValue()%>" /></td>
									</tr>
								</logic:iterate>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
			<%
    if (feedGroupTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) {
        String lastActionBy = feedGroupTrxValue.getUserInfo();
        String lastRemarksMade = feedGroupTrxValue.getRemarks();
        if (lastRemarksMade == null) {
            lastRemarksMade = "";
        }

%>
			<table width="98%" border="0" align="center" cellpadding="0"
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
						<td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>" /></td>
					</tr>
				</tbody>
			</table>
			<% } %>

			<table width="150" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="75" valign="baseline" align="center"><a href="#"
						onclick="submitForm()" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img
						src="img/submit1.gif" name="Image3" width="75" height="22"
						border="0" id="Image3" /> </a></td>
					<td width="75" valign="baseline" align="center"><a href="#"
						onclick="save()" onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img
						src="img/save1.gif" name="Image3311" border="0" id="Image331" />
					</a></td>
					<td width="75" valign="baseline" align="center">
					<%if ("readMakerEdit".equals(event)) { %><a href="ToDo.do"
						onmouseout="MM_swapImgRestore()"
						onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img
						src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a><%} %></td>
					
				</tr>
				<tr>
					<td valign="baseline" align="center" colspan="3">&nbsp;</td>
				</tr>
			</table>

		</html:form></td>
	</tr>
	<!-- End Content -->

	<!-- General Purpose Bar -->

	<tr>
		<td height="25">


		<table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
			cellpadding="5" align="center">

			<tr>
				<td valign="middle"><integro:pageindex
					pageIndex="<%=new PageIndex(offset, length, stagingFeedGroup.getFeedEntries().length)%>"
					url="feed_gold_list.do" submitFlag="true" /></td>
			</tr>
		</table>

		</td>
	</tr>

</table>

</body>
</html>