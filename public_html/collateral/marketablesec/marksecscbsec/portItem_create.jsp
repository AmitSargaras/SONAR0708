<%@ page import="com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.ui.collateral.marketablesec.marksecscbsec.EquityTypeList,
                com.integrosys.cms.ui.collateral.marketablesec.PortItemForm,
                 com.integrosys.cms.ui.common.StockExchangeList,
                 com.integrosys.cms.app.feed.bus.stock.IStockExchange,
                 java.util.Arrays,
                 java.util.Comparator,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.feed.bus.stock.StockExchangeComparator,                 
                 com.integrosys.cms.app.common.constant.ICMSConstant"
%>

<%
    PortItemForm aForm = (PortItemForm)request.getAttribute("PortItemForm");

    StockExchangeList stockExchangeList = StockExchangeList.getInstance();
    IStockExchange[] stockExchangesArr = stockExchangeList.getStockExchanges();
    Arrays.sort(stockExchangesArr, new StockExchangeComparator());
        
    List labels = new ArrayList();
    List values = new ArrayList();
    for (int i = 0; i < stockExchangesArr.length; i++) {
        labels.add(stockExchangesArr[i].getStockExchangeName());
        values.add(stockExchangesArr[i].getStockExchangeCode());
    }

    pageContext.setAttribute("stockMarketID", values);
    pageContext.setAttribute("stockMarketValue", labels);

    ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.serviceColObj");
    String subtypeCode = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();

%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function changeGovtName(theOpt){
    document.forms[0].govtName.disabled=theOpt;
}

function updateInternal() {
    document.forms[0].secCustodianExt.value = '';
    document.forms[0].secCustodianExt.disabled = true;
    document.forms[0].secCustodianInt.disabled = false;
}

function updateExternal() {
    document.forms[0].secCustodianInt.value = '';
    document.forms[0].secCustodianInt.disabled = true;
    document.forms[0].secCustodianExt.disabled = false;
}

function submitPage(num) {
	enableAllFormElements();

    if (num == 1) {
    	document.forms[0].event.value="marksecscbsec_create";
    }
	if (num == 2) {
    	document.forms[0].event.value="marksecscbsec_update";
    }
    if (num == 3) {
        document.forms[0].event.value="cancel";
    }
    document.forms[0].submit();
}

function checkNoOfUnit(){
	var noOfUnit = document.forms[0].noOfUnit.value;
	var tempNoOfUnit="";
	for(i=0;i<noOfUnit.length;i++){
		if(noOfUnit.charAt(i)!=","){
			tempNoOfUnit += noOfUnit.charAt(i);
		}
	} 
	document.forms[0].noOfUnit.value = tempNoOfUnit;
}

//-->
</script>
<script type="text/javascript" src="js/calDriver.js"></script>

</head>

<body>
<%@ include file="/collateral/ssc.jsp"%>

<html:form action="MarketPortItem.do">
<input type="hidden" name="event"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>" />

<% int index =2;

if ("marksecscbsec_prepare".equals(request.getParameter("event")) 
		|| "marksecscbsec_create".equals(request.getParameter("event"))) {
  	index = 1;
}
%>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.sec.details"/> - <% if (index == 1) { %> New <% } else { %> Edit <% } %></h3></td>
          <!-- CR CMS-99 -->
<!--            	  <TD vAlign=bottom align=right >
            	  <TABLE cellSpacing=0 class="tblFormSection" width="35%">
            	    <TBODY>
            	    <TR>
            	    <TD class="edit">&nbsp;</TD>
            	    <TD >SSC Editable Field </TD>
            	    </TR>
            	    </TBODY></TABLE>
            	  </TD>     -->
      <!-- CR CMS-99 -->
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
    <input type="hidden" name="isSSC" value="<%=String.valueOf(isSSC)%>"/>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td width="20%" class="fieldname"><bean:message key="label.security.equity.type"/>&nbsp;<span class="mandatory">*</span></td>
              <td>
              <html:select property="equityType">
              <option value="" ><bean:message key="label.please.select"/> </option>
              <html:options name="equityTypeID" labelName="equityTypeValue" />
              </html:select>
              <html:errors property="equityType"/>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.security.cert.num"/></td>
              <td>
              <html:text property="certNo" size="20" maxlength="20"/>&nbsp;
              <html:errors property="certNo"/>
              </td>
            </tr>
            <tr class="odd">
              <td width="20%" class="fieldname"><bean:message key="label.security.reg.owner"/>&nbsp;<span class="mandatory">*</span></td>
              <td>
              <html:text property="registeredName" maxlength="50"/>&nbsp;
              <html:errors property="registeredName"/>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
              <td width="20%" class="fieldname"><bean:message key="label.marketsec.port.detail.noofunits"/>&nbsp;
              	<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td>
              <html:text property="noOfUnit" maxlength="15"/>&nbsp;
              <html:errors property="noOfUnit"/>
              </td>
              <td width="20%" class="fieldname"><bean:message key="label.predeal.unit.price"/></td>
              <html:hidden property="unitPriceCcyCode"/>
              <html:hidden property="unitPrice"/>
              <td width="30%"><bean:write name="PortItemForm" property="unitPriceCcyCode"/>&nbsp;<bean:write name="PortItemForm" property="unitPrice"/>&nbsp;</td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.nominal.value"/></td>
              <td>
              <html:text property="nominalValue" maxlength="15"/>&nbsp;
              <html:errors property="nominalValue"/>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.custodian"/> &nbsp;</td>
            <td>
                <% boolean isInternal = false;
                    if (isUpdate && aForm.getSecCustodianType() != null)
                        isInternal = aForm.getSecCustodianType().equals(ICMSConstant.INTERNAL_COL_CUSTODIAN);
                %>
                <html:radio property="secCustodianType" value="<%=ICMSConstant.INTERNAL_COL_CUSTODIAN%>"  onclick="updateInternal()">
                    <bean:message key="label.security.custodian.internal"/></html:radio>
                <br>
                <html:select property="secCustodianInt" disabled="<%=!isUpdate || !isInternal%>">
                    <option value=""><bean:message key="label.please.select"/> </option>
                    <html:options name="secCustodianID" labelName="secCustodianList"/>
                </html:select>
                <html:errors property="secCustodianInt"/>
                <br>
                <html:radio property="secCustodianType" value="<%=ICMSConstant.EXTERNAL_COL_CUSTODIAN%>"  onclick="updateExternal()">
                    <bean:message key="label.security.custodian.external"/></html:radio>
                <br>
                <html:text property="secCustodianExt" size="30" maxlength="50" disabled="<%=!isUpdate || isInternal%>"/>&nbsp;
                <html:errors property="secCustodianExt"/>
            </td>
              <td class="fieldname"><bean:message key="label.security.maturity.date"/>
              	&nbsp;<span class="mandatoryPerfection">*</span></td>
              <td>
		<html:text property="secMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('secMaturityDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="secMaturityDate"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.security.referred"/>&nbsp;<span class="mandatory">*</span></td>
               
              <td>
              <html:radio property="secBlackListed" value="true"/><bean:message key="label.common.yes"/>
              &nbsp;&nbsp;
              <html:radio property="secBlackListed" value="false"/><bean:message key="label.common.no"/>
              	<html:errors property="secBlackListed"/>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td >&nbsp;</td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.issuer.name"/></td>
              <td>
              <html:text property="issuerName" maxlength="50"/>&nbsp;
              <html:errors property="issuerName"/>
              </td>
              <td class="fieldname"><bean:message key="label.security.issuer.identify.type"/></td>
              <td>
              <html:text property="isserIdentType" maxlength="12"/>&nbsp;
              <html:errors property="isserIdentType"/></td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.stock.exchange"/></td>
              
              <td>
              <html:select property="stockExchange">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="stockMarketID" labelName="stockMarketValue"/>
                    </html:select>
              </td>
              <td class="fieldname"><bean:message key="label.security.stock.exchange.country"/></td>
              <td>
              <html:select property="countryStockExchange">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="countryValues" labelName="countryLabels"/>
                    </html:select>
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.security.local.stock.exchange"/></td>
              <td >
              <%
                  if (aForm.getLocalStockExchange().equals(ICMSConstant.TRUE_VALUE)) {
              %>
              <bean:message key="label.common.yes"/>
              <% } else { %>
              <bean:message key="label.common.no"/>
              <% } %>
              <html:hidden property="localStockExchange"/>
              </td>
              <td class="fieldname"><bean:message key="label.security.index.name"/></td>
              <td>
              <html:text property="indexName" maxlength="50"/>&nbsp;
              <html:errors property="indexName"/>
              </td>
            </tr>
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.ric"/></td>
              <td>
              <html:text property="ric" maxlength="20"/>&nbsp;
              <html:errors property="ric"/>
              </td>
              <td class="fieldname"><bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
               
              <td>
              <html:select property="xchangeCtrlObtained">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="ExchangeControlID" labelName="ExchangeControlValue"/>
                    </html:select>
                <html:errors property="xchangeCtrlObtained"/>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<%-- <%@ include file="/collateral/marketablesec/portfolio_detail.jsp" %> --%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                      <% if (!isSSC) { %>
         <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(<%=index%>)" onclick = "checkNoOfUnit()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image142" width="60" height="22" border="0" id="Image142" /></a></td>

         <td width="100" valign="baseline" align="center"> <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
         <% } else { %>
         <td width="100" colspan="2" valign="baseline" align="center"> <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
         <% } %>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
					  <tr><td height="50">&nbsp;</td></tr>
                    </table>
</html:form>

</body>
</html>
