<%@ page import="com.integrosys.cms.ui.collateral.*,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.app.collateral.bus.type.cash.*,
                 com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositAction,
                 com.integrosys.cms.ui.collateral.cash.cashfd.FixedDepositForm,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.host.stp.common.IStpConstants" %>
<%@ page import="com.integrosys.base.techinfra.util.PropertyUtil" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@page import="com.integrosys.component.login.ui.GlobalSessionConstant"%>
<%@page import="com.integrosys.component.user.app.bus.OBCommonUser"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.cash.subtype.cashfd.ICashFd"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    //Added By KLYong: Stp switch mode
    String stpMode = PropertyUtil.getInstance("/stp.properties").getProperty(IStpConstants.STP_SWITCH_MODE);
String customerM = (String)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.custname");

String custname1 =  (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.custname");
  
String custname =  (String) request.getAttribute("custname");

List system = (List)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.system");

List line = (List)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.line");


List systemIdList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.systemIdList");


List systemIdListR = (List)request.getAttribute("systemIdList");
String prefix1 = "Cash";

if(system != null)
{
	for(int l = 0; l < system.size();l++)
	{
	for(int i = l; i<system.size()-1 ; i++)
	{
		int k = i+1;
		if(system.get(l).equals(system.get(k)))
		{
			system.remove(k);
			i=i-1;
		}	
	}
	}
}
//if(systemIdList != null)
//{
//	for(int l = 0; l<systemIdList.size();l++)
//	{
		//System.out.println("systemIdList l ====>"+system.get(l));
//	for(int i = l; i<systemIdList.size()-1 ; i++)
//	{
//		int k = i+1;
//		if(systemIdList.get(l).equals(systemIdList.get(k)))
//		{
//			systemIdList.remove(k);
//			i=i-1;
//		}	
//	}
//	}
//}
//String utilizedAmunt =  (String) request.getAttribute("utilizedAmunt");
String utilizedAmunt = (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.utilizedAmunt");
DecimalFormat dft1 = new DecimalFormat("#0.000");
double d1 = Double.parseDouble(utilizedAmunt);
utilizedAmunt = dft1.format(d1);
utilizedAmunt=UIUtil.formatWithCommaAndDecimal(utilizedAmunt);
System.out.println("utilizedAmunt====>"+utilizedAmunt);
//System.out.println("systemIdList====>"+systemIdList);
pageContext.setAttribute("system",system);
//List systemId = null;
//List systemId = system;
//request.setAttribute("systemIdList",systemIdList);
pageContext.setAttribute("systemIdList",systemIdList);
//if(null != (String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.fdCount"))
//pageContext.setAttribute("fdCount",(String) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.fdCount"));
//if(null !=(String)request.getAttribute("fdCount"))
//pageContext.setAttribute("fdCount", (String)request.getAttribute("fdCount"));

String fdWebServiceFlag =  (String) request.getAttribute("fdWebServiceFlag"); //added for webservice call in case of FD
if(null==fdWebServiceFlag){
	fdWebServiceFlag =  (String) request.getParameter("fdWebServiceFlag");
}
System.out.println("fdWebServiceFlag:"+fdWebServiceFlag);

//Start:Uma Khot: Added to cpture FD details manully when fd no is other than FC.
String depositRecNoInSearch =  (String) request.getAttribute("depositRecNoInSearch");
System.out.println("depositRecNoInSearch 1:"+depositRecNoInSearch);
if(null==depositRecNoInSearch){
	depositRecNoInSearch =  (String) request.getParameter("depositRecNoInSearch");
	System.out.println("depositRecNoInSearch 2:"+depositRecNoInSearch);
	
}
//End:Uma Khot: Added to cpture FD details manully when fd no is other than FC.
%>

<%
	String context = request.getContextPath() + "/";
	

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
%>

<%@page import="java.util.ArrayList"%><html>
<head>    
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>


<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>

<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
    <script language="JavaScript" type="text/JavaScript"><!--
    
    
  function fillFD(cashDepID)
  {
	    var xmlhttp;
		if(window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		}
		else
		{// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
			  
		xmlhttp.onreadystatechange=function()
		{
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		  {
		    eval(xmlhttp.responseText);
		  }
		}
		xmlhttp.open("GET","/cms/CashFdCollateral.do?event=fill_FD&cashDepID="+cashDepID,true);
		xmlhttp.send();
    }
    
function fd_list(fdWebServiceFlag){

     var rec_no=document.getElementById('rec').value;    
     
	 var xmlhttp;
	 if (window.XMLHttpRequest)
	 {// code for IE7+, Firefox, Chrome, Opera, Safari
	  xmlhttp=new XMLHttpRequest();
	 }
	 else
  	 {// code for IE6, IE5
  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
     }
			
	 xmlhttp.onreadystatechange=function()
	 {
					  //alert("readyState: "+xmlhttp.readyState);
					  //alert("status: "+xmlhttp.status);
	 	if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	    	document.getElementById("fdDiv").innerHTML=xmlhttp.responseText;
	    }
	  }

		var ownval1 = document.forms[0].elements["ownBank"][1].checked;
		var ownval = document.forms[0].elements["ownBank"][0].checked;

if(fdWebServiceFlag == 'Y' || fdWebServiceFlag == 'y'){
	if(rec_no == ""){
		alert(" Deposit receipt Number is Mandatory for Search !");		
    }else{
		xmlhttp.open("GET","/cms/CashFdCollateral.do?event=fd_list&receipt_no="+rec_no+"&ownval="+ownval,true);
		xmlhttp.send();	
    } 
}
else{
	if(rec_no == "" || (ownval1 =="" && ownval ==""))
	{
	alert(" Deposit receipt Number with Own/Other selection is Mandatory for Search !");
	}
	else{
		xmlhttp.open("GET","/cms/CashFdCollateral.do?event=fd_list&receipt_no="+rec_no+"&ownval="+ownval,true);
					xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlhttp.send();
				
	}
	}
}
		function hideAll(idArray) {
			for (var i=0; i<idArray.length; i++) {
				elem = document.getElementById(idArray[i]);
				elem.style.display = 'none';
			}
		}
		
		function showAll(idArray) {
			for (var i=0; i<idArray.length; i++) {
				elem = document.getElementById(idArray[i]);
				elem.style.display = '';
			}
		}

        function showAccField(isFieldStatus) {
        	
        	if (isFieldStatus) {
                document.getElementById('depositorName').style.visibility = 'visible';
                document.getElementById('depositorName1').style.visibility = 'hidden';
                document.getElementById('depositorName1').innerHTML = ''; 
                document.getElementById('systemNameR').style.visibility = 'visible';
                document.getElementById('systemIdR').style.visibility = 'visible';
              //  document.getElementById('customerIdR').style.visibility = 'visible';
                
              /*  document.getElementById('systemNameR').readOnly = true;
                document.getElementById('systemIdR').readOnly = true;
              //  document.getElementById('customerIdR').readOnly = false;
                document.getElementById('systemNameR').disabled = true;
                document.getElementById('systemIdR').disabled = true;
               // document.getElementById('customerIdR').disabled = false;
               // document.getElementById('customerId').readOnly = false;

                document.getElementById('systemName').readOnly = true;
                document.getElementById('systemId').readOnly = true;
               // document.getElementById('customerId').readOnly = false;
                document.getElementById('systemName').disabled = true;
                document.getElementById('systemId').disabled = true;
               // document.getElementById('customerId').disabled = false;*/
            
                 
                <% if (!StringUtils.equals(stpMode, "false")) { %>
                    document.getElementById('retrieveFD').style.visibility = 'visible';
                    document.getElementById('depCurr').disabled = true;
                    document.getElementById('depAmt').readOnly = true;
                    document.getElementById('depMatCal').disabled = true;
                    document.getElementById('issueDateCal').disabled = true;
                    document.getElementById('verificationDateCal').disabled = true;
                    document.getElementById('tenure').readOnly = true;
                    document.getElementById('tenureUOM').disabled = true;
                <% } %>
                document.getElementById('mandDepositRefNo').style.display = '';
                document.getElementById('mandPerDepositRefNo').style.display = '';
                document.getElementById('mandPerDepositReceiptNo').style.display = '';
                document.getElementById('mandIssueDate').style.display = 'none';

            	if('<%=fdWebServiceFlag %>' =='Y' || '<%=fdWebServiceFlag %>' =='y'){
                	document.getElementById('depAmt').readOnly = true;
            		document.getElementById('depositorName').readOnly = true;
            		document.getElementById('issueDate').readOnly = true;
            		document.getElementById('issueDateCal').disabled = true;
            		document.getElementById('depMatDate').readOnly = true;
            		document.getElementById('depMatCal').disabled = true;
            		document.getElementById('depositeInterestRate').readOnly = true;
            		document.getElementById('depositRefNo').readOnly = true;
            	}
            } else {            	
               // document.getElementById('depositorName').value = '';
               document.getElementById('depositorName1').style.visibility = 'visible';
                document.getElementById('depositorName').style.visibility = 'hidden'; 
                document.getElementById('systemNameR').style.visibility = 'visible';
                document.getElementById('systemIdR').style.visibility = 'visible';
               // document.getElementById('customerIdR').style.visibility = 'visible';
               
              /*  document.getElementById('systemNameR').readOnly = false;
                document.getElementById('systemIdR').readOnly = false;
              //  document.getElementById('customerIdR').readOnly = true;
                document.getElementById('systemNameR').disabled = false;
                document.getElementById('systemIdR').disabled = false;
               // document.getElementById('customerIdR').disabled = true;

                document.getElementById('systemName').readOnly = false;
                document.getElementById('systemId').readOnly = false;
               // document.getElementById('customerId').readOnly = true;
                document.getElementById('systemName').disabled = false;
                document.getElementById('systemId').disabled = false;
               // document.getElementById('customerId').disabled = true;
                
                
             // document.getElementById('customerId').readOnly = true;*/
                var userInput = document.getElementById('custname').value;
            	document.getElementById('depositorName1').innerHTML = userInput; 
            	document.getElementById('depositorName').innerHTML = null; 
            //	document.getElementById('depositorName').innerHTML = userInput;                             
               // document.getElementById('depositorName1').innerHTML= "***";               
                <% if (!StringUtils.equals(stpMode, "false")) { %>
                    document.getElementById('retrieveFD').style.visibility = 'hidden';
                    document.getElementById('depCurr').disabled = false;
                    document.getElementById('depAmt').readOnly = false;
                    document.getElementById('depMatCal').disabled = false;
                    document.getElementById('issueDateCal').disabled = false;
                     document.getElementById('verificationDateCal').disabled = false;
                    document.getElementById('tenure').readOnly = false;
                    document.getElementById('tenureUOM').disabled = false;
                <% } %>
                //document.getElementById('mandDepositRefNo').style.display = 'none';
                document.getElementById('mandPerDepositRefNo').style.display = 'none';
              //  document.getElementById('mandPerDepositReceiptNo').style.display = 'none';
                //document.getElementById('mandIssueDate').style.display = '';
            	if('<%=fdWebServiceFlag %>' =='Y' || '<%=fdWebServiceFlag %>' =='y'){
                	document.getElementById('depAmt').readOnly = true;
            		document.getElementById('depositorName').readOnly = true;
            		document.getElementById('issueDate').readOnly = true;
            		document.getElementById('issueDateCal').disabled = true;
            		document.getElementById('depMatDate').readOnly = true;
            		document.getElementById('depMatCal').disabled = true;
            		document.getElementById('depositeInterestRate').readOnly = true;
            		document.getElementById('depositRefNo').readOnly = true;
            	}
            }
        }
        function  showAccFieldRefresh()
        {
        	//alert('hi+showAccFieldRefresh');
        	 document.forms[0].depositorName.value="";
        	 document.forms[0].depositReceiptNo.value="";
        	 document.forms[0].depositRefNo.value="";
        	 document.forms[0].depAmt.value="";
        	 document.forms[0].issueDate.value="";
        	 document.forms[0].depMatDate.value="";
        	 document.forms[0].verificationDate.value="";
        	 document.forms[0].depositeInterestRate.value="";
        	 document.forms[0].systemName.value="";
        	 document.forms[0].systemId.value="";
        	// document.forms[0].customerId.value="";
        	 document.forms[0].finwareId.value="";
        	 document.forms[0].active[0].checked=false;
        	 document.forms[0].active[1].checked=false;
        	 document.forms[0].depositReceiptNo.value="";
        	 document.getElementById('valExchangeRateINRCal').innerHTML = "-";
            }

         function submitPage(num) {
            enableAllFormElements();

            if (num == 1) {
                document.forms[0].event.value="create";
            }
            else if (num == 2) {
                document.forms[0].event.value="update";
            }
            else if (num == 3) {
                document.forms[0].event.value="ok_cancel";
                document.forms[0].custname.value="<%=custname1%>";
            }
            else if (num == 4) {
                document.forms[0].event.value="<%=FixedDepositAction.EVENT_SEARCH_FD_INFO%>";
            }
             else if (num == 5) {
                document.forms[0].event.value="<%=FixedDepositAction.EVENT_PREPARE_CREATE_LIEN%>";
            }else if (num == 6) {
                document.forms[0].event.value="<%=FixedDepositAction.EVENT_OK_RETURN%>";
            }
            document.forms[0].submit();
        }
         
         function submitPage1(num,id,name,ind,srl,rem,baselSerial,facilityName,facilityId,lcnNo) {        
           // enableAllFormElements('');
            var find = '&appos;';
           var re = new RegExp(find, 'g');           
           var rem = rem.replace(re, "\'");
           
            rem = escape(rem);
         
            var type = document.getElementById("actionType"+ind).value;
      //alert('type'+type);
	 if(type =="Edit"){
	// alert('type'+type);
		document.forms[0].action = "FixedDeposit.do?lienNo=" +id +"&lienAmount="+name+"&index="+ind+"&serialNo="+srl+"&remark="+rem+"&baselSerial="+baselSerial+"&facilityName="+facilityName+"&facilityId="+facilityId+"&lcnNo="+lcnNo;	
    	// alert(document.forms[0].action);
    	document.forms[0].event.value = "edit_lien";
    	// alert(document.forms[0].event.value);
    	document.forms[0].submit();
	}
	else if( type == "Delete"){		
	//alert('type'+type);	
	 var answer = confirm("are you sure you want to delete Lien?")
          if(answer == true)	
          {
		document.forms[0].action = "FixedDeposit.do?lienNo=" +id +"&lienAmount="+name+"&index="+ind+"&serialNo="+srl+"&remark="+rem+"&baselSerial="+baselSerial+"&facilityName="+facilityName+"&facilityId="+facilityId+"&lcnNo="+lcnNo;		
    	document.forms[0].event.value = "delete_conf_lien";
    	document.forms[0].submit();
          }
          
	}	 
            
        }
        
        function thirdPartyChange(show) {
	        var ids = new Array('mandSubmDepCurrency', 'mandSubmDepAmt', 'mandSubmMaturityDate');
	        
	        if (show == 'show') {
		        showAll(ids);
	        }
	        else {
		        hideAll(ids);
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
		  
		//  alert("toDate"+fromDate);
		  if(fromDate <= toDate)
		  {
		//var ts =  timeSpan(fromDate, toDate,  "years,months,days");
		//document.getElementById('valExchangeRateINRCal').innerHTML = ts.days +" Day "+ ts.months +" Month "+ ts.years+" Year";
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

        function selectSystem(dropdown)
        {
         var curSel = "";
         for(i=0; i<dropdown.options.length; i++)
         {
        	if (dropdown.options[i].selected == true)
        	{
        	    curSel = dropdown.options[i].value;	
        	}    	
         }
         var dep = 'systemId';
         var url = '/cms/FixedDeposit.do?event=refresh_system_id&systemName='+curSel;
         sendLoadDropdownReq(dep, url);
        }	
       
		function fillDetailForFD(cashDepID, fdWebServiceFlag){
			   var xmlhttp;
			   
			   if (window.XMLHttpRequest)
			     {// code for IE7+, Firefox, Chrome, Opera, Safari
			     xmlhttp=new XMLHttpRequest();
			     }
			   else
			     {// code for IE6, IE5
			     xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			     }
			   xmlhttp.onreadystatechange=function()
			     {
			     if (xmlhttp.readyState==4 && xmlhttp.status==200)
			       {
			       eval(xmlhttp.responseText);
			       }
			     }
			   xmlhttp.open("GET","/cms/CashFdCollateral.do?event=fill_FD&cashDepID="+cashDepID+"&fdWebServiceFlag="+fdWebServiceFlag,true);
			   xmlhttp.send();
			       		}
       function characterText(){
    	    var str=document.getElementById("rec");
    	    var regex=/[^a-z0-9\s]/gi;
    	    str.value=str.value.replace(regex ,"");
       }

       //Start:Uma Khot: Added to cpture FD details manully when fd no is other than FC.
       function makeFieldEditable(){
    	   
           var rec_no=document.getElementById('rec').value;   
        //   alert("rec_no:"+rec_no);
         //  alert("rec_no.length:"+rec_no.length);
        //   alert("depositRecNoInSearch:"+'<%=depositRecNoInSearch%>');
        if('<%=fdWebServiceFlag %>' =='Y' || '<%=fdWebServiceFlag %>' =='y'){
           if(rec_no.length != 14 && rec_no.length != 0){
             
    		document.getElementById('depAmt').readOnly = false;
    		document.getElementById('depositorName').readOnly = false;
    		document.getElementById('issueDate').readOnly = true;
    		document.getElementById('issueDateCal').disabled = false;
    		document.getElementById('depMatDate').readOnly = true;
    		document.getElementById('depMatCal').disabled = false;
    		document.getElementById('depositeInterestRate').readOnly = false;
    		document.getElementById('depositRefNo').readOnly = false;
           }else{
        	  
        		document.getElementById('depAmt').readOnly = true;
        		document.getElementById('depositorName').readOnly = true;
        		document.getElementById('issueDate').readOnly = true;
        		document.getElementById('issueDateCal').disabled = true;
        		document.getElementById('depMatDate').readOnly = true;
        		document.getElementById('depMatCal').disabled = true;
        		document.getElementById('depositeInterestRate').readOnly = true;
        		document.getElementById('depositRefNo').readOnly = true;
               
           }
          }
  		}
       //End:Uma Khot: Added to cpture FD details manully when fd no is other than FC.
        
        //insertHeader();
        //insertMenu('examples');
    //-->
    </script>
</head>
<%
    ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.serviceColObj");
    String subtype = itrxValue.getStagingCollateral().getCollateralSubType().getSubTypeCode();       
    ICashFd cash_fd = (ICashFd)itrxValue.getStagingCollateral();
    ICashFd cash_fdAtual = (ICashFd)itrxValue.getCollateral();
    String cashId="";
    int in=Integer.parseInt(request.getParameter("indexID"));
    String maker_id="-",checker_id="-",maker_date="-",checker_date="-";
    String event11=(String)request.getParameter("event");
    
     if(!event11.equals("prepare")){
    try{
    ICashDeposit fd = (ICashDeposit)cash_fd.getDepositInfo()[in];
    cashId=String.valueOf(fd.getCashDepositID());
   for(int i = 0 ; i < cash_fdAtual.getDepositInfo().length;i++ )
   {
	   ICashDeposit fdAtual = (ICashDeposit)cash_fdAtual.getDepositInfo()[i];
	   if(fd.getRefID() == fdAtual.getRefID())
	   {
		   if(null!=fdAtual.getMaker_id())
			    maker_id=fdAtual.getMaker_id();
			    
			    if(null!=fdAtual.getChecker_id())
			    checker_id=fdAtual.getChecker_id();
			    
			    if(null!=fdAtual.getMaker_date())
			    maker_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(fdAtual.getMaker_date());
			    
			    if(null!=fdAtual.getChecker_date())
			    checker_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(fdAtual.getChecker_date());
			    
	   }
	   if(fdAtual.getDepositRefNo().equals(fd.getDepositRefNo())){
	   cashId=String.valueOf(fdAtual.getCashDepositID());
	   }
   }
    
    
   
  /*  if(null!=fd.getMaker_id())
    maker_id=fd.getMaker_id();
    
    if(null!=fd.getChecker_id())
    checker_id=fd.getChecker_id();
    
    if(null!=fd.getMaker_date())
    maker_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(fd.getMaker_date());
    
    if(null!=fd.getChecker_date())
    checker_date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(fd.getChecker_date());
   */
    }catch(Exception e){}
    }
    
%>

<body>
<%@ include file="/collateral/common/mandatory_flag.jsp" %>
<%@ include file="/collateral/ssc.jsp" %>

<html:form action="FixedDeposit.do">
<html:hidden property="event"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="cashDepositID" value="<%=cashId%>"/>

<input type="hidden" name="stpMode" value="<%=stpMode%>"/>
<input type="hidden" name="custname" id="custname" value="<%=custname1%>"/>
<% OBCommonUser user=(OBCommonUser) session.getAttribute(GlobalSessionConstant.LOS_USER); %>
<input type="hidden" name="maker_id" value="<%=user.getLoginID()%>"/>
<input type="hidden" name="maker_date" value="<%=itrxValue.getTransactionDate().toString()%>"/>
<input type="hidden" name="fdWebServiceFlag" value="<%=fdWebServiceFlag%>"/>
<%
String radioVal = "N";
System.out.print("==========Sachin========>"+request.getParameter("radioSelect"));
if( null != request.getParameter("radioSelect"))
{
	radioVal = (String)request.getParameter("radioSelect");
	}
%>

<html:hidden property="radioSelect" value="<%=radioVal %>" />
<%
    int index = 2;
    if ("-1".equals(request.getParameter("indexID"))) {
        index = 1;
    }
    int rowIdx = 0;
   //String countFd = request.getParameter("countFd");
 %>

 <%   
 	String SAVE = CategoryCodeConstant.SAVE;
 	String TIME_DEP = CategoryCodeConstant.TIME_DEP;
    if(SAVE!=null)
     {
           SAVE=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.FD_ACC_TYPE, SAVE);
     }
     if(TIME_DEP!=null)
     {
           TIME_DEP=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.FD_ACC_TYPE, TIME_DEP);
     }

%>

<%String event=(String)request.getParameter("event");//prepare-new&prepare_update_sub-edit
String flag="New";
//String newEvent = "New";
String newEvent=(String)request.getParameter("newEvent");
if (null == newEvent)
   {
	newEvent = "New";
	flag="New";
	}
System.out.println("event===>"+newEvent);

if(event.equalsIgnoreCase("prepare_update_sub") || newEvent.equalsIgnoreCase("Edit"))
 {
 newEvent = "Edit"; 
 flag=newEvent;
 }


 %>
 <input type="hidden" name="newEvent" value="<%=newEvent%>"/>
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3><bean:message key="label.security.depoosit.infor"/> - <%= flag %></h3>
			</td>
			<td valign="bottom" align="left"><html:errors property="stpError"/><html:errors property="infoError"/></td>
        </tr>
        
    </thead>
    <tbody>
    
    <tr>
            <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.own.bank.other.issuer"/></span>&nbsp;
								<span class="mandatoryPerfection">*</span>
							</td>
                            <td width="30%" >
								<html:radio property="ownBank" value="<%=ICMSConstant.TRUE_VALUE%>" onclick="javascript:showAccField(false) ; "/><bean:message key="label.cash.own"/>
								&nbsp;&nbsp;
								<html:radio property="ownBank" value="<%=ICMSConstant.FALSE_VALUE%>" onclick="javascript:showAccField(true) ; "/><bean:message key="label.cash.other.issuer"/>
								<html:errors property="ownBank"/>
							</td>
                        </tr>
                    </tbody>
                    </table>
                    </td>
                    </tr>
     <%-- start from here FD list --%>
         <tr><td><hr/><br></td></tr>
                    <tr class="even">
                  <td colspan="2">
                   <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                            <td width="70%" class="fieldname">
                                <span class="fieldname">Search FD By <bean:message key="label.cash.deposit.number"/> : </span>&nbsp;
							<br></td>
                            <td width="30%" >
                          <!--  <input type="text" maxlength="20"  onKeyUp="characterText()" onKeyDown="characterText()" id='rec'/> -->
								<html:text property="depositRecNoInSearch" styleId="rec" maxlength="20"  onkeyup="characterText()" onkeydown="characterText()" onblur="makeFieldEditable()"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" class="btnNormal" id='fd_go' onclick="fd_list('<%=fdWebServiceFlag %>')" value="GO"/>
								&nbsp;&nbsp;&nbsp;&nbsp;<span class="mandatoryPerfection">Search text is case sensitive.</span>
							<br></td>
							</table>
                  <br></td>
                        </tr>
                        <tr>
                        	<td id="fdDiv"></td>
                        </tr>
                     <%-- start from here FD list --%>
    
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
    
    
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" style="table-layout: fixed;">
                    <tbody>                       
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.depositor.name"/></span>&nbsp;
								<span class="mandatoryPerfection">*</span>
								</td>								
                            <td width="30%" style="word-wrap: break-word;">
                            <b id='depositorName1'></b>
                            <html:text property="depositorName" styleId="depositorName" maxlength="100"  size="60"/>&nbsp;
                             
                                <html:errors property="depositorName"/>
                                
                                </td>  
                                                                                                                             
                            </td>
                        </tr>
						
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.number"/></span>&nbsp;
								<span class="mandatoryPerfection" id="mandPerDepositRefNo">*</span></td>
                            <td width="30%"><html:text styleId="depositRefNo" property="depositRefNo" maxlength="20" />&nbsp;
                                <% if (StringUtils.equals(stpMode,"true")) { %>
                                    <input type="button" name="retrieveFD" onclick="submitPage(4)" class="btnNormal" value="Retrieve FD Info"/>
                                <% } %>
                                <html:errors property="depositRefNo"/>
                            </td>
                        </tr>
                        <html:hidden property="depositReceiptNo" />
                        <html:hidden property="cashDepositID" />
                        <%-- <html:hidden property="fdCount" /> --%>
                        <%-- <html:hidden property="searchFlag"  />--%>
						<%--
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.reference.no"/></span>&nbsp;
								</td>
                            <td width="30%">&nbsp;
                                <html:errors property="depositReceiptNo"/>
                            </td>
                        </tr>
						
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <bean:message key="label.cash.deposit.currency"/>&nbsp;
                                	<bean:message key="label.mandatory"/>
                                	<span class="mandatoryPerfection">*</span></td>
                            <td><html:select property="depCurr">
                                    <option value=""><bean:message key="label.please.select"/></option>
                                    <html:options name="currencyCode" labelName="currencyCode"/>
                                </html:select>&nbsp;
                                <html:errors property="depCurr"/></td>
                        </tr>
						
                        --%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.amount"/></span>
									
                                	<span class="mandatoryPerfection">*</span></td>

                            <td><html:text property="depAmt" styleId="depAmt" maxlength="20" size="30" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                            <span  style="color: blue;"><b id='utilizedAmunt' ></b></span>
                            <script type="text/javascript">
                            document.getElementById('utilizedAmunt').innerHTML = "Total utilized Amount is " +'<%= utilizedAmunt %>';
                            </script>
                            <br/>

                                <html:errors property="depAmt"/></td>
                        </tr>
						<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.fixed.deposit.date"/></span>&nbsp;
								<span class="mandatoryPerfection">*</span></td>
                            <td><html:text property="issueDate" styleId="issueDate" readonly="true" size="15" maxlength="11"onchange="exchangeRateINRCal();"/>
                                <img src="img/calendara.gif" name="Image74" border="0" id="issueDateCal" onclick="showCalendar('issueDate', 'dd/mm/y')"
                                     onmouseover="MM_swapImage('Image74','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                &nbsp; <html:errors property="issueDate"/></td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.maturity.date"/></span>&nbsp;
									
                                	<span class="mandatoryPerfection">*</span></td>
                            <td><html:text property="depMatDate" styleId="depMatDate" readonly="true" size="15" maxlength="11" onchange="exchangeRateINRCal();"/>
                                <img src="img/calendara.gif" name="Image73" border="0" id="depMatCal" onclick="showCalendar('depMatDate', 'dd/mm/y')"
                                     onmouseover="MM_swapImage('Image73','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                &nbsp; <html:errors property="depMatDate"/></td>
                        </tr>
                       
                        <%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
							<td class="fieldname">
								<span class="fieldname"><bean:message key="label.cash.tenure"/></span></td>
							<td><html:text property="tenure" size="6" maxlength="6" />
							    <html:errors property="tenure" />&nbsp;&nbsp;
								<html:select property="tenureUOM">
									<integro:common-code categoryCode="28"/>
							    </html:select>&nbsp;<html:errors property="tenureUOM"/></td>
						</tr>
--%><%--                       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>"> 
							<td class="fieldname"><bean:message key="label.cash.deposit.account.type"/></td>
							<td><html:radio property="accountTypeValue" value="SAVE"/><%=SAVE%>
								&nbsp;&nbsp;
								<html:radio property="accountTypeValue" value="TIME_DEP"/><%=TIME_DEP%></td>
                       </tr>
                       
                       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <bean:message key="label.cash.deposit.fdr.rate"/></td>
                            <td><html:text property="fdrRate" maxlength="20"/></td>
                        </tr>--%>
                        
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="fieldname"><bean:message key="label.cash.tenure"/>&nbsp;</td>
               <td  width="30%">
               <p><b id='valExchangeRateINRCal'></b> </p>
               <script type="text/javascript">
               exchangeRateINRCal();
               </script>
             </td>
                        </tr>
                         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.verification.date"/></span>&nbsp;
								</td>
                            <td><html:text property="verificationDate" styleId="ver_date" readonly="true" size="15" maxlength="11"/>
                                <img src="img/calendara.gif" name="Image74" border="0" id="verificationDateCal" onclick="showCalendar('verificationDate', 'dd/mm/y')"
                                     onmouseover="MM_swapImage('Image74','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                &nbsp; <html:errors property="verificationDate"/></td>
                        </tr>
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.interest.rate"/></span>
									
                                	<span class="mandatoryPerfection">*</span></td>
                            <td><html:text property="depositeInterestRate" styleId="depositeInterestRate" maxlength="15"/>&nbsp;
                                <html:errors property="depositeInterestRate"/></td>
                        </tr>
                        
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" id = "systemNameR">
                 <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.system.name"/></span><span class="mandatoryPerfection">*</span></td>
                            <%--<td><html:text property="systemName" maxlength="15"/>&nbsp;
                                <html:errors property="systemName"/></td>
                                value="<%=strRegionId%>"  label value
                                --%>
                                <td>
                           <html:select property="systemName" onchange="javascript:selectSystem(this)">
						    <option value="">Please Select</option>
							<html:options collection="system" labelProperty="value" property="value" />
					</html:select>	
                                
                               
                                
                                <%--
                           <integro:common-code
												categoryCode="<%=CategoryCodeConstant.SYSTEM%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
												--%>
										
											<br><html:errors property="systemName"/>
											
                                </td>
                      </tr>
                      <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" id = "systemIdR">          
                 <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.system.id"/></span>
									
                                	<span class="mandatoryPerfection">*</span></td>
                            <td> 
                            <html:select property="systemId" >
						    <option value="">Please Select</option>
								<html:options collection="systemIdList" labelProperty="label" property="label"  />
							</html:select>	

                                <html:errors property="systemId"/></td>
                               
                </tr>
                <%-- <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" id = "customerIdR">
               
                  <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.customer.name"/></span>
									
                                	<span class="mandatoryPerfection">*</span></td>
                            <td><html:text property="customerId" maxlength="10"/>&nbsp;
                                <html:errors property="customerId"/></td>
                            
                             </tr>--%>
                               
                                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.finware.id"/></span>									
                                	</td>
                            <td><html:text property="finwareId" maxlength="10"/>&nbsp;
                                <html:errors property="finwareId"/></td>
                </tr>
                 
                     <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td width="70%" class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.active.inactive"/></span>&nbsp;
								<span class="mandatoryPerfection">*</span>
							</td>
                            <td width="30%" >
                            <%if(flag.equals("Edit")){ %>
								<html:radio property="active" value="active" /><bean:message key="label.cash.active"/>
								&nbsp;&nbsp;
								<html:radio property="active" value="inactive" /><bean:message key="label.cash.inactive"/>
								<%}else {%>
								<html:hidden property="active" value="active"  />
								<input type="radio" name="active" checked="checked"></input><bean:message key="label.cash.active"/>
									<%} %>
								<html:errors property="active"/>
							</td>
                        </tr>    
                        
                        <%--
                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <span class="fieldname"><bean:message key="label.cash.deposit.fd.lien.percentage"/></span>
									
                                	<span class="mandatoryPerfection">*</span></td>
                            <td><html:text property="fdLinePercentage" maxlength="15"/>&nbsp;
                                <html:errors property="fdLinePercentage"/></td>
                        </tr>
                        
--%><%--                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                            <td class="fieldname">
                                <bean:message key="label.cash.deposit.third.party.bank"/>&nbsp;<bean:message key="label.mandatory"/></td>
                            <td><html:radio property="thirdPartyBank" onclick="thirdPartyChange('show')" value="<%=ICMSConstant.TRUE_VALUE%>"/><bean:message key="label.common.yes"/>
								&nbsp;&nbsp;
								<html:radio property="thirdPartyBank" onclick="thirdPartyChange('hide')" value="<%=ICMSConstant.FALSE_VALUE%>"/><bean:message key="label.common.no"/></td>
                        </tr>--%>
                       
                    </tbody>
                    
                </table>
            </td>
        </tr>
    </tbody>
</table>
<%@ include file="/collateral/cash/cashfd/list_Lien_FixedDeposit_update.jsp" %>
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
<tr><td class="fieldname" width="20%">Edited By</td><td width="30%"><%= maker_id %></td><td class="fieldname" width="20%">Last Approved By</td><td width="30%"><%= checker_id %></td></tr>
<tr><td class="fieldname" width="20%">Edited On</td><td width="30%"><%= maker_date %></td><td class="fieldname" width="20%">Last Approved On</td><td width="30%"><%= checker_date %></td></tr>
</table></tr></table></td></tr></tbody></table></td></tr></table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(6)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
        <td width="100" valign="baseline" align="center"><a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
<script type="text/javascript">
	if (document.forms[0].elements["ownBank"] != null)
	{
		if (document.forms[0].elements["ownBank"][0].checked)			
			showAccField(false);
		else if (document.forms[0].elements["ownBank"][1].checked)
			showAccField(true);
	}
</script>
<script type="text/javascript">

if ('<%=fdWebServiceFlag %>' == 'Y' || '<%=fdWebServiceFlag %>' =='y') {
	// alert("depositRecNoInSearch:"+'<%=depositRecNoInSearch%>');
	
	// Start:Uma Khot: Added to cpture FD details manully when fd no is other than FC.
<%	if(null != depositRecNoInSearch && depositRecNoInSearch.length() !=14 && depositRecNoInSearch.length()!= 0){ %>
	
		document.getElementById('depAmt').readOnly = false;
		document.getElementById('depositorName').readOnly = false;
		document.getElementById('issueDate').readOnly = true;
		document.getElementById('issueDateCal').disabled = false;
		document.getElementById('depMatDate').readOnly = true;
		document.getElementById('depMatCal').disabled = false;
		document.getElementById('depositeInterestRate').readOnly = false;
		document.getElementById('depositRefNo').readOnly = false;
		
<%	}  	// End:Uma Khot: Added to cpture FD details manully when fd no is other than FC.
	else{ %>
		document.getElementById('depAmt').readOnly = true;
		document.getElementById('depositorName').readOnly = true;
		document.getElementById('issueDate').readOnly = true;
		document.getElementById('issueDateCal').disabled = true;
		document.getElementById('depMatDate').readOnly = true;
		document.getElementById('depMatCal').disabled = true;
		document.getElementById('depositeInterestRate').readOnly = true;
		document.getElementById('depositRefNo').readOnly = true;
	<%}%>
}
</script>
</html:form>

</body>
</html>
