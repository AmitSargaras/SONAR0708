<%@ page import="com.integrosys.cms.ui.bridgingloan.IBridgingLoanUIConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: $
    *
    * Purpose: Bridging Loan Frame
    * Description:
    *
    * @author $Author: KLYong $<br>
    * @version $Revision: $
    * Date: $Date: $
    * Tag: $Name:  $
    */
%>

<%
    String tab = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.tab");
    String tabMain = "project-1";
    String tabAdvsPayment = "tab_advspayment1";
    String tabAdvsPaymentSG = "tab_advspayment_sg1";
    String tabBuildUp = "tab_buildup1";
    String tabFdr = "tab_fdr1";

    if (tab == null || tab.equals(IBridgingLoanUIConstant.TAB_MAIN)) //default tab
        tabMain = "project-3";
    else if (tab.equals(IBridgingLoanUIConstant.TAB_ADVSPAYMENT))
        tabAdvsPayment = "tab_advspayment3";    
    else if (tab.equals(IBridgingLoanUIConstant.TAB_ADVSPAYMENT_SG))
        tabAdvsPaymentSG = "tab_advspayment_sg3";
    else if (tab.equals(IBridgingLoanUIConstant.TAB_BUILDUP))
        tabBuildUp = "tab_buildup3";
    else if (tab.equals(IBridgingLoanUIConstant.TAB_FDR))
        tabFdr = "tab_fdr3";
%>
<script>
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
                <td width="1%" style="padding-left:5">&nbsp;</td>
                <td width="8%"><a href="javascript:goNextPage('projectinfo');" onclick="MM_nbGroup('down','group1','co1','img/button/project-3.gif',1);" onMouseOver="MM_nbGroup('over','co1','img/button/project-2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabMain%>.gif" name="co1"  border="0" id="Image1" /></a></td>
                <%--
                    ILimitProfile user = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
                    String countryCode = user.getOriginatingLocation().getCountryCode();
                    countryCode = "MY";
                    if (countryCode.equals("MY")) {
                        %><td width="8%"><a href="javascript:goNextPage('advspayment')" onclick="MM_nbGroup('down','group1','co2','img/button/tab_advspayment3.gif',1);" onMouseOver="MM_nbGroup('over','co2','img/button/tab_advspayment2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabAdvsPayment%>.gif" name="co2" border="0"/></a></td><%
                    }
                    else{
                        %><td width="8%"><a href="javascript:goNextPage('advspayment_sg')" onclick="MM_nbGroup('down','group1','co5','img/button/tab_advspayment_sg3.gif',1);" onMouseOver="MM_nbGroup('over','co5','img/button/tab_advspayment_sg2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabAdvsPaymentSG%>.gif" name="co5" border="0"/></a></td><%
                    }
                --%>
                <td width="8%"><a href="javascript:goNextPage('advspayment')" onclick="MM_nbGroup('down','group1','co2','img/button/tab_advspayment3.gif',1);" onMouseOver="MM_nbGroup('over','co2','img/button/tab_advspayment2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabAdvsPayment%>.gif" name="co2" border="0"/></a></td>
                <td width="8%"><a href="javascript:goNextPage('buildup');" onclick="MM_nbGroup('down','group1','co3','img/button/tab_buildup3.gif',1)" onMouseOver="MM_nbGroup('over','co3','img/button/tab_buildup2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabBuildUp%>.gif" name="co3" border="0" id="Image3" /></a></td>
                <td width="8%"><a href="javascript:goNextPage('fdr');" onclick="MM_nbGroup('down','group1','co4','img/button/tab_fdr3.gif',1);" onMouseOver="MM_nbGroup('over','co4','img/button/tab_fdr2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabFdr%>.gif" name="co4" border="0" id="Image3" /></a></td>
                <td width="26%">
                <td width="22%">&nbsp; </td>
                <td width="11%" style="padding-right:5px ">&nbsp;</td>
                <td width="2%">&nbsp;</td>
                <td width="6%">&nbsp;</td>
            </tr>
            </table>
        </td>
    </tr>
</table>