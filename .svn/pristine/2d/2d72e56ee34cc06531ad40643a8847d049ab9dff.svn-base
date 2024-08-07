<input type="hidden" name="searchItem" value="" />
<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0">
    
    <tr>
      <td><h3><bean:message key="title.property.valuation.item.by.index.add"/> States and Types of Property </h3></td>
    </tr>
    
    <tr>
    	<td><hr></td>
  	</tr> 
     
    <tr> 
      <td>
      
      	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <tbody>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.property.valuation.by.index.type.of.property"/>&nbsp;<font color="#0000FF">*</font></td>
              <td style="border-left:0;border-right:0;text-align:left">
              <html:select property="unselectedPropertyType" size="10" multiple="true" style="width:300">
                    <% for(int i=0; i<propertyTypeFullListLabel.size(); i++){
                         if(selectedPropertyTypeVals==null || !Arrays.asList(selectedPropertyTypeVals).contains(propertyTypeFullList.get(i))){  //if this value not in selected value print..
                    %>
                           <option value='<%=propertyTypeFullList.get(i)%>'><%=propertyTypeFullListLabel.get(i)%></option>
                           
                    <%
                         }
                       }
                    %>
                  </html:select>
                  <br><html:errors property="propertyTypeError"/>
              </td>
              <td style="border-left:0;border-right:0;text-align:center">
              <input name="AddPropertyType" type="button" class="btnNormal" style="width:80" value="Add &gt;&gt;"
									onclick="addOption(this.form.unselectedPropertyType, this.form.selectedPropertyType)"/>
			  <br/><br/>
			  <input name="RemovePropertyType" type="button" class="btnNormal" style="width:80" value="&lt;&lt; Remove"
									onclick="addOption(this.form.selectedPropertyType, this.form.unselectedPropertyType)"/>
			  </td>
              <td style="text-align:right; border-left:0">
                <html:select property="selectedPropertyType" size="10" multiple="true" style="width:260">
                    <% for(int i=0; i<propertyTypeFullListLabel.size(); i++){
                         if(selectedPropertyTypeVals!=null && Arrays.asList(selectedPropertyTypeVals).contains(propertyTypeFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=propertyTypeFullList.get(i)%>'><%=propertyTypeFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>
                      
            <tr class="even">
              <td class="fieldname"><bean:message key="label.property.valuation.by.index.state"/>&nbsp;<font color="#0000FF">*</font></td>
              <td colspan="3" class="tblInput">
    			    <html:select name="PropertyIdxItemForm" property="state" onchange="changeCountry()" >
                  <option value=""><bean:message key="label.please.select"/></option>
                  <html:options collection="stateList" property="label" labelProperty="value"/>
              </html:select>
              <html:errors property="stateError"/>
              </td>
            </tr>
            
            
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.property.valuation.by.index.district"/></td>
              <td style="border-left:0;border-right:0;text-align:left">
              <html:select property="unselectedDistrict" size="10" multiple="true" style="width:300">
              <% for(int i=0; i<districtFullListLabel.size(); i++){
                         if(selectedDistrictVals==null || !Arrays.asList(selectedDistrictVals).contains(districtFullList.get(i))){  //if this value not in selected value print..
                    %>
                           <option value='<%=districtFullList.get(i)%>'><%=districtFullListLabel.get(i)%></option>
                           
                    <%
                         }
                       }
                    %> 
              </html:select>
              <br><html:errors property="districtError"/>
              </td>
              <td style="border-left:0;border-right:0;text-align:center">
              <input name="AddDistrict" type="button" class="btnNormal" style="width:80" value="Add &gt;&gt;"
									onclick="addOption(this.form.unselectedDistrict, this.form.selectedDistrict)"/>
			  <br/><br/>
			  <input name="RemoveDistrict" type="button" class="btnNormal" style="width:80" value="&lt;&lt; Remove"
									onclick="addOption(this.form.selectedDistrict, this.form.unselectedDistrict)"/>
			  </td>
              <td style="text-align:right; border-left:0">
                <html:select property="selectedDistrict" size="10" multiple="true" style="width:260">
                    <% for(int i=0; i<districtFullListLabel.size(); i++){
                         if(selectedDistrictVals!=null && Arrays.asList(selectedDistrictVals).contains(districtFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=districtFullList.get(i)%>'><%=districtFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>
            
            <tr class="even">
              <td class="fieldname"><bean:message key="label.property.valuation.by.index.mukim"/></td>
              <td style="border-left:0;border-right:0;text-align:left">
              <html:select property="unselectedMukim" size="10" multiple="true" style="width:300">
                    <% for(int i=0; i<mukimFullListLabel.size(); i++){
                         if(selectedMukimVals==null || !Arrays.asList(selectedMukimVals).contains(mukimFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=mukimFullList.get(i)%>'><%=mukimFullListLabel.get(i)%></option>
                           
                    <%
                         }
                       }
                    %>
                  </html:select>
                  <br><html:errors property="mukimError"/>
              </td>
              <td style="border-left:0;border-right:0;text-align:center">
              <input name="AddMukim" type="button" class="btnNormal" style="width:80" value="Add &gt;&gt;"
									onclick="addOption(this.form.unselectedMukim, this.form.selectedMukim)"/>
			  <br/><br/>
			  <input name="RemoveMukim" type="button" class="btnNormal" style="width:80" value="&lt;&lt; Remove"
									onclick="addOption(this.form.selectedMukim, this.form.unselectedMukim)"/>
			  </td>
              <td style="text-align:right; border-left:0">
                <html:select property="selectedMukim" size="10" multiple="true" style="width:260">
                    <% for(int i=0; i<mukimFullListLabel.size(); i++){
                         if(selectedMukimVals!=null && Arrays.asList(selectedMukimVals).contains(mukimFullList.get(i))){  //if this value not in selected value print..
                    %>
                            <option value='<%=mukimFullList.get(i)%>'><%=mukimFullListLabel.get(i)%></option>
                    <%
                         }
                       }
                    %>
                  </html:select>
              </td>
            </tr>  
            
            <tr class="odd"> 
         	<td width="32%" class="fieldname"><bean:message key="label.property.valuation.by.index.year"/>&nbsp;<font color="#0000FF">*</font></td>
         	<td width="68%" colspan="3">
            <html:select name="PropertyIdxItemForm" property="idxYear"  >
            	<option value=""><bean:message key="label.please.select"/></option>
       			<html:options name="yearValue" labelName="yearLabel" />
            </html:select>
            <html:errors property="yearError" />
         	</td>
        	</tr>
        
        	<tr class="even"> 
         		<td class="fieldname"><bean:message key="label.property.valuation.by.index.annual.quarter"/>&nbsp;<font color="#0000FF">*</font></td>
         		<td colspan="3">
            		<html:select name="PropertyIdxItemForm" property="idxType"  >
                	<option value=""><bean:message key="label.please.select"/></option>
       				<html:options name="propIdxTypeValue" labelName="propIdxTypeLabel"/>
                	</html:select>
                	<html:errors property="typeError" />	
         		</td>
         	</tr>
         
         	<tr class="odd"> 
         		<td class="fieldname"><bean:message key="label.property.valuation.by.index"/>&nbsp;<font color="#0000FF">*</font></td>
         		<td colspan="3">
            	<html:text property="idxValue" onkeypress="return killEnter(window.event);"/>
			       &nbsp;
			    <html:errors property="valueError" />	
         	</td>
         
        	</tr>
			</tbody>
   
		</table>
            <tr>
	      		<td colspan="2"><html:errors property="itemExistError"/></td>
	    	</tr>
        

		</td>
    </tr>
    
    <tr> 
      <td align="center">&nbsp;</td>
    </tr>
    <tr>
      <td align="center"><a href="javascript:performSubmit()"><img src="img/ok1.gif" border="0" /></a>&nbsp;&nbsp;
      <a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
    </tr>
    <tr>
      <td align="center">&nbsp;</td>
    </tr>
    
    
</table>

