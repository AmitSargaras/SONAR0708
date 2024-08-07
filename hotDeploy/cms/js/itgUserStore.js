// JavaScript Document
// itgUserStore
// parameters: 	storeName - user store's name
//				storeValues - collection of input text elememt
function itgUserStore(storeName) {
	this.name = storeName;
	this.handle = null;	
	
	function save(storeHandle, storeValues) {
		if(storeHandle==null) { alert("User store handle is null"); return; }
		var i = 0;
		var dValue = 0.0;
		var sName = "";
		for(i=0; i<storeValues.length; i++) {
			if(storeValues[i].type=="text") {
				if(storeValues[i].value=="") {
					dValue = 0.0;
				} else {
					dValue = storeValues[i].value;
				}
				sName = storeValues[i].name;
				storeHandle.setAttribute(sName, dValue);
			}
		}
		storeHandle.save(this.name);
	}
	itgUserStore.prototype.save = save;
	
	function load(storeHandle, storeValues) {		
		storeHandle.load(this.name);
		this.handle = storeHandle;
		if(storeValues==null) { 
			return;
		}
		var i = 0;
		var sName="";
		var v;
		for(i=0; i<storeValues.length; i++) {
			if(storeValues[i].type=="text") {
				sName = storeValues[i].name;
				v = storeHandle.getAttribute(sName);
				//alert(sName + "=" + v);
				if(v==null) { // do nothing 
					return;
				}
				// storeValues[i].value = storeHandle.getAttribute(sName);
				storeValues[i].value = v;
			}
		}
	}
	itgUserStore.prototype.load = load;
	
	function getAttribute(sName) {
		if(sName==null || sName.length==0) {
			alert("Invalid argument to getAttribute");
			return;
		}
		if(this.handle==null) {
			alert("User Store is not loaded yet");
			return;
		}
		return this.handle.getAttribute(sName);
	}
	itgUserStore.prototype.getAttribute = getAttribute;
}