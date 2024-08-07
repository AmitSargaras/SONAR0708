<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

 <table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
     <tbody>
         <tr>
             <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                 <tbody>
                     <tr class="odd">
                         <td class="fieldname"><bean:message key="label.remarks"/></td>
                         <td class="odd"><html:textarea property="remarks" rows="3" cols="120" style="width:100%" />&nbsp;
                             <html:errors property="remarkError"/>
                         </td>
                     </tr>
                     <tr class="even">
                         <td class="fieldname"><bean:message key="label.last.action.by"/></td>
                         <td class="even"><%=request.getParameter("trxUserInfo")%>&nbsp;</td>
                     </tr>
                     <tr class="odd">
                         <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                         <td><integro:wrapper value='<%=request.getParameter("trxRemarks")%>'/>&nbsp;</td>
                     </tr>
                 </tbody>
             </table></td>
         </tr>
     </tbody>
 </table>
