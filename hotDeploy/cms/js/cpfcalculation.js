// JavaScript Document
function recalculateCPF(sId,strAmt,strInt,strTenor,strCPFLumpSum,strCPFCont,strLowPurcVal,strOverDraft,strCPFInt) {
	var nMths=12;
	tablebuilt=true;
	var pattern = /[,]*/g;
	var tbl = document.getElementById(sId);
	var nAmt = parseFloat(strAmt.replace(pattern,""));
	var nTenor = parseFloat(strTenor.replace(pattern,""));
	var nCPFLumpSum = parseFloat(strCPFLumpSum.replace(pattern,""));
	var nLowPurcVal = parseFloat(strLowPurcVal.replace(pattern,""));
	var nOverDraft = parseFloat(strOverDraft.replace(pattern,""));
	var nCPFIntRate = parseFloat(strCPFInt.replace(pattern,""));

	var intTblMatrix = buildIntTableMatrix(strAmt,strInt,strTenor,strCPFCont);
	var yInstalment=calculateFloat(strAmt,strInt,strTenor)*12;
	
	var yInterest=0;
	var osPrinciple=0;
	var nCPFCont=0;
	var nCPFInt=0;
	var nValLessChg=0;
	var nRemLessCpf=0;
	var nExpAftChg=0.999;
	var nTotal=0;
	var nTotExposure=0;
	txt="";		
	headerRow = tbl.tHead.rows[0];

	for(i=1;i<=nTenor;i++){
		tbldata='<td bgcolor="'+((i%2!=0) ? '#d9ecff' : 'white' )+'" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">';
		osPrincipal = (nAmt + intTblMatrix[i-1]) - yInstalment;
		nCPFCont = nCPFCont + (12 * parseFloat(strCPFCont.replace(pattern,"")));
		nCPFInt = nCPFInt + (nCPFLumpSum+nCPFCont+nCPFInt)*(nCPFIntRate/100);
		nValLessChg = nLowPurcVal - (osPrincipal + nCPFLumpSum + nCPFCont);
		nRemLessCpf = nValLessChg - nCPFInt;
		nTotal = nLowPurcVal - nRemLessCpf;
		nTotExposure = (nTotal/nLowPurcVal) * 100;
	
		txt=tbldata+i+'</td>'
				   +tbldata+round(yInstalment)+'</td>'
				   +tbldata+round(intTblMatrix[i-1])+'</td>'
				   +tbldata+round(osPrincipal )+'</td>'
				   +tbldata+round(nCPFLumpSum)+'</td>'
				   +tbldata+round(nCPFCont)+'</td>'
				   +tbldata+round(nCPFInt)+'</td>'
				   +tbldata+round(nValLessChg)+'</td>'
				   +tbldata+round(nRemLessCpf)+'</td>'
				   +tbldata+round(nExpAftChg)+'</td>'
				   +tbldata+round(nTotal)+'</td>'
				   +tbldata+round(nTotExposure)+'</td>'
				   
		nAmt = osPrincipal;
		newRow = tbl.tBodies[0].insertRow(i-1);
		for(j = 0; j<headerRow.cells.length; j++){
			newCell = newRow.insertCell(j);
			newCell.setAttribute('align','right',0);
			newCell.setAttribute('font-size',1);
			//;font-family:Verdana, Arial, Helvetica, sans-serif");
			if (i%2!=0) {
				newCell.setAttribute('bgColor','#d9ecff' );
				}
			else {
				newCell.setAttribute('bgColor','white');
			}			
		}
		newRow.cells[0].innerHTML=i;
		newRow.cells[1].innerHTML=round(yInstalment);
		newRow.cells[2].innerHTML=round(intTblMatrix[i-1]);
		newRow.cells[3].innerHTML=round(osPrincipal);
		newRow.cells[4].innerHTML=round(nCPFLumpSum);
		newRow.cells[5].innerHTML=round(nCPFCont);
		newRow.cells[6].innerHTML=round(nCPFInt);
		newRow.cells[7].innerHTML=round(nValLessChg);
		newRow.cells[8].innerHTML=round(nRemLessCpf);
		newRow.cells[9].innerHTML=round(nExpAftChg);
		newRow.cells[10].innerHTML=round(nTotal);
		newRow.cells[11].innerHTML=round(nTotExposure);					
	}
}

function buildIntTableMatrix(strAmt, strInt, strTenor, strCPFCont){
	var pattern = /[,]*/g;
	var nAmt = parseFloat(strAmt.replace(pattern,""));
	var nInt = (parseFloat(strInt.replace(pattern,""))/100)/12;
	var nTenor = parseFloat(strTenor.replace(pattern,""));	
	var nCPFCont = parseFloat(strCPFCont.replace(pattern,""));
	var temp = 0;
    var intTblMatrix = new Array(nTenor);
	for(i=0; i<nTenor; i++) {
		intTblMatrix[i] = new Array(12);
		for(j=0; j<12; j++) {
			nDummy = nAmt*nInt;
			temp = temp + nDummy;
			nAmt = nAmt - (nCPFCont - (nDummy));
		}
		intTblMatrix[i] = temp;
		temp =0;	
	}
	return intTblMatrix;
}