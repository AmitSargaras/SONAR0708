<%@ page import="com.integrosys.cms.app.collateral.bus.LimitDetailsComparator,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.limit.bus.ICoBorrowerLimit,
                 com.integrosys.cms.ui.collateral.CollateralHelper,
                 com.integrosys.cms.ui.collateral.commodity.sublimit.SubLimitUtils,
				 com.integrosys.cms.app.commodity.main.bus.sublimittype.ISubLimitType,
                 com.integrosys.cms.app.collateral.bus.type.commodity.sublimit.ISubLimit,                 
				 com.integrosys.cms.ui.commodityglobal.sublimittype.SLTUIConstants"%>
                 				
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead>
        <tr>
          <td width="2%" rowspan="2"><bean:message key="label.global.sn"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.limit.id"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.cmdt.lmt.detail.lmt.pro.type"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.outer.limit"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.le.id"/>/<br><bean:message key="label.customer.name"/></td>
          <td width="10%" rowspan="2"><bean:message key="label.security.bca.ref"/>/<br><bean:message key="label.security.bca.booking.loc"/></td>
          <td colspan="2"><bean:message key="label.limit.approved.limit"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.sublimit.type"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.sublimit.curr"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.security.sublimit.amt"/></td>          
          <td width="7%" rowspan="2"><bean:message key="label.security.coll.pool"/></td>
          <td width="7%" rowspan="2"><bean:message key="label.cmdt.lmt.detail.lmt.spec.trx"/></td>
          <td width="14%" rowspan="2"><bean:message key="label.security.cash.requirement"/></td>          
        </tr>
        <tr>
          <td width="4%"><bean:message key="label.ccy"/></td>
          <td width="8%"><bean:message key="label.isda.deal.amount"/></td>
        </tr>
        </thead>
      <tbody>
        <%
            if (limitMap != null) {
                Collection valueSet = limitMap.values();
                Object[] tempArr = valueSet.toArray();
                Arrays.sort(tempArr, new LimitDetailsComparator());
                valueSet = Arrays.asList(tempArr);

            	String[] cashReqList = aForm.getCashReq();
            	if (valueSet.isEmpty()) {
        %>
        <tr class="odd"><td colspan="12"><bean:message key="label.security.none.limit"/></td></tr>
        <%
            } else {
	      		HashMap limitTypeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(SLTUIConstants.CONSTANT_COMMODITY_CATEGORY_CODE);
                HashMap sltMap = SubLimitUtils.getSLTMap();        
                int count = 0;
                Iterator itr = valueSet.iterator();
                while (itr.hasNext()) {
					ICollateralLimitMap colLimitMap = (ICollateralLimitMap)itr.next();
                    String limitID = CollateralHelper.getColLimitMapLimitID(colLimitMap);
                    String limitStatus = null;
                    long sciLimitID = 0;                    
                    Amount approvedLimit = null;
                    boolean isInnerOuterSameBCA = true;
					boolean isInnerLimit = false;
					String outerLimitRef = "";
                    if (ICMSConstant.CUSTOMER_CATEGORY_MAIN_BORROWER.equals(limitID.substring(0,2))) {
						ILimit limit = (ILimit)limitList.get(limitID);
						limitStatus = limit.getLimitStatus();
						sciLimitID = colLimitMap.getSCILimitID();
						approvedLimit = limit.getApprovedLimitAmount();
						isInnerOuterSameBCA = limit.getIsInnerOuterSameBCA();
                    	isInnerLimit = (limit.getOuterLimitRef() != null &&
                                            limit.getOuterLimitRef().length() > 0 &&
                                            !limit.getOuterLimitRef().equals("0"));
						outerLimitRef = limit.getOuterLimitRef();                                           
						
					} else {
						ICoBorrowerLimit colmt = (ICoBorrowerLimit)limitList.get(limitID);
						limitStatus = colmt.getStatus();
						sciLimitID = colLimitMap.getSCICoBorrowerLimitID();
						approvedLimit = colmt.getApprovedLimitAmount();
                    	isInnerLimit = (colmt.getOuterLimitRef() != null &&
                                            colmt.getOuterLimitRef().length() > 0 &&
                                            !colmt.getOuterLimitRef().equals("0"));						
                        outerLimitRef = colmt.getOuterLimitRef();
					}
					OBCustomerSearchResult obCustomer = (OBCustomerSearchResult)limitOuterBCAMap.get(limitID.substring(2, limitID.length()));
        %>
        <tr class="<%=count%2==0?"odd":"even"%>">
          <td class="index" valign="top"><%=count + 1%></td>
          <td valign="top">
          <%
            if (limitStatus.equals(ICMSConstant.STATE_DELETED)) {
          %>
          		<%=sciLimitID%>&nbsp;
          		(<font color="#FF0000"><b>DELETED</b></font>)
          <% 
          	} else{
	      %>
	      		<%=sciLimitID%>&nbsp;
	      <%  	
          	}
          %>
          </td>
          <td valign="top"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.PRODUCT_DESCRIPTION, colLimitMap.getLimitType())%>"/>&nbsp;</td>
          <td <%=isInnerOuterSameBCA?"":"class=outerlimit"%> valign="top"><integro:empty-if-null value="<%=isInnerLimit?outerLimitRef:null%>"/></td>
		  <td>
		  <% if (obCustomer != null) { %>
		  <integro:empty-if-null value="<%=obCustomer.getLegalReference()%>"/>
		  <br>
		  <integro:empty-if-null value="<%=obCustomer.getLegalName()%>"/>
		  <% } else { %>-<% } %>&nbsp;
		  </td>
		  <td>
		  <% if (obCustomer != null) { %>
		  <integro:empty-if-null value="<%=obCustomer.getInstructionRefNo()%>"/>
		  <br>
		  <integro:empty-if-null value="<%=countryList.getCountryName(obCustomer.getOrigLocCntry())%>"/>
		  <% } else { %>-<% } %>&nbsp;
		  </td>
          <td valign="top"><integro:empty-if-null value="<%=approvedLimit!=null?approvedLimit.getCurrencyCode():null%>"/>&nbsp;</td>
          <td class="amount" valign="top">
          <%
                    if (approvedLimit != null && approvedLimit.getCurrencyCode() != null) {
          %>
          <%=isInnerLimit?"(":""%>
          <integro:currency amount="<%=approvedLimit%>" param="amount"/>
          <%=isInnerLimit?")":""%>
          <% } %>&nbsp;
          </td>
          <%      		
          		ISubLimit[] subLimitArray = colLimitMap.getSubLimit();
				StringBuffer slTypeBuffer= new StringBuffer();
				StringBuffer slCCYBuffer= new StringBuffer();
				StringBuffer slAmountBuffer= new StringBuffer();
				if(subLimitArray==null||subLimitArray.length==0){
					slTypeBuffer.append("-");
					slCCYBuffer.append("-");
					slAmountBuffer.append("-");
				}else{					
          			for(int index=0;index<subLimitArray.length;index++){
          				if(index!=0){
          					slTypeBuffer.append("<br>");
          					slCCYBuffer.append("<br>");
          					slAmountBuffer.append("<br>");
	          			}	          			
	          			ISubLimitType slt = (ISubLimitType)sltMap.get(subLimitArray[index].getSubLimitType());
	          			if(slt!=null){
	          				StringBuffer sltNameBuffer = new StringBuffer();
		          			sltNameBuffer.append(slt.getSubLimitType());
		          			sltNameBuffer.append("(");
		          			sltNameBuffer.append(slt.getLimitType());//dipslay code.
		          			sltNameBuffer.append(")");	          
		          			slTypeBuffer.append(sltNameBuffer);
          				}else{
	          				slTypeBuffer.append("-");
	          				System.out.println("Error occurs.....Cann't find name for slt : "+subLimitArray[index].getSubLimitType());
          				}
	          			//slTypeBuffer.append(sltMap.get(subLimitArray[index].getSubLimitType()));
          				slCCYBuffer.append(subLimitArray[index].getSubLimitCCY());
          				if(subLimitArray[index].isInnerLimit()){
	          				slAmountBuffer.append("(");
          				}
          				String slAmtStr = UIUtil.formatNumber(new BigDecimal(subLimitArray[index].getSubLimitAmount()),0,locale);
          				slAmountBuffer.append(slAmtStr);
          				//slAmountBuffer.append(subLimitArray[index].getSubLimitAmount());
          				if(subLimitArray[index].isInnerLimit()){
	          				slAmountBuffer.append(")");
          				}
	          		}
				}
          %>
          <td nowrap="nowrap" valign="top"><%=slTypeBuffer.toString()%></td>
          <td nowrap="nowrap" valign="top"><%=slCCYBuffer.toString()%></td>
          <td nowrap="nowrap" valign="top"><%=slAmountBuffer.toString()%></td>
          
          <td style="text-align:center" valign="top">
            <html:multibox property="collateralPool" value="<%=limitID%>" disabled="true"/>
          </td>
          <td style="text-align:center" valign="top">
            <html:multibox property="specificTrans" value="<%=limitID%>" disabled="true"/>
          </td>
          <td style="text-align:center" valign="top">
            <html:multibox property="cash" value="<%=limitID%>" disabled="true"/>
            &nbsp;
            <html:hidden property="limitIDList" value="<%=limitID%>"/>
            <integro:empty-if-null value="<%=cashReqList[count]%>"/>
            <html:hidden property="cashReq" value="<%=cashReqList[count]%>"/>
          </td>
          
        </tr>
        <%
                            count++;
                        }
                    }
                } else {
        %>
        <tr class="odd"><td colspan="14">There is no Limit.</td></tr>
        <% } %>
        </tbody>
      </table>