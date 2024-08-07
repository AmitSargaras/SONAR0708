<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 java.util.*"%>
<%@page import="com.integrosys.cms.app.limit.trx.ILimitTrxValue"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitSysXRef"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICustomerSysXRef"%>
<%@page import="com.integrosys.cms.app.customer.bus.OBCustomerSysXRef"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%@page import="org.apache.struts.util.LabelValueBean"%><html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>
<%
Map lbValMap=(Map)request.getAttribute("viewSecurityMap");
XRefDetailForm frm=(XRefDetailForm)request.getAttribute("XRefDetailForm");
String sec1=(String)lbValMap.get(frm.getSecurity1());
String sec2=(String)lbValMap.get(frm.getSecurity2());
String sec3=(String)lbValMap.get(frm.getSecurity3());
String sec4=(String)lbValMap.get(frm.getSecurity4());
String sec5=(String)lbValMap.get(frm.getSecurity5());
String sec6=(String)lbValMap.get(frm.getSecurity6());

String sec1Obj="";
String sec2Obj="";
String sec3Obj="";
String sec4Obj="";
String sec5Obj="";
String sec6Obj="";

String internalRemarks =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.internalRemarks");
String scmFlag =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.scmFlag");
String revolvingLine =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.revolvingLine");
String linecurrency =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.linecurrency");
String currencyRestriction =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currencyRestriction");
String intradayLimit =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.intradayLimit");
String scfStatus=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.scfStatus");
System.out.println("<<<<<<<----------------SCF STATUS LINE------------->>>>>>>>>>>>>>>");
String scfErrMsg=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.scfErrMsg");
String scfFlag=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.scfFlag");

String responseDate=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.responseDate");
String requestDate=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.requestDate");
String radioInterfaceCompleted=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.radioInterfaceCompleted");


System.out.println("internalRemarks:"+internalRemarks+" currencyRestrictionREADDTLS:"+currencyRestriction);
System.out.println("revolvingLine:"+revolvingLine+" linecurrency:"+linecurrency+" intradayLimit:"+intradayLimit);

 ILimitTrxValue lmtTrxObj = (ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
 
 String status = (String)request.getAttribute("status");
 String from_event = (String)request.getAttribute("from_event");
 System.out.println("<<<<<<<<<from_event>>>>>>>>"+from_event);
 String isModify="NO";
 System.out.println("<<<<<<<<<status>>>>>>>>"+status);
 ICustomerSysXRef obj=new OBCustomerSysXRef();
  
 SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy"); 
 
 if(lmtTrxObj!= null && lmtTrxObj.getLimit()!= null){
 	System.out.println("111");
 	boolean flag = false;
 	long SID=0;
 	ILimitSysXRef[] refArr = lmtTrxObj.getLimit().getLimitSysXRefs();
 	ILimitSysXRef[] refStageArr = lmtTrxObj.getStagingLimit().getLimitSysXRefs();
 int cnts = 0; 
 	if(null!=refStageArr){
		for(int k=0;k<refStageArr.length;k++){
		 System.out.println("<<<<<<<<<refStageArr[k].getCustomerSysXRef().getAction()>>>>>>>>"+refStageArr[k].getCustomerSysXRef().getAction());	
		 if(null!=refStageArr[k].getCustomerSysXRef() && 
				 "PENDING_UPDATE".equals(refStageArr[k].getCustomerSysXRef().getStatus())){
			 SID=refStageArr[k].getSID();
			  cnts = k; 
			 System.out.println("SID in refStageArr:"+SID);
		 }
		}
 	}
	
	if (refArr != null) {
		for(int i=0;i<refArr.length;i++){
			if(refArr[i].getCustomerSysXRef()!=null && refArr[i].getSID()==SID){
				isModify="YES";
				obj=refArr[i].getCustomerSysXRef();
				
				 sec1Obj=(String)lbValMap.get(obj.getSecurity1());
				 sec2Obj=(String)lbValMap.get(obj.getSecurity2());
				 sec3Obj=(String)lbValMap.get(obj.getSecurity3());
				 sec4Obj=(String)lbValMap.get(obj.getSecurity4());
				 sec5Obj=(String)lbValMap.get(obj.getSecurity5());
				 sec6Obj=(String)lbValMap.get(obj.getSecurity6());
				 //obj.setIdlEffectiveFromDate(refStageArr[cnts].getCustomerSysXRef().getIdlEffectiveFromDate());
				 //obj.setIdlExpiryDate(refStageArr[cnts].getCustomerSysXRef().getIdlExpiryDate());
				// obj.setIdlAmount(refStageArr[cnts].getCustomerSysXRef().getIdlAmount()); 
			}
		}
	}
 }
 
 System.out.println("frm.getSerialNo():"+frm.getSerialNo()+" obj.getSerialNo():"+obj.getSerialNo()+" obj.getUploadDate():"+obj.getUploadDate()+"frm.getUploadDate():"+frm.getUploadDate()+"obj.getIsCapitalMarketExposer():"+obj.getIsCapitalMarketExposer()+"frm.getIsCapitalMarketExposer():"+frm.getIsCapitalMarketExposer());
 System.out.println("obj.getReleaseDate():"+obj.getReleaseDate()+"frm.getReleaseDate():"+frm.getReleaseDate());
    System.out.println("<<<<<<<<<isModify>>>>>>>>"+isModify);
 	List branchAllowedList= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.branchAllowedList");
 	String branchAllowed=obj.getBranchAllowed();;
	List actualBranchAllowedList=new ArrayList();
	
	if(null!=branchAllowed && null!=branchAllowedList) {
		List<String> items = Arrays.asList(branchAllowed.split(","));
	 	for(int i=0;i<branchAllowedList.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)branchAllowedList.get(i);
	 		if(items.contains(lvBean.getValue())) {
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			actualBranchAllowedList.add(lvBean1);
	 
	 		}
	 	}
	}
	pageContext.setAttribute("actualBranchAllowedList",actualBranchAllowedList);
	
	List productAllowedList= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.productAllowedList");
	String productAllowed=obj.getProductAllowed();
	List actualProductAllowedList=new ArrayList();
	
	if(null!=productAllowed && null!=productAllowedList) {
		List<String> items = Arrays.asList(productAllowed.split(","));
	 	for(int i=0;i<productAllowedList.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)productAllowedList.get(i);
	 		if(items.contains(lvBean.getValue())) {
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			actualProductAllowedList.add(lvBean1);
	 
	 		}
	 	}
	}
	pageContext.setAttribute("actualProductAllowedList",actualProductAllowedList);
	
	List currencyAllowedList= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currencyAllowedList");
	String currencyAllowed=obj.getCurrencyAllowed();
	List actualCurrencyAllowedList=new ArrayList();
	
	if(null!=currencyAllowed && null!=currencyAllowedList) {
		List<String> items = Arrays.asList(currencyAllowed.split(","));
	 	for(int i=0;i<currencyAllowedList.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)currencyAllowedList.get(i);
	 		if(items.contains(lvBean.getValue())) {
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			actualCurrencyAllowedList.add(lvBean1);
	 
	 		}
	 	}
	}
	pageContext.setAttribute("actualCurrencyAllowedList",actualCurrencyAllowedList);
	
	List udfLbValList =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.udfLbValList");
	String udfAllowed=obj.getUdfAllowed();
	List actualUdfLbValList=new ArrayList();
	
	if(null!=udfAllowed && null!=udfLbValList) {
		List<String> items = Arrays.asList(udfAllowed.split(","));
	 	for(int i=0;i<udfLbValList.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)udfLbValList.get(i);
	 		if(items.contains(lvBean.getValue())) {
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			actualUdfLbValList.add(lvBean1);
	 
	 		}
	 	}
	}
	pageContext.setAttribute("actualUdfLbValList",actualUdfLbValList);
	
	List udfLbValList_2 =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.udfLbValList_2");
	String udfAllowed2=obj.getUdfAllowed_2();
	List actualUdfLbValList2=new ArrayList();
	
	if(null!=udfAllowed2 && null!=udfLbValList) {
		List<String> items = Arrays.asList(udfAllowed2.split(","));
	 	for(int i=0;i<udfLbValList.size();i++) {
	 		LabelValueBean lvBean=(LabelValueBean)udfLbValList.get(i);
	 		if(items.contains(lvBean.getValue())) {
	 			LabelValueBean lvBean1 = new LabelValueBean(lvBean.getLabel(), lvBean.getValue());
	 			actualUdfLbValList2.add(lvBean1);
	 
	 		}
	 	}
	}
	pageContext.setAttribute("actualUdfLbValList2",actualUdfLbValList2);
	
	
	 

List fccBranchList= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.fccBranchList");
pageContext.setAttribute("fccBranchList",fccBranchList);

	String liabBranch="-";
	for(int i=0;i<fccBranchList.size();i++) {
		LabelValueBean lvBean=(LabelValueBean)fccBranchList.get(i);
		if(null!=obj.getLiabBranch() && obj.getLiabBranch().equals(lvBean.getValue())) {
			liabBranch = lvBean.getLabel();
			System.out.println("<<<<<<liabBranch>>>>>>>"+liabBranch);
		}
	}

 
  
List branchAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.branchAllowedList1");
pageContext.setAttribute("branchAllowedList1",branchAllowedList1);
List productAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.productAllowedList1");
pageContext.setAttribute("productAllowedList1",productAllowedList1);
List currencyAllowedList1= (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.currencyAllowedList1");
pageContext.setAttribute("currencyAllowedList1",currencyAllowedList1);
 
 //added by santosh
 List udfLbValList1 =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.udfLbValList1");
 pageContext.setAttribute("udfLbValList1",udfLbValList1);
 //end santosh
 
 List udfLbValList1_2 =(List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.udfLbValList1_2");
 pageContext.setAttribute("udfLbValList1_2",udfLbValList1_2);

 System.out.println("frm limit start date:"+frm.getLimitStartDate()+" "+frm.getDateOfReset());

System.out.println("frm.getCurrencyRestriction():"+frm.getCurrencyRestriction()+" close Flag:"+frm.getCloseFlag()+" liab branch:"+frm.getLiabBranch());
 
 
List restCoBorrowerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCoBorrowerList");

if (!(restCoBorrowerList == null)) {
		//System.out.println("restCoBorrowerList size="+restCoBorrowerList.size());
		pageContext.setAttribute("restCoBorrowerList", restCoBorrowerList);
	}else {
		restCoBorrowerList = new ArrayList();
	pageContext.setAttribute("restCoBorrowerList", new ArrayList());
	}

   
int vno = 0;
 
 %>

<body onload="MM_preloadImages('img/return2.gif')">
 <script language="javascript">
 
  

   function cancelSubmit()
   {
	   if(document.forms[0].fromEvent.value == 'update'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=track"+ "&trxID="+ document.forms[0].trxID.value ;
		    document.forms[0].submit();
	   }
	   if(document.forms[0].fromEvent.value == 'view'){
			document.forms[0].event.value = 'cancel';
			document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'custread'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=show_lmt_cust_detail";
		   document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'prepare_cust_update'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimit.do?event=prepare_cust_update";
		   document.forms[0].submit();
	   }
	   
	   if(document.forms[0].fromEvent.value == 'read'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=show_lmt_detail";
		   document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'process'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=process"+ "&trxID="+document.forms[0].trxID.value;
		    document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'prepare_close'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=prepare_close"+ "&trxID="+document.forms[0].trxID.value;
		    document.forms[0].submit();
		}

	   if(document.forms[0].fromEvent.value == 'prepare_delete'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=del_limit";
		    document.forms[0].submit();
		}
		
	   if(document.forms[0].fromEvent.value == 'track'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=track"+ "&trxID="+ document.forms[0].trxID.value ;
		    document.forms[0].submit();
	   }
	
   }
	
   function refreshHostSystem(dropdown)
   {
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
        }	
        var dep = 'hostSystemName';
        var url = '/cms/MIAcntDetail.do?event=refresh_hostsyscountry&hostSystemCountry='+curSel;
        sendLoadDropdownReq(dep, url);
   }	



   function JumpOnSelect(selectObj)
   {
     		var selectIndex = selectObj.selectedIndex;
   		
   		//Process Customer
   		if (selectObj.options[selectIndex].value == 1)
   		window.location.href('../customer/CustDetails(mode=view,cpcMaker).htm');
   		
   		//View Limits
   		else if (selectObj.options[selectIndex].value == 2)
   		window.location.href('searchLimit(SACmaker,result).htm');
   		
   		/*View Sec Coverage
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Collateral/ViewSecurityCoverageContainer.htm');*/
   		
   		//View Securities
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Deal/Dealframe(GMRA,MRmaker).htm');
   		
   		//View Valuation
   		else if(selectObj.options[selectIndex].value == 4)
   		parent.window.location.href('../Valuation/Valuationframe(MRmaker).htm');
   		
   		//Maintain Security Checklist
   		else if(selectObj.options[selectIndex].value == 5)
   		window.location.href('#');
   		
   		//Update C/C Doc Receipt
   		else if(selectObj.options[selectIndex].value == 6)
   		parent.window.location.href('../Documentation/UpCCDocReceiptContainer(cpcdocmaker).htm');
   		else if(selectObj.options[selectIndex].value == 9)
   		window.location.href('../Collateral/ViewLimitsContainer(SACmaker).htm');
   		
   }
   function shwhd(selfObj){
   	if(selfObj.value == 'fixed'){
   		document.getElementById('fixed').style.display = ''; 
   		document.getElementById('margin').style.display = 'none';
   	}else if (selfObj.value == 'floating'){
   		document.getElementById('fixed').style.display = 'none';
   		document.getElementById('margin').style.display = '';
   	}
   	
   }
   
   function viewConvenantScreen(name)
   {
   	document.forms[0].action="MIAcntDetail.do?event="+name;
       document.forms[0].submit();
   }
      
 </script>

  <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>	
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="limitProfileID"/>
  <html:hidden property="createdBy"/>
  <html:hidden property="createdOn"/>
  <html:hidden property="updatedBy"/>
  <html:hidden property="updatedOn"/>
  
  <html:hidden property="hiddenSerialNo"/>
  <html:hidden property="edited"/>
  
  <html:hidden property="indexID"/>
  <html:hidden property="isCreate"/> 
  <html:hidden property="customerID"/>
  	<input type="hidden" name="indexID" value="<%=request.getParameter("indexID") %>"/>
  	<input type="hidden" name="fromEventForLineCov" value="<%=request.getAttribute("fromEventForLineCov") %>"/>
  	<input type="hidden" name="limitId" value="<%=request.getAttribute("lmtId") %>"/>
  	<input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
    <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
	<input type="hidden" name="lineDetailId"	value="<%=(String)request.getAttribute("lineDetailId") %>" />
	<input type="hidden" name="xReferenceId"	value="<%=request.getAttribute("xReferenceId") %>" />
	<%
	System.out.println("lineDetailId=========>"+request.getAttribute("lineDetailId")); 
	System.out.println("fromEventForLineCov=========>"+request.getAttribute("fromEventForLineCov")); 
	System.out.println("request.getParameter(fromEventForLineCov)=========>"+request.getParameter("fromEventForLineCov")); 
	System.out.println("xReferenceId=========>"+request.getAttribute("xReferenceId")); 
	%>
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td><h3>Released Line Details</h3></td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
   </thead>
   <tbody>
    <tr> 
     <td>
     <%if("YES".equals(isModify) && "PENDING_UPDATE".equals(status) && "process".equals(from_event)){ %>
     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
       <thead>
       		<tr>
       		<td width="20%" class="fieldname"></td>
            <td width="15%">OLD VALUE</td>
            <td width="15%">NEW VALUE</td>
            <td width="20%" class="fieldname"></td>
            <td width="15%">OLD VALUE</td>
            <td width="15%">NEW VALUE</td>
            </tr>
       </thead> 
       <tbody>
       		<tr class="even">
         		<td width="20%" class="fieldname">System ID</td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getFacilitySystemID() %>"/></td>
                <%if(null!=frm.getFacilitySystemID() && !frm.getFacilitySystemID().equals(obj.getFacilitySystemID())){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="facilitySystemID" /></td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
                
                <td width="20%" class="fieldname">System</td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getFacilitySystem() %>"/></td>
                <%if(null!=frm.getFacilitySystem() && !frm.getFacilitySystem().equals(obj.getFacilitySystem())){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="facilitySystem" /></td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
           </tr>
           <tr class="even">
           		<td width="20%" class="fieldname">Liab Branch<font color="#FF0000">*</font> </td>
                <td width="15%">
                	<html:select property="liabBranch" disabled="true">
		      			<option value=""><%=liabBranch%></option>
                    </html:select>
                </td>
                 <%if(null!=frm.getLiabBranch() && !frm.getLiabBranch().equals(obj.getLiabBranch())){ %>
                	 <td width="15%">
                	 	<html:select property="liabBranch" disabled="true">
		      				<option value="">Please Select </option>	
                      		<html:options collection="fccBranchList" property="value" labelProperty="label"/>
                    	</html:select>
                	</td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
                
          		<td class="fieldname" width="20%"><p>Currency Restriction</p></td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getCurrencyRestriction()%>"/></td>
               
                <%if(null!=frm.getCurrencyRestriction() && !frm.getCurrencyRestriction().equals(obj.getCurrencyRestriction())){ %>
                	<td width="15%">
                		<integro:empty-if-null value="<%=frm.getCurrencyRestriction()%>"/>
                	</td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%}%> 
          </tr>
          <tr class="even">
		 		<td width="20%" class="fieldname">Line No.</td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getLineNo() %>"/></td>
                <%if(null!=frm.getLineNo() && !frm.getLineNo().equals(obj.getLineNo())){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="lineNo" /></td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>   
                
                <td width="20%" class="fieldname">Serial No.<font color="#FF0000">*</font> </td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getSerialNo() %>"/></td>
                
                <%if(null!=frm.getSerialNo() && !frm.getSerialNo().equals(obj.getSerialNo())){ %>
                <% System.out.println("frm.getAction():"+frm.getAction()+" frm.getSendToFile():"+frm.getSendToFile()+" frm.getSerialNo():"+frm.getSerialNo());
                if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(frm.getAction()) && ICMSConstant.FCUBS_STATUS_PENDING_SUCCESS.equals(frm.getStatus()) ){ %>
                <td width="15%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                <%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(frm.getAction()) && "N".equals(frm.getSendToFile()) ){ %>
                <td width="15%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                <%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(frm.getAction())) {%>
                <td width="15%"></td>
                <%}else{ %>
                <td width="15%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                <%} %>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>  
          </tr>
          <tr class="even">
		  		<td width="20%" class="fieldname">Main Line Code</td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getMainLineCode() %>"/></td>
                <%if(null!=frm.getMainLineCode() && !frm.getMainLineCode().equals(obj.getMainLineCode())){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="mainLineCode" /></td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>   
                 
                <td width="20%" class="fieldname">Currency</td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getCurrency() %>"/></td>
                <%if(null!=frm.getCurrency() && !frm.getCurrency().equals(obj.getCurrency())){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="currency" /></td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
          </tr>
          <tr class="even">
           		<td class="fieldname" width="20%">Released&nbsp; Amount <font color="#FF0000">*</font> </td>
           		<td width="15%"><integro:empty-if-null value="<%= UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(obj.getReleasedAmount()) %>"/></td>
           		<%if(null!=frm.getReleasedAmount() && ! (frm.getReleasedAmount()).equals(UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(obj.getReleasedAmount()))){ %>
             		<td width="15%"><bean:write name="XRefDetailForm" property="releasedAmount" /></td>
             	<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
             	
             	<td class="fieldname" width="20%">Utilized Amount </td>
             	<td width="15%"><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(obj.getUtilizedAmount()) %>"/></td>
             	<%if(null!=frm.getUtilizedAmount() && !(frm.getUtilizedAmount()).equals(UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(obj.getUtilizedAmount()))){ %>
             		<td width="15%"><bean:write name="XRefDetailForm" property="utilizedAmount" /></td>
             	<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
          </tr>
          <tr class="even">
                <td class="fieldname" width="20%">Released date</td>
             <%   if(null!=obj.getReleaseDate()) { %>
                <td width="15%"><integro:empty-if-null value="<%=sdf.format(obj.getReleaseDate())%>"/></td>
                <%}else{ %>
               <td width="15%"> - </td>
               <%} %>
            <%--     <% if(null!=frm.getReleaseDate() && !frm.getReleaseDate().equals(obj.getReleaseDate())){ %>
                <td><bean:write name="XRefDetailForm" property="releaseDate" /></td>
             	<%}  --%>
                <%if(null!=obj.getReleaseDate() && !(sdf.format(obj.getReleaseDate())).equals(frm.getReleaseDate())){ %>
		 		<td width="15%"><bean:write name="XRefDetailForm" property="releaseDate" /></td>
		 		<%}else if(null==obj.getReleaseDate()){ %>
		 		<td width="15%"><bean:write name="XRefDetailForm" property="releaseDate" /></td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
               
                <td class="fieldname" width="20%">Send To File</td>
                <td width="15%"><integro:empty-if-null value="<%=obj.getSendToFile()%>"/></td>
                <%if(null!=frm.getSendToFile() && !frm.getSendToFile().equals(obj.getSendToFile())){ %>
                <td width="15%">
                  <%if("N".equals(frm.getSendToFile())){%>
                   	<input type="checkbox" id="sendToFile" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="sendToFile" checked="checked" disabled="true" />
                   	<%} %>
                </td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
          </tr>
                
         <tr class="even">
		 		<td width="20%" class="fieldname">Limit Start Date<font color="#FF0000">*</font> </td>
		 		<td width="15%"><integro:empty-if-null value="<%=sdf.format(obj.getLimitStartDate())%>"/></td>
		 		<%if(null!=frm.getLimitStartDate() && !frm.getLimitStartDate().equals(sdf.format(obj.getLimitStartDate()))){ %>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="limitStartDate" /></td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
		 		
		 		<td width="20%" class="fieldname">Limit Expiry Date<font color="#FF0000">*</font> </td>
		 		<td width="15%"><integro:empty-if-null value="<%=sdf.format(obj.getDateOfReset())%>"/></td>
		 		<%if(null!=frm.getDateOfReset() && !frm.getDateOfReset().equals(sdf.format(obj.getDateOfReset()))){ %>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="dateOfReset" /></td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %> 
         </tr>
         <tr class="even">
                  <td class="fieldname">Day Light Limit Expiry Date</td>
                  <td width="15%"><integro:empty-if-null value="<%=obj.getIntradayLimitExpiryDate()%>"/></td>
                  <%if(null!=frm.getIntradayLimitExpiryDate()){%>
                  <td><bean:write name="XRefDetailForm" property="intradayLimitExpiryDate" /></td>
                  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                  <td width="20%" class="fieldname">Day Light Limit</td>
                  <td width="15%"><integro:empty-if-null value="<%=obj.getDayLightLimit()%>"/></td>
                  <%if(null!=frm.getDayLightLimit()){%>
                  <td width="30%"><bean:write name="XRefDetailForm" property="dayLightLimit" /></td>
                   <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
         </tr>
         <tr class="even">
          		<td class="fieldname" width="20%">Available<font color="#FF0000">*</font> </td>
		 		<td width="15%"><integro:empty-if-null value="<%=obj.getAvailable()%>"/></td>
		 		<%if(null!=frm.getAvailable() && !frm.getAvailable().equals(obj.getAvailable())){ %>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="available" /></td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
                
                <td class="fieldname" width="20%">Freeze<font color="#FF0000">*</font></td>
          		<td width="15%"><integro:empty-if-null value="<%=obj.getFreeze()%>"/></td>
          		<%if(null!=frm.getFreeze() && !frm.getFreeze().equals(obj.getFreeze())){ %>
          			<td width="15%"><bean:write name="XRefDetailForm" property="freeze" /></td>
          		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
         </tr>
         
         
         <%if("UBS-LIMITS".equalsIgnoreCase(frm.getFacilitySystem())){
         System.out.println("obj.getIdlEffectiveFromDate()=>"+obj.getIdlEffectiveFromDate()+"....frm.getIdlEffectiveFromDate()=>"+frm.getIdlEffectiveFromDate());
         %>
         <tr class="even">
		 		<td width="20%" class="fieldname">IDL Effective From Date</td>
		 		<%   if(null!=obj.getIdlEffectiveFromDate()) { %>
                <td width="15%"><integro:empty-if-null value="<%=sdf.format(obj.getIdlEffectiveFromDate())%>"/></td>
                <%}else{ %>
               <td width="15%"> - </td>
               <%}
		 		System.out.println("111obj.getIdlEffectiveFromDate()=>"+obj.getIdlEffectiveFromDate()+"....frm.getIdlEffectiveFromDate()=>"+frm.getIdlEffectiveFromDate());
		        
		 		%>
		 		
		 		<%if(null!=frm.getIdlEffectiveFromDate() && null == obj.getIdlEffectiveFromDate()){ %>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="idlEffectiveFromDate" /></td>
		 		<%}
		 		else if(null!=frm.getIdlEffectiveFromDate() && !frm.getIdlEffectiveFromDate().equals(sdf.format(obj.getIdlEffectiveFromDate()))){%>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="idlEffectiveFromDate" /></td>
		 		<%}
		 		else{ %>	
                	<td width="15%">-</td>
                <%}
		 		System.out.println("obj.getIdlEffectiveFromDate()=>"+obj.getIdlExpiryDate()+"....frm.getIdlEffectiveFromDate()=>"+frm.getIdlExpiryDate());
		         
		 		%>
		 		
		 		<td width="20%" class="fieldname">IDL Expiry Date</td>
		 		<%   if(null!=obj.getIdlExpiryDate()) { %>
               <td width="15%"><integro:empty-if-null value="<%=sdf.format(obj.getIdlExpiryDate())%>"/></td>
                <%}else{ %>
               <td width="15%"> - </td>
               <%} %>
		 		
		 		<%if(null!=frm.getIdlExpiryDate() && null == obj.getIdlExpiryDate()){ %>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="idlExpiryDate" /></td>
		 		<%}
		 		else if(null!=frm.getIdlExpiryDate() && !frm.getIdlExpiryDate().equals(sdf.format(obj.getIdlExpiryDate()))){%>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="idlExpiryDate" /></td>
		 		<%}
		 		else{ %>	
                	<td width="15%">-</td>
                <%} %> 
         </tr>
         
          <tr class="even">
           		<td class="fieldname" width="20%">IDL Amount</td>
           		<td width="15%"><integro:empty-if-null value="<%= UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(obj.getIdlAmount()) %>"/></td>
           		<%if(null!=frm.getIdlAmount() && null == obj.getIdlAmount()){ %>
             		<td width="15%"><bean:write name="XRefDetailForm" property="idlAmount" /></td>
             	<%}
           		else if(null!=frm.getIdlAmount() && ! (frm.getIdlAmount()).equals(UIUtil.formatWithCommaAndDecimalUptoTwoDecimal(obj.getIdlAmount()))){%>
           			<td width="15%"><bean:write name="XRefDetailForm" property="idlAmount" /></td>
           		<%}
           		else{ %>	
                	<td width="15%">-</td>
                <%} %>
             	
             	<td class="fieldname" width="20%"></td>
             	<td width="15%"></td>
          </tr>
         <%} %>
         
         
         <tr class="even">
          		<td class="fieldname" width="20%">Revolving Line<font color="#FF0000">*</font> </td>
		 		<td width="15%"><integro:empty-if-null value="<%=obj.getRevolvingLine()%>"/></td>
		 		<%if(null!=frm.getRevolvingLine() && !frm.getRevolvingLine().equals(obj.getRevolvingLine())){ %>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="revolvingLine" /></td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
                <td class="fieldname" width="20%">SCM Flag<font color="#FF0000">*</font> </td>
		 		<td width="15%"><integro:empty-if-null value="<%=obj.getScmFlag()%>"/></td>
		 		<%if(null!=frm.getScmFlag() && !frm.getScmFlag().equals(obj.getScmFlag())){ %>
		 			<td width="15%"><bean:write name="XRefDetailForm" property="scmFlag" /></td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>        
         </tr>
         
          <tr class="even">
				<td class="fieldname">SCF Interface Status</td>
				<td><html:text property="scfStatus" disabled="true" value="<%=scfStatus%>" style="width: 250px;"></html:text>&nbsp;<br></td>
				<td width="15%"></td>
				<td class="fieldname">SCF Interface Failed Reason</td>
				<%if(scfErrMsg.isEmpty()) {%>
					<td><html:text property="scfFailedReason" size="30"
								disabled="true" value="<%=scfErrMsg%>"></html:text><br/></td>
				<%}else{ %>
					<td><html:textarea property="scfFailedReason" rows="4"
								cols="50" disabled="true" value="<%=scfErrMsg%>"></html:textarea><br/></td>
				<%}%>
				<td width="15%"></td>
			</tr>
			
		<tr class="even">

				<td class="fieldname">ECBF Interface Completed</td>

				<td>
					<%
						if (radioInterfaceCompleted.equalsIgnoreCase("Checked")) {
					%> 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" checked="checked" value="Yes">Yes 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" value="No">No 
					<% 	} else { %> 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" value="Yes">Yes
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" checked="checked" value="No">No 
					<% } %>
				</td>
				
				<td width="15%"></td>

				<td class="fieldname">Last Updated by ECBF Date</td>
					<%
						if (radioInterfaceCompleted.equalsIgnoreCase("Checked")) {
							if (responseDate != null) {
					%>
							<td><html:text property="responserequestDate" disabled="true" value="<%=responseDate%>"></html:text><br></td>
							<%
								} else {
							%>
							<td><html:text property="responserequestDate" disabled="true" value="<%=requestDate%>"></html:text><br></td>
							<%
								}
							%>
					<%
						} else {
					%>
							<td><html:text property="responserequestDate" disabled="true" value=""></html:text><br></td>
					<% } %>
					<td width="15%">-</td>
			</tr>
         
         <tr class="even">
          		<td class="fieldname" width="20%">Last Available Date</td>
          		<td width="15%"><integro:empty-if-null value="<%=obj.getLastavailableDate()%>"/></td>
          		<%-- <%if(null!=frm.getLastavailableDate() && !frm.getLastavailableDate().equals((sdf.format(obj.getLastavailableDate())))){ %> --%>
          		<td width="15%"><bean:write name="XRefDetailForm" property="lastavailableDate" /></td>
          		<%-- <%}else{ %>	
                	<td width="15%">-</td>
                <%} %> --%>
          		
                <td class="fieldname" width="20%">Upload Date </td>
                <%if(null!=obj.getUploadDate()){ %>
                <td width="15%"><integro:empty-if-null value="<%=sdf.format(obj.getUploadDate())%>"/></td>
                <%}else{ %>
                <td width="15%">-</td>
                <%} %>
                <%if(null!=obj.getUploadDate() && !(sdf.format(obj.getUploadDate())).equals(frm.getUploadDate())){ %>
		 		<td width="15%"><bean:write name="XRefDetailForm" property="uploadDate" /></td>
		 		<%}else if(null==obj.getUploadDate()){ %>
		 		<td width="15%"><bean:write name="XRefDetailForm" property="uploadDate" /></td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %> 
         </tr>
         <tr class="even">
          		<td class="fieldname" width="20%">Segment1<font color="#FF0000">*</font></td>
          		<td width="15%">
          			<integro:common-code-single  entryCode="<%=obj.getSegment()%>"
	                	categoryCode="<%=CategoryCodeConstant.SEGMENT_1 %>" display="true" descWithCode="false" />            
          		<%if(null!=frm.getSegment() && !frm.getSegment().equals(obj.getSegment())){ %>
          		<td width="15%"><p>
               		<integro:common-code-single  entryCode="<%=frm.getSegment()%>"
	                                    categoryCode="<%=CategoryCodeConstant.SEGMENT_1 %>" display="true" descWithCode="false" />               
					</p>
				</td>
		 		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
		 		
		 		<td class="fieldname" width="20%">Rule ID<font color="#FF0000">*</font> </td>
		 		<td width="15%"><integro:empty-if-null value="<%=obj.getRuleId()%>"/></td>
		 		<%if(null!=frm.getRuleId() && !frm.getRuleId().equals(obj.getRuleId())){ %>
		 		<td width="15%"><p>
		 		   <integro:common-code-single  entryCode="<%=frm.getRuleId()%>" categoryCode="<%=CategoryCodeConstant.NPA_RULE_ID %>" display="true" descWithCode="false" />   
					</p>
				</td>
				<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
         </tr> 
         <tr class="even">
          		<td class="fieldname" width="20%">Capital market  exposure <font color="#FF0000">*</font></td>
          		<%System.out.println("obj.getIsCapitalMarketExposer():"+obj.getIsCapitalMarketExposer()+" frm.getIsCapitalMarketExposer():"+frm.getIsCapitalMarketExposer()); %>
          		<td width="15%"><integro:empty-if-null value="<%=obj.getIsCapitalMarketExposer()%>"/></td>
          		<%if(null!=frm.getIsCapitalMarketExposer() && !frm.getIsCapitalMarketExposer().equals(obj.getIsCapitalMarketExposer())){ %>
          			<td width="15%"><bean:write name="XRefDetailForm" property="isCapitalMarketExposer" /></td>	
          		<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
  				 
  				<td class="fieldname" width="20%">PSL FLG <%if("Funded".equalsIgnoreCase(request.getParameter("facilityType"))) { %> <font color="#FF0000">*</font>  <%} %></td>
  					<%if(null!=obj.getIsPrioritySector()){ %>
							<td width="15%">
								<%if(null!=obj.getIsPrioritySector() && "No".equals(obj.getIsPrioritySector())){ %>
								<integro:common-code-single
									entryCode="<%=obj.getPrioritySector()%>"
									categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>"
									display="true" descWithCode="false" /> <%} else if(null!=obj.getIsPrioritySector() && "Yes".equals(obj.getIsPrioritySector())){%>
								<integro:common-code-single
									entryCode="<%=obj.getPrioritySector()%>"
									categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>"
									display="true" descWithCode="false" /> <%} %>
							</td>
					<%}else{ %>
	  					<td width="15%">-</td>
  					<%} %>
  				
  					<%if(null!=frm.getIsPrioritySector()){ %>
  						<td width="15%"><p>
	                	  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="No">
							<integro:common-code-single  entryCode="<%=frm.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>" display="true" descWithCode="false" />               
	                  	  </logic:equal>
	                  	  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="Yes">
							<integro:common-code-single  entryCode="<%=frm.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" display="true" descWithCode="false" />               
	                  	  </logic:equal>
					  	</p>
				    	</td>
					<%}else{ %>	
                		<td width="15%">-</td>
               		<%} %>

          </tr>
          <tr class="even">
          		<td class="fieldname" width="20%">Real Estate Exposure <font color="#FF0000">*</font> </td>
            	<td width="15%"><integro:empty-if-null value="<%=obj.getIsRealEstateExposer()%>"/></td>
            	<%if(null!=frm.getIsRealEstateExposer() && !frm.getIsRealEstateExposer().equals(obj.getIsRealEstateExposer())){ %>
            		<td width="15%"><bean:write name="XRefDetailForm" property="isRealEstateExposer" /></td>
            	<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
                  
                <td class="fieldname" width="20%">UNCONDI CANCL COMMITMENT<font color="#FF0000">*</font></td>
                <td width="15%">
                	<integro:common-code-single  entryCode="<%=obj.getUncondiCancl()%>" 
                		categoryCode="<%=CategoryCodeConstant.UNCONDI_CANCL_COMMITMENT %>" display="true" descWithCode="false" />
                </td>
                <%if(null!=frm.getUncondiCancl() && !frm.getUncondiCancl().equals(obj.getUncondiCancl())){ %>
                <td width="15%"><p>
                	<integro:common-code-single  entryCode="<%=frm.getUncondiCancl()%>" 
                 		categoryCode="<%=CategoryCodeConstant.UNCONDI_CANCL_COMMITMENT %>" display="true" descWithCode="false" /></p>
				</td>
				<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
          </tr>
          <tr class="even">
		 	 	<td class="fieldname" width="20%">Interest rate <font color="#FF0000">*</font></td>
             	<td width="15%"><integro:empty-if-null value="<%=obj.getInterestRateType()%>"/>
             	<%if("fixed".equalsIgnoreCase(obj.getInterestRateType())){ %>
             		rate: &nbsp; <integro:empty-if-null value="<%=obj.getIntRateFix() %>" />
             	<%}else if("floating".equalsIgnoreCase(obj.getInterestRateType())){ %>
              		<% if(obj.getIntRateFloatingMarginFlag().equals("-")){%>
                  	rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(obj.getIntRateFloatingRange()) - Double.parseDouble(obj.getIntRateFloatingMargin())) %>"/>
                    <%}else { %>
                  	rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(obj.getIntRateFloatingMargin()) + Double.parseDouble(obj.getIntRateFloatingRange()))%>"/>
                  	<%} %>
             	<%} %>
             	</td>

             	<%if((null!=obj.getInterestRateType() && !obj.getInterestRateType().equals(frm.getInterestRateType())))
             			{ %>
             		<td width="15%">
             			<bean:write name="XRefDetailForm" property="interestRateType"   />
             			<%if("fixed".equalsIgnoreCase(frm.getInterestRateType()) ){ %>
             				rate: &nbsp; <integro:empty-if-null value="<%=frm.getIntRateFix() %>" />
             				
             			<%}else if("floating".equalsIgnoreCase(frm.getInterestRateType())){ %>
              				<% if(frm.getIntRateFloatingMarginFlag().equals("-")){%>
                  				rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingRange()) - Double.parseDouble(frm.getIntRateFloatingMargin())) %>"/>
                    		<%}else { %>
                  				rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingMargin()) + Double.parseDouble(frm.getIntRateFloatingRange()))%>"/>
                  			<%} %>
             			<%} %>
             		</td>
             	<%}else if((null!=obj.getIntRateFix() && !obj.getIntRateFix().equals(frm.getIntRateFix()))){%>
             		<td width="15%">
             			<bean:write name="XRefDetailForm" property="interestRateType"   />
             			<%if("fixed".equalsIgnoreCase(frm.getInterestRateType())){ %>
             				rate: &nbsp; <integro:empty-if-null value="<%=frm.getIntRateFix() %>" />
             				
             			<%}else if("floating".equalsIgnoreCase(frm.getInterestRateType())){ %>
              				<% if(frm.getIntRateFloatingMarginFlag().equals("-")){%>
                  				rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingRange()) - Double.parseDouble(frm.getIntRateFloatingMargin())) %>"/>
                    		<%}else { %>
                  				rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingMargin()) + Double.parseDouble(frm.getIntRateFloatingRange()))%>"/>
                  			<%} %>
             			<%} %>
             		</td>
             	<%}else if((null!=obj.getIntRateFloatingMarginFlag() && !obj.getIntRateFloatingMarginFlag().equals(frm.getIntRateFloatingMarginFlag()))){%>
             		<td width="15%">
             			<bean:write name="XRefDetailForm" property="interestRateType"   />
             			<%if("fixed".equalsIgnoreCase(frm.getInterestRateType())){ %>
             				rate: &nbsp; <integro:empty-if-null value="<%=frm.getIntRateFix() %>" />
             				
             			<%}else if("floating".equalsIgnoreCase(frm.getInterestRateType())){ %>
              				<% if(frm.getIntRateFloatingMarginFlag().equals("-")){%>
                  				rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingRange()) - Double.parseDouble(frm.getIntRateFloatingMargin())) %>"/>
                    		<%}else { %>
                  				rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingMargin()) + Double.parseDouble(frm.getIntRateFloatingRange()))%>"/>
                  			<%} %>
             			<%} %>
             		</td>
             	<%}else{ %>	
                	<td width="15%">-</td>
             	<%} %>

        	 	<td class="fieldname" width="20%">Commercial Real estate/ Residential real Estate  / Indirect real estate</td>
        	 	<% System.out.println("frm.getEstateType():"+frm.getEstateType()+" obj.getEstateType():"+obj.getEstateType()+" frm.getCommRealEstateType():"+frm.getCommRealEstateType()+" obj.getCommRealEstateType():"+obj.getCommRealEstateType());
        	 	if("Commercial Real estate".equals(frm.getEstateType()) &&  "Commercial Real estate".equals(obj.getEstateType())){ %>
              	<td width="15%"> <integro:empty-if-null value="<%=obj.getEstateType()%>"/> </br> -
              					<integro:common-code-single  entryCode="<%=obj.getCommRealEstateType()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE %>" display="true" descWithCode="false" />   </td>
              	<%if(null!=frm.getCommRealEstateType() && !frm.getCommRealEstateType().equals(obj.getCommRealEstateType())){ %>
              		<td width="15%"><bean:write name="XRefDetailForm" property="estateType"/>  </br> -
              							<integro:common-code-single  entryCode="<%=frm.getCommRealEstateType()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE %>" display="true" descWithCode="false" />   </td> 	
              	<%}else{ %>	
                	<td width="15%">-</td>
                <%} }else if("Commercial Real estate".equals(frm.getEstateType()) ){ %>
              	<td width="15%"><integro:empty-if-null value="<%=obj.getEstateType()%>"/> 
					  </td>
	<%if(null!=frm.getCommRealEstateType() && !frm.getCommRealEstateType().equals(obj.getCommRealEstateType())){ %>
		<td width="15%"><bean:write name="XRefDetailForm" property="estateType"/>  </br> - 
							<integro:common-code-single  entryCode="<%=frm.getCommRealEstateType()%>"
                        categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE %>" display="true" descWithCode="false" />   </td> 	
	<%}else{ %>	
	<td width="15%">-</td>
<%}  }else if("Commercial Real estate".equals(obj.getEstateType()) ){ %>
	<td width="15%"><integro:empty-if-null value="<%=obj.getEstateType()%>"/> </br> -
	<integro:common-code-single  entryCode="<%=obj.getCommRealEstateType()%>"
        categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE %>" display="true" descWithCode="false" />  
	  </td>
<%if(null!=frm.getEstateType() && !frm.getEstateType().equals(obj.getEstateType())){ %>
<td width="15%"><bean:write name="XRefDetailForm" property="estateType"/>  </br>  </td> 	
<%}else{ %>	
<td width="15%">-</td>
<%}  }else{%>
                <td width="15%"><integro:empty-if-null value="<%=obj.getEstateType()%>"/></td>
              	<%if(null!=frm.getEstateType() && !frm.getEstateType().equals(obj.getEstateType())){ %>
              		<td width="15%"><bean:write name="XRefDetailForm" property="estateType"/></td> 	
              	<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>	
                <%} %>
                	
         </tr>
         <tr class="even">
          <%System.out.println("frm.getFacilitySystem()........"+frm.getFacilitySystem()); %>
                 <%if("UBS-LIMITS".equalsIgnoreCase(frm.getFacilitySystem()) || "FCUBS-LIMITS".equalsIgnoreCase(frm.getFacilitySystem())) %>
                 <%System.out.println("frm.getFacilitySystem()........"+frm.getFacilitySystem()); %>
                 <% if("Yes".equalsIgnoreCase(frm.getIntradayLimitFlag())){%> 
                 <%System.out.println("intradayLimit........"+intradayLimit); %>
                  <td class="fieldname">Day Light Limit Available</td>
                  <td width="15%"><integro:empty-if-null value="<%=obj.getIsDayLightLimitAvailable()%>"/></td>
                  <%if(null!=frm.getIsDayLightLimitAvailable() && !frm.getIsDayLightLimitAvailable().equals(obj.getIsDayLightLimitAvailable())){ %>
                  <td><bean:write name="XRefDetailForm" property="isDayLightLimitAvailable" />
  				  </td><%}else{ %><td width="15%">-</td><%} %>
  				  <html:hidden property="isDayLightLimitAvailable" />
  				  <%}else{%>
  				  <td class="fieldname"></td>
  				  <td></td>
  				  <td></td>
  				  <%} %>
                  <td class="fieldname">Day Light Limit Approved</td>
                   <td width="15%"><integro:empty-if-null value="<%=obj.getDayLightLimitApproved()%>"/></td>
                   <%if(null!=frm.getDayLightLimitApproved() && !frm.getDayLightLimitApproved().equals(obj.getDayLightLimitApproved())){ %>
                 	<td><bean:write name="XRefDetailForm" property="dayLightLimitApproved" /></input>
                 	</td><%}else{ %><td width="15%">-</td><%} %>
					 <html:hidden property="dayLightLimitApproved" />
                </tr>
         
                
              <%System.out.println("frm.getFacilitySystem().........................................................................."+frm.getFacilitySystem()); %>  
 		 <tr class="even">
		  		<td class="fieldname" width="20%">Limit (Tenor Days)</td>
		  		<td width="15%"><integro:empty-if-null value="<%=obj.getLimitTenorDays()%>"/></td>
		  		<%if(null!=frm.getLimitTenorDays() && !frm.getLimitTenorDays().equals(obj.getLimitTenorDays())){ %>
		  			<td width="15%"><bean:write name="XRefDetailForm" property="limitTenorDays"/></td>
		  		<%}else{ %>
		  			<td width="15%">-</td>
		  		<%}%>
                <td class="fieldname" width="20%">Closed Flag<font color="#FF0000">*</font></td>
          		<td width="15%"><integro:empty-if-null value="<%=obj.getCloseFlag()%>"/></td>
          		<%if(null!=frm.getCloseFlag() && !frm.getCloseFlag().equals(obj.getCloseFlag())){ %>
          			<td width="15%">
                   	<%if(null!=frm.getCloseFlag() && "Y".equals(frm.getCloseFlag())){%>
                   		<input type="checkbox" id="closeFlag" checked="checked" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="closeFlag"  disabled="true" />
                   	<%} %>
                	</td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
         </tr>
        	<tr class="even">	 
		  		<%if("UBS-LIMITS".equals(frm.getFacilitySystem())){%>
					<td class="fieldname">Banking Arrangement</td>
					<td width="15%">
						<integro:common-code-single categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.BANKING_ARRANGEMENT %>" 
									entryCode="<%=obj.getBankingArrangement()%>"  display="true" descWithCode="false" />
			  		<%if(null!=frm.getBankingArrangement() && !frm.getBankingArrangement().equals(obj.getBankingArrangement())){ %>
			  			<td width="15%"><integro:common-code-single categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.BANKING_ARRANGEMENT %>" 
									entryCode="<%=frm.getBankingArrangement()%>"  display="true" descWithCode="false" /></td>
			  		<%}else{ %>
			  			<td width="15%">-</td>
			  		<%}%>
				<%}%>
         </tr>
         <tr class="even">
		  			<td class="fieldname">Vendor Details</td>
		  			 <%if(null!=frm.getVendorDtls() && !frm.getVendorDtls().equals(obj.getVendorDtls())){ %>
                	<td width="15%"><bean:write name="XRefDetailForm" property="vendorDtls" /></td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
		  			<td class="fieldname">&nbsp;</td>
                   	<td></td>
                </tr>  
  <%--        <tr class="even">
         		<td class="fieldname" width="20%">Limit Restriction/Customer Restriction<font color="#ff0000">*</font></td>
              	<td width="30%">
					<html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="facilityTypeList" >
						<html:options collection="facilityTypeList" property="value" labelProperty="label"/>
						<integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>" excludeList="<%=filterActualRbiCodeCatIds %>"  pleaseSelect="false" />
		            </html:select> 
             	<td>
		            <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allListrbiCodeCategory,rbiCodeCategorys, false)" class="btnNormal"/>
			        <br/> <br/> 
					<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(rbiCodeCategorys,allListrbiCodeCategory,false)" class="btnNormal"/>
		        </td>
		        <td>
		           	<html:select name="RbiCategoryForm" size="10" multiple="multiple" style="width:260" property="rbiCodeCategorys" >
		            </html:select> 
		            &nbsp;<html:errors property="rbiCodeCategorys"/>
		        </td>
         </tr> --%> 
         <tr class="even">
         		<td class="fieldname">Limit Restriction/Customer Restriction</td>
         		<td><integro:empty-if-null value="<%=obj.getLimitRestriction()%>"/></td>
         		<%if(null!=frm.getLimitRestriction() && !frm.getLimitRestriction().equals(obj.getLimitRestriction())){ %>
             	<td><bean:write property="limitRestriction"  name="XRefDetailForm"/></td>
             	<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
             	
             	<td class="fieldname"></td>
         		<td></td>
             	<td></td>
         </tr>
         
           <tr id="addCoBorrowerDetails">
     <td class="fieldname" >Co-borrower Details </td>

							<td colspan="6">
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="95%" align="center">
								<thead>
									<tr><html:errors property="restCoBorrowerListError"/></tr>
									<tr>
										<td> Sr No</td>
										<td> Co-Borrower Liab Id </td>
										<td> Co-Borrower Name </td>
									
									</tr>
								</thead>
								 <tbody>
								
								 
									<logic:present name="restCoBorrowerList">
										<logic:iterate id="ob" name="restCoBorrowerList"
											type="com.integrosys.cms.app.customer.bus.OBLimitXRefCoBorrower"
											 scope="page">
											<%
												String rowClass = "";
														vno++;
														rowClass = "even";
														
											%>
											 <tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getCoBorrowerId()%>&nbsp;</center>
												</td>
												<td>
													<center><%=ob.getCoBorrowerName()%>&nbsp;</center>
												<%-- <html:text property="coBorrowerName" styleId="coBorrowerName" value = "<%=ob.getCoBorrowerName()%>"/> --%>
												</td>
											</tr> 
										
										</logic:iterate>
									</logic:present>
										<%if(restCoBorrowerList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								</tbody> 
							</table>
							</td>
						</tr>
         <tr class="even">
         		<td class="fieldname" width="20%">Branch Allowed</td>
         		<td width="15%"><%-- <integro:empty-if-null value="<%=obj.getBranchAllowed()%>"/> --%>
         			<html:select name="XRefDetailForm"  multiple="multiple" size="10" style="width:150" property="branchAllowed" disabled="true">
						<html:options collection="actualBranchAllowedList" property="value" labelProperty="label"/>
					</html:select>
         		</td>
         		<%if(null!=frm.getBranchAllowed() && !frm.getBranchAllowed().equals(obj.getBranchAllowed())){ %>
            	<td width="15%"> 
            		<html:select name="XRefDetailForm"  multiple="multiple" size="10" style="width:150" property="branchAllowed" disabled="true">
						<html:options collection="branchAllowedList1" property="value" labelProperty="label"/>
					</html:select>
				</td>
				<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
                
             	<td class="fieldname">&nbsp;</td>
             	<td>&nbsp;</td>
             	<td>&nbsp;</td>
       	</tr> 
        <tr class="even">
        		<td class="fieldname" width="20%">Product Allowed</td>
        		<td width="15%"><%-- <integro:empty-if-null value="<%=obj.getProductAllowed()%>"/> --%>
        			<html:select name="XRefDetailForm" size="10" style="width:150" multiple="multiple"  property="productAllowed" disabled="true">
						<html:options collection="actualProductAllowedList" property="value" labelProperty="label"/>
                    </html:select>
        		</td>
        		<%if(null!=frm.getProductAllowed() && !frm.getProductAllowed().equals(obj.getProductAllowed())){ %>
            	<td width="15%"> 
            		<html:select name="XRefDetailForm" size="10" style="width:150" multiple="multiple"  property="productAllowed" disabled="true">
						<html:options collection="productAllowedList1" property="value" labelProperty="label"/>
                    </html:select>
                </td>
                <%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
             		
             	<td class="fieldname">&nbsp;</td>
             	<td>&nbsp;</td>
             	<td>&nbsp;</td>
        </tr> 
       	<tr class="even">
            	<td class="fieldname" width="20%">Currency Allowed</td>
            	<td width="15%"><%-- <integro:empty-if-null value="<%=obj.getCurrencyAllowed()%>"/> --%>
            		<html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:150" property="currencyAllowed" disabled="true">
						<html:options collection="actualCurrencyAllowedList" property="value" labelProperty="label"/>
                    </html:select>
            	</td>
            	<%if(null!=frm.getCurrencyAllowed() && !frm.getCurrencyAllowed().equals(obj.getCurrencyAllowed())){ %>
            	<td width="15%"> 
            		<html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:150" property="currencyAllowed" disabled="true">
						<html:options collection="currencyAllowedList1" property="value" labelProperty="label"/>
                    </html:select>
            	</td>
            	<%}else{ %>	
                	<td width="15%">-</td>
                <%} %>
            	
             	<td class="fieldname">&nbsp;</td>
             	<td>&nbsp;</td>
             	<td>&nbsp;</td>
        </tr>  
        <tr class="even">
        		<td class="fieldname" width="20%">Udf Allowed</td>
        		<td width="15%"><%-- <integro:empty-if-null value="<%=obj.getUdfAllowed()%>"/> --%>
        			<html:select name="XRefDetailForm" multiple="multiple" size="10" style="width:150" property="udfList" disabled="true">
						<html:options collection="actualUdfLbValList" property="value" labelProperty="label"/> 
					</html:select>
        		</td>
        		<%if(null!=frm.getUdfAllowed() && !frm.getUdfAllowed().equals(obj.getUdfAllowed())){ %>
             	<td width="15%">
             		<html:select name="XRefDetailForm" multiple="multiple" size="10" style="width:150" property="udfList" disabled="true">
						<html:options collection="udfLbValList1" property="value" labelProperty="label"/> 
					</html:select> 
				</td>
				<%}else{ %>	
                	<td width="15%">-</td>
                <%} %> 	
				
             	<td class="fieldname">&nbsp;</td>
             	<td>&nbsp;</td>
             	<td>&nbsp;</td>
        </tr> 
        
         <tr class="even">
        		<td class="fieldname" width="20%">Udf Allowed-2</td>
        		<td width="15%"><%-- <integro:empty-if-null value="<%=obj.getUdfAllowed()%>"/> --%>
        			<html:select name="XRefDetailForm" multiple="multiple" size="10" style="width:150" property="udfList" disabled="true">
						<html:options collection="actualUdfLbValList2" property="value" labelProperty="label"/> 
					</html:select>
        		</td>
        		<%if(null!=frm.getUdfAllowed_2() && !frm.getUdfAllowed_2().equals(obj.getUdfAllowed_2())){ %>
             	<td width="15%">
             		<html:select name="XRefDetailForm" multiple="multiple" size="10" style="width:150" property="udfList" disabled="true">
						<html:options collection="udfLbValList1_2" property="value" labelProperty="label"/> 
					</html:select> 
				</td>
				<%}else{ %>	
                	<td width="15%">-</td>
                <%} %> 	
				
             	<td class="fieldname">&nbsp;</td>
             	<td>&nbsp;</td>
             	<td>&nbsp;</td>
        </tr> 
        <tr class="even">
        	<td class="fieldname">Security 1</td>
        	<td width="15%"><integro:empty-if-null value="<%=sec1Obj%>"/></td>
        	<%if(null!=sec1 && !sec1.equals(sec1Obj)){ %>
            	<td><integro:empty-if-null value="<%=sec1%>"/></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
            
            <td class="fieldname">Security 2</td>
            <td width="15%"><integro:empty-if-null value="<%=sec2Obj%>"/></td>
            <%if(null!=sec2 && !sec2.equals(sec2Obj)){ %>
            	<td><p><integro:empty-if-null value="<%=sec2%>"/></p></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
        </tr>
        <tr class="even">
            <td class="fieldname">Security 3</td>
            <td width="15%"><integro:empty-if-null value="<%=sec3Obj%>"/></td>
            <%if(null!=sec3 && !sec3.equals(sec3Obj)){ %>
            	<td><p><integro:empty-if-null value="<%=sec3%>"/></p></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
            
            <td class="fieldname">Security 4</td>
            <td width="15%"><integro:empty-if-null value="<%=sec4Obj%>"/></td>
            <%if(null!=sec4 && !sec4.equals(sec4Obj)){ %>
            	<td><p><integro:empty-if-null value="<%=sec4%>"/></p></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
        </tr>	
        <tr class="even">
        	<td class="fieldname">Security 5</td>
        	<td width="15%"><integro:empty-if-null value="<%=sec5Obj%>"/></td>
        	<%if(null!=sec5 && !sec5.equals(sec5Obj)){ %>
            	<td><p><integro:empty-if-null value="<%=sec5%>"/></p></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
            
            <td class="fieldname">Security 6</td>
            <td width="15%"><integro:empty-if-null value="<%=sec6Obj%>"/></td>
            <%if(null!=sec6 && !sec6.equals(sec6Obj)){ %>
            	<td><p><integro:empty-if-null value="<%=sec6%>"/></p></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
        </tr>	
        <tr class="odd">
            <td class="fieldname">Internal Remarks</td>
            <td><integro:empty-if-null value="<%=obj.getInternalRemarks()%>"/></td>
            <%if(null!=frm.getInternalRemarks() && !frm.getInternalRemarks().equals(obj.getInternalRemarks())){ %>
            	<td><html:textarea  rows="6" cols="30" property="internalRemarks" disabled="true" /></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
            
            <td class="fieldname"></td>
         	<td></td>
            <td></td> 	
        </tr>
        <tr class="even">
            <td class="fieldname">Core STP Rejected Reason</td>
            <%System.out.println("frm coreStpRejectReason:"+frm.getCoreStpRejectedReason()); %>
            <td><integro:empty-if-null value="<%=obj.getCoreStpRejectedReason()%>"/></td>
            <%if(null!=frm.getCoreStpRejectedReason() && !frm.getCoreStpRejectedReason().equals(obj.getCoreStpRejectedReason())){ %>
            	<td><bean:write name="XRefDetailForm" property="coreStpRejectedReason"/></td>
            <%}else{ %>	
                <td width="15%">-</td>
            <%} %>
            
            <td class="fieldname"></td>
         	<td></td>
            <td></td> 	
        </tr> 
       </tbody>
      </table>
     <%}else{ %>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
       <thead>
       </thead> 
       <tbody>
        <tr class="even">
         			<td width="20%" class="fieldname">System ID</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="facilitySystemID" /></td>
		 
                  <td width="20%" class="fieldname">System</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="facilitySystem" /></td>
                </tr>
          <tr class="even">
           			<td width="20%" class="fieldname">Liab Branch<font color="#FF0000">*</font> </td>
                  	<td width="30%"><html:select property="liabBranch" disabled="true">
		      		<option value="">Please Select </option>	
                      <html:options collection="fccBranchList" property="value" labelProperty="label"/>
                    </html:select></td>
          			<td class="fieldname"><p>Currency Restriction</p></td>
                   	<td width="30%">
                   	<%System.out.println("+++++++getCurrencyRestriction+++++"+frm.getCurrencyRestriction()); %>
                   	<% if(null!=frm.getCurrencyRestriction() && frm.getCurrencyRestriction().equalsIgnoreCase("Y")){%> 
                   	<input type="checkbox" id="currencyRestriction" checked="checked" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="currencyRestriction"  disabled="true" />
                   	<%} %>
                   	</td>
          </tr>
          <tr class="even">
		 		  <td width="20%" class="fieldname">Line No.</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="lineNo" /></td>
                   <td width="20%" class="fieldname">Serial No.<font color="#FF0000">*</font> </td>
                  <% System.out.println("frm.getAction():"+frm.getAction()+" frm.getSendToFile():"+frm.getSendToFile()+" frm.getSerialNo():"+frm.getSerialNo());
                 	 if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(frm.getAction()) && ICMSConstant.FCUBS_STATUS_PENDING_SUCCESS.equals(frm.getStatus()) ){ %>
                  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                   <%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(frm.getAction()) && "N".equals(frm.getSendToFile()) ){ %>
                  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                   <%}else if(ICMSConstant.FCUBSLIMIT_ACTION_NEW.equals(frm.getAction())) {%>
                   <td width="30%"></td>
                   <%}else{ %>
                  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                  <%} %>
                 
          </tr>
               <tr class="even">
		 		  <td width="20%" class="fieldname">Main Line Code</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="mainLineCode" /></td>
                    
                  <td width="20%" class="fieldname">Currency</td>
                  <%System.out.println("+++++++getCurrency+++++"+frm.getCurrency()); %>
                  <%if(null!=frm.getCurrency()) {%>
		 		  <td><bean:write name="XRefDetailForm" property="currency" /></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                  
          </tr>
            <tr class="even">
          
           		   <td class="fieldname">Released&nbsp; Amount <font color="#FF0000">*</font> </td>
             		<td><bean:write name="XRefDetailForm" property="releasedAmount" /></td>
             		 <td class="fieldname">Utilized Amount </td>
             		<td><bean:write name="XRefDetailForm" property="utilizedAmount" /></td>
           </tr>
            <tr class="even">
                  <td class="fieldname">Released date</td>
                  <td><bean:write name="XRefDetailForm" property="releaseDate" /></td>
                  <td class="fieldname">Send To File</td>
                  <td>
                  <%if("N".equals(frm.getSendToFile())){%>
                   	<input type="checkbox" id="sendToFile" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="sendToFile" checked="checked" disabled="true" />
                   	<%} %></td>
            </tr>
                
           <tr class="even">
		 		 <td width="20%" class="fieldname">Limit Start Date<font color="#FF0000">*</font> </td>
		 		  <td><bean:write name="XRefDetailForm" property="limitStartDate" /></td>
		 		 <td width="20%" class="fieldname">Limit Expiry Date<font color="#FF0000">*</font> </td>
		 		  <td><bean:write name="XRefDetailForm" property="dateOfReset" /></td> 
          </tr>
          
          <tr class="even">
                  <td class="fieldname">Day Light Limit Expiry Date</td>
                  <%if(null!=frm.getIntradayLimitExpiryDate()){%>
                  <td><bean:write name="XRefDetailForm" property="intradayLimitExpiryDate" /></td>
                  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                  <td width="20%" class="fieldname">Day Light Limit</td>
                  <%if(null!=frm.getDayLightLimit()){%>
                  <td width="30%"><bean:write name="XRefDetailForm" property="dayLightLimit" />
                   <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
		 		  </td>
           </tr>
           
            <tr class="even">
          			<td class="fieldname">Available<font color="#FF0000">*</font> </td>
		 		 <td><bean:write name="XRefDetailForm" property="available" /></td>
                  <td class="fieldname">Freeze<font color="#FF0000">*</font></td>
          		  <td><bean:write name="XRefDetailForm" property="freeze" /></td>
                 </td>	
          </tr>
          
           <%if("UBS-LIMITS".equalsIgnoreCase(frm.getFacilitySystem())){%>
          <tr class="even">
		 		 <td width="20%" class="fieldname">IDL Effective From Date</td>
		 		  <td><bean:write name="XRefDetailForm" property="idlEffectiveFromDate" /></td>
		 		 <td width="20%" class="fieldname">IDL Expiry Date</td>
		 		  <td><bean:write name="XRefDetailForm" property="idlExpiryDate" /></td> 
          </tr>
          
           <tr class="even">
          
           		   <td class="fieldname">IDL Amount</td>
             		<td><bean:write name="XRefDetailForm" property="idlAmount" /></td>
             		 <td class="fieldname"></td>
             		<td></td>
           </tr>
          <%} %>
          
          <tr class="even">
          
          		 <td class="fieldname">Revolving Line<font color="#FF0000">*</font> </td>
          		  <%if(null!=frm.getRevolvingLine()) {%>
		 		  <td><bean:write name="XRefDetailForm" property="revolvingLine" /></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
                   <td class="fieldname">SCM Flag<font color="#FF0000">*</font> </td>
          		  <%if(null!=frm.getRevolvingLine()) {%>
		 		  <td><bean:write name="XRefDetailForm" property="scmFlag" /></td>
		 		  <% } else {%>
		 		  <td>-</td>
		 		  <%} %>
          </tr>
          
           <tr class="even">
				<td class="fieldname">SCF Interface Status</td>
				<td><html:text property="scfStatus" disabled="true" value="<%=scfStatus%>" style="width: 250px;"></html:text>&nbsp;<br></td>
				<td class="fieldname">SCF Interface Failed Reason</td>
				<%if(scfErrMsg.isEmpty()) {%>
					<td><html:text property="scfFailedReason" size="30"
								disabled="true" value="<%=scfErrMsg%>"></html:text><br/></td>
				<%}else{ %>
					<td><html:textarea property="scfFailedReason" rows="4"
								cols="50" disabled="true" value="<%=scfErrMsg%>"></html:textarea><br/></td>
				<%}%>
			</tr>
			
			<tr class="even">

				<td class="fieldname">ECBF Interface Completed</td>

				<td>
					<%
						if (radioInterfaceCompleted.equalsIgnoreCase("Checked")) {
					%> 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" checked="checked" value="Yes">Yes 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" value="No">No 
					<% 	} else { %> 
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" value="Yes">Yes
						<input type="radio" id="radioInterfaceCompleted" name="radioInterfaceCompleted" disabled="true" checked="checked" value="No">No 
					<% } %>
				</td>

				<td class="fieldname">Last Updated by ECBF Date</td>
					<%
						if (radioInterfaceCompleted.equalsIgnoreCase("Checked")) {
							if (responseDate != null) {
					%>
							<td><html:text property="responserequestDate" disabled="true" value="<%=responseDate%>"></html:text><br></td>
							<%
								} else {
							%>
							<td><html:text property="responserequestDate" disabled="true" value="<%=requestDate%>"></html:text><br></td>
							<%
								}
							%>
					<%
						} else {
					%>
							<td><html:text property="responserequestDate" disabled="true" value=""></html:text><br></td>
					<% } %>
			</tr>
          
           <tr class="even">
          
          		  <td class="fieldname">Last Available Date</td>
          		   <td><bean:write name="XRefDetailForm" property="lastavailableDate" /></td>
                 <td class="fieldname">Upload Date </td>
		 		  <td><bean:write name="XRefDetailForm" property="uploadDate" /></td>
          </tr>
          
           <tr class="even">
          
          		  <td class="fieldname">Segment1<font color="#FF0000">*</font></td>
          		  <td><p>
               		<integro:common-code-single  entryCode="<%=frm.getSegment()%>"
	                                    categoryCode="<%=CategoryCodeConstant.SEGMENT_1 %>" display="true" descWithCode="false" />               
					</p></td>
		 		 <td class="fieldname">Rule ID<font color="#FF0000">*</font> </td>
		 		   <td><p>
		 		   <integro:common-code-single  entryCode="<%=frm.getRuleId()%>" categoryCode="<%=CategoryCodeConstant.NPA_RULE_ID %>" display="true" descWithCode="false" />   
					</p></td>
          </tr>
          
                
          <tr class="even">
          
          		 <td class="fieldname">Capital market  exposure <font color="#FF0000">*</font></td>
          		  <td><bean:write name="XRefDetailForm" property="isCapitalMarketExposer" /></td>	
				<%--   <td class="fieldname">PSL FLG <%if("Funded".equalsIgnoreCase(request.getParameter("facilityType"))) { %> <font color="#FF0000">*</font>  <%} %> </td> --%>
                       <td class="fieldname">PSL FLG  <font color="#FF0000">*</font> </td>
                  <td><p>
	                  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="No">
						<integro:common-code-single  entryCode="<%=frm.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>" display="true" descWithCode="false" />               
	                  </logic:equal>
	                  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="Yes">
						<integro:common-code-single  entryCode="<%=frm.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" display="true" descWithCode="false" />               
	                  </logic:equal>
					</p>
				</td>
                  
          </tr>
           
           
           <tr class="even">
                  <td class="fieldname">Real Estate Exposure <font color="#FF0000">*</font> </td>
                   <td><bean:write name="XRefDetailForm" property="isRealEstateExposer" /></td>
                  
                  <td class="fieldname">UNCONDI CANCL COMMITMENT<font color="#FF0000">*</font></td>
                  <td>
                 <p><integro:common-code-single  entryCode="<%=frm.getUncondiCancl()%>" categoryCode="<%=CategoryCodeConstant.UNCONDI_CANCL_COMMITMENT %>" display="true" descWithCode="false" />   
					</p></td>
                </tr>
           <tr>
		 	 <td class="fieldname">Interest rate <font color="#FF0000">*</font></td>
             <td>
             <bean:write name="XRefDetailForm" property="interestRateType"   />
             <%if("fixed".equalsIgnoreCase(frm.getInterestRateType())){ %>
             		rate: &nbsp; <integro:empty-if-null value="<%=frm.getIntRateFix() %>" />
             <%}else if("floating".equalsIgnoreCase(frm.getInterestRateType())){ %>
              <% if(frm.getIntRateFloatingMarginFlag().equals("-")){%>
                  rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingRange()) - Double.parseDouble(frm.getIntRateFloatingMargin())) %>"/>
                   <%}else { %>
                  rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingMargin()) + Double.parseDouble(frm.getIntRateFloatingRange()))%>"/>
                  <%} %>
             <%} %>
             </td>
        	 <td class="fieldname">Commercial Real estate/ Residential real Estate  / Indirect real estate</td>
              <td><bean:write name="XRefDetailForm" property="estateType"/>
                   <%if(null!=frm.getEstateType() && "Commercial Real estate".equalsIgnoreCase(frm.getEstateType())){ %>
						<html:select property="commRealEstateType" disabled = "true" style="width:250px">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE%>" descWithCode="false" />
						</html:select>
						<html:hidden property="commRealEstateType" />  
                	<%} %>
              </td> 		
           </tr>
           
           <tr class="even">
          <%System.out.println("frm.getFacilitySystem()........"+frm.getFacilitySystem()); %>
                 <%if("UBS-LIMITS".equalsIgnoreCase(frm.getFacilitySystem()) || "FCUBS-LIMITS".equalsIgnoreCase(frm.getFacilitySystem())) %>
                 <%System.out.println("frm.getFacilitySystem()........"+frm.getFacilitySystem()); %>
                 <% if("Yes".equalsIgnoreCase(frm.getIntradayLimitFlag())){%> 
                 <%System.out.println("intradayLimit........"+intradayLimit); %>
                  <td class="fieldname">Day Light Limit Available</td>
                  <td><bean:write name="XRefDetailForm" property="isDayLightLimitAvailable" />
  				  </td>
  				  <html:hidden property="isDayLightLimitAvailable" />
  				  <%}else{%>
  				   <td class="fieldname">Day Light Limit Available</td>
                  <td><bean:write name="XRefDetailForm" property="isDayLightLimitAvailable" />
  				  </td>
  				  <html:hidden property="isDayLightLimitAvailable" />
  				  <%} %>
                  <td class="fieldname">Day Light Limit Approved</td>
                 	<td><bean:write name="XRefDetailForm" property="dayLightLimitApproved" /></input>
                 	</td>
					 <html:hidden property="dayLightLimitApproved" />
                </tr>
           
 		 <tr class="even">
          
		  			<td class="fieldname">Limit (Tenor Days)</td>
		  			<td><bean:write name="XRefDetailForm" property="limitTenorDays"/>  </td>

		  			<%-- <td><bean:write name="XRefDetailForm" property="limitTenorDays"/>  </td>  --%>
		  			<td class="fieldname">Closed Flag<font color="#FF0000">*</font></td>

          		  	<td width="30%">
                   	<%if(null!=frm.getCloseFlag() && "Y".equals(frm.getCloseFlag())){%>
                   	<input type="checkbox" id="closeFlag" checked="checked" disabled="true" />
                   	<%}else{ %>
                   		<input type="checkbox" id="closeFlag"  disabled="true" />
                   	<%} %>
                   	</td>
        </tr>
 		 <tr class="even">		
		  			<%if("UBS-LIMITS".equals(frm.getFacilitySystem())){%>
						<td class="fieldname">Banking Arrangement</td>
						<td>                  	
							<html:select property="bankingArrangement" disabled = "true" style="width:250px">
								<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
							</html:select>
							 <html:hidden property="bankingArrangement" />
						</td>
					<%}%>		  			
                </tr>
                <tr class="even">
		  			<td class="fieldname">Vendor Details</td>
		  			<td width="30%"><bean:write name="XRefDetailForm" property="vendorDtls" /></td>
		  		
		  			  <td class="fieldname"><bean:message key="label.lineRelease.adhocLine"/></td>
                      <td>
                       <% if("Y".equals(frm.getAdhocLine())){%>
  					    Yes
  					   <%}else if ("N".equals(frm.getAdhocLine())){ %>
  					    No 
  					  <%}%>
  					
  					  <html:hidden property="adhocLine"/>
  				 </td>	    
                </tr>  
                
                
            <%-- <tr class="even">
             

              <td class="fieldname" width="20%">Limit Restriction/Customer Restriction<font color="#ff0000">*</font></td>
              <td width="30%">
									 <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="facilityTypeList" >
						               <html:options collection="facilityTypeList" property="value" labelProperty="label"/>
						               <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>" excludeList="<%=filterActualRbiCodeCatIds %>"  pleaseSelect="false" />
		                			</html:select> 
             		   <td>
		             		<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(allListrbiCodeCategory,rbiCodeCategorys, false)" class="btnNormal"/>
			                <br/> <br/> 
							<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(rbiCodeCategorys,allListrbiCodeCategory,false)" class="btnNormal"/>
		               </td>
		               
		               <td>
		               
									 <html:select name="RbiCategoryForm" size="10" multiple="multiple" style="width:260" property="rbiCodeCategorys" >
		                			</html:select> 
		                			&nbsp;</br><html:errors property="rbiCodeCategorys"/>
		                		</td>
              
            </tr>  --%>
             <tr class="even">
            <td class="fieldname">Limit Restriction/Customer Restriction</td>
             <td colspan="3"><bean:write property="limitRestriction"  name="XRefDetailForm"/>
             </td>
            </tr>
            
           <tr id="addCoBorrowerDetails">
     <td class="fieldname" >Co-borrower Details </td>

							<td colspan="6">
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
										<td> Sr No</td>
										<td> Co-Borrower Liab Id </td>
										<td> Co-Borrower Name </td>
									
									</tr>
								</thead>
								 <tbody>
									<logic:present name="restCoBorrowerList">
										<logic:iterate id="ob" name="restCoBorrowerList"
											type="com.integrosys.cms.app.customer.bus.OBLimitXRefCoBorrower"
											 scope="page">
											 	<% if(null != ob.getCoBorrowerName() && !"".equals(ob.getCoBorrowerName()) ){ %>
											<%
												String rowClass = "";
														vno++;
														rowClass = "even";
														/* if (vno % 2 != 0) {
															rowClass = "odd";
									 					} else {
															rowClass = "even";
														} */
											%>
											 <tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getCoBorrowerId()%>&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getCoBorrowerName()%>&nbsp;</center>
												<%-- <html:text property="coBorrowerName" styleId="coBorrowerName" value = "<%=ob.getCoBorrowerName()%>"/> --%>
												</td>
											</tr> 
											<%} %>
										</logic:iterate>
									</logic:present>
										<%if(restCoBorrowerList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								</tbody> 
							</table>
							</td>
						</tr>
          
             
            <tr class="even">
            <tr class="even">
             <td class="fieldname" width="20%">Branch Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="branchAllowed" disabled="true">
						               <html:options collection="branchAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
             <tr class="even">
             <td class="fieldname" width="20%">Product Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="productAllowed" disabled="true">
						               <html:options collection="productAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
             <tr class="even">
             <td class="fieldname" width="20%">Currency Allowed</td>
            	<td width="30%"> <html:select name="XRefDetailForm" size="10" multiple="multiple" style="width:260" property="currencyAllowed" disabled="true">
						               <html:options collection="currencyAllowedList1" property="value" labelProperty="label"/>
						        
                    </html:select></td>
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
         <!-- Start Santosh ubs limit upload -->
            <tr class="even">
             <td class="fieldname" width="20%">Udf Allowed</td>
             <td><html:select name="XRefDetailForm" multiple="multiple" style="width:260" property="udfList" disabled="true">
					<html:options collection="udfLbValList1" property="value" labelProperty="label"/> 
				</html:select> 
			</td> 	
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
            
             <tr class="even">
             <td class="fieldname" width="20%">Udf Allowed-2</td>
             <td><html:select name="XRefDetailForm" multiple="multiple" style="width:260" property="udfList_2" disabled="true">
					<html:options collection="udfLbValList1_2" property="value" labelProperty="label"/> 
				</html:select> 
			</td> 	
             <td>&nbsp;</td><td>&nbsp;</td>
            </tr> 
            
            <!-- End Santosh ubs limit upload --> 
             <tr class="even">
                  <td class="fieldname">Security 1</td>
                  <td>
                  <integro:empty-if-null value="<%=sec1%>"/>

                  </td>
                  <td class="fieldname">Security 2</td>
                  <td><p>
                   <integro:empty-if-null value="<%=sec2%>"/> 
                  </p></td>
                </tr>
                <tr class="even">
                  <td class="fieldname">Security 3</td>
                  <td>
                  <p>
                   <integro:empty-if-null value="<%=sec3%>"/>
                 </p>
                  </td>
                  <td class="fieldname">Security 4</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec4%>"/> 
                  </p>
                  </td>
                </tr>	
                 <tr class="even">
                  <td class="fieldname">Security 5</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec5%>"/>  
                 </p>
                  </td>
                  <td class="fieldname">Security 6</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec6%>"/> 
                  </p>
                  </td>
                </tr>	
                
                 <tr class="odd">
                  <td class="fieldname">Internal Remarks</td>
                   <td colspan="3"><html:textarea  rows="2" cols="150" property="internalRemarks" disabled="true" /></td> 	
                </tr>
                  
                <tr class="even">
                  <td class="fieldname">Core STP Rejected Reason</td>
                  <%System.out.println("frm coreStpRejectReason:"+frm.getCoreStpRejectedReason()); %>
                   <td colspan="3"><bean:write name="XRefDetailForm" property="coreStpRejectedReason"/>  </td> 	
                 </tr>
                  
                
       </tbody>
      </table>
      <%}%>
     </td>
    </tr>
    <tr>
     <td>
      &nbsp;
     </td>
    </tr>
    
       <tr>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
 <thead>
        <tr>
            <td><h3>CAM Covenant:</h3></td>
        </tr>
    </thead>
    <tbody>
    <tr>
            <td>
                <input class="btnNormal" type="button" name="btnedit_view" id="btnedit_view" value="View" onclick="javascript : viewConvenantScreen('view_covenant_detail_line')">				
            </td>
        </tr>
    </tbody>
</table>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
    </tr>
   
   </tbody>
  </table>
  
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
     <tr> 
     <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
 <tr class="odd">
    
                  <td class="fieldname">Created/Edited By</td>
                  <td>
            
            <integro:empty-if-null value="<%=frm.getCreatedBy()%>"/>
                  </td>
                  <td class="fieldname">Approved By</td>
                     <td>
              
                 <integro:empty-if-null value="<%=frm.getUpdatedBy()%>"/>
                  </td>
                  </tr>
      <tr class="odd">
                  <td class="fieldname">Created/Edited On</td>
                  <td>
             
             <integro:empty-if-null value="<%=frm.getCreatedOn()%>"/>
                  </td>
                  <td class="fieldname">Approved On</td>
                  <td> 
                   
                       <integro:empty-if-null value="<%=frm.getUpdatedOn()%>"/>
                    </td>
                  </tr>
                  </table>
                  </td>
                  </tr></table>
  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
    <td><a href="javascript:cancelSubmit()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>

</body>