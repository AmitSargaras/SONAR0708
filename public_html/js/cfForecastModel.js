// JavaScript Document
var cfForecast = {
	name:"Cash Flow Statement Forecast",
	data: [
		{ index:0, name:"0", callback: [
			{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:1, name:"1", callback: [
			{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:2, name:"2", callback: [
			{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:3, name:"3", callback: [
			{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:4, name:"4", callback: [
			{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:5, name:"5", callback: [
			{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:6, name:"6", callback: [
			{ onevent:"change", opname:"notify", target:7 , args:[] }
			]
		},
		{ index:7, name:"7", callback: [
			{ onevent:"change", opname:"sum", target:7 , args:[0,1,2,3,4,5,6] },
			{ onevent:"change", opname:"notify", target:16 , args:[] }
			]
		},
		{ index:8, name:"8", callback: [
			{ onevent:"change", opname:"notify", target:10 , args:[] }
			]
		},
		{ index:9, name:"9", callback: [
			{ onevent:"change", opname:"notify", target:10 , args:[] }
			]
		},
		{ index:10, name:"10", callback: [
			{ onevent:"change", opname:"sum", target:10 , args:[8,9] },			
			{ onevent:"change", opname:"notify", target:16 , args:[] }
			]
		},
		{ index:11, name:"10", callback: [
			{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:12, name:"10", callback: [
			{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:13, name:"10", callback: [
			{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:14, name:"10", callback: [
			{ onevent:"change", opname:"notify", target:15 , args:[] }
			]
		},
		{ index:15, name:"10", callback: [
			{ onevent:"change", opname:"sum", target:15 , args:[11,12,13,14] },
			{ onevent:"change", opname:"notify", target:16 , args:[] }
			]
		},
		{ index:16, name:"11", callback: [
			{ onevent:"change", opname:"sum", target:16 , args:[7,10,15] }
			]
		}
		
	]
}