<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 java.util.Vector,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Collection,
                 java.util.Vector,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.cms.app.limit.bus.OBLimitCollateralSearchResult"%>










<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->

<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<form name="LimitsForm" method="POST" action="/cms/Limits.do?event=viewlimits">

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Limit List</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="9%">Limit ID</td>
              <td width="8%">Product Desc</td>
              <td width="10%">Limit Booking Location</td>
              <td width="9%">Outer Limit ID</td>
              <td width="12%">Approved Limit</td>
              <td width="12%">Activated Limit </td>
              <td width="9%">Security ID</td>
              <td width="14%" nowrap="nowrap">Security Type</td>
              <td width="10%">Security Location</td>
              <td width="5%">Action</td>
            </tr>
          </thead>
          <tbody>





             <tr class="odd">



              <td class="index" valign="top" width="3%" >1</td>
              <td valign="top" >20030715000034</td>
              <td valign="top" >4</td>
              <td valign="top" >3</td>
              <td valign="top" >2</td>
              <td valign="top" class="amount">LTL&nbsp;6.00</td>
              <td valign="top" class="amount">LTL&nbsp;100.00</td>
              <td >

              </td>
              <td >

              </td>
              <td>



              </td>

              <td valign="top" width="5%"> <a href="Tat.do?event=resubmit&trxID=20030715000301" >View
                </a></td>
            the value of limit id is 20030715000034
             <input type="hidden" name="limitID" value="20030715000034">


            </tr>



            <tr class="odd">
              <td class="total" valign="top" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%> 120,394,000</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%> 60,244,200</td>
              <td class="total" >&nbsp;</td>
              <td class="total" >&nbsp;</td>
              <td class="total" >&nbsp;</td>
              <td valign="top" class="total">&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Co-borrowers Limit List</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="3%">S/N</td>
              <td width="9%">Limit ID</td>
              <td width="8%">Product Desc</td>
              <td width="10%">Limit Booking Location</td>
              <td width="9%">Outer Limit ID</td>
              <td width="12%">Approved Limit</td>
              <td width="12%">Activated Limit </td>
              <td width="9%">LE ID<br/>
                Sub-Profile ID</td>
              <td width="24%">Legal Name<br/>
                Customer Name</td>
              <td width="5%">Action</td>
            </tr>
          </thead>
          <tbody>







             <tr class="odd">
              <td class="index" valign="top" >1</td>
              <td valign="top" >20030715000060</td>
              <td valign="top" >4</td>
              <td valign="top" >1</td>
              <td valign="top" class="amount">20030715000034</td>
              <td valign="top" class="amount">SGD&nbsp;2.00</td>
              <td valign="top" class="amount">SGD&nbsp;3.00</td>

                <td>  </td><td></td>



              <td valign="top">View</td>
            </tr>




             <tr class="even">
              <td class="index" valign="top" >2</td>
              <td valign="top" >20030715000061</td>
              <td valign="top" >4</td>
              <td valign="top" >11</td>
              <td valign="top" class="amount">20030715000034</td>
              <td valign="top" class="amount">SGD&nbsp;12.00</td>
              <td valign="top" class="amount">SGD&nbsp;12.00</td>

                <td>  </td><td></td>



              <td valign="top">View</td>
            </tr>




                  <tr class="odd">
              <td class="total" valign="top" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%> 120,394,000</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px"><%=CommonUtil.getBaseCurrency()%> 60,244,200</td>
              <td class="total" >&nbsp;</td>
              <td class="total" >&nbsp;</td>
              <td class="total" >&nbsp;</td>

            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  </tr>
</table>
</form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
