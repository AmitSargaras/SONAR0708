    <!--    Begin - Five new fields        -->
<!--            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">    
              <td class="fieldname"><bean:message key="label.security.remargin"/></td>
              <td>
                <html:radio property="remargin" value="Y"><bean:message key="label.common.yes"/></html:radio>
                <html:radio property="remargin" value="N"><bean:message key="label.common.no"/></html:radio>
                <html:errors property="remargin"/>
              </td>    
              <td class="fieldname"> &nbsp; </td>
              <td> &nbsp; </td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">    
              <td class="fieldname"> <bean:message key="label.security.remargin.date.last"/>  </td>
              <td>
                <html:text property="lastRemarginDate" readonly="true" />
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('lastRemarginDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="lastRemarginDate"/>
              </td>        
              <td class="fieldname"> <bean:message key="label.security.remargin.date.next"/>  </td>
              <td>
                <html:text property="nextRemarginDate" readonly="true" />
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('nextRemarginDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="nextRemarginDate"/>
              </td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">    
              <td class="fieldname"> <bean:message key="label.security.risk.miti.cate"/>  </td>
              <td><html:select property="riskMitigationCategory">
                    <option value="" >Please Select </option>
                    <html:options name="riskMitigationID" labelName="riskMitigationValue"/>
                  </html:select>
                  <html:errors property="riskMitigationCategory"/>
              </td>
              <td class="fieldname"> <bean:message key="label.security.perfection.date"/>
              &nbsp;<span class="mandatory">*</span>
              </td>
              <td>
                <html:text property="perfectionDate" readonly="true" />
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('perfectionDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="perfectionDate"/>
              </td>
            </tr>-->
    <!--    End - Five new fields        -->