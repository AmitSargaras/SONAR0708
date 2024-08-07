<%@ page import="com.integrosys.cms.ui.contractfinancing.IContractFinancingUIConstant" %>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /workspace/mbb/trunk/cms2/public_html/contractfinancing/contractfinancing_frame.jsp$
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.2 $
* @since $Date: 2007/May/07 $
* Tag: $Name:  $
*/
%>

<%
    String tabContractInfo = "tab_contractinfo1";
    String tabAdvsPayment = "tab_advspayment1";
    String tabAdvsPaymentSG = "tab_advspayment_sg1";
    String tabTerms = "tab_t&c1";
    String tabFDR = "tab_fdr1";

    String tab = (String) session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.tab");
    if (tab==null || tab.equals(IContractFinancingUIConstant.TAB_CONTRACTDETAIL)) { //default tab
        tabContractInfo = "tab_contractinfo3";
    } else if (tab.equals(IContractFinancingUIConstant.TAB_ADVSPAYMENT)) {
        tabAdvsPayment = "tab_advspayment3";
    } else if (tab.equals(IContractFinancingUIConstant.TAB_ADVSPAYMENT_SG)) {
        tabAdvsPaymentSG = "tab_advspayment_sg3";
    } else if (tab.equals(IContractFinancingUIConstant.TAB_TNC)) {
        tabTerms = "tab_t&c3";
    } else if (tab.equals(IContractFinancingUIConstant.TAB_FDR)) {
        tabFDR = "tab_fdr3";
    }
%>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}

function goNextPage(nextPage){
    document.forms[0].next_page.value = nextPage;
    document.forms[0].event.value = "maker_navigate_tab";
    document.forms[0].submit();
}
//-->
</script>

<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td height="33" valign="bottom" bgcolor="#EEEEEE">
      <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="0%" style="padding-left:5px">&nbsp;</td>
          <td width="8%"><a href="javascript:goNextPage('contractdetail')" onClick="MM_nbGroup('down','group1','co1','img/button/tab_contractinfo3.gif',1);" onMouseOver="MM_nbGroup('over','co1','img/button/tab_contractinfo2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabContractInfo%>.gif" name="co1"  border="0"/></a></td>
        <%
        ILimitProfile user = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
        String countryCode = user.getOriginatingLocation().getCountryCode();
        if(countryCode.equals("MY")){
            %><td width="8%"><a href="javascript:goNextPage('advspayment')" onClick="MM_nbGroup('down','group1','co2','img/button/tab_advspayment3.gif',1);" onMouseOver="MM_nbGroup('over','co2','img/button/tab_advspayment2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabAdvsPayment%>.gif" name="co2" border="0"/></a></td><%
        }
        else{
            %><td width="8%"><a href="javascript:goNextPage('advspayment_sg')" onClick="MM_nbGroup('down','group1','co5','img/button/tab_advspayment_sg3.gif',1);" onMouseOver="MM_nbGroup('over','co5','img/button/tab_advspayment_sg2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabAdvsPaymentSG%>.gif" name="co5" border="0"/></a></td><%
        }
        %>
          <td width="8%"><a href="javascript:goNextPage('tnc')" onClick="MM_nbGroup('down','group1','co3','img/button/tab_t&c3.gif',1);" onMouseOver="MM_nbGroup('over','co3','img/button/tab_t&c2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabTerms%>.gif" name="co3" border="0"/></a></td>
          <td width="8%"><a href="javascript:goNextPage('fdr')" onClick="MM_nbGroup('down','group1','co4','img/button/tab_fdr3.gif',1);" onMouseOver="MM_nbGroup('over','co4','img/button/tab_fdr2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabFDR%>.gif" name="co4" border="0"/></a></td>
          <td width="48%">&nbsp; </td>
          <td width="5%" style="padding-right:5px ">&nbsp;</td>
          <td width="2%">&nbsp;</td>
          <td width="5%">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

