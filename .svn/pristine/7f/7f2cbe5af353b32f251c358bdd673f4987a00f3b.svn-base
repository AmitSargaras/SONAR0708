<%@ page
	import=" com.integrosys.cms.ui.diaryitem.DiaryItemForm,
				 com.integrosys.cms.app.diary.bus.IDiaryItem,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.diaryitem.DiaryItemListMapper,
                 java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="com.integrosys.cms.ui.common.CommonCodeList"%>

<%
	/**
	 * Copyright Integro Technologies Pte Ltd
	 * $Header: /home/cms2/cvsroot/cms2/public_html/diaryitem/view_diary_segment_wise,v 1.21 2018/08/10 02:20:08 hshii Exp $
	 * @author $Author: hshii $
	 * @version $Revision: 1.21 $
	 * @since $Date: 2006/09/29 02:20:08 $
	 * Tag: $Name:  $
	 */
%>

<%
	SearchResult sr = (SearchResult) session
			.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.diaryItemList");
	System.out.println("diaryItemList===========" + sr.getNItems());

	String[][] segmentWiseList = (String[][]) session
			.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.segmentWiseList");
	System.out.println("segmentWiseList Length===========" + segmentWiseList.length);

	Long teamID =(Long) request.getAttribute("teamID");
	System.out.println("teamID========================"+teamID);
	
	List diaryItemList = new ArrayList(sr.getResultList());
	pageContext.setAttribute("diaryItemList", diaryItemList);

	List diaryItemListDropLine = new ArrayList();
	List totalDiaryItemListGeneral = new ArrayList();

	int totaldiary = 0;
	for (int i = 0; i < diaryItemList.size(); i++) {
		IDiaryItem diaryItem = (IDiaryItem) diaryItemList.get(i);
		if("N".equals(diaryItem.getIsDelete())&& !"Closed".equals(diaryItem.getStatus())
				&& teamID.equals(diaryItem.getTeamId())){
			totaldiary= totaldiary+1;
		}
		
		if ("Y".equals(diaryItem.getDropLineOD()) && "N".equals(diaryItem.getIsDelete()) && !"Closed".equals(diaryItem.getStatus())
				&& teamID.equals(diaryItem.getTeamId())) {
			diaryItemListDropLine.add(diaryItem);
		} else if("N".equals(diaryItem.getIsDelete())&& !"Closed".equals(diaryItem.getStatus())
				&& teamID.equals(diaryItem.getTeamId())){
			totalDiaryItemListGeneral.add(diaryItem);
		}
	}

	System.out.println("diaryItemListDropLine===========" + diaryItemListDropLine.size());
	System.out.println("totalDiaryItemListGeneralcount===========" + totalDiaryItemListGeneral.size());

	String totalCount = Integer.toString(totaldiary);
	String genericCount = Integer.toString(totalDiaryItemListGeneral.size());
	String odCount = Integer.toString(diaryItemListDropLine.size());

	CommonCodeList commonCodeSegmentList = CommonCodeList.getInstance("HDFC_SEGMENT");
	System.out.println("CommonCodeList===========" + commonCodeSegmentList.getCommonCodeLabel("COMMODITY"));
	
	int recordsPerPage = 0;
    if (request.getAttribute("recordsPerPage") != null && !request.getAttribute("recordsPerPage").equals(""))
        recordsPerPage = ((Integer) request.getAttribute("recordsPerPage")).intValue();
    if (recordsPerPage <= 0)
        recordsPerPage = ((Integer) session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.recordsPerPage")).intValue();
    DiaryItemForm form = (DiaryItemForm)request.getAttribute("DiaryItemForm");
    Collection countryValues = (Collection)request.getAttribute("CountryValues");
    if (countryValues == null)
        countryValues = (Collection)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.CountryValues");
    Collection countryLabels = (Collection)request.getAttribute("CountryLabels");
    if (countryLabels == null)
        countryLabels = (Collection)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.CountryLabels");

    Collection diaryList = null;
    int noofItems = 0;
    
    int counter = 0;
    if (form != null)
        counter = form.getStartIndex();
    String startIndex = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.startIndex");
    if (form == null && startIndex != null &&  !startIndex.equals(""))
        counter = Integer.parseInt(startIndex);
    int lStartIndex = counter;
    //CR-120 Search Diary Item
//    String sessSearchCustomerName = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.searchCustomerName");
    //String sessSearchLeID = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.searchLeID");
    String sessCountryFilter = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.countryFilter");
    if (sessCountryFilter != null)
        form.setAllowedCountry(sessCountryFilter);

    String searchLEID = (String) request.getParameter("searchLeID");
    
    String searchCustomerName = (String) request.getParameter("searchCustomerName");
	
	
	
%>
<html>
<head>

<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
	
</script>
</head>
<body>
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<html:form action="DiaryItem.do">
			<html:hidden property="startIndex" />
			<html:hidden property="customerIndex" />
			<input type="hidden" name="frompage" />
			<input type="hidden" name="flag" value="view" />
			<input type="hidden" name="event" value="list_non_expired" />


			<tr>
				<td colspan="3" valign="top" style="height: 100%; width: 100%;">
					<table width="90%" class="tblFormSection" border="0" align="center"
						cellpadding="0" cellspacing="0" style="margin-top: 15px">
						<thead>
							<tr>
								<td width="24%">
									<h3>All Diary Item</h3>
								</td>
								<td width="76%" valign="bottom">
									<!--                         <strong>Access Country:</strong>-->
									<html:hidden property="allowedCountry"
										onchange="JumpOnSelectactive(this)" />

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
									<table width="100%" class="tblinfo" style="margin-top: 0"
										border="0" cellspacing="0" cellpadding="0">
										<thead>
											<tr>
												<td width="40%"></td>
												<td width="20%">Generic</td>
												<td width="20%">Dropline OD</td>
												<td width="20%">Total</td>
											</tr>
										</thead>
										<tbody>

											<tr>
											<tr class="even">

												<td width="40%" align="left" style="margin-bottom: 50">
												<h3>
												All Diary Item List
												</h3>
												</td>
												<% String genericURL = "./DiaryItem.do?event=list_non_expired&genericCount=Y&odCount=N&totalCount=N&segment=N";%>
												<td width="20%">
												
												
												<%	if("0".equals(genericCount)){%>
												
												-
												
											<%	}else{%>
												
												<a href="<%=genericURL%>">
												<%=genericCount%>
												</a>
												
											<%	}%> 
											
											
												</td>
												<% String odURL = "./DiaryItem.do?event=list_non_expired&genericCount=N&odCount=Y&totalCount=N&segment=N";%>
												<td width="20%">
												
												
												<%	if("0".equals(odCount)){%>
												
												-
												
											<%	}else{%>
												
												<a href="<%=odURL%>"><%=odCount%>
												</a>
												
											<%	}%>
											
											
												</td>
												<% String totalURL = "./DiaryItem.do?event=list_non_expired&genericCount=N&odCount=N&totalCount=Y&segment=N";%>
												<td width="20%">
												
												
												
												<%	if("0".equals(totalCount)){%>
												
												-
												
											<%	}else{%>
												
												<a href="<%=totalURL%>">
												<%=totalCount%>
												
											<%	}%>
											
											
												</a>
												</td>

											</tr>

										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>


					<table width="90%" class="tblFormSection" border="0" align="center"
						cellpadding="0" cellspacing="0" style="margin-top: 15px">
						<thead>
							<tr>
								<td width="24%">
									<h3>Todays Diary List- Segment wise</h3>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									<table width="100%" class="tblinfo" style="margin-top: 0"
										border="0" cellspacing="0" cellpadding="0">
										<thead>
											<tr>
												<td width="10%">S/N</td>
												<td width="30%">Segment</td>
												<td width="20%">Generic</td>
												<td width="20%">Dropline OD</td>
												<td width="20%">Total</td>
											</tr>
										</thead>
										<tbody>



											<%
												for (int i = 0; i < segmentWiseList.length; i++) {
											%>

											<tr class="even">
												<td class="index" width="10%">
												<%=segmentWiseList[i][0]%>
												</td>

												<td width="30%"> <b>
												<%=segmentWiseList[i][1]%></b>
												</td>

												<% String genericURLSegment = "./DiaryItem.do?event=list_non_expired&genericCount=Y&odCount=N&totalCount=N&segment=Y&segmentName="+segmentWiseList[i][1];%>
												<td width="20%">
												<%	if(segmentWiseList[i][2] == "-"){%>
												
												-
												
												
											<%	}else{%>
												
												<a href="<%=genericURLSegment%>">
												<%=segmentWiseList[i][2]%></a>
												
											<%	}%> 
												</td>
												<% String odURLSegment = "./DiaryItem.do?event=list_non_expired&genericCount=N&odCount=Y&totalCount=N&segment=Y&segmentName="+segmentWiseList[i][1];%>
												<td width="20%">
												<%	if(segmentWiseList[i][3] == "-"){%>
												
												-
												
												
											<%	}else{%>
												
												<a href="<%=odURLSegment%>">
												<%=segmentWiseList[i][3]%></a>
												
												
											<%	}%> 
											
											
												</td>
												<% String totalURLSegment = "./DiaryItem.do?event=list_non_expired&genericCount=N&odCount=N&totalCount=Y&segment=Y&segmentName="+segmentWiseList[i][1];%>
												<td width="20%">
												
												<%	if(segmentWiseList[i][4] == "-"){%>
												
												-
												
												
											<%	}else{%>
												
												<a href="<%=totalURLSegment%>">
												<%=segmentWiseList[i][4]%></a>
												
												
											<%	}%> 
											
												</td>
											</tr>
											<%
												}
											%>



										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>

				</td>
			</tr>

		</html:form>
	</table>
	<iframe name='displayReportFrame' width='0' height='0' frameborder='0'
		scrolling='no'></iframe>
</body>
</html>