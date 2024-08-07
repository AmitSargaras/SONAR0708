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
    List allApprovalList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.allCreditApproverList");
    HashMap facilityMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.facilityMap");
    HashMap deferredMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredMap");
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
    ArrayList facilityList = new ArrayList();
    facilityList.add(ICMSConstant.CHECKLIST_FACILITY);
    ArrayList camList = new ArrayList();
    camList.add(ICMSConstant.CHECKLIST_CAM);
%>




<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
      <td class="header" align="center">DDN</td>
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
    
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>CAM Checklist</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%--CAM--%>
<%
    boolean hasCamCheckList = false;
    for (int x = 0; x < camList.size(); x++) {//Main Borrower, Co-Borrower....
        if (!docListMap.containsKey(camList.get(x))) continue;

        List list = (List) docListMap.get(camList.get(x));

        System.out.println("Total Document cam  : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
           

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);

            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            if (hasDeferredItem) {
            	hasCamCheckList = true;
            %>
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
<!--                                <tr class="odd">-->
<!--                                    <td class="fieldname" width="20%">Customer Category</td>-->
<!--                                    <td width="30%">-->
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
<!--                                        <integro:empty-if-null value="<%=showCustCat%>"/>&nbsp;-->
<!--                                    </td>-->
<!--                                    <td class="fieldname" width="20%">Customer Name</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalName()%>"/>&nbsp;</td>-->
<!--                                </tr>-->
                                <tr class="even">
<!--                                    <td class="fieldname" width="20%">CIF No</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalID()%>"/>&nbsp;</td>-->
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
                                    
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Type</td>
                                    <td width="30%">
                                        CAM&nbsp;
                                    </td>
                                    
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
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Original Date Defer</td>
                                                        <td width="5%">Next Due Date</td>
                                                        <td width="5%">Doc Status</td>
                                                        <td width="5%">Defer Counter</td>
                                                         <td width="5%"> Total Defered Days</td>
<!--                                                        <td width="15%">Action Party</td>-->
														<td width="8%">Credit Approver</td>
														<td width="8%">Remarks</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);

                                                      //  OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                     //   if (allApprovalList != null && allApprovalList.size() > z)
                                                      //      log = (OBCMSTrxHistoryLog) allApprovalList.get(z);

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
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferCount()%>"/>&nbsp;<input type="hidden" name="deferCount" value="<%=item.getDeferCount()%>"/></td>
                                                           <td><integro:empty-if-null value="<%=item.getDeferedDays()%>"/>&nbsp;<input type="hidden" name="deferedDays" value="<%=item.getDeferedDays()%>"/></td>
                                                            <td>
															<% for(int i=0; i<allApprovalList.size();i++){
            	 
												            	 LabelValueBean  creditApproval= (LabelValueBean) allApprovalList.get(i);
												            	 if(creditApproval.getValue()!=null){
												            	 if(creditApproval.getValue().trim().equals(item.getCreditApprover())){
												            	%>	 
												            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
												            	<% 
												            	 }
												            	
												            	 }
												             }  %>
															&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
                                                           
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

    if (!hasCamCheckList) {
        %>
        <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no CAM checklist.</td>
            </tr>
        </table>
        <%
    }
%>
 <p>&nbsp;</p>
 <p>&nbsp;</p>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>Facility Checklist</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%--FACILITY--%>
<%
    boolean hasFacilityCheckList = false;
    for (int x = 0; x < facilityList.size(); x++) {//Main Borrower, Co-Borrower....
        if (!docListMap.containsKey(facilityList.get(x))) continue;

        List list = (List) docListMap.get(facilityList.get(x));

        System.out.println("Total Document facility : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
            if (!hasFacilityCheckList) hasFacilityCheckList = true;

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);
            System.out.println("Total Document facility : " + docHeld.getCheckListID());
            ILimit iLimit=(ILimit) facilityMap.get(String.valueOf(docHeld.getCheckListID()));
            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            System.out.println("Total Document facility : " + hasDeferredItem);
            if (hasDeferredItem) {
            %>
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
<!--                                <tr class="odd">-->
<!--                                    <td class="fieldname" width="20%">Customer Category</td>-->
<!--                                    <td width="30%">-->
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
<!--                                        <integro:empty-if-null value="<%=showCustCat%>"/>&nbsp;-->
<!--                                    </td>-->
<!--                                    <td class="fieldname" width="20%">Customer Name</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalName()%>"/>&nbsp;</td>-->
<!--                                </tr>-->
                                <tr class="even">
<!--                                    <td class="fieldname" width="20%">CIF No</td>-->
<!--                                    <td width="30%"><integro:empty-if-null value="<%=docHeld.getLegalID()%>"/>&nbsp;</td>-->
                                    <td class="fieldname" width="20%">Checklist ID</td>
                                    <td width="30%"><%=docHeld.getCheckListID()%>&nbsp;</td>
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Facility ID</td>
                                    <td width="30%"><%=iLimit.getLimitID()%>&nbsp;</td>
                                </tr>
                                 <tr class="even">
                                    <td class="fieldname" width="20%">Facility Name</td>
                                    <td width="30%"><%=iLimit.getFacilityName()%>&nbsp;</td>
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
                                    
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname" width="20%">Checklist Type</td>
                                    <td width="30%">
                                        Facility&nbsp;
                                    </td>
                                    
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
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Original Date Defer</td>
                                                        <td width="5%">Next Due Date
                                                        </td>
                                                        <td width="5%">Doc Status</td>
                                                         <td width="5%">Defer Counter</td>
                                                         <td width="5%">Total Defered Days</td>
<!--                                                        <td width="15%">Action Party</td>-->
  														<td width="8%">Credit Approver</td>
  														<td width="8%">Remarks</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);

                                                      //  OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                    //    if (allApprovalList != null && allApprovalList.size() > z)
                                                        //    log = (OBCMSTrxHistoryLog) allApprovalList.get(z);

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
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferCount()%>"/>&nbsp;<input type="hidden" name="deferCount" value="<%=item.getDeferCount()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferedDays()%>"/>&nbsp;<input type="hidden" name="deferedDays" value="<%=item.getDeferedDays()%>"/></td>
                                                            <td>
																<% for(int i=0; i<allApprovalList.size();i++){
            	 
												            	 LabelValueBean  creditApproval= (LabelValueBean) allApprovalList.get(i);
												            	 if(creditApproval.getValue()!=null){
												            	 if(creditApproval.getValue().trim().equals(item.getCreditApprover())){
												            	%>	 
												            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
												            	<% 
												            	 }
												            	
												            	 }
												             }  %>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
                                                            
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

    if (!hasFacilityCheckList) {
        %>
        <table width="97%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no Facility checklist.</td>
            </tr>
        </table>
        <%
    }
%>
 <p>&nbsp;</p> <p>&nbsp;</p>
<%--Security--%>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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

        System.out.println("Total Document : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
            if (!hasSecurityCheckList) hasSecurityCheckList = true;

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);
            ICollateral collateral = ((OBDocumentHeld)docHeld).getCollateral();

            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            if (hasDeferredItem) {

                //yea this is bad, revise this when gt time
                ICheckListProxyManager checkListProxyManager = CheckListProxyManagerFactory.getCheckListProxyManager();
                ICheckList checkList= checkListProxyManager.getCheckListByID(docHeld.getCheckListID());

            %>
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
         <%--       <tr>
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
                </tr>     --%>
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
                                    %>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                                <thead>
                                                    <tr>
                                                        <td width="5%">S/N</td>
<!--                                                        <td width="12%">Doc Number</td>-->
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Original Date Defer</td>
                                                        <td width="5%">Next Due Date</td>
                                                        <td width="5%">Doc Status</td>
                                                         <td width="5%">Defer Counter</td>
                                                         <td width="5%">Total Defered Days</td>
<!--                                                        <td width="15%">Action Party</td>-->
														<td width="8%">Credit Approver</td>
														<td width="8%">Remarks</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);
                                                                                   
                                                        //OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                       // if (allApprovalList != null && allApprovalList.size() > z)
                                                            //log = (OBCMSTrxHistoryLog) allApprovalList.get(z);

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
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferCount()%>"/>&nbsp;<input type="hidden" name="deferCount" value="<%=item.getDeferCount()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getDeferedDays()%>"/>&nbsp;<input type="hidden" name="deferedDays" value="<%=item.getDeferedDays()%>"/></td>
                                                            <td>
															<% for(int i=0; i<allApprovalList.size();i++){
            	 
												            	 LabelValueBean  creditApproval= (LabelValueBean) allApprovalList.get(i);
												            	 if(creditApproval.getValue()!=null){
												            	 if(creditApproval.getValue().trim().equals(item.getCreditApprover())){
												            	%>	 
												            		 <integro:empty-if-null value="<%=creditApproval.getLabel()%>"/>
												            	<% 
												            	 }
												            	
												            	 }
												             }  %>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
                                                           
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
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
   
    <tr><td></td></tr>

    <tr>
      <td>

      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
  </tbody>
</table>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>