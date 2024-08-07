<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
<td class="fieldname"> <bean:message key="label.security.perfection.date"/><span class="mandatoryPerfection">*</span></td>
<td>
                <html:text property="perfectionDate" readonly="true" />
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('perfectionDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="perfectionDate"/>
              </td>
              <td class="fieldname">&nbsp;</td><td>&nbsp;</td>
            </tr>