<%@ page import="com.integrosys.cms.ui.collateral.CollateralHelper" %>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue" %>
<%@ page
		import="com.integrosys.cms.app.collateral.bus.type.property.subtype.serviceapartment.ICommercialServiceApartment" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%

//	ICollateralTrxValue itrxValue = ( ICollateralTrxValue ) session.getAttribute ( "com.integrosys.cms.ui.collateral.property.PropertyAction.serviceColObj" );
//	ICommercialServiceApartment iCol = ( ICommercialServiceApartment ) itrxValue.getCollateral ();
//	ICommercialServiceApartment oldCollateral = ( ICommercialServiceApartment ) itrxValue.getCollateral ();
//	ICommercialServiceApartment newCollateral = ( ICommercialServiceApartment ) itrxValue.getStagingCollateral ();
//
//	String subtype = "PropCommServiceApt";
//	String prefix = "Property";
//	String from_event = "read";
//	boolean isProcess = false;


%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"
	   style="margin-top:10px">

	<thead>

		<tr>

			<td>
				<h3>
					<bean:message key="label.valuation.from.los"/>
				</h3>
			</td>
		</tr>

		<tr>
			<td>
				<hr/>
			</td>
		</tr>

	</thead>

	<tbody>
		<tr>

			<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">

					<thead>

						<tr>

							<td width="3%">
								<bean:message key="label.global.sn"/>
							</td>

							<td width="9%">
								<bean:message key="label.valuation.valuer"/>
							</td>

							<td width="25%">
								<bean:message key="label.valuation.omv.cms.sec.currency"/>
							</td>

							<td width="11%">
								<bean:message key="label.valuation.date"/>
							</td>

							<td width="22%">
								<bean:message key="label.valuation.date.received"/>
							</td>

							<td width="22%">
								<bean:message key="label.security.evaluation.date.fsv"/>
							</td>

							<td width="8%">
								<bean:message key="label.global.action"/>
							</td>

						</tr>

					</thead>

					<tbody>
<%
					List list = oldCollateral.getSourceValuationDetails () ;


					if ( list == null || list.size () == 0 )
					{
%>

						<tr>

							<td colspan="7" >
								<bean:mesage key="label.security.no.valuation.available.frm.los"/>
							</td>

						</tr>

<%
					}
					else
					{
						Iterator iter = list.iterator () ;

						boolean odd = true ;
						int counter = 0 ;

						while ( iter.hasNext () )
						{
//							OBSourceValuation obSrc = (OBSourceValuation) iter.next () ;


%>
						<tr>

							<td width="3%" class="index" >
								<%=counter + 1%>
							</td>

							<td >
							
							</td>

							<td >

							</td>

							<td >

							</td>

							<td >

							</td>

							<td >

							</td>

							<td >
								<a href="#" >

								</a>
							</td>

						</tr>

<%
							++counter ;
							}
						}
%>



					</tbody>

				</table>

			</td>
		</tr>
	</tbody>
</table>
