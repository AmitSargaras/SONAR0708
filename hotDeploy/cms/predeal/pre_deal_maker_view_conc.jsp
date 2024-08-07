<%@ page import="com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapTrxValue,
				 com.integrosys.cms.app.creditriskparam.trx.policycap.IPolicyCapGroupTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCap,
                 com.integrosys.cms.app.creditriskparam.bus.policycap.IPolicyCapGroup,
                 com.integrosys.cms.ui.creditriskparam.policycap.PolicyCapConstants,
                 com.integrosys.cms.ui.predeal.PreDealConstants,
                 com.integrosys.cms.app.predeal.bus.PreDealSearchRecord,
                 com.integrosys.cms.app.predeal.bus.PreDealConcentrationRecord"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	PreDealSearchRecord record = (PreDealSearchRecord) request.getAttribute (PreDealConstants.PRE_DEAL_RECORD);
    PreDealConcentrationRecord conc = (PreDealConcentrationRecord) request.getAttribute (PreDealConstants.CONCENTRATION);
	String counterName = (String) request.getAttribute (PreDealConstants.COUNTER_NAME);
	String isinCode = (String) request.getAttribute (PreDealConstants.ISIN_CODE);
	String ric = (String) request.getAttribute (PreDealConstants.RIC);
	
	DecimalFormat df = new DecimalFormat("#0.00");
%>

<html>
<head>
<title>View Concentration</title>



<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

			function cancel() {
				var form = document.getElementById( 'form' ) ;
				form.event.value = '<%= PreDealConstants.EVENT_MAKER_SEARCH %>' ;
				form.submit () ;
			}
//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	onLoad="MM_preloadImages('../img/approve2.gif')">
<!-- InstanceBeginEditable name="menuScript" -->
<!-- InstanceEndEditable -->
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">

	<tr id="envCanvas">

		<td width="100%" valign="top" id="envCanvasContent">
		<table id="window" border="0" cellpadding="0" cellspacing="0">

			<tr id="winCanvas">
				<td>

				<table width="100%" height="100%" border="0" cellpadding="0"
					cellspacing="0" id="contentWindow">
					<tr>
						<td colspan="3" valign="top" style="height: 100%; width: 100%;">
						<div id="contentCanvas" style="height: 100%; width: 100%;">
						<!-- InstanceBeginEditable name="contentCanvas" -->
						<table width="98%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblFormSection" style="margin-top: 10px">
							<thead>
								<tr>
									<td width="91%" height="34">
									<h3>View Concentration</h3>
									</td>
									<td width="9%"><label> <!--<input name="Submit" type="submit" class="btnNormal" value="Ear-mark" onClick="window.location.href='Earmark(user=sco,sharecounter).htm'">-->
									</label></td>
								</tr>
								<tr>
									<td colspan="2">
									<hr />
									</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="2">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="tblInfo">
										<tbody>
											<tr class="even">
												<td width="38%" class="fieldname">
													<bean:message key="label.predeal.counterName" />
												</td>
												<td width="62%">
													<integro:empty-if-null value="<%=conc.getCounterName() %>" />
												</td>
											</tr>
											<tr class="odd">
												<td class="fieldname">
													<bean:message key="label.predeal.total.market.cap" />	
												</td>
												<td>
													<% if (conc != null && conc.getMarketCapitalization() != null) { %>
													<integro:empty-if-null value="<%=conc.getMarketCapitalization().getCurrencyCode () %>" />
													<integro:empty-if-null value="<%=conc.getMarketCapitalization().getAmountAsBigDecimal().toString() %>" />
													<%} %> &nbsp;
												</td>
											</tr>
											<tr class="even">
												<td class="fieldname">
													<bean:message key="label.predeal.total.paidup.cap" />
												</td>
												<td><% if (conc != null && conc.getTotalPaidUpCapital() != null) { %>
													<integro:empty-if-null value="<%=conc.getTotalPaidUpCapital().getCurrencyCode() %>" />
													<integro:empty-if-null value="<%=conc.getTotalPaidUpCapital().getAmountAsBigDecimal().toString() %>" />
													<% } %>
												</td>
											</tr>
											<tr class="odd">
												<td class="fieldname">
													<bean:message key="label.predeal.unit.price" />
												</td>
												<td>
													<%
														if (conc != null && conc.getUnitPrice() != null) {
														String unitPrice = (conc.getUnitPrice() == null) ? null : 
																				df.format(conc.getUnitPrice().getAmountAsDouble());
													%>
													<integro:empty-if-null value="<%=conc.getUnitPrice().getCurrencyCode() %>" />
													<integro:empty-if-null value="<%=unitPrice%>" />
													<% } %>&nbsp;
												</td>
											</tr>
										</tbody>
									</table>
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="2">
									<table id="tblExchange" width="100%" border="0" cellpadding="0"
										cellspacing="0" class="tblinfo" style="margin-top: 0">
										<thead>
											<tr>
												<td width="3%"><bean:message key="label.predeal.sn" /></td>
												<td width="31%"><bean:message key="label.predeal.source.sys" /></td>
												<td width="20%"><bean:message key="label.predeal.actual.holding" /></td>
												<td width="19%"><bean:message key="label.predeal.actual.holding" /> %</td>
												<td width="27%">% (<bean:message key="label.predeal.cap" />)</td>
											</tr>
										</thead>
										<tbody>
										<%
											if (conc != null && conc.getConcentrationMap() != null && conc.getConcentrationMap().size() > 0) {
												int count = 1;
												Set keys = conc.getConcentrationMap().keySet();
												Iterator keyIterator = keys.iterator();
												
												while (keyIterator.hasNext()) {
													String key = (String)keyIterator.next();
													PreDealSearchRecord temp = (PreDealSearchRecord)conc.getConcentrationMap().get(key);
													
													double actualHoldingPercentage = (double)(temp.getCmsActualHolding()+temp.getTotalUnits()) * 100
																						/ (double)temp.getListedShareQuantity();
													
													String maxCap;
													if (temp.getIsFi()) {
														maxCap = String.valueOf(temp.getMaxCollCapFi());
													} else {
														maxCap = String.valueOf(temp.getMaxCollCapNonFi());
													}
											%>
												<tr class='<%=(count%2==1)?"odd":"even"%>'>
													<td class="index" valign="top"><%=count %></td>
													<td style="text-align: center"><%=key %></td>
													<td><%=(temp.getCmsActualHolding() + temp.getTotalUnits())%></td>
													<td><%=df.format(actualHoldingPercentage) %> %</td>
													<td><%=maxCap %> %</td>
												</tr>
												<% count++; 
												   } 
												} else {
											%>
											 	<tr class="odd" >
                                    				<td colspan="5" ><bean:message key="label.global.not.found"/></td>
                                				</tr>
											<%  } %>
										</tbody>
									</table>
									</td>
								</tr>
								<tr>
									<td colspan="2">&nbsp;</td>
								</tr>
							</tbody>
						</table>
						<table width="89" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="89">&nbsp;</td>
							</tr>
							<tr>
								<td>                    
								<a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','/cms/img/return2.gif',1)" onclick="cancel()">
                        			<img src="/cms/img/return1.gif" name="Image4413" border="0" id="Image4413" alt="cancel"/>
                    			</a></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
						</table>
						</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
        <html:form action="PreDeal.do" styleId="form">
            <html:hidden property="event"/>
            <html:hidden property="earMarkId"/>
            <html:hidden property="counterName" value="<%= counterName %>"/>
            <html:hidden property="isinCode" value="<%= isinCode %>"/>
            <html:hidden property="ric" value="<%= ric %>"/>
        </html:form>
</body>
</html>
