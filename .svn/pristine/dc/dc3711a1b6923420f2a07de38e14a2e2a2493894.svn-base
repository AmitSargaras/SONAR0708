<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.liquidation.trx.OBLiquidationTrxValue,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Comparator,
				 java.util.Arrays"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationForm"%>
<%@ page import="java.util.Collection"%>
<%@ page import="com.integrosys.cms.ui.liquidation.LiquidationAction"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBLiquidation"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecovery"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.integrosys.cms.app.liquidation.bus.OBRecoveryIncome" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@include file="include_js_function.jsp"%>
<%@include file="include_isChecker.jsp"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/liquidation/interest_rate_maker_list.jsp,v 1 2007/02/09 Lini Exp $
*
* Describe this JSP.
* Purpose: For Maker and checker Add view the Income
*
* @author $Author: lini$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/09 $
* Tag: $Name$
*/
%>

<%
    String event = request.getParameter("event");
    String action = "";
    if (LiquidationAction.EV_VIEW_RECOVERY.equals(event))
        action = "label.view";
    else
        action = "label.add.new";

    Object obj = session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.LiquidationTrxValue");
    LiquidationForm aForm = (LiquidationForm) request.getAttribute("LiquidationForm");
    String recoveryType = CommonDataSingleton.getCodeCategoryValueByLabel(ICMSConstant.CATEGORY_LIQ_RECOVERY_TYPE,aForm.getRecoveryType());

    OBLiquidationTrxValue obTrxValue = null;
    Collection incomeList = null ;
    Collection stgIncomeList = null ;
    Collection actualIncomeList = null;
    OBRecoveryIncome[] stgIncomeArray = null;
    OBRecoveryIncome[] actualIncomeArray = null;    
    Collection recovery = null ;
    boolean isProcess = false;
    //todo.. new event for checker process so that highlighting can be shown
    if (isSACChecker /*&& LiquidationAction.EV_CHKR_EDIT_LIQ.equals(event)*/){
        isProcess = true;
    }
    OBLiquidation stgLiq = null;
    OBLiquidation liquidation = (OBLiquidation)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.InitialLiquidation");

    boolean isToTrack = false;
    String toTrack = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isToTrack");
    if (toTrack != null && toTrack.equalsIgnoreCase("Yes")) {
    	isToTrack = true;
    	isProcess = false;
    } 
    DefaultLogger.debug(this,  "isToTrack = " + isToTrack );  
    
    boolean isMakerCloseLiq = false;
    String makerCloseLiq = (String)session.getAttribute("com.integrosys.cms.ui.liquidation.LiquidationAction.isMakerCloseLiq");
    if (makerCloseLiq != null && makerCloseLiq.equalsIgnoreCase("Yes")) {
    	isMakerCloseLiq = true;
    }   
    DefaultLogger.debug(this,  "isMakerCloseLiq = " + isMakerCloseLiq );  
    
    String strIndex = request.getParameter("index");
    
    OBRecovery obRecovery = null;
    OBRecovery obStageRecovery = null;

    if (isProcess){
    	obRecovery = (OBRecovery)request.getAttribute("actualRecovery");
    	obStageRecovery = (OBRecovery)request.getAttribute("stageRecovery");
    	
    	if (obStageRecovery != null) {
			stgIncomeList = obStageRecovery.getRecoveryIncome();
			stgIncomeArray = (OBRecoveryIncome[])stgIncomeList.toArray(new OBRecoveryIncome[0]);
			incomeList = stgIncomeList;
    	}
    	
    	if (obRecovery != null) {
    		actualIncomeList = obRecovery.getRecoveryIncome();
    		actualIncomeArray = (OBRecoveryIncome[])actualIncomeList.toArray(new OBRecoveryIncome[0]);
    		
    		// stage has no incomeList, it is a deleted recovery
    		if (incomeList == null)
    			incomeList = actualIncomeList;
    	}
    }
    
    int index = 0;
    try{index=Integer.parseInt(strIndex);}catch(Exception e){}
	
    if (liquidation != null && !(isProcess || isToTrack || isMakerCloseLiq)){
        recovery = liquidation.getRecovery();
        for(  Iterator itr= recovery.iterator(); itr.hasNext(); ) {
            obRecovery = (OBRecovery)itr.next();
            if (obRecovery.getRecoveryType().equalsIgnoreCase(recoveryType))
                incomeList = obRecovery.getRecoveryIncome();
        }
    }
	
    if( obj!=null ) {
        if (isToTrack || isMakerCloseLiq){
        	obTrxValue = (OBLiquidationTrxValue) obj;
			stgLiq = (OBLiquidation)obTrxValue.getStagingLiquidation();
			if (stgLiq.getRecovery() != null){
				for( Iterator itrRec = stgLiq.getRecovery().iterator(); itrRec.hasNext(); ) {
					obStageRecovery = (OBRecovery)itrRec.next();
					if (obStageRecovery.getRecoveryType().equalsIgnoreCase(recoveryType)) {
						stgIncomeList = obStageRecovery.getRecoveryIncome();
						stgIncomeArray = (OBRecoveryIncome[])stgIncomeList.toArray(new OBRecoveryIncome[0]);
						break;
					}
				}
				incomeList = stgIncomeList;
			}
        }
    }
    
    if( incomeList!=null ) {
        pageContext.setAttribute("income",incomeList);
    }
    
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function callSubmit(selObj,ind) {
    temp = selObj.options[selObj.selectedIndex].value;
    if(temp=="") {
        return false;
    }else{
        document.forms[0].event.value = selObj.options[selObj.selectedIndex].value;
		document.forms[0].oindex.value = ind;
        document.forms[0].actionTypeName.value = selObj.options[selObj.selectedIndex].value;
		document.forms[0].submit();
    }
}
    function callSubmit1(eventValue,ind) {
        document.forms[0].event.value = eventValue;
		document.forms[0].oindex.value = ind;
        document.forms[0].actionTypeName.value = eventValue;
		document.forms[0].submit();
	}	
	
function gotoListing() {
<%if (isSACChecker && !isToTrack){%>
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_CHKR_EDIT_LIQ%>";
<%}else{%>
   <% if (isToTrack) { %>
    	document.forms[0].action = "Liquidation.do?event=to_track";
    <%}else if (isMakerCloseLiq) {%>
    	document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_CLOSE_LIQ%>";       	
    <%}else{%>
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EVENT_LIST%>";
    <%}%>
<%}%>
    document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action = "Liquidation.do?event=<%=LiquidationAction.EV_MKR_CLOSE_LIQ_CONFIRM%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="Liquidation.do">
<html:hidden property="event" value=""/>
<input type="hidden" name="removeIndex"/>
<input type="hidden" name="index" value="<%=index%>"/>
<input type="hidden" name="oindex"/>
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
          <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.liquidation.npl.recovery.details"/>&nbsp;-&nbsp;<bean:message key="<%=action%>"/></h3></td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(obRecovery,obStageRecovery,"recoveryType")?"fieldname":"fieldnamediff"):"fieldname"%>">
          	<bean:message key="label.liquidation.npl.recovery.type"/>
          </td>
          <td width="30%">
              <bean:write name="LiquidationForm" property="recoveryType"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.liquidation.npl.total.amount.recovered"/> </td>
          <td><bean:write name="LiquidationForm" property="totalAmtRecoveredCurrency"/>
              <bean:write name="LiquidationForm" property="totalAmtRecovered"/>&nbsp;</td>
        </tr>
         <tr class="odd">
          <td class="<%=isProcess?(CompareOBUtil.compOB(obRecovery,obStageRecovery,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
          	<bean:message key="label.remarks"/> 
          </td>
          <td><bean:write name="LiquidationForm" property="recoveryRemarks"/>&nbsp;</td>
        </tr>

        </tbody>
      </table>    </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td align="right" valign="bottom">&nbsp;</td>
    </tr>

  <tr>
      <td colspan="2"><table class="tblFormSection" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:30px">
        <thead>
          <tr>
            <td width="76%"><h3><bean:message key="label.liquidation.npl.recovery.income.details"/></h3></td>
            <% if (isSACMaker && !isToTrack && !isMakerCloseLiq){%>
            <td width="24%" align="right" valign="bottom"><input type="button" value='<bean:message key="label.add.new"/>' class="btnNormal" onclick="addIncome()"/>
              <input type="button" onclick="removeIncome()" value='<bean:message key="label.remove"/>' class="btnNormal"/>
            </td>
            <%}%>
          </tr>
          <tr>
            <td colspan="2"><hr/></td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="2"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                  <tr class="even">
                    <td class="fieldname" width="1%" >S/N</td>
                    <td class="fieldname" width="19%"><bean:message key="label.liquidation.npl.recovery.date"/></td>
                    <td class="fieldname" width="20%"><bean:message key="label.liquidation.npl.amount.recovered"/></td>
                    <td class="fieldname" width="20%"><bean:message key="label.global.action"/></td>
                    <% if (isSACMaker && !isToTrack && !isMakerCloseLiq){%>
                    <td class="fieldname" width="13%"><bean:message key="label.global.delete"/></td>
                    <%}%>
                  </tr>
                </thead>
                <tbody>

                <%int rowIdx = 0;
                if (isProcess) {
                	if (stgIncomeArray != null || actualIncomeArray != null) {
	                	List res = CompareOBUtil.compOBArray(stgIncomeArray, actualIncomeArray);
	                	CompareResult[] resultList = (CompareResult[])res.toArray(new CompareResult[0]);
	                	
	                    Arrays.sort(resultList, new Comparator() {
	                        public int compare(Object o1, Object o2) {
	                            long long1 = ((OBRecoveryIncome)((CompareResult)o1).getObj()).getRefID();
	                            long long2 = ((OBRecoveryIncome)((CompareResult)o2).getObj()).getRefID();
	                            return (int)(long2- long1);
	                        }});
	                    
	                    incomeList = new ArrayList(Arrays.asList(resultList));
	                    pageContext.setAttribute("income",incomeList);
	                    %>
			                <logic:present name="income" >
			                  <logic:iterate id="compResult" name="income"  
			                  		type= "com.integrosys.base.techinfra.diff.CompareResult" indexId="indexId">
					   			  <%  OBRecoveryIncome obRecoveryIncome = (OBRecoveryIncome) compResult.getObj();
					   			  	  rowIdx = indexId.intValue();
			           			  %>
			                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			                      <td class="<bean:write name="compResult" property="key" />"><%=rowIdx %></td>
			                      <td><integro:date object="<%=obRecoveryIncome.getRecoveryDate()%>"/>&nbsp;</td>
			                      <td><integro:currency amount="<%=obRecoveryIncome.getTotalAmountRecovered()%>"/>&nbsp;</td>
			                      <td style="text-align:center">
			                        
			                        <select name="actionTypeName" onchange="callSubmit(this,'<%=rowIdx-1%>')">
			                          <option>Please Select</option>
			                          <option value="<%=LiquidationAction.EV_VIEW_RECOVERY_INCOME%>">View</option>
			                        </select>
			                      </td>
			                    </tr>
			                  </logic:iterate>
			                </logic:present>
	                    <%
                	}
                } else { %>
                <logic:present name="income" >
                  <logic:iterate id="obRecoveryIncome" name="income"  type= "com.integrosys.cms.app.liquidation.bus.OBRecoveryIncome">
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                      <td class="index"><%=rowIdx %></td>
                      <td><integro:date object="<%=obRecoveryIncome.getRecoveryDate()%>"/>&nbsp;</td>
                      <td><integro:currency amount="<%=obRecoveryIncome.getTotalAmountRecovered()%>"/>&nbsp;</td>
                      <td style="text-align:center">
                        <a href="javascript:callSubmit1('<%=LiquidationAction.EV_VIEW_RECOVERY_INCOME%>','<%=rowIdx-1%>');">View</a>
                      	<input type="hidden" name="actionTypeName" value="" />
                      	<%--
                      	 <select name="actionTypeName" onchange="callSubmit(this,'<%=rowIdx-1%>')">
                          <option>Please Select</option>
                          <option value="<%=LiquidationAction.EV_VIEW_RECOVERY_INCOME%>">View</option>
                            <% if (isSACMaker && !isToTrack && !isMakerCloseLiq){%>
                          <option value="<%=LiquidationAction.EV_PREPARE_EDIT_RECOVERY_INCOME%>">Edit</option>
                            <%}%>
                        </select>
                        --%>
                      </td>
                        <% if (isSACMaker && !isToTrack && !isMakerCloseLiq){%>
                        <td style="text-align:center"><input type="checkbox" name="check2" value='<%=rowIdx-1%>'/></td>
                        <%}%>
                    </tr>
                  </logic:iterate>
                </logic:present>
                <% } %>
                <% if (incomeList == null || incomeList.size() == 0) {%>
                  <tr class="odd">
                    <% if (isSACMaker){%>
                    <td colspan="6"><bean:message key="label.no.records.found"/></td>
                    <%}else{%>
                    <td colspan="5"><bean:message key="label.no.records.found"/></td>
                    <%}%>
                  </tr>
                <%}%>

                  <tr class="even">
                    <td class="total">&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <td class="total">&nbsp;</td>
                    <% if (isSACMaker && !isToTrack && !isMakerCloseLiq){%>
                    <td class="total">&nbsp;</td>
                    <%}%>
                  </tr>
                </tbody>
              </table>
					</td>
                  </tr>
                </tbody>
            </table></td>
          </tr>
        </tbody>
      </table>
      </td>
    </tr>

      </tbody>
    </table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
      <td> <a href="javascript:gotoListing();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" border="0" id="Image2" /></a></td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>

