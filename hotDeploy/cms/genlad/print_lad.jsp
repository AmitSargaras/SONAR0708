<%@ page import="com.integrosys.cms.app.ddn.trx.IDDNTrxValue,
                 com.integrosys.cms.app.ddn.bus.IDDNCustomerDetail,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.ddn.proxy.IDDNProxyManager,
                 com.integrosys.cms.app.ddn.proxy.DDNProxyManagerFactory,
                 com.integrosys.cms.app.ddn.bus.IDDN,
                 com.integrosys.cms.ui.genddn.GenerateDDNForm,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.*,
				 com.integrosys.cms.app.common.util.*,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.ddn.bus.DDNCollateralInfo,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,                 
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeld" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.ICheckListProxyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory" %>
<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckList" %>
<%@ page import="com.integrosys.cms.app.ddn.bus.IDDNItem" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateral" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.OBDocumentHeld" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/genddn/print_ddn.jsp,v 1.42 2006/10/27 08:45:31 hmbao Exp $
*
* Print DDN Display Page
* Purpose: Display uneditable DDN Details
* Description: Display DDN Uneditable details for preview.
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.42 $
* Date: $Date: 2006/10/27 08:45:31 $
* Tag: $Name:  $
*/
%>
<%

    List deferredList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredList");
    List deferredApprovalList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredApprovalList");

    IDDNTrxValue certTrxVal = (IDDNTrxValue)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.certTrxValPrev");
    IDDNCustomerDetail custDetail = (IDDNCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.custDetail");
    IDDN cert = (IDDN)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.certPrev");        
    if(custDetail!=null){
        pageContext.setAttribute("cust",custDetail);
    }
    // cr 36 for remarks 
    String remarks = "";
    String lastActionBy = "";
    String status = "";
    if(certTrxVal!=null) {
        status = certTrxVal.getStatus();
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";
    // cr 36 for remarks 


    String cName = "";
    String cSig = "";
//    String cCountry = "";
//    String cOrgCode = "";
    String sName = "";
    String sSig = "";
//    String sCountry = "-";
//    String sOrgCode = "-";
    String rem = "";
//    Amount cleanAppAmt = null;
//    Amount notCleanAppAmt = null;
//    Amount cleanActAmt = null;
//    Amount notCleanActAmt = null;
//    Amount cleanDDNAmt = null;
//    Amount notCleanDDNAmt = null;
        
    //For CR CMS-382  Starts
//    Date lastGenDt=null;
    IDDN certActual = null;
    if(certTrxVal != null)
	certActual = certTrxVal.getDDN();
//    if(certActual != null)
//	lastGenDt = certActual.getDateGenerated();	
    //For CR CMS-382  Ends
    
    //For CR CMS-1366 Starts
//    Date creditOfficerDt=null;
//    Date seniorOfficerDt=null;
//    if(certActual != null){
//	creditOfficerDt = certActual.getCreditOfficerDt();
//	seniorOfficerDt = certActual.getSeniorOfficerDt();
//    }
    //For CR CMS-1366 Ends
//    CountryList cList = CountryList.getInstance();
//    OrgCodeList orgList = OrgCodeList.getInstance();
    IDDNProxyManager proxy = DDNProxyManagerFactory.getDDNProxyManager();
    if(certTrxVal!=null) {
        if(cert!=null){
            pageContext.setAttribute("certPrint",cert);
//            cert = proxy.computeTotalAmountForGeneratedItems(cert);
//            cleanAppAmt = cert.getCleanApprovalAmount();
//            notCleanAppAmt = cert.getApprovalAmount();
//            cleanActAmt = cert.getCleanActivatedAmount();
//            notCleanActAmt = cert.getActivatedAmount();
//            cleanDDNAmt = cert.getCleanDDNAmount();
//            notCleanDDNAmt = cert.getDDNAmount();
        }
        cName = cert.getCreditOfficerName();
        cSig = cert.getCreditOfficerSignNo();
//        if (cert.getCreditOfficerLocation() != null)
//        {
//            cCountry = cList.getCountryName(cert.getCreditOfficerLocation().getCountryCode());
//            cOrgCode = orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode());
//        }   
        sName = cert.getSeniorOfficerName();
        sSig = cert.getSeniorOfficerSignNo();
//        if (cert.getSeniorOfficerLocation() != null)
//        {
//            sCountry = cList.getCountryName(cert.getSeniorOfficerLocation().getCountryCode());
//            sOrgCode = orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode());
//        }
        rem = cert.getRemarks();
    }

    int row = 0;

    DefaultLogger.debug(this,"Business seg"+cert.getCustSegmentCode());
//    String bizSgmt = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.BIZ_SGMT,cert.getCustSegmentCode());
//
//    if(bizSgmt == null){
//        bizSgmt = "";
//    }
  
//    String creditGradeName = "-";
//
//    if(cert!=null) {
//        creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", cert.getCreditGradeCode());
//   }

    GenerateDDNForm aForm = (GenerateDDNForm)request.getAttribute("GenerateDDNForm");
//    String ddnAmtAry[] = aForm.getDdnLimit();

//    Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
//    ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();
//
//    GregorianCalendar cal = new GregorianCalendar();
//    cal.setTime(bcaApprovedDate);


    // list out all the checklist (CC & Security) for particular CUSTOMER
    HashMap docListMap = (HashMap) request.getAttribute("docsHeldMap");

    /**
     * will list down all the deferred list base on the checklist level...starting from CC to Security
     * for CC , here is the category for listing , [Main Borrower, Joint Borrower, Co Borrower, Pledger, Non Borrower]
     * for Security , get the list from docListMap by key SECURITY
     * */
    ArrayList ccList = new ArrayList();
    ccList.add(ICMSConstant.CHECKLIST_MAIN_BORROWER);
    ccList.add(ICMSConstant.CHECKLIST_JOINT_BORROWER);
    ccList.add(ICMSConstant.CHECKLIST_CO_BORROWER);
    ccList.add(ICMSConstant.CHECKLIST_PLEDGER);
    ccList.add(ICMSConstant.CHECKLIST_NON_BORROWER);

    ArrayList securityList = new ArrayList();
    securityList.add(ICMSConstant.CHECKLIST_SECURITY);
%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
.header { font-family:verdana; font-size:18px; color: #017AA7; font-weight:bold;}
</style>


<!-- InstanceEndEditable -->
</head>

<body style="width:100%;overflow:auto;" >
<!-- InstanceBeginEditable name="Content" -->
<table width="97%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
    <%--
    <tr>
      <td><input name="imageField" type="image" src="img/banner.jpg" width="197" height="44" border="0" />
      </td>
    </tr>
    --%>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp; </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="header" align="center">Memorandum - DDN</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
        <td><h3>&nbsp;</h3>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                <tr class="odd">
                    <td width="150" class="fieldname">To<br/>
                    </td>
                    <td>Disbursement Unit</td>
                </tr>
                <tr class="even">
                    <td class="fieldname">From<br/>
                    </td>
                    <td>Documentation Unit</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Date</td>
                    <td><%=DateUtil.formatDate("dd/MMM/yyyy",new Date())%></td>
                </tr>
                <tr class="even">
                    <td class="fieldname">Ref</td>
                    <td>CAU / FBBL</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Subject</td>
                    <td>Disbursement</td>
                </tr>
                </tbody>
            </table>
            <p>&nbsp;</p>
    </tr>
    <tr>
        <td>
            <%--Let inject the deferred list base on checklist level--%>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td><h3>Constitutional / Contractual Checklist</h3></td>
                </tr>
                <tr>
                    <td>
                        <hr/>
                    </td>
                </tr>
            </table>
            <%--CC--%>
            <%
                boolean hasCCCheckList = false;
                for (int x = 0; x < ccList.size(); x++) {
                    if (!docListMap.containsKey(ccList.get(x))) continue;

                    List list = (List) docListMap.get(ccList.get(x));

                    for (int xx = 0; xx < list.size(); xx++) {
                        if (!hasCCCheckList) hasCCCheckList = true;

                        IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);

                        //checking on the document...any of this document belong to this checklistID? and any of this generated ddn item belong to this checklist id as well?
                        //TODO : Yes, this is bad. Redo this when got extra time.
                        boolean hasCCCheckListItem = false;    
                        ICheckListProxyManager checkListProxyManager = CheckListProxyManagerFactory.getCheckListProxyManager();
                        ICheckList checkList = checkListProxyManager.getCheckListByID(docHeld.getCheckListID());

                        //let fo some arrange for fast lookup
                        HashMap hashLookup = new HashMap();
                        if (checkList != null) {
                            ICheckListItem[] checkListItem = checkList.getCheckListItemList();
                            if (checkListItem != null) {
                                for (int a = 0; a < checkListItem.length; a++) {
                                    hashLookup.put(checkListItem[a].getCheckListItemRef() + "", null);
                                }
                            }
                        }

                        for (int z = 0; z < cert.getDDNItemList().length; z++) {
                            IDDNItem iddnItem = (IDDNItem)cert.getDDNItemList()[z];

                            if (!hashLookup.containsKey(iddnItem.getDocNumber() + "")) continue;//not belong to this checklist

                            if (!hasCCCheckListItem) {
                                hasCCCheckListItem = true;
                                break;
                            }
                        }

                        if (hasCCCheckListItem) {
                        %>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                        <thead>
                                        </thead>
                                        <tbody>
                                            <tr class="odd">
                                                <td class="fieldname" width="20%">Customer Category</td>
                                                <td width="30%">
                                                    <%
                                                    String custCat = (String)ccList.get(x);
                                                    String showCustCat = null;
                                                    if (custCat.equals(ICMSConstant.CHECKLIST_MAIN_BORROWER)) {
                                                        showCustCat = "Main Borrower/Hirer";
                                                    } else if (custCat.equals(ICMSConstant.CHECKLIST_JOINT_BORROWER)) {
                                                        showCustCat = "Joint Borrower";
                                                    } else if (custCat.equals(ICMSConstant.CHECKLIST_CO_BORROWER)) {
                                                        showCustCat = "Co-Borrower";
                                                    } else if (custCat.equals(ICMSConstant.CHECKLIST_PLEDGER)) {
                                                        showCustCat = "Pledgor/Guarantor";
                                                    } else if (custCat.equals(ICMSConstant.CHECKLIST_NON_BORROWER)) {
                                                        showCustCat = "Non-Borrower";
                                                    }
                                                    %>
                                                    <integro:empty-if-null value="<%=showCustCat%>"/>&nbsp;
                                                </td>
                                                <td class="fieldname" width="20%">Customer Name</td>
                                                <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalName()%>"/>&nbsp;</td>
                                            </tr>
                                            <tr class="even">
                                                <td class="fieldname" width="20%">CIF No</td>
                                                <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalID()%>"/>&nbsp;</td>
                                                <td class="fieldname" width="20%">Checklist ID</td>
                                                <td width="30%"><%=docHeld.getCheckListID()%>&nbsp;</td>
                                            </tr>
                                            <tr class="odd">
                                                <td class="fieldname" width="20%">Checklist Status</td>
                                                <td width="30%">
                                                    <%
                                                    String checkListStatus = (PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus()) == null) ?
                                                            docHeld.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus());
                                                    %>
                                                    <integro:empty-if-null value="<%=checkListStatus%>"/>&nbsp;
                                                </td>
                                                <td class="fieldname" width="20%">&nbsp;</td>
                                                <td width="30%">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                                        <thead>
                                            <tr>
                                                <td><h3>Deferral Requested For</h3></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <hr/>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%--Inject the deferred item here--%>
                                            <%
                                            //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                            //if (hasDeferredItem) {
                                            /*    
                                            //TODO : Yes, this is bad. Redo this when got extra time.
                                            boolean hasCCCheckListItem = false;    
                                            ICheckListProxyManager checkListProxyManager = CheckListProxyManagerFactory.getCheckListProxyManager();
                                            ICheckList checkList = checkListProxyManager.getCheckListByID(docHeld.getCheckListID());
                                                                                                                       
                                            //let fo some arrange for fast lookup
                                            HashMap hashLookup = new HashMap();
                                            if (checkList != null) {
                                                ICheckListItem[] checkListItem = checkList.getCheckListItemList();
                                                if (checkListItem != null) {
                                                    for (int a = 0; a < checkListItem.length; a++) {
                                                        hashLookup.put(checkListItem[a].getCheckListItemRef() + "", null);
                                                    }
                                                }
                                            }

                                            for (int z = 0; z < cert.getDDNItemList().length; z++) {
                                                IDDNItem iddnItem = (IDDNItem)cert.getDDNItemList()[z];

                                                if (!hashLookup.containsKey(iddnItem.getDocNumber() + "")) continue;//not belong to this checklist

                                                if (!hasCCCheckListItem) {
                                                    hasCCCheckListItem = true;
                                                    break;
                                                }
                                            }
                                            */
                                            //if (hasCCCheckListItem) {    
                                                %>
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                            <thead>
                                                                <tr>
                                                                    <td width="5%">S/N</td>
                                                                    <td width="12%">Doc Number</td>
                                                                    <td width="10%">Doc Code</td>
                                                                    <td width="21%">Doc Description</td>
                                                                    <td width="5%">Date Defer</td>
                                                                    <td width="5%">Next Due Date</td>
                                                                    <td width="5%">Doc Status</td>
                                                                    <td width="15%">Action Party</td>
                                                                    <td width="10%">Approval Date</td>
                                                                    <td width="12%">Approved By</td>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                int _row = 0;
                                                                IDDNItem[] iddnItems = cert.getDDNItemList();
                                                                if (iddnItems != null) {
                                                                    for (int z = 0; z < iddnItems.length; z++) {
                                                                        IDDNItem iddnItem = (IDDNItem)iddnItems[z];

                                                                        if (!hashLookup.containsKey(iddnItem.getDocNumber() + "")) continue;//not belong to this checklist

                                                                        //OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                                        //if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                                        //    log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

                                                                        String rowClass = "";
                                                                        _row++;
                                                                        if (_row % 2 != 0) {
                                                                            rowClass = "odd";
                                                                        } else {
                                                                            rowClass = "even";
                                                                        }

                                                                        %>
                                                                        <tr class="<%=rowClass%>">
                                                                            <td class="index"><%=_row%></td>
                                                                            <td><%=iddnItem.getDocNumber()%>&nbsp;</td>
                                                                            <td><%=iddnItem.getDocCode()%>&nbsp;</td>
                                                                            <td><%=iddnItem.getDocDesc()%>&nbsp;</td>
                                                                            <td><integro:date object="<%=iddnItem.getDateDefer()%>"/>&nbsp;</td>
                                                                            <td><integro:date object="<%=iddnItem.getDateOfReturn()%>"/>&nbsp;</td>
                                                                            <td><%=iddnItem.getDocStatus()%>&nbsp;</td>
                                                                            <td><integro:empty-if-null value="<%=iddnItem.getActionParty()%>"/>&nbsp;</td>
                                                                            <td><integro:date object="<%=iddnItem.getTheApprovalDate()%>"/>&nbsp;</td>
                                                                            <td><integro:empty-if-null value="<%=iddnItem.getApprovedBy()%>"/>&nbsp;</td>
                                                                        </tr>
                                                                        <%
                                                                    }
                                                                }
                                                                %>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <%
                                            //} else {
                                                %>
                                                <%--
                                                <tr class="odd">
                                                    <td>There is no deferred document.</td>
                                                </tr>
                                                --%>
                                                <%
                                            //}
                                            %>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                        </table>
                        <%
                        }
                    }
                }

                if (!hasCCCheckList) {
                    %>
                    <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
                        <tr class="odd">
                            <td>There is no CC checklist.</td>
                        </tr>
                    </table>
                    <%
                }
            %>
            <%--Security--%>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td><h3>Security Checklist</h3></td>
                </tr>
                <tr>
                    <td>
                        <hr/>
                    </td>
                </tr>
            </table>
            <%
                boolean hasSecurityCheckList = false;
                for (int x = 0; x < securityList.size(); x++) {
                    if (!docListMap.containsKey(securityList.get(x))) continue;

                    List list = (List) docListMap.get(securityList.get(x));

                    for (int xx = 0; xx < list.size(); xx++) {
                        if (!hasSecurityCheckList) hasSecurityCheckList = true;

                        IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);
                        ICollateral collateral = ((OBDocumentHeld)docHeld).getCollateral();

                        //checking on the document...any of this document belong to this checklistID? and any of this generated ddn item belong to this checklist id as well?
                        //TODO : Yes, this is bad. Redo this when got extra time.
                        boolean hasSecurityCheckListItem = false;    
                        ICheckListProxyManager checkListProxyManager = CheckListProxyManagerFactory.getCheckListProxyManager();
                        ICheckList checkList = checkListProxyManager.getCheckListByID(docHeld.getCheckListID());

                        //let fo some arrange for fast lookup
                        HashMap hashLookup = new HashMap();
                        if (checkList != null) {
                            ICheckListItem[] checkListItem = checkList.getCheckListItemList();
                            if (checkListItem != null) {
                                for (int a = 0; a < checkListItem.length; a++) {
                                    hashLookup.put(checkListItem[a].getCheckListItemRef() + "", null);
                                }
                            }
                        }

                        for (int z = 0; z < cert.getDDNItemList().length; z++) {
                            IDDNItem iddnItem = (IDDNItem)cert.getDDNItemList()[z];

                            if (!hashLookup.containsKey(iddnItem.getDocNumber() + "")) continue;//not belong to this checklist

                            if (!hasSecurityCheckListItem) {
                                hasSecurityCheckListItem = true;
                                break;
                            }
                        }

                        if (hasSecurityCheckListItem) {
                        %>
                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                        <thead>
                                        </thead>
                                        <tbody>
                                            <tr class="odd">
                                                <td width="20%" class="fieldname">Security Type</td>
                                                <td width="30%"><integro:empty-if-null value="<%=collateral.getCollateralSubType().getTypeName()%>"/>&nbsp;</td>
                                                <td width="20%" class="fieldname">Security Sub-Type</td>
                                                <td width="30%"><integro:empty-if-null value="<%=collateral.getCollateralSubType().getSubTypeName()%>"/>&nbsp;</td>
                                            </tr>
                                            <tr class="even">
                                                <td width="20%" class="fieldname">Source Security ID</td>
                                                <td width="30%"><integro:empty-if-null value="<%=String.valueOf(collateral.getCollateralID())%>"/>&nbsp;</td>
                                                <td width="20%" class="fieldname">Checklist ID</td>
                                                <td width="30%"><%=docHeld.getCheckListID()%></td>
                                            </tr>
                                            <tr class="odd">
                                                <td width="20%" class="fieldname">Checklist Status</td>
                                                <td width="30%">
                                                    <%
                                                    String colCheckListStatus = (PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus()) ==null) ?
                                                            docHeld.getCheckListStatus() : PropertyManager.getValue("chklist.status." + docHeld.getCheckListStatus());
                                                    %>
                                                    <integro:empty-if-null value="<%=colCheckListStatus%>"/>&nbsp;
                                                </td>
                                                <td width="20%" class="fieldname">&nbsp;</td>
                                                <td width="30%">&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                        <thead>
                                            <tr align="left">
                                                <td colspan="2" class="fieldname" style="text-align:left">View Security Details - <integro:empty-if-null value="<%=collateral.getCollateralSubType().getTypeName()%>"/></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="odd">
                                                <td width="30%" class="fieldname">Collateral Details</td>
                                                <td><integro:empty-if-null value="<%=collateral.getSCIReferenceNote()%>"/>&nbsp;</td>
                                            </tr>
                                            <tr class="even">
                                                <td width="30%" class="fieldname">Remarks</td>
                                                <td><integro:empty-if-null value="<%=checkList.getRemarks()%>"/>&nbsp;</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                                        <thead>
                                            <tr>
                                                <td><h3>Deferral Requested For</h3></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <hr/>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%--Inject the deferred item here--%>
                                            <%
                                            //boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
                                            //if (hasDeferredItem) {
                                            /*
                                            //TODO : Yes, this is bad. Redo this when got extra time.
                                            boolean hasSecurityCheckListItem = false;    
                                            ICheckListProxyManager checkListProxyManager = CheckListProxyManagerFactory.getCheckListProxyManager();
                                            ICheckList checkList = checkListProxyManager.getCheckListByID(docHeld.getCheckListID());

                                            //let fo some arrange for fast lookup
                                            HashMap hashLookup = new HashMap();
                                            if (checkList != null) {
                                                ICheckListItem[] checkListItem = checkList.getCheckListItemList();
                                                if (checkListItem != null) {
                                                    for (int a = 0; a < checkListItem.length; a++) {
                                                        hashLookup.put(checkListItem[a].getCheckListItemRef() + "", null);
                                                    }
                                                }
                                            }

                                            for (int z = 0; z < cert.getDDNItemList().length; z++) {
                                                IDDNItem iddnItem = (IDDNItem)cert.getDDNItemList()[z];

                                                if (!hashLookup.containsKey(iddnItem.getDocNumber() + "")) continue;//not belong to this checklist

                                                if (!hasSecurityCheckListItem) {
                                                    hasSecurityCheckListItem = true;
                                                    break;
                                                }
                                            }    
                                            */
                                            //if (hasSecurityCheckListItem) {    
                                                %>
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                            <thead>
                                                                <tr>
                                                                    <td width="5%">S/N</td>
                                                                    <td width="12%">Doc Number</td>
                                                                    <td width="10%">Doc Code</td>
                                                                    <td width="21%">Doc Description</td>
                                                                    <td width="5%">Date Defer</td>
                                                                    <td width="5%">Next Due Date</td>
                                                                    <td width="5%">Doc Status</td>
                                                                    <td width="15%">Action Party</td>
                                                                    <td width="10%">Approval Date</td>
                                                                    <td width="12%">Approved By</td>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <%
                                                                int _row = 0;
                                                                IDDNItem[] iddnItems = cert.getDDNItemList();    
                                                                for (int z = 0; z < iddnItems.length; z++) {
                                                                    IDDNItem iddnItem = (IDDNItem)iddnItems[z];

                                                                    if (!hashLookup.containsKey(iddnItem.getDocNumber() + "")) continue;//not belong to this checklist

                                                                    //OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                                    //if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                                    //    log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

                                                                    String rowClass = "";
                                                                    _row++;
                                                                    if (_row % 2 != 0) {
                                                                        rowClass = "odd";
                                                                    } else {
                                                                        rowClass = "even";
                                                                    }

                                                                    %>
                                                                    <tr class="<%=rowClass%>">
                                                                        <td class="index"><%=_row%></td>
                                                                        <td><%=iddnItem.getDocNumber()%>&nbsp;</td>
                                                                        <td><%=iddnItem.getDocCode()%>&nbsp;</td>
                                                                        <td><%=iddnItem.getDocDesc()%>&nbsp;</td>
                                                                        <td><integro:date object="<%=iddnItem.getDateDefer()%>"/>&nbsp;</td>
                                                                        <td><integro:date object="<%=iddnItem.getDateOfReturn()%>"/>&nbsp;</td>
                                                                        <td><%=iddnItem.getDocStatus()%>&nbsp;</td>
                                                                        <td><integro:empty-if-null value="<%=iddnItem.getActionParty()%>"/>&nbsp;</td>
                                                                        <td><integro:date object="<%=iddnItem.getTheApprovalDate()%>"/>&nbsp;</td>
                                                                        <td><integro:empty-if-null value="<%=iddnItem.getApprovedBy()%>"/>&nbsp;</td>
                                                                    </tr>
                                                                    <%
                                                                }
                                                                %>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <%
                                            //} else {
                                                %>
                                                <%--
                                                <tr class="odd">
                                                    <td>There is no deferred document.</td>
                                                </tr>
                                                --%>
                                                <%
                                            //}
                                            %>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr><td></td></tr>
                            <tr><td></td></tr>
                        </table>
                        <%
                        }
                    }
                }

                if (!hasSecurityCheckList) {
                    %>
                    <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
                        <tr class="odd">
                            <td>There is no Security checklist.</td>
                        </tr>
                    </table>
                    <%
                }
            %>
        </td>
    </tr>
    <tr><td></td></tr>
    <tr>
        <td>
            <table width="100%" align="center" class="tblInfo" border="0" cellSpacing="0" cellPadding="0">
                <TBODY>
                    <TR class="even">
                        <TD class="fieldname">Released To</TD>
                        <TD class="odd"><SPAN class="even"><%--<INPUT size="50">--%><integro:empty-if-null value="<%=cert.getReleaseTo()%>"/></SPAN></TD>
                    </TR>
                    <TR class="odd">
                        <TD class="fieldname">Reason / Remarks</TD>
                        <TD>&nbsp;</TD>
                    </TR>
                </TBODY>
            </table>
            <%--<textarea style="width: 100%;" rows="5" name="remarksSCC"></textarea>--%>
            <integro:empty-if-null value="<%=cert.getRemarks()%>"/>
        </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <%--
    <tr>
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%"  class="fieldname">LE ID<br /> </td>
              <td width="30%">&nbsp;<bean:write name="cust" property="legalID" /></td>
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%">&nbsp;<%=cert.getLegalName()%></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Customer Sub-Profile Name<br /> </td>
              <td>&nbsp;<%=cert.getCustomerName()%></td>
              <td class="fieldname">Sub-Profile ID</td>
              <td>&nbsp;<%=custDetail.getCustomerReference()%></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<integro:empty-if-null value="<%= creditGradeName %>" /></td>
              <td class="fieldname">DDN Ref. No.</td>
              <td>&nbsp;<%=cert.getLegalID()%>/<%= cert.getDDNRef()%></td>
            </tr>       
            <tr class="odd">
              <td class="fieldname">Business Segment</td>
              <td>&nbsp;<integro:empty-if-null value="<%= bizSgmt %>" /></td>
              <td class="fieldname">Approved Amount</td>
              <td>&nbsp;<integro:currency amount="<%=cert.getTotalApprovalAmount()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM Code</td>
              <td>&nbsp;<integro:empty-if-null value="<%=cert.getFamCode()%>" /></td>
              <td class="fieldname">FAM</td>
              <td>&nbsp;<integro:empty-if-null value="<%=cert.getFamName()%>" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">BCA Approval Date</td>
              <td>&nbsp;<integro:date object="<%=cert.getBcaApprovalDate()%>" ></integro:date></td>
              <td class="fieldname">BCA Approval Authority</td>
              <td>&nbsp;<integro:empty-if-null value="<%=cert.getBcaApprovalAuthority()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">BCA Next Review Date</td>
              <td>&nbsp;<integro:date object="<%=cert.getBcaNextReviewDate()%>" ></integro:date></td>
              <td class="fieldname">Extended Review Date</td>
              <td><% if (cert.getBcaExtReviewDate() == null) { %>
                        &nbsp;-
                        <% } else { %>
                        &nbsp;<integro:date object="<%=cert.getBcaExtReviewDate() %>" />
                        <% } %>
              </td>
            </tr>
            <tr class="odd">
	    	  <td class="fieldname">Last Update Date</td>
	    	  <td><% if (lastGenDt != null) { %>
	    	              &nbsp;<integro:date object="<%=lastGenDt%>" />
	    	            <% } else { %>
                          &nbsp;-
                        <% } %>
              </td>
              <td class="fieldname">BCA Originated Location</td>
                <%
                    String countryName = CountryList.getInstance().getCountryName (cert.getBcaOrigCtry());
                    
                %>
              <td>&nbsp;<integro:empty-if-null value="<%=countryName%>" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    --%>
    <%--
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">DDN Expiry Date</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%"  class="fieldname">DDN Expiry Date<br />
              </td>
              <td width="30%">&nbsp;<integro:date object="<%=cert.getDeferredToDate()%>" /></td>
              <td width="20%" class="fieldname">DDN Extended Expiry Date</td>
              <td width="30%">&nbsp;<integro:date object="<%=cert.getExtendedToDate()%>" /></td>
            </tr>
            <tr class="even">
            	<td class="fieldname">DDN valid for </td>
				<td >&nbsp;<bean:write name="GenerateDDNForm"  property="ddnDays" /> &nbsp;&nbsp;Days</td>            	
				<td class="fieldname"  >Deferral Approval Date</td>
				<td >&nbsp;<bean:write name="GenerateDDNForm" property="appDate" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr><td>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		  <tbody> 
		    <tr>
		      <td class="fieldname">
		      We certify that all pre-conditions (relating to Contractual & Constitutional and Security Documents) for the draw down of the following limits as detailed in the Business Credit Application dated 
		      <bean:write name="GenerateDDNForm" property="bcaAppDate" />  (as read in conjunction with the deferral approved in respect thereof) have been complied with, physically checked and confirmed to be in order.
		      </td>
		    </tr> 
		  </tbody>
		</table>    
    </td></tr>
    --%>
    <%--
<%  if (cert.getCleanDDNItemList() != null)
    {
        int sno=0;
%>  <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>The following are Un-Secured Limits:</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE <br>ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Limit Maturity Date</td>
              <td>DDN Limit</td>
            </tr>
          </thead>
          <tbody>

<logic:present name="certPrint"  >
   <logic:iterate id="OB" name="certPrint"  property="cleanDDNItemList" type="com.integrosys.cms.app.ddn.bus.IDDNItem"  >
<%
    boolean partial = OB.getIsDDNIssuedInd();
    if (partial)
    {
    String rowClass="";
    row++;
    sno++;
    if(sno%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
	String temp = "ddnLimit"+(row-1);    

    String prodDesc= "-";
	if(OB.getProductType()!=null) {
		prodDesc = OB.getProductType();
		if(prodDesc !=null)
		{
			if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
		   prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
		}
	}
   %>
        <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              
              <td>
              	<integro:empty-if-null value="<%=OB.getCoBorrowLegalID()%>" />&nbsp;
              	<br>
              	<integro:empty-if-null value="<%=OB.getCoBorrowName()%>" />
              </td>
              
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              
              <td>&nbsp;<%=prodDesc%></td>
              
              <td><%=(OB.getOutLimitRef()==null || OB.getOutLimitRef().equals("0")) ? "-" : OB.getOutLimitRef()%></td>

              <td class="amount">
              <integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="currency" />
              <%	if (OB.isInnerLimit()){ %>
              			(<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />)
              <%	} else { %>
              			<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />
              <%	}	%>
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              </td>
              <td class="amount">
              <integro:currency amount="<%=OB.getDDNAmount()%>" param="currency" />
              <%	if (OB.isInnerLimit()) {	%>
              			(<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />)
              <%	} else{	%>
              			<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />
              <%	}	%>
              </td>
              
            </tr>
    <%}%>
</logic:iterate>
</logic:present>
<%if(row > 0) {%>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=cleanAppAmt%>" /></td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=cleanDDNAmt%>" /></td>
            </tr>
<% }else {%>
            <tr class="odd">
                <td colspan="8">There is no limit</td>
            </tr>
<% } %>
          </tbody>
        </table>
        </td>
    </tr>
<%}%>--%>
    <%--
    <tr>
      <td>&nbsp;</td>
    </tr>
    --%>
    <%--
<%  if (cert.getNotCleanDDNItemList() != null)
{
    int sno = 0;
%>  <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>The following are Secured Limits:</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE <br>ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Limit Maturity Date</td>
              <td>DDN Limit</td>
              <td>Security ID</td>
              <td>Security<br>Type</td>
            </tr>
          </thead>
          <tbody>

<logic:present name="certPrint"  >
<%
	DefaultLogger.debug(this,"iterate cert");
%>
   <logic:iterate id="OB" name="certPrint"  property="notCleanDDNItemList" type="com.integrosys.cms.app.ddn.bus.IDDNItem"  >
<%
    boolean partial = OB.getIsDDNIssuedInd();
    if (partial)
    {
    	String rowClass="";
    	row++;
        sno++;
        if(sno%2!=0){
       		rowClass="odd";
    	}else{
       		rowClass="even";
    	}
		String temp = "ddnLimit"+(row-1);    

    	String prodDesc= "-";
		if(OB.getProductType()!=null) {
			prodDesc = OB.getProductType();
			if(prodDesc !=null)
			{
				if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
		   			prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
			}
		}
   %>
        <tr class="<%=rowClass%>">
              <td class="index"><%=sno%></td>
              
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              
              <td>
              	<integro:empty-if-null value="<%=OB.getCoBorrowLegalID()%>" />&nbsp;
              	<br>
              	<integro:empty-if-null value="<%=OB.getCoBorrowName()%>" />
              </td>
              
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              
              <td>&nbsp;<%=prodDesc%></td>
              
              <td><%=(OB.getOutLimitRef()==null || OB.getOutLimitRef().equals("0")) ? "-" : OB.getOutLimitRef()%></td>

              <td class="amount">
              <integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="currency" />
              	<%	if (OB.isInnerLimit()){
              	%>		(<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />)
              	<%	}else{
              	%>		<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />
              	<%	}%>
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              <td class="amount">
                  <integro:currency amount="<%=OB.getDDNAmount()%>" param="currency" />
              	<%	if (OB.isInnerLimit()) {%>
              		(<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />)
	      		<%	}else{%>
	      			<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />
              	<%	}%>
              </td>

              <td>
              	<logic:iterate id="temp0" name="OB" property="DDNCollateralInfoList" >
                <%=((DDNCollateralInfo)temp0).getCollateralRef() %><br></logic:iterate>
              </td>
              
              <td>
              	<logic:iterate id="temp1" name="OB" property="DDNCollateralInfoList" >
                <bean:write name="temp1" property="collateralType.typeName" /><br></logic:iterate>
              </td>              
            </tr>
    <%}%>
	</logic:iterate>
</logic:present>
<%	if(row > 0) {%>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=notCleanAppAmt%>" /></td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=notCleanDDNAmt%>" /></td>
              <td class="total">&nbsp;</td>              
              <td class="total">&nbsp;</td>              
            </tr>
<% 	}else {%>
            <tr class="odd">
                <td colspan="10">There is no limit</td>
            </tr>
<% 	} %>
          </tbody>
        </table>
        </td>
    </tr>
<%	}%>--%>
    <%--
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h3>Deferral Requested for</h3></td>
    </tr>
    <tr> 
      <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead> 
            <tr> 
              <td width="5%">S/N</td>
              <td width="12%">Doc Number</td>
              <td width="10%">Doc Code</td>
              <td width="21%">Doc Description</td>
              <td width="10%">Expiry of Deferment</td>
              <td width="10%">Extended Deferment Date</td>
              <!--td width="10%">DDN Valid For</td-->
              <td width="10%">Approval Date</td>
              <td width="12%">Approved By</td>
            </tr>
            </thead> 
            <tbody>
             <%
             int rowc=0;
             if (deferredList != null) {
             for (int x = 0; x < deferredList.size(); x++) {
                OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
	            ICheckListItem item = (ICheckListItem) deferredList.get(x); 
	            if (deferredApprovalList != null && deferredApprovalList.size() > x)
	              log = (OBCMSTrxHistoryLog) deferredApprovalList.get(x);
	            String rowClass="";
				rowc++;
				if(rowc%2!=0){
				  rowClass="odd";
				}else{
				  rowClass="even";
				}
				
             %>
              <tr class="<%=rowClass%>">
                  <td class="index"><%=rowc%></td>
	              <td ><%= item.getCheckListItemRef()%>&nbsp;</td>
	              <td ><%= item.getItemCode() %>&nbsp;</td>
	              <td ><%= item.getItemDesc() %>&nbsp;</td>
	              <td ><integro:date object="<%= item.getDeferExpiryDate() %>"/>&nbsp;</td>
	              <td ><integro:date object="<%= item.getDeferExtendedDate() %>"/>&nbsp;</td>
	              <!--td >
	              <%// if (bcaApprovedDate == null) { %>
	                 0&nbsp;
	              <%/* } else {
		               Date d1 = null;
	                   if (item.getDeferExtendedDate() != null) {
	                     d1 = item.getDeferExtendedDate();
                       } else {
 	                     d1 = item.getDeferExpiryDate();
                       }
 	                   Date d2 = cal.getTime();
 	                   if (d1.before(d2)) {*/
		          %>
		             0         
	              <% //  } else { %>
		              <!--%= CommonUtil.dateDiff(d1, d2, Calendar.DATE)%-->
	              <%/*
                       }
                     }*/
                     %>
                     </td>
					<% 
                     Calendar cal2 = null;
                     if (log.getLogDate()!= null) {
	                     //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                         String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                         System.out.println("Log Date 2 : " + logDate);
                         String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                         System.out.println("TEMP : " + temp);
                         String year = null;
                         String month = null;
                         String day = null;
                         System.out.println("Year : " + year + " Month : " + month + " Day : " + day);
                         if (temp != null) {
                             day = temp[0];
                             month = temp[1];
                             year = temp[2];

                             cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                         }         
                     }   
                  %>
	              
	              
	              <td >	
					<% if (cal2 != null) { %>
						<integro:date object="<%=cal2.getTime()%>"/>
					<% } else { %>
						&nbsp;
					<% } %>
	              </td>
	              
	              <td >	
	              	<integro:empty-if-null value="<%=log.getLogUserName()%>"/>&nbsp;
          			(<integro:empty-if-null value="<%=log.getLogGroupName()%>"/>)
          		  </td>
              </tr>
             <% } } %>
             <% if (rowc==0) { %>
               <tr> 
                 <td colspan="9">There is no document.</td>
               </tr>             
             <% } %>
            </tbody>
           </table>
      </td>
    </tr>
    --%>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="5" style="text-align:left">Authorised Personnel 1</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cName%>" />                
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cSig%>" />                                
              </td>
               
            </tr>
            <%--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;
                <integro:empty-if-null value="<%=cCountry%>" />                                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td >&nbsp;
                <integro:empty-if-null value="<%=cOrgCode%>" />                                
             </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Signature</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td >&nbsp;
               <%if(creditOfficerDt != null) {%>
	      	   <integro:date object="<%=creditOfficerDt%>" />
	       <%} else {%>- <%}%>
              </td>
            </tr>
            --%>
          </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="5" style="text-align:left">Authorised Personnel 2</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=sName%>" />                                                
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="20%">
                <integro:empty-if-null value="<%=sSig%>" />                                                                  
              </td>
               
            </tr>
            <%--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td>&nbsp;
                <integro:empty-if-null value="<%=sCountry%>" />                                                                                 
              </td>
              <td class="fieldname">Location Org Code</td>
              <td >&nbsp;
                <integro:empty-if-null value="<%=sOrgCode%>" />                                                                                               
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Signature</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td >&nbsp;
              <%if(seniorOfficerDt != null) {%>
	      	      	<integro:date object="<%=seniorOfficerDt%>" />
	       <%} else {%>- <%}%>
              </td>
            </tr>
            --%>
          </tbody>
        </table>
        <br><br>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td width="20%" class="fieldname">Remarks</td>
                                  <td width="80%" class="odd"><integro:wrapper value="<%=remarks%>"/>&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even">&nbsp;<%=lastActionBy%></td>
                                </tr>
                              </tbody>
                            </table> 
        </td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
  </tbody>
</table>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>