<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.cms.ui.limit.ViewLimitsForm,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.*,
                 com.integrosys.cms.app.limit.bus.ILimitSysXRef,
                 com.integrosys.cms.app.customer.bus.OBCustomerSysXRef,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.common.bus.IBookingLocation,
                 com.integrosys.cms.app.limit.proxy.ILimitProxy,
                 com.integrosys.cms.app.limit.proxy.LimitProxyFactory"%>
 <%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/limit/ChkLimitReSub.jsp,v 1.49 2006/10/27 08:46:32 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.49 $
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
    ViewLimitsForm aForm = (ViewLimitsForm) request.getAttribute("ViewLimitsForm");

      ILimitSysXRef[] sysXRef = (ILimitSysXRef[])request.getAttribute("sysXRef");
             if(sysXRef!=null)
            pageContext.setAttribute("sysXRef",sysXRef);
           int sno=0;
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


function gotopage(limitID){
	 parent.document.location = "ViewLimits.do?event=edit&limitID="+limitID;
}

function coverageWarning()
{
    isCleanLimit = '<%= aForm.isClean() %>';
    if (isCleanLimit == 'true') {
        return true;
    }
    var newCoverage = document.getElementById('requiredSecurityCoverage').value;
    if (newCoverage == null || newCoverage.length == 0 || newCoverage == 0) {
        if (!confirm ("Note: Required Security Coverage is '0'/blank.")) {
            document.getElementById('requiredSecurityCoverage').select();
            document.getElementById('requiredSecurityCoverage').focus();
            return false;
        }
    }
    return true;
}

function submitPage(trxID) {
    if (coverageWarning()) {
        document.forms[0].action="ViewLimits.do?event=submit&trxID="+trxID;
        document.forms[0].submit();
    }
}
function cancel(){
     document.forms[0].action="ToDo.do?";
    document.forms[0].submit();
}


</script>
<!-- InstanceEndEditable -->
</head>


<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="ViewLimits.do?event=view">
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <%
    try{
    ILimitTrxValue iLimitTrxVal = (ILimitTrxValue)session.getAttribute("com.integrosys.cms.ui.limit.ViewLimitsAction.trxValue");
    ILimit limit = iLimitTrxVal.getStagingLimit();
    Amount actAmtLimit = limit.getActivatedLimitAmount();
    Amount appAmtLimit = limit.getApprovedLimitAmount();
    Amount operationalLimit = aForm.getOperationalLimit();
                String operationalCode ="-";
                if(operationalLimit!=null)
                {
                     operationalCode = operationalLimit.getCurrencyCode();
                }

    String appAmtcode = appAmtLimit.getCurrencyCode();
    String secCov="";
    if(aForm.getRequiredSecurityCoverage()!=null)
        secCov = aForm.getRequiredSecurityCoverage();
    String outerlimitreference = "-";
     if(limit.getOuterLimitRef()!=null && (!limit.getOuterLimitRef().equals("")))
       {
         if(limit.getOuterLimitRef().equals("0"))
            outerlimitreference = "-";
         else
            outerlimitreference = limit.getOuterLimitRef();
     }
    String trxID =(String) request.getAttribute("trxID");
    String sysName ="-";
          %>

      <td width="90%"><h3>Limit Details</h3></td>

    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>

            <tr>
              <td class="fieldname">Limit ID</td>
              <td class="odd"><integro:empty-if-null value="<%=limit.getLimitRef()%>"/>&nbsp;</td>
               <input type="hidden" name="userID" value ="<%=limit.getLimitID()%>">
              <td class="fieldname">Outer Limit ID</td>
              <td class="odd"><%=outerlimitreference%></td>
            </tr>
            <tr>
              <td class="fieldname">Limit Booking Location</td>
              <%if(limit.getBookingLocation().getOrganisationCode()!=null){
				String limitOrgCode = limit.getBookingLocation().getOrganisationCode();
				%>
              <td class="even"><%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,limitOrgCode)+ " ("+limitOrgCode+")"%>&nbsp;</td>
              <%}else{%>
              <td class="even">-</td>
              <%}%>
              <td class="fieldname">Product Description</td>
              <% String prodDesc= "-";
                if(limit.getProductDesc()!=null)
                     {
                         if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, limit.getProductDesc().toString())!=null)
                        prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, limit.getProductDesc().toString());
                     }
                 %>
              <td class="even"><%=prodDesc%></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Limit Type</td>
              <td><%=limit.getLimitType()%></td>
              <td class="fieldname">Limit Amount</td>
              <td><%=appAmtcode%>&nbsp;<integro:currency amount="<%=appAmtLimit%>" param="amount" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Activated Limit</td>
              <td>
              <bean:write property="currencyCode" name="ViewLimitsForm" scope="request" />
             <input name="currencyCode" value="<%=actAmtLimit.getCurrencyCode()%>" type="hidden"/>
              &nbsp;<html:text  property="amount"  value="<%=aForm.getAmount()%>" size="20" /><html:errors property="amt1" /><html:errors property="amt" /></td>
              <td class="fieldname">Limit Security</td>
              <td><%=limit.getLimitSecuredType()%></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Limit Status</td>
              <td><integro:empty-if-null value="<%=limit.getLimitStatus()%>"/>&nbsp;</td>
              <td class="fieldname">Expiry Date</td>
              <td><integro:date object="<%=limit.getLimitExpiryDate()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Limit Tenor</td>
              <td><%=limit.getLimitTenor()%>&nbsp;<integro:empty-if-null value="<%=limit.getLimitTenorUnit()%>"/></td>
               <td class="fieldname">Limit Advised</td>
              <td><integro:boolean-display style="yn" value="<%=aForm.isLimitAdviseInd()%>"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Limit Committed</td>
              <td><integro:boolean-display style="yn" value="<%=aForm.isLimitCommittedInd()%>"/>&nbsp;</td>
              <td class="fieldname">Shared Limits Indicator</td>
              <td><integro:boolean-display style="yn" value="<%=aForm.isSharedLimitInd()%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Required Security Coverage (%)</td>
              <td>
                <% if (aForm.isClean()) { %>
                 100 <%--integro:empty-if-null value="<%=aForm.getRequiredSecurityCoverage()%>"/--%>&nbsp;
                <% } else { %>
                 <html:text  property="requiredSecurityCoverage" readonly="<%= aForm.isClean() %>" value="<%=secCov%>" maxlength="3" size="20" readOnly="true" /><html:errors property="secCov" /> <html:errors property="secCov1" />
                <% } %>
               </td>
               <input type="hidden" name="requiredSecurityCoverage"  value="<%=aForm.getRequiredSecurityCoverage()%>">
               <td class="fieldname">Actual Security Coverage (%)</td>
              <td><bean:write scope="request" property="actualSecurityCoverage" name="ViewLimitsForm"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Balance of Security Value</td>
              <td>
                <%if(aForm.getBalanceSecurityValue()!=null)
              {
                  if(aForm.getBalanceSecurityValue().equals("-")|| aForm.getBalanceSecurityValue().equals("Forex Error")){%>
                  <bean:write scope="request" property="balanceSecurityValue" name="ViewLimitsForm"/>&nbsp;
                  <% }else {
                      if(aForm.getCurrencyCode()!=null){
                      Amount balanceOfSecurityValue = new Amount(Double.parseDouble(aForm.getBalanceSecurityValue()),aForm.getCurrencyCode1());%>
                  <integro:currency amount="<%=balanceOfSecurityValue%>" />
                          <%}}%>
              <%}%>
              </td>
              <td class="fieldname">External System</td>
              <td><bean:write scope="request" property="externalSys" name="ViewLimitsForm"/>&nbsp;</td>
              </tr>
              <tr class="even">
              <td class="fieldname">Operational Limit</td>
              <td><integro:empty-if-null value="<%=operationalCode%>"/>&nbsp;&nbsp;
              <%if((operationalCode!=null) && !(operationalCode.equals("")) ){%><integro:currency amount="<%=operationalLimit%>" param="amount" /><%} else {%>
              -<%}%></td>
               <td class="fieldname">&nbsp;</td>
               <td>&nbsp;</td>
            </tr>

          </tbody>
        </table></td>
    </tr>
     <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
          <tr>
            <td width="3%">S/N</td>
            <td width="15%">System X-Reference</td>
            <td width="30%">System Name</td>
            <td width="20%">System X-Ref Country</td>
            <td width="30%">System X-Ref Organization</td>
          </tr>
        </thead>
        <tbody>
            <%
            ILimitProxy limitProxy = LimitProxyFactory.getProxy();
         int sysXrefInd=0;
        %>
        <logic:present name="sysXRef"  >
               <logic:iterate id="subObj" name="sysXRef"  type="com.integrosys.cms.app.limit.bus.OBLimitSysXRef" >

             <%
                if (subObj.getStatus() != null && subObj.getStatus().equals (ICMSConstant.STATE_DELETED)) {
                    continue;
                  }
                  sysXrefInd=1;
                  String rowClass="";
                  sno++;
      				                                     if(sno%2!=0){
          				                                    rowClass="even";
      				                                     }else{
          				                                    rowClass="odd";
      				                                     }
                 if(subObj.getCustomerSysXRef().getExternalSystemCode()!=null)
                           sysName=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.SYSTEM_CODE, subObj.getCustomerSysXRef().getExternalSystemCode().toString() );
              if(subObj.getCustomerSysXRef().getExternalSystemCode()!=null)
                       sysName=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.SYSTEM_CODE, subObj.getCustomerSysXRef().getExternalSystemCode().toString() );
                  String org="-";
                  String country ="-";
                  IBookingLocation ibookloc =null;
                  if(subObj.getCustomerSysXRef().getBookingLocation()!=null)
                    ibookloc = limitProxy.getBookingLocation(Long.parseLong(subObj.getCustomerSysXRef().getBookingLocation()));
                   if(ibookloc!=null)
                  {
                     country =CountryList.getInstance().getCountryName(ibookloc.getCountryCode());
                    List orgCodeLblsAll = (List)CommonDataSingleton.getCodeCategoryLabels(ICMSConstant.ORG_CODE);
                    List orgCodeValsAll = (List)CommonDataSingleton.getCodeCategoryValues(ICMSConstant.ORG_CODE);
                    String organisation =  ibookloc.getOrganisationCode();
                    for( int k=0; k<orgCodeLblsAll.size(); k++){
                        if((organisation!=null) && (organisation.equals(orgCodeValsAll.get(k)))){  //if this value not in selected value print..
                          org= (String) orgCodeLblsAll.get(k);

              %>
            <%}}
                  }%>
            <tr class="<%=rowClass%>">
            <td class="index"><%=sno%></td>
            <td><%=subObj.getCustomerSysXRef().getExternalCustomerID()%></td>
            <td><%=sysName%>&nbsp;</td>
           <td><integro:empty-if-null value="<%=country%>"/>&nbsp;</td>
            <td><integro:empty-if-null value="<%=org%>"/>&nbsp;</td>
            </tr>
            </logic:iterate>
         <%if (sysXrefInd==0) {     %>
                <tr class="odd">
              <td colspan="5"><bean:message key="label.global.not.found"/></td>
            </tr>
          <%  }   %>
            </logic:present>
            <logic:notPresent name="sysXRef"  >
            <tr class="odd">
              <td colspan="5"><bean:message key="label.global.not.found"/></td>
            </tr>
       </logic:notPresent>
      </tbody>

      </table></td>
    </tr>
     <tr>
      <td>&nbsp;</td>
    </tr>

  </thead>
  <tbody>
  </tbody>
</table>
<table  width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
          <tr class="even">
                  <td class="fieldname">Remarks</td>
                  <td><textarea name="remarks" cols="60" rows="3"></textarea></td>

            </tr>
        <tr class="odd">
                                  <td class="fieldname">Last Action By</td>
                                  <td class="odd"><%=iLimitTrxVal.getUserInfo()%>&nbsp;</td>

                                </tr>
                                <tr class="even">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><integro:wrapper value="<%=iLimitTrxVal.getRemarks()%>"/>&nbsp;</td>

                                </tr>
          </tbody>
          </table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>

                        <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage(<%=trxID%>);" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
                        <td><a href="javascript:cancel();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image5" width="70" height="20" border="0" id="Image5" /></a></td>

                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>
                     <html:hidden property="bookingLoc" />
            <html:hidden property="productDesc" />
            <html:hidden property="limitType" />
            <html:hidden property="outerLimitRef" />
            <html:hidden property="currencyCode" />
             <html:hidden property="currencyCode1" />
             <html:hidden property="amount1" />
            <html:hidden property="limitSecuredType" />
            <html:hidden property="limitStatus" />
            <html:hidden property="limitTenor" />
            <html:hidden property="limitTenorUnit" />
            <html:hidden property="limitAdviseInd" />
            <html:hidden property="limitCommittedInd" />
            <html:hidden property="sharedLimitInd" />
            <html:hidden property="sysXRef" />
            <html:hidden property="sysXRefCountry" />
            <html:hidden property="sysXRefOrg" />
            <html:hidden property="externalSys" />
             <html:hidden property="balanceSecurityValue" />
   <%}catch(Exception e){e.printStackTrace();}%>
<!-- InstanceEndEditable -->
</html:form>

</body>

<!-- InstanceEnd --></html>
