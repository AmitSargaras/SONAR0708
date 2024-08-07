<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname" width="20%">
        <bean:message key="label.security.sec.env.liability"/>&nbsp;</td>
    <td width="30%">
        <html:select property="secEnvRisky" onchange="spanENVRISKY_DATE(this.value)">
            <option value=""><bean:message key="label.please.select"/> </option>
            <html:options name="secRiskyID" labelName="secRiskyValue"/>
        </html:select>&nbsp;
    <html:errors property="secEnvRisky"/></td>
    <td class="fieldname" width="20%">
        <bean:message key="label.security.date.sec.confirm.env.risk"/>&nbsp;
        <span id="spanENVRISKY_DATE"><span class="mandatory">*</span></span>
    </td>
    <td width="30%">
        <html:text property="dateSecurityEnv" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('dateSecurityEnv', 'dd/mm/y')"
             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
        <!-- Add by Govind S:06/08/2011 -->
         <html:errors property="dateSecurityEnv"/>
         <!-- Govind S:end line here -->
        <html:errors property="dateSecurityEnvError"/>
    </td>
</tr>


<script language="Javascript">
    <!--
    function spanENVRISKY_DATE(obj) {
         if (obj == 'Y') {
            document.getElementById("spanENVRISKY_DATE").style.visibility = "visible";
       }  else {
            document.getElementById("spanENVRISKY_DATE").style.visibility = "hidden";
        }
    }

    var s = "<%=colForm.getSecEnvRisky()%>";
    spanENVRISKY_DATE(s);
-->
</script>
