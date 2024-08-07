// JavaScript Document
var icForecast = {
	name:"Income Statement Forecast",
	data: [
		{ index:0, name:"0", callback: [
			{ onevent:"change", opname:"notify", target:2 , args:[] }
			]
		},
		{ index:1, name:"1", callback: [
			{ onevent:"change", opname:"notify", target:2 , args:[] }
			]
		},
		{ index:2, name:"2", callback: [
			{ onevent:"change", opname:"substract", target:2 , args:[0,1] },
			{ onevent:"change", opname:"notify", target:6 , args:[] }
			]
		},
		{ index:3, name:"3", callback: [
			{ onevent:"change", opname:"notify", target:6 , args:[] }
			]
		},
		{ index:4, name:"4", callback: [
			{ onevent:"change", opname:"notify", target:6 , args:[] }
			]
		},
		{ index:5, name:"5", callback: [
			{ onevent:"change", opname:"notify", target:6 , args:[] }
			]
		},
		{ index:6, name:"6", callback: [
			{ onevent:"change", opname:"substract", target:6 , args:[2,3,4] },
			{ onevent:"change", opname:"sum", target:6 , args:[5,6] },
			{ onevent:"change", opname:"notify", target:8 , args:[] }
			]
		},
		{ index:7, name:"7", callback: [
			{ onevent:"change", opname:"notify", target:8 , args:[] }
			]
		},
		{ index:8, name:"8", callback: [
			{ onevent:"change", opname:"substract", target:8 , args:[6,7] },
			{ onevent:"change", opname:"notify", target:11 , args:[] }
			]
		},
		{ index:9, name:"9", callback: [
			{ onevent:"change", opname:"notify", target:11 , args:[] }
			]
		},
		{ index:10, name:"10", callback: [
			{ onevent:"change", opname:"notify", target:11 , args:[] }
			]
		},
		{ index:11, name:"11", callback: [
			{ onevent:"change", opname:"substract", target:11 , args:[8,9,10] }
			]
		}		
	]
}