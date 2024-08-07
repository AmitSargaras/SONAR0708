<%@ page import="com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%
    String tab = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.tab");
    String tabGeneralInfo = "geninfo1";
    String tabDocument = "doc1";
    String tabDealInfo = "dealinfo1";
    String tabFinance = "PandS1";

    if (tab != null) {
        if (tab.equals(CommodityDealConstant.TAB_GENERAL_INFO)) {
            tabGeneralInfo = "geninfo3";
        } else if (tab.equals(CommodityDealConstant.TAB_DOCUMENT)) {
            tabDocument = "doc3";
        } else if (tab.equals(CommodityDealConstant.TAB_DEAL_INFO)) {
            tabDealInfo = "dealinfo3";
        } else if (tab.equals(CommodityDealConstant.TAB_PS_HEDGING)) {
            tabFinance = "PandS3";
        }
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

function goNextPage(num){
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}

    if (num == 1) {
        document.forms[0].next_page.value = "<%=CommodityDealConstant.GENERAL_INFO%>";
    }
    if (num == 2) {
        document.forms[0].next_page.value = "<%=CommodityDealConstant.DOC%>";
    }
    if (num == 3) {
        document.forms[0].next_page.value = "<%=CommodityDealConstant.DEAL_INFO%>";
    }
    if (num == 4) {
        document.forms[0].next_page.value = "<%=CommodityDealConstant.FINANCE%>";
    }
    document.forms[0].submit();
}

//-->
</script>
<table width="100%" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td height="33" valign="bottom" bgcolor="#EEEEEE">
      <table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr>
          <td width="5%"><a href="javascript:goNextPage(1)" onclick="MM_nbGroup('down','group1','co1','img/geninfo3.gif',1)" onmouseover="MM_nbGroup('over','co1','img/geninfo2.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="img/<%=tabGeneralInfo%>.gif" name="co1"  border="0" id="Image1" /></a></td>
          <td width="5%"><a href="javascript:goNextPage(3)" onclick="MM_nbGroup('down','group1','co3','img/dealinfo3.gif',1)" onmouseover="MM_nbGroup('over','co3','img/dealinfo2.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="img/<%=tabDealInfo%>.gif" name="co3" border="0" id="Image3" /></a></td>
          <td width="5%"><a href="javascript:goNextPage(2)" onclick="MM_nbGroup('down','group1','co2','img/doc3.gif',1)" onmouseover="MM_nbGroup('over','co2','img/doc2.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="img/<%=tabDocument%>.gif" name="co2" border="0" id="Image2" /></a></td>          
          <td width="5%"><a href="javascript:goNextPage(4)" onclick="MM_nbGroup('down','group1','co5','img/PandS3.gif',1)" onmouseover="MM_nbGroup('over','co5','img/PandS2.gif','',1)" onmouseout="MM_nbGroup('out')"><img src="img/<%=tabFinance%>.gif" name="co5" border="0" id="Image5" /></a></td>
		  <td width="75%"> </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

