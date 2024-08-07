<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 java.util.Vector,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.limit.trx.ICoBorrowerLimitTrxValue,
                 com.integrosys.cms.app.limit.trx.OBCoBorrowerLimitTrxValue,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.cms.ui.limit.LimitsForm,
                 com.integrosys.cms.app.limit.bus.*,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.Collection,
                 java.util.Vector,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.limit.proxy.ILimitProxy,
                 com.integrosys.cms.app.limit.proxy.LimitProxyFactory,
                 com.integrosys.component.user.app.bus.ICommonUser"%>
 <%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/limit/chk_coborrower_approve_reject.jsp,v 1.14 2006/10/27 08:46:32 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.14 $
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
	ICommonUser user = (ICommonUser)session.getAttribute(
			ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
			
	String baseCurrencyCode = CommonUtil.getBaseCurrency(user);

    LimitsForm aForm = (LimitsForm)request.getAttribute("LimitsForm");

    String limitId = aForm.getLimitID();
    
    String outerLimitRef = aForm.getOuterLimitRef();
    ICoBorrowerLimitTrxValue iCoBorrowerLimitTrxVal = (ICoBorrowerLimitTrxValue)session.getAttribute(
    		"com.integrosys.cms.ui.limit.LimitsAction.coBorrowerLimitTrxValue");
    		
    ICoBorrowerLimit stagingLimit = iCoBorrowerLimitTrxVal.getStagingLimit();
    ICoBorrowerLimit actualLimit = iCoBorrowerLimitTrxVal.getLimit();
    
    Amount stageActivatedLimit = stagingLimit.getActivatedLimitAmount();
    String stageActivatedLimitCurrencyCode = (stageActivatedLimit == null) ? baseCurrencyCode : stageActivatedLimit.getCurrencyCode();
    Amount actualActivatedLimit = actualLimit.getActivatedLimitAmount();
    String actualActivatedLimitCurrencyCode = (actualActivatedLimit == null) ? baseCurrencyCode : actualActivatedLimit.getCurrencyCode();
    
    String stageActivatedLimitAmount = CurrencyManager.convertToDisplayString(request.getLocale(),stageActivatedLimit);
    
    String actualActivatedLimitAmount = "-";
    if (actualActivatedLimit != null) {
	    actualActivatedLimitAmount = CurrencyManager.convertToDisplayString(request.getLocale(),actualActivatedLimit);
	}

    ILimit mainBorrowerLimit = null;
    String prodDesc = "-";
    ILimitProxy limitproxy = LimitProxyFactory.getProxy();
    if(aForm.getOuterLimitID() != null) {
        mainBorrowerLimit = limitproxy.getLimit(Long.parseLong(aForm.getOuterLimitID()));
        if (mainBorrowerLimit.getProductDesc() != null) {
			prodDesc =mainBorrowerLimit.getProductDesc();
        }
    }

    if (prodDesc != null) {
		if (CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc) != null) {
        	prodDesc = CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc);
        }
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

function approvePage() {
    document.forms[0].action="Limits.do?event=checker_approve_update_co_borrower_limits";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="Limits.do?event=checker_reject_update_co_borrower_limits";
    document.forms[0].submit();
}
function cancel(){
     document.forms[0].action="ToDo.do?";
    document.forms[0].submit();
}



</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="ViewLimits.do?event=view_coborrower">
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
                 <input type="hidden" name="limitID" value="<%=limitId%>">
            </tr>
            <tr class="even">
              <td class="fieldname">Product Description</td>
              <td colspan="3"><integro:empty-if-null value="<%=aForm.getProductDesc()%>"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Limit Booking Location</td>
              <td colspan="3">
              	<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getBookingLoc())+ " ("+aForm.getBookingLoc()+")"%>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Limit Amount</td>
              <td><integro:currency amount="<%=stagingLimit.getApprovedLimitAmount()%>"/>&nbsp;</td>
              <td class="fieldname">Limit Status</td>	
              <td><bean:write scope="request" property="limitStatus" name="LimitsForm" /></td>
            </tr>
            <tr class="odd">
               <%    
               		boolean actamtind =
                    ((actualActivatedLimitAmount.equals(stageActivatedLimitAmount))
                    		&&(actualActivatedLimitCurrencyCode.equals(stageActivatedLimitCurrencyCode)));

                    System.out.println("indicator is "+actamtind);
                %>
              <td class="<%=(actamtind)?"fieldname":"fieldnamediff"%>">Drawing Amount</td>
              <td><integro:currency amount="<%=stageActivatedLimit%>" />&nbsp;</td>
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
          </tbody>
          </table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:approvePage();"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                        <td width="100" valign="baseline" align="center"> <a href="javascript:cancel();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
