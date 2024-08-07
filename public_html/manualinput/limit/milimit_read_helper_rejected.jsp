<%@ page import="java.util.Locale,
				 java.util.Collection,
		 com.integrosys.cms.ui.manualinput.limit.EventConstant,
                 com.integrosys.cms.ui.manualinput.limit.MILimitUIHelper,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.app.limit.bus.ILimit,
                 com.integrosys.cms.app.customer.bus.ICustomerSysXRef,
		 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.cms.app.limit.trx.OBLimitTrxValue,
                 com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
                 java.math.BigDecimal,
                 com.integrosys.cms.app.limit.bus.ILimitSysXRef" %>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
	HashMap collateralMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.collateralMap");
	ILimitTrxValue lmtTrxObj=(ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
	ILimit actualLimit = lmtTrxObj.getLimit();	
    ILimit stageLimit = lmtTrxObj.getStagingLimit();   
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);	
    long oneTeamMshipID = userTeam.getTeamMemberships()[0].getTeamTypeMembership().getMembershipID();
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMr = false;
    
    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
        isMr = true;
    }

    MILimitUIHelper helper = new MILimitUIHelper();
    
    String relationShipMgrName = (String) request.getAttribute("relationShipMgrName");
    Collection subPartyNameList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.subPartyNameList");
	request.setAttribute("subPartyNameList", subPartyNameList);
	LmtDetailForm lmtDetailForm = (LmtDetailForm) request.getAttribute("LmtDetailForm");
	
	 String fcunsSystem=PropertyManager.getValue("fcubs.systemName");
	 String ubslimitSystem=PropertyManager.getValue("ubs.systemName");
	 
	 System.out.println("??????????????????"+request.getAttribute("event"));
	 String sessionCriteria1 = (String) request.getAttribute("sessionCriteria");
	 request.setAttribute("sessionCriteria", sessionCriteria1);
	 System.out.println(">>>>>>>lmtlistcmd>>>>>>>>session criteria"+sessionCriteria1); 
%>


<%@page import="java.util.HashMap"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%><script language="javascript">

function updateXRef(editOrView , ind,fcunsSystem,ubslimitSystem,sessionCriteria){
	var system=document.forms[0].facilitySystem.value;
    
    if(editOrView == "view"){
        if(document.forms[0].event.value == 'process'){
    		document.forms[0].fromEvent.value = 'process';
        }else if(document.forms[0].event.value == 'custread'){
    		document.forms[0].fromEvent.value = 'custread';
        }else if('<%=request.getParameter("event") %>' == 'prepare_close'){
    		document.forms[0].fromEvent.value = 'close_read';
    	} else if('<%=request.getParameter("event") %>' == 'prepare_delete'){
    		document.forms[0].fromEvent.value = 'prepare_delete';
    	} else {
        	document.forms[0].fromEvent.value = 'read';
        }

        if(system == fcunsSystem || system == ubslimitSystem){
        document.forms[0].indexID.value = ind;
        document.forms[0].limitId.value = <%= request.getAttribute("limitId") %>;
        document.forms[0].event.value = 'view_sub_acnt_ubs_rejected';
        document.forms[0].action ="MILimit.do?sessionCriteria="+sessionCriteria;
        document.forms[0].submit();
        }else{
        document.forms[0].indexID.value = ind;
        document.forms[0].limitId.value = <%= request.getAttribute("limitId") %>;
        document.forms[0].event.value = 'view_sub_acnt';
        document.forms[0].submit();
        }
    }
}

function editLmtDetails() {

    document.forms[0].event.value = 'prepare_cust_update';
    document.forms[0].submit();
 }

function editLimit() {
    var lmtId = <%=request.getParameter("limitId")%>;
    	document.location.href = 'MILimit.do?event=prepare_update_rejected&limitId=' + lmtId;
	}

function deleteLmtSec(indexId, action, securityId, securitySubtype)  {
    if(action =='View'){
    	document.forms[0].action = "MILimit.do?securityId="+securityId +"&securitySubtype=" +securitySubtype;
    	if(document.forms[0].event.value == 'process'){
    		document.forms[0].fromEvent.value = 'process';
        } else if(document.forms[0].event.value == 'custread'){
    		document.forms[0].fromEvent.value = 'custread';
        } else if('<%=request.getParameter("event") %>' == 'prepare_close'){
    		document.forms[0].fromEvent.value = 'prepare_close';
    	} else if('<%=request.getParameter("event") %>' == 'prepare_delete'){
    		document.forms[0].fromEvent.value = 'prepare_delete';
    	}else {
        	document.forms[0].fromEvent.value = 'view_sec';
        }
        document.forms[0].event.value = 'view_security_rejected';
        document.forms[0].submit();
    }
}


function viewConvenantScreen(name)
{
	document.forms[0].action="MILimit.do?event="+name;
    document.forms[0].submit();
}

</script>
<tbody>
    <input type="hidden" name="fromEvent" />
    <input type="hidden" name="indexID" value=""/>
    <input type="hidden" name="itemType" value=""/>
    <input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
   <%--  <input type="hidden" name="event" value="<%= request.getAttribute("event")%>" /> --%>
    <html:hidden property="isCreate"/>
<bean:define id="formObj" name="LmtDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.LmtDetailForm"/>

<html:hidden property="limitProfileID" value="<%=formObj.getLimitProfileID() %>"/>
	<html:hidden property="customerID" value="<%=formObj.getCustomerID() %>"/>
	<html:hidden property="limitId" value="<%=formObj.getLimitId() %>"/>
	 <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
    <tr class="odd">
        <td class="fieldName" width="20%"><bean:message key="label.facility.id"/>&nbsp;</td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="limitRef"/>&nbsp;
            <html:hidden property="limitRef"/>
        </td>
        
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"facilityCat")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.facility.category"/><span class="mandatoryPerfection">*</span></td>
        <td width="30%">
             <html:select property="facilityCat" value="<%=formObj.getFacilityCat()%>" disabled="true">
                  <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY%>" descWithCode="false" />   
					</html:select>
            <html:hidden property="facilityCat"/>
        </td>      
    </tr>
    <tr class="even">
    	<td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"facilityName")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.facility.name"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="facilityName"/>&nbsp;
            <html:hidden property="facilityName"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"facilityType")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.facility.type"/>&nbsp;</td>
        <td width="30%">
            <integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE%>" entryCode="<%=formObj.getFacilityType() %>" display="true" descWithCode="false" />&nbsp;
            <html:hidden property="facilityType"/>
        </td> 
    </tr>
    <tr class="odd">
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"facilitySystem")?"fieldname":"fieldnamediff"%>" width="20%">System&nbsp;</td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="facilitySystem"/>&nbsp;
            <html:hidden property="facilitySystem"/>
              <html:hidden property="facilitySystemID"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"syndicateLoan")?"fieldname":"fieldnamediff"%>" width="20%"><bean:message key="label.facility.syndicateLoan"/>&nbsp;</td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="syndicateLoan"/>&nbsp;
            <html:hidden property="syndicateLoan"/>
        </td> 
          
       
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"lineNo")?"fieldname":"fieldnamediff"%>" width="20%">Line no. &nbsp;</td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="lineNo"/>&nbsp;
            <html:hidden property="lineNo"/>
        </td> 
        <td class="fieldname" width="20%">&nbsp;</td>
        <td width="30%">&nbsp;</td>
    </tr>
    <tr class="odd">        
       <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"purpose")?"fieldname":"fieldnamediff"%>" width="20%">Purpose&nbsp;</td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="purpose"/>&nbsp;
            <html:hidden property="purpose"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"isDP")?"fieldname":"fieldnamediff"%>" width="20%">Should DP be Calculated ?&nbsp;</td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="isDP"/>&nbsp;
            <html:hidden property="isDP"/>
        </td> 
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"relationShipManager")?"fieldname":"fieldnamediff"%>" width="20%">RelationShip Manager&nbsp;</td>
        <td width="30%">
            <integro:empty-if-null value="<%= relationShipMgrName %>"/>
            <html:hidden property="relationShipManager"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"isReleased")?"fieldname":"fieldnamediff"%>" width="20%">Released&nbsp;</td>
        <td width="30%">
        <%if(formObj.getIsReleased() != null && formObj.getIsReleased().equals("Y")){ %>
        	Yes
        <%}else { %>
        	No
        <%} %>
            <html:hidden property="isReleased"/>
        </td> 
    </tr>
    <tr class="even">
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"bankingArrangement")?"fieldname":"fieldnamediff"%>" width="20%">Banking Arrangement&nbsp;<span class="mandatoryPerfection">*</span></td>
        <td width="30%">
            <integro:common-code-single categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.BANKING_ARRANGEMENT %>" 
									entryCode="<%=formObj.getBankingArrangement()%>"  display="true" descWithCode="false" /> &nbsp;
            <html:hidden property="bankingArrangement"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"clauseAsPerPolicy")?"fieldname":"fieldnamediff"%>" width="20%">Clause as per Policy&nbsp;<span class="mandatoryPerfection">*</span></td>
        <td width="30%">
			<integro:common-code-single categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.CLAUSE_AS_PER_POLICY %>" 
									entryCode="<%=formObj.getClauseAsPerPolicy()%>"  display="true" descWithCode="false" /> &nbsp;
            <html:hidden property="clauseAsPerPolicy"/>
        </td> 
    </tr>
	 <tr class="even">
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"grade")?"fieldname":"fieldnamediff"%>" width="20%">Grade&nbsp;<span class="mandatoryPerfection">*</span></td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="grade"/>&nbsp;
            <html:hidden property="grade"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"isSecured")?"fieldname":"fieldnamediff"%>" width="20%">Secured&nbsp;</td>
        <td width="30%">
        <%if(formObj.getIsSecured() != null && formObj.getIsSecured().equals("Y")){ %>
        	Yes
        <%}else { %>
        	No
        <%} %>
            <html:hidden property="isSecured"/>
        </td> 
    </tr>
     <tr class="odd">
	    <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"currencyCode")?"fieldname":"fieldnamediff"%>" width="20%">Currency&nbsp;</td>
        <td width="30%">
            
            <html:select property="currencyCode" disabled="true">
               		<html:options collection="currencyList" property="value" labelProperty="label"/>
             </html:select>
            <html:hidden property="currencyCode"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"isAdhoc")?"fieldname":"fieldnamediff"%>" width="20%">Adhoc&nbsp;</td>
        <td width="30%">
            <%if(formObj.getIsAdhoc() != null && formObj.getIsAdhoc().equals("on")){ %>
        	Yes
        <%}else{ %>
        	No
         <%} %>
            <html:hidden property="isAdhoc"/>
        </td> 
	</tr>
	<tr class="even">
	    <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"isAdhocToSum")?"fieldname":"fieldnamediff"%>" width="20%">Whether adhoc limit needs to be added in Total Sanctioned amount &nbsp;</td>
        <td width="30%">
        <%if(formObj.getIsAdhocToSum() != null && formObj.getIsAdhocToSum().equals("on")){ %>
        	Yes
        <%}else{ %>
        	No
         <%} %>
            <!--<bean:write name="LmtDetailForm" property="isAdhocToSum"/>&nbsp;
            --><html:hidden property="isAdhocToSum"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"adhocLmtAmount")?"fieldname":"fieldnamediff"%>" width="20%">Adhoc Limit&nbsp;</td>
        <td width="30%">
        <integro:empty-if-null value="<%=formObj.getAdhocLmtAmount() %>"/>
            <!--<bean:write name="LmtDetailForm" property="adhocLmtAmount"/>&nbsp;
            --><html:hidden property="adhocLmtAmount"/>
        </td> 
	</tr>
</tbody>

<tbody>
<tr class="odd">
	    <td class="fieldName" width="20%">Sub Limit &nbsp;</td>
        <td width="30%">
            <bean:write name="LmtDetailForm" property="limitType"/>&nbsp;
            <html:hidden property="limitType"/>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"guarantee")?"fieldname":"fieldnamediff"%>" width="20%">Guarantee &nbsp;</td>
        <td width="30%">
        <integro:empty-if-null value="<%=formObj.getGuarantee()%>"/>
            <!--<bean:write name="LmtDetailForm" property="guarantee"/>&nbsp;
            --><html:hidden property="guarantee"/>
        </td> 
	</tr>
	
	<tr class="even">
	    <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"subPartyName")?"fieldname":"fieldnamediff"%>" width="20%">Party Name &nbsp;<span class="mandatoryPerfection">*</span></td>
        <td width="30%">
        <logic:notEmpty name="LmtDetailForm" property="guarantee" scope="request">
        <html:select property="subPartyName" value="<%=formObj.getSubPartyName() %>" disabled="true" >	
              <option value="">Please Select </option>                     
						<html:options  collection ="subPartyNameList" labelProperty ="label" property ="value" />								                   
		</html:select> 
        
        <html:hidden property="subPartyName" value="<%=formObj.getSubPartyName() %>" />
        </logic:notEmpty>
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"subFacilityName")?"fieldname":"fieldnamediff"%>" width="20%">Facility Name&nbsp;</td>
        <td width="30%">
         <logic:notEmpty name="LmtDetailForm" property="guarantee" scope="request">
        <integro:empty-if-null value="<%=formObj.getSubFacilityName()%>"/><!--
            <bean:write name="LmtDetailForm" property="subFacilityName"/>&nbsp;
            --><html:hidden property="subFacilityName"/>
	</logic:notEmpty>
        </td> 
	</tr>
</tbody>

<tbody>
<tr class="odd">

	    <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"liabilityID")?"fieldname":"fieldnamediff"%>" width="20%">Laibility ID &nbsp;<span class="mandatoryPerfection">*</span></td>
        <td width="30%">
         <logic:notEmpty name="LmtDetailForm" property="guarantee" scope="request">
        <integro:empty-if-null value="<%=formObj.getLiabilityID() %>"/><!--
            <bean:write name="LmtDetailForm" property="liabilityID"/>&nbsp;
            --><html:hidden property="liabilityID"/>
        </logic:notEmpty>
        </td> 
        <td class="fieldName" width="20%"> &nbsp;</td>
        <td width="30%">
            <html:hidden property="totalReleasedAmount"/>
        </td> 
	</tr>
	<tr class="even">
	    <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"requiredSecurityCoverage")?"fieldname":"fieldnamediff"%>" width="20%">Sanctioned Amount  &nbsp;<span class="mandatoryPerfection">*</span></td>
        <td width="30%">            
            <integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),lmtDetailForm.getRequiredSecCov())%>" />
            &nbsp;&nbsp;&nbsp;<html:errors property="requiredSecCov"/>
            <html:hidden property="requiredSecCov"/>
        </td>          
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"releasableAmount")?"fieldname":"fieldnamediff"%>" width="20%">Releasable Amount &nbsp;</td>
        <td width="30%">            
            <integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),lmtDetailForm.getReleasableAmount())%>" />
            <html:hidden property="releasableAmount"/>
        </td> 
	</tr>
</tbody>

<tbody>
<tr class="odd">
	    <td class="fieldName" width="20%">Sanctioned Amount(INR)  &nbsp;</td>
        <td  width="30%" >
        <%	
        	String amt = (String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue");
        %>
            <b><integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),amt) %>"/> &nbsp;</b>            
        </td> 
        <td class="<%=CompareOBUtil.compOB(stageLimit,actualLimit,"totalReleasedAmount")?"fieldname":"fieldnamediff"%>" width="20%"> Released</td>
        <td width="30%">
                  <integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),lmtDetailForm.getTotalReleasedAmount())%>" />
            <html:hidden property="totalReleasedAmount"/></td> 	
		</tr>	
	</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
<logic:notEmpty name="LmtDetailForm" property="showSublist" scope="request">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
 <thead>
        <tr>
            <td><h3>CAM Covenant:</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
    <input class="btnNormal" type="button" name="btnedit_view" id="btnedit_view" value="Edit/View" onclick="viewConvenantScreen('view_covenant_detail_ubs')">				
    </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3>Line Details</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead>
                        <tr>
                             <td width="2%">Serial No.</td>
                            <td width="18%">Interest Rate</td>
                            <td width="15%">Released Amount</td>
                            <td width="15%">Released Date</td>
                            <td width="16%">Utilized Amount  </td>
							<td width="16%">Undrawn Limit </td>	
							<td width="8%">Status </td>	
                            <td width="9%">Action</td> 
                        </tr>
                    </thead>
                    <tbody>
                        <logic:present name="LmtDetailForm" property="acntRefSummaryList" scope="request">
                            <bean:define id="acntrefSize" value="<%= String.valueOf(formObj.getAcntRefSummaryList().size()) %>"/>
                            <logic:notEqual name="acntrefSize" value="0">
                                <logic:iterate id="acntrefitm" indexId="acntrefind" name="LmtDetailForm" property="acntRefSummaryList" scope="request"
                                               type="java.lang.Object">
                                    <% String headerClass = "index"; 
                                        ICustomerSysXRef acntRef = null;
                                        if (acntrefitm instanceof CompareResult) {
                                            acntRef = ((ILimitSysXRef) ((CompareResult) acntrefitm).getObj()).getCustomerSysXRef();
                                            headerClass = ((CompareResult) acntrefitm).getKey();
                                        } else {
                                            acntRef = ((ILimitSysXRef) acntrefitm).getCustomerSysXRef();
                                        } 
                                        BigDecimal undrawnAmount = new BigDecimal("0");
                                        undrawnAmount = new BigDecimal(acntRef.getReleasedAmount()).subtract(new BigDecimal(acntRef.getUtilizedAmount()));
                                        
 										String serialNo="";
                                        
                                        if(null!=acntRef.getSerialNo()){
                                            serialNo=acntRef.getSerialNo();
                                        }else{
                                           	serialNo=acntRef.getHiddenSerialNo();
                                           	acntRef.setSerialNo(acntRef.getHiddenSerialNo());
                                        }
                                        
                                        String facilitySystemId=acntRef.getFacilitySystemID();
                                        String index=facilitySystemId+serialNo;
                                        %>
                                    <tr class="<%=(acntrefind.intValue() + 1)%2==0?"even":"odd"%>">
                                        <td class="<%=headerClass%>">
                                        <%if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(acntRef.getAction())   && !"N".equals(acntRef.getSendToFile())){ %>
                                         -&nbsp;
                                        <%}else{ %>
                                            <%= acntRef.getSerialNo()%>
                                            <%} %>
                                        </td>
                                        <% if(acntRef.getInterestRateType() != null) {
                                        if(acntRef.getInterestRateType().equals("fixed")) {%>
                                        <td>
                                            &nbsp;<integro:empty-if-null value="<%= acntRef.getIntRateFix() %>"/>
                                        </td>
                                        <%}else { %>
                                        <td>
                                               <% if(acntRef.getIntRateFloatingMarginFlag().equals("-")){%>
                                            &nbsp;<integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(acntRef.getIntRateFloatingRange()) - Double.parseDouble(acntRef.getIntRateFloatingMargin())) %>"/>
                                            <%}else { %>
                                            &nbsp;<integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(acntRef.getIntRateFloatingMargin()) + Double.parseDouble(acntRef.getIntRateFloatingRange()))%>"/>
                                            <%} %>
                                        </td>
                                        <%} 
                                        }%>
                                         <%if(acntRef.getInterestRateType() == null) {  %>
	                                        <td>
	                                            &nbsp;
	                                        </td>
	                                        <%}%>
                                        
                                        <td>
                                            &nbsp;<integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),acntRef.getReleasedAmount())%>"/>
                                        </td>
                                        <td>
                                            &nbsp;<integro:empty-if-null value="<%=acntRef.getReleaseDate()%>"/>
                                        </td>
                                        <td>
                                            &nbsp;<integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(acntRef.getUtilizedAmount())%>"/>
                                        </td>
                                        <td>
                                            &nbsp;<integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(undrawnAmount.toString())%>"/>
                                        </td>
                                        <td>&nbsp;<integro:empty-if-null value="<%=acntRef.getStatus()%>"/></td>
										 <td style="text-align:center"> 
                                        	<select name="select2"
												onchange="javascript:updateXRef(this.value,'<%= index %>','<%=fcunsSystem %>','<%=ubslimitSystem %>','<%=sessionCriteria1 %>')">
												<option value="">Please Select</option>
												<option value="view">View</option>
											</select>
                                       </td> 
                                    </tr>
                                </logic:iterate>
                            </logic:notEqual>
                            <logic:equal name="acntrefSize" value="0">
                                <tr class="odd">
                                    <td colspan="7">There is no line for facility.</td>
                                </tr>
                            </logic:equal>
                        </logic:present>
                        <logic:notPresent name="LmtDetailForm" property="acntRefSummaryList" scope="request">
                            <tr class="odd">
                                <td colspan="7">There is no line for facility.</td>
                            </tr>
                        </logic:notPresent>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3>Limit Security Mapping</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead>
                        <tr>
                           <td width="2%">S/N</td>
                            <td width="21%">Source Security ID</td>
                            <td width="16%">Collateral Code-Name</td>
                            <td width="16%">Security Type</td>
                            <td width="16%">Security Sub-Type</td>
                            <td width="16%">Security Coverage</td>
                            <td width="14%">Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <logic:present name="LmtDetailForm" property="lmtSecSummaryList" scope="request">
                            <bean:define id="lmtsecSize" value="<%= String.valueOf(formObj.getLmtSecSummaryList().size()) %>"/>
                            <logic:notEqual name="lmtsecSize" value="0">
                                <logic:iterate id="lmtsecitm" indexId="lmtsecind"
                                               name="LmtDetailForm" property="lmtSecSummaryList" scope="request"
                                               type="com.integrosys.cms.ui.manualinput.limit.LmtSecSummaryItem">
                                    <tr class="<bean:write name="lmtsecitm" property="rowClass" />">
                                        <td class="<bean:write name="lmtsecitm" property="headerClass" />">
                                          <%= lmtsecind.intValue() + 1 %>
                                        </td>
                                        <td>&nbsp;<bean:write name="lmtsecitm" property="sciSecurityId"/></td>
                                        <td>&nbsp;<% if(lmtsecitm!=null)%>
                                        <integro:empty-if-null value="<%=collateralMap.get(lmtsecitm.getCollateralId()) %>"/></td>
                                        <td>&nbsp;<bean:write name="lmtsecitm" property="securityType"/></td>
                                        <td>&nbsp;<bean:write name="lmtsecitm" property="securitySubType"/></td>
                                        <td>&nbsp;<bean:write name="lmtsecitm" property="lmtSecurityCoverage"/></td>
                                        <td>
                                            <select disabled="disabled" name="secOption" onchange="javascript:deleteLmtSec('<%= lmtsecind.toString() %>', this.value,'<%= lmtsecitm.getSciSecurityId() %>' ,'<%= lmtsecitm.getSecuritySubType() %>' )" >
                                            <option value="">Please Select</option>
                                            <option value="View">View</option>
                                            </select>
                                            &nbsp;
                                            <html:hidden property="deletedLmtSec" value="<%= lmtsecind.toString() %>"/>
                                        </td>
                                    </tr>
                                </logic:iterate>
                            </logic:notEqual>
                            <logic:equal name="lmtsecSize" value="0">
                                <tr class="odd">
                                    <td colspan="7">There is no limit security mapping.</td>
                                </tr>
                            </logic:equal>
                        </logic:present>
                        <logic:notPresent name="LmtDetailForm" property="lmtSecSummaryList" scope="request">
                            <tr class="odd">
                                <td colspan="7">There is no limit security mapping.</td>
                            </tr>
                        </logic:notPresent>
                    </tbody>
                </table>
            </td>
        </tr>
    </tbody>
</logic:notEmpty>
