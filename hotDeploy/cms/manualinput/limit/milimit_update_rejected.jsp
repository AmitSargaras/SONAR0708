<%@ page import="java.util.Locale,
				 java.util.Collection,
				 java.util.Iterator,
				 java.util.List,
				 org.apache.struts.util.LabelValueBean,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICustomerSysXRef,
                 com.integrosys.cms.app.limit.bus.ILimitSysXRef,
                 com.integrosys.cms.app.limit.trx.ILimitTrxValue,
                 com.integrosys.cms.app.limit.trx.OBLimitTrxValue,
                 com.integrosys.cms.ui.manualinput.limit.MILimitUIHelper,
                 com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                  com.integrosys.cms.ui.common.CurrencyList,
                  java.text.DecimalFormat,
                  java.math.BigDecimal,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant,
                 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria
                 " %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    long oneTeamMshipID = userTeam.getTeamMemberships()[0].getTeamTypeMembership().getMembershipID();
    String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMr = false;

    if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
            oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
        isMr = true;
    }
	
	boolean isCPUMakerI = false;
    if(Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
    	isCPUMakerI = true;
    }
    
    MILimitUIHelper helper = new MILimitUIHelper();
    boolean isLmtSecChange = false;
    
    List facNameList=(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facNameList");
    
    HashMap collateralMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.collateralMap");
    String sessionCriteria = (String) request.getAttribute("sessionCriteria");
    request.setAttribute("sessionCriteria", sessionCriteria);
    System.out.println(">>>>>>>session criteria>>>>>>> "+sessionCriteria); 
    
    pageContext.setAttribute("facNameList",facNameList);
    
    Collection relationShipMngrList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.relationShipMngrList");
	request.setAttribute("relationShipMngrList", relationShipMngrList);
	
	Collection subFacNameList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.subFacNameList");
	request.setAttribute("subFacNameList", subFacNameList);
	
	Collection subPartyNameList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.subPartyNameList");
	request.setAttribute("subPartyNameList", subPartyNameList);
	
	Collection liabilityIDList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.liabilityIDList");
	request.setAttribute("liabilityIDList", liabilityIDList);
	pageContext.setAttribute("liabilityIDList", liabilityIDList);
	
    List facDetailList=(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facDetailList");
    pageContext.setAttribute("facDetailList",facDetailList);
    
    String relationShipMgrName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.relationShipMgrName");
    if(relationShipMgrName != null){
    pageContext.setAttribute("relationShipMgrName",relationShipMgrName);
    }
    Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");

    Boolean adhocVal=true;
    Boolean isLineAdded=false;
    if( obj != null ) {
        ILimitTrxValue obTrxValue = (OBLimitTrxValue)obj;
    	//isLmtSecChange = helper.checkLimitSecMappingChanged( obTrxValue );
    	
        
        System.out.println("ReferenceID:"+ obTrxValue.getReferenceID()+"stag id: "+obTrxValue.getStagingReferenceID());
        if(obTrxValue.getStagingReferenceID()== null || obTrxValue.getReferenceID() ==null){
        	adhocVal=false;
        }
            
        System.out.println("obTrxValue.getStagingLimit():"+obTrxValue.getStagingLimit()+" obTrxValue.getStagingLimit().getLimitSysXRefs():"+obTrxValue.getStagingLimit().getLimitSysXRefs());
        if( null !=obTrxValue.getStagingLimit() && null!=obTrxValue.getStagingLimit().getLimitSysXRefs() && obTrxValue.getStagingLimit().getLimitSysXRefs().length>0){
        		isLineAdded=true;
        	  System.out.println("xref size:"+obTrxValue.getStagingLimit().getLimitSysXRefs().length);
        }
       
        System.out.println("adhocVal:"+adhocVal+" isLineAdded:"+isLineAdded);
	}

	String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
			
	String updateEvent=(String)request.getAttribute("updateEvent");
	if(updateEvent==null)
		updateEvent="";
	
	request.setAttribute("updateEvent",updateEvent);
	DecimalFormat dft = new DecimalFormat("#0.00");
	
	String isCreate=(String)request.getAttribute("isCreate");
	System.out.println("isCreate:"+isCreate);
	
	 String fcunsSystem=PropertyManager.getValue("fcubs.systemName");
	  String ubslimitSystem=PropertyManager.getValue("ubs.systemName"); 
	  
	String sessionCriteria1 = (String) request.getAttribute("sessionCriteria");
	request.setAttribute("sessionCriteria", sessionCriteria1);
	System.out.println(">>>>>>>lmtlistcmd>>>>>>>>session criteria"+sessionCriteria1); 
%>



<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.techinfra.propertyfile.PropertyManager"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceBeginEditable name="head" -->
    
    <script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
	<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
	<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>

    <script type="text/javascript" src="js/ajaxDropdown.js"></script>
    <script type="text/javascript" src="js/ajaxList.js"></script>
    <script type="text/javascript" src="js/ajaxSancAmount.js"></script>

    <script language="javascript">
    function lineStartWith5or6(){
//alert("lineStartWith5or6");
  	  var lineNo=document.forms[0].lineNo.value;
  	 // var lineNo=" 5123";
  	// alert("lineNo 1:"+lineNo);
  	  lineNo=lineNo.replace(/^\s+/g, "");
  	//  alert("lineNo 2:"+lineNo);
  	  var index5=lineNo.indexOf("5");
  	  var index6=lineNo.indexOf("6");
  	//  alert("index5:"+index5+" index6:"+index6);
  	  if(index5 == 0 || index6 == 0 ){
  	//	  alert("lineNo 3:");
  		return true;
	 
  	  }else{
  		  return false;
  	  }
  }
    
    function submitLimit( isLmtSecChange ,adhocVal)    {
    
    var adhocVal_1=adhocVal; 
      var isLineAdded_1='<%=isLineAdded%>';
   // alert("isLineAdded_1:"+isLineAdded_1);
   
    	var lineFlag=lineStartWith5or6();
		  var system=document.forms[0].facilitySystem.value;
		 var fcunsSystem1= '<%=fcunsSystem%>';
	     var ubslimitSystem1= '<%=ubslimitSystem%>';
	   //  alert("fcunsSystem1:"+fcunsSystem1 +" lineFlag:"+lineFlag+" limittype:"+document.forms[0].limitType[1].checked);
	     
	     var releasableAmount=document.getElementById("releasableAmount").value;
		   var requiredSecCov=document.getElementById("requiredSecCov").value;
		   var totalReleasedAmount=document.getElementById("totalReleasedAmount").value;
		   
		  
		   if(releasableAmount==""){
			   releasableAmount="0.00";
		   }
		   if(requiredSecCov==""){
			   requiredSecCov="0.00";
		   }
		   if(totalReleasedAmount==""){
			   totalReleasedAmount="0.00";
		   }
		     //  alert("isAdhoc val:"+document.getElementById("isAdhoc").value +" sanctione amt:"+requiredSecCov+" releaseable:"+releasableAmount+" totalReleasedAmount	:"+totalReleasedAmount);
			   if( (adhocVal_1 == true) && (isLineAdded_1 == 'true') && (document.getElementById("isAdhoc").value == 'Y' || document.getElementById("isAdhoc").value == 'on') && (totalReleasedAmount =="0.00" )
					   && (releasableAmount !="0.00" || requiredSecCov !="0.00" )){
				   alert("ADHOC LIMITS, SANCTIONED/RELEASABLE AMOUNT ALSO NEEDS TO BE ZEROISED.");
			   }else{
  	if((lineFlag== true) && (document.forms[0].limitType[1].checked== true ) && (system == fcunsSystem1 || system == ubslimitSystem1)){
  	
			alert("Sublimit cannot be main limit. Please select sublimit radio button as 'Yes'.");
		}else{
			   
		
		document.forms[0].deletedLmtSec.value = '';
		
		var msg = "Please ensure that all legal documents required are completed.";		      
		var toProcess = 1;
		if( toProcess == 1 ) {
			if (document.forms[0].isCreate.value == 'Y')   {
				document.forms[0].event.value = 'create';
			} else{
				document.forms[0].event.value = 'submit_rejected';
			}
			if(document.forms[0].isAdhoc.checked == true || document.forms[0].checkAdhoc.checked == true ){
				alert("Please add adhoc limit at Party Financial details.");
			}

			document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
			document.forms[0].submit();
		}
		}
	   
    }
    }

    function saveLimit() {
    	document.forms[0].deletedLmtSec.value='';
        document.forms[0].event.value = 'save_rejected';
        
        document.getElementById('facilityCat').disabled = false;
    	document.getElementById('facilityName').disabled = false;
    	document.getElementById('currencyCode').disabled = false;
        document.forms[0].submit();
    }

    function cancelSubmit(sessionCriteria){
    	document.forms[0].deletedLmtSec.value='';
        <%-- var url = '<%= (String) request.getAttribute("returnUrl") %>'; --%>
        document.location.href = "MICustomerSearch.do?event=rejectedFlow_list_limit&amp;rejectedFlow=true&amp;searchFlag=false&sessionCriteria="+sessionCriteria;
    }

    function createXRef(fcunsSystem,ubslimitSystem) {
	
    	var system=document.forms[0].facilitySystem.value;
      //  alert("System:"+ document.forms[0].facilitySystem.value);
   
    	if(system == fcunsSystem || system == ubslimitSystem){
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].indexID.value = '';
        document.forms[0].event.value = 'create_sub_acnt_ubs';
        
        document.getElementById('facilityCat').disabled = false;
    	document.getElementById('facilityName').disabled = false;
    	document.getElementById('currencyCode').disabled = false;
        document.forms[0].submit();
    	}else{
    		document.forms[0].fromEvent.value = 'update';
            document.forms[0].indexID.value = '';
            document.forms[0].event.value = 'create_sub_acnt';
            
            document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
            document.forms[0].submit();
    	}
    }

    function deleteXRef(){
        document.forms[0].itemType.value = 'actnref';
        document.forms[0].event.value = 'delete_item';
        
        document.getElementById('facilityCat').disabled = false;
    	document.getElementById('facilityName').disabled = false;
    	document.getElementById('currencyCode').disabled = false;
        document.forms[0].submit();
    }

    function updateXRef(editOrView , ind, xrefId,fcunsSystem,ubslimitSystem,sessionCriteria){
    	var system=document.forms[0].facilitySystem.value;
        
      	if(system == fcunsSystem || system == ubslimitSystem){
          	
        if(editOrView=="edit") {
        document.forms[0].fromEvent.value = 'update';
          if(document.forms[0].event.value =='prepare_cust_update') {
      		document.forms[0].fromEvent.value = 'prepare_cust_update';
      	}
        document.forms[0].indexID.value = ind;
         document.forms[0].lineDetailId.value = xrefId;
        document.forms[0].event.value = 'update_sub_acnt_ubs_rejected';
        document.forms[0].action ="MILimit.do?sessionCriteria="+sessionCriteria;	
        
        document.getElementById('facilityCat').disabled = false;
    	document.getElementById('facilityName').disabled = false;
    	document.getElementById('currencyCode').disabled = false;
        document.forms[0].submit();
        }
        if(editOrView == "view"){
        	document.forms[0].fromEvent.value = 'view';
        	 if(document.forms[0].event.value =='prepare_cust_update'){
          		document.forms[0].fromEvent.value = 'prepare_cust_update';
          	}
            document.forms[0].indexID.value = ind;
             document.forms[0].lineDetailId.value = xrefId;
            document.forms[0].event.value = 'view_sub_acnt_ubs_rejected';
            document.forms[0].action ="MILimit.do?sessionCriteria="+sessionCriteria;
            
            document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
            document.forms[0].submit();
        }

        if(editOrView=="reopen") {
            document.forms[0].fromEvent.value = 'reopen';
              if(document.forms[0].event.value =='prepare_cust_update') {
          		document.forms[0].fromEvent.value = 'prepare_cust_update';
          	}
            document.forms[0].indexID.value = ind;
             document.forms[0].lineDetailId.value = xrefId;
            document.forms[0].event.value = 'reopen_sub_acnt_ubs_rejected';
            document.forms[0].action ="MILimit.do?sessionCriteria="+sessionCriteria;
            
            document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
            document.forms[0].submit();
            }
        if(editOrView=="close") {
        	document.forms[0].fromEvent.value = 'close';
       	 if(document.forms[0].event.value =='prepare_cust_update'){
         		document.forms[0].fromEvent.value = 'prepare_cust_update';
         	}
           document.forms[0].indexID.value = ind;
            document.forms[0].lineDetailId.value = xrefId;
           document.forms[0].event.value = 'close_sub_acnt_ubs_rejected';
           document.forms[0].action ="MILimit.do?sessionCriteria="+sessionCriteria;
           
           	document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
           	document.forms[0].submit();
            }
        
      	}else{

          	
            if(editOrView=="edit") {
            document.forms[0].fromEvent.value = 'update';
              if(document.forms[0].event.value =='prepare_cust_update') {
          		document.forms[0].fromEvent.value = 'prepare_cust_update';
          	}
            document.forms[0].indexID.value = ind;
             document.forms[0].lineDetailId.value = xrefId;
            document.forms[0].event.value = 'update_sub_acnt';
            
            document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
            document.forms[0].submit();
            }
            if(editOrView == "view"){
            	document.forms[0].fromEvent.value = 'view';
            	 if(document.forms[0].event.value =='prepare_cust_update'){
              		document.forms[0].fromEvent.value = 'prepare_cust_update';
              	}
                document.forms[0].indexID.value = ind;
                 document.forms[0].lineDetailId.value = xrefId;
                document.forms[0].event.value = 'view_sub_acnt';
                
                document.getElementById('facilityCat').disabled = false;
    	    	document.getElementById('facilityName').disabled = false;
    	    	document.getElementById('currencyCode').disabled = false;
                document.forms[0].submit();
            }
          	
      	}
    }

    function createLmtSec() {
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].event.value = 'create_sub_sec';
        
        document.getElementById('facilityCat').disabled = false;
    	document.getElementById('facilityName').disabled = false;
    	document.getElementById('currencyCode').disabled = false;
        document.forms[0].submit();
    }

    function deleteLmtSec(indexId, action, securityId, securitySubtype,object)  {
       
        if(action =='Delete'){
        /*code start:Uma Khot 18/08/2015 Phase 3 CR:Show message box while deleteing security */
            var answer=confirm("Security OMV amount cannot be less than Limit Released Amount");
            if(answer == true){
            
          /*code end:Uma Khot 18/08/2015 Phase 3 CR:Show message box while deleteing security */   
	        document.forms[0].deletedLmtSec.value = indexId;
	        document.forms[0].securityIdDel.value = securityId;
	        document.forms[0].itemType.value = 'lmtsec';
	        document.forms[0].event.value = 'delete_item';
	        document.forms[0].action = "MILimit.do?deletedLmtSec="+document.forms[0].deletedLmtSec.value+"&securityIdDel="+securityId;
	       
	        document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
	        document.forms[0].submit();
            }
            else{
            	var optionId=object.id;
            	document.getElementById(optionId).selectedIndex="0";    
            }
        }
        if(action =='View'){
          if(document.forms[0].event.value =='prepare_cust_update'){
        		document.forms[0].fromEvent.value = 'prepare_cust_update';
        	}
        	document.forms[0].action = "MILimit.do?securityId="+securityId +"&securitySubtype=" +securitySubtype;		
	        document.forms[0].event.value = 'view_security';
	        
	        document.getElementById('facilityCat').disabled = false;
	    	document.getElementById('facilityName').disabled = false;
	    	document.getElementById('currencyCode').disabled = false;
	        document.forms[0].submit();
        }
    }

    function refreshFacName(dropdown) {
        var curSel = "";
            for(i=0; i < dropdown.options.length; i++)   {
                if (dropdown.options[i].selected == true) {
                    curSel = dropdown.options[i].value;
                }
            }
        var dep = 'facilityName';
        var url = '/cms/MILimit.do?event=refresh_facility_name&facCat='+curSel;
        sendLoadDropdownReq(dep, url);
        document.getElementById('facCat').value=curSel;
   }

    function refreshFacDetail(dropdown) {
        var curSel = "";
        var custID = document.forms[0].customerID.value;
        for(i=0; i < dropdown.options.length; i++)   {
            if (dropdown.options[i].selected == true) {
                curSel = dropdown.options[i].value;
            }
        }  
        //alert("curSel"+curSel);
        var dep = 'facilityType';
        var url = '/cms/MILimit.do?event=refresh_facility_detail&facName='+curSel+'&customerID='+custID;
        sendLoadListReq(dep, url);
    }

   

    function enbleadhoc(){
      //alert (document.getElementById("isAdhoc").value);
    	if(document.getElementById("isAdhoc").value == '' || document.getElementById("isAdhoc").value == 'N'){
    		document.getElementById("isAdhoc").value= 'Y';
        	document.getElementById('adhoc').style.display = ''
    	}else{
    		document.forms[0].isAdhocToSum.checked = false;
    		document.getElementById("isAdhoc").value= 'N';
    		document.forms[0].adhocLmtAmount.value = '';
    		document.getElementById('inrValue').value='';
    		document.getElementById('adhoc').style.display = 'none'
    	}
    }

    function enbleGnt(selfObj){
    	if(selfObj.value == "Yes"){
    		document.forms[0].guarantee[0].disabled =false;
        	document.forms[0].guarantee[1].disabled =false;
    		//document.getElementById('subFacilityName').value = '';
        	document.getElementById('subPartyName').value = '';
        	document.getElementById('liabilityID').value = '';
        	document.forms[0].guarantee[0].checked =false;
        	document.forms[0].guarantee[1].checked =false;
    	}
    	if(selfObj.value == "No"){
    		document.forms[0].guarantee[0].disabled =true;
        	document.forms[0].guarantee[1].disabled =true;
        	document.getElementById('guaranteeYes').style.display = 'none'
        	document.getElementById('guaranteeNo').style.display = 'none'
        	document.getElementById('subPartyName').value = '';
        	document.getElementById('liabilityID').value = '';
        	document.getElementById('guaranteeYes').style.display = 'none'
        	document.getElementById('guaranteeNo').style.display = 'none'
    	}
    }

    function enbleGuarantee(selfObj){
    	if(selfObj.value == "Yes"){
        	document.getElementById('guaranteeYes').style.display = ''
        	document.getElementById('guaranteeNo').style.display = 'none'
    	}
    	if(selfObj.value == "No"){
            document.getElementById('subPartyName').value = '';
        	document.getElementById('liabilityID').value = '';
    		document.getElementById('guaranteeYes').style.display = 'none'
            document.getElementById('guaranteeNo').style.display = ''
    	}
    }

    function liabiltyID(selfObj){

    	var tempVal=selfObj.value;
    	var testVal=tempVal.split("-",2);
        document.getElementById("liabilityID").value=testVal[0];
    }
    function  checkbox(){
		if((document.getElementById("facilityCat").value == '' ||  document.getElementById("facilityName").value == '') && document.getElementById("partyC")) {
			alert("Select facility category and name before adding lines");
			document.getElementById("isReleased").value ="N";
			document.getElementById("partyC").checked = false;
		}else{
    	
	    	if(document.getElementById("isReleased").value=='N')   	{
	    		document.getElementById("btnAddXRef").disabled = false;
	    		document.getElementById("isReleased").value= "Y";
	    	} 	else if(document.getElementById("isReleased").value=='')  	{
	    		document.getElementById("btnAddXRef").disabled = false;
	    		document.getElementById("isReleased").value= "Y";
	    	}
	    	else if(document.getElementById("isReleased").value=='Y')
	    	{
	    		document.getElementById("btnAddXRef").disabled = true;
	    		document.getElementById("isReleased").value= "N";
	    	}
		}
    	
    }
function  checkboxSecured(){

    	
    	if(document.getElementById("isSecured").value=='N')
    	{
        
    		document.getElementById("btnAddLmtSec").disabled = false;
    		document.getElementById("isSecured").value= "Y";
    	
    	}
    	else if(document.getElementById("isSecured").value=='')
    	{
    	
    		document.getElementById("btnAddLmtSec").disabled = false;
    		document.getElementById("isSecured").value= "Y";
    		
    	}
    	else if(document.getElementById("isSecured").value=='Y')
    	{
    		document.getElementById("btnAddLmtSec").disabled = true;
    		document.getElementById("isSecured").value= "N";
    		
    	}
    }

function convertToINR() {
	
	 var curSel = "";
	 var san="";
	 var adhok="";
       var sancAmount =document.getElementById('requiredSecCov').value;
		for(var i=0;i<sancAmount.length;i++){
			if(sancAmount[i]!=="m" && sancAmount[i]!=="M" && sancAmount[i]!=="b" && sancAmount[i]!=="B" &&
				(sancAmount[i] == 0 || sancAmount[i] == 1|| sancAmount[i] == 2|| 
						sancAmount[i] == 3|| sancAmount[i] == 4|| sancAmount[i] == 5|| sancAmount[i] == 6
						|| sancAmount[i] == 7 || sancAmount[i] == 8 || sancAmount[i] == 9)){
			san=san+sancAmount.charAt(i);			
			}
			
       if(sancAmount[i]==="m"|| sancAmount[i]==="M"){	        	
       sancAmount=sancAmount.toLowerCase().replace('M'," ");	        
       sancAmount=san*1000000;	    	        
       }
       
       if(sancAmount[i]==="B"|| sancAmount[i]==="b"){
	        sancAmount=sancAmount.replace('B'," ");
	        sancAmount=san*1000000000;		       
	        }
       }
		
       var currencyCode = document.getElementById('currencyCode').value;
       var tempSancAmount = document.getElementById('actSancAmount').value;
       //var adhocAmount = eval(document.getElementById('adhocLmtAmount').value);
       var adhocAmount = document.getElementById('adhocLmtAmount').value;
       if(adhocAmount==null || adhocAmount==='undefined' || adhocAmount===""){
       	adhocAmount="0.00";
       }else{
       for(var i=0;i<adhocAmount.length;i++){
			if(adhocAmount[i]!=="m" && adhocAmount[i]!=="M" && adhocAmount[i]!=="b" && adhocAmount[i]!=="B"){
				adhok=adhok+adhocAmount.charAt(i);			
			}
			
       if(adhocAmount[i]==="m"|| adhocAmount[i]==="M"){	        	
       	adhocAmount=adhocAmount.toLowerCase().replace('M'," ");	        
       	adhocAmount=adhok*1000000;	    	        
       }
       
       if(adhocAmount[i]==="B"|| adhocAmount[i]==="b"){
       	adhocAmount=adhocAmount.replace('B'," ");
       	adhocAmount=adhok*1000000000;		       
	        }
       	}
       }
       	
       
       
	        var dep = 'inrValue';
	        var url = '/cms/MILimit.do?event=refresh_inr_sanc&sancAmount='+sancAmount+'&currencyCode='+currencyCode+'&tempSancAmount='+tempSancAmount+'&adhocAmount='+adhocAmount;
	        sendLoadSancAmountReq(dep, url);
}
function onBlurEvent(txtSancAmount){
	var sancAmount=txtSancAmount.value;
	var len="";
	if(sancAmount.length>=1 && sancAmount.length<=38){
		var secondLastChar=sancAmount.charAt(sancAmount.length-1);
		if(secondLastChar==="M"){
			//sancAmount=sancAmount.slice(0,-1);
			sancAmount=sancAmount.replace("M"," ");
			sancAmount=sancAmount*1000000;
			//alert(sancAmount);
			len=sancAmount.toString().length;
			if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
				txtSancAmount.value=sancAmount;
			}else{
				txtSancAmount.value="0.00";
			}
			
			//alert(sancAmount.toString().charAt(1));
			
		}
		else if(secondLastChar==="m"){
			//sancAmount=sancAmount.slice(0,-1);
			sancAmount=sancAmount.replace("m"," ");
			sancAmount=sancAmount*1000000;
			len=sancAmount.toString().length;
			if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
				txtSancAmount.value=sancAmount;
			}else{
				txtSancAmount.value="0.00";
			}
			
		}
		else if(secondLastChar==="B"){
			//sancAmount=sancAmount.slice(0,-1);
			sancAmount=sancAmount.replace("B"," ");
			sancAmount=sancAmount*1000000000;
			len=sancAmount.toString().length;
			if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
				txtSancAmount.value=sancAmount;
			}else{
				txtSancAmount.value="0.00";
			}
		}
		else if(secondLastChar==="b"){
			//sancAmount=sancAmount.slice(0,-1);
			sancAmount=sancAmount.replace("b"," ");
			sancAmount=sancAmount*1000000000;
			len=sancAmount.toString().length;
			if(len<=38 && sancAmount.toString().charAt(1)!=="e"){
				txtSancAmount.value=sancAmount;
			}else{
				txtSancAmount.value="0.00";
			}
		}
		else if(secondLastChar == 0 || secondLastChar == 1|| secondLastChar == 2|| 
				secondLastChar == 3|| secondLastChar == 4|| secondLastChar == 5|| secondLastChar == 6
				|| secondLastChar == 7 || secondLastChar == 8 || secondLastChar == 9){
			len=sancAmount.toString().length;
			if(len<=38){
				txtSancAmount.value=sancAmount;
			}else{
				txtSancAmount.value="0.00";
			}
		}
		else{
			//alert("Please enter numeric value only.");
			txtSancAmount.value="0.00";
		}
	}
	else{
		//alert("Please enter numeric value only.");
		txtSancAmount.value="0.00";
	}
}


function onKeyUpEvent(txtSancAmount){
	var sancAmount=txtSancAmount.value;
	if(sancAmount.length>1){
		var secondLastChar=sancAmount.charAt(sancAmount.length-2);
		if(secondLastChar==="M"){
			sancAmount=sancAmount.slice(0,-1);
			//sancAmount=sancAmount*1000000;
			txtSancAmount.value=sancAmount;
			//onChangeEvent(txtSancAmount.value);
		}
		if(secondLastChar==="m"){
			sancAmount=sancAmount.slice(0,-1);
			//sancAmount=sancAmount.replace("m","M");
			//sancAmount=sancAmount*1000000;
			txtSancAmount.value=sancAmount;
			//alert("Not Allow to enter more value.");
			
		}
		if(secondLastChar==="B"){
			sancAmount=sancAmount.slice(0,-1);
			//sancAmount=sancAmount.replace("B"," ");
			//sancAmount=sancAmount*1000000000;
			txtSancAmount.value=sancAmount;
			//alert("Not Allow to enter more value.");
		}
		if(secondLastChar==="b"){
			sancAmount=sancAmount.slice(0,-1);
			//sancAmount=sancAmount.replace("b"," ");
			//sancAmount=sancAmount*1000000000;
			txtSancAmount.value=sancAmount;
			//alert("Not Allow to enter more value.");
		}
	}
}

	function refreshLiabilityID(dropdown) {
        var curSel = "";
        for(i=0; i < dropdown.options.length; i++)   {
            if (dropdown.options[i].selected == true) {
                curSel = dropdown.options[i].value;
            }
        }  
        var dep = 'liabilityID';
        var url = '/cms/MILimit.do?event=refresh_facility_liability&subProfileId='+curSel;
        sendLoadDropdownReq(dep, url);
    }
	function checkAmount()
	{
		var relAmt="";
		 
        var releaseAmount =document.getElementById('releasableAmount').value;
		for(var i=0;i<releaseAmount.length;i++){
			if(releaseAmount[i]!=="m" && releaseAmount[i]!=="M" && releaseAmount[i]!=="b" && releaseAmount[i]!=="B"){
				relAmt=relAmt+releaseAmount.charAt(i);			
			}
			
        if(releaseAmount[i]==="m"|| releaseAmount[i]==="M"){	        	
        	releaseAmount=releaseAmount.toLowerCase().replace('M'," ");	        
        	releaseAmount=relAmt*1000000;	    	        
        }
        
        if(releaseAmount[i]==="B"|| releaseAmount[i]==="b"){
        	releaseAmount=releaseAmount.replace('B'," ");
        	releaseAmount=relAmt*1000000000;		       
	        }
        }
		
	}

	// Start: Uma:Phase 3 CR :Limit Calculation Dashboard 
	function limitCalculationDashboard(){
		// document.forms[0].fromEvent.value = 'update';
	     document.forms[0].event.value = 'create_limit_dashboard';
	     
	    document.getElementById('facilityCat').disabled = false;
	    document.getElementById('facilityName').disabled = false;
	    document.getElementById('currencyCode').disabled = false;
	    document.forms[0].submit();
    }
	// End: Uma:Phase 3 CR :Limit Calculation Dashboard 
	
    </script>
</head>

<body >
<br>
<%
String actionStr1 = "com.integrosys.cms.ui.manualinput.limit.LmtDetailAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
&nbsp;&nbsp;<html:errors property="facilitySystemID"/> 
<p class="required"><font color="#FF0000">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>
<table align="right" width="100%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>


<html:form action="MILimit.do">
    <input type="hidden" name="event" value="<%=request.getAttribute("event") %>"/>
    <input type="hidden" name="fromEvent" value="<<%=updateEvent %>"/>
    <input type="hidden" name="indexID" value=""/>
        <input type="hidden" name="lineDetailId" value=""/>
    <input type="hidden" name="itemType" value=""/>
    <html:hidden property="limitProfileID"/>
	<html:hidden property="customerID" styleId="customerID"/>
    <html:hidden property="limitId"/>
    <html:hidden property="isCreate"/>
    
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj" type="com.integrosys.cms.app.limit.trx.ILimitTrxValue" scope="session"/>
    <bean:define id="formObj" name="LmtDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.LmtDetailForm"/>
    <input type="hidden" name="facCat" id="facCat" value="<%=formObj.getFacilityCat()%>" />
    <input type="hidden" name="actSancAmount" id="actSancAmount" value="<%=formObj.getRequiredSecCov()%>" />
<%
 boolean disableFacType = true; %>
    <logic:notEmpty name="LmtDetailForm" property="showSublist" scope="request">
        <% disableFacType = false; %>
    </logic:notEmpty>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%"><h3><bean:message key="title.facility.details"/></h3></td>
        <td width="19%" align="right" valign="bottom">&nbsp; </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<%System.out.println("++++++++++++++++++++++++++"+request.getAttribute("fundedAmount")); %>
  
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />

<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr class="odd">
    <td class="fieldname" width="20%"><bean:message key="label.facility.id"/>&nbsp;</td>
    <td width="30%">
        <bean:write name="LmtDetailForm" property="limitRef"/>&nbsp;
        <html:hidden property="limitRef"/>
    </td>
   <td class="fieldname" width="20%"><bean:message key="label.facility.category"/><font color="#FF0000">*</font> </td>
                  <td width="30%">
                  <%
                  if(updateEvent.equals("prepare_update_rejected"))
                  {
                  %>

                <%--  <bean:write name="LmtDetailForm" property="facilityCat"/>&nbsp;
        			<html:hidden property="facilityCat"/>    --%> 
        		<% if(formObj.getFacilityCat()==null || formObj.getFacilityCat().trim().equals("")){%>		
    
 <% if(formObj.getFacilityCat()==null || formObj.getFacilityCat().trim().equals("")){%>			
<%-- 
	<html:select property="facilityCat" onchange="javascript:refreshFacCategory(this)" >
						<option value="">Please Select </option>                     
						<html:options  collection ="facDetailList" labelProperty ="label" property ="value" />								                   
					</html:select>
              &nbsp;<html:errors property="facilityCat"/>               
					<%
				 }else{   --%>   
		               <% System.out.println(formObj.getFacilityCat());
		                  %>
		                  		<html:select disabled="true" property="facilityCat" styleId="facilityCat" value="<%=formObj.getFacilityCat().trim()%>" onchange="javascript:refreshFacName(this)">
		                  	<%--	<html:options collection="facDetailList" property="value" labelProperty="label"/> 
		                    </html:select></td> --%>
		                        <integro:common-code
										categoryCode="<%=CategoryCodeConstant.CommonCode_FACILITY_CATEGORY%>" descWithCode="false" />   
						</html:select><html:errors property="facilityCat" />
		                  <%} 					

				else{ %>
					<% if(null!=itrxValue.getLimit() && null!=itrxValue.getLimit().getFacilityCat()){%>
		 				<html:select disabled="true" property="facilityCat" styleId="facilityCat" value="<%=formObj.getFacilityCat()%>"  onchange="javascript:refreshFacName(this)">
  							<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_FACILITY_CATEGORY%>"
  					 		descWithCode="false" />   
		 				</html:select><html:errors property="facilityCat"/>
					<%} else{%>
						<html:select property="facilityCat" styleId="facilityCat" value="<%=formObj.getFacilityCat()%>"  onchange="javascript:refreshFacName(this)">
  							<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_FACILITY_CATEGORY%>"
  					 		descWithCode="false" />   
		 				</html:select><html:errors property="facilityCat"/>
						<%}
					}%>
					</td>
	</tr>
			<tr class="even">
		  	   <td class="fieldname"><bean:message key="label.facility.name"/><font color="#FF0000">*</font> </td>
                  <td>
                  <%
                  if(updateEvent.equals("prepare_update_rejected"))
                  {
                  %>

               <%--  commented to make as dropdown while editing
               <bean:write name="LmtDetailForm" property="facilityName"/>&nbsp;
        			<html:hidden property="facilityName"/>      --%> 
					<% if(formObj.getFacilityName()==null || formObj.getFacilityName().trim().equals("")){%>
        			 	<html:select property="facilityName" styleId="facilityName" onchange="javascript:refreshFacDetail(this);">				                  
							<option value="">Please Select </option>                     
							<html:options collection ="facNameList" labelProperty ="label" property ="value"/>								                   
						</html:select> 
        			 <%}else{ %>
        			 	<html:select property="facilityName" disabled="true" styleId="facilityName" onchange="javascript:refreshFacDetail(this);">				                  
							<option value="">Please Select </option>                     
							<html:options collection ="facNameList" labelProperty ="label" property ="value"/>								                   
						</html:select> 
        			 <%} %>
					<%}
					else{ %>
					<html:select property="facilityName" disabled="true" styleId="facilityName" onchange="javascript:refreshFacDetail(this);">				                  
						<option value="">Please Select </option>                     
						<html:options collection ="facNameList" labelProperty ="label" property ="value"/>								                   
					</html:select>
					<%} %>
					 <%}
					 else{ %>
					<% if(null!=itrxValue.getLimit() && null!=itrxValue.getLimit().getFacilityName()){%>
        			 	<html:select disabled="true" property="facilityName" styleId="facilityName" onchange="javascript:refreshFacDetail(this);">				                  
							<option value="">Please Select </option>                     
							<html:options collection ="facNameList" labelProperty ="label" property ="value"/>								                   
						</html:select> 
        			 <%}else{ %>
        			 	<html:select property="facilityName"  styleId="facilityName" onchange="javascript:refreshFacDetail(this);">				                  
							<option value="">Please Select </option>                     
							<html:options collection ="facNameList" labelProperty ="label" property ="value"/>								                   
						</html:select> 
        			 <%} }%>
					<html:errors property="facilityName"/>
              <html:hidden property="facilityCode" styleId="facilityCode" />
                  </td>
                  <td class="fieldname"> Facility Type</td>
                   <td><html:text property="facilityType" styleId="facilityType" readonly="true" /></td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">System</td>
                 <td>
                 <html:text property="facilitySystem" styleId="facilitySystem" readonly="true" />
                 </td>
                  <td class="fieldname" width="20%"><bean:message key="label.facility.syndicateLoan"/></td>
   				 <td width="30%">
        		<html:radio property="syndicateLoan" styleId="syndicateLoan" value="Y"/>&nbsp;Yes&nbsp;
        		<html:radio property="syndicateLoan" styleId="syndicateLoan" value="N" />&nbsp;No&nbsp;
        		</td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Line No.</td>
                 <td><html:text property="lineNo" styleId="lineNo" readonly="true" />
                  <td class="fieldname">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">Purpose</td>        
                    <%if(formObj.getPurpose()==null || "".equals(formObj.getPurpose())) {%>
                   <td> 
                  <html:text property="purpose" styleId="purpose"/>
                  <html:text property="otherPurpose" styleId="otherPurpose" readonly="true"/>
                   </td>
                  <%}else if(formObj.getPurpose().equals("Others")) { %>
                   <td>
                  <html:text property="purpose" styleId="purpose" />
                     <html:text property="otherPurpose" styleId="otherPurpose"/>
                </td>
                 <%}else { %>
                   <td>
                  <html:text property="purpose" styleId="purpose" />
                     <html:text property="otherPurpose" styleId="otherPurpose" readonly="true"/>
                </td>
                  <%} %>  
                 <%if(formObj.getPurpose()==null || "".equals(formObj.getPurpose())) {%>
                  <td class="fieldname">Should DP be calculated ?</td>
                  <td ><html:radio property="isDP" styleId="isDP" value="Y" disabled="true"/> Yes
  				  	  <html:radio property="isDP" styleId="isDP" value="N" disabled="true"/> No
  				  </td>
  				  <%}else if(updateEvent.equals("prepare_update_rejected")) {%>
  					   <td class="fieldname" >Should DP be calculated ?</td>
                  <td >
                   <%if(formObj.getIsDP() == null || formObj.getIsDP().trim().equals("")) {%>
                  	  <input type="radio" id="DP" name="DP" value="Yes" disabled="disabled">Yes
                  	  <input type="radio" id="DP" name="DP" value="No" disabled="disabled">No
                  	 <%}else if(formObj.getIsDP().equalsIgnoreCase("N")) {%>
                  	  <input type="radio" id="DP" name="DP" value="Yes" disabled="disabled">Yes
                  	  <input type="radio" id="DP" name="DP" value="No" checked="checked" disabled="disabled">No
                  	 <%}else if(formObj.getIsDP().equalsIgnoreCase("Y")) {%>
                  	 <input type="radio" id="DP" name="DP" value="Yes" checked="checked" disabled="disabled">Yes
                  	  <input type="radio" id="DP" name="DP" value="No" disabled="disabled">No
                  	 <%} %>
  				  	  <html:hidden property="isDP"/>
  				  </td>
  					 <%}else if(formObj.getPurpose().toUpperCase().equals("WORKING CAPITAL") || formObj.getPurpose().toUpperCase().equals("WORKING_CAPITAL")){ %>
                  <td class="fieldname" >Should DP be calculated ?</td>
                  <td ><html:radio property="isDP" styleId="isDP" value="Y" /> Yes
  				  	  <html:radio property="isDP" styleId="isDP" value="N"/> No
  				  </td>
  				  <%}else{ %>  
  				     <td class="fieldname">Should DP be calculated ?</td>
                  <td ><html:radio property="isDP" styleId="isDP" value="Y" disabled="true"/> Yes
  				  	  <html:radio property="isDP" styleId="isDP" value="N" disabled="true"/> No
  				  </td>
  				  <%} %>				  
                </tr>
                <tr class="even">
                  <td class="fieldname">Relationship Manager</td>
                  <td>
                  <%
                  if(updateEvent.equals("prepare_update_rejected"))
                  {
                  %>
                   <integro:empty-if-null value="<%= relationShipMgrName %>"/>
        			<html:hidden property="relationShipManager" styleId="relationShipManager" value="<%=formObj.getRelationShipManager() %>" />             
				 <%
				 }
				 else
				 {
				  %>
                    <html:select property="relationShipManager" styleId="relationShipManager" value="<%=formObj.getRelationShipManager() %>">
                    <html:option value="">Please Select</html:option>
								<%
									if (relationShipMngrList == null
													|| relationShipMngrList.size() == 0) {
									}
											Iterator iter = relationShipMngrList.iterator();
											while (iter.hasNext()) {
												LabelValueBean labValBean = (LabelValueBean) iter.next();
												String currentLabel = labValBean.getLabel();
												String currentValue = labValBean.getValue();
								%>
								<html:option value="<%=currentValue%>">
									<%=currentLabel%>
								</html:option>

								<%
									}
								%>

							</html:select> 
				<%} %>				  
                  </td>
                  <td class="fieldname">Released</td>
                  <td>
             <% 
             if(updateEvent.equals("prepare_update_rejected"))
             {%>
              
        	<html:hidden property="isReleased" styleId="isReleased"/>             
								
								
								<% if(formObj.getIsReleased().equals("Y")){%>
								<input type="checkbox" id="partyC" checked="checked" onclick="javascript:checkbox()" disabled="disabled"></input>
								<%} else if(formObj.getIsReleased().equals("N")){%>
								<input type="checkbox" id="partyC" onclick="javascript:checkbox()" disabled="disabled"></input>
			 <%}
			 }
			 else{
			  %>
			  <%if(formObj.getIsReleased()==null || formObj.getIsReleased().equals("")){%>
								
								<input type="checkbox" id="partyC" onclick="javascript:checkbox()" disabled="disabled"></input>
								<html:hidden property="isReleased" styleId="isReleased"/>
								<% }else if(formObj.getIsReleased().equals("Y")){%>
								<input type="checkbox" id="partyC" checked="checked" onclick="javascript:checkbox()" disabled="disabled"></input>
								<html:hidden property="isReleased" styleId="isReleased"/>
								<%} else if(formObj.getIsReleased().equals("N")){%>
								<input type="checkbox" id="partyC" onclick="javascript:checkbox()" disabled="disabled"></input>
								<html:hidden property="isReleased" styleId="isReleased"/>
			 <%} }%>
                  
                  
                  </td>
                </tr>
                     <tr class="even">
                  <td class="fieldname">Banking Arrangement <font color="#FF0000">*</font></td>
                  <td>
                  	<html:select property="bankingArrangement" style="width:250px">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
					</html:select>
					<html:errors property="bankingArrangement"/>
                  </td>
                  <td class="fieldname">Clause as per Policy <font color="#FF0000">*</font></td>
                <td>
	                  	<html:select property="clauseAsPerPolicy" style="width:250px">
							<integro:common-code categoryCode="<%=CategoryCodeConstant.CLAUSE_AS_PER_POLICY%>" descWithCode="false"/>
						</html:select>
						<html:errors property="clauseAsPerPolicy"/>
                </td>
                </tr> 
                <tr class="odd">
		  <td class="fieldname">Grade <font color="#FF0000">*</font> </td>
                  <td>
                                    <%
                  if(updateEvent.equals("prepare_update_rejected"))
                  {
                  %>
                  <bean:write name="LmtDetailForm" property="grade"/>&nbsp;
        			<html:hidden property="grade"/>    
                  <%}
                  else{%>
                  <html:select property="grade" >
                    <html:option value="">Select</html:option>
                    <html:option value="1">1</html:option>
                    <html:option value="2">2</html:option>
                    <html:option value="3">3</html:option>
                    <html:option value="4">4</html:option>
                    <html:option value="5">5</html:option>
                    <html:option value="6">6</html:option>
                    <html:option value="7">7</html:option>
                    <html:option value="8">8</html:option>
                    <html:option value="9">9</html:option>
                    <html:option value="10">10</html:option>
                  </html:select>
                  <%} %>
                  <html:errors property="facilityGrade"/></td>
                  <td class="fieldname"><p>Secured</p></td>
                  <td>
                  <% if(formObj.getIsSecured()==null || formObj.getIsSecured().equals("")){%>
								
								<input type="checkbox" id="partyC" disabled="disabled" onclick="javascript:checkboxSecured()"></input>
								<html:hidden property="isSecured" styleId="isSecured"/>
								<% }else if(formObj.getIsSecured().equals("Y")){%>
								<input type="checkbox" disabled="disabled" id="partyC" checked="checked" onclick="javascript:checkboxSecured()"></input>
								<html:hidden property="isSecured" styleId="isSecured"/>
								<%} else if(formObj.getIsSecured().equals("N")){%>
								<input type="checkbox" id="partyC" disabled="disabled" onclick="javascript:checkboxSecured()"></input>
								<html:hidden property="isSecured" styleId="isSecured"/>
								<%} %>
			
        
                       &nbsp;&nbsp;           
                  </td> 
                </tr>
                <tr class="even">
		  		  <td class="fieldname">Currency</td>
                  <td>
                  <% if(formObj.getCurrencyCode()==null || formObj.getCurrencyCode().trim().equals("")){%>
                  		<html:select  property="currencyCode" styleId="currencyCode" value="INR" onchange="convertToINR();">
                  			<html:options collection="currencyList" property="value" labelProperty="label"/>
                    	</html:select>
                  <%}else{ System.out.println(formObj.getCurrencyCode());%>
                  		<%if(null!=itrxValue.getLimit() && null!=itrxValue.getLimit().getCurrencyCode()){ %>
                  			<html:select disabled="true" property="currencyCode" styleId="currencyCode" value="<%=formObj.getCurrencyCode().trim()%>" onchange="convertToINR();">
                  				<html:options collection="currencyList" property="value" labelProperty="label"/>
                    		</html:select>
                  		<%}else{ %>
                  			<html:select property="currencyCode" styleId="currencyCode" value="<%=formObj.getCurrencyCode().trim()%>" onchange="convertToINR();">
                  				<html:options collection="currencyList" property="value" labelProperty="label"/>
                    		</html:select>
                  		<%} %>
                  <%} %>
                  </td>
                  <td class="fieldname">Adhoc</td>
                  <td>
                  <%
                  if(updateEvent.equals("prepare_update_xxyyzz"))// if(updateEvent.equals("prepare_update")) commented on 17 jul 2012 due to enable check box on adhoc select on edit option
                  {
                  %>
        			<html:hidden property="isAdhoc" styleId="isAdhoc" value="<%=formObj.getIsAdhoc()%>"/> 
        			<%if(formObj.getIsAdhoc().equals("on")) { %>
                  <input type="checkbox" id="checkAdhoc" name="checkAdhoc" checked="checked" disabled="disabled"/>
                  <%}else if(formObj.getIsAdhoc().equals("N")){ %>
                  <input type="checkbox" id="checkAdhoc" name="checkAdhoc"  disabled="disabled" />
                  <%}
                  }
                  else{  %>
                  <%if(formObj.getIsAdhoc()== null || formObj.getIsAdhoc().equals("N") ||  formObj.getIsAdhoc().equals("")) {
                   %>
                   
                    <input type="checkbox" id="partyC" onclick="javascript:enbleadhoc();"></input>
									<html:hidden property="isAdhoc" styleId="isAdhoc"/>
                   
                   <!--
                   <html:checkbox property="isAdhoc" onclick="javascript : enbleadhoc(this);" value="false"/> 
                 -->
                   <%
                  }else{
                	  %>
                	   <input type="checkbox" id="partyC" onclick="javascript:enbleadhoc();"  checked="checked" ></input>
								<html:hidden property="isAdhoc" styleId="isAdhoc"/>	
                	  
                	  <!--<html:checkbox property="isAdhoc" onclick="javascript : enbleadhoc(this);" value="true"/>
                      -->
                      <%
                  }
                  
                  %>                  
                  
                  <input type="hidden" name="checkAdhoc"/>
                  <%} %>
                  </td> 
                </tr>
                  <%
                  if(updateEvent.equals("prepare_update_xxyyzz"))  { // if(updateEvent.equals("prepare_update")) commented on 17 jul 2012 due to enable check box on adhoc select on edit option
                  %>
                  <html:hidden property="isAdhocToSum" styleId="isAdhocToSum"/>
                  <tr class="odd" id="adhoc" style="background:transparent;height:auto;border:0 none;display:none;">
                  <td class="fieldname">Whether  adhoc limit needs to be added in Total Sanctioned amount </td>
                  <td> <%System.out.println("formObj.getIsAdhocToSum()"+formObj.getIsAdhocToSum()); %>
                  <%
                  if(formObj.getIsAdhoc()!=null && formObj.getIsAdhoc().equalsIgnoreCase("on")){
                  if(formObj.getIsAdhocToSum().equals("on")) { %>
                  <input type="checkbox" id="adhocToSum" name="adhocToSum" disabled="disabled" checked="checked" />
                  <%}
                  else if(formObj.getIsAdhocToSum().equals("N")){ %>
                  <input type="checkbox" id="adhocToSum" name="adhocToSum" disabled="disabled"/>
                  <%}}else{%>
                  <html:hidden property="isAdhocToSum" value=""/>
                  <input type="checkbox" id="adhocToSum" name="adhocToSum" disabled="disabled"/>
                  <%} %>
                  </td>
                  <td class="fieldname">Adhoc Limit</td>
                  <td> 
                  <%if(formObj.getIsAdhoc()!=null && formObj.getIsAdhoc().equals("N")){ %>
                  	<html:text property="adhocLmtAmount" styleId="adhocLmtAmount" maxlength="41" readonly="true"/>
                  <%}else{ %>
				    <html:text property="adhocLmtAmount" maxlength="41" styleId="adhocLmtAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
				  <%} %>
                  </td>
                  </tr>
                  <%}else{
                   %>
                   <tr class="odd" id="adhoc" style="background:transparent;height:auto;border:0 none;display:none;">
                  <td class="fieldname">Whether  adhoc limit needs to be added in Total Sanctioned amount </td>
                  <td> <html:checkbox property="isAdhocToSum" styleId="isAdhocToSum" /><html:errors property="isAdhocToSum"/></td>
                  <td class="fieldname">Adhoc Limit</td>
				  <td><html:text property="adhocLmtAmount" maxlength="41" onkeyup="onKeyUpEvent(this);" styleId="adhocLmtAmount" onblur="onBlurEvent(this); convertToINR(); javascript:formatAmountAsCommaSeparated(this)"/><html:errors property="adhocLmtAmount"/></td>
                  </tr>
                   <%} %>
                  
                
<tr class="even">
    <td class="fieldname" width="20%">Sub Limit</td>
    <td width="30%">
        <html:radio property="limitType" styleId="limitType" value="Yes" onclick="javascript : enbleGnt(this);"  />&nbsp;Yes&nbsp;
        <html:radio property="limitType" styleId="limitType" value="No" onclick="javascript : enbleGnt(this);" />&nbsp;No&nbsp;
        &nbsp;<html:errors property="limitType"/>
    </td>
    <td class="fieldname" width="20%">Guarantee&nbsp;</td>
    <td width="30%" >        
       <html:radio property="guarantee" styleId="guarantee" value="Yes" onclick="javascript : enbleGuarantee(this);"  />&nbsp;Yes&nbsp;
       <html:radio property="guarantee" styleId="guarantee" value="No" onclick="javascript : enbleGuarantee(this);"  />&nbsp;No&nbsp;
         &nbsp;<html:errors property="guarantee"/>
    </td>
</tr>
     <tr class="even" id="guaranteeNo" style="background:transparent;height:auto;border:0 none;display:none;">
                  <td class="fieldname" width="20%">Facility Name <font color="#FF0000">*</font> </td>
                  <td width="30%"> <html:select property="mainFacilityId" styleId="mainFacilityId" value="<%=formObj.getMainFacilityId() %>" >
						<option value="">Please Select </option>                     
						<html:options  collection ="subFacNameList" labelProperty ="label" property ="value" />								                   
					</html:select>
              &nbsp;<html:errors property="subFacilityName"/>     </td>
                  <td class="fieldname" width="20%">&nbsp;</td>
                  <td width="30%">&nbsp; </td>
      </tr>
     <tr class="even" id="guaranteeYes" style="background:transparent;height:auto;border:0 none;display:none;">
                  <td class="fieldname" width="20%">Party Name <font color="#FF0000">*</font> </td>
                  <td width="30%"><html:select property="subPartyName" styleId="subPartyName" value="<%=formObj.getSubPartyName() %>" 
                  																onchange="javascript : refreshLiabilityID(this);"  >	
              <option value="">Please Select </option>                     
						<html:options  collection ="subPartyNameList" labelProperty ="label" property ="value" />								                   
					</html:select> <html:errors property="subPartyName"/>    </td>
              <td class="fieldname" width="20%">Liability ID<font color="#FF0000">*</font></td>
                  <td width="30%">
                  <html:select property="liabilityID" styleId="liabilityID" value="<%=formObj.getLiabilityID() %>" >
              <option value="">Please Select </option>                     
						<html:options  collection ="liabilityIDList" labelProperty ="label" property ="value" />								                   
					</html:select> <html:errors property="liabilityID"/> 
              </td>
     </tr>
     
<tr class="even">
     <tr class="even">
                  <td class="fieldname" width="20%">Sanctioned Amount<font color="#FF0000">*</font> </td>
                  <td width="30%"><html:text property="requiredSecCov" maxlength="41" styleId="requiredSecCov" 
                  onkeyup="onKeyUpEvent(this);" onblur="onBlurEvent(this); convertToINR(); javascript:formatAmountAsCommaSeparated(this);" />
                  &nbsp; &nbsp;             
                  <html:errors property="requiredSecCov" /></td>
                  <td class="fieldname" width="20%">Releasable Amount</td>
                   <td width="30%"><html:text  property="releasableAmount" onkeyup="onKeyUpEvent(this);" maxlength="41" styleId="releasableAmount" onblur="onBlurEvent(this); checkAmount(); javascript:formatAmountAsCommaSeparated(this)"/>
  &nbsp;<html:errors property="releasableAmount"/>
                    &nbsp; </td></tr>
		<tr class="odd">
		  <td class="fieldname">Sanctioned Amount (INR)</td>
		  <td><input type="text" id="inrValue" name="inrValue" maxlength="41" readonly="readonly" value="<%=UIUtil.formatWithCommaAndDecimal((String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue")) %>"/> &nbsp;</td>
		  <td class="fieldname">Released</td>
          <td width="30%"><html:text  property="totalReleasedAmount" styleId="totalReleasedAmount" readonly="true"/> &nbsp;<html:errors property="totalReleasedAmount" /></td> 	
		</tr>	
</tr>

</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<logic:notEmpty name="LmtDetailForm" property="showSublist" scope="request">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td colspan="2"><h3>Line Details</h3></td>
        </tr>
        <tr>
        <td align="left">
        	<html:errors property="lineDetailsError" />
        </td>
            <td align="right" valign="baseline" id="button">
            
			<%if(isCPUMakerI) {%>
            	<input class="btnNormal" type="button" name="btnAddXRef" id="btnAddXRef" value="Add Line Details" disabled="disabled"/>&nbsp;
            <%}else{ %>
			
             <% if(formObj.getIsReleased()==null || formObj.getIsReleased().equals("")){%>
								
				 <input class="btnNormal" type="button" name="btnAddXRef" id="btnAddXRef" value="Add Line Details" disabled="disabled" onclick="javascript:createXRef('<%=fcunsSystem%>','<%=ubslimitSystem%>')"/>&nbsp;				
								<% }else if(formObj.getIsReleased().equals("Y")){%>
								 <input class="btnNormal" type="button" id="btnAddXRef" name="btnAddXRef" disabled="disabled" value="Add Line Details" onclick="javascript:createXRef('<%=fcunsSystem%>','<%=ubslimitSystem%>')"/>&nbsp;
								<%} else if(formObj.getIsReleased().equals("N")){%>
								 <input class="btnNormal" type="button" id="btnAddXRef" name="btnAddXRef" disabled="disabled" value="Add Line Details" disabled="disabled" onclick="javascript:createXRef('<%=fcunsSystem%>','<%=ubslimitSystem%>')"/>&nbsp;
								<%} %>
            
               <%} %>
                <!-- <input class="btnNormal" type="button" name="btnDelXRef" value="Remove" onclick="javascript:deleteXRef()"/> -->
            </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead>
                        <tr>
                            <td width="2%">Serial No.</td>
                            <td width="18%">Interest Rate</td>
                            <td width="15%">Released Amount</td>
                            <td width="15%">Released Date</td>
                            <td width="16%">Utilized Amount</td>
							<td width="16%">Undrawn Limit</td>	
							<td width="8%">Status </td>	
                            <td width="9%">Action</td> 
                           <!-- <td width="9%">Delete</td> -->
                        </tr>
                    </thead>
                    <tbody>
                    <%BigDecimal totalReleasedAmount = new BigDecimal("0"); %>
                        <logic:present name="LmtDetailForm" property="acntRefSummaryList" scope="request">
                            <bean:define id="acntrefSize" value="<%= String.valueOf(formObj.getAcntRefSummaryList().size()) %>"/>
                            <logic:notEqual name="acntrefSize" value="0">
                            
                                <logic:iterate id="acntrefitm" indexId="acntrefind" name="LmtDetailForm" property="acntRefSummaryList" scope="request"
                                               type="com.integrosys.cms.app.limit.bus.ILimitSysXRef">
                                    <%
                                    String headerClass = "index";
                                    ICustomerSysXRef acntRef = acntrefitm.getCustomerSysXRef();
                                    if (acntrefitm instanceof CompareResult) {
                                        acntRef = ((ILimitSysXRef) ((CompareResult) acntrefitm).getObj()).getCustomerSysXRef();
                                        headerClass = ((CompareResult) acntrefitm).getKey();
                                    } else {
                                        acntRef = ((ILimitSysXRef) acntrefitm).getCustomerSysXRef();
                                    } 
                                    
                                    BigDecimal undrawnAmount = new BigDecimal("0");
                                    undrawnAmount = new BigDecimal((acntRef.getReleasedAmount().replaceAll(",", ""))).subtract(new BigDecimal(((acntRef.getUtilizedAmount().replaceAll(",", "")).trim())));
                                    totalReleasedAmount = totalReleasedAmount.add(new BigDecimal((acntRef.getReleasedAmount().replaceAll(",", ""))));
                                    System.out.println("acntRef.getSerialNo():"+acntRef.getSerialNo()+":"+ acntRef.getAction()+":"+acntRef.getCloseFlag()+":"+acntRef.getStatus()+" System:"+ acntRef.getFacilitySystem());
                                    
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
                                    <%if(!"HIDE".equalsIgnoreCase(acntRef.getStatus())){%>
                                    <tr class="<%=(acntrefind.intValue() + 1)%2==0?"even":"odd"%>">
                                        <td class="index">
                                        <%if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(acntRef.getAction())){ %>
                                        &nbsp;-
                                        <%}else{ %>
                                            &nbsp;<integro:empty-if-null value="<%=acntRef.getSerialNo()%>"/>
                                            <%} %>
                                        </td>
                                         <% 
                                         if(acntRef.getInterestRateType() != null) {
	                                        if(acntRef.getInterestRateType().equals("fixed")) {%>
	                                        <td>
	                                            &nbsp;<integro:empty-if-null value="<%= acntRef.getIntRateFix() %>"/>
	                                        </td>
	                                        <%}else { %>
	                                        <td>
	                                        <% if(acntRef.getIntRateFloatingMarginFlag() != null && acntRef.getIntRateFloatingMarginFlag().equals("-")){%>
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
                                            &nbsp;<integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(acntRef.getReleasedAmount())%>"/>
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
                                      <%if(null!=acntRef.getFacilitySystem() && (acntRef.getFacilitySystem().equals(fcunsSystem) || acntRef.getFacilitySystem().equals(ubslimitSystem))){ 
                                        if("".equals(serialNo)){%>
                                        <select name="select2"
												onchange="javascript:updateXRef(this.value,'<%= index %>','<%=String.valueOf(acntRef.getXRefID())%>','<%=fcunsSystem%>','<%=ubslimitSystem%>','<%=sessionCriteria%>')">
												<option value="">Please Select</option>
												<option value="view">View</option>
												<%if(!isCPUMakerI) {%>
												
												<%if(ICMSConstant.FCUBS_STATUS_REJECTED.equals(acntRef.getStatus())){
												if(ICMSConstant.FCUBSLIMIT_ACTION_MODIFY.equals(acntRef.getAction()) || ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(acntRef.getAction())){ %>
												<option value="edit">Edit</option>
												<%} %>
												<%if(ICMSConstant.FCUBSLIMIT_ACTION_REOPEN.equals(acntRef.getAction())){ %>
													<option value="reopen">Reopen</option>
												<%} %>
												<%if(ICMSConstant.FCUBSLIMIT_ACTION_CLOSE.equals(acntRef.getAction())){ %>
													<option value="close">Close</option>
												<%} }else if(ICMSConstant.FCUBS_STATUS_SUCCESS.equals(acntRef.getStatus())){
													if(!"Y".equals(acntRef.getCloseFlag())){ %>
													<option value="edit">Edit</option>
													<%} %>
													<%if("Y".equals(acntRef.getCloseFlag())){ %>
														<option value="reopen">Reopen</option>
													<%} %>
													<%if(!"Y".equals(acntRef.getCloseFlag())){ %>
														<option value="close">Close</option>
													<%}} 	 else if("PENDING_UPDATE".equals(acntRef.getStatus())){
														if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(acntRef.getAction())){ %>
														<option value="edit">Edit</option>
														<%} if(ICMSConstant.FCUBSLIMIT_ACTION_MODIFY.equals(acntRef.getAction())){ %>
														<option value="edit">Edit</option>
														<%}if(ICMSConstant.FCUBSLIMIT_ACTION_REOPEN.equals(acntRef.getAction())){ %>
															<option value="reopen">Reopen</option>
														<%}if(ICMSConstant.FCUBSLIMIT_ACTION_CLOSE.equals(acntRef.getAction())){ %>
															<option value="close">Close</option>
														<%}}else if(null == acntRef.getStatus()){ %>
												<option value="edit">Edit</option>
												<option value="close">Close</option>
												<%}}%>
											</select>
											
											<%}else {%>
											<select name="select2"
												onchange="javascript:updateXRef(this.value,'<%= index %>','<%=String.valueOf(acntRef.getXRefID())%>','<%=fcunsSystem%>','<%=ubslimitSystem%>','<%=sessionCriteria%>')">
												<option value="">Please Select</option>
												<option value="view">View</option>
												<%if(!isCPUMakerI) {%>
												<%if(ICMSConstant.FCUBS_STATUS_REJECTED.equals(acntRef.getStatus())){
													if(ICMSConstant.FCUBSLIMIT_ACTION_MODIFY.equals(acntRef.getAction()) || ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(acntRef.getAction())){ %>
												
												<option value="edit">Edit</option>
												<%}if(ICMSConstant.FCUBSLIMIT_ACTION_REOPEN.equals(acntRef.getAction()) ){ %>
													<option value="reopen">Reopen</option>
												<%}if(ICMSConstant.FCUBSLIMIT_ACTION_CLOSE.equals(acntRef.getAction())){ %>
													<option value="close">Close</option>
												<%}}else if(ICMSConstant.FCUBS_STATUS_SUCCESS.equals(acntRef.getStatus())){
													if(!"Y".equals(acntRef.getCloseFlag())){ %>
													<option value="edit">Edit</option>
													<%}if("Y".equals(acntRef.getCloseFlag())){ %>
														<option value="reopen">Reopen</option>
													<%}if(!"Y".equals(acntRef.getCloseFlag())){ %>
														<option value="close">Close</option>
													<%}}	 else if("PENDING_UPDATE".equals(acntRef.getStatus())){
												if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(acntRef.getAction())){ %>
												<option value="edit">Edit</option>
												<%} if(ICMSConstant.FCUBSLIMIT_ACTION_MODIFY.equals(acntRef.getAction())){ %>
												<option value="edit">Edit</option>
												<%}if(ICMSConstant.FCUBSLIMIT_ACTION_REOPEN.equals(acntRef.getAction())){ %>
													<option value="reopen">Reopen</option>
												<%}if(ICMSConstant.FCUBSLIMIT_ACTION_CLOSE.equals(acntRef.getAction())){ %>
													<option value="close">Close</option>
												<%}}else if(null == acntRef.getStatus()){ %>
												<option value="edit">Edit</option>
												<option value="close">Close</option>
												<%}}%>
											</select>
											<%}}else{ %>
											<select name="select2"
												onchange="javascript:updateXRef(this.value,'<%= index %>',
												'<%=String.valueOf(acntRef.getXRefID())%>','<%=fcunsSystem%>','<%=ubslimitSystem%>','<%=sessionCriteria%>')">
												<option value="">Please Select</option>
												<option value="view">View</option>
												<%if(!isCPUMakerI) {%>
												<option value="edit">Edit</option>
												<%} %>
											</select>
											<%} %>
                                       </td> 
                                    </tr>
                                      <%} %>
                                </logic:iterate>
                                <script language="javascript">
                                //	document.forms[0].totalReleasedAmount.value ='<%= totalReleasedAmount %>';
                                
                                //Phase 3 CR:comma separated
                                document.forms[0].totalReleasedAmount.value ='<%= UIUtil.formatWithCommaAndDecimal(totalReleasedAmount.toString()) %>';
								</script>
                            </logic:notEqual>
                            <logic:equal name="acntrefSize" value="0">
                                <tr class="odd">
                                    <td colspan="9">There is no line for facility.</td>
                                </tr>
                            </logic:equal>
                        </logic:present>
                        <logic:notPresent name="LmtDetailForm" property="acntRefSummaryList" scope="request">
                            <tr class="odd">
                                <td colspan="9">There is no line for facility.</td>
                            </tr>
                        </logic:notPresent>
                    </tbody>
                </table>
                <script language="javascript">
                <% System.out.println("formObj.getSyndicateLoan() :--------"+formObj.getSyndicateLoan()); %>
                 <% if(formObj.getLimitType() == null || formObj.getLimitType().equals("")
                		 || formObj.getLimitType().equals("No")){%>		
					document.forms[0].limitType[1].checked =true;
					document.forms[0].guarantee[0].disabled =true;
					document.forms[0].guarantee[1].disabled =true;
				<%} 
                 System.out.println("formObj.getIsAdhoc() :");                 
                 if(formObj.getIsAdhoc()!= null){
                	 System.out.println("formObj.getIsAdhoc() :--------"+formObj.getIsAdhoc()); 
                 %>		
                 
                 	document.getElementById('adhoc').style.display = ''
				<%}
				if(formObj.getLimitType() != null && formObj.getLimitType().equals("Yes")){
					if(formObj.getGuarantee() != null && formObj.getGuarantee().equals("Yes")) {
				%>		
				document.getElementById('guaranteeYes').style.display = ''
		        document.getElementById('guaranteeNo').style.display = 'none'
			<%}	if(formObj.getGuarantee() != null && formObj.getGuarantee().equals("No")) { %>
				document.getElementById('guaranteeYes').style.display = 'none'
		        document.getElementById('guaranteeNo').style.display = ''
			<%	} 
			} if(formObj.getSyndicateLoan() == null || formObj.getSyndicateLoan().equals("No") || formObj.getSyndicateLoan().equals("")) { %>
			 <% System.out.println("formObj.getSyndicateLoan()111 :--------"+formObj.getSyndicateLoan()); %>
					document.forms[0].syndicateLoan[1].checked = true;
					 <%}
				 if(null != formObj.getSyndicateLoan() && formObj.getSyndicateLoan().equals("Yes")) { %>
					document.forms[0].syndicateLoan[0].checked = true;
					<%} %>
					
		
				</script>
            </td>
        </tr>
    </tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <thead>
        <tr>
            <td colspan="2"><h3>Limit Security Mapping</h3></td>
        </tr>
        <tr>
        <td align="left">
        	<html:errors property="securityMappingDetailsError" />
        </td>
            <td align="right" valign="baseline">
              <% if(formObj.getIsSecured()==null || formObj.getIsSecured().equals("")){%>
						<input class="btnNormal" type="button" id="btnAddLmtSec" name="btnAddLmtSec" value="Add New Security" disabled="disabled" onclick="javascript:createLmtSec()"/>&nbsp;		
				 			
								<% }else if(formObj.getIsSecured().equals("Y")){%>
                                   <input class="btnNormal" type="button" id="btnAddLmtSec" name="btnAddLmtSec" value="Add New Security" disabled="disabled" onclick="javascript:createLmtSec()"/>&nbsp;							

								<%} else if(formObj.getIsSecured().equals("N")){%>
								<input class="btnNormal" type="button" id="btnAddLmtSec" name="btnAddLmtSec" value="Add New Security" disabled="disabled" onclick="javascript:createLmtSec()"/>&nbsp;
							
								<%} %>
                <!--<input class="btnNormal" type="button" name="btnDelLmtSec" value="Remove" onclick="javascript:deleteLmtSec()"/>
            --></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                    <thead>
                        <tr>
                            <td width="2%">S/N</td>
                            <td width="22%">Source Security ID</td>
                            <td width="16%">Collateral Code-Name</td>
                            <td width="16%">Security Type</td>
                            <td width="16%">Security Sub-Type</td>
                            <td width="16%">Security Coverage %</td>
                            <td width="10%">Action</td>
                        </tr>
                    </thead>
                    <tbody>
                        <logic:present name="LmtDetailForm" property="lmtSecSummaryList" scope="request">
                            <bean:define id="lmtsecSize" value="<%= String.valueOf(formObj.getLmtSecSummaryList().size()) %>"/>
                            <logic:notEqual name="lmtsecSize" value="0">
                                <logic:iterate id="lmtsecitm" indexId="lmtsecind" name="LmtDetailForm" property="lmtSecSummaryList" scope="request"
                                               type="com.integrosys.cms.ui.manualinput.limit.LmtSecSummaryItem">
                                    <tr class="<bean:write name="lmtsecitm" property="rowClass" />">
                                        <td class="<bean:write name="lmtsecitm" property="headerClass" />">
                                            <%= lmtsecind.intValue() + 1 %>											
                                        </td>
                                        <td>
                                            &nbsp;<bean:write name="lmtsecitm" property="sciSecurityId"/>
                                        </td>
                                        <td>
                                            &nbsp;
                                            <% if(collateralMap!=null){if(lmtsecitm.getCollateralId()!=null){%>
                                           <integro:empty-if-null value="<%=collateralMap.get(lmtsecitm.getCollateralId()) %>"/>
                                            <%}} %>
                                        </td>
                                        <td>
                                            &nbsp;<bean:write name="lmtsecitm" property="securityType"/>
                                        </td>
                                        <td>
                                            &nbsp;<bean:write name="lmtsecitm" property="securitySubType"/>
                                            <%
                                            String str = lmtsecitm.getSecurityType() + "," +lmtsecitm.getSecuritySubType()+ "," +lmtsecitm.getSciSecurityId();
                                            %>
                                            
                                            <html:hidden property="securityTypeSubType" value="<%=str %>"/>
                                        </td>
                                        <td>
                                        	<%
                                        	if(lmtsecitm.getLmtSecurityCoverage() == null || lmtsecitm.getLmtSecurityCoverage().equals("")){
                                        		lmtsecitm.setLmtSecurityCoverage("0");
                                        	}
                                            %>
                                            &nbsp;<html:text  property="securityCoverage" disabled="true" value="<%=lmtsecitm.getLmtSecurityCoverage() %>"/>
                                        </td>
                                        <td>
                                            <select name="secOption" disabled="disabled" onchange="javascript:deleteLmtSec('<%= lmtsecind.toString() %>', this.value,'<%= lmtsecitm.getSciSecurityId() %>' ,'<%= lmtsecitm.getSecuritySubType() %>' ,this)" id="secOption[<%= lmtsecind.toString()%>]" >
                                            <option value="">Please Select</option>
                                            <option value="Delete">Delete</option>
                                            <option value="View">View</option>
                                            </select>
                                            &nbsp;
                                       
                                        </td>
                                    </tr>
                                </logic:iterate>
                            </logic:notEqual>
                            <tr><td colspan="7"><html:errors property="securityCoverage"/></td></tr>
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
				<html:errors property="secNotReq"/>
				  <html:hidden property="deletedLmtSec" value=""/>    
             <html:hidden property="securityIdDel" value=""/>
             <html:hidden property="isFromCamonlineReq" />
             
            </td>
        </tr>
    </tbody>
</table>
<%if(!"Y".equals(isCreate)){ %>
<!--Start: Uma:Phase 3 CR :Limit Calculation Dashboard -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
<td colspan="2"><h3>Limit Calculation:</h3>&nbsp;</td>
 </tr>
 <tr>
  <td > 
            <input class="btnNormal" type="button" name="limitCalculation" value="Limit Calculation" onclick="javascript:limitCalculationDashboard()" id="limitCalculation" disabled="disabled"/>&nbsp;
</td>
 </tr>
</thead>
</table>
<!--End: Uma:Phase 3 CR :Limit Calculation Dashboard -->
<%} %>
</logic:notEmpty>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <tr><td>&nbsp;</td></tr>
    <logic:equal name="itrxValue" property="status" value="<%= ICMSConstant.STATE_REJECTED %>">
        <tr>
            <td colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                    <tbody>
                        <tr>
                            <td class="fieldname">Remarks</td>
                            <td class="odd">
                                <html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
                                <html:errors property="remarks"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="fieldname">Last Action By</td>
                            <td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
                        </tr>
                        <tr class="odd">
                            <td class="fieldname">Last Remarks Made</td>
                            <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </logic:equal>
     <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr> 
      <tr>
       <td> <jsp:include page="view_audit_details.jsp"></jsp:include></td>
      </tr> 
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="javascript:submitLimit(<%=isLmtSecChange%>,<%=adhocVal%>);"><img src="img/submit1.gif" name="Image41" border="0" id="Image3"/></a></td>
        <td><a href="javascript:saveLimit()"><img src="img/save1.gif" name="Image41" border="0" id="Image4"/></a></td>
        <td><a href="javascript:cancelSubmit('<%=sessionCriteria%>')"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a></td>
    </tr>
    <tr>
        <td colspan="3">&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>