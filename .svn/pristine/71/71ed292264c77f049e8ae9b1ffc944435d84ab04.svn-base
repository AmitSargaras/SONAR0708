<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.*,
				 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADeal,
                 com.integrosys.cms.app.tradingbook.bus.OBGMRADealDetail,
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
* Purpose: For Maker to close the GMRA Deal detail
* Description: close the GMRA Deal detail value which rejected by Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String event = request.getParameter("event");
    IGMRADeal parameters = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealAction.GMRADealTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealForm aForm = (com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealForm) request.getAttribute("GMRADealForm");
    boolean entries_editable = false;
    boolean isRejected = false;

    OBGMRADealTrxValue obTrxValue = null;

    if( obj!=null ) {
      DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.GMRADealTrxValue");
      obTrxValue = (OBGMRADealTrxValue)obj;
      DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

      // check whether the currentStatus is REJECTED
        String status = "";
        if(obTrxValue.getStatus().length() > 8){
          status = obTrxValue.getStatus().substring(0,8);
        }else{
          status = obTrxValue.getStatus();
        }
        isRejected = ICompConstant.STATE_REJECTED.equals( status );//true;


      // Entries are editable only if the record is ACTIVE.
      if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
        entries_editable = true;
      }

      parameters = obTrxValue.getStagingGMRADeal();

    }else {
      DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'GMRADealTrxValue' ");
    }

    HashMap hm = new HashMap();
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

function closeEditRejected() {
    document.forms[0].action = "GMRADeal.do?event=maker_close_dealdetails_confirm";
    document.forms[0].submit();
}

function goPreparePage() {
    document.forms[0].action = "GMRADeal.do?event=view_gmra_deal_detail&agreementID=<%=obTrxValue.getCPAgreementDetail().getAgreementID()%>&limitProfileID=<%=obTrxValue.getCPAgreementDetail().getLimitProfileID()%>";
    document.forms[0].submit();
}

function deletePage() {
    document.forms[0].action = "GMRADeal.do?event=delete_gmra_dealdetails_confirm";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="GMRADeal.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:hidden property="limitProfileID" value="<%=String.valueOf(obTrxValue.getCPAgreementDetail().getLimitProfileID())%>"/>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getCPAgreementDetail().getAgreementID())%>"/>
<html:hidden property="cmsDealID" value="<%=String.valueOf(parameters.getCMSDealID())%>"/>

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
              <td><integro:empty-if-null value="<%=parameters.getDealID()%>"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.product.type"/></td>
              <td>
                <%String productType = null;
                  hm = CommonDataSingleton.getCodeCategoryValueLabelMap("FAC_TYPE_TRADE","GMRA");
                  if(! (parameters.getProductType().equals(null) || parameters.getProductType().equals("")) ){
                    productType = (String) hm.get(parameters.getProductType());
                  }%>
                <integro:empty-if-null value="<%=productType%>"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.security"/></td>
              <td colspan="3"><integro:empty-if-null value="<%=parameters.getSecDesc()%>"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.isin.code"/></td>
              <td><integro:empty-if-null value="<%=parameters.getISINCode()%>"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.cusip"/></td>
              <td><integro:empty-if-null value="<%=parameters.getCUSIPCode()%>"/>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.trade.price"/></td>
              <td><integro:amount param="all" amount="<%=parameters.getDealAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.notinal"/></td>
              <td><integro:amount param="all" amount="<%=parameters.getNotionalAmount()%>" decimal="4"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.haircut"/></td>
              <td><integro:empty-if-null value="<%=String.valueOf(parameters.getHaircut())%>"/>&nbsp;%</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.deal.rate"/></td>
              <td><integro:empty-if-null value="<%=parameters.getDealRate()%>"/>&nbsp;%</td>
            </tr>
			
            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.repoStartAmt"/></td>
              <%									  
				if( parameters.getRepoStartAmt() != null ) {
					Amount repoStartAmt = new Amount( parameters.getRepoStartAmt(),
													  parameters.getDealAmount().getCurrencyCodeAsObject() );				
				
			  %>
				<td><integro:amount param="amount" amount="<%=repoStartAmt%>" decimal="4"/>&nbsp;</td>
              <% } else {  %>
				<td>-&nbsp;</td>
			  <% }  %>
              <td class="fieldname"><bean:message key="label.gmra.deal.repoEndAmt"/></td>
              <%
				if( parameters.getRepoEndAmt() != null ) {			
					Amount repoEndAmt = new Amount( parameters.getRepoEndAmt(),
													  parameters.getDealAmount().getCurrencyCodeAsObject() );								
			  %>
				<td><integro:amount param="amount" amount="<%=repoEndAmt%>" decimal="4"/>&nbsp;</td>	  
              <% } else {  %>
				<td>-&nbsp;</td>
			  <% }  %>
            </tr>
			
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.tenor.start.date"/></td>
              <td><integro:date object="<%=parameters.getTradeDate()%>"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.maturity.date"/></td>
              <td><integro:date object="<%=parameters.getMaturityDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.country"/></td>
              <td>
                <%String dealCountry = null;
                  if(! ( parameters.getDealCountry() == null || parameters.getDealCountry() == "" ) ){
                    dealCountry = CountryList.getInstance().getCountryName(parameters.getDealCountry());
                  }%>
                <integro:empty-if-null value="<%=dealCountry%>"/>&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.gmra.deal.mbb.branch"/></td>
              <td>
                <%String dealBranch = null;
                  if(! (parameters.getDealCountry() == null || parameters.getDealCountry() == "") ){
                    hm = CommonDataSingleton.getCodeCategoryValueLabelMap("40",null,parameters.getDealCountry());
                    if(! (parameters.getDealBranch() == null || parameters.getDealBranch() == "") ){
                      dealBranch = (String) hm.get(parameters.getDealBranch());
                    }
                  }
                %>
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
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <%if("to_track".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_close_dealdetails".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if("delete_gmra_dealdetails".equals(event) || "maker_delete_dealdetails_reject".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:deletePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="<%=isRejected?"ToDo.do": "javascript:goPreparePage()"%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
