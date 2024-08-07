<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">


<%if(!formName.equals("AssetSpecVehiclesForm")){ %>
    <td class="fieldname">
        <bean:message key="label.security.sec.env.liability"/>
        <font color="red">*</font>
    </td>
    <%} else{%>
     <td class="fieldname">
        <bean:message key="label.security.sec.env.liability"/>
      
    </td>
    <%} %>
    <td>
        <html:select property="secEnvRisky" onchange="spanENVRISKY_DATE(this.value)">
            <option value="">Please Select </option>
            <html:options name="secRiskyID" labelName="secRiskyValue"/>
        </html:select>&nbsp;
    <html:errors property="secEnvRisky"/></td>
    <td class="fieldname">
        <bean:message key="label.security.date.sec.confirm.env.risk"/>&nbsp;
        <span id="spanENVRISKY_DATE"><font color="red">*</font>
    </td>
    <td>
        <html:text property="dateSecurityEnv" readonly="true" size="15" maxlength="11"/>
        <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('dateSecurityEnv', 'dd/mm/y')"
             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
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