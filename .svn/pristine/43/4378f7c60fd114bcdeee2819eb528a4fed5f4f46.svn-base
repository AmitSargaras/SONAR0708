// JavaScript Document
function itgTwoCombo(sParentOptionId, sChildOptionId, arrTextModel, arrValModel) {

	var oParentOption = document.getElementById(sParentOptionId);
	var groups=oParentOption.options.length;
	var group=new Array(groups);
	
	for (i=0; i<groups; i++) group[i]=new Array();
		
	for (i=0; i<arrTextModel.length; i++) {
		for(j=0 ; j<arrTextModel[i].length; j++){
			group[i][j] = (typeof(arrValModel)=="undefined" ? new Option(arrTextModel[i][j]) : new Option(arrTextModel[i][j],arrValModel[i][j]));
		}
	}
	//itgTwoCombo = new itgTwoComboController(sChildOptionId,group);
	var temp = new itgTwoComboController(sParentOptionId,sChildOptionId,group);
	//return itgTwoCombo;
	return temp;
}

function itgTwoComboController(sParentOptionId, sChildOptionId, group) {
	this.pParentOptionId = sParentOptionId;
	this.pChildOptionId = sChildOptionId;
	this.pChildOption = document.getElementById(sChildOptionId);
	this.pParentOption = document.getElementById(sParentOptionId);
	this.group = group;
	
	// var oChildOption = document.getElementById(sChildOptionId);	
	// var temp=oChildOption;
	itgTwoComboController.prototype.redirect=redirect;	
	itgTwoComboController.prototype.go=go;	

	function redirect(x){
		var temp = this.pChildOption;
		for (m=temp.options.length-1;m>0;m--) temp.options[m]=null;
		for (i=0;i<this.group[x].length;i++){
			temp.options[i]=new Option(this.group[x][i].text,this.group[x][i].value)
		}
		temp.options[0].selected=true;
		// in case this object relates to some other objects, fire the onchange event
		//temp.fireEvent("onchange");
	}

	function go(){
		var temp = this.pChildOption;
		location=temp.options[temp.selectedIndex].value
	}
}