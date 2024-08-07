<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<br>
<br>
<script>

function dispatchPage(dispatchFlag)
{
var eventField=document.forms[0].event;
if(dispatchFlag=='Y')
{
eventField.value="maintain";
}
else
{
eventField.value="list";
}
document.forms[0].submit();
}
</script>
<%
String  checkListID=(String)request.getAttribute("checkListID");
String  limitBkgLoc=(String)request.getAttribute("limitBkgLoc");
String  orgCode=(String)request.getAttribute("orgCode");
String  legalConstitution=(String)request.getAttribute("legalConstitution");
String  limitProfileID=(String)request.getAttribute("limitProfileID");
String  legalID=(String)request.getAttribute("legalID");
String  custCategory=(String)request.getAttribute("custCategory");
%>
<html:form action="CCCheckList.do" >
<input type="hidden" name="event" />
<input type="hidden" name="checkListID"        value="<%=checkListID%>" >
<input type="hidden" name="limitBkgLoc"        value="<%=limitBkgLoc%>" >
<input type="hidden" name="orgCode"            value="<%=orgCode%>" >
<input type="hidden" name="legalConstitution"  value="<%=legalConstitution%>" >
<input type="hidden" name="limitProfileID"     value="<%=limitProfileID%>">
<input type="hidden" name="custCategory"       value="<%=custCategory%>">
<input type="hidden" name="legalID"            value="<%=legalID%>">

<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  <thead>
    <tr> 
      <td><h3>Collaboration Task Option
          <hr/>
        </h3></td>
    </tr>
  </thead>
  <tbody>
    <tr> 
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr> 
             <td height="111" class="odd" style="text-align:center">

This function requires Collaboration Task. To disable 
the Collaboration Task and continue maintenance of 
checklist / completion of security details (as 
applicable), please click on 'Yes' else click on 'Cancel' 
to cancel the action.

             </td>
            </tr>
            <tr> 
              <td height="51" class="odd" style="text-align:center">
			  <input type="radio" name='dispatchToMaintain' value="Y" onclick="dispatchPage(this.value)">Yes
&nbsp;&nbsp;
<input type="radio" name='dispatchToMaintain' value="N" onclick="dispatchPage(this.value)">Cancel
			  </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
</html:form>
