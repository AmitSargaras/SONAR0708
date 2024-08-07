<%@ page import="com.integrosys.cms.app.generatereq.trx.IDeferralRequestTrxValue,
                 com.integrosys.cms.app.generatereq.bus.IDeferralRequest,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CommonNatureOfCharge"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    IDeferralRequestTrxValue iTrxValue = (IDeferralRequestTrxValue)session.getAttribute("com.integrosys.cms.ui.genreqdefer.GenerateReqDeferAction.iTrxValue");
    IDeferralRequest deferReq = iTrxValue.getStagingDeferralRequest();

    System.out.println("Trx Vaslue "+iTrxValue);
    if(deferReq!=null){
        pageContext.setAttribute("deferReq",deferReq);
        System.out.println("Tpotal Items --->"+deferReq.getRequestItemList());
    }
    int row = 0;

%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style type="text/css">
.header { font-family:verdana; font-size:18px; color: #017AA7; font-weight:bold;}
</style>


<script language="JavaScript" type="text/JavaScript">
<!--



function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body style="width:100%;overflow:auto;">
<!-- InstanceBeginEditable name="Content" -->
<table width="97%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
    <tr>
      <td><input name="imageField" type="image" src="img/banner.jpg" width="197" height="44" border="0" />
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp; </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="header" align="center">Memorandum - Generate Deferral</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="30%"  class="fieldname">To<br /> </td>
              <td colspan="3">&nbsp;<integro:empty-if-null value="<%=deferReq.getRequestHeader().getRequestTo()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">From<br /> </td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getRequestHeader().getRequestFrom()%>" /></td>
              <td width="20%" class="fieldname">Signing No/COIN No</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getRequestHeader().getSignNo()%>" /></td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Date</td>
              <td colspan="3">&nbsp;<integro:empty-if-null value="<%=deferReq.getRequestHeader().getRequestDate()%>" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="odd">
              <td colspan="2" style="text-align:left">Subject</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%"  class="fieldname">Customer Name</td>
              <td width="80%">&nbsp;<bean:write name="deferReq" property="requestSubject.customerName" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Subject<br /> </td>
              <td>&nbsp;<bean:write name="deferReq" property="requestSubject.subject" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h3>Description</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="4%" rowspan="2">S/N</td>
              <td width="19%" rowspan="2">Limit Type</td>
              <td width="41%" rowspan="2">Approved Limit</td>
              <td width="18%" rowspan="2">Activated Limit</td>
              <td width="18%">As at Date :</td>
            </tr>
            <tr>
              <td>Outstanding Balances Amount</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="deferReq" property="requestDescription" >
   <logic:iterate id="OB" name="deferReq"  property="requestDescription.requestLimitInfoList"  type="com.integrosys.cms.app.generatereq.bus.IRequestLimitInfo" >
 <%

    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
     String prodDesc= "-";
     if(OB.getLimitType()!=null) {
         prodDesc = OB.getLimitType();
         if(prodDesc !=null)
         {
             if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
            prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
         }

     }

 %>
            <tr class="<%=rowClass%>">
              <td class="index">&nbsp;<%=row%></td>
              <td>&nbsp;<integro:empty-if-null value="<%=prodDesc%>" /></td>
              <td class="amount">&nbsp;<integro:currency amount="<%=OB.getApprovedLimitAmt()%>" ></integro:currency></td>
              <td class="amount">&nbsp;<integro:currency amount="<%=OB.getActivatedLimitAmt()%>" ></integro:currency></td>
              <td class="amount">&nbsp;</td>
            </tr>
    </logic:iterate>
</logic:present>
<logic:present  name="deferReq" property="requestDescription"  >
            <tr>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:5px">Total</td>
              <td class="total" style="text-align:right;padding-right:5px">&nbsp;
              <%    if (deferReq.getRequestDescription().getTotalApprovedLimitAmt() == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %> 
                <integro:currency amount="<%=deferReq.getRequestDescription().getTotalApprovedLimitAmt()%>" ></integro:currency>
              <%    }
              %>
              </td>
              <td class="total"style="text-align:right;padding-right:5px">&nbsp;
              <%    if (deferReq.getRequestDescription().getTotalActivatedLimitAmt() == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %> 
                <integro:currency amount="<%=deferReq.getRequestDescription().getTotalActivatedLimitAmt()%>" ></integro:currency>
              <%    }
              %>
              </td>
              <td class="total">&nbsp;</td>
            </tr>
</logic:present>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
<% row=0; %>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="4%">S/N</td>
              <td width="19%">Security Type</td>
              <td width="41%">Nature of Charge</td>
              <td width="18%">Amount</td>
              <td width="18%">Documentation Status</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="deferReq" property="requestDescription" >
   <logic:iterate id="OB1" name="deferReq"  property="requestDescription.requestCollateralInfoList"  type="com.integrosys.cms.app.generatereq.bus.IRequestCollateralInfo" >
 <%

     String rowClass="";
     row++;
     if(row%2!=0){
        rowClass="odd";
     }else{
        rowClass="even";
     }
//     OB.getNatureOfChargeList()
     //OB1.getCollateralType().get

 %>
            <tr class="<%=rowClass%>">
              <td class="index">&nbsp;<%=row%></td>
              <td>&nbsp;<bean:write name="OB1" property="collateralType.typeName" /><br />
                &nbsp;<bean:write name="OB1" property="collateralSubType.subTypeName" /></td>
              <td>
                    <logic:present name="OB1" property="natureOfChargeList" >
                        <logic:iterate id="subOb" name="OB1" property="natureOfChargeList" type="java.lang.String" ><%=CommonNatureOfCharge.getNatureOfChargeDescription(OB1.getCollateralType().getTypeCode(),subOb)%><br />
                        </logic:iterate>
                    </logic:present>&nbsp;
                </td>
              <td class="amount">&nbsp;<integro:currency amount="<%=OB1.getCollateralCMVAmt()%>" ></integro:currency></td>
              <td style="text-align:center">&nbsp;<%=OB1.getCheckListStatus()%></td>
            </tr>

</logic:iterate>
</logic:present>
<logic:present  name="deferReq" property="requestDescription"  >
            <tr>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:5px">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:5px">Total</td>
              <td class="total" style="text-align:right;padding-right:5px">&nbsp;<integro:currency amount="<%=deferReq.getRequestDescription().getTotalCollateralCMVAmt()%>" ></integro:currency></td>
              <td class="total">&nbsp;</td>
            </tr>
</logic:present>
          </tbody>
        </table></td>
    </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h3>Type of Deferral Requested for</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="4%">S/N</td>
              <td width="9%">Doc Code</td>
              <td width="10%">Doc No</td>
              <td width="41%">Doc Description</td>
              <td width="18%">Expiry of Deferment</td>
              <td width="18%">Status</td>
            </tr>
          </thead>
          <tbody>
<%row=0; %>
<logic:present name="deferReq" property="requestItemList" >
   <logic:iterate id="OB2" name="deferReq"  property="requestItemList"  type="com.integrosys.cms.app.generatereq.bus.IRequestItem" >
 <%

     String rowClass="";
     row++;
     if(row%2!=0){
        rowClass="odd";
     }else{
        rowClass="even";
     }
 %>
            <tr class="<%=rowClass%>">
              <td class="index">&nbsp;<%=row%></td>
              <td>&nbsp;<integro:empty-if-null value="<%=OB2.getCheckListItem().getItemCode()%>" /></td>
              <td>&nbsp;<integro:empty-if-null value="<%=String.valueOf(OB2.getCheckListItem().getCheckListItemRef())%>" /></td>
              <td>&nbsp;<integro:empty-if-null value="<%=OB2.getCheckListItem().getItemDesc()%>" /></td>
              <td>&nbsp;<integro:date object="<%=OB2.getCheckListItem().getDeferExpiryDate()%>" /></td>
              <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=OB2.getCheckListItem().getItemStatus()%>" /></td>
            </tr>
    </logic:iterate>
</logic:present>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><h3>Reason / Purpose for Deferral</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td class="odd">
                <integro:wrapper value="<%=deferReq.getReason()%>" lineLength="80" />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Proposed by</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname">Name</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getProposedByName()%>" /></td>
              <td width="20%" class="fieldname">Designation</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getProposedByDesignation()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Signing No</td>
              <td>&nbsp;<integro:empty-if-null value="<%=deferReq.getProposedBySignNo()%>" /></td>
              <td class="fieldname">Date</td>
              <td>&nbsp;<integro:date object="<%=deferReq.getProposedByDate()%>" /> </td>
            </tr>
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
              <td colspan="4" style="text-align:left">Supported by</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname">Name</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getSupportedByName()%>" /></td>
              <td width="20%" class="fieldname">Designation</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getSupportedByDesignation()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">COIN No</td>
              <td>&nbsp;<integro:empty-if-null value="<%=deferReq.getSupportedByCoinNo()%>" /></td>
              <td class="fieldname">Date</td>
              <td>&nbsp;<integro:date object="<%=deferReq.getSupportedByDate()%>" /> </td>
            </tr>
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
              <td colspan="4" style="text-align:left">Approved by</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname">Name</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedBySCOName()%>" /></td>
              <td width="20%" class="fieldname">Designation</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedBySCODesignation()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">COIN No</td>
              <td>&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedBySCOCoinNo()%>" /></td>
              <td class="fieldname">Date</td>
              <td>&nbsp;<integro:date object="<%=deferReq.getApprovedBySCODate()%>" /> </td>
            </tr>
            <tr class="even"> 
              <td class="fieldname" width="20%" height="37">Approval Remarks</td>
              <td width="30%" colspan="3" height="37">&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname">Name</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedByRCOName()%>" /></td>
              <td width="20%" class="fieldname">Designation</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedByRCODesignation()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">COIN No</td>
              <td>&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedByRCOCoinNo()%>" /></td>
              <td class="fieldname">Date</td>
              <td>&nbsp;<integro:date object="<%=deferReq.getApprovedByRCODate()%>" /></td>
            </tr>
            <tr class="even"> 
              <td class="fieldname" width="20%" height="37">Approval Remarks</td>
              <td width="30%" colspan="3" height="37">&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname">Name</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedByCCOName()%>" /></td>
              <td width="20%" class="fieldname">Designation</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getApprovedByCCODesignation()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td>&nbsp;<integro:date object="<%=deferReq.getApprovedByCCODate()%>" /></td>
            </tr>
            <tr class="even"> 
              <td class="fieldname" width="20%" height="37">Approval Remarks</td>
              <td width="30%" colspan="3" height="37">&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" height="22" class="fieldname">Name</td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getName()%>" /></td>
              <td width="20%" class="fieldname">Credit Committee (CCC) </td>
              <td width="30%">&nbsp;<integro:empty-if-null value="<%=deferReq.getCreditCommittee()%>" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Minutes of Meeting </td>
              <td>&nbsp;<integro:empty-if-null value="<%=deferReq.getMinsOfMeeting()%>" /></td>
              <td class="fieldname">Date</td>
              <td>&nbsp;<integro:date object="<%=deferReq.getMeetingDate()%>" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <%@ include file="/template/image_strip2_template.jsp" %>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
