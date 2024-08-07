
<tr class="<%= colorClass %>">
	<td class="index" valign="top"><%=offset.intValue()+index + 1%></td> 
	<td>
		<textarea cols="50" rows="3" name="entryName" onkeydown="return noEnter(event)" ><integro:empty-if-null value= "<%= form.getEntryName()[index]%>" /></textarea>     
		<%
			String nameErrorIDX = "entryName_"+index;
		%>
		&nbsp;<html:errors property="<%=nameErrorIDX%>" />	                                              
	</td>
	<td valign="middle">
		<input type="text" readonly="readonly" name="entryCode" value="<integro:empty-if-null value= "<%= form.getEntryCode()[index]%>" />" size="15" onkeydown="return noEnter(event)" onblur="removeNL(this)" />
		<%
			String codeErrorIDX = "entryCode_"+index;
		%>
		&nbsp;<html:errors property="<%=codeErrorIDX%>" />	
	</td>

	<td align="center" >             
		<select id="country" name="country" >                                
			<option value="" >
				<bean:message key="label.all"/>
			</option>                                
			<%
				Iterator countryLabels =  labels.iterator () ;
				Iterator countryValues =  values.iterator () ;
				
				String country = form.getCountry()[index] ;
				while ( countryLabels.hasNext () && countryValues.hasNext () ){
					String value = String.valueOf ( countryValues.next()) ;                                
			%>
			<option value="<%= value %>" <%= country == null || country.equals ( "" ) ? "" : ( value.equalsIgnoreCase ( country ) ? "selected=\"selected\""  : "" ) %> >
				<%=countryLabels.next ()%>
			</option>
			<%
				}
			%>
		</select>		
	</td>

	<td valign="middle" align="center">              
		<%
			String ckValue = form.getActiveStatus()[index];
			String checkedStr = "A".equals(ckValue)?"checked":"";
			String idStr = "activeStatus_"+index;
		%>
		<input name="activeTemp" type="checkbox" <%=checkedStr%> onclick="activate('<%=idStr%>',this)" />
		<input name="activeStatus" type="hidden" id="<%=idStr%>"  value="<%=ckValue%>" />
	</td>   
</tr>
