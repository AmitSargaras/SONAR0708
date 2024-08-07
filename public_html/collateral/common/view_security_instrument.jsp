<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
								 com.integrosys.cms.ui.collateral.CollateralForm,
								 com.integrosys.cms.app.collateral.bus.IInstrument,
								 java.util.ArrayList,
								 java.util.HashMap,
								 com.integrosys.cms.ui.common.CommonCodeList"%>
<tr>
  <td colspan="4" style="border-left:0;border-right:0;border-bottom:0;text-align:center; background-color:#FFFFFF">&nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="10%" class="fieldname"><bean:message key="label.security.security.instrument"/> <font color="#0000FF">*</font></td>
    <td colspan="3">
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
		    	
    			CollateralForm colForm = (CollateralForm) request.getAttribute(formName);

                String[] instrumentArray = colForm.getSecInstrument();
    			if(instrumentArray == null ){
                    out.print("-");
    			}else{
    				//System.out.println("InstrumentArray Len : "+instrumentArray.length);
                    boolean noVal = true;
                    for(int index=0;index<instrumentArray.length;index++){
    					if(index !=0){
    						out.print("<br>");
    					}
                        if (secInstrumentMap.get(instrumentArray[index]) != null){
                            out.print(secInstrumentMap.get(instrumentArray[index]));
                            noVal=false;
                        }
                    }
                    if (noVal){
                     out.print("-");
                    }
                }
    	%>&nbsp;
    </td>
</tr>
