<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 java.util.Vector,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.limit.trx.ICoBorrowerLimitTrxValue,
                 com.integrosys.cms.app.limit.trx.OBCoBorrowerLimitTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Collection,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.cms.ui.limit.LimitsForm,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.limit.proxy.ILimitProxy,
                 com.integrosys.cms.app.limit.proxy.LimitProxyFactory,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.limit.bus.ILimit"%>
 <%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/limit/edit_coborrower_detail.jsp,v 1.16 2006/10/27 08:46:32 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.16 $
     * @since $Date: 2006/10/27 08:46:32 $
     * Tag: $Name:  $
     */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%  
	LimitsForm aForm = (LimitsForm) request.getAttribute("LimitsForm");
   	System.out.println("Entered edit_coborrower_detail.jsp");

	ICoBorrowerLimitTrxValue iCoBorrowerLimitTrxVal = (ICoBorrowerLimitTrxValue)session.getAttribute(
			"com.integrosys.cms.ui.limit.LimitsAction.coBorrowerLimitTrxValue");
    
	String limitid = aForm.getLimitID();
    String outerLimitRef = aForm.getOuterLimitRef();
%>
<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation){
	window.location = aLocation ;
}

function submitPage(limitID) {
    document.forms[0].action="Limits.do?event=maker_update_coborrower_limit&limitID="+limitID;
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="Limits.do?event=cancel_coborrower";
    document.forms[0].submit();
}

function cancel(limitID){
     document.forms[0].action="Limits.do?event=view_co_borrower_limit_details&limitID="+limitID;
    document.forms[0].submit();
}



</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="Limits.do?event=edit_coborrower">
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="90%"><h3>Co-Borrower Limit Details</h3></td>
        </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
    </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname"><bean:message key="label.global.main.borrower"/> <bean:message key="label.customer.id"/></td>
              <td width="30%"><integro:empty-if-null value="<%=aForm.getLeID()%>"/>&nbsp;</td>
              <td width="20%" class="fieldname"><bean:message key="label.global.main.borrower"/> <bean:message key="label.security.aptmnt.le.name"/></td>
              <td width="30%"><integro:empty-if-null value="<%=aForm.getMainBorrowerName()%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.global.co.borrower"/> <bean:message key="label.customer.id"/></td>
              <td><bean:write scope="request" property="coLeID" name="LimitsForm"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.global.co.borrower"/> <bean:message key="label.global.name"/></td>
              <td><bean:write scope="request" property="coBorrowerName" name="LimitsForm"/>&nbsp;</td>
            </tr>
              <tr class="odd">
              <td class="fieldname"><bean:message key="label.global.co.borrower"/> <bean:message key="label.limit.id"/></td>
              <td><integro:empty-if-null value="<%=aForm.getLimitRef()%>"/>&nbsp;</td>
	          <td class="fieldname"><bean:message key="label.global.outer.limit.id"/></td>
	          <td><%=outerLimitRef%>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.product.desc"/></td>
              <td colspan="3"><integro:empty-if-null value="<%=aForm.getProductDesc()%>"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.global.limit"/> <bean:message key="label.global.booking.location"/></td>
              <td colspan="3"><%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getBookingLoc())+ " ("+aForm.getBookingLoc()+")"%>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Limit Amount</td>
              <td><bean:write scope="request" property="currencyCode" name="LimitsForm"/>&nbsp;
              	  <bean:write scope="request" property="approvedLimitAmt" name="LimitsForm"/></td>
              <td class="fieldname">Limit Status</td>
              <td><bean:write scope="request" property="limitStatus" name="LimitsForm"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Drawing Amount</td>
              <td><bean:write scope="request" property="currencyCode" name="LimitsForm"/>&nbsp;
              	<html:text property="drawingLimitAmt" size="20" />
              	<html:errors property="drawingLimitAmt" /><html:errors property="drawingLimitAmt" /></td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
               </tbody>
        </table></td>
    </tr>

  </tbody>
</table>
<table  width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr> </tr>
     <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr> <tr> </tr>
  </thead>
<tbody>
              <%   if (iCoBorrowerLimitTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED))
                            {
                      %>
             <tr class="even">
                  <td class="fieldname">Remarks</td>
                  <td><textarea name="remarks" cols="60" rows="3"></textarea></td>
             </tr>
        <tr class="odd">
             <td class="fieldname">Last Action By</td>
             <td class="odd"><%=iCoBorrowerLimitTrxVal.getUserInfo()%>&nbsp;</td>
        </tr>
        <tr class="even">
              <td class="fieldname">Last Remarks Made</td>
              <td><integro:wrapper value="<%=iCoBorrowerLimitTrxVal.getRemarks()%>"/>&nbsp;</td>
         </tr>
    <%}%>

          </tbody>
          </table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage(<%=limitid%>);" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
  <% if (iCoBorrowerLimitTrxVal.getStatus().equals(ICMSConstant.STATE_REJECTED)) { %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
    <% } else { %>


  <td><a href="javascript:cancel('<%=limitid%>');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image5" width="70" height="20" border="0" id="Image5" /></a></td>
     <% } %>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
