      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
  
            <%
           		int rowIdx = 0;
            %>
			<tbody>            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname" width="20%"><bean:message key="label.customer.id"/></td>
              <td width="30%"><bean:write name="customerOb" property="CMSLegalEntity.LEReference" scope="request" /></td>
              <td class="fieldname" width="20%"><bean:message key="label.global.legal.name"/></td>
              <td width="30%"><bean:write name="customerOb" property="CMSLegalEntity.legalName" scope="request" /></td>
            </tr>

						<% if (PropertyManager.getValue("build.model", "cms").equalsIgnoreCase("ems")) { %>            
				            <tr class="even">
				              <td class="fieldname"><bean:message key="label.customer.subprofile.id"/></td>
				              <td width="30%"><bean:write name="customerOb" property="customerReference" scope="request" /></td>
				              <td class="fieldname"><bean:message key="label.customer.subprofile.name"/></td>
				              <td width="30%"><bean:write name="customerOb" property="customerName" scope="request" /></td>
				            </tr>
				    <% } %>
				    
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">Domicile Country</td>
              <td>
              	<integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(obCMSCustomer.getDomicileCountry())%>"/>
              </td>
              <td class="fieldname">Referred (Bankcrupt, Writen-Off)</td>
              <td><integro:boolean-display style="yn" value="<%=legal.getBlackListedInd()%>"/></td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">Incorporate Country </td>
              <td>
                <%String cty = null;
                if(!(legal.getLegalRegCountry().equals(null) || legal.getLegalRegCountry().equals(""))){
                  cty = CountryList.getInstance().getCountryName(legal.getLegalRegCountry());
                }
                %>
                <integro:empty-if-null value="<%=cty%>" />&nbsp;</td>
            	<td class="fieldname">ID No. (E.g. Business Reg No., IC No.)</td>
            	<td><bean:write name="customerOb" property="CMSLegalEntity.legalRegNumber"/>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Incorporate Date </td>
                    <td><integro:date object="<%=legal.getIncorporateDate()%>"/>&nbsp;</td>
            		<td class="fieldname">ID Description (Personal, Corporate) </td>
            		<td>
            			 <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ID_TYPE,legal.getIDType())%>" />
            			 &nbsp;
            		</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname">Nature of Business Code</td>
              <td><integro:empty-if-null value="<%=isiccd%>" /></td>
              <td class="fieldname">Relationship Start Date </td>
              <td><integro:date object="<%=legal.getRelationshipStartDate()%>"/>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Nature of Business<!-- (ISIC)--> </td>
                    <td><integro:empty-if-null value="<%=isicdesc%>" />&nbsp;</td>
            		<td class="fieldname">&nbsp;</td>
            		<td>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Market Segment</td>
            		<td>
            				<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_SEGMENT,legal.getCustomerSegment())%>" />
            				&nbsp;
            		</td>
            		<td class="fieldname">&nbsp;</td>
            		<td>&nbsp;</td>
            </tr>            
				  	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				  		<td class="fieldname" width="20%">Business Group</td>
				  		<td width="30%"><bean:write name="customerOb" property="CMSLegalEntity.businessGroup"/>&nbsp;</td>
				  		<td class="fieldname">Business Sector</td>
                        <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.BUSSINESS_SECTOR,legal.getBusinessSector())%>" />&nbsp;</td>
				  	</tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            		<td class="fieldname">Customer Type </td>
            		<td>
            			<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_TYPE,legal.getCustomerType())%>"/>
            			&nbsp;
            		</td>
            		<td class="fieldname">Customer Legal Constitution</td>
            		<td>
            		<%
					String legalConstitution = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CUSTOMER_LEGAL_CONST, legal.getSourceID(), null, legal.getLegalConstitution());
    				%>
            			<integro:empty-if-null value="<%=legalConstitution%>"/>
            			&nbsp;
            		</td>							
            </tr>            
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
        
                    <%
                        IContact address[] = obCMSCustomer.getCMSLegalEntity().getRegisteredAddress();
                        IContact obContact = null;
                       // IContact obContactOff = null;
                       /* if (address != null) {
                            for (int i = 0; i < address.length; i++) {
                                if (address[i].getContactType() != null &&
                                        address[i].getContactType().equals(ICMSConstant.REGISTERED)) {
                                    obContact = address[i];
                                }
                                if (address[i].getContactType() != null &&
                                        address[i].getContactType().equals(ICMSConstant.OFFICE)) {
                                    obContactOff = address[i];
                                }
                            }
                        }
                        if (obContact == null) {
                            obContact = new OBContact();
                        }
                        if (obContactOff == null) {
                            obContactOff = new OBContact();
                        }
                        */
                        
                        if (address != null) {				
                		for (int i = 0; i < address.length; i++) {
	                		
	                		if (address[i] != null ) {
	                              obContact =  address[i];
                    %>
                    
           <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td width="20%" class="fieldname">Address Type</td>
                        <td width="30%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ADDRESS_TYPE,obContact.getContactType())%>"/></td>
                        <td width="20%" class="fieldname">&nbsp;</td>
                        <td width="30%">&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 1)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine1()%>"/>&nbsp;</td>
                        <td class="fieldname">City</td>
                        <td><integro:empty-if-null value="<%=obContact.getCity()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 2)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine2()%>"/>&nbsp;</td>
                        <td class="fieldname">State</td>
                        <td><integro:empty-if-null value="<%=obContact.getState()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Postal Code</td>
                        <td><integro:empty-if-null value="<%=obContact.getPostalCode()%>"/>&nbsp;</td>
                        <td class="fieldname">Country</td>
                        <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(obContact.getCountryCode())%>"/>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
    
    <tr>
        <td>&nbsp;</td>
    </tr>
     
                    <%		
                			}
                    	} 	
                    } else {
                    
             	%>
 
	
     <% // if(address == null){
	     if (obContact == null) {
             obContact = new OBContact();
         }
	         
     %>
                  
     <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                </thead>
                <tbody>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td width="20%" class="fieldname">Address Type</td>
                        <td width="30%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ADDRESS_TYPE,obContact.getContactType())%>"/></td>
                        <td width="20%" class="fieldname">&nbsp;</td>
                        <td width="30%">&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 1)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine1()%>"/>&nbsp;</td>
                        <td class="fieldname">City</td>
                        <td><integro:empty-if-null value="<%=obContact.getCity()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Address (line 2)</td>
                        <td><integro:empty-if-null value="<%=obContact.getAddressLine2()%>"/>&nbsp;</td>
                        <td class="fieldname">State</td>
                        <td><integro:empty-if-null value="<%=obContact.getState()%>"/>&nbsp;</td>
                    </tr>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname">Postal Code</td>
                        <td><integro:empty-if-null value="<%=obContact.getPostalCode()%>"/>&nbsp;</td>
                        <td class="fieldname">Country</td>
                        <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(obContact.getCountryCode())%>"/>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>      
<%}%>
    <tr>
        <td>&nbsp;</td>
    </tr>
              <% 
                  if (limitprofile != null) {
              %>        
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="20%" class="fieldname">Required AA Security Coverage (%)</td>
              <td width="30%">
	              <%if (sscStatus!=null && sscStatus.equals("N.A."))  {%>
	              <integro:empty-if-null value="<%=aForm.getRequiredSecurityCoverage()%>"/>&nbsp;
	              <% } else {%>
	              <html:text property="requiredSecurityCoverage" maxlength="3" size="20"/>
	              <html:errors property="secCov" /> 
	              <html:errors property="secCov1" />
	              <% } %>
              </td>
              <input type="hidden" name="requiredSecurityCoverage"  value="<%=aForm.getRequiredSecurityCoverage()%>">
              <td width="20%" class="fieldname">Actual AA Security Coverage (%)</td>
              <td width="30%"><%=aForm.getActualSecurityCoverage()%>&nbsp;
              <html:hidden property="actualSecurityCoverage" />
              </td>
               
            </tr>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td width="20%" class="fieldname">Next Annual Review Date</td>
				<td width="30%">
				    <%if(limitprofile.getNextAnnualReviewDate() != null) {%>
		                	<integro:date object="<%=limitprofile.getNextAnnualReviewDate()%>" />&nbsp;
		                     <%} else {%>- <%}%>
		    </td>
		    <td width="20%" class="fieldname">Extended Review Date</td>
		    <td td width="30%">
		        <% if (limitprofile.getExtendedNextReviewDate() == null) { %>
		            -
		        <% } else { %>
		            <integro:date object="<%=limitprofile.getExtendedNextReviewDate() %>" />
		        <% } %>
		    </td>
		  </tr>
		  <% } %>            
          </tbody>
        </table></td>
    </tr>
      <tr>
      <td>&nbsp;</td>
    </tr>
      <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <tbody>
  	<tr>
  		<td>
  			 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
        <tbody>
			  	<%
			  		rowIdx = 0;
			  	%>
			  	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			  		<td class="fieldname">Income Range</td>
			  		<td>
			  			<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.INCOME_RANGE, legal.getIncomeRange())%>"/>
			  			&nbsp;
			  		</td>
			  		<td class="fieldname" width="20%">TFA Amount </td>
                    <td width="30%">
                    <integro:empty-if-null value="<%=legal.getTFAAmount()%>" />&nbsp;</td>
			  	</tr>
			  	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			  		<td class="fieldname">Country of Permanent Residence</td>
			  		<td>
                        <integro:empty-if-null value="<%=CountryList.getInstance().getCountryName( legal.getCountryPR() )%>"/>
			  			&nbsp;
			  		</td>
			  		<td class="fieldname">Old ID No. </td>
                    <td><bean:write name="customerOb" property="CMSLegalEntity.idOldNO"/>&nbsp;</td>
			  	</tr>
  	</tbody></table></td></tr>
  </tbody>
</table>

<%@ include file="/customer/view_credit_rating.jsp"%>