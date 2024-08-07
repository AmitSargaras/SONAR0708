// JavaScript Document

function toNumber(value) {
	var pattern = /[,]*/g;
	return new Number(parseFloat(value.replace(pattern,"")));
}

function format(value) {
	return value;
}

/*
function testMe(view, target, args) {
	alert("testMe");
}
*/
// target is the source
function highlightDirect(view, target, args) {
	if(!view[target]) {
		alert("highlight: invalid target");
		return;
	}
	/*
	 alert(args[0] + " => forecast: " + lever.attributes["forecast"][args[0]] +
	 	"[" + typeof(lever.attributes["forecast"][args[0]]) + "]" + 
		" buffer: " + lever.attributes["buffer"][args[0]] +
		"[" + typeof(lever.attributes["buffer"][args[0]]) + "]"
		);
	*/
	if(lever.attributes["forecast"][args[0]] != lever.attributes["buffer"][args[0]].toString()) {
		//alert(args[0]);
		view[target].setAttribute("className","highlight_direct");
	} else {
		view[target].setAttribute("className","");
	}
/*
	if(view[target].value != view[target].defaultValue) {
		view[target].setAttribute("className","highlight_direct");
	} */
}

function finBalanceSheet(storeHandle) {
	this.usName = "fBalanceSheet";
	this.usHandle = storeHandle;
	this.userStore = new itgUserStore(this.usName);
	this.attributes = new Array();
	this.attributes["forecast"] = new Array();
	this.attributes["2001"] = new Array();
	this.attributes["2000"] = new Array();
	this.attributes["buffer"] = new Array(); 	// for calculation purpose

	this.userStore.load(this.usHandle);
	this.attributes["forecast"]["CashEquivalent"]=toNumber(this.userStore.getAttribute("bs13"));
	this.attributes["forecast"]["AccountsReceivable"]=toNumber(this.userStore.getAttribute("bs23"));
	this.attributes["forecast"]["Inventory"]=toNumber(this.userStore.getAttribute("bs33"));
	this.attributes["forecast"]["AmountDueFromDirectors"]=toNumber(this.userStore.getAttribute("bs43"));
	this.attributes["forecast"]["OtherCurrentAssets"]=toNumber(this.userStore.getAttribute("bs53"));
	this.attributes["forecast"]["CurrentAssets"]=toNumber(this.userStore.getAttribute("bs63"));
	this.attributes["forecast"]["FixedAssetsNet"]=toNumber(this.userStore.getAttribute("bs73"));
	this.attributes["forecast"]["Investments"]=toNumber(this.userStore.getAttribute("bs83"));
	this.attributes["forecast"]["OtherNonCurrentAssets"]=toNumber(this.userStore.getAttribute("bs93"));
	this.attributes["forecast"]["NonCurrentAssets"]=toNumber(this.userStore.getAttribute("bs103"));
	this.attributes["forecast"]["TotalAssets"]=toNumber(this.userStore.getAttribute("bs113"));
	this.attributes["forecast"]["ShortTermDebt"]=toNumber(this.userStore.getAttribute("bs123"));
	this.attributes["forecast"]["AccountsPayable"]=toNumber(this.userStore.getAttribute("bs133"));
	this.attributes["forecast"]["TaxProvision"]=toNumber(this.userStore.getAttribute("bs143"));
	this.attributes["forecast"]["AmountDueToShareholders"]=toNumber(this.userStore.getAttribute("bs153"));
	this.attributes["forecast"]["DividendsProposed"]=toNumber(this.userStore.getAttribute("bs163"));
	this.attributes["forecast"]["OtherCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs173"));
	this.attributes["forecast"]["CurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs183"));
	this.attributes["forecast"]["LongTermDebt"]=toNumber(this.userStore.getAttribute("bs193"));
	this.attributes["forecast"]["OtherNonCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs203"));
	this.attributes["forecast"]["NonCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs213"));
	this.attributes["forecast"]["TotalLiabilities"]=toNumber(this.userStore.getAttribute("bs223"));
	this.attributes["forecast"]["ShareCapital"]=toNumber(this.userStore.getAttribute("bs233"));
	this.attributes["forecast"]["DeferredTax"]=toNumber(this.userStore.getAttribute("bs243"));
	this.attributes["forecast"]["OtherEquity"]=toNumber(this.userStore.getAttribute("bs253"));
	this.attributes["forecast"]["RetainedEarnings"]=toNumber(this.userStore.getAttribute("bs263"));
	this.attributes["forecast"]["Equity"]=toNumber(this.userStore.getAttribute("bs273"));
	this.attributes["forecast"]["EquityLiabilities"]=toNumber(this.userStore.getAttribute("bs283"));

	this.attributes["2001"]["CashEquivalent"]=toNumber(this.userStore.getAttribute("bs12"));
	this.attributes["2001"]["AccountsReceivable"]=toNumber(this.userStore.getAttribute("bs22"));
	this.attributes["2001"]["Inventory"]=toNumber(this.userStore.getAttribute("bs32"));
	this.attributes["2001"]["AmountDueFromDirectors"]=toNumber(this.userStore.getAttribute("bs42"));
	this.attributes["2001"]["OtherCurrentAssets"]=toNumber(this.userStore.getAttribute("bs52"));
	this.attributes["2001"]["CurrentAssets"]=toNumber(this.userStore.getAttribute("bs62"));
	this.attributes["2001"]["FixedAssetsNet"]=toNumber(this.userStore.getAttribute("bs72"));
	this.attributes["2001"]["Investments"]=toNumber(this.userStore.getAttribute("bs82"));
	this.attributes["2001"]["OtherNonCurrentAssets"]=toNumber(this.userStore.getAttribute("bs92"));
	this.attributes["2001"]["NonCurrentAssets"]=toNumber(this.userStore.getAttribute("bs102"));
	this.attributes["2001"]["TotalAssets"]=toNumber(this.userStore.getAttribute("bs112"));
	this.attributes["2001"]["ShortTermDebt"]=toNumber(this.userStore.getAttribute("bs122"));
	this.attributes["2001"]["AccountsPayable"]=toNumber(this.userStore.getAttribute("bs132"));
	this.attributes["2001"]["TaxProvision"]=toNumber(this.userStore.getAttribute("bs142"));
	this.attributes["2001"]["AmountDueToShareholders"]=toNumber(this.userStore.getAttribute("bs152"));
	this.attributes["2001"]["DividendsProposed"]=toNumber(this.userStore.getAttribute("bs162"));
	this.attributes["2001"]["OtherCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs172"));
	this.attributes["2001"]["CurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs182"));
	this.attributes["2001"]["LongTermDebt"]=toNumber(this.userStore.getAttribute("bs192"));
	this.attributes["2001"]["OtherNonCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs202"));
	this.attributes["2001"]["NonCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs212"));
	this.attributes["2001"]["TotalLiabilities"]=toNumber(this.userStore.getAttribute("bs222"));
	this.attributes["2001"]["ShareCapital"]=toNumber(this.userStore.getAttribute("bs232"));
	this.attributes["2001"]["DeferredTax"]=toNumber(this.userStore.getAttribute("bs242"));
	this.attributes["2001"]["OtherEquity"]=toNumber(this.userStore.getAttribute("bs252"));
	this.attributes["2001"]["RetainedEarnings"]=toNumber(this.userStore.getAttribute("bs262"));
	this.attributes["2001"]["Equity"]=toNumber(this.userStore.getAttribute("bs272"));
	this.attributes["2001"]["EquityLiabilities"]=toNumber(this.userStore.getAttribute("bs282"));

	this.attributes["2000"]["CashEquivalent"]=toNumber(this.userStore.getAttribute("bs11"));
	this.attributes["2000"]["AccountsReceivable"]=toNumber(this.userStore.getAttribute("bs21"));
	this.attributes["2000"]["Inventory"]=toNumber(this.userStore.getAttribute("bs31"));
	this.attributes["2000"]["AmountDueFromDirectors"]=toNumber(this.userStore.getAttribute("bs41"));
	this.attributes["2000"]["OtherCurrentAssets"]=toNumber(this.userStore.getAttribute("bs51"));
	this.attributes["2000"]["CurrentAssets"]=toNumber(this.userStore.getAttribute("bs61"));
	this.attributes["2000"]["FixedAssetsNet"]=toNumber(this.userStore.getAttribute("bs71"));
	this.attributes["2000"]["Investments"]=toNumber(this.userStore.getAttribute("bs81"));
	this.attributes["2000"]["OtherNonCurrentAssets"]=toNumber(this.userStore.getAttribute("bs91"));
	this.attributes["2000"]["NonCurrentAssets"]=toNumber(this.userStore.getAttribute("bs101"));
	this.attributes["2000"]["TotalAssets"]=toNumber(this.userStore.getAttribute("bs111"));
	this.attributes["2000"]["ShortTermDebt"]=toNumber(this.userStore.getAttribute("bs121"));
	this.attributes["2000"]["AccountsPayable"]=toNumber(this.userStore.getAttribute("bs131"));
	this.attributes["2000"]["TaxProvision"]=toNumber(this.userStore.getAttribute("bs141"));
	this.attributes["2000"]["AmountDueToShareholders"]=toNumber(this.userStore.getAttribute("bs151"));
	this.attributes["2000"]["DividendsProposed"]=toNumber(this.userStore.getAttribute("bs161"));
	this.attributes["2000"]["OtherCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs171"));
	this.attributes["2000"]["CurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs181"));
	this.attributes["2000"]["LongTermDebt"]=toNumber(this.userStore.getAttribute("bs191"));
	this.attributes["2000"]["OtherNonCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs201"));
	this.attributes["2000"]["NonCurrentLiabilities"]=toNumber(this.userStore.getAttribute("bs211"));
	this.attributes["2000"]["TotalLiabilities"]=toNumber(this.userStore.getAttribute("bs221"));
	this.attributes["2000"]["ShareCapital"]=toNumber(this.userStore.getAttribute("bs231"));
	this.attributes["2000"]["DeferredTax"]=toNumber(this.userStore.getAttribute("bs241"));
	this.attributes["2000"]["OtherEquity"]=toNumber(this.userStore.getAttribute("bs251"));
	this.attributes["2000"]["RetainedEarnings"]=toNumber(this.userStore.getAttribute("bs261"));
	this.attributes["2000"]["Equity"]=toNumber(this.userStore.getAttribute("bs271"));
	this.attributes["2000"]["EquityLiabilities"]=toNumber(this.userStore.getAttribute("bs281"));	

	this.attributes["buffer"]["CashEquivalent"]=this.attributes["forecast"]["CashEquivalent"];
	this.attributes["buffer"]["AccountsReceivable"]=this.attributes["forecast"]["AccountsReceivable"];
	this.attributes["buffer"]["Inventory"]=this.attributes["forecast"]["Inventory"];
	this.attributes["buffer"]["AmountDueFromDirectors"]=this.attributes["forecast"]["AmountDueFromDirectors"];
	this.attributes["buffer"]["OtherCurrentAssets"]=this.attributes["forecast"]["OtherCurrentAssets"];
	this.attributes["buffer"]["CurrentAssets"]=this.attributes["forecast"]["CurrentAssets"];
	this.attributes["buffer"]["FixedAssetsNet"]=this.attributes["forecast"]["FixedAssetsNet"];
	this.attributes["buffer"]["Investments"]=this.attributes["forecast"]["Investments"];
	this.attributes["buffer"]["OtherNonCurrentAssets"]=this.attributes["forecast"]["OtherNonCurrentAssets"];
	this.attributes["buffer"]["NonCurrentAssets"]=this.attributes["forecast"]["NonCurrentAssets"];
	this.attributes["buffer"]["TotalAssets"]=this.attributes["forecast"]["TotalAssets"];
	this.attributes["buffer"]["ShortTermDebt"]=this.attributes["forecast"]["ShortTermDebt"];
	this.attributes["buffer"]["AccountsPayable"]=this.attributes["forecast"]["AccountsPayable"];
	this.attributes["buffer"]["TaxProvision"]=this.attributes["forecast"]["TaxProvision"];
	this.attributes["buffer"]["AmountDueToShareholders"]=this.attributes["forecast"]["AmountDueToShareholders"];
	this.attributes["buffer"]["DividendsProposed"]=this.attributes["forecast"]["DividendsProposed"];
	this.attributes["buffer"]["OtherCurrentLiabilities"]=this.attributes["forecast"]["OtherCurrentLiabilities"];
	this.attributes["buffer"]["CurrentLiabilities"]=this.attributes["forecast"]["CurrentLiabilities"];
	this.attributes["buffer"]["LongTermDebt"]=this.attributes["forecast"]["LongTermDebt"];
	this.attributes["buffer"]["OtherNonCurrentLiabilities"]=this.attributes["forecast"]["OtherNonCurrentLiabilities"];
	this.attributes["buffer"]["NonCurrentLiabilities"]=this.attributes["forecast"]["NonCurrentLiabilities"];
	this.attributes["buffer"]["TotalLiabilities"]=this.attributes["forecast"]["TotalLiabilities"];
	this.attributes["buffer"]["ShareCapital"]=this.attributes["forecast"]["ShareCapital"];
	this.attributes["buffer"]["DeferredTax"]=this.attributes["forecast"]["DeferredTax"];
	this.attributes["buffer"]["OtherEquity"]=this.attributes["forecast"]["OtherEquity"];
	this.attributes["buffer"]["RetainedEarnings"]=this.attributes["forecast"]["RetainedEarnings"];
	this.attributes["buffer"]["Equity"]=this.attributes["forecast"]["Equity"];
	this.attributes["buffer"]["EquityLiabilities"]=this.attributes["forecast"]["EquityLiabilities"];

	function getAttribute(name) {
		return toNumber(this.userStore.getAttribute(name));
	}
	finBalanceSheet.prototype.getAttribute = getAttribute;
}

function finIncomeStatement(storeHandle) {
	this.usName = "fIncomeStatement";
	this.usHandle = storeHandle;
	this.userStore = new itgUserStore(this.usName);
	// this.attributes = new Array("fRevenue","fCOGS","fNetProfit");
	this.attributes = new Array();
	// can make this dynamic to handle as many year as possible
	// all values stored as floating number
	this.attributes["forecast"] = new Array();
	this.attributes["2001"] = new Array();
	this.attributes["2000"] = new Array();
	this.attributes["buffer"] = new Array();
	
	this.userStore.load(this.usHandle);
	this.attributes["buffer"]["Revenue"]=this.attributes["forecast"]["Revenue"]=toNumber(this.userStore.getAttribute("fRevenue"));
	this.attributes["buffer"]["COGS"]=this.attributes["forecast"]["COGS"]=toNumber(this.userStore.getAttribute("fCOGS"));
	this.attributes["buffer"]["NetProfit"]=this.attributes["forecast"]["NetProfit"]=toNumber(this.userStore.getAttribute("fNetProfit"));
	this.attributes["buffer"]["GrossProfit"]=this.attributes["forecast"]["GrossProfit"]=toNumber(this.userStore.getAttribute("fGrossProfit"));
	this.attributes["buffer"]["Overheads"]=this.attributes["forecast"]["Overheads"]=toNumber(this.userStore.getAttribute("fOverheads"));
	this.attributes["buffer"]["Depreciation"]=this.attributes["forecast"]["Depreciation"]=toNumber(this.userStore.getAttribute("fDepreciation"));
	this.attributes["buffer"]["OtherIncome"]=this.attributes["forecast"]["OtherIncome"]=toNumber(this.userStore.getAttribute("fOtherIncome"));
	this.attributes["buffer"]["EBIT"]=this.attributes["forecast"]["EBIT"]=toNumber(this.userStore.getAttribute("fEBIT"));
	this.attributes["buffer"]["InterestExpense"]=this.attributes["forecast"]["InterestExpense"]=toNumber(this.userStore.getAttribute("fInterestExpense"));
	this.attributes["buffer"]["ProfitBeforeTaxes"]=this.attributes["forecast"]["ProfitBeforeTaxes"]=toNumber(this.userStore.getAttribute("fProfitBeforeTaxes"));
	this.attributes["buffer"]["Taxes"]=this.attributes["forecast"]["Taxes"]=toNumber(this.userStore.getAttribute("fTaxes"));
	this.attributes["buffer"]["ExtraordinaryItems"]=this.attributes["forecast"]["ExtraordinaryItems"]=toNumber(this.userStore.getAttribute("fExtraordinaryItems"));

	// previous year; if previous 2 year then prefix with p2
	this.attributes["2001"]["Revenue"]=toNumber(this.userStore.getAttribute("is2"));
	this.attributes["2001"]["COGS"]=toNumber(this.userStore.getAttribute("is5"));
	this.attributes["2001"]["NetProfit"]=toNumber(this.userStore.getAttribute("is35"));
	this.attributes["2001"]["GrossProfit"]=toNumber(this.userStore.getAttribute("is8"));
	this.attributes["2001"]["Overheads"]=toNumber(this.userStore.getAttribute("is11"));
	this.attributes["2001"]["Depreciation"]=toNumber(this.userStore.getAttribute("is14"));
	this.attributes["2001"]["OtherIncome"]=toNumber(this.userStore.getAttribute("is17"));
	this.attributes["2001"]["EBIT"]=toNumber(this.userStore.getAttribute("is20"));
	this.attributes["2001"]["InterestExpense"]=toNumber(this.userStore.getAttribute("is23"));
	this.attributes["2001"]["ProfitBeforeTaxes"]=toNumber(this.userStore.getAttribute("is26"));
	this.attributes["2001"]["Taxes"]=toNumber(this.userStore.getAttribute("is29"));
	this.attributes["2001"]["ExtraordinaryItems"]=toNumber(this.userStore.getAttribute("is32"));

	this.attributes["2000"]["Revenue"]=toNumber(this.userStore.getAttribute("is1"));
	this.attributes["2000"]["COGS"]=toNumber(this.userStore.getAttribute("is4"));	
	this.attributes["2000"]["GrossProfit"]=toNumber(this.userStore.getAttribute("is7"));
	this.attributes["2000"]["Overheads"]=toNumber(this.userStore.getAttribute("is10"));
	this.attributes["2000"]["Depreciation"]=toNumber(this.userStore.getAttribute("is13"));
	this.attributes["2000"]["OtherIncome"]=toNumber(this.userStore.getAttribute("is16"));
	this.attributes["2000"]["EBIT"]=toNumber(this.userStore.getAttribute("is19"));
	this.attributes["2000"]["InterestExpense"]=toNumber(this.userStore.getAttribute("is22"));
	this.attributes["2000"]["ProfitBeforeTaxes"]=toNumber(this.userStore.getAttribute("is25"));
	this.attributes["2000"]["Taxes"]=toNumber(this.userStore.getAttribute("is28"));
	this.attributes["2000"]["ExtraordinaryItems"]=toNumber(this.userStore.getAttribute("is31"));
	this.attributes["2000"]["NetProfit"]=toNumber(this.userStore.getAttribute("is34"));
}

function finLever(storeHandle) {
	this.usName = "fLever";
	this.usHandle = storeHandle;
	this.userStore = new itgUserStore(this.usName);
	//this.attributes = new Array("fDaysReceivables","fDaysInventory","fDaysPayables","fNewLoanLTD","fRevenueGrowth","fUnitCostGrowth","fPriceChange","fOverheadGrowth","fNewLoanLTD","fIntestestRateLTD","fInterestRateSTD");
	this.attributes = new Array();
	this.attributes["forecast"] = new Array();
	this.attributes["2001"] = new Array();
	this.attributes["2000"] = new Array();
	this.attributes["buffer"] = new Array();
	
	this.userStore.load(this.usHandle);
	this.attributes["buffer"]["DaysReceivables"]=this.attributes["forecast"]["DaysReceivables"]=toNumber(this.userStore.getAttribute("fDaysReceivables"));
	this.attributes["buffer"]["DaysInventory"]=this.attributes["forecast"]["DaysInventory"]=toNumber(this.userStore.getAttribute("fDaysInventory"));
	this.attributes["buffer"]["DaysPayables"]=this.attributes["forecast"]["DaysPayables"]=toNumber(this.userStore.getAttribute("fDaysPayables"));
	this.attributes["buffer"]["RevenueGrowth"]=this.attributes["forecast"]["RevenueGrowth"]=toNumber(this.userStore.getAttribute("fRevenueGrowth"));
	this.attributes["buffer"]["UnitCostGrowth"]=this.attributes["forecast"]["UnitCostGrowth"]=toNumber(this.userStore.getAttribute("fUnitCostGrowth"));
	this.attributes["buffer"]["PriceChange"]=this.attributes["forecast"]["PriceChange"]=toNumber(this.userStore.getAttribute("fPriceChange"));
	this.attributes["buffer"]["OverheadGrowth"]=this.attributes["forecast"]["OverheadGrowth"]=toNumber(this.userStore.getAttribute("fOverheadGrowth"));
	this.attributes["buffer"]["NewLoanLTD"]=this.attributes["forecast"]["NewLoanLTD"]=toNumber(this.userStore.getAttribute("fNewLoanLTD"));
	this.attributes["buffer"]["InterestRateLTD"]=this.attributes["forecast"]["IntestestRateLTD"]=toNumber(this.userStore.getAttribute("fIntestestRateLTD"));
	this.attributes["buffer"]["InterestRateSTD"]=this.attributes["forecast"]["InterestRateSTD"]=toNumber(this.userStore.getAttribute("fInterestRateSTD"));
	this.attributes["buffer"]["NetChangeInCash"]=this.attributes["forecast"]["NetChangeInCash"]=toNumber(this.userStore.getAttribute("fNetChangeInCash"));
	
	this.attributes["buffer"]["CashEquivalent"]=this.attributes["forecast"]["CashEquivalent"]=toNumber(this.userStore.getAttribute("sm23"));
	this.attributes["buffer"]["InterestCover"]=this.attributes["forecast"]["InterestCover"]=toNumber(this.userStore.getAttribute("sm26"));
	this.attributes["buffer"]["WorkingCapital"]=this.attributes["forecast"]["WorkingCapital"]=toNumber(this.userStore.getAttribute("sm29"));
	this.attributes["buffer"]["CurrentRatio"]=this.attributes["forecast"]["CurrentRatio"]=toNumber(this.userStore.getAttribute("sm32"));
	this.attributes["buffer"]["TotalLiabilityEquity"]=this.attributes["forecast"]["TotalLiabilityEquity"]=toNumber(this.userStore.getAttribute("sm35"));
	this.attributes["buffer"]["EquityTotalAssets"]=this.attributes["forecast"]["EquityTotalAssets"]=toNumber(this.userStore.getAttribute("sm38"));
	this.attributes["buffer"]["ROCE"]=this.attributes["forecast"]["ROCE"]=toNumber(this.userStore.getAttribute("sm41"));
	this.attributes["buffer"]["GrossMargin"]=this.attributes["forecast"]["GrossMargin"]=toNumber(this.userStore.getAttribute("sm44"));
	this.attributes["buffer"]["NetProfitSales"]=this.attributes["forecast"]["NetProfitSales"]=toNumber(this.userStore.getAttribute("sm47"));
	this.attributes["buffer"]["COGS"]=this.attributes["forecast"]["COGS"]=toNumber(this.userStore.getAttribute("sm50"));
	this.attributes["buffer"]["Overhead"]=this.attributes["forecast"]["Overhead"]=toNumber(this.userStore.getAttribute("sm53"));
	
	this.attributes["2001"]["DaysReceivables"]=toNumber(this.userStore.getAttribute("sm2"));
	this.attributes["2001"]["DaysInventory"]=toNumber(this.userStore.getAttribute("sm5"));
	this.attributes["2001"]["DaysPayables"]=toNumber(this.userStore.getAttribute("sm8"));
	this.attributes["2001"]["RevenueGrowth"]=toNumber(this.userStore.getAttribute("sm10"));
	this.attributes["2001"]["OverheadGrowth"]=toNumber(this.userStore.getAttribute("sm14"));

	this.attributes["2001"]["CashEquivalent"]=toNumber(this.userStore.getAttribute("sm22"));
	this.attributes["2001"]["InterestCover"]=toNumber(this.userStore.getAttribute("sm25"));
	this.attributes["2001"]["WorkingCapital"]=toNumber(this.userStore.getAttribute("sm28"));
	this.attributes["2001"]["CurrentRatio"]=toNumber(this.userStore.getAttribute("sm31"));
	this.attributes["2001"]["TotalLiabilityEquity"]=toNumber(this.userStore.getAttribute("sm34"));
	this.attributes["2001"]["EquityTotalAssets"]=toNumber(this.userStore.getAttribute("sm37"));
	this.attributes["2001"]["ROCE"]=toNumber(this.userStore.getAttribute("sm40"));
	this.attributes["2001"]["GrossMargin"]=toNumber(this.userStore.getAttribute("sm43"));
	this.attributes["2001"]["NetProfitSales"]=toNumber(this.userStore.getAttribute("sm46"));
	this.attributes["2001"]["COGS"]=toNumber(this.userStore.getAttribute("sm49"));
	this.attributes["2001"]["Overhead"]=toNumber(this.userStore.getAttribute("sm52"));
	
	this.attributes["2000"]["DaysReceivables"]=toNumber(this.userStore.getAttribute("sm1"));
	this.attributes["2000"]["DaysInventory"]=toNumber(this.userStore.getAttribute("sm4"));
	this.attributes["2000"]["DaysPayables"]=toNumber(this.userStore.getAttribute("sm7"));

	this.attributes["2000"]["CashEquivalent"]=toNumber(this.userStore.getAttribute("sm21"));
	this.attributes["2000"]["InterestCover"]=toNumber(this.userStore.getAttribute("sm24"));
	this.attributes["2000"]["WorkingCapital"]=toNumber(this.userStore.getAttribute("sm27"));
	this.attributes["2000"]["CurrentRatio"]=toNumber(this.userStore.getAttribute("sm30"));
	this.attributes["2000"]["TotalLiabilityEquity"]=toNumber(this.userStore.getAttribute("sm33"));
	this.attributes["2000"]["EquityTotalAssets"]=toNumber(this.userStore.getAttribute("sm36"));
	this.attributes["2000"]["ROCE"]=toNumber(this.userStore.getAttribute("sm39"));
	this.attributes["2000"]["GrossMargin"]=toNumber(this.userStore.getAttribute("sm42"));
	this.attributes["2000"]["NetProfitSales"]=toNumber(this.userStore.getAttribute("sm45"));
	this.attributes["2000"]["COGS"]=toNumber(this.userStore.getAttribute("sm48"));
	this.attributes["2000"]["Overhead"]=toNumber(this.userStore.getAttribute("sm51"));

	function getAttribute(name) {
		return toNumber(this.userStore.getAttribute(name));
	}
	finLever.prototype.getAttribute = getAttribute;
}

function finCashflowStatement(storeHandle) {
	this.usName = "fCashFlow";
	this.usHandle = storeHandle;
	this.userStore = new itgUserStore(this.usName);
	// this.attributes = new Array("fNetIncome","fDepreciation");
	this.attributes = new Array();
	this.attributes["forecast"] = new Array();
	this.attributes["2001"] = new Array();
	this.attributes["buffer"] = new Array();
	
	this.userStore.load(this.usHandle);
	this.attributes["buffer"]["NetIncome"]=this.attributes["forecast"]["NetIncome"]=toNumber(this.userStore.getAttribute("fNetIncome"));
	this.attributes["buffer"]["Depreciation"]=this.attributes["forecast"]["Depreciation"]=toNumber(this.userStore.getAttribute("fDepreciation"));
	this.attributes["buffer"]["ChangeInDeferredTaxation"]=this.attributes["forecast"]["ChangeInDeferredTaxation"]=toNumber(this.userStore.getAttribute("cfs6"));
	this.attributes["buffer"]["ChangeInAR"]=this.attributes["forecast"]["ChangeInAR"]=toNumber(this.userStore.getAttribute("cfs8"));
	this.attributes["buffer"]["ChangeInInventory"]=this.attributes["forecast"]["ChangeInInventory"]=toNumber(this.userStore.getAttribute("cfs10"));
	this.attributes["buffer"]["ChangeInAP"]=this.attributes["forecast"]["ChangeInAP"]=toNumber(this.userStore.getAttribute("cfs12"));
	this.attributes["buffer"]["ChangeInPrepayment"]=this.attributes["forecast"]["ChangeInPrepayment"]=toNumber(this.userStore.getAttribute("cfs14"));
	this.attributes["buffer"]["NetCashFromOperatingActivities"]=this.attributes["forecast"]["NetCashFromOperatingActivities"]=toNumber(this.userStore.getAttribute("cfs16"));
	this.attributes["buffer"]["ChangeInFA"]=this.attributes["forecast"]["ChangeInFA"]=toNumber(this.userStore.getAttribute("cfs18"));
	this.attributes["buffer"]["ChangeInInvestment"]=this.attributes["forecast"]["ChangeInInvestment"]=toNumber(this.userStore.getAttribute("cfs20"));
	this.attributes["buffer"]["NetCashFromInvestingActivities"]=this.attributes["forecast"]["NetCashFromInvestingActivities"]=toNumber(this.userStore.getAttribute("cfs22"));
	this.attributes["buffer"]["ChangeInLTD"]=this.attributes["forecast"]["ChangeInLTD"]=toNumber(this.userStore.getAttribute("cfs24"));
	this.attributes["buffer"]["ChangeInSTD"]=this.attributes["forecast"]["ChangeInSTD"]=toNumber(this.userStore.getAttribute("cfs26"));
	this.attributes["buffer"]["AmtFromDirOrSH"]=this.attributes["forecast"]["AmtFromDirOrSH"]=toNumber(this.userStore.getAttribute("cfs28"));
	this.attributes["buffer"]["Dividends"]=this.attributes["forecast"]["Dividends"]=toNumber(this.userStore.getAttribute("cfs30"));
	this.attributes["buffer"]["NetCashFromFinancingActivities"]=this.attributes["forecast"]["NetCashFromFinancingActivities"]=toNumber(this.userStore.getAttribute("cfs32"));
	this.attributes["buffer"]["NetIncreaseInCash"]=this.attributes["forecast"]["NetIncreaseInCash"]=toNumber(this.userStore.getAttribute("cfs34"));
	
	this.attributes["2001"]["NetIncome"]=toNumber(this.userStore.getAttribute("cfs1"));
	this.attributes["2001"]["Depreciation"]=toNumber(this.userStore.getAttribute("cfs3"));
	this.attributes["2001"]["ChangeInDeferredTaxation"]=toNumber(this.userStore.getAttribute("cfs5"));
	this.attributes["2001"]["ChangeInAR"]=toNumber(this.userStore.getAttribute("cfs7"));
	this.attributes["2001"]["ChangeInInventory"]=toNumber(this.userStore.getAttribute("cfs9"));
	this.attributes["2001"]["ChangeInAP"]=toNumber(this.userStore.getAttribute("cfs11"));
	this.attributes["2001"]["ChangeInPrepayment"]=toNumber(this.userStore.getAttribute("cfs13"));
	this.attributes["2001"]["NetCashFromOperatingActivities"]=toNumber(this.userStore.getAttribute("cfs15"));
	this.attributes["2001"]["ChangeInFA"]=toNumber(this.userStore.getAttribute("cfs17"));
	this.attributes["2001"]["ChangeInInvestment"]=toNumber(this.userStore.getAttribute("cfs19"));
	this.attributes["2001"]["NetCashFromInvestingActivities"]=toNumber(this.userStore.getAttribute("cfs21"));
	this.attributes["2001"]["ChangeInLTD"]=toNumber(this.userStore.getAttribute("cfs23"));
	this.attributes["2001"]["ChangeInSTD"]=toNumber(this.userStore.getAttribute("cfs25"));
	this.attributes["2001"]["AmtFromDirOrSH"]=toNumber(this.userStore.getAttribute("cfs27"));
	this.attributes["2001"]["Dividends"]=toNumber(this.userStore.getAttribute("cfs29"));
	this.attributes["2001"]["NetCashFromFinancingActivities"]=toNumber(this.userStore.getAttribute("cfs31"));
	this.attributes["2001"]["NetIncreaseInCash"]=toNumber(this.userStore.getAttribute("cfs33"));
	
	function getAttribute(name) {
		return toNumber(this.userStore.getAttribute(name));
	}
	finCashflowStatement.prototype.getAttribute = getAttribute;
}

// =============================================================================================
function calNetCashFromOperatingActivities() {
	//alert("calNetCashFromOperatingActivities");
	//alert("Before NetCashFromOperatingActivities=" + cashflowStmt.attributes["buffer"]["NetCashFromOperatingActivities"]);
	cashflowStmt.attributes["buffer"]["NetCashFromOperatingActivities"] =
		cashflowStmt.attributes["buffer"]["NetIncome"] +
		cashflowStmt.attributes["buffer"]["Depreciation"] +
		cashflowStmt.attributes["buffer"]["ChangeInDeferredTaxation"] +
		cashflowStmt.attributes["buffer"]["ChangeInAR"] +
		cashflowStmt.attributes["buffer"]["ChangeInInventory"] +
		cashflowStmt.attributes["buffer"]["ChangeInAP"] +
		cashflowStmt.attributes["buffer"]["ChangeInPrepayment"];
	//alert("after NetCashFromOperatingActivities=" + cashflowStmt.attributes["buffer"]["NetCashFromOperatingActivities"]);

}

function calNetCashFromInvestingActities() {
	cashflowStmt.attributes["buffer"]["NetCashFromInvestingActivities"] =
		cashflowStmt.attributes["buffer"]["ChangeInFA"] +
		cashflowStmt.attributes["buffer"]["ChangeInInvestment"];
}

function calNetCashFromFinancingActivities() {
	//alert("calNetCashFromFinancingActivities");
	cashflowStmt.attributes["buffer"]["NetCashFromFinancingActivities"] =
		cashflowStmt.attributes["buffer"]["ChangeInLTD"] +
		cashflowStmt.attributes["buffer"]["ChangeInSTD"] +
		cashflowStmt.attributes["buffer"]["AmtFromDirOrSH"] +
		cashflowStmt.attributes["buffer"]["Dividends"];
}

function calCurrentLiabilities() {
	// alert("calCurrentLiabilities");
	//alert(balanceSheet.attributes["buffer"]["CurrentLiabilities"]);
	balanceSheet.attributes["buffer"]["CurrentLiabilities"] = 
		balanceSheet.attributes["buffer"]["ShortTermDebt"]+
		balanceSheet.attributes["buffer"]["AccountsPayable"]+
		balanceSheet.attributes["buffer"]["TaxProvision"]+
		balanceSheet.attributes["buffer"]["AmountDueToShareholders"]+
		balanceSheet.attributes["buffer"]["DividendsProposed"]+
		balanceSheet.attributes["buffer"]["OtherCurrentLiabilities"];
	balanceSheet.attributes["buffer"]["CurrentLiabilities"] =
		new Number(balanceSheet.attributes["buffer"]["CurrentLiabilities"].toFixed(2));
	//alert(balanceSheet.attributes["buffer"]["CurrentLiabilities"]);
}

function calNonCurrentLiabilities() {
	balanceSheet.attributes["buffer"]["NonCurrentLiabilities"] = 
		balanceSheet.attributes["buffer"]["LongTermDebt"]+
		balanceSheet.attributes["buffer"]["OtherNonCurrentLiabilities"];
	balanceSheet.attributes["buffer"]["NonCurrentLiabilities"] =
		new Number(balanceSheet.attributes["buffer"]["NonCurrentLiabilities"].toFixed(2));
	//alert(balanceSheet.attributes["buffer"]["NonCurrentLiabilities"]);
}

function calTotalLiabilities() {
	//alert(typeof(balanceSheet.attributes["buffer"]["NonCurrentLiabilities"]));
	//alert(typeof(balanceSheet.attributes["buffer"]["CurrentLiabilities"]));
	//alert(balanceSheet.attributes["buffer"]["TotalLiabilities"]);
	balanceSheet.attributes["buffer"]["TotalLiabilities"] = 
		balanceSheet.attributes["buffer"]["NonCurrentLiabilities"] +
		balanceSheet.attributes["buffer"]["CurrentLiabilities"];
	//alert(balanceSheet.attributes["buffer"]["TotalLiabilities"]);
	balanceSheet.attributes["buffer"]["TotalLiabilities"] =
		new Number(balanceSheet.attributes["buffer"]["TotalLiabilities"].toFixed(2));
	//alert(balanceSheet.attributes["buffer"]["TotalLiabilities"]);
}

function calEquity() {
	//alert(balanceSheet.attributes["buffer"]["Equity"] + " " + typeof(balanceSheet.attributes["buffer"]["Equity"]));
	balanceSheet.attributes["buffer"]["Equity"] =
		balanceSheet.attributes["buffer"]["ShareCapital"] +
		balanceSheet.attributes["buffer"]["DeferredTax"] +
		balanceSheet.attributes["buffer"]["OtherEquity"] +
		balanceSheet.attributes["buffer"]["RetainedEarnings"];
	//alert(balanceSheet.attributes["buffer"]["Equity"] + " " + typeof(balanceSheet.attributes["buffer"]["Equity"]));
	balanceSheet.attributes["buffer"]["Equity"] =
		new Number(balanceSheet.attributes["buffer"]["Equity"].toFixed(2));
	//alert(balanceSheet.attributes["buffer"]["Equity"] + " " + typeof(balanceSheet.attributes["buffer"]["Equity"]));
}

function calEquityLiabilities() {
	balanceSheet.attributes["buffer"]["EquityLiabilities"] =
		balanceSheet.attributes["buffer"]["Equity"] +
		balanceSheet.attributes["buffer"]["TotalLiabilities"];
	balanceSheet.attributes["buffer"]["EquityLiabilities"] =
			new Number(balanceSheet.attributes["buffer"]["EquityLiabilities"].toFixed(2));
}

// target is the source of value
function calDaysReceivables(view, target, args) {
	// alert("calDaysReceivables called");	
	var dr = toNumber(view[target].value);
	balanceSheet.attributes["buffer"]["AccountsReceivable"]=incomeStmt.attributes["buffer"]["Revenue"]*dr/365;
	cashflowStmt.attributes["buffer"]["ChangeInAR"]=
		balanceSheet.attributes["2001"]["AccountsReceivable"]-balanceSheet.attributes["buffer"]["AccountsReceivable"];
	calNetCashFromOperatingActivities();
}

function calDaysInventory(view, target, args) {
	var di = toNumber(view[target].value);
	balanceSheet.attributes["buffer"]["Inventory"]=incomeStmt.attributes["buffer"]["Revenue"]*di/365;
	cashflowStmt.attributes["buffer"]["ChangeInInventory"]=
		balanceSheet.attributes["2001"]["Inventory"]-balanceSheet.attributes["buffer"]["Inventory"];
	calNetCashFromOperatingActivities();
}

function calDaysPayables(view, target, args) {
	var dp = toNumber(view[target].value);
	balanceSheet.attributes["buffer"]["AccountsPayable"]=incomeStmt.attributes["buffer"]["Revenue"]*dp/365;
	cashflowStmt.attributes["buffer"]["ChangeInAP"]=
		balanceSheet.attributes["buffer"]["AccountsPayable"]-balanceSheet.attributes["2001"]["AccountsPayable"];
	calNetCashFromOperatingActivities();

	calCurrentLiabilities();
	calNonCurrentLiabilities(); 
	calTotalLiabilities();
	calEquity();
	calEquityLiabilities(); 

}

// target is the source of value
function calNetIncreaseInCash(view, target, args) {
	cashflowStmt.attributes["buffer"]["NetIncreaseInCash"] =
		cashflowStmt.attributes["buffer"]["NetCashFromOperatingActivities"] +
		cashflowStmt.attributes["buffer"]["NetCashFromInvestingActivities"] +
		cashflowStmt.attributes["buffer"]["NetCashFromFinancingActivities"];
	cashflowStmt.attributes["buffer"]["NetIncreaseInCash"]=
		lever.attributes["buffer"]["NetChangeInCash"]=
		cashflowStmt.attributes["buffer"]["NetIncreaseInCash"].toFixed(2);
//alert(cashflowStmt.attributes["buffer"]["NetIncreaseInCash"]);		
	view[target].value=format(cashflowStmt.attributes["buffer"]["NetIncreaseInCash"]);	
}

function calCashEquivalent(view, target, args) {

	balanceSheet.attributes["buffer"]["TotalAssets"] =
		balanceSheet.attributes["buffer"]["EquityLiabilities"];
	balanceSheet.attributes["buffer"]["CurrentAssets"] =
		balanceSheet.attributes["buffer"]["TotalAssets"] -
		balanceSheet.attributes["buffer"]["NonCurrentAssets"];
	balanceSheet.attributes["buffer"]["CashEquivalent"] = 
		balanceSheet.attributes["buffer"]["CurrentAssets"]-
		balanceSheet.attributes["buffer"]["OtherCurrentAssets"]-
		balanceSheet.attributes["buffer"]["AmountDueFromDirectors"]-
		balanceSheet.attributes["buffer"]["Inventory"]-
		balanceSheet.attributes["buffer"]["AccountsReceivable"];

	balanceSheet.attributes["buffer"]["CashEquivalent"] =
		lever.attributes["buffer"]["CashEquivalent"] =
		balanceSheet.attributes["buffer"]["CashEquivalent"].toFixed(2);
	view[target].value=format(balanceSheet.attributes["buffer"]["CashEquivalent"]);
}

function calWorkingCapital(view, target, args) {
	//alert(balanceSheet.attributes["buffer"]["CurrentAssets"]);
	//alert(balanceSheet.attributes["buffer"]["CurrentLiabilities"]);
	//alert(incomeStmt.attributes["buffer"]["Overheads"]);
	lever.attributes["buffer"]["WorkingCapital"] =
		((balanceSheet.attributes["buffer"]["CurrentAssets"]-balanceSheet.attributes["buffer"]["CurrentLiabilities"])/incomeStmt.attributes["buffer"]["Overheads"])*100;	
	lever.attributes["buffer"]["WorkingCapital"] = lever.attributes["buffer"]["WorkingCapital"].toFixed(2);
	//alert(lever.attributes["buffer"]["WorkingCapital"]);
	view[target].value=format(lever.attributes["buffer"]["WorkingCapital"]);
}

function calCurrentRatio(view, target, args) {
	lever.attributes["buffer"]["CurrentRatio"] =
		balanceSheet.attributes["buffer"]["CurrentAssets"]/balanceSheet.attributes["buffer"]["CurrentLiabilities"];
	lever.attributes["buffer"]["CurrentRatio"] = lever.attributes["buffer"]["CurrentRatio"].toFixed(2);
	view[target].value=format(lever.attributes["buffer"]["CurrentRatio"]);
}

function calTotalLiabilityEquity(view, target, args) {
	//alert(balanceSheet.attributes["buffer"]["TotalLiabilities"]);
	//alert(balanceSheet.attributes["buffer"]["Equity"]);
	lever.attributes["buffer"]["TotalLiabilityEquity"] =
		balanceSheet.attributes["buffer"]["TotalLiabilities"]/balanceSheet.attributes["buffer"]["Equity"];
	lever.attributes["buffer"]["TotalLiabilityEquity"] = new Number(lever.attributes["buffer"]["TotalLiabilityEquity"].toFixed(2));
	//alert(lever.attributes["buffer"]["TotalLiabilityEquity"]);
	view[target].value=format(lever.attributes["buffer"]["TotalLiabilityEquity"]);
}

function calEquityTotalAssets(view, target, args) {
	lever.attributes["buffer"]["EquityTotalAssets"] =
		balanceSheet.attributes["buffer"]["Equity"]/balanceSheet.attributes["buffer"]["TotalAssets"];
	lever.attributes["buffer"]["EquityTotalAssets"] = new Number(lever.attributes["buffer"]["EquityTotalAssets"].toFixed(2));
	view[target].value=format(lever.attributes["buffer"]["EquityTotalAssets"]);
}

function calRevenueGrowth(view, target, args) {
	incomeStmt.attributes["buffer"]["Revenue"] =
		incomeStmt.attributes["2001"]["Revenue"]*(1+toNumber(view[target].value)/100);
	incomeStmt.attributes["buffer"]["Revenue"] = new Number(incomeStmt.attributes["buffer"]["Revenue"].toFixed(2));
	lever.attributes["buffer"]["RevenueGrowth"]=toNumber(view[target].value);
	
	incomeStmt.attributes["buffer"]["COGS"] =
		incomeStmt.attributes["2001"]["COGS"]*(1+lever.attributes["buffer"]["RevenueGrowth"]/100)*
		(1+lever.attributes["buffer"]["UnitCostGrowth"]/100)/(1+lever.attributes["buffer"]["PriceChange"]/100);
	incomeStmt.attributes["buffer"]["COGS"] = new Number(incomeStmt.attributes["buffer"]["COGS"].toFixed(2));	
	// alert(incomeStmt.attributes["buffer"]["COGS"] + " " + typeof(incomeStmt.attributes["buffer"]["COGS"]));

	incomeStmt.attributes["buffer"]["GrossProfit"] = 
		incomeStmt.attributes["buffer"]["Revenue"] - incomeStmt.attributes["buffer"]["COGS"];
	incomeStmt.attributes["buffer"]["GrossProfit"] = new Number(incomeStmt.attributes["buffer"]["GrossProfit"].toFixed(2));
	// alert(incomeStmt.attributes["buffer"]["GrossProfit"]);
	
	incomeStmt.attributes["buffer"]["EBIT"] =
		incomeStmt.attributes["buffer"]["GrossProfit"] -
		incomeStmt.attributes["buffer"]["Overheads"] -
		incomeStmt.attributes["buffer"]["Depreciation"] +
		incomeStmt.attributes["buffer"]["OtherIncome"];
	incomeStmt.attributes["buffer"]["EBIT"] = new Number(incomeStmt.attributes["buffer"]["EBIT"].toFixed(2));	
	
	incomeStmt.attributes["buffer"]["ProfitBeforeTaxes"] =
		incomeStmt.attributes["buffer"]["EBIT"] - incomeStmt.attributes["buffer"]["InterestExpense"];
	incomeStmt.attributes["buffer"]["ProfitBeforeTaxes"] = new Number(incomeStmt.attributes["buffer"]["ProfitBeforeTaxes"].toFixed(2));
	
	incomeStmt.attributes["buffer"]["Taxes"] =
		incomeStmt.attributes["buffer"]["ProfitBeforeTaxes"] * 0.27;
	incomeStmt.attributes["buffer"]["Taxes"] = new Number(incomeStmt.attributes["buffer"]["Taxes"].toFixed(2));
	
	incomeStmt.attributes["buffer"]["NetProfit"] =
		incomeStmt.attributes["buffer"]["ProfitBeforeTaxes"] -
		incomeStmt.attributes["buffer"]["Taxes"] -
		incomeStmt.attributes["buffer"]["ExtraordinaryItems"];
	incomeStmt.attributes["buffer"]["NetProfit"] = new Number(incomeStmt.attributes["buffer"]["NetProfit"].toFixed(2));
}

function calUnitCostGrowth(view, target, args) {
	lever.attributes["buffer"]["UnitCostGrowth"] = toNumber(view[target].value);
}

function calPriceChange(view, target, args) {
	lever.attributes["buffer"]["PriceChange"] = toNumber(view[target].value);
}

function calOverheadGrowth(view, target, args) {
	lever.attributes["buffer"]["OverheadGrowth"] = toNumber(view[target].value);
	incomeStmt.attributes["buffer"]["Overheads"] =
		incomeStmt.attributes["2001"]["Overheads"] *
		(1+lever.attributes["buffer"]["OverheadGrowth"]/100);
}

function calNewLoanLTD(view, target, args) {
	lever.attributes["buffer"]["NewLoanLTD"] = toNumber(view[target].value);
//alert(balanceSheet.attributes["buffer"]["LongTermDebt"]);
//alert(lever.attributes["buffer"]["NewLoanLTD"]);
	balanceSheet.attributes["buffer"]["LongTermDebt"] =
		balanceSheet.attributes["2001"]["LongTermDebt"] +
		lever.attributes["buffer"]["NewLoanLTD"];
//alert(balanceSheet.attributes["buffer"]["LongTermDebt"]);

//alert(balanceSheet.attributes["buffer"]["EquityLiabilities"]);
	calNonCurrentLiabilities();
	calTotalLiabilities();
	calEquityLiabilities(); 
//alert(balanceSheet.attributes["buffer"]["EquityLiabilities"]);

	incomeStmt.attributes["buffer"]["InterestExpense"] =
		incomeStmt.attributes["2001"]["InterestExpense"] +
		(lever.attributes["buffer"]["NewLoanLTD"] * lever.attributes["buffer"]["InterestRateLTD"]/100) +
		(balanceSheet.attributes["buffer"]["ShortTermDebt"] - balanceSheet.attributes["2001"]["ShortTermDebt"]) *
		lever.attributes["buffer"]["InterestRateSTD"]/100;
	incomeStmt.attributes["buffer"]["InterestExpense"] =
		new Number(incomeStmt.attributes["buffer"]["InterestExpense"].toFixed(2));
	//alert(incomeStmt.attributes["buffer"]["InterestExpense"]);
	//balanceSheet.attributes["buffer"]["LongTermDebt"] = 
	//	balanceSheet.attributes["2001"]["LongTermDebt"] + lever.attributes["buffer"]["NewLoanLTD"];
		
	cashflowStmt.attributes["buffer"]["ChangeInLTD"] =
		balanceSheet.attributes["buffer"]["LongTermDebt"] + 
		balanceSheet.attributes["buffer"]["OtherNonCurrentLiabilities"]	-
		balanceSheet.attributes["2001"]["LongTermDebt"] -
		balanceSheet.attributes["2001"]["OtherNonCurrentLiabilities"];
	calNetCashFromFinancingActivities();


	//alert(cashflowStmt.attributes["buffer"]["ChangeInLTD"]);
}

function calInterestRateLTD(view, target, args) {
	lever.attributes["buffer"]["InterestRateLTD"] = toNumber(view[target].value);

	incomeStmt.attributes["buffer"]["InterestExpense"] =
		incomeStmt.attributes["2001"]["InterestExpense"] +
		(lever.attributes["buffer"]["NewLoanLTD"] * lever.attributes["buffer"]["InterestRateLTD"]/100) +
		(balanceSheet.attributes["buffer"]["ShortTermDebt"] - balanceSheet.attributes["2001"]["ShortTermDebt"]) *
		lever.attributes["buffer"]["InterestRateSTD"]/100;
	incomeStmt.attributes["buffer"]["InterestExpense"] =
		new Number(incomeStmt.attributes["buffer"]["InterestExpense"].toFixed(2));
//alert(incomeStmt.attributes["buffer"]["NetProfit"]);
	incomeStmt.attributes["buffer"]["ProfitBeforeTaxes"] = incomeStmt.attributes["buffer"]["EBIT"] -
			incomeStmt.attributes["buffer"]["InterestExpense"];
	incomeStmt.attributes["buffer"]["NetProfit"] = incomeStmt.attributes["buffer"]["ProfitBeforeTaxes"] -
			incomeStmt.attributes["buffer"]["Taxes"] - incomeStmt.attributes["buffer"]["ExtraordinaryItems"];
//alert(incomeStmt.attributes["buffer"]["NetProfit"]);
//alert(cashflowStmt["buffer"]["NetIncome"]);
	cashflowStmt.attributes["buffer"]["NetIncome"] = incomeStmt.attributes["buffer"]["NetProfit"];
}

function calInterestRateSTD(view, target, args) {

}

function calROCE(view, target, args) {
	// alert(incomeStmt.attributes["buffer"]["NetProfit"]+"/"+balanceSheet.attributes["buffer"]["Equity"]);
	lever.attributes["buffer"]["ROCE"] =
		incomeStmt.attributes["buffer"]["NetProfit"]/balanceSheet.attributes["buffer"]["Equity"]*100;
	lever.attributes["buffer"]["ROCE"] =
		new Number(lever.attributes["buffer"]["ROCE"].toFixed(2));
	view[target].value = format(lever.attributes["buffer"]["ROCE"]);
}

function calGrossMargin(view, target, args) {
//alert(incomeStmt.attributes["buffer"]["GrossProfit"] + "/" + incomeStmt.attributes["buffer"]["Revenue"]);
	lever.attributes["buffer"]["GrossMargin"] =
		incomeStmt.attributes["buffer"]["GrossProfit"]/incomeStmt.attributes["buffer"]["Revenue"]*100;
	lever.attributes["buffer"]["GrossMargin"] =
		new Number(lever.attributes["buffer"]["GrossMargin"].toFixed(2));
	view[target].value = format(lever.attributes["buffer"]["GrossMargin"]);
}

function calCOGS(view, target, args) {
	lever.attributes["buffer"]["COGS"] =
		incomeStmt.attributes["buffer"]["COGS"]/incomeStmt.attributes["buffer"]["Revenue"]*100;
	lever.attributes["buffer"]["COGS"] = 
		new Number(lever.attributes["buffer"]["COGS"].toFixed(2));
	view[target].value = format(lever.attributes["buffer"]["COGS"]);
}

function calOverhead(view, target, args) {
	lever.attributes["buffer"]["Overhead"] =
		incomeStmt.attributes["buffer"]["Overheads"]/incomeStmt.attributes["buffer"]["Revenue"]*100;
	lever.attributes["buffer"]["Overhead"] =
		new Number(lever.attributes["buffer"]["Overhead"].toFixed(2));
	view[target].value = format(lever.attributes["buffer"]["Overhead"]);	
}

function calNetProfitSales(view, target, args) {
	lever.attributes["buffer"]["NetProfitSales"] =
		incomeStmt.attributes["buffer"]["NetProfit"]/incomeStmt.attributes["buffer"]["Revenue"]*100;
	lever.attributes["buffer"]["NetProfitSales"] = 
		new Number(lever.attributes["buffer"]["NetProfitSales"].toFixed(2));
	view[target].value = format(lever.attributes["buffer"]["NetProfitSales"]);
}

function calInterestCover(view, target, args) {
	lever.attributes["buffer"]["InterestCover"] =
		incomeStmt.attributes["buffer"]["EBIT"]/incomeStmt.attributes["buffer"]["InterestExpense"];
	lever.attributes["buffer"]["InterestCover"] = 
		new Number(lever.attributes["buffer"]["InterestCover"].toFixed(2));
	view[target].value = format(lever.attributes["buffer"]["InterestCover"]);	
}