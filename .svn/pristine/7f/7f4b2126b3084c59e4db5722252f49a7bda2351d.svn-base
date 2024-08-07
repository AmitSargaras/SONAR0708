

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party ID</td>
										<td width="30%"><%=obCMSCustomer.getCifId() %></td>
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getLegalEntity().getShortName()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getStatus()%>"/></td>
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getMainBranch()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Segment</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getCMSLegalEntity().getCustomerSegment()%>"/></td>
										<td class="fieldname" width="20%">Party Relationship
										Start Date</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getLegalEntity().getRelationshipStartDate()%>"/></td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo" id="addParty">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getLegalEntity().getShortName()%>"/></td>
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getStatus()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%">&nbsp;</td>
										<td class="fieldname" width="20%">Group</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getPartyGroupName()%>"/></td>

									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Region</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getRmRegion()%>"/></td>
										<td class="fieldname" width="20%">Relationship Manager</td>
										<td width="30%"><integro:empty-if-null value="<%=obCMSCustomer.getRelationshipMgr()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">Cycle</td>
										<td><integro:empty-if-null value="<%=obCMSCustomer.getCycle()%>"/>
										<td class="fieldname">Segment</td>
										<td>Commodity</td>
									</tr>
									<tr class="even">
										<td class="fieldname">Entity</td>
										<td><integro:empty-if-null value="<%=obCMSCustomer.getEntity()%>"/></td>
										<td class="fieldname">RBI Industry Code</td>
										<td><integro:empty-if-null value="<%=obCMSCustomer.getRbiIndustryCode()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Industry Name</td>
										<td><integro:empty-if-null value="<%=obCMSCustomer.getIndustryName()%>"/></td>
										<td class="fieldname">PAN</td>
										<td><integro:empty-if-null value="<%=obCMSCustomer.getPan()%>"/></td>
									</tr>
									
									<tr class="even">
										<td class="fieldname">Address1</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getAddressLine1()%>"/>&nbsp;<%} %>&nbsp;</td>
										
										<td class="fieldname">Address2</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getAddressLine2()%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Address3</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getAddressLine3()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">Pincode</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getPostalCode()%>"/>&nbsp;<%} %>&nbsp;</td>

									</tr>
									<tr class="odd">
										<td class="fieldname">Country</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getCountryCode()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">Region</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getRegion()%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">State</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getState()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">City</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getCity()%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="even">
										<td class="fieldname">Telephone Number</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getTelephoneNumer()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">Fax No.</td>
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getTelex()%>"/>&nbsp;<%} %>&nbsp;</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Email</td>
										
										<td><%if(obContact!=null){ %><integro:empty-if-null value="<%=obContact.getEmailAddress()%>"/>&nbsp;<%} %>&nbsp;</td>
										<td class="fieldname">&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>
						
						<tr><td>&nbsp;</td></tr>
						
					</table>
					</td>
				</tr>
		</table>
		</td>
	</tr>

	
</table>