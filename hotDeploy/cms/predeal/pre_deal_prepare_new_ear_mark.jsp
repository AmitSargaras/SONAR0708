<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord"%>
<%@ page import="java.text.DecimalFormat"%>


<%@ taglib uri="/WEB-INF/taglib/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>
<%
	PreDealSearchRecord record = (PreDealSearchRecord) request
				.getAttribute(PreDealConstants.PRE_DEAL_RECORD);

	if (record == null) {
		record = new PreDealSearchRecord();

	}

	double groupCon = 0;
	if (record.getListedShareQuantity() > 0) {
		groupCon = (record.getGroupTotalUnits() + record.getGroupCmsActualHolding()
		+ record.getGroupEarmarkHolding() + record.getGroupEarmarkCurrent())
		* 100 / (double) record.getListedShareQuantity();
	}
	
	double con = 0;
	if (record.getListedShareQuantity() > 0) {
		con = (record.getTotalUnits() + record.getCmsActualHolding()
		+ record.getEarmarkHolding() + record.getEarmarkCurrent())
		* 100 / (double) record.getListedShareQuantity();
	}	

	DecimalFormat df = new DecimalFormat("#0.00");

	String counterName = (String) request
			.getAttribute(PreDealConstants.COUNTER_NAME);
	String isinCode = (String) request
			.getAttribute(PreDealConstants.ISIN_CODE);
	String ric = (String) request.getAttribute(PreDealConstants.RIC);

	pageContext
			.setAttribute(
			PreDealConstants.PRE_DEAL_SOURCE_LABELS,
			request
			.getAttribute(PreDealConstants.PRE_DEAL_SOURCE_LABELS));
	pageContext
			.setAttribute(
			PreDealConstants.PRE_DEAL_SOURCE_VALUES,
			request
			.getAttribute(PreDealConstants.PRE_DEAL_SOURCE_VALUES));
%>


<html>
<head>
<script type="text/javascript">
<!--

	function submit ()
	{
	 	var form = document.getElementById( 'form' ) ;
		form.event.value  = '<%= PreDealConstants.EVENT_MAKER_PRESUBMIT_NEW_EAR_MARK %>' ;
		form.submit () ;
	}

	function cancel ()
	{
		var form = document.getElementById( 'form' ) ;
		form.event.value  = '<%= PreDealConstants.EVENT_MAKER_SEARCH %>' ;
		form.submit () ;
	}

	function calculate ()
	{
		var form = document.getElementById( 'form' ) ;
		form.event.value  = '<%= PreDealConstants.EVENT_MAKER_CALCULATE %>' ;
		form.submit () ;
	}
	
	function sourcesystem()
	{
		var form = document.getElementById( 'form' ) ;
		form.event.value  = '<%= PreDealConstants.EVENT_MAKER_SOURCE_SYSTEM %>' ;
		form.submit () ;			
	}

//-->
</script>


<title><!-- Pre-Deal --> <bean:message key="title.pre.deal" /></title>

</head>

<body>

<br />

<table width="70%" border="0" align="center" cellpadding="0"
	cellspacing="0" class="tblFormSection">
	<thead>
		<tr>
			<td>
			<h3>Ear-marking of Share Counter</h3>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
	</thead>
</table>

<br />

<html:form action="PreDeal.do" styleId="form">

	<table width="70%" align="center" border="0" cellspacing="0"
		cellpadding="0" class="tblInfo">
		<tbody>
			<tr class="odd">
				<!--Counter Name-->
				<td width="40%" class="fieldname">
					<bean:message key="label.predeal.counterName" />
				</td>

				<td width="60%" colspan="3">
					<integro:empty-if-null value="<%= record.getName () %>" />&nbsp;
				</td>
			</tr>

			<tr class="even">

				<!--ISIN Code-->
				<td width="40%" class="fieldname">
					<bean:message key="label.predeal.isin.code" />
				</td>

				<td width="60%" colspan="3">
					<integro:empty-if-null value="<%= record.getIsin_code () %>" />&nbsp;
				</td>

			</tr>

			<tr class="odd">

				<!--RIC-->
				<td width="40%" class="fieldname">
					<bean:message key="label.predeal.ric" />
				</td>

				<td width="60%" colspan="3">
					<integro:empty-if-null value="<%= record.getRic () %>" />&nbsp;
				</td>

			</tr>

			<tr class="even">

				<!--Stock Code -->
				<td width="40%" class="fieldname">
					<bean:message key="label.predeal.stock.code" />
				</td>

				<td width="60%" colspan="3">
					<integro:empty-if-null value="<%= record.getStockCode() %>" />&nbsp;
				</td>

			</tr>
			<tr class="odd">

				<!--Currency-->
				<td width="40%" class="fieldname">
					<bean:message key="label.predeal.currency" />
				</td>

				<td width="60%" colspan="3">
					<%
						String currency = null;
	
						if (record.getUpdatePrice() != null) {
							currency = record.getUpdatePrice().getCurrencyCode();
						}
					%> <integro:empty-if-null value="<%= currency %>" />&nbsp;
				</td>

			</tr>

			<tr class="even">

				<!--Listed Shares (Quantity)-->
				<td class="fieldname">
					<bean:message key="label.predeal.listed.share" />
				</td>
				<td colspan="3">
					<integro:empty-if-null value="<%= String.valueOf ( record.getListedShareQuantity () ) %>" />&nbsp;
				</td>

			</tr>
			
			<tr>
				<td colspan="4"> &nbsp; </td>
			</tr>
			
			<tr>
				<td colspan="2" class="fieldname"> <bean:message key="label.predeal.bank.concentration" /> &nbsp; </td>
				<td colspan="2" class="fieldname"> <bean:message key="label.predeal.bank.entity.concentration" /> &nbsp; </td>
			</tr>
			
			<tr class="odd">
				<!--% Maximum Collateral Cap Limit (Bank)-->
				<td class="fieldname">
					<bean:message key="label.predeal.max.col.bank.cap" />
				</td>
				<td>
					<%
						String maxCap = null;
	
						System.out.println(request
								.getAttribute(PreDealConstants.PRE_DEAL_SOURCE_LABELS));
						System.out.println(request
								.getAttribute(PreDealConstants.PRE_DEAL_SOURCE_VALUES));
	
						if (record.getIsFi()) {
							maxCap = String.valueOf(record.getGroupMaxCollCapFi());
						} else {
							maxCap = String.valueOf(record.getGroupMaxCollCapNonFi());
						}
					%> <integro:empty-if-null value="<%= maxCap %>" />&nbsp;
				</td>
				
				<!--% Maximum Collateral Cap Limit (Entity)-->
				<td class="fieldname">
					<bean:message key="label.predeal.max.col.entity.cap" />
				</td>
				<td>
					<%
						maxCap = null;
	
						if (record.getIsFi()) {
							maxCap = (record.getMaxCollCapFi() == 0) ? null : String.valueOf(record.getMaxCollCapFi());
						} else {
							maxCap = (record.getMaxCollCapNonFi() == 0) ? null : String.valueOf(record.getMaxCollCapNonFi());
						}
					%> <integro:empty-if-null value="<%= maxCap %>" />&nbsp;
				</td>				
			</tr>			
			<tr class="even">

				<!--Total Actual Holdings Held by Bank Group &ndash; (1)-->
				<td class="fieldname">
					<bean:message key="label.predeal.total.bank.group.holdings" /> &ndash; (1)
				</td>
				<td>
					<%
						String totalHolding = String.valueOf(record.getGroupTotalUnits()
						+ record.getGroupCmsActualHolding());
					%> <integro:empty-if-null value="<%= totalHolding %>" />&nbsp;
				</td>
				<!-- Total Actual  -->
				
				<!--Total Actual Holdings Held by Entity &ndash; (1)-->
				<td class="fieldname">
					<bean:message key="label.predeal.total.entity.holdings" /> &ndash; (1)
				</td>
				<td>
					<%
						totalHolding = String.valueOf(record.getTotalUnits()
						+ record.getCmsActualHolding());
						totalHolding = (Double.parseDouble(totalHolding) == 0) ? null : totalHolding;
					%> <integro:empty-if-null value="<%= totalHolding %>" />&nbsp;
				</td>
				<!-- Total Actual  -->				

			</tr>

			<tr class="odd">

				<!--No. of earmarked units held in &ldquo;Holding Area&rdquo; of Bank Group &ndash; (2)-->
				<td class="fieldname">
					<bean:message key="label.predeal.earmarked.units" /> &ndash; (2)
				</td>
				<td><integro:empty-if-null
					value="<%= String.valueOf ( record.getGroupEarmarkHolding () ) %>" />&nbsp;
				</td>
				
				<!--No. of earmarked units held in &ldquo;Holding Area&rdquo; &ndash; (2)-->
				<td class="fieldname">
					<bean:message key="label.predeal.earmarked.units" /> &ndash; (2)
				</td>
				<td>
					<integro:empty-if-null value="<%=(record.getEarmarkHolding() == 0) ? null : String.valueOf (record.getEarmarkHolding())%>" />&nbsp;
				</td>				

			</tr>

			<tr class="even">

				<!--Total Current earmarked Units &ndash; by Bank Group (3)-->
				<td class="fieldname">
					<bean:message key="label.predeal.current.earmarked" /> &ndash; (3)
				</td>

				<td>
					<integro:empty-if-null value="<%= String.valueOf ( record.getGroupEarmarkCurrent () ) %>" />&nbsp;
				</td>

				<!--Total Current earmarked Units &ndash; by Bank Entity(3)-->
				<td class="fieldname">
					<bean:message key="label.predeal.current.earmarked" /> &ndash; (3)
				</td>

				<td>
					<integro:empty-if-null value="<%= (record.getEarmarkCurrent() == 0) ? null : String.valueOf (record.getEarmarkCurrent()) %>" />&nbsp;
				</td>
			</tr>

			<tr class="odd">

				<!--% Concentration Holdings for Bank Group-->
				<td class="fieldname">
					<bean:message key="label.predeal.concentration.holdings" />
				</td>
				<td>
					<integro:empty-if-null value="<%=df.format (groupCon) %>" />%
				</td>

				<!--% Concentration Holdings for Entity-->
				<td class="fieldname">
					<bean:message key="label.predeal.concentration.holdings" />
				</td>
				<td>
					<integro:empty-if-null value="<%=(con == 0) ? null : df.format ( con ) %>" />%
				</td>
			</tr>

			<tr>
				<td colspan="4"> &nbsp; </td>
			</tr>

			<tr class="even">
				<!--Customer Name-->
				<td class="fieldname">
					<bean:message key="label.predeal.cust.name" /> <span class="style1"> * </span>
				</td>
				<td colspan="3">
					<html:text property="customerName" /> 
					<html:errors property="customerName" />
				</td>
			</tr>

			<tr class="odd">
				<!--Source System-->
				<td class="fieldname">
					<bean:message key="label.predeal.source.sys" /> <span class="style1"> * </span>
				</td>
				<td colspan="3">
					<html:select property="sourceSystem" onchange="sourcesystem();">
						<html:option value="">Please Select</html:option>
						<html:options name="PREDEAL_SOURCE_VALUES" labelName="PREDEAL_SOURCE_LABELS" />
					</html:select> 
					<html:errors property="sourceSystem" />
				</td>
			</tr>

			<tr class="even">
				<!--Security ID-->
				<td class="fieldname">
					<bean:message key="label.predeal.sec.id" />
				</td>
				<td colspan="3">
					<html:text property="securityId" /> 
					<html:errors property="securityId" />
				</td>

			</tr>

			<tr class="odd">
				<!--A/A Number-->
				<td class="fieldname"><bean:message key="label.predeal.aa.num" />
				<span class="style1"> * </span></td>
				<td colspan="3">
					<html:text property="aaNumber" /> 
					<html:errors property="aaNumber" />
				</td>
			</tr>

			<tr class="even">

				<!--Branch Name-->
				<td class="fieldname"><bean:message
					key="label.predeal.branch.name" /> <span class="style1"> * </span>
				</td>
				<td colspan="3">
					<html:text property="branchName" /> 
					<html:errors property="branchName" />
				</td>
			</tr>

			<tr class="odd">

				<!--Branch Code-->
				<td class="fieldname">
					<bean:message key="label.predeal.branch.code" /> <span class="style1"> * </span>
				</td>
				<td colspan="3"><html:text property="branchCode" /> 
					<html:errors property="branchCode" />
				</td>

			</tr>

			<tr class="even">
				<!--GCIF No. /BWCIF No.-->
				<td class="fieldname"><bean:message
					key="label.predeal.gcif.bwcif.no" /></td>
				<td colspan="3"><html:text property="cifNumber" /> 
					<html:errors property="cifNumber" /></td>

			</tr>

			<tr class="odd">
				<!--Account No.-->
				<td class="fieldname">
					<bean:message key="label.predeal.account.no" /></td>
				<td colspan="3">
					<html:text property="accountNo" /> 
					<html:errors property="accountNo" />
				</td>

			</tr>

			<tr class="even">

				<!--No. of Units to be earmarked-->
				<td width="40%" class="fieldname">
					<bean:message key="label.predeal.unit.tobe.earmarked" /> 
					<span class="style1">* </span>
				</td>
				<td width="60%"  colspan="3">
					<html:text property="earMarkUnits" /> 
					<html:errors property="earMarkUnits" /> <input type="button" name="Calculate"
					value="Calculate" onclick="calculate()">
				</td>
			</tr>
			<tr class="odd">

				<!--No. of Units to be earmarked-->
				<td width="40%" class="fieldname">
					<bean:message key="label.predeal.purposeOfEarmarking" /> 
				</td>
				<td width="60%"  colspan="3">
					<html:text property="purposeOfEarmarking" /> 
					<html:errors property="purposeOfEarmarking" />
				</td>
			</tr>			
		</tbody>
	</table>

	<html:hidden property="event" />
	<html:hidden property="feedId" />
	<html:hidden property="counterName" value="<%= counterName %>" />
	<html:hidden property="isinCode" value="<%= isinCode %>" />
	<html:hidden property="ric" value="<%= ric %>" />
</html:form>
<br />

<table width="150" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td valign="baseline" align="center">&nbsp;</td>
		<td valign="baseline" align="center">&nbsp;</td>
	</tr>
	<tr>

		<td width="100" valign="baseline" align="center"><a href="#"
			onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image4411','','/cms/img/submit2.gif',1)"
			onClick="submit()"> <img src="/cms/img/submit1.gif"
			name="Image4411" border="0" id="Image4411" /> </a></td>

		<td width="100" valign="baseline" align="center"><a href="#"
			onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image4413','','/cms/img/cancel2.gif',1)"
			onclick="cancel()"> <img src="/cms/img/cancel1.gif"
			name="Image4413" border="0" id="Image4413" /> </a></td>
	</tr>

	<tr>
		<td valign="baseline" align="center">&nbsp;</td>
		<td valign="baseline" align="center">&nbsp;</td>
	</tr>
</table>
</body>
</html>