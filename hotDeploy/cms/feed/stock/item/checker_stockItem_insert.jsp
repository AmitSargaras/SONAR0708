<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.base.businfra.search.SearchResult,
	com.integrosys.base.uiinfra.tag.PageIndex,
	java.util.*,com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,
	java.util.List,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,
	java.util.Locale,java.util.Arrays,
	com.integrosys.cms.ui.feed.stock.item.StockItemForm,
	com.integrosys.cms.app.feed.trx.stock.IStockFeedGroupTrxValue,
	com.integrosys.cms.app.feed.trx.stock.OBStockFeedGroupTrxValue,
	com.integrosys.cms.app.feed.bus.stock.OBStockFeedEntry,
	com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry,
    java.text.DateFormat,
    java.text.SimpleDateFormat" %>
<%
DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
	StockItemForm stockItemForm = (StockItemForm) request.getAttribute("stockItemForm");

	IStockFeedGroupTrxValue stockFeedGroupTrxValue = (IStockFeedGroupTrxValue) session.getAttribute("com.integrosys.cms.ui.feed.stock.StockAction.stockFeedGroupTrxValue");
    System.out.println("stockFeedGroupTrxValue----"+session.getAttribute("stockFeedGroupTrxValue"));

	SearchResult sr = (SearchResult) request
			.getAttribute("stockFeedEntryList");

	if (sr != null) {
		List stockFeedEntryList = new ArrayList(sr.getResultList());
		pageContext.setAttribute("stockFeedEntryList",
				stockFeedEntryList);
	}

	String transId=(String)request.getAttribute("TrxId"); 
	String event = request.getParameter("event");

System.out.println("transId----"+transId);
System.out.println("event----"+event);

	int sno = 0;
	int startIndex = 0;
	startIndex = Integer.parseInt(request.getAttribute("startIndex").toString());
	System.out.println("sr----"+startIndex);
	int counter = 0;

	String submitEvent = "checker_approve_insert";

	String rejectEvent = "checker_reject_insert";
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
    document.forms[0].action="feed_stock_item.do?event=maker_list_stockRateItem";
    
    document.forms[0].submit();
}
function approvePage() {
	
    document.forms[0].action="feed_stock_item.do?event=<%=submitEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="feed_stock_item.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}

//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='systemBank.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="100%" height="100%" cellspacing="0" cellpadding="0"
				border="0">

				<tr>
					<td valign="top">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblFormSection">
							<tr>
							<td>
								<h3>
									Process Shares
							</h3>
						</td>
						</tr>
								<tr>
									<td colspan="4">
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
													<td width="5%">
														S/N
													</td>
													<td width="15%">
														Scrip Code
													</td>
													<td width="15%">
														Scrip Name
													</td>
													<td width="15%">
														Scrip Value (INR)
													</td>
													<td width="15%">
														Face Value (INR)
													</td>
													<td width="15%">
													  Name of the Share
													</td>
													<td width="20%">
													   Last Updated Date
													</td>

												</tr>
											</thead>
											<tbody>
												<logic:present name="stockFeedEntryList">
													<logic:iterate id="ob" name="stockFeedEntryList"
													offset="<%=String.valueOf(startIndex)%>"
                               						length="<%=String.valueOf(10)%>"
														type="com.integrosys.cms.app.feed.bus.stock.OBStockFeedEntry"
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
															
															<td><integro:empty-if-null value="<%=ob.getScriptCode()%>"/>&nbsp;
															</td>
															<td><integro:empty-if-null value="<%=ob.getScriptName()%>"/>&nbsp;
															</td>
															<td><%=ob.getScriptValue() %>&nbsp;
															</td>
															<td><%=ob.getFaceValue() %>&nbsp;
															</td>
															<td><integro:empty-if-null value="<%=ob.getStockExchangeName()%>"/>&nbsp;
															</td>
															<td style="text-align:center">&nbsp;<%=ob.getLastUpdatedDate()==null?"-":df.format(ob.getLastUpdatedDate()) %></td>
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
												<logic:notPresent name="stockFeedEntryList">
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
													<td></td>
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
																	<td class="even"><%=stockFeedGroupTrxValue.getUserInfo()%>&nbsp;
																	</td>
																</tr>
																<tr class="odd">
																	<td class="fieldname">
																		Last Remarks Made
																	</td>
																	<td><%=stockFeedGroupTrxValue.getRemarks() != null ? stockFeedGroupTrxValue.getRemarks() : ""%>&nbsp;
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


																<td>
																	<a href="javascript:approvePage();"
																		onmouseout="MM_swapImgRestore()"
																		onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
																			src="img/approve1.gif" name="Image8" width="80"
																			height="20" border="0" id="Image8" />
																	</a>
																</td>
																<td>
																	<a href="javascript:rejectPage();"
																		onmouseout="MM_swapImgRestore()"
																		onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
																			src="img/reject1.gif" name="Image9" width="70"
																			height="20" border="0" id="Image9" />
																	</a>
																</td>
																<td>
																	<a href="javascript:cancelPage();"
																		onmouseout="MM_swapImgRestore()"
																		onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
																			src="img/cancel1.gif" name="Image1" border="0"
																			id="Image1" />
																	</a>
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
											</td>
											</tr>
											<logic:present name="stockFeedEntryList">
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

																			pageIndexUrl = "feed_stock_rate_item.do?event=maker_rejected_delete_read&TrxId="+transId+"&startIndex=";
																%>
																<td width="86" valign="middle">
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
