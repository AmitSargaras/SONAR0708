function calculateTotal() {
	var tbl = document.getElementById('financial');
	var existRow = null;
	var pattern = /[,]*/g;
	if(!tbl) {
		alert ("invalid table");
		return;
	}
	var totRows = tbl.tBodies[0].rows.length;
	var nLoanAmt = 0;
	for(i=0; i<totRows; i++) {
	
		mycel = tbl.tBodies[0].rows[i].cells[3];
		oInput = mycel.getElementsByTagName("input");
		if(nLoanAmt==0)
			nLoanAmt = parseFloat(oInput.item(0).value.replace(pattern,""));
		else
			nLoanAmt = nLoanAmt + parseFloat(oInput.item(0).value.replace(pattern,""));	
	}
}

function formatCurrency(num) {
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
		num = "0";
		sign = (num == (num = Math.abs(num)));
		num = Math.floor(num*100+0.50000000001);
		cents = num%100;			
		num = Math.floor(num/100).toString();	
	if(cents<10)
		cents = "0" + cents;
	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++) 
		num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));
	return (((sign)?'':'-') + num + '.' + cents);
}
