/* Integro Javascript Matrix Framework */


function itgCallback(eType) {
	this.className = "itgCallback";
	
	this.name = "unknow";				// name of the callback
	this.index = null;
	this.eventType = eType;				// event this callback is interest in
	this.opname = null;
	this.target = null;
	this.args = null;					// array of argument needs to be passed to functions
	this.func = null; //new Array();			// array of functions need to be executed when event fires
}

function itgCallbackRegistry() {
	this.className = "itgCallbackRegistry";
	this.registry = new Array();
	this.eventList = new Array();
	this.length = 0;
	
	function register(cbObj) {
		if(!this.registry[cbObj.eventType]) {
			this.registry[cbObj.eventType] = new Array();
			this.eventList[this.eventList.length]=cbObj.eventType;			
			this.length++;
		}
		// note: index indicates the upper bound of the array
		//		 some cells may point to null
		if(!this.registry[cbObj.eventType][cbObj.index]) {
			this.registry[cbObj.eventType][cbObj.index] = new Array();
		}
		var len = this.registry[cbObj.eventType][cbObj.index].length;
		//alert("before: " + cbObj.eventType + " " + cbObj.index + " array size " + len);
		this.registry[cbObj.eventType][cbObj.index][len]=cbObj;
		//alert("after: " + cbObj.eventType + " " + cbObj.index + " array size " + this.registry[cbObj.eventType][cbObj.index].length);
		/*
		if(cbObj.index==0) { 
			if(this.registry[cbObj.eventType][cbObj.index])
				alert(this.registry[cbObj.eventType][cbObj.index].opname);
		}
		*/
	}
	itgCallbackRegistry.prototype.register = register;
}

function itgMatrix(n) {
	this.registry = new itgCallbackRegistry();
	this.name = n;
	this.operation = new Array();
	this.model = null;
	this.views = null;
	this.eventHistory = "";
	
	this.operation["notify"] = notify;
	this.operation["sum"] = sum;
	this.operation["substract"] = substract;
	this.operation["assign"] = assign;
	this.operation["highlight"] = highlight;
	// gController.add(this.name,this);
	
	/* implementation */
	function addOperation(name, funcPtr) {
		this.operation[name]=funcPtr;
	}
	
	function setModel(obj) {
		this.model = obj;
		// quick one; assuming the model format is always correct
		var len = obj.data.length;
		var d = null;
		var cb = null;
		var dcb = null;
		var cblen = null;
		//alert("obj.data.length: " + obj.data.length);
		for(var i=0; i<len; i++) {
			d = obj.data[i];
			cblen = d.callback.length;
			for(var j=0; j<cblen; j++) {
				dcb = d.callback[j];
				cb = new itgCallback(dcb.onevent);
				cb.index=d.index;
				cb.name=d.name;
				cb.target=dcb.target;
				cb.opname = dcb.opname;
				cb.args = dcb.args;
				cb.func = this.operation[dcb.opname];
				// alert("register (data: " + i + "): " + dcb.onevent + "  " + dcb.opname + " on target " + dcb.target);
				this.registry.register(cb);
			}
		}
	}
	
	function getModel() {
		return this.model;
	}
	
	function setViews(obj) { 
		this.views = obj;
		var e = null;
		var cbList = null;
		var str="";
		
		// add attribute to each element in views
		for(var x=0; x<obj.length; x++) {
			for(var y=0; y<obj[x].length; y++) {
				e = obj[x][y];
				if(e) {
					e.setAttribute("viewIdx_x", x);
					e.setAttribute("viewIdx_y", y);
				}
				// check if there is any callback register for this element
				for(var i=0; i< this.registry.eventList.length; i++) {
					cbList = this.registry.registry[this.registry.eventList[i]];
					if(!cbList) {
						alert("callback list is empty");
						return;
					}
					if(cbList[y]) {
						// there is something for it
						e.attachEvent("on"+this.registry.eventList[i], eventHandler);
						str += this.registry.eventList[i] + " event added to element(" + x +"," +y +")\n";
					}
				}
			}
		}
		this.eventHistory = str;
	}
	
	function getViews() { return this.views; }

	

	
	/* methods */
	itgMatrix.prototype.addOperation = addOperation;
	itgMatrix.prototype.setModel = setModel;
	itgMatrix.prototype.getModel = getModel;
	itgMatrix.prototype.setViews = setViews;
	itgMatrix.prototype.getViews = getViews;
	itgMatrix.prototype.eventHandler = eventHandler;
}

//====================================================================================================
function itgEvent() {
	this.caller="";
}
// a private global event object
var _event = new itgEvent();

	function eventHandler() {
		if(gMatrix.registry.registry[event.type]) {
			var idx = event.srcElement.getAttribute("viewIdx_y");
			var arrCb = null;
			var cb = null;
			if(idx!=null) {
				arrCb = gMatrix.registry.registry[event.type][idx];
			}

			if(arrCb==null) {
				// alert("eventHandler: no callback function is registered for this event");
				return;
			}
			//alert(event.type + " has callback on " + idx + ": " + arrCb.length);
			for(var i=0; i<arrCb.length; i++) {
				cb = arrCb[i];
				if(cb) {
					if(cb.func) {
						cb.func(gMatrix.views[event.srcElement.getAttribute("viewIdx_x")],cb.target, cb.args);
					}
				}
			}
		}
		// for private event
		//if(_event==null || _event.caller=="") { return; }		
	}
//====================================================================================================

/* Tasks */
/* 1. allow user defined operation and add it to the Matrix; addOperation(opname, func) */
/* 2. remove the restriction of using the global variable 'gMatrix' in eventHandler */
/* 3. a controller class to handle multi-matrix and facilitate the communication among matrixes */
/* 4. make it Netscape enable */

/* operation function */
function notify(view, target) {
	if(!view) {
		alert("notify: invalid parameter: view not found");
		return;
	}
	if(target==null) {
		alert("notify: invalid parameter: target is not specified");
		return;
	}
	if(view[target]) {
		_event.caller="notify";
		view[target].fireEvent("onchange");
	}
}

function sum(view, target, args) {
	var pattern = /[,]*/g;
	
	if(!view || target==null || !args) { 
		alert("sum: invalid parameter");
		return;
	}
	if(!view[target]) {
		alert("sum: invalid target");
		return;
	}
	var v = 0;
	for(var i=0; i<args.length; i++) {
		// alert("number: " + view[i].value.replace(pattern,""));
		if(view[args[i]] && view[args[i]].value)
			v += parseFloat(view[args[i]].value.replace(pattern,""));
		//alert("value: " + view[args[i]].value + " total: " + v);
	}
	view[target].value = v.toFixed(2);
}
// the first in the args minus the rest
function substract(view, target, args) {
	var pattern = /[,]*/g;
	
	if(!view || target==null || !args) { 
		alert("substract: invalid parameter");
		return;
	}
	if(!view[target]) {
		alert("substract: invalid target");
		return;
	}
	/*
	if(args.length != 2) {
		alert("substract: invalid number of parameters");
		return;
	}
	*/
	var v = new Number(parseFloat(view[args[0]].value.replace(pattern,"")));
	for(var i=1; i<args.length; i++) {
		if(view[args[i]] && view[args[i]].value)
			v -= parseFloat(view[args[i]].value.replace(pattern,""));
	}
	view[target].value = v.toFixed(2);
}

function assign(view, target, args) {
	var pattern = /[,]*/g;
	
	if(!view || target==null || !args) { 
		alert("assign: invalid parameter");
		return;
	}
	if(!view[target]) {
		alert("assign: invalid target");
		return;
	}
	if(args.length != 1) {
		alert("assign: invalid number of parameters");
		return;
	}
	view[target].value = view[args[0]].value;
}

function highlight(view, target, args) {
	if(!view[target]) {
		alert("highlight: invalid target");
		return;
	}
	if(view[target].value != view[target].defaultValue) {
		view[target].setAttribute("className","highlight_indirect");
	}
}