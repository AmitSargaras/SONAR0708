
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="org.apache.struts.action.ActionMessages"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.app.limit.trx.IFacilityTrxValue" %>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.app.limit.bus.*" %>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="java.util.*" %>
<%@ page import="com.integrosys.cms.host.stp.common.IStpConstants" %>

<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function sbmForm(nextTab) {
		document.forms[0].event.value = "<%=FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER%>";
		document.forms[0].nextTab.value = nextTab;
		document.forms[0].submit();
	}
	function approve() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_APPROVE%>";
		document.forms[0].submit();
	}
	function reject() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_REJECT%>";
		document.forms[0].submit();
	}
	function closeTrx() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_CLOSE%>";
		document.forms[0].submit();
	}
</script>
</head>
<%
	String event = request.getParameter("event");
	String tabState = (String) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.tabState");
	Map errorMap = (Map) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.errorMap");
	String currentTab = (String) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.currentTab");
    String facilityTrxToState = (String) session
            .getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.trxToState");
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	
	String applicationLawType = limitProfile.getApplicationLawType() == null ? ICMSConstant.AA_LAW_TYPE_CONVENTIONAL : limitProfile.getApplicationLawType() ;
    String allowInsurance = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.allowInsurance");
    String islamicStpMsgType = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.islamicStpMsgType");
    String applicationType = limitProfile.getApplicationType();
    
    String styleTabFacilityMaster = "tabNormal";
	String styleTabBNMCodes = "tabNormal";
	String styleTabOfficer = "tabNormal";
	String styleTabRelationship = "tabNormal";
	String styleTabInsurance = "tabNormal";
	String styleTabFacIslamicMaster = "tabNormal";
	String styleTabFacIslamicBBa = "tabNormal";
	String styleTabMultiTierFin = "tabNormal";
	String styleTabFacMessage = "tabNormal";
	String styleTabFacIslamicRental = "tabNormal";
	String styleTabFacSecDeposit = "tabNormal";
	String styleTabFacIncremental = "tabNormal";
	String styleTabFacReduction = "tabNormal";
	
	if (currentTab != null) {
		if (FacilityMainAction.TAB_MASTER.equals(currentTab)
				|| FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab)) {
			styleTabFacilityMaster = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_BNM_CODES_CHECKER.equals(currentTab)) {
			styleTabBNMCodes = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_OFFICER.equals(currentTab)
				|| FacilityMainAction.TAB_OFFICER_CHECKER.equals(currentTab)) {
			styleTabOfficer = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_RELATIONSHIP.equals(currentTab)
				|| FacilityMainAction.TAB_RELATIONSHIP_CHECKER.equals(currentTab)) {
			styleTabRelationship = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_INSURANCE_CHECKER.equals(currentTab)) {
			styleTabInsurance = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_MASTER_CHECKER.equals(currentTab)) {
			styleTabFacIslamicMaster = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_BBA_VARI_PACKAGE_CHECKER.equals(currentTab)) {
			styleTabFacIslamicBBa = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_MULTI_TIER_FINANCING_CHECKER.equals(currentTab)) {
			styleTabMultiTierFin = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_RENTAL_RENEWAL_CHECKER.equals(currentTab)) {
			styleTabFacIslamicRental = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_SECURITY_DEPOSIT_CHECKER.equals(currentTab)) {
			styleTabFacSecDeposit = "tabCurrent";	
		}
		else if (FacilityMainAction.TAB_FACILITY_INCREMENTAL_CHECKER.equals(currentTab)) {
			styleTabFacIncremental = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_FACILITY_REDUCTION_CHECKER.equals(currentTab)) {
			styleTabFacReduction = "tabCurrent";
		}	
	}
	if (errorMap != null) {
		if (((ActionMessages) errorMap.get("facilityMaster")) != null) {
			styleTabFacilityMaster = "tabError";
		}
		if (((ActionMessages) errorMap.get("bnmCodes")) != null) {
			styleTabBNMCodes = "tabError";
		}
		if (((ActionMessages) errorMap.get("officer")) != null) {
			styleTabOfficer = "tabError";
		}
		if (((ActionMessages) errorMap.get("relationship")) != null) {
			styleTabRelationship = "tabError";
		}
		if (((ActionMessages) errorMap.get("insurance")) != null) {
			styleTabInsurance = "tabError";
		}
		if (((ActionMessages) errorMap.get("islamicMaster")) != null) {
			styleTabFacIslamicMaster = "tabError";
		}
		if (((ActionMessages) errorMap.get("islamicBbaVariPackage")) != null) {
			styleTabFacIslamicBBa = "tabError";
		}
		if (((ActionMessages) errorMap.get("multiTierFinancing")) != null) {
			styleTabMultiTierFin = "tabError";
		}
		if (((ActionMessages) errorMap.get("islamicRentalRenewal")) != null) {
			styleTabFacIslamicRental = "tabError";
		}		
		if (((ActionMessages) errorMap.get("islamicSecurityDeposit")) != null) {
			styleTabFacSecDeposit = "tabError";
		}		
		if (((ActionMessages) errorMap.get("incremental")) != null) {
			styleTabFacIncremental = "tabError";
		}
		if (((ActionMessages) errorMap.get("reduction")) != null) {
			styleTabFacReduction = "tabError";
		}				
	}
	
	/*
    IFacilityTrxValue facilityTrxValue = (IFacilityTrxValue) session
            .getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityTrxValue");
    IFacilityMaster facilityMasterObj = null;
    IFacilityMaster facilityMasterActual = null;
    IFacilityOfficer[] facilityOfficers = null;
    IFacilityRelationship[] facilityRelationships = null;
    IFacilityInsurance[] facilityInsurance = null;
    IFacilityMultiTierFinancing[] facilityMultiTierFinancings = null;
    if (facilityTrxValue != null) {
        facilityMasterObj = facilityTrxValue.getStagingFacilityMaster();
        facilityMasterActual = facilityTrxValue.getFacilityMaster();
        List listActual = new ArrayList();
        listActual.addAll(facilityMasterActual.getFacilityOfficerSet());
        facilityOfficers = (IFacilityOfficer[]) listActual
							.toArray(new OBFacilityOfficer[listActual.size()]);
        listActual = new ArrayList();
        listActual.addAll(facilityMasterActual.getFacilityRelationshipSet());
        facilityRelationships = (IFacilityRelationship[]) listActual
							.toArray(new OBFacilityRelationship[listActual.size()]);
        listActual = new ArrayList();
        listActual.addAll(facilityMasterActual.getFacilityInsuranceSet());
        facilityInsurance = (IFacilityInsurance[]) listActual
							.toArray(new OBFacilityInsurance[listActual.size()]);
        listActual = new ArrayList();
        listActual.addAll(facilityMasterActual.getFacilityMultiTierFinancingSet());
        facilityMultiTierFinancings = (IFacilityMultiTierFinancing[]) listActual
							.toArray(new OBFacilityMultiTierFinancing[listActual.size()]);        
    }
    else {
        facilityMasterObj = (IFacilityMaster) session
                .getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
    }
    if (facilityMasterActual != null) {
        if (!CompareOBUtil.compOBObj(facilityMasterActual, facilityMasterObj, new String[] {"getId", "getLimit","getFacilityGeneral",
              "getFacilityFeeCharge","getFacilityBnmCodes","getFacilityInterest","getFacilityInsuranceSet","getFacilityPayment",
              "getFacilityRelationshipSet","getFacilityOfficerSet", "getFacilityMultiTierFinancingSet",
              "getFacilityMessages", "getFacilityIslamicRentalRenewal", "getFacilityIslamicSecurityDeposit", 
              "getFacilityIncrementals", "getFacilityReductions"})) {
            styleTabFacilityMaster = "tabChanged";
            if(currentTab != null && (FacilityMainAction.TAB_MASTER.equals(currentTab)
				|| FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab))){
                styleTabFacilityMaster = "tabChangedCurrent";
            }
        }else{
            if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(),null)) {
                styleTabFacilityMaster = "tabChanged";
                if(currentTab != null && (FacilityMainAction.TAB_MASTER.equals(currentTab)
                    || FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab))){
                    styleTabFacilityMaster = "tabChangedCurrent";
                }
            }else{
                if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(),null)) {
                    styleTabFacilityMaster = "tabChanged";
                    if(currentTab != null && (FacilityMainAction.TAB_MASTER.equals(currentTab)
                        || FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab))){
                        styleTabFacilityMaster = "tabChangedCurrent";
                    }
                }else{
                    if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityPayment(), facilityMasterObj.getFacilityPayment(),null)) {
                        styleTabFacilityMaster = "tabChanged";
                        if(currentTab != null && (FacilityMainAction.TAB_MASTER.equals(currentTab)
                            || FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab))){
                            styleTabFacilityMaster = "tabChangedCurrent";
                        }
                    }else{
                        if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(),null)) {
                            styleTabFacilityMaster = "tabChanged";
                            if(currentTab != null && (FacilityMainAction.TAB_MASTER.equals(currentTab)
                                || FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab))){
                                styleTabFacilityMaster = "tabChangedCurrent";
                            }
                        }else{
                            if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicMaster(), facilityMasterObj.getFacilityIslamicMaster(),null)) {
                            	styleTabFacilityMaster = "tabChanged";
                                if(currentTab != null && (FacilityMainAction.TAB_MASTER.equals(currentTab)
                                    || FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab))){
                                    styleTabFacilityMaster = "tabChangedCurrent";
                                }
                            }else{
                                if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicBbaVariPackage(), facilityMasterObj.getFacilityIslamicBbaVariPackage(),null)) {
                                	styleTabFacilityMaster = "tabChanged";
                                    if(currentTab != null && (FacilityMainAction.TAB_MASTER.equals(currentTab)
                                        || FacilityMainAction.TAB_MASTER_CHECKER.equals(currentTab))){
                                        styleTabFacilityMaster = "tabChangedCurrent";
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (facilityMasterActual.getFacilityBnmCodes() != null && !CompareOBUtil.compOBObj(facilityMasterActual.getFacilityBnmCodes(), facilityMasterObj.getFacilityBnmCodes(), new String[] {"getFacilityMasterId"})) {
            styleTabBNMCodes = "tabChanged";
            if(currentTab != null && FacilityMainAction.TAB_BNM_CODES_CHECKER.equals(currentTab)){
                styleTabBNMCodes = "tabChangedCurrent";
            }
        }
        ArrayList aList = new ArrayList();
        ArrayList bList = new ArrayList();
        List listStg = new ArrayList();
        int i;
        listStg.addAll(facilityMasterObj.getFacilityOfficerSet());
        IFacilityOfficer[] facilityOfficersStg = (IFacilityOfficer[]) listStg
							.toArray(new OBFacilityOfficer[listStg.size()]);
        for(i=0; i < facilityOfficers.length; i++){
            aList.add(facilityOfficers[i]);
        }
        for(i=0; i < facilityOfficersStg.length; i++){
            bList.add(facilityOfficersStg[i]);
        }

        Collections.sort(aList, new Comparator(){
                        public int compare(Object a1, Object b1) {
                            IFacilityOfficer facilityOfficers1 = (IFacilityOfficer)a1;
                            IFacilityOfficer facilityOfficers2 = (IFacilityOfficer)b1;
                            return facilityOfficers1.getCmsRefId().compareTo(facilityOfficers2.getCmsRefId());
                        }
                    });
        Collections.sort(bList, new Comparator(){
                        public int compare(Object a, Object b) {
                            IFacilityOfficer facilityOfficers3 = (IFacilityOfficer)a;
                            IFacilityOfficer facilityOfficers4 = (IFacilityOfficer)b;
                            return facilityOfficers3.getCmsRefId().compareTo(facilityOfficers4.getCmsRefId());
                        }
                    });
        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabOfficer = "tabChanged";
            if(currentTab != null && (FacilityMainAction.TAB_OFFICER.equals(currentTab)
				|| FacilityMainAction.TAB_OFFICER_CHECKER.equals(currentTab))){
                styleTabOfficer = "tabChangedCurrent";
            }
        }

        aList = new ArrayList();
        bList = new ArrayList();
        listStg = new ArrayList();
        listStg.addAll(facilityMasterObj.getFacilityRelationshipSet());
        IFacilityRelationship[] facilityRelationshipsStg = (IFacilityRelationship[]) listStg
							.toArray(new OBFacilityRelationship[listStg.size()]);
        for(i=0; i < facilityRelationships.length; i++){
            aList.add(facilityRelationships[i]);
        }
        for(i=0; i < facilityRelationshipsStg.length; i++){
            bList.add(facilityRelationshipsStg[i]);
        }

        Collections.sort(aList, new Comparator(){
                        public int compare(Object a1, Object b1) {
                            IFacilityRelationship facilityRelationship1 = (IFacilityRelationship)a1;
                            IFacilityRelationship facilityRelationship2 = (IFacilityRelationship)b1;
                            return facilityRelationship1.getCmsRefId().compareTo(facilityRelationship2.getCmsRefId());
                        }
                    });
        Collections.sort(bList, new Comparator(){
                        public int compare(Object a, Object b) {
                            IFacilityRelationship facilityRelationship3 = (IFacilityRelationship)a;
                            IFacilityRelationship facilityRelationship4 = (IFacilityRelationship)b;
                            return facilityRelationship3.getCmsRefId().compareTo(facilityRelationship4.getCmsRefId());
                        }
                    });
        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabRelationship = "tabChanged";
            if(currentTab != null && (FacilityMainAction.TAB_RELATIONSHIP.equals(currentTab)
				|| FacilityMainAction.TAB_RELATIONSHIP_CHECKER.equals(currentTab))){
                styleTabRelationship = "tabChangedCurrent";
            }
        }

        aList = new ArrayList();
        bList = new ArrayList();
        listStg = new ArrayList();
        listStg.addAll(facilityMasterObj.getFacilityInsuranceSet());
        IFacilityInsurance[] facilityInsuranceStg = (IFacilityInsurance[]) listStg
							.toArray(new OBFacilityInsurance[listStg.size()]);
        for(i=0; i < facilityInsurance.length; i++){
            aList.add(facilityInsurance[i]);
        }
        for(i=0; i < facilityInsuranceStg.length; i++){
            bList.add(facilityInsuranceStg[i]);
        }

        Collections.sort(aList, new Comparator(){
                        public int compare(Object a1, Object b1) {
                            IFacilityInsurance facilityInsurance1 = (IFacilityInsurance)a1;
                            IFacilityInsurance facilityInsurance2 = (IFacilityInsurance)b1;
                            return facilityInsurance1.getCmsRefId().compareTo(facilityInsurance2.getCmsRefId());
                        }
                    });
        Collections.sort(bList, new Comparator(){
                        public int compare(Object a, Object b) {
                            IFacilityInsurance facilityInsurance3 = (IFacilityInsurance)a;
                            IFacilityInsurance facilityInsurance4 = (IFacilityInsurance)b;
                            return facilityInsurance3.getCmsRefId().compareTo(facilityInsurance4.getCmsRefId());
                        }
                    });
        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabInsurance = "tabChanged";
            if(currentTab != null && FacilityMainAction.TAB_INSURANCE_CHECKER.equals(currentTab)){
                styleTabInsurance = "tabChangedCurrent";
            }
        }
        if (facilityMasterActual.getFacilityIslamicMaster()!=null&&!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicMaster(), 
        		facilityMasterObj.getFacilityIslamicMaster(), new String[] {"getFacilityMasterId"})) {
        	styleTabFacIslamicMaster = "tabChanged";
            if(currentTab != null && FacilityMainAction.TAB_ISLAMIC_MASTER_CHECKER.equals(currentTab)){
            	styleTabFacIslamicMaster = "tabChangedCurrent";
            }
        }
        if (facilityMasterActual.getFacilityIslamicBbaVariPackage()!=null&&!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicBbaVariPackage(),
        		facilityMasterObj.getFacilityIslamicBbaVariPackage(), new String[] {"getFacilityMasterId"})) {
        	styleTabFacIslamicBBa = "tabChanged";
            if(currentTab != null && FacilityMainAction.TAB_ISLAMIC_BBA_VARI_PACKAGE_CHECKER.equals(currentTab)){
            	styleTabFacIslamicBBa = "tabChangedCurrent";
            }
        }     
        aList = new ArrayList();
        bList = new ArrayList();
        listStg = new ArrayList();
        listStg.addAll(facilityMasterObj.getFacilityMultiTierFinancingSet());
        IFacilityMultiTierFinancing[] facilityMultiTierFinsStg = (IFacilityMultiTierFinancing[]) listStg
							.toArray(new OBFacilityMultiTierFinancing[listStg.size()]);
        for(i=0; i < facilityMultiTierFinancings.length; i++){
            aList.add(facilityMultiTierFinancings[i]);
        }
        for(i=0; i < facilityMultiTierFinsStg.length; i++){
            bList.add(facilityMultiTierFinsStg[i]);
        }

        Collections.sort(aList, new Comparator(){
                        public int compare(Object a1, Object b1) {
                            IFacilityMultiTierFinancing facilityMultiTierFins1 = (IFacilityMultiTierFinancing)a1;
                            IFacilityMultiTierFinancing facilityMultiTierFins2 = (IFacilityMultiTierFinancing)b1;
                            return facilityMultiTierFins1.getCmsRefId().compareTo(facilityMultiTierFins2.getCmsRefId());
                        }
                    });
        Collections.sort(bList, new Comparator(){
                        public int compare(Object a, Object b) {
                            IFacilityMultiTierFinancing facilityMultiTierFins3 = (IFacilityMultiTierFinancing)a;
                            IFacilityMultiTierFinancing facilityMultiTierFins4 = (IFacilityMultiTierFinancing)b;
                            return facilityMultiTierFins3.getCmsRefId().compareTo(facilityMultiTierFins4.getCmsRefId());
                        }
                    });
        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabMultiTierFin = "tabChanged";
            if(currentTab != null && (FacilityMainAction.TAB_MULTI_TIER_FINANCING.equals(currentTab)
				|| FacilityMainAction.TAB_MULTI_TIER_FINANCING_CHECKER.equals(currentTab))){
                styleTabMultiTierFin = "tabChangedCurrent";
            }
        }
    }
    */
%>

<body>
<table width="100%" height="100%">
	<tr>
		<td width="65%" valign="bottom">
		<table border="0" cellpadding="0px" cellspacing="0px"
			style="overflow: hidden;">
			<tr style="text-align: left">

				<td class="<%=styleTabFacilityMaster %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_MASTER_CHECKER %>');"><bean:message
					key="label.facility.master" /></a></td>
				<td class="<%=styleTabBNMCodes %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_BNM_CODES_CHECKER %>');"><bean:message
					key="label.facility.bnm.codes" /></a></td>
				<td class="<%=styleTabOfficer %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_OFFICER_CHECKER %>');"><bean:message
					key="label.facility.officer" /></a></td>
				<td class="<%=styleTabRelationship %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_RELATIONSHIP_CHECKER %>');"><bean:message
					key="label.facility.relationship" /></a></td>
                <% if (StringUtils.equals(allowInsurance, "Y")) {%>
				<td class="<%=styleTabInsurance %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_INSURANCE_CHECKER %>');"><bean:message
					key="label.facility.insurance" /></a></td>
                <% } %>
				<% if (applicationLawType.equals(ICMSConstant.AA_LAW_TYPE_ISLAM)) { %>
                    <% if (StringUtils.isNotBlank(islamicStpMsgType) && islamicStpMsgType.equals(IStpConstants.STP_ISLAMIC_LOAN_TYPE_MASTER)) { %>
                    <td class="<%=styleTabFacIslamicMaster %>"><a
                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_MASTER_CHECKER %>');"><bean:message
                        key="label.facility.islamic.master.tab" /></a></td>
                    <% } %>
                    <% if (StringUtils.isNotBlank(islamicStpMsgType) && islamicStpMsgType.equals(IStpConstants.STP_ISLAMIC_LOAN_TYPE_BBA)) { %>
                    <td class="<%=styleTabFacIslamicBBa %>"><a
                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_BBA_VARI_PACKAGE_CHECKER %>');"><bean:message
                        key="label.facility.islamic.bba.tab" /></a></td>
                        <% if (applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO) ||
                        		applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO_HP)) { %>
	                    <td class="<%=styleTabFacIslamicRental %>"><a
	                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_RENTAL_RENEWAL_CHECKER %>');"><bean:message
	                        key="label.facility.islamic.rental.renewal" /></a></td>
	                    <td class="<%=styleTabFacSecDeposit %>"><a
	                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_SECURITY_DEPOSIT_CHECKER %>');"><bean:message
	                        key="label.facility.islamic.security.deposit" /></a></td>        
                        <% } %>                           
                    <% } %>
                <% } %>
                <td class="<%=styleTabMultiTierFin %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_MULTI_TIER_FINANCING_CHECKER %>');"><bean:message
					key="label.facility.multitierfin.tab" /></a></td>
				<% if (applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO) ||
						applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO_HP)) { %>
				<%--					
                <td class="<%=styleTabFacMessage %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_MESSAGE %>');"><bean:message
					key="label.facility.message" /></a></td> --%>	
					
                <td class="<%=styleTabFacIncremental %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_INCREMENTAL_CHECKER %>');"><bean:message
					key="label.facility.incremental" /></a></td>
                <td class="<%=styleTabFacReduction %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_REDUCTION_CHECKER %>');"><bean:message
					key="label.facility.reduction" /></a></td>							
				<% } %>							
			</tr>
		</table>
		</td>
		<td width="35%">
		<table border="0" width="10%" cellpadding="0" cellspacing="0"
			align="right">
			<tr>
				<%if(FacilityMainAction.EVENT_PREPARE_CLOSE.equals(tabState)){
				%>
				<td valign="baseline" style="text-align: right"><a href="#"
					onclick="closeTrx()" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3314','','img/close2a.gif',1)"><img
					src="img/close1a.gif" name="Image3314" border="0" id="Image334" /></a></td>

				<td valign="baseline" style="text-align: right"><a
					href="ToDo.do?event=prepare&isMenu=Y"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3313','','img/cancel2.gif',1)"><img
					src="img/cancel1.gif" name="Image3313" border="0" id="Image333" /></a></td>
				<%} else{%>
				<td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" 
					onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" />
					</a></td>
				<%} %>

			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
