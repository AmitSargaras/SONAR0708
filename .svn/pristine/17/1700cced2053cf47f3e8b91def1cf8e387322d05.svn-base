<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm,
                 com.integrosys.cms.ui.common.CheckListItemActionList,
                 com.integrosys.cms.ui.common.DeletedCheckListItemActionList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Date, 
                 java.util.HashMap,
                 java.util.ArrayList,
                 com.integrosys.cms.app.common.constant.PropertiesConstantHelper"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ICheckListTrxValue checkListTrxVal = (ICheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptAction.checkListTrxVal");
    ICheckList checkList = (ICheckList) session.getAttribute("com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptAction.checkList");
    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    //Refresh
    //boolean checkListRejected = ( checkListTrxVal.getStatus()).equals(ICMSConstant.STATE_REJECTED);
    String custTypeTrxID = (new Long(checkListTrxVal.getTransactionID())).toString();
    String customerID = (new Long(checkListTrxVal.getCustomerID())).toString();

    String remarks = "";
    String lastActionBy = "";
    if (checkList != null) {
        pageContext.setAttribute("checkList", checkList);
    }

    int row = 0;
    int itemIndex = 0;
    String status = "";
    if (checkListTrxVal != null) {
        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";

    CCReceiptForm aForm = (CCReceiptForm) request.getAttribute("CCReceiptForm");
    //String cCode = "";
    String cName = "";
    if (cName.equals("")) {
        cName = aForm.getLimitBkgLoc();
    }
    String entryEvent = request.getParameter("event");//+++
    if (entryEvent == null) entryEvent = "";

    ICheckListItem[] checkListItems = checkList.getCheckListItemList();
    String revRmkUpdUserInfo = "";
    String revRemarks = null;
    if (checkList != null) {
        revRemarks = checkList.getReversalRemarks();
        revRmkUpdUserInfo = checkList.getReversalRmkUpdatedUserInfo();
    }
    revRemarks = revRemarks == null ? "-" : revRemarks;
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function callSubmit(itemStatus,selObj,ind, shared) {
	formObj = document.forms["CCReceiptForm"];
    temp = selObj.options[selObj.selectedIndex].value;
    document.forms[0].itemStatus.value=itemStatus;
    if(temp=="") {
        return false;
    }else if (shared == 'true' &&
              (selObj.options[selObj.selectedIndex].value == 'ALLOW_PERM_UPLIFT' ||
               selObj.options[selObj.selectedIndex].value == 'DELETE')) {
        alert("Action is not allowed as document is shared");
    }else{
        formObj.event.value = selObj.options[selObj.selectedIndex].value;
		formObj.index.value = ind;
        formObj.actionTypeName.value = selObj.options[selObj.selectedIndex].value;
		formObj.submit();
    }
}

function undo(checkListItemRef) {
	formObj = document.forms["CCReceiptForm"];
    formObj.event.value = "undo";
	formObj.checkListItemRef.value = checkListItemRef;
	formObj.submit();
}

function submitForm(){
  //   if (checkFieldSize(document.forms[0].makerStatus, 2000, 'Status')) {
	formObj = document.forms["CCReceiptForm"];
      formObj.event.value = "submit";
    	formObj.submit();
  //   }
}

function saveForm() {
 //    if (checkFieldSize(document.forms[0].makerStatus, 2000 , 'Status')) {
      formObj = document.forms["CCReceiptForm"];
      formObj.event.value = "save";
   	formObj.submit();
//     }
}

function checkFieldSize(field, length, fname) {
  if (field.value.length > length)  {
    alert("The maximum size for " + fname + " field is " + length + " characters.");
    field.focus();
    return false;
  }
  return true;
}

function refreshPage(index) {
    document.forms[0].event.value="maker_refresh_comment";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

function calculateDaysDeficient(cal, dateStr) {
	cal.sel.value = dateStr;
	if (dateStr != null && dateStr != '') {
		var deficientDate = convertStrToDate(dateStr);
		var todayDate = new Date();
		todayDate = clearTime(todayDate);
		if (deficientDate < todayDate) {		
			diff = calculateDaysDiff(deficientDate, todayDate);
		} else {
			diff = 0;
		}
		document.forms[0].daysDeficient.value=diff;
		document.forms[0].nextActionDateImg.disabled=false;
	} else {
		document.forms[0].daysDeficient.value='';
		document.forms[0].nextActionDate.value='';
		document.forms[0].nextActionDateImg.disabled=true;
	}
}

function expressComplete() {
    var formObj = document.forms[0];
    var k = 0;
    var temp = "";

    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'expressCheck') {
            var obj = formObj.elements[i];
            if ((obj.checked)) {
                temp = temp + "," + obj.value;
            }
        }
    }

    if (temp == "") {
        alert('There is no record selected!');
        return false;
    }
    temp = temp.substring(1);
    formObj.event.value = "express_complete";
    formObj.expressCompletionIndex.value = temp;
    formObj.submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CCReceipt" >
<input type="hidden" name="entryEvent" value="<%=entryEvent%>" />
<input type="hidden" name="event" />
<input type="hidden" name="commentIndexID"/>
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />
<input type="hidden" name="checkListItemRef" />
<input type="hidden" name="itemStatus" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />
<input type="hidden" name="expressCompletionIndex" />
<input type="hidden" name="actionTypeName" />

<html:hidden property="limitProfileID" />
<html:hidden property="checkListID" /> 
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />
<html:hidden property="legalConstitution" />

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Update Constitutional/Contractual Doc Receipt</h3>

      </td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
	<%
    ICheckListOwner owner = checkList.getCheckListOwner();
    if (owner instanceof ICCCheckListOwner) {
        ICCCheckListOwner ccowner = (ICCCheckListOwner) owner;
        String categoryLabel = PropertyManager.getValue("cc.category." + ccowner.getSubOwnerType());
        categoryLabel = (categoryLabel == null) ? ccowner.getSubOwnerType() : categoryLabel;
	%>  
	<tr> <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Customer Category</td>
              <td colspan="3"><%=categoryLabel%></td>
            </tr>
            <tr class="even">
              <td class="fieldname">CIF No</td>
              <td>
		<% if (ccowner.getLegalReference() != null) { %>
			<%= ccowner.getLegalReference()%>
		<% } else { %>-<% } %>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Customer Name</td>
              <td><%= ccowner.getLegalName()%></td>
            </tr>
			<% boolean hasPledgor = false; %>
<%--
			<%  if (ICMSConstant.CHECKLIST_PLEDGER.equals(ccowner.getSubOwnerType())) {
			            hasPledgor = true; %>  
			<tr class="even">
	          <td class="fieldname">Pledgor ID</td>
	          <td><%= ccowner.getSubOwnerReference()%></td>
	        </tr>
			<% } %> 
--%>
            <tr class="<%=hasPledgor?"odd":"even"%>">
              <td class="fieldname">Checklist ID</td>
              <td><%=checkListTrxVal.getCheckList().getCheckListID()%></td>
            </tr>
            <tr class="<%=hasPledgor?"even":"odd"%>">
              <td class="fieldname">Checklist Status</td>
                <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) ==null) ?
                        checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
                </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
	<%  } %>

      <%
          String applicationType = limitProfile.getApplicationType();
          String expressProcessAppTypeList = PropertyManager.getValue("chklist.expressprocessing.applicationtype");
          boolean expressProcess = false;
          if (expressProcessAppTypeList!=null && applicationType !=null &&
                  expressProcessAppTypeList.indexOf(applicationType) != -1) {
              expressProcess = true;
      %>
      <tr>
        <td valign="bottom">
            <table width="98%" border="0"  align="left" cellpadding="0" cellspacing="0">
            <tr>
              <td>&nbsp; </td>
            </tr>
            <tr>
                <td width="98%" valign="baseline" align="right">
                  <input type="button" name="Submit" value="Complete" class="btnNormal" onclick="expressComplete()"/>
                </td>
            </tr>
            </table>
        </td>
      </tr>
      <% } %>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="2%">S/N</td>
              <td width="4%">Mandatory</td>
              <td width="4%">Doc Code</td>
              <td width="4%">Doc No</td>
              <td width="6%">Description</td>
              <td width="4%">Pre-Approval Document</td>
              <td width="5%">To Vault</td>
              <td width="8%">Doc Status</td>
              <td width="6%">Txn Date</td>
              <td width="6%">Doc Expiry Date</td>
              <td width="8%">Action Party</td>
              <td width="8%">Cust Status</td>
              <td width="8%">Cust Txn Date</td>
              <td width="10%">Action</td>
              <% if(expressProcess) { %> <td width="10%">Select</td> <% } %>
<%--    
			<td width="5%">In Vault</td>
			<td width="5%">Ext Cust</td>
			<td width="5%">Audit</td>
			<td width="8%">Doc Status</td>
			<td width="6%">Txn Date</td>
			<td width="6%">Cust Status</td>
			<td width="6%">Cust Txn Date</td>
			<td width="6%">Identify Status</td>
			<td width="5%">Shared</td>
			<td width="5%">App-roved</td>
			<td width="8%">Action Party</td>
			<td width="10%">Action</td>
			<td width="5%">Undo</td>  
--%>  
            </tr>
          </thead>
          <tbody>
<logic:notEmpty name="checkList" property="checkListItemList" >
<logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
   <%
        //System.out.println("Testing CC : " + OB.toString());
		itemIndex++;
		pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
   %>
<logic:equal name="toDisplayCheckListItem" value="true">
<%
	row++;
    String rowClass = "";
    if (row % 2 != 0) {
        rowClass = "odd";
    } else {
        rowClass = "even";
    }
    boolean inherited = false;
    boolean mandatory = false;
    boolean inVault = false;
    boolean extCustodian = false;
    boolean audit = false;
    boolean approved = false;
    boolean shared = false;

    if (OB.getIsInherited()) {
        inherited = true;
    }
    if (OB.getIsMandatoryInd()) {
        mandatory = true;
    }
    if (OB.getIsInVaultInd()) {
        inVault = true;
    }
    if (OB.getIsExtCustInd()) {
        extCustodian = true;
    }
    if (OB.getIsAuditInd()) {
        audit = true;
    }
    if (OB.getIsApprovedInd()) {
        approved = true;
    }
    if (OB.getShared()) {
        shared = true;
    }

    ArrayList a1 = null;
    ArrayList a2 = null;
    if (ICMSConstant.STATE_DELETED.equals(checkList.getCheckListStatus())) {
        DeletedCheckListItemActionList delActList = DeletedCheckListItemActionList.getInstance(OB);
        a1 = new ArrayList(delActList.getOperationLabels());
        a2 = new ArrayList(delActList.getOperationValues());
    } else {
        CheckListItemActionList actList = CheckListItemActionList.getInstance(OB);
        a1 = new ArrayList(actList.getOperationLabels());
        a2 = new ArrayList(actList.getOperationValues());
    }
    if (a1 != null)
        pageContext.setAttribute("actionLabels", a1);
    if (a2 != null)
        pageContext.setAttribute("actionValues", a2);


    long docNoLong = OB.getCheckListItemRef();
    String docNo = String.valueOf(docNoLong);
    docNo = (docNo == null || docNo.equals("") || docNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNo;

    long parentDocNoLong = OB.getParentCheckListItemRef();
    String parentDocNo = String.valueOf(parentDocNoLong);
    parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

    //if current checklist item is linked (i.e. has a parent), get the master doc code
    String parentDocCode = "&nbsp;";
    if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
        ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
        parentDocCode = parentCheckListItem.getItem().getItemCode();
    }

    //String custDocStatus = CheckListUtil.getCPCCustodianStatus(OB);

    IShareDoc[] shareCheckList = OB.getShareCheckList();
    boolean isShareDocViewable = false;
    if (shareCheckList != null && shareCheckList.length > 0) {
        if (OB.getViewable()) {
            isShareDocViewable = true;
        }
    }
    
    String ccStatus = OB.getCPCCustodianStatus() == null ? "" : (OB.getCPCCustodianStatus().equals(ICMSConstant.STATE_RECEIVED) ? ICMSConstant.STATE_AWAITING : OB.getCPCCustodianStatus());

%>
			<tr class="<%=rowClass%>">
              <td class="index" ><%=row%></td>
              <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled="true" />
            <%}%></td>
<%-- 
		<td style="text-align:left"><%=parentDocCode%><%=parentDocNo%></td>  
--%> 
              <td><bean:write name="OB" property="item.itemCode" /></td>
              <td><%=docNo%></td>
              <td>&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
              <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>
              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled />
		  </td>
              
<%--   
		<td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled />
		  </td>
		  <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>  disabled />
		  </td>
		  <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled /></td>
--%> 
               
              <td>&nbsp;<bean:write name="OB" property="itemDisplayStatus" /></td>
              <td>
                <%if(OB.getLastUpdateDate()!=null){%>
                <integro:date object="<%=OB.getLastUpdateDate()%>" />
                <%} else {%>- <%}%>
              </td>
              <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
              <%--<td> &nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=OB.getActionParty()%>" display="true" descWithCode="false"/></td>--%>

                <%--// to show Code instead of Description--%>
                <td> &nbsp;<integro:empty-if-null value="<%=OB.getActionParty()%>"/></td>
                
              <td>&nbsp; <center><integro:empty-if-null value="<%=ccStatus%>"/></center></td>

<%--
			<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=custDocStatus%>"/></td>
--%>			
              <td>
	               <% // CMS-2114 : take into consideration cpc cust status last update date
	               Date custTrxDate = OB.getDisplayCustodianTrxDate();
	               if (custTrxDate != null) { %>
	               	<integro:date object="<%=custTrxDate%>" />
	               <%} else {%>-<%}%>
			</td>

<%--      <td style="text-align:center">&nbsp;
              <%if(OB.getIdentifyDate() != null) {%>
              Y
              <%}else{%>
              N
              <%}%></td>
               <td style="text-align:center">&nbsp; <%if(shared) out.println("Y"); else out.print("N");%></td>
              <td style="text-align:center">&nbsp;<%if(approved) out.println("Y"); else out.print("N");%></td>
--%>
              <td>
              <% 
              String tempScr = "callSubmit('"+OB.getItemStatus()+"',this,'"+(itemIndex-1)+"', '"+shared+"')"; %>
                  <html:select property="actionType" onchange='<%=tempScr%>' >
                	<option value="" >Please Select </option>
                  <%  if (isShareDocViewable){   %>
                      <option value="<%=ICMSConstant.STATE_ITEM_VIEW_COMPLETED%>"><%=ICMSConstant.ACTION_ITEM_VIEW %></option>
                  <% }else{  %>
                  <%	   for (int i=0; i<a2.size(); i++){
							
                           	String optionVal = (String)a2.get(i);
                            System.out.println("LALA " + i + " : " + optionVal);
                                if (optionVal!=null){
							//do not display DELETE option if checklist item is a parent
                            if (ICMSConstant.STATE_TEMP_UPLIFTED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal))
                            {%>
                                    <option value="<%=optionVal%>"><%=ICMSConstant.ACTION_RELODGE_CUSTODIAN_DOC %></option>
                            <%}
                            else if (ICMSConstant.STATE_PERM_UPLIFTED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal))
                            {%>
                            <option value="<%=optionVal%>"><%=ICMSConstant.ACTION_RELODGE_CUSTODIAN_DOC %></option>
                    		<%}
                            else if (ICMSConstant.STATE_ITEM_COMPLETED.equalsIgnoreCase(OB.getItemStatus()) && ICMSConstant.ACTION_LODGE_CUSTODIAN_DOC.equalsIgnoreCase(optionVal) && (OB.getIsInVaultInd() == false))
                            {
                            	//Documents that are not in vault are not allowed to be perform any cross modules
                            }
                            else if (!optionVal.equals(ICMSConstant.ACTION_ITEM_DELETE)
                                 || (optionVal.equals(ICMSConstant.ACTION_ITEM_DELETE) &&
                                 !CheckListHelper.isParent(checkListItems, docNoLong)))	{
%>								<option value="<%=(String)a2.get(i)%>"><%=(String)a1.get(i)%></option>
<%							}
						}
					}
                  }
%>
                  </html:select>
              </td>
              <% if(expressProcess) {
                      if((ICMSConstant.STATE_AWAITING.equals(OB.getItemStatus())
                      || ICMSConstant.STATE_RECEIVED.equals(OB.getItemStatus())
                      || ICMSConstant.STATE_ITEM_RENEWED.equals(OB.getItemStatus()))) { %>
                <td style="text-align:center">
                        <input type="checkbox" name="expressCheck" value="<%=itemIndex-1%>"/>
                </td>
                    <% } else { %>
                <td>&nbsp;</td>
              <% } }%>

<%--   
			<td style="text-align:center">
               <%  if (!isShareDocViewable){   %>
                <input type="button" name="Submit" value="Undo" onclick="undo('<%=OB.getCheckListItemRef()%>')" class="btnNormal"/>
                <%} %>&nbsp;
                </td>   
--%>
            </tr>
</logic:equal>
</logic:iterate>
</logic:notEmpty>
<logic:empty name="checkList" property="checkListItemList" >
            <tr class="odd">
              <td colspan="14">There is no document</td>
            </tr>
</logic:empty>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%if (ICMSConstant.STATE_REJECTED.equals(status)) { %>
    <p/><p/> <p/>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
            <tr>
                <td class="fieldname">Remarks</td>
                <td class="odd"><textarea name="remarks" rows="4" cols="100" onkeyup="limitTextInput(this,250,'Remarks')"></textarea></td>
            </tr>
            <tr>
                <td class="fieldname">Last Action By</td>
                <td class="even">&nbsp;<%=lastActionBy%></td>
            </tr>
            <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value="<%=remarks%>"/>&nbsp;</td>
            </tr>
        </tbody>
    </table>
<% } %>

<%--
				<p>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
				    <thead>
				    <tr>
				      <td colspan="4">
				        <div align="left">Legal Firm Handling the Case</div>
				      </td>
				    </tr>
				    </thead> <tbody>
				    <tr class="even">
				      <td class="fieldname">Name of Legal Firm</td>
				      <td colspan="3">
				        <html:select property="legalFirm">
				         <option value="" >Please Select</option>
						  <html:options name="legalFirmValues" labelName="legalFirmLabels"/>
				        </html:select>
				      </td>
				    </tr>
				  </tbody>
				</table>  
				<br>  

				 <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
				    <thead>
				    <tr>
				      <td colspan="4">
				        <div align="left">Document Status</div>
				      </td>
				    </tr>
				    </thead> <tbody>
				    <tr class="even">
				      <td class="fieldname">Status</td>
				      <td colspan="3"><html:textarea property="makerStatus" rows="4" cols="90" onkeydown="limitTextInput(this.form.makerStatus, 2000, 'Status');"
				onkeyup="limitTextInput(this.form.makerStatus, 2000, 'Status');"/></td>
				    </tr>
				    <tr class="odd">
						<td width="20%" class="fieldname">Date of Deficiency Identified</td>
				      	<td width="30%" ><html:text property="deficiencyDate" size="12" maxlength="12" readonly="true" />
				        	<img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendarWithCustomHandling('deficiencyDate', 'dd/mm/y', calculateDaysDeficient);" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
				        	<html:errors property="deficiencyDate"/>
				      	</td>             
				      	<td width="20%" class="fieldname">Days Deficient</td>
				      	<td width="30%">
				      		<html:text property="daysDeficient" readonly="true"/>&nbsp;
				      	</td>
				    </tr>
				
				    <tr class="even">
						<td class="fieldname">Next Action Date</td>
				      	<td><html:text property="nextActionDate" size="12" maxlength="12" readonly="true" />
				        	<img src="img/calendara.gif" <%=(aForm.getDeficiencyDate()!=null && aForm.getDeficiencyDate().length() > 0)?"":"disabled"%> name="nextActionDateImg" border="0" id="nextActionDateImg" onclick="return showCalendar('nextActionDate', 'dd/mm/y');" onmouseover="MM_swapImage('nextActionDateImg','','img/calendarb.gif',1)" /> 
				        	<html:errors property="nextActionDate"/>
				      	</td>             
				      	<td class="fieldname">&nbsp;</td>
				      	<td>&nbsp;</td>    
				    </tr>

				    </tbody>
				  </table>

				
				<p/>
				<p/>
				<p/>
								<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
								  <tbody>
				<%if(ICMSConstant.STATE_REJECTED.equals(status) || ICMSConstant.STATE_OFFICER_REJECTED.equals(status) || ICMSConstant.STATE_DRAFT.equals(status)) { %>
									<tr>
									  <td class="fieldname">Remarks</td>
									  <td class="odd"><textarea name="remarks" rows="4" cols="100" onkeyup="limitTextInput(this.form.remarks, 250, 'Remarks');"></textarea></td>
									</tr>
									<tr>
									  <td class="fieldname">Last Action By</td>
									  <td class="even">&nbsp;<%=lastActionBy%></td>
									</tr>
									<tr class="odd">
									  <td class="fieldname">Last Remarks Made</td>
									  <td><integro:htmltext value="<%=remarks%>" lineLength="100"/>&nbsp;</td>
									</tr>
				<% } %>
				                    <tr class="even">
				                        <td class="fieldname">Last Reversal Remarks</td>
				                        <td><integro:htmltext value="<%=revRemarks%>" lineLength="100"/>&nbsp;</td>
				                    </tr>
				                    <tr class="odd">
				                        <td class="fieldname">Reversal Remarks Updated By</td>
				                        <td ><%if (revRmkUpdUserInfo != null && !revRmkUpdUserInfo.equals("")){%>
				                        <%=revRmkUpdUserInfo%>&nbsp;
				                    <%}else{%>
				                    -
				                    <%}%></td>
				                    </tr>
				
								  </tbody>
				                </table>
				                
				  <% if (1==1) { %>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
				  <tr>
				    <td width="77%">
				      <h3>History of Comments</h3>
				    </td>
				   </tr>
				  <tr>
				    <td colspan="3">
				      <hr />
				    </td>
				  </tr>
				  <tr>
				    <td colspan="3">
				      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
				        <thead>
				        <tr>
				          <td width="5%">S/N</td>
				          <td width="19%"> Date/Time</td>
				          <td width="22%">Made By</td>
				          <td width="54%">Comments</td>
				        </tr>
				        </thead>
				        <tbody>
				        <%
				            OBCMSTrxHistoryLog[] commentList = (OBCMSTrxHistoryLog[]) checkListTrxVal.getTransactionHistoryCollection().toArray(new OBCMSTrxHistoryLog[0]);
				            if (commentList == null || commentList.length == 0) {
				        %>
				        <tr class="odd"><td colspan="4">There is no comment.</td></tr>
				        <%
				            } else {
				                for (int i = 0; i < commentList.length; i++) {
				        %>
				        <tr class="<%=i%2==0?"odd":"even"%>">
				          <td class="index" width="5%"><%=i + 1%></td>
				          <td style="text-align:center" width="19%"><integro:empty-if-null value="<%=commentList[i].getLogDate()%>"/>&nbsp;</td>
				          <td width="22%"><integro:empty-if-null value="<%=commentList[i].getLogUserName()%>"/>&nbsp;
				          (<integro:empty-if-null value="<%=commentList[i].getLogGroupName()%>"/>)
				          </td>
				          <%
				                    String commentStr = commentList[i].getRemarks();
				                    if (commentStr != null && commentStr.length() > 65) {
				                        commentStr = commentStr.substring(0,65)+"  ...";
				                    }
				          %>
				          <td  width="54%">
				          <% if (commentStr != null && commentStr.length() > 0) { %>
				            <a href="#" onclick="refreshPage(<%=i%>)"><integro:empty-if-null value="<%=commentStr%>"/></a>
				          <% }
				          	 else if (commentStr==null || (commentStr!=null && commentStr.equals("")))
				          	 {
				          %>
				          	 	-
				          <% }
				          %>
				          </td>
				        </tr>
				        <%
				                }
				            }
				        %>
				        <tr class="odd">
				          <td class="Total" style="text-align:center" width="5%">&nbsp;</td>
				          <td width="19%" class="Total">&nbsp;</td>
				          <td width="22%" class="Total">&nbsp;</td>
				          <td width="54%" class="Total" style="text-align:right">&nbsp;</td>
				        </tr>
				        </tbody>
				      </table>
				    </td>
				  </tr>
				  <thead>
				  </thead> <tbody>
				  </tbody>
				</table>
				<br>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
				  <tr>
				    <td width="77%">
				      <h3>Comments Selected</h3>
				    </td>
				  </tr>
				  <tr>
				    <td colspan="3">
				      <hr />
				    </td>
				  </tr>
				  <tr>
				    <td colspan="3">
				      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
				        <tr class="odd">
				      <%
				          String indexID = request.getParameter("commentIndexID");
				          if (indexID == null || indexID.trim().length() == 0) {
				      %>
				      <td colspan="2">There is no comment selected.</td>
				      <%
				          } else {
				              OBCMSTrxHistoryLog historylog = commentList[Integer.parseInt(indexID)];
				      %>
				          <td class="fieldname" width="11%">
				            <integro:empty-if-null value="<%=historylog.getLogUserName()%>"/>&nbsp;
				            (<integro:empty-if-null value="<%=historylog.getLogGroupName()%>"/>)
				          </td>
				          <td width="89%"><integro:wrapper value="<%=historylog.getRemarks()%>"/>&nbsp;
				          </td>
				        <%
				          }
				        %>
				        </tr>
				      </table>
				    </td>
				  </tr>
				</table>
				<p>
				<p>
				<% } %>
--%>
<!-- End OFFICE HISTORY -->
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image12"  border="0" id="Image12" /></a></td>
    <td><a href="#" onClick="saveForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('saveImage2','','img/save2.gif',1)"><img src="img/save1.gif" name="saveImage2"  border="0" id="saveImage2" /></a></td>
     <%if (ICMSConstant.STATE_REJECTED.equals(status) || ICMSConstant.STATE_DRAFT.equals(status)) { %>
            <td width="100" valign="baseline" align="center">
                <a href="ToDo.do" onmouseout="MM_swapImgRestore()"  onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
                    <img src="img/cancel1.gif"  name="Image1" border="0" id="Image1"/></a>
            </td>
        <%} else {%>
            <td width="100" valign="baseline" align="center">
                <a href="CCReceipt.do?event=list" onmouseout="MM_swapImgRestore()"   onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
                    <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
            </td>
        <%}%>




  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>