<!--Modified by Pratheepa for CR234 -->
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckList,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListItem,
                 com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.cms.app.recurrent.bus.IConvenantSubItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.app.recurrent.bus.IConvenant,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.app.recurrent.bus.IRecurrentCheckListSubItem,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.recurrent.bus.ConvenantComparator,
                 java.util.*"%>
<%@ page import="com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue" %>
<%@ page import="com.integrosys.cms.app.recurrent.bus.ConvenantComparator" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    try {
        com.integrosys.cms.app.recurrent.trx.IRecurrentCheckListTrxValue checkListTrxVal = (IRecurrentCheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.checkListTrxVal");
//    IRecurrentCheckList recChkLst = (IRecurrentCheckList)session.getAttribute("com.integrosys.cms.ui.checklist.recreceipt.RecurrentReceiptAction.recChkLst");
        String lastActionBy = checkListTrxVal.getUserInfo();
        String remarks = checkListTrxVal.getRemarks();

        if (lastActionBy == null) lastActionBy = "";
        if (remarks == null) remarks = "";

        int row = 0;
        int row1 = 0;
//    String status = "";
/*
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
    }
*/

        IRecurrentCheckListItem arrayActual[] = null;
        IRecurrentCheckListItem arrayStaging[] = null;
        List res = null;
        List subItemRes = null;
        ArrayList list = null;
        ArrayList subItemList = null;
        ArrayList itemFlagList = new ArrayList();

        if (checkListTrxVal.getCheckList() == null) {
            arrayActual = null;
        } else {
            arrayActual = checkListTrxVal.getCheckList().getCheckListItemList();
            if (checkListTrxVal.getStagingCheckList() != null) {
                arrayStaging = checkListTrxVal.getStagingCheckList().getCheckListItemList();
            }
        }

        if (arrayStaging != null) {
            int max = 0;
            if (arrayStaging.length > arrayActual.length) {
                max = arrayStaging.length;
            } else {
                max = arrayActual.length;
            }

            // compare subItems and loop thru the result to determine if the flag for the item should be modified or unmodified
            for (int itemIndex = 0; itemIndex < max; itemIndex++) {
                String itemFlag = CompareOBUtil.OB_UNMODIFIED; // reset itemFlag
                IRecurrentCheckListSubItem[] arrayStagingSubItem = arrayStaging[itemIndex].getRecurrentCheckListSubItemList();
                IRecurrentCheckListSubItem[] arrayActualSubItem = arrayActual[itemIndex].getRecurrentCheckListSubItemList();
                DefaultLogger.debug(this, "staging checkListItemID=" + arrayStaging[itemIndex].getCheckListItemID() + ", checkListItemRef=" + arrayStaging[itemIndex].getCheckListItemRef());
                DefaultLogger.debug(this, "actual checkListItemID=" + arrayActual[itemIndex].getCheckListItemID() + ", checkListItemRef=" + arrayActual[itemIndex].getCheckListItemRef());
                if (arrayStagingSubItem == null)
                    DefaultLogger.debug(this, "arrayStagingSubItem is null.");
                if (arrayActualSubItem == null)
                    DefaultLogger.debug(this, "arrayActualSubItem is null.");
                if (!(arrayStagingSubItem == null && arrayActualSubItem == null)) //bernard - if item has actual and/or staging subitems (CMS-1475)
                {
                    if (arrayStagingSubItem != null) {
                        for (int xx = 0; xx < arrayStagingSubItem.length; xx++) {
                            DefaultLogger.debug(this, "value of arrayStagingSubItem: " + arrayStagingSubItem[xx].getSubItemRef());
                        }
                    } else {
                        DefaultLogger.debug(this, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~empty arrayStagingSubItem!");
                    }
                    if (arrayActualSubItem != null) {
                        for (int xx = 0; xx < arrayActualSubItem.length; xx++) {
                            DefaultLogger.debug(this, "value of arrayActualSubItem: " + arrayActualSubItem[xx].getSubItemRef());
                        }
                    } else {
                        DefaultLogger.debug(this, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~empty arrayActualSubItem!");
                    }

                    subItemRes = CompareOBUtil.compOBArray(arrayStagingSubItem, arrayActualSubItem);
                    subItemList = new ArrayList(subItemRes);
                    for (int subItemIndex = 0; subItemIndex < subItemList.size(); subItemIndex++) {
                        CompareResult subItemCompResult = (CompareResult) subItemList.get(subItemIndex);
                        if (subItemCompResult != null) {
                            String resultKey = subItemCompResult.getKey();
                            //if (resultKey.equals(CompareOBUtil.OB_ADDED) || resultKey.equals(CompareOBUtil.OB_DELETED)
                            //		|| resultKey.equals(CompareOBUtil.OB_MODIFIED)) {
                            if (resultKey.equals(CompareOBUtil.OB_MODIFIED)) { //cms 1357
                                itemFlag = CompareOBUtil.OB_MODIFIED;
                                break;
                            }
                        }
                    }
                }
                itemFlagList.add(itemFlag);
            }

            // End of Testing

            res = CompareOBUtil.compOBArray(arrayStaging, arrayActual);
            list = new ArrayList(res);
            pageContext.setAttribute("checkLists", list);

        }

/*
    IConvenant staConvenant[] = checkListTrxVal.getStagingCheckList().getConvenantList();
    IConvenant actConvenant[] = null;
    if(checkListTrxVal.getCheckList()!=null){
        actConvenant = checkListTrxVal.getCheckList().getConvenantList();
    }

    List resCovenant = null;
    if (staConvenant != null)
    {
        resCovenant = CompareOBUtil.compOBArray(staConvenant,actConvenant);
        ArrayList list1 = new ArrayList(resCovenant);
        pageContext.setAttribute("covenants",list1);
    }
*/
// cr 26

        IConvenant carrayActual[] = null;
        IConvenant carrayStaging[] = null;


        res = null;
        subItemRes = null;
        ArrayList clist = null;
        subItemList = null;
        ArrayList citemFlagList = new ArrayList();

        if (checkListTrxVal.getCheckList() == null) {
            carrayActual = null;
        } else {
            carrayActual = checkListTrxVal.getCheckList().getConvenantList();
            if (checkListTrxVal.getStagingCheckList() != null) {
                carrayStaging = checkListTrxVal.getStagingCheckList().getConvenantList();
            }
        }

        if (carrayActual != null && carrayActual.length > 0) {
            //CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
            Arrays.sort(carrayActual, new com.integrosys.cms.app.recurrent.bus.ConvenantComparator());
            //res = new ArrayList(Arrays.asList(resultList));
        }

        if (carrayStaging != null && carrayStaging.length > 0) {
            //CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
            Arrays.sort(carrayStaging, new ConvenantComparator());
            //res = new ArrayList(Arrays.asList(resultList));
        }

        if (carrayStaging != null) {
            int max = 0;
            if (carrayStaging.length > carrayActual.length) {
                max = carrayStaging.length;
            } else {
                max = carrayActual.length;
            }

            // compare subItems and loop thru the result to determine if the flag for the item should be modified or unmodified
            for (int itemIndex = 0; itemIndex < max; itemIndex++) {
                String itemFlag = CompareOBUtil.OB_UNMODIFIED; // reset itemFlag
                IConvenantSubItem[] carrayStagingSubItem = carrayStaging[itemIndex].getConvenantSubItemList();
                IConvenantSubItem[] carrayActualSubItem = carrayActual[itemIndex].getConvenantSubItemList();
                DefaultLogger.debug(this, "staging convenantID=" + carrayStaging[itemIndex].getConvenantID() + ", checkListItemRef=" + carrayStaging[itemIndex].getConvenantRef());
                DefaultLogger.debug(this, "actual convenantID=" + carrayActual[itemIndex].getConvenantID() + ", checkListItemRef=" + carrayActual[itemIndex].getConvenantRef());
                if (carrayStagingSubItem == null)
                    DefaultLogger.debug(this, "carrayStagingSubItem is null.");
                if (carrayActualSubItem == null)
                    DefaultLogger.debug(this, "carrayActualSubItem is null.");
                if (!(carrayStagingSubItem == null && carrayActualSubItem == null)) //bernard - if item has actual and/or staging subitems (CMS-1475)
                {

                    subItemRes = CompareOBUtil.compOBArray(carrayStagingSubItem, carrayActualSubItem);
                    subItemList = new ArrayList(subItemRes);
                    for (int subItemIndex = 0; subItemIndex < subItemList.size(); subItemIndex++) {
                        CompareResult subItemCompResult = (CompareResult) subItemList.get(subItemIndex);
                        if (subItemCompResult != null) {
                            String resultKey = subItemCompResult.getKey();
                            //if (resultKey.equals(CompareOBUtil.OB_ADDED) || resultKey.equals(CompareOBUtil.OB_DELETED)
                            //		|| resultKey.equals(CompareOBUtil.OB_MODIFIED)) {
                            if (resultKey.equals(CompareOBUtil.OB_MODIFIED)) { //cms 1357
                                itemFlag = CompareOBUtil.OB_MODIFIED;
                                break;
                            }
                        }
                    }
                }
                citemFlagList.add(itemFlag);
            }

            // End of Testing


            if ((carrayStaging == null) && (carrayActual == null)) {
                res = new ArrayList();
            } else
                res = CompareOBUtil.compOBArray(carrayStaging, carrayActual);

            //clist = new ArrayList(res);

            /*if(res!=null && res.size()>0){
            CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
            Arrays.sort(resultList, new ConvenantComparator());
            res = new ArrayList(Arrays.asList(resultList));
        }*/


            clist = new ArrayList(res);
            pageContext.setAttribute("covenants", clist);

        }


        FrequencyList freList = FrequencyList.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("dd/MMM/yyyy");
        

%>




<%@page import="javax.swing.text.DateFormatter"%>
<%@page import="java.text.SimpleDateFormat"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>




<script language="JavaScript" type="text/JavaScript">
<!--

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }
    document.forms[0].event.value="approve_checklist_item";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }
    document.forms[0].event.value="reject_checklist_item";
    document.forms[0].submit();
}

function goViewCovenant(itemRef, subItemRef) {
    url = "RecurrentReceipt.do?event=chk_view_covenant&itemRef="+itemRef + "&subItemRef=" + subItemRef;
    window.location.href = url;
}

function goViewRecurrent(itemRef, subItemRef) {
    url = "RecurrentReceipt.do?event=chk_view_recurrent&itemRef=" + itemRef + "&subItemRef=" + subItemRef;
    window.location.href = url;
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/cancel2.gif','img/save2.gif','img/approve2.gif','img/reject2.gif')">
<html:form action="RecurrentReceipt" >
<input type="hidden" name="event" />

<!-- InstanceBeginEditable name="Content" -->
<%-- <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="title.update.cov.checklist.process"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="3%"><bean:message key="title.sequence.number"/></td>
              <td width="20%"><bean:message key="label.checklist.covenant.condition"/></td>
              <td width="5%"><bean:message key="label.checklist.one.off"/></td>
              <!--<td width="5%">Risk Trigger</td>-->
              <td width="7%"><bean:message key="label.checklist.frequency"/></td>
              <td width="8%"><bean:message key="label.checklist.grace.period"/></td>
              <td width="7%"><bean:message key="label.checklist.status"/></td>
              <td width="8%"><bean:message key="label.checklist.covenant.end.date"/></td>
              <td width="8%"><bean:message key="label.checklist.due.date"/></td>
              <td width="5%"><bean:message key="label.checklist.days.overdue"/></td>
              <td width="8%"><bean:message key="label.checklist.deferred.date"/></td>
              <td width="5%"><bean:message key="label.checklist.days.deferred"/></td>
              <td width="6%"><bean:message key="label.checklist.no.times.deferred"/></td>
              <td width="7%"><bean:message key="label.checklist.complied"/></td>
              <td width="8%"><bean:message key="label.checklist.date.received"/></td>
              <td width="5%"><bean:message key="label.checklist.action"/></td>
            </tr>
          </thead>
          <tbody>
		<logic:present name="covenants" >
<%
		String rowClass="";
    if (clist != null) {
			// loops thru the list of compareResults, which contains a recurrent item in each compareResult
			for (int i=0; i<clist.size(); i++) {
				CompareResult compResult = (CompareResult) clist.get(i);

				if (compResult != null) {
					// gets the recurrent item from each compareResult
					IConvenant OB = (IConvenant) compResult.getObj();
					if (OB != null) {
						IConvenantSubItem[] convenantSubItems = OB.getConvenantSubItemList();
						// sets the rowClass based on the row number
						row++;
						if (row%2!=0) {
							 rowClass="odd";
						}
						else {
							 rowClass="even";
						}
						// sets the frequency unit
						String freUnit = "";
						freUnit = freList.getFrequencyValue(OB.getFrequencyUnit());
						// sets the grace period unit
						String gracePeriodUnit = freList.getFrequencyValue(OB.getGracePeriodUnit());
						if (gracePeriodUnit == null) {
							gracePeriodUnit = "";
						}
						
						String itemType = null;
						boolean fee1 =OB.getFee();
						boolean riskTrigger1 = OB.getRiskTrigger();
						if(fee1)
							itemType = "Fee";
						else if(riskTrigger1)
							itemType = "Risk Trigger";
						else
							itemType = "Covenant";
						System.out.println("ItemType:" +itemType);


                    int filteredSubItemIndex = 0;
                    int numOfSubItems = 0;
                    if (convenantSubItems != null) {
                        numOfSubItems = CheckListUtil.filterSubItemListLength(convenantSubItems);
                    }

						// the list of sub items is not null then loop thru to display each sub item
						if (numOfSubItems > 0 && convenantSubItems != null && convenantSubItems.length > 0) {
							// loop thru the list of sub items of a recurrent item
							for (int subItemIndex=0; subItemIndex < convenantSubItems.length; subItemIndex++) {
								// retrieves the sub item from the list of sub items
								IConvenantSubItem subItem = convenantSubItems[subItemIndex];
                            if (filteredSubItemIndex == 0 && (ICMSConstant.CONVENANT_STATE_CHECKED.equals(subItem.getStatus()) ||
                                    ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(subItem.getStatus()))) {
                                continue;
                            }


%>
            <tr class="<%=rowClass%>">
            <bean:define id="itemType1" value="<%=itemType%>" />
<%
							if (filteredSubItemIndex==0) {
%>
              <td class='<%=citemFlagList.get(i)%>' rowspan="<%=numOfSubItems%>"><%=row%></td>
              <td rowspan="<%=numOfSubItems%>">
				<% if (!OB.getIsParameterizedDesc()) { %>
					<%=OB.getDescription()%>
				<% } else { %>
					<integro:common-code categoryCode="COVENANT_CONDITION" entryCode="<%=OB.getDescription()%>" display="true" descWithCode="false"/>
				<% } %>&nbsp;</td>
              <td style="text-align:center" rowspan="<%=numOfSubItems%>">
                <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
              </td>
             <!-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">
                <integro:boolean-display value="<%=OB.getRiskTrigger()%>" style="yn"/>&nbsp;
              </td>
              -->
              
              
              <% if (OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td rowspan="<%=numOfSubItems%>"><%=OB.getFrequency()%>&nbsp;<%if(OB.getFrequencyUnit() != null) {%><%=freUnit%>&nbsp;<%}%></td>
              <% } else { %>
              <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
              <% } %>
              <%if(OB.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <td rowspan="<%=numOfSubItems%>"><%=OB.getGracePeriod()%>&nbsp;<%if (OB.getGracePeriodUnit() != null) {%><%=gracePeriodUnit%>&nbsp;<%}%></td>
              <% } else { %>
              <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
<%
                }
							}
%>
							<td><%=subItem.getStatus()%>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getDocEndDate()%>"/>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getDueDate()%>"/>&nbsp;</td>
							<% 	//CMSSP-705 - days overdue for CHECKED docs should NOT be shown 
						    String daysOverDue = "-";  
							if (!subItem.getStatus().equals(ICMSConstant.CONVENANT_STATE_CHECKED) && 
                             !subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED))                             
                             {
                              if (subItem.getDaysOverDue()!= ICMSConstant.LONG_INVALID_VALUE)
							  daysOverDue = ""+subItem.getDaysOverDue(); 
							  }
							 
						%>
                            <td style="text-align:center"><%=daysOverDue%>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getDeferredDate()%>"/>&nbsp;</td>
                            <td style="text-align:center">
                            <%
                                long daysDeferred = ICMSConstant.LONG_INVALID_VALUE;
                                if (subItem.getDeferredDate() != null) {
                                    Date tempDate = null;
                                    if (subItem.getDueDate() != null) {
                                        tempDate = subItem.getDueDate();
                                    } else if (subItem.getDocEndDate() != null) {
                                        tempDate = subItem.getDocEndDate();
                                    }
                                    if (tempDate != null) {
                                        daysDeferred = CommonUtil.dateDiff(subItem.getDeferredDate(), tempDate, Calendar.DATE);
                                    }
                                }
                                if (daysDeferred != ICMSConstant.LONG_INVALID_VALUE) {
                            %> <%=daysDeferred%>&nbsp;
                            <% } else { %> - <% } %>
                            </td>
                            <td style="text-align:center"><%=subItem.getDeferredCount()%> &nbsp;</td>
                            <td style="text-align:center"><integro:boolean-display value="<%=subItem.getIsVerifiedInd()%>" style="yn"/>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getCheckedDate()%>"/>&nbsp;</td>
              <td style="text-align:center"><a href="#" onclick="goViewCovenant('<%=OB.getConvenantRef()%>', '<%=subItem.getSubItemRef()%>')">View</a>&nbsp;</td>
            </tr>
<%                           filteredSubItemIndex++;
							}
						}
						else {
%>
						<tr class="<%=rowClass%>">
              <td class="index"><%=row%></td>
              <td><%=OB.getDescription()%>&nbsp;</td>
              <td style="text-align:center">
                <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
              </td>
             <!-- <td style="text-align:center">
                <integro:boolean-display value="<%=OB.getRiskTrigger()%>" style="yn"/>&nbsp;
              </td>-->
             
              <td style="text-align:center"> <%=itemType%> &nbsp; </td>
              <% if (OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
              <% } else { %>
              <td style="text-align:center">-</td>
              <% } %>
              <% if (OB.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
              <% } else { %>
              <td style="text-align:center">-</td>
              <% } %>
              				<!-- bernard - changed blank cells to display msg instead  (CMS-1475)-->
							<td colspan="11"><bean:message key="label.error.no.cov.condition.item"/></td>
            </tr>
<%
						}
					}
				}
			}
    }
%>            
        </logic:present>
<logic:notPresent name="covenants" >
            <tr class="odd">
              <td colspan="16"><bean:message key="label.error.no.document"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table> --%>
<% row=0; %>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="title.update.rec.receipt.process"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
		        <td width="3%"><bean:message key="title.sequence.number"/></td>
		        <td width="15%"><bean:message key="label.checklist.doc.description"/></td>
		        <%-- <td width="5%"><bean:message key="label.checklist.one.off"/></td> --%>
		        <td width="7%"><bean:message key="label.checklist.frequency"/></td>
		        <%-- <td width="8%"><bean:message key="label.checklist.grace.period"/></td> --%>
		        <td width="7%"><bean:message key="label.checklist.status"/></td>
		        <td width="8%"><bean:message key="label.checklist.doc.end.date"/></td>
		        <td width="8%"><bean:message key="label.checklist.due.date"/></td>
		        <td width="5%"><bean:message key="label.checklist.days.overdue"/></td>
		        <td width="8%"><bean:message key="label.checklist.deferred.date"/></td>
		        <td width="5%"><bean:message key="label.checklist.days.deferred"/></td>
		        <td width="6%"><bean:message key="label.checklist.no.times.deferred"/></td>
		        <td width="5%"><bean:message key="label.checklist.received.date"/></td>
		        <td width="5%"><bean:message key="label.checklist.action"/></td>
		        <%-- <td width="5%"><bean:message key="label.checklist.chaser.reminder"/></td> --%>
		        <%-- <td width="5%"><bean:message key="label.checklist.reminder"/></td> --%>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkLists" >
<%
		String rowClass="";
    if (list != null) {
			// loops thru the list of compareResults, which contains a recurrent item in each compareResult
			for (int i=0; i<list.size(); i++) {
				CompareResult compResult = (CompareResult) list.get(i);

				if (compResult != null) {
					// gets the recurrent item from each compareResult
					IRecurrentCheckListItem OB = (IRecurrentCheckListItem) compResult.getObj();
					if (OB != null && OB.getDocType()==null) {
						IRecurrentCheckListSubItem[] recCheckListSubItems = OB.getRecurrentCheckListSubItemList();
						//IRecurrentCheckListSubItem[] recCheckListSubItems = CheckListUtil.filterSubItemList(OB.getRecurrentCheckListSubItemList());
						// sets the rowClass based on the row number
						row++;
						if (row%2!=0) {
							 rowClass="odd";
						}
						else {
							 rowClass="even";
						}
						// sets the frequency unit
						String freUnit = "";
						freUnit = freList.getFrequencyValue(OB.getFrequencyUnit());
						// sets the grace period unit
						String gracePeriodUnit = freList.getFrequencyValue(OB.getGracePeriodUnit());
						if (gracePeriodUnit == null) {
							gracePeriodUnit = "";
						}
                    int filteredSubItemIndex = 0;
                    int numOfSubItems = 0;
                    if (recCheckListSubItems != null) {
                        numOfSubItems = CheckListUtil.filterSubItemListLength(recCheckListSubItems);
                    }

						// the list of sub items is not null then loop thru to display each sub item
						if (numOfSubItems > 0 && recCheckListSubItems != null && recCheckListSubItems.length > 0) {
							//int numOfSubItems = recCheckListSubItems.length;
							// loop thru the list of sub items of a recurrent item
							for (int subItemIndex=0; subItemIndex < recCheckListSubItems.length; subItemIndex++) {
								// retrieves the sub item from the list of sub items
								IRecurrentCheckListSubItem subItem = recCheckListSubItems[subItemIndex];
                            if (filteredSubItemIndex == 0 && (ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(subItem.getStatus()) ||
                                    ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(subItem.getStatus()))) {
                                continue;
                            }

%>
            <tr class="<%=rowClass%>">
<%
							if (filteredSubItemIndex==0) {
%>
              <td class='<%=itemFlagList.get(i)%>' rowspan="<%=numOfSubItems%>"><%=row%></td>
              <td rowspan="<%=numOfSubItems%>"><%=OB.getItemDesc()%>&nbsp;</td>
              <%-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">
                <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
              </td> --%>
              <% if (OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td rowspan="<%=numOfSubItems%>"><%=OB.getFrequency()%>&nbsp;<%if(OB.getFrequencyUnit() != null) {%><%=freUnit%>&nbsp;<%}%></td>
              <% } else { %>
              <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
              <% } %>
              <%//if(OB.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <%-- <td rowspan="<%=numOfSubItems%>"><%=OB.getGracePeriod()%>&nbsp;<%if (OB.getGracePeriodUnit() != null) {%><%=gracePeriodUnit%>&nbsp;<%}%></td> --%>
              <% //} else { %>
              <%-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td> --%>
<%
                //}
							}
%>
							<td><%=subItem.getStatus()%>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getDocEndDate()%>"/>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getDueDate()%>"/>&nbsp;</td>
							<%  //CMSSP-705 - days overdue for RECEIVED docs should NOT be shown 
						    String daysOverDue = "-";  
							if (!subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED) && 
                             !subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED))                             
                             {
                              if (subItem.getDaysOverDue()!= ICMSConstant.LONG_INVALID_VALUE)
							  daysOverDue = ""+subItem.getDaysOverDue(); 
							  }
							 
						%>
                            <td style="text-align:center"><%=daysOverDue%>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getDeferredDate()%>"/>&nbsp;</td>
                            <td style="text-align:center">
                            <%
                                long daysDeferred = ICMSConstant.LONG_INVALID_VALUE;
                                if (subItem.getDeferredDate() != null) {
                                    Date tempDate = null;
                                    if (subItem.getDueDate() != null) {
                                        tempDate = subItem.getDueDate();
                                    } else if (subItem.getDocEndDate() != null) {
                                        tempDate = subItem.getDocEndDate();
                                    }
                                    if (tempDate != null) {
                                        daysDeferred = CommonUtil.dateDiff(subItem.getDeferredDate(), tempDate, Calendar.DATE);
                                    }
                                }
                                if (daysDeferred != ICMSConstant.LONG_INVALID_VALUE) {
                            %> <%=daysDeferred%>&nbsp;
                            <% } else { %> - <% } %>
                            </td>
                            <td style="text-align:center"><%=subItem.getDeferredCount()%> &nbsp;</td>
                            <%if(subItem.getReceivedDate()!=null) {%>
                            <td style="text-align:center"><%=format.format(subItem.getReceivedDate())%> &nbsp;</td>
                            <%}else{ %>
                            <td style="text-align:center"> -&nbsp;</td>
                            <%} %>
                            
              <td style="text-align:center"><a href="#" onclick="goViewRecurrent('<%=OB.getCheckListItemRef()%>', '<%=subItem.getSubItemRef()%>')">View</a>&nbsp;</td>
              <%-- <td style="text-align:center"><integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;</td> --%>
              <%-- <td style="text-align:center"><input name="checkbox" type="checkbox" disabled="true" value="checkbox"
                <%if(subItem.getIsPrintReminderInd()){ %> checked="checked" <% } %> />
              </td> --%>
            </tr>
<%                           filteredSubItemIndex++;
							}
						}
						else {
%>
						<tr class="<%=rowClass%>">
              <td class="index"><%=row%></td>
              <td><%=OB.getItemDesc()%>&nbsp;</td>
              <%-- <td style="text-align:center">
                <integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;
              </td> --%>
              <%-- <td style="text-align:center">
                <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
              </td> --%>
              <% if (OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
              <% } else { %>
              <td style="text-align:center">-</td>
              <% } %>
              <%-- <% if (OB.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
              <% } else { %>
              <td style="text-align:center">-</td>
              <% } %> --%>
              				<!-- bernard - changed blank cells to display msg instead  (CMS-1475)-->
							<td colspan="15"><bean:message key="label.error.no.recurrent.documents.found"/></td>
            </tr>
<%
						}
					}else if(OB!=null && OB.getDocType()!=null ){
					// do nothing
					}else{row++;
					
					}
						%>
				<tr class="odd">
              		<td colspan="15"><bean:message key="label.error.no.document"/></td>
            	</tr>		
						<%
						}
					}
				}if(row>0){
					%>
			<tr class="odd">
          		<td colspan="15"><bean:message key="label.error.no.document"/></td>
        	</tr>		
					<%
					}
			
%>
</logic:present>
<logic:notPresent name="checkLists" >
            <tr class="odd">
              <td colspan="15"><bean:message key="label.error.no.document"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>



<% row1=0; %>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Process - Update DP Checklist Receipt</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
		        <td width="3%"><bean:message key="title.sequence.number"/></td>
		        <td width="15%"><bean:message key="label.checklist.doc.description"/></td>
		        <%-- <td width="5%"><bean:message key="label.checklist.one.off"/></td> --%>
		        <td width="7%"><bean:message key="label.checklist.frequency"/></td>
		        <%-- <td width="8%"><bean:message key="label.checklist.grace.period"/></td> --%>
		        <td width="7%"><bean:message key="label.checklist.status"/></td>
		        <%-- <td width="8%"><bean:message key="label.checklist.doc.end.date"/></td> --%>
		        <td width="8%"><bean:message key="label.checklist.due.date"/></td>
		        <td width="5%"><bean:message key="label.checklist.days.overdue"/></td>
		        <td width="8%"><bean:message key="label.checklist.deferred.date"/></td>
		        <td width="5%"><bean:message key="label.checklist.days.deferred"/></td>
		        <td width="6%"><bean:message key="label.checklist.no.times.deferred"/></td>
		        <td width="5%"><bean:message key="label.checklist.received.date"/></td>
		        <td width="5%"><bean:message key="label.checklist.action"/></td>
		        <%-- <td width="5%"><bean:message key="label.checklist.chaser.reminder"/></td> --%>
		        <%-- <td width="5%"><bean:message key="label.checklist.reminder"/></td> --%>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkLists" >
<%
		String rowClass="";
    if (list != null) {
			// loops thru the list of compareResults, which contains a recurrent item in each compareResult
			for (int i=0; i<list.size(); i++) {
				CompareResult compResult = (CompareResult) list.get(i);

				if (compResult != null) {
					// gets the recurrent item from each compareResult
					IRecurrentCheckListItem OB = (IRecurrentCheckListItem) compResult.getObj();
					if (OB != null && "DP".equals(OB.getDocType())) {
						IRecurrentCheckListSubItem[] recCheckListSubItems = OB.getRecurrentCheckListSubItemList();
						//IRecurrentCheckListSubItem[] recCheckListSubItems = CheckListUtil.filterSubItemList(OB.getRecurrentCheckListSubItemList());
						// sets the rowClass based on the row number
						row1++;
						if (row1%2!=0) {
							 rowClass="odd";
						}
						else {
							 rowClass="even";
						}
						// sets the frequency unit
						String freUnit = "";
						freUnit = freList.getFrequencyValue(OB.getFrequencyUnit());
						// sets the grace period unit
						String gracePeriodUnit = freList.getFrequencyValue(OB.getGracePeriodUnit());
						if (gracePeriodUnit == null) {
							gracePeriodUnit = "";
						}
                    int filteredSubItemIndex = 0;
                    int numOfSubItems = 0;
                    if (recCheckListSubItems != null) {
                        numOfSubItems = CheckListUtil.filterSubItemListLength(recCheckListSubItems);
                    }

						// the list of sub items is not null then loop thru to display each sub item
						if (numOfSubItems > 0 && recCheckListSubItems != null && recCheckListSubItems.length > 0) {
							//int numOfSubItems = recCheckListSubItems.length;
							// loop thru the list of sub items of a recurrent item
							for (int subItemIndex=0; subItemIndex < recCheckListSubItems.length; subItemIndex++) {
								// retrieves the sub item from the list of sub items
								IRecurrentCheckListSubItem subItem = recCheckListSubItems[subItemIndex];
                            if (filteredSubItemIndex == 0 && (ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED.equals(subItem.getStatus()) ||
                                    ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED.equals(subItem.getStatus()))) {
                                continue;
                            }

%>
            <tr class="<%=rowClass%>">
<%
							if (filteredSubItemIndex==0) {
%>
              <td class='<%=itemFlagList.get(i)%>' rowspan="<%=numOfSubItems%>"><%=row1%></td>
              <td rowspan="<%=numOfSubItems%>"><%=OB.getItemDesc()%>&nbsp;</td>
              <%-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">
                <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
              </td> --%>
              <% if (OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td rowspan="<%=numOfSubItems%>"><%=OB.getFrequency()%>&nbsp;<%if(OB.getFrequencyUnit() != null) {%><%=freUnit%>&nbsp;<%}%></td>
              <% } else { %>
              <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td>
              <% } %>
              <%//if(OB.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <%-- <td rowspan="<%=numOfSubItems%>"><%=OB.getGracePeriod()%>&nbsp;<%if (OB.getGracePeriodUnit() != null) {%><%=gracePeriodUnit%>&nbsp;<%}%></td> --%>
              <% //} else { %>
              <%-- <td style="text-align:center" rowspan="<%=numOfSubItems%>">-</td> --%>
<%
                //}
							}
%>
							<td><%=subItem.getStatus()%>&nbsp;</td>
							<%-- <td style="text-align:center"><integro:date object="<%=subItem.getDocEndDate()%>"/>&nbsp;</td> --%>
							<td style="text-align:center"><integro:date object="<%=subItem.getDueDate()%>"/>&nbsp;</td>
							<%  //CMSSP-705 - days overdue for RECEIVED docs should NOT be shown 
						    String daysOverDue = "-";  
							if (!subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED) && 
                             !subItem.getStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_ITEM_WAIVED))                             
                             {
                              if (subItem.getDaysOverDue()!= ICMSConstant.LONG_INVALID_VALUE)
							  daysOverDue = ""+subItem.getDaysOverDue(); 
							  }
							 
						%>
                            <td style="text-align:center"><%=daysOverDue%>&nbsp;</td>
							<td style="text-align:center"><integro:date object="<%=subItem.getDeferredDate()%>"/>&nbsp;</td>
                            <td style="text-align:center">
                            <%
                                long daysDeferred = ICMSConstant.LONG_INVALID_VALUE;
                                if (subItem.getDeferredDate() != null) {
                                    Date tempDate = null;
                                    if (subItem.getDueDate() != null) {
                                        tempDate = subItem.getDueDate();
                                    } else if (subItem.getDocEndDate() != null) {
                                        tempDate = subItem.getDocEndDate();
                                    }
                                    if (tempDate != null) {
                                        daysDeferred = CommonUtil.dateDiff(subItem.getDeferredDate(), tempDate, Calendar.DATE);
                                    }
                                }
                                if (daysDeferred != ICMSConstant.LONG_INVALID_VALUE) {
                            %> <%=daysDeferred%>&nbsp;
                            <% } else { %> - <% } %>
                            </td>
                            <td style="text-align:center"><%=subItem.getDeferredCount()%> &nbsp;</td>
                            <%if(subItem.getReceivedDate()!=null) {%>
                            <td style="text-align:center"><%=format.format(subItem.getReceivedDate())%> &nbsp;</td>
                            <%}else{ %>
                            <td style="text-align:center"> -&nbsp;</td>
                            <%} %>
                            
              <td style="text-align:center"><a href="#" onclick="goViewRecurrent('<%=OB.getCheckListItemRef()%>', '<%=subItem.getSubItemRef()%>')">View</a>&nbsp;</td>
              <%-- <td style="text-align:center"><integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;</td> --%>
              <%-- <td style="text-align:center"><input name="checkbox" type="checkbox" disabled="true" value="checkbox"
                <%if(subItem.getIsPrintReminderInd()){ %> checked="checked" <% } %> />
              </td> --%>
            </tr>
<%                           filteredSubItemIndex++;
							}
						}
						else {
%>
						<tr class="<%=rowClass%>">
              <td class="index"><%=row1%></td>
              <td><%=OB.getItemDesc()%>&nbsp;</td>
              <%-- <td style="text-align:center">
                <integro:boolean-display value="<%=OB.getChaseReminderInd()%>" style="yn"/>&nbsp;
              </td> --%>
              <%-- <td style="text-align:center">
                <integro:boolean-display value="<%=OB.getIsOneOffInd()%>" style="yn"/>&nbsp;
              </td> --%>
              <% if (OB.getFrequency()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getFrequency()%>&nbsp;<%=freUnit%>&nbsp;</td>
              <% } else { %>
              <td style="text-align:center">-</td>
              <% } %>
              <%-- <% if (OB.getGracePeriod()!=Integer.MIN_VALUE) { %>
              <td><%=OB.getGracePeriod()%>&nbsp;<%=gracePeriodUnit%>&nbsp;</td>
              <% } else { %>
              <td style="text-align:center">-</td>
              <% } %> --%>
              				<!-- bernard - changed blank cells to display msg instead  (CMS-1475)-->
							<td colspan="15"><bean:message key="label.error.no.recurrent.documents.found"/></td>
            </tr>
<%
						}
					}else if(OB!=null &&! "DP".equals(OB.getDocType())){
					// do nothing
					}else{row1++;
						%>
				<tr class="odd">
              		<td colspan="15"><bean:message key="label.error.no.document"/></td>
            	</tr>		
						<%
						}
					}
				}if(row1>0){
					%>
			<tr class="odd">
          		<td colspan="15"><bean:message key="label.error.no.document"/></td>
        	</tr>		
					<%
					}
			
    }
%>
</logic:present>
<logic:notPresent name="checkLists" >
            <tr class="odd">
              <td colspan="15"><bean:message key="label.error.no.document"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr>
              <td class="fieldname"><bean:message key="label.checklist.remarks"/></td>
              <td width="84%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea>
              <br><html:errors property="recurrentRemarksError"/>
              
              </td>
            </tr>
            <tr>
	            <td class="fieldname"><bean:message key="label.checklist.last.action.by"/></td>
	            <td class="even">&nbsp;<%=lastActionBy%></td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.checklist.last.remarks.made"/></td>
              <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onclick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onclick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
<%
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
