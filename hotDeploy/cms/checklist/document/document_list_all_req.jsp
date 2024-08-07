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
        String fileName = "All_Req_Doc.rtf";

		VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");

        VelocityContext ctx = new VelocityContext();

        ArrayList nonBorrowerL = new ArrayList();
        ArrayList securityL = new ArrayList();
        ArrayList pledgorL = new ArrayList();
        ArrayList mainBorrowerL = new ArrayList();
        ArrayList coBorrowerL = new ArrayList();
        ICMSCustomer customer = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
        Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
        ctx.put("customerLeID", customer.getCMSLegalEntity().getLEReference());
        ctx.put("customerName", customer.getCustomerName());
        // temp
        String tempNarration = null;
        HashMap docListMap = (HashMap) request.getAttribute("docsHeldMap");
        int docCount = 0;

        if (docListMap == null || docListMap.size() == 0) {
            System.out.println("no document found"); // need to remove this line.
        }

        boolean nonBorrower = false;
        List nonBorrowerList = (List) docListMap.get(ICMSConstant.CHECKLIST_NON_BORROWER);
        if (nonBorrowerList != null && nonBorrowerList.size() > 0) {

            nonBorrower = true;

            // Non borrower
            IDocumentHeld docHeldNonBorrower = (IDocumentHeld) nonBorrowerList.get(0);
            PrintCheckListInfo nonBorrowerMap = new PrintCheckListInfo();
            if (docHeldNonBorrower.getDocHeldItems() != null && docHeldNonBorrower.getDocHeldItems().length > 0) {
                IDocumentHeldItem[] nonDocItemList = docHeldNonBorrower.getDocHeldItems();

                for (int i = 0; i < nonDocItemList.length; i++) {
                    PrintInfo info = new PrintInfo();
                    String srNo = "" + (i + 1);
                    String docDescription = nonDocItemList[i].getDocDesc();
                    String docNarration = nonDocItemList[i].getNarration();
                    docNarration = UIUtil.convertRTFWrap(docNarration);
                    info.setSrNo(srNo);
                    info.setDesc(docDescription);
                    info.setNarration(docNarration);
                    nonBorrowerMap.addBorrower(info);

                }

            }
            nonBorrowerL.add(nonBorrowerMap);
        }

        // getting main borrower
        boolean mainBorrower = false;
        List mainBorrowerList = (List) docListMap.get(ICMSConstant.CHECKLIST_MAIN_BORROWER);
        if (mainBorrowerList != null && mainBorrowerList.size() > 0) {
            mainBorrower = true;

            IDocumentHeld docHeldMainBorrower = (IDocumentHeld) mainBorrowerList.get(0);
            PrintCheckListInfo mainBorrowerMap = new PrintCheckListInfo();
            if (docHeldMainBorrower.getDocHeldItems() != null && docHeldMainBorrower.getDocHeldItems().length > 0) {
                IDocumentHeldItem[] mainDocItemList = docHeldMainBorrower.getDocHeldItems();
                for (int i = 0; i < mainDocItemList.length; i++) {
                    PrintInfo info = new PrintInfo();
                    String srNo = "" + (i + 1);
                    String docDescription = mainDocItemList[i].getDocDesc();
                    String docNarration = mainDocItemList[i].getNarration();
                    docNarration = UIUtil.convertRTFWrap(docNarration);
                    info.setSrNo(srNo);
                    info.setDesc(docDescription);
                    info.setNarration(docNarration);

                    mainBorrowerMap.addBorrower(info);

                }

            }
            mainBorrowerL.add(mainBorrowerMap);
        } else { // need to remove this else block

        }
        // Co_Borrower

        boolean coBorrower = false;
        List coBorrowerList = (List) docListMap.get(ICMSConstant.CHECKLIST_CO_BORROWER);
        if (coBorrowerList != null && coBorrowerList.size() > 0) {
            coBorrower = true;
            for (int i = 0; i < coBorrowerList.size(); i++) {
                IDocumentHeld docHeldCoBorrower = (IDocumentHeld) coBorrowerList.get(i);
                PrintCheckListInfo coBorrowerMap = new PrintCheckListInfo();
                long legalID = Long.parseLong(docHeldCoBorrower.getLegalID());
                String legalName = docHeldCoBorrower.getLegalName();
                coBorrowerMap.setCustomerName(legalName);
                coBorrowerMap.setLeID("" + legalID);

                if (docHeldCoBorrower.getDocHeldItems() != null && docHeldCoBorrower.getDocHeldItems().length > 0) {
                    IDocumentHeldItem[] coBorrowerItemList = docHeldCoBorrower.getDocHeldItems();
                    for (int j = 0; j < coBorrowerItemList.length; j++) {
                        PrintInfo info = new PrintInfo();
                        String srNo = "" + (j + 1);
                        String docDescription = coBorrowerItemList[j].getDocDesc();
                        String docNarration = coBorrowerItemList[j].getNarration();
                        docNarration = UIUtil.convertRTFWrap(docNarration);
                        info.setSrNo(srNo);
                        info.setDesc(docDescription);
                        info.setNarration(docNarration);


                        coBorrowerMap.addBorrower(info);
                    }
                }
                coBorrowerL.add(coBorrowerMap);
            }

        }

        //pledgor
        boolean pledgor = false;
        List pledgorBorrowerList = (List) docListMap.get(ICMSConstant.CHECKLIST_PLEDGER);
        if (pledgorBorrowerList != null && pledgorBorrowerList.size() > 0) {
            pledgor = true;
            for (int i = 0; i < pledgorBorrowerList.size(); i++) {
                IDocumentHeld docHeldPledgor = (IDocumentHeld) pledgorBorrowerList.get(i);
                long legalID = Long.parseLong(docHeldPledgor.getLegalID());
                PrintCheckListInfo pledgorMap = new PrintCheckListInfo();
                pledgorMap.setPledgorID(docHeldPledgor.getPledgorID() == ICMSConstant.LONG_INVALID_VALUE ? "-" : String.valueOf(docHeldPledgor.getPledgorID()));
                pledgorMap.setCustomerName(docHeldPledgor.getLegalName());
                pledgorMap.setLeID(legalID == ICMSConstant.LONG_INVALID_VALUE || legalID == 0 ? "-" : String.valueOf(legalID));
                if (docHeldPledgor.getDocHeldItems() != null && docHeldPledgor.getDocHeldItems().length > 0) {
                    IDocumentHeldItem[] pledgorItemList = docHeldPledgor.getDocHeldItems();
                    for (int j = 0; j < pledgorItemList.length; j++) {
                        PrintInfo info = new PrintInfo();
                        String srNo = "" + (j + 1);
                        String docDescription = pledgorItemList[j].getDocDesc();
                        String docNarration = pledgorItemList[j].getNarration();
                        docNarration = UIUtil.convertRTFWrap(docNarration);
                        info.setSrNo(srNo);
                        info.setDesc(docDescription);
                        info.setNarration(docNarration);
                        pledgorMap.addBorrower(info);
                    }
                }
                pledgorL.add(pledgorMap);
            }
        }

        //Security Doc
        boolean securities = false;
        List securitiesList = (List) docListMap.get(ICMSConstant.CHECKLIST_SECURITY);
        System.out.println("security doc size:" + (securitiesList == null ? -1 : securitiesList.size()));
        if (securitiesList != null && securitiesList.size() > 0) {
            securities = true;

            for (int i = 0; i < securitiesList.size(); i++) {
                IDocumentHeld docHeld = (IDocumentHeld) securitiesList.get(i);
                ICollateral collateral = ((OBDocumentHeld) docHeld).getCollateral();
                PrintCheckListInfo securityMap = new PrintCheckListInfo();
                String legalID = String.valueOf(collateral.getSCISecurityID());
                String legalName = docHeld.getLegalName();
                securityMap.setCustomerName(customer.getCustomerName());
                securityMap.setLeID(legalID);
                securityMap.setCustomerCategory(docHeld.getSubCategory());
                if (docHeld.getDocHeldItems() != null && docHeld.getDocHeldItems().length > 0) {
                    IDocumentHeldItem[] securityItemList = docHeld.getDocHeldItems();
                    for (int j = 0; j < securityItemList.length; j++) {
                        PrintInfo info = new PrintInfo();
                        String srNo = "" + (j + 1);
                        String docDescription = securityItemList[j].getDocDesc();
                        String docNarration = securityItemList[j].getNarration();
                        docNarration = UIUtil.convertRTFWrap(docNarration);
                        info.setSrNo(srNo);
                        info.setDesc(docDescription);
                        info.setNarration(docNarration);
                        securityMap.addBorrower(info);
                    }
                }
                securityL.add(securityMap);
            }
        }

        ctx.put("nonBorrowerL", nonBorrowerL);
        ctx.put("mainBorrowerL", mainBorrowerL);
        ctx.put("coBorrowerL", coBorrowerL);
        ctx.put("pledgorL", pledgorL);
        ctx.put("securityL", securityL);
        //ctx.put("tempNarration",tempNarration);
        String date = DateUtil.formatDate(locale, new Date(), "dd MMM yyyy");
        ctx.put("date", date);
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
