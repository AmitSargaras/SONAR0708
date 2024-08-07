<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,  
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxForm,
                 com.integrosys.cms.app.propertyindex.bus.OBPropertyIdx,
                 com.integrosys.cms.app.propertyindex.bus.OBPropertyIdxItem,
                 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxItem,
                 com.integrosys.cms.app.propertyindex.trx.IPropertyIdxTrxValue,
                 com.integrosys.cms.app.propertyindex.trx.OBPropertyIdxTrxValue,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxDistrict,
				 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxMukim,
				 com.integrosys.cms.app.propertyindex.bus.IPropertyIdxPropertyType,
				 com.integrosys.cms.app.common.constant.ICategoryEntryConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 java.util.Iterator"
%>

<%
/**
 * Title: CLIMS 
 * Description: For Checker to view Property Index parameter
 * Copyright: Integro Technologies Sdn Bhd 
 * Author: Andy Wong 
 * Date: Jan 30, 2008
 */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	DefaultLogger.debug("trace code", "init -----------------");
    IPropertyIdxTrxValue trxVal = (IPropertyIdxTrxValue)session.getAttribute("com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxAction.IPropertyIdxTrxValue");
	OBPropertyIdx iProp = (OBPropertyIdx) trxVal.getStagingPrIdx();
	pageContext.setAttribute("obj", iProp);
    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    OBPropertyIdx stageOb = (OBPropertyIdx)trxVal.getStagingPrIdx();
    OBPropertyIdx ob = (OBPropertyIdx)trxVal.getPrIdx();
    
    DefaultLogger.debug("trace code - ob is ", ob);
    
    String approveEvent=null;
    String rejectEvent=null;
    
    String event = request.getParameter("event");
    if(event.equals("checker_process_create") || event.equals("checker_confirm_approve_create") || event.equals("checker_confirm_reject_create")){
        approveEvent="checker_confirm_approve_create";
        rejectEvent="checker_confirm_reject_create";
    } else if(event.equals("checker_process_edit") || event.equals("checker_confirm_approve_edit") || event.equals("checker_confirm_reject_edit")){
        approveEvent="checker_confirm_approve_edit";
        rejectEvent="checker_confirm_reject_edit";
        
    } else if(event.equals("checker_process_delete") || event.equals("checker_confirm_approve_delete") || event.equals("checker_confirm_reject_delete")){
        approveEvent="checker_confirm_approve_delete";
        rejectEvent="checker_confirm_reject_edit";
    }
    
    List propertySubtypeFullList = (List)request.getAttribute("propertySubtypeFullList");    
    List propertySubtypeFullListLabel = (List)request.getAttribute("propertySubtypeFullListLabel");    

    PropertyIdxForm propertyValByIdxForm = (PropertyIdxForm)request.getAttribute("PropertyIdxForm");
	String[] selectedPropertySubtypeVals = propertyValByIdxForm.getSelectedPropertySubtype();
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
            border: 1px solid Purple;
            background-color: #FAF0E6;
            text-align: center;
            width: 85px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">

        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p,i,x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }

        function approve() {
            document.forms[0].event.value = '<%=approveEvent%>';
    document.forms[0].submit();
}

function reject(){
    document.forms[0].event.value='<%=rejectEvent%>';
    document.forms[0].submit();
}

</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="MaintainPropertyIndex.do">
<input type="hidden" name="event" value=""/> 
  
<bean:define id="formObj" name="PropertyIdxForm" scope="request" type="com.integrosys.cms.ui.systemparameters.propertyindex.PropertyIdxForm"/>
  
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Process <bean:message key="title.property.valuation.by.index.name"/>
      
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
              <td class="fieldname">
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
              <td width="20%" class="<%=CompareOBUtil.compOB(stageOb,ob,"countryCode")? "fieldname":"fieldnamediff"%>">
              <bean:message key="label.property.valuation.by.index.country"/>&nbsp;<font color="#0000FF">*</font></td>
              <td>
              	 <integro:empty-if-null value="<%=countryList.getCountryName(propertyValByIdxForm.getCountry())%>"/>
              </td>
            </tr>
           
          </tbody>
        </table>
   	    </td>
   	 </tr>

   	 <tr>   	 	
		  <td colspan="2">
              <html:errors property="secsubtypeValdescExistError"/>
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
	               <% if(propertyValByIdxForm.getPropertyIdxItemList() != null){
					    		%>
					       <logic:present name="PropertyIdxForm" property="propertyIdxItemList" scope="request">
	               <bean:define id="itemSize" value="<%= String.valueOf(formObj.getPropertyIdxItemList().size()) %>"/>
	                   <logic:notEqual name="itemSize" value="0">
	                      <logic:iterate id="item" indexId="itemInd" name="PropertyIdxForm"
														property="propertyIdxItemList" scope="request" type="java.lang.Object">
	                                       <% String headerClass = "index";
			                                        IPropertyIdxItem itemList = null;
			                                        if (item instanceof CompareResult) {
			                                            itemList = (IPropertyIdxItem) ((CompareResult) item).getObj();
			                                            headerClass = ((CompareResult) item).getKey();
			                                        } else {
			                                            itemList = (IPropertyIdxItem) item;
			                                        } 
			                                        
			                                        DefaultLogger.debug("----------compare----------", itemList);
			                                    %>
			                                <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
			                                    
			                                   <td class="<%=headerClass%>">
	                                            <%= itemInd.intValue() + 1 %>
	                                       </td>
                                                                               
	                                       <%    if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ISTP )) {        %>
									
										   <td>
										   		<%
	                                       		for (Iterator iter = itemList.getPropertyTypeList().iterator(); iter.hasNext();) {
												IPropertyIdxPropertyType element = (IPropertyIdxPropertyType) iter.next(); %>
												&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.BUILDING_TYPE, element.getPropertyTypeId())%>"/><br>
					  							<%		
					  							}
	                                       		%>	
										   		
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.STATE_CATEGORY_CODE, itemList.getStateCode())%>"/>
	                                       </td>
	                                       <td>
	                                       		<%
	                                       		if (!itemList.getDistrictList().isEmpty()) {
	                                       			for (Iterator iter = itemList.getDistrictList().iterator(); iter.hasNext();) {
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
	                                       		if (!itemList.getMukimList().isEmpty()) {
	                                       			for (Iterator iter = itemList.getMukimList().iterator(); iter.hasNext();) {
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
										   		&nbsp;<integro:empty-if-null value="<%=String.valueOf(itemList.getIdxYear())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, itemList.getIdxType())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=String.valueOf(itemList.getIdxValue())%>"/>
										   </td>
	
										<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ITP )) {        %>
									
											<td>
										   		<%
	                                       		for (Iterator iter = itemList.getPropertyTypeList().iterator(); iter.hasNext();) {
												IPropertyIdxPropertyType element = (IPropertyIdxPropertyType) iter.next(); %>
												&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.BUILDING_TYPE, element.getPropertyTypeId())%>"/><br>		
					  							<%		
					  							}
	                                       		%>	
										   		
	                                       </td>	
											<td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf(itemList.getIdxYear())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, itemList.getIdxType())%>"/>
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=String.valueOf(itemList.getIdxValue())%>"/>
	                                       </td>

									
									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_ID )) {        %>
									
									 		<td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.STATE_CATEGORY_CODE, itemList.getStateCode())%>"/>
	                                       </td>
	                                       <td>
	                                       		<%
	                                       		for (Iterator iter = itemList.getDistrictList().iterator(); iter.hasNext();) {
												IPropertyIdxDistrict element = (IPropertyIdxDistrict) iter.next(); %>
												&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.DISTRICT_CATEGORY_CODE, element.getDistrictCode())%>"/><br>		
					  							<%		
					  							}
	                                       		%>		
	                                       </td>
	                                       <td>  
	                                       		<%
	                                       		if (!itemList.getMukimList().isEmpty()) {
	                                       			for (Iterator iter = itemList.getMukimList().iterator(); iter.hasNext();) {
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
										   		&nbsp;<integro:empty-if-null value="<%=String.valueOf(itemList.getIdxYear())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, itemList.getIdxType())%>"/>
										   </td>
										   <td>
										   		&nbsp;<integro:wrapper value="<%=String.valueOf(itemList.getIdxValue())%>"/>
										   </td>
	


									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IS )) {        %>
									
										  <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.STATE_CATEGORY_CODE, itemList.getStateCode())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf(itemList.getIdxYear())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, itemList.getIdxType())%>"/>
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=String.valueOf(itemList.getIdxValue())%>"/>
	                                       </td>


									<%   } else if (propertyValByIdxForm.getValuationDescription().equals( ICMSConstant.PROP_VAL_DESCR_IRH )) {        %>
 
 											<td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf(itemList.getIdxYear())%>"/>
	                                       </td>
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PROP_IDX_PERIOD, itemList.getIdxType())%>"/>
	                                       </td>	
	                                       <td>
	                                            &nbsp;<integro:wrapper value="<%=String.valueOf(itemList.getIdxValue())%>"/>
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
	              <%}else{%>
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
	              <%}%>
	      </tbody>
	    </table>
	    </td>
     </tr>
  </tbody>
</table>
	  
<p/>
<p/>
<p/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
    <tr>
      <td class="fieldname"><bean:message key="label.remarks"/></td>
      <td class="odd"><html:textarea property="remarks" rows="4" cols="80"/><br><html:errors property="remarks"/></td>
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
  
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
	  <tr>
	    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	  </tr>
	  <tr>
	    <td valign="baseline" align="center">&nbsp;</td>
	  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd --></html>
