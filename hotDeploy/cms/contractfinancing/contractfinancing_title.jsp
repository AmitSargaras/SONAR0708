<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBContractFinancing" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue" %>
<%@ page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.integrosys.cms.app.customer.bus.ICMSCustomer" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ILimitProfile user = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
%>
<!-- WinTitle Container -->
<table id="winTitleBar" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td bgcolor="#FFCC00" align="left">
            <input id="imgPropertyIcon" name="imgPropertyIcon" type="image" src="img/win/icon.gif" width="16" height="16" border="0"/>
        </td>
        <td bgcolor="#FFCC00" style="width:100%">
            <label></label>
            <label><%=customer.getCustomerName()%>
            </label>
            &nbsp;(<%=customer.getCMSLegalEntity().getLEReference()%>)
        </td>
    </tr>
</table>

<label>AA Number: </label>
<label id="txtContentTitle"><%=user.getBCAReference()%>
</label>&nbsp;
<img src="img/icon/seprate_bar.gif" height="12"/>
&nbsp;
<label>Approved Date:</label>
<label id="txtContentTitle"><integro:empty-if-null value="<%=user.getApprovalDate()%>" />
</label>&nbsp;
<%
    String collectionAccount = "";
    String projectAccount = "";
    String contractNumber = "";

    IContractFinancingTrxValue contractFinancingTrxValue = (IContractFinancingTrxValue) session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.contractFinancingTrxValue");
    if (contractFinancingTrxValue != null) {
        OBContractFinancing obContractFinancing = (OBContractFinancing) contractFinancingTrxValue.getStagingContractFinancing();
        collectionAccount = obContractFinancing.getCollectionAccount();
        projectAccount = obContractFinancing.getProjectAccount();
        contractNumber = obContractFinancing.getContractNumber();
    }

    HashMap map = (HashMap) request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
    String rightPath = (String) map.get(ICommonEventConstant.RIGHT_FRAME);
    if (!rightPath.equals("/contractfinancing/contractfinancing_list.jsp")) {
%>
<img src="img/icon/seprate_bar.gif" height="12"/>
&nbsp;
<label>Coll A/C No:</label>
<label id="txtContentTitle"><integro:empty-if-null value="<%=collectionAccount%>" />
</label>&nbsp;
<img src="img/icon/seprate_bar.gif" height="12"/>
&nbsp;
<label>Project A/C No:</label>
<label id="txtContentTitle"><integro:empty-if-null value="<%=projectAccount%>" />
</label>
<br>
<label>Contract No:</label>
<label id="txtContentTitle"><integro:empty-if-null value="<%=contractNumber%>" />
</label></td>
<%
    }
%>