function itgTable(id, htmlModel) 
{
	this.id =id;
	this.htmlModel=htmlModel;
}

function addRow(tblID)
{
	var tbl = document.getElementById(tblID);	
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
		var newRow = tbl.insertRow(rowIndex+1);		
	  	var attr = firstRow.cells[0].getAttribute("className");		
		for(var i=0; i<firstRow.cells.length; i++) {				
			newCell = newRow.insertCell(i);			
			newCell.innerHTML = firstRow.cells[i].innerHTML;							
		}
		reIndex(newRow,rowIndex+1,attr); 								
	} else {
		// Need to think ahow to solve this problema !!!!			
		alert("Sorry can't insert Row without 1'st row as references");
	} 	
}

function delRow(tblID,removedId)
{
	var tbl = document.getElementById(tblID);
	if(!tbl) {
		alert("Invalid table");
		return;
	}
	var numrows = tbl.tBodies[0].rows.length;	
	for(var i=0; i<numrows; i++) {						
		var row = tbl.tBodies[0].rows[i];			
		if(row!=null) {
			var attr = row.cells[0].getAttribute("className");	
			var numcols = row.cells.length;
		} else {
			numcols=0; 
		}
		for(j=0; j<numcols; j++) {												
			//mycel=row.getElementsByTagName("td").item(j);			
			mycel = row.cells[j];										
			cb = mycel.getElementsByTagName("input").item(0);					
			if(cb!=null && cb.checked && cb.type=="checkbox") {								
				tbl.deleteRow(i+1);i--;					
			}		
		}
		reIndex(row,i+1,attr);		
	} 		
}

function reIndex(row,index,attr) {
	if(row!=null && row.cells[0]!=null) { 
		var legend = row.getElementsByTagName("legend").item(0);
		if(legend==null) {
			var textNode = document.createTextNode(index);				
			var currNode = row.cells[0].lastChild;
			row.cells[0].removeChild(currNode);
			row.cells[0].appendChild(textNode);
			row.cells[0].setAttribute("className",attr);
		} else {
			var legendText = document.createTextNode("Director and Key Management "+index);
			legend.removeChild(legend.firstChild);		
			legend.appendChild(legendText);
		}
	}
}

