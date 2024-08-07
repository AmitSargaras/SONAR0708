<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.*,
                 com.integrosys.cms.ui.limit.LimitsForm,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.limit.LimitFSVBalanceHelper,
                 com.integrosys.cms.ui.limit.LimitsAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.bus.IBookingLocation,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ILimitSysXRef,
                 com.integrosys.cms.app.customer.bus.ICustomerSysXRef,
                 com.integrosys.cms.app.limit.proxy.ILimitProxy,
                 com.integrosys.cms.app.limit.proxy.LimitProxyFactory,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.manualinput.limit.MILimitUIHelper"%>
                 <%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/limit/EditLimitDetails.jsp,v 1.50 2006/10/27 08:46:32 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.50 $
     * @since $Date: 2006/10/27 08:46:32 $
     * Tag: $Name:  $
     */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

    <% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); 
     LimitsForm aForm = (LimitsForm) request.getAttribute("LimitsForm");
         
          String from_page = (String)request.getParameter("from_page");
          if (from_page == null || from_page.length() == 0) {
          	from_page = (String)request.getParameter("event");
          }
          
          List balanList = new LimitFSVBalanceHelper().getFSVBalForMainborrowLimit(request.getParameter("limitID"));
          String balan = "-";
          if  (balanList != null)
          {
             try
             {
                 double d = ((Double)(balanList.get(0))).doubleValue();
                 String s = (String)(balanList.get(1));
                 balan = s + " " + CurrencyManager.convertToDisplayString(java.util.Locale.US, new Amount(d, s));
             }
             catch(Exception ex)
             {}  
          }   
          ILimitTrxValue trxValue = (ILimitTrxValue)session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.service.limitTrxValue");      
          ILimit limit = trxValue.getStagingLimit();     
          ILimitSysXRef[] sysXRef = limit.getLimitSysXRefs();
          if(sysXRef!=null) {
            pageContext.setAttribute("sysXRef",sysXRef);
          }

        MILimitUIHelper helper = new MILimitUIHelper();
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
<!--
function coverageWarning()
{
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
function submitPage(num, indexID) {
	if (num == 2) {
    	document.forms[0].event.value = "<%=LimitsAction.EVENT_PREPARE_UPDATE_ACCOUNT%>";
    	document.forms[0].indexID.value = indexID;
    } else if (num == 3) {
    	document.forms[0].event.value = "<%=LimitsAction.EVENT_PREPARE_ADD_ACCOUNT%>";
    	document.forms[0].indexID.value = indexID;
    } else if (num == 4) {
    	document.forms[0].event.value = "<%=LimitsAction.EVENT_DELETE_ITEM%>";
    }
    
    document.forms[0].submit();
}

function cancel(){
    document.forms[0].action="Limits.do?event=view_limit_details&limitID=<%=limit.getLimitID()%>";
    document.forms[0].submit();
}

-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="Limits.do">
<input type="hidden" name="event" value="<%=LimitsAction.EVENT_SUBMIT%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="from_page" value="<%=from_page%>"/>
<html:hidden property="limitID"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3>Edit Limit Details</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
      <%
      	int rowIdx = 0;
      %>
          <tbody>
              <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname" width="20%"><bean:message key="label.limit.source.limit.id"/></td>
              <td  width="30%"><integro:empty-if-null value="<%=aForm.getLimitRef()%>"/>&nbsp;</td>
              <td class="fieldname" width="20%"><bean:message key="label.limit.source.outer.limit.id"/></td>
              <td width="30%"><integro:empty-if-null value="<%=aForm.getOuterLimitRef()%>"/>&nbsp;</td>
            </tr>
             <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.booking.location"/></td>
              <td><%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getBookingLoc())+ " ("+aForm.getBookingLoc()+")"%>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.limit.facility.description"/></td>
              <td><bean:write scope="request" property="facilityDesc" name="LimitsForm"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.tenor"/></td>
              <td>
                  <%
                  if(aForm.getLimitTenor()==null){
                      %>-<%
                  } else {
                      %><integro:empty-if-null value="<%=aForm.getLimitTenor()%>"/>&nbsp;
                      <integro:empty-if-null value="<%=aForm.getLmtTenorBasisDesc()%>"/><%
                  }
                  %>
              </td>
              <td class="fieldname"><bean:message key="label.limit.status"/></td>
              <td><integro:empty-if-null value="<%=aForm.getLimitStatus()%>"/>&nbsp;</td>            
            </tr>
									
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <!-- <td class="fieldname"><bean:message key="label.limit.type"/></td>  -->
              <!-- <td><bean:write scope="request" property="limitType" name="LimitsForm"/>&nbsp;</td>  -->
              <td class="fieldname"><bean:message key="label.limit.expiry.date"/></td>
              <td><bean:write property="expiryDate" name="LimitsForm" scope="request"/>&nbsp;</td>   
			  <td class="fieldname"><bean:message key="label.limit.approved.limit"/></td>
              <td><bean:write property="approvedLimitAmt" name="LimitsForm" scope="request" /></td>
            </tr>
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
                       
              <td class="fieldname"><bean:message key="label.limit.drawing.limit"/></td>
              <td><bean:write property="drawingLimitAmt" name="LimitsForm" scope="request" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.limit.outstanding.balance"/></td>
              <td><bean:write scope="request" property="outstandingBalance" name="LimitsForm"/>&nbsp;</td>        
            </tr>
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
                        
              <td class="fieldname"><bean:message key="label.limit.balances.updated.as.at"/></td>
              <td><bean:write scope="request" property="lastUpdatedDate" name="LimitsForm"/>&nbsp;</td>
			  <td class="fieldname"><bean:message key="label.limit.required.security.coverage"/></td>
              <td>
				
              	<html:text property="requiredSecurityCoverage" maxlength="6" />&nbsp;
              	<html:errors property="requiredSecurityCoverage"/>
              </td>
              
            </tr>            
            <!--<tr class="<%=rowIdx++%2==0?"even":"odd"%>">-->
            <!--  <td class="fieldname"><bean:message key="label.limit.status"/></td>-->
            <!--  <td><integro:empty-if-null value="<%=aForm.getLimitStatus()%>"/>&nbsp;</td>-->
            <!--  <td class="fieldname">&nbsp;</td>-->
            <!--  <td>&nbsp;</td>-->
            <!--</tr>-->
          
            <!--<tr class="<%=rowIdx++%2==0?"even":"odd"%>">-->
            <!--  <td class="fieldname"><bean:message key="label.limit.actual.security.coverage"/></td>-->
            <!--  <td><bean:write scope="request" property="actualSecurityCoverage" name="LimitsForm"/>&nbsp;</td>-->
            <!-- </tr>-->
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.amt"/></td>
              <td><bean:write scope="request" property="actualSecCoverageAmt" name="LimitsForm"/>&nbsp;</td>            
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage"/></td>
              <td><bean:write scope="request" property="actualSecCoveragePercent" name="LimitsForm"/>&nbsp;</td>
            </tr>       
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.omv.amt"/></td>
              <td><bean:write scope="request" property="actualSecCoverageOMVAmt" name="LimitsForm"/>&nbsp;</td>            
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.omv"/></td>
              <td><bean:write scope="request" property="actualSecCoverageOMVPercent" name="LimitsForm"/>&nbsp;</td>
            </tr>   
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.fsv.amt"/></td>
              <td><bean:write scope="request" property="actualSecCoverageFSVAmt" name="LimitsForm"/>&nbsp;</td>            
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.fsv"/></td>
              <td><bean:write scope="request" property="actualSecCoverageFSVPercent" name="LimitsForm"/>&nbsp;</td>
            </tr>   
			
                       
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">  
              <td class="fieldname"><bean:message key="label.limit.document.status"/></td>
              <td><bean:write scope="request" property="documentStatus" name="LimitsForm"/>&nbsp;</td>          
              <td class="fieldname"><bean:message key="label.limit.advised"/></td>
              <td><integro:yesno-display value="<%=aForm.isLimitAdviseInd()%>"/>&nbsp;</td>
            </tr>            
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              
              <td class="fieldname"><bean:message key="label.limit.operational.limit"/></td>
              <td><bean:write property="operationalLimit" name="LimitsForm" scope="request" />&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>

 <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
</table>
<%
	boolean maintainAccount = PropertyManager.getBoolean(ICMSConstant.ALLOW_MAINTAIN_ACCOUNT, true);
%>
<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	<tr>
	<td colspan="2" align="right" valign="baseline">
		<% if (maintainAccount) { %>
	    <input class="btnNormal" type="button" name="Submit2222" value="Add New" onclick="javascript:submitPage(3, -1)"/>
	    &nbsp; 
	    <input name="Submit2" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(4, 0)"/>
	    <% } %>
    </td>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
          <tr>
            <td width="5%"><bean:message key="label.global.sn"/></td>            
            <%-- 
            <td width="15%"><bean:message key="label.limit.account.host.country"/></td>
            <td width="15%"><bean:message key="label.limit.account.host.name"/></td>
            --%>
            <td width="15%"><bean:message key="label.limit.account.no"/></td>
            <td width="15%"><bean:message key="label.limit.account.classification"/></td>
            <td width="15%"><bean:message key="label.limit.account.last.allocation.date"/></td>
            <td width="15%"><bean:message key="label.limit.account.collateral.allocated"/></td>
            <td width="15%"><bean:message key="label.limit.account.outstanding"/></td>            
	    	<td width="15%"><bean:message key="label.limit.account.rv"/></td>	
	    	<% if (maintainAccount) { %>
            <td width="10%"><bean:message key="label.global.action"/></td>            
            <td width="10%"><bean:message key="label.global.delete"/></td>
            <% } %>
          </tr>
        </thead>
        <tbody>
        <%
            int sysXrefInd=0;
            int sno=0;
  		  Amount totalAllocatedCol = new Amount(0, CommonUtil.getBaseCurrency());
		  Amount totalOutstandingAmt = new Amount(0, CommonUtil.getBaseCurrency());                    
        %>
        <logic:present name="sysXRef"  >
               <logic:iterate id="subObj" name="sysXRef"  type="com.integrosys.cms.app.limit.bus.OBLimitSysXRef" >

             <%
/*             
                 if (subObj.getStatus() != null && subObj.getStatus().equals (ICMSConstant.STATE_DELETED)) {
                    continue;
                 }
*/                 
                 sysXrefInd=1;
                 ICustomerSysXRef account = subObj.getCustomerSysXRef();
				  if (account != null) {
					  if (account.getCollateralAllocatedAmt() != null && 
							  account.getCollateralAllocatedAmt().getCurrencyCode() != null) {
					  	totalAllocatedCol.addToThis(account.getCollateralAllocatedAmt());
				  	  }
				  	  if (account.getOutstandingAmt() != null &&
				  			  account.getOutstandingAmt().getCurrencyCode() != null) {
					  	totalOutstandingAmt.addToThis(account.getOutstandingAmt());
					  }
				  }
                   
			%>
            <tr class="<%=sno%2==0?"even":"odd"%>">
            <td class="index"><%=sno+1%></td>
            <%--
            <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(account.getBookingLoctnCountry())%>"/>&nbsp;</td>
            <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.SYSTEM_CODE, subObj.getCustomerSysXRef().getExternalSystemCode().toString() )%>"/>&nbsp;</td>
            --%>
            <td><integro:empty-if-null value="<%=subObj.getCustomerSysXRef().getExternalAccountNo()%>"/>&nbsp;</td>
            <td><integro:empty-if-null value="<%=helper.getAccountClassification(account.getAccountDelinq())%>"/>&nbsp;</td>
            <td><integro:date object="<%=account.getLastAllocationDate() %>"/>&nbsp;</td>
			<td class="amount"><integro:amount amount="<%=account.getCollateralAllocatedAmt() %>" decimal="2"/>&nbsp;</td>
			<td class="amount"><integro:amount amount="<%=account.getOutstandingAmt() %>" decimal="2"/>&nbsp;</td>              
	    <td>
	      &nbsp;
	      <% if (account.getRVForAccount() != null && account.getRVForAccount().getCurrencyCode() != null)
		 {
	      %>	
		    <integro:empty-if-null value="<%=account.getRVForAccount().getCurrencyCode() %>"/> &nbsp;
		    <integro:empty-if-null value="<%=CurrencyManager.convertToString(locale, account.getRVForAccount())%>"/>
	      <% } %>		
	    </td>		
	    	<% if (maintainAccount) { %>
            <td><a href="javascript:submitPage(2, <%=sno%>)">Edit</a></td>
            <td><html:multibox property="deleteItems" value="<%=String.valueOf(sno++)%>"/></td>
            <% } %>
            </tr>            
            </logic:iterate>
            <%if(sysXrefInd==0) {     %>
            <tr class="odd">
              <td colspan="<%=maintainAccount?9:7%>"><bean:message key="label.global.not.found"/></td>
            </tr>
          	<%  }   %>            
            </logic:present>
             <logic:notPresent name="sysXRef"  >
            <tr class="odd">
              <td colspan="<%=maintainAccount?9:7%>"><bean:message key="label.global.not.found"/></td>
            </tr>
       </logic:notPresent>
       <tr class="total">
       	<td>&nbsp;</td>
       	<td>&nbsp;</td>
       	<td>&nbsp;</td>
       	<td><bean:message key="label.common.total"/></td>
       	<td class="amount"><integro:amount amount="<%=totalAllocatedCol %>" decimal="2"/></td>
       	<td class="amount"><integro:amount amount="<%=totalOutstandingAmt %>" decimal="2"/></td>
       	<td>&nbsp;</td>
       	<% if (maintainAccount) { %>
       	<td>&nbsp;</td>
       	<td>&nbsp;</td>       	
       	<% } %>
       </tr>       
       
                 </tbody>

      </table></td>
    </tr>
	</tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage(1, 0);" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image441','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image441" width="75" height="22" border="0" id="Image441" /></a></td>
    <%    	
    	if (from_page != null && from_page.equals(LimitsAction.RE_PROCESS_LIMITS)) {
    %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image5" width="70" height="20" border="0" id="Image5" /></a></td>
    <% } else { %>
    <td><a href="javascript:cancel();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image5" width="70" height="20" border="0" id="Image5" /></a></td>
    <% } %>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->

</body>
<!-- InstanceEnd --></html>
