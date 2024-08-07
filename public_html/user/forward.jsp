<%@ page import="com.integrosys.component.user.app.trx.ICommonUserTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue"%>
<%
    DefaultLogger.debug("forward.jsp", "cncl param is !"+request.getParameter("Cncl"));
    String fromPage = "edit";
    String trxId = request.getParameter("TrxId");
    if(request.getParameter("Cncl")!=null && request.getParameter("Cncl").length()>0){
        fromPage="cncl";//expects cncl param not set when the page is not cncl...
    }
    OBUserTrxValue userTrxVal = (OBUserTrxValue)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.CommonUserTrxValue");
    String fromState = userTrxVal.getFromState();
    DefaultLogger.debug("forward.jsp","trx from state.. "+userTrxVal.getFromState());
    DefaultLogger.debug("forward.jsp","trx id is.. "+trxId+"<>"+userTrxVal.getTransactionID());

    if(fromState.equals("PENDING_CREATE")){
        if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/user.do?event=rejected_delete_read&Cncl=cncl&from=add&TrxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/user.do?event=rejected_add_read&TrxId="+trxId));
        }
    }else if(fromState.equals("PENDING_UPDATE")){
         if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/user.do?event=rejected_delete_read&from=edit&Cncl=cncl&TrxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/user.do?event=rejected_edit_read&TrxId="+trxId));
        }
    }else if(fromState.equals("PENDING_DELETE")){//todo delete reject integration
         if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/user.do?event=rejected_delete_read&from=del&Cncl=cncl&TrxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/user.do?event=rejected_delete_read&from=del&TrxId="+trxId));
        }
    }

%>