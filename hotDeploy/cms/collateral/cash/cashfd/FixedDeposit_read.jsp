<%@ page import="com.integrosys.cms.ui.collateral.*,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.cash.*,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.common.FrequencyList,
				 com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositForm,
				com.integrosys.cms.ui.collateral.CategoryCodeConstant,
				com.integrosys.cms.app.common.constant.ICMSConstant,
				com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.cash.subtype.cashfd.ICashFd"%>
<%@page import="java.text.SimpleDateFormat"%>

<%
 
 String from_event="";
 if(request.getParameter("from_event")!=null){
    from_event = request.getParameter("from_event");
    }
    boolean isProcess = (from_event.equals("process")||from_event.equals("close")||from_event.equals("track"));
     
    ICashDeposit stagingOB = (ICashDeposit) request.getAttribute("stageDeposit");
    
    ICashDeposit originOB = (ICashDeposit) request.getAttribute("actualDeposit");

   

    
    int rowIdx = 0;
    
    FixedDepositForm aForm = (FixedDepositForm) request.getAttribute("FixedDepositForm");
    String custname = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.custname");

    String custname1 =  (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.custname");
  //  String custname =  (String) request.getAttribute("custname");
    String cashId = (String)request.getAttribute("cashId");
   //System.out.println("cashId ======>"+ cashId);
    String prefix1 = "Cash";

   String event = request.getParameter("event");
    ICollateralTrxValue fd_itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.serviceColObj");
    ICashDeposit cashDeposits=(ICashDeposit)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.depositObj");
    ICashFd iCol = (ICashFd) fd_itrxValue.getStagingCollateral();
    ICashFd actualDeposit= (ICashFd) fd_itrxValue.getCollateral();
    
    ICashDeposit[] cashDepositsActuals= actualDeposit.getDepositInfo();
    ICashDeposit depActual=null;
    for(int i=0 ; i<cashDepositsActuals.length;i++){
    	if(cashDepositsActuals[i].getRefID()==cashDeposits.getRefID()){
    		depActual=cashDepositsActuals[i];
    	}
    }
    ILienMethod[] iActualLienMethods =null;
    if(depActual!=null){
    iActualLienMethods =originOB.getLien();
    }
    //ICashDeposit[] cashDeposits= iCol.getDepositInfo();
    
    	ILienMethod[] iLienMethods= stagingOB.getLien();
     ICashFd stage_cash_fd = (ICashFd)fd_itrxValue.getStagingCollateral();
      ICashFd actual_cash_fd = (ICashFd)fd_itrxValue.getCollateral();
    String maker_id="-",checker_id="-",maker_date="-",checker_date="-";
    ICashDeposit fd=null;
    ICashDeposit fdAtual=null;
    ICashDeposit fdAct=null;
   for(int i=0;i<stage_cash_fd.getDepositInfo().length;i++){ 
   if(String.valueOf(stage_cash_fd.getDepositInfo()[i].getCashDepositID()).equals(cashId))
       fd=stage_cash_fd.getDepositInfo()[i];
   }
   
   if(null==fd){
	    for(int i=0;i<actual_cash_fd.getDepositInfo().length;i++){ 
	   if(String.valueOf(actual_cash_fd.getDepositInfo()[i].getCashDepositID()).equals(cashId))
		   fdAct=actual_cash_fd.getDepositInfo()[i];
	   }
	   }
   else{
  // if(null==fd){
    for(int i=0;i<actual_cash_fd.getDepositInfo().length;i++){ 
   if(null != actual_cash_fd.getDepositInfo()[i] ){
    	fdAtual=actual_cash_fd.getDepositInfo()[i];
    	//System.out.println("fdAtual====>"+fdAtual);
    	//System.out.println("fd====>"+fd);
    	
    	 if(fd.getRefID()== fdAtual.getRefID())
         {
      	   fdAct = actual_cash_fd.getDepositInfo()[i];
         }
    	
   }
    }
  }
  // }
    if(null!=fdAct){
    if(null!=fdAct.getMaker_id())
    maker_id=fdAct.getMaker_id();
    
    if(null!=fdAct.getChecker_id())
    checker_id=fdAct.getChecker_id();
    
    if(null!=fdAct.getMaker_date())
    maker_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(fdAct.getMaker_date());
    
    if(null!=fdAct.getChecker_date())
    checker_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(fdAct.getChecker_date());
    }
    ILienMethod[] stageLien = null;
    ILienMethod[] actualLien = null;
    if(null != fd)
    {
 stageLien = (ILienMethod[])fd.getLien();
    }
    	if(null != fdAct){
  actualLien = (ILienMethod[])fdAct.getLien();}
%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
<head>   
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
      
    <script type="text/javascript">
     function submitPage1(num,id,name,ind,srl,rem,baselSerial,facilityName,facilityId,lcnNo) {        
       //  alert('hi111');
           // enableAllFormElements('');
          var find = '&appos;';
           var re = new RegExp(find, 'g');           
           var rem = rem.replace(re, "\'");
           var rem = escape(rem);
            var type = document.getElementById("actionType"+ind).value;
     // alert('type'+type);
	  if(type =="View"){
	// alert('type'+type);
		document.forms[0].action = "FixedDeposit.do?lienNo="+id+"&lienAmount="+name+"&index="+ind+"&event=view_lien"+"&serialNo="+srl+"&remark="+rem+"&baselSerial="+baselSerial+"&facilityName="+facilityName+"&facilityId="+facilityId+"&lcnNo="+lcnNo;		
    	 //alert(document.forms[0].action);
    	//document.forms[0].event.value = "view_lien";
    	// alert(document.forms[0].event.value);
    	document.forms[0].submit();
	}	 
	}	
     function exchangeRateINRCal() {
    	 
    		var user_date = document.forms[0].depMatDate.value;
    		//alert("user_date"+user_date);
    		var today_date = document.forms[0].issueDate.value;
    		//alert("today_date"+today_date);
    		  if((isNaN(user_date))&&(isNaN(today_date)))
    		  {
    			 
    			  var udate_month = user_date.substring(3,6);
    			  var tdate_month = today_date.substring(3,6);
    			 switch(udate_month)
    			 {
    			 case 'Jan':
    				 udate_month='00';
    	             break;
    			 case 'Feb':
    				 udate_month='01';
    				 break;
    			 case 'Mar':
    				 udate_month='02';
    				 break;
    			 case 'Apr':
    				 udate_month='03';
    				 break;
    			 case 'May':
    				 udate_month='04';
    				 break;
    			 case 'Jun':
    				 udate_month='05';
    				 break;
    			 case 'Jul':
    				 udate_month='06';
    				 break;
    			 case 'Aug':
    				 udate_month='07';
    				 break;
    			 case 'Sep':
    				 udate_month='08';
    				 break;
    			 case 'Oct':
    				 udate_month='09';
    				 break;
    			 case 'Nov':
    				 udate_month='10';
    				 break;
    			 case 'Dec':
    				 udate_month='11';
    				 break;
    				
    				
    				 }
    			
    			  var toDate = new Date(user_date.substring(7,11),
    					  udate_month,
    					  user_date.substring(0,2));
    			 //alert("fromDate"+toDate);

    			  switch(tdate_month)
    				 {
    				 case 'Jan':
    					 tdate_month='00';
    		             break;
    				 case 'Feb':
    					 tdate_month='01';
    					 break;
    				 case 'Mar':
    					 tdate_month='02';
    					 break;
    				 case 'Apr':
    					 tdate_month='03';
    					 break;
    				 case 'May':
    					 tdate_month='04';
    					 break;
    				 case 'Jun':
    					 tdate_month='05';
    					 break;
    				 case 'Jul':
    					 tdate_month='06';
    					 break;
    				 case 'Aug':
    					 tdate_month='07';
    					 break;
    				 case 'Sep':
    					 tdate_month='08';
    					 break;
    				 case 'Oct':
    					 tdate_month='09';
    					 break;
    				 case 'Nov':
    					 tdate_month='10';
    					 break;
    				 case 'Dec':
    					 tdate_month='11';
    					 break;
    					
    					
    					 }
    			  var fromDate   = new Date(today_date.substring(7,11),
    					  tdate_month,
    					  today_date.substring(0,2));
    			  
    			 // alert("toDate"+fromDate);
    			  if(fromDate <= toDate)
    			  {
    		//	var ts =  timeSpan(fromDate, toDate,  "years,months,days");
    		//	document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
    				  var difference_ms = Math.abs(toDate - fromDate);    				   

    				  document.getElementById('valExchangeRateINRCal').innerHTML = (Math.round(difference_ms/(1000 * 60 * 60 * 24))+1) + " Days";
    	             

  		    			  }
    			  else{
    				  document.getElementById('valExchangeRateINRCal').innerHTML = "-";
    				  }
    		 
    		
    		
    		  }
    		  else
    		  {
    		  document.getElementById('valExchangeRateINRCal').innerHTML = "-";
    		  }
    		
    		}

    	        function timeSpan(fromDate, toDate, format){
    				if(format==null) format="milliseconds";	
    				var formatsMS = {
    					milliseconds:1,
    					seconds:1000,
    					minutes:1000*60,
    					hours:1000*60*60,
    					days:1000*60*60*24,
    					weeks:1000*60*60*24*7,
    					months:function(m){
    						var ms = this.days,
    						daysPer = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
    						return ms*daysPer[m];
    					},
    					years:function(y){
    						var ms = 1000*60*60*24*365;
    						//add a day for leap years
    						if( (y % 4 == 0 && y % 100 == 0) || y % 400 == 0 )
    							ms += this.days;
    						return ms;
    					}
    				},
    				//get the time difference in milliseconds
    				ms = toDate.getTime()-fromDate.getTime(),
    				reqFormats = format.split(","),
    				isYearReq = (format.indexOf("years")>-1),
    				isMonthReq = (format.indexOf("months")>-1),
    				result = {};
    				
    				if(isYearReq){ 
    					result["years"]=0;
    					for(var y=fromDate.getFullYear(); y <= toDate.getFullYear(); y++){	
    						var yearMS = formatsMS.years(y);
    						if(ms > yearMS){
    							ms -= yearMS;
    							result["years"]+=1;
    						}
    					}
    					//use "to" year for calculating decimal
    					formatsMS.years = formatsMS.years(toDate.getFullYear());
    				}
    				if(isMonthReq){
    					result["months"]=0;
    					var month = fromDate.getMonth(),
    						year = (result["years"]>0) ? fromDate.getFullYear() + result["years"] : fromDate.getFullYear();					
    					for(month; month<=11; month++){
    						var monthMS = formatsMS.months(month);
    						if(month==toDate.getMonth() && year== toDate.getFullYear()) break;
    						else if(ms > monthMS){
    							ms -= monthMS;
    							result["months"]+=1;
    						}
    						if(month==12 && year < toDate.getFullYear()) {
    							month=0; 
    							year++;
    						}
    					}
    					//use "to" month for decimal
    					formatsMS.months = formatsMS.months(toDate.getMonth());
    				}

    				//handle the remaining milliseconds
    				for(var f=0; f < reqFormats.length && reqFormats[0]!=""; f++){
    					var res=(f<reqFormats.length-1) ? Math.floor(ms/formatsMS[reqFormats[f]]) : ms/formatsMS[reqFormats[f]];
    					if(ms>0) result[reqFormats[f]] = (result[reqFormats[f]]>=0) ? result[reqFormats[f]]+=res : res;
    					else result[reqFormats[f]]=0;

    					ms -= res * formatsMS[reqFormats[f]];
    				}
    				return result;
    			} 
    </script>
</head>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<html:form action="FixedDeposit.do">
<%--<html:hidden property="event"/>
--%><input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>"/>
<input type="hidden" name="cashId" value="<%=request.getParameter("cashId")%>"/>
<table class="tblFormSection" width="60%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.security.deposit.info.view"/></h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" style="table-layout: fixed;">
                    <tbody>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "ownBank")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.own.bank.other.issuer"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
		                    <td width="30%"><%if (ICMSConstant.TRUE_VALUE.equals(aForm.getOwnBank())) {%> 
		                    	<bean:message key="label.cash.own"/>
							<% } else { %> <bean:message key="label.cash.other.issuer"/> <%} %>
							&nbsp;</td>
                        </tr>
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "depositorName")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.depositor.name"/></td>
		                    <td width="30%" style="word-wrap: break-word;"><%if(aForm.getDepositorName() != null){ %>
		                    <%=aForm.getDepositorName()%>
		                    <%}else{%>
		                    	<%=custname%>
		                    	
		                   <% } %>&nbsp;</td>
                        </tr>

                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "depositRefNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.number"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
		                    <td width="30%"><%=aForm.getDepositRefNo()%>&nbsp;</td>
                        </tr>
                        <%--

                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "depositReceiptNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.reference.no"/></td>
                            <td width="30%"><bean:write name="FixedDepositForm" property="depositReceiptNo"/>&nbsp; </td>
                        </tr>

                        --%>
                        <% ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.serviceColObj");
                            String subtype = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();
                            boolean isDiffCurr = false;
                            if (subtype.equals(ICMSConstant.COLTYPE_CASH_DIFFCCY))
                                isDiffCurr = true;

                        %>
                        <%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <% if (isDiffCurr) { %>
	                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB, originOB,  "depositCcyCode")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                                <bean:message key="label.cash.deposit.currency"/>&nbsp;<span class="mandatoryPerfection">*</span><bean:message key="label.mandatory"/></td>
								<td>
                            <% } else { %>
	                            <td class="fieldname">
	                                 <bean:message key="label.cash.deposit.currency"/>&nbsp;<span class="mandatoryPerfection">*</span><bean:message key="label.mandatory"/></td>
								<td>
                            <% } %>
                                <bean:write name="FixedDepositForm" property="depCurr"/>&nbsp;</td>
                        </tr>
                        --%><% Amount oldDepAmt = null;
                            Amount newDepAmt = null;
                            if (stagingOB != null)
                                newDepAmt = stagingOB.getDepositAmount();
                            if (originOB != null)
                                oldDepAmt = originOB.getDepositAmount();
                        %>
                        <% boolean unchanged = true;
                            if (isProcess) {
                                if (newDepAmt != null && oldDepAmt == null) {
                                    if (newDepAmt.getAmount() != 0) {
                                        unchanged = false;
                                    }
                                } else if (newDepAmt != null && oldDepAmt != null) {
                                    unchanged = CompareOBUtil.compOB(newDepAmt, oldDepAmt, "amount");
                                }
                            }
                        %>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.amount"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="depAmt"/>&nbsp;</td>
                        </tr>
						<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "issueDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.fixed.deposit.date"/><span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="issueDate"/>&nbsp;
                            <html:hidden name="FixedDepositForm" property="issueDate"/></td>
                            </td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "depositMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.maturity.date"/>
                                &nbsp;<span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="depMatDate"/>&nbsp;
                            <html:hidden name="FixedDepositForm" property="depMatDate"/></td>
                        </tr>
                        
                        <%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "tenure")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.tenure"/></td>
		                    <td width="30%"><bean:write name="FixedDepositForm" property="tenure"/>&nbsp;
								<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.FREQ_TYPE,aForm.getTenureUOM().trim())%>"/></td>
                        </tr>

--%><!--                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"accountTypeValue")?"fieldname":"fieldnamediff"):"fieldname"%>">
                          		<bean:message key="label.cash.deposit.account.type"/></td>
							<td><bean:write name="FixedDepositForm" property="accountTypeValue"/>&nbsp;</td>
 						</tr>
 						
                 		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "fdrRate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.fdr.rate"/></td>
                            <td><bean:write name="FixedDepositForm" property="fdrRate"/>&nbsp; </td>
                        </tr>                       -->
                       
                        
                         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname"><bean:message key="label.cash.tenure"/>&nbsp;</td>
               <td  width="30%">
               <p><b id='valExchangeRateINRCal'></b> </p>
               <script type="text/javascript">
               exchangeRateINRCal();
               </script>
               
             </td>
                        </tr>
                        
<!--                         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							<td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB,"thirdPartyBank")?"fieldname":"fieldnamediff"):"fieldname"%>">
                          		<bean:message key="label.cash.deposit.third.party.bank"/></td>
							<td><bean:write name="FixedDepositForm" property="thirdPartyBank"/>&nbsp;</td>
 						</tr>                        -->
 						 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "verificationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.verification.date"/></td>
                            <td><bean:write name="FixedDepositForm" property="verificationDate"/>&nbsp;</td>
                        </tr>
 						<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "depositeInterestRate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.interest.rate"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="depositeInterestRate"/>&nbsp;</td>
                        </tr>
                        
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.system.name"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="systemName"/>&nbsp;</td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" >
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.system.id"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="systemId"/>&nbsp;</td>
                        </tr>
                        <%--
                        Start : commented By sachin on 12 DEC 2011  - as i discuss with janki as for the new CR 
		                * we are going to change some logic like 1.remove customer id from screen,
		                * 2.remove enable/disable facility on selection of own radio button 
                         --%>
                        
                        <%--<%if (ICMSConstant.TRUE_VALUE.equals(aForm.getOwnBank())) {%> 
		                    	 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.system.name"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="systemName"/>&nbsp;</td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" >
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.system.id"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="systemId"/>&nbsp;</td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" disabled="true" >
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>" >
                                <bean:message key="label.cash.deposit.customer.name"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="customerId"/>&nbsp;</td>
                        </tr>
							<% } else { %>  
							 <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" disabled="true">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>" >
                                <bean:message key="label.cash.deposit.system.name"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="systemName"/>&nbsp;</td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" disabled="true">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.system.id"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="systemId"/>&nbsp;</td>
                        </tr>
							<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" >
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.customer.name"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="customerId"/>&nbsp;</td>
                        </tr>
                         <%} %>
                         
                         --%><%--
                        END : commented By sachin on 12 DEC 2011  - as i discuss with janki as for the new CR 
		                * we are going to change some logic like 1.remove customer id from screen,
		                * 2.remove enable/disable facility on selection of own radio button 
                         --%>
                       
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.finware.id"/>  </td>
                            <td><bean:write name="FixedDepositForm" property="finwareId"/>&nbsp;</td>
                        </tr>
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="<%=isProcess?(CompareOBUtil.compOB(stagingOB,originOB, "active")?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.active.inactive"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
		                    <td width="30%">
		                    <%if((aForm.getActive() != null) && (aForm.getActive() != "") ){ %> 
		                    <%if (aForm.getActive().equals("active")) {%> 
		                    	<bean:message key="label.cash.active"/>
							<% } else { %> <bean:message key="label.cash.inactive"/> <%} %>
							<%} %>
							&nbsp;</td>
                        </tr>
                        <%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="<%=isProcess?(unchanged?"fieldname":"fieldnamediff"):"fieldname"%>">
                                <bean:message key="label.cash.deposit.fd.lien.percentage"/>  <span class="mandatoryPerfection">*</span></td>
                            <td><bean:write name="FixedDepositForm" property="fdLinePercentage"/>&nbsp;</td>
                        </tr>
                    --%></tbody>
                </table>
            </td>
        </tr>
    </tbody>
</table>
<%if (event.equals("read")&& isProcess){ %>
<%@ include file="/collateral/cash/cashfd/list_Lien_FixedDeposit_Read_procces.jsp" %>
<%}else{ %>
<%@ include file="/collateral/cash/cashfd/list_Lien_FixedDeposit_Read.jsp" %>
<%} %>

<table width="100%" align="center" cellspacing="0" cellpadding="0"
	border="0"><tr></tr><tr></tr><tr></tr>					
	<tr>
		<td valign="top">
		<table width="98%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tbody>
				<tr id="customerdetails">
					<td>					
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
 <tr>
<td class="fieldname" width="20%">Edited By</td><td width="30%"><%= maker_id %></td>
<td class="fieldname" width="20%">Last Approved By</td><td width="30%"><%= checker_id %></td>
 </tr>
<tr>
<td class="fieldname" width="20%">Edited On</td><td width="30%"><%= maker_date %></td>
<td class="fieldname" width="20%">Last Approved On</td><td width="30%"><%= checker_date %></td>
</tr>
</table></tr></table></td></tr></tbody></table></td></tr></table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="CashDeposit.do?event=read_return&from_event=<%=from_event%>&subtype=<%=request.getParameter("subtype")%>"
                onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
        </td>

    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>
</body>

<!-- InstanceEnd -->
</html>
