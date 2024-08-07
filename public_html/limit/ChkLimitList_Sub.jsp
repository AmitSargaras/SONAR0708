<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Collection,
                 java.util.Vector,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.cms.app.limit.bus.OBLimitCollateralSearchResult"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
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

              <td valign="top" width="5%"> <a href="ViewLimits.do?event=resubmit&trxID=20030715000302" >View
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
              <td width="9%"><bean:message key="label.customer.id"/><br/>
                <bean:message key="label.customer.subprofile.id"/></td>
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



              <td valign="top"><a href="ViewLimits.do?event=resubmit_coborrower&limitID=20030710000038">View</td>
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
