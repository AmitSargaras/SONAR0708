<%
      	int rowIdx = 0;
      %>
          <tbody>
              <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname" width="20%"><bean:message key="label.limit.source.limit.id"/></td>
              <td  width="30%"><integro:empty-if-null value="<%=aForm.getLimitRef()%>"/>&nbsp;</td>
              <td class="fieldname" width="20%"><bean:message key="label.limit.source.outer.limit.id"/></td>
              <td width="30%"><integro:empty-if-null value="<%=aForm.getOuterLimitRef()%>"/>&nbsp;</td>
            </tr>
             <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.booking.location"/></td>
              <td><%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,aForm.getBookingLoc())+ " ("+aForm.getBookingLoc()+")"%>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.limit.facility.description"/></td>
              <td><bean:write scope="request" property="productDesc" name="LimitsForm"/>&nbsp;</td>
            </tr>
            
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.tenor"/></td>
              <td>
                  <%
                  if(aForm.getLimitTenor()==null){
                      %>-<%
                  } else {
                      %><integro:empty-if-null value="<%=aForm.getLimitTenor()%>"/>&nbsp;
                      <integro:empty-if-null value="<%=aForm.getLmtTenorBasisDesc()%>"/><%
                  }
                  %>
              </td>
              <td class="fieldname"><bean:message key="label.limit.status"/></td>
              <td><integro:empty-if-null value="<%=aForm.getLimitStatus()%>"/>&nbsp;</td>            
            </tr>
									
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <!-- <td class="fieldname"><bean:message key="label.limit.type"/></td>  -->
              <!-- <td><bean:write scope="request" property="limitType" name="LimitsForm"/>&nbsp;</td>  -->
              <td class="fieldname"><bean:message key="label.limit.expiry.date"/></td>
              <td><bean:write property="expiryDate" name="LimitsForm" scope="request"/>&nbsp;</td>   
			  <td class="fieldname"><bean:message key="label.limit.approved.limit"/></td>
              <td><bean:write property="approvedLimitAmt" name="LimitsForm" scope="request" /></td>
            </tr>
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
                       
              <td class="fieldname"><bean:message key="label.limit.drawing.limit"/></td>
              <td><bean:write property="drawingLimitAmt" name="LimitsForm" scope="request" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.limit.outstanding.balance"/></td>
              <td><bean:write scope="request" property="outstandingBalance" name="LimitsForm"/>&nbsp;</td>        
            </tr>
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
                        
              <td class="fieldname"><bean:message key="label.limit.balances.updated.as.at"/></td>
              <td><bean:write scope="request" property="lastUpdatedDate" name="LimitsForm"/>&nbsp;</td>
			  <td class="<%=isProcess?(CompareOBUtil.compOB(stageLimit,actualLimit,"requiredSecurityCoverage")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.limit.required.security.coverage"/></td>
              <td><bean:write scope="request" property="requiredSecurityCoverage" name="LimitsForm"/>&nbsp;</td>
              
            </tr>            
            <!--<tr class="<%=rowIdx++%2==0?"even":"odd"%>">-->
            <!--  <td class="fieldname"><bean:message key="label.limit.status"/></td>-->
            <!--  <td><integro:empty-if-null value="<%=aForm.getLimitStatus()%>"/>&nbsp;</td>-->
            <!--  <td class="fieldname">&nbsp;</td>-->
            <!--  <td>&nbsp;</td>-->
            <!--</tr>-->
          
            <!--<tr class="<%=rowIdx++%2==0?"even":"odd"%>">-->
            <!--  <td class="fieldname"><bean:message key="label.limit.actual.security.coverage"/></td>-->
            <!--  <td><bean:write scope="request" property="actualSecurityCoverage" name="LimitsForm"/>&nbsp;</td>-->
            <!-- </tr>-->
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.amt"/></td>
              <td><bean:write scope="request" property="actualSecCoverageAmt" name="LimitsForm"/>&nbsp;</td>            
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage"/></td>
              <td><bean:write scope="request" property="actualSecCoveragePercent" name="LimitsForm"/>&nbsp;</td>
            </tr>       
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.omv.amt"/></td>
              <td><bean:write scope="request" property="actualSecCoverageOMVAmt" name="LimitsForm"/>&nbsp;</td>            
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.omv"/></td>
              <td><bean:write scope="request" property="actualSecCoverageOMVPercent" name="LimitsForm"/>&nbsp;</td>
            </tr>   
			<tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.fsv.amt"/></td>
              <td><bean:write scope="request" property="actualSecCoverageFSVAmt" name="LimitsForm"/>&nbsp;</td>            
              <td class="fieldname"><bean:message key="label.limit.actual.security.coverage.fsv"/></td>
              <td><bean:write scope="request" property="actualSecCoverageFSVPercent" name="LimitsForm"/>&nbsp;</td>
            </tr>   
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">  
              <td class="fieldname"><bean:message key="label.limit.document.status"/></td>
              <td><bean:write scope="request" property="documentStatus" name="LimitsForm"/>&nbsp;</td>          
              <td class="fieldname"><bean:message key="label.limit.advised"/></td>
              <td><integro:yesno-display value="<%=aForm.isLimitAdviseInd()%>"/>&nbsp;</td>
            </tr>            
            <tr class="<%=rowIdx++%2==0?"even":"odd"%>">
              
              <td class="fieldname"><bean:message key="label.limit.operational.limit"/></td>
              <td><bean:write property="operationalLimit" name="LimitsForm" scope="request" />&nbsp;</td>
			  <td>&nbsp;</td>
			  <td>&nbsp;</td>

            </tr>
          </tbody>