<%@ page import="com.integrosys.cms.app.cci.trx.ICCICounterpartyDetailsTrxValue"%>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterpartyDetails"%>
<%@ page import="com.integrosys.cms.app.cci.bus.ICCICounterparty"%>
<%
    String PrintJSP ="";
    String PrintTrxId="";
    String PrintgroupCCINo = "-";
    ICCICounterparty[]   Printobj;
    ICCICounterpartyDetails Printdetails = null;
    ICCICounterpartyDetailsTrxValue PrintTrxValue = (ICCICounterpartyDetailsTrxValue) session.getAttribute("com.integrosys.cms.ui.cci.CounterpartyCCIAction.ICCICounterpartyDetailsTrxValue");
     if (PrintTrxValue != null){
         PrintTrxId = PrintTrxValue.getTransactionID();
        // System.out.println(PrintJSP + "--> trxValue.getTransactionID() = " + PrintTrxId);
        // System.out.println(PrintJSP + "--> trxValue.getReferenceID() = " + PrintTrxValue.getReferenceID());
        // System.out.println(PrintJSP + "--> trxValue.getStagingReferenceID() = " + PrintTrxValue.getStagingReferenceID());
         Printdetails = PrintTrxValue.getStagingCCICounterpartyDetails();
        if (Printdetails != null){
            PrintTrxId = Printdetails.getGroupCCINo()+"";
        //    System.out.println(PrintJSP + "--> trxValue aGroupCCINo() = " + PrintgroupCCINo);
            Printobj = Printdetails.getICCICounterparty();
            if (Printobj != null && Printobj.length > 0) {
         //    System.out.println(PrintJSP +"--> trxValue ICCICounterparty(Stage)  = " + Printobj.length );
            }
        }
     }

%>