<%@ page import="java.util.Locale,
				 java.util.List,
				 java.util.Arrays,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateUIHelper,
                 com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateForm,                
                 com.integrosys.cms.app.propertyparameters.bus.marketfactor.IMFItem,
				 com.integrosys.cms.app.propertyparameters.trx.marketfactor.IMFTemplateTrxValue,
				 com.integrosys.cms.app.propertyparameters.trx.marketfactor.OBMFTemplateTrxValue" %>
<%
    MFTemplateUIHelper helper = new MFTemplateUIHelper();
	
	Object obj = session.getAttribute("com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateAction.MFTemplateTrxObj");

    if( obj != null ) {
        IMFTemplateTrxValue obTrxValue = (OBMFTemplateTrxValue)obj;		
	}	
    
	MFTemplateForm form = (MFTemplateForm)request.getAttribute("MFTemplateForm");
	List collateralSubTypeFullList = (List)request.getAttribute("collateralSubTypeFullList");
    List collateralSubTypeFullListLabel = (List)request.getAttribute("collateralSubTypeFullListLabel");
    
    String[] selectedColSubTypeVals = form.getSecSubType();	
%>
<tbody>
<bean:define id="formObj" name="MFTemplateForm" scope="request" type="com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateForm"/>

<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<html:hidden property="MFTemplateID"/>
    <tr class="odd">
        <td class="<%= formObj.getMFTemplateNameClass() %>" width="20%"><bean:message key="label.mftemplate.templatename"/>&nbsp; <font color="#0000FF">*</font></td>
        <td colspan="3" width="30%">
            <bean:write name="formObj" property="MFTemplateName"/>&nbsp;
        </td>        
    </tr>     

    <tr class="even">
        <td class="<%= formObj.getMFTemplateStatusClass() %>" width="20%"><bean:message key="label.status"/>&nbsp; <font color="#0000FF">*</font></td>
        <td colspan="3" width="30%">
            <% if (ICMSConstant.MF_STATUS_ACTIVE.equals(formObj.getMFTemplateStatus())) {
            %>
            <bean:message key="label.active"/>&nbsp;
            <%
            } else {
            %>
            <bean:message key="label.inactive"/>&nbsp;
            <%
                }
            %>
        </td>        
    </tr>
	<tr class="odd">
        <td class="<%= formObj.getSecTypeClass() %>" width="20%"><bean:message key="label.security.type"/>&nbsp;</td>
        <td colspan="3" width="30%">
            <%= helper.getSecurityTypeDesc( formObj.getSecType() ) %>
        </td>        
    </tr>
	<tr class="even">
		<td class="<%= formObj.getSecSubTypeClass() %>">
			<bean:message key="label.security.sub.type"/>&nbsp;<font color="#0000FF">*</font>
		</td>
		<td width="38%" height="171">
			<select name="unselectSecSubType" size="10" multiple="multiple" disabled="true" id="unselectSecSubType" style="width:260">
				<% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
					 if(selectedColSubTypeVals==null || !Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
				%>
						<option value='<%=collateralSubTypeFullList.get(i)%>'><%=collateralSubTypeFullListLabel.get(i)%></option>
				<%
					 }
				   }
				%>
			</select>
			<br><html:errors property="securitySubTypeError"/>
		</td>
		<td>
			<br/><br/><br/><br/>
			<input name="AddSubType" type="button" class="btnHighlight" disabled="true" value="<bean:message key="label.autovalparam.button.add"/>&gt;&gt;"
				onclick="addOption(this.form.unselectSecSubType, this.form.secSubType, '')"/>
			<br/>
			<input name="RemoveSubType" type="button" class="btnHighlight" disabled="true" value="&lt;&lt;<bean:message key="label.autovalparam.button.remove"/>"
				onclick="addOption(this.form.secSubType, this.form.unselectSecSubType, '')"/>
			<br/><br/><br/><br/><br />
		</td>
		<td width="38%">
			<select name="secSubType" size="10" multiple="multiple" disabled="true" id="secSubType" style="width:260">
				<% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
					 if(selectedColSubTypeVals!=null && Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
				%>
						<option value='<%=collateralSubTypeFullList.get(i)%>'><%=collateralSubTypeFullListLabel.get(i)%></option>
				<%
					 }
				   }
				%>
			</select>
		</td>
	</tr>
</tbody>
</table>
</td>
</tr>
</tbody>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="title.mftemplate.factor.detail"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead>
                        <tr>
                            <td width="2%"><bean:message key="label.global.sn"/></td>
                            <td width="18%"><bean:message key="label.mfitem.factordesc"/></td>
                            <td width="15%"><bean:message key="label.mfitem.weightpercentage"/></td> 			   
                        </tr>
                    </thead>
                    
					<tbody>					   
                        <logic:present name="MFTemplateForm" property="MFItemList" scope="request">
                            <bean:define id="itemSize" value="<%= String.valueOf(formObj.getMFItemList().size()) %>"/>
                            <logic:notEqual name="itemSize" value="0">
                                <logic:iterate id="itemObj" indexId="itemInd" name="MFTemplateForm" 
											property="MFItemList" scope="request"
                                            type="java.lang.Object">
                                    <% String headerClass = "index";
                                        IMFItem item = null;
                                        if (itemObj instanceof CompareResult) {
                                            item = (IMFItem) ((CompareResult) itemObj).getObj();
                                            headerClass = ((CompareResult) itemObj).getKey();
                                        } else {
                                            item = (IMFItem) itemObj;
                                        } 
									%>
                                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
                                        <td class="<%=headerClass%>">
                                            <%= itemInd.intValue() + 1 %>
                                        </td>
                                        <td>
                                            &nbsp;<integro:wrapper value="<%=item.getFactorDescription()%>"/>
                                        </td>                                       
                                        <td>
                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf( item.getWeightPercentage() )%>"/>
                                        </td>                                       
					
                                    </tr>
                                </logic:iterate>
                            </logic:notEqual>
                            <logic:equal name="itemSize" value="0">
                                <tr class="odd">
                                    <td colspan="6"><bean:message key="label.mftemplate.nofactor"/></td>
                                </tr>
                            </logic:equal>
                        </logic:present>
                        <logic:notPresent name="MFTemplateForm" property="MFItemList" scope="request">
                            <tr class="odd">
                                <td colspan="6"><bean:message key="label.mftemplate.nofactor"/></td>
                            </tr>
                        </logic:notPresent>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>

