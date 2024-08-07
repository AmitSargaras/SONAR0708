<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.util.DateUtil,
				 com.integrosys.cms.app.customer.bus.ICMSCustomer,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.ui.checklist.PrintCheckListInfo,
				 com.integrosys.cms.ui.checklist.PrintInfo,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.app.chktemplate.bus.IDocumentHeld,
				 com.integrosys.cms.app.chktemplate.bus.IDocumentHeldItem,
				 com.integrosys.cms.app.chktemplate.bus.OBDocumentHeld,
				 com.integrosys.cms.ui.checklist.CheckListUtil,
				 com.integrosys.cms.app.collateral.bus.ICollateral,
				 java.io.StringWriter,
				 java.util.HashMap,
				 java.util.ArrayList,
				 java.util.Locale,
				 java.util.Iterator,
				 java.util.List,
				 java.util.Properties,
				 java.util.Date,
				 com.integrosys.cms.ui.common.UIUtil,
				 org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext"
%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeldItem" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header:
     * @author $Author: jzhai $<br>
     * @version $Revision: 1.7 $
     * @since $Date: 2006/08/16 02:03:43 $
     * Tag: $Name:  $
     */
 %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    try {
        String fileName = "";

        ArrayList preReminderL = new ArrayList();
        ArrayList postReminderL = new ArrayList();
        ICMSCustomer customer = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
        Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
       // ctx.put("customerLeID", customer.getCMSLegalEntity().getLEReference());
       // ctx.put("customerName", customer.getCustomerName());
        // temp
        
    //   HashMap[] preReminderMap = (HashMap[]) request.getAttribute("preReminderMap");
    //  HashMap[] postReminderMap = (HashMap[]) request.getAttribute("postReminderMap");
    
    	HashMap[] preReminderMap = (HashMap[])session.getAttribute("com.integrosys.cms.ui.checklist.document.DocumentCheckListAction.preReminderMap");
		HashMap[] postReminderMap = (HashMap[])session.getAttribute("com.integrosys.cms.ui.checklist.document.DocumentCheckListAction.postReminderMap");
		int row = Integer.parseInt(request.getParameter("row"));
		String name = "";
		String address = "";
		String bankAddress = "EON Bank Berhad Credit Administration Centre";
        int index = row - ((preReminderMap == null) ? 0 : preReminderMap.length);
		
        if(index>0){
			for(int i=0;i<postReminderMap.length;i++){
				if(i==(index-1)){
					fileName = "lawyerPost.rtf";
				 	name = ((String)postReminderMap[i].get("SOLICITOR_NAME")==null?"":(String)postReminderMap[i].get("SOLICITOR_NAME"));
			     	address = ((String)postReminderMap[i].get("SOLICITOR_ADDRESS")==null?"":(String)postReminderMap[i].get("SOLICITOR_ADDRESS"));
				}
			}
		}else{
			for(int i=0;i<preReminderMap.length;i++){
				if(i==(row-1)){
					fileName = "lawyer.rtf";
					name = ((String)preReminderMap[i].get("SOLICITOR_NAME")==null?"":(String)preReminderMap[i].get("SOLICITOR_NAME"));
			     	address = ((String)preReminderMap[i].get("SOLICITOR_ADDRESS")==null?"":(String)preReminderMap[i].get("SOLICITOR_ADDRESS"));
				}
			}
		}
		
		address = (address==null?"":address);
		String[] addressAll = address.split("\\n"); 
		
		String addressFinal = "";
		if(addressAll.length!=0){
			addressFinal = addressAll[0];
		}
		for (int i = 1; i < addressAll.length; i++) {
			addressFinal = addressFinal + "\\par \\hich\\af0\\dbch\\af13\\loch\\f0" + addressAll[i];
		} 
	
        //String tempNarration = null;
        //HashMap docListMap = (HashMap) request.getAttribute("docsHeldMap");
        //int docCount = 0;

	    //ctx.put("preReminderL", preReminderL);
        //ctx.put("tempNarration",tempNarration);
        VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
        VelocityContext ctx = new VelocityContext();

        String date = DateUtil.formatDate(locale, new Date(), "dd MMM yyyy");
        ctx.put("date", date);
        ctx.put("name", name);
        ctx.put("address", addressFinal);
        ctx.put("bankAddress", bankAddress);
        StringWriter sw = new StringWriter();
        velocityEngine.getTemplate(fileName).merge(ctx, sw);

        byte cont[] = sw.toString().getBytes();
        String strMime = "application/rtf";
        // Clear out response stream
        response.reset();

        // Set the browser's mime type
        response.setContentType(strMime);

        // Ensure the browser's page to expect a file
        response.setHeader("Expires", "0");
        response.addHeader("Content-disposition", "attachment; filename=" + fileName);
        response.getOutputStream().write(cont);
        response.flushBuffer();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error has occurred while exporting the report.<BR>" + e.toString());
    }
%> 
