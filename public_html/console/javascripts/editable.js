/*
  Instructions:
    - Add <script src="editable.js"></script> to your HTML.
    - Add class="editable" to <P> element you might like to edit.
 */

var editing  = false;
var editedClassName = '';
var editingIDname = 'editingTEXTAREA';
var editingButtonIDname = 'editingBUTTON';

if (document.getElementById && document.createElement) {
	var butt = document.createElement('BUTTON');
	butt.id = editingButtonIDname;

	var buttext = document.createTextNode('Save');
	butt.appendChild(buttext);
	butt.onclick = saveEdit;
}

function editCatchIt(e) {
	if (editing) return;
	if (!document.getElementById || !document.createElement) return;

	if (!e) var obj = window.event.srcElement;
	else var obj = e.target;
	while (obj.nodeType != 1) {
		obj = obj.parentNode;
	}
	if (obj.tagName == 'TEXTAREA' || obj.tagName == 'A') return;

	while (obj.nodeName != 'P' && obj.nodeName != 'HTML') {
		obj = obj.parentNode;
	}
	if (obj.nodeName == 'HTML') return;

	if (obj.className.search(/\beditable\b/) == -1) {
		//alert(obj.tagName + " class: (" + obj.className + ")");
		window.status = obj.tagName + " class: (" + obj.className + ")" + " -> Not editable";
		return;
	}
	
	editedClassName = obj.className;
	
	var x = obj.innerHTML;
	var y = document.createElement('TEXTAREA');
//	y.appendChild(document.createTextNode(x));
	y.id = editingIDname;

	var z = obj.parentNode;
	
	z.insertBefore(y,obj);
	z.insertBefore(butt,obj);
	z.removeChild(obj);
	y.value = x;
	y.focus();

	editing = true;
	return false;
}

function saveEdit() {
	//var area = document.getElementsByTagName('TEXTAREA')[0];	//assuming only 1 textarea exists
	var area = document.getElementById(editingIDname);

	var y = document.createElement('P');
	var z = area.parentNode;
	
	y.className = editedClassName;
	y.innerHTML = area.value;

	z.insertBefore(y, area);
	z.removeChild(area);
	//z.removeChild(document.getElementsByTagName('button')[0]);	//assuming only 1 button exists
	z.removeChild(document.getElementById(editingButtonIDname));

	editing = false;
	return false;
}

if (document.onclick) alert('editable.js -> existing document.onclick found');

document.onclick = editCatchIt;

