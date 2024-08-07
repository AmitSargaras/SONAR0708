<%@ page import="com.integrosys.cms.ui.collateral.CollateralConstant,
				 com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeAction"%>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetgencharge/AssetGenCharge_frame.jsp,v 1.2 2005/04/08 15:08:06 hshii Exp $
    *
    * Purpose: Process to approve Collateral
    * Description: Asset Based
    *
    * @author $Author: hshii $<br>
    * @version $Revision: 1.2 $
    * Date: $Date: 2005/04/08 15:08:06 $
    * Tag: $Name:  $
    */
%>

<%
    String tab = (String)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.tab");
    String tabGeneral = "tab_general1";
    String tabStock = "tab_stock1";
    String tabDebtors = "tab_debtors1";
    String tabFAO = "tab_fixedasset1";
    String tabDrawingPower = "tab_drawingpower1";

    if (tab != null) {
        if (tab.equals(CollateralConstant.TAB_GENERAL)) {
            tabGeneral = "tab_general3";
        } else if (tab.equals(CollateralConstant.TAB_STOCK)) {
            tabStock = "tab_stock3";
        } else if (tab.equals(CollateralConstant.TAB_DEBTOR)) {
            tabDebtors = "tab_debtors3";
        } else if (tab.equals(CollateralConstant.TAB_FAO)) {
            tabFAO = "tab_fixedasset3";
        } else if (tab.equals(CollateralConstant.TAB_DRAWING_POWER)) {
	        tabDrawingPower = "tab_drawingpower3";
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
        document.forms[0].next_page.value = "<%=CollateralConstant.TAB_GENERAL%>";
    }
    if (num == 2) {
        document.forms[0].next_page.value = "<%=CollateralConstant.TAB_STOCK%>";
    }
    if (num == 3) {
        document.forms[0].next_page.value = "<%=CollateralConstant.TAB_DEBTOR%>";
    }
    if (num == 4) {
        document.forms[0].next_page.value = "<%=CollateralConstant.TAB_FAO%>";
    }
    if (num == 5) {
	    document.forms[0].next_page.value = "<%=CollateralConstant.TAB_DRAWING_POWER%>";
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
          <td width="1%" style="padding-left:5">&nbsp;</td>
          <td width="10%"><a href="#" onclick="javascript:goNextPage(1)" onClick="MM_nbGroup('down','group1','co1','img/button/tab_general3.gif',1);" onMouseOver="MM_nbGroup('over','co1','img/button/tab_general2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabGeneral%>.gif" name="co1"  border="0" id="Image1" /></a></td>
          <td width="10%"><a href="#" onclick="javascript:goNextPage(2)" onClick="MM_nbGroup('down','group1','co2','img/button/tab_stock3.gif',1);" onMouseOver="MM_nbGroup('over','co2','img/button/tab_stock2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabStock%>.gif" name="co2" border="0" id="Image2" /></a></td>
          <td width="10%"><a href="#" onclick="javascript:goNextPage(3)" onClick="MM_nbGroup('down','group1','co3','img/button/tab_debtors3.gif',1);" onMouseOver="MM_nbGroup('over','co3','img/button/tab_debtors2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabDebtors%>.gif" name="co3" border="0" id="Image3" /></a></td>
          <td width="16%"><a href="#" onclick="javascript:goNextPage(4)" onClick="MM_nbGroup('down','group1','co5','img/button/tab_fixedasset3.gif',1);" onMouseOver="MM_nbGroup('over','co5','img/button/tab_fixedasset2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabFAO%>.gif" name="co5" border="0" id="Image5" /></a></td>
	      <td width="13%"><a href="#" onclick="javascript:goNextPage(5)" onClick="MM_nbGroup('down','group1','co6','img/button/tab_drawingpower3.gif',1);" onMouseOver="MM_nbGroup('over','co6','img/button/tab_drawingpower2.gif','',1)" onMouseOut="MM_nbGroup('out')"><img src="img/button/<%=tabDrawingPower%>.gif" name="co6" border="0" id="Image5" /></a></td>
          <td width="12%">&nbsp; </td>
          <td width="10%">&nbsp;</td>
          <td width="8%" style="padding-right:5px "><input name="insuranceShortfall" type="button" class="btnNormal"  style="width:210px " value=" Print Insurance Shortfall Reminder" onclick="gotopage('AssetGenChargeCollateral.do?event=<%=AssetGenChargeAction.EVENT_PRINT_SHORTFALL_REMINDER%>')"/></td>
          <td width="10%"><input name="drawingPower" type="button" class="btnNormal" style="width:180px " value="Print Approved Drawing Power" onclick="gotopage('AssetGenChargeCollateral.do?event=<%=AssetGenChargeAction.EVENT_PRINT_DRAWING_POWER%>')"/></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
