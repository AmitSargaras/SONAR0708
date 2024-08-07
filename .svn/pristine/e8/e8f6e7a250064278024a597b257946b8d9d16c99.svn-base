<%@ page import="com.integrosys.cms.ui.checklist.ccreceipt.CCReceiptForm"%>
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
                <td class="fieldname" width="05%" align="left" >S/N</td>
                <td class="fieldname" width="18%" align="left" >ChecklistID&nbsp;<font color="#0000FF">*</font></td>
                <td class="fieldname" width="10%" align="left" >LE ID</td>
                <td class="fieldname" width="35%" align="left">LE Name</td>
                <td class="fieldname" width="35%" align="left">Details</td>
            </tr>
            </thead>
            <tbody>
            <%
            CCReceiptForm aForm = (CCReceiptForm)request.getAttribute("CCReceiptForm");
            String[]   sno =  aForm.getSno();             
            if (sno != null && sno.length > 0 ){
               for (int index = 0; index < sno.length; index++ ){
                   String rowClass = (index%2 !=0 ) ? "even" : "odd";                  
            %>
            <tr class="<%=rowClass%>">
                <td valign="top" class="index" ><%=(index+1)%></td>
                <td valign="top"><%=aForm.getCheckListId()[index] %>&nbsp; </td>
                <td valign="top"><integro:empty-if-null value="<%=aForm.getLeID()[index]%>"/>&nbsp;</td>
                <td valign="top"><integro:empty-if-null value="<%=aForm.getLeName()[index]%>"/>&nbsp;</td>
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


