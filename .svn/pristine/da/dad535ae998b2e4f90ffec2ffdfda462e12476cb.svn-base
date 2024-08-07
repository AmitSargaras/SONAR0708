<%@ page import="java.util.*,
                 java.text.SimpleDateFormat,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.InterestRateTypeList,
                 com.integrosys.cms.app.interestrate.bus.IInterestRate,
                 com.integrosys.cms.app.interestrate.trx.OBInterestRateTrxValue"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/interestrate/interest_rate_maker_list.jsp,v 1 2007/02/08 Jerlin Exp $
*
* Describe this JSP.
* Purpose: For Maker to edit the Interest Rates
* Description: edit Interest Rates by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/08 $
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
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.InterestRateTrxValue");
        obTrxValue = (OBInterestRateTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );//true;

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( event.equalsIgnoreCase("maker_edit_interestrate_reject") ) {
           parametersArray = obTrxValue.getStagingInterestRates();
        } else {
           parametersArray = obTrxValue.getInterestRates();
        }
        //System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>parametersArray : " + parametersArray);
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

function submitPage() {
    if( "<%=event%>" == "maker_edit_interestrate_reject" ){
      document.forms[0].action = "MaintainInterestRate.do?event=maker_edit_reject_confirm";
      document.forms[0].submit();
    } else {
      document.forms[0].action = "MaintainInterestRate.do?event=maker_edit_interestrate_confirm";
      document.forms[0].submit();
    }
}
function gotoPreparePage() {
    document.forms[0].action = "MaintainInterestRate.do?event=prepare";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
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
                <td width="25%">Date</td>
                <td width="65%">Interest Rates (%)&nbsp;</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td colspan=3></td>
              </tr>
              <%
              if( event.equals("maker_edit_interestrate_confirm") ){
                String interestRatePercent[] = aForm.getIntRatePercent();
                String interestRateType[] = aForm.getIntRateDate();
                for (int i = 0; i < interestRatePercent.length; i++) {
                  Date interestRateDate = new SimpleDateFormat("dd/MM/yyyy").parse( interestRateType[i] );
              %>
              <tr class='<%=(i%2==0?"even":"odd")%>'>
                <html:hidden property="intRateDate" value="<%=interestRateType[i]%>"/>
                <td class="index"><%=(i+1)%></td>
                <td><integro:date object="<%=interestRateDate%>"/></td>
                <td>
                  <html:text  property="intRatePercent"  value="<%=interestRatePercent[i]%>" maxlength="30" size="30" />
                  <font color="#FF0000" size="1">
                    <%    String errorString = "intRatePercent" + i; %>
                    <html:errors property="<%=errorString%>" />
                  </font>
                </td>
              </tr>
              <%
                }
              } else {
                for (int i = 0; i < parametersArray.length; i++) {
                  String interestRateVal = "";
                  IInterestRate parameter = parametersArray[i];
                  if(parameter.getIntRatePercent()!=null)
                  {
                      interestRateVal = String.valueOf(parameter.getIntRatePercent());
                  }
              %>

              <tr class='<%=(i%2==0?"even":"odd")%>'>
                <html:hidden property="intRateDate" value="<%=UIUtil.formatDate(parameter.getIntRateDate())%>"/>
                <td class="index"><%=(i+1)%></td>
                <td><integro:date object="<%=parameter.getIntRateDate()%>"/></td>
                <td>
                  <html:text property="intRatePercent" value="<%=interestRateVal%>" maxlength="30" size="30" />
                  <font color="#FF0000" size="1">
                    <%    String errorString = "intRatePercent" + i; %>
                    <html:errors property="<%=errorString%>" />
                  </font>
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
  <table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="75">&nbsp;</td>
      <td width="74">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
      <td><a href='<%=isRejected?"ToDo.do":"javascript:gotoPreparePage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
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
