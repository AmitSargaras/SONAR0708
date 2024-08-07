<%@ page import="com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.collateral.bus.ICollateralLimitMap,
                 java.util.HashMap,
                 java.lang.Integer,
                 java.lang.Long" %>

<%
    HashMap limitAmountMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.document.DocumentAction.limitMap");
%>
                 
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.security.pri.rnk"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="pledgorInput">
                  <thead>
                    <tr>
                      <td width="5%"><bean:message key="label.global.sn"/></td>
                      <td width="20%"><bean:message key="label.limit.id"/></td>
                      <td width="20%"><bean:message key="label.security.pri.limit.amt"/></td>
                      <td width="28%"><bean:message key="label.security.pri.rnk"/></td>
                     </tr>
                  </thead>
                  <tbody>
				<%
                    ICollateralLimitMap[] limitMap = iCol.getCurrentCollateralLimits();
                    
                    String priorityRankingCheck =""+0; 
                    if(limitMap!=null)
                    {
	                    priorityRankingCheck = ""+limitMap.length;
                    }
                    String classtype = "odd";
                    String[] priorityRankingListValue = colForm.getPriorityRanking();
                    
                    if (limitMap != null) {
                        if (limitMap.length == 0) {
				%>
                    <tr class="<%=classtype%>">
                    <td colspan="5">
                    <bean:message key="label.limit.infor.none"/>
                    </td>
                    </tr>
				<% }%>
				 <%boolean isMB=true;
                 if("MB".equals(iCol.getCollateralLimits()[0].getCustomerCategory()) 
                      && (iCol.getCollateralLimits()[0].getCoBorrowerLimitID() <= 0))
					    {isMB=true;}
						else
						{isMB=false;}              
                 %>   
				       <% 
                        String[] tempPriorityRanking = new String[limitMap.length];
	                   	String[] tempSCILimitID = new String[limitMap.length];
	                   	String temp="";
	                   	Long lon = new Long(0);
	                   	Integer inte = new Integer(0);
	                   	for (int counter = 0; counter < limitMap.length; counter++) { 
	                    		tempPriorityRanking[counter] = new Integer(limitMap[counter].getPriorityRanking()).toString();
	                    		if(isMB){
	                    		tempSCILimitID[counter] = new Long(limitMap[counter].getSCILimitID()).toString();
                    		    }else
                    		    {
	                    		 tempSCILimitID[counter] = new Long(limitMap[counter].getSCICoBorrowerLimitID()).toString();
	                    		 }
	                    		if(tempPriorityRanking[counter].equals("-1")){
		                    		tempPriorityRanking[counter] = new Integer(Integer.MAX_VALUE).toString(); }
	                    }		
                        for (int firstCounter = 0; firstCounter < limitMap.length; firstCounter++) {
	                    	for(int secondCounter = 0; secondCounter < limitMap.length; secondCounter++) {
		                    	if(inte.decode(tempPriorityRanking[firstCounter]).compareTo(inte.decode(tempPriorityRanking[secondCounter]))<=0){
			                    		temp = tempPriorityRanking[firstCounter];
		                    			tempPriorityRanking[firstCounter]= tempPriorityRanking[secondCounter];
		                    			tempPriorityRanking[secondCounter]=temp;
		                    			temp = tempSCILimitID[firstCounter];
		                    			tempSCILimitID[firstCounter]= tempSCILimitID[secondCounter];
		                    			tempSCILimitID[secondCounter]=temp;
	                    		}
	                    	}
                		}
             
	               %>      
				
				
				

				<% for (int iCounter = 0; iCounter < limitMap.length; iCounter++) { 
	                        
                       	
						    for (int counter = 0; counter < limitMap.length; counter++) {
							    String limitCompare="";
							    if(isMB){
							     limitCompare = new Long(limitMap[counter].getSCILimitID()).toString();
						        }else
						        {
							     limitCompare = new Long(limitMap[counter].getSCICoBorrowerLimitID()).toString();   
							    }
								if(lon.decode(tempSCILimitID[iCounter]).compareTo(lon.decode(limitCompare))==0){
				 %>
                    <tr class="<%=classtype%>">
                      <td width="5%" class="index"><%=iCounter + 1%></td>
                      <td width="20%">
                      <%
                      long sciLimitId=ICMSConstant.LONG_INVALID_VALUE;
                      if(isMB){
                      sciLimitId=limitMap[counter].getSCILimitID();
                      }
                      else
                      {
	                  sciLimitId=limitMap[counter].getSCICoBorrowerLimitID();
	                  }   
	                  out.println(sciLimitId);    
                      %>
                      <input type="hidden" name="limitIDs" value="<%=sciLimitId%>">
                      </td>
                      <%
                        ILimit obLimit = (ILimit)limitAmountMap.get(""+limitMap[counter].getLimitID());
                      	if(!isMB)
                      	{
	                    obLimit=(ILimit)limitAmountMap.get(""+limitMap[counter].getSCICoBorrowerLimitID());
	                    }
                      	Amount amount = obLimit.getApprovedLimitAmount();

                      	String rankingValue = null;
                      	if(priorityRankingListValue!=null)
                      	 rankingValue= priorityRankingListValue[counter];
                      	                      	
                      	rankingValue = rankingValue==null?"":rankingValue;
                      	%>
                      	
                      <td width="28%"><integro:currency amount="<%=amount%>"/>&nbsp;</td>
                      <td width="27%"><html:select property="priorityRanking" value="<%=rankingValue%>" onchange="if(!checkPriorityRanking()){this.focus();} ">
	           			 <option value="" >Please Select </option>
	            		 <html:options name="priorityRankingIDs" labelName="priorityRankingValues"/>
               			 </html:select>&nbsp;
                		 <html:errors property="limitIDs" />
                	  </td>
                    </tr>
					<%	if (classtype.equals("odd")) {
                            classtype = "even";
                        }
                        else {
                            classtype = "odd";
                        }
                    }
                    
            }}    } else { %>
                    <tr class="<%=classtype%>">
                    <td colspan="5">
                    <bean:message key="label.security.pri.info.none"/>
                    </td>
                    </tr>
                    <% } %>
                  </tbody>
                  <input type="hidden" name="priorityRankingCheck" value="<%=priorityRankingCheck%>">
                </table></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>  