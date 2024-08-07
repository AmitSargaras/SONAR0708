function mouseover(element,name) { 
	try{element.className+=" "+name}catch(error){}
}

function mouseout(element,name) {
	try{element.className=element.className.replace(RegExp(" "+name,"g"),"")}catch(error){}
}
