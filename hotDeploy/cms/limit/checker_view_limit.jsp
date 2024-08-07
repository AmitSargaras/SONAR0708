<%@ page import="com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,                 
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ILimitSysXRef,
				 com.integrosys.cms.app.limit.trx.ILimitTrxValue,                 
                 com.integrosys.cms.app.customer.bus.ICustomerSysXRef,
                 com.integrosys.cms.ui.limit.LimitsAction,
                 com.integrosys.cms.ui.limit.LimitsForm,
                 com.integrosys.cms.ui.limit.LimitFSVBalanceHelper,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.manualinput.limit.MILimitUIHelper,
                 java.util.List,
		 java.util.ArrayList,
                 java.util.Locale"%>
 <%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/limit/ViewLimitDetails.jsp,v 1.66 2006/10/27 08:46:32 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.66 $
     * @since $Date: 2006/10/27 08:46:32 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>

      <%           

          boolean isProcess = true;
       	  ILimitTrxValue trxValue = (ILimitTrxValue)session.getAttribute("com.integrosys.cms.ui.limit.LimitsAction.service.limitTrxValue");

          ILimit actualLimit = trxValue.getLimit();
          ILimit stageLimit = trxValue.getStagingLimit();

          LimitsForm aForm = (LimitsForm) request.getAttribute("LimitsForm");          

          String limitid = aForm.getLimitID();

          int sno=0;

	  String actualLimitId = (actualLimit == null)?"":String.valueOf(actualLimit.getLimitID());
          List balanList = new LimitFSVBalanceHelper().getFSVBalForMainborrowLimit(actualLimitId);
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


function submitPage(num) {
	if (num == 1) {
		document.forms[0].event.value = "<%=LimitsAction.EVENT_APPROVE%>";
	} else if (num == 2) {
		document.forms[0].event.value = "<%=LimitsAction.EVENT_REJECT%>";
	}
	document.forms[0].submit();
}

-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="Limits.do">
<input type="hidden" name="event"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    </thead>
  <tbody>
    <tr>

      <td width="90%"><h3>Limit Details</h3></td>

    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<%@ include file="/limit/common_limit_details.jsp" %>
        </table></td>
    </tr>
     <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
          <tr>
            <td width="5%"><bean:message key="label.global.sn"/></td>            
            <%--
            <td width="20%"><bean:message key="label.limit.account.host.country"/></td>
            <td width="30%"><bean:message key="label.limit.account.host.name"/></td>
            --%>
            <td width="15%"><bean:message key="label.limit.account.no"/></td>
            <td width="15%"><bean:message key="label.limit.account.classification"/></td>
            <td width="15%"><bean:message key="label.limit.account.last.allocation.date"/></td>
            <td width="15%"><bean:message key="label.limit.account.collateral.allocated"/></td>
            <td width="15%"><bean:message key="label.limit.account.outstanding"/></td>            
	    	<td width="15%"><bean:message key="label.limit.account.rv"/></td>            
          </tr>
        </thead>
          <tbody>
		<%	            
			int sysXrefInd=0;
			ArrayList list = null;
			if (stageLimit.getLimitSysXRefs() != null || actualLimit.getLimitSysXRefs() != null)
			{
				List res = CompareOBUtil.compOBArray(stageLimit.getLimitSysXRefs(),actualLimit.getLimitSysXRefs());
            			list = new ArrayList(res);
			}
			else
			{
				list = new ArrayList();
			}
            pageContext.setAttribute("sysXRef",list);
    		  Amount totalAllocatedCol = new Amount(0, CommonUtil.getBaseCurrency());
    		  Amount totalOutstandingAmt = new Amount(0, CommonUtil.getBaseCurrency());                 
		%>        
       <logic:present name="sysXRef"  >
               <logic:iterate id="subObj" name="sysXRef"  type="com.integrosys.base.techinfra.diff.CompareResult" >
              <%
              	  ILimitSysXRef limitSysXRef = (ILimitSysXRef)subObj.getObj();
/*              	  
                  if (limitSysXRef.getStatus() != null && limitSysXRef.getStatus().equals (ICMSConstant.STATE_DELETED)) {
                    continue;
                  }
*/                  
                  sysXrefInd=1;
                  sno++;
				  ICustomerSysXRef account = limitSysXRef.getCustomerSysXRef();
				  totalAllocatedCol.addToThis(account.getCollateralAllocatedAmt());
				  totalOutstandingAmt.addToThis(account.getOutstandingAmt());				  
              %>
             <tr class="<%=sno%2==0?"even":"odd"%>">
            <td class="<bean:write name="subObj" property="key"/>"><%=sno%></td>
            <%--
            <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(account.getBookingLoctnCountry())%>"/>&nbsp;</td>
            <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.SYSTEM_CODE, account.getExternalSystemCode().toString() )%>"/>&nbsp;</td>
            --%>
            <td><integro:empty-if-null value="<%=account.getExternalAccountNo()%>"/>&nbsp;</td>
			<td><integro:empty-if-null value="<%=helper.getAccountClassification(account.getAccountDelinq())%>"/>&nbsp;</td>            
            <td><integro:date object="<%=account.getLastAllocationDate() %>"/>&nbsp;</td>
			<td class="amount"><integro:amount amount="<%=account.getCollateralAllocatedAmt() %>" decimal="2"/>&nbsp;</td>
			<td class="amount"><integro:amount amount="<%=account.getOutstandingAmt() %>" decimal="2"/>&nbsp;</td>              
            
            <td>&nbsp;</td>
            </tr>
            </logic:iterate>
            <%if(sysXrefInd==0) {     %>
                <tr class="odd">
              <td colspan="7"><bean:message key="label.global.not.found"/></td>
            </tr>

          <%  }   %>

            </logic:present>
             <logic:notPresent name="sysXRef"  >
            <tr class="odd">
              <td colspan="7"><bean:message key="label.global.not.found"/></td>
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
       </tr>           
                 </tbody>

      </table></td>
    </tr>
</tbody>
</table>
<br>
<table  width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
    	<tr class="even">
        	<td class="fieldname">Remarks</td>
            <td><textarea name="remarks" cols="80" rows="3"></textarea></td>
        </tr>
        <tr class="odd">
        	<td class="fieldname">Last Action By</td>
            <td class="odd"><%=trxValue.getUserInfo()%>&nbsp;</td>
        </tr>
        <tr class="even">
      		<td class="fieldname">Last Remarks Made</td>
      		<td><integro:wrapper value="<%=trxValue.getRemarks()%>"/>&nbsp;</td>
		</tr>
	</tbody>
</table>
<table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89">&nbsp;</td>
    <td width="81">&nbsp;</td>
    <td width="70">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:submitPage(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
    <!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
