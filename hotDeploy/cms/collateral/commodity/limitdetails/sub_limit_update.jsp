<%@ page import="com.integrosys.base.techinfra.util.StringUtil" %>
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
            	<html:multibox property="collaterPoolChk" value="<%=limitID%>" disabled="<%=!isCMTmaker%>"/>
			 </td>
	        </tr>
	        <tr class="odd">
	          <td class="fieldname"><bean:message key="label.cmdt.lmt.detail.lmt.spec.trx"/></td>
	          <td>				 
            	<html:multibox property="specificTrxChk"  value="<%=limitID%>" disabled="<%=!isCMTmaker%>"/>
			  </td>
	          <td class="fieldname"><bean:message key="label.security.cash.requirement"/></td>
	          <td>			     
            	<html:multibox property="cashReqQtyChk" value="<%=limitID%>" disabled="<%=!isCMTmaker%>"   onclick="changeCashReqQty()"/>
            	&nbsp;
            	<html:text property="cashReqQty" maxlength="3" size="5"  value="<%=cashReqQtyArray[limitMapIndex]%>" disabled="<%=!enableCashReq%>" />
            	<html:hidden property="limitIDArray" value="<%=limitID%>"/> 
            	<%
            		String errorPro = "cashReqQty"+limitID;
            	%>
	            <html:errors property="<%=errorPro%>"/>
	          </td>
	        </tr>
        </tbody>
      </table>
	</td>    	
</tr>
<tr><td colspan=3>
     	&nbsp;
     </td>
</tr>
<tr>
  <td>
  	&nbsp;                                                
  </td>
<%
	if (isCMTmaker) {
%>  
  <td valign="bottom">
  	<html:errors property="<%=SLUIConstants.ERR_DELETE_SL%>"/>&nbsp;
  </td>
  <td width="42%" valign="bottom">
      <table width="160"  border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="80" valign="baseline" align="center">
            <input name="Submit2" type="button" class="btnNormal" value="Add New" onclick="javascript:addItem('<%=limitID%>','<%=StringUtil.replaceString(limitProductType,"'","\\'")%>')"/>
          </td>
          <td width="80" valign="baseline" align="center">
            <input name="Submit2" type="button" class="btnNormal" value="Delete" onclick="javascript:submitPage('<%=ICommonEventConstant.EVENT_DELETE%>')"/>
          </td>
        </tr>
    </table>
  </td>         
</tr>
<tr>
  <td colspan="3">&nbsp;</td>
</tr>
<%
	}
%>
<tr>
  <td colspan="3">
  	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
      <thead>
        <tr>
          <td width="4%"><bean:message key="label.global.sn"/></td>
          <td width="15%"><bean:message key="label.security.sub.limit.type"/></td>
          <td width="8%"><bean:message key="label.security.sub.limit.ccy"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.amount"/></td>
          <td width="15%"><bean:message key="label.security.sub.limit.amount"/><br><bean:message key="label.security.convert.limit.ccy"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.activate.amount"/></td>   
          <td width="15%"><bean:message key="label.security.sub.limit.activate.amount"/><br><bean:message key="label.security.convert.limit.ccy"/></td>   
          <td width="13%"><bean:message key="label.global.action"/></td>
          <td width="8%"><bean:message key="label.global.delete"/></td>
        </tr>
      </thead>
      <tbody>
      <%
      	if(subLimitArray==null||subLimitArray.length==0){
      %>
      	<tr class="odd">
          <td colspan="9"><bean:message key="label.security.none.sublimit"/></td>
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
          <td ><integro:empty-if-null value="<%=sltNameBuffer.toString()%>"/>&nbsp;</td>
          <td ><integro:empty-if-null value="<%=subLimitArray[index].getSubLimitCCY()%>"/>&nbsp;</td>
          <td >
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=slAmount%>"/>              
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>
          <td >
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=slAmt%>"/>              
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>
          <td >
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=slActiveAmount%>"/> 
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>      
          <td >
          	<%=isSLInnerLmt?"(":""%>
          		<integro:empty-if-null value="<%=slActiveAmt%>"/> 
          	<%=isSLInnerLmt?")":""%>
			&nbsp;
		  </td>  
          <td ><a href="javascript:editItem('<%=limitID%>','<%=index%>')">View/Edit</a></td>
          <td  style="text-align:center" valign="top">
          	<%
          		String deleteId = limitID+"_"+subLimitArray[index].getSubLimitType();
          	%>
          	<html:multibox property="chkDeletes" value="<%=deleteId%>"/>              
          	&nbsp;
          </td>
        </tr>
      <%	 		
  			}//end for
  	  %>  	  
        <tr>
        	<td colspan="4" class="total">Total</td>
        	<td class="total" style="text-align:right " >
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
        	<td class="total" style="text-align:right " >&nbsp;</td>
        	<td class="total" style="text-align:right " >
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
        	<td colspan="2" class="total" style="text-align:right ">&nbsp;</td>
        </tr>
  	  <%
  		}//end else
      %>
    </tbody>
    </table>
  </td>
</tr>