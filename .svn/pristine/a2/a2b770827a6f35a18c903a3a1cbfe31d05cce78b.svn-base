<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.cms.app.limit.bus.ILimit,
				 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.collateral.CollateralHelper,
				 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
				 com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.ISubLimit,
				 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.SubLimitComparator,				 
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType"%>
<%
	String limitID = CollateralHelper.getColLimitMapLimitID(stagingCollateralLimitMap);
	ICollateralLimitMap actualCollateralLimitMap = (ICollateralLimitMap)actualLimitMap.get(limitID);
	String limitProductType = CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, stagingCollateralLimitMap.getLimitType());
	
	String sciLimitId = null;
	Amount amount = null;
	boolean isInnerLimit = false;
	
	if (ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER.equals(stagingCollateralLimitMap.getCustomerCategory())) {
		sciLimitId = String.valueOf(stagingCollateralLimitMap.getSCILimitID());				
		ILimit limit = (ILimit)limitList.get(limitID);
		amount = limit.getApprovedLimitAmount();
		isInnerLimit = CommodityMainUtil.isInnerLimit(limit);
	} else if (ICMSConstant.CUSTOMER_CATEGORY_CO_BORROWER.equals(stagingCollateralLimitMap.getCustomerCategory())) {
		sciLimitId = String.valueOf(stagingCollateralLimitMap.getSCICoBorrowerLimitID());
		ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(limitID);	
		amount = colmt.getApprovedLimitAmount();
		isInnerLimit = CommodityMainUtil.isInnerLimit(colmt);	
	}
	
	boolean enableCashReq = false;
	if (stagingCollateralLimitMap.getCashReqPct() != ICMSConstant.DOUBLE_INVALID_VALUE) {		
		enableCashReq = isCMTmaker;
	}
%>				 
<tr>
	<td colspan=3>    		
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
	        <tr class="odd">
	          <td width="20%" class="fieldname"><bean:message key="label.limit.id"/></td>
	          <td width="30%"><%=sciLimitId%></td>
	          <td width="20%" class="fieldname"><ben:message key="label.cmdt.lmt.detail.lmt.pro.type"/></td>
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
	          <td  class="<%=CompareOBUtil.compOB(stagingCollateralLimitMap, actualCollateralLimitMap, "IsCollateralPool")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.coll.pool"/></td>
	          <td>		
            	<html:multibox property="collaterPoolChk" value="<%=limitID%>" disabled="true"/>
			 </td>
	        </tr>
	        <tr class="odd">
	          <td class="<%=CompareOBUtil.compOB(stagingCollateralLimitMap, actualCollateralLimitMap, "IsSpecificTrx")?"fieldname":"fieldnamediff"%>"><bean:message key="label.cmdt.lmt.detail.lmt.spec.trx"/></td>
	          <td>				 
            	<html:multibox property="specificTrxChk"  value="<%=limitID%>" disabled="true"/>
			  </td>
	          <td class="<%=CompareOBUtil.compOB(stagingCollateralLimitMap, actualCollateralLimitMap, "CashReqPct")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.cash.requirement"/></td>
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
          <td width="20%"><bean:message key="label.security.sub.limit.type"/></td>
          <td width="8%"><bean:message key="label.security.sub.limit.ccy"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.amount"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.amount"/><br><bean:message key="label.security.convert.limit.ccy"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.activate.amount"/></td>
          <td width="13%"><bean:message key="label.security.sub.limit.activate.amount"/><br><bean:message key="label.security.convert.limit.ccy"/></td>    
        </tr>
      </thead>
      <tbody>  	
<%
		ISubLimit[] subLimitArray = stagingCollateralLimitMap.getSubLimit();	
		ISubLimit[] actualSLArray = actualCollateralLimitMap.getSubLimit();
		/*
		System.out.println("\t---------------------------------------------------------------");
		System.out.println("\t Num of staging : "+(subLimitArray==null?0:subLimitArray.length));
		System.out.println("\t Num of actual : "+(actualSLArray==null?0:actualSLArray.length));
		*/					
	    List res = CompareOBUtil.compOBArray(subLimitArray,actualSLArray);
	    CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
	    SubLimitComparator c = new SubLimitComparator();
        Arrays.sort(resultList,c);        
        ArrayList list = new ArrayList(Arrays.asList(resultList));
        /*
		System.out.println("\t Num in list : "+(list==null?0:list.size()));
		System.out.println("\t---------------------------------------------------------------");
		*/
        pageContext.setAttribute("slList",list);
      	if(list==null||list.size() == 0){
%>
      	<tr class="odd">
          <td colspan="7"><bean:message key="label.security.none.sublimit"/></td>
        </tr>  
<%
  		}else{
            int index = 0;
	  		double totalSLAmt = 0;
	  		double totalSLAAmt = 0;
	  		boolean validConvert = true;
%>
		<logic:present name="slList" >
        <logic:iterate id="compResult" name="slList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
<%
			ISubLimit sl = (ISubLimit) compResult.getObj();
			
			String slAmount = sl.getSubLimitAmount();
	      	String slActiveAmount = sl.getActiveAmount();
	      	String ccyStr = null;
	      	if(subLimitArray!=null&&index<subLimitArray.length){
	      		ccyStr = subLimitArray[index].getSubLimitCCY();
		    }
	      	String slAmt = SubLimitUtils.getConvertedSLAmt(slAmount,ccyStr,amount.getCurrencyCodeAsObject());
          	String slActiveAmt = SubLimitUtils.getConvertedSLAmt(slActiveAmount,ccyStr,amount.getCurrencyCodeAsObject());
          	
          	if(SLUIConstants.ERR_FOREX.equals(slAmt)||SLUIConstants.ERR_FOREX.equals(slActiveAmt)){
      			validConvert = false;
          	}
          	if(validConvert){
          		totalSLAmt += Double.parseDouble(slAmt);
          		totalSLAAmt += Double.parseDouble(slActiveAmt);
	        }
		        
  			ISubLimitType slt = (ISubLimitType)sltMap.get(sl.getSubLimitType());
  			StringBuffer sltNameBuffer = new StringBuffer();
  			if(slt!=null){
	  			sltNameBuffer.append(slt.getSubLimitType());
	  			sltNameBuffer.append("(");
	  			sltNameBuffer.append(limitTypeMap.get(String.valueOf(slt.getLimitType())));
	  			sltNameBuffer.append(")");	    
			} 
	
			slAmount = UIUtil.formatNumber(new BigDecimal(slAmount),0,locale);
			slActiveAmount = UIUtil.formatNumber(new BigDecimal(slActiveAmount),0,locale);
			if(validConvert){
				slAmt = UIUtil.formatNumber(new BigDecimal(slAmt),0,locale);
				slActiveAmt = UIUtil.formatNumber(new BigDecimal(slActiveAmt),0,locale);
			}
			boolean isSLInnerLmt = sl.isInnerLimit();       
%>
	      	<tr class="<%=index%2==0?"odd":"even"%>">
	          <td class="<bean:write name="compResult" property="key" />" width="8%"><%=index + 1%></td>
	          <td width="20%"><integro:empty-if-null value="<%=sltNameBuffer.toString()%>"/>&nbsp;</td>
	          <td width="8%"><integro:empty-if-null value="<%=sl.getSubLimitCCY()%>"/>&nbsp;</td>
	          <td width="13%">
	          	<%=isSLInnerLmt?"(":""%>
	          		<integro:empty-if-null value="<%=slAmount%>"/>              
	          	<%=sl.isInnerLimit()?")":""%>
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
	          		<integro:empty-if-null value="<%=slActiveAmount%>"/> 
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
        	<%index++;%>         
        </logic:iterate>
        </logic:present>        
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
  		}
      %>
    </tbody>
    </table>
  </td>
</tr>