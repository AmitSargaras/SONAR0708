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
	List countryList_v2 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryList_v2");
	List regionList_v2 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionList_v2");
	List stateList_v2 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateList_v2");
	List cityList_v2 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityList_v2");
	List preValDateList_v2 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.preValDateList_v2");
	
	pageContext.setAttribute("preValDateList_v2", preValDateList_v2);
	pageContext.setAttribute("countryList_v2", countryList_v2);
	pageContext.setAttribute("regionList_v2", regionList_v2);
	pageContext.setAttribute("stateList_v2", stateList_v2);
	pageContext.setAttribute("cityList_v2", cityList_v2);
	pageContext.setAttribute("valuationAgencyList",valuationAgencyList);
	
	String version2 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.version2");
	System.out.println("version2:"+version2); 
	 
%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
	    <tr>
	      <td><h3><bean:message key="label.security.property.valuation2"/><br/><html:errors property="valuation2NeedRevaluation"/></h3></td>
	    </tr>
	    <tr>
	      <td><html:errors property="mustAddValuation2"/><hr/></td>
	    </tr>
	</thead>
	<tbody>
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname" width="20%"><bean:message key="label.security.property.valuation2.waiver"/></td>
						<td width="30%"><html:checkbox name="PropCommGeneralForm" property="waiver" styleClass="nonedit" styleId="waiver" onclick="calculatLowestSecurityomv();calNextDate2()"/></td>
						<td class="fieldname" width="20%"><bean:message key="label.security.property.valuation2.deferral"/></td>
						<td width="30%"><html:checkbox name="PropCommGeneralForm" property="deferral" styleClass="nonedit" styleId="deferral" onclick="enableDeferralId('click', this);calculatLowestSecurityomv();calNextDate2()"/></td>
					</tr>
					<tr>
						<td class="fieldname" width="20%">
							<bean:message key="label.security.property.valuation2.deferralId"/>&nbsp;
							<span class="mandatoryPerfection" id="deferralIdSpan"> * </span>
						</td>
						<td width="30%">
							<html:text styleId="deferralId" property="deferralId" styleClass="nonedit"/>
							&nbsp;<html:errors property="deferralId"/>
							</td>
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname" width="20%">
							<bean:message key="label.security.property.previous.valuation.date"/>
						</td>
						<td width="30%">
							<html:select name="PropCommGeneralForm" property="preValDate_v2"  styleId="preValDate_v2">
              					<option value=""><bean:message key="label.please.select"/></option>
              					<html:options collection="preValDateList_v2" labelProperty="label" property="value" />
              				</html:select>&nbsp;
			     			<html:button property="previousValView2" styleId="previousValView2" value="View" onclick="viewPreviousValuation2()"/>
						</td>
		    			<td class="fieldname" width="20%">
		    				<bean:message key="label.security.property.revaluation"/>
		    			</td>
						<td width="30%">
							<html:button property="revaluationAdd2" styleId="revaluationAdd2" value="Add" onclick="addRevaluation2()"/>&nbsp;
							<html:text property="valcreationdate_v2"  styleId="valcreationdate_v2" readonly="true" />
						</td>
						<html:hidden property="val2_id" styleId="val2_id"/>
						<html:hidden property="deferralIds"/>
						<html:hidden property="valuation2Mandatory" styleId="valuation2Mandatory"/>
						
						<html:hidden property="version2" styleId="version2"/>
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
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname" width="20%">Total Property Amount <span class="mandatoryPerfection"> * </span></td>
						<td width="30%">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
								<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
									<td style="border:none">
										<html:text styleClass="totalPropertyAmount_v2_InNum" property="totalPropertyAmount_v2" 
										styleId="totalPropertyAmount_v2" onblur="javascript:formatAmountAsCommaSeparated(this);" readonly="true"/>
									</td>
									<td style="border:none">
			 							<textarea id="totalPropertyAmount_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
									</td>
								</tr>
							</table>		
							<html:errors property="totalPropertyAmount_v2"/>
						</td>
						<td class="fieldname" width="20%">Date of Valuation <span class="mandatoryPerfection"> * </span></td>
						<td width="30%"><html:text property="valuationDate_v2" styleClass="nonedit" styleId="valuationDate_v2" readonly="true" onchange="calNextDate2()" />
							<img src="img/calendara.gif"  name="Image12" border="0" id="ImageValuationDate_v2" 
                				onclick="return showCalendar('valuationDate_v2', 'dd/mm/y');" onmouseover="MM_swapImage('Image12','','img/calendarb.gif',1)"/>
			            	<html:errors property="valuationDate_v2"/>
			            </td>
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname">Valuation Company&nbsp;<span class="mandatoryPerfection">*&nbsp;</span></td>
						<td>
							<html:select name="PropCommGeneralForm" property="valuatorCompany_v2" styleClass="nonedit" styleId="valuatorCompany_v2">
              					<option value=""><bean:message key="label.please.select"/></option>
              					<html:options collection="valuationAgencyList" labelProperty="label" property="value" />
              				</html:select>
              				<br/>
              				<html:errors property="valuatorCompany_v2"/>
						</td>
						<td class="fieldname">Category of Land Used </td>
		                <td>
           				  	<html:select property="categoryOfLandUse_v2" styleClass="nonedit" styleId="categoryOfLandUse_v2">
              					<integro:common-code categoryCode="<%=CategoryCodeConstant.CATEGORY_OF_LAND_USE%>" descWithCode="false"/>
             				</html:select>
                 			<html:errors property="categoryOfLandUse_v2"/>
                 		</td>
					</tr>	
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname">
							<bean:message key="label.security.property.dev.occu.name"/>&nbsp;
						</td>
						<td>
							<html:text property="developerName_v2" size="65" styleClass="nonedit" styleId="developerName_v2"></html:text>
							<html:errors property="developerName_v2" />
						</td>		
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
						<td class="fieldname"> 
							<bean:message key="label.security.country"/>&nbsp;
	            			<span class="mandatoryPerfection">*&nbsp;</span>
	            		</td>          
			      		<td>
			      			<html:select name="PropCommGeneralForm" property="country_v2" styleClass="nonedit" styleId="country_v2" onchange="javascript:refreshRegionId2(this)">
	                  			<option value=""><bean:message key="label.please.select"/></option>
	                  			<html:options collection="countryList_v2" labelProperty="label" property="value" />
	                  		</html:select>
	                		<html:errors property="country_v2"/> 
	                	</td>           
				 		<td class="fieldname"> <bean:message key="label.security.region"/>&nbsp;
	            			<span class="mandatoryPerfection">*&nbsp;</span>
	            		</td>          
			      		<td>
			      			<html:select name="PropCommGeneralForm" property="region_v2" styleClass="nonedit" styleId="region_v2" onchange="javascript:refreshStateId2(this)">
                  				<option value=""><bean:message key="label.please.select"/></option>
                  				<html:options collection="regionList_v2" labelProperty="label" property="value" /> 
                  			</html:select>
	                		<html:errors property="region_v2"/> 
	                	</td>
	    			 </tr> 
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">          
			 			<td class="fieldname"> <bean:message key="label.security.state"/>&nbsp;
	            			<span class="mandatoryPerfection">*&nbsp;</span>
	            		</td>          
			      		<td>
			      			<html:select name="PropCommGeneralForm" property="locationState_v2" styleClass="nonedit"  styleId="locationState_v2" onchange="javascript:refreshCityId2(this)">
                  				<option value=""><bean:message key="label.please.select"/></option>
                  				<html:options collection="stateList_v2" labelProperty="label" property="value" />
                  			</html:select>
	                		<html:errors property="locationState_v2"/> 
	                	</td>
					 	<td class="fieldname"> <bean:message key="label.security.city"/>&nbsp;
	            			<span class="mandatoryPerfection">*&nbsp;</span>
	            		</td>          
			      		<td>
			      			<html:select name="PropCommGeneralForm" property="nearestCity_v2" styleClass="nonedit" styleId="nearestCity_v2"  >
	                  			<option value=""><bean:message key="label.please.select"/></option>
	                  			<html:options collection="cityList_v2" labelProperty="label" property="value" />
	                  		</html:select>
	                		<html:errors property="nearestCity_v2"/>
	                	</td>
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname">Pincode <span class="mandatoryPerfection"> * </span></td>
						<td >
							<html:text property="pinCode_v2" size="10" maxlength="6" styleClass="nonedit" styleId="pinCode_v2" />
							<br/>
							<html:errors property="pinCode_v2"/>
							<html:errors property="pincodeError_v2"/>
							<html:errors property="postcodeError_v2"/>
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
						<td>
							<%int type_v2=1; %>
							<html:text property="landArea_v2" styleClass="nonedit" styleId="landArea_v2" size="34" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet2(landArea_v2,landUOM_v2,'land');"/>&nbsp;
							<html:errors property="landAreaLengthError_v2" />
						    <html:select property="landUOM_v2" styleClass="nonedit" styleId="landUOM_v2" onchange="convertToSqfeet2(landArea_v2,landUOM_v2,'land');">
							    <option value="" ><bean:message key="label.please.select"/> </option>
			    				<html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
			    			</html:select>
			    			&nbsp;
			    			<html:errors property="landUOM_v2" />&nbsp;
			   			</td>
					    <td class="fieldname">
					   		<bean:message key="label.security.property.land.area.sqft"/>
					   	</td>
		  				<td>
		  					<html:text property="inSqftLandArea_v2" styleId="inSqftLandArea_v2" size="25" maxlength="30" readonly="true"/>&nbsp;
						Sq.ft</td> 
			  
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<%if(!(subtypeCode.equals(ICMSConstant.COLTYPE_PROP_AGRICULTURAL)
								|| subtypeCode.equals(ICMSConstant.COLTYPE_PROP_LAND_URBAN))){ %>
						<td class="fieldname">
							<bean:message key="label.security.property.build.up.area"/>
							<span class="mandatoryPerfection" id="builtupArea_v2MandatoryID" >*</span>
						</td>
						<td>
							<%type_v2=2; %>
							<html:text property="builtupArea_v2" styleClass="nonedit" styleId="builtupArea_v2"  size="25" onkeypress="return onlyNos(event,this);" onkeyup="convertToSqfeet2(builtupArea_v2,builtUpAreaUnit_v2,'builtUp');"/>&nbsp;
							<html:errors property="builtupAreaLengthError_v2" />
			    			<html:select property="builtUpAreaUnit_v2" styleClass="nonedit" styleId="builtUpAreaUnit_v2" onchange="convertToSqfeet2(builtupArea_v2,builtUpAreaUnit_v2,'builtUp');" >
			     				<option value="" ><bean:message key="label.please.select"/> </option>
				    			<html:options name="LandAreaUOMID" labelName="LandAreaUOMValue"/>
				    		</html:select>
			    			&nbsp;
			    			<html:errors property="builtUpAreaUnit_v2" />
			     			<html:errors property="builtUpAreaUomError_v2" />
			     		</td>
						<%}else{ %>
						<td class="fieldname"> &nbsp;</td>
						<td >&nbsp;</td>
						<%} %>		
						<td class="fieldname">
							<bean:message key="label.security.property.build.up.area.sqft"/>
						</td>
		  				<td>
		  					<html:text property="inSqftBuiltupArea_v2"  styleId="inSqftBuiltupArea_v2" size="25" maxlength="30" readonly="true"/> 
		  					&nbsp;Sq.ft
		  				</td>
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname">
							Land Value <span id="mandatorylandValue_v2" class="mandatoryPerfection"> * </span>
						</td>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
								<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
									<td style="border:none">
										<html:text styleClass="landValue_v2_InNum nonedit" onblur="dispAmtInWords(this)" property="landValue_v2"
										 onkeypress="return onlyNos(event,this);"  styleId="landValue_v2" onchange="totalValue2();"/>
									</td>
									<td style="border:none">
			 							<textarea id="landValue_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
									</td>
								</tr>
							</table>
							<html:errors property="landValue_v2"/>
						</td>
						<td class="fieldname">
							Building Value <span id="mandatoryBuildingValue_v2" class="mandatoryPerfection"> * </span>
						</td>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
								<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
									<td style="border:none">
										<html:text styleClass="buildingValue_v2_InNum nonedit" onblur="dispAmtInWords(this)" property="buildingValue_v2" 
										onkeypress="return onlyNos(event,this);" onchange="totalValue2();" styleId="buildingValue_v2" />
									</td>
									<td style="border:none">
			 							<textarea id="buildingValue_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
									</td>
								</tr>
							</table>
							<html:errors property="buildingValue_v2"/>
						</td>
					</tr>
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname">
							Reconstruction value of the Building <span id="mandatoryReconstructionValueOfTheBuilding_v2" class="mandatoryPerfection"> * </span>
						</td>
						<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
								<tr class="<%=(rowIdx)%2==0?"even":"odd"%>">
									<td style="border:none">
										<html:text styleClass="reconstructionValueOfTheBuilding_v2_InNum nonedit" onblur="dispAmtInWords(this)" property="reconstructionValueOfTheBuilding_v2"
										 onkeypress="return onlyNos(event,this);" onchange="totalValue2();" styleId="reconstructionValueOfTheBuilding_v2" />
									</td>
									<td style="border:none">
			 							<textarea id="reconstructionValueOfTheBuilding_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
									</td>
								</tr>
							</table>
							<html:errors property="reconstructionValueOfTheBuilding_v2"/>
						</td>
						<td class="fieldname">
							<bean:message key="label.security.property.completion.status"/>
						</td>
		  				<td>
		  					<html:select property="propertyCompletionStatus_v2" styleClass="nonedit" onchange="getlag(2)" styleId="propertyCompletionStatus_v2ID" >
								<option value=""><bean:message key="label.please.select"/> </option>
								<html:options name="propertyCompletionStatusValue" labelName="propertyCompletionStatusLabel"/>
							</html:select>&nbsp;
							<html:errors property="propertyCompletionStatus_v2"/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</tbody>
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
		<tr>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    					<td class="fieldname">
    						<bean:message key="label.security.phy.verification"/><font color="red">*</font>&nbsp;
    					</td>
    					<td>
    						<%if( null!=colForm.getIsPhysInsp_v2() || !"".equals(colForm.getIsPhysInsp_v2())){ %>
          					<html:radio property="isPhysInsp_v2" styleId="isPhysInsp_v2"  styleClass="nonedit" value="true" onclick="enable(2)" ><bean:message key="label.common.yes"/>
          					</html:radio> &nbsp;&nbsp;
        					<html:radio property="isPhysInsp_v2" styleId="isPhysInsp_v2" styleClass="nonedit" value="false" onclick="disable(2)">
        						<bean:message key="label.common.no"/>
        					</html:radio>
      						<%}else{ %>
       						<input type="radio" name="isPhysInsp_v2" styleId="isPhysInsp_v2" value="true" onclick="enable(2)" checked="checked">Yes</input>
							<input type="radio" name="isPhysInsp_v2" styleId="isPhysInsp_v2" value="false" onclick="disable(2)" >No</input>
       						<%} %>
        					<html:errors property="isPhysInsp_v2"/>
        				</td>
    					<td class="fieldname">
        					<bean:message key="label.security.phy.verification.frequency"/><font color="red">*</font>&nbsp;
         					<font color="#0000FF"><span id="show1" class="mandatoryPerfection">&nbsp;</span></font>
         				</td>
       					<%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){ %>
  						<td id="chknumBulk" >
       						<html:select property="physInspFreqUOM_v2" styleClass="nonedit" styleId="physInspFreqUOM_v2" onchange="calNextDate(2)">
	            				<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"	descWithCode="false" />
	        				</html:select>&nbsp;
      						<html:errors property="physInspFreqUOM_v2"/>
      					</td>
      					<%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){ %>
      					<td id="chknumBulk" >
					        <html:select property="physInspFreqUOM_v2" styleClass="nonedit" styleId="physInspFreqUOM_v2" disabled="true" onchange="calNextDate(2)">
	            				<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"	descWithCode="false" />
	        				</html:select>&nbsp;
      						<html:errors property="physInspFreqUOM_v2"/>
      					</td>
      					<%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){ %>
      					<td id="chknumBulk" >
					        <html:select property="physInspFreqUOM_v2" styleClass="nonedit" styleId="physInspFreqUOM_v2" disabled="true" onchange="calNextDate(2)">
	            				<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>"	descWithCode="false" />
	        				</html:select>&nbsp;
      						<html:errors property="physInspFreqUOM_v2"/>
      					</td>
      					<%} %>
					</tr>
			        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    					<td class="fieldname">
				        	<bean:message key="label.security.last.phy.verification.date"/><font color="red">*</font>&nbsp;
				        	<span id="spanPID" style="visibility:hidden"></span>
				        </td>
       					<td>  
       					<%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){ %>   			
         					<html:text property="datePhyInspec_v2" styleClass="nonedit" styleId="datePhyInspec_v2" readonly="true" size="15" maxlength="11" onchange="calNextDate(2)"/>
        					<input type="image" src="img/calendara.gif" name="Image723" id="datePhy2" onclick="return showCalendar('datePhyInspec_v2', 'dd/mm/y')"
   			  					onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        					<html:errors property="datePhyInspec_v2"/>
        				<%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){  %>
           					<html:text property="datePhyInspec_v2" styleClass="nonedit" styleId="datePhyInspec_v2" readonly="true" size="15" maxlength="11" onchange="calNextDate(2)"/>
        					<input type="image" src="img/calendara.gif" name="Image723" id="datePhy2" onclick="return showCalendar('datePhyInspec_v2', 'dd/mm/y')"
   			 					 onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        					<html:errors property="datePhyInspec_v2"/>
    					<%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){  %>
     						<html:text property="datePhyInspec_v2" styleClass="nonedit" styleId="datePhyInspec_v2" readonly="true" size="15" maxlength="11" onchange="calNextDate(2)"/>
        					<input type="image" src="img/calendara.gif" name="Image723" id="datePhy2" onclick="return showCalendar('datePhyInspec_v2', 'dd/mm/y')"
   			  					onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        					<html:errors property="datePhyInspec_v2"/>
    					<%} %>
    					</td>
    					<td class="fieldname">
    						<bean:message key="label.security.next.phy.verification.date"/><font color="red">*</font>
    					</td>
  						<td>
  							<%if("true".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){ %>   			
					        <html:text property="nextPhysInspDate_v2" styleClass="nonedit" styleId="nextPhysInspDate_v2" readonly="true" size="15" maxlength="11"/>
        					<input type="image" src="img/calendara.gif" name="Image723" id="dateIns2" onclick="return showCalendar('nextPhysInspDate_v2', 'dd/mm/y')"
   			  					onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        					<html:errors property="nextPhysInspDateError_v2"/>
        					<%}else if("false".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){  %>
           					<html:text property="nextPhysInspDate_v2" styleClass="nonedit" styleId="nextPhysInspDate_v2" readonly="true" size="15" maxlength="11" />
        					<input type="image" src="img/calendara.gif" name="Image723" id="dateIns2" onclick="return showCalendar('nextPhysInspDate_v2', 'dd/mm/y')"
   			  					onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" disabled="true"></input>
        					<html:errors property="nextPhysInspDateError_v2"/>
    					<%}else if("".equalsIgnoreCase(colForm.getIsPhysInsp_v2())){  %>
     						<html:text property="nextPhysInspDate_v2" styleClass="nonedit" styleId="nextPhysInspDate_v2" readonly="true" size="15" maxlength="11"/>
        					<input type="image" src="img/calendara.gif" name="Image723" id="dateIns2" onclick="return showCalendar('nextPhysInspDate_v2', 'dd/mm/y')"
   			  					onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" ></input>
        					<html:errors property="nextPhysInspDateError_v2"/>
    					<%} %>
    				   </td>
				    </tr>
				    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">              
						<td class="fieldname">
							<bean:message key="label.remarks"/>
						</td>
						<td colspan="3">
							<html:textarea property="remarksProperty_v2" styleClass="nonedit" styleId="remarksProperty_v2" rows="5" cols="120" style="width:100%" />&nbsp;
		                	<html:errors property="remarksProperty_v2"/>&nbsp;
		                </td>
					</tr>
				</table>
			</td>
		</tr>
	</tbody>
</table>

<!--Code End-->
<script>
function setVisibility(elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
}

function refreshRegionId2(dropdown)
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
		clearDisplayDropdown('locationState_v2');
		clearDisplayDropdown('nearestCity_v2');
}
 var dep = 'region_v2';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_region_id_v2&countryId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function refreshStateId2(dropdown)
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
	clearDisplayDropdown('nearestCity_v2');
 }
 var dep = 'locationState_v2';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_state_id_v2&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshCityId2(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'nearestCity_v2';
 var url = '/cms/PropCommGeneralCollateral.do?event=refresh_city_id_v2&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}

/* function calNextDate2(){
	var frequency=document.getElementById("commonRevalFreq").value;
	var day=document.forms[0].valuationDate_v1.value;

var day2=document.forms[0].valuationDate_v2.value;
var day3=document.forms[0].valuationDate_v3.value;
var dayDate='';
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
alert("dayDate:"+dayDate+" day2Date:"+day2Date+" day3Date:"+day3Date+" dayTime:"+dayTime+" day2Time:"+day2Time+" day3Time:"+day3Time);

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


if(maxValue==val1_version){
	val1IsAdded=true;
	alert("inside condition1");
	
}else if (maxValue==val2_version && waiver_var==false && deferral_var == false){
	val2IsAdded=true;
	alert("inside condition2");

}
else if (maxValue==val3_version ){
	val3IsAdded=true;
	alert("inside condition2");

}
alert("val1IsAdded:"+val1IsAdded+" val2IsAdded:"+val2IsAdded+" val3IsAdded:"+val3IsAdded);
/* if(dayTime>day2Time){
	alert("dayTime greter than 2");
}else if(dayTime>day3Time){
	alert("dayTime greter than 3");
}else if(day3Time>day2Time){
	alert("day3Time greter 2");
} */

/* var val="";

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
	alert("1");
	if(dayTime==day2Time) {
		alert("2");
		val= "1";
	}	
	else if(dayTime<day2Time)  {
		alert("3");
		val= "1";
		
	}else if (day2Time<dayTime)  {
		alert("4");
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
}

alert("val:"+val);
if(val=="1"){
	day=day;	
}else if (val=="2"){
	day=day2;	
}else if (val=="3"){
	day=day3;	
}
alert("day:"+day);

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
	} */

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
			document.getElementById("mandatorylandValue_v2").style.display='';
			document.getElementById("mandatoryBuildingValue_v2").style.display='none';
			document.getElementById("mandatoryReconstructionValueOfTheBuilding_v2").style.display='none';
		}
		else {
			document.getElementById("mandatorylandValue_v2").style.display='none';
			document.getElementById("mandatoryBuildingValue_v2").style.display='';
			document.getElementById("mandatoryReconstructionValueOfTheBuilding_v2").style.display='';
		}
} 
 */


function totalValue2() {
	/* //alert(amt.value);
	var value = parseFloat((amt.value).replace(',',''));
	if(isNaN(value)  || amt.value.trim()=="") {    
		value=0;
	}
		document.getElementById('totalPropertyAmount_v2').value = parseFloat((document.getElementById('totalPropertyAmount_v2').value).replace(',',''))+value;
		document.getElementById('amountCMV').value = parseFloat((document.getElementById('amountCMV').value).replace(',',''))+value;
		calculateLoanableAmount1(); */
		<%-- var totalPropertyAmount_v2=<%=iCol.getTotalPropertyAmount().getAmount()%> --%>
		var landValue_v2= parseFloat((document.getElementById('landValue_v2').value).replace(/,/g , ''));
		var buildingValue_v2= parseFloat((document.getElementById('buildingValue_v2').value).replace(/,/g , ''));
		var reconstructionValueOfTheBuilding_v2= parseFloat((document.getElementById('reconstructionValueOfTheBuilding_v2').value).replace(/,/g , ''));
		 
		/* if(isNaN(totalPropertyAmount_v2)){
			totalPropertyAmount_v2=0;
		} */
		if(isNaN(landValue_v2)){
			landValue_v2=0;
			document.getElementById('landValue_v2').value=0;
		}
		if(isNaN(buildingValue_v2)){
			buildingValue_v2=0;
			document.getElementById('buildingValue_v2').value=0;
		}
		if(isNaN(reconstructionValueOfTheBuilding_v2)){
			reconstructionValueOfTheBuilding_v2=0;
			document.getElementById('reconstructionValueOfTheBuilding_v2').value=0;
		}
		
	var total=landValue_v2+buildingValue_v2;//+reconstructionValueOfTheBuilding_v2;	
	document.getElementById('totalPropertyAmount_v2').value = total;//+totalPropertyAmount_v2;
	//document.getElementById('amountCMV').value =total;//+parseFloat(document.getElementById('amountCMV').value);
	
	calculatLowestSecurityomv();
	calculateLoanableAmount1();
	dispAmtInWords(document.getElementById('totalPropertyAmount_v2'));
	calNextDate2();
}
 
 function convertToSqfeet2(area,areaUnit,type){
 	
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
 		document.getElementById('inSqftBuiltupArea_v2').value = valueInSqft;
 	} 
 	else if(type=="land"){
 		document.getElementById('inSqftLandArea_v2').value = valueInSqft;
 	}
 }

 function addRevaluation2(){
	 
	 var answer=  confirm("You have clicked on ADD button.Do you want proceed.");
		
		if(answer == true){
	 resetOnChangeListeners('2');
	 if(document.getElementById('waiver').attributes['default']){
	 	document.getElementById('waiver').onchange = null;
	 	document.getElementById('waiver').removeAttribute("nonedit");
	 	document.getElementById('waiver').removeAttribute("ele_onchange");
	 	document.getElementById('waiver').removeAttribute("default");
	 }
	 if(document.getElementById('deferral').attributes['default']){
	 	document.getElementById('deferral').onchange = null;
	 	document.getElementById('deferral').removeAttribute("nonedit");
	 	document.getElementById('deferral').removeAttribute("ele_onchange");
	 	document.getElementById('deferral').removeAttribute("default");
	 }
	 if(document.getElementById('deferralId').attributes['default']){
	 	document.getElementById('deferralId').onchange = null;
	 	document.getElementById('deferralId').removeAttribute("nonedit");
	 	document.getElementById('deferralId').removeAttribute("ele_onchange");
	 	document.getElementById('deferralId').removeAttribute("default");
	 }
	// alert("add revaluation 1");
	// alert("date physical Inspe:"+document.getElementById("datePhyInspec_v2").value);
	
	 var currDate='<%=todayDate%>';
	// alert("currDate:"+currDate);
	 document.getElementById("val2_id").value='';
	 
	 var version2_db=<%=version2%>;
	// alert("version2 before:"+version2_db);
	 document.getElementById("version2").value=version2_db+1;
	// alert("version2 after:"+document.getElementById("version2").value);
	 
	 document.getElementById("ImageValuationDate_v2").disabled=false;
	 document.getElementById("valcreationdate_v2").value=currDate;
	// alert("11");
	 document.getElementById("totalPropertyAmount_v2").value='';
	// alert("12");
	 document.getElementById("valuationDate_v2").value='';
	 document.getElementById("ImageValuationDate_v2").disabled =false; 
	// alert("13");
	 document.getElementById("valuatorCompany_v2").value='';
	// alert("14");
	 document.getElementById("categoryOfLandUse_v2").value='';
//	 alert("15");
	 document.getElementById("developerName_v2").value='';
	 document.getElementById("country_v2").value='';
	 document.getElementById("region_v2").value='';
	 document.getElementById("locationState_v2").value='';
	 document.getElementById("nearestCity_v2").value='';
	 document.getElementById("pinCode_v2").value='';
//	 alert("16");
	 document.getElementById("landArea_v2").value='';
	 document.getElementById("landUOM_v2").value='';
	 document.getElementById("inSqftLandArea_v2").value='';
	 document.getElementById("builtupArea_v2").value='';
	// alert("17");
	 document.getElementById("builtUpAreaUnit_v2").value='';
	 document.getElementById("inSqftBuiltupArea_v2").value='';
	 document.getElementById("landValue_v2").value='';
	 document.getElementById("buildingValue_v2").value='';
	// alert("18");
	 document.getElementById("reconstructionValueOfTheBuilding_v2").value='';
	 document.getElementById("propertyCompletionStatus_v2ID").value='';
	 document.getElementById("isPhysInsp_v2").checked = false;
	 document.getElementById("physInspFreqUOM_v2").value='';
	// alert("19");
	 document.getElementById("datePhyInspec_v2").value='';
	 document.getElementById("nextPhysInspDate_v2").value='';
	 document.getElementById("remarksProperty_v2").value='';
	// alert("20");
	document.getElementById("totalPropertyAmount_v2_InWords").value = "";
	document.getElementById("landValue_v2_InWords").value = "";
	document.getElementById("reconstructionValueOfTheBuilding_v2_InWords").value = "";
	document.getElementById("buildingValue_v2_InWords").value = "";
	document.getElementById("waiver").checked = false;
	document.getElementById("deferral").checked = false;
	enableDeferralId(null, document.getElementById("deferral"));
		}
 }
 
 function viewPreviousValuation2(){
	// alert("viewPreviousValuation");
	 var preValDate_v2Var = document.getElementById("preValDate_v2").value;
	 if(preValDate_v2Var==""){
		 alert("Please select value from Previous valuation date.");
	 }
//	 alert("preValDate_v2Var:"+preValDate_v2Var);
else{
	  document.forms[0].event.value="viewPreviousValuation2";
	 document.forms[0].submit(); 
}
 }

window.onload = function(){
//	alert("val2_id:"+ document.getElementById("val2_id").value);
 if( document.getElementById("val2_id").value==''){
	 document.getElementById("ImageValuationDate_v2").disabled=false;
 }else{
	 document.getElementById("ImageValuationDate_v2").disabled=true; 
 }
}
function enableDeferralId(action, deferral) {
	if(action != null && cantEditChanges('2')) return;
	if(deferral && deferral.checked){
		document.getElementById("deferralIdSpan").style.display = '';
		document.getElementById("deferralId").disabled = false;
	}else{
		document.getElementById("deferralIdSpan").style.display = 'none';
		document.getElementById("deferralId").disabled = true;
		document.getElementById("deferralId").value = "";
	}
}

var deferral = document.getElementById("deferral");
enableDeferralId(null, deferral);
</script>
