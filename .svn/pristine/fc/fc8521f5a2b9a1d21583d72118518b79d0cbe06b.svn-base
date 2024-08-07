<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.*,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.tradingbook.bus.ICashMargin,
                 com.integrosys.cms.app.tradingbook.bus.OBCashMargin,
                 com.integrosys.cms.app.tradingbook.trx.OBCashMarginTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String event = request.getParameter("event");
    OBCashMarginTrxValue obTrxValue = null;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginAction.CashMarginTrxValue");
    com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginForm aForm = (com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginForm) request.getAttribute("CashMarginForm");
    DefaultLogger.debug(this,">>>Debug:::003 ");
    ICashMargin[] parametersArray = null ;
    ICashMargin[] stagingParametersArray = null ;
    DefaultLogger.debug(this,">>>Debug:::004 ");

    if( obj ==null ) {
        out.println("Expected session parameter 'IGMRADealValTrxValue' is missing.");
        return;
    }

    DefaultLogger.debug(this,">>>Debug:::005 ");
    obTrxValue = (OBCashMarginTrxValue) obj;

    parametersArray = (ICashMargin[]) obTrxValue.getCashMargin();
    DefaultLogger.debug(this,">>>Debug:::parametersArray " + parametersArray);

    stagingParametersArray = (ICashMargin[]) obTrxValue.getStagingCashMargin();
    DefaultLogger.debug(this,">>>Debug:::stagingParametersArray " + stagingParametersArray);
    DefaultLogger.debug(this,">>>Debug:::006 ");
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function approvePage() {
    document.forms[0].action = "CashMargin.do?event=checker_approve_edit_allcashmargin";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action = "CashMargin.do?event=checker_reject_edit_allcashmargin";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="CashMargin.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:hidden property="lEID" value="<%=String.valueOf(obTrxValue.getLimitProfileID())%>"/>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getAgreementID())%>"/>

<%@ include file="../deal/cp_agreement_common_page.jsp"%> 

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.cash.margin.title"/></h3></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td width="15%"><bean:message key="label.cash.margin.sn"/></td>
              <td width="30%"><bean:message key="label.cash.margin.transaction.date"/></td>
              <td width="15%"><bean:message key="label.cash.margin.plus.minus"/></td>
              <td width="20%"><bean:message key="label.cash.margin.net.act.principal"/></td>
              <td width="20%"><bean:message key="label.cash.margin.interest"/></td>
            </tr>
          </thead>
          <tbody>
            <%
               String classtype = "odd";
               List res = CompareOBUtil.compOBArray(stagingParametersArray,parametersArray);
               ArrayList list = new ArrayList(res);
               pageContext.setAttribute("cashMargin",list);
               if (list == null || list.size() == 0) {
            %>
            <tr class="odd">          
            

            <td colspan="5">There is no cash margin information.</td>
            </tr>
           <% } int counter = 0; %>
            <logic:present name="cashMargin" >
              <logic:iterate id="compResult" name="cashMargin" type="com.integrosys.base.techinfra.diff.CompareResult"  >
                <%ICashMargin cashParameter = (ICashMargin) compResult.getObj();
                  classtype = "odd";
                %>
                <tr class="<%=classtype%>">
                  <td width="15%" class="<bean:write name="compResult" property="key" />"><%=counter + 1%></td>
                  <td width="30%"><integro:date object="<%=cashParameter.getTrxDate()%>"/></td>
                  <td>
                    <%if(cashParameter.getNAPSignAddInd() == true){%>
                    +
                    <%}else{%>
                    -
                    <%}%>&nbsp;
                  </td>
                  <td><integro:amount param="all" amount="<%=cashParameter.getNAPAmount()%>" decimal="4"/>&nbsp;</td>
                  <td><integro:empty-if-null value="<%=cashParameter.getCashInterest()%>"/>&nbsp;</td>
                </tr>
                <%if (classtype.equals("odd")) { 
                    classtype = "even";
                  } else {
                    classtype = "odd";
                  }
                  counter++;
                %>
              </logic:iterate>
            </logic:present>

            <tr class="<%=classtype%>" >
                <td colspan="3" align="right">Total</td>
                <td>&nbsp;</td>
                <td><integro:empty-if-null value="<%=obTrxValue.getTotalCashInterest()%>"/>&nbsp;</td>
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
      <%
        String paramUID = obTrxValue.getUserInfo();
        String paramRemarks = obTrxValue.getRemarks();
        if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
          paramRemarks=" ";
        }
      %>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr>
              <td width="43%" class="fieldname">Remarks</td>
              <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
            </tr>
            <tr>
              <td class="fieldname">Last Action By</td>
              <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Last Remarks Made</td>
              <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
