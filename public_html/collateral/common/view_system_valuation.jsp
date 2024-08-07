<%@ page import="com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.IValuation" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateral" %>
<%@ page import="com.integrosys.cms.ui.collateral.TimeFreqList" %>

<%
    IValuation iVal = iCol.getSourceValuation();
    boolean isIValNull = (iVal == null);
    rowIdx = 0; // reset odd-even row highlighting 	
%>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.valuation.system.val.details"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
	<tr><td>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<tbody>
		        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		                <td width="20%" class="fieldname">
							<span class=stp><bean:message key="label.valuation.date"/></span>&nbsp;of OMV</td>
		                <td width="30%">
		                    <% if (!isIValNull) { %>
		                        <integro:date object="<%=iVal.getValuationDate()%>"/>
		                    <% } %>&nbsp;</td>
		                <td width="20%" class="fieldname">
							<span class=stp><bean:message key="label.valuation.currency"/></span></td>
		                <td width="30%">
		                    <% if (!isIValNull) { %>
		                        <integro:empty-if-null value="<%=iVal.getCurrencyCode()%>"/>
		                    <% } %> &nbsp;</td>
		        </tr>
		        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname">
						<span class=stp><bean:message key="label.valuation.omv.amount"/></span></td>
		            <td>
		               <% if (!isIValNull && iVal.getCMV() != null) {
		                    if (iVal.getCMV() !=  null && iVal.getCMV().getAmount() > 0 ){
		               %>
		                        <integro:amount param="amount" amount="<%=iVal.getCMV()%>" decimal="2"/>
		                <% }
		                    }%>
		                &nbsp;
		            </td>
		            <td class="fieldname">
						<span class=stp><bean:message key="label.valuation.fsv.amount"/></span></td>
		            <td>
		                <% if (!isIValNull && iVal.getFSV() != null) {
		                     if (iVal.getFSV() !=  null && iVal.getFSV().getAmount() > 0 ){
		                %>
		                    <integro:amount param="amount" amount="<%=iVal.getFSV()%>" decimal="2"/>
		                <% }
		                }%>
		                &nbsp;
		            </td>
		        </tr>
		        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname">
						<% if (iCol.getCollateralSubType().getSubTypeCode().equals("AB101")) { %>
							<bean:message key="label.security.evaluation.date.fsv"/>
						<% } else { %>
							<bean:message key="label.valuation.date.of.fsv"/>
						<% } %>
						</td>
		            <td>
		                <% if (!isIValNull ) { %>
		                <integro:date object="<%=iVal.getFSVEvaluationDate()%>"/>
		                <% } %> &nbsp;</td>
		            <td class="fieldname">
						<span class=stp><bean:message key="label.valuation.freq.period"/></span></td>
		            <td>
			            <bean:define id="revalFreqUnit" name="<%=formName%>"  property="revalFreqUnit"/>
			            <bean:write name="<%=formName%>" property="revalFreq"/>&nbsp;
		                <integro:empty-if-null value="<%=TimeFreqList.getInstance().getTimeFreqItem((String)revalFreqUnit)%>"/>
		            </td>
		        </tr>
		        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="fieldname">
						<% if (iCol.getCollateralSubType().getSubTypeCode().equals("AB101")) { %>
							<bean:message key="label.revaluation.date"/>
						<% } else { %>
							<span class=stp><bean:message key="label.valuation.nextdate"/></span>
						<% } %>
						</td>
		            <td>
		                <% if (!isIValNull ) { %>
		                <integro:date object="<%=iVal.getRevaluationDate()%>"/>
		                <% } %> &nbsp;</td>
		            <td class="fieldname">&nbsp;</td>
		            <td>&nbsp;</td>
		        </tr>
			</tbody>
		</table>
		</td></tr>
    </tbody>
</table>
