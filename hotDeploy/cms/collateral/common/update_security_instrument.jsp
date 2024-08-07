<%@ page import="java.util.ArrayList,
								java.util.HashMap,
								com.integrosys.cms.ui.common.CommonCodeList"%>
 <tr>
  <td colspan="4" style="border-left:0;border-right:0;border-bottom:0;text-align:center; background-color:#FFFFFF">&nbsp;</td>
</tr>
<script language="JavaScript" type="text/javascript" src="js/itgDualList.js"></script>
<%
		CommonCodeList commonCode = CommonCodeList
		.getInstance(
				null,
				null,
				com.integrosys.cms.ui.collateral.CategoryCodeConstant.CATEGORY_SEC_INST);
		
	 ArrayList secInstrumentValues = (ArrayList) commonCode.getCommonCodeValues();
	 ArrayList secInstrumentLabels = (ArrayList) commonCode.getCommonCodeLabels();		
	 HashMap secInstrumentMap = new HashMap();
	 if(secInstrumentValues==null){
	 		secInstrumentValues = new ArrayList();
	 		secInstrumentLabels = new ArrayList();
	 }
	 
	 for(int index=0;index<secInstrumentValues.size();index++){
		   secInstrumentMap.put(secInstrumentValues.get(index), secInstrumentLabels.get(index));
	}
		 
	 String[] selectedInstrumentArray = colForm.getSecInstrument();
	 HashMap selectedInstrumentMap = new HashMap();
	 if(selectedInstrumentArray!=null){
	 		for(int index=0;index<selectedInstrumentArray.length;index++){
	 			selectedInstrumentMap.put(selectedInstrumentArray[index],selectedInstrumentArray[index]);
	 		}
	 		//System.out.println("All : "+selectedInstrumentArray.length);
	 }
	 //System.out.println("All : "+secInstrumentValues.size()+" - "+secInstrumentLabels.size());
%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="10%" class="fieldname"><bean:message key="label.security.security.instrument"/><span class="mandatory">*</span></td>
    <td colspan="3">
       <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection">
			  <tr class="odd">
			  	<td width="22%" valign="middle" style="border-left:0;border-right:0;border-bottom:0;border-top:0;text-align:center">
						<select name="AllInstrumentList" size="10" multiple id="fieldsAvail" style="width:300">
							<%
								for(int index=0;index<secInstrumentValues.size();index++){
									String tempInstrument = (String)secInstrumentValues.get(index);
									String instrumentCode = (String)selectedInstrumentMap.get(tempInstrument);
		   						if(instrumentCode==null){
		   				%>
		   							<option value="<%=tempInstrument%>"><%=secInstrumentMap.get(tempInstrument)%></option>
		   				<%		
		   						}
		 						}
							%>
            </select>			  
          </td>
          <td valign="middle" style="border-left:0;border-right:0;border-bottom:0;border-top:0;text-align:center">
			  		<input name="Button" type="button" class="btnNormal" style="width:80" onClick="moveDualList(AllInstrumentList,secInstrument, false )" value="Add&gt;&gt;"/>
						<br/><br/>
			    	<input name="Button2" type="button" class="btnNormal" style="width:80" onClick="moveDualList(secInstrument,AllInstrumentList,false )" value="&lt;&lt;Remove"/>
			    </td>
          <td width="33%" valign="middle" style="border-left:0;border-right:0;border-bottom:0;border-top:0;text-align:left">
            <html:select property="secInstrument"  size="10" multiple="true" style="width:300">
            	<%
            		if(selectedInstrumentArray==null){
            			out.print("  ");
            		}else{
            			for(int index=0;index<selectedInstrumentArray.length;index++){
            	%>
            			<option value="<%=selectedInstrumentArray[index]%>" selected><%=secInstrumentMap.get(selectedInstrumentArray[index])%></option>
            	<%
            			}
            		}
            	%>
            </html:select>&nbsp;
            <html:errors property="secInstrument"/>         
          </td>
			  </tr>
			</table>
    </td>
</tr>

		