<%@ page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.insurance.InsuranceAction"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.IValuation"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.CollateralAction"%>


<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
    IValuation valuation = (IValuation) request.getAttribute("valuationFromLOS");
    
   // System.out.println("IValuation == null ? " + (valuation == null));
    
    String indexID = (String)request.getParameter("indexID");
    String from_page = request.getParameter("from_page");
    String formActionName = request.getParameter("formActionName");
    String subtype = request.getParameter("subtype");

    String returnEvent = CollateralAction.EVENT_READ_RETURN;
    if (CollateralAction.EVENT_PREPARE_UPDATE.equals(from_page)) {
	    returnEvent = CollateralAction.EVENT_UPDATE_RETURN;
	      //returnEvent = CollateralAction.EVENT_UPDATE;
    }
  	else if (CollateralAction.EVENT_PROCESS.equals(from_page)||
        	CollateralAction.EVENT_PROCESS_UPDATE.equals(from_page)){
        	
	    returnEvent = CollateralAction.EVENT_PROCESS_RETURN;
    }
    else if(CollateralAction.EVENT_CLOSE.equals(from_page)){
	    
	    returnEvent = CollateralAction.EVENT_CLOSE_RETURN;
    }
    
    boolean displayDateFSV = true;    // for MBB-1391 by jitu


    if (formActionName.startsWith("Asset")  || formActionName.startsWith("Prop") ){
        displayDateFSV = false;
    }

	String[] style = {"even", "odd"};
	int count = 0;
    
%>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function returnPage() {

//    document.forms[0].action.value = "AssetSpecOtherCollateral.do?event=read&flag=1&collateralID20031001961";
    document.forms[0].event.value = "<%=InsuranceAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}
//-->
</script>

</head>

<body >
<!-- InstanceBeginEditable name="Content" -->
<html:form action="AssetSpecOtherCollateral.do">

    <input type="hidden" name="event" value="<%=InsuranceAction.EVENT_FORWARD%>"/>
    <input type="hidden" name="indexID" value="<%=indexID%>"/>
    <input type="hidden" name="next_page"/>
<input type="hidden" name="from_page"/>
<input type="hidden" name="subtype"/>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.valuation.from.los" /></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
 
          <tr class="<%=style[count++%2] %>">
                <td width="20%" class="fieldname"><bean:message key="label.valuation.valuer" /></td>
                <td width="30%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VALUER, valuation.getValuerName())%>"/>&nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.valuation.date" /></td>
                <td width="30%"><integro:date object="<%=valuation.getValuationDate()%>" />&nbsp;</td>
          </tr>

          <tr class="<%=style[count++%2] %>">
                <td width="20%"  class="fieldname"><bean:message key="label.valuation.currency" /></td>
                <td><integro:empty-if-null value="<%=valuation.getCurrencyCode()%>"/>&nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.valuation.omv.amount" /></td>
                <td>
                    <% if (valuation.getCMV() !=  null && valuation.getCMV().getAmount() > 0 ){ %>
                        <integro:amount param="amount" amount="<%=valuation.getCMV()%>" decimal="2"/>
                    <% }  %>
                    &nbsp; </td>
          </tr>

          <tr class="<%=style[count++%2] %>">
                <td class="fieldname"><bean:message key="label.valuation.date.received"/> </td>
                <td><integro:date object="<%=valuation.getUpdateDate()%>"/> &nbsp;</td>
                <td class="fieldname"><bean:message key="label.valuation.type" /></td>
                <td>
                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.VALUATION_TYPE, valuation.getValuationType())%>"/>
                   &nbsp;</td>
          </tr>

          <%if (!displayDateFSV){ %>
          <tr class="<%=style[count++%2] %>">
                <td class="fieldname"><bean:message key="label.valuation.fsv.amount"/> </td>
                <td colspan="3">
                 <% if (valuation.getFSV() !=  null && valuation.getFSV().getAmount() > 0 ){ %>
                        <integro:amount param="amount" amount="<%=valuation.getFSV()%>" decimal="2"/>
                    <% }  %>
                    &nbsp; </td>
          </tr>
           <% } %>
        </tbody>
      </table>

      </td>
    </tr>
  </tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
                         
        <a href="<%=formActionName%>?event=<%=returnEvent%>"   onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a> 

        <%--<a href="<%=formActionName%>?event=<%=returnEvent%>"   onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>--%>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>

</body>
</html>

