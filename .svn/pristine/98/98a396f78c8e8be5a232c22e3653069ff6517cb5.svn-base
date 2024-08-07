<%@ page import="com.integrosys.cms.app.generatereq.bus.IWaiverRequest,
                 com.integrosys.cms.app.generatereq.bus.IRequestLimitInfo,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.generatereq.trx.IWaiverRequestTrxValue,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CommonNatureOfCharge"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    IWaiverRequestTrxValue iTrxValue = (IWaiverRequestTrxValue)session.getAttribute("com.integrosys.cms.ui.genreqwaiver.GenerateReqWaiverAction.iTrxValue");
    IWaiverRequest waiverReq = (IWaiverRequest)session.getAttribute("com.integrosys.cms.ui.genreqwaiver.GenerateReqWaiverAction.waiverReq");

//    System.out.println("Trx Vaslue "+iTrxValue);
    if(waiverReq!=null){
        pageContext.setAttribute("waiverReq",waiverReq);
        System.out.println("Tpotal Items --->"+waiverReq.getRequestItemList());
        //waiverReq.getRequestItemList()
    }
    int row = 0;

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

function submitForm() {
	document.forms[0].event.value="submit";
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
      <td><h3>Generate Request for Waiver</h3></td>
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
              <td class="total" style="text-align:right;padding-right:5px">&nbsp;
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
     System.out.println("Nature of charge --list--->"+OB1.getNatureOfChargeList());
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
<% row=0; %>
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
                  <html:textarea property="waiverReason"  rows="6" cols="80"/>
                  <html:errors property="waiverReason" />
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
              <td class="fieldname">Name</td>
              <td><html:text property="propName" maxlength="30" /><html:errors property="propName" /></td>
              <td class="fieldname">Designation</td>
              <td><html:text property="propDesi" maxlength="30" /><html:errors property="propDesi" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">Signing No</td>
              <td><html:text property="propSignNo"  maxlength="10"/><html:errors property="propSignNo" /></td>
              <td class="fieldname">Date</td>
              <td><html:text property="propDate" size="12" maxlength="11"  readonly="true"/><html:errors property="propDate" />
                <img src="img/calendara.gif"  name="Image11" border="0" id="Image1" onclick="return showCalendar('propDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" />
              </td>
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
              <td class="fieldname">Name</td>
              <td><html:text property="suppName" maxlength="30"  /></td>
              <td class="fieldname">Designation</td>
              <td><html:text property="suppDesi" maxlength="30"  /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">COIN No</td>
              <td><html:text property="suppCoinNo" maxlength="10"/></td>
              <td class="fieldname">Date</td>
              <td><html:text property="suppDate" size="12" maxlength="11"  readonly="true"/>
                <img src="img/calendara.gif"  name="Image111" border="0" id="Image1" onclick="return showCalendar('suppDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image111','','img/calendarb.gif',1)" />
              </td>
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
              <td class="fieldname">Name</td>
              <td><html:text property="scoName"  maxlength="30" /></td>
              <td class="fieldname">Designation</td>
              <td><html:text property="scoDesi"  maxlength="30" /></td>
            </tr>
            <tr class="even">
              <td class="fieldname">COIN No</td>
              <td><html:text property="scoCoinNo"   maxlength="10"/></td>
              <td class="fieldname">Date</td>
              <td><html:text property="scoDate" size="12" maxlength="11"  readonly="true"/>
                <img src="img/calendara.gif"  name="Image112" border="0" id="Image1" onclick="return showCalendar('scoDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image112','','img/calendarb.gif',1)" />
              </td>
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
              <td height="22" class="fieldname">Name</td>
              <td><html:text property="rcoName"  maxlength="30" /> </td>
              <td class="fieldname">Designation</td>
              <td><html:text property="rcoDesi"  maxlength="30" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">COIN No</td>
              <td><html:text property="rcoCoinNo"   maxlength="10"/> </td>
              <td class="fieldname">Date</td>
              <td><html:text property="rcoDate" size="12" maxlength="11"  readonly="true"/>
                <img src="img/calendara.gif"  name="Image1121" border="0" id="Image1" onclick="return showCalendar('rcoDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image1121','','img/calendarb.gif',1)" />
              </td>
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
              <td height="22" class="fieldname">Name</td>
              <td><html:text property="ccoName"  maxlength="30" /> </td>
              <td class="fieldname">Designation</td>
              <td><html:text property="ccoDesi"  maxlength="30" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
              <td class="fieldname">Date</td>
              <td><html:text property="ccoDate" size="12" maxlength="11"  readonly="true"/>
                <img src="img/calendara.gif"  name="Image11211" border="0" id="Image1" onclick="return showCalendar('ccoDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11211','','img/calendarb.gif',1)" />
              </td>
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
              <td height="22" class="fieldname">Name</td>
              <td><html:text property="appName"  maxlength="30" /> </td>
              <td class="fieldname">Credit Committee (CCC)</td>
              <td><html:text property="creditCommittee"  maxlength="100" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Minutes of Meeting</td>
              <td><html:text property="meetingMinutes"  maxlength="100" />
              </td>
              <td class="fieldname">Date</td>
              <td><html:text property="meetingDate" size="12" maxlength="11"  readonly="true"/>
                <img src="img/calendara.gif"  name="Image11212" border="0" id="Image1" onclick="return showCalendar('meetingDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11212','','img/calendarb.gif',1)" />
              </td>
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

<%if(ICMSConstant.STATE_REJECTED.equals(iTrxValue.getStatus())) { %>
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
<% } %>

<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="80">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/submit2.gif',0)"><img src="img/submit1.gif" name="Image2" border="0" id="Image2" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
