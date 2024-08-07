function limitTextInput(field, maximumNum, fieldName) {
	if (field.value.length > maximumNum) {
        field.value = field.value.substring(0, maximumNum);
        alert('The '+fieldName+' field is limited to '+maximumNum+' characters.');
        
        if (field.value.length > maximumNum) {
	        var str = field.value.substring(maximumNum-1, maximumNum);
	        var strkey = String.fromCharCode(13);
	        if (strkey == str) {
				field.value = field.value.substring(0, maximumNum-1);
	        }
        }                        
	}
}

function isInt (str)
		{		
		if(str == null || str == '')
		{
		str=0;
		}
			var i = parseInt (str);
			if (isNaN (i))
				{return false;}
			i = i . toString ();
			if (i != str)
				{return false;}
		
			return true;
		}
