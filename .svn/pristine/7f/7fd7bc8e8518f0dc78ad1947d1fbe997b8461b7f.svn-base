<%@ page import="com.integrosys.cms.app.ddn.trx.IDDNTrxValue,
                 com.integrosys.cms.app.ddn.bus.*,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.ddn.bus.IDDNCustomerDetail,
                 com.integrosys.cms.ui.genddn.GenerateDDNForm,
                 com.integrosys.cms.app.ddn.bus.DDNCollateralInfo,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,                 
				 com.integrosys.cms.app.common.util.*,
                 java.util.*"%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeld" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.ICheckListProxyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory" %>
<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckList" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateral" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.OBDocumentHeld" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    List deferredList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredList");
    List deferredApprovalList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredApprovalList");
    ILimitProfile limit = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    IDDNTrxValue certTrxVal = (IDDNTrxValue)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.certTrxVal");
    HashMap deferredMap = (HashMap) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredMap");
    IDDN cert = (IDDN)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.cert");
    IDDNCustomerDetail custDetail = (IDDNCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.custDetail");
    if(custDetail!=null){
        pageContext.setAttribute("custDetail",custDetail);
    }
    if(cert!=null) {
        pageContext.setAttribute("cert",cert);
//        IDDNItem[] cleanList = cert.getCleanDDNItemList();
//        if ((cleanList != null) && (cleanList.length > 0))
//        {
//            ArrayList list = new ArrayList();
//            for (int ii=0; ii<cleanList.length; ii++)
//            {
//                list.add(cleanList[ii]);
//            }
//            pageContext.setAttribute("cleanddnitems", list);
//        }
//        IDDNItem[] notCleanList = cert.getNotCleanDDNItemList();
//        if ((notCleanList != null) && (notCleanList.length > 0))
//        {
//            ArrayList list = new ArrayList();
//            for (int ii=0; ii<notCleanList.length; ii++)
//            {
//                list.add(notCleanList[ii]);
//                pageContext.setAttribute("notcleanddnitems", list);
//            }
//        }
        IDDNItem[] iddnItems = cert.getDDNItemList();
        if ((iddnItems != null) && (iddnItems.length > 0))
        {
            ArrayList list = new ArrayList();
            for (int ii=0; ii<iddnItems.length; ii++)
            {
                list.add(iddnItems[ii]);
            }
            pageContext.setAttribute("ddnitems", list);
        }
    }
    int row = 0;

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

//    Amount cleanAppAmt = null;
//    Amount notCleanAppAmt = null;
//    Amount cleanActAmt = null;
//    Amount notCleanActAmt = null;
//    Amount cleanDDNAmt = null;
//    Amount notCleanDDNAmt = null;
//
//    if(cert!=null){
//        cleanAppAmt = cert.getCleanApprovalAmount();
//        notCleanAppAmt = cert.getApprovalAmount();
//        cleanActAmt = cert.getCleanActivatedAmount();
//        notCleanActAmt = cert.getActivatedAmount();
//        cleanDDNAmt = cert.getCleanDDNAmount();
//        notCleanDDNAmt = cert.getDDNAmount();
//    }
    
    boolean toTrack = false;
    boolean viewOnly = false;
    String event = request.getParameter("event");
    String isTrack = request.getParameter("isTrack");
    String isView = request.getParameter("isView");
    
    if (isTrack != null && isTrack != "" && isTrack != "null") {
	    toTrack = Boolean.valueOf(isTrack).booleanValue();
    } else if("to_track".equals(event)){
        toTrack = true;
    }
    
    if (isView != null && isView != "" && isView != "null") {
	    viewOnly =Boolean.valueOf(isView).booleanValue();
    } else if ("view_generate_ddn".equals(event) || "view_remarks".equals(event)) {
	    viewOnly = true;
    }

//    String creditGradeName = "-";
//    if(cert!=null) {
//                creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", cert.getCreditGradeCode());
//   }

//    CountryList cList = CountryList.getInstance();
//    OrgCodeList orgList = OrgCodeList.getInstance();
//
//
//    Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
//            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();
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




<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
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

function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
	document.forms[0].event.value="view_outer_limit_bca";
	document.forms[0].outerLimitID.value=outerLimitID;
	document.forms[0].limitID.value=limitID;
	document.forms[0].outerLimitProfileID.value=outerLimitProfileID;
	document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/calendarb.gif','img/cancel2.gif')">
<html:form action="GenerateDDN" >
<input type="hidden" name="event" />
<%--<input type="hidden" name="outerLimitID"/>--%>
<%--<input type="hidden" name="limitID"/>--%>
<%--<input type="hidden" name="outerLimitProfileID"/>--%>
<input type="hidden" name="actionName" value="GenerateDDN"/>
<input type="hidden" name="isTrack" value="<%=toTrack%>"/>
<input type="hidden" name="isView" value="<%=viewOnly%>"/>
<!-- InstanceBeginEditable name="Content" -->
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Document Deferral Note (DDN)</h3></td>
    </tr>
    <!--
    <tr>
      <td><hr />
        </td>
    </tr>
    -->
  </thead>
  <tbody>
    <%--
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="4" style="text-align:left">Customer Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td height="22" class="fieldname">LE ID<br /> </td>
              <td>&nbsp;<bean:write name="custDetail" property="legalID" /></td>
              <td class="fieldname">Legal Name</td>
              <td>&nbsp;<%=cert.getLegalName()%></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Customer Name<br /> </td>
              <td>&nbsp;<%=cert.getCustomerName()%></td>
              <td class="fieldname">Sub-Profile ID</td>
              <td>&nbsp;<%=cert.getSubProfileID()%></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<%=creditGradeName%></td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">FAM</td>
              <%
              String famCode =  (cert.getFamCode() != null)?  cert.getFamCode() :"-";
	      	  String famName =  (cert.getFamName() != null)?  cert.getFamName() :"-";
    	      String fam = famCode + ", " + famName ;
              %>
              <td><integro:empty-if-null value="<%=fam%>" /></td>
              <td class="fieldname">DDN Ref. No.</td>
              <td><%=custDetail.getLegalID()%>/<%= cert.getDDNRef()%></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    --%>
  </tbody>
</table>
<!-- 
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
            
         -->    
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

                        //let do some arrange for fast lookup
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
 <!--                        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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

                                            //let do some arrange for fast lookup
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
                                                                    <td width="5%">Expected Date of Return</td>
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
            
   -->          
<%--cam --%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td><h3>CAM Checklist</h3></td>
    </tr>
    <tr>
        <td>
            <hr/>
        </td>
    </tr>
</table>
<%--CAM --%>
<%
    boolean hasCamCheckList = false;
    for (int x = 0; x < camList.size(); x++) {//Main Borrower, Co-Borrower....
        if (!docListMap.containsKey(camList.get(x))) continue;

        List list = (List) docListMap.get(camList.get(x));

        System.out.println("Total Document cam  : " + list.size());

        for (int xx = 0; xx < list.size(); xx++) {
            if (!hasCamCheckList) hasCamCheckList = true;

            IDocumentHeld docHeld = (IDocumentHeld) list.get(xx);

            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            if (hasDeferredItem) {
            %>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
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
                                                        <td width="12%">Doc Number</td>
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Date Defer</td>
                                                        <td width="5%">Next Due Date</td>
                                                        <td width="5%">Doc Status</td>
<!--                                                        <td width="15%">Action Party</td>--><td width="8%">Credit Approver</td>
                                                        <td width="10%">Approval Date</td>
                                                        <td width="12%">Approved By</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);

                                                        OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                        if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                            log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

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
                                                            <td><%=item.getCheckListItemRef()%>&nbsp;<input type="hidden" name="docNumber" value="<%=item.getCheckListItemRef()%>"/></td>
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getActionParty()%>"/>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
                                                            <%
                                                            Calendar cal2 = null;
                                                            if (log.getLogDate()!= null) {
                                                                //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                                                                String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                                                                String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                                                                String year = null;
                                                                String month = null;
                                                                String day = null;
                                                                if (temp != null) {
                                                                    day = temp[0];
                                                                    month = temp[1];
                                                                    year = temp[2];

                                                                    cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                                                                }
                                                            }
                                                            %>
                                                            <td><% if (cal2 != null) { %><integro:date object="<%=cal2.getTime()%>"/><input type="hidden" name="theApprovalDate" value="<%=cal2.getTime()%>"/><% } else { %>&nbsp;<% } %></td>
                                                            <%
                                                            String approvedBy = "";
                                                            String userName = log.getLogUserName() == null ? "-" : log.getLogUserName();
                                                            String groupName = log.getLogGroupName() == null ? "-" : log.getLogGroupName();
                                                            approvedBy = userName + " (" + groupName + ")";
                                                            %>
                                                            <td><%--<integro:empty-if-null value="<%=log.getLogUserName()%>"/>&nbsp;(<integro:empty-if-null value="<%=log.getLogGroupName()%>"/>)--%><%=approvedBy%><input type="hidden" name="approvedBy" value="<%=approvedBy%>"/></td>
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
        <table width="90%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no CAM checklist.</td>
            </tr>
        </table>
        <%
    }
%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
            //checking on the document...any of this document belong to this checklistID?
            boolean hasDeferredItem = deferredMap.containsKey(docHeld.getCheckListID() + "");
            System.out.println("Total Document facility : " + hasDeferredItem);
            if (hasDeferredItem) {
            %>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                            </thead>
                            <tbody>
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
                        <table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
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
                                                        <td width="12%">Doc Number</td>
                                                        <td width="10%">Doc Code</td>
                                                        <td width="21%">Doc Description</td>
                                                        <td width="5%">Date Defer</td>
                                                        <td width="5%">Next Due Date</td>
                                                        <td width="5%">Doc Status</td>
<!--                                                        <td width="15%">Action Party</td>--><td width="8%">Credit Approver</td>
                                                        <td width="10%">Approval Date</td>
                                                        <td width="12%">Approved By</td>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                    ArrayList curDeferredList = (ArrayList) deferredMap.get(docHeld.getCheckListID() + "");
                                                    int _row = 0;
                                                    for (int z = 0; z < curDeferredList.size(); z++) {
                                                        ICheckListItem item = (ICheckListItem) curDeferredList.get(z);

                                                        OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
                                                        if (deferredApprovalList != null && deferredApprovalList.size() > z)
                                                            log = (OBCMSTrxHistoryLog) deferredApprovalList.get(z);

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
                                                            <td><%=item.getCheckListItemRef()%>&nbsp;<input type="hidden" name="docNumber" value="<%=item.getCheckListItemRef()%>"/></td>
                                                            <td><%=item.getItemCode()%>&nbsp;<input type="hidden" name="docCode" value="<%=item.getItemCode()%>"/></td>
                                                            <td><%=item.getItemDesc()%>&nbsp;<input type="hidden" name="docDesc" value="<%=item.getItemDesc()%>"/></td>
                                                            <td><integro:date object="<%=item.getDeferExpiryDate()%>"/>&nbsp;<input type="hidden" name="dateDefer" value="<%=item.getDeferExpiryDate()%>"/></td>
                                                            <td><integro:date object="<%=item.getExpectedReturnDate()%>"/>&nbsp;<input type="hidden" name="dateOfReturn" value="<%=item.getExpectedReturnDate()%>"/></td>
                                                            <td><%=item.getItemStatus()%>&nbsp;<input type="hidden" name="docStatus" value="<%=item.getItemStatus()%>"/></td>
                                                            <td><integro:empty-if-null value="<%=item.getActionParty()%>"/>&nbsp;<input type="hidden" name="actionParty" value="<%=item.getActionParty()%>"/></td>
                                                            <%
                                                            Calendar cal2 = null;
                                                            if (log.getLogDate()!= null) {
                                                                //cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) );
                                                                String logDate = log.getLogDate().indexOf(" ") != -1 ? log.getLogDate().split(" ")[0] : "";
                                                                String[] temp = logDate.indexOf("/") != -1 ? logDate.split("/") : null;
                                                                String year = null;
                                                                String month = null;
                                                                String day = null;
                                                                if (temp != null) {
                                                                    day = temp[0];
                                                                    month = temp[1];
                                                                    year = temp[2];

                                                                    cal2 = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day));
                                                                }
                                                            }
                                                            %>
                                                            <td><% if (cal2 != null) { %><integro:date object="<%=cal2.getTime()%>"/><input type="hidden" name="theApprovalDate" value="<%=cal2.getTime()%>"/><% } else { %>&nbsp;<% } %></td>
                                                            <%
                                                            String approvedBy = "";
                                                            String userName = log.getLogUserName() == null ? "-" : log.getLogUserName();
                                                            String groupName = log.getLogGroupName() == null ? "-" : log.getLogGroupName();
                                                            approvedBy = userName + " (" + groupName + ")";
                                                            %>
                                                            <td><%--<integro:empty-if-null value="<%=log.getLogUserName()%>"/>&nbsp;(<integro:empty-if-null value="<%=log.getLogGroupName()%>"/>)--%><%=approvedBy%><input type="hidden" name="approvedBy" value="<%=approvedBy%>"/></td>
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
        <table width="90%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
            <tr class="odd">
                <td>There is no Facility checklist.</td>
            </tr>
        </table>
        <%
    }
%>            
            <%--Security--%>
            <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
                        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
                            <br/>
                            <tr>
                                <td>
                                    <table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
                                    <table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
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
<!--                                                                    <td width="15%">Action Party</td>--><td width="8%">Credit Approver</td>
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
                    <table width="90%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInfo">
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
            <table width="90%" align="center" class="tblInfo" border="0" cellSpacing="0" cellPadding="0">
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
    <%--
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname" width="20%">DDN Expiry Date&nbsp;<font color="#0000FF">* </font></td>
              <td width="30%"><integro:date object="<%=cert.getDeferredToDate()%>" /></td>
              <td width="20%" class="fieldname" >Date DDN To Be Extended To</td>
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
    --%>
    <%--
    <tr><td>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		  <tbody> 
		    <tr>
		      <td class="fieldname">
		      We certify that all pre-condition (relating to securing documentation ) for the draw down of the following limits as detailed in the LA as dated below ( as read in conjunction with the deferrals approved in respect thereof) have been complied with physically checked and confirmed to be in order. Therefore limits may now be made operational till the maturity date in accordance with the deferrals obtained.
		      </td>
		    </tr> 
		  </tbody>
		</table>    
    </td></tr>
    --%>
    <%--
    <tr>
      <td>&nbsp;</td>
    </tr>
    --%>
    <%--
<%  if (cert.getCleanDDNItemList() != null)
    {
        int sno = 0;
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
              <td width="4%">S/N</td>
              <td width="9%">Limit ID</td>
              <td width="15%">Co-borrower LE <br>ID/Name</td>
              <td width="12%">Limit Booking Location</td>
              <td width="12%">Product Desc</td>
              <td width="8%">Outer Limit ID</td>
              <td width="13%">Approved Limit</td>
              <td widht="13%">Limit Maturity Date</td>
              <td width="13%">DDN Limit&nbsp;<font color="#00AAFF">* </font></td>
              <td width="7%">Issue DDN</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="cleanddnitems"  >
   <logic:iterate id="OB" name="cleanddnitems" type="com.integrosys.cms.app.ddn.bus.IDDNItem"  >
<%

    String rowClass="";
    row++;
    sno++;
    if(sno%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    boolean partial = OB.getIsDDNIssuedInd();
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
              
              <td>&nbsp;
              	<integro:empty-if-null value="<%=OB.getCoBorrowLegalID()%>" />          
              	<br>
              	&nbsp;<integro:empty-if-null value="<%=OB.getCoBorrowName()%>" />           
              </td>
              
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              
              <td>&nbsp;<%=prodDesc%></td>
              
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %>
              			<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              	<% 	} %>
             		<%=(OB.getOutLimitRef()==null || OB.getOutLimitRef().equals("0")) ? "-" : OB.getOutLimitRef()%>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %> 
              			</a> 
				<% 	} %>
              </td>

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
              	<%	if (OB.isInnerLimit()) {%>
              			(<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />)
	      		<%	}else{	%>
	      				<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />
              	<%	}		%>
              </td>
              
              <td style="text-align:center"><input name="checkbox" disabled type="checkbox" value="checkbox" <%if(partial) { %>checked  <% }%> disabled /></td>
              
            </tr>
</logic:iterate>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=cleanAppAmt%>" /></td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=cleanDDNAmt%>" /></td>
              <td class="total">&nbsp;</td>
            </tr>
</logic:present>
<logic:notPresent name="cleanddnitems" >
            <tr class="odd">
                <td colspan="9">There is no limit</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
<%}%>--%><%--
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
              <td width="4%">S/N</td>
              <td width="9%">Limit ID</td>
              <td width="5%">Co-borrower LE <br>ID/Name</td>
              <td width="10%">Limit Booking Location</td>
              <td width="7%">Product Desc</td>
              <td width="9%">Outer Limit ID</td>
              <td width="13%">Approved Limit</td>
              <td widht="10%">Limit Maturity Date</td>
              <td width="13%">DDN Limit&nbsp;<font color="#00AAFF">* </font></td>
              <td width="9%">Security ID</td>
              <td width="7%">Security<br>Type</td>
              <td width="7%">Issue DDN</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="notcleanddnitems"  >
   <logic:iterate id="OB" name="notcleanddnitems" type="com.integrosys.cms.app.ddn.bus.IDDNItem"  >
<%
    String rowClass="";
    row++;
    sno++;
    if(sno%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    boolean partial = OB.getIsDDNIssuedInd();
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
              
              <td>&nbsp;
              	<integro:empty-if-null value="<%=OB.getCoBorrowLegalID()%>" />          
              	<br>
             	 &nbsp;<integro:empty-if-null value="<%=OB.getCoBorrowName()%>" />           
              </td>
              
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              
              <td>&nbsp;<%=prodDesc%></td>
              
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %>
              			<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              	<% 	} %>
              		<%=(OB.getOutLimitRef()==null || OB.getOutLimitRef().equals("0")) ? "-" : OB.getOutLimitRef()%>
              	<% 	if (!OB.getIsInnerOuterSameBCA()) { %> 
              			</a> 
				<%	} %>
              </td>

              <td class="amount">
              <integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="currency" />
              	<%	if (OB.isInnerLimit()){%>
              			(<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />)
              	<%	} else { 	%>
              			<integro:currency amount="<%=OB.getApprovedLimitAmount()%>" param="amount" />
              	<%	} %>
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" /><% } %>
              </td>
              <td class="amount">
              <integro:currency amount="<%=OB.getDDNAmount()%>" param="currency" />
	      		<%	if (OB.isInnerLimit()) {	%>
	      				(<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />)
	      		<%	}else{	%>
	      				<integro:currency amount="<%=OB.getDDNAmount()%>" param="amount" />
              	<%	}	%>
              </td>
              
              <td><logic:iterate id="temp0" name="OB" property="DDNCollateralInfoList" ><%=((DDNCollateralInfo)temp0).getCollateralRef() %><br></logic:iterate></td>
              
              <td><logic:iterate id="temp1" name="OB" property="DDNCollateralInfoList" ><bean:write name="temp1" property="collateralType.typeName" /><br></logic:iterate></td>
              
              <td style="text-align:center"><input name="checkbox" disabled type="checkbox" value="checkbox" <%if(partial) { %>checked  <% }%> disabled /></td>
            </tr>
</logic:iterate>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=notCleanAppAmt%>" /></td>
               <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:2px"><integro:currency amount="<%=notCleanDDNAmt%>" /></td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
            </tr>
</logic:present>
<logic:notPresent name="notcleanddnitems" >
            <tr class="odd">
               <td colspan="11">There is no limit</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table></td>
    </tr>
<%}%>--%>
    <%--
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
	              <%//   } else { %>
		              <!--%= CommonUtil.dateDiff(d1, d2, Calendar.DATE)%-->
	              <%/*
                       }
                     }*/     
                     %>
                     </td-->
				  <%                 
                     Calendar cal2 = null;
                     if (log.getLogDate()!= null) {
	                     cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) ); 
                     }   
                  %>
	              
	              <td ><% if (cal2 != null) { %><integro:date object="<%=cal2.getTime()%>"/><% } else { %>&nbsp;<% } %></td>
	              <td ><integro:empty-if-null value="<%=log.getLogUserName()%>"/>&nbsp;
          (<integro:empty-if-null value="<%=log.getLogGroupName()%>"/>)</td>
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
      <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Authorised Personnel 1</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name<%--&nbsp;<font color="#0000FF">* </font>--%></td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cert.getCreditOfficerName()%>" />
              </td>
              <td class="fieldname">Signing Number<%--&nbsp;<font color="#0000FF">* </font>--%></td>
              <td width="30%">&nbsp;
                <integro:empty-if-null value="<%=cert.getCreditOfficerSignNo()%>" />                
              </td>
            </tr>
            <%--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cList.getCountryName(cert.getCreditOfficerLocation().getCountryCode())%>" />                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td width="30%">&nbsp;
                <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode())%>" />
              </td>
            </tr>
            --%>
          </tbody>
        </table>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Authorised Personnel 2</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Name</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cert.getSeniorOfficerName()%>" />
              </td>
              <td class="fieldname">Signing Number</td>
              <td width="30%">&nbsp;
                <integro:empty-if-null value="<%=cert.getSeniorOfficerSignNo()%>" />
              </td>
            </tr>
            <%--
            <tr class="even">
              <td class="fieldname">Location Country</td>
              <td width="20%">&nbsp;
                <integro:empty-if-null value="<%=cList.getCountryName(cert.getSeniorOfficerLocation().getCountryCode())%>" />                
              </td>
              <td class="fieldname">Location Org Code</td>
              <td width="30%">&nbsp;
                <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode())%>" />
              </td>
            </tr>
            --%>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
</p>
</p>
</p>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
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
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
  </tr>
  <tr>
    <%if(toTrack){%>
     <td>  <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <%}else if (!viewOnly){%>
    <td><a href="GenerateDDN.do?event=close" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a>&nbsp;&nbsp;&nbsp;<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
    <% } else { %>
    <td><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/print2.gif',0)"><img src="img/print1.gif" name="Image1" border="0" id="Image1" onclick="MM_openBrWindow('GenerateDDN.do?event=print_doc&isView=<%=event%>','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=450,left=5,top=5')"/></a></td>
    <% } %>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
