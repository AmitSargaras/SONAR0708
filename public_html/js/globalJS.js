/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Sep 28, 2010
 * Time: 12:45:03 PM
 * To change this template use File | Settings | File Templates.
 */

function submitEnter(e, invokeFunc, invokeFuncParams) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;

    if (keycode == 13) {
        invokeFunc(invokeFuncParams == null ? "" : invokeFuncParams);
        return false;
    } else {
        return true;
    }
}

function dispAmtInWords(ele){
	if(!ele){
		var elements = document.body.getElementsByTagName("*");
		for (var i = 0; i < elements.length; i++) {
			if ((elements[i].className).indexOf("_InNum") > -1) {
				dispAmtInWords(elements[i]);
			}
		}
		
	}else {
		var num = ele.value ? ele.value : ele.innerText;
		num = num.replace(/,/g,"");
		num = num.split(".")[0];
		var str = '';
		if(!isNaN(num)) {
			if (num.length > 9){
				var times = parseInt((num.length - 7) / 7);
				var end = num.length - 7;
				var start = (end - 7) < 0 ? 0 : (end - 7);
				while(times >= 0 && start != end){
					str = displayNumberSystem(num.substring(start, end)) + "Crore " + str;
					end = start;
					start = (end - 7) < 0 ? 0 : (end - 7);
					times--;
				}
				start = num.length - 7;
				end = num.length;
			}
			str += displayNumberSystem(num.substring(start, end));
		}
		str = str != '' ? str : "-";
		var classes = ele.className.split(" ")
		if(classes){
				for(var j = 0; j < classes.length; j++){
					if(classes[j].indexOf("InNum")){
						var op = document.getElementById(classes[j].replace("InNum", "InWords"));
						op.value = str;
						op.innerText = str;
						break;
					}
			}
		}
	}
}
function displayNumberSystem(num){
	var a = ['','One ','Two ','Three ','Four ', 'Five ','Six ','Seven ','Eight ','Nine ','Ten ','Eleven '
		,'Twelve ','Thirteen ','Fourteen ','Fifteen ','Sixteen ','Seventeen ','Eighteen ','Nineteen '];
	var b = ['', '', 'Twenty','Thirty','Forty','Fifty', 'Sixty','Seventy','Eighty','Ninety'];
	var c = ['Hundred ', 'Thousand ', 'Lakh ', 'Crore '];
	var str = '';
	var num_n = ('000000000' + num).substr(-9);
	var n = num_n.match(/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
	var wn = [];
	if(!n){
		n = [];
		num_n = ('000000000' + num).slice(-9);
		n[0] = num_n.split("");
		wn[0] = num_n;
		if(!num_n.substring(0, 2))
			return;
		n[1] = num_n.substring(0, 2).split("");
		wn[1] = num_n.substring(0, 2);
		if(!num_n.substring(2, 4))
			return;
		n[2] = num_n.substring(2, 4).split("");
		wn[2] = num_n.substring(2, 4);
		if(!num_n.substring(4, 6))
			return;
		n[3] = num_n.substring(4, 6).split("");
		wn[3] = num_n.substring(4, 6);
		if(!num_n.substring(6, 7))
			return;
		n[4] = num_n.substring(6, 7).split("");
		wn[4] = num_n.substring(6, 7);
		if(!num_n.substring(0, 2))
			return;
		n[5] = num_n.substring(7, 9).split("");
		wn[5] = num_n.substring(7, 9);
		if (!n || n.length <= 1) return; 
	}else{
		 wn = [n[0], n[1], n[2], n[3], n[4], n[5]];
	}
	try {
		str += (wn[1] != 0) ? (a[Number(wn[1])] || b[n[1][0]] + ((a[Number(wn[1])] || b[n[1][0]]) == '' || a[n[1][1]] == '' ? '' : '-') + a[n[1][1]]) + c[3] : '';
		str += (wn[2] != 0) ? (a[Number(wn[2])] || b[n[2][0]] + ((a[Number(wn[2])] || b[n[2][0]]) == '' || a[n[2][1]] == '' ? '' : '-') + a[n[2][1]]) + c[2] : '';
		str += (wn[3] != 0) ? (a[Number(wn[3])] || b[n[3][0]] + ((a[Number(wn[3])] || b[n[3][0]]) == '' || a[n[3][1]] == '' ? '' : '-') + a[n[3][1]]) + c[1] : '';
 		str += (wn[4] != 0) ? (a[Number(wn[4])] || b[n[4][0]] + ((a[Number(wn[4])] || b[n[4][0]]) == '' || a[n[4][1]] == '' ? '' : '-') + a[n[4][1]]) + c[0] : '';
		str += (wn[5] != 0) ? (a[Number(wn[5])] || b[n[5][0]] + ((a[Number(wn[5])] || b[n[5][0]]) == '' || a[n[5][1]] == '' ? '' : '-') + a[n[5][1]]) : '';
	}catch(err){
		str = '';
	}
	return str;
}

//below methods[test_value()  dispAmtInWords()  tens_complication() ] added for number to word 
/* var th = ['', ' Thousand', ' Million', ' Billion', ' Trillion', ' Quadrillion', ' Quintillion' , 'Sextillion' , 'Septillion' , 'Octillion' , 'Nonillion' , 'Decillion'];
var dg = ["Zero", " One", " Two", " Three", " Four", " Five", " Six", " Seven", " Eight", " Nine"];
var tn = ['Ten', ' Eleven', ' Twelve', ' Thirteen', ' Fourteen', ' Fifteen', ' Sixteen', ' Seventeen', ' Eighteen', 'Nineteen'];
var tw = [' Twenty',' Thirty', ' Forty', ' Fifty', ' Sixty', ' Seventy', ' Eighty', ' Ninety'];


function dispAmtInWords(ele){
	
	if(!ele){
		var elements = document.body.getElementsByTagName("*");
		for (var i = 0; i < elements.length; i++) {
			if ((elements[i].className).indexOf("_InNum") > -1) {
				dispAmtInWords(elements[i]);
			}
		}
		
	}else {
		var num = ele.value ? ele.value : ele.innerText;
		num = num.replace(/,/g,"");
		num = num.split(".")[0];
		var str = '';
		var numString =   num;
	    /*if (numString == '0') {
	        document.getElementById('container').innerHTML = 'Zero';
	        return;
	    }*/
/*	    var output = toWords(numString);
	    //print the output
		var classes = ele.className.split(" ")
		if(classes){
				for(var j = 0; j < classes.length; j++){
					if(classes[j].indexOf("InNum")){
						var op = document.getElementById(classes[j].replace("InNum", "InWords"));
						op.value = output;
						op.innerText = output;
						break;
					}
			}
		}
	}
}

function toWords(s) {
    s = s.toString();
    s = s.replace(/[\, ]/g, '');
    if (s != parseFloat(s)) return '';
    var x = s.indexOf('.');
    if (x == -1) x = s.length;
    if (x > 35) return 'too big';
    var n = s.split('');
    var str = '';
    var sk = 0;
    for (var i = 0; i < x; i++) {
        if ((x - i) % 3 == 2) {
            if (n[i] == '1') {
                str += tn[Number(n[i + 1])] + ' ';
                i++;
                sk = 1;
            } else if (n[i] != 0) {
                str += tw[n[i] - 2] + ' ';
                sk = 1;
            }
        } else if (n[i] != 0) {
            str += dg[n[i]] + ' ';
            if ((x - i) % 3 == 0) str += 'hundred ';
            sk = 1;
        }
        if ((x - i) % 3 == 1) {
            if (sk) str += th[(x - i - 1) / 3] + ' ';
            sk = 0;
        }
    }
    if (x != s.length) {
        var y = s.length;
        str += 'point ';
        for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' ';
    }
    return str.replace(/\s+/g, ' ');
} */