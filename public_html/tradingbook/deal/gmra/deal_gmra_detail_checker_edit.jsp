<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 java.util.*,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADeal,
                 com.integrosys.cms.app.tradingbook.trx.OBGMRADealTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: $
*
* Describe this JSP.
* Purpose: For Checker to approve and reject GMRA Deal detail
* Description: approve and reject the GMRA Deal detail that being change by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date:$
* Tag: $Name$
*/
%>

<%
    String event = request.getParameter("event");
    OBGMRADealTrxValue obTrxValue = null;
    Object trxObjFromSession = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealAction.GMRADealTrxValue");
    DefaultLogger.debug(this,">>>Debug:::003 ");
    IGMRADeal  parametersArray = null ;
    IGMRADeal  stagingParametersArray = null ;
    DefaultLogger.debug(this,">>>Debug:::004 ");

    if( trxObjFromSession ==null ) {
        out.println("Expected session parameter 'IGMRADealValTrxValue' is missing.");
        return;
    }

    DefaultLogger.debug(this,">>>Debug:::005 ");
    obTrxValue = (OBGMRADealTrxValue)trxObjFromSession;

    parametersArray = obTrxValue.getGMRADeal();

    stagingParametersArray = obTrxValue.getStagingGMRADeal();
    DefaultLogger.debug(this,">>>Debug:::006 ");
    DefaultLogger.debug(this,stagingParametersArray);

   HashMap hm = new HashMap();
   boolean isProcess = true;
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
    document.forms[0].action = "GMRADeal.do?event=checker_approve_edit_dealdetails";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action = "GMRADeal.do?event=checker_reject_edit_dealdetails";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="GMRADeal.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getCPAgreementDetail().getAgreementID())%>"/>

<%@ include file="../deal_agreement_detail_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.gmra.deal.view.title"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.id"/></td>
              <td><integro:empty-if-null value="<%=stagingParametersArray.getDealID()%>"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"ProductType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.product.type"/></td>
              <td>
                <%String productType = null;
                  hm = CommonDataSingleton.getCodeCategoryValueLabelMap("FAC_TYPE_TRADE","GMRA");
                  if(! (stagingParametersArray.getProductType().equals(null) || stagingParametersArray.getProductType().equals("")) ){
                    productType = (String) hm.get(stagingParametersArray.getProductType());
                  }%>
                <integro:empty-if-null value="<%=productType%>"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"SecDesc")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.security"/></td>
              <td colspan="3"><integro:empty-if-null value="<%=stagingParametersArray.getSecDesc()%>"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="<%=(CompareOBUtil.compOB(stagingParametersArray,parametersArray,"ISINCode"))?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.isin.code"/></td>
              <td><integro:empty-if-null value="<%=stagingParametersArray.getISINCode()%>"/>&nbsp;</td>
              <td class="<%=(CompareOBUtil.compOB(stagingParametersArray,parametersArray,"CUSIPCode"))?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.cusip"/></td>
              <td><integro:empty-if-null value="<%=stagingParametersArray.getCUSIPCode()%>"/>&nbsp;</td>
            </tr>

            <tr class="odd">
            <%  
                boolean changed = false;
                Amount oldChargeAmt = parametersArray!=null?parametersArray.getDealAmount():null;
                Amount newChargeAmt = stagingParametersArray.getDealAmount();
                if (isProcess) {
                    if (newChargeAmt != null && oldChargeAmt == null) {
                        if (newChargeAmt.getAmount() != 0) {
                            changed = true;
                        }
                    } else if (newChargeAmt != null && oldChargeAmt != null) {
                        changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"Amount");
                        if(!changed){
                          changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"CurrencyCode");
                        }
                    }
                }
            %>
              <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.gmra.deal.trade.price"/></td>
              <td><integro:amount param="all" amount="<%=stagingParametersArray.getDealAmount()%>" decimal="4"/>&nbsp;</td>
            
            
            <%  changed = false;
                oldChargeAmt = parametersArray!=null?parametersArray.getNotionalAmount():null;
                newChargeAmt = stagingParametersArray.getNotionalAmount();
                if (isProcess) {
                    if (newChargeAmt != null && oldChargeAmt == null) {
                        if (newChargeAmt.getAmount() != 0) {
                            changed = true;
                        }
                    } else if (newChargeAmt != null && oldChargeAmt != null) {
                        changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"Amount");
                        if(!changed){
                          changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"CurrencyCode");
                        }
                    }
                }
            %>
              <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.gmra.deal.notinal"/></td>
              <td><integro:amount param="all" amount="<%=stagingParametersArray.getNotionalAmount()%>" decimal="4"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"Haircut")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.haircut"/></td>
              <td><integro:empty-if-null value="<%=stagingParametersArray.getHaircut().toString()%>"/>&nbsp;%</td>
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"DealRate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.deal.rate"/></td>
              <td><integro:empty-if-null value="<%=stagingParametersArray.getDealRate().toString()%>"/>&nbsp;%</td>
            </tr>
			
            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"RepoStartAmt")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.repoStartAmt"/></td>
              <%									  
				if( stagingParametersArray.getRepoStartAmt() != null ) {
					Amount repoStartAmt = new Amount( stagingParametersArray.getRepoStartAmt(),
													  stagingParametersArray.getDealAmount().getCurrencyCodeAsObject() );				
				
			  %>
				<td><integro:amount param="amount" amount="<%=repoStartAmt%>" decimal="4"/>&nbsp;</td>
              <% } else {  %>
				<td>-&nbsp;</td>
			  <% }  %>
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"RepoEndAmt")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.repoEndAmt"/></td>
			  <%
				if( stagingParametersArray.getRepoEndAmt() != null ) {			
					Amount repoEndAmt = new Amount( stagingParametersArray.getRepoEndAmt(),
													  stagingParametersArray.getDealAmount().getCurrencyCodeAsObject() );								
			  %>
				<td><integro:amount param="amount" amount="<%=repoEndAmt%>" decimal="4"/>&nbsp;</td>	  
              <% } else {  %>
				<td>-&nbsp;</td>
			  <% }  %>			  
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"TradeDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.tenor.start.date"/></td>
              <td><integro:date object="<%=stagingParametersArray.getTradeDate()%>"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"MaturityDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.tenor.maturity.date"/></td>
              <td><integro:date object="<%=stagingParametersArray.getMaturityDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"DealCountry")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.country"/></td>
              <td>
                <%String cty = null;
                  if(! (stagingParametersArray.getDealCountry().equals(null) || stagingParametersArray.getDealCountry().equals("")) ){
                    cty = CountryList.getInstance().getCountryName(stagingParametersArray.getDealCountry());
                  }%>
                <integro:empty-if-null value="<%=cty%>"/>&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingParametersArray,parametersArray,"DealBranch")?"fieldname":"fieldnamediff"%>"><bean:message key="label.gmra.deal.mbb.branch"/></td>
              <td>
                <%String dealBranch = null;
                  hm = CommonDataSingleton.getCodeCategoryValueLabelMap("40",null,stagingParametersArray.getDealCountry());
                  if(! (stagingParametersArray.getDealBranch().equals(null) || stagingParametersArray.getDealBranch().equals("")) ){
                    dealBranch = (String) hm.get(stagingParametersArray.getDealBranch());
                  }%>
                <integro:empty-if-null value="<%=dealBranch%>"/>&nbsp;
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
