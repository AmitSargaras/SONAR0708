/**
 * Copyright Integro Technologies Pte Ltd
 */

function isEmpty(val){
    return (val === undefined || val == null || val.trim().length == 0) ? true : false;
}

function isNumber(n) {
    if (typeof (n) === 'string') {
        n = n.replace(/,/, ".");
    }
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function addCommaOnBlur(obj) {
	var nStr = obj.value;
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    document.getElementById(obj.id).value = x1 + x2;
}

function addCommas(nStr) {
    nStr += '';
    var x = nStr.split('.');
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function removeCommas(nStr) {
	if (typeof nStr != 'string') {
		return nStr;
	}
	return nStr.replace(/,/g,'');
}

function removeCommaOnFocus(obj) {
	var nStr = obj.value;
	if (typeof nStr != 'string') {
		return nStr;
	}
	document.getElementById(obj.id).value = nStr.replace(/,/g,'');
}

function addComma(obj) {
	var val=obj.html();
	if(val==null || trim(val)==""){
		return "";
	}
	else if(isNaN(val)){
		return val;
	}
	else{
	    x = val.split('.');
	    x1 = x[0];
	    x2 = x.length > 1 ? '.' + x[1] : '';
	    var rgx = /(\d+)(\d{3})/;
	    while (rgx.test(x1)) {
	        x1 = x1.replace(rgx, '$1' + ',' + '$2');
	    }
	    return x1 + x2;
	}
}

function toFixedPrecision(value, precision) {
	var roundFactor = Math.pow(10, precision);
	return (Math.round(roundFactor * (value)) / roundFactor).toFixed(precision);
}

function setDecimalPlaces(value, precision) {
	/* make sure the variable is a number some values*/
	 /*might be coming from the html form which is translated as string */
	var value1 = parseFloat(value);
	 /*set the initial precision */
	var value2 = toFixedPrecision(value1, precision);
	 /*re-evalute the number this is to avoid -0.000 */
	var value3 = parseFloat(value2);
	 /*set the precision to 3 again as parseFloat removes decimal places if the value are zero */
	return toFixedPrecision(value3, precision);
}

function changeAllChildCheckBoxes(parentId, childName){
	var isRemoveAllChecked = document.getElementById(parentId).checked;
	var allCheckBoxes = document.getElementsByName(childName);
	
	for (var i = 0; i < allCheckBoxes.length; i++) {		
		document.getElementsByName(childName)[i].checked=isRemoveAllChecked;
	};
}

function isAnyChkBoxSelected(objName) {
	var checkedItems = document.getElementsByName(objName);
	if (checkedItems.length > 0) {
		return true;
	}
	return false;
		
}

function createStrFromArray(objName) {
	var values = [];
	var checkedItems = document.getElementsByName(objName);
	
	for (var i = 0; i < checkedItems.length; i++) {
		if(checkedItems[i].checked)
			values.push(checkedItems[i].value);
	};
	//console.log("values: "+values);
	return values.reverse().join('-');	
}


function removeComma(nStr) {
		nStr=nStr.replace(/,/g,"");
		return nStr;
}
