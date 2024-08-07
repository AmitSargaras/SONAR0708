<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord"%>
<%@ page import="com.integrosys.cms.app.predeal.trx.OBPreDealTrxValue"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.OBPreDeal"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>


<%@ taglib uri="/WEB-INF/taglib/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/taglib/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/taglib/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>
<%
	PreDealSearchRecord record = (PreDealSearchRecord) request
	.getAttribute(PreDealConstants.PRE_DEAL_RECORD);

	if (record == null)
		record = new PreDealSearchRecord();

	OBPreDealTrxValue trxValue = (OBPreDealTrxValue) request
			.getAttribute(PreDealConstants.OB_PRE_DEAL_TRX_VALUE);

	OBPreDeal ob = (OBPreDeal) trxValue.getStagingPreDeal();
	OBPreDeal original = (OBPreDeal) trxValue.getPreDeal();
	
	String remarks = trxValue.getRemarks();
	String lastActionBy = trxValue.getUserInfo();

	if (lastActionBy == null) {
		lastActionBy = "";
	}

	if (remarks == null) {
		remarks = "";
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
%>


<html>

<head>

<script type="text/javascript">
		<!--

			function submit ()
			{
			 	var form = document.getElementById( 'form' ) ;
				form.event.value  = '<%= PreDealConstants.EVENT_CHECKER_APPROVE_NEW %>' ;
				form.submit () ;
			}

			function reject ()
			{
				var form = document.getElementById( 'form' ) ;
				form.event.value  = '<%= PreDealConstants.EVENT_CHECKER_REJECT_NEW %>' ;
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
					<integro:empty-if-null value="<%= record.getUpdatePrice ().getCurrencyCode () %>" />&nbsp;
				</td>
			</tr>
                    			
			<tr class="odd">
				<!--Listed Shares (Quantity)-->
				<td class="fieldname"><bean:message
					key="label.predeal.listed.share" /></td>
				<td colspan="3">
					<integro:empty-if-null value="<%= String.valueOf( record.getListedShareQuantity () ) %>" />&nbsp;
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

			<tr class="odd">

				<!--Customer Name-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"customerName")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.cust.name" /> <span class="style1"> * </span>
				</td>
				<td colspan="3">
					<bean:write name="PreDealForm" property="customerName" />
				</td>

			</tr>

			<tr class="even">
				<!--Source System-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"sourceSystem")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.source.sys" /> <span class="style1"> * </span>
				</td>

				<td colspan="3">
					<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue ( PreDealConstants.PRE_DEAL_SOURCE , ob.getSourceSystem () )%>" />
				</td>

			</tr>

			<tr class="odd">
				<!--Security ID-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"securityId")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.sec.id" />
				</td>
				<td colspan="3"><bean:write name="PreDealForm" property="securityId" /></td>
			</tr>

			<tr class="even">
				<!--A/A Number-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"aaNumber")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.aa.num" />
					<span class="style1"> * </span>
				</td>
				<td colspan="3">
					<bean:write name="PreDealForm" property="aaNumber" />
				</td>

			</tr>

			<tr class="odd">
				<!--Branch Name-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"branchName")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.branch.name" /> <span class="style1"> * </span>
				</td>
				<td colspan="3"><bean:write name="PreDealForm" property="branchName" /></td>

			</tr>

			<tr class="even">
				<!--Branch Code-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"branchCode")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.branch.code" /> 
					<span class="style1"> * </span>
				</td>
				<td colspan="3"><bean:write name="PreDealForm" property="branchCode" /></td>
			</tr>

			<tr class="odd">
				<!--GCIF No. /BWCIF No.-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"cifNo")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.gcif.bwcif.no" />
				</td>
				<td colspan="3"><bean:write name="PreDealForm" property="cifNumber" /></td>
			</tr>

			<tr class="even">
				<!--Account No.-->
				<td class="<%=CompareOBUtil.compOB(ob,original,"accountNo")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.account.no" /></td>
				<td colspan="3"><bean:write name="PreDealForm" property="accountNo" /></td>
			</tr>

			<tr class="odd">
				<!--No. of Units to be earmarked-->
				<td width="40%" class="<%=CompareOBUtil.compOB(ob,original,"earMarkUnits")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.unit.tobe.earmarked" /> 
					<span class="style1">* </span>
				</td>
				<td  colspan="3" width="60%">
					<bean:write name="PreDealForm" property="earMarkUnits" />
				</td>
			</tr>
			<tr class="even">

				<!--No. of Units to be earmarked-->
				<td width="40%" class="<%=CompareOBUtil.compOB(ob,original,"purposeOfEarmarking")?"fieldname":"fieldnamediff"%>">
					<bean:message key="label.predeal.purposeOfEarmarking" /> 
				</td>
				<td width="60%" colspan="3">
					<bean:write name="PreDealForm" property="purposeOfEarmarking" /> 
				</td>
			</tr>			

		</tbody>

	</table>

	<br />

	<table width="60%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblInfo">

		<tbody>

			<tr>

				<td class="fieldname"><!--Remarks--> <bean:message
					key="label.remarks" /></td>

				<td class="odd"><textarea name="remarks" id="remarks" rows="4"
					cols="80"></textarea></td>

			</tr>

			<tr>

				<td class="fieldname"><!--Last Action By--> <bean:message
					key="label.last.action.by" /></td>

				<td class="even">&nbsp;<%=lastActionBy%></td>

			</tr>

			<tr class="odd">

				<td class="fieldname"><!--Last Remarks Made--> <bean:message
					key="label.last.remarks.made" /></td>

				<td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>

			</tr>

		</tbody>

	</table>


	<html:hidden property="event" />

	<input type="hidden" name="TrxID"
		value="<%= (String)request.getAttribute ( PreDealConstants.TRX_ID ) %>" />

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
			onmouseover="MM_swapImage('Image4411','','/cms/img/approve2.gif',1)"
			onClick="submit()"> <img src="/cms/img/approve1.gif"
			name="Image4411" border="0" id="Image4411" /> </a></td>

		<td width="100" valign="baseline" align="center"><a href="#"
			onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image4412','','/cms/img/reject2.gif',1)"
			onClick="reject()"> <img src="/cms/img/reject1.gif"
			name="Image4412" border="0" id="Image4412" /> </a></td>

		<td width="100" valign="baseline" align="center">
			<a href="/cms/ToDo.do?event=prepare&isMenu=Y" onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image4413','','/cms/img/cancel2.gif',1)">
				<img src="/cms/img/cancel1.gif" name="Image4413" border="0"	id="Image4413" /> 
			</a>
		</td>

	</tr>

	<tr>

		<td valign="baseline" align="center">&nbsp;</td>

		<td valign="baseline" align="center">&nbsp;</td>

	</tr>

</table>

</body>

</html>