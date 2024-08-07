<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.cms.app.transaction.*,
                 com.integrosys.base.businfra.transaction.ITrxResult" %>
<%@ page import="com.integrosys.cms.app.cci.trx.ICCICounterpartyDetailsTrxValue" %>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterpartyDetails" %>


<html>
<head>
    <title>Untitled Document</title>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>

<%

    ITrxResult trxResult = (ITrxResult) request.getAttribute("request.ITrxResult");
    ICCICounterpartyDetailsTrxValue cmsTrxValue = (ICCICounterpartyDetailsTrxValue) request.getAttribute("request.ITrxValue");
    String trxId = "";
    String groupNo = "";

    if (trxResult != null) {
        ICMSTrxValue value = (ICMSTrxValue) trxResult.getTrxValue();
        if (value != null){
            trxId = value.getCurrentTrxHistoryID();
        }
    } else if (cmsTrxValue != null) {
        trxId = cmsTrxValue.getCurrentTrxHistoryID();
        ICCICounterpartyDetails details = cmsTrxValue.getStagingCCICounterpartyDetails();
        if (details != null) {
            groupNo = String.valueOf(details.getGroupCCINo());
        }
    }

%>
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
    <thead>
        <tr>
            <td><h3>Confirmation
                <hr/>
            </h3></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
                    <thead>
                    </thead>
                    <tbody>
                        <tr>
                            <td height="111" class="odd" style="text-align:center">
                                The transaction has been saved. <BR>Your Transaction ID is <B><%=trxId%></B>
                                <BR>Your Group No is <B><%=groupNo%></B>
                            </td>
                        </tr>
                        <tr>
                            <td height="51" class="odd" style="text-align:center">  &nbsp; </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
</body>
</html>
