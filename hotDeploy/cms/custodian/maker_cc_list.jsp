<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header:
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.54 $
 * @since $Date: 2006/10/27 08:42:56 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.bus.IBookingLocation,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.CountryList,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
				 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
				 com.integrosys.cms.ui.custodian.CustodianAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.custodian.trx.OBCustodianTrxValue,
                 java.util.*,
                 com.integrosys.cms.app.custodian.bus.*"%>
 <%
    String instructionLoc = (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.instructionBkLoc");
    ArrayList checkListItemRefList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.checkListItemRefList");
    ILimitProfile limitprofile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String bookingLoc = null;
    String displayBCALoc = (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.displayBCALoc");
    if (limitprofile != null){
        if (limitprofile.getOriginatingLocation() != null){
            bookingLoc = limitprofile.getOriginatingLocation().getCountryCode();
            displayBCALoc = "true";
        }else{
            displayBCALoc = "false";
        }
    }else{
        displayBCALoc = "false";
    }
    int sno=0;
    int itemCnt = 0;
    // Custodian Docs now contain Custodian Doc Items which is displayed
    OBCustodianTrxValue iCustTrxVal = (OBCustodianTrxValue)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.custodianTrxVal");
    ICustodianDoc actualDoc  = iCustTrxVal.getCustodianDoc();
    ICustodianDoc stagingDoc = iCustTrxVal.getStagingCustodianDoc();
    ArrayList stagingdocItems = null;
    if (stagingDoc != null)
        stagingdocItems = stagingDoc.getCustodianDocItems();
    ArrayList actualDocItems = null;
    if (actualDoc != null)
        actualDocItems = actualDoc.getCustodianDocItems();
    if(stagingdocItems!=null && stagingdocItems.size()>0) {
        //sorting staging items
        ICustodianDocItem[] stagingdocItemsArr = (ICustodianDocItem[])stagingdocItems.toArray(new ICustodianDocItem[0]);
        if (stagingdocItemsArr != null)
            itemCnt = stagingdocItemsArr.length;
        Arrays.sort(stagingdocItemsArr, new Comparator()
        {
            public int compare(Object o1, Object o2)
            {
                long int1 = 0;
                if (o1 != null)
                    int1 = ((ICustodianDocItem)o1).getCheckListItemRefID();
                long int2 = 0;
                if (o2 != null)
                    int2 = ((ICustodianDocItem)o2).getCheckListItemRefID();
                if (int1 - int2 > 0)
                    return 1;
                if (int1 - int2 < 0)
                    return -1;
                return 0;
            }
        });
        pageContext.setAttribute("custDocItems",Arrays.asList(stagingdocItemsArr));
    }
	String event = request.getParameter("event");
	String cancelEvent = "CCReceipt.do?event=cust_list";
    String viewEvent = "";
    boolean isView = false;
    boolean isClose=false;
    boolean isToTrack=false;

    //if(event.equals(CustodianAction.EVENT_CUST_DOC_LIST_MAKER)){
        //viewEvent = CustodianAction.EVENT_VIEW_CUST_ITEM_TODO;
	//}else{
        viewEvent = "prepare_custodian_maker";
	//}
	if(request.getParameter("isClose")!=null &&
        request.getParameter("isClose").length()>0 &&
        !request.getParameter("isClose").equals("null") ){
//        viewEvent = CustodianAction.EVENT_VIEW_CUST_ITEM_TODO+"&isClose=Y";
        viewEvent = CustodianAction.EVENT_VIEW_CUST_ITEM_TODO;
        cancelEvent = "ToDo.do";
        isClose = true;
    	isView = true;
    }
	if(request.getParameter("totrack")!=null &&
        request.getParameter("totrack").length()>0 &&
        !request.getParameter("totrack").equals("null") ){
//        viewEvent = CustodianAction.EVENT_VIEW_CUST_ITEM_TODO+"&totrack=totrack";
        viewEvent = CustodianAction.EVENT_VIEW_CUST_ITEM_TODO;
	    cancelEvent="ToDo.do?event=totrack";
	    isView = true;
        isToTrack = true;
	}

    String remarks = "";
    String lastActionBy = "";
    String status = "";
    if(iCustTrxVal!=null){
        status = iCustTrxVal.getStatus();
        remarks = iCustTrxVal.getRemarks();
        lastActionBy = iCustTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    boolean isReversalAllowed = true;
    HashMap reversalStateMap = new HashMap();
    /*
    reversalStateMap.put(ICMSConstant.STATE_RECEIVED,ICMSConstant.STATE_LODGED_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_ITEM_AWAITING,ICMSConstant.STATE_LODGED_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_AUTHZ_TEMP_UPLIFTED,ICMSConstant.STATE_TEMP_UPLIFT_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_AUTHZ_PERM_UPLIFTED,ICMSConstant.STATE_PERM_UPLIFT_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_AUTHZ_RELODGED,ICMSConstant.STATE_RELODGE_REVERSAL);
    */
    reversalStateMap.put(ICMSConstant.STATE_PENDING_LODGE,ICMSConstant.STATE_CUST_PENDING_lODGE_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_LODGED,ICMSConstant.STATE_CUST_LODGED_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_PENDING_TEMP_UPLIFT,ICMSConstant.STATE_CUST_PENDING_TEMP_UPLIFT_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_PENDING_PERM_UPLIFT,ICMSConstant.STATE_CUST_PENDING_PERM_UPLIFT_REVERSAL);
    reversalStateMap.put(ICMSConstant.STATE_PENDING_RELODGE,ICMSConstant.STATE_CUST_PENDING_RELODGE_REVERSAL);
    String reverseStatus = "";
    String reverseEvent = "";
    String revRemarks = (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.sess.reversalRemarks");
    DefaultLogger.debug(this, "rev remarks " + revRemarks);
    if(event.equals(CustodianAction.EVENT_CUST_DOC_LIST_MAKER))
        reverseEvent = CustodianAction.EVENT_REVERSE_CUST_MAKER_TODO;
    else
        reverseEvent = CustodianAction.EVENT_REVERSE_CUST_MAKER;

 %>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function submitPage() {
<% if((checkListItemRefList==null)||(checkListItemRefList.isEmpty()))
{%>
	return window.alert("No action has been taken");               
<%}%>
<%if(event.equals(CustodianAction.EVENT_CUST_DOC_LIST_MAKER)){%>
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_SUBMIT_TODO_CUST_DOC_MAKER%>&opcode=<%//=opcode%>&forId=<%//=forId%>";
<%}else{%>
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_SUBMIT_CUST_DOC_MAKER%>&opcode=<%//=opcode%>&forId=<%//=forId%>";
<%}%>

               
    document.forms[0].submit();
}
function savePage() {
<%if(event.equals(CustodianAction.EVENT_CUST_DOC_LIST_MAKER)){%>
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_SAVE_TODO_CUST_DOC_MAKER%>&opcode=<%//=opcode%>&forId=<%//=forId%>";
<%}else{%>
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_SAVE_CUST_DOC_MAKER%>&opcode=<%//=opcode%>&forId=<%//=forId%>";
<%}%>
<%if (!isClose && !isToTrack){%>
    var strRem = document.forms[0].reversalRemarks.value;
    if (strRem == null || strRem.length <= 1600)
        document.forms[0].submit();
    else {
        alert('The Reversal Remarks Field is limited to 1600 characters');
        document.forms[0].reversalRemarks.focus();}
<%}else{%>
    document.forms[0].submit();
<%}%>
}

function cancelPage(){
<%if(event.equals(CustodianAction.EVENT_CUST_DOC_LIST_MAKER)){
    if(request.getParameter("totrack")!=null &&
    request.getParameter("totrack").length()>0 &&
    !request.getParameter("totrack").equals("null") ){%>
        document.forms[0].action="ToDo.do?event=totrack";
    <%}else{%>
        document.forms[0].action="ToDo.do";
<%}}else{
	if (request.getParameter("isTodo") != null &&
	 	request.getParameter("isTodo").length()>0 &&
		!request.getParameter("isTodo").equals("null")) {
%>
	document.forms[0].action="ToDo.do";
<% } else { %>
    document.forms[0].action="<%=cancelEvent%>";
<%} }%>
    document.forms[0].submit();
}
function closePage() {
    document.forms[0].action="custodian.do?event=<%=CustodianAction.EVENT_CLOSE_CUST_DOC_MAKER%>";
    document.forms[0].submit();
}
function undo(checkListItemRef) {
<%if(event.equals(CustodianAction.EVENT_CUST_DOC_LIST_MAKER)){%>
    document.forms[0].action = "custodian.do?event=<%=CustodianAction.EVENT_CUST_DOC_UNDO_TODO%>&checkListItemRef="+checkListItemRef;
<%}else{%>
    document.forms[0].action = "custodian.do?event=<%=CustodianAction.EVENT_CUST_DOC_UNDO%>&checkListItemRef="+checkListItemRef;
<%}%>
	document.forms[0].submit();
}

function reverse(checkListItemRef) {
<%if(event.equals(CustodianAction.EVENT_CUST_DOC_LIST_MAKER)){%>
    document.forms[0].action = "custodian.do?event=<%=CustodianAction.EVENT_REVERSE_CUST_MAKER_TODO%>&checkListItemRef="+checkListItemRef;
<%}else{%>
    document.forms[0].action = "custodian.do?event=<%=CustodianAction.EVENT_REVERSE_CUST_MAKER%>&checkListItemRef="+checkListItemRef;
<%}%>
	document.forms[0].submit();
}


function callSubmit(selObj,ind,checkListItemRefID,custodianDocItemID,itemCnt) {

	formObj = document.forms["CustodianForm"];
    temp = selObj.options[selObj.selectedIndex].value;
    if(temp=="") {
        return false;
    }else{
    if (temp == '<%=ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE%>'||
        temp == '<%=ICMSUIConstant.CUSTODIAN_OP_CODE_PERMUPLIFT%>'||
        temp == '<%=ICMSUIConstant.CUSTODIAN_OP_CODE_TEMPUPLIFT%>'||
        temp == '<%=ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE%>' ||
        temp == '<%=ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE_REVERSAL%>')
            formObj.event.value = 'prepare_custodian_maker';

        if (temp == '<%=ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW%>')
            formObj.event.value = '<%=viewEvent%>';
        if (temp == '<%=ICMSUIConstant.CUSTODIAN_OP_CODE_PENDING_REVERSAL%>') {
            formObj.event.value = '<%=reverseEvent%>';
            if (itemCnt <= 1)
              formObj.reverseStatus.value=formObj.reverseStatusAr.value;
            else
              formObj.reverseStatus.value=formObj.reverseStatusAr[ind].value;
        }
		formObj.index.value = ind;
        formObj.opcode.value = selObj.options[selObj.selectedIndex].value;
        formObj.trxId.value='<%=iCustTrxVal.getTransactionID()%>';
        formObj.checkListItemRef.value=checkListItemRefID;
        formObj.custodianDocItemID.value=custodianDocItemID;
        <%if (!isClose && !isToTrack){%>
        var strRem = formObj.reversalRemarks.value;
        if (strRem == null || strRem.length <= 1600)
    	    formObj.submit();
        else{
    	    alert('The Reversal Remarks Field is limited to 1600 characters');
            formObj.reversalRemarks.focus();}
        <%}else{%>
            formObj.submit();
        <%}%>
    }
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action='custodian.do?'>
<input type="hidden" name="isTodo" value="<%=request.getParameter("isTodo")%>"/>
<input type="hidden" name="isClose" value="<%=request.getParameter("isClose")%>"/>
<input type="hidden" name="totrack" value="<%=request.getParameter("totrack")%>"/>
<input type="hidden" name="event" />
<input type="hidden" name="index" />
<input type="hidden" name="reverseStatus" />
<input type="hidden" name="trxId" />
<input type="hidden" name="checkListItemRef" />
<input type="hidden" name="custodianDocItemID" />
<input type="hidden" name="opcode" />
<input type="hidden" name="forId" value="cc"/>
<input type="hidden" name="limitProfile" value="<%=String.valueOf(limitprofile.getLimitProfileID())%>"/>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="title.update.ccdoc"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
      <%
          if (displayBCALoc.equals("true") && !bookingLoc.equals(instructionLoc)) {
      %>
      <tr>
      <td>
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <tr class="odd">
          <td width="20%" class="index"><bean:message key="label.security.docitem.BCABookingLoc"/></td>
          <td width="80%">
          <integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(bookingLoc)%>"/>&nbsp;
          </td>
          </tr>
      </table>
      </td>
      </tr>
      <tr><td colspan="2">&nbsp;</td></tr>
      <% } %>
<%
        String ownerType = (String)request.getAttribute("ownertype");
        if (ownerType == null)
            ownerType =  (String)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.session.ownertype");
        if (ownerType == null){
            if (stagingDoc != null)
                ownerType =  (String)stagingDoc.getDocSubType();
            else if (actualDoc != null)
                ownerType =  (String)actualDoc.getDocSubType();
        }
        CCCustodianInfo ccowner = (CCCustodianInfo)request.getAttribute("ccowner");
        if (ccowner == null)
            ccowner =  (CCCustodianInfo)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.session.ccowner");
        if (ccowner == null){
            if (stagingDoc != null)
                ccowner =  (CCCustodianInfo)stagingDoc.getCCCustodianInfo();
            else if (actualDoc != null)
                ccowner =  (CCCustodianInfo)actualDoc.getCCCustodianInfo();
        }
        if (ccowner != null)
        {
%>  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.customer.category"/></td>
              <td> <integro:empty-if-null value="<%=ownerType%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.idNo"/></td>
              <td>
<%				if (ccowner.getLegalReference()!= null){
%>					<integro:empty-if-null value="<%= ccowner.getLegalReference()%>"/>
<%				}else{
%>					-
<%				}%>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.custName"/></td>
              <td> <integro:empty-if-null value="<%= ccowner.getLegalName()%>"/>&nbsp;</td>
            </tr>
<%          if (ICMSConstant.CHECKLIST_PLEDGER.equals(ownerType))
            {
%>          <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.pledgorId"/></td>
              <td> <integro:empty-if-null value="<%= ccowner.getOwnerReference()%>"/>&nbsp;</td>
            </tr>
<%         }%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.cif"/></td>
              <td><integro:empty-if-null value="<%=limitprofile.getLEReference()%>"/>&nbsp;</td>
            </tr> 
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
<%}%>





    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%"><bean:message key="label.global.sn"/></td>
             <!-- <td width="10%">Master Doc Code (Doc No)</td> -->
              <td width="10%"><bean:message key="label.document.doccode"/><br>(<bean:message key="label.document.docno"/>)</td>
              <td width="40%"><bean:message key="label.document.description"/></td>
              <td width="20%"><bean:message key="label.document.status"/></td>
              <td width="16%"><bean:message key="label.document.transactiondate"/></td>
              <td width="16%"><bean:message key="label.global.action"/></td>
              <%if (!isView){%>
              <td><bean:message key="label.document.undo"/></td>
              <%}%>
            </tr>
          </thead>
          <tbody>
                <logic:present name="custDocItems">
                    <logic:iterate id="ob" name="custDocItems"  type="com.integrosys.cms.app.custodian.bus.OBCustodianDocItem" scope="page">
<%
			String rowClass="";
			sno++;
			if(sno%2!=0){
			    rowClass="odd";
			}else{
			    rowClass="even";                                  
			}
		    String docNo = String.valueOf(ob.getCheckListItemRefID());//ob.getDocRef();
		    docNo = (docNo==null || docNo.equals("") ||
                docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

		    long parentDocNoLong = ICMSConstant.LONG_INVALID_VALUE;
            //try..................
            if (ob.getCheckListItem() != null) {
                parentDocNoLong = ob.getCheckListItem().getParentCheckListItemRef();
            }
            //end try..
            String parentDocNo = String.valueOf(parentDocNoLong);
		    parentDocNo = (parentDocNo==null |parentDocNo.equals("") ||
                   parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>("+parentDocNo+")";


            //if current checklist item is linked (i.e. has a parent), get the master doc code
            String parentDocCode = "&nbsp;";
            if (parentDocNoLong!=0 && parentDocNoLong!=ICMSConstant.LONG_INVALID_VALUE)
			{
				ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
				parentDocCode = parentCheckListItem.getItem().getItemCode();
			}
			//ob is stagingItem
			OBCustodianDocItem item = null;
			OBCustodianDocItem actualItem = null;
            if (actualDocItems != null){
                for (Iterator iterator = actualDocItems.iterator(); iterator.hasNext();) {
                     item = (OBCustodianDocItem) iterator.next();
                     if (item != null &&
                        item.getCheckListItemRefID() == ob.getCheckListItemRefID())
                        actualItem = item;
                }
            }
            String displayStatus = "";
            try{
                if (actualItem == null) {
                    displayStatus = ob.getDisplayStatus(null,ob.getStatus());
                }
                else {
                    displayStatus = ob.getDisplayStatus(actualItem.getStatus(),ob.getStatus());
                }    
            } catch (Exception e){ displayStatus = ob.getStatus();}
            if (displayStatus == null)
                displayStatus = ob.getStatus();
            //CR-34 R1.3.1
            isReversalAllowed = true;
            if (displayStatus != null &&
                ( /*
                  displayStatus.indexOf("PENDING") > -1   ||
                  displayStatus.equals(ICMSConstant.STATE_LODGED) ||
                  displayStatus.equals(ICMSConstant.STATE_RELODGED) ||
                  displayStatus.equals(ICMSConstant.STATE_PERM_UPLIFTED) ||
                  displayStatus.equals(ICMSConstant.STATE_TEMP_UPLIFTED)
                  */
                  displayStatus.equals(ICMSConstant.STATE_RECEIVED) ||      
                  displayStatus.equals(ICMSConstant.STATE_AUTHZ_LODGE) ||
                  displayStatus.equals(ICMSConstant.STATE_CUST_PENDING_lODGE_REVERSAL) ||
                  displayStatus.equals(ICMSConstant.STATE_CUST_LODGED_REVERSAL ) ||
                  displayStatus.equals(ICMSConstant.STATE_AUTHZ_TEMP_UPLIFTED) ||
                  displayStatus.equals(ICMSConstant.STATE_CUST_PENDING_TEMP_UPLIFT_REVERSAL) ||
                  displayStatus.equals(ICMSConstant.STATE_AUTHZ_PERM_UPLIFTED) ||
                  displayStatus.equals(ICMSConstant.STATE_CUST_PENDING_PERM_UPLIFT_REVERSAL) ||
                  displayStatus.equals(ICMSConstant.STATE_AUTHZ_RELODGED) ||
                  displayStatus.equals(ICMSConstant.STATE_CUST_PENDING_RELODGE_REVERSAL) ||
                  displayStatus.equals(ICMSConstant.STATE_PERM_UPLIFTED) ||
                  displayStatus.equals(ICMSConstant.STATE_TEMP_UPLIFTED)        
                ))
            {
                isReversalAllowed = false;
            }
%>
            <tr class=<%=rowClass%>>
              <td class="index" ><%=sno%></td>

              <!--<td style="text-align:left">-->
              <%//<integro:empty-if-null value="<%//=parentDocCode%><%//"/>%>
              <%//<integro:empty-if-null value="<%//=parentDocNo%><%//"/>%>
              <!--</td> -->

              <td> <%=ob.getDocNo()!=null?ob.getDocNo():"&nbsp;"%><br>(<integro:empty-if-null value="<%=docNo%>"/>)</td>
              <td> <integro:empty-if-null value="<%=ob.getDocDescription()%>"/>&nbsp;</td>
              <td style="text-align:center">
              <%if (displayStatus != null && displayStatus.equals(ICMSConstant.STATE_ITEM_RECEIVED)){%>
                <%=ICMSConstant.STATE_ITEM_AWAITING%>
              <%}else{%>
              <integro:empty-if-null value="<%=displayStatus%>"/><%}%>&nbsp;</td>
              <td>
	            <%
	              // CMS-2183 : to show item last updated date instead of trx date
	              // CMS-2114 : take into consideration cpc cust status last update date
	              Date itmTrxDate = ob.getDisplayTrxDate();
	              if(itmTrxDate != null){
		        %>
	              <integro:date object="<%=itmTrxDate%>" />
                <%} else {%>- <%}%>
              </td>
              <%String tempScr = "callSubmit(this,'"+(sno-1)+"','"+ob.getCheckListItemRefID()+"','"+ob.getCustodianDocItemID()+"','"+itemCnt+"')";%>
              <td style="text-align:center"> <select name="menu1" onchange="<%=tempScr%>">
                  <option value="#" selected="selected">Please Select</option>
              <%if (!isView){%>
                  <%if(displayStatus.equals(ICMSConstant.STATE_PENDING_LODGE)) {%>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE%>"><bean:message key="label.document.custodian.status.lodge"/></option>
                  <%}%>
                  <% //if(displayStatus.equals(ICMSConstant.STATE_TEMP_UPLIFTED)){//TODO CANT INTEGRATE RELODGE AT THE MOMENT...%>
                  <!-- <option value="custodian.do?event=prepare_custodian_maker&trxId=<%=iCustTrxVal.getTransactionID()%>&checkListItemRef=<%=ob.getCheckListItemRefID()%>&custodianDocItemID=<%=ob.getCustodianDocItemID()%>&forId=cc&opcode=<%=ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE%>">Re-lodge</option> -->
                  <% //}%>
                  <%//if(displayStatus.equals(ICMSConstant.STATE_AUTHZ_PERM_UPLIFTED)){ 
                      if(displayStatus.equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT)){%>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_PERMUPLIFT%>"><bean:message key="label.document.custodian.status.permuplift"/></option>
                  <%}%>
                  <% //if(displayStatus.equals(ICMSConstant.STATE_AUTHZ_TEMP_UPLIFTED)){
                    if(displayStatus.equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT)){%>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_TEMPUPLIFT%>"><bean:message key="label.document.custodian.status.tempuplift"/></option>
                  <%}%>
                  <%//if(displayStatus.equals(ICMSConstant.STATE_AUTHZ_RELODGED)){
                    if(displayStatus.equals(ICMSConstant.STATE_PENDING_RELODGE)){  
                  %>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_RELODGE%>"><bean:message key="label.document.custodian.status.relodge"/></option>
                  <%}
                  if(isReversalAllowed && !displayStatus.equals(ICMSConstant.STATE_LODGED)){
                    reverseStatus = (String)reversalStateMap.get(displayStatus);
                    //DefaultLogger.debug(this, " reverseStatus " + reverseStatus);
                  %>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_PENDING_REVERSAL%>"><bean:message key="label.document.custodian.status.reverse"/></option>
                  <%}
                  if (displayStatus.equals(ICMSConstant.STATE_LODGED)){
                    reverseStatus = (String)reversalStateMap.get(displayStatus);
                  %>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_LODGE_REVERSAL%>"><bean:message key="label.document.custodian.status.reverse"/></option>
                  <%}
                  %>

            <%}
                  if(displayStatus.equals(ICMSConstant.STATE_PENDING_LODGE) ||
                     displayStatus.equals(ICMSConstant.STATE_RECEIVED)) {%>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW%>"><bean:message key="label.document.custodian.status.view"/></option>
                  <%}
                  else{%>
                  <option value="<%=ICMSUIConstant.CUSTODIAN_OP_CODE_VIEW%>"><bean:message key="label.document.custodian.status.view"/></option>
                  <%}%>
                </select>
                <input type="hidden" name="reverseStatusAr" value="<%=reverseStatus%>"/>
                </td>
              <%if (!isView){%>
                <td><input type="button" name="Submit" value="Undo" onclick="undo('<%=ob.getCheckListItemRefID()%>')" class="btnNormal"/></td>
              <%}%>
            </tr>
            </logic:iterate>
            </logic:present>

            <% if (stagingdocItems == null || stagingdocItems.size() == 0) //stagingdocItems
                {
            %>
                    <tr class="odd">
                  <%if (!isView){%>
                    <td colspan="8" class="label">
                  <%}else{%>
                    <td colspan="7" class="label">
                  <%}%>
                        <bean:message key="label.global.not.found"/>
                    </td>
                 </tr>
          </tbody>
        </table>

            <%}else
            { //CR-34 modification %>

          </tbody>
        </table>
            <br/>
            <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0"  class="tblInfo">
            <%//CR-34 %>
            <%if (!isClose && !isToTrack){%>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.document.reversal.remark"/></td>
              <td ><textarea name="reversalRemarks" rows="4" cols="100" onkeyup="limitTextInput(this.form.reversalRemarks, 1600, 'Reversal Remarks');"><% if (revRemarks != null && !revRemarks.equals("")){%><%=revRemarks%><%}%></textarea></td>
            </tr>
            <%}else {%>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.last.reversal.remark"/></td>
              <td><integro:htmltext value="<%=revRemarks%>" lineLength="90"/>&nbsp;</td>
            </tr>
            <%}%>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.document.reversal.remarkupdby"/></td>
              <td ><%if (stagingDoc.getReversalRmkUpdatedUserInfo() != null && !stagingDoc.getReversalRmkUpdatedUserInfo().equals("")){%>
              <%=stagingDoc.getReversalRmkUpdatedUserInfo()%>&nbsp;
              <%}else{%>
              -
              <%}%></td>
            </tr>
            <%//CR-34%>

            <%if (ICMSConstant.STATE_REJECTED.equals(status)){%>

            <%if (!isClose){%>
            <tr>
              <td class="fieldname"><bean:message key="label.security.remarks"/></td>
              <td class="odd"><textarea name="remarks" rows="4" cols="100"></textarea></td>
            </tr>
          <%}%>
            <tr>
              <td class="fieldname"><bean:message key="label.last.action.by"/></td>
              <td class="even"><%=lastActionBy%>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
              <td><integro:htmltext value="<%=remarks%>" lineLength="90"/>&nbsp;</td>
            </tr>
            <%}%>
            </table>
            <br/>

            <!-- This section added to show location for the document item and security envelope-->


            <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td valign="baseline" align="center">&nbsp;</td>
              <td valign="baseline" align="center">&nbsp;</td>
            </tr>
            <tr>
              <%if (!isView){%>
               
                <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSubmit','','img/submit2.gif',1)"><img src="img/submit1.gif" name="ImageSubmit"  border="0" id="ImageSubmit" /></a>
                </td>
            	
                <td width="100" valign="baseline" align="center"> <a href="javascript:savePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                </td>
                <td width="100" valign="baseline" align="center"> <a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                </td>                                                   
              <%}else if(isClose){%>
                  <td width="100" valign="baseline" align="center"> <a href="javascript:closePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageClose','','img/close2a.gif',1)"><img src="img/close1a.gif" name="ImageClose"  border="0" id="ImageClose" /></a>
                  </td>
                  <td width="100" valign="baseline" align="center"> <a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                  </td>
              <%} if (isToTrack){%>
                  <td width="100" valign="baseline" align="center"> <a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                  </td>
              <%}%>

            </tr>
            <tr>
              <td valign="baseline" align="center">&nbsp;</td>
              <td valign="baseline" align="center">&nbsp;</td>
            </tr>
            </Table>
            <%}// CR-34 modification end %>
      </td>
    </tr>
  </tbody>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>