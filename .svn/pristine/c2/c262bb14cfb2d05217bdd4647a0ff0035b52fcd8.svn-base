<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.ArrayList"%>
<%--<%String collateralLoc=(String)request.getAttribute("collateralLoc");%>--%>

<%--<tr class="odd">--%>
<%--    <td class="fieldname">&nbsp;</td>--%>
<%--    <td>&nbsp</td>--%>
<%----%>
<%--    <td class="fieldname">&nbsp;</td>--%>
<%--    <td>&nbsp</td>--%>
<%--</tr>--%>

<tr class="odd">
    <td class="fieldname">Remargining&nbsp;</td>
    <td>
      <html:radio  property="remargin" value="Y"/>
      Yes
      <html:radio  property="remargin" value="N"/>
      No&nbsp;
      <html:errors property="remargin"/>
    </td>

    <td class="fieldname">&nbsp;</td>
    <td>&nbsp</td>
</tr>

<tr class="even">
    <td class="fieldname">Last Remargining Date&nbsp;</td>
    <td>
      <html:text property="lastRemarginDate" readonly="true"  size="15" maxlength="11" />
      <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('lastRemarginDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
      <html:errors property="lastRemarginDate"/>
    </td>

    <td class="fieldname">Next Remargining Date&nbsp;</td>
    <td>
      <html:text property="nextRemarginDate" readonly="true"  size="15" maxlength="11" />
      <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="return showCalendar('nextRemarginDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
      <html:errors property="nextRemarginDate"/>
    </td>
</tr>

<tr class="odd">
    <td class="fieldname">Risk Mitigation Category in SFA&nbsp;</td>
    <td>
        <html:select property="riskMitigationCategory">
            <option value="" >Please Select </option>
            <html:options name="riskMitigationID" labelName="riskMitigationValue"/>      
        </html:select>
      <html:errors property="riskMitigationCategory"/>
    </td>

    <td class="fieldname">External Senior Lien&nbsp;</td>
    <td>
      <html:radio  property="extSeniorLien" value="Y"/>
      Yes
      <html:radio  property="extSeniorLien" value="N"/>
      No&nbsp;
      <html:errors property="extSeniorLien"/>
    </td>
</tr>

<%--<script>--%>
<%--function changeOrgByCountry()--%>
<%--{--%>
<%--enableAllFormElements();--%>
<%--document.forms[0].event.value="prepare_form";--%>
<%--document.forms[0].submit();--%>
<%--}--%>
<%----%>
<%--</script>--%>