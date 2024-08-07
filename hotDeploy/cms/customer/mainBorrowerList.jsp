<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.ArrayList
                 "%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/customer/mainBorrowerList.jsp,v 1.7 2006/11/06 08:58:05 hmbao Exp $
    *
    * Purpose: Display main borrower information if the customer is co-borrower to the other BCA
    * Description: Main borrower information
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.7 $
    * Date: $Date: 2006/11/06 08:58:05 $
    * Tag: $Name:  $
    */
%>

<%
    CountryList cList = CountryList.getInstance();
    ArrayList mainBorrowerList = new ArrayList();
    mainBorrowerList=(ArrayList)request.getAttribute("mainBorrowerList");
%>

<html>
<head>



<body>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Main Borrower Information</h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
	<tr>
    	<td><table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
        	<thead>
              <tr>
               <td width="5%">S/N</td>
               <td width="30%" >Main Borrower LE ID/Name</td>
               <td width="20%" ><bean:message key="label.global.aa"/> <bean:message key="label.global.booking.location"/></td>
               <td width="25%" ><bean:message key="label.global.aa"/> <bean:message key="label.ref.no"/></td>
               <td width="20%" >AA Approved Date</td>
              </tr>
             </thead>
             <tbody>
       <%int sno = 0;%>
              <logic:present name="mainBorrowerList">
               <logic:iterate id="OB" name="mainBorrowerList"  type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="request">
            <% 
			 String rowClass="";
			 sno++;
			 if(sno%2!=0){
				rowClass="odd";
			 }else{
				rowClass="even";
			 }
 			 %>
                  <tr class="<%=rowClass%>">
                  <td style="text-align:center" class="index"><%=sno%></td>
                  <td>
				  <%=OB.getLegalReference()%>&nbsp;<br>
				  <integro:htmltext value="<%=OB.getLegalName()%>"/>&nbsp;
                  </td>
                  <% if (OB.getBcaOrigLocation().getCountryCode() == null) { %>
                    <integro:empty-if-null value="<%= cList.getCountryName (OB.getInstrOrigLocation().getCountryCode()) %>"/>&nbsp;
                  <% } else { %>
                      <td><integro:empty-if-null value="<%= cList.getCountryName (OB.getBcaOrigLocation().getCountryCode()) %>"/>&nbsp;
                      <% if (OB.getBcaStatus() != null && OB.getBcaStatus().equals (ICMSConstant.STATE_DELETED)) { %>
                      <br><font color="#FF0000" size="1"><b>( Deleted AA )</b></font></br>
                      <% } %>
                      </td>
                  <% } %>
                  <td><integro:empty-if-null value="<%=OB.getInstructionRefNo()%>"/>&nbsp; </td>
                  <td><integro:date object="<%=OB.getInstructionApprovedDate()%>" />&nbsp;</td>
                  </tr>
	            </logic:iterate>
	            <% if (sno == 0) { %>
	            <tr class="odd"><td colspan="5"><bean:message key="label.global.not.found"/></td></tr>
	            <% } %>
               </logic:present>
               <logic:notPresent name="mainBorrowerList">
               <tr><td colspan="5"><bean:message key="label.global.not.found"/></td></tr>
               </logic:notPresent>
           </tbody>
		</table>
		</td>
	</tr>	
</tbody>
</table>
</body>
</html>

