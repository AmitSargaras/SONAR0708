<%@ page import="com.integrosys.cms.app.ddn.trx.IDDNTrxValue,
                 com.integrosys.cms.app.ddn.bus.IDDN,
                 com.integrosys.cms.app.ddn.bus.IDDNCustomerDetail,
                 com.integrosys.cms.app.ddn.bus.DDNCollateralInfo,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.ddn.bus.IDDNItem,
                 java.util.*,
				 com.integrosys.cms.app.common.util.*,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,                 
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.genddn.GenerateDDNForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/genddn/generate_ddn_remarks.jsp,v 1.11 2006/10/27 08:45:31 hmbao Exp $
*
* Generate DDN Remarks.
* Purpose: Updating of DDN Remarks.
* Description: Displays Uneditable DDN Details and editable Remarks Field.
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.11 $
* Date: $Date: 2006/10/27 08:45:31 $
* Tag: $Name:  $
*/
%>
<%
    List deferredList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredList");
    List deferredApprovalList = (List) session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.deferredApprovalList");
    IDDNTrxValue certTrxVal = (IDDNTrxValue)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.certTrxVal");
    ILimitProfile limit = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

    IDDN cert = (IDDN)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.cert");
    IDDNCustomerDetail custDetail = (IDDNCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genddn.GenerateDDNAction.custDetail");
    if(custDetail!=null){
        pageContext.setAttribute("custDetail",custDetail);
    }
    if(cert!=null) {        
        pageContext.setAttribute("cert",cert);
    }
    IDDN actCert = certTrxVal.getDDN();
	String userRemarks = request.getParameter("remarks");
	if (userRemarks == null) userRemarks = "";
    
	String remarks = "";
    String lastActionBy = "";
    String status = "";
   	if(certTrxVal!=null)	   {
	     DefaultLogger.debug(this,">>>>> "+certTrxVal.getFromState());
	     DefaultLogger.debug(this,">>>>> "+certTrxVal.getStatus());
	}
	if(certTrxVal!=null) {
        status = certTrxVal.getStatus();
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
	}
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";
    DefaultLogger.debug(this,"status : " + status);
 	DefaultLogger.debug(this,"remarks : " + remarks);
	DefaultLogger.debug(this,"lastActionBy : " + lastActionBy);
    int row = 0;

    Amount cleanAppAmt = null;
    Amount notCleanAppAmt = null;
    Amount cleanActAmt = null;
    Amount notCleanActAmt = null;
    Amount cleanDDNAmt = null;
    Amount notCleanDDNAmt = null;
    
    if(cert!=null){
        cleanAppAmt = cert.getCleanApprovalAmount();
        notCleanAppAmt = cert.getApprovalAmount();        
        cleanActAmt = cert.getCleanActivatedAmount();
        notCleanActAmt = cert.getActivatedAmount();        
        cleanDDNAmt = cert.getCleanDDNAmount();
        notCleanDDNAmt = cert.getDDNAmount();
    }

    IDDNItem arrayActualClean[] = null;
    IDDNItem arrayStagingClean[] = null;
    IDDNItem arrayActualNotClean[] = null;
    IDDNItem arrayStagingNotClean[] = null;
    
    if (certTrxVal.getDDN()==null){
        arrayActualClean = null;
        arrayActualNotClean = null;
    }
    else {
        arrayActualClean = certTrxVal.getDDN().getCleanDDNItemList();
        arrayActualNotClean = certTrxVal.getDDN().getNotCleanDDNItemList();    
    }
    /*
    if (certTrxVal.getStagingDDN()!=null) {
	      // secured items
        arrayStagingClean = certTrxVal.getStagingDDN().getCleanDDNItemList();
	      if (arrayStagingClean != null && arrayActualClean == null) {
		      // copy arrayStagingClean to arrayActualClean
		      arrayActualClean = new IDDNItem[arrayStagingClean.length];
					for (int i=0; i<arrayStagingClean.length; i++) {
						arrayActualClean[i] = (IDDNItem) arrayStagingClean[i].clone();
					}
					// set the ddn amount of each ddn item to 0
					for (int i = 0; arrayActualClean != null && i < arrayActualClean.length; i++) {
						IDDNItem actualItem = arrayActualClean[i];
						if (actualItem != null) {
							String currencyCode = actualItem.getDDNAmount().getCurrencyCode();
							actualItem.setDDNAmount(new Amount(0, currencyCode));
						}
					}
	      }

	      // unsecured items
        arrayStagingNotClean = certTrxVal.getStagingDDN().getNotCleanDDNItemList();
	      if (arrayStagingNotClean != null && arrayActualNotClean == null) {
		      // copy arrayStagingNotClean to arrayActualNotClean
		      arrayActualNotClean = new IDDNItem[arrayStagingNotClean.length];
					for (int i=0; i<arrayStagingNotClean.length; i++) {
						arrayActualNotClean[i] = (IDDNItem) arrayStagingNotClean[i].clone();
					}
					// set the ddn amount of each ddn item to 0
					for (int i = 0; arrayActualNotClean != null && i < arrayActualNotClean.length; i++) {
						IDDNItem actualItem = arrayActualNotClean[i];
						if (actualItem != null) {
							String currencyCode = actualItem.getDDNAmount().getCurrencyCode();
							actualItem.setDDNAmount(new Amount(0, currencyCode));
						}
					}
	      }
    }
*/
    List cleanRes = null;
    List notCleanRes = null;
    if (!(arrayStagingClean == null && arrayActualClean == null)) {
	    cleanRes = CompareOBUtil.compOBArray(arrayStagingClean,arrayActualClean);
    }
    if(!(arrayStagingNotClean == null && arrayActualNotClean == null)) {
	    notCleanRes = CompareOBUtil.compOBArray(arrayStagingNotClean,arrayActualNotClean);
    }   
    
    ArrayList cleanList = null;
    ArrayList notCleanList = null;
    
    if(cleanRes!=null) {
        cleanList = new ArrayList(cleanRes);
    }
    if(notCleanRes!=null) {
        notCleanList = new ArrayList(notCleanRes);
    }
    if(cleanList!=null)
        pageContext.setAttribute("cleanddnitems",cleanList);

    if(notCleanList!=null)
        pageContext.setAttribute("notcleanddnitems",notCleanList);

    String creditgrade = null;
    String creditGradeName = "-";

    if(custDetail!=null) {
        if (custDetail.getCreditGrade() != null)
        {
            creditgrade = custDetail.getCreditGrade().getCGCode();
            if (creditgrade != null) {
                creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
            }
        }
    }

    CountryList cList = CountryList.getInstance();  
    OrgCodeList orgList = OrgCodeList.getInstance();  


    Date bcaApprovedDate = ((ILimitProfile)session.getAttribute(
            ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ)).getApprovalDate();

    GregorianCalendar cal = new GregorianCalendar();
    cal.setTime(bcaApprovedDate);

	// get BFL final issue date.
	String bflFinalIssueDateStr = (String) request.getAttribute("bflFinalIssueDate");
	DefaultLogger.debug(this," * bflFinalIssueDateStr = "+bflFinalIssueDateStr);
	if(bflFinalIssueDateStr==null || bflFinalIssueDateStr.equals("")) bflFinalIssueDateStr="-";

    GenerateDDNForm aForm = (GenerateDDNForm)request.getAttribute("GenerateDDNForm");
 	String warning = "";
	String validFor = "";
	validFor = aForm.getDdnDays();
	long validForVal = 0;
	if(validFor!=null){
		DefaultLogger.debug(this, "validFor "+validFor );
		validForVal= Long.parseLong(validFor);
		DefaultLogger.debug(this, "validForVal "+validForVal );
		if(validForVal > 90){
		warning = "<font color='#FF0000' size='1'>";
             if (limit.getRenewalInd()) {
               		warning += "Deferral";
             } else {
				warning += "DDN";
			 }
			warning += "Date is more than 90 calendar days from Deferral approval date.</font>";
		}
	}

%>



<html><!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable -->



<!-- InstanceParam name="showWinTitle" type="boolean" value="true" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" -->

 <!-- InstanceParam name="showContentMenuBar" type="boolean" value="true" -->
 <!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
 <!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
 <!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
 <!-- InstanceParam name="contentWidth" type="text" value="100%" -->
 <!-- InstanceParam name="contentHeight" type="text" value="100%" -->
 <!-- InstanceParam name="contentTitle" type="text" value="Customer Details" -->
 <!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="false" -->

<!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable -->

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

function approve(){
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        alert('Remarks field can be only 2000 Characters');
        return false;
    }

    document.forms[0].event.value="approve";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        alert('Remarks field can be only 2000 Characters');
        return false;
    }

    document.forms[0].event.value="reject";
    document.forms[0].submit();
}

function submitPage() {
        document.forms[0].event.value="submit_remarks";
        document.forms[0].submit();
}
function viewDiffOuterLimitBca(outerLimitID, limitID, outerLimitProfileID) {
    var test = document.forms[0].remarks.value;
    if( test.length > 2000) {
        alert('Remarks field can be only 2000 Characters');
        return false;
    }

	document.forms[0].event.value="checker_view_outer_limit_bca";
	document.forms[0].outerLimitID.value=outerLimitID;
	document.forms[0].limitID.value=limitID;
	document.forms[0].outerLimitProfileID.value=outerLimitProfileID;
	document.forms[0].submit();
}



function checkTextSize() {
	var text = document.forms[0].remarks.value;
	if(text==''){
		//alert('empty text');
	}else{
		if(text.length>2000){
			document.all['warningRemarks'].innerHTML = '<font color="#FF0000" size="1"><br>Remarks is too long. Please restrict to 2000 characters.</font>';
			document.forms[0].remarks.value = text.substring(0, 2000);
		}else{
			document.all['warningRemarks'].innerHTML = '';
		}
	}
}
//-->
</script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('img/approve2.gif','img/reject2.gif','img/cancel2.gif')" >
<html:form action="GenerateDDN" >
<input type="hidden" name="event" />
<input type="hidden" name="outerLimitID"/>
<input type="hidden" name="limitID"/>
<input type="hidden" name="outerLimitProfileID"/>
<input type="hidden" name="actionName" value="GenerateDDN"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="menuScript" --> <!-- InstanceEndEditable -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
   <!-- InstanceBeginEditable name="contentCanvas" -->
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td><h3>Process - Generate DDN</h3></td>
                        </tr>
                        <tr>
                          <td><hr /> </td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <thead>
                                <tr class="odd">
                                  <td colspan="4" style="text-align:left">Customer
                                    Details</td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr class="odd">
                                  <td height="22" class="fieldname">LE ID<br />
                                  </td>
                                  <td>&nbsp;<bean:write name="custDetail" property="legalID"  /></td>
                                  <td class="fieldname">Legal Name</td>
                                  <td>&nbsp;<bean:write name="custDetail" property="legalName"  /></td>
                                </tr>
                                <tr class="even">
                                  <td class="fieldname">Customer Sub-Profile Name<br /> </td>
                                  <td>&nbsp;<bean:write name="custDetail" property="customerName"  /> </td>
                                  <td class="fieldname">Sub-Profile ID</td>
                                  <td>&nbsp;<bean:write name="custDetail" property="customerReference" /></td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">SCB Internal Credit Grade</td>
                                  <td>&nbsp;<%=creditGradeName%></td>
                                  <td class="fieldname">Customer BFL Issue Date</td>
                                  <td>&nbsp;<%=bflFinalIssueDateStr%></td>
                                </tr>
                                <tr class="even">
                                  <td class="fieldname">FAM</td>                                  
                                  <%
                                  	//String fam = custDetail.getFamCode() + ", " + custDetail.getFamName();
                                        String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
				     	String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
    					String fam = famCode + ", " + famName ;
                                  %>
                                  <td><integro:empty-if-null value="<%=fam %>" /></td>
                                  <td class="fieldname">DDN Ref. No.</td>
                                  <td><%=custDetail.getLegalID()%>/<%= cert.getDDNRef()%></td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td><h3>&nbsp;</h3></td>
                        </tr>
                        <tr>
                          <td><hr /></td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInput">
                              <thead>
                              </thead>
                              <tbody>
                                <tr class="odd">
                                  <td class="<%=CompareOBUtil.compOB(cert,actCert,"deferredToDate")? "fieldname":"fieldnamediff"%>" width="20%">DDN Expiry Date&nbsp;<font color="#0000FF">* </font></td>
                                  <td width="30%"><integro:date object="<%=cert.getDeferredToDate()%>" />&nbsp;<br><%=warning%></td>
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"extendedToDate")? "fieldname":"fieldnamediff"%>" >DDN Extended Expiry Date</td>
                                  <td width="30%">&nbsp;<integro:date object="<%=cert.getExtendedToDate()%>" /></td>
                                </tr>
                                <tr class="odd">
                                    <td class="<%=CompareOBUtil.compOB(cert,actCert,"daysValid")? "fieldname":"fieldnamediff"%>" >DDN valid for</td>
                                    <td >
                                    <% if (Integer.parseInt(validFor)==Integer.MIN_VALUE)
                                    // if (cert.getDaysValid()==Integer.MIN_VALUE)
                                       {
                                    %>&nbsp;
                                    <% }
                                       else
                                       {                                        
                                    %> <% //=cert.getDaysValid()%>
                                    <%=validFor%>
                                    <%  }%>                                   
                                    &nbsp;&nbsp;Days</td>
                                    <td width="20%" class="fieldname"  >Deferral Approval Date</td>
              						<td width="30%"  ><bean:write name="GenerateDDNForm" property="appDate" /></td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>
    <tr><td>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		  <tbody> 
		    <tr>
		      <td class="fieldname">
		      We certify that all pre-conditions (relating to Contractual & Constitutional and Security Documents) for the draw down of the following limits as detailed in the Business Credit Application dated  
		      <bean:write name="GenerateDDNForm" property="bcaAppDate" />  (as read in conjunction with the deferral approved in respect thereof) have been complied with, physically checked and confirmed to be in order.

		      </td>
		    </tr>
		  </tbody>
		</table>
    </td></tr>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td>The following are Un-Secured Limits:</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="4%">S/N</td>
                                  <td width="9%">Limit ID</td>
                                  <td width="15%">Co-borrower LE <br>ID/Name</td>
                                  <td width="10%">Limit Booking Location</td>
                                  <td width="7%">Product Desc</td>
                                  <td width="9%">Outer Limit ID</td>
                                  <td width="13%">Approved Limit</td>
                                  <td widht="10%">Limit Maturity Date</td>
                                  <td width="13%">DDN Limit&nbsp;<font color="#00AAFF">* </font></td>
                                  <td width="7%">Issue DDN</td>
                                </tr>
                              </thead>
                              <tbody>
<logic:present name="cleanddnitems"  >
   <logic:iterate id="compResult" name="cleanddnitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    IDDNItem OB = (IDDNItem)compResult.getObj();
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    String prodDesc= "-";
    
    boolean partial = OB.getIsDDNIssuedInd();
    
	if(OB.getProductDesc()!=null) {
		prodDesc = OB.getProductDesc();
		if(prodDesc !=null)
		{
			if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
		   prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
		}
	}
	
   %>
        <tr class="<%=rowClass%>">
         	  <td class="index"><%=row%></td>
              <!--td class='<bean:write name="compResult" property="key" />' --><!--%=row%></td-->
              
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              <td>&nbsp;
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />          
              <br>
              &nbsp;<integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />           
              </td>
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td>&nbsp;<%=prodDesc%></td>
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              <% if (!OB.getIsInnerOuterSameBCA()) { %>
              	<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              <% } %>
              <%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              <% if (!OB.getIsInnerOuterSameBCA()) { %> </a> <% } %>
              </td>
              <td class="amount">
              <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getApprovedLimitAmount()%>" param="currency" />
              <%if (OB.isInnerLimit())
                {
              %>(                
                <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getApprovedLimitAmount()%>" param="amount" />
                )
              <%}
                else
                {
              %><integro:currency amount="<%=((IDDNItem)compResult.getObj()).getApprovedLimitAmount()%>" param="amount" />
              <%}%>
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate()%>" />
                  <% } %>
              </td>
              <td class="amount">
              <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getDDNAmount()%>" param="currency" />
              <%if (OB.isInnerLimit()) { %>
	      ( 
		<integro:currency amount="<%=((IDDNItem)compResult.getObj()).getDDNAmount()%>" param="amount" />
	      )
	      <%}else{%>
		<integro:currency amount="<%=((IDDNItem)compResult.getObj()).getDDNAmount()%>" param="amount" />
              <%}%> 
              </td>
              <td style="text-align:center"><input name="checkbox" type="checkbox" disabled="true" value="checkbox" <%if(partial) { %>checked  <% }%> /></td>
        </tr>
</logic:iterate>
                        <tr class="odd">
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total" style="text-align:right;padding-right:3px">Total</td>
                          <td class="total" style="text-align:right;padding-right:3px">&nbsp;<integro:currency amount="<%=cleanAppAmt%>" /></td>
                          <td class="total">&nbsp;</td>
                          <td class="total" style="text-align:right;padding-right:3px">&nbsp;<integro:currency amount="<%=cleanDDNAmt%>" /></td>
                          <td class="total">&nbsp;</td>
                        </tr>
            </logic:present>
<logic:notPresent name="cleanddnitems" >
            <tr class="odd">
                <td colspan="10">There is no limit</td>
            </tr>
</logic:notPresent>


                              </tbody>
                            </table></td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td>The following are Secured Limits:</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="4%">S/N</td>
                                  <td width="9%">Limit ID</td>
                                  <td width="5%">Co-borrower LE <br>ID/Name</td>
                                  <td width="10%">Limit Booking Location</td>
                                  <td width="7%">Product Desc</td>
                                  <td width="9%">Outer Limit ID</td>
                                  <td width="13%">Approved Limit</td>
                                  <td widht="10%">Limit Maturity Date</td>
                                  <td width="13%">DDN Limit&nbsp;<font color="#00AAFF">* </font></td>
                                  <td width="9%">Security ID</td>
                                  <td width="7%">Security<br />Type</td>
                                  <td width="7%">Issue DDN</td>
                                </tr>
                              </thead>
                              <tbody>
<logic:present name="notcleanddnitems"  >
   <logic:iterate id="compResult" name="notcleanddnitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    IDDNItem OB = (IDDNItem)compResult.getObj();
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    String prodDesc= "-";
    boolean partial = OB.getIsDDNIssuedInd();
	if(OB.getProductDesc()!=null) {
		prodDesc = OB.getProductDesc();
		if(prodDesc !=null)
		{
			if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
		   prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
		}
	}
   %>
        <tr class="<%=rowClass%>">
	          <td class="index"><%=row%></td>
              <!--td class='<bean:write name="compResult" property="key" />' --><!--%=row%></td-->
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              <td>&nbsp;
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />          
              <br>
              &nbsp;<integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />                           
              </td>
              <td>&nbsp;<%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td>&nbsp;<%=prodDesc%></td>
              <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              <% if (!OB.getIsInnerOuterSameBCA()) { %>
              	<a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              <% } %>
              <%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              <% if (!OB.getIsInnerOuterSameBCA()) { %> </a> <% } %>
              </td>
              <td class="amount">
              <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getApprovedLimitAmount()%>" param="currency" />
              <%if (OB.isInnerLimit())
                {
              %>(   
                <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getApprovedLimitAmount()%>" param="amount" />
                )
              <%}
                else
                {
              %>  <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getApprovedLimitAmount()%>" param="amount" />
              <%}%>
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                  -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate()%>" />
                  <% } %>
              </td>
              <td class="amount">
              <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getDDNAmount()%>" param="currency" />
              <%if (OB.isInnerLimit()) { %>
              ( 
                <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getDDNAmount()%>" param="amount" />
              )
              <%}else{%>
                <integro:currency amount="<%=((IDDNItem)compResult.getObj()).getDDNAmount()%>" param="amount" />
              <%}%>  
              </td>
              <td width="12%">
                <logic:iterate id="temp0" name="compResult" property="obj.DDNCollateralInfoList" >
                    <%=((DDNCollateralInfo)temp0).getCollateralRef()%><br>
                </logic:iterate>
              </td>
              <td width="12%">
                <logic:iterate id="temp1" name="compResult" property="obj.DDNCollateralInfoList" >
                    <bean:write name="temp1" property="collateralType.typeName" /><br>
                </logic:iterate>
              </td>
              <td style="text-align:center"><input name="checkbox" type="checkbox" disabled="true" value="checkbox" <%if(partial) { %>checked  <% }%> /></td>
        </tr>
</logic:iterate>
                        <tr class="odd">
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                          <td class="total" style="text-align:right;padding-right:3px">Total</td>
                          <td class="total" style="text-align:right;padding-right:3px">&nbsp;<integro:currency amount="<%=notCleanAppAmt%>" /></td>
                          <td class="total">&nbsp;</td>
                          <td class="total" style="text-align:right;padding-right:3px">&nbsp;<integro:currency amount="<%=notCleanDDNAmt%>" /></td>
                          <td class="total">&nbsp;</td>                          
                          <td class="total">&nbsp;</td>
                          <td class="total">&nbsp;</td>
                        </tr>
            </logic:present>
<logic:notPresent name="notcleanddnitems" >
            <tr class="odd">
                <td colspan="12">There is no limit</td>
            </tr>
</logic:notPresent>


                              </tbody>
                            </table></td>
                        </tr>
    <tr>
      <td><h3>Deferral Requested for</h3></td>
    </tr>
    <tr> 
      <td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead> 
            <tr> 
              <td width="5%">S/N</td>
              <td width="12%">Doc Number</td>
              <td width="10%">Doc Code</td>
              <td width="21%">Doc Description</td>
              <td width="10%">Expiry of Deferment</td>
              <td width="10%">Extended Deferment Date</td>
              <!--td width="10%">DDN Valid For</td-->
              <td width="10%">Approval Date</td>
              <td width="12%">Approved By</td>
            </tr>
            </thead> 
            <tbody>
             <%
             int rowc=0;
             if (deferredList != null) {
             for (int x = 0; x < deferredList.size(); x++) {
                OBCMSTrxHistoryLog log = new OBCMSTrxHistoryLog();
	            ICheckListItem item = (ICheckListItem) deferredList.get(x); 
	            if (deferredApprovalList != null && deferredApprovalList.size() > x)
	              log = (OBCMSTrxHistoryLog) deferredApprovalList.get(x);
	            String rowClass="";
				rowc++;
				if(rowc%2!=0){
				  rowClass="odd";
				}else{
				  rowClass="even";
				}
				
             %>
              <tr class="<%=rowClass%>">
                  <td class="index"><%=rowc%></td>
	              <td ><%= item.getCheckListItemRef()%>&nbsp;</td>
	              <td ><%= item.getItemCode() %>&nbsp;</td>
	              <td ><%= item.getItemDesc() %>&nbsp;</td>
	              <td ><integro:date object="<%= item.getDeferExpiryDate() %>"/>&nbsp;</td>
	              <td ><integro:date object="<%= item.getDeferExtendedDate() %>"/>&nbsp;</td>
	              <!--td >
	              <%// if (bcaApprovedDate == null) { %>
	                 0&nbsp;
	              <%/* } else {
		               	Date d1 = null;
	                   	if (item.getDeferExtendedDate() != null) {
	                     	d1 = item.getDeferExtendedDate();
                       	} else {
 	                     	d1 = item.getDeferExpiryDate();
                       	}
 	                   	Date d2 = cal.getTime();
 	                   	if (d1.before(d2)) {		*/
						%>
		             		0         
	              		<%//} else { %>
		              		<!--%= CommonUtil.dateDiff(d1, d2, Calendar.DATE)%-->
	              		<%
                   /*    	}
                     }*/
                  %>
				  </td-->
				  <%   
                     Calendar cal2 = null;
                     if (log.getLogDate()!= null) {
	                     cal2 = new GregorianCalendar(Integer.parseInt(log.getLogDate().substring(6,10)), Integer.parseInt(log.getLogDate().substring(3,5))-1, Integer.parseInt(log.getLogDate().substring(0,2)) ); 
                     }   
                  %>
	              
	              <td ><% if (cal2 != null) { %><integro:date object="<%=cal2.getTime()%>"/><% } else { %>&nbsp;<% } %></td>
	              <td ><integro:empty-if-null value="<%=log.getLogUserName()%>"/>&nbsp;
          (<integro:empty-if-null value="<%=log.getLogGroupName()%>"/>)</td>
              </tr>
             <% } } %>
             <% if (rowc==0) { %>
               <tr> 
                 <td colspan="9">There is no document.</td>
               </tr>             
             <% } %>
            </tbody>
           </table>
      </td>
    </tr>

                        <tr>
                          <td><hr /></td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                              <thead>
                                <tr>
                                  <td colspan="4" style="text-align:left">Credit
                                    Documentation Officer / Manager</td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr class="odd">
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"creditOfficerName")? "fieldname":"fieldnamediff"%>" >Name&nbsp;<font color="#0000FF">* </font></td>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cert.getCreditOfficerName()%>" />                                     
                                  </td>
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"creditOfficerSignNo")? "fieldname":"fieldnamediff"%>" >Signing Number&nbsp;<font color="#0000FF">* </font></td>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cert.getCreditOfficerSignNo()%>" />
                                  </td>
                                </tr>
                                <tr class="even">
                                <%  if (actCert != null)
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getCreditOfficerLocation(),actCert.getCreditOfficerLocation(),"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }
                                    else
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getCreditOfficerLocation(),null,"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }%>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cList.getCountryName(cert.getCreditOfficerLocation().getCountryCode())%>" />
                                  </td>
                                <%  if (actCert != null)
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getCreditOfficerLocation(),actCert.getCreditOfficerLocation(),"organisationCode")? "fieldname":"fieldnamediff"%>" >Location Org Code</td>
                                <%  }
                                    else
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getCreditOfficerLocation(),null,"organisationCode")? "fieldname":"fieldnamediff"%>" >Location Org Code</td>
                                <%  }%>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode())%>" />
                                  </td>
                                </tr>
                              </tbody>
                            </table>
                          </td>
                        </tr>
                        <tr>
                          <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                              <thead>
                                <tr>
                                  <td colspan="4" style="text-align:left">Senior Credit Documentation Manager
                                  </td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr class="even">
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"seniorOfficerName")? "fieldname":"fieldnamediff"%>">Name</td>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cert.getSeniorOfficerName()%>" />
                                  </td>
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"seniorOfficerSignNo")? "fieldname":"fieldnamediff"%>">Signing Number</td>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cert.getSeniorOfficerSignNo()%>" />
                                  </td>
                                </tr>
                                <tr class="even">
                                <%  if (actCert != null)
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getSeniorOfficerLocation(),actCert.getSeniorOfficerLocation(),"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }
                                    else
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getSeniorOfficerLocation(),null,"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }%>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cList.getCountryName(cert.getSeniorOfficerLocation().getCountryCode())%>" />
                                  </td>
                                <%  if (actCert != null)
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getSeniorOfficerLocation(),actCert.getSeniorOfficerLocation(),"organisationCode")? "fieldname":"fieldnamediff"%>" >Location Org Code</td>
                                <%  }
                                    else
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getSeniorOfficerLocation(),null,"organisationCode")? "fieldname":"fieldnamediff"%>" >Location Org Code</td>
                                <%  }%>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode())%>" />
                                  </td>
                                </tr>
                              </tbody>
                            </table></td>
                        </tr>                       		
                        <tr>
                          <td>&nbsp;</td>
                        </tr>                  
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                            <thead></thead>
                              <tbody>
                                <tr>
                                  <td width="20%" class="fieldname">Remarks</td>
                                  <td width="80%" class="odd"><textarea name="remarks" rows=16 cols=70 onkeyup="checkTextSize()"><%=remarks%></textarea>
                                  <span id="warningRemarks"></span></td>
                                </tr>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even">&nbsp;<%=lastActionBy%></td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
                                </tr>
                              </tbody>
                            </table>
                         </td>
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
                         <td><a href="#" onclick="submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/submit2.gif',0)"><img src="img/submit1.gif" name="Image2" border="0" id="Image2" /></a></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    <!-- InstanceEndEditable --> </div>
				
</html:form>
</body>
<!-- InstanceEnd --></html>
