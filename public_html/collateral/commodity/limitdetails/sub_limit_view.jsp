<tr>
	<td colspan=3>    		
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
	        <tr class="odd">
	          <td width="20%" class="fieldname"><bean:message key="label.limit.id"/></td>
	          <td width="30%"><%=sciLimitId%></td>
	          <td width="20%" class="fieldname"><bean:message key="label.cmdt.lmt.detail.lmt.pro.type"/></td>
	          <td width="30%"><%=limitProductType%></td>
	        </tr>
	        <tr class="even">
	          <td class="fieldname"><bean:message key="label.cmdt.lmt.detail.lmt.app.amt"/></td>
	          <td>	          
		          <%
		          	if (amount != null && amount.getCurrencyCode() != null) {
		          %>
		          	<%=isInnerLimit?"(":""%>
		          	<integro:currency amount="<%=amount%>" param="amount"/>
		          	<%=isInnerLimit?")":""%>
		          	&nbsp;<%=amount.getCurrencyCode()%>
		          <% 
		          	} 
		          %>&nbsp;
	          </td>
	          <td  class="fieldname"><bean:message key="label.security.coll.pool"/></td>
	          <td>		
            	<html:multibox property="collaterPoolChk" value="<%=limitID%>" disabled="true"/>
			 </td>
	        </tr>
	        <tr class="odd">
	          <td class="fieldname"><bean:message key="label.cmdt.lmt.detail.lmt.spec.trx"/></td>
	          <td>				 
            	<html:multibox property="specificTrxChk"  value="<%=limitID%>" disabled="true"/>
			  </td>
	          <td class="fieldname"><bean:message key="label.security.cash.requirement"/></td>
	          <td>			     
            	<html:multibox property="cashReqQtyChk" value="<%=limitID%>" disabled="true"/>
            	&nbsp;
            	<integro:empty-if-null value="<%=cashReqQtyArray[limitMapIndex]%>"/>
	          </td>
	        </tr>
        </tbody>
      </table>
	</td>    	
</tr>
<tr>
  <td colspan="3">&nbsp;</td>
</tr>
<tr>
  <td colspan="3">
  	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
      <thead>
        <tr>
          <td width="4%"><bean:message key="label.global.sn"/></td>
          <td width="20%"><bean:message key="label.security.sub.limit.type"/</td>
          <td width="8%"><bean:message key="label.security.sub.limit.ccy"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.amount"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.amount"/><br><bean:message key="label.security.convert.limit.ccy"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.activate.amount"/></td>   
          <td width="13%"><bean:message key="label.security.sub.limit.activate.amount"/><br><bean:message key="label.security.convert.limit.ccy"/></td>  
        </tr>
      </thead>
      <tbody>
      <%
      	if(subLimitArray==null||subLimitArray.length==0){
      %>
      	<tr class="odd">
          <td colspan="7"><bean:message key="label.security.none.sublimit"/></td>
        </tr>  
      <%
  		}else{
	  		double totalSLAmt = 0;
	  		double totalSLAAmt = 0;
	  		boolean validConvert = true;
      		for(int index=0;index<subLimitArray.length;index++){
	      		String slAmount = subLimitArray[index].getSubLimitAmount();
	      		String slActiveAmount = subLimitArray[index].getActiveAmount();
	      		String slAmt = SubLimitUtils.getConvertedSLAmt(slAmount,subLimitArray[index].getSubLimitCCY(),amount.getCurrencyCodeAsObject());
          		String slActiveAmt = SubLimitUtils.getConvertedSLAmt(slActiveAmount,subLimitArray[index].getSubLimitCCY(),amount.getCurrencyCodeAsObject());
          		if(SLUIConstants.ERR_FOREX.equals(slAmt)||SLUIConstants.ERR_FOREX.equals(slActiveAmt)){
          			validConvert = false;
	          	}
	          	if(validConvert){
	          		totalSLAmt += Double.parseDouble(slAmt);
	          		totalSLAAmt += Double.parseDouble(slActiveAmt);
		        }
		        
		        StringBuffer sltNameBuffer = new StringBuffer();
      			ISubLimitType slt = (ISubLimitType)sltMap.get(subLimitArray[index].getSubLimitType());
      			if(slt!=null){
	      			sltNameBuffer.append(slt.getSubLimitType());
	      			sltNameBuffer.append("(");
	      			sltNameBuffer.append(limitTypeMap.get(String.valueOf(slt.getLimitType())));
	      			sltNameBuffer.append(")");	   
  				}
				slAmount = UIUtil.formatNumber(new BigDecimal(slAmount),0,locale);
  				slActiveAmount = UIUtil.formatNumber(new BigDecimal(slActiveAmount),0,locale);
  				slAmt = UIUtil.formatNumber(new BigDecimal(slAmt),0,locale);
  				slActiveAmt = UIUtil.formatNumber(new BigDecimal(slActiveAmt),0,locale);
          		
  				boolean isSLInnerLmt = subLimitArray[index].isInnerLimit();    
      %>
      	<tr class="<%=index%2==0?"odd":"even"%>">
          <td class="index" width="4%" ><%=index+1%>&nbsp;</td>
          <td width="20%"><integro:empty-if-null value="<%=sltNameBuffer.toString()%>"/>&nbsp;</td>
          <td width="8%"><integro:empty-if-null value="<%=subLimitArray[index].getSubLimitCCY()%>"/>&nbsp;</td>
          <td width="13%">
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=subLimitArray[index].getSubLimitAmount()%>"/>              
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>
          <td width="13%">
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=slAmt%>"/>              
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>
          <td width="13%">
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=subLimitArray[index].getActiveAmount()%>"/> 
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>      
          <td width="13%">
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=slActiveAmt%>"/> 
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>      
        </tr>
      <%	 		
  			}//end for
  	  %>	
        <tr>
        	<td colspan="4" class="total">Total</td>
        	<td valign="top" class="total" style="text-align:right " >
        		<%
        			if(validConvert){
        		%>
        				<%=UIUtil.formatNumber(new BigDecimal(SubLimitUtils.formateSLAmt(totalSLAmt)),0,locale)%>
        		<%
    				}else{
        		%>
        				<%=SLUIConstants.ERR_FOREX%>
        		<%
    				}
        		%>
        	</td>
        	<td valign="top" class="total" style="text-align:right " >&nbsp;</td>
        	<td valign="top" class="total" style="text-align:right " >
        		<%
        			if(validConvert){
        		%>
        				<%=UIUtil.formatNumber(new BigDecimal(SubLimitUtils.formateSLAmt(totalSLAAmt)),0,locale)%>
        		<%
    				}else{
        		%>
        				<%=SLUIConstants.ERR_FOREX%>
        		<%
    				}
        		%>
        	</td>
        </tr>
      <%  
  		}//end else
      %>
    </tbody>
    </table>
  </td>
</tr>