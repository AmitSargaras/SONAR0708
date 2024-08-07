<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxForm,
                 com.integrosys.cms.app.propertyindex.bus.OBPropertyIdx,
                 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxItem,
                 com.integrosys.cms.app.propertyindex.trx.IPropertyIdxTrxValue,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxDistrict,
				 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxMukim,
				 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxPropertyType,
				 com.integrosys.cms.app.common.constant.ICategoryEntryConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 java.util.List,
				 java.util.Iterator"
%>

<%
/**
 * Title: CLIMS 
 * Description: For maker to delete existing Property Index
 * Copyright: Integro Technologies Sdn Bhd 
 * Author: Andy Wong 
 * Date: Feb 1, 2008
 */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    IPropertyIdxTrxValue trxVal = (IPropertyIdxTrxValue)session.getAttribute("com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxAction.IPropertyIdxTrxValue");
	//	DefaultLogger.debug("this", "delete property index : " + trxVal);
		OBPropertyIdx iProp = (OBPropertyIdx) trxVal.getPrIdx();
		pageContext.setAttribute("obj", iProp);
    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    boolean isRemarkNeeded = false;
    String event = request.getParameter("event");

    List propertySubtypeFullList = (List)request.getAttribute("propertySubtypeFullList");
    List propertySubtypeFullListLabel = (List)request.getAttribute("propertySubtypeFullListLabel"); 
 
    String submitEvent=null;
    String cancelEvent=null;
    String headingLabel="Process ";

    if(event.equals("maker_prepare_resubmit_delete")){
        submitEvent="maker_confirm_resubmit_delete";
        cancelEvent="ToDo.do";
        isRemarkNeeded = true;
    }
    else if(event.equals("maker_prepare_delete")){
        submitEvent="maker_confirm_delete";
        cancelEvent="MaintainPropertyIndex.do?event=property_index_list";
        headingLabel="Delete ";
    }

	PropertyIdxForm propertyValByIdxForm = (PropertyIdxForm)request.getAttribute("PropertyIdxForm");

    String[] selectedPropertySubtypeVals = propertyValByIdxForm.getSelectedPropertySubtype();
    
    DefaultLogger.debug("this", "view property index : " + selectedPropertySubtypeVals.length);
    
    CountryList countryList = CountryList.getInstance();
 
%>

<html>
<head>

<style>
.fixedSelectLength {
    width: 276px;
    COLOR: #000000;
}

.btnHighlight {
	border : 1px solid Purple;
	background-color : #FAF0E6;
	text-align : center;
    width : 85px;
}
</style>

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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}

function submitPage () {

    document.forms[0].event.value='<%=submitEvent%>';
	document.forms[0].submit();
}

function cancelPage(){
    document.forms[0].action="<%=cancelEvent%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<bean:define id="formObj" name="PropertyIdxForm" scope="request" type="com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxForm"/>

<body >
<html:form action="MaintainPropertyIndex.do">
<input type="hidden" name="event" />
<!-- InstanceBeginEditable name="Content" -->
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=headingLabel%><bean:message key="title.property.valuation.by.index.name"/>
      
      <%    if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ISTP )) {        %>
			For States and Types of Property
	  <%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ITP )) {        %>
			For Types of Property
	  <%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ID )) {        %>
			For Districts 
	  <%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IS )) {        %>
			 For States
	  <%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IRH )) {        %>
 			 For All Residential Houses
	  <%   } %>
      
      </h3></td>
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
    </tr>
  </thead>

  <tbody>

  <tr>
      <td colspan="2">
      
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>
          
         <tr class="odd">
              <td width="20%" class="fieldname"><bean:message key="label.property.valuation.by.index.collateral.type"/></td>
              <td>Property</td>
            </tr>
           
            <tr class="even">
              <td width="20%" class="fieldname">
                <bean:message key="label.property.valuation.by.index.property.subtype"/>&nbsp;<font color="#0000FF">*</font>
              </td>
              <td> 
              
              <%
	              for (int i=0; i<selectedPropertySubtypeVals.length; i++) { %>
				  <integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICategoryEntryConstant.SECURITY_SUB_TYPE, selectedPropertySubtypeVals[i])%>"/><br>		
			  <%		
			      }
	          %>	
              
              </td>
            </tr>
            
             <tr class="odd">
              <td width="20%" class="fieldname">
              <bean:message key="label.property.valuation.by.index.country"/>&nbsp;<font color="#0000FF">*</font></td>
              <td>
              	 <integro:empty-if-null value="<%=countryList.getCountryName(propertyValByIdxForm.getCountry())%>"/>
              </td>
            </tr>
             
           &nbsp;</td>
    </tr>
   
</table>
      
   	    </td>
   	 </tr>

   	 <tr>
   	 	<td>
              &nbsp;&nbsp;
         </td>
         <td>
              &nbsp;&nbsp;
         </td>
   	 </tr>
   	 
	   <tr>
		 <td colspan="2">
	      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
	        <thead>
		        <tr>
		          <td width="5%"><bean:message key="label.property.valuation.by.index.sn"/></td>
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
		        </tr>
	        </thead>
	        <tbody>
					       <logic:present name="PropertyIdxForm" property="propertyIdxItemList" scope="request">
	               <bean:define id="itemSize" value="<%= String.valueOf(formObj.getPropertyIdxItemList().size()) %>"/>
	               <% DefaultLogger.debug("----------Property Item List----------", formObj.getPropertyIdxItemList()); %>
	                   <logic:notEqual name="itemSize" value="0">
	                      <logic:iterate id="item" indexId="itemInd" name="PropertyIdxForm"
														property="propertyIdxItemList" scope="request" type="com.integrosys.cms.app.propertyindex.bus.IPropertyIdxItem">
   
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
	                                       		if (!item.getDistrictList().isEmpty()) {
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
	                                       		if (!item.getMukimList().isEmpty()) {
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
												IPropertyIdxPropertyType element = (IPropertyIdxPropertyType) iter.next(); %>
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
	                                       		if (!item.getMukimList().isEmpty()) {
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
	      </tbody>
	    </table>
	    </td>
     </tr>

    <tr>
      <td colspan="2" align="center">&nbsp;</td>
    </tr>
</table>

<p/>
<%if (isRemarkNeeded) {%>
    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
      <tbody>
        <tr>
          <td class="fieldname"><bean:message key="label.remarks"/></td>
          <td class="odd"><textarea name="remarks" rows="4" cols="80"></textarea></td>
        </tr>
        <tr>
          <td class="fieldname"><bean:message key="label.last.action.by"/></td>
          <td class="even">&nbsp;<%=lastActionBy%></td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
          <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
        </tr>
      </tbody>
    </table>
<% } %>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="85">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
    <td> <a href="javascript:submitPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd --></html>
