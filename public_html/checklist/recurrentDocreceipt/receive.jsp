<%@page import="com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction"%>
<%@page import="com.integrosys.cms.ui.checklist.ITagUntagImageConstant"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.checklist.bus.*,
				 java.util.*,
				 org.apache.commons.lang.StringUtils,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptForm" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    
    
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.allCreditApproverList");
    if(allCreditApproverList!=null){
    	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
    }

    /*String monitorType = (String) request.getAttribute("monitorType");
	String isPolicy = request.getParameter("isPolicy");
	if(isPolicy == null|| isPolicy.trim().length()==0){
		isPolicy = (monitorType!=null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
	}
	if((isPolicy !=null && isPolicy.equals("false") )
                        || (monitorType!=null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))){
        isPolicy = "false";
        lableDocDate = "Due Date to Receive Premium Receipt";
	}*/
	
	Boolean isImageTagPending = (Boolean) session.getAttribute(RecurrentDocReceiptAction.class.getName()+"."+ ITagUntagImageConstant.IS_IMAGE_TAG_PENDING);
	if(isImageTagPending == null){
		isImageTagPending = Boolean.FALSE;
	}
	
	String isSkipImgTag =(String)session.getAttribute("com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptAction.isSkipImgTag");
	System.out.println("<<<<<<<<<<isSkipImgTag>>>>>>>>>>"+isSkipImgTag); 

%>

<%@page import="com.integrosys.cms.ui.checklist.recurrentDocreceipt.RecurrentDocReceiptForm"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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
    <script language="JavaScript" src="js/validation.js"></script>

    <style>
        table.tblInput tbody tr td.fieldname {
            width: 150px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">
        <!--
        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
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

        function MM_findObj(n, d) { //v4.01
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

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }
        
        function saveFormOnSkipEnable() {
        	if (document.forms["RecurrentDocReceiptForm"].isPolicy.value == "true"){
                if (document.forms["RecurrentDocReceiptForm"].docEffDate.value != document.forms["RecurrentDocReceiptForm"].docOldEffDate.value) {
                    document.forms["RecurrentDocReceiptForm"].isEffDateChanged.value = "true";

                }
            }
            document.forms["RecurrentDocReceiptForm"].event.value = "save_receive";
            document.forms["RecurrentDocReceiptForm"].submit();
        }

        function saveFormOnSkipDisable() {
        	var isImageTagPending = <%=isImageTagPending%>;
        	if(isImageTagPending){
        		alert('<bean:message key="label.tagging.not.completed"/>');
        		return;
        	}
            if (document.forms["RecurrentDocReceiptForm"].isPolicy.value == "true"){
                if (document.forms["RecurrentDocReceiptForm"].docEffDate.value != document.forms["RecurrentDocReceiptForm"].docOldEffDate.value) {
                    document.forms["RecurrentDocReceiptForm"].isEffDateChanged.value = "true";

                }
            }
            document.forms["RecurrentDocReceiptForm"].event.value = "save_receive";
            document.forms["RecurrentDocReceiptForm"].submit();
        }

        function cancelForm() {
            document.forms["RecurrentDocReceiptForm"].event.value = "view_ok";
            document.forms["RecurrentDocReceiptForm"].submit();
        }

        function verifyDocEffDateChanged() {
            if (document.forms["RecurrentDocReceiptForm"].isPolicy.value == "true") {
                if (document.forms["RecurrentDocReceiptForm"].docEffDate.value != document.forms["RecurrentDocReceiptForm"].docOldEffDate.value) {
                    document.forms["RecurrentDocReceiptForm"].isEffDateChanged.value = "true";
                }
            }
        }

        function tagUntagImage(){
        	document.forms["RecurrentDocReceiptForm"].event.value = "<%=RecurrentDocReceiptAction.EVENT_PREPARE_TAG_UNTAG_IMAGE_RECEIVE%>";
            document.forms["RecurrentDocReceiptForm"].submit();
        }

        //-->
    </script>
    <!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/ok2.gif','img/calendarb.gif','img/cancel2.gif')">

<html:form action="RecurrentDocReceipt">

    <!--Hidden variables-->
    <html:hidden property="event"/>

    <html:hidden property="limitProfileID"/>
    <html:hidden property="legalID"/>
    <html:hidden property="custCategory"/>
    <html:hidden property="limitBkgLoc"/>
    <html:hidden property="actionTypeName"/>
    <html:hidden property="index"/>
    <html:hidden property="secType"/>
    <html:hidden property="secSubType"/>
    <html:hidden property="secName"/>
    <html:hidden property="collateralID"/>
    <html:hidden property="collateralRef" />
    <html:hidden property="docCode"/>
    <html:hidden property="docNo"/>
    <html:hidden property="docDesc"/>
    <!-- <html:hidden property="identifyDate"/> -->
    <html:hidden property="docOldEffDate"/>
    <html:hidden property="isEffDateChanged"/>

<%
    String monitorType = (String) request.getAttribute("monitorType");
    String lableDocDate = "Doc Expiry Date";
    String isPolicy = request.getParameter("isPolicy");
    if (isPolicy == null || isPolicy.trim().length() == 0) {
        isPolicy = (monitorType != null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
    }
    if ((isPolicy != null && isPolicy.equals("false")) || (monitorType != null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT))) {
        isPolicy = "false";
        lableDocDate = "Due Date to Receive Premium Receipt";
    }
    
    RecurrentDocReceiptForm aForm = (RecurrentDocReceiptForm)request.getAttribute("RecurrentDocReceiptForm");
	
	ICheckList checkList = (ICheckList)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.RecurrentDocReceiptAction.checkList");
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	
	ICheckListItem[] checkListItems = null;
	String reNewDocOldExpDate = null;
	if(checkList!=null){
		checkListItems = checkList.getCheckListItemList();
	}
	if(checkListItems!=null&&StringUtils.isNotBlank(aForm.getParentCheckListItemRef())){
		for(int i=0;i<checkListItems.length;i++){
			if(Long.valueOf(aForm.getParentCheckListItemRef()).longValue()==checkListItems[i].getCheckListItemRef()){
				reNewDocOldExpDate = DateUtil.formatDate(locale, checkListItems[i].getExpiryDate());
				break;
			}
		}
	}
	
%>
<html:hidden property="isPolicy" value="<%=isPolicy%>"/>
<html:hidden property="reNewDocOldExpDate" value="<%=reNewDocOldExpDate %>" />
<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td><h3>Update Recurrent Doc Receipt </h3></td>
        </tr>
        <tr>
            <td><h3> Doc Description - Receive</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname">Code</td>
                        <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docCode"/></td>
                    </tr>
<!--                    <tr class="even">-->
<!--                        <td class="fieldname">Doc No</td>-->
<!--                        <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docNo"/></td>-->
<!--                    </tr>-->
                    <tr class="odd">
                        <td class="fieldname">Description</td>
                        <td>&nbsp;<bean:write name="RecurrentDocReceiptForm" property="docDesc"/></td>
                    </tr>
<%--
                    <tr class="even">
                        <td class="fieldname">Doc Ref&nbsp;<font color="#0000FF">* </font></td>
                        <td><html:text property="docRef" size="30"/><html:errors property="docRef"/></td>
                    </tr>
--%>

<!--                    <tr class="even">-->
<!--                        <td class="fieldname">Document Type</td>-->
<!--                        <td><html:select property="monitorType">-->
<!--                                <integro:common-code categoryCode="MONITOR_TYPE"/>                            -->
<!--                            </html:select>-->
<!--                        </td>-->
<!--                    </tr>-->
<!---->
<!--                    <tr class="odd">-->
<!--                        <td class="fieldname">Form No</td>-->
<!--                        <td><html:text property="formNo" size="30" maxlength="50"/><html:errors property="formNo"/></td>-->
<!--                    </tr>-->
                    <tr class="even">
                        <td class="fieldname">Date Received&nbsp;<font color="RED">*</font></td>
                        <td><html:text property="receivedDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('receivedDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                                 <html:errors property="receivedDate"/>
                        </td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Doc Date <font color="RED"> *</font></td>
                        <td><html:text property="docDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docDate"/>
                        </td>
                    </tr>
 <%--
                    <%  if (isPolicy != null && isPolicy.equals("true")) {   %>
                    <tr class="even">
                        <td class="fieldname">Document Effective Date<font color="#0000FF">* </font></td>
                        <td><html:text property="docEffDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docEffDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docEffDate"/>
                        </td>
                    </tr>
                    <%  }  %>
--%>
                    <tr class="even">
                        <td class="fieldname"><%=lableDocDate%></td>
                        <td><html:text property="docExpDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('docExpDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="docExpDate"/>
                        </td>
                    </tr>
<%--
                    <tr class="even">
                        <td class="fieldname">Identify Date</td>
                        <td><html:text property="identifyDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1"
                                 onclick="return showCalendar('identifyDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                            <html:errors property="identifyDate"/>
                        </td>
                    </tr>
--%>
<!--                    <tr class="odd">-->
<!--                        <td class="fieldname">Action Party </td>-->
<!--                        <td><html:select property="actionParty">-->
<!--                            <integro:common-code categoryCode="ACTION_PARTY"/>-->
<!--                            </html:select>-->
<!--                        </td>-->
<!--                    </tr>-->

					<tr class="odd">
                        <td class="fieldname"><bean:message key="label.img.tag.untag"/><font color="red">*</font></td>
                        <td>
                         <input type="button" value="Image Tag/Untag" onclick="tagUntagImage()" title="<bean:message key="label.img.tag.untag"/>"/>
                        </td>
                    </tr>

                    <tr class="odd">
                        <td class="fieldname">Credit Approver</td>
                        <td><html:select property="creditApprover"  >
											<option value="">Please Select</option>
											<html:options collection="allCreditApproverList" labelProperty="label" property="value" />
											</html:select>
                        </td>
                    </tr>
<%--
                    <tr class="even">
                        <td class="fieldname">Shared</td>
                        <td>
                            <html:radio property="shared" value="true"/>Yes
                            <html:radio property="shared" value="false"/>No
                            <html:errors property="shared"/>
                        </td>
                    </tr>
--%>
                </tbody>
            </table>
<%--
                <jsp:include page="/checklist/secreceipt/update_sharechecklist.jsp"/>
--%>
                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td><html:textarea name="RecurrentDocReceiptForm" rows="5" cols="80" property="docRemarks"
                                               onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks"/></td>
                        </tr>
                    </tbody>
                </table>
                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                            <td class="fieldname">Justification</td>
                            <td><html:textarea name="RecurrentDocReceiptForm" rows="5" cols="80" property="docJustification"
                                               onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docJustification"/></td>
                        </tr>
                    </tbody>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">
                          <% if(null !=isSkipImgTag &&   "ENABLE".equalsIgnoreCase(isSkipImgTag)){ %>
                            <a href="#" onmouseout="MM_swapImgRestore()" onclick="saveFormOnSkipEnable()"
                               onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                        <%}else{ %>
                          <a href="#" onmouseout="MM_swapImgRestore()" onclick="saveFormOnSkipDisable()"
                               onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                         <%} %>
                            <a href="#" onclick="cancelForm()" onmouseout="MM_swapImgRestore()"
                               onmouseover="MM_swapImage('Image4','','img/cancel2.gif',1)">
                                <img src="img/cancel1.gif" name="Image4" border="0" id="Image4"/></a></td>
                    </tr>
                </table>
                    <%-- End here for cr-17 --%>
            </td>
        </tr>
    </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
