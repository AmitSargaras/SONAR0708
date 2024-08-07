<%@ page import="com.integrosys.cms.app.cccertificate.trx.ICCCertificateTrxValue,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificate,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 java.util.*,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificateItem,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificateCustomerDetail"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    ICCCertificateTrxValue certTrxVal = (ICCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.certTrxVal");
    ICCCertificate actCert = certTrxVal.getCCCertificate();
    ICCCertificateCustomerDetail custDetail = (ICCCertificateCustomerDetail)request.getAttribute("custDetail");

	ICCCertificate cert = (ICCCertificate)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.cert");
    if(cert!=null) {
        pageContext.setAttribute("cert",cert);
    }
	String userRemarks = request.getParameter("remarks");
	if (userRemarks == null) userRemarks = "";
	
	String remarks = "";
    String lastActionBy = "";
    //String status = "";
	if(certTrxVal!=null) {
      //  status = certTrxVal.getStatus();
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
	}
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    int row = 0;

    Amount cleanAppAmt = null;
	Amount notCleanAppAmt = null;
	Amount cleanActAmt = null;
	Amount notCleanActAmt = null;
	
    if(cert!=null){
        cleanAppAmt = cert.getCleanApprovalAmount();
        notCleanAppAmt = cert.getApprovalAmount();
        cleanActAmt = cert.getCleanActivatedAmount();
        notCleanActAmt = cert.getActivatedAmount();
    }

    String creditgrade = null;    
    String creditGradeName = "-";
    
    if(custDetail!=null) {
        creditgrade = custDetail.getCreditGrade().getCGCode();        
        if (creditgrade != null) {
            creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
        }
    }    
    
    String cbCreditGrade = null;    
    String cbCreditGradeName = "-";    
    ICCCertificateCustomerDetail coBorrowerDetail = (ICCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.coBorrowerDetail");
    if (coBorrowerDetail!= null) {
        pageContext.setAttribute("coBorrowerDetail", coBorrowerDetail);
        
        cbCreditGrade = coBorrowerDetail.getCreditGrade().getCGCode();        
        if (cbCreditGrade != null) {
            cbCreditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", cbCreditGrade.toString());
        }                       
    }        
    
    String pledgorCreditGrade = null;
    String pledgorCreditGradeName = "-";
    String secTypeValue = "-";
    String secSubTypeValue = "-";
    ICCCertificateCustomerDetail pledgorDetail = (ICCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.pledgorDetail");
    if (pledgorDetail != null) {
        pageContext.setAttribute("pledgorDetail", pledgorDetail);
        
        pledgorCreditGrade = pledgorDetail.getCreditGrade().getCGCode();
        if (pledgorCreditGrade != null) {
            pledgorCreditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", pledgorCreditGrade.toString());
        }
        java.util.List l = (java.util.List)session.getAttribute("com.integrosys.cms.ui.genccc.GenerateCCCAction.pledgorColList");
        if(l!=null){               
            pageContext.setAttribute("pledgorColList",l);
        }
    }        
    CountryList cList = CountryList.getInstance();    
    OrgCodeList orgList = OrgCodeList.getInstance();
    
    //CMS-1281
    ICCCertificateItem arrayActualClean[] = null;
    ICCCertificateItem arrayActualNotClean[] = null;
    ICCCertificateItem arrayStagingClean[] = null;    
    ICCCertificateItem arrayStagingNotClean[] = null;   
        
	if(actCert != null){         
	    arrayActualClean = actCert.getCleanCCCertificateItemList();
	    arrayActualNotClean= actCert.getNotCleanCCCertificateItemList();  	   
	}
	if(cert != null) {
	    arrayStagingClean= cert.getCleanCCCertificateItemList();
	    arrayStagingNotClean = cert.getNotCleanCCCertificateItemList();  	     
	}

	List cleanRes = null;
	List notCleanRes = null;
	if(!(arrayStagingClean == null && arrayActualClean == null)) {
	    cleanRes = CompareOBUtil.compOBArray(arrayStagingClean,arrayActualClean);
	}
	if(!(arrayStagingNotClean == null && arrayActualNotClean == null)) {
	    if (arrayActualNotClean == null)
	      notCleanRes = CompareOBUtil.compOBArray(arrayStagingNotClean,arrayStagingNotClean);
	    else
	      notCleanRes = CompareOBUtil.compOBArray(arrayStagingNotClean,arrayActualNotClean);
	}   

	ArrayList cleanList = null;
	ArrayList notCleanList = null;

	if(cleanRes!=null) 
	    cleanList = new ArrayList(cleanRes);	    

	if(notCleanRes!=null)  
	    notCleanList = new ArrayList(notCleanRes);

	if(cleanList!=null)
	    pageContext.setAttribute("cleancccitems",cleanList);

	if(notCleanList!=null)
		pageContext.setAttribute("notcleancccitems",notCleanList);
    
    //CMS-1281
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

//-->
</script>





</head>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('img/approve2.gif','img/reject2.gif','img/cancel2.gif')">
<html:form action="GenerateCCC" >
<input type="hidden" name="event" />
<input type="hidden" name="actionName" value="GenerateCCC"/>
<input type="hidden" name="outerLimitID"/>
<input type="hidden" name="limitID"/>
<input type="hidden" name="outerLimitProfileID"/>

<!-- InstanceBeginEditable name="menuScript" --> <!-- InstanceEndEditable -->
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td><h3>Process - Generate CCC</h3></td>
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
                                 <% if ((custDetail.getLegalID() == null) || (custDetail.getLegalID().equals("0")))
                                    {%>
                                      <td >&nbsp;<%= "-"%></td>
                                 <% } else { %>
                                      <td >&nbsp;<%=custDetail.getLegalID()%></td>
                                 <% } %>
                                  <td class="fieldname">Legal Name</td>
                                  <td>&nbsp;<bean:write name="custDetail" property="legalName" scope="request" /></td>
                                </tr>
                                <tr class="even">
                                  <td class="fieldname">Customer Name<br /> </td>
                                  <td>&nbsp;<bean:write name="custDetail" property="customerName" scope="request" /></td>
                                  <td class="fieldname">Sub-Profile ID</td>
                                  <td>&nbsp;<bean:write name="custDetail" property="customerReference" scope="request" /></td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">SCB Internal Credit Grade</td>
                                  <td>&nbsp;<%=creditGradeName%></td>
<%                                  if (!ICMSConstant.CHECKLIST_NON_BORROWER.equals(cert.getCCCertCategory()))
                                    {
%>                                <td class="fieldname">Customer BFL Issued<br>Date</td>
                                    <%
                                        if (custDetail.getFinalBFLIssuedDate() != null)
                                        {
                                    %>
                                                  <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getFinalBFLIssuedDate())%></td>
                                    <%  }
                                        else
                                        {
                                    %>
                                                  <td>&nbsp;-</td>
                                    <%  }
                                    }else { %>   
                                    <td class="fieldname">&nbsp;</td>
                                    <td>&nbsp;</td>
<%                                  }%>
                                </tr>                                
                                <tr class="even">
                                  <td class="fieldname">FAM</td>                                  
                                  <%
                                    //String fam = custDetail.getFamCode() + ", " + custDetail.getFamName();
                                    String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
				    String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
    	      			    String fam = famCode + ", " + famName ;                    
                                  
                                  %>
                                  <td><integro:empty-if-null value="<%=fam %>" />
                                  </td>
                                  <td class="fieldname">CCC Ref. No.</td>
                                  <td><%=custDetail.getLegalID()%>/<%= cert.getCCCertRef()%></td>                                </tr>
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <%  if (ICMSConstant.CHECKLIST_PLEDGER.equals(cert.getCCCertCategory()))
    {%>  
  <tbody>
    <tr> 
      <td> <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd"> 
              <td colspan="4" style="text-align:left">Pledgor Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td width="20%" height="22" class="fieldname">LE ID<br /> </td>          
              <% if ((pledgorDetail.getLegalID() == null) || (pledgorDetail.getLegalID().equals("0")))
                 {%>
              <td width="30%" >&nbsp;<%= "-"%></td>
              <% } else { %>
              <td width="30%">&nbsp;<%=pledgorDetail.getLegalID()%></td>
              <% } %>             
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%">&nbsp;<bean:write name="pledgorDetail" property="legalName" /></td>
            </tr>
            <tr class="even"> 
              <td class="fieldname">Pledgor ID</td>
              <td>&nbsp;<bean:write name="pledgorDetail" property="customerReference" /></td>
              <td class="fieldname">SCB Internal Credit Grade<br /> </td>
              <td>&nbsp;<%=pledgorCreditGradeName%></td>
            </tr>                      
          </tbody>
        </table>
        <tr>
            <td align="center">&nbsp;</td>
        </tr>
        <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
    <tr> 
      <td> <hr /> </td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
		  <tr>
              <td width="6%">S/N</td>
              <td width="44%">Security ID</td>
              <td width="50%">Security Type /<br />
                SubType</td>
          </tr>
		  </thead>
		  <tbody>
    <logic:present name="pledgorColList"  >
<%
    SecurityTypeList secList = SecurityTypeList.getInstance();
    SecuritySubTypeList subList = SecuritySubTypeList.getInstance();               
%>
        <logic:iterate id="OB" name="pledgorColList"  type="com.integrosys.cms.app.collateral.bus.ICollateral" >  
<%
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    secTypeValue = secList.getSecurityTypeValue(OB.getCollateralType().getTypeCode(),null);
    secSubTypeValue = subList.getSecuritySubTypeValue(OB.getCollateralSubType().getSubTypeCode(),null);
%>        <tr class="<%=rowClass%>">
              <td class="index"><%=row%></td>  
              <td>&nbsp;<%= OB.getSCISecurityID()%></td>
              <td><%= secTypeValue%><br />
                <%= secSubTypeValue%></td>
          </tr>
        </logic:iterate>
    </logic:present>
		  </tbody>
        </table>
<%  }
    else
    {
    if (ICMSConstant.CHECKLIST_CO_BORROWER.equals(cert.getCCCertCategory()))
    {%>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tbody>
    <tr> 
      <td> <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd"> 
              <td colspan="4" style="text-align:left">Co-borrower Details</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd"> 
              <td width="20%" height="22" class="fieldname">LE ID<br /> </td>          
              <% if ((coBorrowerDetail.getLegalID() == null) || (coBorrowerDetail.getLegalID().equals("0")))
                 {%>
              <td width="30%" >&nbsp;<%= "-"%></td>
              <% } else { %>
              <td width="30%">&nbsp;<%=coBorrowerDetail.getLegalID()%></td>
              <% } %>             
              <td width="20%" class="fieldname">Legal Name</td>
              <td width="30%">&nbsp;<bean:write name="coBorrowerDetail" property="legalName" /></td>
            </tr>
            <tr class="even"> 
              <td class="fieldname">Sub-profile ID</td>
              <td>&nbsp;<bean:write name="coBorrowerDetail" property="customerReference" /></td>
              <td class="fieldname">Customer Sub-<br>Profile Name<br /> </td>
              <td>&nbsp;<bean:write name="coBorrowerDetail" property="customerName" /></td>
            </tr>
            <tr class="odd">              
              <td class="fieldname">SCB Internal Credit Grade</td>
              <td>&nbsp;<%=cbCreditGradeName%></td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>              
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr> 
      <td> 
<%}%>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
<%  if (cert.getCleanCCCertificateItemList() != null)
    {
%>                      <tr>
                          <td><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Approved Date</td>
              <td>Limit Maturity Date</td>
              <td>Limit Amount to be Activated</td>
            </tr>
          </thead>
          <tbody>
<!-- logic:present name="cert"  -->
<!-- logic:iterate id="OB" name="cert"  property="cleanCCCertificateItemList" type="com.integrosys.cms.app.cccertificate.bus.ICCCertificateItem"  -->
<logic:present name="cleancccitems"  >
<logic:iterate id="compResult" name="cleancccitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    ICCCertificateItem OB = (ICCCertificateItem)compResult.getObj();

    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }

    String prodDesc= "-";
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
              <td class=<bean:write name="compResult" property="key" />><%=row%></td>
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              <td>
                 <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
                 <br>
                 <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
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
              <integro:currency param="currency" amount="<%= OB.getApprovedLimitAmount() %>" />
              <% if (OB.isInnerLimit()) { %>
                    (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                    <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getApprovalDate())%></td>
              <td>
                <% if (OB.getMaturityDate() == null) { %>
                  -
                <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" /></td>
                <% } %>
              <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getActivatedAmount() %>" />
                <% if (OB.isInnerLimit()) { %>
                    (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
                <% } else { %>
                    <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
                <% } %>
              </td>                           
            </tr>
  </logic:iterate>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (cleanAppAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=cleanAppAmt%>" />
              <%    }%>                
              </td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (cleanActAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=cleanActAmt%>" />
              <%    }%>
              </td>              
            </tr>
</logic:present>
<logic:notPresent name="cleancccitems" >
            <tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
        </td>
    </tr>
<%
    }
    if (cert.getNotCleanCCCertificateItemList() != null)
    {
%>  <tr>
      <td><hr /></td>
    </tr>
    <tr>
       <td>The following require a Partial SCC or an SCC for the Activation of Limits:</td>
    </tr>
    <tr>
      <td>

      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td>S/N</td>
              <td>Limit ID</td>
              <td>Co-borrower LE <br>ID/Name</td>
              <td>Limit Booking Location</td>
              <td>Product Desc</td>
              <td>Outer Limit ID</td>
              <td>Approved Limit</td>
              <td>Approved Date</td>
              <td>Limit Maturity Date</td>
              <td>Limit Amount to be Activated</td>
            </tr>
          </thead>
          <tbody>
<!-- logic:present name="cert"  -->
<!-- logic:iterate id="OB" name="cert"  property="notCleanCCCertificateItemList" type="com.integrosys.cms.app.cccertificate.bus.ICCCertificateItem"  -->
<logic:present name="notcleancccitems"  >
<logic:iterate id="compResult" name="notcleancccitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    ICCCertificateItem OB = (ICCCertificateItem)compResult.getObj();

    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }

    String prodDesc= "-";
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
              <td class=<bean:write name="compResult" property="key" />><%=row%></td>
              <td>&nbsp;<%=OB.getLimitRef()%></td>
              <td>
                  <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
                  <br>
                  <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" /> 
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
                <integro:currency param="currency" amount="<%= OB.getApprovedLimitAmount() %>" />
              <% if (OB.isInnerLimit()) { %>
                    (<integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                    <integro:currency param="amount" amount="<%=OB.getApprovedLimitAmount()%>" />
              <% } %>
              </td>
              <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getApprovalDate())%></td>
              <td>
                <% if (OB.getMaturityDate() == null) { %>
                  -
                <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" /></td>
                <% } %>
              <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getActivatedAmount() %>" />
                <% if (OB.isInnerLimit()) { %>
                    (<integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />)
                <% } else { %>
                    <integro:currency param="amount" amount="<%=OB.getActivatedAmount()%>" />
                <% } %>
              </td>                           
            </tr>
  </logic:iterate>
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (notCleanAppAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=notCleanAppAmt%>" />
              <%    }%>
              </td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">
              <%    if (notCleanActAmt == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=notCleanActAmt%>" />
              <%    }%>
              </td>              
            </tr>
</logic:present>
<logic:notPresent name="notcleancccitems" >
            <tr class="odd">
              <td colspan="9">There is no document</td>
            </tr>
</logic:notPresent>
          </tbody>
        </table>
        </td>
                        </tr>
<%
    }}
%>                      <tr>
                          <td>&nbsp;</td>
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
                            </table></td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                              <thead>
                                <tr>
                                  <td colspan="4" style="text-align:left">Senior Credit Documentation Manager</td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr class="odd">
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"seniorOfficerName")? "fieldname":"fieldnamediff"%>">Name</td>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cert.getSeniorOfficerName()%>" />
                                  </td>
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"seniorOfficerSignNo")? "fieldname":"fieldnamediff"%>">Signing Number</td>
                                  <td width="30%">&nbsp;
                                    <integro:empty-if-null value="<%=cert.getSeniorOfficerSignNo()%>" />
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
                              <tbody>
                                <tr>
                                  <td width="20%" class="fieldname">Remarks</td>
                                  <td width="80%" class="odd"><textarea name="remarks" rows="3" cols="110" /><%=remarks%></textarea></td>
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
                            </table></td>
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
                        <td><a href="#" onclick="approve()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
                        <td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
                        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
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
