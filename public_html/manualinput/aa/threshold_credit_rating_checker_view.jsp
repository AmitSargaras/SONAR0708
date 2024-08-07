<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.*,
                 com.integrosys.cms.app.limit.bus.*,
                 com.integrosys.cms.app.limit.trx.*,
                 com.integrosys.cms.ui.manualinput.aa.*,
                 com.integrosys.cms.ui.manualinput.aa.RatingList,
                 com.integrosys.cms.ui.manualinput.aa.RatingTypeList"%>
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
* Purpose: For Maker and Chacker to view the list of threshold rating detail
* Description: view the list of threshold rating detail by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String event = request.getParameter("event");
    String trxId = request.getParameter("TrxId");

    OBLimitProfileTrxValue obTrxValue = null;
    Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.limitProfileTrxVal");
    com.integrosys.cms.ui.manualinput.aa.ThresholdRatingForm aForm = (com.integrosys.cms.ui.manualinput.aa.ThresholdRatingForm) request.getAttribute("ThresholdRatingForm");
    ILimitProfile  parametersLimitProfile = null ;
    ILimitProfile  stagingParametersLimitProfile = null ;
    ITradingAgreement tradingAgreement = null;
    ITradingAgreement stagingTradingAgreement = null;
    IThresholdRating[] thresholdRating = null;
    IThresholdRating[] stagingThresholdRating = null;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.limitProfileTrxVal");
        obTrxValue = (OBLimitProfileTrxValue)obj;

        parametersLimitProfile = obTrxValue.getLimitProfile();

        stagingParametersLimitProfile = obTrxValue.getStagingLimitProfile();

        if(parametersLimitProfile != null){
          tradingAgreement = parametersLimitProfile.getTradingAgreement();
        }

        if(stagingParametersLimitProfile != null){
          stagingTradingAgreement = stagingParametersLimitProfile.getTradingAgreement();
        }
        int i = 0;
        int j = 0;

        if(tradingAgreement != null){
          List list1 = tradingAgreement.getThresholdRatingList();
          if ( list1 != null ) {
            thresholdRating = new OBThresholdRating[list1.size()];
            Iterator iter = list1.iterator();
            while (iter.hasNext()) {
              thresholdRating[i] = (IThresholdRating) iter.next();
              i++;
            }
          }
        }

        if(stagingTradingAgreement != null){
          List list2 = stagingTradingAgreement.getThresholdRatingList();
          if ( list2 != null ) {
            stagingThresholdRating = new OBThresholdRating[list2.size()];
            Iterator iter = list2.iterator();
            while (iter.hasNext()) {
              stagingThresholdRating[j] = (IThresholdRating) iter.next();
              j++;
            }
          }
        }

   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'limitProfileTrxVal' ");
   }

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
function goPreviousPage() {
    document.forms[0].action = "TradingAgreement.do?event=checker_view_agreement&preEvent=checker_edit_aadetail&indexChange=0&TrxId=<%=trxId%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ThresholdRating.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.agreement.counterparty.title"/></h3></td>
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
      <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="10%"><bean:message key="label.agreement.counterparty.sn"/></td>
              <td width="30%"><bean:message key="label.agreement.counterparty.type"/></td>
              <td width="20%"><bean:message key="label.agreement.counterparty.threshold.rating"/></td>
              <td width="20%"><bean:message key="label.agreement.counterparty.threshold"/></td>
            </tr>
          </thead>
          <tbody>
            <%
               String classtype = "odd";

               List res = null;
               ArrayList list = null;
               res = CompareOBUtil.compOBArray(stagingThresholdRating,thresholdRating);
               list = new ArrayList(res);
               pageContext.setAttribute("thresholdRating",list);

               if (list == null || list.size() == 0) {%>
              <tr class="odd">
                <td colspan="5">There is no Threshold Credit Rating information.</td>
              </tr>
            <% }else{ int counter = 0; %>
              <logic:present name="thresholdRating" >
                <logic:iterate id="compResult" name="thresholdRating" type="com.integrosys.base.techinfra.diff.CompareResult"  >
                  <%IThresholdRating thresholdRatingParameter = (IThresholdRating) compResult.getObj();
                    classtype = "odd";
                  %>
              <tr class="<%=classtype%>">
                <td class="<bean:write name="compResult" property="key" />"><%=counter+1%></td>
                <td>
                <%String ratingType = null;
                  if(! (thresholdRatingParameter.getRatingType().equals(null) || thresholdRatingParameter.getRatingType().equals("")) ){
                    ratingType = RatingTypeList.getInstance().getRatingTypeName(thresholdRatingParameter.getRatingType());
                  }%>
                  <integro:empty-if-null value="<%=ratingType%>"/>&nbsp;</td>
                <td>
                <%String rating = null;
                  if(! (thresholdRatingParameter.getRating().equals(null) || thresholdRatingParameter.getRating().equals("")) ){
                    rating = RatingList.getInstance(thresholdRatingParameter.getRatingType()).getRatingName(thresholdRatingParameter.getRating());
                  }%>
                  <integro:empty-if-null value="<%=rating%>"/>&nbsp;
                </td>
                <%String thresholdAmt = thresholdRatingParameter.getThresholdAmount().getCurrencyCode() + " " + thresholdRatingParameter.getThresholdAmount().getAmountAsBigDecimal().toString();%>
                <td><integro:amount param="all" amount="<%=thresholdRatingParameter.getThresholdAmount()%>" decimal="4"/>&nbsp;</td>
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
            <% }%>
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
    <td width="100%" valign="baseline" align="center"> <a href="javascript:goPreviousPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
