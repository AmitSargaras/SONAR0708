<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,                 
                 com.integrosys.cms.app.collateral.bus.type.property.subtype.agricultural.IAgricultural,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral,
				 com.integrosys.cms.ui.collateral.property.PropertyForm,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.collateral.property.RankList,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.CollateralConstant,
                 com.integrosys.cms.ui.collateral.property.propagri.PropAgriForm,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
				 java.util.ArrayList,
                 java.util.Collection,
				 java.util.Iterator,
				 java.util.List,java.text.SimpleDateFormat,java.util.Date,com.integrosys.base.techinfra.util.DateUtil"%>				 

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%  
	 List countryList = null;
	List regionList = null;
	List stateList = null;
	List cityList = null;
	
	List countryList_v3 = null;
	List regionList_v3 = null;
	List stateList_v3 = null;
	List cityList_v3 = null;
	
	List valuationAgencyList = null;
	
	countryList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryList");
	regionList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionList");
	stateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateList");
	cityList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityList");
	
	countryList_v3 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryList_v3");
	regionList_v3 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionList_v3");
	stateList_v3 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateList_v3");
	cityList_v3 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityList_v3");

	valuationAgencyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.valuationAgencyList");

	List preValDateList_v1 = null;
	preValDateList_v1 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.preValDateList_v1");
	
	System.out.println("preValDateList_v1:"+preValDateList_v1);
	pageContext.setAttribute("preValDateList_v1", preValDateList_v1);
	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("stateList", stateList);
	pageContext.setAttribute("cityList", cityList);
	pageContext.setAttribute("valuationAgencyList",valuationAgencyList);
	 
	String todayDate=new SimpleDateFormat("dd/MMM/yyyy").format(new Date());
	System.out.println("todayDate:"+todayDate);
	
	//Boolean disablePreValView=true;
	
	List preValDateList_v3 = null;
	preValDateList_v3 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.preValDateList_v3");
	
	System.out.println("preValDateList_v3:"+preValDateList_v3);
	pageContext.setAttribute("preValDateList_v3", preValDateList_v3);
	pageContext.setAttribute("countryList_v3", countryList_v3);
	pageContext.setAttribute("regionList_v3", regionList_v3);
	pageContext.setAttribute("stateList_v3", stateList_v3);
	pageContext.setAttribute("cityList_v3", cityList_v3);
	
	String version1 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.version1");
	String version3 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.version3");
	
	System.out.println("version1:"+version1+" version3:"+version3); 
%>

<!-- InstanceBeginEditable name="CssStyle" -->

<!--Code Start-->

	<!--Code present here is in file D:\SmartLender Documents\Security Properies\property Code.txt -->
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<!-- 	<td class="fieldname" width="20%">Revaluation Validation Skip</td> -->
			<td class="fieldname" width="20%"><bean:message key="label.security.property.revaluationOverride"/></td>
			
            <%if(null != iCol.getRevalOverride()  && "on".equals(iCol.getRevalOverride().trim())){ %>
				<td width="30%"><input type="checkbox"  name="PropCommGeneralForm" property="revalOverride" styleClass="nonedit" styleId="revalOverride" checked="checked"/></td>
			<%}else{ %>
				<td width="30%"><input type="checkbox"  name="PropCommGeneralForm" property="revalOverride" styleClass="nonedit" styleId="revalOverride" /></td>
			<%} %>
		    <td  width="20%"></td>
			<td width="30%"></td>
		
		</tr>
		</table>
		</td>
	</tr>
 </tbody>
</table>
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.property.valuation1"/><br/><html:errors property="valuation1NeedRevaluation"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname" width="20%"><bean:message key="label.security.property.previous.valuation.date"/></td>
			<td width="30%"><html:select name="PropCommGeneralForm" property="preValDate_v1"  styleId="preValDate_v1">
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="preValDateList_v1" labelProperty="label" property="value" />
              	</html:select>&nbsp;
			     <html:button property="previousValView" styleId="previousValView" value="View" onclick="viewPreviousValuation()"/>
			</td>
		    <td class="fieldname" width="20%"><bean:message key="label.security.property.revaluation"/></td>
			<td width="30%"><html:button property="revaluationAdd1" styleId="revaluationAdd1" value="Add" onclick="addRevaluation1()"/>&nbsp;
			<html:text property="valcreationdate_v1"  styleId="valcreationdate_v1" readonly="true" />
			</td>
		<html:hidden property="val1_id" styleId="val1_id"/>
		
		<html:hidden property="version1" styleId="version1"/>
		<%-- <html:hidden property="valcreationdate_v1"/> --%>
		</tr>
		</table>
		</td>
	</tr>
 </tbody>
</table>
	
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="title.property.information"/></h3></td>
   </tr>        
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname" width="20%">Total Property Amount <span class="mandatoryPerfection"> * </span></td>
			<td width="30%">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="totalPropertyAmount_v1_InNum" property="totalPropertyAmount_v1"
							 styleId="totalPropertyAmount_v1" onblur="javascript:formatAmountAsCommaSeparated(this)" readonly="true"/>
						</td>
						<td style="border:none">
			 				<textarea id="totalPropertyAmount_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<html:errors property="totalPropertyAmount_v1"/>
			</td>
			<td class="fieldname" width="20%">Date of Valuation <span class="mandatoryPerfection"> * </span></td>
			<td width="30%"><html:text property="valuationDate_v1"  styleId="valuationDate_v1" readonly="true" onchange="calNextDate2()" />
			<img src="img/calendara.gif"  name="Image12" border="0" id="ImageValuationDate_v1" 
                onclick="return showCalendar('valuationDate_v1', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image12','','img/calendarb.gif',1)"/>
               
             <html:errors property="valuationDate_v1"/></td>
				</tr>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Valuation Company&nbsp;<span class="mandatoryPerfection">*&nbsp;</span></td>
			<td>
				<html:select name="PropCommGeneralForm" property="valuatorCompany_v1"  styleId="valuatorCompany_v1">
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="valuationAgencyList" labelProperty="label" property="value" />
              	</html:select>
              	<br/><html:errors property="valuatorCompany_v1"/>
			</td>
			
			<td class="fieldname">Category of Land Used </td>
			
             <td>
             	<html:select property="categoryOfLandUse_v1" styleId="categoryOfLandUse_v1">
              	<integro:common-code
                  		categoryCode="<%=CategoryCodeConstant.CATEGORY_OF_LAND_USE%>" descWithCode="false"/>
              </html:select>
                 <html:errors property="categoryOfLandUse_v1"/></td>
			
		</tr>	

	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.dev.occu.name"/>&nbsp;
			</td>
			<td>
				<html:text property="developerName_v1" size="65" styleId="developerName_v1"></html:text>
				<html:errors property="developerName_v1" /></td>		
	</tr>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
		
			<td class="fieldname"> <bean:message key="label.security.country"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      <td><html:select name="PropCommGeneralForm" property="country_v1" styleId="country_v1" onchange="javascript:refreshRegionId(this)">
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="countryList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="country_v1"/> </td>           
			 
			 		<td class="fieldname"> <bean:message key="label.security.region"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="region_v1"  styleId="region_v1" onchange="javascript:refreshStateId(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
                  		</html:select>
	                <html:errors property="region_v1"/> </td>
	     </tr> 
			 
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">          
			 		
			 		<td class="fieldname"> <bean:message key="label.security.state"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="locationState_v1"  styleId="locationState_v1" onchange="javascript:refreshCityId(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="stateList" labelProperty="label" property="value" />
                  		</html:select>
	                <html:errors property="locationState_v1"/> </td>
	                
			 	 <td class="fieldname"> <bean:message key="label.security.city"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="nearestCity_v1" styleId="nearestCity_v1"  >
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="cityList" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="nearestCity_v1"/> </td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Pincode <span class="mandatoryPerfection"> * </span></td>
			<td ><html:text property="pinCode_v1" size="10" maxlength="6" styleId="pinCode_v1" />
				<br /><html:errors property="pinCode_v1"/>
				<html:errors property="pincodeError_v1"/>
				<html:errors property="postcodeError_v1"/>
			</td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.land.area"/>
				<%if((subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
						|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN))){ %>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
				</td>
			<td><%int type=1; %>
			<html:text property="landArea_v1" styleId="landArea_v1" size="34" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet(landArea_v1,landUOM_v1,'land');"/>&nbsp;
			<html:errors property="landAreaLengthError_v1" />
			
			    <html:select property="landUOM_v1" styleId="landUOM_v1" onchange="convertToSqfeet(landArea_v1,landUOM_v1,'land');">
			    <option value="" ><bean:message key="label.please.select"/> </option>
			    	<html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
			    </html:select>
			    &nbsp;<html:errors property="landUOM_v1" />
			   <%--  <html:errors property="landAreaUomError_v1" /> --%>&nbsp;</td>
			    
			   <td class="fieldname">
				<bean:message key="label.security.property.land.area.sqft"/></td>
		  	<td><html:text property="inSqftLandArea_v1" styleId="inSqftLandArea_v1" size="25" maxlength="30" readonly="true"/>&nbsp;
				Sq.ft</td> 
			  
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
		<%if(!(subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
				|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN))){ %>
			<td class="fieldname">
				<bean:message key="label.security.property.build.up.area"/>
				<span class="mandatoryPerfection" id="builtupArea_v1MandatoryID" >*</span></td>
			<td><%type=2; %>			<html:text property="builtupArea_v1"  styleId="builtupArea_v1"  size="25" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet(builtupArea_v1,builtUpAreaUnit_v1,'builtUp');"/>&nbsp;
			<html:errors property="builtupAreaLengthError_v1" />
			    <html:select property="builtUpAreaUnit_v1"  styleId="builtUpAreaUnit_v1" onchange="convertToSqfeet(builtupArea_v1,builtUpAreaUnit_v1,'builtUp');" >
			     <option value="" ><bean:message key="label.please.select"/> </option>
				    <html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
				    </html:select>
			     &nbsp; <html:errors property="builtUpAreaUnit_v1" />
			     <html:errors property="builtUpAreaUomError_v1" /></td>
		<%}else{ %>
			<td class="fieldname"> &nbsp;</td>
			<td >&nbsp;</td>
		<%} %>		
		
		<td class="fieldname">
				<bean:message key="label.security.property.build.up.area.sqft"/></td>
		  	<td><html:text property="inSqftBuiltupArea_v1"  styleId="inSqftBuiltupArea_v1" size="25" maxlength="30" readonly="true"/> 
		  	&nbsp;
				Sq.ft</td>
		</tr>
		
		
		<!-- Start Santosh -->
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Land Value <span id="mandatorylandValue_v1" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="landValue_v1_InNum" onblur="dispAmtInWords(this)" property="landValue_v1" onkeypress="return onlyNos(event,this);"  styleId="landValue_v1" 
							onchange="totalValue();"/>
						</td>
						<td style="border:none">
			 				<textarea id="landValue_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<html:errors property="landValue_v1"/>
			</td>
			<td class="fieldname">
				Building Value <span id="mandatoryBuildingValue_v1" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="buildingValue_v1_InNum" onblur="dispAmtInWords(this)" property="buildingValue_v1" 
							onkeypress="return onlyNos(event,this);" onchange="totalValue();" styleId="buildingValue_v1" />
						</td>
						<td style="border:none">
			 				<textarea id="buildingValue_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<html:errors property="buildingValue_v1"/>
			</td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Reconstruction value of the Building <span id="mandatoryReconstructionValueOfTheBuilding_v1" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="reconstructionValueOfTheBuilding_v1_InNum" onblur="dispAmtInWords(this)" property="reconstructionValueOfTheBuilding_v1" 
							onkeypress="return onlyNos(event,this);" onchange="totalValue();" styleId="reconstructionValueOfTheBuilding_v1" />
						</td>
						<td style="border:none">
			 				<textarea id="reconstructionValueOfTheBuilding_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<html:errors property="reconstructionValueOfTheBuilding_v1"/>
			</td>
				<td class="fieldname">
				<bean:message key="label.security.property.completion.status"/></td>
		  	<td><html:select property="propertyCompletionStatus_v1" onchange="getlag(1)" styleId="propertyCompletionStatus_v1ID" >
					<option value=""><bean:message key="label.please.select"/> </option>
					<html:options name="propertyCompletionStatusValue" labelName="propertyCompletionStatusLabel"/>
				</html:select>&nbsp;
				<html:errors property="propertyCompletionStatus_v1"/></td>
		
		</tr>
		<!-- End Santosh -->
</table>
</td></tr></tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.additional.information"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.phy.verification"/><font color="red">*</font>&nbsp;</td>
    <td>
    <%if( null!=colForm.getIsPhysInsp_v1() || !"".equals(colForm.getIsPhysInsp_v1())){ %>
          <html:radio property="isPhysInsp_v1" styleId="isPhysInsp_v1" value="true" onclick="enable(1)" ><bean:message key="label.common.yes"/></html:radio> &nbsp;&nbsp;
        <html:radio property="isPhysInsp_v1" styleId="isPhysInsp_v1" value="false" onclick="disable(1)">
        <bean:message key="label.common.no"/></html:radio>
       <%}else{ %>
       <input type="radio" name="isPhysInsp_v1" styleId="isPhysInsp_v1" value="true" onclick="enable(1)" checked="checked">Yes</input>
			<input type="radio" name="isPhysInsp_v1" styleId="isPhysInsp_v1" value="false" onclick="disable(1)" >No</input>
       <%} %>
        <html:errors property="isPhysInsp_v1"/></td>
    <td class="fieldname">
        <bean:message key="label.security.phy.verification.frequency"/><font color="red">*</font>&nbsp;
         <font color="#0000FF"><span id="show1" class="mandatoryPerfection">&nbsp;</span></font></td>
         <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){ %>
    <td id="chknumBulk" >
         <html:select property="physInspFreqUOM_v1" styleId="physInspFreqUOM_v1" onchange="calNextDate(1)">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM_v1"/></td>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){ %>
        <td id="chknumBulk" >
   
         <html:select property="physInspFreqUOM_v1" styleId="physInspFreqUOM_v1" disabled="true" onchange="calNextDate(1)">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM_v1"/></td>
        <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){ %>
        <td id="chknumBulk" >
   
         <html:select property="physInspFreqUOM_v1" styleId="physInspFreqUOM_v1" disabled="true" onchange="calNextDate(1)">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM_v1"/></td>
        <%} %>
        
        
            
</tr>

       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
        <bean:message key="label.security.last.phy.verification.date"/><font color="red">*</font>&nbsp;
        <span id="spanPID" style="visibility:hidden"></span></td>
       <td>  <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){ %>   			
   			
         <html:text property="datePhyInspec_v1" styleId="datePhyInspec_v1" readonly="true" size="15" maxlength="11" onchange="calNextDate(1)"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy1" onclick="return showCalendar('datePhyInspec_v1', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="datePhyInspec_v1"/>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){  %>
           <html:text property="datePhyInspec_v1" styleId="datePhyInspec_v1" readonly="true" size="15" maxlength="11" onchange="calNextDate(1)"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy1" onclick="return showCalendar('datePhyInspec_v1', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        <html:errors property="datePhyInspec_v1"/>
    <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){  %>
     <html:text property="datePhyInspec_v1" styleId="datePhyInspec_v1" readonly="true" size="15" maxlength="11" onchange="calNextDate(1)"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy1" onclick="return showCalendar('datePhyInspec_v1', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="datePhyInspec_v1"/>
    <%} %></td>
    <td class="fieldname"><bean:message key="label.security.next.phy.verification.date"/><font color="red">*</font>
    </td>
  <td>  <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){ %>   			
   			
         <html:text property="nextPhysInspDate_v1" styleId="nextPhysInspDate_v1" readonly="true" size="15" maxlength="11"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns1" onclick="return showCalendar('nextPhysInspDate_v1', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="nextPhysInspDateError_v1"/>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){  %>
           <html:text property="nextPhysInspDate_v1" styleId="nextPhysInspDate_v1" readonly="true" size="15" maxlength="11" />
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns1" onclick="return showCalendar('nextPhysInspDate_v1', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        <html:errors property="nextPhysInspDateError_v1"/>
    <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v1())){  %>
     <html:text property="nextPhysInspDate_v1" styleId="nextPhysInspDate_v1" readonly="true" size="15" maxlength="11"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns1" onclick="return showCalendar('nextPhysInspDate_v1', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="nextPhysInspDateError_v1"/>
    <%} %></td>
   
	 <%--<td><html:text property="nextPhysInspDate_v1" size="15" maxlength="11" disabled="true"/></td>--%>
</tr>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">              
			<td class="fieldname">
			<bean:message key="label.remarks"/></td>
			<td colspan="3"><html:textarea property="remarksProperty_v1" styleId="remarksProperty_v1" rows="5" cols="120" style="width:100%" />&nbsp;
		                <html:errors property="remarksProperty_v1"/>&nbsp;</td>
		</tr>
		</table>
	</td></tr>
	</tbody>
</table>
<%@ include file="/collateral/property/update_propVal2Uncom.jsp" %>
<!-- Valuation 3 starts -->

	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.property.valuation3"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname" width="20%"><bean:message key="label.security.property.previous.valuation.date"/></td>
			<td width="30%"><html:select name="PropCommGeneralForm" property="preValDate_v3"  styleId="preValDate_v3">
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="preValDateList_v3" labelProperty="label" property="value" />
              	</html:select>&nbsp;
			     <html:button property="previousValView3" styleId="previousValView3" value="View" onclick="viewPreviousValuation3()"/>
			</td>
		    <td class="fieldname" width="20%"><bean:message key="label.security.property.revaluation"/></td>
			<td width="30%"><html:button property="revaluationAdd3" styleId="revaluationAdd3" value="Add" onclick="addRevaluation3()"/>&nbsp;
			<html:text property="valcreationdate_v3"  styleId="valcreationdate_v3" readonly="true" />&nbsp;
			<html:errors property="valCreationdate_v3"/>
			</td>
		<html:hidden property="val3_id" styleId="val3_id"/>
		
		<html:hidden property="version3" styleId="version3"/>
		<%-- <html:hidden property="valcreationdate_v3"/> --%>
		</tr>
		</table>
		</td>
	</tr>
 </tbody>
</table>
	
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="title.property.information"/></h3></td>
   </tr>        
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname" width="20%">Total Property Amount <span class="mandatoryPerfection"> * </span></td>
			<td width="30%">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="totalPropertyAmount_v3_InNum nonedit"  property="totalPropertyAmount_v3" styleId="totalPropertyAmount_v3" 
							onblur="javascript:formatAmountAsCommaSeparated(this)" readonly="true"/>	
						</td>
						<td style="border:none">
			 				<textarea id="totalPropertyAmount_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>	
				<html:errors property="totalPropertyAmount_v3"/>
			</td>
			<td class="fieldname" width="20%">Date of Valuation <span class="mandatoryPerfection"> * </span></td>
			<td width="30%"><html:text property="valuationDate_v3" styleClass="nonedit" styleId="valuationDate_v3" readonly="true" onchange="calNextDate2()" />
			<img src="img/calendara.gif"  name="Image12" border="0" id="ImageValuationDate_v3" 
                onclick="return showCalendar('valuationDate_v3', 'dd/mm/y');" 
                onmouseover="MM_swapImage('Image12','','img/calendarb.gif',1)"/>
               
             <html:errors property="valuationDate_v3"/></td>
				</tr>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Valuation Company&nbsp;<span class="mandatoryPerfection">*&nbsp;</span></td>
			<td>
				<html:select name="PropCommGeneralForm" styleClass="nonedit" property="valuatorCompany_v3"  styleId="valuatorCompany_v3">
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="valuationAgencyList" labelProperty="label" property="value" />
              	</html:select>
              	<br/><html:errors property="valuatorCompany_v3"/>
			</td>
			
			<td class="fieldname">Category of Land Used </td>
			
             <td>
             	<html:select property="categoryOfLandUse_v3" styleClass="nonedit" styleId="categoryOfLandUse_v3">
              	<integro:common-code
                  		categoryCode="<%=CategoryCodeConstant.CATEGORY_OF_LAND_USE%>" descWithCode="false"/>
              </html:select>
                 <html:errors property="categoryOfLandUse_v3"/></td>
			
		</tr>	

	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.dev.occu.name"/>&nbsp;
			</td>
			<td>
				<html:text property="developerName_v3" size="65" styleClass="nonedit" styleId="developerName_v3"></html:text>
				<html:errors property="developerName_v3" /></td>		
	</tr>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
		
			<td class="fieldname"> <bean:message key="label.security.country"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      <td><html:select name="PropCommGeneralForm" styleClass="nonedit" property="country_v3" styleId="country_v3" onchange="javascript:refreshRegionId3(this)">
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="countryList_v3" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="country_v3"/> </td>           
			 
			 		<td class="fieldname"> <bean:message key="label.security.region"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="region_v3" styleClass="nonedit" styleId="region_v3" onchange="javascript:refreshStateId3(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="regionList_v3" labelProperty="label" property="value" /> 
                  		</html:select>
	                <html:errors property="region_v3"/> </td>
	     </tr> 
			 
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">          
			 		
			 		<td class="fieldname"> <bean:message key="label.security.state"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="locationState_v3" styleClass="nonedit" styleId="locationState_v3" onchange="javascript:refreshCityId3(this)">
                  			<option value=""><bean:message key="label.please.select"/></option>
                  			<html:options collection="stateList_v3" labelProperty="label" property="value" />
                  		</html:select>
	                <html:errors property="locationState_v3"/> </td>
	                
			 	 <td class="fieldname"> <bean:message key="label.security.city"/>&nbsp;
	            	<span class="mandatoryPerfection">*&nbsp;</span></td>          
			      	<td><html:select name="PropCommGeneralForm" property="nearestCity_v3" styleClass="nonedit" styleId="nearestCity_v3"  >
	                  		<option value=""><bean:message key="label.please.select"/></option>
	                  		<html:options collection="cityList_v3" labelProperty="label" property="value" />
	                  	</html:select>
	                <html:errors property="nearestCity_v3"/> </td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Pincode <span class="mandatoryPerfection"> * </span></td>
			<td ><html:text property="pinCode_v3" size="10" maxlength="6" styleClass="nonedit" styleId="pinCode_v3" />
				<br /><html:errors property="pinCode_v3"/>
				<html:errors property="pincodeError_v3"/>
				<html:errors property="postcodeError_v3"/>
			</td>
			</tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.land.area"/>
				<%if((subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
						|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN))){ %>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
				</td>
			<td><%type=1; %>
			<html:text property="landArea_v3" styleClass="nonedit" styleId="landArea_v3" size="34" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet3(landArea_v3,landUOM_v3,'land');"/>&nbsp;
			<html:errors property="landAreaLengthError_v3" />
			
			    <html:select property="landUOM_v3" styleClass="nonedit" styleId="landUOM_v3" onchange="convertToSqfeet3(landArea_v3,landUOM_v3,'land');">
			    <option value="" ><bean:message key="label.please.select"/> </option>
			    	<html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
			    </html:select>
			    &nbsp;<html:errors property="landUOM_v3" />
			   <%--  <html:errors property="landAreaUomError_v3" /> --%>&nbsp;</td>
			    
			   <td class="fieldname">
				<bean:message key="label.security.property.land.area.sqft"/></td>
		  	<td><html:text property="inSqftLandArea_v3" styleClass="nonedit" styleId="inSqftLandArea_v3" size="25" maxlength="30" readonly="true"/>&nbsp;
				Sq.ft</td> 
			  
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
		<%if(!(subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
				|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN))){ %>
			<td class="fieldname">
				<bean:message key="label.security.property.build.up.area"/>
				<span class="mandatoryPerfection" id="builtupArea_v3MandatoryID" >*</span></td>
			<td><%type=2; %>			<html:text property="builtupArea_v3" styleClass="nonedit"  styleId="builtupArea_v3"  size="25" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet3(builtupArea_v3,builtUpAreaUnit_v3,'builtUp');"/>&nbsp;
			<html:errors property="builtupAreaLengthError_v3" />
			    <html:select property="builtUpAreaUnit_v3" styleClass="nonedit" styleId="builtUpAreaUnit_v3" onchange="convertToSqfeet3(builtupArea_v3,builtUpAreaUnit_v3,'builtUp');" >
			     <option value="" ><bean:message key="label.please.select"/> </option>
				    <html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
				    </html:select>
			     &nbsp; <html:errors property="builtUpAreaUnit_v3" />
			     <html:errors property="builtUpAreaUomError_v3" /></td>
		<%}else{ %>
			<td class="fieldname"> &nbsp;</td>
			<td >&nbsp;</td>
		<%} %>		
		
		<td class="fieldname">
				<bean:message key="label.security.property.build.up.area.sqft"/></td>
		  	<td><html:text property="inSqftBuiltupArea_v3" styleId="inSqftBuiltupArea_v3" size="25" maxlength="30" readonly="true"/> 
		  	&nbsp;
				Sq.ft</td>
		</tr>
		
		
		<!-- Start Santosh -->
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Land Value <span id="mandatorylandValue_v3" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="landValue_v3_InNum nonedit" onblur="dispAmtInWords(this)" property="landValue_v3" onkeypress="return onlyNos(event,this);" 
							 styleId="landValue_v3" onchange="totalValue3();"/>
						</td>
						<td style="border:none">
			 				<textarea id="landValue_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<html:errors property="landValue_v3"/>
			</td>
			<td class="fieldname">
				Building Value <span id="mandatoryBuildingValue_v3" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="buildingValue_v3_InNum nonedit" onblur="dispAmtInWords(this)" property="buildingValue_v3"
							 onkeypress="return onlyNos(event,this);" onchange="totalValue3();" styleId="buildingValue_v3" />
						</td>
						<td style="border:none">
			 				<textarea id="buildingValue_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<html:errors property="buildingValue_v3"/>
			</td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Reconstruction value of the Building <span id="mandatoryReconstructionValueOfTheBuilding_v3" class="mandatoryPerfection"> * </span>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
						<td style="border:none">
							<html:text styleClass="reconstructionValueOfTheBuilding_v3_InNum nonedit" onblur="dispAmtInWords(this)" 
							property="reconstructionValueOfTheBuilding_v3" onkeypress="return onlyNos(event,this);" onchange="totalValue3();" styleId="reconstructionValueOfTheBuilding_v3" />
						</td>
						<td style="border:none">
			 				<textarea id="reconstructionValueOfTheBuilding_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
				<html:errors property="reconstructionValueOfTheBuilding_v3"/>
			</td>
				<td class="fieldname">
				<bean:message key="label.security.property.completion.status"/></td>
		  	<td><html:select property="propertyCompletionStatus_v3" onchange="getlag(3)" styleClass="nonedit" styleId="propertyCompletionStatus_v3ID" >
					<option value=""><bean:message key="label.please.select"/> </option>
					<html:options name="propertyCompletionStatusValue" labelName="propertyCompletionStatusLabel"/>
				</html:select>&nbsp;
				<html:errors property="propertyCompletionStatus_v3"/></td>
		
		</tr>
		<!-- End Santosh -->
</table>
</td></tr></tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.additional.information"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.phy.verification"/><font color="red">*</font>&nbsp;</td>
    <td>
    <%
    System.out.println("colForm.getIsPhysInsp_v3()====="+colForm.getIsPhysInsp_v3());
    if( null!=colForm.getIsPhysInsp_v3() || !"".equals(colForm.getIsPhysInsp_v3())){ %>
          <html:radio property="isPhysInsp_v3" styleClass="nonedit" styleId="isPhysInsp_v3" value="true" onclick="enable(3)" ><bean:message key="label.common.yes"/></html:radio> &nbsp;&nbsp;
        <html:radio property="isPhysInsp_v3" styleClass="nonedit" styleId="isPhysInsp_v3" value="false" onclick="disable(3)">
        <bean:message key="label.common.no"/></html:radio>
       <%}else{ %>
       <input type="radio" name="isPhysInsp_v3" styleId="isPhysInsp_v3" value="true" onclick="enable(3)" checked="checked">Yes</input>
			<input type="radio" name="isPhysInsp_v3" styleId="isPhysInsp_v3" value="false" onclick="disable(3)" >No</input>
       <%} %>
        <html:errors property="isPhysInsp_v3"/></td>
    <td class="fieldname">
        <bean:message key="label.security.phy.verification.frequency"/><font color="red">*</font>&nbsp;
         <font color="#0000FF"><span id="show1" class="mandatoryPerfection">&nbsp;</span></font></td>
         <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){ %>
    <td id="chknumBulk" >
         <html:select property="physInspFreqUOM_v3" styleClass="nonedit" styleId="physInspFreqUOM_v3" onchange="calNextDate(3)">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM_v3"/></td>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){ %>
        <td id="chknumBulk" >
   
         <html:select property="physInspFreqUOM_v3" styleClass="nonedit" styleId="physInspFreqUOM_v3" disabled="true" onchange="calNextDate(3)">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM_v3"/></td>
        <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){ %>
        <td id="chknumBulk" >
   
         <html:select property="physInspFreqUOM_v3" styleClass="nonedit" styleId="physInspFreqUOM_v3" disabled="true" onchange="calNextDate(3)">
			            <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"
									descWithCode="false" />
			        </html:select>&nbsp;
        <html:errors property="physInspFreqUOM_v3"/></td>
        <%} %>
        
        
            
</tr>

       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
        <bean:message key="label.security.last.phy.verification.date"/><font color="red">*</font>&nbsp;
        <span id="spanPID" style="visibility:hidden"></span></td>
       <td>  <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){ %>   			
   			
         <html:text property="datePhyInspec_v3" styleClass="nonedit" styleId="datePhyInspec_v3" readonly="true" size="15" maxlength="11" onchange="calNextDate(3)"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy3" onclick="return showCalendar('datePhyInspec_v3', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="datePhyInspec_v3"/>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){  %>
           <html:text property="datePhyInspec_v3" styleClass="nonedit" styleId="datePhyInspec_v3" readonly="true" size="15" maxlength="11" onchange="calNextDate(3)"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy3" onclick="return showCalendar('datePhyInspec_v3', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        <html:errors property="datePhyInspec_v3"/>
    <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){  %>
     <html:text property="datePhyInspec_v3" styleClass="nonedit" styleId="datePhyInspec_v3" readonly="true" size="15" maxlength="11" onchange="calNextDate(3)"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="datePhy3" onclick="return showCalendar('datePhyInspec_v3', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="datePhyInspec_v3"/>
    <%} %></td>
    <td class="fieldname"><bean:message key="label.security.next.phy.verification.date"/><font color="red">*</font>
    </td>
  <td>  <%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){ %>   			
   			
         <html:text property="nextPhysInspDate_v3" styleClass="nonedit" styleId="nextPhysInspDate_v3" readonly="true" size="15" maxlength="11"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns3" onclick="return showCalendar('nextPhysInspDate_v3', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="nextPhysInspDateError_v3"/>
        <%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){  %>
           <html:text property="nextPhysInspDate_v3" styleClass="nonedit" styleId="nextPhysInspDate_v3" readonly="true" size="15" maxlength="11" />
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns3" onclick="return showCalendar('nextPhysInspDate_v3', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        <html:errors property="nextPhysInspDateError_v3"/>
    <%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v3())){  %>
     <html:text property="nextPhysInspDate_v3" styleClass="nonedit" styleId="nextPhysInspDate_v3" readonly="true" size="15" maxlength="11"/>
        <input type="image" src="img/calendara.gif" name="Image723" id="dateIns3" onclick="return showCalendar('nextPhysInspDate_v3', 'dd/mm/y')"
   			  onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        <html:errors property="nextPhysInspDateError_v3"/>
    <%} %></td>
   
	 <%--<td><html:text property="nextPhysInspDate_v3" size="15" maxlength="11" disabled="true"/></td>--%>
</tr>
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">              
			<td class="fieldname">
			<bean:message key="label.remarks"/></td>
			<td colspan="3"><html:textarea property="remarksProperty_v3" styleClass="nonedit" styleId="remarksProperty_v3" rows="5" cols="120" style="width:100%" />&nbsp;
		                <html:errors property="remarksProperty_v3"/>&nbsp;</td>
		</tr>
		</table>
	</td></tr>
	</tbody>
</table>

<!-- Valuation 3 ends -->

<!--Code End-->
<script>


function getlag(idx){
	var str = document.getElementById("propertyCompletionStatus_v" + idx) ? document.getElementById("propertyCompletionStatus_v" + idx).value:"";
	if(str=='N'){
		if(document.getElementById("mandatoryCompStage"))
			document.getElementById("mandatoryCompStage").style.visibility='visible';
	}else{
		if(document.getElementById("mandatoryCompStage"))
			document.getElementById("mandatoryCompStage").style.visibility='hidden';
	}
	
	if(str=="C"||str=="F"){
		document.getElementById("builtupArea_v"+ idx + "MandatoryID").style.visibility='visible';
	}else{
		document.getElementById("builtupArea_v"+ idx + "MandatoryID").style.visibility='hidden';
	}
}

function setVisibility(elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
}

function refreshRegionId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 if(curSel==""){
		clearDisplayDropdown('locationState_v1');
		clearDisplayDropdown('nearestCity_v1');
}
 var dep = 'region_v1';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_region_id&countryId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function refreshStateId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 if(curSel==""){
	clearDisplayDropdown('nearestCity_v1');
 }
 var dep = 'locationState_v1';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshCityId(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'nearestCity_v1';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function refreshRegionId3(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 if(curSel==""){
		clearDisplayDropdown('locationState_v3');
		clearDisplayDropdown('nearestCity_v3');
}
 var dep = 'region_v3';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_region_id_v3&countryId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshStateId3(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 if(curSel==""){
	clearDisplayDropdown('nearestCity_v3');
 }
 var dep = 'locationState_v3';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_state_id_v3&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshCityId3(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'nearestCity_v3';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_city_id_v3&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function calLowestVerOnAmount(){
	var landValue_v1= parseFloat((document.getElementById('landValue_v1').value).replace(/,/g , ''));
	var buildingValue_v1= parseFloat((document.getElementById('buildingValue_v1').value).replace(/,/g , ''));
		
	var landValue_v2= parseFloat((document.getElementById('landValue_v2').value).replace(/,/g , ''));
	var buildingValue_v2= parseFloat((document.getElementById('buildingValue_v2').value).replace(/,/g , ''));
			
	var landValue_v3= parseFloat((document.getElementById('landValue_v3').value).replace(/,/g , ''));
	var buildingValue_v3= parseFloat((document.getElementById('buildingValue_v3').value).replace(/,/g , ''));
				
		 var val1_version=document.getElementById("version1").value;
		 var val2_version=document.getElementById("version2").value;
		 var val3_version=document.getElementById("version3").value;
		 //alert(val1_version+","+val2_version+","+val3_version);
		var waiver_var=document.getElementById("waiver").checked;
		var deferral_var=document.getElementById("deferral").checked;
		
		//alert("landValue_v1:"+landValue_v1);
		
	var	total1=landValue_v1+buildingValue_v1;
		
		var total2=landValue_v2+buildingValue_v2;
	 

		var total3=landValue_v3+buildingValue_v3;
		
		var maxValue;
		if(waiver_var==true || deferral_var == true){
		
		 maxValue=Math.max(val1_version,val3_version);
		}else{
		 maxValue=Math.max(val1_version,val2_version,val3_version);
		}
		//alert("total1:"+total1+" total2:"+total2+" total3:"+total3+" maxValue:"+maxValue);
		//alert("maxValue:"+maxValue+" valCreation1:"+valCreation1+" valCreation2:"+valCreation2+" valCreation3:"+valCreation3+" waiver_var:"+waiver_var+" deferral_var:"+deferral_var);
		
		var val1IsAdded=false;
		var val2IsAdded=false;
		var val3IsAdded=false;
		
		if(maxValue==val1_version && total1>0){
			val1IsAdded=true;
		//	alert("inside condition1");
			
		}
		if (maxValue==val2_version && waiver_var==false && deferral_var == false && total2>0){
			val2IsAdded=true;
		//	alert("inside condition2");

		}
		 if (maxValue==val3_version && total3>0){
			val3IsAdded=true;
		//	alert("inside condition2");
		
		}
		//alert("val1IsAdded:"+val1IsAdded+" val2IsAdded:"+val2IsAdded+" val3IsAdded:"+val3IsAdded+" total1:"+total1+" total2:"+total2+" total3:"+total3);
		var val="";
		if(val1IsAdded && val2IsAdded && val3IsAdded ) {

			if(total1==total2 && total1==total3) {
				val= "1";
			}else if(total1>total2)  {
				if(total2<total3)  {
				
				val= "2";
				}else if(total2==total3){
					val= "2";
				}else if (total2>total3)  {
					
					val= "3";
					}
			}else if(total1==total2)  {
				if(total1>total3)  {
				
				val= "3";
				}else if(total1==total3){
					val= "1";
				}else if (total1<total3)  {
					
					val= "1";
					}
			}else if(total1<total2)  {
				if(total1<total3)  {
				
				val= "1";
				}else if(total1==total3){
					val= "1";
				}else if (total1>total3)  {
					
					val= "3";
					}
			}
		
		}else if(val1IsAdded && val2IsAdded) {
			if(total1==total2) {
				val= "1";
			}	
			else if(total1<total2)  {
				
				val= "1";
				
			}else if (total2<total1)  {
				
				val= "2";
				}
		}else if(val1IsAdded && val3IsAdded) {
			if(total1==total3) {
				val= "1";
			}	
			else if(total1<total3)  {
				
				val= "1";
				
			}else if (total3<total1)  {
				
				val= "3";
				}
			
		}else if(val2IsAdded && val3IsAdded) {
			if(total2==total3) {
				val= "2";
			}	
			else if(total2<total3)  {
				
				val= "2";
				
			}else if (total3<total2)  {
				
				val= "3";
				}
			
		}else if(val1IsAdded) {
			val= "1";
		}else if(val2IsAdded) {
			val= "2";
		}else if(val3IsAdded) {
			val= "3";
		}
		
		return val;
		 }

function calNextDate2(){
	var frequency=document.getElementById("commonRevalFreq").value;
	var day=document.forms[0].valuationDate_v1.value;

var day2=document.forms[0].valuationDate_v2.value;
var day3=document.forms[0].valuationDate_v3.value;
/* var dayDate='';
var day2Date='';
var day3Date='';
var dayTime='';
var day2Time='';
var day3Time='';
if(day!==''){
	//alert("inside day:"+day);
 dayDate = new Date(day.substring(7,11),calculatemonth(day.substring(3,6)),day.substring(0,2));
 dayTime=dayDate.getTime();
// alert("inside dayDate:"+dayDate);
}
if(day2!==''){
	var month2=calculatemonth(day2.substring(3,6));
	day2Date = new Date(day2.substring(7,11),calculatemonth(day2.substring(3,6)),day2.substring(0,2));
	day2Time=day2Date.getTime();
	}
if(day3!==''){
	var month3=calculatemonth(day3.substring(3,6));
	day3Date = new Date(day3.substring(7,11),calculatemonth(day3.substring(3,6)),day3.substring(0,2));
	day3Time=day3Date.getTime();
	}
//alert("dayDate:"+dayDate+" day2Date:"+day2Date+" day3Date:"+day3Date+" dayTime:"+dayTime+" day2Time:"+day2Time+" day3Time:"+day3Time);

var maxValue;
var val1_version=document.getElementById("version1").value;
var val2_version=document.getElementById("version2").value;
var val3_version=document.getElementById("version3").value;
alert(val1_version+","+val2_version+","+val3_version);
var waiver_var=document.getElementById("waiver").checked;
var deferral_var=document.getElementById("deferral").checked;

if(waiver_var==true || deferral_var == true){
	
	 maxValue=Math.max(val1_version,val3_version);
	}else{
	 maxValue=Math.max(val1_version,val2_version,val3_version);
	}
	
var val1IsAdded=false;
var val2IsAdded=false;
var val3IsAdded=false;


if(maxValue==val1_version &&  day!==''){
	val1IsAdded=true;
	//alert("inside condition1");
	
}
if (maxValue==val2_version && waiver_var==false && deferral_var == false &&  day2!==''){
	val2IsAdded=true;
//	alert("inside condition2");

}
 if (maxValue==val3_version && day3!==''){
	val3IsAdded=true;
	//alert("inside condition2");

}
alert("val1IsAdded:"+val1IsAdded+" val2IsAdded:"+val2IsAdded+" val3IsAdded:"+val3IsAdded);
/* if(dayTime>day2Time){
	alert("dayTime greter than 2");
}else if(dayTime>day3Time){
	alert("dayTime greter than 3");
}else if(day3Time>day2Time){
	alert("day3Time greter 2");
} */

/*var val="";

if(val1IsAdded && val2IsAdded && val3IsAdded ) {

	if(dayTime==day2Time && dayTime==day3Time) {
		val= "1";
	}else if(dayTime>day2Time)  {
		if(day2Time<day3Time)  {
		
		val= "2";
		}else if(day2Time==day3Time){
			val= "2";
		}else if (day2Time>day3Time)  {
			
			val= "3";
			}
	}else if(dayTime==day2Time)  {
		if(dayTime>day3Time)  {
		
		val= "3";
		}else if(dayTime==day3Time){
			val= "1";
		}else if (dayTime<day3Time)  {
			
			val= "1";
			}
	}else if(dayTime<day2Time)  {
		if(dayTime<day3Time)  {
		
		val= "1";
		}else if(dayTime==day3Time){
			val= "1";
		}else if (dayTime>day3Time)  {
			
			val= "3";
			}
	}

}else if(val1IsAdded && val2IsAdded) {
	//alert("1");
	if(dayTime==day2Time) {
		//alert("2");
		val= "1";
	}	
	else if(dayTime<day2Time)  {
		//alert("3");
		val= "1";
		
	}else if (day2Time<dayTime)  {
		//alert("4");
		val= "2";
		}
}else if(val1IsAdded && val3IsAdded) {
	if(dayTime==day3Time) {
		val= "1";
	}	
	else if(dayTime<day3Time)  {
		
		val= "1";
		
	}else if (day3Time<dayTime)  {
		
		val= "3";
		}
	
}else if(val2IsAdded && val3IsAdded) {
	if(day2Time==day3Time) {
		val= "2";
	}	
	else if(day2Time<day3Time)  {
		
		val= "2";
		
	}else if (day3Time<day2Time)  {
		
		val= "3";
		}
	
}else if(val1IsAdded) {
	val= "1";
}else if(val2IsAdded) {
	val= "2";
}else if(val3IsAdded) {
	val= "3";
} */

var val=calLowestVerOnAmount();
//alert("val:"+val);
if(val=="1"){
	day=day;	
}else if (val=="2"){
	day=day2;	
}else if (val=="3"){
	day=day3;	
}
//alert("day:"+day);
	if(frequency==''){
		document.getElementById('nextValDate').value ='';
	}
	else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
		&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH' && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
	
	 document.getElementById('nextValDate').value = day;
	}
	else{
		
		
	if(isNaN(day)){
		
	
	var udate_month = day.substring(3,6);  
	
	 switch(udate_month)
		 {
		 case 'Jan':
			 udate_month='00';
			
            break;
		 case 'Feb':
			 udate_month='01';
			 break;
		 case 'Mar':
			 udate_month='02';
			
			 break;
		 case 'Apr':
			 udate_month='03';
			 break;
		 case 'May':
			 udate_month='04';
			
			 break;
		 case 'Jun':
			 udate_month='05';
			 break;
		 case 'Jul':
			 udate_month='06';
			
			 break;
		 case 'Aug':
			 udate_month='07';
			
			 break;
		 case 'Sep':
			 udate_month='08';
			 break;
		 case 'Oct':
			 udate_month='09';
			
			 break;
		 case 'Nov':
			 udate_month='10';
			 break;
		 case 'Dec':
			 udate_month='11';
			
			 break;
			
			
			 }
	 
	var thisDate = new Date(day.substring(7,11),udate_month,day.substring(0,2));

	
	}
	if(thisDate!=null && isNaN(frequency)){
	
	if(frequency == 'DAILY'){
   thisDate.setDate(thisDate.getDate() + 1);
		 }
	if(frequency == 'FORTNIGHTLY'){
	       thisDate.setDate(thisDate.getDate() + 15);
	   		 }
	if(frequency == 'HALF_YEARLY'){      	
    	if(thisDate.getMonth()==7){
    		var mn=thisDate.getMonth();        
    		var yr=thisDate.getYear();        	
    				mn=mn+6;
    		        	if(mn>11){
    		            mn=mn-11;
    		            mn--;        		       
    					yr++; 
    					   			
    					var dy=thisDate.getDate();
				if(mn==1){		
					if(dy>28){
						dy=28;
						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
							dy++;
					}			
					
					}       	
    					thisDate.setYear(yr) ;
    					thisDate.setDate(dy) ;
    					thisDate.setMonth(mn) ;
    					
    	}}else{
        	
        	var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	
        	if(thisDate.getMonth()==4 || thisDate.getMonth()==9){
            	if(dy==31){
            		dy--;
            	}
            	
            	
        	}
        	
        	thisDate.setDate(dy) ;
    		thisDate.setMonth(thisDate.getMonth()+ 6) ; 
    		 
    	}	
	  	
	   		 
	}
	if(frequency == 'MONTH'){
    	if(thisDate.getMonth()==00){
    		
    		var mn=thisDate.getMonth();        
    		var yr=thisDate.getYear();
    		mn=mn+1;
    		if(mn==1){
        		
        		
        		var dy=thisDate.getDate();
        				
					if(dy>28){
						dy=28;
						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
							dy++;
					}			
					
					       	
    					thisDate.setYear(yr) ;
    					thisDate.setDate(dy) ;
    					thisDate.setMonth(mn) ;
    					
    	}
        	}else{
    		

        		
            	var dy=thisDate.getDate();
            	var mn=thisDate.getMonth();  
            
            	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==4 ||thisDate.getMonth()==7 ||thisDate.getMonth()==9){
                	if(dy==31){
                		dy--;
                	}
                
                	
            	}
            
            	thisDate.setDate(dy) ;
        		thisDate.setMonth(thisDate.getMonth()+ 1) ; 
    		}
		      	
	   		 }
	if(frequency == 'QUARTERLY'){
    	if(thisDate.getMonth()==10){
		
		var mn=thisDate.getMonth();        
		var yr=thisDate.getYear();
		mn=mn+3;
		if(mn==13){
    		mn=mn-11;
    		mn--;
    		yr++;
    		
    		var dy=thisDate.getDate();
    		if(mn==1){		
				if(dy>28){
					dy=28;
					if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
						dy++;
				}			
				
				}       	
					thisDate.setYear(yr) ;
					thisDate.setDate(dy) ;
					thisDate.setMonth(mn) ;
					
	}
    	}else{
		
    		
        	var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        
        	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==7){
            	if(dy==31){
            		dy--;
            	}
            
            	
        	}
    
        	thisDate.setDate(dy) ;
    		thisDate.setMonth(thisDate.getMonth()+ 3) ; 
		}
     	
	   		 }
	if(frequency == 'WEEKLY'){
	       thisDate.setDate(thisDate.getDate() + 7);
	   		 }
	if(frequency == 'YEARLY'){
	    
		var dy=thisDate.getDate();
    	var mn=thisDate.getMonth();  
    	var yr=thisDate.getFullYear();

    		thisDate.setYear(yr + 1) ;
			thisDate.setDate(dy) ;
			thisDate.setMonth(mn) ;
    	
	}
	if(frequency == 'TWO_YEARLY'){
	    
		var dy=thisDate.getDate();
    	var mn=thisDate.getMonth();  
    	var yr=thisDate.getFullYear();

    		thisDate.setYear(yr + 2) ;
			thisDate.setDate(dy) ;
			thisDate.setMonth(mn) ;
    	
	}
	if(frequency == 'THREE_YEARLY'){
	    
		var dy=thisDate.getDate();
    	var mn=thisDate.getMonth();  
    	var yr=thisDate.getFullYear();

    		thisDate.setYear(yr + 3) ;
			thisDate.setDate(dy) ;
			thisDate.setMonth(mn) ;
    	
	}
	if(frequency == 'FOUR_YEARLY'){
	    
		var dy=thisDate.getDate();
    	var mn=thisDate.getMonth();  
    	var yr=thisDate.getFullYear();

    		thisDate.setYear(yr + 4) ;
			thisDate.setDate(dy) ;
			thisDate.setMonth(mn) ;
    	
	}
    	
	if(frequency == 'BI_MONTH'){
		if(thisDate.getMonth()==11){
    		var mn=thisDate.getMonth();        
    		var yr=thisDate.getYear();        	
    				mn=mn+2;
    		        	if(mn>11){
    		            mn=mn-11;
    		            mn--;        		       
    					yr++; 
    				 			
    					var dy=thisDate.getDate();
				if(mn==1){		
					if(dy>28){
						dy=28;
						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
							dy++;
					}			
					
					}       	
    					thisDate.setYear(yr) ;
    					thisDate.setDate(dy) ;
    					thisDate.setMonth(mn) ;
    					
    	}}else{
        	
        	var dy=thisDate.getDate();
        	var mn=thisDate.getMonth();  
        	
        	if(thisDate.getMonth()==6){
            	if(dy==31){
            		dy--;
            	}              	
            	
        	}
        	
        	thisDate.setDate(dy) ;
    		thisDate.setMonth(thisDate.getMonth()+ 2) ; 
    		 
    	}	
	  	
	   		 }
	
	
  var cal_month=thisDate.getMonth();  

  switch(cal_month.toString())
	 {
  
	 case '0':
		 cal_month='Jan';
         break;
	 case '1':
		 cal_month='Feb';
		 break;
	 case '2':
		 cal_month='Mar';
		 break;
	 case '3':
		 cal_month='Apr';
		 break;
	 case '4':
		 cal_month='May';
		 break;
	 case '5':
		 cal_month='Jun';
		 break;
	 case '6':
		 cal_month='Jul';
		 break;
	 case '7':
		 cal_month='Aug';
		 break;
	 case '8':
		 cal_month='Sep';
		 break;
	 case '9':
		 cal_month='Oct';
		 break;
	 case '10':
		 cal_month='Nov';
		 break;
	 case '11':
		 cal_month='Dec';
		 break;		
		
		 }

	
  if(thisDate.getDate()<10){
		var date=thisDate.getDate().toString();
		var date1='0'+date;
		}
	
	if(date1 != null){
	 var final_date=date1+'/'+cal_month+'/'+thisDate.getFullYear().toString();
	}else{
		 var final_date=thisDate.getDate().toString()+'/'+cal_month+'/'+thisDate.getFullYear().toString();
	}
  	document.getElementById('nextValDate').value = final_date;
  	document.all.nextValDate.value = final_date;
  	document.all.nextValDate.value = final_date;
	}

	}
	}

	//Start Santosh
/* var el = document.getElementById('propertyType');
var text = el.options[el.selectedIndex].innerHTML;
	isMandatory(text);
	document.getElementById("propertyTypeLabel").value=text;
	
function selectedPropertyType(dropdown) {
	var choice = "";
	for(i=0; i<dropdown.options.length; i++){
		if (dropdown.options[i].selected == true){
			choice = dropdown.options[i].text;	
		}
	}	
	isMandatory(choice);
	document.getElementById("propertyTypeLabel").value=choice;
}

function isMandatory(choice)
{
	
	 if(choice.indexOf("LAND")!=-1) {
			document.getElementById("mandatorylandValue_v1").style.display='';
			document.getElementById("mandatoryBuildingValue_v1").style.display='none';
			document.getElementById("mandatoryReconstructionValueOfTheBuilding_v1").style.display='none';
		}
		else {
			document.getElementById("mandatorylandValue_v1").style.display='none';
			document.getElementById("mandatoryBuildingValue_v1").style.display='';
			document.getElementById("mandatoryReconstructionValueOfTheBuilding_v1").style.display='';
		}
} 
 */

 
 function calNextDate3(){
		var frequency=document.getElementById("commonRevalFreq").value;
		var day=document.forms[0].valuationDate_v3.value;

		if(frequency==''){
			document.getElementById('nextValDate').value ='';
		}
		else if(frequency!='DAILY' && frequency!='FORTNIGHTLY' && frequency!='HALF_YEARLY' && frequency!='MONTH' && frequency!='QUARTERLY'
			&& frequency!='WEEKLY' && frequency!='YEARLY' && frequency!='BI_MONTH' && frequency!='TWO_YEARLY' && frequency!='THREE_YEARLY' && frequency!='FOUR_YEARLY'){
		
		 document.getElementById('nextValDate').value = day;
		}
		else{
			
			
		if(isNaN(day)){
			
		
		var udate_month = day.substring(3,6);  
		
		 switch(udate_month)
			 {
			 case 'Jan':
				 udate_month='00';
				
	            break;
			 case 'Feb':
				 udate_month='01';
				 break;
			 case 'Mar':
				 udate_month='02';
				
				 break;
			 case 'Apr':
				 udate_month='03';
				 break;
			 case 'May':
				 udate_month='04';
				
				 break;
			 case 'Jun':
				 udate_month='05';
				 break;
			 case 'Jul':
				 udate_month='06';
				
				 break;
			 case 'Aug':
				 udate_month='07';
				
				 break;
			 case 'Sep':
				 udate_month='08';
				 break;
			 case 'Oct':
				 udate_month='09';
				
				 break;
			 case 'Nov':
				 udate_month='10';
				 break;
			 case 'Dec':
				 udate_month='11';
				
				 break;
				
				
				 }
		 
		var thisDate = new Date(day.substring(7,11),udate_month,day.substring(0,2));

		
		}
		if(thisDate!=null && isNaN(frequency)){
		
		if(frequency == 'DAILY'){
	   thisDate.setDate(thisDate.getDate() + 1);
			 }
		if(frequency == 'FORTNIGHTLY'){
		       thisDate.setDate(thisDate.getDate() + 15);
		   		 }
		if(frequency == 'HALF_YEARLY'){      	
	    	if(thisDate.getMonth()==7){
	    		var mn=thisDate.getMonth();        
	    		var yr=thisDate.getYear();        	
	    				mn=mn+6;
	    		        	if(mn>11){
	    		            mn=mn-11;
	    		            mn--;        		       
	    					yr++; 
	    					   			
	    					var dy=thisDate.getDate();
					if(mn==1){		
						if(dy>28){
							dy=28;
							if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
								dy++;
						}			
						
						}       	
	    					thisDate.setYear(yr) ;
	    					thisDate.setDate(dy) ;
	    					thisDate.setMonth(mn) ;
	    					
	    	}}else{
	        	
	        	var dy=thisDate.getDate();
	        	var mn=thisDate.getMonth();  
	        	
	        	if(thisDate.getMonth()==4 || thisDate.getMonth()==9){
	            	if(dy==31){
	            		dy--;
	            	}
	            	
	            	
	        	}
	        	
	        	thisDate.setDate(dy) ;
	    		thisDate.setMonth(thisDate.getMonth()+ 6) ; 
	    		 
	    	}	
		  	
		   		 
		}
		if(frequency == 'MONTH'){
	    	if(thisDate.getMonth()==00){
	    		
	    		var mn=thisDate.getMonth();        
	    		var yr=thisDate.getYear();
	    		mn=mn+1;
	    		if(mn==1){
	        		
	        		
	        		var dy=thisDate.getDate();
	        				
						if(dy>28){
							dy=28;
							if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
								dy++;
						}			
						
						       	
	    					thisDate.setYear(yr) ;
	    					thisDate.setDate(dy) ;
	    					thisDate.setMonth(mn) ;
	    					
	    	}
	        	}else{
	    		

	        		
	            	var dy=thisDate.getDate();
	            	var mn=thisDate.getMonth();  
	            
	            	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==4 ||thisDate.getMonth()==7 ||thisDate.getMonth()==9){
	                	if(dy==31){
	                		dy--;
	                	}
	                
	                	
	            	}
	            
	            	thisDate.setDate(dy) ;
	        		thisDate.setMonth(thisDate.getMonth()+ 1) ; 
	    		}
			      	
		   		 }
		if(frequency == 'QUARTERLY'){
	    	if(thisDate.getMonth()==10){
			
			var mn=thisDate.getMonth();        
			var yr=thisDate.getYear();
			mn=mn+3;
			if(mn==13){
	    		mn=mn-11;
	    		mn--;
	    		yr++;
	    		
	    		var dy=thisDate.getDate();
	    		if(mn==1){		
					if(dy>28){
						dy=28;
						if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
							dy++;
					}			
					
					}       	
						thisDate.setYear(yr) ;
						thisDate.setDate(dy) ;
						thisDate.setMonth(mn) ;
						
		}
	    	}else{
			
	    		
	        	var dy=thisDate.getDate();
	        	var mn=thisDate.getMonth();  
	        
	        	if(thisDate.getMonth()==0 || thisDate.getMonth()==2 ||thisDate.getMonth()==7){
	            	if(dy==31){
	            		dy--;
	            	}
	            
	            	
	        	}
	    
	        	thisDate.setDate(dy) ;
	    		thisDate.setMonth(thisDate.getMonth()+ 3) ; 
			}
	     	
		   		 }
		if(frequency == 'WEEKLY'){
		       thisDate.setDate(thisDate.getDate() + 7);
		   		 }
		if(frequency == 'YEARLY'){
		    
			var dy=thisDate.getDate();
	    	var mn=thisDate.getMonth();  
	    	var yr=thisDate.getFullYear();

	    		thisDate.setYear(yr + 1) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
	    	
		}
		if(frequency == 'TWO_YEARLY'){
		    
			var dy=thisDate.getDate();
	    	var mn=thisDate.getMonth();  
	    	var yr=thisDate.getFullYear();

	    		thisDate.setYear(yr + 2) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
	    	
		}
		if(frequency == 'THREE_YEARLY'){
		    
			var dy=thisDate.getDate();
	    	var mn=thisDate.getMonth();  
	    	var yr=thisDate.getFullYear();

	    		thisDate.setYear(yr + 3) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
	    	
		}
		if(frequency == 'FOUR_YEARLY'){
		    
			var dy=thisDate.getDate();
	    	var mn=thisDate.getMonth();  
	    	var yr=thisDate.getFullYear();

	    		thisDate.setYear(yr + 4) ;
				thisDate.setDate(dy) ;
				thisDate.setMonth(mn) ;
	    	
		}
	    	
		if(frequency == 'BI_MONTH'){
			if(thisDate.getMonth()==11){
	    		var mn=thisDate.getMonth();        
	    		var yr=thisDate.getYear();        	
	    				mn=mn+2;
	    		        	if(mn>11){
	    		            mn=mn-11;
	    		            mn--;        		       
	    					yr++; 
	    				 			
	    					var dy=thisDate.getDate();
					if(mn==1){		
						if(dy>28){
							dy=28;
							if(((yr % 4 == 0) && (yr % 100 != 0)) || (yr % 400 == 0))
								dy++;
						}			
						
						}       	
	    					thisDate.setYear(yr) ;
	    					thisDate.setDate(dy) ;
	    					thisDate.setMonth(mn) ;
	    					
	    	}}else{
	        	
	        	var dy=thisDate.getDate();
	        	var mn=thisDate.getMonth();  
	        	
	        	if(thisDate.getMonth()==6){
	            	if(dy==31){
	            		dy--;
	            	}              	
	            	
	        	}
	        	
	        	thisDate.setDate(dy) ;
	    		thisDate.setMonth(thisDate.getMonth()+ 2) ; 
	    		 
	    	}	
		  	
		   		 }
		
		
	  var cal_month=thisDate.getMonth();  

	  switch(cal_month.toString())
		 {
	  
		 case '0':
			 cal_month='Jan';
	         break;
		 case '1':
			 cal_month='Feb';
			 break;
		 case '2':
			 cal_month='Mar';
			 break;
		 case '3':
			 cal_month='Apr';
			 break;
		 case '4':
			 cal_month='May';
			 break;
		 case '5':
			 cal_month='Jun';
			 break;
		 case '6':
			 cal_month='Jul';
			 break;
		 case '7':
			 cal_month='Aug';
			 break;
		 case '8':
			 cal_month='Sep';
			 break;
		 case '9':
			 cal_month='Oct';
			 break;
		 case '10':
			 cal_month='Nov';
			 break;
		 case '11':
			 cal_month='Dec';
			 break;		
			
			 }

		
	  if(thisDate.getDate()<10){
			var date=thisDate.getDate().toString();
			var date1='0'+date;
			}
		
		if(date1 != null){
		 var final_date=date1+'/'+cal_month+'/'+thisDate.getFullYear().toString();
		}else{
			 var final_date=thisDate.getDate().toString()+'/'+cal_month+'/'+thisDate.getFullYear().toString();
		}
	  	document.getElementById('nextValDate').value = final_date;
	  	document.all.nextValDate.value = final_date;
	  	document.all.nextValDate.value = final_date;
		}

		}
		}
 

function totalValue() {
	/* //alert(amt.value);
	var value = parseFloat((amt.value).replace(',',''));
	if(isNaN(value)  || amt.value.trim()=="") {    
		value=0;
	}
		document.getElementById('totalPropertyAmount_v1').value = parseFloat((document.getElementById('totalPropertyAmount_v1').value).replace(',',''))+value;
		document.getElementById('amountCMV').value = parseFloat((document.getElementById('amountCMV').value).replace(',',''))+value;
		calculateLoanableAmount1(); */
		<%-- var totalPropertyAmount_v1=<%=iCol.getTotalPropertyAmount().getAmount()%> --%>
		var landValue_v1= parseFloat((document.getElementById('landValue_v1').value).replace(/,/g , ''));
		var buildingValue_v1= parseFloat((document.getElementById('buildingValue_v1').value).replace(/,/g , ''));
		var reconstructionValueOfTheBuilding_v1= parseFloat((document.getElementById('reconstructionValueOfTheBuilding_v1').value).replace(/,/g , ''));
		 
		/* if(isNaN(totalPropertyAmount_v1)){
			totalPropertyAmount_v1=0;
		} */
		if(isNaN(landValue_v1)){
			landValue_v1=0;
			document.getElementById('landValue_v1').value=0;
		}
		if(isNaN(buildingValue_v1)){
			buildingValue_v1=0;
			document.getElementById('buildingValue_v1').value=0;
		}
		if(isNaN(reconstructionValueOfTheBuilding_v1)){
			reconstructionValueOfTheBuilding_v1=0;
			document.getElementById('reconstructionValueOfTheBuilding_v1').value=0;
		}
		
	var total=landValue_v1+buildingValue_v1;//+reconstructionValueOfTheBuilding_v1;	
	document.getElementById('totalPropertyAmount_v1').value = total;//+totalPropertyAmount_v1;
	
	calculatLowestSecurityomv();
	//document.getElementById('amountCMV').value =total;//+parseFloat(document.getElementById('amountCMV').value);
	dispAmtInWords(document.getElementById('totalPropertyAmount_v1'));
	
	calculateLoanableAmount1();
	calNextDate2();
}
 
 function totalValue3() {
		/* //alert(amt.value);
		var value = parseFloat((amt.value).replace(',',''));
		if(isNaN(value)  || amt.value.trim()=="") {    
			value=0;
		}
			document.getElementById('totalPropertyAmount_v3').value = parseFloat((document.getElementById('totalPropertyAmount_v3').value).replace(',',''))+value;
			document.getElementById('amountCMV').value = parseFloat((document.getElementById('amountCMV').value).replace(',',''))+value;
			calculateLoanableAmount1(); */
			<%-- var totalPropertyAmount_v3=<%=iCol.getTotalPropertyAmount().getAmount()%> --%>
			var landValue_v3= parseFloat((document.getElementById('landValue_v3').value).replace(/,/g , ''));
			var buildingValue_v3= parseFloat((document.getElementById('buildingValue_v3').value).replace(/,/g , ''));
			var reconstructionValueOfTheBuilding_v3= parseFloat((document.getElementById('reconstructionValueOfTheBuilding_v3').value).replace(/,/g , ''));
			 
			/* if(isNaN(totalPropertyAmount_v3)){
				totalPropertyAmount_v3=0;
			} */
			if(isNaN(landValue_v3)){
				landValue_v3=0;
				document.getElementById('landValue_v3').value=0;
			}
			if(isNaN(buildingValue_v3)){
				buildingValue_v3=0;
				document.getElementById('buildingValue_v3').value=0;
			}
			if(isNaN(reconstructionValueOfTheBuilding_v3)){
				reconstructionValueOfTheBuilding_v3=0;
				document.getElementById('reconstructionValueOfTheBuilding_v3').value=0;
			}
			
		var total=landValue_v3+buildingValue_v3;//+reconstructionValueOfTheBuilding_v3;	
		document.getElementById('totalPropertyAmount_v3').value = total;//+totalPropertyAmount_v3;
		//document.getElementById('amountCMV').value =total;//+parseFloat(document.getElementById('amountCMV').value);
		
		calculatLowestSecurityomv();
		calculateLoanableAmount1();
		dispAmtInWords(document.getElementById('totalPropertyAmount_v3'));
		calNextDate2();
	}
 
	
	function calculateLoanableAmount1(){
		var amountCMV = document.forms[0].amountCMV.value;
		var margin = document.forms[0].margin.value;
		if(margin > 100){
			alert("Please enter value between 1 to 100.");
		}
		else{
			if(amountCMV != null && margin != null){
				var exchangeRateINR = 0;
				var loanableAmt = 0; 
				amountCMV = amountCMV.replace(/,/g,'');
				
				<%  String colCurrency="";
				
					if(itrxValue!=null) {
			        ICollateral actualCol = itrxValue.getCollateral();

			        if(itrxValue.getCollateral()!=null && itrxValue.getCollateral().getCurrencyCode()!= null)
			        	colCurrency = itrxValue.getCollateral().getCurrencyCode().trim();
					}
				if(colCurrency!=null && !colCurrency.equals("")  && !colCurrency.equalsIgnoreCase("INR")) {%>
					exchangeRateINR = document.getElementById('exchangeRateINR').value;

					//Phase 3 CR:comma separated
					exchangeRateINR=exchangeRateINR.replace(/,/g,'');
					
					loanableAmt = (amountCMV * exchangeRateINR) - ((amountCMV * margin * exchangeRateINR) / 100);				
				<%}else{%>
					loanableAmt = amountCMV - (amountCMV * margin)/100;
				<%}%>
				if(isNaN(loanableAmt)){
					document.getElementById('valLoanableAmount').innerHTML = "-";
				}else{
					//Phase 3 CR:comma separated
					loanableAmt=formatAmountAsCommaSeparated1(loanableAmt.toFixed(2));
				    
					document.getElementById('valLoanableAmount').innerHTML = loanableAmt;
					document.forms[0].loanableAmount.value = loanableAmt;
				}
			}else{
				document.getElementById('valLoanableAmount').innerHTML = "-";
			}
		}		
	}
	
function calculatLowestSecurityomv(){
	var landValue_v1= parseFloat((document.getElementById('landValue_v1').value).replace(/,/g , ''));
var buildingValue_v1= parseFloat((document.getElementById('buildingValue_v1').value).replace(/,/g , ''));
	
var landValue_v2= parseFloat((document.getElementById('landValue_v2').value).replace(/,/g , ''));
var buildingValue_v2= parseFloat((document.getElementById('buildingValue_v2').value).replace(/,/g , ''));
		
var landValue_v3= parseFloat((document.getElementById('landValue_v3').value).replace(/,/g , ''));
var buildingValue_v3= parseFloat((document.getElementById('buildingValue_v3').value).replace(/,/g , ''));
			
	 var val1_version=document.getElementById("version1").value;
	 var val2_version=document.getElementById("version2").value;
	 var val3_version=document.getElementById("version3").value;
	 var valCreation1=document.getElementById("valcreationdate_v1").value;
	 var valCreation2=document.getElementById("valcreationdate_v2").value;
	 var valCreation3=document.getElementById("valcreationdate_v3").value;
	
	 
	//alert(val1_version+","+val2_version+","+val3_version);
	var waiver_var=document.getElementById("waiver").checked;
	var deferral_var=document.getElementById("deferral").checked;
	
	//alert("landValue_v1:"+landValue_v1);
	/* if(isNaN(landValue_v1)){
		landValue_v1=0;
	}
	if(isNaN(buildingValue_v1)){
		buildingValue_v1=0;
	} */
var	total1=landValue_v1+buildingValue_v1;
	/* if(isNaN(landValue_v2)){
		landValue_v2=0;
	}
	if(isNaN(buildingValue_v2)){
		buildingValue_v2=0;
	} */
	var total2=landValue_v2+buildingValue_v2;
 
/*  if(isNaN(landValue_v3)){
		landValue_v3=0;
	}
	if(isNaN(buildingValue_v3)){
		buildingValue_v3=0;
	} */
	var total3=landValue_v3+buildingValue_v3;
	// total=landValue_v1+buildingValue_v1;
	
	var maxValue;
	if(waiver_var==true || deferral_var == true){
	
	 maxValue=Math.max(val1_version,val3_version);
	}else{
	 maxValue=Math.max(val1_version,val2_version,val3_version);
	}
	//alert("total1:"+total1+" total2:"+total2+" total3:"+total3+" maxValue:"+maxValue);
	//alert("maxValue:"+maxValue+" valCreation1:"+valCreation1+" valCreation2:"+valCreation2+" valCreation3:"+valCreation3+" waiver_var:"+waiver_var+" deferral_var:"+deferral_var);
	
	var val1IsAdded=false;
	var val2IsAdded=false;
	var val3IsAdded=false;
	
	if(maxValue==val1_version && total1>0){
		val1IsAdded=true;
	//	alert("inside condition1");
		
	}
	if (maxValue==val2_version && waiver_var==false && deferral_var == false && total2>0){
		val2IsAdded=true;
	//	alert("inside condition2");

	}
	 if (maxValue==val3_version && total3>0){
		val3IsAdded=true;
	//	alert("inside condition2");
	
	}
	//alert("val1IsAdded:"+val1IsAdded+" val2IsAdded:"+val2IsAdded+" val3IsAdded:"+val3IsAdded+" total1:"+total1+" total2:"+total2+" total3:"+total3);
	var val="";
	if(val1IsAdded && val2IsAdded && val3IsAdded ) {

		if(total1==total2 && total1==total3) {
			val= "1";
		}else if(total1>total2)  {
			if(total2<total3)  {
			
			val= "2";
			}else if(total2==total3){
				val= "2";
			}else if (total2>total3)  {
				
				val= "3";
				}
		}else if(total1==total2)  {
			if(total1>total3)  {
			
			val= "3";
			}else if(total1==total3){
				val= "1";
			}else if (total1<total3)  {
				
				val= "1";
				}
		}else if(total1<total2)  {
			if(total1<total3)  {
			
			val= "1";
			}else if(total1==total3){
				val= "1";
			}else if (total1>total3)  {
				
				val= "3";
				}
		}
	
	}else if(val1IsAdded && val2IsAdded) {
		if(total1==total2) {
			val= "1";
		}	
		else if(total1<total2)  {
			
			val= "1";
			
		}else if (total2<total1)  {
			
			val= "2";
			}
	}else if(val1IsAdded && val3IsAdded) {
		if(total1==total3) {
			val= "1";
		}	
		else if(total1<total3)  {
			
			val= "1";
			
		}else if (total3<total1)  {
			
			val= "3";
			}
		
	}else if(val2IsAdded && val3IsAdded) {
		if(total2==total3) {
			val= "2";
		}	
		else if(total2<total3)  {
			
			val= "2";
			
		}else if (total3<total2)  {
			
			val= "3";
			}
		
	}else if(val1IsAdded) {
		val= "1";
	}else if(val2IsAdded) {
		val= "2";
	}else if(val3IsAdded) {
		val= "3";
	}
	
	if(val=="1"){
		document.getElementById('amountCMV').value =total1;	
	}else if (val=="2"){
		document.getElementById('amountCMV').value =total2;
	}else if (val=="3"){
		document.getElementById('amountCMV').value =total3;
	}
	
	
 } 
 function convertToSqfeet(area,areaUnit,type){
 	
 	var areaValue = parseFloat((area.value).replace(',',''));
 	var areaUnitValue = areaUnit.value;
 	var inSqft=0;
 	if(areaUnitValue!=null){
     	if("ACRES" == areaUnitValue){
     		inSqft=areaValue*43560;
     	}	
     	else if("ARE" == areaUnitValue){
     		inSqft=areaValue*1076.39;
     	}
     	else if("BIGHA" == areaUnitValue){
     		inSqft=areaValue*17452.0069;
     	}
     	else if("BISWA" == areaUnitValue){
     		inSqft=areaValue*357142.857;
     	}
     	else if("BISWANI" == areaUnitValue){
     		inSqft=areaValue*17857.142;
     	}
     	else if("CENTS" == areaUnitValue){
     		inSqft=areaValue*435.54;
     	}
     	else if("CHITTAK" == areaUnitValue){
     		inSqft=areaValue*45;
     	} 
     	else if("DECIMAL" == areaUnitValue){
     		inSqft=areaValue*436;
     	}
     	else if("GROUND" == areaUnitValue){
     		inSqft=areaValue*2400.3840;
     	}
     	else if("GUNTHA" == areaUnitValue){
     		inSqft=areaValue*1089.0873;
     	}
     	else if("HQT" == areaUnitValue){
     		inSqft=areaValue*107639;
     	}
     	else if("KANAL" == areaUnitValue){
     		inSqft=areaValue*5445;
     	}
     	/* else if("Killa" == areaUnitValue){
     		inSqft=areaValue*43560;
     	} */
     	else if("KOTTA" == areaUnitValue){
     		inSqft=areaValue*720;
     	}
     	else if("MARLA" == areaUnitValue){
     		inSqft=areaValue*272.251;
     	}
     	else if("SATAK" == areaUnitValue){
     		inSqft=areaValue*458;
     	}
     	else if("SQFT" == areaUnitValue){
     		inSqft=areaValue*1;
     	}
     	else if("SQM" == areaUnitValue){
     		inSqft=areaValue*10.7639;
     	}
     	else if("SQY" == areaUnitValue){
     		inSqft=areaValue*9;
     	}
 	}
 	if(isNaN(inSqft)){
 		inSqft=0;
	}
 	var valueInSqft=inSqft.toFixed(2);
 	 if(type=="builtUp"){
 		document.getElementById('inSqftBuiltupArea_v1').value = valueInSqft;
 	} 
 	else if(type=="land"){
 		document.getElementById('inSqftLandArea_v1').value = valueInSqft;
 	}
 }
 
 function convertToSqfeet3(area,areaUnit,type){
	 	
	 	var areaValue = parseFloat((area.value).replace(',',''));
	 	var areaUnitValue = areaUnit.value;
	 	var inSqft=0;
	 	if(areaUnitValue!=null){
	     	if("ACRES" == areaUnitValue){
	     		inSqft=areaValue*43560;
	     	}	
	     	else if("ARE" == areaUnitValue){
	     		inSqft=areaValue*1076.39;
	     	}
	     	else if("BIGHA" == areaUnitValue){
	     		inSqft=areaValue*17452.0069;
	     	}
	     	else if("BISWA" == areaUnitValue){
	     		inSqft=areaValue*357142.857;
	     	}
	     	else if("BISWANI" == areaUnitValue){
	     		inSqft=areaValue*17857.142;
	     	}
	     	else if("CENTS" == areaUnitValue){
	     		inSqft=areaValue*435.54;
	     	}
	     	else if("CHITTAK" == areaUnitValue){
	     		inSqft=areaValue*45;
	     	} 
	     	else if("DECIMAL" == areaUnitValue){
	     		inSqft=areaValue*436;
	     	}
	     	else if("GROUND" == areaUnitValue){
	     		inSqft=areaValue*2400.3840;
	     	}
	     	else if("GUNTHA" == areaUnitValue){
	     		inSqft=areaValue*1089.0873;
	     	}
	     	else if("HQT" == areaUnitValue){
	     		inSqft=areaValue*107639;
	     	}
	     	else if("KANAL" == areaUnitValue){
	     		inSqft=areaValue*5445;
	     	}
	     	/* else if("Killa" == areaUnitValue){
	     		inSqft=areaValue*43560;
	     	} */
	     	else if("KOTTA" == areaUnitValue){
	     		inSqft=areaValue*720;
	     	}
	     	else if("MARLA" == areaUnitValue){
	     		inSqft=areaValue*272.251;
	     	}
	     	else if("SATAK" == areaUnitValue){
	     		inSqft=areaValue*458;
	     	}
	     	else if("SQFT" == areaUnitValue){
	     		inSqft=areaValue*1;
	     	}
	     	else if("SQM" == areaUnitValue){
	     		inSqft=areaValue*10.7639;
	     	}
	     	else if("SQY" == areaUnitValue){
	     		inSqft=areaValue*9;
	     	}
	 	}
		if(isNaN(inSqft)){
	 		inSqft=0;
		}
	 	var valueInSqft=inSqft.toFixed(2);
	 	 if(type=="builtUp"){
	 		document.getElementById('inSqftBuiltupArea_v3').value = valueInSqft;
	 	} 
	 	else if(type=="land"){
	 		document.getElementById('inSqftLandArea_v3').value = valueInSqft;
	 	}
	 }

 function addRevaluation1(){
	
	// alert("add revaluation 1");
	// alert("date physical Inspe:"+document.getElementById("datePhyInspec_v1").value);
	var answer=  confirm("You have clicked on ADD button.Do you want proceed.");
	
		if(answer == true){
	 var currDate='<%=todayDate%>';
	// alert("currDate:"+currDate);
	 document.getElementById("val1_id").value='';
	 
	 var version1_db=<%=version1%>;
	// alert("version1 before:"+version1_db);
	 document.getElementById("version1").value=version1_db+1;
	// alert("version1 after:"+document.getElementById("version1").value);
	 
	// document.getElementById("version1").value=version1+1;
	 document.getElementById("ImageValuationDate_v1").disabled=false;
	 document.getElementById("valcreationdate_v1").value=currDate;
	// alert("11");
	 document.getElementById("totalPropertyAmount_v1").value='';
	// alert("12");
	 document.getElementById("valuationDate_v1").value='';
	 document.getElementById("ImageValuationDate_v1").disabled =false; 
	// alert("13");
	 document.getElementById("valuatorCompany_v1").value='';
	// alert("14");
	 document.getElementById("categoryOfLandUse_v1").value='';
//	 alert("15");
	 document.getElementById("developerName_v1").value='';
	 document.getElementById("country_v1").value='';
	 document.getElementById("region_v1").value='';
	 document.getElementById("locationState_v1").value='';
	 document.getElementById("nearestCity_v1").value='';
	 document.getElementById("pinCode_v1").value='';
//	 alert("16");
	 document.getElementById("landArea_v1").value='';
	 document.getElementById("landUOM_v1").value='';
	 document.getElementById("inSqftLandArea_v1").value='';
	 document.getElementById("builtupArea_v1").value='';
	// alert("17");
	 document.getElementById("builtUpAreaUnit_v1").value='';
	 document.getElementById("inSqftBuiltupArea_v1").value='';
	 document.getElementById("landValue_v1").value='';
	 document.getElementById("buildingValue_v1").value='';
	// alert("18");
	 document.getElementById("reconstructionValueOfTheBuilding_v1").value='';
	 document.getElementById("propertyCompletionStatus_v1ID").value='';
	 document.getElementById("isPhysInsp_v1").checked = false;
	 document.getElementById("physInspFreqUOM_v1").value='';
	// alert("19");
	 document.getElementById("datePhyInspec_v1").value='';
	 document.getElementById("nextPhysInspDate_v1").value='';
	 document.getElementById("remarksProperty_v1").value='';
	// alert("20");
	document.getElementById("totalPropertyAmount_v1_InWords").value = "";
	document.getElementById("landValue_v1_InWords").value = "";
	document.getElementById("reconstructionValueOfTheBuilding_v1_InWords").value = "";
	document.getElementById("buildingValue_v1_InWords").value = "";
		}
 }
 
 function viewPreviousValuation(){
	// alert("viewPreviousValuation");
	 var preValDate_v1Var = document.getElementById("preValDate_v1").value;
	 if(preValDate_v1Var==""){
		 alert("Please select value from Previous valuation date.");
	 }
//	 alert("preValDate_v1Var:"+preValDate_v1Var);
else{
	  document.forms[0].event.value="viewPreviousValuation1";
	 document.forms[0].submit(); 
}
 }
 function resetOnChangeListeners(idx) {
	 var elements = getElementsByClassName(document, 'nonedit');
	 for(var i = 0; i < elements.length; i++){
		 var ele = elements[i];
		 if(ele.name.indexOf(idx) > 0 && ele.attributes['default']) {
			 if(ele.onchange || ele.attributes['ele_onchange']){
			 	if(ele.attributes['ele_onchange'] && ele.attributes['ele_onchange'].value)
			 		 eval("var onChange = function(event) { " + ele.attributes['ele_onchange'].value + " }");
			 	else
			 		eval("var onChange = null;");
			 	ele.onchange = onChange;
			 }
			 ele.removeAttribute("nonedit");
			 ele.removeAttribute("ele_onchange");
			 ele.removeAttribute("default");
		 }
	 }
 }
 function addRevaluation3(){
	 var answer=  confirm("You have clicked on ADD button.Do you want proceed.");
		
		if(answer == true){
	 	resetOnChangeListeners('3');
		// alert("add revaluation 3");
		// alert("date physical Inspe:"+document.getElementById("datePhyInspec_v3").value);
		
		 var currDate='<%=todayDate%>';
		// alert("currDate:"+currDate);
		 document.getElementById("val3_id").value='';
		 
		 var version3_db=<%=version3%>;
		// alert("version3 before:"+version3_db);
		 document.getElementById("version3").value=version3_db+1;
		 //alert("version3 after:"+document.getElementById("version3").value);
		 
		 document.getElementById("ImageValuationDate_v3").disabled=false;
		 document.getElementById("valcreationdate_v3").value=currDate;
		// alert("11");
		 document.getElementById("totalPropertyAmount_v3").value='';
		// alert("12");
		 document.getElementById("valuationDate_v3").value='';
		// alert("13");
		 document.getElementById("valuatorCompany_v3").value='';
		// alert("14");
		 document.getElementById("categoryOfLandUse_v3").value='';
//		 alert("15");
		 document.getElementById("developerName_v3").value='';
		 document.getElementById("country_v3").value='';
		 document.getElementById("region_v3").value='';
		 document.getElementById("locationState_v3").value='';
		 document.getElementById("nearestCity_v3").value='';
		 document.getElementById("pinCode_v3").value='';
//		 alert("16");
		 document.getElementById("landArea_v3").value='';
		 document.getElementById("landUOM_v3").value='';
		 document.getElementById("inSqftLandArea_v3").value='';
		 document.getElementById("builtupArea_v3").value='';
		// alert("17");
		 document.getElementById("builtUpAreaUnit_v3").value='';
		 document.getElementById("inSqftBuiltupArea_v3").value='';
		 document.getElementById("landValue_v3").value='';
		 document.getElementById("buildingValue_v3").value='';
		// alert("18");
		 document.getElementById("reconstructionValueOfTheBuilding_v3").value='';
		 document.getElementById("propertyCompletionStatus_v3ID").value='';
		 document.getElementById("isPhysInsp_v3").checked = false;
		 document.getElementById("physInspFreqUOM_v3").value='';
		// alert("19");
		 document.getElementById("datePhyInspec_v3").value='';
		 document.getElementById("nextPhysInspDate_v3").value='';
		 document.getElementById("remarksProperty_v3").value='';
		// alert("20");
		document.getElementById("totalPropertyAmount_v3_InWords").value = "";
		document.getElementById("landValue_v3_InWords").value = "";
		document.getElementById("reconstructionValueOfTheBuilding_v3_InWords").value = "";
		document.getElementById("buildingValue_v3_InWords").value = "";
		}
	 }
 
 function viewPreviousValuation3(){
	 var preValDate_v3Var = document.getElementById("preValDate_v3").value;
	 if(preValDate_v3Var==""){
		 alert("Please select value from Previous valuation date.");
	 }
//	 alert("preValDate_v3Var:"+preValDate_v3Var);
else{
	  document.forms[0].event.value="viewPreviousValuation3";
	 document.forms[0].submit(); 
}
 }

window.onload = function(){
//	alert("val1_id:"+ document.getElementById("val1_id").value);
 if( document.getElementById("val1_id").value==''){
	 document.getElementById("ImageValuationDate_v1").disabled=false;
 }else{
	 document.getElementById("ImageValuationDate_v1").disabled=true; 
 }
 
 if( document.getElementById("val3_id").value==''){
	 document.getElementById("ImageValuationDate_v3").disabled=false;
 }else{
	 document.getElementById("ImageValuationDate_v3").disabled=true; 
 }
	}
function defaultValues() {
	var elements = getElementsByClassName(document, 'nonedit');
	var valcreationdate_v1 = document.getElementById('valcreationdate_v1');
	if(valcreationdate_v1) {
		var v1Date = new Date(valcreationdate_v1.value);
		for(var i = 0; i < elements.length; i++){
			var ele = elements[i];
			var valNo = ele.id.indexOf("v2") ? "2" : "2";
			var compareDate = document.getElementById('valcreationdate_v' + valNo);
			if(compareDate){
				compareDate = new Date(compareDate.value);
				var noOfYears = 1000 * 60 * 60 * 24 * 365;
				var consideringYrs = 3;
				var actualYrs = (v1Date.getTime() - compareDate.getTime()) / noOfYears;
				if(actualYrs >= consideringYrs){
					var val = ele.value
					if(ele.type == "radio"){
						val = ele.checked ? "checked" : null;
					}
					else if(ele.type == "checkbox"){
						val = ele.checked;	
					}
					ele.setAttribute("default", val);
					if(ele.onchange){
						var ele_onchange = "" + ele.onchange;
						ele_onchange = ele_onchange.replace("function onchange(event) {","").replace("}", "").trim();
						ele.setAttribute("ele_onchange", ele_onchange);
					}
					ele.onchange = function(event) {
						resetValuesOnChanges(this, valNo);
					}
				}
			}
		}
	}
}
function resetValuesOnChanges(ele, valNo){
	if(ele.type=="radio"){
		if(ele.attributes['default'].value){
			var eles = document.getElementsByName(ele.name);
			if(eles && eles.length == 2){
				var radio1 = eles[0].attributes['default'].value;
				var radio2 = eles[1].attributes['default'].value;
				if(radio1 && radio1 == "checked"){
					eles[0].checked = "checked";
					eles[1].checked = null;
				}else if(radio2 && radio2 == "checked"){
					eles[1].checked = "checked";
					eles[0].checked = null;
				}
			}			
		}else
			ele.checked = null;
	}
	else if(ele.type=="checkbox"){
		if(ele.attributes['default'].value && ele.attributes['default'].value == "checked"){
			ele.checked = "checked";
		}else
			ele.checked = null;
	}
	else {
		ele.value = ele.attributes['default'].value;
	}
	alert("This property need revaluation. Kindly add the valuation-" + valNo + " for this property");
}
function getElementsByClassName(document, className) {
	 if(document.getElementsByClassName){
		 return document.getElementsByClassName(className);
	 }else{
		 var elements = document.body.getElementsByTagName("*");
		 var retNodes = []
		 for (var i = 0; i < elements.length; i++) {
		        if ((elements[i].className).indexOf(className) > -1) {
		        	retNodes.push(elements[i]);
		        }
		 }
		 return retNodes;
	 }
}

function calculatemonth(month){
	
	var udate_month=month;
	 switch(udate_month)
	 {
	 case 'Jan':
		 udate_month='00';
		
        break;
	 case 'Feb':
		 udate_month='01';
		 break;
	 case 'Mar':
		 udate_month='02';
		
		 break;
	 case 'Apr':
		 udate_month='03';
		 break;
	 case 'May':
		 udate_month='04';
		
		 break;
	 case 'Jun':
		 udate_month='05';
		 break;
	 case 'Jul':
		 udate_month='06';
		
		 break;
	 case 'Aug':
		 udate_month='07';
		
		 break;
	 case 'Sep':
		 udate_month='08';
		 break;
	 case 'Oct':
		 udate_month='09';
		
		 break;
	 case 'Nov':
		 udate_month='10';
		 break;
	 case 'Dec':
		 udate_month='11';
		
		 break;
		
		
		 }
	 return udate_month;
}
//defaultValues();
</script>
