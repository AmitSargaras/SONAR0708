<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.limit.bus.OBThresholdRating,
                 com.integrosys.cms.app.limit.bus.IThresholdRating,
                 com.integrosys.cms.app.limit.bus.ITradingAgreement,
                 com.integrosys.cms.app.limit.bus.OBTradingAgreement,
                 com.integrosys.cms.ui.manualinput.aa.RatingList,
                 com.integrosys.cms.ui.manualinput.aa.RatingTypeList"%>
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
* Purpose: For Maker and Chacker to view the list of threshold rating detail
* Description: view the list of threshold rating detail by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String aaID = request.getParameter("aaID");
    String preEvent = request.getParameter("preEvent");
    String indexChange = "";
    int ind = 0;
    String event = request.getParameter("event");
    String trxId = request.getParameter("TrxId");
    String customerID = request.getParameter("customerID");

    if(event.equals("prepare_add_threshold_confirm") || event.equals("prepare_add_threshold_new_confirm") || 
       event.equals("prepare_add_threshold_update_confirm") || event.equals("prepare_add_threshold_delete")){
      event = "prepare_add_threshold";
    }else if(event.equals("prepare_update_threshold_confirm") || event.equals("prepare_update_threshold_new_confirm") || 
             event.equals("prepare_update_threshold_update_confirm") || event.equals("prepare_update_threshold_delete")){
      event = "prepare_update_threshold";
    }else if(event.equals("prepare_update_editreject_confirm")){
      event = "prepare_update_editreject";
    }else if(event.equals("prepare_add_editreject_confirm")){
      event = "prepare_add_editreject";
    }

    if(request.getParameter("indexChange") != null){
      indexChange = request.getParameter("indexChange");
      ind = Integer.parseInt(indexChange) + 1;

    }else{
      indexChange = "0";
      ind = Integer.parseInt(indexChange) + 1;
    }

    Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.thresholdRatingVal");
    com.integrosys.cms.ui.manualinput.aa.ThresholdRatingForm aForm = (com.integrosys.cms.ui.manualinput.aa.ThresholdRatingForm) request.getAttribute("ThresholdRatingForm");
    ITradingAgreement obTradingAgreement = null;
    IThresholdRating[] thresholdRating = null;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.tradingAgreement");
        thresholdRating = (IThresholdRating[]) obj;

        if( thresholdRating!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+thresholdRating.length);
        }
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'tradingAgreement' ");
   }
   
   String eventConfirm = null;
   if(event.length()-7 > 0){
     eventConfirm = event.substring(event.length()-7,event.length());
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
  function createThresholdRating()
  {
    if('<%=eventConfirm%>' == 'confirm'){
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_new&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_new&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }
    document.forms[0].submit();
  }

  function updateThresholdRating(index)
  {
    if('<%=eventConfirm%>' == 'confirm'){
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_update&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>&index=" + index;
    }else{
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_update&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>&index=" + index;
    }
    document.forms[0].submit();
  }

  function deleteThresholdRating()
  {
    if('<%=eventConfirm%>' == 'confirm'){
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_delete&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_delete&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }
    document.forms[0].submit();
  }

function submitPage() {
    if('<%=eventConfirm%>' == 'confirm' || '<%=event%>' == 'prepare_update_threshold_delete' || '<%=event%>' == 'prepare_add_threshold_delete'){
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_confirm&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_confirm&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }
    document.forms[0].submit();
}

function goPreviousPage() {
    if('<%=eventConfirm%>' == 'confirm'){
      document.forms[0].action = "ThresholdRating.do?event=return_<%=event%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else if ('<%=event%>' == 'view'){
      document.forms[0].action = "TradingAgreement.do?event=view&preEvent=<%=preEvent%>&indexChange=0&TrxId=<%=trxId%>&aaID=<%=aaID%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "ThresholdRating.do?event=return_<%=event%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="ThresholdRating.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;
      </td>
    </tr>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.agreement.counterparty.title"/></h3></td>
            <td align="right" valign="baseline">
              &nbsp;
              <%if(! (event.equals("view_threshold") || event.equals("view")) ){%>
              <input class="btnNormal" type="button" name="btnAddCreditRating" value="Add New" onclick="javascript:createThresholdRating()"/>&nbsp;
              <input class="btnNormal" type="button" name="btnDelCreditRating" value="Remove" onclick="javascript:deleteThresholdRating()" />
              <%}%>
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
      <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="10%"><bean:message key="label.agreement.counterparty.sn"/></td>
              <td width="20%"><bean:message key="label.agreement.counterparty.type"/></td>
              <td width="20%"><bean:message key="label.agreement.counterparty.threshold.rating"/></td>
              <td width="30%"><bean:message key="label.agreement.counterparty.threshold"/></td>
              <%if(! (event.equals("view_threshold") || event.equals("view")) ){%>
              <td width="10%"><bean:message key="label.agreement.counterparty.action"/></td>
              <td width="10%"><bean:message key="label.agreement.counterparty.delete"/></td>
              <%}%>
            </tr>
          </thead>
          <tbody>
          <%
            if(thresholdRating == null || thresholdRating.length == 0 ){%>
            <tr class="even">
                <td colspan="7"><bean:message key="label.global.not.found"/></td>
            </tr>

          <%}else{
              String[] creditRatingType = aForm.getRatingType();
              String[] creditRating = aForm.getRating();
              String[] thresholdAmount = aForm.getThresholdAmount();
              for (int i = 0; i < creditRatingType.length; i++)
              {
                  //IThresholdRating parameter = thresholdRating[i];
          %>
            <tr class="odd" >
                <td class="index"><%=i+1%></td>
                <td>
                <%String ratingType = null;
                  if(! (creditRatingType[i].equals(null) || creditRatingType[i].equals("")) ){
                    ratingType = RatingTypeList.getInstance().getRatingTypeName(creditRatingType[i]);
                  }%>
                  <integro:empty-if-null value="<%=ratingType%>"/>&nbsp;</td>
                <td>
                <%String rating = null;
                  if(! (creditRating[i].equals(null) || creditRating[i].equals("")) ){
                    rating = RatingList.getInstance(creditRatingType[i]).getRatingName(creditRating[i]);
                  }%>
                  <integro:empty-if-null value="<%=rating%>"/>&nbsp;
                </td>
                <td><integro:empty-if-null value="<%=thresholdAmount[i]%>"/>&nbsp;</td>
                <%if(! (event.equals("view_threshold") || event.equals("view")) ){%>
                <td><a href="javascript:updateThresholdRating(<%=String.valueOf(i)%>)">Edit</a></td>
                <td><html:multibox property="deletedThreshold"  value="<%=String.valueOf(i)%>" /></td>
                <%}%>
            </tr>
          <%
              }
            }
          %>
          </tbody>
        </table>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <%if(! (event.equals("view_threshold") || event.equals("view")) ){%>
    <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
    <td><a href="javascript:goPreviousPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
    <%}else{%>
       <td width="100%" valign="baseline" align="center"> <a href="javascript:goPreviousPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
    <%}%>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
