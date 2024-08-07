<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bizstructure.trx.OBCMSTeamTrxValue"%>
<%
    DefaultLogger.debug("forward.jsp", "cncl param is !"+request.getParameter("Cncl"));
    String fromPage = "edit";
    String trxId = request.getParameter("TrxId");
    if(request.getParameter("Cncl")!=null && request.getParameter("Cncl").length()>0){
        fromPage="cncl";//expects cncl param not set when the page is not cncl...
    }
    OBCMSTeamTrxValue teamTrxVal = (OBCMSTeamTrxValue)session.getAttribute("com.integrosys.cms.ui.bizstructure.BizStructureIPinAction.TeamTrxValue");
    String fromState = teamTrxVal.getFromState();
    DefaultLogger.debug("forward.jsp","trx from state.. "+teamTrxVal.getFromState());
    DefaultLogger.debug("forward.jsp","trx id is.. "+trxId+"<>"+teamTrxVal.getTransactionID());

    if(fromState.equals("PENDING_CREATE")){
        if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/bizstructure.do?event=rejected_delete_read&from=add&Cncl=cncl&TrxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/bizstructure.do?event=rejected_add_read&TrxId="+trxId));
        }
    }else if(fromState.equals("PENDING_UPDATE")){
         if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/bizstructure.do?event=rejected_delete_read&from=edit&Cncl=cncl&TrxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/bizstructure.do?event=rejected_edit_read&TrxId="+trxId));
        }
    }else if(fromState.equals("PENDING_DELETE")){//todo delete reject integration
         if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/bizstructure.do?event=rejected_delete_read&from=del&Cncl=cncl&TrxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/bizstructure.do?event=rejected_delete_read&from=del&TrxId="+trxId));
        }
    }

%>