<%@ page import="com.integrosys.cms.app.sccertificate.bus.ISCCertificateCustomerDetail,
                 com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificate,
                 com.integrosys.cms.app.sccertificate.trx.IPartialSCCertificateTrxValue,
                 com.integrosys.cms.ui.genpscc.GeneratePSCCForm,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
                 com.integrosys.cms.app.sccertificate.proxy.ISCCertificateProxyManager,
                 com.integrosys.cms.app.sccertificate.proxy.SCCertificateProxyManagerFactory,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 java.util.StringTokenizer,
                 java.util.HashMap,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    try {
        Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

        IPartialSCCertificateTrxValue certTrxVal = (IPartialSCCertificateTrxValue) session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.certTrxVal");

        IPartialSCCertificate cert = (IPartialSCCertificate) session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.cert");
        if (cert != null) {
            pageContext.setAttribute("cert", cert);
        }

        //System.out.println("CERT Debug : " + (cert == null ? Boolean.toString(false) : Boolean.toString(true)));
        //System.out.println("CERT ITEM Debug : " + cert.getPartialSCCItemList().length);
        //System.out.println("ERROR Debug : " + "");

        ISCCertificateCustomerDetail custDetail = (ISCCertificateCustomerDetail) session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.custDetail");
        if (custDetail != null) {
            pageContext.setAttribute("custDetail", custDetail);
        }
                                 
        //java.util.Enumeration em = session.getAttributeNames();
        //while (em.hasMoreElements()) {
        //    Object obj = em.nextElement();

        //    System.out.println("Key : " + obj.toString() + " | Value : " + session.getAttribute(obj.toString()));
        //}

        //int row = 0;
        String remarks = certTrxVal == null ? "" : (certTrxVal.getRemarks() == null ? "" : certTrxVal.getRemarks());
        //String lastActionBy = "";
        String lastActionBy = certTrxVal == null ? "" : (certTrxVal.getUserInfo() == null ? "" : certTrxVal.getUserInfo());
        //String status = certTrxVal == null ? "" : (certTrxVal.getRemarks() == null ? "" : certTrxVal.getStatus());
        /*
        Amount cleanAppAmt = (cert == null) ? null : cert.getCleanApprovalAmount();
        Amount notCleanAppAmt = (cert == null) ? null : cert.getApprovalAmount();
        Amount cleanActAmt = (cert == null) ? null : cert.getCleanActivatedAmount();
        Amount notCleanActAmt = (cert == null) ? null : cert.getActivatedAmount();
        */
        GeneratePSCCForm aForm = (GeneratePSCCForm) request.getAttribute("GeneratePSCCForm");
        if (request.getParameter("event").equals("update_return")) {
            aForm.setRemarks(request.getParameter("remarks"));
        }

        String event = request.getParameter("event");

        boolean showDisbursementAmt = event.equals("edit_staging") ? true : false;

        System.out.println("JSP PSCC FORM : " + aForm.toString());

        //------------------------Start entering the part item list-----But dunno what the hack is this..not readable......

        //String actAmtAry[] = aForm.getActLimit();
        //String actAmtCurrCode[] = aForm.getActAmtCurrCode();
        //String maturityDate[]  = aForm.getMaturityDate();

        // tokenise the string n create an array of psccChecked, then the checkbox checked value will be based on the array values
        String psccChecked = aForm.getParSccIssuedIndex();
        StringTokenizer st = new StringTokenizer(psccChecked, ",");
        HashMap psccCheckedMap = new HashMap();
        while (st.hasMoreTokens()) {
            psccCheckedMap.put(st.nextToken(), null);
        }

        // loop thru the array of clean n unclean items then set the true/false values in the array
        // the display of the checkedbox will be based on the array
        /*
        boolean checkboxSelected[] = null;
		if (actAmtAry != null) {
			checkboxSelected = new boolean[cert.getPartialSCCItemList().length];
		}
		for (int i=0; checkboxSelected != null && i < checkboxSelected.length; i++) {
			if (psccCheckedMap.containsKey(String.valueOf(i))) {
				checkboxSelected[i] = true;
			}
			else {
				checkboxSelected[i] = false;
			}
		}*/

        //-----------------------------------Stop Here--------------------------------------------------------------------

        //-----------------------------------Start from here also the part item list...but segreagate into clean and not clean....----------
        //System.out.println("aForm Debug : " + aForm.getDistbursementAmt()[0].length());

        String expAvalDate[] = aForm.getExpiryAvailabilityDate();
        String distAmt[] = aForm.getDistbursementAmt();
        String distAmtCurrCode[] = aForm.getDistbursementAmtCurrCode();
        String enforceAmt[] = aForm.getAmtEnforceTodate();
        String enforceAmtCurrCode[] = aForm.getAmtEnforceTodateCurrCode();
        String paymentInstruc[] = aForm.getPaymentInstruc();
        /*
        String cleanActAmtAry[] = aForm.getCleanActLimit();
        String cleanActAmtCurrCode[] = aForm.getCleanActAmtCurrCode();
        String cleanMaturityDate[] = aForm.getCleanMaturityDate();
        String notCleanActAmtAry[] = aForm.getNotCleanActLimit();
        String notCleanActAmtCurrCode[] = aForm.getNotCleanActAmtCurrCode();
        String notCleanMaturityDate[] = aForm.getNotCleanMaturityDate();

        boolean cleanCheckboxSelected[] = null;
        boolean notCleanCheckboxSelected[] = null;
        if (cleanActAmtAry != null) {
            cleanCheckboxSelected = new boolean[cert.getCleanPSCCItemList().length];
            for (int i = 0; cleanCheckboxSelected != null && i < cleanCheckboxSelected.length; i++) {
                cleanCheckboxSelected[i] = psccCheckedMap.containsKey(String.valueOf("clean" + i));
            }
        }

        if (notCleanActAmtAry != null) {
            notCleanCheckboxSelected = new boolean[cert.getNotCleanPSCCItemList().length];
            for (int i = 0; notCleanCheckboxSelected != null && i < notCleanCheckboxSelected.length; i++) {
                notCleanCheckboxSelected[i] = psccCheckedMap.containsKey(String.valueOf("notClean" + i));
            }
        }
        */
        ///////////////////////////---------------------Dunno what the hack is this...--------------
        /*
        String creditgrade = null;
        String creditGradeName = "-";

        if (custDetail != null) {
            creditgrade = custDetail.getCreditGrade().getCGCode();
            if (creditgrade != null) {
                creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
            }
        }
        */
        //CountryList cList = CountryList.getInstance();

        //------------------lala end----------------------------------------------------------------------------------------------------

        int i = 0; // maturity date index

        //*********Configuration Parameter***********//
        boolean debug = false;


        //Additional Table
        boolean selAll = true;
        String _selAll = "";
        String _hasCheck1 = "checked";
        String _hasCheck2 = "checked";
        String _hasCheck3 = "checked";
        String _hasCheck4 = "checked";

        if (aForm.getHasCheck1() == null) {selAll = false;_hasCheck1 = "";}
        else {
            if (aForm.getHasCheck1().trim().equals("") || aForm.getHasCheck1().equals("N")) {selAll = false;_hasCheck1 = "";}
        }

        if (aForm.getHasCheck2() == null) {selAll = false;_hasCheck2 = "";}
        else {
            if (aForm.getHasCheck2().trim().equals("") || aForm.getHasCheck2().equals("N")) {selAll = false;_hasCheck2 = "";}
        }

        if (aForm.getHasCheck3() == null) {selAll = false;_hasCheck3 = "";}
        else {
            if (aForm.getHasCheck3().trim().equals("") || aForm.getHasCheck3().equals("N")) {selAll = false;_hasCheck3 = "";}
        }

        if (aForm.getHasCheck4() == null) {selAll = false;_hasCheck4 = "";}
        else {
            if (aForm.getHasCheck4().trim().equals("") || aForm.getHasCheck4().equals("N")) {selAll = false;_hasCheck4 = "";}
        }

        _selAll = selAll ? "checked" : "";

        String globalCurrency = "";
%>
<html>
    <head>
        <title></title>

        <!--CSS Import-->
            <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css"/>
        <!--End CSS Import-->

        <!--JS Import-->
            <script language="JavaScript" src="js/calendar.js"></script>
            <script language="JavaScript" src="js/calDriver.js"/></script>
            <script language="JavaScript" type="text/JavaScript">
                // v3.0
                function MM_preloadImages() {
                    var d = document;
                    if (d.images) {
                        if (!d.MM_p) d.MM_p = new Array();
                        var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                        for (i = 0; i < a.length; i++)
                            if (a[i].indexOf("#") != 0) {
                                d.MM_p[j] = new Image;
                                d.MM_p[j++].src = a[i];
                            }
                    }
                }

                // v3.0
                function MM_swapImgRestore() {
                    var i,x,a = document.MM_sr;
                    for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
                }

                // v4.01
                function MM_findObj(n, d) {
                    var p,i,x;
                    if (!d) d = document;
                    if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                        d = parent.frames[n.substring(p + 1)].document;
                        n = n.substring(0, p);
                    }
                    if (!(x = d[n]) && d.all) x = d.all[n];
                    for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
                    for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
                    if (!x && d.getElementById) x = d.getElementById(n);
                    return x;
                }

                // v3.0
                function MM_swapImage() {
                    var i,j = 0,x,a = MM_swapImage.arguments;
                    document.MM_sr = new Array;
                    for (i = 0; i < (a.length - 2); i += 3)
                        if ((x = MM_findObj(a[i])) != null) {
                            document.MM_sr[j++] = x;
                            if (!x.oSrc) x.oSrc = x.src;
                            x.src = a[i + 2];
                        }
                }

                function submitPage() {
                    //var test = document.forms[0].remarksPSCC.value;
                    var test = document.forms[0].remarks.value;
                    if (test.length > 2000) {
                        alert('Remarks field can be only 2000 Characters');
                        return false;
                    }

                    if (doPartial(2)) {
                        document.forms[0].event.value = "submit";
                        document.forms[0].submit();
                    }
                }

                function refreshPage() {
                    if (doPartial(1)) {
                        document.forms[0].event.value = "refresh_gen_pscc";
                        document.forms[0].submit();
                    }
                }

                function makeTotal() {
                    //var test = document.forms[0].remarksPSCC.value;
                    var test = document.forms[0].remarks.value;
                    if (test.length > 2000) {
                        alert('Remarks field can be only 2000 Characters');
                        return false;
                    }

                    if (doPartial(1)) {
                        document.forms[0].event.value = "total";
                        document.forms[0].submit();
                    }
                }

                function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
                    var test = document.forms[0].remarks.value;
                    if (test.length > 2000) {
                        alert('Remarks field can be only 2000 Characters');
                        return false;
                    }
                    if (doPartial(1)) {
                        document.forms[0].event.value = "update_view_outer_limit_bca";
                        document.forms[0].outerLimitID.value = outerLimitID;
                        document.forms[0].limitID.value = limitID;
                        document.forms[0].outerLimitProfileID.value = outerLimitProfileID;
                        document.forms[0].submit();
                    }
                }


                function doPartial(ind) {
                    var formObj = document.forms[0];
                    var k = 0;
                    var temp = "";
                    //var checkedIndexes="";
                    for (var i = 0; i < formObj.elements.length; i++) {
                        var type = formObj.elements[i].type;
                        var name = formObj.elements[i].name;
                        if (type == 'checkbox' && name == 'parSccIssued') {
                            k++;
                        }
                    }
                    j = 0;
                    if (k > 1) {
                        for (var i = 0; i < formObj.elements.length; i++) {
                            var type = formObj.elements[i].type;
                            var name = formObj.elements[i].name;
                            if (type == 'checkbox' && name == 'parSccIssued') {
                                var obj = formObj.elements[i];
                                if (obj.checked) {
                                    temp = temp + "," + formObj.parSccIssued[j].value;
                                    //checkedIndexes = checkedIndexes + "," + j;
                                }
                                j++;
                            }
                        }
                    }
                    else {
                        for (var i = 0; i < formObj.elements.length; i++) {
                            var type = formObj.elements[i].type;
                            var name = formObj.elements[i].name;
                            if (type == 'checkbox' && name == 'parSccIssued') {
                                var obj = formObj.elements[i];
                                if (obj.checked) {
                                    temp = temp + "," + formObj.parSccIssued.value;
                                    //checkedIndexes="0";
                                }
                            }
                        }
                    }
                    temp = temp.substring(1);


                    //requirement from AB user, no checking on any partial scc item will allow to submit.
                    /*
                    if (temp == "" && ind == 2) {
                        alert('Please select the limits to generate Partial SCC.');
                        return false;
                    }
                    */

                    formObj.parSccIssuedIndex.value = temp;
                    //formObj.checkedIndexes.value=checkedIndexes;
                    return true;
                }

                function MM_openBrWindow(theURL, winName, features) { //v2.0
                    window.open(theURL, winName, features);
                }

                months = new Array();
                months['Jan'] = 0;
                months['Feb'] = 1;
                months['Mar'] = 2;
                months['Apr'] = 3;
                months['May'] = 4;
                months['Jun'] = 5;
                months['Jul'] = 6;
                months['Aug'] = 7;
                months['Sep'] = 8;
                months['Oct'] = 9;
                months['Nov'] = 10;
                months['Dec'] = 11;
                month = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

                function setUpdatedCleanDate(cal, date)
                {
                    var todayDate = new Date();
                    todayDate.setHours(0);
                    todayDate.setMinutes(0);
                    todayDate.setSeconds(0);
                    todayDate.setMilliseconds(0);
                    var expDate = new Date(date.substring(7, 11), months[date.substring(3, 6)], date.substring(0, 2));

                    if (expDate.getTime() < todayDate.getTime()) {
                        if (!confirm("Care! Limit Maturity Date is an expired date.")) {
                            return false;
                        }
                    }
                    cal.sel.value = date;
                    var name = cal.sel.name;
                    var num = parseInt(name.substring(17, name.length));
                    if (document.forms[0].cleanMaturityDate.length + '' == 'undefined') {
                        document.forms[0].cleanMaturityDate.value = date;
                    } else {
                        document.forms[0].cleanMaturityDate[num].value = date;
                    }
                }

                function setUpdatedNotCleanDate(cal, date)
                {
                    var todayDate = new Date();
                    todayDate.setHours(0);
                    todayDate.setMinutes(0);
                    todayDate.setSeconds(0);
                    todayDate.setMilliseconds(0);
                    var expDate = new Date(date.substring(7, 11), months[date.substring(3, 6)], date.substring(0, 2));

                    if (expDate.getTime() < todayDate.getTime()) {
                        //if (!confirm("Care! Limit Maturity Date is an expired date.")) {
                        if (!confirm("Care! Expiry of Availability Period is an expired date.")) {
                            return false;
                        }
                    }
                    cal.sel.value = date;
                    var name = cal.sel.name;
                    var num = parseInt(name.substring(22, name.length));
                    /*
                    if (document.forms[0].notCleanMaturityDate.length + '' == 'undefined') {
                        document.forms[0].notCleanMaturityDate.value = date;
                    } else {
                        document.forms[0].notCleanMaturityDate[num].value = date;
                    }
                    */
                    if (document.forms[0].expiryAvailabilityDate.length + '' == 'undefined') {
                        document.forms[0].expiryAvailabilityDate.value = date;
                    } else {
                        document.forms[0].expiryAvailabilityDate[num].value = date;
                    }
                }

                function selAllOtherReq(inputDOM) {
                    try {
                        var checkVal = inputDOM.checked;

                        var table = inputDOM.parentNode.parentNode.parentNode.parentNode.parentNode;
                        
                        var allInput = table.getElementsByTagName("INPUT");                                                     
                        for (var i = 0; i <allInput.length; i++) {
                            if (allInput[i].type != 'checkbox') continue;

                            if (allInput[i].name.indexOf('hasCheck') == -1) continue;

                            if (allInput[i].checked != checkVal) {
                                allInput[i].checked = checkVal;
                            }
                        }
                    } catch (err) {
                        alert(err);
                    }
                    return false;
                }
            </script>
        <!--End JS Import-->
    </head>
    <body onload="MM_preloadImages('img/cancel2.gif')">
        <html:form action="GeneratePSCC">
            <input type="hidden" name="event"/>
            <input type="hidden" name="actionName" value="GeneratePSCC"/>
            <input type="hidden" name="parSccIssuedIndex"/>
            <input type="hidden" name="outerLimitID"/>
            <input type="hidden" name="limitID"/>
            <input type="hidden" name="outerLimitProfileID"/>

            <!--Customer Details Table-->
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                    <tr>
                        <td>
                            <h3>Partial SCC</h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr/>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                                <thead>
                                    <tr class="odd">
                                        <td colspan="4" style="text-align:left">Customer Details</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="even">
                                        <!--
                                        <td class="fieldname">Customer Catagory</td>
                                        <td>???</td>
                                        -->
                                        <td class="fieldname">Customer Name</td>
                                        <td><bean:write name="custDetail" property="legalName"/></td>
                                    </tr>
                                    <tr class="odd">
                                        <td class="fieldname">CIF No</td>
                                        <td>
                                            <%
                                                String cifNo = (custDetail != null && !custDetail.getLegalID().equals("0")) ? custDetail.getLegalID() : "";
                                                out.println(cifNo);
                                            %>
                                        </td>
                                        <!--
                                        <td class="fieldname">Checklist ID</td>
                                        <td>
                                            <%
                                                String chckListID = (cert.getSCCertRef() != null) ? custDetail.getLegalID() + "/" + cert.getSCCertRef() : "-";
                                                out.println(chckListID);
                                            %>
                                        </td>
                                        -->
                                    </tr>
                                    <!--
                                    <tr class="even">
                                        <td class="fieldname">Checklist Status</td>
                                        <td>???</td>
                                        <td class="fieldname"></td>
                                        <td></td>
                                    </tr>
                                    -->
                                    <!--Change Start From Here : Chee Hong-->
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            <!--End Of Customer Details Table-->

            <!--New Partial SCC Item Table-->
            <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            <%
                if (debug) {
                    System.out.println("Clean Item List is not null - Size: " + cert.getCleanPSCCItemList().length);
                    System.out.println("Product Description: " + (cert.getCleanPSCCItemList())[0].getProductDesc());
                }
            %>
                <thead>
                    <tr>
                        <td width="50">
                            <h3></h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <hr/>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                <thead>
                                    <tr>
                                        <td>S/N</td>
                                        <td>Outer Limit ID</td>
                                        <td>Limit ID</td>
                                        <td>Source Security ID</td>
                                        <td>Security Type / Sub-Type</td>
                                        <td>Product Description</td>
                                        <td>Approved Limit</td>
                                        <td>Expiry of Availability Period</td>
                                        <td>Disbursement Amount</td>
                                        <td>Amount Enforced Todate</td>
                                        <td>Issue Partial SCC</td>
                                        <td>Payment Instruction</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <logic:present name="cert">
                                            <%
                                                int row = 0;
                                            %>
                                        <logic:iterate id="OB" name="cert" property="partialSCCItemList" type="com.integrosys.cms.app.sccertificate.bus.IPartialSCCertificateItem">
                                            <%
                                                row++;

                                                //TODO : Cleanup this
                                                //try to get the property here if forget
                                                //System.out.println(cert.getPartialSCCItemList()[0].getPaymentInstruction());
                                                
                                                String rowClass = row % 2 != 0 ? "odd" : "even";

                                                //String temp = "cleanActLimit" + (row - 1);
                                                //String chktemp = "parSccIssuedClean" + (row - 1);

                                                //boolean partial = OB.getISPartialSCCIssued();
                                                //boolean partial = checkboxSelected[row - 1];
                                                boolean hasIssued = psccCheckedMap.containsKey((row - 1) + ""); 
                                                
                                                String prodDesc = "-";
                                                if (OB.getProductDesc() != null) {
                                                    prodDesc = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, (String) OB.getProductDesc());
                                                    prodDesc = prodDesc == null ? "-" : prodDesc;
                                                }
                                            %>
                                            <tr class="<%=rowClass%>">
                                                    <!--S/N-->
                                                    <td class="index">
                                                        <%=row%>
                                                    </td>

                                                    <!--Outer Limit ID-->
                                                    <td <%=!OB.getIsInnerOuterSameBCA() ? "class=outerlimit" : ""%>>
                                                        <% if (!OB.getIsInnerOuterSameBCA()) { %>
                                                        <a href="#"
                                                           onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )">
                                                            <% } %>
                                                            <%=(OB.getOuterLimitRef() == null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
                                                            <% if (!OB.getIsInnerOuterSameBCA()) { %>
                                                        </a>
                                                        <% } %>
                                                    </td>

                                                    <!--Limit ID-->
                                                    <td width="9%">
                                                        <%=OB.getLimitRef()%>
                                                    </td>

                                                    <!--Source Security ID-->
                                                    <td width="12%">
                                                        <logic:iterate id="temp0" name="OB" property="collateralAllocations">
                                                            <%=((ICollateralAllocation) temp0).getCollateral().getSCISecurityID()%>
                                                            <br>
                                                        </logic:iterate>
                                                    </td>

                                                    <!--Security Type / Sub-Type-->
                                                    <td width="12%">
                                                        <logic:iterate id="temp1" name="OB" property="collateralAllocations">
                                                            <bean:write name="temp1" property="collateral.collateralType.typeName"/>
                                                            <br>
                                                        </logic:iterate>
                                                    </td>

                                                    <!--Product Description-->
                                                    <td width="6%">
                                                        <%=prodDesc%>
                                                    </td>

                                                    <!--Approved Limit-->
                                                    <td class="amount" width="20%">
                                                        <input type="hidden" name="appLimit"
                                                               value="<%=OB.getApprovedLimitAmount().getAmountAsBigDecimal()%>"/>
                                                        <integro:currency param="currency" amount="<%= OB.getApprovedLimitAmount() %>"/>
                                                        <% if (OB.isInnerLimit()) { %>
                                                        (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>"/>)
                                                        <% } else { %>
                                                        <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>"/>
                                                        <% } %>
                                                    </td>

                                                    <!--Expiry of Availability Period-->
                                                    <td>
                                                        <html:text property="expiryAvailabilityDate" readonly="true" size="12" maxlength="11" value="<%=expAvalDate[i]%>"/>
                                                        <%
                                                            String updatedDate = "expiryAvailabilityDate" + String.valueOf(i);
                                                            i++;
                                                        %>
                                                        <input type="hidden" name="<%=updatedDate%>"/>
                                                        <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%= updatedDate %>', 'dd/mm/y', setUpdatedNotCleanDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                                                        <html:errors property="<%=updatedDate%>"/>
                                                    </td>

                                                    <!--Disbursement Amount-->
                                                    <!--Disbursement Amount shouldn't be shown the value according to the FS except for edit_staging event-->
                                                    <td>
                                                        <input type="hidden" name="distbursementAmtCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/><%=OB.getApprovedLimitAmount().getCurrencyCode()%>&nbsp;
                                                        <% if (OB.isInnerLimit()) { %>
                                                        <!--(<input type="text" name="distbursementAmt" value="<%=distAmt[row-1]%>"/>)-->
                                                        (<input type="text" name="distbursementAmt" value="<%=(showDisbursementAmt) ? distAmt[row-1] : ""%>"/>)
                                                        <% } else { %>
                                                        <!--<input type="text" name="distbursementAmt" value="<%=distAmt[row-1]%>"/>-->
                                                        <input type="text" name="distbursementAmt" value="<%=(showDisbursementAmt) ? distAmt[row-1] : ""%>"/>
                                                        <% }
                                                        String distAmtErr = "distAmt" + (row - 1);
                                                        %>
                                                        <html:errors property="<%=distAmtErr%>" />
                                                    </td>

                                                    <!-- Amount Enforce Todate-->
                                                    <td>
                                                        <input type="hidden" name="amtEnforceTodateCurrCode" value="<%=OB.getApprovedLimitAmount().getCurrencyCode()%>"/><%=OB.getApprovedLimitAmount().getCurrencyCode()%>&nbsp;
                                                        <input type="text" name="amtEnforceTodate" value="<%=enforceAmt[row-1]%>" />
                                                        <%
                                                        String enforceAmtErr = "enforceAmt" + (row - 1);
                                                        %>
                                                        <html:errors property="<%=enforceAmtErr%>" />
                                                    </td>

                                                    <!--Issue Partial SCC-->
                                                    <td style="text-align:center" width="12%">
                                                        <input name="parSccIssued" type="checkbox" value="<%=row-1%>" <%if(hasIssued) { %>checked<% }%>/>
                                                        <!--<input name="parSccIssued" type="checkbox" value="<%="clean" + (row-1)%>"
                                                               <%if(/*cleanCheckboxSelected[row-1]*/ false) { %>checked  <% }%> />-->
                                                    </td>

                                                    <!--Payment Instruction-->
                                                    <td>
                                                        <html:text property="paymentInstruc" value="<%=paymentInstruc[row-1]%>"></html:text> 
                                                    </td>
                                                </tr>
                                        </logic:iterate>
                                    </logic:present>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <!--Additional Table Here-->
                    <tr>
                        <td>
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                <thead>
                                    <TR>
                                        <TD style="TEXT-ALIGN: left" colSpan="7">
                                            Other Requirements (As indicated by <SPAN style="TEXT-ALIGN: center"><INPUT value="checkbox" CHECKED type="checkbox" disabled="true"></SPAN>below)
                                        </TD>
                                    </TR>
                                    <TR>
                                        <TD width="2%">S/N</TD>
                                        <TD width="12%">
                                            Select (<SPAN style="TEXT-ALIGN: center"> <INPUT value="checkbox" type="checkbox" <%=_selAll%> onclick="javascript:selAllOtherReq(this);"></SPAN>)
                                        </TD>
                                        <TD width="86%">Item</TD>
                                    </TR>
                                </thead>
                                <tbody>
                                    <TR class="odd">
                                        <TD class="index">1</TD>
                                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck1" <%=_hasCheck1%> value="Y"></TD>
                                        <TD>
                                            <P>
                                                <STRONG>Fire Insurance Cover </STRONG>
                                                <BR>
                                                a) To insured with<SPAN class="amount"><INPUT class="currency"
                                                                                              size="12" name="insuredWith" value="<%=aForm.getInsuredWith()%>"></SPAN>MYR<SPAN
                                                    class="amount"><INPUT class="currency" size="12" name="insuredWithAmt" value="<%=aForm.getInsuredWithAmt()%>"><BR></SPAN>
                                                b) M/Policy, endorse Mortgagee clause AMBM <SPAN class="amount"><INPUT
                                                    class="currency" size="12" name="ambm" value="<%=aForm.getAmbm()%>"></SPAN>Expiry<SPAN
                                                    style="TEXT-ALIGN: center"><INPUT
                                                    onblur="itg_checkform('frmMain','sel7','Date','5');return document.MM_returnValue"
                                                    style="WIDTH: 90px" id="sel7242" maxLength="10" size="15"
                                                    name="expiry" value="<%=aForm.getExpiry()%>" readonly="true"> <IMG id="Image2131"
                                                                       onmouseover="MM_swapImage('Image2131','','img/calendarb.gif',1)"
                                                                       onmouseout=MM_swapImgRestore()
                                                                       onclick="return showCalendar('sel7242', 'dd/mm/y');"
                                                                       border="0" name="Image2131"
                                                                       src="img/calendara.gif">&nbsp;</SPAN>
                                            </P>
                                        </TD>
                                    </TR>
                                    <TR class="even">
                                        <TD class="index">2</TD>
                                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck2" <%=_hasCheck2%> value="Y"></TD>
                                        <TD>
                                            <P><STRONG>Advice to Branch on creation of Sinking Fund </STRONG><BR>Sinking
                                                Fund of MYR <SPAN class="amount"><INPUT class="currency" size="12" name="sinkFundAmt" value="<%=aForm.getSinkFundAmt()%>"> </SPAN>p.m
                                                for
                                                period of <SPAN class="amount"><INPUT class="currency" size="12" name="pmForPeriodOf" value="<%=aForm.getPmForPeriodOf()%>"> </SPAN>commencing
                                                from <SPAN class="amount"><INPUT class="currency" size="12" name="commencingFrom" value="<%=aForm.getCommencingFrom()%>"> </SPAN>until
                                                the fund reaches MYR <SPAN class="amount"><INPUT class="currency"
                                                                                                 size="12" name="fundReach" value="<%=aForm.getFundReach()%>"> </SPAN>
                                            </P></TD>
                                    </TR>
                                    <TR class="odd">
                                        <TD class="index">3</TD>
                                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck3" <%=_hasCheck3%> value="Y"></TD>
                                        <TD>
                                            <P><STRONG>Fees </STRONG><BR>To debit set-up fee MYR <SPAN
                                                    class="amount"><INPUT
                                                    class="currency" size="12" name="feesAmt" value="<%=aForm.getFeesAmt()%>"> </SPAN></P></TD>
                                    </TR>
                                    <TR class="even">
                                        <TD class="index" height="52">4</TD>
                                        <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck4" <%=_hasCheck4%>  value="Y"></TD>
                                        <TD>
                                            <P><STRONG>Others </STRONG><BR><INPUT size="130" name="others" value="<%=aForm.getOthers()%>"></P>

                                            <P></P></TD>
                                    </TR>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <hr/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                                <thead>
                                    <tr>
                                        <td colspan="4" style="text-align:left">Authorised Personnel 1</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd">
                                        <td class="fieldname">Name</td>
                                        <td>
                                            <html:text property="authorPerOneName" maxlength="50" size="30"/>
                                        </td>
                                        <td class="fieldname">Signing Number</td>
                                        <td>
                                            <html:text property="authorPerOneSignNo" maxlength="20" size="30"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                                <thead>
                                    <tr>
                                        <td colspan="4" style="text-align:left">Authorised Personnel 2</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="even">
                                        <td class="fieldname">Name</td>
                                        <td>
                                            <html:text property="authorPerTwoName" maxlength="50" size="30"/>
                                        </td>
                                        <td class="fieldname">Signing Number</td>
                                        <td>
                                            <html:text property="authorPerTwoSignNo" maxlength="20" size="30"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <%if (!ICMSConstant.STATE_REJECTED.equals(certTrxVal.getStatus())) { %>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                                    <thead>
                                        <tr>
                                            <td style="text-align:left">Remarks</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd">
                                            <td><html:textarea property="remarks" rows="3" cols="100"/>&nbsp;</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            <!--End New Partial SCC Item Table-->

            <!--Remarks Table-->
            <%if (ICMSConstant.STATE_REJECTED.equals(certTrxVal.getStatus())) { %>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr>
                            <td width="20%" class="fieldname">Remarks</td>
                            <td width="80%" class="odd"><html:textarea property="remarks" rows="3" cols="110"/>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="fieldname">Last Action By</td>
                            <td class="even"><%=lastActionBy%></td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname">Last Remarks Made</td>
                            <td><integro:wrapper value="<%=remarks%>"/>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            <% } %>
            <!--End Remarks Table-->

            <!--Navigation Button-->
            <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="80">&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/submit2.gif',0)">
                            <img src="img/submit1.gif" name="Image2" border="0" id="Image2"/>
                        </a>
                    </td>
                    <%
                        if (certTrxVal.getTransactionID() != null && certTrxVal.getPartialSCCertificate() != null) {
                    %>
                    <td>
                        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/printprevPSCC2.gif',1)">
                            <img src="img/printprevPSCC1.gif" name="Image1" border="0" id="Image1" onclick="MM_openBrWindow('GeneratePSCC.do?event=print_doc','','scrollbars=yes,toolbar=yes,menubar=yes,resizable=yes,width=760,height=400,left=5,top=5')"/>
                        </a>
                    </td>
                    <%
                        }
                    %>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <!--End Navigation Button-->
        </html:form>
    </body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>