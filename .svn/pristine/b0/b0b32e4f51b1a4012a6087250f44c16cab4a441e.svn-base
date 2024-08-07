<%@ page import="com.integrosys.cms.app.cccertificate.trx.ICCCertificateTrxValue,
                 com.integrosys.cms.app.cccertificate.bus.ICCCertificate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.sccertificate.trx.ISCCertificateTrxValue,
                 com.integrosys.cms.app.limit.bus.ICollateralAllocation,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.sccertificate.trx.IPartialSCCertificateTrxValue,
                 com.integrosys.cms.app.sccertificate.bus.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.lang.reflect.Array,
                 com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	try {
    IPartialSCCertificateTrxValue certTrxVal = (IPartialSCCertificateTrxValue)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.certTrxVal");

    IPartialSCCertificate cert = (IPartialSCCertificate)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.cert");
    ISCCertificateCustomerDetail custDetail = (ISCCertificateCustomerDetail)session.getAttribute("com.integrosys.cms.ui.genpscc.GeneratePSCCAction.custDetail");
    if(custDetail!=null){
        pageContext.setAttribute("custDetail",custDetail);
    }
    if(cert!=null) {
        DefaultLogger.debug(this,"Certifiacete"+cert.getPartialSCCItemList().length);
        pageContext.setAttribute("cert",cert);
    }
    IPartialSCCertificate actCert = certTrxVal.getPartialSCCertificate();          
    //IPartialSCCertificate stgCert = certTrxVal.getStagingPartialSCCertificate();

    String userRemarks = request.getParameter("remarks");
	if (userRemarks == null) userRemarks = "";
    
	String remarks = "";
    String lastActionBy = "";
    String status = "";
	if(certTrxVal!=null) {
        status = certTrxVal.getStatus();
        remarks = certTrxVal.getRemarks();
        lastActionBy = certTrxVal.getUserInfo();
	}
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    int row = 0;

    Amount appAmt = null;
    Amount actAmt = null;
    if(cert!=null){
        appAmt = cert.getTotalApprovalAmount();
        actAmt = cert.getTotalActivatedAmount();
    }

    IPartialSCCertificateItem arrayActual[] = null;
    IPartialSCCertificateItem arrayStaging[] = null;
    if(certTrxVal.getPartialSCCertificate()==null){
        DefaultLogger.debug(this, "Array Actual is null");
        arrayActual = null;
    }else{
        arrayActual = certTrxVal.getPartialSCCertificate().getPartialSCCItemList();
        DefaultLogger.debug(this, "Array Length actual"+arrayActual.length);
    }
    if(certTrxVal.getStagingPartialSCCertificate()!=null) {
        arrayStaging = certTrxVal.getStagingPartialSCCertificate().getPartialSCCItemList();
	      if (arrayStaging != null) {
	        DefaultLogger.debug(this, "Array Length staging" + arrayStaging.length);
		      if (arrayActual == null) {
			      // copy arrayStaging to arrayActual and set the activated amount of each sc item to null
			      arrayActual = new IPartialSCCertificateItem[arrayStaging.length];
			      DefaultLogger.debug(this, "copied arrayStaging to arrayActual");
			      for (int i=0; i<arrayStaging.length; i++) {
				      arrayActual[i] = (IPartialSCCertificateItem) arrayStaging[i].clone();
			      }
			      /*** CMSSP-586, CMSSP-617 To solve show blank in PSCC when new Limit Add in Before PSCC approved
			      for (int i = 0; arrayActual != null && i < arrayActual.length; i++) {
				      IPartialSCCertificateItem actualItem = arrayActual[i];
				      if (actualItem != null) {
					      String currencyCode = actualItem.getActivatedAmount().getCurrencyCode();
					      actualItem.setActivatedAmount(new Amount(0, currencyCode));
				      }
			      }***/
		      }
	      }
    }

    List res = null;
    //if(!(arrayStaging == null && arrayActual == null)) {
	    res = CompareOBUtil.compOBArray(arrayStaging,arrayActual);
	    DefaultLogger.debug(this, "comparing arrayStaging with arrayActual");
    //}

    
    ArrayList list = null;
    if(res!=null) {
        list = new ArrayList(res);
    }
    if(list!=null)
        pageContext.setAttribute("psccitems",list);
        /*
        System.out.println("Chee Hong Debug : " + list.size());
        int i = 0;
        for (java.util.Iterator itr = list.iterator(); itr.hasNext(); i++) {
            //System.out.println("Chee Hong Obj : " + itr.next());
            com.integrosys.base.techinfra.diff.CompareResult cr = (com.integrosys.base.techinfra.diff.CompareResult) itr.next();
            IPartialSCCertificateItem ob = (IPartialSCCertificateItem)cr.getObj();
            System.out.println("Chee Hong Obj " + i + " : " + ob.toString());
        }
        */

        //R1.5 CR146 Starts ------------------------------
        Amount cleanAppAmt = null;
        Amount notCleanAppAmt = null;
        Amount cleanActAmt = null;
        Amount notCleanActAmt = null;
        if (false) {//DISABLE THIS
        //Amount cleanAppAmt = null;
        //Amount notCleanAppAmt = null;
        //Amount cleanActAmt = null;
        //Amount notCleanActAmt = null;

        if(cert!=null){
            cleanAppAmt = cert.getCleanApprovalAmount();
            notCleanAppAmt = cert.getApprovalAmount();
            cleanActAmt = cert.getCleanActivatedAmount();
            notCleanActAmt = cert.getActivatedAmount();
        }


        IPartialSCCertificateItem arrayActualClean[] = null;
        IPartialSCCertificateItem arrayActualNotClean[] = null;
        IPartialSCCertificateItem arrayStagingClean[] = null;
        IPartialSCCertificateItem arrayStagingNotClean[] = null;

        if(actCert != null){
            arrayActualClean = actCert.getCleanPSCCItemList();
            arrayActualNotClean= actCert.getNotCleanPSCCItemList();
        }
        if(cert != null) {
            arrayStagingClean= cert.getCleanPSCCItemList();
            arrayStagingNotClean = cert.getNotCleanPSCCItemList();
        }

        List cleanRes = null;
        List notCleanRes = null;
        if(!(arrayStagingClean == null && arrayActualClean == null)) {
            cleanRes = CompareOBUtil.compOBArray(arrayStagingClean,arrayActualClean);
            /*if (arrayActualNotClean == null)
              cleanRes = CompareOBUtil.compOBArray(arrayStagingClean,arrayStagingClean);
            else
              cleanRes = CompareOBUtil.compOBArray(arrayStagingClean,arrayActualClean);*/
        }

        if(!(arrayStagingNotClean == null && arrayActualNotClean == null)) {
            notCleanRes = CompareOBUtil.compOBArray(arrayStagingNotClean,arrayActualNotClean);
            /*if (arrayActualNotClean == null) {
              notCleanRes = CompareOBUtil.compOBArray(arrayStagingNotClean,arrayStagingNotClean);
            } else {
              notCleanRes = CompareOBUtil.compOBArray(arrayStagingNotClean,arrayActualNotClean);
            }*/
        }

        ArrayList cleanList = null;
        ArrayList notCleanList = null;

        if(cleanRes!=null)
            cleanList = new ArrayList(cleanRes);

        if(notCleanRes!=null)
            notCleanList = new ArrayList(notCleanRes);

        if(cleanList!=null)
            pageContext.setAttribute("cleanpsccitems",cleanList);

        if(notCleanList!=null)
            pageContext.setAttribute("notcleanpsccitems",notCleanList);
        }
        //R1.5 CR146 Ends ------------------------------------------------

    String creditgrade = null;
    String creditGradeName = "-";

    if(custDetail!=null) {
        creditgrade = custDetail.getCreditGrade().getCGCode();
        if (creditgrade != null) {
            creditGradeName = CommonDataSingleton.getCodeCategoryLabelByValue("19", creditgrade.toString());
        }
    }
    CountryList cList = CountryList.getInstance();
    //Chee Hong TODO : Refix this later
    String[] temp = {};
    OrgCodeList orgList = OrgCodeList.getInstance(temp);

        //Additional Table
        boolean selAll = true;                                          
        String _selAll = "";
        String _hasCheck1 = "checked";
        String _hasCheck2 = "checked";
        String _hasCheck3 = "checked";
        String _hasCheck4 = "checked";
                                        
        //if (aForm.getHasCheck1() == null) {selAll = false;_hasCheck1 = "";}
        //else {
            if (cert.getHasCheck1() == 'N') {selAll = false;_hasCheck1 = "";}
        //}

        //if (aForm.getHasCheck2() == null) {selAll = false;_hasCheck2 = "";}
        //else {
            if (cert.getHasCheck2() == 'N') {selAll = false;_hasCheck2 = "";}
        //}

        //if (aForm.getHasCheck3() == null) {selAll = false;_hasCheck3 = "";}
        //else {
            if (cert.getHasCheck3() == 'N') {selAll = false;_hasCheck3 = "";}
        //}

        //if (aForm.getHasCheck4() == null) {selAll = false;_hasCheck4 = "";}
        //else {
            if (cert.getHasCheck4() == 'N') {selAll = false;_hasCheck4 = "";}
        //}

        _selAll = selAll ? "checked" : "";

        String globalCurrency = "";
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

//-->
</script>


</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="MM_preloadImages('img/approve2.gif','img/reject2.gif','img/cancel2.gif')">
<html:form action="GeneratePSCC" >
<input type="hidden" name="actionName" value="GeneratePSCC"/>
<input type="hidden" name="outerLimitID"/>
<input type="hidden" name="limitID"/>
<input type="hidden" name="outerLimitProfileID"/>

<input type="hidden" name="event" />
<%--<p class="required"><font color="#0000FF">*</font>Mandatory for Submission&nbsp;</p><br>--%>
<!-- InstanceBeginEditable name="menuScript" --> <!-- InstanceEndEditable -->
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td><h3>Process - Partial SCC</h3></td>
                        </tr>
                        <tr>
                          <td><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <thead>
                                <tr class="odd">
                                  <td colspan="4" style="text-align:left">Customer Details</td>
                                </tr>
                              </thead>
                              <tbody>
                                <!--
                                <tr class="odd">
                                  <td height="22" class="fieldname">LE ID<br />
                                  </td>
                                  <td><bean:write name="custDetail" property="legalID"  />&nbsp;</td>
                                  <td class="fieldname">Legal Name</td>
                                  <td><bean:write name="custDetail" property="legalName"  />&nbsp;</td>
                                </tr>
                                -->
                                <tr class="even">
                                  <!--
                                  <td class="fieldname">Customer Gategory</td>
                                  <td>???&nbsp;</td>
                                  -->
                                  <td class="fieldname">Customer Name<br /> </td>
                                  <td><bean:write name="custDetail" property="customerName"  />&nbsp;</td>
                                  <!--
                                  <td class="fieldname">Sub-Profile ID</td>
								  <td><bean:write name="custDetail" property="customerReference" />&nbsp;</td>
								  -->
                                </tr>
                                <tr class="odd">
                                    <td class="fieldname">CIF No</td>
                                    <td>
                                        <%
                                            String cifNo = (custDetail != null && !custDetail.getLegalID().equals("0")) ? custDetail.getLegalID() : "";
                                            out.println(cifNo);
                                        %>
                                    </td>
                                </tr>
                                <!--
                                <tr class="odd">
                                  <td class="fieldname">Internal Credit Grade</td>
                                  <td><integro:empty-if-null value="<%=creditGradeName%>"/>&nbsp;</td>
                                  <td class="fieldname">Customer BFL Issued<br>Date</td>
                                    <%
                                        if (custDetail.getFinalBFLIssuedDate() != null)
                                        {
                                    %>
                                                  <td><%=DateUtil.formatDate("dd/MMM/yyyy",custDetail.getFinalBFLIssuedDate())%></td>
                                    <%  }
                                        else
                                        {
                                    %>
                                                  <td>-</td>
                                    <%  }
                                    %>                                               
                                </tr>
                                -->
                                <!--
                                <tr class="even">
                                  <td class="fieldname">FAM</td>
                                  <%
                                  //String fam = custDetail.getFamCode() + ", " + custDetail.getFamName();
                                   String famCode =  (custDetail.getFamCode() != null)?  custDetail.getFamCode() :"-";
                                   String famName =  (custDetail.getFamName() != null)?  custDetail.getFamName() :"-";
                                   String fam = famCode + ", " + famName ;
                                  %>
                                  <td><integro:empty-if-null value="<%=fam %>" /></td>
                                  <td class="fieldname">PSCC Ref. No.</td>
                                  <td><%=custDetail.getLegalID()%>/<%= cert.getSCCertRef()%></td>
                                </tr>
                                -->
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                    <%
                        if (false) {
                        if (cert.getCleanPSCCItemList() != null)
                        {
                            System.out.println("Clean Item List is not null - Size: " + cert.getCleanPSCCItemList().length);
                            System.out.println("Product Description: " + (cert.getCleanPSCCItemList())[0].getProductDesc());
                    %>
                      <thead>
                        <tr>
                          <td><h3>&nbsp;</h3></td>
                        </tr>
                        <tr>
                          <td><hr /></td>
                        </tr>
                        <!--
                        <tr>
                          <td>The following are Un-Secured Limits:</td>
                        </tr>
                        -->
                      </thead>
                      <tbody>
                        <tr>
                          <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td>S/N</td>
                                  <td>Limit ID</td>
                                  <td>Co-borrower LE <br>ID/Name</td>
                                  <td>Limit Booking Location</td>
                                  <td>Product Desc</td>
								  <td>Outer Limit ID</td>
                                  <td>Approved Limit</td>
                                  <td>SCC Limit Amount to be Activated</td>
                                  <td>Limit Maturity Date</td>
                                  <td>Issue Partial SCC</td>
                                </tr>
                              </thead>
                              <tbody>
<%-- <logic:present name="psccitems"  >
   <logic:iterate id="compResult" name="psccitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >
--%>
<logic:present name="cleanpsccitems"  >
   <logic:iterate id="compResult" name="cleanpsccitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
    IPartialSCCertificateItem OB = (IPartialSCCertificateItem)compResult.getObj();
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

    boolean hasCollateral = (OB.getCollateralAllocations() == null) || (OB.getCollateralAllocations().length == 0);
   %>
        <tr class="<%=rowClass%>">
              <td class='<bean:write name="compResult" property="key" />' ><%=row%></td>
              <td><%=OB.getLimitRef()%></td>
              <td>
              <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
              <br>
              <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
              </td>
              <td><%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>
              <td><%=prodDesc%></td>
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
                (<integro:currency param="amount" amount="<%= OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%= OB.getApprovedLimitAmount()%>" />
              <% }%>
              </td>
              <td class="amount">
              <integro:currency param="currency" amount="<%= OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                (<integro:currency param="amount" amount="<%= OB.getActivatedAmount()%>" />)
              <% } else { %>
                <integro:currency param="amount" amount="<%= OB.getActivatedAmount()%>" />
              <% } %>
              </td>
              <td><% if (OB.getMaturityDate() == null) { %>
                    -
                  <% } else { %>
                  <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
              </td>
              <%-- if(hasCollateral) { %>
              <td width="12%"><logic:iterate id="temp0" name="compResult" property="obj.collateralAllocations" ><%=((ICollateralAllocation)temp0).getCollateral().getSCISecurityID() %><br></logic:iterate></td>
              <td width="12%"><logic:iterate id="temp1" name="compResult" property="obj.collateralAllocations" ><bean:write name="temp1" property="collateral.collateralType.typeName" /><br></logic:iterate></td>              
              <% } else { --%>
              <%-- } --%>
              <td style="text-align:center" width="12%">
                <input name="checkbox" disabled type="checkbox" value="checkbox" 
                <%  if (OB.getIsPartialSCCIssued()) 
                    {
                %>
                checked 
                <%  }%>
                />
            </tr>
</logic:iterate>
            <!--
            <tr class="odd">
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:3px">Total</td>
              <td class="total" style="text-align:right;padding-right:3px">&nbsp;
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
              <td class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
            </tr>
            -->
</logic:present>
<logic:notPresent name="cleanpsccitems" >
            <tr class="odd">
              <td colspan="10">There is no document</td>
            </tr>
</logic:notPresent>
             </tbody>
            </table></td>
        </tr>
<% }
}//disabled the clean item....JOIN it back without differentiate CLEAN and UNCLEAN

    //if(cert.getNotCleanPSCCItemList() != null) {
    if (cert.getPartialSCCItemList() != null) {
      row=0;
      //System.out.println("Not Clean Item List is not null - Size: " + cert.getNotCleanPSCCItemList().length);
      System.out.println("Partial SCC Item List is not null - Size: " + cert.getPartialSCCItemList().length);

%>
                        <thead>
                          <tr>
                            <td><h3>&nbsp;</h3></td>
                          </tr>
                          <tr>
                            <td><hr /></td>
                          </tr>
                          <!--
                          <tr>
                            <td>The following are Secured Limits:</td>
                          </tr>
                          -->
                        </thead>
                        <tbody>
                          <tr>
                            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                <thead>
                                  <!--
                                  <tr>
                                    <td>S/N</td>
                                    <td>Limit ID</td>
                                    <td>Co-borrower LE <br>ID/Name</td>
                                    <td>Limit Booking Location</td>
                                    <td>Product Desc</td>
                                    <td>Outer Limit ID</td>
                                    <td>Approved Limit</td>
                                    <td>SCC Limit Amount to be Activated</td>
                                    <td>Limit Maturity Date</td>
                                    <td>Security ID</td>
                                    <td>Security<br>Type</td>
                                    <td>Issue Partial SCC</td>
                                  </tr>
                                  -->
                                    <tr>
                                        <td>S/N</td>
                                        <td>Outer Limit ID</td>
                                        <td>Limit ID</td>
                                        <td>Source Security ID</td>
                                        <td>Security Type / Sub-Type</td>
                                        <td>Product Description</td>
                                        <td>Approved Limit</td>
                                        <td>Expiry of Availability Period</td>
                                        <td>Disbursement Amount</td>
                                        <td>Amount Enforced Todate</td>
                                        <td>Issue Partial SCC</td>
                                        <td>Payment Instruction</td>
                                    </tr>
                                </thead>
                                <tbody>
 <logic:present name="psccitems"  >
   <logic:iterate id="compResult" name="psccitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >

  <%--
  <logic:present name="notcleanpsccitems"  >
     <logic:iterate id="compResult" name="notcleanpsccitems" type="com.integrosys.base.techinfra.diff.CompareResult"  >
  --%>
<%
      IPartialSCCertificateItem OB = (IPartialSCCertificateItem)compResult.getObj();
      //System.out.println(OB.toString());
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

    //String paymentInstruc = OB.getPaymentInstruction() == null ? "" : OB.getPaymentInstruction();
   %>
          <tr class="<%=rowClass%>">
                <!--S/N-->
                <td class='<bean:write name="compResult" property="key" />' ><%=row%></td>
                <!--Outer Limit ID-->
                <td <%=!OB.getIsInnerOuterSameBCA()?"class=outerlimit":" "%>>
              <% if (!OB.getIsInnerOuterSameBCA()) { %>
                    <a href="#" onclick="viewDiffOuterLimitBca('<%=OB.getOuterLimitID()%>', '<%=OB.getLimitID()%>', '<%=OB.getOuterLimitProfileID()%>' )" >
              <% } %>
              <%=(OB.getOuterLimitRef()==null || OB.getOuterLimitRef().equals("0")) ? "-" : OB.getOuterLimitRef()%>
              <% if (!OB.getIsInnerOuterSameBCA()) { %> </a> <% } %>
                </td>
                <!--Limit ID-->
                <td><%=OB.getLimitRef()%></td>
                <!--Security ID-->
                <td width="12%"><logic:iterate id="temp0" name="compResult" property="obj.collateralAllocations" ><%=((ICollateralAllocation)temp0).getCollateral().getSCISecurityID() %><br></logic:iterate></td>
                <!--Security<br>Type-->
                <td width="12%"><logic:iterate id="temp1" name="compResult" property="obj.collateralAllocations" ><bean:write name="temp1" property="collateral.collateralType.typeName" /><br></logic:iterate></td>
                <!--Product Desc-->
                <td><%=prodDesc%></td>
                <!--Approved Limit-->
                <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getApprovedLimitAmount() %>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%= OB.getApprovedLimitAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%= OB.getApprovedLimitAmount()%>" />
              <% }%>
                </td>
                <!--Expiry of Availability Period-->
                <td><% if (OB.getExpiryAvailabilityDate() == null) { %>
                      -
                  <% } else { %>
                    <integro:date object="<%= OB.getExpiryAvailabilityDate() %>" />
                  <% } %>
                </td>
                <!--Disbursement Amount-->
                <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getDisbursementAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%= OB.getDisbursementAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%= OB.getDisbursementAmount()%>" />
              <% } %>
                </td>
                <!--Amount Enforced Todate-->
                <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getEnforceAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%= OB.getEnforceAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%= OB.getEnforceAmount()%>" />
              <% } %>
                </td>
                <!--Issue Partial SCC-->
                <td style="text-align:center" width="12%">
                  <input name="checkbox" disabled type="checkbox" value="checkbox"
                <%  if (OB.getIsPartialSCCIssued()) {%>
                  checked
                <%  }%>
                  />
                <!--Payment Instruction-->
                <td>
                    <%--<%=paymentInstruc%>--%>
                    <integro:empty-if-null value="<%=OB.getPaymentInstruction()%>" />
                </td>
                <!--Co-borrower LE <br>ID/Name-->
                <!--
                <td>
                <integro:empty-if-null value="<%=OB.getCoBorrowerLegalID()%>" />&nbsp;
                <br>
                <integro:empty-if-null value="<%=OB.getCoBorrowerName()%>" />
                </td>
                -->
                <!--Limit Booking Location-->
                <!--<td><%=cList.getCountryName(OB.getLimitBookingLocation().getCountryCode())%> - <%= OB.getLimitBookingLocation().getOrganisationCode()%></td>-->
                <!--SCC Limit Amount to be Activated-->
                <!--
                <td class="amount">
                <integro:currency param="currency" amount="<%= OB.getActivatedAmount()%>" />
              <% if (OB.isInnerLimit()) { %>
                  (<integro:currency param="amount" amount="<%= OB.getActivatedAmount()%>" />)
              <% } else { %>
                  <integro:currency param="amount" amount="<%= OB.getActivatedAmount()%>" />
              <% } %>
                </td>
                -->
                <!--Limit Maturity Date-->
                <!--
                <td><% if (OB.getMaturityDate() == null) { %>
                      -
                  <% } else { %>
                    <integro:date object="<%= OB.getMaturityDate() %>" />
                  <% } %>
                </td>
                -->
              </tr>
  </logic:iterate>
              <!--
              <tr class="odd">
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total" style="text-align:right;padding-right:3px">Total</td>
                <td class="total" style="text-align:right;padding-right:3px">&nbsp;
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
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
                <td class="total">&nbsp;</td>
              </tr>
              -->
  </logic:present>
  <logic:notPresent name="psccitems" >
              <tr class="odd">
                <td colspan="12">There is no document</td>
              </tr>
  </logic:notPresent>
               </tbody>
              </table></td>
          </tr>
<% } %>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <!--Additional Table Here-->
                        <tr>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                                    <thead>
                                        <TR>
                                            <TD style="TEXT-ALIGN: left" colSpan="7">
                                                Other Requirements (As indicated by <SPAN style="TEXT-ALIGN: center"><INPUT value="checkbox" CHECKED type="checkbox" disabled="true"></SPAN>below)
                                            </TD>
                                        </TR>
                                        <TR>
                                            <TD width="2%">S/N</TD>
                                            <TD width="12%">
                                                Select (<SPAN style="TEXT-ALIGN: center"> <INPUT value="checkbox" type="checkbox" <%=_selAll%> disabled="true"></SPAN>)
                                            </TD>
                                            <TD width="86%">Item</TD>
                                        </TR>
                                    </thead>
                                    <tbody>
                                        <TR class="odd">
                                            <TD class="index">1</TD>
                                            <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck1" <%=_hasCheck1%> value="Y" disabled="true"></TD>
                                            <TD>
                                                <P>
                                                    <STRONG>Fire Insurance Cover </STRONG>
                                                    <BR><%Amount insuredWithAmt = new Amount(cert.getInsuredWithAmt(), new CurrencyCode("MYR"));%>
                                                    a) To insured with <SPAN class="amount"><integro:empty-if-null value="<%=cert.getInsuredWith()%>"/></SPAN> MYR <SPAN
                                                        class="amount"><integro:currency param="amount" amount="<%=insuredWithAmt%>"/><BR></SPAN>
                                                    b) M/Policy, endorse Mortgagee clause AMBM <SPAN class="amount"><integro:empty-if-null value="<%=cert.getAmbm()%>"/></SPAN> Expiry <SPAN
                                                        style="TEXT-ALIGN: center"><%
                                                                                    if (cert.getExpiry() == null) out.println("-");
                                                                                    else {
                                                                                        %><integro:date object="<%=cert.getExpiry()%>"/><%
                                                                                    }
                                                                                    %></SPAN>
                                                </P>
                                            </TD>
                                        </TR>
                                        <TR class="even">
                                            <TD class="index">2</TD>
                                            <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck2" <%=_hasCheck2%> value="Y" disabled="true"></TD>
                                            <TD>
                                                <P><STRONG>Advice to Branch on creation of Sinking Fund </STRONG><BR><%Amount sinkFundAmt = new Amount(cert.getSinkFundAmt(), new CurrencyCode("MYR"));%>Sinking
                                                    Fund of MYR <SPAN class="amount"><integro:currency param="amount" amount="<%=sinkFundAmt%>"/> </SPAN>p.m
                                                    for
                                                    period of <SPAN class="amount"><integro:empty-if-null value="<%=cert.getPmForPeriodOf()%>"/> </SPAN>commencing
                                                    from <SPAN class="amount"><integro:empty-if-null value="<%=cert.getCommencingFrom()%>"/> </SPAN>until<%Amount fundReachAmt = new Amount(cert.getFundReach(), new CurrencyCode("MYR"));%>
                                                    the fund reaches MYR <SPAN class="amount"><integro:currency param="amount" amount="<%=fundReachAmt%>"/> </SPAN>
                                                </P></TD>
                                        </TR>
                                        <TR class="odd">
                                            <TD class="index">3</TD>
                                            <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck3" <%=_hasCheck3%> value="Y" disabled="true"></TD>
                                            <TD>
                                                <P><STRONG>Fees </STRONG><BR>To debit set-up fee MYR <SPAN
                                                        class="amount"><%Amount feesAmt = new Amount(cert.getFeesAmt(), new CurrencyCode("MYR"));%><integro:currency param="amount" amount="<%=feesAmt%>"/> </SPAN></P></TD>
                                        </TR>
                                        <TR class="even">
                                            <TD class="index" height="52">4</TD>
                                            <TD style="TEXT-ALIGN: center"><INPUT type="checkbox" name="hasCheck4" <%=_hasCheck4%>  value="Y" disabled="true"></TD>
                                            <TD>
                                                <P><STRONG>Others </STRONG><BR><integro:empty-if-null value="<%=cert.getOthers()%>"/></P>

                                                <P></P></TD>
                                        </TR>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><hr /></td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                              <thead>
                                <tr>
                                  <td colspan="4" style="text-align:left">Authorised Personnel 1</td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr class="odd">
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"creditOfficerName")? "fieldname":"fieldnamediff"%>" >Name<%--&nbsp;<font color="#0000FF">* </font>--%></td>
                                  <td width="30%">
                                    <integro:empty-if-null value="<%=cert.getCreditOfficerName()%>" />                                     
                                  </td>
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"creditOfficerSignNo")? "fieldname":"fieldnamediff"%>" >Signing Number<%--&nbsp;<font color="#0000FF">* </font>--%></td>
                                  <td width="30%">
                                    <integro:empty-if-null value="<%=cert.getCreditOfficerSignNo()%>" />
                                  </td>
                                </tr>
                                <!--
                                <tr class="even">
                                <%  if (actCert != null)
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getCreditOfficerLocation(),actCert.getCreditOfficerLocation(),"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }
                                    else
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getCreditOfficerLocation(),null,"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }%>
                                  <td width="30%">
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
                                  <td width="30%">
                                    <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getCreditOfficerLocation().getOrganisationCode())%>" />
                                  </td>
                                </tr>
                                -->
                              </tbody>
                            </table></td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                              <thead>
                                <tr>
                                  <td colspan="4" style="text-align:left">Authorised Personnel 2</td>
                                </tr>
                              </thead>
                              <tbody>
                                <tr class="odd">
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"seniorOfficerName")? "fieldname":"fieldnamediff"%>">Name</td>
                                  <td width="30%">
                                    <integro:empty-if-null value="<%=cert.getSeniorOfficerName()%>" />
                                  </td>
                                  <td width="20%" class="<%=CompareOBUtil.compOB(cert,actCert,"seniorOfficerSignNo")? "fieldname":"fieldnamediff"%>">Signing Number</td>
                                  <td width="30%">
                                    <integro:empty-if-null value="<%=cert.getSeniorOfficerSignNo()%>" />
                                  </td>
                                </tr>
                                <!--
                                <tr class="even">
                                <%  if (actCert != null)
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getSeniorOfficerLocation(),actCert.getSeniorOfficerLocation(),"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }
                                    else
                                    {
                                %><td width="20%" class="<%=CompareOBUtil.compOB(cert.getSeniorOfficerLocation(),null,"countryCode")? "fieldname":"fieldnamediff"%>" >Location Country</td>
                                <%  }%>
                                  <td width="30%">
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
                                  <td width="30%">
                                    <integro:empty-if-null value="<%=orgList.getOrgCodeLabel(cert.getSeniorOfficerLocation().getOrganisationCode())%>" />
                                  </td>
                                </tr>
                                -->
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
                                  <td width="80%" class="odd"><textarea name="remarks" rows="3" cols="110"><%=remarks%></textarea></td>
                                </tr>
                                <tr>
                                  <td class="fieldname">Last Action By</td>
                                  <td class="even"><%=lastActionBy%></td>
                                </tr>
                                <tr class="odd">
                                  <td class="fieldname">Last Remarks Made</td>
                                  <td><integro:wrapper value="<%=remarks%>" lineLength="98"/>&nbsp;</td>
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
<%
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
