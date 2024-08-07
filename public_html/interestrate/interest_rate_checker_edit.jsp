<%@ page import="com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.InterestRateTypeList,
                 com.integrosys.cms.app.interestrate.trx.OBInterestRateTrxValue,
                 com.integrosys.cms.app.interestrate.bus.IInterestRate,
                 com.integrosys.cms.app.interestrate.trx.IInterestRateTrxValue,
                 java.util.HashMap"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/interestrate/interest_rate_checker_edit.jsp,v 1 2007/02/10 Jerlin Exp $
*
* Describe this JSP.
* Purpose: For Checker to approve and reject Maintain Interest Rates
* Description: approve and reject the Maintain Interest Rates that being change by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/10 $
* Tag: $Name$
*/
%>

<% 
  ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
  ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
  boolean isMRM = false;
  boolean isMRC = false;
  for( int i=0;i<userTeam.getTeamMemberships().length; i++ ){
    for( int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length; j++ ){
      if( userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID() == user.getUserID() ){
        if ( userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() == ICMSConstant.TEAM_TYPE_MR_MAKER ) {
          isMRM = true;
        } else if ( userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() == ICMSConstant.TEAM_TYPE_MR_CHECKER ) {
          isMRC = true;
        }
      }
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

function approvePage() {
    document.forms[0].action = "MaintainInterestRate.do?event=checker_approve_edit_interestrate";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action = "MaintainInterestRate.do?event=checker_reject_edit_interestrate";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<%
    String event = request.getParameter("event");


    DefaultLogger.debug(this,">>>Debug:::001 event from getParameter is > "+event);

    DefaultLogger.debug(this,">>>Debug:::002 ");
    OBInterestRateTrxValue obTrxValue = null;
    Object trxObjFromSession = session.getAttribute("com.integrosys.cms.ui.interestrate.MaintainInterestRateAction.InterestRateTrxValue");
    DefaultLogger.debug(this,">>>Debug:::003 ");
    IInterestRate[]  parametersArray = null ;
    IInterestRate[]  stagingParametersArray = null ;
    DefaultLogger.debug(this,">>>Debug:::004 ");

    if( trxObjFromSession ==null ) {
        out.println("Expected session parameter 'InterestRateTrxValue' is missing.");
        return;
    }

    DefaultLogger.debug(this,">>>Debug:::005 ");
    obTrxValue = (OBInterestRateTrxValue)trxObjFromSession;

    parametersArray = obTrxValue.getInterestRates();

    stagingParametersArray = obTrxValue.getStagingInterestRates();
    DefaultLogger.debug(this,">>>Debug:::006 ");

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

<html:form action="MaintainInterestRate.do">

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3><%=mthYear%> - <%=rateType%></h3></td>
  </tr>
  <tr>
    <td>
    <hr />
    </td>

  </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
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
              DefaultLogger.debug(this, " >>>DEBUG:::007 number of  stagingParametersArray elements are : "+stagingParametersArray.length );

              for (int i = 0; i < stagingParametersArray.length; i++) {
                DefaultLogger.debug(this,">>>Debug:::010 ");
                IInterestRate stagingParameter = stagingParametersArray[i];
                boolean differenceFound = false;
                if(parametersArray!=null&&parametersArray.length!=0){
                  IInterestRate parameter = parametersArray[i];
                  differenceFound = !( CompareOBUtil.compOB(stagingParameter,parameter,"intRatePercent") );
                } else {
                  if(stagingParameter.getIntRatePercent()!=null) {
                    differenceFound = true;
                  }
                }
            %>
            <tr class='<%=(i%2==0?"even":"odd")%>' >
              <%if(obTrxValue.getStatus().equals(ICMSConstant.STATE_PENDING_UPDATE)){%>
              <td class='<%=differenceFound?"indexdiff":"index"%>'><%=(i+1)%></td>
              <%}else {%>
              <td><%=(i+1)%></td>
              <%}%>
              <td><integro:date object="<%=stagingParameter.getIntRateDate()%>"/></td>
              <td><integro:empty-if-null value="<%=stagingParameter.getIntRatePercent()%>" />&nbsp; </td>
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
    <tr>
      <td>
      <%
        String paramUID = obTrxValue.getUserInfo();
        String paramRemarks = obTrxValue.getRemarks();
        if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
          paramRemarks=" ";
        }
      %>
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
      </td>
    </tr>
  </tbody>
</table>
<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:approvePage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</body>

</html:form>
<!-- InstanceEnd --></html>
