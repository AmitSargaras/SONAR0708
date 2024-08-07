<table width="70%" align="center" border="0" cellpadding="0" cellspacing="0">
	
    <tr>
      <td><h3><bean:message key="title.property.valuation.item.by.index.add"/> All Residential Houses </h3></td>
    </tr>
    
    <tr>
    	<td><hr></td>
  	</tr> 
  	
    <tr> 
    	<td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
        <tbody>
              
        <tr class="odd"> 
         <td width="32%" class="fieldname"><bean:message key="label.property.valuation.by.index.year"/>&nbsp;<font color="#0000FF">*</font></td>
         <td width="68%">
               <html:select name="PropertyIdxItemForm" property="idxYear"  >
                  <option value=""><bean:message key="label.please.select"/></option>
       						<html:options name="yearValue" labelName="yearLabel" />
                </html:select>
                <html:errors property="yearError" />
         </td>
        </tr>
        
        <tr class="even"> 
         <td class="fieldname"><bean:message key="label.property.valuation.by.index.annual.quarter"/>&nbsp;<font color="#0000FF">*</font></td>
         <td>
               <html:select name="PropertyIdxItemForm" property="idxType"  >
                  <option value=""><bean:message key="label.please.select"/></option>
       						<html:options name="propIdxTypeValue" labelName="propIdxTypeLabel"/>
                </html:select>
                <html:errors property="typeError" />	
         </td>
         
         <tr class="odd"> 
         <td class="fieldname"><bean:message key="label.property.valuation.by.index"/>&nbsp;<font color="#0000FF">*</font></td>
         <td>
            <html:text property="idxValue" onkeypress="return killEnter(window.event);"/>
			       &nbsp;
			      <html:errors property="valueError" />	
         </td>
         
        </tr>
           
    	</tbody>
		</table>
      
 		</td>
		</tr>
    	
		<tr>
      		<td colspan="2"><html:errors property="itemExistError"/></td>
    	</tr>
		<tr>
      		<td colspan="2">&nbsp;</td>
    	</tr>
</table>


  
<table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
    <td><a href="javascript:performSubmit()"><img src="img/ok1.gif" border="0" /></a></td>
    <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>

