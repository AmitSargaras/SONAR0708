<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBLiquidation"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecovery"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecoveryIncome"%>
<%@ page import="com.integrosys.base.businfra.currency.Amount" %>
<%@ page import="com.integrosys.base.businfra.currency.CurrencyManager" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.base.uiinfra.common.Constants" %>
<%@ page import="com.integrosys.cms.ui.common.ForexHelper" %>
<%@ page import="java.util.Locale" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/liquidation/interest_rate_maker_list.jsp,v 1 2007/02/09 Lini Exp $
*
* Describe this JSP.
* Purpose: For Maker and checker Add edit the Recovery
*
* @author $Author: lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>
<%
    String index = request.getParameter("index"); 
    String event = request.getParameter("event");
    
    String action = "";
    if (LiquidationAction.EV_PREPARE_ADD_RECOVERY.equals(event))
        action = "label.add.new";
    else
        action = "label.edit";

    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");
    String recoveryType = aForm.getRecoveryType();
    
    OBLiquidationTrxValue obTrxValue = null;
    Collection recovery = null ;
    Collection income = null ;
    
    OBLiquidation liquidation = (OBLiquidation)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.InitialLiquidation");

    if (liquidation != null){
        recovery = liquidation.getRecovery();
        if (recovery != null){
            for(Iterator itr = liquidation.getRecovery().iterator(); itr.hasNext(); ) {
            	OBRecovery obRecovery = (OBRecovery)itr.next();
            	if (obRecovery.getRecoveryType().equalsIgnoreCase(recoveryType))
                	income = obRecovery.getRecoveryIncome();
            }
        }
    }
    
    Amount amount = new Amount(0, new CurrencyCode(IGlobalConstant.DEFAULT_CURRENCY));
    if( income!=null ) {
        pageContext.setAttribute("income",income);
        for (Iterator incItr = income.iterator(); incItr.hasNext();) {
            OBRecoveryIncome obRecoveryIncome = (OBRecoveryIncome) incItr.next();
            amount = ForexHelper.addAmount(amount, obRecoveryIncome.getTotalAmountRecovered());
        }
        if (amount != null && 
        		!(LiquidationAction.EV_ADD_RECOVERY.equals(event) || LiquidationAction.EV_PREPARE_ADD_RECOVERY.equals(event))) {
	        Locale locale = Locale.getDefault();
	        aForm.setTotalAmtRecovered(CurrencyManager.convertToDisplayString(locale,amount));
	        aForm.setTotalAmtRecoveredCurrency(amount.getCurrencyCode());
        }
    }
    
    //todo get collateral location from security
    String[] securityLoc = new String[1];
    securityLoc[0]=(String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.collateralLoc");
    securityLoc[0]="SG";
    Collection recoveryTypeList = CommonCodeList.getInstance(null,null,ICMSConstant.CATEGORY_LIQ_RECOVERY_TYPE).getCommonCodeValues();
    Collection recoveryTypeDescList =  CommonCodeList.getInstance(null,null,ICMSConstant.CATEGORY_LIQ_RECOVERY_TYPE).getCommonCodeLabels();;
    pageContext.setAttribute("recoveryTypeList", recoveryTypeList);
    pageContext.setAttribute("recoveryTypeDescList", recoveryTypeDescList);

    HashMap currency = (HashMap)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.currency.map");
    if (currency != null){
        System.out.println("currency Map  = " + currency );
        pageContext.setAttribute("currencyList", currency.get("Values"));
        pageContext.setAttribute("currencyDescList", currency.get("Labels"));
    }


%>


<%@page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<%@include file="include_js_function.jsp" %>

<script language="JavaScript" type="text/JavaScript">
<!--
    function callSubmit(selObj,ind) {
	    temp = selObj.options[selObj.selectedIndex].value;
	    if(temp=="") {
	        return false;
	    }else{
	        document.forms[0].event.value = selObj.options[selObj.selectedIndex].value;
			document.forms[0].oindex.value = ind;
	        document.forms[0].actionTypeName.value = selObj.options[selObj.selectedIndex].value;
			document.forms[0].submit();
	    }
	}
	
    function callSubmit1(eventValue,ind) {
        document.forms[0].event.value = eventValue;
		document.forms[0].oindex.value = ind;
        document.forms[0].actionTypeName.value = eventValue;
		document.forms[0].submit();
	}	

function gotoListing() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EVENT_LIST%>";
    document.forms[0].submit();
}
function addRecovery() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_ADD_RECOVERY%>";
    document.forms[0].submit();
}
function editRecovery() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_EDIT_RECOVERY%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<%@include file="include_isChecker.jsp"%>
<html:form action="Liquidation.do">
<body>
<html:hidden property="event" value=""/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index" value="<%=index%>"/>
<input type="hidden" name="oindex" value=""/>
<!-- InstanceBeginEditable name="Content" -->
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.liquidation.npl.recovery.details"/>&nbsp;-&nbsp;<bean:message key="<%=action%>"/></h3></td>
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
        <tbody>
        <tr class="odd">
          <td width="30%" class="fieldname"><bean:message key="label.liquidation.npl.recovery.type"/><bean:message key="label.mandatory"/></td>
          <td width="70%">
          	 <% if ((aForm.getRecoveryType() != null && aForm.getRecoveryType().length() > 0) &&
          	       !(LiquidationAction.EV_ADD_RECOVERY.equals(event) || LiquidationAction.EV_PREPARE_ADD_RECOVERY.equals(event))){ %>
          	   <integro:empty-if-null  value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.CATEGORY_LIQ_RECOVERY_TYPE,aForm.getRecoveryType())%>" />
          	   <html:hidden property="recoveryType" />
          	 <%} else { %>
              <html:select property="recoveryType" value="<%=aForm.getRecoveryType()%>">
                 <option value="">Please Select </option>
                 <html:options name="recoveryTypeList" labelName="recoveryTypeDescList"/>
              </html:select>
              <% } %>
              <html:errors property="recoveryTypeError" />
              &nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.total.amount.recovered"/> <bean:message key="label.mandatory"/></td>
          <td>
          	  <integro:empty-if-null  value="<%=aForm.getTotalAmtRecoveredCurrency()%>"/>
              <integro:empty-if-null  value="<%=aForm.getTotalAmtRecovered()%>"/>
              &nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.remarks"/> </td>
          <td><html:textarea  property="recoveryRemarks" rows="4" style="width:95%"  value="<%=aForm.getRecoveryRemarks()%>" />
	          <html:errors property="recoveryRemarksError" />&nbsp;</td>
        </tr>
        </tbody>
      </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="right" valign="bottom">&nbsp;</td>
    </tr>
    <% if (! LiquidationAction.EV_ADD_RECOVERY.equals(event)&& !LiquidationAction.EV_PREPARE_ADD_RECOVERY.equals(event)){%>
    <tr>
      <td colspan="2"><table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:30px">
        <thead>
          <tr>
            <td width="76%"><h3><bean:message key="label.liquidation.npl.recovery.income.details"/></h3></td>
            <%--<% if (isSACMaker && entries_editable){%>--%>
            <td width="24%" align="right" valign="bottom"><input type="button" value='<bean:message key="label.add.new"/>' class="btnNormal" onclick="addIncome()"/>
              <input type="button" onclick="removeIncome()" value='<bean:message key="label.remove"/>' class="btnNormal"/>
            </td>
            <%--<%}%>--%>
          </tr>
          <tr>
            <td colspan="2"><hr/></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                  <tr class="even">
                    <td class="fieldname" width="1%" >S/N</td>
                    <td class="fieldname" width="46%"><bean:message key="label.liquidation.npl.recovery.date"/></td>
                    <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.amount.recovered"/></td>
                    <td class="fieldname" width="20%"><bean:message key="label.global.action"/></td>
                    <%--<% if (isSACMaker && entries_editable){%>--%>
                    <td class="fieldname" width="13%"><bean:message key="label.global.delete"/></td>
                    <%--<%}%>--%>
                  </tr>
                </thead>
                <tbody>

                <%int rowIdx = 0;%>
                <logic:present name="income" >
                  <logic:iterate id="obRecoveryIncome" name="income"  type= "com.integrosys.cms.app.liquidation.bus.OBRecoveryIncome">
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=rowIdx%></td>
                      <td><integro:date object="<%=obRecoveryIncome.getRecoveryDate()%>"/>&nbsp;</td>
                      <td><integro:currency amount="<%=obRecoveryIncome.getTotalAmountRecovered()%>"/>&nbsp;</td>
                      <td style="text-align:center">
                      	<a href="javascript:callSubmit1('<%=LiquidationAction.EV_PREPARE_EDIT_RECOVERY_INCOME%>','<%=rowIdx-1%>');">View/Edit</a>
                      	<input type="hidden" name="actionTypeName" value="" />
                      </td>
                        <%--<% if (isSACMaker && entries_editable){%>--%>
                        <td style="text-align:center"><input type="checkbox" name="check2" value='<%=rowIdx-1%>'/></td>
                        <%--<%}%>--%>
                    </tr>
                  </logic:iterate>
                </logic:present>
                <% if (income == null || income.size() == 0) {%>
                  <tr class="odd">
                    <%--<% if (isSACMaker && entries_editable){%>--%>
                    <td colspan="6"><bean:message key="label.no.records.found"/></td>
                    <%--<%}else{%>--%>
                    <!--<td colspan="5"><bean:message key="label.no.records.found"/></td>-->
                    <%--<%}%>--%>
                  </tr>
                <%}%>

                  <tr class="even">
                    <td class="total">&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <%--<% if (isSACMaker && entries_editable){%>--%>
                    <%-- %><td class="total">&nbsp;</td> --%>
                    <%--<%}%>--%>
                  </tr>
                </tbody>
              </table>
					</td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
      </td>
    </tr>
  <%}%>
      </tbody>
    </table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <% if(LiquidationAction.EV_PREPARE_ADD_RECOVERY.equals(event) || LiquidationAction.EV_ADD_RECOVERY.equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:addRecovery();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if(LiquidationAction.EV_CHECKER_VIEW.equals(event)){%>
      <td width="100%" valign="baseline" align="center"> <a href="Liquidation.do?event=<%=LiquidationAction.EVENT_PREPARE%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else{%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:editRecovery();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/save2.gif',1)"><img src="img/save1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
