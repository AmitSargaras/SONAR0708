// JavaScript Document

// strAmt = loan amount (String)
// strAir = annual interest rate
// strPeriod = repayment period in month
function calculateFixed(strAmt, strAir, strPeriod) {
	var pattern = /[,]*/g;
	var iAmt = parseFloat(strAmt.replace(pattern,""));
	var payment=0.0;
	if((!isNaN(iAmt))&&
			(iAmt!=Number.POSITIVE_INFINITY)&&(iAmt!=Number.NEGATIVE_INFINITY)){
		payment = ((iAmt * (parseFloat(strAir)/100) * (parseFloat(strPeriod)/12))+iAmt)/parseFloat(strPeriod);
	}
	return round(payment);
}

// strAmount = loan amount
// strApr = annual interest rate
// strN = repayment in year
// npy = number of payment per year = 12
// return payment = repayment amount
function calculateFloat(strAmount,strApr,strN){
	var pattern = /[,]*/g;
	var amount = parseFloat(strAmount.replace(pattern,""));
	var apr = parseFloat(strApr.replace(pattern,""));
	var n = parseFloat(strN.replace(pattern,""));	
	var npy=12;
	var payment = 0;
	
	if( (amount!='') && (n!='') && (apr!='') && (npy!='') ){
		tmp=Math.pow((1+(apr/100/npy)), (n*npy));
		payment=(amount*tmp*(apr/100/npy))/(tmp-1);
		if((!isNaN(payment))&&(payment!=Number.POSITIVE_INFINITY)&&(payment!=Number.NEGATIVE_INFINITY)){
			return round(payment);
			//d.totpaid.value=round(payment*n*npy);
			//d.intpaid.value=round((payment*n*npy)-amount);
		}else 
			alert('Error:\nOne or more fields contain data\nwhich cannot be used in the\ncalculation.');
	}else 
		alert('Error:\nYou did not provide enough data.');
}

function round(val){
tmp=Math.round(val*100)/100+'';
if(tmp.indexOf('.')==-1)tmp+='.00';
else if(tmp.length-tmp.indexOf('.')==2)tmp+='0';
return tmp;
}