<!--Modified by Pratheepa for CR129-->
<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.CommDocAction,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.app.commodity.deal.bus.doc.IFinancingDoc,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.financingdoc.SalesDocTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.deal.bus.doc.ICommodityTitleDocument,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.ProcessStageList,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.limit.bus.ITATEntry,
                 java.util.Date,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.CommDocForm,
                 java.util.Collection,
                 com.integrosys.cms.ui.commoditydeal.*"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/commodity_doc_update.jsp,v 1.19 2006/11/20 09:07:13 jzhan Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.19 $
* Date: $Date: 2006/11/20 09:07:13 $
* Tag: $Name: DEV_20061123_B286V1 $
*/
%>
<%
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    ICommodityDeal dealObj = trxValue.getStagingCommodityDeal();
    ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    CommDocForm aForm = (CommDocForm)request.getAttribute("CommodityDocForm");
    Collection selectedWRList = (Collection)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.selectedWRList");
%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].action = "CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST%>";
    }
    if (num == 2) {
        document.forms[0].action="CommDealSearch.do";
        document.forms[0].event.value="<%=CommDealSearchAction.EVENT_LIST%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=CommDocAction.EVENT_LIST_TITLE_DOC%>";
    }
    if (num == 5) {
        document.forms[0].event.value = "<%=CommDocAction.EVENT_VIEW_SECURITY_DOC%>";
    }

    document.forms[0].submit();
}

function editItem(index, type) {
    document.forms[0].event.value = type+"_"+"<%=CommDocAction.EVENT_PREPARE_UPDATE_SUB%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function viewItem(index, type) {
    document.forms[0].event.value = type+"_"+"<%=CommDocAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function addItem(type) {
    document.forms[0].event.value = type+"_"+"<%=CommDocAction.EVENT_PREPARE%>";
    document.forms[0].indexID.value = "-1";

    document.forms[0].submit();
}

function deleteItem(type) {
        var delObj;
        var str;
        if (type == "<%=CommodityDealConstant.FINANCING_DOCUMENT%>") {
            delObj = document.forms[0].deleteFinancingDoc;
            str = "Financing Document";
        } else {
            delObj = document.forms[0].deleteTitleDoc;
            str = "Title Document";
        }
		if(typeof(delObj)=='undefined')
		{
		   alert('At least one '+str+' must be checked');
            return false;
		}
        var valid = false;
        if (!delObj.length) {
            valid = delObj.checked;
        } else {
            for (i = 0; i < delObj.length; i++) {
                if (delObj[i].checked) {
                    valid = true;
                }
            }
        }
        if (!valid) {
            alert('At least one '+str+' must be checked');
            return false;
        }

    document.forms[0].event.value = type+"_"+"<%=CommDocAction.EVENT_DELETE_ITEM%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onLoad="MM_preloadImages('img/cancel2.gif','img/calendarb.gif')">
<html:form action="CommodityDoc.do">

<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<input type="hidden" name="event" value="<%=CommDocAction.EVENT_EDIT%>">
<input type="hidden" name="indexID"/>
<input type="hidden" name="return_page" value="<%=CommDocAction.EVENT_MAIN_PAGE%>"/>
<input type="hidden" name="next_page"/>
<%
    String collateralID = (dealObj.getCollateralID() > 0)?String.valueOf(dealObj.getCollateralID()):"";
%>
<input type="hidden" name="securityID" value="<%=collateralID%>"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td>
      <h3>Financing Documents</h3>
    </td>
    <td valign="bottom">
      <table width="80"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
        <td width="8%" valign="baseline" align="right">
            <input name="Submit2" type="button" class="btnNormal" value="Delete" onClick="javascript:deleteItem('<%=CommodityDealConstant.FINANCING_DOCUMENT%>')"/>
        </td>
        <td align="right" valign="bottom" width="8%">
            <input name="Submit2" type="button" class="btnNormal" value="Add New" onClick="javascript:addItem('<%=CommodityDealConstant.FINANCING_DOCUMENT%>')"/>
        </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="2%">S/N</td>
          <td width="14%">Sales Document Description</td>
          <td width="8%">Sales Document No.</td>
          <td width="8%">Expiry Date</td>
          <td width="12%">Export LC Issuing Bank</td>
          <td width="8%">LC Reference</td>
          <td width="8%">LC Expiry Date</td>
          <td width="8%">Due Date to Receive Letters of Credit</td>
          <td width="14%" class="tblInput">Counter-Party</td>
          <td width="12%" class="tblInput">Action</td>
          <td width="6%" class="tblInput">Remove</td>
        </tr>
        </thead>
        <tbody>
        <%
            IFinancingDoc[] finDocList = dealObj.getFinancingDocs();
            SalesDocTypeList docTypeList = SalesDocTypeList.getInstance();
            if (finDocList == null || finDocList.length == 0) {
        %>
        <tr class="odd"><td colspan="11">There is no Financng Document.</td></tr>
        <%
            } else {
                for (int i = 0; i < finDocList.length; i++) {
                    IFinancingDoc finDocObj = finDocList[i];
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="2%"><%=i + 1%></td>
          <td width="14%"><integro:empty-if-null value="<%=docTypeList.getSalesDocTypeItem(finDocObj.getDocTypeCode())%>"/>&nbsp;</td>
          <td style="text-align:center" width="8%"><integro:empty-if-null value="<%=finDocObj.getDocumentNo()%>"/>&nbsp;</td>
          <td width="8%" style="text-align:center">
          <% if (finDocObj.getOrderExpDate() != null) { %>
          <integro:date object="<%=finDocObj.getOrderExpDate()%>"/>
          <% } else { %> - <% } %> &nbsp;
          </td>
          <td style="text-align:center" width="12%"><integro:empty-if-null value="<%=finDocObj.getBankName()%>"/>&nbsp;</td>
          <td style="text-align:center" width="8%"><integro:empty-if-null value="<%=finDocObj.getLCRefNo()%>"/>&nbsp;</td>
          <td style="text-align:center" width="8%">
          <% if (finDocObj.getLCExpDate() != null) { %>
          <integro:date object="<%=finDocObj.getLCExpDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="8%">
          <% if (finDocObj.getLOCDueDate() != null) { %>
            <integro:date object="<%=finDocObj.getLOCDueDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="14%"><integro:empty-if-null value="<%=finDocObj.getCounterParty()%>"/>&nbsp;</td>
          <td style="text-align:center" width="12%">
            <a href="javascript:editItem(<%=i%>, '<%=CommodityDealConstant.FINANCING_DOCUMENT%>')">
                View/Edit</a>
          </td>
          <td style="text-align:center" width="6%">
              <html:multibox property="deleteFinancingDoc" value="<%=String.valueOf(i)%>"/>
          </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
      </table>
    </td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Document Status Confirmation </h3></td>
    </tr>
    <tr>
      <td><hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="even">
              <td width="77%" class="fieldname">Confirmation that necessary cash
                pledge/set-off document&nbsp;<font color="#0000FF">* </font></td>
              <td width="23%">
              <html:radio property="docStatusConfirm" value="<%=ICMSConstant.TRUE_VALUE%>" />Yes
              &nbsp;&nbsp;
              <html:radio property="docStatusConfirm" value="<%=ICMSConstant.FALSE_VALUE%>" />No
              <html:errors property="docStatusConfirm"/>
              </td>
            </tr>
            <tr class="odd">
                <td width="77%" class="fieldname">SCC Issued</td>
                <td width="23%">
                <%  boolean isIssued = false;
                    if (aForm.getSccIssuedDate() != null && aForm.getSccIssuedDate().length() > 0) {
                        isIssued = true;
                    }
                %>
                <integro:boolean-display style="yn" value="<%=isIssued%>"/>
                </td>
            </tr>
            <tr class="even">
                <td width="77%" class="fieldname">Date Issued</td>
                <td width="23%"><bean:write name="CommodityDocForm" property="sccIssuedDate"/>&nbsp;
                <html:hidden property="sccIssuedDate"/>
                </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <tr>
    <td width="77%">&nbsp;</td>
    <td align="right" valign="bottom" width="23%">&nbsp;</td>
  </tr>
  <thead>
  <tr>
    <td width="77%">
      <h3>Security Document List - Completed Documents</h3>
    </td>
    <td align="right" valign="bottom" width="23%">
      <input name="Submit4" type="button" class="btnNormal" value="View Security Documents" onClick="submitPage(5)"/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="2">Click on 'View Security Documents' to view all the security
      documents.</td>
  </tr>
  </thead> <tbody> </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="53%">
      <h3>Title Documents</h3>
    </td>
    <td valign="bottom" colspan="2" width="47%">
      <table width="160"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
          <td width="80">
            <input name="Submit3" type="button" class="btnNormal" value="Add New Title Document" onClick="javascript:addItem('<%=CommodityDealConstant.TITLE_DOCUMENT%>')"/>
          </td>
          <td width="160" valign="baseline" align="center">
            <input name="Submit" type="button" class="btnNormal" value="View Historical Documents" onClick="submitPage(4)"/>
          </td>
		  <td width="80" valign="baseline" align="right">
            <input name="Submit2" type="button" class="btnNormal" value="Delete" onClick="javascript:deleteItem('<%=CommodityDealConstant.TITLE_DOCUMENT%>')"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="10%">Date of Transaction</td>
          <td width="10%">Process Stage</td>
          <td width="24%">Documentation Description</td>
          <td width="9%">Eligibility of Advance (%)</td>
          <td width="11%">Document No.</td>
          <td width="12%">Secured Status</td>
          <td width="15%" class="tblInput">Action</td>
          <td width="9%" class="tblInput">Remove</td>
        </tr>
        </thead>
        <tbody>
        <%
            ProcessStageList processStageList = ProcessStageList.getInstance();
            ICommodityTitleDocument[] latestTitleDoc = null;
            latestTitleDoc = dealObj.getTitleDocsLatest();
            if (latestTitleDoc == null || latestTitleDoc.length == 0) {
        %>
        <tr class="odd"><td colspan="8">There is not Title Document.</td></tr>
        <%
            } else {
                for (int i = 0; i < latestTitleDoc.length; i++) {
                    ICommodityTitleDocument titleDocObj = latestTitleDoc[i];
                    ITitleDocument titleDocType = titleDocObj.getTitleDocType();
                    boolean isWarehouse = false;
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td style="text-align:center" width="10%"><integro:date object="<%=titleDocObj.getTransactionDate()%>"/></td>
          <td style="text-align:center" width="10%"><integro:empty-if-null value="<%=processStageList.getProcessStageItem(titleDocObj.getProcessStageCode())%>"/></td>
          <td width="24%">
          <%        String docDesc = null;
                    if (titleDocType != null) {
                        docDesc = titleDocType.getName();
                        if ((docDesc.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT))||
                           (docDesc.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N))){
                            isWarehouse = true;
                        }
                    }
          %>
            <integro:empty-if-null value="<%=docDesc%>"/>
          </td>
          <td width="9%" style="text-align:center">
            <%=titleDocObj.getAdvEligibilityPct() >=0 ?String.valueOf((int)titleDocObj.getAdvEligibilityPct()):"-"%>
          </td>
          <td style="text-align:center" width="11%">
          <%
                    String documentNo = null;
                    if (titleDocType != null && titleDocType.getName() != null) {
                    	String docName = titleDocType.getName();
                        if ((docName.equals(CommodityDealConstant.DOC_TYPE_BILL_LADING))||
                           (docName.equals(CommodityDealConstant.DOC_TYPE_BILL_LADING_N))){
                            documentNo = titleDocObj.getBLNo();
                        } else if ((docName.equals(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT)) ||
                                   (docName.equals(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT_NN))){
                            documentNo = titleDocObj.getTRNo();
                        } else if ((!(docName.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT))) ||
                                  (!(docName.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N)))){
                            documentNo = titleDocObj.getOtherDocNo();
                        }
                    }
          %>
          <integro:empty-if-null value="<%=documentNo%>"/>
          </td>
          <td style="text-align:center" width="12%">
          <%        String isSecured = "No";
                    if (titleDocObj.getIsSecured() != null &&
                            titleDocObj.getIsSecured().equals(ICMSConstant.TRUE_VALUE)) {
                        isSecured = "Yes";
                    }
          %>
          <%=isSecured%>
          </td>
          <td style="text-align:center" width="15%">
          <%
//                    if (isWarehouse) {
          %>
              <a href="javascript:editItem(<%=i%>, '<%=CommodityDealConstant.TITLE_DOCUMENT%>')">
              View/Edit</a>
          <%// } else if (CommodityDealUtil.isNewTitleDoc(trxValue.getCommodityDeal(), titleDocObj)) { %>
<!--              <a href="javascript:editItem(<%=i%>, '<%=CommodityDealConstant.TITLE_DOCUMENT%>')">
              View/Edit</a> -->
          <%// } else { %>
              <!--<a href="javascript:viewItem(<%=i%>, '<%=CommodityDealConstant.TITLE_DOCUMENT%>')">
              View</a> -->
          <% //} %>
          </td>
          <td style="text-align:center" width="9%">
          <%
                    if (isWarehouse && (selectedWRList == null || selectedWRList.isEmpty())) {
          %>
            <html:multibox property="deleteTitleDoc" value="<%=String.valueOf(i)%>"/>
            <% } else if (!isWarehouse) { %>
            <html:multibox property="deleteTitleDoc" value="<%=String.valueOf(i)%>"/>
            <% } %>
            &nbsp;
          </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<table width="82" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td >&nbsp;</td>
  </tr>
  <tr>
    <%
        if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
    %>
    <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
        } else {
            String previous_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
            if (previous_event.equals(CommDocAction.EVENT_LIST)) {
    %>
    <td><a href="javascript:submitPage(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
            } else {
    %>
    <td><a href="javascript:submitPage(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } } %>

  </tr>
  <tr>
    <td >&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd -->
</html>
