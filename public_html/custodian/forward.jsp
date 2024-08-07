<%@ page import="com.integrosys.component.user.app.trx.ICommonUserTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.custodian.trx.ICustodianTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.custodian.CustodianAction"%>
<%
    DefaultLogger.debug("forward.jsp", "cncl param is !"+request.getParameter("Cncl"));
    String fromPage = "edit";
    String trxId = request.getParameter("trxId");
    /*if(request.getParameter("Cncl")!=null && request.getParameter("Cncl").length()>0){
        fromPage="cncl";//expects cncl param not set when the page is not cncl...
    }
    if(request.getParameter("totrack")!=null && request.getParameter("totrack").length()>0){
        fromPage="totrack";//expects cncl param not set when the page is not cncl...
    }
    */
    ICustodianTrxValue iCustTrxVal = (ICustodianTrxValue)session.getAttribute("com.integrosys.cms.ui.custodian.CustodianAction.custodianTrxVal");
    String fromState = iCustTrxVal.getFromState();
    String status = iCustTrxVal.getStatus();
            String op = iCustTrxVal.getOpDesc();
    DefaultLogger.debug("forward.jsp","trx from state.. "+iCustTrxVal.getFromState());
    String forId = "";
    String docType = "";    
    if (iCustTrxVal.getStagingCustodianDoc() != null){
        forId = iCustTrxVal.getStagingCustodianDoc().getDocType().equals(ICMSConstant.DOC_TYPE_CC)?"cc":"security";
        docType = iCustTrxVal.getStagingCustodianDoc().getDocType();
    }
    else if (iCustTrxVal.getCustodianDoc() != null){
        forId = iCustTrxVal.getCustodianDoc().getDocType().equals(ICMSConstant.DOC_TYPE_CC)?"cc":"security";
        docType = iCustTrxVal.getCustodianDoc().getDocType();
    }
    String url = "";

    if(docType.equals(ICMSConstant.DOC_TYPE_CC)){
        url = "/custodian.do?event="+CustodianAction.EVENT_CUST_DOC_LIST_MAKER+"&trxId="+trxId;
    }else{
        url = "/custodian.do?event="+CustodianAction.EVENT_CUST_SEC_DOC_LIST_MAKER+"&trxId="+trxId;
    }

    if(request.getParameter("isClose")!=null &&
    request.getParameter("isClose").length()>0 &&
    !request.getParameter("isClose").equals("null") ){
        url+="&isClose=Y";
    }
    if (request.getParameter("event")!=null &&
    	request.getParameter("event").equals("cust_forward_todo")) {
	    url+="&isTodo=Y";
    }
	if(request.getParameter("totrack")!=null &&
        request.getParameter("totrack").length()>0 &&
        !request.getParameter("totrack").equals("null") ){
        url+="&totrack=totrack";
	}

    response.sendRedirect(response.encodeURL(request.getContextPath()+ url ));

    /*
    if(fromState.equals(ICMSConstant.STATE_PENDING_LODGE) || fromState.equals(ICMSConstant.STATE_PENDING_RELODGE)){
        if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&opcode=lodge&trxId="+trxId));
        }else if(fromPage.equals("totrack")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&totrack=totrack&opcode=lodge&trxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepaare_edit_reject_doc&forId="+
                                                     forId+"&opcode=lodge&trxId="+trxId));
        }
    }
    else if(fromState.equals(ICMSConstant.STATE_PENDING_AUTHZ_TEMP_UPLIFT)){
        if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&opcode=allowtempuplift&trxId="+trxId));
        }else if(fromPage.equals("totrack")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&totrack=totrack&opcode=allowtempuplift&trxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepaare_edit_reject_doc&forId="+
                                                     forId+"&opcode=allowtempuplift&trxId="+trxId));
        }
    }
    else if(fromState.equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT)){
         if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&opcode=tempuplift&trxId="+trxId));
        }else if(fromPage.equals("totrack")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&totrack=totrack&opcode=tempuplift&trxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepaare_edit_reject_doc&forId="+
                                                     forId+"&opcode=tempuplift&trxId="+trxId));
        }
    }else if(fromState.equals(ICMSConstant.STATE_PENDING_AUTHZ_PERM_UPLIFT)){
        if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&opcode=allowpermuplift&trxId="+trxId));
        }else if(fromPage.equals("totrack")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&forId="+
                                                     forId+"&totrack=totrack&opcode=allowpermuplift&trxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepaare_edit_reject_doc&forId="+
                                                     forId+"&opcode=allowpermuplift&trxId="+trxId));
        }
    }else if(fromState.equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT)){//todo delete reject integration
         if(fromPage.equals("cncl")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&Cncl=cncl&forId="+
                                                     forId+"&opcode=permuplift&trxId="+trxId));
        }else if(fromPage.equals("totrack")){
            DefaultLogger.debug("forward.jsp","in cncl for pending create");
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&Cncl=cncl&forId="+
                                                     forId+"&totrack=totrack&opcode=permuplift&trxId="+trxId));
        }else{
            DefaultLogger.debug("forward.jsp","in edit for pending create"+request.getContextPath());
            response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepaare_edit_reject_doc&forId="+
                                                     forId+"&opcode=permuplift&trxId="+trxId));
        }
        //the below forward are only for to-track..
    }else if((fromState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_LODGE))
        || (fromState.equals(ICMSConstant.STATE_REJECTED) && op.equals("CNCL_REJECT_LODGE"))
            ||status.equals(ICMSConstant.STATE_PENDING_LODGE)){
            if(fromPage.equals("totrack")){
                DefaultLogger.debug("forward.jsp","in cncl for pending create");
                response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&Cncl=cncl&forId="+
                                                     forId+"&totrack=totrack&opcode=lodge&trxId="+trxId));
            }
    }else if((fromState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT))
        || (fromState.equals(ICMSConstant.STATE_REJECTED) && op.equals("CNCL_REJECT_TEMP_UPLIFT"))
            ||status.equals(ICMSConstant.STATE_PENDING_TEMP_UPLIFT)){
            if(fromPage.equals("totrack")){
                DefaultLogger.debug("forward.jsp","in cncl for pending create");
                response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&Cncl=cncl&forId="+
                                                     forId+"&totrack=totrack&opcode=tempuplift&trxId="+trxId));
            }
    }else if((fromState.equals(ICMSConstant.STATE_REJECTED) && status.equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT))
        || (fromState.equals(ICMSConstant.STATE_REJECTED) && op.equals("CNCL_REJECT_PERM_UPLIFT"))
            ||status.equals(ICMSConstant.STATE_PENDING_PERM_UPLIFT)){
            if(fromPage.equals("totrack")){
                DefaultLogger.debug("forward.jsp","in cncl for pending create");
                response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&Cncl=cncl&forId="+
                                                     forId+"&totrack=totrack&opcode=permuplift&trxId="+trxId));
            }
    }else if(fromState.equals(ICMSConstant.STATE_ACTIVE) && status.equals(ICMSConstant.STATE_DRAFT)){
            if(fromPage.equals("totrack")){
                DefaultLogger.debug("forward.jsp","in cncl for pending create");
                response.sendRedirect(response.encodeURL(request.getContextPath()+"/custodian.do?event=prepare_close_reject_doc&Cncl=cncl&forId="+
                                                     forId+"&totrack=totrack&opcode=permuplift&trxId="+trxId));
            }
    }
    */

%>