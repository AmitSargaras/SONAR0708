<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,java.util.Arrays,
com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxForm, com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxItemForm,
java.util.List"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose: For Maker to create new Property Valuation By Index
* Description: create the new set of Property Valuation By Index
*
* @author $Author$
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String event = request.getParameter("event");
    DefaultLogger.debug("----------event----------", event);
    String formActionName = "MaintainPropertyIndex.do";

    List districtFullList = (List)request.getAttribute("districtFullList");
    List districtFullListLabel = (List)request.getAttribute("districtFullListLabel");
    List mukimFullList = (List)request.getAttribute("mukimFullList");
    List mukimFullListLabel = (List)request.getAttribute("mukimFullListLabel");
    List propertyTypeFullList = (List)request.getAttribute("propertyTypeFullList");
    List propertyTypeFullListLabel = (List)request.getAttribute("propertyTypeFullListLabel");
     
    PropertyIdxItemForm propertyIdxItemForm = (PropertyIdxItemForm)request.getAttribute("PropertyIdxItemForm");
    
    String[] selectedPropertyTypeVals = propertyIdxItemForm.getSelectedPropertyType();
    String[] selectedDistrictVals = propertyIdxItemForm.getSelectedDistrict();
    String[] selectedMukimVals = propertyIdxItemForm.getSelectedMukim();
%>


<html>
<head>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function addOption(original,selection,searchItem)
	{
		var i=0,j=0,or_length=original.length,index=0;
	    var newitem=true;
	    var newItemCount = 0;
			
	    for (i=0;i<or_length;i++)
	    {

	        if (original.options[i].selected)
	        {
	            for (j=0;j<selection.length;j++)
	            {
	                if (original.options[i].value==selection.options[j].value)
	                {
	                    newitem=false;
	                    break;
	                }
	            }

	            if (newitem)
	            {
	                var op = new Option(original.options[i].text, original.options[i].value);
	                if(selection.length == 1 && selection.options[0].value == "")
	                {
	                    selection.options[0] = op;
	                }
	                else
	                    selection.options[selection.length] = op;

	                newItemCount ++ ;
	            }
	        }
	    }
		delOption(original);   
}

function delOption(selection)
{
    var length=selection.length, i=0, index=0;
    for(i=(length-1);i>=0;i--)
    {
        if (selection.options[i].selected)
        {
            selection.options[i].selected=false;
            selection.options[i]=null;
        }
    }
}

function selectAll(form)
{
	
     if ("<%=propertyIdxItemForm.getValDesc()%>" == "ISTP" || "<%=propertyIdxItemForm.getValDesc()%>" == "ITP") {
    	for(var i=0;i<form.unselectedPropertyType.length;i++)
    	{
        	form.unselectedPropertyType[i].selected= true;
    	}
    
   		for(var i=0;i<form.selectedPropertyType.length;i++)
    	{
        	form.selectedPropertyType[i].selected= true;
    	}
    }
    	
    if ("<%=propertyIdxItemForm.getValDesc()%>" == "ISTP" || "<%=propertyIdxItemForm.getValDesc()%>" == "ID") {

    	for(var i=0;i<form.unselectedDistrict.length;i++)
    	{
        	form.unselectedDistrict[i].selected= true;
    	}

    	for(var i=0;i<form.selectedDistrict.length;i++)
    	{
        	form.selectedDistrict[i].selected= true;
    	}

    	for(var i=0;i<form.unselectedMukim.length;i++)
    	{
        	form.unselectedMukim[i].selected= true;
    	}

    	for(var i=0;i<form.selectedMukim.length;i++)
    	{
        	form.selectedMukim[i].selected= true;
    	}
    
    }
    
}

function Login(oSelect)
{
var oDiv = document.getElementById('form2b'), data = oSelect.options[oSelect.selectedIndex].value;

if (data == "" || data == "1")
oDiv.style.display = 'none';
else
oDiv.style.display = 'block';

}
	
function changeCountry()
{
    document.forms[0].searchItem.value="search_state";
    document.forms[0].event.value="change_list_items";

    selectAll(document.forms[0]);
    document.forms[0].submit();
}


function performSubmit()
   {   
   		selectAll(document.forms[0]);
		if(document.forms[0].fromEvent.value == 'add'){
		    document.forms[0].event.value = "confirm_create_items";	   
	    }
	    else if(document.forms[0].fromEvent.value == 'edit'){
				document.forms[0].event.value = "edit_items";
		}
	    else if(document.forms[0].fromEvent.value == 'resubmit_edit'){
		    document.forms[0].event.value = "resubmit_edit_items";
		}   
		document.forms[0].submit();	
   }

   function cancelSubmit()
   {
   		if(document.forms[0].fromEvent.value == 'add'){
		    document.forms[0].event.value = "cancel_create_items";	   
	    }
	    else if(document.forms[0].fromEvent.value == 'edit'){
				document.forms[0].event.value = "cancel_edit_items";
		}
	    else if(document.forms[0].fromEvent.value == 'resubmit_edit'){
		    document.forms[0].event.value = "cancel_resubmit_edit_items";
		}   
		document.forms[0].submit();
	}
	 
	function killEnter(evt)
	{
		if(evt.keyCode == 13 || evt.which == 13)
		{
			return false;
		}
		return true;
	}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="MaintainPropertyIdxItem.do">
<input type="hidden" name="event" value="create"/>
<html:hidden property="fromEvent"/> 
<html:hidden property="valDesc"/> 

<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>

<%    if (propertyIdxItemForm.getValDesc().equals("ISTP")) {        %> 
<%@ include file="property_val_by_index_add_state_type_prop.jsp" %>
<%   } else if (propertyIdxItemForm.getValDesc().equals("ITP")) {        %>
<%@ include file="property_val_by_index_add_type_prop.jsp" %>
<%   } else if (propertyIdxItemForm.getValDesc().equals("ID")) {        %>
<%@ include file="property_val_by_index_add_district.jsp" %>
<%   } else if (propertyIdxItemForm.getValDesc().equals("IS")) {        %>
<%@ include file="property_val_by_index_add_state.jsp" %>
<%   } else if (propertyIdxItemForm.getValDesc().equals("IRH")) {        %>
<%@ include file="property_val_by_index_add_res_house.jsp" %>  
<%   } %> 


</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>