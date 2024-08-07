function enableAllFormElements()
{    
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}	
}