<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.ui.common.CheckListItemActionList,
                 com.integrosys.cms.ui.common.LegalFirmList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.Date, java.util.HashMap,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 java.util.ArrayList"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 	ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isCPCChecker=false;
  	TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPC_CHECKER){
                    isCPCChecker = true;
                    break TOP_LOOP;
                }
            }
        }
  	}

    ICheckListTrxValue checkListTrxVal =(ICheckListTrxValue)session.getAttribute("com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptAction.checkListTrxVal");
    ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptAction.checkList");
    String remarks = "";
    String lastActionBy = "";
    if(checkList!=null)
        pageContext.setAttribute("checkList",checkList);
    int row = 0;
    if(checkListTrxVal!=null){
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    String cName = "";
    if(cName.equals("")) {
        CCReceiptForm aForm = (CCReceiptForm)request.getAttribute("CCReceiptForm");
        cName = aForm.getLimitBkgLoc();
    }
	String flag= "";
	flag = (String)request.getAttribute("flag");
    if (flag == null) {
        flag = (String)request.getParameter("flag");
        if (flag == null) flag="";
    }

    boolean toTrack = false;
    boolean checkerEdit = false;
    String previous = request.getParameter("previous");
    if (previous == null || previous.length() == 0) {
        String event = request.getParameter("event");
        if (event.equals("view") && isCPCChecker) {
	        previous = "checkerEdit";
        } else {
	        //previous = request.getParameter("event");
	        previous = event;
        }
    }
    if("to_track".equals(previous)){//OFFICE
        toTrack = true;
    }
    if ("checkerEdit".equals(previous)) {
	    checkerEdit = true;
    }

/*
    String event = request.getParameter("event");
    if("to_track".equals(event)||( "track_refresh_comment".equals(event)&& !"Close".equals(flag) )){//OFFICE
        toTrack = true;
    }
*/

	//Start CR-380
	String countryCode="none";
	if(checkList.getCheckListLocation() != null && checkList.getCheckListLocation().getCountryCode() != null ){
		countryCode=checkList.getCheckListLocation().getCountryCode();
	}
	LegalFirmList lList = LegalFirmList.getInstance(countryCode);
	//End CR-380
    String revRmkUpdUserInfo = "";
    String revRemarks = null;
    if (checkList != null)
    {
        revRemarks = checkList.getReversalRemarks();
        revRmkUpdUserInfo = checkList.getReversalRmkUpdatedUserInfo();
    }
    revRemarks = revRemarks==null?"-":revRemarks;

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

<script language="JavaScript" type="text/JavaScript">
<!--

function view(itemRef) {
    document.forms[0].event.value="view_receipt";
    document.forms[0].itemRef.value=itemRef;
    document.forms[0].submit();
//    url = "CCReceipt.do?event=chk_view&itemRef="+itemRef;
//    window.location.href = url;
}

function goView(itemRef, checkListID,legalConstitution){
    formObj = document.forms["CCReceiptForm"];
    formObj.event.value="view_receipt";
    formObj.itemRef.value = itemRef;
//    formObj.checkListID.value = checkListID;
//    formObj.legalConstitution.value = legalConstitution;
    formObj.submit();
}
function refreshPage(index) {
    document.forms[0].event.value="track_refresh_comment";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

function checkerUpdate() {
    var test = document.forms[0].makerStatus.value;

    if (test.length > 2000) {
	    alert('Status field can be only 2000 Characters');
	    return false;
    }

	document.forms[0].event.value="checker_update";
	document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif','img/confirm2.gif','img/submit2.gif')">
<html:form action="CCReceipt" >
<input type="hidden" name="event" />
<input type="hidden" name="flag" value="<%=flag%>" />
<input type="hidden" name="previous" value="<%=previous%>"/>
<input type="hidden" name="commentIndexID"/>
<%-- for check boxes--%>
<input type="hidden" name="mandatoryRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />
<input type="hidden" name="checkListItemRef" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />
<input type="hidden" name="actionTypeName" />

<input type="hidden" name="itemRef" />
<input type="hidden" name="checkListID"/>
<input type="hidden" name="legalConstitution"/>

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />


<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>
          <h3>
              <%//=("Cancel".equals(flag)?"Close":flag)%>
              <%
                if(flag.equals("Cancel")){
              %>
                    <bean:message key="title.ccdoc.doc.receipt.close"/>
              <%
                }else{
              %>
                    <bean:message key="title.ccdoc.doc.receipt.view"/>    
              <%
                }
              %>
          </h3>
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

%>  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.customer.category"/></td>
              <td><%=categoryLabel%></td>
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.custName"/></td>
              <td><%= ccowner.getLegalName()%></td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.ccdoc.docitem.cifNo"/></td>
              <td>
<%          if (ccowner.getLegalReference() != null)
            {
%>              <%= ccowner.getLegalReference()%>
<%          }
            else
            {
%>              -
<%          }%>
              </td>
               <td class="fieldname"><bean:message key="label.document.checklistID"/></td>
               <td><%=checkListTrxVal.getCheckList().getCheckListID()%></td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.security.docitem.checkliststatus"/></td>
                <td><%= (PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus()) ==null) ?
                        checkList.getCheckListStatus() : PropertyManager.getValue("chklist.status." + checkList.getCheckListStatus())%>
                </td>
                <td class="fieldname"><bean:message key="label.document.application.type"/></td>
                <td>
                   <integro:common-code-single categoryCode="APPLICATION_TYPE" entryCode="<%=checkList.getApplicationType()%>" display="true" descWithCode="false"/>&nbsp;
                </td>
            </tr>
<%     // boolean hasPledgor = false; %>
<%--
<%        if (ICMSConstant.CHECKLIST_PLEDGER.equals(ccowner.getSubOwnerType()))
            {
            hasPledgor = true;
%>          <tr class="even">
              <td class="fieldname">Pledgor ID</td>
              <td><%= ccowner.getSubOwnerReference()%></td>
            </tr>
<%         }%>
--%>
          </tbody>
        </table>
      </td>
    </tr>
<%  }%>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td> <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="2%"><bean:message key="label.global.sn"/></td>
              <td width="4%"><bean:message key="label.security.docitem.mandatory"/></td>
              <td width="4%"><bean:message key="label.document.doccode"/></td>
              <td width="4%"><bean:message key="label.document.docnumber"/></td>
              <td width="6%"><bean:message key="label.document.description"/></td>
              <td width="4%"><bean:message key="label.security.docitem.preapproval"/></td>
              <td width="4%"><bean:message key="label.security.docitem.tovault"/></td>
              <td width="8%"><bean:message key="label.document.docstatus"/></td>
              <td width="6%"><bean:message key="label.document.txndate"/></td>
              <td width="6%"><bean:message key="label.document.docexpirydate"/></td>
              <td width="10%"><bean:message key="label.ccdoc.docitem.actionparty"/></td>
              <!-- Customize for alliance, Commented unuse column-->  
              <%//<td width="8%"><bean:message key="label.security.remarks"/></td>%>
              <td width="10%"><bean:message key="label.document.custstatus"/></td>
              <td width="10%"><bean:message key="label.document.custtxndate"/></td>
              <td width="10%"><bean:message key="label.global.action"/></td>
              
<%--              
              <td width="2%">S/N</td>
              <td width="4%">Manda-tory for SCC</td>
              <td width="4%">Master Doc Code (Doc No)</td>
              <td width="4%">Doc Code<br>(Doc No)</td>
              <td>Description</td>
              <td width="6%">SCC Issued</td>
              <td width="5%">In Vault</td>
              <td width="5%">Ext Cust</td>
              <td width="5%">Audit</td>
              <td width="8%">Doc Status</td>
              <td width="6%">CPC Txn Date</td>
              <td width="6%">Cust Status</td>
              <td width="6%">Cust Txn Date</td>
              <td width="6%">Identify Status</td>
<%--Start for  cr-17              
              <td width="5%">Shared</td>
<%--End for  cr-17            
              <td width="5%">App-roved</td>
              <td width="8%">Action Party</td>
              <td width="8%">Remarks</td>
--%>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkList" property="checkListItemList" >
		   <logic:iterate id="OB" name="checkList"  property="checkListItemList" type="com.integrosys.cms.app.checklist.bus.ICheckListItem"  >
   <%
		pageContext.setAttribute("toDisplayCheckListItem", CheckListHelper.toDisplayCheckListItem(OB) ? "true" : "false");
   %>
<logic:equal name="toDisplayCheckListItem" value="true">
<%
    String rowClass = "";
    row++;
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
    CheckListItemActionList actList = CheckListItemActionList.getInstance(OB);
    ArrayList a1 = new ArrayList(actList.getOperationLabels());
    ArrayList a2 = new ArrayList(actList.getOperationValues());
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

    String custDocStatus = CheckListUtil.getCPCCustodianStatus(OB);
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
              <td style="text-align:left"><bean:write name="OB" property="item.itemCode" /></td>
              <td ><%=docNo%></td>
              <td>&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
              <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>

              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />
              </td>
<%--
              <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled="true" /></td>
--%>
              <td>&nbsp;<bean:write name="OB" property="itemDisplayStatus" /></td>

               <td style="text-align:center">
		        <%if(OB.getLastUpdateDate()!=null){%>
		        <integro:date object="<%=OB.getLastUpdateDate()%>" />
		        <%} else {%>- <%}%>
              </td> 

              <td height="18" >&nbsp;<integro:date object="<%=OB.getExpiryDate()%>"/></td>

              <%--<td> &nbsp;<integro:common-code categoryCode="ACTION_PARTY" entryCode="<%=OB.getActionParty()%>" display="true" descWithCode="false"/></td>--%>
                
                <%--// To show Code instead of Description--%>
                <td> &nbsp;<integro:empty-if-null value="<%=OB.getActionParty()%>"/></td>

              <td style="text-align:center">&nbsp;
              	<%if (OB.getCPCCustodianStatus() != null){ %>
              	
              		<integro:empty-if-null value="<%=OB.getCPCCustodianStatus().equals(ICMSConstant.STATE_RECEIVED) ? ICMSConstant.STATE_AWAITING : OB.getCPCCustodianStatus()%>"/>
              	<%} %>
              </td>
              <td style="text-align:center">
	            <% 
	               // CMS-2114 : take into consideration cpc cust status last update date
	               Date custTrxDate = OB.getDisplayCustodianTrxDate();
	               if (custTrxDate != null) { 
		        %>
	            <integro:date object="<%=custTrxDate%>" />
	            <%} else {%>- <%}%>
	          </td>

<%--	          
              <td style="text-align:center">&nbsp;
              <%if(OB.getIdentifyDate() != null) {%>
              Y
              <%}else{%>
              N
              <%}%></td>
Start for  cr-17              
               <td style="text-align:center">&nbsp; <%if(shared) out.println("Y"); else out.print("N");%></td>
<%--End for  cr-17              
              <td style="text-align:center">&nbsp;<%if(approved) out.println("Y"); else out.print("N");%></td>
--%>		

              <!-- Customize for alliance, commented unuse column-->
              <%// <td> &nbsp;<bean:write name="OB" property="remarks" /></td>%>
              <td style="text-align:center">
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING)) { --%>
              <%  if ("view".equals(request.getParameter("event"))) {
                  String checkListID = request.getParameter("checkListID");
                  String legalConstitution = request.getParameter("legalConstitution");
              %>
                <a href="#" onClick="goView('<%=OB.getCheckListItemRef()%>', '<%=checkListID%>', '<%=legalConstitution%>')"><bean:message key="label.view"/></a>
              <% } else {%>
                <a href="#" onClick="view('<%=OB.getCheckListItemRef()%>')"><bean:message key="label.view"/></a>
              <%-- } } else { --%>
                &nbsp;
              <% } %>
              </td>
            </tr>
</logic:equal>
</logic:iterate>
</logic:present>
<logic:notPresent name="checkList" property="checkListItemList" >
            <tr class="odd">
              <td colspan="11"><bean:message key="error.document.no.document"/></td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%-- Start CR-380 --%>

<%-- 
<p/>
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
      <td colspan="3"> <integro:empty-if-null value= "<%= lList.getLegalFirmLabel(checkList.getLegalFirm())%>"/></td>
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
    <tr class="odd">
      <td class="fieldname">Status</td>
      <td colspan="3">
      <%
      if (checkerEdit) {
      %>
      <html:textarea property="makerStatus" rows="4" cols="90" value="<%=checkList.getRemarks()%>"
	  onkeyup="limitTextInput(this.form.makerStatus, 2000, 'Status');"/>
      <% } else { %>
      <integro:htmltext value="<%= checkList.getRemarks()%>" lineLength="120"/>
      <% } %>      
      </td>
    </tr>
    <tr class="odd">
		<td width="20%" class="fieldname">Date of Deficiency Identified</td>
      	<td width="30%" ><bean:write name="CCReceiptForm" property="deficiencyDate"/>&nbsp;</td>
      	<td width="20%" class="fieldname">Days Deficient</td>
      	<td width="30%"><bean:write name="CCReceiptForm" property="daysDeficient"/>&nbsp;</td>
    </tr>    
    <tr class="even">
		<td class="fieldname">Next Action Date</td>
      	<td><bean:write name="CCReceiptForm" property="nextActionDate"/>&nbsp;</td>
      	<td class="fieldname">&nbsp;</td>
      	<td>&nbsp;</td>    
    </tr>        
    <%-- 1487
    </tbody>
  </table>
<%-- End CR-380 

<p/>
<p/>
<p/>
--%>
<%if(!toTrack && "Close".equals(flag)) { %>
<p/>
<p/>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname"><bean:message key="label.last.action.by"/></td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
					  <td><integro:htmltext value="<%=remarks%>" lineLength="100"/>&nbsp;</td>
					</tr>
<%--
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
--%>
				  </tbody>
                </table>
<% } %>
                <p>
                <p>
<!-- OFFICE Holding -->
<%-- 
<p>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
    <thead>
    <tr>
      <td colspan="2">
        <div align="left">Now in holding of </div>
      </td>
    </tr>
    </thead> <tbody>
    <tr class="even">
      <td class="fieldname">Name of User/Team</td>
      <td> <integro:empty-if-null value= "<%=checkListTrxVal.getToUserInfo()%>"/></td>
    </tr>
    </tbody>
  </table>

<!-- OFFICE Holding -->

<!-- Begin OFFICE HISTORY -->
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
            //OBCMSTrxHistoryLog[] commentList = (OBCMSTrxHistoryLog[]) checkListTrxVal.getTransactionHistoryCollection().toArray(new OBCMSTrxHistoryLog[0]);
            OBCMSTrxHistoryLog[] commentList = null;
	    if(checkListTrxVal.getTransactionHistoryCollection() != null)
            	commentList = (OBCMSTrxHistoryLog[]) checkListTrxVal.getTransactionHistoryCollection().toArray(new OBCMSTrxHistoryLog[0]);

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
          if (indexID == null) {
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
 --%>

<!-- End OFFICE HISTORY -->
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
  <%if(!toTrack && "Close".equals(flag)) { %>
    <td><a href="CCReceipt.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('closeImage4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="closeImage4411"  border="0" id="closeImage4411" /></a>&nbsp;&nbsp;&nbsp;
        <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	<% } else if("Cancel".equals(flag)) { %>
    <td><a href="CCReceipt.do?event=cancel" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>&nbsp;&nbsp;&nbsp;
        <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else if(toTrack){%>
    <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else if(checkerEdit){%>
    <td><a href="#" onclick="checkerUpdate()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;
    <a href="CCReceipt.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a></td>
    <%}else{%>
    <td><a href="CCReceipt.do?event=list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a></td>
    <% } %>
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