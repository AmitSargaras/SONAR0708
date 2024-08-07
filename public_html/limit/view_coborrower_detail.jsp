<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 java.util.Vector,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.limit.trx.ICoBorrowerLimitTrxValue,
                 com.integrosys.cms.app.limit.trx.OBCoBorrowerLimitTrxValue,
                 java.util.Collection,
                 java.util.Vector,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.limit.bus.*,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.limit.proxy.ILimitProxy,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.limit.proxy.LimitProxyFactory"%>
 <%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/limit/view_coborrower_detail.jsp,v 1.18 2006/10/27 08:46:32 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.18 $
     * @since $Date: 2006/10/27 08:46:32 $
     * Tag: $Name:  $
     */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%      com.integrosys.cms.ui.limit.ViewLimitsForm aForm = (com.integrosys.cms.ui.limit.ViewLimitsForm) request.getAttribute("ViewLimitsForm");
   System.out.println("Entered view_coborrower_detail.jsp");
    ICoBorrowerLimitTrxValue iCOBLimitTrxVal = (ICoBorrowerLimitTrxValue)session.getAttribute("com.integrosys.cms.ui.limit.ViewLimitsAction.coBorrowertrxValue");
    /* String mainBorrowerLEID = (String) request.getAttribute("mainBorrowerLEID");
     String mainBorrowerSubProfileID= (String) request.getAttribute("mainBorrowerSubProfileID");*/
    String mainBorrowerLEID = (String) session.getAttribute("com.integrosys.cms.ui.limit.ViewLimitsAction.mainBorrowerLEID");
       String mainBorrowerSubProfileID= (String) session.getAttribute("com.integrosys.cms.ui.limit.ViewLimitsAction.mainBorrowerSubProfileID");
     ILimit ilimit =null;
        String prodDesc = "-";
   ILimitProxy limitproxy = LimitProxyFactory.getProxy();
     if(aForm.getOuterLimitId()!=null)
     {
        ilimit=limitproxy.getLimit(Long.parseLong(aForm.getOuterLimitId()));
        if(ilimit.getProductDesc()!=null){
                   prodDesc =ilimit.getProductDesc();
        }
     }
    if(prodDesc!=null){

        if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, prodDesc)!=null)
             prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION,prodDesc);
    }


              %>
 <%
     long limitid = aForm.getLimitID();
     String outerLimitRef = aForm.getOuterLimitRef();
       Amount activatedLimit = new Amount(aForm.getActivateLimit(),aForm.getCurrencyCode());
       Amount limitAmount = new Amount (aForm.getLimitAmount(),aForm.getCurrencyCode1());
       String outerLimitId = Long.toString(aForm.getOuterLimitID());
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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

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

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation){
	window.location = aLocation ;
}

function gotopage(limitID){
	 parent.document.location = "ViewLimits.do?event=edit_coborrower&limitID="+limitID;
}
function gotopage() {
    parent.document.location = "ViewLimits.do?event=edit_coborrower&limitID="+ <%=limitid%>
}
function cancel(customerID,limitProfileID){
     document.forms[0].action="Limits.do?event=viewlimits&customerID=" +customerID+"&limitProfileID=" +limitProfileID;
    document.forms[0].submit();
}

</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="ViewLimits.do?event=view_coborrower">
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="90%"><h3>Limit Details</h3></td>
      <%
//get team and user from session to test..
       String customerID ="";
          String limitProfileID = "";
          OBCMSCustomer test = (OBCMSCustomer)request.getAttribute("custOb");
          if(test!=null)
          {
              if(test.getCustomerID()!=Long.MIN_VALUE)
                     customerID =Long.toString(test.getCustomerID());
          }
          OBLimitProfile limitprofileOb = (OBLimitProfile)request.getAttribute("limitprofileOb");
          if(limitprofileOb!=null)
          {
          if(limitprofileOb.getLimitProfileID()!=Long.MIN_VALUE)
                 limitProfileID = Long.toString(limitprofileOb.getLimitProfileID());
          }

     ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
     ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
  TOP_LOOP:
    for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
            for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
             if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                 System.out.println("userteam"+ userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID());
                         if((userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER)
                        		 ||(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH)
                        		 ||(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I)
                        		 ||(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH)
                        		 )
                         { %>
                            <td width="50%" align="right" valign="baseline">
                            <table width="150" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                         <% if ( aForm.getStatus() != null &&
                                 (aForm.getStatus().equals(ICMSConstant.STATE_DELETED) || aForm.getStatus().equals(ICMSConstant.STATE_PENDING_DELETE)) )
                         {%>
                                 <td width="10%" align="right" valign="bottom"><p class="required"><font color="#FF0000"><b>
                    <%=aForm.getStatus().equals(ICMSConstant.STATE_DELETED)?"Deleted":"Pending Delete"%> </b></font></p> </td>
                              <%  } %>
                                    <td width="10%" align="right" valign="bottom"><input type="button" name="Button" value="Edit" class="btnNormal" style="width:50" onclick="gotopage()"/></td>
                              </tr></table></td>
                              <%
                           break TOP_LOOP;
                        }  else
                         {   %>

                         <%
                              break TOP_LOOP;
                         }

                        }
                        }
  }
      %>


    </tr>
    <tr>
      <td colspan="2"><hr /></td>
    </tr>
    <tr>
      <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname"><bean:message key="label.global.main.borrower"/> <bean:message key="label.customer.id"/></td>
              <td width="30%"><%=mainBorrowerLEID%>&nbsp;</td>
              <td width="20%" class="fieldname"><bean:message key="label.global.main.borrower"/> <bean:message key="label.customer.subprofile.id"/></td>
              <td width="30%"><%=mainBorrowerSubProfileID%>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.global.co.borrower"/> <bean:message key="label.customer.id"/></td>

              <td><bean:write scope="request" property="leID" name="ViewLimitsForm"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.global.co.borrower"/> <bean:message key="label.customer.subprofile.id"/></td>
              <td><bean:write scope="request" property="coBorrowerSubProfileID" name="ViewLimitsForm"/>&nbsp;</td>
            </tr>
             <tr class="odd">
              <td class="fieldname"><bean:message key="label.global.co.borrower"/> <bean:message key="label.limit.id"/></td>
              <td><integro:empty-if-null value="<%=aForm.getLimitRef()%>"/>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.global.co.borrower"/> <bean:message key="label.global.name"/></td>
              <td><bean:write scope="request" property="coBorrowerName" name="ViewLimitsForm"/>&nbsp;</td>

            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.global.outer.limit.id"/></td>
              <td><%=outerLimitRef%>&nbsp;</td>
                 <input type="hidden" name="limitID" value="<%=limitid%>">
              <td class="fieldname"><bean:message key="label.product.desc"/></td>
              <td><%=prodDesc%>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.global.limit"/> <bean:message key="label.global.booking.location"/></td>
              <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(aForm.getBookingLoc())%>"/>&nbsp;</td>
              <td class="fieldname">Limit Currency</td>
              <td><bean:write scope="request" property="currencyCode" name="ViewLimitsForm"/>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname">Limit Amount</td>
              <td><integro:currency amount="<%=limitAmount%>" param="amount" />&nbsp;</td>
              <td class="fieldname">Limit Status</td>
              <td><bean:write scope="request" property="status" name="ViewLimitsForm"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname">Activated Limit</td>
              <td><integro:currency amount="<%=activatedLimit%>" param="amount" />&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:cancel('<%=customerID%>','<%=limitProfileID%>');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
