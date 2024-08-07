<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="fieldname">
        <bean:message key="label.security.legal.enforceability"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
    <td width="30%">
        <html:select property="le" onchange="setEnforceDateAsterisk(this.value)">
            <option value=""><bean:message key="label.please.select"/></option>
            <html:options name="LEID" labelName="LEValue"/>
        </html:select> <html:errors property="le"/> </td>
    <td width="20%" class="fieldname">
        <bean:message key="label.security.legal.enforceability.date"/>&nbsp;
        <span id="mandSubEnforceDate" class="mandatory" >*</span>
        <span id="mandPerfEnforceDate" class="mandatoryPerfection">*</span>
	</td>
    <td width="30%">
        <html:text property="leDate" readonly="true"/>
        <img src="img/calendara.gif" name="Image724" border="0" id="Image724" onclick="showCalendar('leDate', 'dd/mm/y')"
             onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
        <html:errors property="leDate"/>&nbsp; </td>
</tr>

<script language="Javascript">
<!--
	function hideAll(idArray) {
		for (var i=0; i<idArray.length; i++) {
			elem = document.getElementById(idArray[i]);
			elem.style.visibility = "hidden";
		}
	}
	
	function showAll(idArray) {
		for (var i=0; i<idArray.length; i++) {
			elem = document.getElementById(idArray[i]);
			elem.style.visibility = 'visible';
		}
	}

    function setEnforceDateAsterisk(obj) {
	    var ids = new Array('mandSubEnforceDate', 'mandPerfEnforceDate');
	    
        if (obj == 'Y') {
            showAll(ids);
       	}  
       	else {
            hideAll(ids);
        }
    }

    var s = "<%=colForm.getLe()%>";
    setEnforceDateAsterisk(s);
-->
</script>
