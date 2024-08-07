<%@ page import="com.integrosys.cms.ui.manualinput.security.EventConstant"%>
    <tbody>
        <bean:define id="formObj" name="SecDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.security.SecDetailForm"/>
        <tr>
          <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
              <tbody>
                <tr class="odd">  	
                  <td class="fieldName" width="20%">Source Security ID&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecDetailForm" property="sciColId" />&nbsp;
                  </td> 
                  <td class="<%= formObj.getSecBookingCountryClass() %>" width="20%">Security Booking Country&nbsp;<font color="#0000FF">*</font></td>
                  <td width="30%">
                    <bean:write name="SecDetailForm" property="secBookingCountryDesc" />&nbsp;
                  </td>
                </tr>
		<tr class="even">  	
                  <td class="<%= formObj.getSecBookingOrgClass() %>" width="20%">Security Branch Name&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecDetailForm" property="secBookingOrgDesc" />&nbsp;
                  </td> 
                  <td class="<%= formObj.getSecTypeClass() %>" width="20%">Security Type&nbsp;<font color="#0000FF">*</font></td>
                  <td width="30%">
                    <bean:write name="SecDetailForm" property="secTypeDesc" />&nbsp;
                  </td>
                </tr>
                <tr class="odd">  	
                  <td class="<%= formObj.getSecSubtypeClass() %>" width="20%">Security Sub-Type&nbsp;<font color="#0000FF">*</font></td>
                  <td width="30%">
                    <bean:write name="SecDetailForm" property="secSubtypeDesc" />&nbsp;
                  </td> 
                  <td class="<%= formObj.getSecCurrencyClass() %>" width="20%">Security Currency&nbsp;<font color="#0000FF">*</font></td>
                  <td width="30%">
                    <bean:write name="SecDetailForm" property="secCurrency" />&nbsp;
                  </td>
                </tr>
                <tr class="even">  	
                  <td class="<%= formObj.getSecReferenceNoteClass() %>" width="20%">Security Reference Note&nbsp;</td>
                  <td colspan="3">
                    <bean:write name="SecDetailForm" property="secReferenceNote" />&nbsp;
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
      <thead>
      	<tr>
          <td><h3>Pledgor / Guarantor List</h3></td>
        </tr>
        <tr>
          <td><hr/></td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
              <thead>
                <tr>
                  <td width="7%">S/N</td>
                  <td width="31%">Customer Name</td>
                  <td width="31%">LE ID</td>
                  <td width="31%">LE ID Type</td> 
                </tr>
              </thead>
              <tbody>
                <logic:present name="SecDetailForm" property="pledgorList" scope="request">
                <%
                 String event = (String)request.getParameter("event");
               %>
		  <bean:define id="pledgorSize" value="<%= String.valueOf(formObj.getPledgorList().size()) %>" />
		  <logic:notEqual name="pledgorSize" value="0">                 
                    <logic:iterate id="pledgoritm" indexId="pledgorind" name="SecDetailForm" property="pledgorList" scope="request" 
                     type="com.integrosys.cms.ui.manualinput.security.PledgorSummaryItem">
                      <tr class="<bean:write name="pledgoritm" property="rowClass" />">
                        <% if ((EventConstant.EVENT_PROCESS).equals(event)) { %>
                            <td class="indexadd">
                        <% } else { %>
                            <td class="<bean:write name="pledgoritm" property="headerClass" />">
                        <% } %>
                          <%= pledgorind.intValue() + 1 %>
                        </td>
                        <td>
                          &nbsp;<bean:write name="pledgoritm" property="customerName" />
                        </td>
                        <td>
                          &nbsp;<bean:write name="pledgoritm" property="leId" />
                        </td>
                        <td>
                          &nbsp;<bean:write name="pledgoritm" property="leIdType" />
                        </td>
                      </tr>   
                    </logic:iterate>
	          </logic:notEqual>
		  <logic:equal name="pledgorSize" value="0">
		    <tr class="odd">
                      <td colspan="4">There is no Pledgor.</td>
                    </tr>	
		  </logic:equal>	
                </logic:present>
                <logic:notPresent name="SecDetailForm" property="pledgorList" scope="request">
                  <tr class="odd">
                    <td colspan="4">There is no Pledgor.</td>
                  </tr>
                </logic:notPresent> 
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
	