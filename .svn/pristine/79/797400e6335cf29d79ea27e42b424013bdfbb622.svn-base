/*
	itgTableFramework class  
*/
function itgTable(sId) 
{
	this.sId =sId;
	this.arrItgRow = new Array();	
		
	itgTable.prototype.addRow=addRow;
	itgTable.prototype.delRow=delRow;
	itgTable.prototype.populateRow=populateRow;	
	
	// retrieve all data from server	
	function populateRow() {
		var tbl = document.getElementById(this.sId);
		var existRow = null;
		if(!tbl) {
			alert ("invalid table");
			return;
		}
		var totRows = tbl.tBodies[0].rows.length;
	
		for(i=0; i<totRows; i++) {
			existRow = tbl.tBodies[0].rows[i]
			if(existRow != null) {							 			
				this.arrItgRow[i] = new itgRow(existRow,"E");							
			}
		}
	}
	// add row method
	function addRow() {
		var tbl = document.getElementById(this.sId);	
		if(!tbl) {
			alert("Invalid table");
			return;
		}
	// assuming there is a sample row in the table
	// let it be the first row of the tbody of the table
		var firstRow= tbl.tBodies[0].rows[0];	
		var rowIndex = tbl.tBodies[0].rows.length;
		var newCell = null;
		if(firstRow!=null) {			
			var newRow = tbl.tBodies[0].insertRow(rowIndex);		  
			for(var i=0; i<firstRow.cells.length; i++) {				
				newCell = newRow.insertCell(i);					
				newCell.innerHTML = firstRow.cells[i].innerHTML;
				attr = document.all ? firstRow.cells[i].getAttribute("className") : firstRow.cells[i].getAttribute("class");
				document.all ? newCell.setAttribute("className",attr): newCell.setAttribute("class",attr);
			}
			this.arrItgRow[this.arrItgRow.length] = new itgRow(newRow,"N");										
			if(document.all) resetTable(newRow);										
		} else {
			// Need to think on how to solve this problema !!!!			
			alert("Sorry can't insert Row without 1'st row as references");
		} 
		rebuildTableRowIndex(this.sId);	
	}

	// del row method
	function delRow() {
		var tbl = document.getElementById(this.sId);
		if(!tbl) {
			alert("Invalid table");
			return;
		}
		var numrows = tbl.tBodies[0].rows.length;		
		for(var i=0; i<numrows; i++) {						
			var row = tbl.tBodies[0].rows[i];
			if(row!=null) {					
				var numcols = row.cells.length;
			} else {
				numcols=0;
			}
			for(j=0; j<numcols; j++) {
				mycel = row.cells[j];										
				cb = mycel.getElementsByTagName("input").item(0);					
				if(cb!=null && cb.checked && cb.type=="checkbox") {													
					if(this.arrItgRow[i].isNew()) {											
						delete this.arrItgRow[i];						
						this.arrItgRow[i]=this.arrItgRow[i+1];
						this.arrItgRow.length--;								
						tbl.tBodies[0].deleteRow(i); i--;				
					} else if(this.arrItgRow[i].isExist()) {					
						this.arrItgRow[i].setStatus("D");
						row.style.display="none";																													
					} 										
				}		
			}	
		} 
		rebuildTableRowIndex(this.sId);
	}
	
	// the method for rebuilding row index 
	function rebuildTableRowIndex(sId) {
		var tbl = document.getElementById(sId);
		if(!tbl) {
			alert("Invalid table");
			return;
		}
		var hideRow = 0;
		var numrows = tbl.tBodies[0].rows.length;		
		for(var i=0; i<numrows; i++) {
			var row = tbl.tBodies[0].rows[i];				
			if(row!=null && row.cells[0]!=null) {
				var legend = row.getElementsByTagName("legend").item(0);			
				if(row.style.display == "none"){ hideRow++;	}
				if(legend==null) {		
					row.cells[0].removeChild(row.cells[0].firstChild);
					row.cells[0].appendChild(document.createTextNode(i+1-hideRow));					
				} else {
					var textNode = document.createTextNode(legend.innerHTML);									
					var legendText = document.createTextNode(textNode.nodeValue.substring(0,textNode.length-1) +(i+1-hideRow));					
					legend.removeChild(legend.firstChild);		
					legend.appendChild(legendText);
				}	
			}
		}
	
	}
	
	// reset data 
	function resetTable(row){
		var numrows = row.cells.length;
		var nRadio=0;	
		for(j=0; j<numrows; j++) {	
			var mycel =  row.cells[j];
			
			// checkd all INPUT TYPE elements;
			var oInput = mycel.getElementsByTagName("input");
			var numInputs = oInput.length;			
			for(i=0; i<numInputs; i++) {				
				switch(oInput.item(i).type){
					case "checkbox":
						oInput.item(i).checked=false;break;
					case "text":
						oInput.item(i).innerText='';break;
					case "radio":						
						nRadio==0 ?	oInput.item(i).checked=true : oInput.item(i).checked=false;	
						nRadio++;break;												
					default:break;									
				}
			}
			// checked all SELECT OPTION TYPE Elements;
			var oSelect = mycel.getElementsByTagName("select");
			var numSelects = oSelect.length;				
			for(i=0; i<numSelects; i++) {				
				oSelect.item(i).selectedIndex=0;
			}
			// need to add on ....in future
		}		
	}
}

//itgTableController class
function itgTableController(oModel) {

	this.arrTable = new Array();		
	this.oModel = oModel;
	this.createTable = createTable;
	
	function createTable(sId) {
		if(!isTableExist(sId)) {		
			itgTbl = new itgTable(sId);
			this.arrTable[this.arrTable.length] =  itgTbl;
			itgTbl.populateRow();
			return itgTbl;					
		} else { 
			alert("This table : " + sId + " has been created !!! ");
			return;
		}		
	}
	
	function isTableExist(sId) { 
		if(this.arrTable==null){
			arrTable=new Array();
		}		
		for(i=0; i<this.arrTable.length; i++){
			if(this.arrTable[i] == sId) {
				return true;
			}
		}
		return false;
	}	
}

// itgRow class
function itgRow(oRow,sStatus) {

	this.sStatus=sStatus;
	this.oRow = oRow;
	
	// constants for status
	this.sNewRow = "N"; // 'N' -- new records;
	this.sDelRow = "D"; // 'D' -- deleted record;
	this.sExistRow = "E"; // 'E' -- existing records;
		
	function isNew(){ return(this.sStatus==this.sNewRow);}	
	function isDeleted(){return(this.sStatus==this.sDelRow);}	
	function isExist(){return(this.sStatus==this.sExistRow);}	
	function getRow(){return this.oRow;}
	function setStatus(sStatus){ this.sStatus=sStatus;}
	function getStatus(){return sStatus;}
	
	itgRow.prototype.getRow=getRow;
	itgRow.prototype.isNew =isNew;
	itgRow.prototype.isDeleted=isDeleted;
	itgRow.prototype.isExist=isExist;
	itgRow.prototype.setStatus=setStatus;
	itgRow.prototype.getStatus=getStatus;
}
