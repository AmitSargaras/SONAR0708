<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
                 com.integrosys.base.businfra.transaction.ITrxResult,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 java.util.HashMap,
                 java.util.Collection,
                 java.util.Iterator,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ICommodityCollateral,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!--
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/ack_close_deal_err.jsp,v 1.5 2006/10/27 08:38:43 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.5 $
 * @since $Date: 2006/10/27 08:38:43 $
 * Tag: $Name:  $
 */
 -->

<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage() {
     document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST%>";
     document.forms[0].submit();
}

//-->
</script>



<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="CommodityDeal.do">
<input type="hidden" name="event"/>

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
                      <td style="border:none;text-align:right;padding-right:8px" width="100"><strong><img src="img/noentry.gif" width="50" height="50" /></strong></strong></td>
                      <td style="border:none" width="200"><strong><font size="2">Close deal is not allowed.</font></strong></td>
                    </tr>
                    <tr class="even">
                    <td colspan="2" style="border:none;text-align:center"><br />
                    Total cash deposit amount, settlement amount outstanding or release quantity outstanding is not zero.
                    </td>
                    </tr>
                </table> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="142" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="76">&nbsp;</td>
    <td width="66">&nbsp;</td>
  </tr>
  <tr>
    <td width="76"><a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image511','','img/return2.gif',1)"><img src="img/return1.gif" name="Image511" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td style="text-align:center" width="76">&nbsp;</td>
    <td style="text-align:center" width="66">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
