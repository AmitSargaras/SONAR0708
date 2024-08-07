  function processUdf(value, chkfield, field) {
  	
    var check = document.getElementById(chkfield).checked;
    var newVal = document.getElementById(field).value;
  //  alert(newVal);
    if (check == true) {
    	var aValue = newVal;
    	var present = false;
    	if (aValue != null && StringTrimmer(aValue).length != 0) {
    		var aTokens = aValue.split( "," );
    		for ( var i = 0; i < aTokens.length; i++ )  {
    			var a = StringTrimmer(aTokens[i]);var b = StringTrimmer(value);
    		//	alert(a);
    		//	alert(a.length);
    		//	alert(b);
    		//	alert(b.length);
    			if (StringTrimmer(aTokens[i]) == StringTrimmer(value)) {
    				present = true;
    			}
  			}
    	}
  //  	alert(present);
    	if (present == false) {
    		newVal = newVal + ',' + value;
    	}
    //	alert(newVal);
    	document.getElementById(field).value = newVal;
    }
    else {
    	var aValue = newVal;
    	var bValue = "";
    	var present = false;
    	if (aValue != null && StringTrimmer(aValue).length != 0) {
    		var aTokens = aValue.split( "," );
    		for ( var i = 0; i < aTokens.length; i++ )  {
    			if (StringTrimmer(aTokens[i]) != StringTrimmer(value)) {
    				bValue = bValue + ',' + aTokens[i];
    			}
  			}
   		 }
    	document.getElementById(field).value = bValue;
    }
  	
  	var corrValue = "";
  	var oldVal = document.getElementById(field).value;
  //	alert(oldVal);
  	if (oldVal != null && StringTrimmer(oldVal).length != 0) {
  		var bTokens = oldVal.split( "," );
    	for ( var j = 0; j < bTokens.length; j++ )  {
    		if (StringTrimmer(bTokens[j]).length != 0) {
    			if (corrValue == "") {
    				corrValue = corrValue + StringTrimmer(bTokens[j]);
    			}
    			else {
    				corrValue = corrValue + ", " + StringTrimmer(bTokens[j]);
    			}
    		}
  		}
  	}
  	document.getElementById(field).value = corrValue;
  //	alert(corrValue);
 	 
  }
  
  // This method is used to trim a string.
  function StringTrimmer(s)
  {
	return  s.replace(/^\s*/, "").replace(/\s*$/, "");
  }

