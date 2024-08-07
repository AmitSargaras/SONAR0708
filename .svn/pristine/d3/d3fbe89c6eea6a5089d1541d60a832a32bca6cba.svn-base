<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterparty,
                 com.integrosys.cms.ui.common.tag.TokenTag,
                 com.integrosys.cms.ui.customer.viewdetails.CustomerViewAction,
                 com.integrosys.cms.ui.cci.CounterpartyCCIAction" %>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterpartyDetails" %>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartySearchForm" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.cms.app.cci.trx.ICCICounterpartyDetailsTrxValue"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.app.cci.trx.OBCCICounterpartyDetailsTrxValue"%>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartyUIHelper"%>
<%@ page import="com.integrosys.cms.app.cci.bus.OBCCICounterparty"%>
<%@ page import="com.integrosys.base.uiinfra.common.AbstractCommonMapper"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.util.Date" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<jsp:include page="printTransValue.jsp"/>
<%
//    Enumeration e =  session.getAttributeNames();
//    while (e.hasMoreElements()) DefaultLogger.debug(this, ">>>>>>>>session: " + e.nextElement());

    ICCICounterpartyDetails details = null;
    ICCICounterparty[]   obj;
    String aGroupCCINo = "-";
    String event = (String) request.getAttribute("event");
    System.out.println("edit_cciNo_list.jsp, event = " + event);
    String lastActionBy = "";
    String lastRemarksMade = "";
    boolean ismakerRejected = false;
    String formGroupNo = null;
    String remarks = (String) request.getAttribute("remarks");;
    CounterpartySearchForm aForm = (CounterpartySearchForm) request.getAttribute("CounterpartySearchForm");
    if (aForm != null) {
        details = aForm.getICCICounterpartyDetails();
        if (details != null) {
            obj = details.getICCICounterparty();
            if (obj != null && obj.length > 0) {
                for (int i=0; i<obj.length; i++)
                if (obj[0].getGroupCCINo() != ICMSConstant.LONG_INVALID_VALUE ){
                    formGroupNo = obj[0].getGroupCCINo() + "";
                }
            }
        }
    } else {
    	DefaultLogger.debug(this,">>>>>>>>>>>>>>>>>>>>edit_cciNo_list.jsp, aForm = null");
    }

    ICCICounterpartyDetailsTrxValue trxValue = (ICCICounterpartyDetailsTrxValue) session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.ICCICounterpartyDetailsTrxValue");
    String strGroupNo = null;
    if (trxValue != null) {
         System.out.println("trxValue.lastActionBy() = " + trxValue.getUserInfo());
         System.out.println("trxValue.getRemarks() = " + trxValue.getRemarks());
        lastActionBy = trxValue.getUserInfo();
        lastRemarksMade = trxValue.getRemarks();
        if (lastRemarksMade == null) {
            lastRemarksMade = "";
        }
        if ("maker_prepare_update".equals(event)  || "maker_edit_cci_reject".equals(event)) {
            ismakerRejected = true;
            details = trxValue.getStagingCCICounterpartyDetails();
            strGroupNo = details.getGroupCCINo() + "";
        } else {
            details = trxValue.getCCICounterpartyDetails();
        }

    } else {
        trxValue = new OBCCICounterpartyDetailsTrxValue();
    }

    if (formGroupNo != null){
        aGroupCCINo =  formGroupNo;
    }
    if (strGroupNo != null) {
        aGroupCCINo =  strGroupNo; 
    }
    if (trxValue != null) {
        ICCICounterpartyDetails detail = trxValue.getCCICounterpartyDetails();
        if (detail != null) {
            aGroupCCINo = detail.getGroupCCINo() + "";
        }
    }

    int rowIdx = 0;
    int count = 1;
    boolean noRecords = false;

%>

<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>
<body>
<br><br>
<html:form action="CounterpartyCCI.do?event=list">
<input type="hidden" name="event"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
</thead>
<tbody>
<tr>
    <td>
        <table width="100%" align="center">
            <tr><td>
                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblInput">
                    <thead>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td width="25%" class="fieldname"><bean:message key="label.cci.cciNo"/></td>
                            <td width="75%">&nbsp;<%=aGroupCCINo%></td>
                        </tr>
                    </tbody>
                </table>
            </td></tr></table>
    </td>
</tr>
<tr>
    <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td width="73%"><h3><bean:message key="title.cci.counterparty.list"/></h3></td>
                <td width="27%" align="right" valign="bottom">
                    <input type="button" name="Submit" value="Add" class="btnNormal" onClick="fnsubmit('1')"/>
                    <input type="button" name="Submit2" value="Remove" class="btnNormal" onClick="fnsubmit('2')"/>
                </td>
            </tr>
            <tr>
                <td colspan="2"><hr/></td>
            </tr>
        </table>
    </td>
</tr>
<tr>
    <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"  class="tblInfo">
            <thead>
                <tr>
                    <td width="5%"><bean:message key="label.global.sn"/></td>
                    <td width="40%"><bean:message key="label.customer.name"/>/<br><bean:message key="label.agreement.address"/></td>
                    <td width="15%"><bean:message key="label.customer.doincorp"/></td>
                    <td width="15%"><bean:message key="label.customer.id.source"/></td>
                    <td width="10%"><bean:message key="label.customer.id"/></td>
                    <td width="15%"><bean:message key="label.col.owner.id.no"/></td>
                    <td width="5%"><bean:message key="label.global.delete"/></td>
                </tr>
            </thead>
            <%


                if (details != null) {
                    ICCICounterparty[]  iCCICounterparty = details.getICCICounterparty();
                    if (iCCICounterparty != null && iCCICounterparty.length > 0) {
//                          System.out.println("ICCICounterparty " + iCCICounterparty.length);
                        for (int index = 0; index < iCCICounterparty.length; index++) {
                            ICCICounterparty OB = iCCICounterparty[index];
//                            String legalName = (CounterpartyUIHelper.isNotEmpty(OB.getLegalName())) ? OB.getLegalName() : "-";
                            String legalName = (CounterpartyUIHelper.isNotEmpty(OB.getCustomerName())) ? OB.getCustomerName() : "-";
                            Date dob = OB.getDob()!=null?OB.getDob():OB.getIncorporationDate()!=null?OB.getIncorporationDate():null;
//                            String dob = CounterpartyUIHelper.isNotEmpty(OB.getDob())  ? OB.getDob() : "-";
                            String sourceID = (CounterpartyUIHelper.isNotEmpty(OB.getSourceID())) ? OB.getSourceID() : "-";
                            String sourceDesc = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, sourceID);
                            sourceDesc = (CounterpartyUIHelper.isNotEmpty(sourceDesc)) ? sourceDesc : "-";
                            String lmpLeID = (CounterpartyUIHelper.isNotEmpty(OB.getLmpLeID())) ? OB.getLmpLeID() : "-";
                            String idNO = (CounterpartyUIHelper.isNotEmpty(OB.getIdNO())) ? OB.getIdNO() : "-";
                            String deleteValue = OB.getSubProfileID() + "";
                            String IndexClass = "index";
                            if (OB.getDeletedInd()){
                               IndexClass = "indexdel";
                            }else{
                                  IndexClass = "indexAdd";
                            }
                         if (ismakerRejected){
                             //System.out.println("OB.setDeletedInd(); = " + OB.getDeletedInd());
                             noRecords=true;
                          %>
                         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                         <%--<td class="index"><%=count++%></td>--%>
                         <td class="<%=IndexClass%>"><%=count++%></td>
                         <td>
                             <a href="javascript:viewCustomer('<%=OB.getSubProfileID()%>')"><%=legalName%>&nbsp;</a>
                             <%--<%=legalName%>&nbsp;--%>
                                    <br><%=CounterpartyUIHelper.displayAddress(OB.getAddress())%> </td>
                        <td><% if (dob != null){%>
                            <integro:date object="<%=dob%>"/>
                          <%}else {%>
                           -
                           <%}%>&nbsp;</td>
                        <td><%=sourceDesc%>&nbsp;</td>
                        <td><%=lmpLeID%>&nbsp; </td>
                        <td><%=idNO%>&nbsp; </td>
                        <td style="text-align:center;">
                          <% if (OB.getDeletedInd()){ %>
                            <input name="chkDeletes" type="checkbox" checked="true" disabled="true" value="<%=deleteValue%>"/>
                           <%}else {%>
                           <input name="chkDeletes" type="checkbox" value="<%=deleteValue%>"/>
                           <%}%>
                            &nbsp; </td>
                    </tr>
                       <%
                        } else if (!OB.getDeletedInd()){
                             noRecords=true;
                        %>

                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index"><%=count++%></td>
                         <td>
                             <a href="javascript:viewCustomer('<%=OB.getSubProfileID() %>')"><%=legalName%>&nbsp;</a>
                             <%--<%=legalName%>&nbsp;--%>
                                    <br><%=CounterpartyUIHelper.displayAddress(OB.getAddress())%> </td>
                         <td><% if (dob != null){%>
                            <integro:date object="<%=dob%>"/>
                          <%}else {%>
                           -
                           <%}%>&nbsp;</td>
                        <td><%=sourceDesc%>&nbsp;</td>
                        <td><%=lmpLeID%>&nbsp; </td>
                        <td><%=idNO%>&nbsp; </td>
                        <td style="text-align:center;"><input name="chkDeletes" type="checkbox" value="<%=deleteValue%>"/>&nbsp; </td>
                    </tr>
                    <%} else{
                        // System.out.println("edit_cciNo_list.jsp, Deleted by User legalName  = " + legalName);
                    }
                }
            } else {
//                     System.out.println("ICCICounterparty is null");
             }
            }else{
               // System.out.println("iCCICounterpartyDetails is null");
            }%>
            <%
            if(!noRecords){%>
                <td colspan="7" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
            <%} %>
        </table>
    </td>
</tr>

 <%
    String makerEvent = "";
      if (request.getAttribute("event") == null &&  request.getParameter("event") ==null ) {
      }else{
            makerEvent = (String) request.getAttribute("event") ;
            if (makerEvent ==null){
             makerEvent = (String) request.getParameter("event") ;
            }
        }
 /* String maker_process_event  =  (String) request.getAttribute("event") ;
    if ("maker_edit_cci_reject".equals(event)){
        maker_process_event   = "maker_edit_cci_reject"  ;
      }
   if (maker_process_event ==null) {
    maker_process_event =(String) session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.process_event") ;
   }*/

  String maker_process_event = (String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+".maker_process_event");
  System.out.println("maker_process_event = " + maker_process_event );
%>
  <%--<input type="text" name="maker_process_event" value="<%=maker_process_event%>"--%>

<%if ("maker_edit_cci_reject".equals(makerEvent) || "maker_edit_cci_reject".equals(maker_process_event)){  %>

<%if(trxValue!=null&&trxValue.getStagingCCICounterpartyDetails()!=null){%>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>

<tr>
    <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr>
                    <td class="fieldname">Remarks</td>
                    <td class="odd"><html:textarea property="remarks" style="width:90%" value="<%=remarks%>"/><br>
                        <html:errors property="remarks"/></td>
                </tr>
                <tr>
                    <td class="fieldname">Last Action By</td>
                    <td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Last Remarks Made</td>
                    <td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
                </tr>
            </tbody>
        </table>
    </td>
</tr>
<%}%>
<% }%>

<tr>
    <td height="2">
        <table width="200" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center" colspan="4">&nbsp;</td>
                <td align="center" colspan="4">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <a href="javascript:fnsubmit('3')">
                        <img src="img/submit1.gif" name="Image5" border="0" alt="submit" id="Image5"/>
                    </a>
                </td>
              <%if ("maker_edit_cci_reject".equals(makerEvent) || "maker_edit_cci_reject".equals(maker_process_event)){  %>
                 <td><a href="ToDo.do"
                   onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image511','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image511"  width="70" height="20" border="0" id="Image511"/></a>
            </td>
             <%}%>
            </tr>
            <tr>
                <td align="center" colspan="4">&nbsp;</td>
                <td align="center" colspan="4">&nbsp;</td>
            </tr>
        </table>
    </td>
</tr>

</table>

<script type="text/javascript">
        function fnsubmit(str){
            var frm = document.forms[0];
            if('1'== str){
               frm.event.value='search_customer';
               frm.action='CounterpartyCCI.do?event=search_customer';
               frm.submit();
            }
            if('2'== str){
               frm.event.value='remove';
               frm.action='CounterpartyCCI.do?event=remove';
               frm.submit();
            }
             if('3'== str){
                var check ='<%=noRecords%>';
                var count ='<%=rowIdx%>';
               if ('false'== check || count < 2){
//                   alert('Common CounterParty Identifier must have a minimum of 2 records');
                    alert('<bean:message key="error.counterparty.minTwoCustomer" />');

                  disableGoButtons(false) ;
               }else{
                   frm.event.value='submit';
                   frm.action='CounterpartyCCI.do?event=submit';
                   frm.submit();
                   }
            }
        }

       function makeEditable(whichOne){
            if(document.getElementById(whichOne).disabled == true){
                document.getElementById(whichOne).disabled = false;
            }else if(document.getElementById(whichOne).disabled == false){
                document.getElementById(whichOne).disabled = true;
            }
     }

    /*    function viewCustomer(sub_profile_id){
		    var  url ="CounterpartyCCI.do?event=viewLimitProfile&sub_profile_id=" + sub_profile_id  ;
		    window.open(url,'' ,"height=600, width=750, resizable=no,scrollbars=no,status=no, toolbar=no,menubar=no,location=no",'yes');
        }*/
    </script>

</html:form>

<%@ include file="/customer/viewdetails/viewCustomer.jsp"%>

</body>
</html>
