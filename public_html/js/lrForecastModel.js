// JavaScript Document
var lrForecast = {
	name:"Lever Forecast",
	data: [
		{ index:0, name:"0", callback: [
			//{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:1, name:"1", callback: [
			//{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:2, name:"DaysReceivables", callback: [
			{ onevent:"change", opname:"calDaysReceivables", target:2 , args:[] },
			{ onevent:"change", opname:"notify", target:18 , args:[] },
			{ onevent:"change", opname:"notify", target:21 , args:[] }
			]
		},
		{ index:3, name:"3", callback: [
			//{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:4, name:"4", callback: [
			//{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:5, name:"5", callback: [
			{ onevent:"change", opname:"calDaysInventory", target:5 , args:[] },
			{ onevent:"change", opname:"notify", target:18 , args:[] },
			{ onevent:"change", opname:"notify", target:21 , args:[] }
			]
		},
		{ index:6, name:"6", callback: [
			//{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:7, name:"7", callback: [
			//{ onevent:"change", opname:"sum", target:7 , args:[0,1,2,3,4,5,6] },
			//{ onevent:"change", opname:"notify", target:16 , args:[] }
			]
		},
		{ index:8, name:"8", callback: [
			{ onevent:"change", opname:"calDaysPayables", target:8 , args:[] },
			{ onevent:"change", opname:"notify", target:18 , args:[] } ,
			{ onevent:"change", opname:"notify", target:27 , args:[] },
			{ onevent:"change", opname:"notify", target:30 , args:[] },
			{ onevent:"change", opname:"notify", target:33 , args:[] },
			{ onevent:"change", opname:"notify", target:36 , args:[] },
			{ onevent:"change", opname:"notify", target:39 , args:[] }
			]
		},
		{ index:9, name:"9", callback: [
			//{ onevent:"change", opname:"notify", target:10 , args:[] }
			]
		},
		{ index:10, name:"10", callback: [
			{ onevent:"change", opname:"calRevenueGrowth", target:10 , args:[] },
			{ onevent:"change", opname:"notify", target:2 , args:[] },
			{ onevent:"change", opname:"notify", target:5 , args:[] },
			{ onevent:"change", opname:"notify", target:8 , args:[] },
			{ onevent:"change", opname:"notify", target:24 , args:[] },
			{ onevent:"change", opname:"notify", target:42 , args:[] },
			{ onevent:"change", opname:"notify", target:45 , args:[] }
			]
		},
		{ index:11, name:"UnitCostGrowth", callback: [
			{ onevent:"change", opname:"calUnitCostGrowth", target:11 , args:[] },
			{ onevent:"change", opname:"notify", target:10 , args:[] },
			{ onevent:"change", opname:"notify", target:48 , args:[] }
			]
		},
		{ index:12, name:"10", callback: [
			{ onevent:"change", opname:"calPriceChange", target:12 , args:[] },
			{ onevent:"change", opname:"notify", target:11 , args:[] }
			]
		},
		{ index:13, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:14, name:"14", callback: [
			{ onevent:"change", opname:"calOverheadGrowth", target:14 , args:[] },
			{ onevent:"change", opname:"notify", target:12 , args:[] },
			{ onevent:"change", opname:"notify", target:51 , args:[] }
			]
		},
		{ index:15, name:"10", callback: [
			{ onevent:"change", opname:"calNewLoanLTD", target:15 , args:[] }, 
			{ onevent:"change", opname:"notify", target:5 , args:[] },
			{ onevent:"change", opname:"notify", target:8 , args:[] },
			{ onevent:"change", opname:"notify", target:10 , args:[] },
			{ onevent:"change", opname:"notify", target:18 , args:[] },
			{ onevent:"change", opname:"notify", target:21 , args:[] },
			{ onevent:"change", opname:"notify", target:2 , args:[] },
			{ onevent:"change", opname:"notify", target:27 , args:[] }
			]
		},
		{ index:16, name:"11", callback: [
			{ onevent:"change", opname:"calInterestRateLTD", target:16 , args:[] },
			{ onevent:"change", opname:"notify", target:15 , args:[] },
			{ onevent:"change", opname:"notify", target:18 , args:[] }
			]
		},
		{ index:17, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:18, name:"NetChangeInCash", callback: [
			{ onevent:"change", opname:"calNetIncreaseInCash", target:18 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:18 , args:["NetChangeInCash"] }
			]
		},
		{ index:19, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:20, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:21, name:"CashEquivalent", callback: [
			{ onevent:"change", opname:"calCashEquivalent", target:21 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:21 , args:["CashEquivalent"] }
			]
		},
		{ index:22, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:23, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:24, name:"InterestCover", callback: [
			{ onevent:"change", opname:"calInterestCover", target:24 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:24 , args:["InterestCover"] }
			]
		},
		{ index:25, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:26, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:27, name:"WorkingCapital", callback: [
			//{ onevent:"change", opname:"whoAmI", target:27 , args:[] },
			{ onevent:"change", opname:"calWorkingCapital", target:27 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:27 , args:["WorkingCapital"] }
			]
		},
		{ index:28, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:29, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:30, name:"CurrentRatio", callback: [
			{ onevent:"change", opname:"calCurrentRatio", target:30 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:30 , args:["CurrentRatio"] }
			]
		},
		{ index:31, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:32, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:33, name:"TotalLiabilityEquity", callback: [
			{ onevent:"change", opname:"calTotalLiabilityEquity", target:33 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:33 , args:["TotalLiabilityEquity"] }
			]
		},
		{ index:34, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:35, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:36, name:"EquityTotalAssets", callback: [
			{ onevent:"change", opname:"calEquityTotalAssets", target:36 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:36 , args:["EquityTotalAssets"] }
			]
		},
		{ index:37, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:38, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:39, name:"ROCE", callback: [
			{ onevent:"change", opname:"calROCE", target:39 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:39 , args:["ROCE"] }
			]
		},
		{ index:40, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:41, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:42, name:"GrossMargin", callback: [
			{ onevent:"change", opname:"calGrossMargin", target:42 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:42 , args:["GrossMargin"] }
			]
		},
		{ index:43, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:44, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:45, name:"NetProfitSales", callback: [
			{ onevent:"change", opname:"calNetProfitSales", target:45 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:45 , args:["NetProfitSales"] }
			]
		},
		{ index:46, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:47, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:48, name:"COGS", callback: [
			{ onevent:"change", opname:"calCOGS", target:48 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:48 , args:["COGS"] }
			]
		},
		{ index:49, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:50, name:"10", callback: [
			//{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:51, name:"Overhead", callback: [
			{ onevent:"change", opname:"calOverhead", target:51 , args:[] },
			{ onevent:"change", opname:"highlightDirect", target:51 , args:["Overhead"] }
			]
		}
	]
}