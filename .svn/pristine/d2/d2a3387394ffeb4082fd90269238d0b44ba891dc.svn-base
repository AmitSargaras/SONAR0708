<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
                 com.integrosys.base.businfra.transaction.ITrxResult,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 java.util.HashMap,
                 java.util.Collection,
                 java.util.Iterator,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ICommodityCollateral,
                 com.integrosys.cms.app.limit.bus.ILimit"%>
<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/ack_amount_conversion_err.jsp,v 1.3 2006/10/27 08:38:43 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.3 $
 * @since $Date: 2006/10/27 08:38:43 $
 * Tag: $Name:  $
 */
 -->




<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>

<%
		ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)request.getAttribute("request.ITrxValue");
        String originalFaceCcy = null;
        String limitCcy = null;
        ICommodityDeal dealObj = trxValue.getStagingCommodityDeal();
        if (dealObj.getOrigFaceValue() != null) {
            originalFaceCcy = dealObj.getOrigFaceValue().getCurrencyCode();
        }
        HashMap commodityLimitMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityLimitMap");

        Collection keySet = commodityLimitMap.keySet();
        Iterator itr = keySet.iterator();
        boolean foundCol = false;
        while (!foundCol && itr.hasNext()) {
            ICommodityCollateral tmpCol = (ICommodityCollateral)itr.next();
            if (tmpCol.getCollateralID() == dealObj.getCollateralID()) {
                Collection limitList = (Collection)commodityLimitMap.get(tmpCol);
                foundCol = true;
                if (limitList != null) {
                    boolean foundLimit = false;
                    Iterator itr1 = limitList.iterator();
                    while (!foundLimit && itr1.hasNext()) {
                        ILimit limit = (ILimit)itr1.next();
                        if (limit.getLimitID() == dealObj.getLimitID()) {
                            foundLimit = true;
                            if (limit.getApprovedLimitAmount() != null) {
                                limitCcy = limit.getApprovedLimitAmount().getCurrencyCode();
                            }
                        }
                    }
                }
            }
        }
%>
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="460" height="260" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd">
      <td style="text-align:center" valign="middle"><table width="400" height="200" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td class="even" style="text-align:center" valign="middle">
                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                  <tr class="even">
                      <td style="border:none;text-align:right;padding-right:5px" width="100"><strong><img src="img/warning3.gif" width="32" height="32" /></strong></td>
                      <td style="border:none" width="200"><strong><font size="2">Approval Failed</font></strong></td>
                    </tr>
                    <tr class="even">

                    <td colspan="2" style="border:none;text-align:center"><br />
                The transaction is not able to approve. <BR>
                There is not forex found for <B><%=originalFaceCcy%></b> and <b><%=limitCcy%></b> currency code.
                    </td>
                    </tr>
                </table> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
