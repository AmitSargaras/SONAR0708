<%@ page import="com.integrosys.cms.app.generatereq.bus.IWaiverRequest,
                 com.integrosys.cms.app.generatereq.bus.IRequestLimitInfo,
                 com.integrosys.base.uiinfra.common.CommonForm,
                 com.integrosys.cms.ui.genreqwaiver.GenerateReqWaiverForm,
                 com.integrosys.cms.app.generatereq.trx.IWaiverRequestTrxValue,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CommonNatureOfCharge"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    IWaiverRequestTrxValue iTrxValue = (IWaiverRequestTrxValue)session.getAttribute("com.integrosys.cms.ui.genreqwaiver.GenerateReqWaiverAction.iTrxValue");
    IWaiverRequest waiverReq = (IWaiverRequest)session.getAttribute("com.integrosys.cms.ui.genreqwaiver.GenerateReqWaiverAction.waiverReq");
    if(waiverReq!=null){
        System.out.println("waiverReq >>>>> "+waiverReq);
        pageContext.setAttribute("waiverReq",waiverReq);
        System.out.println("Tpotal Items --->"+waiverReq.getRequestItemList());
        //waiverReq.getRequestItemList()
    }
    GenerateReqWaiverForm aForm = (GenerateReqWaiverForm)request.getAttribute("GenerateReqWaiverForm");
    IWaiverRequest actualWaiverReq = null;
    if(iTrxValue!=null){
        actualWaiverReq = iTrxValue.getWaiverRequest();
    }

    String remarks = "";
    String lastActionBy = "";
    String status = "";
    if(iTrxValue!=null) {
        status = iTrxValue.getStatus();
        remarks = iTrxValue.getRemarks();
        lastActionBy = iTrxValue.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";


    int row = 0;


%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>




<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="approve";
    document.forms[0].submit();
}

function reject(){
    var test = document.forms[0].remarks.value;
    if( test.length > 250) {
        alert('Remarks field can be only 250 Characters');
        return false;
    }

    document.forms[0].event.value="reject";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/calendarb.gif')">
<html:form action="/GenerateReqWaiver" >
<input type="hidden" name="event" />
<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Process Generate Request for Waiver</h3></td>
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
              <td colspan="2" style="text-align:left">Subject</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%"  class="fieldname">Customer Name</td>
              <td width="80%">&nbsp;<bean:write name="waiverReq" property="requestSubject.customerName" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Subject<br /> </td>
              <td>&nbsp;<bean:write name="waiverReq" property="requestSubject.subject" /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <tbody>
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
<logic:present name="waiverReq" property="requestDescription" >
   <logic:iterate id="OB" name="waiverReq"  property="requestDescription.requestLimitInfoList"  type="com.integrosys.cms.app.generatereq.bus.IRequestLimitInfo" >
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
<logic:present  name="waiverReq" property="requestDescription"  >
            <tr>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:5px">Total</td>
              <td class="total" style="text-align:right;padding-right:5px">&nbsp;
              <%    if (waiverReq.getRequestDescription().getTotalApprovedLimitAmt() == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>     
                <integro:currency amount="<%=waiverReq.getRequestDescription().getTotalApprovedLimitAmt()%>" ></integro:currency>
              <%    }
              %>
              </td>
              <td class="total"style="text-align:right;padding-right:5px">&nbsp;
              <%    if (waiverReq.getRequestDescription().getTotalActivatedLimitAmt() == null)
                    {
              %>
                    Forex Error
              <%    }
                    else
                    {
              %>
                <integro:currency amount="<%=waiverReq.getRequestDescription().getTotalActivatedLimitAmt()%>" ></integro:currency>
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
<logic:present name="waiverReq" property="requestDescription" >
   <logic:iterate id="OB1" name="waiverReq"  property="requestDescription.requestCollateralInfoList"  type="com.integrosys.cms.app.generatereq.bus.IRequestCollateralInfo" >
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
<logic:present  name="waiverReq" property="requestDescription"  >
            <tr>
              <td class="total">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:5px">&nbsp;</td>
              <td class="total" style="text-align:right;padding-right:5px">Total</td>
              <td class="total" style="text-align:right;padding-right:5px">&nbsp;<integro:currency amount="<%=waiverReq.getRequestDescription().getTotalCollateralCMVAmt()%>" ></integro:currency></td>
              <td class="total">&nbsp;</td>
            </tr>
</logic:present>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%row=0;%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Type of Waiver Requested for</h3></td>
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
              <td>Doc Description</td>
              <td width="18%">Status</td>
            </tr>
          </thead>
          <tbody>
<logic:present name="waiverReq" property="requestItemList" >
   <logic:iterate id="OB2" name="waiverReq"  property="requestItemList"  type="com.integrosys.cms.app.generatereq.bus.IRequestItem" >
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
              <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=OB2.getCheckListItem().getItemStatus()%>" /></td>
            </tr>
    </logic:iterate>
</logic:present>
          </tbody>
        </table></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Reason / Purpose for Waiver</h3></td>
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
                <integro:wrapper value="<%=waiverReq.getReason()%>" lineLength="80" />                
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>&nbsp;</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr>
              <td colspan="4" style="text-align:left">Proposed by</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ProposedByName")? "fieldname":"fieldnamediff"%>">Name</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="propName" /></td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ProposedByDesignation")? "fieldname":"fieldnamediff"%>">Designation</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="propDesi" /></td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ProposedBySignNo")? "fieldname":"fieldnamediff"%>">Signing No</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="propSignNo" /></td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ProposedByDate")? "fieldname":"fieldnamediff"%>">Date</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="propDate" /></td>
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
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"SupportedByName")? "fieldname":"fieldnamediff"%>">Name</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="suppName" /></td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"SupportedByDesignation")? "fieldname":"fieldnamediff"%>">Designation</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="suppDesi" /></td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"SupportedByCoinNo")? "fieldname":"fieldnamediff"%>">COIN No</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="suppCoinNo" /></td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"SupportedByDate")? "fieldname":"fieldnamediff"%>">Date</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="suppDate" /></td>
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
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedBySCOName")? "fieldname":"fieldnamediff"%>">Name</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="scoName" /></td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedBySCODesignation")? "fieldname":"fieldnamediff"%>">Designation</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="scoDesi" /></td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedBySCOCoinNo")? "fieldname":"fieldnamediff"%>">COIN No</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="scoCoinNo" /></td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedBySCODate")? "fieldname":"fieldnamediff"%>">Date</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="scoDate" /></td>
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
              <td width="20%" height="22" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedByRCOName")? "fieldname":"fieldnamediff"%>">Name</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="rcoName" /> </td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedByRCODesignation")? "fieldname":"fieldnamediff"%>">Designation</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="rcoDesi" />
              </td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedByRCOCoinNo")? "fieldname":"fieldnamediff"%>">COIN No</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="rcoCoinNo" /> </td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedByRCODate")? "fieldname":"fieldnamediff"%>">Date</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="rcoDate"  /></td>
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
              <td width="20%" height="22" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedByCCOName")? "fieldname":"fieldnamediff"%>">Name</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="ccoName" /> </td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedByCCODesignation")? "fieldname":"fieldnamediff"%>">Designation</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="ccoDesi" />
              </td>
            </tr>
            <tr class="even">
              <td width="20%" class="fieldname">&nbsp;</td>
              <td width="30%">&nbsp;</td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"ApprovedByCCODate")? "fieldname":"fieldnamediff"%>">Date</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="ccoDate" /></td>
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
              <td width="20%" height="22" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"Name")? "fieldname":"fieldnamediff"%>">Name</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="appName" /> </td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"CreditCommittee")? "fieldname":"fieldnamediff"%>">Credit Committee (CCC)</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="creditCommittee" />
              </td>
            </tr>
            <tr class="even">
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"MinsOfMeeting")? "fieldname":"fieldnamediff"%>">Minutes of Meeting</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="meetingMinutes" />
              </td>
              <td width="20%" class="<%=CompareOBUtil.compOB(waiverReq,actualWaiverReq,"MeetingDate")? "fieldname":"fieldnamediff"%>">Date</td>
              <td width="30%">&nbsp;<bean:write name="GenerateReqWaiverForm"  property="meetingDate"  /></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<p>
<p>
<p>
<p>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                              <tbody>
                                <tr>
                                  <td width="20%" class="fieldname">Remarks</td>
                                  <td width="80%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
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
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
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
