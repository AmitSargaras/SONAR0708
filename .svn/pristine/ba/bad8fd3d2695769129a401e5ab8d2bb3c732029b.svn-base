<%@ page import="
com.integrosys.base.techinfra.logger.DefaultLogger,
java.util.Arrays,
com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxForm,
com.integrosys.cms.ui.collateral.CategoryCodeConstant, 
com.integrosys.component.commondata.app.CommonDataSingleton,
com.integrosys.cms.app.common.constant.ICMSConstant,
com.integrosys.cms.app.propertyindex.bus.IPropertyIdxDistrict,
com.integrosys.cms.app.propertyindex.bus.IPropertyIdxMukim,
com.integrosys.cms.app.propertyindex.bus.IPropertyIdxPropertyType,
java.util.List, 
java.util.Iterator"%>
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
    List propertySubtypeFullList = (List)request.getAttribute("propertySubtypeFullList");
    List propertySubtypeFullListLabel = (List)request.getAttribute("propertySubtypeFullListLabel");
    
    PropertyIdxForm propertyValByIdxForm = (PropertyIdxForm)request.getAttribute("PropertyIdxForm");
    String[] selectedPropertySubtypeVals = propertyValByIdxForm.getSelectedPropertySubtype();
    
   // for (int i=0; i<selectedPropertySubtypeVals.length;i++) {
    	//DefaultLogger.debug("----------selected sub type val----------", selectedPropertySubtypeVals[i]);
   // }
    
    boolean isDisabled = false;
    
    String formBeforeSubmitStyle="display:none";
    String formAfterSubmitStyle="display:none";
    String formSubmitStyle="display:none";
    
    if((propertyValByIdxForm.getPropertyIdxItemList() != null && propertyValByIdxForm.getPropertyIdxItemList().size() > 0)
			|| event.equals("delete_items") || event.equals("maker_confirm_create") ) {
    	isDisabled = true;
    	formAfterSubmitStyle="display:block";
    	formSubmitStyle="display:block";
    }
    else if ( propertyValByIdxForm.getValuationDescription() != null && propertyValByIdxForm.getValuationDescription().equals("")) {
    	formBeforeSubmitStyle="display:block";
    	formSubmitStyle="display:none";
    }
 
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

function submitPage () {
    selectAll(document.forms[0]);
    if (<%=isDisabled%>) {
		var form = document.forms[0];
		form.unselectedPropertySubtype.disabled=false;
		form.selectedPropertySubtype.disabled=false;
		form.valuationDescription.disabled=false;
	}
	 document.forms[0].submit();
}

function addOption(original,selection)
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
    for(var i=0;i<form.unselectedPropertySubtype.length;i++)
    {
        form.unselectedPropertySubtype[i].selected= true;
    }
    for(var i=0;i<form.selectedPropertySubtype.length;i++)
    {
        form.selectedPropertySubtype[i].selected= true;
    }
}

function changeValDescr()
{
	var oDiv = document.getElementById('formbeforesubmit');

	var form = document.forms[0];

	data = form.valuationDescription[form.valuationDescription.selectedIndex].value;

	if (data == "") {
		oDiv.style.display = 'none';
		document.getElementById('formsubmit').style.display = 'none';
	}
	else if (document.getElementById('formaftersubmit').style.display == 'block') {
		oDiv.style.display = 'none';
	}
	else {
		oDiv.style.display = 'block';
	}

}

function goToPage() {
 	selectAll(document.forms[0]);
    document.forms[0].event.value = "create_items";
    var form = document.forms[0];

    if (<%=isDisabled%>) {
		form.unselectedPropertySubtype.disabled=false;
		form.selectedPropertySubtype.disabled=false;
		form.valuationDescription.disabled=false;
	}

	form.valDesc.value = form.valuationDescription[form.valuationDescription.selectedIndex].value;

	document.forms[0].submit();
}

function deleteItem(){
	selectAll(document.forms[0]);
    document.forms[0].event.value = "delete_items";
    if (<%=isDisabled%>) {
		var form = document.forms[0];
		form.unselectedPropertySubtype.disabled=false;
		form.selectedPropertySubtype.disabled=false;
		form.valuationDescription.disabled=false;
	}
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="MaintainPropertyIndex.do">
<input type="hidden" name="event" value="maker_confirm_create"/>
<input type="hidden" name="fromEvent" value="add"/>
<input type="hidden" name="valDesc" />
<bean:define id="formObj" name="PropertyIdxForm" scope="request" type="com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxForm"/>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>

<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0">

	<tr>
    	<td><h3><bean:message key="label.add.new"/> <bean:message key="title.property.valuation.by.index.name"/></h3></td>
    </tr>

    <tr>
    	<td><hr></td>
  	</tr>

    <tr>
      	<td>
      
      	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
        	<tbody>
          
          	<tr class="odd">
              <td width="200" class="fieldname"><strong><bean:message key="label.property.valuation.by.index.collateral.type"/></strong></td>
              <td colspan="3">Property </td>
            </tr>
            
            <tr class="even">
              <td class="fieldname"><bean:message key="label.property.valuation.by.index.property.subtype"/> <font color="#0000FF">*</font></td>
              <td style="border-left:0;border-right:0;text-align:left">
              <html:select property="unselectedPropertySubtype" disabled="<%=isDisabled%>" size="10" multiple="true" style="width:300">
              <% for(int i=0; i<propertySubtypeFullListLabel.size(); i++){
					if(selectedPropertySubtypeVals==null || !Arrays.asList(selectedPropertySubtypeVals).contains(propertySubtypeFullList.get(i))){  //if this value not in selected value print..
			  %>
					<option value='<%=propertySubtypeFullList.get(i)%>'><%=propertySubtypeFullListLabel.get(i)%></option>
			  <%
					}
				}
			  %>    
              </html:select>
              <br><html:errors property="propertySubtypeError"/>
              <html:errors property="residentialHousesError"/>
              
              </td>
              <td style="border-left:0;border-right:0;text-align:center">
              <input name="AddSubType" type="button" class="btnNormal" style="width:80" value="Add &gt;&gt;"
									onclick="addOption(this.form.unselectedPropertySubtype, this.form.selectedPropertySubtype)"/>
			  <br/><br/>
			  <input name="RemoveSubType" type="button" class="btnNormal" style="width:80" value="&lt;&lt; Remove"
									onclick="addOption(this.form.selectedPropertySubtype, this.form.unselectedPropertySubtype)"/>
			  </td>
              <td style="text-align:right; border-left:0">
              <html:select property="selectedPropertySubtype" disabled="<%=isDisabled%>" size="10" multiple="true" style="width:300">
              		
                  <% for(int i=0; i<propertySubtypeFullListLabel.size(); i++){
                         if(selectedPropertySubtypeVals!=null && Arrays.asList(selectedPropertySubtypeVals).contains(propertySubtypeFullList.get(i))){ 
                   %>
                            <option value='<%=propertySubtypeFullList.get(i)%>'><%=propertySubtypeFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                	</html:select>
                </td>
             </tr>

             <tr class="odd">
              <td class="fieldname"><bean:message key="label.property.valuation.by.index.valuation.description"/> <font color="#0000FF">*</font> </td>
              <td colspan="3">
             
               <html:select name="PropertyIdxForm" disabled="<%=isDisabled%>" property="valuationDescription" onchange="return changeValDescr()">
                  <option value=""><bean:message key="label.please.select"/></option>
					<html:options collection="valDescrValue" property="value" labelProperty="label"/>
				  
                </html:select>
             
              <html:errors property="valuationDescriptionError"/>
              
             </td>
            </tr>
          </tbody>
		</table>
    </td>
    </tr>
   

	<tr>
		<td align="center">

		<html:errors property="secsubtypeValdescExistError"/>
		<br>
		
		<div id="formbeforesubmit" style="<%=formBeforeSubmitStyle%>">
		<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
      		<td colspan="2" align="center">&nbsp;</td>
    	</tr>
     	<tr>
			<td colspan="2" valign="bottom"  align="right" >
		   <input type="button" value="Add New" class="btnNormal" onclick="goToPage()"/>
				&nbsp;&nbsp;
			</td>
	  	</tr>    
    	<tr>	  	
          <td colspan="2"><hr/></td>
      </tr> 
		</table>
		</div>


		<div id="formaftersubmit" style="<%=formAfterSubmitStyle%>">
		
		<%    if (propertyValByIdxForm.getValuationDescription() != null) {        %>
		
		<table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
      		<td colspan="2" align="center">&nbsp;</td>
    	</tr>
     	<tr>
			<td colspan="2" valign="bottom"  align="right" >
		   	<input type="button" value="Add New" class="btnNormal" onclick="goToPage()"/>
				&nbsp;&nbsp;
		  
		   	<input class="btnNormal" type="button" name="btnDelXRef" value="Delete" onclick="javascript:deleteItem()"/>
			</td>
	  	</tr>    
    	 
      	<tr>	  	
          	<td colspan="2"><hr/></td>
      	</tr> 
      
      	<tr>
         	<td colspan="2">
              	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
               	<thead>
                   <tr>
                      <td width="2%"><bean:message key="label.property.valuation.by.index.sn"/></td>
                      
                      		<%    if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ISTP )) {        %>
									
								  <td width="30%"><bean:message key="label.property.valuation.by.index.type.of.property"/></td>
								  <td width="10%"><bean:message key="label.property.valuation.by.index.state"/></td>
								  <td width="15%"><bean:message key="label.property.valuation.by.index.district"/></td>
								  <td width="30%"><bean:message key="label.property.valuation.by.index.mukim"/></td>
								  <td width="5%"><bean:message key="label.property.valuation.by.index.year"/></td>
			                	  <td width="5%"><bean:message key="label.property.valuation.by.index.annual.quarter"/></td> 	
			                	  <td width="5%"><bean:message key="label.property.valuation.by.index"/></td>
	
							<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ITP )) {        %>
								
								  <td><bean:message key="label.property.valuation.by.index.type.of.property"/></td>	 		
								  <td><bean:message key="label.property.valuation.by.index.year"/></td>
			                	  <td><bean:message key="label.property.valuation.by.index.annual.quarter"/></td> 	
			                	  <td><bean:message key="label.property.valuation.by.index"/></td>
									
							<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ID )) {        %>
							
								  <td width="15%"><bean:message key="label.property.valuation.by.index.state"/></td>
								  <td width="25%"><bean:message key="label.property.valuation.by.index.district"/></td>
								  <td width="40%"><bean:message key="label.property.valuation.by.index.mukim"/></td>
								  <td width="5%"><bean:message key="label.property.valuation.by.index.year"/></td>
			                	  <td width="5%"><bean:message key="label.property.valuation.by.index.annual.quarter"/></td> 	
			                	  <td width="10%"><bean:message key="label.property.valuation.by.index"/></td>


							<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IS )) {        %>
							
								  <td><bean:message key="label.property.valuation.by.index.state"/></td>
								  <td><bean:message key="label.property.valuation.by.index.year"/></td>
			                	  <td><bean:message key="label.property.valuation.by.index.annual.quarter"/></td> 	
			                	  <td><bean:message key="label.property.valuation.by.index"/></td>

							<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IRH )) {        %>
 								  <td><bean:message key="label.property.valuation.by.index.year"/></td>
			                	  <td><bean:message key="label.property.valuation.by.index.annual.quarter"/></td> 	
			                	  <td><bean:message key="label.property.valuation.by.index"/></td>

							<%   } %>
                      
			                <td width="5%"><bean:message key="label.property.valuation.by.index.action"/></td>	
		     			   
                    </tr>
               </thead>
                    
				    <tbody>		
				    		<% if(propertyValByIdxForm.getPropertyIdxItemList() != null){
					    		System.out.println(String.valueOf(formObj.getPropertyIdxItemList().size()));
					    		%>
								<logic:present name="PropertyIdxForm" property="deletedItemList" scope="request">
	               <bean:define id="itemSize" value="<%= String.valueOf(formObj.getPropertyIdxItemList().size()) %>"/>
	               <% DefaultLogger.debug("----------Property Item List----------", formObj.getPropertyIdxItemList());
	                %>
	                   <logic:notEqual name="itemSize" value="0">
	                      <logic:iterate id="item" indexId="itemInd" name="PropertyIdxForm"
														property="propertyIdxItemList" scope="request" type="com.integrosys.cms.app.propertyindex.bus.OBPropertyIdxItem">
									
									<% DefaultLogger.debug("----------Property Item List----------", formObj.getPropertyIdxItemList());
	               %>
									<tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                                       <td class="index">
	                                            <%= itemInd.intValue() + 1 %>
	                                       </td>			
												
									<%    if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ISTP )) {        %>
									
										   <td>
										   		<%
	                                       		for (Iterator iter = item.getPropertyTypeList().iterator(); iter.hasNext();) {
												IPropertyIdxPropertyType element = (IPropertyIdxPropertyType) iter.next(); %>
												&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.BUILDING_TYPE, element.getPropertyTypeId())%>"/><br>
					  							<%		
					  							}
	                                       		%>	
										   		
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.STATE_CATEGORY_CODE, item.getStateCode())%>"/>
	                                       </td>
	                                       <td>
	                                       		<%
	                                       		if (item.getDistrictList() != null) {
	                                       			for (Iterator iter = item.getDistrictList().iterator(); iter.hasNext();) {
													IPropertyIdxDistrict element = (IPropertyIdxDistrict) iter.next(); %>
													&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.DISTRICT_CATEGORY_CODE, element.getDistrictCode())%>"/><br>	
					  							<%		
					  								}
					  							}
					  							else {
	                                       		%>	
	                                       		&nbsp;
	                                       		<%
	                                       		}
	                                       		%>		
	                                       </td>
	                                       <td>  
	                                       		<%
	                                       		if (item.getMukimList() != null) {
	                                       			for (Iterator iter = item.getMukimList().iterator(); iter.hasNext();) {
													IPropertyIdxMukim element = (IPropertyIdxMukim) iter.next(); %>
													&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.MUKIM_CATEGORY_CODE, element.getMukimCode())%>"/>	<br>	
					  							<%		
					  								}
					  							}
					  							else {
	                                       		%>	
	                                       		&nbsp;
	                                       		<%
	                                       		}
	                                       		%>
	                                     		
										   </td>	
										   <td>
										   		&nbsp;<integro:empty-if-null value="<%=String.valueOf(item.getIdxYear())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, item.getIdxType())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=String.valueOf(item.getIdxValue())%>"/>
										   </td>
	
										<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ITP )) {        %>
									
											<td>
										   		<%
	                                       		for (Iterator iter = item.getPropertyTypeList().iterator(); iter.hasNext();) {
												IPropertyIdxPropertyType element = (IPropertyIdxPropertyType) iter.next(); 
												%>
												&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.BUILDING_TYPE, element.getPropertyTypeId())%>"/><br>
					  							<%		
					  							}
	                                       		%>	
										   		
	                                       </td>	
											<td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf(item.getIdxYear())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, item.getIdxType())%>"/>
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=String.valueOf(item.getIdxValue())%>"/>
	                                       </td>

									
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ID )) {        %>
									
									 		<td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.STATE_CATEGORY_CODE, item.getStateCode())%>"/>
	                                       </td>
	                                       <td>
	                                       		<%
	                                       		for (Iterator iter = item.getDistrictList().iterator(); iter.hasNext();) {
												IPropertyIdxDistrict element = (IPropertyIdxDistrict) iter.next(); %>
												&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.DISTRICT_CATEGORY_CODE, element.getDistrictCode())%>"/><br>		
					  							<%		 
					  							}
	                                       		%>		
	                                       </td>
	                                       <td>  
	                                       		<%
	                                       		if (item.getMukimList() != null) {
	                                       			for (Iterator iter = item.getMukimList().iterator(); iter.hasNext();) {
													IPropertyIdxMukim element = (IPropertyIdxMukim) iter.next(); %>
													&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.MUKIM_CATEGORY_CODE, element.getMukimCode())%>"/>	<br>	
					  							<%		
					  								}
					  							}
					  							else {
	                                       		%>	
	                                       		&nbsp;
	                                       		<%
	                                       		}
	                                       		%>
	                                     		
										   </td>	
										   <td>
										   		&nbsp;<integro:empty-if-null value="<%=String.valueOf(item.getIdxYear())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, item.getIdxType())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=String.valueOf(item.getIdxValue())%>"/>
										   </td>
	


									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IS )) {        %>
									
										  <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.STATE_CATEGORY_CODE, item.getStateCode())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf(item.getIdxYear())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, item.getIdxType())%>"/>
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=String.valueOf(item.getIdxValue())%>"/>
	                                       </td>


									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IRH )) {        %>
 
 											<td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf(item.getIdxYear())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, item.getIdxType())%>"/>
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=String.valueOf(item.getIdxValue())%>"/>
	                                       </td>

									<%   } %>
													
	                                       <td style="text-align:center">
	                                            <html:multibox property="deletedItemList" value="<%= itemInd.toString()%>"/>
	                                            &nbsp;
	                                       </td>
	                                  </tr> 
	                                   
	                        </logic:iterate>
	                    </logic:notEqual>
	                   <logic:equal name="itemSize" value="0">
	                                <tr class="odd">
	                                <%    if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ISTP )) {        %>
										   <td colspan="9"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ITP )) {        %>
										 <td colspan="6"><bean:message key="label.propertyindex.noIndex"/></td>	
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ID )) {        %>
										 <td colspan="8"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IS )) {        %>
										<td colspan="6"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IRH )) {        %>
 										 <td colspan="5"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } %>
	                                </tr>
	                   </logic:equal>
	              </logic:present>
	              <% }else{%>
	              <logic:notPresent name="PropertyIdxForm" property="propertyIdxItemList" scope="request">
	                            <tr class="odd">
	                            
	                            	<%    if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ISTP )) {        %>
										   <td colspan="9"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ITP )) {        %>
										 <td colspan="6"><bean:message key="label.propertyindex.noIndex"/></td>	
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ID )) {        %>
										 <td colspan="8"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IS )) {        %>
										<td colspan="6"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IRH )) {        %>
 										 <td colspan="5"><bean:message key="label.propertyindex.noIndex"/></td>
									<%   } %>
	                             
	                            </tr>
	              </logic:notPresent>	
	              <% }%>		  
				</tbody>  
				
			   	</table>           
           	</td>
      	</tr>

   		<tr>
      		<td colspan="2" align="center">&nbsp;</td>
    	</tr>
		</table>
		
		<%  }   %> 
		
		</div>

		</td>

	</tr>
		
    <tr> 
      <td align="center">&nbsp;</td>
    </tr>
    
    <tr>
		<td align="center">

		<html:errors property="itemEmptyError"/>
		<br>
		
    
   <div id="formsubmit" style="<%=formSubmitStyle%>">
   <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
      <tr>
         <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>&nbsp;&nbsp;
          <a href="MaintainPropertyIndex.do?event=property_index_list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">&nbsp;</td>
      </tr>
    </table>
    </div>
    
    </td>
    
    </tr>
    
</table>

</html:form>
<!-- InstanceEndEditable -->
</body>

<script language="javascript">
  		changeValDescr();
</script>
<!-- InstanceEnd --></html>
