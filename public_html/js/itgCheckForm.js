// JavaScript Document
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function itg_checkform() { 
 if(getDebugFlag()) {
  var args = itg_checkform.arguments; var myDot=true; var myV=''; var myErr='';var addErr=false;var myReq;
  for (var i=1; i<args.length;i=i+4){

    if (args[i+1].charAt(0)=='#'){myReq=true; args[i+1]=args[i+1].substring(1);}else{myReq=false}
    var myObj = MM_findObj(args[i].replace(/\[\d+\]/ig,""));
    myV=myObj.value; 
    if (myObj.type=='text'||myObj.type=='password'||myObj.type=='hidden'){
      if (myReq&&myObj.value.length==0){
	  		addErr=true ; myErr=getErrorMessage(myObj.name,0)
	  }
      if ((myV.length>0)&&(args[i+2]==2)){ // number from-to
        var myMa=args[i+1].split('_');
		if(isNaN(myV)){
			addErr=true; myErr = getErrorMessage(myObj.name,2);
		} else if((myMa[0]!='' ? myV<myMa[0]/1 : myV>myMa[1]/1)||(myMa[1]!='' ? myV > myMa[1]/1 : myV<myMa[0]/1) ){
			addErr=true; myErr = getErrorMessage(myObj.name,2,myMa[0],myMa[1]);			
		}
      } else if ((myV.length>0)&&(args[i+2]==4)){ // email
          var rx=new RegExp(getEmailFormat());
		  if(!rx.test(myV)) {
		  	addErr=true; myErr = getErrorMessage(myObj.name,4);
		  }
      } else if ((myV.length>0)&&(args[i+2]==5)){ // date
	    args[i+1]=getDateFormat();
        var myMa=args[i+1].split("#"); 
		var myAt=myV.match(myMa[0]);
        if(myAt){
          var myD=(myAt[myMa[1]])?myAt[myMa[1]]:1; var myM=myAt[myMa[2]]-1; var myY=myAt[myMa[3]];
          var myDate=new Date(myY,myM,myD);
          if(myDate.getFullYear()!=myY||myDate.getDate()!=myD||myDate.getMonth()!=myM){addErr=true; myErr=getErrorMessage(myObj.name,5);}
        }else{addErr=true ; myErr = getErrorMessage(myObj.name, 5);}
      } else if ((myV.length>0)&&(args[i+2]==6)){ // time
	  	args[i+1]=getTimeFormat();
        var myMa=args[i+1].split("#"); var myAt=myV.match(myMa[0]);if(!myAt){addErr=true; myErr = getErrorMessage(myObj.name, 6);}
      } else if (myV.length>0&&args[i+2]==7){ // postal code 
         var rx=new RegExp(getZipCodeFormat());if(!rx.test(myV)){addErr=true; myErr = getErrorMessage(myObj.name, 7); }
      } else if (myV.length>0&&args[i+2]==8){ // phone number
         var rx=new RegExp(getPhoneFormat());if(!rx.test(myV)){addErr=true; myErr=getErrorMessage(myObj.name,8);}
      } else if ((myV.length>0)&&(args[i+2]==1)){ // letters
         var rx=new RegExp(getAlphabetsFormat());
		 if(!rx.test(myV)){
		 	addErr=true; myErr=getErrorMessage(myObj.name,1);
		 } else {
     	   var myMa=args[i+1].split('_');
		   if(myMa[0]!='' && myMa[1]!='' && (myV.length<myMa[0]/1 || myV.length>myMa[1])) {addErr=true; myErr=getErrorMessage(myObj.name,1,myMa[0],myMa[1]);}  		 
		   else if(myMa[0]=='' && myV.length>myMa[1]/1){addErr=true; myErr=getErrorMessage(myObj.name,1,myMa[0],myMa[1]);}
		   else if(myMa[1]=='' && myV.length<myMa[0]/1){addErr=true; myErr=getErrorMessage(myObj.name,1,myMa[0],myMa[1]);}
		 }
	  } else if ((myV.length>0)&&(args[i+2]==9)){ // alphanumeric
         var rx=new RegExp(getAlphaNumericFormat());
		 if(!rx.test(myV)){
		 	addErr=true; myErr=getErrorMessage(myObj.name,1);
		 } else {
     	   var myMa=args[i+1].split('_');
		   if(myMa[0]!='' && myMa[1]!='' && (myV.length<myMa[0]/1 || myV.length>myMa[1])) {addErr=true; myErr=getErrorMessage(myObj.name,1,myMa[0],myMa[1]);}  		 
		   else if(myMa[0]=='' && myV.length>myMa[1]/1){addErr=true; myErr=getErrorMessage(myObj.name,1,myMa[0],myMa[1]);}
		   else if(myMa[1]=='' && myV.length<myMa[0]/1){addErr=true; myErr=getErrorMessage(myObj.name,1,myMa[0],myMa[1]);}
		 }
	  } else if ((myV.length>0)&&(args[i+2]==3)){ // currency
         var rx=new RegExp(getCurrencyFormat());if(!rx.test(myV)) {addErr=true; myErr=getErrorMessage(myObj.name,3)}
	  } else if ((myV.length>0)&&(args[i+2]==10)){ // comma separated number
         var rx=new RegExp(getCSNFormat());if(!rx.test(myV)) {addErr=true; myErr=getErrorMessage(myObj.name,9);}
	  } else if ((myV.length>0)&&(args[i+2]==11)){ // comma separated strings
         var rx=new RegExp(getCSSFormat());if(!rx.test(myV)) {addErr=true; myErr=getErrorMessage(myObj.name,10);}
	  }
    } else if (!myObj.type&&myObj.length>0&&myObj[0].type=='radio'){
          var myTest = args[i].match(/(.*)\[(\d+)\].*/i);
          var myObj1=(myObj.length>1)?myObj[myTest[2]]:myObj;
      if (args[i+2]==1&&myObj1&&myObj1.checked&&MM_findObj(args[i+1]).value.length/1==0){addErr=true}
      if (args[i+2]==2){
        var myDot=false;
        for(var j=0;j<myObj.length;j++){myDot=myDot||myObj[j].checked}
        if(!myDot){myErr+='* ' +args[i+3]+'\n'}
      }
    } else if (myObj.type=='checkbox'){
      if(args[i+2]==1&&myObj.checked==false){addErr=true}
      if(args[i+2]==2&&myObj.checked&&MM_findObj(args[i+1]).value.length/1==0){addErr=true}
    } else if (myObj.type=='select-one'||myObj.type=='select-multiple'){	
      if(args[i+2]==1&&myObj.selectedIndex/1==0){addErr=true; myErr=getErrorMessage(myObj.name, 13);}
    } else if (myObj.type=='textarea'){
	  if (myReq&&myObj.value.length==0){ addErr=true ; myErr=getErrorMessage(myObj.name,0)}
      if(myV.length>args[i+1]){addErr=true; myErr=getErrorMessage(myObj.name, 14);}
    }
    //if (addErr){myErr+='* '+args[i+3]+'\n'; /*addErr=false*/} this Error Message is defined by user at client side in "Form Validation'
  }
 var oldErr=null;
 if(myErr!='' && oldErr==null) {
 	oldErr = itgAddErrorText(myObj,myErr);
 }
 if(!addErr) {
 	itgRemoveErrorText(myObj);addErr=false;
 }
 
 if(myErr!='' && myErr!=oldErr) { 
 	itgRemoveErrorText(myObj);  
	itgAddErrorText(myObj,myErr);
	addErr=false;
 }
 // document.MM_returnValue = (myErr=='');
 }// enf of if debug
} // end of function

// This is private function and not meant to be called from clinet side
function itgAddErrorText(myObj,myErr) {
// alert('The required information is incomplete or contains errors:\t\t\t\t\t\n\n'+myErr)
//myObj.parentNode.lastChild&&
if((myObj.parentNode.lastChild.id!="spanError"||typeof(myObj.parentNode.lastChild.innerHTML)=="undefined")||myObj.parentNode.lastChild==null){
		if(document.all) {
			//alert("add node");
			var oErr = document.createElement('<span class="txtError" id="spanError"></span>');
			var oBr = document.createElement("<br id='spaceError'>");
			oErr.innerText = myErr;
			myObj.parentNode.insertAdjacentElement("BeforeEnd",oBr);
			oBr.insertAdjacentElement("AfterEnd",oErr);
			return oErr.innerText;
		} else {
			var oErr = document.createElement("SPAN");
			var oBr = document.createElement("br");			
			oErr.setAttribute("class","txtError");
			oErr.id="spanError"; oBr.id="spaceError";
			var oTxtNode = document.createTextNode(myErr);
			oErr.appendChild(oTxtNode);
			myObj.parentNode.insertAdjacentElement("beforeEnd",oBr);
			oBr.insertAdjacentElement("afterEnd",oErr);
			return oTxtNode.data;
		}
	}
}

// This is private function and not meant to be called from clinet side
function itgRemoveErrorText(myObj) {
  if(document.all) {
	var oSpan = myObj.parentNode.lastChild; 
	if(oSpan.id=="spanError" && (typeof(oSpan.id) != "undefined")) { 
		var oBr = oSpan.previousSibling; 
		oSpan.removeNode(true);
		if(oBr.id=="spaceError" && (typeof(oBr.id) != "undefined")) oBr.removeNode(true);	
	}
  } else {
	var oSpan1= myObj.parentNode.lastChild;
	var oBr1 = oSpan1.previousSibling;
	if(oSpan1.id=="spanError" ){
		myObj.removeAdjacentElement(oSpan1);
		myObj.removeAdjacentElement(oBr1);
	}
  }
}
