
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
<%@ page import="com.integrosys.cms.host.stp.common.IStpConstants" %>
<%@ page import="java.util.*" %>

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

    IFacilityTrxValue facilityTrxValue = (IFacilityTrxValue) session
            .getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityTrxValue");
    IFacilityMaster facilityMasterObj = null;
    IFacilityMaster facilityMasterActual = null;
    IFacilityOfficer[] facilityOfficers = null;
    IFacilityRelationship[] facilityRelationships = null;
    IFacilityInsurance[] facilityInsurance = null;
    IFacilityMultiTierFinancing[] facilityMultiTierFinancings = null;
    OBFacilityIncremental[] incrementalActual = null;
    OBFacilityReduction[] reductionActual = null;
    if (facilityTrxValue != null) {
        facilityMasterObj = facilityTrxValue.getStagingFacilityMaster();
        facilityMasterActual = facilityTrxValue.getFacilityMaster();
        List listActual = new ArrayList();
        if (facilityMasterActual.getFacilityOfficerSet() != null) {
	        listActual.addAll(facilityMasterActual.getFacilityOfficerSet());
	        facilityOfficers = (IFacilityOfficer[]) listActual
								.toArray(new OBFacilityOfficer[listActual.size()]);
        }
        listActual = new ArrayList();
        if (facilityMasterActual.getFacilityRelationshipSet() != null) {
	        listActual.addAll(facilityMasterActual.getFacilityRelationshipSet());
	        facilityRelationships = (IFacilityRelationship[]) listActual
								.toArray(new OBFacilityRelationship[listActual.size()]);
        }
        listActual = new ArrayList();
        if (facilityMasterActual.getFacilityInsuranceSet() != null) {
	        listActual.addAll(facilityMasterActual.getFacilityInsuranceSet());
	        facilityInsurance = (IFacilityInsurance[]) listActual
								.toArray(new OBFacilityInsurance[listActual.size()]);
        }
        listActual = new ArrayList();
        if (facilityMasterActual.getFacilityMultiTierFinancingSet() != null) {
	        listActual.addAll(facilityMasterActual.getFacilityMultiTierFinancingSet());
	        facilityMultiTierFinancings = (IFacilityMultiTierFinancing[]) listActual
								.toArray(new OBFacilityMultiTierFinancing[listActual.size()]);
        }
        
        listActual = new ArrayList();
        if (facilityMasterActual.getFacilityIncrementals() != null) {
        	listActual.addAll(facilityMasterActual.getFacilityIncrementals());
        	incrementalActual = 
        		(OBFacilityIncremental[])listActual.toArray(new OBFacilityIncremental[listActual.size()]);
        }
        
        listActual = new ArrayList();
        if (facilityMasterActual.getFacilityReductions() != null) {
        	listActual.addAll(facilityMasterActual.getFacilityReductions());
        	reductionActual = 
        		(OBFacilityReduction[])listActual.toArray(new OBFacilityReduction[listActual.size()]);
        }        
    }
    else {
        facilityMasterObj = (IFacilityMaster) session
                .getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
    }
    
    if (facilityMasterActual != null) {
    	
        if (!CompareOBUtil.compOBObj(facilityMasterActual, facilityMasterObj, new String[] {"getId", "getLimit","getFacilityGeneral",
              "getFacilityFeeCharge","getFacilityBnmCodes","getFacilityInterest","getFacilityInsuranceSet","getFacilityPayment",
              "getFacilityRelationshipSet","getFacilityOfficerSet",
              "getFacilityIslamicMaster", "getFacilityIslamicBbaVariPackage", "getFacilityMultiTierFinancingSet",
              "getFacilityMessages", "getFacilityIslamicRentalRenewal", "getFacilityIslamicSecurityDeposit", 
              "getFacilityIncrementals", "getFacilityReductions"})) {
            styleTabFacilityMaster = "tabChanged";
        }else{
        	
            if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(),null)) {
                styleTabFacilityMaster = "tabChanged";
            }else{
                if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(),null)) {
                    styleTabFacilityMaster = "tabChanged";
                }else{
                    if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityPayment(), facilityMasterObj.getFacilityPayment(),null)) {
                        styleTabFacilityMaster = "tabChanged";
                    }else{
                        if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(),null)) {
                            styleTabFacilityMaster = "tabChanged";
                        }
                    }
                }
            }
        }
        
        if (facilityMasterActual.getFacilityBnmCodes() == null && facilityMasterObj.getFacilityBnmCodes() != null) {
	        styleTabBNMCodes = "tabChanged";
        }
        else if (facilityMasterActual.getFacilityBnmCodes() != null && facilityMasterObj.getFacilityBnmCodes() == null) {
	        styleTabBNMCodes = "tabChanged";
        }
        else if (facilityMasterActual.getFacilityBnmCodes() != null &&
        		facilityMasterObj.getFacilityBnmCodes() != null) {
	        if (!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityBnmCodes(), facilityMasterObj.getFacilityBnmCodes(), new String[] {"getFacilityMasterId"})) {
	            styleTabBNMCodes = "tabChanged";
	        }
        }
        
        ArrayList aList = new ArrayList();
        ArrayList bList = new ArrayList();
        List listStg = new ArrayList();
        int i;
        if (facilityMasterObj.getFacilityOfficerSet() != null) {
        	listStg.addAll(facilityMasterObj.getFacilityOfficerSet());
        }
        IFacilityOfficer[] facilityOfficersStg = (IFacilityOfficer[]) listStg
							.toArray(new OBFacilityOfficer[listStg.size()]);
        for(i=0; i < facilityOfficers.length; i++){
            aList.add(facilityOfficers[i]);
        }
        for(i=0; i < facilityOfficersStg.length; i++){
            bList.add(facilityOfficersStg[i]);
        }
        
        aList = sortList(aList);
        bList = sortList(bList);

        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabOfficer = "tabChanged";
        }
        
        aList = new ArrayList();
        bList = new ArrayList();
        listStg = new ArrayList();
        if (facilityMasterObj.getFacilityRelationshipSet() != null) {
        	listStg.addAll(facilityMasterObj.getFacilityRelationshipSet());
        }
        IFacilityRelationship[] facilityRelationshipsStg = (IFacilityRelationship[]) listStg
							.toArray(new OBFacilityRelationship[listStg.size()]);
        for(i=0; i < facilityRelationships.length; i++){
            aList.add(facilityRelationships[i]);
        }
        for(i=0; i < facilityRelationshipsStg.length; i++){
            bList.add(facilityRelationshipsStg[i]);
        }
        aList = sortList(aList);
        bList = sortList(bList);
     
        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabRelationship = "tabChanged";
        }
        
        aList = new ArrayList();
        bList = new ArrayList();
        listStg = new ArrayList();
        if (facilityMasterObj.getFacilityInsuranceSet() != null) {
        	listStg.addAll(facilityMasterObj.getFacilityInsuranceSet());
        }
        IFacilityInsurance[] facilityInsuranceStg = (IFacilityInsurance[]) listStg
							.toArray(new OBFacilityInsurance[listStg.size()]);
        for(i=0; i < facilityInsurance.length; i++){
            aList.add(facilityInsurance[i]);
        }
        for(i=0; i < facilityInsuranceStg.length; i++){
            bList.add(facilityInsuranceStg[i]);
        }

        aList = sortList(aList);
        bList = sortList(bList);
     
        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabInsurance = "tabChanged";
        }

        // facility incremental
        aList = new ArrayList();
        bList = new ArrayList();        
		if (facilityMasterObj.getFacilityIncrementals() != null) {			
			bList.addAll(facilityMasterObj.getFacilityIncrementals());
		}
		
		aList.addAll(Arrays.asList(incrementalActual));
		aList = sortList(aList);
		bList = sortList(bList);
		
		if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(), null)) {
			styleTabFacIncremental = "tabChanged";
		}
		
		
		
		// facility reduction
        aList = new ArrayList();
        bList = new ArrayList();        
		if (facilityMasterObj.getFacilityReductions()!= null) {			
			bList.addAll(facilityMasterObj.getFacilityReductions());
		}
		
		aList.addAll(Arrays.asList(reductionActual));
		aList = sortList(aList);
		bList = sortList(bList);
		
		if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(), null)) {
			styleTabFacReduction = "tabChanged";
		}
		
		
        if (facilityMasterActual.getFacilityIslamicMaster()!=null &&
        		!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicMaster(),
        		facilityMasterObj.getFacilityIslamicMaster(), new String[] {"getFacilityMasterId"})) {
        	styleTabFacIslamicMaster = "tabChanged";
        }
        if ((facilityMasterActual.getFacilityIslamicBbaVariPackage() == null &&
        		facilityMasterObj.getFacilityIslamicBbaVariPackage() != null) ||
        		(facilityMasterActual.getFacilityIslamicBbaVariPackage()!=null &&
        		!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicBbaVariPackage(),
        		facilityMasterObj.getFacilityIslamicBbaVariPackage(), new String[] {"getFacilityMasterId"}))) {
        	styleTabFacIslamicBBa = "tabChanged";
        }    
        if ((facilityMasterActual.getFacilityIslamicRentalRenewal() == null && 
        		facilityMasterObj.getFacilityIslamicRentalRenewal() != null) ||
        		(facilityMasterActual.getFacilityIslamicRentalRenewal() != null &&
        		!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicRentalRenewal(),
        		facilityMasterObj.getFacilityIslamicRentalRenewal(), new String[] {"getFacilityMasterId"}))) {
        	styleTabFacIslamicRental = "tabChanged";
        }
        if ((facilityMasterActual.getFacilityIslamicSecurityDeposit() == null &&
        		facilityMasterObj.getFacilityIslamicSecurityDeposit() != null) ||
        		(facilityMasterActual.getFacilityIslamicSecurityDeposit() != null &&
        		!CompareOBUtil.compOBObj(facilityMasterActual.getFacilityIslamicSecurityDeposit(),
        		facilityMasterObj.getFacilityIslamicSecurityDeposit(), new String[] { "getFacilityMasterId"}))) {
        	styleTabFacSecDeposit = "tabChanged";
        }

        aList = new ArrayList();
        bList = new ArrayList();
        listStg = new ArrayList();
        if (facilityMasterObj.getFacilityMultiTierFinancingSet() != null) {
        	listStg.addAll(facilityMasterObj.getFacilityMultiTierFinancingSet());
        }
        IFacilityMultiTierFinancing[] facilityMultiTierFinsStg = (IFacilityMultiTierFinancing[]) listStg
							.toArray(new OBFacilityMultiTierFinancing[listStg.size()]);
        for(i=0; i < facilityMultiTierFinancings.length; i++){
            aList.add(facilityMultiTierFinancings[i]);
        }
        for(i=0; i < facilityMultiTierFinsStg.length; i++){
            bList.add(facilityMultiTierFinsStg[i]);
        }
        
		aList = sortList(aList);
		bList = sortList(bList);

        if (!CompareOBUtil.compOBObj(aList.toArray(), bList.toArray(),null)) {
            styleTabMultiTierFin = "tabChanged";
        }
    }
%>
<%!
	ArrayList sortList(ArrayList arr) {
	    Collections.sort(arr, new Comparator(){
	        public int compare(Object a, Object b) {
	        	Long c1 = null;
	        	Long c2 = null;
	        	
	        	if (a instanceof IFacilityRelationship) {
	        		c1 = ((IFacilityRelationship)a).getCmsRefId();
	        		c2 = ((IFacilityRelationship)b).getCmsRefId();
	        	} else if (a instanceof IFacilityMultiTierFinancing) {
	        		c1 = ((IFacilityMultiTierFinancing)a).getCmsRefId();
	        		c2 = ((IFacilityMultiTierFinancing)b).getCmsRefId();
	        	} else if (a instanceof IFacilityInsurance) {
	        		c1 = ((IFacilityInsurance)a).getCmsRefId();
	        		c2 = ((IFacilityInsurance)b).getCmsRefId();
	        	} else if (a instanceof IFacilityOfficer) {
	        		c1 = ((IFacilityOfficer)a).getCmsRefId();
	        		c2 = ((IFacilityOfficer)b).getCmsRefId();
	        	} else if (a instanceof OBFacilityIncremental) {
	        		c1 = ((OBFacilityIncremental)a).getCmsReferenceId();
	        		c2 = ((OBFacilityIncremental)b).getCmsReferenceId();
	        	} else if (a instanceof OBFacilityReduction) {
	        		c1 = ((OBFacilityReduction)a).getCmsReferenceId();
	        		c2 = ((OBFacilityReduction)b).getCmsReferenceId();	        		
	        	}
	        	
	        	if (c1 == null) return -1;
	        	if (c2 == null) return 1;
	        	
	            return c1.compareTo(c2);
	        }
	    });
	    return arr;
	}
%>
<body>
<table width="100%" height="100%">
	<tr>
		<td width="65%" valign="bottom">
		<table border="0" cellpadding="0px" cellspacing="0px"
			style="overflow: hidden;">
			<tr style="text-align: left">

				<td class="<%=styleTabFacilityMaster %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_MASTER_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.master" /></a></td>
				<td class="<%=styleTabBNMCodes %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_BNM_CODES_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.bnm.codes" /></a></td>
				<td class="<%=styleTabOfficer %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_OFFICER_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.officer" /></a></td>
				<td class="<%=styleTabRelationship %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_RELATIONSHIP_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.relationship" /></a></td>
                <% if (StringUtils.equals(allowInsurance, "Y")) {%>
				<td class="<%=styleTabInsurance %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_INSURANCE_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.insurance" /></a></td>
                <% } %>
				<% if (applicationLawType.equals(ICMSConstant.AA_LAW_TYPE_ISLAM)) { %>
                    <% if (StringUtils.isNotBlank(islamicStpMsgType) && islamicStpMsgType.equals(IStpConstants.STP_ISLAMIC_LOAN_TYPE_MASTER)) { %>
                    <td class="<%=styleTabFacIslamicMaster %>"><a
                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_MASTER_CHECKER_PROCESS %>');"><bean:message
                        key="label.facility.islamic.master.tab" /></a></td>
                    <% } %>
                    <% if (StringUtils.isNotBlank(islamicStpMsgType) && (islamicStpMsgType.equals(IStpConstants.STP_ISLAMIC_LOAN_TYPE_BBA)
                    		|| islamicStpMsgType.equals(IStpConstants.STP_ISLAMIC_LOAN_TYPE_CORPORATE))) { %>
                    <td class="<%=styleTabFacIslamicBBa %>"><a
                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_BBA_VARI_PACKAGE_CHECKER_PROCESS %>');"><bean:message
                        key="label.facility.islamic.bba.tab" /></a></td>
                        <% if (applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO) ||
                        		applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO_HP)) { %>
	                    <td class="<%=styleTabFacIslamicRental %>"><a
	                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_RENTAL_RENEWAL_CHECKER_PROCESS %>');"><bean:message
	                        key="label.facility.islamic.rental.renewal" /></a></td>
	                    <td class="<%=styleTabFacSecDeposit %>"><a
	                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_SECURITY_DEPOSIT_CHECKER_PROCESS %>');"><bean:message
	                        key="label.facility.islamic.security.deposit" /></a></td>        
                        <% } %>                          
                    <% } %>
                <% } %>
                <td class="<%=styleTabMultiTierFin %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_MULTI_TIER_FINANCING_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.multitierfin.tab" /></a></td>
				<% if (applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO) ||
						applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO_HP)) { %>
				<%--					
                <td class="<%=styleTabFacMessage %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_MESSAGE %>');"><bean:message
					key="label.facility.message" /></a></td> --%>	
					
                <td class="<%=styleTabFacIncremental %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_INCREMENTAL_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.incremental" /></a></td>
                <td class="<%=styleTabFacReduction %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_REDUCTION_CHECKER_PROCESS %>');"><bean:message
					key="label.facility.reduction" /></a></td>							
				<% } %>							
			</tr>
		</table>
		</td>
		<td width="35%">
		<table border="0" width="10%" cellpadding="0" cellspacing="0"
			align="right">
			<tr>

				<td valign="baseline" style="text-align: right"><a href="#"
					onclick="approve()" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3311','','img/approve2.gif',1)"><img
					src="img/approve1.gif" name="Image3311" border="0" id="Image331" /></a></td>
                <% 
                 //If not pending retry 
                if (!StringUtils.equals(facilityTrxToState, ICMSConstant.STATE_PENDING_RETRY)) {
                %>
                    <td valign="baseline" style="text-align: right"><a href="#"
                        onclick="reject()" onmouseout="MM_swapImgRestore()"
                        onmouseover="MM_swapImage('Image3312','','img/reject2.gif',1)"><img
                        src="img/reject1.gif" name="Image3312" border="0" id="Image332" /></a></td>
                <%
					}
				%>
				<td valign="baseline" style="text-align: right"><a
					href="ToDo.do?event=prepare&isMenu=Y"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3313','','img/cancel2.gif',1)"><img
					src="img/cancel1.gif" name="Image3313" border="0" id="Image333" /></a></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
