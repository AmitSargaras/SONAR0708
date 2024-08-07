<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.reassignment.ReassignmentConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.checklist.CheckListAction,
                 com.integrosys.cms.app.common.util.*,
                 java.util.*,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant
                 " %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	UpdatePariPassuCheckListForm form = (UpdatePariPassuCheckListForm)request.getAttribute("UpdatePariPassuCheckListForm");
    ICheckListItem stageOb = (ICheckListItem) request.getAttribute("stagingOb");
    ICheckListItem ob = (ICheckListItem) request.getAttribute("actualOb");
    ICheckListTrxValue checkListTrxVal = (ICheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.checkListTrxVal");
    String previous = request.getParameter("previous");

    // cr 131
    String lableDocDate = "Doc Expiry Date";
    String monitorType = stageOb.getItem().getMonitorType();
    String isPolicy = (monitorType != null && monitorType.equals(ICMSConstant.INSURANCE_POLICY)) ? "true" : "";
    String isReceipt = (monitorType != null && monitorType.equals(ICMSConstant.PREMIUM_RECEIPT)) ? "true" : "";
    if (isReceipt.equals("true")) {
        lableDocDate = "Due Date to Receive Premium Receipt";
    }
    List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListAction.allCreditApproverList");
    if(allCreditApproverList!=null){
    	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
    }
    // cr 36
    /*Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();
    GregorianCalendar cal = new GregorianCalendar();
    cal.setTime(bcaApprovedDate);*/
    
    int bb = 0;
%>



<%@page import="com.integrosys.cms.ui.checklist.paripassuupdate.UpdatePariPassuCheckListForm"%>
<%@page import="org.apache.struts.util.LabelValueBean"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

        function submitPage(trxID) {
            document.forms[0].event.value = "chk_view_return";
            document.forms[0].submit()
        }

        //-->
    </script>
    <!-- InstanceEndEditable --></head>

<body onload="MM_preloadImages('img/cancel2.gif','img/return2.gif')">
<html:form action="UpdatePariPassuCheckListAction">

    <input type="hidden" name="previous" value="<%=previous%>"/>
    <input type="hidden" name="event"/>

    <html:hidden property="limitProfileID"/>
    <html:hidden property="legalID"/>
    <html:hidden property="custCategory"/>
    <html:hidden property="limitBkgLoc"/>
    <html:hidden property="secType"/>
    <html:hidden property="secSubType"/>
    <html:hidden property="secName"/>
    <html:hidden property="collateralID"/>

<!--<p class="required"><font color="RED">*</font> Mandatory for Submission&nbsp;</p><br>-->
<!-- InstanceBeginEditable name="Content" -->
<table width="620" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Update Pari Passu Doc Receipt </h3></td>
    </tr>
    <tr>
        <td><h3> View Doc Description </h3></td>
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
    <%String aa = "odd"; %>
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"itemCode")? "fieldname":"fieldnamediff"%>">Branch Name</td>
            <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docCode"/></td>
            <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
<!--        <tr class=<%=aa%> >-->
<!--            <td class="fieldname">Doc No</td>-->
<!--            <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docNo"/></td>-->
<!--             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>-->
<!--        </tr>-->
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"itemDesc")? "fieldname":"fieldnamediff"%>">Bank Name</td>
            <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docDesc"/></td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>

        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"effectiveDate")? "fieldname":"fieldnamediff"%>">Doc Due Date</td>
            <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docEffDate"/></td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>

        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expiryDate")? "fieldname":"fieldnamediff"%>"><%=lableDocDate%></td>
            <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="docExpDate"/></td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>

        <%
            boolean isdeferred = false;
            if (stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFERRED) ||
                    stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFERRAL) ||
                    stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_DEFER_REQ) ||
                    stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_DEFER_REQ)) {
                isdeferred = true;
        %>
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferExpiryDate")? "fieldname":"fieldnamediff"%>">Date Deferred
            </td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="deferDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
            <%-- // cr 36 --%>
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expectedReturnDate")? "fieldname":"fieldnamediff"%>">Next Due Date</td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="expectedReturnDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        <tr class=<%=aa%>>
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferCount")? "fieldname":"fieldnamediff"%>">Defer Counter</td>
              <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="deferCount"/> &nbsp;
               
              </td>
            </tr>
            <tr class=<%=aa%>>
              <td class="<%=CompareOBUtil.compOB(stageOb,ob,"deferedDays")? "fieldname":"fieldnamediff"%>">Defered Days</td>
              <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="deferedDays"/> &nbsp;
               
              </td>
            </tr>
        <% } %>
        <% 	boolean isWaiver = false;
        if (stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVED) ||
                stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER) ||
                stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_WAIVER_REQ) ||
                stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_WAIVER_REQ )){
        	
        	isWaiver = true;
        }	
        %>
        <%if(isWaiver){ %>
        	 <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"waivedDate")? "fieldname":"fieldnamediff"%>">Date Waived
            </td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="waivedDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        	
        <%} %>
        
         <% boolean isComplete = false;
	        if (stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_COMPLETED)||
	        	stageOb.getItemStatus().equals(ICMSConstant.STATE_ITEM_PENDING_COMPLETE)
	        		){
	        	isComplete = true; 	
        }	
        %>
        <%if(isComplete){ %>
        	 <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"completedDate")? "fieldname":"fieldnamediff"%>">Date Completed
            </td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="completedDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        	
        <%} %>
        <% boolean isLodged = false;
	        if (stageOb.getItemStatus().equals(ICMSConstant.ACTION_ITEM_PENDING_LODGE)||
	        	stageOb.getItemStatus().equals(ICMSConstant.STATE_LODGED) ||
                stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_RELODGE)){
	        	isLodged = true; 	
        }	
        %>
        <%if(isLodged){ %>
        	 <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"lodgedDate")? "fieldname":"fieldnamediff"%>">Date Lodged
            </td>
            <td>&nbsp;<bean:write name="UpdatePariPassuCheckListForm" property="lodgedDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        	
        <%} %>
         <% boolean received = false;
	        if (stageOb.getItemStatus().equals(ICMSConstant.RECURRENT_ITEM_STATE_RECEIVED)||
	        	stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_RECEIVED))
	        		{
	        	received = true; 	
        }	
        %>
        <%if(received){ %>
        	 <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"receivedDate")? "fieldname":"fieldnamediff"%>">Date Received
            </td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="receivedDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        	
        <%} %>
        <% boolean tempUpliftedDate = false;
	        if (stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT)||
	        	stageOb.getItemStatus().equals(ICMSConstant.STATE_TEMP_UPLIFTED))
	        		{
	        	tempUpliftedDate = true; 	
        }	
        %>
        <%if(tempUpliftedDate){ %>
        <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"tempUpliftedDate")? "fieldname":"fieldnamediff"%>">Date Temp Uplifted
            </td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="tempUpliftedDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
         <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"expectedReturnDate")? "fieldname":"fieldnamediff"%>">Date Expected Return
            </td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="expectedReturnDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        	
        <%} %>
        <% boolean permUpliftedDate = false;
	        if (stageOb.getItemStatus().equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT)||
	        	stageOb.getItemStatus().equals(ICMSConstant.STATE_PERM_UPLIFTED))
	        		{
	        	permUpliftedDate = true; 	
        }	
        %>
        <%if(permUpliftedDate){ %>
        	 <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"permUpliftedDate")? "fieldname":"fieldnamediff"%>">Date Perm Uplifted
            </td>
            <td>&nbsp;
                <bean:write name="UpdatePariPassuCheckListForm" property="permUpliftedDate"/>
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        	
        <%} %>

         <tr class=<%=aa%> >
            <td class="<%=CompareOBUtil.compOB(stageOb,ob,"creditApprover")? "fieldname":"fieldnamediff"%>">Credit Approver</td>
            <td>&nbsp;
            
           <%
           if(allCreditApproverList!=null){
        	for(int a=0; a<allCreditApproverList.size();a++){   
           LabelValueBean bean=(LabelValueBean) allCreditApproverList.get(a);
           if(bean.getValue()!=null){
          	 if(bean.getValue().trim().equals(form.getCreditApprover())){
          		
          	%>	 
          		 <integro:empty-if-null value="<%=bean.getLabel()%>"/>
          	<% 
          	 }
          	 }          
        	}
        	} %> 
            </td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>
        <tr class=<%=aa%> >
            <td style="width:116" class="<%=CompareOBUtil.compOB(stageOb,ob,"remarks")? "fieldname":"fieldnamediff"%>">Remarks</td>
            <td><integro:htmltext value="<%=stageOb.getRemarks()%>" lineLength="80"/>&nbsp;</td>
             <%bb++;  if(bb%2!=0){ aa = "even"; }else{ aa = "odd"; } %>
        </tr>

    </tbody>
</table>


</td>
</tr>
</tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <%
            if (previous != null && previous.equals(ReassignmentConstant.TASK_EVENT)) {
        %>
            <td width="100" valign="baseline" align="center">
                <a href="#" onclick="submitPage('<%=checkListTrxVal.getTransactionID()%>')"
                        onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image1" width="60" height="22" border="0" id="Image1"/></a>
             </td>
        <% } else if (false) {
//      if (request.getParameter("event") != null && "view_receipt".equals(request.getParameter("event"))) {
            String checkListID = request.getParameter("checkListID");
            String secType = request.getParameter("secType");
            String secSubType = request.getParameter("secSubType");
            String limitBkgLoc = request.getParameter("limitBkgLoc");
            String collateralID = request.getParameter("collateralID");
            String limitProfileID = request.getParameter("limitProfileID");
        %>
             <td width="75" valign="baseline" align="center">
                <a href="UpdatePariPassuCheckListAction.do?event=view&checkListID=<%=checkListID%>&limitBkgLoc=<%=limitBkgLoc%>&secType=<%=secType%>&secSubType=<%=secSubType%>&collateralID=<%=collateralID%>&limitProfileID=<%=limitProfileID%>"
                    onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image11','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image11"   border="0" id="Image11"/></a>
              </td>
        <% } else { %>
            <td width="75" valign="baseline" align="center">
                <a href="#" onclick="submitPage('<%=checkListTrxVal.getTransactionID()%>')" onmouseout="MM_swapImgRestore()"
                         onmouseover="MM_swapImage('Image12','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Image12" border="0"  id="Image12"/></a>
             </td>
        <% } %>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
