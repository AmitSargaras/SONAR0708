<%@page import="java.util.Collections"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.covenant.ILmtCovenantConstants"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.covenant.LmtCovenantDetailAction"%>
<%@page import="com.integrosys.cms.ui.manualinput.line.covenant.LineCovenantDetailAction"%>
<%@page import="com.integrosys.cms.ui.manualinput.line.covenant.ILineCovenantConstants"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="java.util.Locale,
				 java.util.Collection,
				 java.util.Iterator,
				 java.util.List,
				 java.util.LinkedHashSet,
				 org.apache.struts.util.LabelValueBean,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICustomerSysXRef,
                 com.integrosys.cms.app.limit.bus.ILimitSysXRef,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.cms.app.limit.trx.OBLimitTrxValue,
                 com.integrosys.cms.ui.manualinput.limit.MILimitUIHelper,
                 com.integrosys.cms.ui.manualinput.line.covenant.LineCovenantDetailForm,
                  com.integrosys.cms.ui.common.CurrencyList,
                  java.text.DecimalFormat,
                  java.math.BigDecimal,
                  com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamEntry"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamGroup"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamDao"%>
<%@page import="com.integrosys.base.techinfra.context.BeanHouse"%>
<%@page import="java.util.*"%>
<%
ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    long oneTeamMshipID = userTeam.getTeamMemberships()[0].getTeamTypeMembership().getMembershipID();
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMr = false;
    String scodLineNoList=PropertyManager.getValue("scod.linenocode.name");
    		//PropertyManager.getValue("scod.linenocode.name");
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
        isMr = true;
    }
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
   
    boolean isUserCpcMaker = false;       
    if(Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I){
    	isUserCpcMaker = true;
    }
    System.out.println("isUserCpcMaker>>>>>>>>>>"+isUserCpcMaker);
    MILimitUIHelper helper = new MILimitUIHelper();
 
    Collection countryList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.countryList");
	request.setAttribute("countryList", countryList);
	
	Collection bankList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.bankList");
	request.setAttribute("bankList", bankList);
	
	Collection currencyList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currList");
	request.setAttribute("currencyList", currencyList);
	
	Collection goodsList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.goodsList");
	request.setAttribute("goodsList", goodsList);
	System.out.println("goodsList "+goodsList);
	
	List sessionCountryListForLine = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_COUNTRY_LIST_LINE);
	List sessionBankListForLine = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_BANK_RESTRICTION_LIST_LINE);
	List sessionCurrencyListForLine = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_CURRENCY_LIST_LINE);
	List sessionDrawerListForLine = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_DRAWER_LIST_LINE);
	List sessionDraweeListForLine = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_DRAWEE_LIST_LINE);
	List sessionBeneListForLine = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_BENE_LIST_LINE);
	
	List goodsParentList = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILmtCovenantConstants.SESSION_DROPDOWN_GOODS_PARENT_LIST);
	if(goodsParentList == null){
		goodsParentList = Collections.emptyList(); 
	}
	pageContext.setAttribute(ILmtCovenantConstants.SESSION_DROPDOWN_GOODS_PARENT_LIST, goodsParentList);

	List goodsChildList = Collections.emptyList();
	pageContext.setAttribute("goodsChildList", goodsChildList);		
	
	List goodsSubChildList = Collections.emptyList();
	pageContext.setAttribute("goodsSubChildList", goodsSubChildList);		
	
	
	List covenantGoodsRestrictionList = (List)session.getAttribute(LmtDetailAction.class.getName() + "." + ILineCovenantConstants.SESSION_COVENANT_GOODS_RESTRICTION_LIST_LINE);
	if(!(covenantGoodsRestrictionList==null)){
		covenantGoodsRestrictionList = new ArrayList<String>(new LinkedHashSet<String>(covenantGoodsRestrictionList));
		pageContext.setAttribute("covenantGoodsRestrictionList", covenantGoodsRestrictionList);
	}else{
		covenantGoodsRestrictionList = new ArrayList();
		pageContext.setAttribute("covenantGoodsRestrictionList", covenantGoodsRestrictionList);
	}
	
	

	
	if (!(sessionCountryListForLine == null)) {
		sessionCountryListForLine = new ArrayList<String>(new LinkedHashSet<String>(sessionCountryListForLine));
		pageContext.setAttribute("sessionCountryListForLine", sessionCountryListForLine);
	}else {
		sessionCountryListForLine = new ArrayList();
		pageContext.setAttribute("sessionCountryListForLine", sessionCountryListForLine);
	}
	
	List covenantGoodsRestrictionListCopy = new ArrayList();  
	if(covenantGoodsRestrictionList != null)
	{
		covenantGoodsRestrictionListCopy = covenantGoodsRestrictionList;
	}
	
	if (!(sessionBankListForLine == null)) {
		sessionBankListForLine = new ArrayList<String>(new LinkedHashSet<String>(sessionBankListForLine));
		pageContext.setAttribute("sessionBankListForLine", sessionBankListForLine);
	}else{
		sessionBankListForLine = new ArrayList();
	pageContext.setAttribute("sessionBankListForLine", sessionBankListForLine);
	}
	
	if (!(sessionCurrencyListForLine == null)) {
		sessionCurrencyListForLine = new ArrayList<String>(new LinkedHashSet<String>(sessionCurrencyListForLine));
		pageContext.setAttribute("sessionCurrencyListForLine", sessionCurrencyListForLine);
	}else {
		sessionCurrencyListForLine = new ArrayList();
	pageContext.setAttribute("sessionCurrencyListForLine", sessionCurrencyListForLine);
	}
	
	if (!(sessionDrawerListForLine == null)) {
		sessionDrawerListForLine = new ArrayList<String>(new LinkedHashSet<String>(sessionDrawerListForLine));
		pageContext.setAttribute("sessionDrawerListForLine", sessionDrawerListForLine);
	}else {
	sessionDrawerListForLine = new ArrayList();
	pageContext.setAttribute("sessionDrawerListForLine", sessionDrawerListForLine);
	}
	
	if (!(sessionDraweeListForLine == null)) {
		sessionDraweeListForLine = new ArrayList<String>(new LinkedHashSet<String>(sessionDraweeListForLine));
		pageContext.setAttribute("sessionDraweeListForLine", sessionDraweeListForLine);
	}else {
	sessionDraweeListForLine = new ArrayList();
	pageContext.setAttribute("sessionDraweeListForLine", sessionDraweeListForLine);
	}
	
	if (!(sessionBeneListForLine == null)) {
		sessionBeneListForLine = new ArrayList<String>(new LinkedHashSet<String>(sessionBeneListForLine));
		pageContext.setAttribute("sessionBeneListForLine", sessionBeneListForLine);
	}else {
	sessionBeneListForLine = new ArrayList();
	pageContext.setAttribute("sessionBeneListForLine", sessionBeneListForLine);
	}
	int dwerNo = 0;
	int dweeNo = 0;
	int beneNo = 0;
	int countryNo = 0;
	int goodsNo= 0;
	int curNo = 0;
	int bankNo = 0;
	
	Map exceptionMap=(HashMap)request.getAttribute("exceptionMap");
	 DefaultLogger.debug(this,"exceptionMap:"+exceptionMap);
	
	String eventForEdit=(String)request.getAttribute("eventForEdit");
	String index = (String)request.getAttribute("index");
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>index ->  "+index);
	System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>eventForEdit -> "+eventForEdit);
	
	String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
	
	String covenantRequired = (String)request.getAttribute("covenantRequired");
	System.out.println("covenantRequired "+covenantRequired);
	
	String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
	pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);
	String adhocFac =(String) request.getParameter("adhocFacility");
	System.out.println("Line_covenant_view.jsp=>adhocFac:"+adhocFac);
%>



<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>

    <script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script type="text/javascript" src="js/ajaxList.js"></script>
    <script type="text/javascript" src="js/ajaxSancAmount.js"></script>
    <script type="text/javascript" src="js/ajaxIncoDescription.js"></script>

    <script language="javascript">

function checkboxCountry(){
		if(document.getElementById('countryRestriction').checked==false){
			var listSize='<%=sessionCountryListForLine.size()%>';
			if(listSize==0){
				document.getElementById('countryRestrictionName').disabled = true;
				document.getElementById('countryRestrictionAmt').disabled = true;
				document.getElementById('btnaddCountry').disabled = true;
				document.forms[0].countryRestriction.value="";
				document.getElementById("countryRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Country Restriction' as it has list of values. If you want to untik kindly delete those values and then retry.");
				document.getElementById('countryRestriction').checked=true;
			}
		}else{
			document.getElementById('countryRestrictionName').disabled = false;
			document.getElementById('countryRestrictionAmt').disabled = false;
			document.getElementById('btnaddCountry').disabled = false;
			document.forms[0].countryRestriction.value="Y";
			document.getElementById("countryRestrictionHidden").value = "Y";
		}
}

function checkboxDrawer(){
		if(document.getElementById('drawerRestriction').checked==false){
			var listSize='<%=sessionDrawerListForLine.size()%>';
			if(listSize==0){
				document.getElementById('drawerCustName').disabled = true;
				document.getElementById('drawerName').disabled = true;
				document.getElementById('drawerAmount').disabled = true;
				document.getElementById('drawerCustId').disabled = true;
				document.getElementById('btnedit_Drawer').disabled = true;
				document.forms[0].drawerRestriction.value="";
				document.getElementById("drawerRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Drawer Restriction' as it has list of values. If you want to untick kindly delete those values and then retry.");
				document.getElementById('drawerRestriction').checked=true;
			}
		}else{
			document.getElementById('drawerCustName').disabled = false;
			document.getElementById('drawerName').disabled = false;
			document.getElementById('drawerAmount').disabled = false;
			document.getElementById('drawerCustId').disabled = false;
			document.getElementById('btnedit_Drawer').disabled = false;
			document.forms[0].drawerRestriction.value="Y";
			document.getElementById("drawerRestrictionHidden").value = "Y";
		}
}
function checkboxDrawee(){
		if(document.getElementById('draweeRestriction').checked==false){
			var listSize='<%=sessionDraweeListForLine.size()%>';
			if(listSize==0){
				document.getElementById('draweeCustName').disabled = true;
				document.getElementById('draweeName').disabled = true;
				document.getElementById('draweeAmount').disabled = true;
				document.getElementById('draweeCustId').disabled = true;
				document.getElementById('btnedit_Drawee').disabled = true;
				document.forms[0].draweeRestriction.value="";
				document.getElementById("draweeRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Drawee Restriction' as it has list of values. If you want to untick kindly delete those values and then retry.");
				document.getElementById('draweeRestriction').checked=true;
			}
		}else{
			document.getElementById('draweeCustName').disabled = false;
			document.getElementById('draweeName').disabled = false;
			document.getElementById('draweeAmount').disabled = false;
			document.getElementById('draweeCustId').disabled = false;
			document.getElementById('btnedit_Drawee').disabled = false;
			document.forms[0].draweeRestriction.value="Y";
			document.getElementById("draweeRestrictionHidden").value = "Y";
		}
}
function checkboxBene(){
		if(document.getElementById('beneRestriction').checked==false){
			var listSize='<%=sessionBeneListForLine.size()%>';
			if(listSize==0){
				document.getElementById('beneficiaryCustName').disabled = true;
				document.getElementById('beneficiaryName').disabled = true;
				document.getElementById('beneficiaryAmount').disabled = true;
				document.getElementById('beneficiaryCustId').disabled = true;
				document.getElementById('btnedit_Bene').disabled = true;
				document.forms[0].beneRestriction.value="";
				document.getElementById("beneRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Beneficiary Restriction' as it has list of values. If you want to untick kindly delete those values and then retry.");
				document.getElementById('beneRestriction').checked=true;
			}
		}else{
			document.getElementById('beneficiaryCustName').disabled = false;
			document.getElementById('beneficiaryName').disabled = false;
			document.getElementById('beneficiaryAmount').disabled = false;
			document.getElementById('beneficiaryCustId').disabled = false;
			document.getElementById('btnedit_Bene').disabled = false;
			document.forms[0].beneRestriction.value="Y";
			document.getElementById("beneRestrictionHidden").value = "Y";
		
		}
}
function checkboxCombinedTenor(){
		if(document.getElementById('combinedTenorRestriction').checked==false){
			if(document.getElementById('preShipmentLinkageYes').checked==true
					|| document.getElementById('postShipmentLinkageYes').checked==true
					|| document.getElementById('preShipmentLinkageNo').checked==true
					|| document.getElementById('postShipmentLinkageNo').checked==true
					|| document.getElementById('maxCombinedTenor').value != ''
					){
				var answer=  confirm("You have unchecked the 'Combined Tenor Covenants' and hence values of 'Max Combined Tenor', 'Buyers Credit' and 'Post-Shipment Linkage' will be cleared. Do you want to proceed.");
				if(answer == true){
					document.getElementById('maxCombinedTenor').value = '';
					document.getElementById('preShipmentLinkageYes').checked = false;
					document.getElementById('postShipmentLinkageYes').checked = false;
					document.getElementById('preShipmentLinkageNo').checked = false;
					document.getElementById('postShipmentLinkageNo').checked = false;
					
					document.getElementById('maxCombinedTenor').disabled = true;
					document.getElementById('preShipmentLinkageYes').disabled = true;
					document.getElementById('postShipmentLinkageYes').disabled = true;
					document.getElementById('preShipmentLinkageNo').disabled = true;
					document.getElementById('postShipmentLinkageNo').disabled = true;
					document.forms[0].combinedTenorRestriction.value="";
					document.getElementById("combinedTenorRestrictionHidden").value = "";
				}else {
					document.getElementById('combinedTenorRestriction').checked=true;
				}
			 }else{
				 	document.getElementById('maxCombinedTenor').disabled = true;
					document.getElementById('preShipmentLinkageYes').disabled = true;
					document.getElementById('postShipmentLinkageYes').disabled = true;
					document.getElementById('preShipmentLinkageNo').disabled = true;
					document.getElementById('postShipmentLinkageNo').disabled = true;
					document.forms[0].combinedTenorRestriction.value="";
					document.getElementById("combinedTenorRestrictionHidden").value = "";
			 }
		}else{
			document.getElementById('maxCombinedTenor').disabled = false;
			document.getElementById('preShipmentLinkageYes').disabled = false;
			document.getElementById('postShipmentLinkageYes').disabled = false;
			document.getElementById('preShipmentLinkageNo').disabled = false;
			document.getElementById('postShipmentLinkageNo').disabled = false;
			document.forms[0].combinedTenorRestriction.value="Y";
			document.getElementById("combinedTenorRestrictionHidden").value = "Y";
		}
}
function checkboxRunningAccount(){
		if(document.getElementById('runningAccountRestriction').checked==false){
			if(document.getElementById('runningAccountYes').checked==true
				|| document.getElementById('runningAccountNo').checked==true
				|| document.getElementById('orderBackedByLCYes').checked==true
				|| document.getElementById('orderBackedByLCNo').checked==true
				|| document.getElementById('incoTerm').value != ''
				|| document.getElementById('incoMargin').value != ''
				|| document.getElementById('incoDescription').value != ''
				|| document.getElementById('moduleCode').value != ''
				|| document.getElementById('commitmentTenor').value != ''
				){
			var answer=  confirm("You have unchecked the 'Running Account(EPC) Covenants' and hence values of 'Running Account', 'Order Backed By LC', 'Inco Term', 'Inco Term Margin', 'Inco Description', 'Module Code' and 'Commitment Tenor' will be cleared. Do you want to proceed.");
			if(answer == true){
				document.getElementById('runningAccountYes').checked = false;
				document.getElementById('runningAccountNo').checked = false;
				document.getElementById('orderBackedByLCYes').checked = false;
				document.getElementById('orderBackedByLCNo').checked = false;
				document.getElementById('incoTerm').value = '';
				document.getElementById('incoMargin').value = '';
				document.getElementById('incoDescription').value = '';
				document.getElementById('moduleCode').value = '';
				document.getElementById('commitmentTenor').value = '';
				
				document.getElementById('runningAccountYes').disabled = true;
				document.getElementById('runningAccountNo').disabled = true;
				document.getElementById('orderBackedByLCYes').disabled = true;
				document.getElementById('orderBackedByLCNo').disabled = true;
				document.getElementById('incoTerm').disabled = true;
				document.getElementById('incoMargin').disabled = true;
				document.getElementById('incoDescription').disabled = true;
				document.getElementById('moduleCode').disabled = true;
				document.getElementById('commitmentTenor').disabled = true;
				document.forms[0].runningAccountRestriction.value="";
				document.getElementById("runningAccountRestrictionHidden").value = "";
			}else {
				document.getElementById('runningAccountRestriction').checked=true;
			}
		 }else{
			 	document.getElementById('runningAccountYes').disabled = true;
				document.getElementById('runningAccountNo').disabled = true;
				document.getElementById('orderBackedByLCYes').disabled = true;
				document.getElementById('orderBackedByLCNo').disabled = true;
				document.getElementById('incoTerm').disabled = true;
				document.getElementById('incoMargin').disabled = true;
				document.getElementById('incoDescription').disabled = true;
				document.getElementById('moduleCode').disabled = true;
				document.getElementById('commitmentTenor').disabled = true;
				document.forms[0].runningAccountRestriction.value="";
				document.getElementById("runningAccountRestrictionHidden").value = "";
		 }
		}else{
			document.getElementById('runningAccountYes').disabled = false;
			document.getElementById('runningAccountNo').disabled = false;
			document.getElementById('orderBackedByLCYes').disabled = false;
			document.getElementById('orderBackedByLCNo').disabled = false;
			document.getElementById('incoTerm').disabled = false;
			document.getElementById('incoMargin').disabled = false;
			document.getElementById('incoDescription').disabled = false;
			document.getElementById('moduleCode').disabled = false;
			document.getElementById('commitmentTenor').disabled = false;
			document.forms[0].runningAccountRestriction.value="Y";
			document.getElementById("runningAccountRestrictionHidden").value = "Y";
		}
}
function checkboxSellDown(){
		if(document.getElementById('sellDownRestriction').checked==false){
			if(document.getElementById('sellDown').value === ''){
				document.getElementById('sellDown').disabled = true;
				document.forms[0].sellDownRestriction.value="";
				document.getElementById("sellDownRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Sell Down Covenant' as it has a value. If you want to untick kindly clear the values and then retry.");
				document.getElementById('sellDownRestriction').checked=true;
			}
			
		}else{
			document.getElementById('sellDown').disabled = false;
			document.forms[0].sellDownRestriction.value="Y";
			document.getElementById("sellDownRestrictionHidden").value = "Y";
		}
}
function checkboxAvailDate(){
		if(document.getElementById('availDateRestriction').checked==false){
			if(document.getElementById('lastAvailableDate').value === ''){
				document.getElementById('lastAvailableDate').disabled = true;
				document.forms[0].availDateRestriction.value="";
				document.getElementById("availDateRestrictionHidden").value = "";
			}else{
				var answer=  confirm("You have unchecked the 'Last Available Date Covenant' and hence value of 'Last Available Date' will be cleared. Do you want to proceed.");
				if(answer == true){
					document.getElementById('lastAvailableDate').value = '';
					
					document.getElementById('lastAvailableDate').disabled = true;
					document.forms[0].availDateRestriction.value="";
					document.getElementById("availDateRestrictionHidden").value = "";
				}else{
					document.getElementById('availDateRestriction').checked=true;
				}
			}
		}else{
			document.getElementById('lastAvailableDate').disabled = false;
			document.forms[0].availDateRestriction.value="Y";
			document.getElementById("availDateRestrictionHidden").value = "Y";
		}
}
function checkboxMoratorium(){
		if(document.getElementById('moratoriumRestriction').checked==false){
			if(document.getElementById('moratorium').value != '0'
					|| document.getElementById('emiFrequency').value != ''
					|| document.getElementById('noOfInsallments').value != ''){
				var answer=  confirm("You have unchecked the 'Moratorium Covenants' and hence values of 'Moratorium', 'EMI Frequency' and 'No Of Installments' will be cleared. Do you want to proceed.");
				if(answer == true){
					document.getElementById('moratorium').value ='0';
					document.getElementById('emiFrequency').value = '';
					document.getElementById('noOfInsallments').value = '';
					
					document.getElementById('moratorium').disabled = true;
					document.getElementById('emiFrequency').disabled = true;
					document.getElementById('noOfInsallments').disabled = true;
					document.forms[0].moratoriumRestriction.value="";
					document.getElementById("moratoriumRestrictionHidden").value = "";
				}else {
					document.getElementById('moratoriumRestriction').checked=true;
				}
			}else{
				document.getElementById('moratorium').disabled = true;
				document.getElementById('emiFrequency').disabled = true;
				document.getElementById('noOfInsallments').disabled = true;
				document.forms[0].moratoriumRestriction.value="";
				document.getElementById("moratoriumRestrictionHidden").value = "";
			}
		}else{
			document.getElementById('moratorium').disabled = false;
			document.getElementById('emiFrequency').disabled = false;
			document.getElementById('noOfInsallments').disabled = false;
			document.forms[0].moratoriumRestriction.value="Y";
			document.getElementById("moratoriumRestrictionHidden").value = "Y";
		}
			
}

function checkboxCurrency(){
		if(document.getElementById('currencyRestrictions').checked==false){
			var listSize='<%=sessionCurrencyListForLine.size()%>';
			if(listSize==0){
				document.getElementById('currencyRestrictionCode1').disabled = true;
				document.getElementById('currencyRestrictionAmount1').disabled = true;
				document.getElementById('btnaddCurrency').disabled = true;
				document.forms[0].currencyRestrictions.value="";
				document.getElementById("currencyRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Currency Restriction' as it has list of values. If you want to untick kindly delete those values and then retry.");
				document.getElementById('currencyRestrictions').checked=true;
			}
		}else{
			document.getElementById('currencyRestrictionCode1').disabled = false;
			document.getElementById('currencyRestrictionAmount1').disabled = false;
			document.getElementById('btnaddCurrency').disabled = false;
			document.forms[0].currencyRestrictions.value="Y";
			document.getElementById("currencyRestrictionHidden").value = "Y";
		}
}
function checkboxBank(){
		if(document.getElementById('bankRestriction').checked==false){
			var listSize='<%=sessionBankListForLine.size()%>';
			if(listSize==0){
				document.getElementById('bankRestrictionCode').disabled = true;
				document.getElementById('bankRestrictionAmount').disabled = true;
				document.getElementById('btnaddBank').disabled = true;
				document.forms[0].bankRestriction.value="";
				document.getElementById("bankRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Bank Restriction' as it has list of values. If you want to untick kindly delete those values and then retry.");
				document.getElementById('bankRestriction').checked=true;
			}
		}else{
			document.getElementById('bankRestrictionCode').disabled = false;
			document.getElementById('bankRestrictionAmount').disabled = false;
			document.getElementById('btnaddBank').disabled = false;
			document.forms[0].bankRestriction.value="Y";
			document.getElementById("bankRestrictionHidden").value = "Y";

		}
}
function checkboxBuyersRating(){
		if(document.getElementById('buyersRatingRestriction').checked==false){
			if(document.getElementById('buyersRatingYes').checked==true
					|| document.getElementById('buyersRatingNo').checked==true
					|| document.getElementById('agencyMasterCode').value != ''
					|| document.getElementById('ratingMasterCode').value != ''){
				var answer=  confirm("You have unchecked the 'Buyers Rating Covenants' and hence values of 'Buyers Rating', 'Agency Master' and 'Rating Master' will be cleared. Do you want to proceed.");
				if(answer == true){
					document.getElementById('buyersRatingYes').checked = false;
					document.getElementById('buyersRatingNo').checked = false;
					document.getElementById('buyersRating').value = '';
					document.getElementById('agencyMasterCode').value = '';
					document.getElementById('ratingMasterCode').value = '';
					document.forms[0].buyersRating.value='';
					document.forms[0].agencyMasterCode.value='';
					document.forms[0].ratingMasterCode.value='';
					
					document.getElementById('buyersRatingYes').disabled = true;
					document.getElementById('buyersRatingNo').disabled = true;
					document.getElementById('agencyMasterCode').disabled = true;
					document.getElementById('ratingMasterCode').disabled = true;
					document.forms[0].buyersRatingRestriction.value="";
					document.getElementById("buyersRatingRestrictionHidden").value = "";
				}else {
					document.getElementById('buyersRatingRestriction').checked=true;
				}
			}else{
				document.getElementById('buyersRatingYes').disabled = true;
				document.getElementById('buyersRatingNo').disabled = true;
				document.getElementById('agencyMasterCode').disabled = true;
				document.getElementById('ratingMasterCode').disabled = true;
				document.forms[0].buyersRatingRestriction.value="";
				document.getElementById("buyersRatingRestrictionHidden").value = "";
			}
		}else{
			document.getElementById('buyersRatingYes').disabled = false;
			document.getElementById('buyersRatingNo').disabled = false;
			document.getElementById('agencyMasterCode').disabled = false;
			document.getElementById('ratingMasterCode').disabled = false;
			document.forms[0].buyersRatingRestriction.value="Y";
			document.getElementById("buyersRatingRestrictionHidden").value = "Y";
		}
}

function checkboxGoods(){
		if(document.getElementById('goodsRestriction').checked==false){
			var listSize='<%=covenantGoodsRestrictionList.size()%>';
			if(listSize==0){
				document.getElementById('btnAddGoodsCurrency').disabled = true;
				document.getElementById('goodsRestrictionParentCode').disabled = true;
				document.getElementById('goodsRestrictionChildCode').disabled = true;
				document.getElementById('goodsRestrictionSubChildCode').disabled = true;
				document.getElementById('btnDeleteGoodsCurrency').disabled = true;
				document.forms[0].goodsRestriction.value="";
				document.getElementById("goodsRestrictionHidden").value = "";
			}else{
				alert("You can not untick 'Goods Restriction' as it has list of values. If you want to untick kindly delete those values and then retry.");
				document.getElementById('goodsRestriction').checked=true;
			}
		}else{
			document.getElementById('btnAddGoodsCurrency').disabled = false;
			document.getElementById('goodsRestrictionParentCode').disabled = false;
			document.getElementById('goodsRestrictionChildCode').disabled = false;
			document.getElementById('goodsRestrictionSubChildCode').disabled = false;
			document.getElementById('btnDeleteGoodsCurrency').disabled = false;
			document.forms[0].goodsRestriction.value="Y";
			document.getElementById("goodsRestrictionHidden").value = "Y";
		}
}

function checkboxEcgcCovRest(){
		if(document.getElementById('ecgcCoverRestriction').checked==false){
			var answer=  confirm("You have unchecked the 'ECGC Cover Covenant' and hence default value to be set as N for this covenant. Do you want to proceed.");
			if(answer == true){
				document.getElementById('ecgcCoverNo').checked = true;
				document.getElementById('ecgcCover').value = 'N';
				
				document.getElementById('ecgcCoverYes').disabled = true;
				document.getElementById('ecgcCoverNo').disabled = true;
				document.forms[0].ecgcCoverRestriction.value="";
				document.getElementById("ecgcCoverRestrictionHidden").value = "";
			}else {
				document.getElementById('ecgcCoverRestriction').checked=true;
			}
		}else{
			document.getElementById('ecgcCoverYes').disabled = false;
			document.getElementById('ecgcCoverNo').disabled = false;
			document.forms[0].ecgcCoverRestriction.value="Y";
			document.getElementById("ecgcCoverRestrictionHidden").value = "Y";
		}
}

function enableCheckBox(){
	document.getElementById('countryRestriction').disabled = false;
	document.getElementById('drawerRestriction').disabled = false;
	document.getElementById('draweeRestriction').disabled = false;
	document.getElementById('beneRestriction').disabled = false;
	document.getElementById('combinedTenorRestriction').disabled = false;
	document.getElementById('runningAccountRestriction').disabled = false;
	document.getElementById('sellDownRestriction').disabled = false;
	document.getElementById('availDateRestriction').disabled = false;
	document.getElementById('moratoriumRestriction').disabled = false;
	//Temporary change 03112022
	//document.getElementById('currencyRestrictions').disabled = false;	
	document.getElementById('currencyRestrictions').disabled = true;
	document.getElementById('goodsRestriction').disabled = false;
	document.getElementById('bankRestriction').disabled = false;
	document.getElementById('buyersRatingRestriction').disabled = false;
	document.getElementById('ecgcCoverRestriction').disabled = false;
}

function disableCheckBox(){
	document.getElementById('countryRestriction').disabled = true;
	document.getElementById('drawerRestriction').disabled = true;
	document.getElementById('draweeRestriction').disabled = true;
	document.getElementById('beneRestriction').disabled = true;
	document.getElementById('combinedTenorRestriction').disabled = true;
	document.getElementById('runningAccountRestriction').disabled = true;
	document.getElementById('sellDownRestriction').disabled = true;
	document.getElementById('availDateRestriction').disabled = true;
	document.getElementById('moratoriumRestriction').disabled = true;
	document.getElementById('goodsRestriction').disabled = true;
	document.getElementById('currencyRestrictions').disabled = true;
	document.getElementById('bankRestriction').disabled = true;
	document.getElementById('buyersRatingRestriction').disabled = true;
	document.getElementById('ecgcCoverRestriction').disabled = true;
}

function saveLimitCovenant(){
	
		document.forms[0].action="MILineCovenant.do";
		document.forms[0].event.value = "create_covenant_detail";
	    document.forms[0].submit();
}

function cancelSubmitCovenant(){
	document.forms[0].action="MILineCovenant.do";
	document.forms[0].event.value = "cancel_covenant_detail";
    document.forms[0].submit();
}


function deleteRestCountry(assetId,index) {
	document.forms[0].action = "MILineCovenant.do?countryName=" +assetId +"&index="+index;		
	document.forms[0].event.value = "remove_country_rest";
	document.forms[0].submit();
}	

function deleteRestBank(assetId,index) {
	document.forms[0].action = "MILineCovenant.do?countryName=" +assetId +"&index="+index;		
	document.forms[0].event.value = "remove_bank_rest";
	document.forms[0].submit();
}

function deleteRestCurrency(assetId,index) {
	document.forms[0].action = "MILineCovenant.do?countryName=" +assetId +"&index="+index;		
	document.forms[0].event.value = "remove_currency_rest";
	document.forms[0].submit();
}

function deleteRestDrawer(Name,Amount,custId,custName,index) {
	document.forms[0].action = "MILineCovenant.do?drawerName=" +Name +"&drawerAmount="+Amount+"&drawerCustId="+custId+"&drawerCustName="+custName+"&index="+index;		
	document.forms[0].event.value = "remove_drawer_rest";
	document.forms[0].submit();
}

function deleteRestDrawee(Name,Amount,custId,custName,index) {
	document.forms[0].action = "MILineCovenant.do?draweeName=" +Name +"&draweeAmount="+Amount+"&draweeCustId="+custId+"&draweeCustName="+custName+"&index="+index;		
	document.forms[0].event.value = "remove_drawee_rest";
	document.forms[0].submit();
}

function deleteRestBene(Name,Amount,custId,custName,index) {
	document.forms[0].action = "MILineCovenant.do?beneName=" +Name +"&beneAmount="+Amount+"&beneCustId="+custId+"&beneCustName="+custName+"&index="+index;		
	document.forms[0].event.value = "remove_bene_rest";
	document.forms[0].submit();
}

function addRestCountry(){
	document.forms[0].action="MILineCovenant.do";
	document.forms[0].event.value = "add_country_rest";
	document.forms[0].submit();
}

function addRestCurrency(){
	var currencyRestrictionCodeDropDown = document.getElementById("currencyRestrictionCode1"); 
	var currencyRestrictionCode = currencyRestrictionCodeDropDown.options[currencyRestrictionCodeDropDown.selectedIndex].value;
	var currencyRestrictionAmount =  document.getElementById('currencyRestrictionAmount1').value;
	document.forms[0].action="MILineCovenant.do?currencyRestrictionCode=" +currencyRestrictionCode+"&currencyRestrictionAmount="+currencyRestrictionAmount;
	document.forms[0].event.value = "add_currency_rest";
	document.forms[0].submit();
	}
	
function addRestBank(){
	document.forms[0].action="MILineCovenant.do";
	document.forms[0].event.value = "add_bank_rest";
	document.forms[0].submit();
	}	

function addRestDrawer(){
	var eventForEdit =  '<%=eventForEdit%>';
	var index =  '<%=index%>';
	document.forms[0].action="MILineCovenant.do?index="+index;
	if(eventForEdit!='prepare_edit_drawer_rest' ){
		document.forms[0].event.value = "add_drawer_rest";
	}else{
		document.forms[0].event.value = "edit_drawer_rest";
	}
	document.forms[0].submit();
	}
	
function addRestDrawee(){
	var eventForEdit =  '<%=eventForEdit%>';
	var index =  '<%=index%>';
	document.forms[0].action="MILineCovenant.do?index="+index;
	if(eventForEdit!='prepare_edit_drawee_rest' ){
		document.forms[0].event.value = "add_drawee_rest";
	}else{
		document.forms[0].event.value = "edit_drawee_rest";
	}
	document.forms[0].submit();
	}

function addRestBene(){
	var eventForEdit =  '<%=eventForEdit%>';
	var index =  '<%=index%>';
	document.forms[0].action="MILineCovenant.do?index="+index;
	if(eventForEdit!='prepare_edit_bene_rest' ){
		document.forms[0].event.value = "add_bene_rest";
	}else{
		document.forms[0].event.value = "edit_bene_rest";
	}
	document.forms[0].submit();
	}
function editRestDrawer(Name,Amount,custId,custName,index) {
	document.forms[0].action = "MILineCovenant.do?drawerName=" +Name +"&drawerAmount="+Amount+"&drawerCustId="+custId+"&drawerCustName="+custName+"&index="+index;		
	document.forms[0].event.value = "prepare_edit_drawer_rest";
	document.forms[0].submit();
	}
	
function editRestDrawee(Name,Amount,custId,custName,index) {
	document.forms[0].action = "MILineCovenant.do?draweeName=" +Name +"&draweeAmount="+Amount+"&draweeCustId="+custId+"&draweeCustName="+custName+"&index="+index;		
	document.forms[0].event.value = "prepare_edit_drawee_rest";
	document.forms[0].submit();
	}

function editRestBene(Name,Amount,custId,custName,index) {
	document.forms[0].action = "MILineCovenant.do?beneName=" +Name +"&beneAmount="+Amount+"&beneCustId="+custId+"&beneCustName="+custName+"&index="+index;		
	document.forms[0].event.value = "prepare_edit_bene_rest";
	document.forms[0].submit();
	}


window.onload = function(){
	var isCovenantRequired = document.forms[0].covenantRequired[0].checked;
	if('<%=covenantRequired%>'!='Y' && !isCovenantRequired){
		disableCheckBox();
	}
	//Temporary Change need to be removed after :: 03112022
	document.getElementById('currencyRestrictions').disabled = true;
	var dropdown = document.getElementById('goodsRestrictionParentCode');
	refreshChildGoodsMaster(dropdown,'parentCode');
	
	if(document.getElementById('ecgcCoverYes').checked != true)
	{
	document.getElementById('ecgcCoverNo').checked = true;
	}
}

function refreshChildGoodsMaster(dropdown, name){
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	
	 if(curSel==""){
		 if(name == 'parentCode'){
			 clearDisplayDropdown('goodsRestrictionChildCode');
			 clearDisplayDropdown('goodsRestrictionSubChildCode');
		 }
		 else if(name == 'childCode'){
			 clearDisplayDropdown('goodsRestrictionSubChildCode');
		 }
	 }
	 
	 var dep = '';
	 var goodsType = '';
	 if(name == 'parentCode'){
		 dep = 'goodsRestrictionChildCode';
		 goodsType = 'parentCode';
	 } 
	 else if(name == 'childCode'){
		 dep = 'goodsRestrictionSubChildCode';
		 goodsType = 'childCode';
	 }
	 
	 var url = '/cms/MILineCovenant.do?event=refresh_goods_master&goodsType='+goodsType+'&goodsCode='+curSel;
	 if(curSel!=""){
	 	sendLoadDropdownReq(dep, url);
	 }
 }
 
 function deleteCovenantGoods(){
	  var goodsCheckBoxList = document.getElementsByName("goodsRestrictionCheckbox");
	  //alert(goodsCheckBoxList.length );
	  
	  var selectedGoodsArr =new Array();
	  
	  for(var i=0;i<document.getElementsByName("goodsRestrictionCheckbox").length;i++){
	   if(document.getElementsByName("goodsRestrictionCheckbox")[i].checked==true){
		   selectedGoodsArr.push(document.getElementsByName("goodsRestrictionCheckbox")[i].value);
	   }
	  }
	  
	  var selectedGoods  = selectedGoodsArr.join(',');
	  
		document.forms[0].action="MILineCovenant.do?goodsCode="+selectedGoods;
		document.forms[0].event.value = "delete_goods_restriction";
		document.forms[0].submit();

	  
	  //alert(selectedGoods);
 }

function addCovenantGoods(){
	
	var goodsParentCode = document.getElementById('goodsRestrictionParentCode').value;
	var goodsChildCode = document.getElementById('goodsRestrictionChildCode').value;
	var goodsSubChildCode = document.getElementById('goodsRestrictionSubChildCode').value;
	
	
	if(goodsChildCode == ""){
		
		var goodsChildCodeArr = [];
		
		var dropdown = document.getElementById('goodsRestrictionChildCode');
		 for(i=1; i<dropdown.options.length; i++)
		 {
			goodsChildCodeArr.push(dropdown.options[i].value);
		 }
		 goodsChildCode = goodsChildCodeArr.join(',');
		
	}
	
	if(goodsSubChildCode == ""){
		
		var goodsSubChildCodeArr = [];
		
		var dropdown = document.getElementById('goodsRestrictionSubChildCode');
		 for(i=1; i<dropdown.options.length; i++)
		 {
			goodsSubChildCodeArr.push(dropdown.options[i].value);
		 }
		 goodsSubChildCode = goodsSubChildCodeArr.join(',');
		
	}
		
	//alert("MILineCovenant.do?goodsParentCode="+goodsParentCode+"&goodsChildCode="+goodsChildCode+"&goodsSubChildCode="+goodsSubChildCode);
	document.forms[0].action="MILineCovenant.do?goodsParentCode="+goodsParentCode+"&goodsChildCode="+goodsChildCode+"&goodsSubChildCode="+goodsSubChildCode;
	document.forms[0].event.value = "add_goods_restriction";
	document.forms[0].submit();
}



function refreshIncoDesc() {
	var incoTerm = document.getElementById('incoTerm').value;
	  var dep = 'incoDescription';
      var url = '/cms/MILineCovenant.do?event=refresh_inco_desc&incoTerm='+incoTerm;
      sendLoadIncoDescReq(dep, url);
	}


function orderBackedByLCRadio()
{
if(document.getElementById('orderBackedByLCYes').checked==true)
{
	document.getElementById('runningAccountYes').checked = false;
	if(document.getElementById('runningAccountNo').checked == false)
	{
		document.getElementById('runningAccountNo').value = "N";
		document.getElementById('runningAccountNotSelected').value = "N";
	}	
}
else if(document.getElementById('orderBackedByLCNo').checked==true)
{
	document.getElementById('runningAccountNo').checked = false;
	if(document.getElementById('runningAccountYes').checked !=true )
	{
	document.getElementById('runningAccountNotSelected').value = "N";
	}
}	

}
function runningAccountRadio()
{
if(document.getElementById('runningAccountYes').checked==true)
{
document.getElementById('orderBackedByLCYes').checked = false;
if(document.getElementById('orderBackedByLCNo').checked == false)
{
	document.getElementById('orderBackedByLCNo').value = "N";
	document.getElementById('orderBackedByLCNotSelected').value = "N";
}
}
else if(document.getElementById('runningAccountNo').checked==true)
{
document.getElementById('orderBackedByLCNo').checked = false;
if(document.getElementById('orderBackedByLCYes').checked!=true)
	{
	document.getElementById('orderBackedByLCNotSelected').value = "N";
	}
}
}

function postShipmentLinkageRadio()
{
if(document.getElementById('postShipmentLinkageYes').checked==true)
{
	document.getElementById('preShipmentLinkageYes').checked = false;
	if(document.getElementById('preShipmentLinkageNo').checked == false)
	{
		document.getElementById('preShipmentLinkageNo').value = "N";
		document.getElementById('preShipmentLinkageNotSelected').value = "N";
	}	
}
else if(document.getElementById('postShipmentLinkageNo').checked==true)
{
	document.getElementById('preShipmentLinkageNo').checked = false;
	if(document.getElementById('preShipmentLinkageYes').checked !=true )
	{
	document.getElementById('preShipmentLinkageNotSelected').value = "N";
	}
}	

}

function preShipmentLinkageRadio()
{
if(document.getElementById('preShipmentLinkageYes').checked==true)
{
document.getElementById('postShipmentLinkageYes').checked = false;
if(document.getElementById('postShipmentLinkageNo').checked == false)
{
	document.getElementById('postShipmentLinkageNo').value = "N";
	document.getElementById('postShipmentLinkageNotSelected').value = "N";
}
}
else if(document.getElementById('preShipmentLinkageNo').checked==true)
{
document.getElementById('postShipmentLinkageNo').checked = false;
if(document.getElementById('postShipmentLinkageYes').checked!=true)
	{
	document.getElementById('postShipmentLinkageNotSelected').value = "N";
	}
}
}

</script>
				
</head>

<body >
<br>
&nbsp;&nbsp;<html:errors property="facilitySystemID"/> 
<p class="required"><font color="#FF0000">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>
<table align="right" width="100%"  class="tblFormSection">
<tr >
<td width="25%" >
</td>
<td >&nbsp;</td>
</tr>
</table>


<html:form action="MILineCovenant.do">
    
     <input type="hidden" name="event" value="<%=request.getAttribute("event") %>"/>
    <input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
    <input type="hidden" name="fromEventForLineCov" value="<%=request.getAttribute("fromEventForLineCov") %>"/>
    <input type="hidden" name="indexID" value="<%=request.getAttribute("indexID") %>"/>
    <input type="hidden" name="lineDetailId" value=""/>
    <input type="hidden" name="itemType" value=""/>
    <input type="hidden" name="isCreate" value=""/>
    <input type="hidden" name="limitRef" value="<%=request.getAttribute("limitRef") %>"/>
    <input type="hidden" name="limitProfileID" value="<%=request.getAttribute("limitProfileID") %>"/>
	<input type="hidden" name="customerID" value="<%=request.getAttribute("customerID") %>"/>
	<input type="hidden" name="limitId" value="<%=request.getAttribute("limitId") %>"/>
	<input type="hidden" name="adhocFacility" value="<%=request.getParameter("adhocFacility") %>">
	
	<%System.out.println("limitId "+request.getAttribute("limitId")); %>
	<%System.out.println("limitRef "+request.getAttribute("limitRef")); %>
	<%System.out.println("limitProfileID "+request.getAttribute("limitProfileID")); %>
	
    
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj" type="com.integrosys.cms.app.limit.trx.ILimitTrxValue" scope="session"/>
    <bean:define id="formObj" name="LineCovenantDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.line.covenant.LineCovenantDetailForm"/>
   <html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>
   <% String xReferenceId =(String) request.getAttribute("xReferenceId");
    if(xReferenceId!=null){
    	formObj.setLineNo(xReferenceId);
    } 
    System.out.println("xReferenceId====>"+xReferenceId);

     %>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%"><h3>CAM Covenant-Specific Covenant</h3></td>
        <td width="19%" align="right" valign="bottom">&nbsp; </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
  	<input type="hidden" name="fromEvent" value="<%=(String)request.getAttribute("fromEvent") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" border="0" align="center">
<tbody>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.covenant.facility.id"/>&nbsp;</td>
    <td colspan="3">- &nbsp;
        <html:hidden property="facilityId"/>
    </td>
   <td class="fieldname"><bean:message key="label.covenant.line.no"/>&nbsp;</td>
    <td colspan="5"> <bean:write name="LineCovenantDetailForm" property="lineNo"/>&nbsp;
        <html:hidden property="lineNo"/>
    </td>
</tr>
<tr><td colspan="7">&nbsp;</td></tr>
<tr class="even" >
	 <td class="fieldname"><bean:message key="label.covenant.applicable"/><font color="#FF0000">*</font> </td>
      <td colspan="6">
      	<html:radio property="covenantRequired" styleId="covenantRequired" value="Y" onclick="javascript:enableCheckBox()" />&nbsp;Required&nbsp;
        <html:radio property="covenantRequired" styleId="covenantRequired" value="N" onclick="javascript:disableCheckBox()" />&nbsp;Not Required&nbsp;
		<html:errors property="covenantRequired" />
      </td>
</tr>
<tr><td colspan="7">&nbsp;</td></tr>


<tr class="odd" >
 	 <td class="fieldname">List of Specific Covenants</td>
      <td colspan="3">
      <html:checkbox  onclick="javascript:checkboxCountry()" property="countryRestriction" styleId="countryRestriction" value ="Y"/>
   	  <html:hidden property="countryRestriction" styleId="countryRestrictionHidden"/>
      <b><bean:message key="label.covenant.country.restriction"/>&nbsp;</b>
	  </td>
	 <td colspan="4">
	 <html:checkbox  onclick="javascript:checkboxDrawer()" property="drawerRestriction" styleId="drawerRestriction" value ="Y"/>
 	 <html:hidden property="drawerRestriction" styleId="drawerRestrictionHidden"/>
     <b> <bean:message key="label.covenant.drawer"/>&nbsp;</b>
	  </td>
</tr>
<tr class="even" >  
  	  <td class="fieldname"></td>
	  <td colspan="3">
	  <html:checkbox  onclick="javascript:checkboxDrawee()" property="draweeRestriction" styleId="draweeRestriction" value ="Y"/>
  	 <html:hidden property="draweeRestriction" styleId="draweeRestrictionHidden"/>
      <b><bean:message key="label.covenant.drawee"/>&nbsp;</b>
	  </td>
	    <td colspan="4">
	   <html:checkbox  onclick="javascript:checkboxBene()" property="beneRestriction" styleId="beneRestriction" value ="Y"//> 
       <html:hidden property="beneRestriction" styleId="beneRestrictionHidden"/>
      <b><bean:message key="label.covenant.beneficiary"/>&nbsp;</b>
	  </td>
</tr>
<tr class="odd" >
	  <td class="fieldname"></td>
	  <td colspan="3">
	  <html:checkbox  onclick="javascript:checkboxCombinedTenor()" property="combinedTenorRestriction" styleId="combinedTenorRestriction" value ="Y"/>
	 <html:hidden property="combinedTenorRestriction" styleId="combinedTenorRestrictionHidden"/>
      <b><bean:message key="label.covenant.combined.Tenor"/>&nbsp;</b>
	  </td>
	    <td colspan="4">
	    <html:checkbox  onclick="javascript:checkboxRunningAccount()" property="runningAccountRestriction" styleId="runningAccountRestriction" value ="Y"/>
 	 <html:hidden property="runningAccountRestriction" styleId="runningAccountRestrictionHidden"/>
      <b><bean:message key="label.covenant.running.account"/>&nbsp;</b>
	  </td>
</tr>
<tr class="even" >	  
       <td class="fieldname"></td>
	    <td colspan="3">
	    <html:checkbox  onclick="javascript:checkboxSellDown()" property="sellDownRestriction" styleId="sellDownRestriction" value ="Y"/>
 	 <html:hidden property="sellDownRestriction" styleId="sellDownRestrictionHidden"/>
     <b> <bean:message key="label.covenant.sellDown"/>&nbsp;</b>
	  </td>
	    <td colspan="4">
	  <html:checkbox  onclick="javascript:checkboxAvailDate()" property="availDateRestriction" styleId="availDateRestriction" value ="Y"/>
 	 <html:hidden property="availDateRestriction" styleId="availDateRestrictionHidden"/>
     <b> <bean:message key="label.covenant.lastAvailableDate"/>&nbsp;</b>
	  </td>
</tr>	
<tr class="odd" >	  
       <td class="fieldname"></td>  
	    <td colspan="3">
	  	<html:checkbox  onclick="javascript:checkboxMoratorium()" property="moratoriumRestriction" styleId="moratoriumRestriction" value ="Y"/>  
 	 <html:hidden property="moratoriumRestriction" styleId="moratoriumRestrictionHidden"/>
     <b> <bean:message key="label.covenant.moratorium"/>&nbsp;</b>
	  </td>
	    <td colspan="4">
	   <html:checkbox  onclick="javascript:checkboxGoods()" property="goodsRestriction" styleId="goodsRestriction" value ="Y"/>
 	 <html:hidden property="goodsRestriction" styleId="goodsRestrictionHidden"/>
      <b><bean:message key="label.covenant.goods.restriction"/>&nbsp;</b>
	  </td>
</tr>
<tr class="even" >	  
       <td class="fieldname"></td>	  
	    <td colspan="3"> 
	  	    <html:checkbox  onclick="javascript:checkboxCurrency()" property="currencyRestrictions"  disabled="disabled"  styleId="currencyRestrictions" value ="Y"/>   
  	 <html:hidden property="currencyRestrictions" styleId="currencyRestrictionHidden"/>
      <b><bean:message key="label.covenant.currency.restriction"/>&nbsp;</b>
	  </td>
	    <td colspan="4">
	   <html:checkbox  onclick="javascript:checkboxBank()" property="bankRestriction" styleId="bankRestriction" value ="Y"/>
	   <html:hidden property="bankRestriction" styleId="bankRestrictionHidden"/>
     <b> <bean:message key="label.covenant.bank.restriction"/>&nbsp;</b>
	  </td>
</tr>	
<tr class="odd" >	  
       <td class="fieldname"></td>  
	   <td colspan="3">
	   	 <html:checkbox  onclick="javascript:checkboxBuyersRating()" property="buyersRatingRestriction" styleId="buyersRatingRestriction" value ="Y"/>
	  	 <html:hidden property="buyersRatingRestriction" styleId="buyersRatingRestrictionHidden"/>
    <b>  <bean:message key="label.covenant.buyers.rating"/> &nbsp;</b>
	  </td>
	    <td colspan="4">
	    	    <html:checkbox  onclick="javascript:checkboxEcgcCovRest()" property="ecgcCoverRestriction" styleId="ecgcCoverRestriction" value ="Y"/>
	     	 <html:hidden property="ecgcCoverRestriction" styleId="ecgcCoverRestrictionHidden"/>
     <b> <bean:message key="label.covenant.ecgcCover"/>&nbsp;</b>
	  </td>	 
</tr>

<tr>
<td colspan="7">&nbsp;</td></tr>   
<tr class="even" id="countryDetails" >	  
       <td class="fieldname"><bean:message key="label.covenant.country.restriction"/></td>
	   <td colspan="6">
	    <%if(formObj.getCountryRestriction().equalsIgnoreCase("Y")){ %>
	     <html:select property="countryRestrictionName" styleId="countryRestrictionName" 
	        value="countryRestrictionName" disabled = "false">
                    <html:option value="">Please Select</html:option>
								<%if (countryList == null|| countryList.size() == 0) {
									}
											Iterator iter = countryList.iterator();
											while (iter.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								<%-- <html:option value="<%=currentValue%>"><%=currentLabel%> --%>
								<html:option value="<%=currentLabel%>"><%=currentLabel%>
								</html:option>

								<%
									}
								%>

			</html:select> 
			&nbsp;&nbsp; Amount(INR) &nbsp;&nbsp;
						<input type="text" id = "countryRestrictionAmt" onblur="javascript:formatAmountAsCommaSeparated(this);" name ="countryRestrictionAmt" />
			&nbsp;&nbsp;
				   <input class="btnNormal" type="button" name="btnaddCountry" id="btnaddCountry" value="Add"  onclick="javascript : addRestCountry()">							
			<%}else{ %>
			  <html:select property="countryRestrictionName" styleId="countryRestrictionName" 
	        value="countryRestrictionName" disabled = "true">
                    <html:option value="">Please Select</html:option>
								<%if (countryList == null|| countryList.size() == 0) {
									}
											Iterator iter = countryList.iterator();
											while (iter.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								<%-- <html:option value="<%=currentValue%>"><%=currentLabel%> --%>
								<html:option value="<%=currentLabel%>"><%=currentLabel%>
								</html:option>

								<%
									}
								%>

			</html:select> 
			&nbsp;&nbsp; Amount(INR) &nbsp;&nbsp;
						<input type="text" id = "countryRestrictionAmt" name ="countryRestrictionAmt" onblur="javascript:formatAmountAsCommaSeparated(this);" disabled="disabled"/>
			 &nbsp;&nbsp;
			
				   <input class="btnNormal" type="button" name="btnaddCountry" id="btnaddCountry" value="Add" disabled="disabled" onclick="javascript : addRestCountry()">				
			
			<%} %>
			<html:errors property="countryRestrictionName" />
			<html:errors property="countryRestrictionAmt" />
			<html:hidden property="countryRestrictionName"/>
			<html:hidden property="countryRestrictionAmt"/>
			
	   </td>
</tr>	
<tr id="addCountryDetails">
<td class="fieldname"></td> 
							<td colspan="6">
							 <%
							 	if(formObj.getCountryRestriction().equalsIgnoreCase("Y")){
							 %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="countryListError"/></tr>
									<tr>
									
										<td>S/N</td>
										<td>Disallowed Country Name</td>
										<td>Currency & Amount</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="sessionCountryListForLine">
										<logic:iterate id="ob" name="sessionCountryListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
											countryNo++;
														if (countryNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=countryNo%></td>
												<td>
												<center><%=ob.getRestrictedCountryname()%>&nbsp;</center>
												</td>
												<td>
												<center><%=UIUtil.formatWithCommaAndDecimal(ob.getRestrictedAmount())%>&nbsp;</center>
												</td>
												 <td><a href="javascript:deleteRestCountry('<%=ob.getRestrictedCountryname()%>','<%=countryNo%>')">Delete</a></td>
											</tr>
										</logic:iterate>
									</logic:present>
										<%if(sessionCountryListForLine.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								</tbody>
							</table>
							<%}else{ %>
								<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
									
										<td>S/N</td>
										<td>Country Name</td>
										<td>Amount</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								</tbody>
							</table>
							<%}%>
							</td>
						</tr>
<tr><td colspan="7">&nbsp;</td></tr> 
<tr class="odd">	  
       <td class="fieldname"><bean:message key="label.covenant.drawer"/></td>  
       <td><bean:message key="label.covenant.drawer.name"/></td>  
       <td colspan="5">
        <%
       	if(formObj.getDrawerRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawer_rest")){
       %>
     
         <input type="text" id ="drawerName" name="drawerName" value="<%=formObj.getDrawerName()!=null && !formObj.getDrawerName().equalsIgnoreCase("null")? formObj.getDrawerName():""%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("drawerName")){
        %>
         <input type="text" id ="drawerName" name="drawerName" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="drawerName" name="drawerName" value="<%=formObj.getDrawerName()!=null && !formObj.getDrawerName().equalsIgnoreCase("null")? formObj.getDrawerName():""%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="drawerName" name="drawerName"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="drawerName" name="drawerName" disabled = "disabled"/>
	   <%
	   	}
	   %>
       <html:errors property="drawerName" />
       <html:hidden property="drawerName"/>
       </td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td>Amount(INR)</td>
	   <td>
	   <%
       	if(formObj.getDrawerRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawer_rest")){
       %>
     
         <input type="text" id ="drawerAmount" name="drawerAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" value="<%=UIUtil.formatWithCommaAndDecimal(formObj.getDrawerAmount())%>" />
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("drawerAmount")){
        %>
         <input type="text" id ="drawerAmount" name="drawerAmount" onblur="javascript:formatAmountAsCommaSeparated(this);"/>
          <%
          	}else{
       	     %>
       	     <input type="text" id ="drawerAmount" name="drawerAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" value="<%=UIUtil.formatWithCommaAndDecimal(formObj.getDrawerAmount())%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="drawerAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" name="drawerAmount"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="drawerAmount" name="drawerAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" disabled = "disabled"/>
	   <%
	   	}
	   %>
	    <html:errors property="drawerAmount" />
	    <html:hidden property="drawerAmount"/>
	   </td>
	   <td colspan="5">
	   <input class="btnNormal" type="button" name="btnedit_view" id="btnedit_view" value="Search" disabled="true">				
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
        <td >UBS Id/Cust Id</td>   
	   <td colspan="5">
	   <%
       	if(formObj.getDrawerRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawer_rest")){
       %>
     
         <input type="text" id ="drawerCustId" name="drawerCustId" value="<%=formObj.getDrawerCustId()%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("drawerCustId")){
        %>
         <input type="text" id ="drawerCustId" name="drawerCustId" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="drawerCustId" name="drawerCustId" value="<%=formObj.getDrawerCustId()%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="drawerCustId" name="drawerCustId"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="drawerCustId" name="drawerCustId" disabled = "disabled"/>
	   <%
	   	}
	   %>
	   <html:errors property="drawerCustId" />
	   <html:hidden property="drawerCustId"/>
	   </td>
 </tr>
<tr class="even" >	
       <td class="fieldname"></td>
         <td ><bean:message key="label.covenant.customer.name"/></td>   
	   <td>
	    <%
       	if(formObj.getDrawerRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawer_rest")){
       %>
     
         <input type="text" id ="drawerCustName" name="drawerCustName" value="<%=formObj.getDrawerCustName()!=null && !formObj.getDrawerCustName().equalsIgnoreCase("null")? formObj.getDrawerCustName():""%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("drawerCustName")){
        %>
         <input type="text" id ="drawerCustName" name="drawerCustName" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="drawerCustName" name="drawerCustName" value="<%=formObj.getDrawerCustName()!=null && !formObj.getDrawerCustName().equalsIgnoreCase("null")? formObj.getDrawerCustName():""%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="drawerCustName" name="drawerCustName"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="drawerCustName" name="drawerCustName" disabled = "disabled"/>
	   <%
	   	}
	   %>
	   <html:errors property="drawerCustName" />
	   <html:hidden property="drawerCustName"/>
	   </td>
	   <td colspan="5">
	   <%if(formObj.getDrawerRestriction().equalsIgnoreCase("Y")){ %>
	   	   <input class="btnNormal" type="button" name="btnedit_Drawer" id="btnedit_Drawer" value="Submit"  onclick="javascript : addRestDrawer()"/>&nbsp;
	   <%}else{%>	
	   	   <input class="btnNormal" type="button" name="btnedit_Drawer" id="btnedit_Drawer" value="Submit" disabled="disabled" onclick="javascript : addRestDrawer()"/>&nbsp;
	   <%}%>	
	   </td>
 </tr>
 <tr id="addDrawerDetails">
<td class="fieldname"></td> 
							<td colspan="6">
							 <%if(formObj.getDrawerRestriction().equalsIgnoreCase("Y")){ %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="drawerListError"/></tr>
									<tr>
									
										<td>S/N</td>
										<td>Drawer Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Customer Name</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="sessionDrawerListForLine">
										<logic:iterate id="ob" name="sessionDrawerListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
													dwerNo++;
														if (dwerNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=dwerNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDrawerName()) && ob.getDrawerName() !=null && !"null".equalsIgnoreCase(ob.getDrawerName()))?ob.getDrawerName():"-"%>&nbsp;</center>
												</td>
												<td>
												<center><%=UIUtil.formatWithCommaAndDecimal(ob.getDrawerAmount())%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDrawerCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDrawerCustName()) && ob.getDrawerCustName() !=null && !"null".equalsIgnoreCase(ob.getDrawerCustName()))?ob.getDrawerCustName():"-"%>&nbsp;</center>
												</td>
												 <td>
												 <a href="javascript:deleteRestDrawer('<%=ob.getDrawerName()%>','<%=ob.getDrawerAmount()%>','<%=ob.getDrawerCustId()%>','<%=ob.getDrawerCustName()%>','<%=dwerNo%>')">Delete</a>
												 <a href="javascript:editRestDrawer('<%=ob.getDrawerName()%>','<%=ob.getDrawerAmount()%>','<%=ob.getDrawerCustId()%>','<%=ob.getDrawerCustName()%>','<%=dwerNo%>')">Edit</a> 
												 </td>
											</tr>
										</logic:iterate>
									</logic:present>
										
								</tbody>
							</table>
							<%}else{ %>
								<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="drawerListError"/></tr>
									<tr>
									<td>S/N</td>
										<td>Drawer Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Customer Name</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								</tbody>
							</table>
							<%}%>
							</td>
						</tr>
<tr><td colspan="7">&nbsp;</td></tr> 

<tr class="odd" >		  
       <td class="fieldname"><bean:message key="label.covenant.drawee"/></td>  
       <td><bean:message key="label.covenant.drawee.name"/></td>  
       <td colspan="5">
      <%
       	if(formObj.getDraweeRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawee_rest")){
       %>
         <input type="text" id ="draweeName" name="draweeName" value="<%=formObj.getDraweeName()!=null && !formObj.getDraweeName().equalsIgnoreCase("null")? formObj.getDraweeName():""%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("draweeName")){
        %>
         <input type="text" id ="draweeName" name="draweeName" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="draweeName" name="draweeName" value="<%=formObj.getDraweeName()!=null && !formObj.getDraweeName().equalsIgnoreCase("null")? formObj.getDraweeName():""%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="draweeName" name="draweeName"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="draweeName" name="draweeName" disabled = "disabled"/>
	   <%
	   	}
	   %>
       <html:errors property="draweeName" />
       <html:hidden property="draweeName"/>
       </td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td>Amount(INR)</td>
	   <td>
	   <%
       	if(formObj.getDraweeRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawee_rest")){
       %>
         <input type="text" id ="draweeAmount" name="draweeAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" value="<%=UIUtil.formatWithCommaAndDecimal(formObj.getDraweeAmount())%>"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("draweeAmount")){
        %>
         <input type="text" id ="draweeAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" name="draweeAmount" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="draweeAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" name="draweeAmount" value="<%=UIUtil.formatWithCommaAndDecimal(formObj.getDraweeAmount())%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="draweeAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" name="draweeAmount"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="draweeAmount" name="draweeAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" disabled = "disabled"/>
	   <%
	   	}
	   %>
	    <html:errors property="draweeAmount" />
	    <html:hidden property="draweeAmount"/>
	   </td>
	   <td colspan="5">
	   <input class="btnNormal" type="button" name="btnedit_view" id="btnedit_view" value="Search" disabled = "true">				
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
        <td >UBS Id/Cust Id</td>   
	   <td colspan="5">
	   <%
       	if(formObj.getDraweeRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawee_rest")){
       %>
         <input type="text" id ="draweeCustId" name="draweeCustId" value="<%=formObj.getDraweeCustId()%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("draweeCustId")){
        %>
         <input type="text" id ="draweeCustId" name="draweeCustId" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="draweeCustId" name="draweeCustId" value="<%=formObj.getDraweeCustId()%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="draweeCustId" name="draweeCustId"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="draweeCustId" name="draweeCustId" disabled = "disabled"/>
	   <%
	   	}
	   %>
	   	   	   <html:errors property="draweeCustId" />
	   	   	   <html:hidden property="draweeCustId"/>
	   
	   </td>
 </tr>
<tr class="even" >	
       <td class="fieldname"></td>
         <td ><bean:message key="label.covenant.customer.name"/></td>   
	   <td>
	    <%
       	if(formObj.getDraweeRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_drawee_rest")){
       %>
         <input type="text" id ="draweeCustName" name="draweeCustName" value="<%=formObj.getDraweeCustName()!=null && !formObj.getDraweeCustName().equalsIgnoreCase("null")? formObj.getDraweeCustName():""%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("draweeCustName")){
        %>
         <input type="text" id ="draweeCustName" name="draweeCustName" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="draweeCustName" name="draweeCustName" value="<%=formObj.getDraweeCustName()!=null && !formObj.getDraweeCustName().equalsIgnoreCase("null")? formObj.getDraweeCustName():""%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="draweeCustName" name="draweeCustName"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="draweeCustName" name="draweeCustName" disabled = "disabled"/>
	   <%
	   	}
	   %>
	    	   	   	   <html:errors property="draweeCustName" />
	    	   	   	   <html:hidden property="draweeCustName"/>
	    
	   </td>
	   <td colspan="5">
	    <%if(formObj.getDraweeRestriction().equalsIgnoreCase("Y")){ %>
	    <input class="btnNormal" type="button" name="btnedit_Drawee" id="btnedit_Drawee" value="Submit"  onclick="javascript : addRestDrawee()"/>&nbsp; 
	   <%}else{%>	
	    <input class="btnNormal" type="button" name="btnedit_Drawee" id="btnedit_Drawee" value="Submit" disabled="disabled" onclick="javascript : addRestDrawee()"/>&nbsp;
	   <%}%>
	   </td>
 </tr>
 
 <tr id="addDraweeDetails">
<td class="fieldname"></td> 
							<td colspan="6">
							 <%if(formObj.getDraweeRestriction().equalsIgnoreCase("Y")){ %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="draweeListError"/></tr>
									<tr>
									
										<td>S/N</td>
										<td>Drawee Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Customer Name</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="sessionDraweeListForLine">
										<logic:iterate id="ob" name="sessionDraweeListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
													dweeNo++;
														if (dweeNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=dweeNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDraweeName()) && ob.getDraweeName() !=null && !"null".equalsIgnoreCase(ob.getDraweeName()))?ob.getDraweeName():"-"%>&nbsp;</center>
												</td>
												<td>
												<center><%=UIUtil.formatWithCommaAndDecimal(ob.getDraweeAmount())%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getDraweeCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getDraweeCustName()) && ob.getDraweeCustName() !=null && !"null".equalsIgnoreCase(ob.getDraweeCustName()))?ob.getDraweeCustName():"-"%>&nbsp;</center>
												</td>
												 <td>
 												 <a href="javascript:deleteRestDrawee('<%=ob.getDraweeName()%>','<%=ob.getDraweeAmount()%>','<%=ob.getDraweeCustId()%>','<%=ob.getDraweeCustName()%>','<%=dweeNo%>')">Delete</a>
												 <a href="javascript:editRestDrawee('<%=ob.getDraweeName()%>','<%=ob.getDraweeAmount()%>','<%=ob.getDraweeCustId()%>','<%=ob.getDraweeCustName()%>','<%=dweeNo%>')">Edit</a> 
												 </td>
											</tr>
										</logic:iterate>
									</logic:present>
										
								</tbody>
							</table>
							<%}else{ %>
								<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
									<td>S/N</td>
										<td>Drawee Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Customer Name</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								</tbody>
							</table>
							<%}%>
							</td>
						</tr>
 <tr><td colspan="7">&nbsp;</td></tr> 
 
<tr class="odd" >		  
       <td class="fieldname"><bean:message key="label.covenant.beneficiary"/></td>  
       <td><bean:message key="label.covenant.beneficiary.name"/></td>  
       <td colspan="5">
       <%
       	if(formObj.getBeneRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_bene_rest")){
       %>
     
         <input type="text" id ="beneficiaryName" name="beneficiaryName" value="<%=formObj.getBeneficiaryName()!=null && !formObj.getBeneficiaryName().equalsIgnoreCase("null")? formObj.getBeneficiaryName():""%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("beneficiaryName")){
        %>
         <input type="text" id ="beneficiaryName" name="beneficiaryName" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="beneficiaryName" name="beneficiaryName" value="<%=formObj.getBeneficiaryName()!=null && !formObj.getBeneficiaryName().equalsIgnoreCase("null")? formObj.getBeneficiaryName():""%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="beneficiaryName" name="beneficiaryName"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="beneficiaryName" name="beneficiaryName" disabled = "disabled"/>
	   <%
	   	}
	   %>
	    <html:errors property="beneficiaryName" />
	     <html:hidden property="beneficiaryName"/>
       </td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td>Amount(INR)</td>
	   <td>
	   <%
       	if(formObj.getBeneRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_bene_rest")){
       %>
     
         <input type="text" id ="beneficiaryAmount" name="beneficiaryAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" value="<%=UIUtil.formatWithCommaAndDecimal(formObj.getBeneficiaryAmount())%>" />
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("beneficiaryAmount")){
        %>
         <input type="text" id ="beneficiaryAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" name="beneficiaryAmount" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="beneficiaryAmount" name="beneficiaryAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" value="<%=UIUtil.formatWithCommaAndDecimal(formObj.getBeneficiaryAmount())%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="beneficiaryAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" name="beneficiaryAmount"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="beneficiaryAmount" name="beneficiaryAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" disabled = "disabled"/>
	   <%
	   	}
	   %>
	    	    <html:errors property="beneficiaryAmount" />
	    	    <html:hidden property="beneficiaryAmount"/>
	    
	   </td>
	   <td colspan="5">
	   <input class="btnNormal" type="button" name="btnedit_search_Bene" id="btnedit_search_Bene" value="Search" disabled="true">				
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
        <td >UBS Id/Cust Id</td>   
	   <td colspan="5">
	   <%
       	if(formObj.getBeneRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_bene_rest")){
       %>
     
         <input type="text" id ="beneficiaryCustId" name="beneficiaryCustId" value="<%=formObj.getBeneficiaryCustId()%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("beneficiaryCustId")){
        %>
         <input type="text" id ="beneficiaryCustId" name="beneficiaryCustId" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="beneficiaryCustId" name="beneficiaryCustId" value="<%=formObj.getBeneficiaryCustId()%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="beneficiaryCustId" name="beneficiaryCustId"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="beneficiaryCustId" name="beneficiaryCustId" disabled = "disabled"/>
	   <%
	   	}
	   %>
	    <html:errors property="beneficiaryCustId" />
	    <html:hidden property="beneficiaryCustId"/>
	   </td>
 </tr>
<tr class="even" >	
       <td class="fieldname"></td>
         <td ><bean:message key="label.covenant.customer.name"/></td>   
	   <td>
	   <%
       	if(formObj.getBeneRestriction().equalsIgnoreCase("Y")){ 
           	   if(eventForEdit!=null && eventForEdit.equals("prepare_edit_bene_rest")){
       %>
     
         <input type="text" id ="beneficiaryCustName" name="beneficiaryCustName" value="<%=formObj.getBeneficiaryCustName()!=null && !formObj.getBeneficiaryCustName().equalsIgnoreCase("null")? formObj.getBeneficiaryCustName():""%>" disabled = "disabled"/>
        <%
        	}else if (exceptionMap!=null && !exceptionMap.isEmpty()){
        		if(exceptionMap.containsKey("beneficiaryCustName")){
        %>
         <input type="text" id ="beneficiaryCustName" name="beneficiaryCustName" />
          <%
          	}else{
       	     %>
       	     <input type="text" id ="beneficiaryCustName" name="beneficiaryCustName" value="<%=formObj.getBeneficiaryCustName()!=null && !formObj.getBeneficiaryCustName().equalsIgnoreCase("null")? formObj.getBeneficiaryCustName():""%>"/>
       	      <%
       	      	}} else{
          	     %>
          	     <input type="text" id ="beneficiaryCustName" name="beneficiaryCustName"/>
          	      <%
          	      	}
           	 }else{
          %>
	   <input type="text" id ="beneficiaryCustName" name="beneficiaryCustName" disabled = "disabled"/>
	   <%
	   	}
	   %>
	    	   	    <html:errors property="beneficiaryCustName" />
	    	   	    <html:hidden property="beneficiaryCustName"/>
	    
	   </td>
	   <td colspan="5">
	     <%if(formObj.getBeneRestriction().equalsIgnoreCase("Y")){ %>
	   	    <input class="btnNormal" type="button" name="btnedit_Bene" id="btnedit_Bene" value="Submit" onclick="javascript : addRestBene()"/>&nbsp; 
	   <%}else{%>	
	   	    <input class="btnNormal" type="button" name="btnedit_Bene" id="btnedit_Bene" value="Submit" disabled="disabled" onclick="javascript : addRestBene()"/>&nbsp; 
	   <%}%>
	   </td>
 </tr>
 <tr id="addDraweeDetails">
<td class="fieldname"></td> 
							<td colspan="6">
							 <%if(formObj.getBeneRestriction().equalsIgnoreCase("Y")){ %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="beneListError"/></tr>
									<tr>
									
										<td>S/N</td>
										<td>Beneficiary Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Customer Name</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="sessionBeneListForLine">
										<logic:iterate id="ob" name="sessionBeneListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
													beneNo++;
														if (beneNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=beneNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getBeneName()) && ob.getBeneName() !=null && !"null".equalsIgnoreCase(ob.getBeneName()))?ob.getBeneName():"-"%>&nbsp;</center>
												</td>
												<td>
												<center><%=UIUtil.formatWithCommaAndDecimal(ob.getBeneAmount())%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getBeneCustId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(ob.getBeneCustName()) && ob.getBeneCustName() !=null && !"null".equalsIgnoreCase(ob.getBeneCustName()))?ob.getBeneCustName():"-"%>&nbsp;</center>
												</td>
												 <td>
												 <a href="javascript:deleteRestBene('<%=ob.getBeneName()%>','<%=ob.getBeneAmount()%>','<%=ob.getBeneCustId()%>','<%=ob.getBeneCustName()%>','<%=beneNo%>')">Delete</a>
												 <a href="javascript:editRestBene('<%=ob.getBeneName()%>','<%=ob.getBeneAmount()%>','<%=ob.getBeneCustId()%>','<%=ob.getBeneCustName()%>','<%=beneNo%>')">Edit</a> 
												 </td>
											</tr>
										</logic:iterate>
									</logic:present>
										
								</tbody>
							</table>
							<%}else{ %>
								<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
									<td>S/N</td>
										<td>Beneficiary Name</td>
										<td>Amount</td>
										<td>UBS Id/Cust Id</td>
										<td>Actual Customer Name</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								</tbody>
							</table>
							<%}%>
							</td>
						</tr>
<tr><td colspan="7">&nbsp;</td></tr>

<tr class="odd" >		  
       <td class="fieldname"><bean:message key="label.covenant.combined.Tenor"/></td>  
       <td><bean:message key="label.covenant.max.Combined.Tenor"/></td>  
       <td colspan="5">
       <%if(formObj.getCombinedTenorRestriction().equalsIgnoreCase("Y")){ %>
       <html:text property="maxCombinedTenor" styleId="maxCombinedTenor" disabled = "false"/>
        <%}else{%>
	   <html:text property="maxCombinedTenor" styleId="maxCombinedTenor" disabled = "true"/>
	    <%}%>
<html:errors property="maxCombinedTenor" />
       </td>
</tr>
<tr class="even" >	
       <td class="fieldname"></td>
       <td><bean:message key="label.covenant.preShipment.Linkage"/></td>  
	   <td colspan="5">
	   <%if(formObj.getCombinedTenorRestriction().equalsIgnoreCase("Y")){ %>
	   	<html:radio property="preShipmentLinkage" styleId="preShipmentLinkageYes" value="Y" onclick="javascript:preShipmentLinkageRadio()"  disabled = "false"/>&nbsp;Yes&nbsp;
        <html:radio property="preShipmentLinkage" styleId="preShipmentLinkageNo" value="N" onclick="javascript:preShipmentLinkageRadio()" disabled = "false"/>&nbsp;No&nbsp;
         <%}else{%>
        <html:radio property="preShipmentLinkage" styleId="preShipmentLinkageYes" value="Y" onclick="javascript:preShipmentLinkageRadio()" disabled = "true"/>&nbsp;Yes&nbsp;
        <html:radio property="preShipmentLinkage" styleId="preShipmentLinkageNo" value="N" onclick="javascript:preShipmentLinkageRadio()" disabled = "true"/>&nbsp;No&nbsp;
         <%}%>
<html:errors property="preShipmentLinkage" />
<input type="hidden" name="preShipmentLinkage" id="preShipmentLinkageNotSelected"/>
	   </td>
 </tr>
<tr class="odd" >	
       <td class="fieldname"></td>
       <td><bean:message key="label.covenant.postShipmentLinkage"/></td>  
	   <td colspan="5">
	   
	   <%if(formObj.getCombinedTenorRestriction().equalsIgnoreCase("Y")){ %>
	   	<html:radio property="postShipmentLinkage" styleId="postShipmentLinkageYes" value="Y" onclick="javascript:postShipmentLinkageRadio()" disabled = "false"/>&nbsp;Yes&nbsp;
        <html:radio property="postShipmentLinkage" styleId="postShipmentLinkageNo" value="N" onclick="javascript:postShipmentLinkageRadio()" disabled = "false"/>&nbsp;No&nbsp;
         <%}else{%>
       	<html:radio property="postShipmentLinkage" styleId="postShipmentLinkageYes" value="Y" onclick="javascript:postShipmentLinkageRadio()" disabled = "true"/>&nbsp;Yes&nbsp;
        <html:radio property="postShipmentLinkage" styleId="postShipmentLinkageNo" value="N" onclick="javascript:postShipmentLinkageRadio()" disabled = "true" />&nbsp;No&nbsp;
         <%}%>
 <html:errors property="postShipmentLinkage" />
 <input type="hidden" name="postShipmentLinkage" id="postShipmentLinkageNotSelected"/>
	   </td>
 </tr>
<tr><td colspan="7">&nbsp;</td></tr>

<tr class="even" >		  
       <td class="fieldname">Running Account(EPC)</td>  
       <td><bean:message key="label.covenant.runningAccount"/></td>  
       <td colspan="5">
       <%if(formObj.getRunningAccountRestriction().equalsIgnoreCase("Y")){ %>
	   	<html:radio property="runningAccount" styleId="runningAccountYes" value="Y" onclick="javascript:runningAccountRadio()"  disabled = "false"/>&nbsp;Yes&nbsp;
        <html:radio property="runningAccount" styleId="runningAccountNo" value="N" onclick="javascript:runningAccountRadio()" disabled = "false"/>&nbsp;No&nbsp;
         <%}else{%>
       	 <html:radio property="runningAccount" styleId="runningAccountYes" value="Y" onclick="javascript:runningAccountRadio()" disabled = "true" />&nbsp;Yes&nbsp;
        <html:radio property="runningAccount" styleId="runningAccountNo" value="N" onclick="javascript:runningAccountRadio()" disabled = "true"/>&nbsp;No&nbsp;
         <%}%>
 <html:errors property="runningAccount" />
<input type="hidden" name="runningAccount" id="runningAccountNotSelected"/>
        </td>
</tr>
<tr class="odd" >		  
       <td class="fieldname"></td>  
       <td>OR</td>  
       <td colspan="5"></td>
</tr>
<tr class="even" >	
	   <td class="fieldname"></td> 
       <td><bean:message key="label.covenant.orderBackedByLC"/></td>  
       <td colspan="5">
         <%if(formObj.getRunningAccountRestriction().equalsIgnoreCase("Y")){ %>
	   	<html:radio property="orderBackedByLC" styleId="orderBackedByLCYes" value="Y" onclick="javascript:orderBackedByLCRadio()" disabled = "false"/>&nbsp;Yes&nbsp;
        <html:radio property="orderBackedByLC" styleId="orderBackedByLCNo" value="N"  onclick="javascript:orderBackedByLCRadio()" disabled = "false"/>&nbsp;No&nbsp;
         <%}else{%>
       	<html:radio property="orderBackedByLC" styleId="orderBackedByLCYes" value="Y" onclick="javascript:orderBackedByLCRadio()" disabled = "true"/>&nbsp;Yes&nbsp;
        <html:radio property="orderBackedByLC" styleId="orderBackedByLCNo" value="N" onclick="javascript:orderBackedByLCRadio()" disabled = "true" />&nbsp;No&nbsp;
         <%}%>
 <html:errors property="orderBackedByLC" />
 <input type="hidden" name="orderBackedByLC" id="orderBackedByLCNotSelected"/>
        </td>
</tr>
<tr class="odd" >	
       <td class="fieldname"></td>
       <td><bean:message key="label.covenant.incoTerm"/></td>
       <td>
       <%if(formObj.getRunningAccountRestriction().equalsIgnoreCase("Y")){ %>
               <html:select disabled="false" property="incoTerm" styleId="incoTerm" onchange ="refreshIncoDesc();" value="<%=formObj.getIncoTerm()%>" >
				<integro:common-code categoryCode="<%=CategoryCodeConstant.RUNNING_ACC_COVENANT%>" descWithCode="false" />   
				</html:select> 
			
		<%}else{%>	
		  <html:select disabled="true" property="incoTerm" styleId="incoTerm" onchange ="refreshIncoDesc();" value="<%=formObj.getIncoTerm()%>" >
				<integro:common-code categoryCode="<%=CategoryCodeConstant.RUNNING_ACC_COVENANT%>" descWithCode="false" />   
				</html:select> 
		<%}%>
			<html:errors property="incoTerm" />
       </td>  
	   <td><bean:message key="label.covenant.incoMargin"/></td> 
	   <td>
	   <%if(formObj.getRunningAccountRestriction().equalsIgnoreCase("Y")){ %>
	   <html:text property="incoMargin" styleId="incoMargin" disabled = "false" maxlength="2" /> 
	   <%}else{%>
	   <html:text property="incoMargin" styleId="incoMargin" disabled = "true" maxlength="2"/> 
	   <%}%>	
<html:errors property="incoMargin" />
	   </td>
	   <td><bean:message key="label.covenant.incoDescription"/></td>
	   <td>
	   <%if(formObj.getRunningAccountRestriction().equalsIgnoreCase("Y")){ %>
	   <html:text property="incoDescription" styleId="incoDescription" disabled = "false" readonly="true"/> 
	    <%}else{%>
	   <html:text property="incoDescription" styleId="incoDescription" disabled = "true" readonly="true"/> 
	   <%}%>	
  <html:errors property="incoDescription" />
	   </td>
	   
 </tr>
 <tr class="even" >	
       <td class="fieldname"></td>
       <td><bean:message key="label.covenant.moduleCode"/></td>  
	   <td>
	   <%if(formObj.getRunningAccountRestriction().equalsIgnoreCase("Y")){ %>
		<html:select disabled="false" property="moduleCode" styleId="moduleCode" value="<%=formObj.getModuleCode()%>" >
		<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMITMENT_TENOR_COV%>" descWithCode="false" />   
		</html:select> 
		<%}else{%>	
		<html:select disabled="true" property="moduleCode" styleId="moduleCode" value="<%=formObj.getModuleCode()%>" >
		<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMITMENT_TENOR_COV%>" descWithCode="false" />   
		</html:select>
		 <%}%>
			<html:errors property="moduleCode" />
	   </td>
	   <td><bean:message key="label.covenant.commitmentTenor"/></td> 
	   <td colspan="5">
	   <%if(formObj.getRunningAccountRestriction().equalsIgnoreCase("Y")){ %>
	   <html:text property="commitmentTenor" styleId="commitmentTenor" disabled = "false"/> 
	   <%}else{%>
	   <html:text property="commitmentTenor" styleId="commitmentTenor" disabled = "true"/> 
	   <%}%>	
<html:errors property="commitmentTenor" />
	   </td>
 </tr>
<tr><td colspan="7">&nbsp;</td></tr>

<tr class="odd" >	
		<td class="fieldname"><bean:message key="label.covenant.sellDown"/></td>  
	   <td colspan="6">
	   <%if(formObj.getSellDownRestriction().equalsIgnoreCase("Y")){ %>
	   <html:text property="sellDown" styleId="sellDown" disabled = "false"/>
	    <%}else{%>
	   <html:text property="sellDown" styleId="sellDown" disabled = "true"/> 
	   <%}%>
 <html:errors property="sellDown" />
	   </td>
</tr>  
<tr><td colspan="7">&nbsp;</td></tr>  
<tr class="even" >	
		<td class="fieldname"><bean:message key="label.covenant.lastAvailableDate"/></td>  
	   <td  colspan="6">
	   <%if(formObj.getAvailDateRestriction().equalsIgnoreCase("Y")){ %>
	   <html:text property="lastAvailableDate" styleId="lastAvailableDate" disabled = "false" readonly="true"/>
	   <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image723" 
									             onclick="showCalendar('lastAvailableDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>
	 <%}else{%>
 		<html:text property="lastAvailableDate" styleId="lastAvailableDate" disabled = "true" readonly="true"/>
	   <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image723" 
									             onclick="showCalendar('lastAvailableDate', 'dd/mm/y')"
									             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
									             onmouseout="MM_swapImgRestore()"/>	   
	<%}%>								             
 <html:errors property="lastAvailableDate" />
	   </td>
</tr>   
<tr><td colspan="7">&nbsp;</td></tr>  
<tr class="even" >
		<td class="fieldname">Moratorium Period(In Months)</td>
		<td colspan="6">
		<%if(formObj.getMoratoriumRestriction().equalsIgnoreCase("Y")){ %>
		<html:text property="moratorium" styleId="moratorium" disabled = "false" maxlength="2" />
		 <%}else{%>
		 <html:text property="moratorium" styleId="moratorium" disabled = "true" value="0" maxlength="2"/>
		 <%}%>	
<html:errors property="moratorium" />
		</td>
</tr>
<tr class="odd" >	
  <td class="fieldname"></td>  
      <td>EMI Frequency</td>
	    <td>
	    <%if(formObj.getMoratoriumRestriction().equalsIgnoreCase("Y")){ %>
	     <html:select disabled="false" property="emiFrequency" styleId="emiFrequency" value="<%=formObj.getEmiFrequency()%>" >
		<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />   
		</html:select> 
		<%}else{%>
 		<html:select disabled="true" property="emiFrequency" styleId="emiFrequency" value="<%=formObj.getEmiFrequency()%>" >
		<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />   
		</html:select> 		
		 <%}%>	
			<html:errors property="emiFrequency" />
	   </td> 
	   <td>No Of Installments</td>  
	   <td  colspan="4">
	   	    <%if(formObj.getMoratoriumRestriction().equalsIgnoreCase("Y")){ %>
	   <html:text property="noOfInsallments" styleId="noOfInsallments" disabled = "false" maxlength="4"/>
	   <%}else{%>
	    <html:text property="noOfInsallments" styleId="noOfInsallments" disabled = "true" maxlength="4"/>
	    <%}%>	
<html:errors property="noOfInsallments" />
	   </td>
</tr> 
  
<tr><td colspan="7">&nbsp;</td></tr>
<tr class="even" >	
	   <td class="fieldname"><bean:message key="label.covenant.goods.restriction"/>  </td>
	    <td  colspan="6">List of Goods Code
	   </td>
</tr>   
<tr class="even" >	
	   <td class="fieldname"></td>
	    <td  colspan="6">
	    	<%if(formObj.getGoodsRestriction().equalsIgnoreCase("Y")){ %>
	    			<html:select property="goodsRestrictionParentCode" disabled="false" onchange="javascript:refreshChildGoodsMaster(this,'parentCode')" styleId="goodsRestrictionParentCode" >
           				<html:option value="">Please Select (4 digit code)</html:option>
           				<html:options collection="goodsParentList" property="value" labelProperty="label"/>
              		</html:select>
              		
              		<html:select property="goodsRestrictionChildCode" disabled="false" onchange="javascript:refreshChildGoodsMaster(this,'childCode')" styleId="goodsRestrictionChildCode" >
           				<html:option value="">Please Select (6 digit code)</html:option>
           				<html:options collection="goodsChildList" property="value" labelProperty="label"/>
              		</html:select>
              		
              		<html:select property="goodsRestrictionSubChildCode" disabled="false" styleId="goodsRestrictionSubChildCode" >
           				<html:option value="">Please Select (8 digit code)</html:option>
           				<html:options collection="goodsSubChildList" property="value" labelProperty="label"/>
              		</html:select>
              		
              		<input class="btnNormal" type="button"  name="btnAddGoodsCurrency" id="btnAddGoodsCurrency" value="Add" onclick="javascript:addCovenantGoods()"/>&nbsp;
              		<input class="btnNormal" type="button"  name="btnDeleteGoodsCurrency" id="btnDeleteGoodsCurrency" value="Delete" onclick="javascript:deleteCovenantGoods()"/>&nbsp;
	    		<%}else{%>
	    			<html:select property="goodsRestrictionParentCode" disabled ="true" onchange="javascript:refreshChildGoodsMaster(this,'parentCode')" styleId="goodsRestrictionParentCode" >
           				<html:option value="">Please Select (4 digit code)</html:option>
           				<html:options collection="goodsParentList" property="value" labelProperty="label"/>
              		</html:select>
              		
              		<html:select property="goodsRestrictionChildCode" disabled ="true" onchange="javascript:refreshChildGoodsMaster(this,'childCode')" styleId="goodsRestrictionChildCode" >
           				<html:option value="">Please Select (6 digit code)</html:option>
           				<html:options collection="goodsChildList" property="value" labelProperty="label"/>
              		</html:select>
              		
              		<html:select property="goodsRestrictionSubChildCode" disabled ="true" styleId="goodsRestrictionSubChildCode" >
           				<html:option value="">Please Select (8 digit code)</html:option>
           				<html:options collection="goodsSubChildList" property="value" labelProperty="label"/>
              		</html:select>
              		
              		<input class="btnNormal" type="button" disabled="disabled" name="btnAddGoodsCurrency" id="btnAddGoodsCurrency" value="Add" onclick="javascript:addCovenantGoods()"/>&nbsp;
              		<input class="btnNormal" type="button" disabled="disabled" name="btnDeleteGoodsCurrency" id="btnDeleteGoodsCurrency" value="Delete" onclick="javascript:deleteCovenantGoods()"/>&nbsp;
	    		<%} %>
	    		<html:errors property="goodsRestrictionParentCode" />	
	    
	    <%-- <%if(formObj.getGoodsRestriction().equalsIgnoreCase("Y")){ %>
	   						 <%
									if (goodsList == null
													|| goodsList.size() == 0) {
									}
											Iterator iter = goodsList.iterator();
											while (iter.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								 <html:checkbox property="goodsRestrictionCode" disabled = "false" value="<%=currentValue%>"><%=currentLabel%></html:checkbox>
								<%
									}
								%>
	 <%}else{%>
 <%
									if (goodsList == null
													|| goodsList.size() == 0) {
									}
											Iterator iter = goodsList.iterator();
											while (iter.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								 <html:checkbox property="goodsRestrictionCode" disabled = "true" value="<%=currentValue%>"><%=currentLabel%></html:checkbox>
								<%
									}
								%>	   <%}%>	 --%>								
	<html:errors property="goodsRestrictionCode" />
	  </td>
	   
</tr> 

<tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
 <%-- <%if(formObj.getGoodsRestriction().equalsIgnoreCase("Y")){ %> --%>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
										<td>S/N</td>
										<td>Parent Goods Code</td>
										<td>Child Goods Code</td>
										<td>Sub Child Goods Code</td>
										<td>Select</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="covenantGoodsRestrictionList">
										<logic:iterate id="ob" name="covenantGoodsRestrictionList"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
																							goodsNo++;
																							if (goodsNo % 2 != 0) {
																								rowClass = "odd";
																							} else {
																								rowClass = "even";
																							}
																							
																					String goodsParentCodeStr = ob.getGoodsRestrictionParentCode();
																					String goodsChildCodeStr = ob.getGoodsRestrictionChildCode();
																					String goodsSubChildCodeStr = ob.getGoodsRestrictionSubChildCode();
																					String goodsRestrictionComboCodeStr = ob.getGoodsRestrictionComboCode();
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=goodsNo%></td>
												<td>
												<center><%=(StringUtils.isNotBlank(goodsParentCodeStr) && (StringUtils.isBlank(goodsChildCodeStr) || "0".equalsIgnoreCase(goodsChildCodeStr))
														&& 
														(StringUtils.isBlank(goodsSubChildCodeStr)  || "0".equalsIgnoreCase(goodsChildCodeStr)))?goodsParentCodeStr:"-"%>&nbsp;
												</center>
												</td>
												<td>
												<center><%=(StringUtils.isNotBlank(goodsParentCodeStr) && (StringUtils.isNotBlank(goodsChildCodeStr) && !"0".equalsIgnoreCase(goodsChildCodeStr)) && 
														(StringUtils.isBlank(goodsSubChildCodeStr)  || "0".equalsIgnoreCase(goodsSubChildCodeStr) ))?goodsChildCodeStr:"-"%>&nbsp;
												</center>												
												</td>
												<td>
												<center><%=(
														StringUtils.isNotBlank(goodsSubChildCodeStr) && !"0".equalsIgnoreCase(goodsSubChildCodeStr))?goodsSubChildCodeStr:"-"%>&nbsp;
												</center>												
												</td>
												<td><input type="checkbox" id="goodsRestrictionCheckbox" value="<%=goodsRestrictionComboCodeStr%>"></td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
									
									
									<logic:notPresent name="<%=ILineCovenantConstants.SESSION_COVENANT_GOODS_RESTRICTION_LIST_LINE%>">
						<tr class="odd">
                        	<td colspan="8" style="text-align:center"><bean:message key="label.global.not.found"/></td>
                    	</tr>
                    </logic:notPresent>	
									
								</tbody>
							</table>
							<html:hidden property="currencyRestrictionCode"/>
	      <html:hidden property="currencyRestrictionAmount"/>
	      
	     <%--  <%} %> --%>
							</td>
	      
</tr>

<tr><td colspan="7">&nbsp;</td></tr>
<tr class="even" >	  
       <td class="fieldname"><bean:message key="label.covenant.currency.restriction"/></td>    
	   <td colspan="6">
	   <%if(formObj.getCurrencyRestrictions().equalsIgnoreCase("Y")){ %>
            <html:select property="currencyRestrictionCode" styleId="currencyRestrictionCode1" disabled = "false" value="<%=formObj.getCurrencyRestrictionCode() %>">
                    <html:option value="">Please Select</html:option>
								<%
									if (currencyList == null
													|| currencyList.size() == 0) {
									}
											Iterator iter2 = currencyList.iterator();
											while (iter2.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter2.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								<html:option value="<%=currentLabel%>"><%=currentLabel%>
								</html:option>

								<%
									}
								%>

			</html:select>
			&nbsp;&nbsp; Amount(INR) &nbsp;&nbsp;
			<input type="text" id = "currencyRestrictionAmount1" onblur="javascript:formatAmountAsCommaSeparated(this);" name ="currencyRestrictionAmount"/>&nbsp;&nbsp;
	   	    <input class="btnNormal" type="button" name="btnaddCurrency" id="btnaddCurrency" value="Add" onclick="javascript : addRestCurrency()"/>&nbsp; 	   
			 <%}else{%>
			  <html:select property="currencyRestrictionCode" styleId="currencyRestrictionCode1" disabled = "true" value="<%=formObj.getCurrencyRestrictionCode() %>">
                    <html:option value="">Please Select</html:option>
								<%
									if (currencyList == null
													|| currencyList.size() == 0) {
									}
											Iterator iter2 = currencyList.iterator();
											while (iter2.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter2.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								<html:option value="<%=currentLabel%>"><%=currentLabel%>
								</html:option>

								<%
									}
								%>

			</html:select>
			&nbsp;&nbsp; Amount(INR) &nbsp;&nbsp;
			
			<input type="text" id = "currencyRestrictionAmount1" name ="currencyRestrictionAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" disabled="disabled"/> &nbsp;&nbsp;
	   	    <input class="btnNormal" type="button" name="btnaddCurrency" id="btnaddCurrency" value="Add" disabled="disabled" onclick="javascript : addRestCurrency()"/>&nbsp; 
			  <%}%>
		 <html:errors property="currencyRestrictionCode" />
 		<html:hidden property="currencyRestrictionCode"/>
 				  <html:hidden property="currencyRestrictionAmount"/>
 		
	   </td>
</tr>	
<tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
 <%if(formObj.getCurrencyRestrictions().equalsIgnoreCase("Y")){ %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="currencyListError"/></tr>
									<tr>
										<td>S/N</td>
										<td>Restricted Currency</td>
										<td>Maximum Exposure Amount</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="sessionCurrencyListForLine">
										<logic:iterate id="ob" name="sessionCurrencyListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
														curNo++;
														if (curNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=curNo%></td>
												<td>
												<center><%=ob.getRestrictedCurrency()%>&nbsp;</center>
												</td>
												<td>
												<center><%=UIUtil.formatWithCommaAndDecimal(ob.getRestrictedCurrencyAmount())%>&nbsp;</center>
												</td>
												 <td><a href="javascript:deleteRestCurrency('<%=ob.getRestrictedCurrency()%>','<%=curNo%>')">Delete</a></td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							<%}else{ %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
										<td>S/N</td>
										<td>Restricted Currency</td>
										<td>Maximum Exposure Amount</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
								<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
								</tr>
								</tbody>
							</table>
							<%} %>
							</td>
	      <html:hidden property="currencyRestrictionCode"/>
	      <html:hidden property="currencyRestrictionAmount"/>
	      
</tr>
<tr><td colspan="7">&nbsp;</td></tr>
<tr class="even" >	  
       <td class="fieldname"><bean:message key="label.covenant.bank.restriction"/></td>    
	   <td colspan="6">
	    <%if(formObj.getBankRestriction().equalsIgnoreCase("Y")){ %>
             <html:select property="bankRestrictionCode" styleId="bankRestrictionCode"  disabled = "false"
             value="<%=formObj.getBankRestrictionCode() %>">
                    <html:option value="">Please Select</html:option>
								<%
									if (bankList == null
													|| bankList.size() == 0) {
									}
											Iterator iter1 = bankList.iterator();
											while (iter1.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter1.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								<html:option value="<%=currentLabel%>"><%=currentLabel%>
								</html:option>

								<%
									}
								%>

							</html:select> 
							&nbsp;&nbsp; Amount(INR) &nbsp;&nbsp;
			<input type="text" id = "bankRestrictionAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" name ="bankRestrictionAmount"/> &nbsp;&nbsp;				
		   <input class="btnNormal" type="button" name="btnaddBank" id="btnaddBank" value="Add" onclick="javascript : addRestBank()"/>&nbsp; 
		    
		  <%}else{ %>  	
		   <html:select property="bankRestrictionCode" styleId="bankRestrictionCode"  disabled = "true"
             value="<%=formObj.getBankRestrictionCode() %>">
                    <html:option value="">Please Select</html:option>
								<%
									if (bankList == null
													|| bankList.size() == 0) {
									}
											Iterator iter1 = bankList.iterator();
											while (iter1.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter1.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								<html:option value="<%=currentLabel%>"><%=currentLabel%>
								</html:option>

								<%
									}
								%>

							</html:select> 
							&nbsp;&nbsp; Amount(INR) &nbsp;&nbsp;
							<input type="text" id = "bankRestrictionAmount" name ="bankRestrictionAmount" onblur="javascript:formatAmountAsCommaSeparated(this);" disabled="disabled" /> &nbsp;&nbsp;
			 <input class="btnNormal" type="button" name="btnaddBank" id="btnaddBank" value="Add" disabled="disabled" onclick="javascript : addRestBank()"/>&nbsp; 
						  <%} %>	
			<html:errors property="bankRestrictionCode" />

			<html:hidden property="bankRestrictionCode"/>
						<html:hidden property="bankRestrictionAmount"/>
			
	   </td>
</tr>	
<tr class="even">
<td class="fieldname"></td>
 <td colspan="6" >
 <%if(formObj.getBankRestriction().equalsIgnoreCase("Y")){ %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr><html:errors property="bankListError"/></tr>
									<tr>
										<td>S/N</td>
										<td>Restricted Bank</td>
										<td>Maximum Exposure Amount</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:present name="sessionBankListForLine">
										<logic:iterate id="ob" name="sessionBankListForLine"
											type="com.integrosys.cms.app.customer.bus.OBLineCovenant"
											 scope="page">
											<%
												String rowClass = "";
														bankNo++;
														if (bankNo % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=bankNo%></td>
												<td>
												<center><%=ob.getRestrictedBank()%>&nbsp;</center>
												</td>
												<td>
												<center><%=UIUtil.formatWithCommaAndDecimal(ob.getRestrictedBankAmount())%>&nbsp;</center>
												</td>
												<td><a href="javascript:deleteRestBank('<%=ob.getRestrictedCurrency()%>','<%=bankNo%>')">Delete</a></td>
												 
											</tr>
										</logic:iterate>
									</logic:present>
								</tbody>
							</table>
							<%}else{ %>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr></tr>
									<tr>
										<td>S/N</td>
										<td>Restricted Bank</td>
										<td>Maximum Exposure Amount</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								</tbody>
							</table>
							<%} %>
<html:hidden property="bankRestrictionCode"/>
	      <html:hidden property="bankRestrictionAmount"/>
							</td>
	      
	      
</tr>	  
<tr><td colspan="7">&nbsp;</td></tr>
<tr class="even" >
		<td class="fieldname"><bean:message key="label.covenant.buyers.rating"/></td>
		<td colspan="6">
		
		 <%if(formObj.getBuyersRatingRestriction().equalsIgnoreCase("Y")){ %>
	    <html:radio property="buyersRating" styleId="buyersRatingYes" value="Y" disabled = "false"/>&nbsp;Yes&nbsp;
        <html:radio property="buyersRating" styleId="buyersRatingNo" value="N" disabled = "false" />&nbsp;No&nbsp;
	   <%}else{ %>
	    <html:radio property="buyersRating" styleId="buyersRatingYes" value="Y" disabled = "true"/>&nbsp;Yes&nbsp;
        <html:radio property="buyersRating" styleId="buyersRatingNo" value="N" disabled = "true" />&nbsp;No&nbsp;
	   <%} %>
		
		<html:hidden property="buyersRating" styleId="buyersRating"/>
		<html:errors property="buyersRating" />
		</td>
		
</tr>
<tr class="odd" >	
  <td class="fieldname"></td>  
      <td>Agency Master</td>
	    <td>
	     <%if(formObj.getBuyersRatingRestriction().equalsIgnoreCase("Y")){ %>
           <html:select disabled="false" property="agencyMasterCode" styleId="agencyMasterCode" value="<%=formObj.getAgencyMasterCode()%>" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.BUYERS_RATING_COVENANT%>" descWithCode="false" />   
			</html:select> 
			
			<%}else{ %>
			<html:select disabled="true" property="agencyMasterCode" styleId="agencyMasterCode" value="<%=formObj.getAgencyMasterCode()%>" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.BUYERS_RATING_COVENANT%>" descWithCode="false" />   
			</html:select> 
			<%} %>
			<%-- <html:hidden property="agencyMasterCode"/> --%>
			<html:errors property="agencyMasterCode" />
	   </td> 
	   <td>Rating Master</td>  
	   <td  colspan="4">
	   <%if(formObj.getBuyersRatingRestriction().equalsIgnoreCase("Y")){ %>
            <html:select disabled="false" property="ratingMasterCode" styleId="ratingMasterCode" value="<%=formObj.getRatingMasterCode()%>" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.BUYER_RATING_COV%>" descWithCode="false" />   
			</html:select> 
			<%}else{ %>
			<html:select disabled="true" property="ratingMasterCode" styleId="ratingMasterCode" value="<%=formObj.getRatingMasterCode()%>" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.BUYER_RATING_COV%>" descWithCode="false" />   
			</html:select> 
			<%} %>
			<html:errors property="ratingMasterCode" />
			<%-- <html:hidden property="ratingMasterCode"/> --%>
	   </td>
</tr> 
  
<tr><td colspan="7">&nbsp;</td></tr>
<tr class="odd" >	
		<td class="fieldname"><bean:message key="label.covenant.ecgcCover"/></td>  
	   <td  colspan="6">
	  <%if(formObj.getEcgcCoverRestriction().equalsIgnoreCase("Y")){ %>
	    <html:radio property="ecgcCover" styleId="ecgcCoverYes" value="Y" disabled = "false"/>&nbsp;Yes&nbsp;
        <html:radio property="ecgcCover" styleId="ecgcCoverNo" value="N" disabled = "false" />&nbsp;No&nbsp;
	   <%}else{ %>
	    <html:radio property="ecgcCover" styleId="ecgcCoverYes" value="Y" disabled = "true"/>&nbsp;Yes&nbsp;
        <html:radio property="ecgcCover" styleId="ecgcCoverNo" value="N" disabled = "true" />&nbsp;No&nbsp;
	   <%} %>
	   <html:errors property="ecgcCover" />
	   <html:hidden property="ecgcCover" styleId="ecgcCover"/>
	   </td>
</tr>  
</tbody> 
</table>
</td>
</tr>
</tbody>
<%
		if (sessionCountryListForLine.size() == 0) {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="countryListEmpty" value="Y" />
	<%
		} else {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="countryListEmpty" value="N" />
	<%
		}
	%>
	
	<%
		if (sessionCurrencyListForLine.size() == 0 ) {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="currencyListEmpty" value="Y" />
	<%
		} else {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="currencyListEmpty" value="N" />
	<%
		}
	%>
<%
		if (sessionBankListForLine.size() == 0) {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="bankListEmpty" value="Y" />
	<%
		} else {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="bankListEmpty" value="N" />
	<%
		}
	%>
	
	<%
		if (sessionDrawerListForLine.size() == 0) {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="drawerListEmpty" value="Y" />
	<%
		} else {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="drawerListEmpty" value="N" />
	<%
		}
	%>
	<%
		if (sessionDraweeListForLine.size() == 0 ) {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="draweeListEmpty" value="Y" />
	<%
		} else {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="draweeListEmpty" value="N" />
	<%
		}
	%>
	<%
		if (sessionBeneListForLine.size() == 0) {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="beneListEmpty" value="Y" />
	<%
		} else {
	%>
	<html:hidden name="LineCovenantDetailForm"
		property="beneListEmpty" value="N" />
	<%
		}
	%>
	<%
		if (covenantGoodsRestrictionListCopy.size() == 0 ) {
	%>
	<html:hidden name="LmtCovenantDetailForm"
		property="parentGoodsListEmpty" value="Y" />
	<%
		} else {
	%>
	<html:hidden name="LmtCovenantDetailForm"
		property="parentGoodsListEmpty" value="N" />
	<%
		}
	%>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="6">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="javascript:saveLimitCovenant()"><img src="img/ok1.gif" name="Image4411" border="0" id="Image4411" /></a></td>
        <td><a href="javascript:cancelSubmitCovenant()"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a></td>
    </tr>
    <tr>
        <td colspan="6">&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>     