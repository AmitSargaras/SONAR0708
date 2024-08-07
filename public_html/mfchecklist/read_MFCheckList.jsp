<%@ page import="java.util.Locale,
				 java.util.List,
				 java.math.BigDecimal,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.propertyparameters.bus.marketfactor.IMFTemplate,
                 com.integrosys.cms.ui.mfchecklist.MFCheckListForm,              
				 com.integrosys.cms.app.collateral.trx.marketfactor.IMFChecklistTrxValue,
				 com.integrosys.cms.app.collateral.trx.marketfactor.OBMFChecklistTrxValue" %>
<%
	String event = request.getParameter("event");
    System.out.println("event = " + event);
      
    IMFTemplate[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.app.propertyparameters.trx.marketfactor.OBMFTemplateTrxValue");
    System.out.println("obj = " + obj);
    
	

    if( obj != null ) {
        IMFChecklistTrxValue obTrxValue = (OBMFChecklistTrxValue)obj;		
	}	
    
	MFCheckListForm form = (MFCheckListForm)request.getAttribute("MFCheckListForm");
  
%>
<tbody>
<bean:define id="formObj" name="MFCheckListForm" scope="request" type="com.integrosys.cms.ui.mfchecklist.MFCheckListForm"/>

<table class="tblFormSection" width="60%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3>Marketability Factor Input</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
     <tr>
         <td>
             <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
             <tbody>
             <html:hidden property="MFTemplateName"/>
             <tr class="odd">
      			<td width="58%" ><h4><bean:message key="label.marketability.factor.template.name"/></h4></td>
      			<td>								
					<bean:write name="MFCheckListForm" property="MFTemplateName" />
		 		</td>
    	    </tr>

    	    <tr class="even">
    	    	<td width="58%" ><h4><bean:message key="label.marketability.factor.last.updated"/></h4></td>
    	    	<td><bean:write name="MFCheckListForm" property="lastUpdateDate" /></td>
    	    	<html:hidden property="lastUpdateDate"/> 
    	    	
    	    	</tr>
    	    </tbody>
    	    </table>
    	 </td>
     </tr>
     <tr><td>&nbsp;</td></tr>
     <tr><td>&nbsp;</td></tr>
     
     <tr>
     <td>
     	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        	<thead>
        	<tr>
        		<td width="5%"><bean:message key="label.marketability.factor.sn"/></td>
        		<td width="20%"><bean:message key="label.marketability.factor.factor.description"/></td>
        		<td width="20%"><bean:message key="label.marketability.factor.weightage"/></td>
        		<td width="35%"><bean:message key="label.marketability.factor.valuer.assigned.factor"/></td>
        		<td width="20%"><bean:message key="label.marketability.factor.weighted.score"/></td>
        	</tr>
        	</thead>
        	<tbody>
        	
        	<%
        	double total =0;
        	%>
        	
          <logic:present name="MFCheckListForm" property="MFItemList" scope="request">
		  <bean:define id="itemSize" value="<%= String.valueOf(formObj.getMFItemList().size()) %>" />
		  <logic:notEqual name="itemSize" value="0"> 
                    <logic:iterate id="itemList" indexId="itemListID" name="MFCheckListForm" property="MFItemList" scope="request" 
                     type="com.integrosys.cms.app.collateral.bus.type.property.marketfactor.IMFChecklistItem">
                     
                     <tr class="<%=(itemListID.intValue() + 1)%2==0?"even":"odd"%>">    
                        <td class="index">
                          <%= itemListID.intValue() + 1 %>
                        </td>
                        <td>
                          &nbsp;<bean:write name="itemList" property="factorDescription" />
                        </td>
                        <td>
                          &nbsp;<bean:write name="itemList" property="weightPercentage"  format="0.00"/>
                        </td>
                        <td>
                          &nbsp;<bean:write name="itemList" property="valuerAssignFactor" format="0.00"/> 
                        </td>
						<td>
                          &nbsp;<bean:write name="itemList" property="weightScore" format="0.00"/>
                        </td>
                        
                         <%                           		
							
							if(itemList.getWeightScore()!= 0){
	                     		BigDecimal weightScoreBD = new BigDecimal(itemList.getWeightScore());
								weightScoreBD = weightScoreBD.setScale(2,BigDecimal.ROUND_HALF_UP); 
                      			total += weightScoreBD.doubleValue();
                      			
                  			}
                      		BigDecimal totalBD = new BigDecimal(total);
							totalBD = totalBD.setScale(2,BigDecimal.ROUND_HALF_UP); 
							total = totalBD.doubleValue();
                      		
                      	%>
					
                      </tr>   
                    </logic:iterate>
                    
                    <tr>
                      	<td>&nbsp;</td>
                      	<td>&nbsp;</td>
                      	<td>&nbsp;</td>
                      	<td>Total: </td>
                      	<td><%=total%></td>
                      </tr>
		  </logic:notEqual>
		  <logic:equal name="itemSize" value="0">
		    <tr class="odd">
                      <td colspan="8">There is no MF Item.</td>
                    </tr>	
		  </logic:equal>	
                </logic:present>
                <logic:notPresent name="MFCheckListForm" property="MFItemList" scope="request">
                  <tr class="odd">
                    <td colspan="8">There is no MF Item.</td>
                  </tr>
                </logic:notPresent>
              </tbody>
     	</table>
     </td>
     </tr>
	</tbody>
</table>
</tbody>
