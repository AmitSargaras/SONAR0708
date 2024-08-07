
<tr class="<%= colorClass %>">         
	<td class="index" valign="top"><%=offset.intValue()+index + 1%></td>                 
	<td>
		<integro:empty-if-null value= "<%= form.getEntryName()[index]%>" />
	</td>
	<td >
		<integro:empty-if-null value= "<%=form.getEntryCode()[index]%>" />              
	</td>
	
	<td align="center" >  
		<integro:empty-if-null value= "<%=ctyValLabMap.get(form.getCountry()[index])%>" />  
	</td>
	<td valign="middle" align="center">    
		<html:select property="refCategoryCode" value="<%= form.getRefCategoryCode()[index]%>">            
			<integro:common-code categoryCode="<%=ob.getRefCategoryCode()%>" pleaseSelect="false"/>
		</html:select>
	</td>
	
	<td valign="middle" align="center">     
		<%
			if("A".equals(form.getActiveStatus()[index])){
		%>
				<img src="img/tick(black).gif" alt="" />
		<%
			}else{
		%>
				&nbsp;
		<%
			}
		%>
	</td>   
</tr>