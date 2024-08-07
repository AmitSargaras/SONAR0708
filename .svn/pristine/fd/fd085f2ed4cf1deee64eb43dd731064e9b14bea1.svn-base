<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.util.Locale,
                 java.util.Collection,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.tradingbook.bus.ICashMargin,
                 com.integrosys.cms.app.tradingbook.trx.OBCashMarginTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: $
*
* Describe this JSP.
* Purpose: For Maker view the list of the Cash Margin value
* Description: view the list of the Cash Margin value by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String userMembershipID = (String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isMrMaker = false;

    if (userMembershipID.equals(String.valueOf(ICMSConstant.TEAM_TYPE_MR_MAKER))) {
      isMrMaker = true;
    }

    String event = request.getParameter("event");
    String preEvent = request.getParameter("preEvent");
    if(preEvent==null || preEvent.equals("")){
      preEvent = event;
    }
    String TrxId = request.getParameter("TrxId");
    String index = request.getParameter("index");
    String indexChanged = (String) request.getAttribute("indexChanged");
    if(indexChanged == null || indexChanged.equals("")){
      if(event.equals("maker_edit_allcashmargin_reject") || preEvent.equals("maker_edit_allcashmargin_reject") ){
        indexChanged = "1";
      }else{
        indexChanged = "0";
      }
    }

    ICashMargin[] parametersActual = null ;
    ICashMargin[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginAction.CashMarginTrxValue");
    com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginForm aForm = (com.integrosys.cms.ui.tradingbook.cashmargin.CashMarginForm) request.getAttribute("CashMarginForm");
    OBCashMarginTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    boolean isDeleted = false;   
    String cashMarginNull = null;//request.getParameter("agreementNull");

    if( obj!=null ) {
        DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.CashMarginTrxValue");
        obTrxValue = (OBCashMarginTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );
        DefaultLogger.debug(this,  "event = " +event );
        
        if(obTrxValue.getCPAgreementDetail()!=null) {
        
                if (obTrxValue.getCPAgreementDetail().getBCAStatus() != null && 
                        obTrxValue.getCPAgreementDetail().getBCAStatus().equals (ICMSConstant.STATE_DELETED)) { 
                    isDeleted = true;   
                }

        }

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( event.equals("maker_edit_allcashmargin_reject") || event.equals("maker_create_editreject_confirm") || 
            event.equals("maker_update_editreject_confirm") || event.equals("maker_delete_editreject")) {
           parametersActual =  obTrxValue.getCashMargin();
           parametersArray = obTrxValue.getStagingCashMargin();
           
        } else if (event.equals("maker_create_cashmargin_confirm") || event.equals("maker_update_cashmargin_confirm") || 
                   event.equals("maker_delete_cashmargin") || index != null || 
                   event.equals("maker_update_allcashmargin_confirm") || event.equals("maker_edit_reject_confirm") || 
                   event.equals("maker_edit_reject_confirm")) {
           parametersArray = obTrxValue.getStagingCashMargin();
           cashMarginNull = (String)request.getAttribute("cashMarginNull");
        } else {
           parametersArray = obTrxValue.getCashMargin();
        }
        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'CashMarginTrxValue' ");
    }

%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage() {
    document.forms[0].action = "CashMargin.do?event=maker_update_allcashmargin_confirm&preEvent=<%=preEvent%>&agreementID=<%=obTrxValue.getCPAgreementDetail().getAgreementID()%>&TrxId=<%=TrxId%>&indexChanged=<%=indexChanged%>";
    document.forms[0].submit();
}

function goPreviousPage() {
  if('maker_view_cashmargin_isdacsa' == '<%=preEvent%>'){
    document.forms[0].action = "ISDACSADealVal.do?event=view_isda_deal_detail&agreementID=<%=obTrxValue.getCPAgreementDetail().getAgreementID()%>&limitProfileID=<%=obTrxValue.getCPAgreementDetail().getLimitProfileID()%>";
  }else if('maker_view_cashmargin_gmra' == '<%=preEvent%>'){
    document.forms[0].action = "GMRADeal.do?event=view_gmra_deal_detail&agreementID=<%=obTrxValue.getCPAgreementDetail().getAgreementID()%>&limitProfileID=<%=obTrxValue.getCPAgreementDetail().getLimitProfileID()%>";
  }
    document.forms[0].submit();
}

function createCashActivity()
{
  if('maker_edit_allcashmargin_reject' == '<%=event%>' || 'maker_edit_allcashmargin_reject' == '<%=preEvent%>'){
    document.forms[0].action = "CashMargin.do?event=maker_create_editreject&preEvent=<%=preEvent%>&TrxId=<%=TrxId%>&indexChanged=<%=indexChanged%>";
  }else{
    document.forms[0].action = "CashMargin.do?event=maker_create_cashmargin&preEvent=<%=preEvent%>&agreementID=<%=obTrxValue.getCPAgreementDetail().getAgreementID()%>&indexChanged=<%=indexChanged%>";
  }
    document.forms[0].submit();
}

function updateCashActivity(index)
{
  if('maker_edit_allcashmargin_reject' == '<%=event%>' || 'maker_edit_allcashmargin_reject' == '<%=preEvent%>'){
    document.forms[0].action = "CashMargin.do?event=maker_update_editreject&preEvent=<%=preEvent%>&TrxId=<%=TrxId%>&indexChanged=<%=indexChanged%>&index="+index;
  }else{
    document.forms[0].action = "CashMargin.do?event=maker_update_cashmargin&preEvent=<%=preEvent%>&agreementID=<%=obTrxValue.getCPAgreementDetail().getAgreementID()%>&indexChanged=<%=indexChanged%>&index="+index;
  }
    document.forms[0].submit();
}

function deleteCashActivity()
{
  if('maker_edit_allcashmargin_reject' == '<%=event%>' || 'maker_edit_allcashmargin_reject' == '<%=preEvent%>'){
    document.forms[0].action = "CashMargin.do?event=maker_delete_editreject&preEvent=<%=preEvent%>&TrxId=<%=TrxId%>&indexChanged=<%=indexChanged%>";
  }else{
    document.forms[0].action = "CashMargin.do?event=maker_delete_cashmargin&preEvent=<%=preEvent%>&agreementID=<%=obTrxValue.getCPAgreementDetail().getAgreementID()%>&indexChanged=<%=indexChanged%>";
  }
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="CashMargin.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<html:hidden property="previousEvent" value="<%=preEvent%>"/>
<%@ include file="../deal/cp_agreement_common_page.jsp"%> 

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          
          <tr>
            <td width="60%"><h3><bean:message key="label.cash.margin.title"/></h3></td>
            <td width="40%" valign="baseline" align="right">
            <%if(!isDeleted && isMrMaker){%>
              <input class="btnNormal" type="button" name="btnAddCashActivity" value="Add New" onclick="javascript:createCashActivity()"/>&nbsp;
              <input class="btnNormal" type="button" name="btnDelCashActivity" value="Remove" onclick="javascript:deleteCashActivity()" />     
            <%}%>&nbsp;
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td width="10%"><bean:message key="label.cash.margin.sn"/></td>
              <td width="20%"><bean:message key="label.cash.margin.transaction.date"/></td>
              <td width="10%"><bean:message key="label.cash.margin.plus.minus"/></td>
              <td width="15%"><bean:message key="label.cash.margin.net.act.principal"/></td>
              <td width="<%=isDeleted?"45%":"15%"%>"><bean:message key="label.cash.margin.interest"/></td>
                <%if(!isDeleted && isMrMaker){%>
              <td width="15%"><bean:message key="label.cash.margin.action"/></td>
              <td width="15%"><bean:message key="label.cash.margin.delete"/></td>
                <%}%>
            </tr>
          </thead>
          <tbody>
          <%
            if(parametersArray == null || parametersArray.length == 0 ){
            System.out.println("cashMarginNull : " + cashMarginNull);
                if(cashMarginNull != null && cashMarginNull.equals("cashMarginNull")){
            System.out.println("cashMarginNull : " + cashMarginNull);
                %>
            <tr class="even">
              <td colspan="7"><font color="#FF0000" size="1">Cash Margin is mandatory.</font>&nbsp;</td>
            </tr>
            <%  }
                else
                {%>
            <tr class="even">
                <td colspan="7"><bean:message key="label.global.not.found"/></td>
            </tr>
            <%  }%>

          <%}else{
              String[] cashMarginID = null;
              String[] trxDate = null;
              String[] napSignAddValue = null;
              String[] napAmount = null;
              String[] cashInterest = null;

              System.out.println("cashMarginID = " + cashMarginID);
                System.out.println("b4 parametersArray = " + parametersArray);
              if(parametersArray != null){
                System.out.println("inside parametersArray cashMarginID = " + cashMarginID);
                cashMarginID = aForm.getDisplayCashMarginID();
                System.out.println("cashMarginID = " + cashMarginID);
                trxDate = aForm.getDisplayTrxDate();
                System.out.println("trxDate = " + trxDate);
                napSignAddValue = aForm.getDisplayNapSignAddValue();
              System.out.println("napSignAddValue = " + napSignAddValue);
                napAmount = aForm.getDisplayNapValue();
              System.out.println("napAmount = " + napAmount);
                cashInterest = aForm.getDisplayCashInterest();
              System.out.println("cashInterest = " + cashInterest);
              }
              System.out.println("cashMarginID = " + cashMarginID);
              for (int i = 0; i < cashMarginID.length; i++) {
                //ICashMargin parameter = parametersArray[i];
          %>
            <tr class='<%=(i%2==0?"even":"odd")%>' >
                <html:hidden property="cashMarginID" value="<%=cashMarginID[i]%>"/>
                <td class="index"><%=(i+1)%></td>
                <td><integro:empty-if-null value="<%=trxDate[i]%>"/>&nbsp;</td>
                <td>
                  <%if(napSignAddValue[i].equals("Y")){%>
                  +
                  <%}else{%>
                  -
                  <%}%>&nbsp;
                </td>
                <td><integro:empty-if-null value="<%=napAmount[i]%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=cashInterest[i]%>"/>&nbsp;</td>
                <%if(!isDeleted && isMrMaker){%>
                <td><a href="javascript:updateCashActivity(<%=i%>)">Edit</a></td>
                <td><html:multibox property="deletedCreditRating" value="<%=String.valueOf(i)%>" /></td>
                <%}%>
            </tr>
          <%  }
            }
            String totalCashInterest = null;
           if(parametersArray != null && parametersArray.length > 0 ){
             totalCashInterest = aForm.getDisplayTotalCashInterest();
           }
          %>
            <tr class='even' >
                <td colspan="3" align="right">Total</td>
                <td>&nbsp;</td>
                <td><integro:empty-if-null value="<%=totalCashInterest%>"/>&nbsp;</td>
                <%if(!isDeleted && isMrMaker){%>
                <td colspan="2">&nbsp;</td>
                <%}%>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <%if(isRejected ) {
    String paramUID = obTrxValue.getUserInfo();
    String paramRemarks = obTrxValue.getRemarks();
            if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
                paramRemarks=" ";
            }%>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
          <tr>
            <td width="43%" class="fieldname">Remarks</td>
            <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
          </tr>
          <tr>
            <td class="fieldname">Last Action By</td>
            <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
          </tr>
          <tr class="odd">
            <td class="fieldname">Last Remarks Made</td>
            <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
          </tr>
        </tbody>
        </table>
      <%}%>
      </td>
    </tr>

  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <%if(!isDeleted && isMrMaker){%>
    <td align="right"><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
  <%}%>
  <%if(isMrMaker && !isDeleted){%>
  <td><a href='<%=isRejected?"ToDo.do":"javascript:goPreviousPage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  <%}else{%>
  <td><a href="javascript:goPreviousPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  <%}%>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
