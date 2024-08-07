<%@ page import="org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.base.businfra.customer.OBCustomer,
                 java.io.StringWriter,
                 java.net.URL,
                 java.io.File,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,
                 java.util.*,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%
	try {
    String reminderIndex = request.getParameter("reminderIndex");
    IRecurrentCheckList recChkLst = (IRecurrentCheckList)session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.recChkLst");
    StringTokenizer st = new StringTokenizer(reminderIndex, ",");
    String arm_code = request.getAttribute("ARM_code") == null ? "" : (String) request.getAttribute("ARM_code");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); 
	Date today = DateUtil.clearTime((new GregorianCalendar()).getTime());
	Date todayGrace = CommonUtil.rollUpDateByDays(today, 30); //bernard - added for CM116	
    ArrayList overDueList = new ArrayList();
    ArrayList toDueList = new ArrayList();
    boolean overDueDoc;
    while (st.hasMoreTokens()) {
			int i = Integer.parseInt(st.nextToken());
			Map overDueMap = new HashMap();
			Map toDueMap = new HashMap();
			int subItemsCounter = 0;

			// loop thru all subitems of all items in the checklist n determine which sub item to print
			if (recChkLst != null) {
				IRecurrentCheckListItem[] itemList = recChkLst.getCheckListItemList();
				if (itemList != null) {
					for (int itemIndex=0; itemIndex<itemList.length; itemIndex++) {
						IRecurrentCheckListItem item = itemList[itemIndex];
						if (item != null) {
							IRecurrentCheckListSubItem[] subItemList = item.getRecurrentCheckListSubItemList();
							int numOfSubItems = CheckListUtil.filterSubItemListLength(subItemList);
							if (subItemList != null && numOfSubItems > 0) {
								for (int subItemIndex=0; subItemIndex<subItemList.length; subItemIndex++) {
									subItemsCounter++;
									DefaultLogger.debug(this, "i from reminderIndex: " + i);
									DefaultLogger.debug(this, "subItemsCounter: " + subItemsCounter);								    
									if (i == subItemsCounter) {
										IRecurrentCheckListSubItem subItem = subItemList[subItemIndex];
																				
										Date deferredDate = DateUtil.clearTime(subItem.getDeferredDate());
										Date endDate = DateUtil.clearTime(subItem.getDocEndDate());
										Date endDateGrace = CommonUtil.rollUpDateByDays(endDate, 30);									
										//if subitem is overdue
										
										// weiling - cms-1592 : dueDate no longer required. Business logic to check against endDate instead.
										/*
										Date dueDate = DateUtil.clearTime(subItem.getDueDate());
										if ((dueDate.before(today) && (deferredDate != null && deferredDate.before(today)))
										        || (dueDate.before(today) && deferredDate == null)) {
											// if (dueDate < today and deferredDate is null) OR (dueDate and deferredDate < today)
											// set overdue docs into overDueMap

										*/
										
										//bernard - changed conditions for generation of overdue and toDue docs (CM116)
										if (endDate.before(today)) {
											//if endDate is before today, set overdue docs into overDueMap
											overDueMap.put("desc", item.getItemDesc());
											//bernard - changed to display end date instead of due date (CMS-1452)
											overDueMap.put("expDate", DateUtil.formatDate(locale, endDate, "dd MMM yyyy"));
										}
										else if (!endDate.before(today) && !endDate.after(todayGrace)){ //if subitem is not overdue yet
											//if endDate is between today and 30 days from today (inclusive),
											//set about to due docs into toDueMap
											toDueMap.put("desc", item.getItemDesc());
											//bernard - changed to display end date instead of due date (CMS-1452)
											toDueMap.put("expDate", DateUtil.formatDate(locale, endDate, "dd MMM yyyy"));
										}
									}
								}
							}
						} else {
							DefaultLogger.debug(this, "not subItem - subItemsCounter: " + subItemsCounter);								    
						}
					}
				}
			}
      if (!overDueMap.isEmpty()) {
				overDueList.add(overDueMap);
      }
	    if (!toDueMap.isEmpty()) {
	      toDueList.add(toDueMap);
	    }
    }
		DefaultLogger.debug(this, "size of overDueList: " + overDueList.size());
		DefaultLogger.debug(this, "size of toDueList: " + toDueList.size());

    String fileName = "recurrent_remainder.rtf";
    String date = DateUtil.formatDate(locale,new Date(), "dd MMM yyyy");
    
    VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");

    VelocityContext ctx = new VelocityContext();

    ctx.put("date",date);
    ctx.put("overDueList",overDueList);
	ctx.put("toDueList",toDueList);
    ctx.put("arm_code", arm_code);
    // customer obj
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ctx.put("cust",cust);
		if(cust!=null && cust.getOfficialAddresses()!=null) {
	    ctx.put("address",cust.getOfficialAddresses()[0]);
		}
    StringWriter sw = new StringWriter();
    velocityEngine.getTemplate(fileName).merge(ctx,sw);
    byte cont[] = sw.toString().getBytes();
    String strMime = "application/rtf";
    // Clear out response stream
    response.reset();

    // Set the browser's mime type
    response.setContentType(strMime);

    // Ensure the browser's page to expect a file
    response.setHeader("Expires", "0");
    response.addHeader("Content-disposition", "attachment; filename="+"Recurrent_Remainder.rtf");
    response.getOutputStream().write(cont);
    response.flushBuffer();

%>
<html>
<body>
<script>

</script>
</body>
</html>
<%
	}
	catch (Exception e) {
    e.printStackTrace();
    out.println("An error has occurred while exporting the report.<BR>" + e.toString());
		throw e;
  }

%>