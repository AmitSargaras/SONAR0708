<%@ page import="com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptForm"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<br>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
            <tr>
                <td valign="middle" align="left">
                    <b>Shared Document  Checklist(s)</b></td>
            </tr>
   </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
            <thead>
             <tr>
               <td class="fieldname" width="01%"  >S/N</td>
               <td class="fieldname" width="15%"  align="left">ChecklistID</td>
               <td class="fieldname" width="15%"  align="left">Security ID&nbsp;<font color="#0000FF">*</font></td>
               <td class="fieldname" width="15%"  align="left">Security Type</td>
               <td class="fieldname" width="20%"  align="left">Security Sub Type</td>
               <td class="fieldname" width="40%"  align="left">Details</td>
            </tr>
            </thead>
            <tbody>
            <%           
            SecurityReceiptForm aForm = (SecurityReceiptForm)request.getAttribute("SecurityReceiptForm");
            String[]   sno =  aForm.getSno();
            if (sno != null && sno.length > 0 ){
               for (int index = 0; index < sno.length; index++ ){
                   String rowClass = (index%2 !=0 ) ? "even" : "odd";
            %>
            <tr class="<%=rowClass%>">
                 <td valign="top" class="index" ><%=(index+1)%></td>
                 <td valign="top"><%=aForm.getCheckListId()[index] %>&nbsp; </td>
                 <td valign="top"><integro:empty-if-null value="<%=aForm.getSecurityDtlId()[index]%>"/>&nbsp;</td>
                 <td valign="top"><integro:empty-if-null value="<%=aForm.getSecurityType()[index]%>"/>&nbsp;</td>
                 <td valign="top"><integro:empty-if-null value="<%=aForm.getSecuritySubType()[index]%>"/>&nbsp;</td>
                 <td valign="top"><integro:empty-if-null value="<%=aForm.getDetails()[index]%>"/>&nbsp;</td>
            </tr>
            <% } %>
               </tbody>
            </table>
            <%  }else{ %>
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection">
                 <tr >
                      <td align="center"  ><p align=center>There is no share checklist</p></td>
                   </tr>
              </table>
             <%}%>
 <br>