// JavaScript Document
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->
<!-- Original:  Fred P -->
<!-- Begin
// Compare two options within a list by VALUES
function compareOptionValues(a, b) 
{ 
  // Radix 10: for numeric values
  // Radix 36: for alphanumeric values
  var sA = parseInt( a.value, 36 );  
  var sB = parseInt( b.value, 36 );  
  return sA - sB;
}

// Compare two options within a list by TEXT
function compareOptionText(a, b) 
{ 
  // Radix 10: for numeric values
  // Radix 36: for alphanumeric values
  var sA = parseInt( a.text, 36 );  
  var sB = parseInt( b.text, 36 );  
  return sA - sB;
}


// Dual list move function
//function moveDualList( srcList, destList, moveAll )  
function moveDualList_old( srcList, destList, moveAll ) //not use 
{
  // Do nothing if nothing is selected
  if (  ( srcList.selectedIndex == -1 ) && ( moveAll == false )   )
  {
    return;
  }

  newDestList = new Array( destList.options.length );
  sortedLabelList = new Array(0);
  var len = 0;
  for( len = 0; len < destList.options.length; len++ ) 
  {
    if ( destList.options[ len ] != null )
    {
      newDestList[ len ] = new Option( destList.options[ len ].text, destList.options[ len ].value, destList.options[ len ].defaultSelected, destList.options[ len ].selected );
	  sortedLabelList.push(destList.options[ len ].text);
    }
  }

  for( var i = 0; i < srcList.options.length; i++ ) 
  { 
    if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )
    {
       // Statements to perform if option is selected
       // Incorporate into new list
       newDestList[ len ] = new Option( srcList.options[i].text, srcList.options[i].value, srcList.options[i].defaultSelected, srcList.options[i].selected );
	   sortedLabelList.push(srcList.options[ i ].text);
       len++;
    }
  }

  // Sort out the new destination list
  // by Jimmy
  //newDestList.sort( compareOptionValues );   // BY VALUES
/*
var str="";
for(z=0; z<newDestList.length; z++)
	str += newDestList[z].text + "\n";
alert(str);
*/
  /* // Changed sorting
  newDestList.sort( compareOptionText );   // BY TEXT
  // Populate the destination with the items from the new array
  for ( var j = 0; j < newDestList.length; j++ ) 
  {
    if ( newDestList[ j ] != null )
    {
      destList.options[ j ] = newDestList[ j ];
    }
  }
  */
    // Changed for Sorting the List by Labels (Text)
    sortedLabelList.sort();
    //alert ("! " +sortedLabelList);
    // copying selected values to destination list
	var index = 0;
	for (var i = 0; i < sortedLabelList.length; i++) {
	  var item = sortedLabelList[i];
	  for (var j = 0; j < newDestList.length; j++) {
  	    if ( newDestList[ j ] != null && item == newDestList[ j ].text){
		  // add the option here to the destlist:
		  destList.options[ index ++] =  newDestList[ j ]; 
		  break;
	    }
	  }
    }    
  
  // Erase source list selected elements
  for( var i = srcList.options.length - 1; i >= 0; i-- ) 
  { 
    if ( srcList.options[i] != null && ( srcList.options[i].selected == true || moveAll ) )
    {
       // Erase Source
       //srcList.options[i].value = "";
       //srcList.options[i].text  = "";
       srcList.options[i]       = null;
    }
  }
} // End of moveDualList()


//Kien Leong: this fix error when have duplicate record in selection box
function moveDualList( srcList, destList, moveAll ) 
{

	// Do nothing if source is empty
	if (!hasOptions(srcList) ||
		(( srcList.selectedIndex == -1 ) && ( moveAll == false ) )) { return; } // or nothing is selected 

	var SelID='';
	var SelText='';
	// Move rows from srcList to destList from bottom to top
	for (i=srcList.options.length - 1; i>=0; i--)
	{
		if (srcList.options[i].selected == true || moveAll)
		{
			SelID=srcList.options[i].value;
			SelText=srcList.options[i].text;
			var newRow = new Option(SelText,SelID);
			destList.options[destList.length]=newRow;
			srcList.options[i]=null;
		}
	}
	sortSelect(destList);

}

function hasOptions(obj) 
{
	if (obj!=null && obj.options!=null && obj.options.length>0) { return true; }
	return false;
}

function sortSelect(obj) 
{
	var o = new Array();
	if (!hasOptions(obj)) { return; }

	for (var i=0; i<obj.options.length; i++) {
		o[o.length] = new Option( obj.options[i].text, obj.options[i].value, obj.options[i].defaultSelected, obj.options[i].selected) ;
	}
	if (o.length==0) { return; }
	o = o.sort(
		function(a,b) {
			if ((a.text+"") < (b.text+"")) { return -1; }
			if ((a.text+"") > (b.text+"")) { return 1; }
			return 0;
		}
	);

	for (var i=0; i<o.length; i++) {
		obj.options[i] = new Option(o[i].text, o[i].value, o[i].defaultSelected, o[i].selected);
	}
}

function selectAllOptions(selectElement) {  
		for( len = 0; len < selectElement.options.length; len++ ){
			selectElement.options[ len ].selected = true;
		}
}