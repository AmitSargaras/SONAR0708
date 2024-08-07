<%@page import="com.integrosys.cms.app.collateral.bus.type.marketable.linedetail.IMarketableEquityLineDetail"%>
<%@ page import="com.integrosys.cms.ui.collateral.*,
				 com.integrosys.cms.app.collateral.bus.*,
				 com.integrosys.base.techinfra.util.DateUtil,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.type.marketable.IMarketableEquity,
                 com.integrosys.cms.app.collateral.bus.type.marketable.subtype.otherlistedlocal.IOtherListedLocal,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.marketablesec.marksecotherlistedlocal.MarksecOtherListedLocalForm,java.text.DecimalFormat"%>
<%@page import="com.integrosys.cms.app.feed.bus.stock.OBStockFeedEntry"%>
                 <%@page import="com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/marketablesec/marksecotherlistedlocal/MarksecOtherListedLocal_update.jsp,v 1.61 2006/11/23 02:59:37 jzhan Exp $
*
* Purpose: Update -- Submit or Save Collateral
* Description: Type - Marketable Securities, Subtype - Portfolio others
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.61 $
* Date: $Date: 2006/11/23 02:59:37 $
* Tag: $Name: DEV_20061123_B286V1 $
*/
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%	DecimalFormat dft = new DecimalFormat("#0.00");
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.serviceColObj");

	IOtherListedLocal iCol = (IOtherListedLocal) itrxValue.getStagingCollateral();

    String subtypeCode = iCol.getCollateralSubType().getSubTypeCode();
    String formName = "MarksecOtherListedLocalForm";
    String prefix = "Mark";
    String subtype = "MarksecOtherListedLocal";
    String from_event = "prepare_update";
    String formActionName = subtype + "Collateral.do";
	String event = itrxValue.getCollateral()==null ? "create" : "update";
    MarksecOtherListedLocalForm colForm = (MarksecOtherListedLocalForm) request.getAttribute(formName);
    String from = (String) session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.from");
    double x=0.00;
    
IStockFeedEntry obStockFeedEntry = null;
    
    List   StockList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.StockList");
    if(StockList!= null){
      	for(int i = 0; i< StockList.size() ; i++)
      	{
      		obStockFeedEntry = (OBStockFeedEntry)StockList.get(i);
      		String str = 	obStockFeedEntry.getScriptCode();	
  			String str1 = 	obStockFeedEntry.getStockExchangeName();	
      		String str2 = 	obStockFeedEntry.getScriptName();	
      	}
      }
    String prefix1 = "Mark";
%>


<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/collateral_helper.js"></script><!-- "submitData" can be found here -->
<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
/*function selectLists(){
    List = document.forms[0].secInstrument;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
    }
}*/

function submitPage(num, index) {
    enableAllFormElements();
    //selectLists();

    if (num == 1) {
    	document.forms[0].event.value="submit";
    }
	if (num == 2) {
    	document.forms[0].event.value="update";
    }
    if (num == 3) {
        document.forms[0].event.value="itemDelete";
        document.forms[0].itemType.value="PORTITEM";
    }
    if (num == 4) {
        document.forms[0].event.value="marksecotherlistedlocal_prepare";
        document.forms[0].indexID.value="-1";
        document.forms[0].itemType.value="PORTITEM";
    }
    if (num == 5) {
        document.forms[0].event.value="marksecotherlistedlocal_prepare_update_sub";
        document.forms[0].indexID.value=index;
        document.forms[0].itemType.value="PORTITEM";
    }
    if (num == 9) {
        document.forms[0].event.value="update_read_valuation_from_los";
    	document.forms[0].indexID.value=index;
    	document.forms[0].from_page.value="prepare_update";
    }

    document.forms[0].submit();

}

function manda11(obj) {
	if (obj == "Y")
    {
		if (document.getElementById('span11') != null)
			document.getElementById('span11').innerText = "* ";
    }
    else {
		if (document.getElementById('span11') != null)
			document.getElementById('span11').innerText = " ";
    }
}

function changeValAftMargin() {
    var margin = document.forms[0].margin.value.replace(',', '');
    var valBefMargin = 0;
    if (document.forms[0].valBefMargin.value != null && document.forms[0].valBefMargin.value != "") {
        valBefMargin = parseFloat(document.forms[0].valBefMargin.value.split(',').join(''));
    }
    document.forms[0].valAftMargin.value = Math.round((margin / 100) * valBefMargin);
}
//-->
</script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>
<%@ include file="/collateral/check_user.jsp"%>

<html:form action="MarksecOtherListedLocalCollateral.do">
<input type="hidden" name="event">
<input type="hidden" name="subtype" value="MarksecOtherListedLocal"/>
<input type="hidden" name="indexID" />
<input type="hidden" name="itemType" />
<input type="hidden" name="from_page"/>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td colspan="2"><h3>
			<% if (event.equals("create")) { %>
				<bean:message key="label.security.title.create.marketable"/>
			<% } else { %>
				<bean:message key="label.security.title.edit.marketable"/>
			<% } %>
		</h3></td>
    </tr>
  </thead>
</table>

<%@ include file="/collateral/common/common_theme_tab.jsp"%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.general"/></h3></td>
      <td width="50%" align="right">
            <%    if (isDeleting) {             %>
                    <p class="deletedItem">
                    DELETED
                    </p>
            <% } %>
      </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tbody>
				<%@ include file="/collateral/common/update_basic_security_fields.jsp" %>
          </tbody>
        </table></td>
    </tr>
    <%@ include file="/collateral/collateral_general_common_field.jsp" %>
	</tbody>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
</table>

<!--CERSAI Fields JSP @Required actionPathName from update_basic_security_fields jsp and prefix -->
 	<%@ include file="/collateral/common/update_common_cersai_fields.jsp" %>
 	

<%--<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	    <tr>
			<td> <h3><bean:message key="label.security.additional.information"/></h3></td>
	    </tr>
	    <tr>
			<td colspan="2"> <hr/> </td>
	    </tr>
	</thead>
    <tr>
		<td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tbody>
	            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				 	<td width="20%" class="fieldname"><bean:message key="label.security.legal.enforceability"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
				 	<td width="30%">
						<html:select property="le" onchange="manda11(this.value)">
							<option value="" ><bean:message key="label.please.select"/> </option>
							<html:options name="LEID" labelName="LEValue"/>
						</html:select>
						<html:errors property="le"/></td>
				 	<td width="20%"  class="fieldname"><bean:message key="label.security.legal.enforceability.date"/>&nbsp;<span class="mandatoryPerfection">*</span><font color="#0000FF"><span id="span11">&nbsp;</span></font></td>
				 	<td width="30%">
						<html:text property="leDate" readonly="true" />
						<img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('leDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
						<html:errors property="leDate"/></td>
				</tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
					<td class="fieldname">
						<bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
					<td><html:text property="perfectionDate" readonly="true" size="15" maxlength="11"/>
						<img src="img/calendara.gif" name="Image723" border="0" alt="" id="Image723"
							 onclick="showCalendar('perfectionDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
							 onmouseout="MM_swapImgRestore()"/>&nbsp;<html:errors property="perfectionDate"/></td>
					<td class="fieldname">
						<bean:message key="label.security.borrower.collateral" /> </td>
					<td><html:radio property="borrowerDependency" value="<%=ICMSConstant.TRUE_VALUE%>"><bean:message key="label.common.yes"/> </html:radio> &nbsp; 
						<html:radio property="borrowerDependency" value="<%=ICMSConstant.FALSE_VALUE%>"><bean:message key="label.common.no"/> </html:radio> &nbsp;  </td>
				</tr>
				<%@ include file="../update_common_charge.jsp" %>				
			</tbody>
		</table>     
		</td>
    </tr>
  </tbody>
</table>

--%><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
  <thead>
    <tr>
    <td> <h3><bean:message key="label.security.sec.details"/></h3></td>
    <td align="right" valign="baseline">
    <% if (!isSSC) { %>
    <input class="btnNormal" type="button" name="mktsecSubmit" value="Add New" onclick="javascript:submitPage(4, -1)"/>
    &nbsp; <input name="mktsecRemove1" type="button" class="btnNormal" value="Remove" onclick="javascript:submitPage(3, 0)"/>
    <% } %>
    </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
            <tr>
              <td width="2%"><bean:message key="label.global.sn"/></td>
              <td width="5%"><bean:message key="label.global.script.code"/></td>
               <td width="5%"><bean:message key="label.global.script.name"/></td>
              <!-- <td width="26%"><bean:message key="label.security.issuer.name"/></td> --><%--
              <td width="5%"><bean:message key="label.global.script.name"/></td>
              --%><td width="8%"><bean:message key="label.marketsec.port.detail.noofunits"/></td>
              <td width="11%"><bean:message key="label.global.total.value"/></td>
              <%--<td width="24%"><bean:message key="label.predeal.unit.price"/> /
              <bean:message key="label.security.valuation.unit.price"/></td> 
              --%>
              
              <td width="10%"><bean:message key="label.security.line"/></td>
			  <td width="10%"><bean:message key="label.security.serial"/></td>
			  <td width="10%"><bean:message key="label.security.fas.no"/></td>
			  <td width="5%"><bean:message key="label.security.ltv"/></td>
			  <td width="30%"><bean:message key="label.security.remarks"/></td>
              
              <td width="10%"><bean:message key="label.global.action"/></td>
              <td width="5%"><bean:message key="label.global.delete"/></td>
              
            </tr>
          </thead>
          <tbody>
            <%
                IMarketableEquity[] equity = iCol.getEquityList();

                   String classtype = "odd";
                if (equity != null) {
                    if (equity.length == 0) {
				%>
                <tr class="<%=classtype%>">
                <td colspan="12"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

				<% } for (int counter = 0; counter < equity.length; counter++) { %>
                        <%
                                  if ( equity[counter] == null )
                                      continue;


                                %>
                    <tr class="<%=classtype%>">
                      <td class="index"><%=counter + 1%></td><%--
                      <td width="26%"><integro:empty-if-null value="<%=equity[counter].getIssuerName()%>"/>&nbsp;</td>

                      --%>
                      <td>
                      <integro:empty-if-null value="<%=equity[counter].getIsinCode()%>"/>&nbsp;
                      </td>
                       <td>
                        <%
                      String str = "";
                      for(int i = 0; i< StockList.size() ; i++)
                  	{
                    	 boolean isStockExchangeOthers = false; 
                    	 String stockExch = equity[counter].getStockExchange();
                    	 
                    	 if(stockExch.equals("001"))
                    	 {
                    		 stockExch = "BSE"; 
                    	 }else if(stockExch.equals("002"))
                    	 {
                    		 stockExch = "NSE"; 
                    	 }else if(stockExch.equals("003"))
                    	 {
                    		 stockExch = "Others"; 
                    		 isStockExchangeOthers = true;
                    	 }else 
                    	 {
                    		 stockExch = "-"; 
                    	 }
                    	  obStockFeedEntry = (OBStockFeedEntry)StockList.get(i);
                  		if((obStockFeedEntry.getScriptCode().equals(equity[counter].getIsinCode())) && 
                  				(isStockExchangeOthers? equity[counter].getStockExchange().equals(obStockFeedEntry.getGroupStockType()) :
                  					obStockFeedEntry.getStockExchangeName().equals(stockExch)))
                  		{
                  			 str = 	obStockFeedEntry.getScriptName();	
                  		}
                  		
              			
                  	} 
                  	%>
                  	<%=str %>&nbsp;
                       </td>
                     
                      <td valign="right">
<!--Start- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->                      
                      <%=Double.valueOf(equity[counter].getNoOfUnits()).longValue()%>&nbsp;
                        </td>
                        <%long getNoOfUnits =Double.valueOf(equity[counter].getNoOfUnits()).longValue();
//-End- Added by Uma Khot- CAM QUARTER ACTIVITY CR: allow decimal in NoofUnits for Security Sub-type Mutual Funds. -->                        
                        double amount = equity[counter].getValuationUnitPrice().getAmount();
                        double totalValue = (double)getNoOfUnits*amount;
                        %>
                        	<%x=x+equity[counter].getNoOfUnits() * equity[counter].getValuationUnitPrice().getAmount(); %>
                          <td><%=UIUtil.formatWithCommaAndDecimal(dft.format(totalValue)) %>&nbsp;</td>
                      <%--
                      <td width="24%">
                      <% if (equity[counter].getUnitPrice() != null && equity[counter].getUnitPrice().getCurrencyCode() != null) { %>
                      <integro:empty-if-null value="<%=equity[counter].getUnitPrice().getCurrencyCode()%>"/>&nbsp;<%=equity[counter].getUnitPrice().getAmount()%>
                      <% } %>&nbsp; /
                      <% 	if (equity[counter].getValuationUnitPrice() != null && equity[counter].getValuationUnitPrice().getCurrencyCode() != null) { %>
                          <integro:empty-if-null value="<%=equity[counter].getValuationUnitPrice().getCurrencyCode()%>"/>&nbsp;<%=equity[counter].getValuationUnitPrice().getAmount()%>
                      <% } %>&nbsp;
                      </td>
                      --%><input type="hidden" name="stockExchange" value ="<%=equity[counter].getStockExchange()%>">
                      <input type="hidden" name="scriptCode" value = "<%=equity[counter].getIsinCode()%>">
                      
                       <%
                        StringBuffer sbLine = new StringBuffer(); 
                        StringBuffer sbSerial = new StringBuffer();		  
                        StringBuffer sbFasNo = new StringBuffer();
                        StringBuffer sbLtv = new StringBuffer();
                        StringBuffer sbRemarks = new StringBuffer();
                        if(equity[counter].getLineDetails()!= null){
                        	for(IMarketableEquityLineDetail lineDetail : equity[counter].getLineDetails()){
                        		sbLine.append(lineDetail.getLineNumber()!=null? lineDetail.getLineNumber() :"-").append("<br>");
                        		sbSerial.append(lineDetail.getSerialNumber()!=null? lineDetail.getSerialNumber() :"-").append("<br>");
                        		sbFasNo.append(lineDetail.getFasNumber()!=null? lineDetail.getFasNumber() :"-").append("<br>");
                        		sbLtv.append(lineDetail.getLtv()!=null? lineDetail.getLtv() :"-").append("<br>");
                        		sbRemarks.append(lineDetail.getRemarks()!=null? lineDetail.getRemarks() :"-").append("<br>");
                            }
                        }
                         %>
                        <td><integro:empty-if-null value="<%=sbLine.toString() %>"/></td>
						<td><integro:empty-if-null value="<%=sbSerial.toString() %>"/></td>
						<td><integro:empty-if-null value="<%=sbFasNo.toString() %>"/></td>
						<td><integro:empty-if-null value="<%=sbLtv.toString() %>"/></td>
						<td><integro:empty-if-null value="<%=sbRemarks.toString() %>"/></td>
                      <td>

                      <a href="javascript:submitPage(5, <%=counter%>)"><%=isSSC?"View":"View / Edit"%></a>

                      </td>
                      <td><html:multibox property="deleteItem" value="<%=String.valueOf(counter)%>"/></td>
                    </tr>
					<%	if (classtype.equals("odd")) {
              classtype = "even";
          }
          else {
              classtype = "odd";
          }
      }
                } else { %>
                <tr class="<%=classtype%>">
                <td colspan="12"><bean:message key="label.security.no.security.detail"/></td>
                </tr>

                <% } %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%--
<%@ include file="/collateral/view_pledgor.jsp" %>    

<%@ include file="/collateral/view_pledge.jsp" %>

<%@ include file="/collateral/common/view_valuation_from_los.jsp" %>
<%@ include file="/collateral/common/view_system_valuation.jsp" %>
<%@ include file="/collateral/common/update_netRV.jsp" %>

<jsp:include page="/collateral/common/common_maker_remarks.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="trxRemarks" value="<%=itrxValue.getRemarks() %>"/>
	<jsp:param name="trxUserInfo" value="<%=itrxValue.getUserInfo() %>"/>
</jsp:include>
--%>
<%@ include file="/collateral/common/calculated.jsp" %>
<jsp:include page="/collateral/common/common_maker_update_button.jsp" >
	<jsp:param name="trxStatus" value="<%=itrxValue.getStatus() %>"/>
	<jsp:param name="actionName" value="<%=formActionName%>"/>
	<jsp:param name="collateralID" value="<%=(itrxValue.getCollateral() != null) ? itrxValue.getCollateral().getCollateralID(): ICMSConstant.LONG_INVALID_VALUE%>" />
</jsp:include>

<script>
  //  var s = document.forms[0].le.value;
     // manda11(s);
</script>
</html:form>

<%@ include file="/collateral/secapportion/praExceednConfirm.jsp" %>

</body>
</html>
