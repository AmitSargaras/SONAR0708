<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.InterestRateTypeList,
                 com.integrosys.cms.app.interestrate.bus.IInterestRate,
                 com.integrosys.cms.app.interestrate.trx.OBInterestRateTrxValue,
                 java.util.StringTokenizer"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/interestrate/interest_rate_maker_list.jsp,v 1 2007/02/09 Jerlin Exp $
*
* Describe this JSP.
* Purpose: For Maker and checker view the Interest Rates
* Description: view Interest Rates by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>


<%
    String event = request.getParameter("event");
    IInterestRate[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.interestrate.MaintainInterestRateAction.InterestRateTrxValue");
    com.integrosys.cms.ui.interestrate.MaintainInterestRateForm aForm = (com.integrosys.cms.ui.interestrate.MaintainInterestRateForm) request.getAttribute("MaintainInterestRateForm");
    OBInterestRateTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {
        DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.OBInterestRateTrxValue");
        obTrxValue = (OBInterestRateTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );
        DefaultLogger.debug(this,  "event = " +event );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_close_interestrate") || "to_track".equals(event)) {
           parametersArray = obTrxValue.getStagingInterestRates();
           //System.out.println("------------------------------------parametersArray getStagingInterestRates : " + parametersArray);
        } else {
           parametersArray = obTrxValue.getInterestRates();
           //System.out.println("------------------------------------parametersArray getInterestRates : " + parametersArray);
        }
        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'InterestRateTrxValue' ");
    }

    String rateType = "";
    String mthYear = "";
    String[] mthYr = new String[3];
    if(parametersArray.length > 0){
      rateType = InterestRateTypeList.getInstance().getInterestRateTypeName(parametersArray[0].getIntRateType());

      String intRateDate = UIUtil.formatDate(parametersArray[0].getIntRateDate());
      if(intRateDate.length() > 9){
        mthYr[0] = intRateDate.substring(0,2);
        mthYr[1] = intRateDate.substring(3,5);
        mthYr[2] = intRateDate.substring(6,intRateDate.length());
      }

      if ( mthYr[1].equals("01") ) {
        mthYear = "January" + mthYr[2];
      }else if ( mthYr[1].equals("01") ) {
        mthYear = "January" + mthYr[2];
      }else if ( mthYr[1].equals("02") ) {
        mthYear = "February" + mthYr[2];
      }else if ( mthYr[1].equals("03") ) {
        mthYear = "March" + mthYr[2];
      }else if ( mthYr[1].equals("04") ) {
        mthYear = "April" + mthYr[2];
      }else if ( mthYr[1].equals("05") ) {
        mthYear = "May" + mthYr[2];
      }else if ( mthYr[1].equals("06") ) {
        mthYear = "June" + mthYr[2];
      }else if ( mthYr[1].equals("07") ) {
        mthYear = "July" + mthYr[2];
      }else if ( mthYr[1].equals("08") ) {
        mthYear = "August" + mthYr[2];
      }else if ( mthYr[1].equals("09") ) {
        mthYear = "September" + mthYr[2];
      }else if ( mthYr[1].equals("10") ) {
        mthYear = "October" + mthYr[2];
      }else if ( mthYr[1].equals("11") ) {
        mthYear = "November" + mthYr[2];
      }else if ( mthYr[1].equals("12") ) {
        mthYear = "December" + mthYr[2];
      }
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
function closeEditRejected() {
    document.forms[0].action = "MaintainInterestRate.do?event=maker_close_interestrate_confirm";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="MaintainInterestRate.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><%=mthYear%> - <%=rateType%></h3></td>
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
              <td width="10%">S/N</td>
              <td width="65%">Date</td>
              <td width="12%">Interest Rates (%)</td>
            </tr>
          </thead>
          <tbody>
              <tr>
                <td colspan=3></td>
              </tr>
          <%
              for (int i = 0; i < parametersArray.length; i++)
              {
                  IInterestRate parameter = parametersArray[i];
          %>
            <tr class='<%=(i%2==0?"even":"odd")%>' >
                <td class="index"><%=(i+1)%></td>
                <td><integro:date object="<%=parameter.getIntRateDate()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=parameter.getIntRatePercent()%>" />&nbsp;</td>
            </tr>
          <%
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
   <%if("to_track".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_close_interestrate".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if("checker_view".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="MaintainInterestRate.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>
