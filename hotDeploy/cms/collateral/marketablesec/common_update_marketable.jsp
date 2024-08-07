	<!--	Begin - Five new fields		-->
			<tr class="even">	
				<td class="fieldname"><bean:message key="label.security.remargin"/></td>
				<td>
					<html:radio property="remargin" value="Y"><bean:message key="label.common.yes"/></html:radio>
              		<html:radio property="remargin" value="N"><bean:message key="label.common.no"/></html:radio>
              	</td>	
				<td class="fieldname"> &nbsp; </td>
				<td> &nbsp; </td>
			</tr>
			<tr class="odd">	
				<td class="fieldname"> <bean:message key="label.security.remargin.date.last"/>  </td>
				<td>
					<html:text property="lastRemarginDate" readonly="true" />
	 				<img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('lastRemarginDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
	 			</td>		
				<td class="fieldname"> <bean:message key="label.security.remargin.date.next"/>  </td>
				<td>
					<html:text property="nextRemarginDate" readonly="true" />
	 				<img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('nextRemarginDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
	 			</td>
			</tr>
			<tr class="even">	
				<td class="fieldname"> <bean:message key="label.security.risk.miti.cate"/>  </td>
				<td><html:text property="riskMitigationCategory" maxlength="40" /></td>		
				<td class="fieldname"> <bean:message key="label.security.ext.senior.lien"/> </td>
				<td>
					<html:radio property="extSeniorLien" value="Y"><bean:message key="label.common.yes"/></html:radio>
              		<html:radio property="extSeniorLien" value="N"><bean:message key="label.common.no"/></html:radio>				
				</td>
			</tr>
	<!--	End - Five new fields		-->