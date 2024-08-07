<%@ page import="com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.*,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,
				 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.ui.common.CheckListItemActionList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.*,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.ui.common.LegalFirmList,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.reassignment.ReassignmentConstant,
                 com.integrosys.cms.app.checklist.bus.IShareDoc,
                 com.integrosys.cms.app.checklist.bus.OBShareDoc"%>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%>
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
    String previous = (String)request.getParameter("previous");

    if (previous != null && previous.equals("null")) {
        previous = "";
    }

    boolean forwardRequest = false;//OFFICE
    String remarks = "";
    String lastActionBy = "";
    if(checkList!=null)
        pageContext.setAttribute("checkList",checkList);
    int row = 0;
    String status = "";
    if(checkListTrxVal!=null){
        status = checkListTrxVal.getStatus();
        remarks = checkListTrxVal.getRemarks();
        lastActionBy = checkListTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    String cName = "";
    if(cName.equals("")){
        CCReceiptForm aForm = (CCReceiptForm)request.getAttribute("CCReceiptForm");
        cName = aForm.getLimitBkgLoc();
    }
    ICheckListItem array[] = null;
    if(checkListTrxVal.getCheckList()==null){
        array = null;
    }else{
        array = checkListTrxVal.getCheckList().getCheckListItemList();

    }

    /*if(checkListTrxVal.getStagingCheckList()!= null){
          ICheckListItem array1[]  = checkListTrxVal.getStagingCheckList().getCheckListItemList();
          if  (array1 != null) {
                 for (int i = 0; i <  array1.length; i++) {
                     IShareDoc[] iShareDoc = array1[i].getShareCheckList();
                     if  (iShareDoc != null) {
                        //System.out.println("Staging Share CheckList " +iShareDoc.length );
                        for (int j = 0; j <  iShareDoc.length; j++) {
                           // System.out.println("IShareDoc pK " +iShareDoc[j].getDocShareId());
                        }
                     }
                 }
    }
      }*/



	List res = CompareOBUtil.compOBArray(checkListTrxVal.getStagingCheckList().getCheckListItemList(),array);

    ArrayList list = new ArrayList(res);
    pageContext.setAttribute("checkLists",list);


//Start CR-380
String countryCode="none";
ICheckList OBCheckList		= (ICheckList)checkListTrxVal.getCheckList();
ICheckList OBStagingCheckList   = (ICheckList)checkListTrxVal.getStagingCheckList();

	if(checkList.getCheckListLocation()!=null && checkList.getCheckListLocation().getCountryCode() != null ){
		countryCode=checkList.getCheckListLocation().getCountryCode();
	}
	LegalFirmList lList = LegalFirmList.getInstance(countryCode);
//End CR-380
    //CR-34
    String revRmkUpdUserInfo = "";
    String revRemarks = null;
    if (checkList != null)
    {
        revRemarks = checkList.getReversalRemarks();
        revRmkUpdUserInfo = checkList.getReversalRmkUpdatedUserInfo();
    }
    revRemarks = revRemarks==null?"-":revRemarks;
    //End CR-34
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

function forward(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    if (document.forms[0].makerStatus != null) {
	    test = document.forms[0].makerStatus.value;

    	if (test.length > 2000) {
	    	alert('Status field can be only 2000 Characters');
	    	return false;
    	}
	}

    document.forms[0].event.value="forward_checklist_item";
    document.forms[0].submit();
}

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    if (document.forms[0].makerStatus != null) {
	    test = document.forms[0].makerStatus.value;

    	if (test.length > 2000) {
	    	alert('Status field can be only 2000 Characters');
	    	return false;
    	}
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

    if (document.forms[0].makerStatus != null) {

	    test = document.forms[0].makerStatus.value;

    	if (test.length > 2000) {
	    	alert('Status field can be only 2000 Characters');
	    	return false;
    	}
	}

    document.forms[0].event.value="reject_checklist_item";
    document.forms[0].submit();
}

function goView(itemRef) {
    document.forms[0].event.value="chk_view";
    document.forms[0].itemRef.value=itemRef;
//    url = "CCReceipt.do?event=chk_view&itemRef="+itemRef;
//    window.location.href = url;
    document.forms[0].submit();
}

function refreshPage(index) {
    document.forms[0].event.value="refresh_comment";
    document.forms[0].commentIndexID.value=index;
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif','img/confirm2.gif','img/submit2.gif')">
<html:form action="CCReceipt" >
<input type="hidden" name="event" />
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
<input type="hidden" name="itemRef"/>
<input type="hidden" name="previous" value="<%=previous%>"/>

<html:hidden property="limitProfileID" />
<html:hidden property="legalID" />
<html:hidden property="custCategory" />
<html:hidden property="limitBkgLoc" />


<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Constitutional/Contractual Doc Receipt</h3>

      </td>
    </tr>
    <tr>
      <td><hr /> </td>
    </tr>
<%
    ICheckListOwner owner = checkList.getCheckListOwner();
    if (owner instanceof ICCCheckListOwner)
    {
        ICCCheckListOwner ccowner = (ICCCheckListOwner)owner;
        String categoryLabel = PropertyManager.getValue("cc.category." + ccowner.getSubOwnerType());
        categoryLabel = (categoryLabel == null) ? ccowner.getSubOwnerType() : categoryLabel;

%>  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
<%          if (ccowner.getLegalReference() != null)
            {
%>              <%= ccowner.getLegalReference()%>
<%          }
            else
            {
%>              -
<%          }%>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Customer Name</td>
              <td><%= ccowner.getLegalName()%></td>
            </tr>
<%      boolean hasPledgor = false; %>
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
            <tr class="<%=hasPledgor?"odd":"even"%>">
              <td class="fieldname">Checklist ID</td>
              <td><%=OBCheckList.getCheckListID()%></td>
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
              <td width="2%">S/N</td>
              <td width="4%">Mandatory</td>
              <td width="4%">Doc Code</td>
              <td width="4%">Doc No</td>
              <td width="6%">Description</td>
              <td width="4%">Pre-Approval Document</td>
              <td width="8%">Doc Status</td>
              <td width="8%">Custodian Doc Status</td>
              <td width="6%">Doc Expiry Date</td>
              <td width="6%">Txn Date</td>
              <td width="10%">Remarks</td>
              <td width="10%">Action</td>
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
Start for  cr-17              
              <td width="5%">Shared</td>
              <td width="5%">App-roved</td>
              <td width="8%">Action Party</td>
              <td width="8%">Remarks</td>
--%>
            </tr>
          </thead>
          <tbody>
		<logic:present name="checkLists" >
		   <logic:iterate id="compResult" name="checkLists"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
		<%
            ICheckListItem OB = (ICheckListItem) compResult.getObj();
            //Begin OFFICE
            if (!forwardRequest) {
                String st = OB.getItemStatus();
                if (st != null) {
                    if (st.equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER) || st.equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL)) {
                        forwardRequest = true;
                    }
                }
            }
            //End OFFICE
            if (CheckListHelper.toDisplayCheckListItem(OB)) {
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
            boolean approved = false;      //
            boolean shared = false;

            byte a[] = null;
            if (OB.getRemarks() != null)
                a = OB.getRemarks().getBytes();
            StringBuffer narration = new StringBuffer();
            for (int i = 0; a != null && i < a.length; i++) {
                narration.append("&#" + a[i]);       // ck
                //System.out.println(a[i]);
            }
            //for (int i = 0; i < 320; i++)
            //  narration.append("M1234 ");
            //System.out.println("value of b: ");
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

            long docNoLong = OB.getCheckListItemRef();
            String docNoStr = String.valueOf(docNoLong);
            docNoStr = (docNoStr == null || docNoStr.equals("") || docNoStr.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "N.A." : docNoStr;

            long parentDocNoLong = OB.getParentCheckListItemRef();
            String parentDocNo = String.valueOf(parentDocNoLong);
            parentDocNo = (parentDocNo == null || parentDocNo.equals("") || parentDocNo.equals("0") || parentDocNo.equals(String.valueOf(ICMSConstant.LONG_INVALID_VALUE))) ? "" : "<br>(" + parentDocNo + ")";

            //if current checklist item is linked (i.e. has a parent), get the master doc code
            String parentDocCode = "&nbsp;";
            if (parentDocNoLong != 0 && parentDocNoLong != ICMSConstant.LONG_INVALID_VALUE) {
                ICheckListItem parentCheckListItem = CheckListProxyManagerFactory.getCheckListProxyManager().getCheckListItem(parentDocNoLong);
                parentDocCode = parentCheckListItem.getItem().getItemCode();
            }


            CheckListItemActionList actList = CheckListItemActionList.getInstance(OB);
            ArrayList a1 = new ArrayList(actList.getOperationLabels());
            ArrayList a2 = new ArrayList(actList.getOperationValues());
            if (a1 != null)
                pageContext.setAttribute("actionLabels", a1);
            if (a2 != null)
                pageContext.setAttribute("actionValues", a2);

            String custDocStatus = CheckListUtil.getCPCCustodianStatus(OB);
            System.out.println("desc: "+OB.getItemDesc()+" cust status:"+OB.getCPCCustodianStatus());

        %>
			<tr class="<%=rowClass%>">
              <% if(OB.getViewable()) { %>
                <td class='<%=PropertyManager.getValue(CompareOBUtil.CSS_NAME_UNMODIFIED)%>'><%=row%></td>
              <% } else { %>
                <td class='<bean:write name="compResult" property="key" />'  ><%=row%></td>
              <% } %>
              <td style="text-align:center">&nbsp;
            <%if(mandatory && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatory){%> checked <%} %> disabled  />
            <%}%></td>
           <!--    <td><%=parentDocCode%><%=parentDocNo%></td>  -->
           	  <td><bean:write name="compResult" property="obj.item.itemCode" /></td>
              <td><%=docNoStr%></td>
              <td>&nbsp;<bean:write name="compResult" property="obj.item.itemDesc" /></td>
              <td style="text-align:center"><% if(OB.getItem().getIsPreApprove()) {%>Y<%}else{%>N<%}%></td>
               <!-- 
              <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check3" value="<%=row-1%>" <%if(extCustodian){ out.print(" Checked "); }%>  disabled="true" />
              </td>
              <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" Checked "); }%>  disabled="true" /></td>
              -->
              <td>&nbsp;<bean:write name="compResult" property="obj.itemDisplayStatus" /></td>
              <%if (OB.getCPCCustodianStatus()!= null){ %>
              <%--<td>&nbsp;<%=OB.getCPCCustodianStatus()%></td>--%>
              <td><integro:empty-if-null value="<%=OB.getCPCCustodianStatus().equals(ICMSConstant.STATE_RECEIVED) ? ICMSConstant.STATE_AWAITING : OB.getCPCCustodianStatus()%>"/></td>  
              <%}else{%>
              <td>&nbsp;</td>
              <%} %>
              <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getExpiryDate())%></td>
              <td>
		        <%if(OB.getLastUpdateDate()!=null){%>
		        <integro:date object="<%=OB.getLastUpdateDate()%>" />
		        <%} else {%>- <%}%>
              </td>
                <!--
              <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=custDocStatus%>"/></td>
              <td>
	            <% 
	               // CMS-2114 : take into consideration cpc cust status last update date
	               Date custTrxDate = OB.getDisplayCustodianTrxDate();
	               if (custTrxDate != null) { 
		        %>  
	            <integro:date object="<%=custTrxDate%>" />
	            <%} else {%>- <%}%>
              </td>
              -->
              <%if(OB.getRemarks()!=null) {%>
              <td>&nbsp;<%=OB.getRemarks() %></td>
              <%} else{%>
               <td>&nbsp;</td>
               <%} %>
        <!--      <td style="text-align:center">&nbsp;
              <%if(OB.getIdentifyDate() != null) {%>
                Y
              <%}else{%>
                N
              <%}%></td>
  <%--Start for  cr-17              --%>
                 <td style="text-align:center">&nbsp; <%if(shared) out.println("Y"); else out.print("N");%></td>
  <%--End for  cr-17              --%>                
              <td style="text-align:center">&nbsp;<%if(approved) out.println("Y"); else out.print("N");%></td>
              <td> &nbsp;<bean:write name="compResult" property="obj.actionParty" /></td>
              -->
              <td td style="text-align:center">
              <%-- if(!OB.getItemStatus().equals(ICMSConstant.STATE_ITEM_AWAITING)|| (OB.getRemarks()!=null && !(OB.getRemarks().trim().length()==0)) ) { --%>
              <%if(OB.getItemStatus() != null || (OB.getRemarks()!=null && !(OB.getRemarks().trim().length()==0))) {%>
                <a href="#" onClick="goView('<%=OB.getCheckListItemRef()%>')" >View</a>
              <% } else {%>
                &nbsp;
              <% } %>
              </td>
            </tr>
      <% } %>
</logic:iterate>
</logic:present>
<logic:notPresent name="checkList" property="checkListItemList" >
            <tr class="odd">
              <td colspan="12">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
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
		      <td class="<%=CompareOBUtil.compOB(OBStagingCheckList,OBCheckList,"legalFirm")?"fieldname":"fieldnamediff"%>">Name of Legal Firm</td>
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
		      <td class="<%=CompareOBUtil.compOB(OBStagingCheckList,OBCheckList,"remarks")?"fieldname":"fieldnamediff"%>">Status</td>
		      <td colspan="3">
				<%
					if (isCPCChecker) {
				%>
		      <html:textarea property="makerStatus" rows="4" cols="90" value="<%= checkList.getRemarks()%>" onkeyup="limitTextInput(this.form.makerStatus, 2000, 'Status');"/>
		      <% } else { %>
		      	<integro:htmltext value= "<%= checkList.getRemarks()%>" lineLength="120"/>
		      <% } %>
		      </td>      
		    </tr>
		     <tr class="odd">
				<td width="20%" class="<%=CompareOBUtil.compOB(OBStagingCheckList,OBCheckList,"deficiencyDate")?"fieldname":"fieldnamediff"%>">Date of Deficiency Identified</td>
		      	<td width="30%" ><bean:write name="CCReceiptForm" property="deficiencyDate"/>&nbsp;</td>
		      	<td width="20%" class="fieldname">Days Deficient</td>
		      	<td width="30%"><bean:write name="CCReceiptForm" property="daysDeficient"/>&nbsp;</td>
		    </tr>    
		    <tr class="even">
				<td class="<%=CompareOBUtil.compOB(OBStagingCheckList,OBCheckList,"nextActionDate")?"fieldname":"fieldnamediff"%>">Next Action Date</td>
		      	<td><bean:write name="CCReceiptForm" property="nextActionDate"/>&nbsp;</td>
		      	<td class="fieldname">&nbsp;</td>
		      	<td>&nbsp;</td>    
		    </tr>    
		    </tbody>
		  </table>
		<p/>
		<p/>
		<p/>
--%>
<p/>
<p/>
<p/>
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="120"  onkeyup="limitTextInput(this,250,'Remarks')"></textarea></td>
					</tr>
					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>
<%--
			<P/>
			<P/>
			<% if (previous == null || previous.trim().length() == 0) { %>
							<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
							  <tbody>
			                    <tr class="odd">
			                        <td class="fieldname">Last Reversal Remarks</td>
			                        <td><integro:htmltext value="<%=revRemarks%>" lineLength="100"/>&nbsp;</td>
			                    </tr>
			                    <tr class="even">
			                        <td class="fieldname">Reversal Remarks Updated By</td>
			                        <td ><%if (revRmkUpdUserInfo != null && !revRmkUpdUserInfo.equals("")){%>
			                        <%=revRmkUpdUserInfo%>&nbsp;
			                    <%}else{%>
			                    -
			                    <%}%></td>
			                    </tr>
								<tr>
								  <td class="fieldname">Remarks</td>
								  <td class="odd"><textarea name="remarks" rows="4" cols="120"
								  onkeydown="limitTextInput(this.form.remarks, 250, 'Remarks');"
								  onkeyup="limitTextInput(this.form.remarks, 250, 'Remarks');"></textarea></td>
								</tr>
								<tr>
								  <td class="fieldname">Last Action By</td>
								  <td class="even">&nbsp;<%=lastActionBy%></td>
								</tr>
								<tr class="odd">
								  <td class="fieldname">Last Remarks Made</td>
								  <td><integro:htmltext value="<%=remarks%>" lineLength="100"/>&nbsp;</td>
								</tr>
			
							  </tbody>
			                </table>
			<% } %>
--%>
<P>
<P>
<!-- Begin OFFICE HISTORY -->
<%--
		<% if (forwardRequest) { %>
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
		          <% } else {
		//          	 else if (commentStr==null || (commentStr!=null && commentStr.equals("")))
		//          	 {
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
		<% } %>
--%>
<%--
		// End OFFICE HISTORY 
		<% if (previous == null || previous.trim().length() == 0) { %>
		<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
		<% if ( !(status.equals(ICMSConstant.STATE_PENDING_VERIFY)) ) {%>
		  <% if (forwardRequest) { %>
		  <tr>
		
		          <% if (status.equals(ICMSConstant.STATE_PENDING_UPDATE)) {%>
		
		              <td valign="baseline" align="center">
		                        <input name="forwardUser" type="hidden" value="13$-999999999$-999999999" >
		                        <html:errors property="forwardUser"/>
		              </td>
		              <td align="left">
		                  <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/forwardto2.gif',1)" onClick="forward()"><img src="img/forwardto1.gif" name="Image8" width="90" height="20" border="0" id="Image8" /></a>
		              </td>
		              <td valign="baseline" align="center">&nbsp;</td>
		
		          <%} else {
		                         request.setAttribute("forwardCollection",checkListTrxVal.getNextRouteCollection());
		          %>
		              <td valign="baseline" align="center" colspan=2>
		                        <html:select property="forwardUser">
		          	              <html:options collection="forwardCollection" property="valueOfUser" labelProperty="lableOfUser" />
		                        </html:select>
		                        <html:errors property="forwardUser"/>
		              </td>
		              <td align="left">
		                  <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/forwardto2.gif',1)" onClick="forward()"><img src="img/forwardto1.gif" name="Image8" width="90" height="20" border="0" id="Image8" /></a>
		              </td>
		          <% } %>
		
		
		  </tr>
		  <% } %>
		<% } %>
		</table>
		<% } %>
--%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (previous != null && previous.equals(ReassignmentConstant.TASK_EVENT)) {
  %>
    <td colspan="3">
        <a href="Reassignment.do?event=search&reassignmentType=<%=ReassignmentConstant.TASK_TYPE_CCC%>&searchType=<%=ReassignmentConstant.TASK_SEARCH_KEY%>&ccChecklistID=<%=OBCheckList.getCheckListID()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a>
    </td>
  <% } else { %>
    <td width="100" valign="baseline" align="center">
<% if ( !(status.equals(ICMSConstant.STATE_PENDING_VERIFY)) ) {%>
    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a>
<% } %>
    </td>
    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
<% } %>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>