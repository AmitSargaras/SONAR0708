<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.*,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.manualinput.aa.RatingTypeList,
                 com.integrosys.cms.ui.manualinput.aa.RatingList,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.app.limit.bus.OBThresholdRating,
                 com.integrosys.cms.app.limit.bus.IThresholdRating,
                 com.integrosys.cms.app.limit.bus.ITradingAgreement"%>
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
* Purpose: For Maker to edit threshold rating detail
* Description: edit threshold rating detail value by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    com.integrosys.cms.ui.manualinput.aa.ThresholdRatingForm aForm = (com.integrosys.cms.ui.manualinput.aa.ThresholdRatingForm) request.getAttribute("ThresholdRatingForm");
    String preEvent = request.getParameter("preEvent");
    String eventReturn = "";
    String indexChange = "";
    int ind = 0;
    String event = request.getParameter("event");
    String index = request.getParameter("index");
    String trxId = request.getParameter("TrxId");
    String customerID = request.getParameter("customerID");

    String ratingType = aForm.getCreditRatingType();
    if(event.equals("prepare_update_threshold_update_confirm")){
      event = "prepare_update_threshold_update";
      eventReturn = "prepare_update_threshold";
       if(! (ratingType.equals(null) || ratingType.equals("")) ){
         RatingList rating = RatingList.getInstance (ratingType);
         Collection ratingListID = rating.getRatingListID ();
         Collection ratingListValue = rating.getRatingListValue ();
         pageContext.setAttribute("ratingListID", ratingListID);
         pageContext.setAttribute("ratingListValue", ratingListValue);
       }
    }else if(event.equals("prepare_add_threshold_update_confirm")){
      event = "prepare_add_threshold_update";
      eventReturn = "prepare_add_threshold";
       if(! (ratingType.equals(null) || ratingType.equals("")) ){
         RatingList rating = RatingList.getInstance (ratingType);
         Collection ratingListID = rating.getRatingListID ();
         Collection ratingListValue = rating.getRatingListValue ();
         pageContext.setAttribute("ratingListID", ratingListID);
         pageContext.setAttribute("ratingListValue", ratingListValue);
       }
    }

    if(event.equals("prepare_update_threshold_update") || event.equals("refresh_prepare_update_threshold_update")){
      eventReturn = "prepare_update_threshold";
    }else if(event.equals("prepare_add_threshold_update") || event.equals("refresh_prepare_add_threshold_update")){
      eventReturn = "prepare_add_threshold";
    }

    if(request.getParameter("indexChange") != null){
      indexChange = request.getParameter("indexChange");
      ind = Integer.parseInt(indexChange) + 1;

    }else{
      indexChange = "0";
      ind = Integer.parseInt(indexChange) + 1;
    }

    Collection currencyCode = CurrencyList.getInstance().getCountryValues();
    pageContext.setAttribute("currencyCode", currencyCode);

    RatingTypeList list1 = RatingTypeList.getInstance ();
    Collection ratingTypeListID = list1.getRatingTypeListID ();
    Collection ratingTypeListValue = list1.getRatingTypeListValue ();
    pageContext.setAttribute("ratingTypeListID", ratingTypeListID);
    pageContext.setAttribute("ratingTypeListValue", ratingTypeListValue);

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
function returnPage() {
    document.forms[0].action = "ThresholdRating.do?event=<%=eventReturn%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    document.forms[0].submit();
}

function submitPage() {
    if('<%=event.substring(0,7)%>' == 'refresh'){
      document.forms[0].action = "ThresholdRating.do?event=<%=event.substring(8,event.length())%>_confirm&indexChange=<%=ind%>&preEvent=<%=preEvent%>&index=<%=index%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else if('<%=event%>' == 'prepare_update_threshold_update_confirm' || '<%=event%>' == 'prepare_add_threshold_update_confirm'){
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&index=<%=index%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>_confirm&indexChange=<%=ind%>&preEvent=<%=preEvent%>&index=<%=index%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }
    document.forms[0].submit();
}

function changeCreditRating(ratingType) {
    if('<%=event.substring(0,7)%>' == 'refresh'){
      document.forms[0].action = "ThresholdRating.do?event=<%=event%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&index=<%=index%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else if('<%=event%>' == 'prepare_update_threshold_update_confirm' || '<%=event%>' == 'prepare_add_threshold_update_confirm'){
      document.forms[0].action = "ThresholdRating.do?event=refresh_<%=event%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&index=<%=index%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "ThresholdRating.do?event=refresh_<%=event%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&index=<%=index%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
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
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.agreement.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.agreement.counterparty.title"/></h3></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
    <%if(request.getAttribute("alreadyExist") != null && request.getAttribute("alreadyExist").equals("alreadyExist")){%>
    <tr>
      <td><font color="#FF0000">These Rating Type and Rating already exist.&nbsp;</font>
      </td>
    </tr>
    <%}%>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.agreement.counterparty.type"/> &nbsp;<font color="#0000FF">* </font></td>
              <td width="30%">
                <html:select property="creditRatingType" onchange="changeCreditRating()">
                  <option value="" >Please Select </option>
                  <html:options name="ratingTypeListID" labelName="ratingTypeListValue"/>
                </html:select>
                <html:errors property="creditRatingType"/>&nbsp;
              </td>
              <td class="fieldname" width="20%"><bean:message key="label.agreement.counterparty.threshold.rating"/> &nbsp;<font color="#0000FF">* </font></td>
              <td width="30%">
                <html:select property="creditRating">
                  <option value="" >Please Select </option>
                  <%if(request.getAttribute("ratingListID") != null || pageContext.getAttribute("ratingListID") != null){%>
                  <html:options name="ratingListID" labelName="ratingListValue"/>
                  <%}%>
                </html:select>
                <html:errors property="creditRating"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.counterparty.threshold"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="thresholdCurCode">
                  <option value="" >Please Select </option>
                  <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>
                <html:text property="thresholdAmt" maxlength="40" />
                <html:errors property="thresholdAmt"/>&nbsp;
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
    <td><a href="javascript:returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
