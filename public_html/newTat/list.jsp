<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.user.MaintainUserForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 com.integrosys.component.user.app.bus.CommonUserSearchCriteria,
                 java.util.*,
                 java.util.Vector"%>

<%


SearchResult sr = (SearchResult)request.getAttribute("newTatList");
List newTatList=null;
if(sr!=null){
	newTatList = new ArrayList(sr.getResultList());
	pageContext.setAttribute("newTatList",newTatList);
}

    String event = request.getParameter("event");
    
    int sno = 0;
    int startIndexInner = 0;
    String ind= (String) request.getAttribute("startIndexInner");
	if(ind!=null && (!ind.equals("")))
		 startIndexInner = Integer.parseInt(ind);
	
	System.out.print("startIndexInner "+startIndexInner);
	System.out.print(" ind "+ind);
	
	boolean isBranch= false;
	boolean isRM= false;
	boolean isCPU= false;
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    
    HashMap regionMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.regionMap");
    Collection regionList = regionMap.values();
	 HashMap rmMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.rmMap");
	 
	 String teamTypeMemId = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	 
	 System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$teamTypeMemId$$$$$$$$$$$$$$$$$$$$$$$$$$$"+teamTypeMemId);
	 if(teamTypeMemId.equals("1020")){
		 isRM=true;
	 }else  if(teamTypeMemId.equals("1001")||teamTypeMemId.equals("1002")){
		 isBranch=true;
	 }else  if(teamTypeMemId.equals("1006")||teamTypeMemId.equals("1007")||teamTypeMemId.equals("1013")){
		 isCPU=true;
	 }
	 
	 String customerName=(String)request.getAttribute("cusName");
	 if(customerName==null)
		 customerName="";
	 String customerId=(String)request.getAttribute("cusId");
	 if(customerId==null)
		 customerId="";
	 String caseInitiator =(String)request.getAttribute("caseIni");
	 if(caseInitiator==null)
		 caseInitiator="";
	 String lastUpdate=(String)request.getAttribute("lastUpdate");
	 if(lastUpdate==null)
		 lastUpdate="";
	 String region=(String)request.getAttribute("rgn");
	 if(region==null)
		 region="";
	 String status=(String)request.getAttribute("sts");
	 if(status==null)
		 status="";
	 String segment=(String)request.getAttribute("sgmnt");
	 if(segment==null)
		 segment="";
	 String module=(String)request.getAttribute("mdl");
	 if(module==null)
		 module="";
%>



<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatUtil"%>
<%@page import="com.crystaldecisions.enterprise.ocaframework.r"%>
<%@page import="org.apache.struts.util.LabelValueBean"%><html>
<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" -->
<!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" -->
<!-- InstanceParam name="contentHeight" type="text" value="100%" -->
<!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
<!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function createHoliday() {

 	document.forms[0].action="holiday.do?event=maker_prepare_create_holiday";
    document.forms[0].submit();
}
 function searchBranch()
	    {	
	    
		    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
			    {
					alert("Please Enter Value For Search" );
			    }	
		    else
			{    
	     
	        var searchText = document.getElementById("searchText").value;
	        var searchBy = document.getElementById("searchByCriteria").value;
	        
	      
	       
	      
	       document.forms[0].action="systemBank.do?event=maker_search_list_holiday&searchBy="+searchBy+"&searchText="+searchText;
    
    document.forms[0].submit();
			}
	    }
 
 

  function initiate(){
	  
	  document.forms[0].action="NewTat.do?event=initiate_new_tat&auditStartIndex=0&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
	    
  }

  function showAudit(caseid){

	  document.forms[0].action="NewTat.do?event=show_audit_trail&caseid="+caseid+"&auditStartIndex=0&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
	    
  }

  function showCase(caseid,event){

	  document.forms[0].action="NewTat.do?event="+event+"&caseid="+caseid+"&auditStartIndex=0&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
	    
  }  
  
 function process1(id,ifChecked, customerID){

     var id =id;
	 if(ifChecked.value == 'deferralApprove'){
	  document.forms[0].action="NewTat.do?event=prepare_deferral_approve&id="+id+"&customerID="+customerID+"&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
	 }else if (ifChecked.value == 'deferralClearance' ){
	 document.forms[0].action="NewTat.do?event=prepare_deferral_clearance&id="+id+"&customerID="+customerID+"&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
 		}else if (ifChecked.value == 'documentReceive' ){
 			 document.forms[0].action="NewTat.do?event=prepare_document_receive&id="+id+"&customerID="+customerID+"&startIndexInner="+<%=startIndexInner%>;
 		    document.forms[0].submit();
 	 		}
 		else if (ifChecked.value == 'documentScan' ){
 			 document.forms[0].action="NewTat.do?event=prepare_document_scan&id="+id+"&customerID="+customerID+"&startIndexInner="+<%=startIndexInner%>;
 			    document.forms[0].submit();
 		 		}
 		else if (ifChecked.value == 'limitRelease' ){
			 document.forms[0].action="NewTat.do?event=prepare_limit_release&id="+id+"&customerID="+customerID+"&startIndexInner="+<%=startIndexInner%>;
			    document.forms[0].submit();
		 		}
		else if (ifChecked.value == 'deferralRaised' ){
			 document.forms[0].action="NewTat.do?event=prepare_deferral_raised&id="+id+"&customerID="+customerID+"&startIndexInner="+<%=startIndexInner%>;
			    document.forms[0].submit();
		 		}
		else if (ifChecked.value == 'climsUpdated' ){
			 document.forms[0].action="NewTat.do?event=prepare_clims_updated&id="+id+"&customerID="+customerID+"&startIndexInner="+<%=startIndexInner%>;
			    document.forms[0].submit();
		 		}
		
  }
 function getTatList(){
	
		var cusName=document.getElementById('cusName').value;
		cusName = escape(cusName);
		var cusId=document.getElementById('cusId').value;
		cusId = escape(cusId);
		var caseIni=document.getElementById('caseIni').value;
		caseIni = escape(caseIni);
		var lastUpdate=document.getElementById('lastUpdate').value;
		lastUpdate = escape(lastUpdate);
		var rgn=document.getElementById('rgn').value;
		var sts=document.getElementById('sts').value;
		var sgmnt=document.getElementById('sgmnt').value;
		var mdl=document.getElementById('mdl').value;
		
		document.forms[0].action="NewTat.do?event=maker_list_tat&go=Y&cusName="+cusName+"&cusId="+cusId+"&caseIni="+caseIni+"&lastUpdate="+lastUpdate+"&rgn="+rgn+"&sts="+sts+"&sgmnt="+sgmnt+"&mdl="+mdl;
		document.forms[0].submit();
	}
  
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='NewTat.do'>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<!-- InstanceBeginEditable name="menuScript" -->
	<!-- InstanceEndEditable -->
	<table width="100%" height="100%" cellspacing="0" cellpadding="0"
		border="0">

		<tr>
			<td valign="top">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td width="82%">
						<h3>Maintain TAT</h3>
						</td>
						<td width="18%" align="right" valign="bottom"></td>
						<td>&nbsp;</td>

					</tr>

					<tr>
						<td colspan="4">
						<hr />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">

						<table class="tblInput" id="custsearch" style="margin-top: 0px"
							width="95%" border="0" cellspacing="0" cellpadding="0"
							align="center">
							<thead>
								<tr>
									<td colspan="5"><bean:message
										key="label.global.enterSearchCriteria" /></td>
								</tr>
							</thead>
							<tbody>
								<tr class="odd">
									<td class="fieldname"><bean:message key="label.party.name" /></td>
									<td><html:text property="lspShortNameSearch" value="<%=customerName %>"
										maxlength="200" styleId='cusName'
										onkeypress="submitEnterWrapper(event, 1);" /> <html:errors
										property="cusName" /></td>
									<td class="fieldname"><bean:message key="label.party.id" /></td>
									<td><html:text property="lspLeIdSearch" maxlength="200" value="<%=customerId %>"
										styleId='cusId' onkeypress="submitEnterWrapper(event, 1);" />
									<html:errors property="cusName1" /></td>
									<td rowspan="5">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
										name="AddNew3" type="button" id="AddNew3" value="Go"
										class="btnNormal"
										style="margin-right: 5px; margin-left: 10; width: 50px"
										onclick="getTatList()" /> </br>
									</br>
									<%if(isRM){ %> <input name="124" type="button" id="124"
										value="Initiate New Case" class="btnNormal"
										onclick="initiate()" /> <%} %>
									</td>
								</tr>

								<tr class="even">
									<td class="fieldname">Case Initiator</td>
									<td><html:text property="caseInitiatorSearch" value="<%=caseInitiator %>"
										styleId='caseIni' maxlength="50"
										onkeypress="submitEnterWrapper(event, 1);" /> <html:errors
										property="cusName2" /></td>
									<td class="fieldname">Last Updated By</td>
									<td><html:text property="lastUpdateBySearch" value="<%=lastUpdate %>"
										styleId='lastUpdate' maxlength="200"
										onkeypress="submitEnterWrapper(event, 1);" /> <html:errors
										property="cusName3" /></td>
								</tr>

								<tr class="odd">
									<td class="fieldname">Region</td>
									<td><html:select property="regionSearch" styleId='rgn'
										style="width:250px">

										<option value="">Please Select</option>

										<% Iterator it = regionMap.entrySet().iterator();
    while (it.hasNext()) {
        Map.Entry pairs = (Map.Entry)it.next();
        System.out.println(pairs.getKey() + " = " + pairs.getValue());
       
     %>
										<%if(region!=null && region.equals(pairs.getKey())){ %>
										<option value="<%=pairs.getKey()%>" selected="selected"><%=pairs.getValue() %>
										</option>
										<%}else{ %>
										<option value="<%=pairs.getKey()%>"><%=pairs.getValue() %>
										</option>


										<%
											}
			                         } %>


									</html:select> <html:errors property="cusName" /></td>
									<td class="fieldname">Status</td>
									<td><html:select property="statusSearch" styleId='sts'
										style="width:250px">
										<%if(status==null || "".equals(status)){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option><!--
										<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("DEFERRAL_RAISED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED" selected="selected">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("CLOSED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED" >Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED" selected="selected">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("LIMIT_RELEASED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED" >Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED" selected="selected">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("CLIMS_UPDATED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED" >Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED" selected="selected">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option><!--
										<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
									
										<%} else if(status!=null && status.equals("DOCUMENT_SUBMITTED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED" selected="selected">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("DOCUMENT_RECEIVED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED" selected="selected">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option><!--
										<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("DEFERRAL_APPROVED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED" selected="selected">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										
										<%} else if(status!=null && status.equals("DOCUMENT_SCANNED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED" selected="selected">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("DOCUMENT_RERECEIVED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED"  selected="selected">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("DOCUMENT_RESUBMITTED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED" selected="selected">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED"  selected="selected">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										
										<%} else if(status!=null && status.equals("DOCUMENT_RESCANNED")){ %>
										<option value="">Please Select</option>
										<option value="DEFERRAL_RAISED">Deferral Raised</option>
										<option value="DOCUMENT_SUBMITTED">Document Submitted</option>
										<option value="DOCUMENT_RECEIVED">Document Received</option>
										<option value="DEFERRAL_APPROVED">Deferral Approved</option>
										<option value="DOCUMENT_SCANNED" selected="selected">Document Scanned</option>
										<option value="CLIMS_UPDATED">Clims Updated</option>
										<option value="LIMIT_RELEASED">Limit Released</option>
										<!--<option value="CLOSED">Document Closed</option>
										--><option value="DOCUMENT_RESUBMITTED">Document Re-Submitted</option>
										<option value="DOCUMENT_RESCANNED"  selected="selected">Document Re-Scanned</option>
										<option value="DOCUMENT_RERECEIVED">Document Re-Received</option>
										<%} %>



									</html:select><html:errors property="cusName4" /></td>
								</tr>

								<tr class="even">
									<td class="fieldname">Segment</td>
									<td><html:select property="segmentSearch"  styleId='sgmnt' value="<%=segment %>">
										<integro:common-code
											categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
											descWithCode="false" />
									</html:select> <html:errors property="cusName5" /></td>
									<td class="fieldname">Module</td>
									<td><html:select property="moduleSearch" styleId='mdl'
										style="width:250px">
										<%if(module==null || "".equals(module)){ %>
										<option value="">Please Select</option>
										<option value="LIMIT">Limit Release</option>
										<option value="PDDC">Post Disbursal Deferral
										Clearance</option>
										<option value="CAM">CAM Module</option>
										<%} else if(module!=null && module.equals("LIMIT")){ %>
										<option value="">Please Select</option>
										<option value="LIMIT" selected="selected">Limit
										Release</option>
										<option value="PDDC">Post Disbursal Deferral
										Clearance</option>
										<option value="CAM">CAM Module</option>
										<%} else if(module!=null && module.equals("PDDC")){ %>
										<option value="">Please Select</option>
										<option value="LIMIT">Limit Release</option>
										<option value="PDDC" selected="selected">Post
										Disbursal Deferral Clearance</option>
										<option value="CAM">CAM Module</option>
										<%} else if(module!=null && module.equals("CAM")){ %>
										<option value="">Please Select</option>
										<option value="">Please Select</option>
										<option value="LIMIT">Limit Release</option>
										<option value="PDDC">Post Disbursal Deferral
										Clearance</option>
										<option value="CAM" selected="selected">CAM Module</option>

										<%} %>



									</html:select><html:errors property="cusName" /></td>
								</tr>


							</tbody>
						</table>


						</td>
					</tr>


					<tr>
						<td colspan="2">&nbsp; </br>
						</td>

					</tr>





					<tr>
						<td colspan="4">
						<table width="95%" border="0" cellspacing="0" cellpadding="0"
							class="tblInfo" align="center">
							<thead>
								<tr>
									<td width="3%">S/N</td>
									
									<td width="7%">Party Id</td>
									<td width="7%">Party Name</td>
									<td width="7%">Region</td>
									<td width="7%">Owner Name</td>
									<td width="7%">Segment</td>
									<td width="8%">Case Id</td>
									<td width="10%">Module</td>
									<td width="8%">Status</td>
									<td width="10%">Case Initiator</td>
									<td width="10%">Last Updated By</td>
									<td width="8%">Action</td>
									<td width="10%">Remarks</td>
									<td width="10%">Audit Trail</td>

								</tr>
							</thead>
							<tbody>
								<logic:present name="newTatList">
									<logic:iterate id="ob" name="newTatList" length="10"
										offset="<%=String.valueOf(startIndexInner)%>" indexId="counter"
										type="com.integrosys.cms.app.newTat.bus.OBNewTat" scope="page">
										<%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                           // boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                        %>
										<tr class="<%=rowClass%>">
											<td class="index"><%=counter.intValue()+1%></td>
											
											<td><%=ob.getLspLeId()%>&nbsp;</td>
											<td><%=ob.getLspShortName()%>&nbsp;</td>
											<td><integro:empty-if-null
												value="<%=regionMap.get(ob.getRmRegion()) %>" />&nbsp;</td>
										<td><integro:empty-if-null
												value="<%=rmMap.get(ob.getRelationshipManager()) %>" />&nbsp;</td>
												
											<td>
											
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode="<%=ob.getSegment()%>"
												descWithCode="false"  display="true"/>
											
											
											</td>


											<td><%=ob.getCaseId()%>&nbsp;</td>
											<td>
											<%
									if("CAM".equals(ob.getModule())){
									%>CAM Module<%	
										
									}else if("PDDC".equals(ob.getModule())){
									%>Post Disbursal Deferral Clearance<%	
									}else if("LIMIT".equals(ob.getModule())){
									%>Limit Release<%	
									} 
                                  %> &nbsp;</td>
											<td><integro:empty-if-null
												value="<%=NewTatUtil.getStatusName(ob.getStatus(),ob.getType())%>" />
											&nbsp;</td>
											<td><integro:empty-if-null
												value="<%=NewTatUtil.getUserName(ob.getCaseInitiator())%>" />&nbsp;
											</td>
											<td><integro:empty-if-null
												value="<%=NewTatUtil.getUserName(ob.getLastUpdateBy())%>" />&nbsp;
											</td>
											<td>
											<%
                                   String id = String.valueOf(ob.getId());
                                   if(isRM){
                                             if(ob.getStatus().equals("DEFERRAL_RAISED") && ob.getModule().equals("LIMIT")){ %>
											<select onchange="javascript:process1('<%=id%>',this,'<%=ob.getCmsLeMainProfileId()%>')">
												<option value="">Please Select</option>
												<option value="deferralApprove">Deferral Approved</option>
												<option value="deferralClearance">Deferral
												Clearance</option>
											</select>
											 <%}else{ %>
											 
											 
											 <% if(ob.getStatus().equals("LIMIT_RELEASED")){ %>
											   <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_cpu');">View  </a>
											    <%}else{ %>
											     <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_rm');">View  </a>
								<%}}}else if(isBranch){
                                if(ob.getStatus().equals("DOCUMENT_SUBMITTED") ){ %>
											<select onchange="javascript:process1('<%=id%>',this,'<%=ob.getCmsLeMainProfileId()%>')">
												<option value="">Please Select</option>
												<%if(ob.getType()==null || !ob.getType().equals("FTNR")){ %>
												<option value="documentReceive">Document Receive</option>
												<%}else{ %>
												<option value="documentReceive">Document
												Re-Receive</option>

												<%} %>
											</select> <%}else if(ob.getStatus().equals("DOCUMENT_RECEIVED") ){ %> <select
												onchange="javascript:process1('<%=id%>',this,'<%=ob.getCmsLeMainProfileId()%>')">
												<option value="">Please Select</option>
												<%if(ob.getType()==null || !ob.getType().equals("FTNR")){ %>
												<option value="documentScan">Document Scan</option>
												<%}else{ %>
												<option value="documentScan">Document Re-Scan</option>

												<%} %>

											</select>
											     <%} else{ %>
											      <% if(ob.getStatus().equals("LIMIT_RELEASED")){ %>
											   <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_cpu');">View  </a>
											    <%}else{ %>
											     <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_branch');">View  </a>
											      <%}}
                                
							}else if(isCPU){
								if("LIMIT".equals(ob.getModule())){
	                                if(ob.getStatus().equals("DOCUMENT_SCANNED") ||ob.getStatus().equals("DEFERRAL_APPROVED") ){ %>
	                                <select onchange="javascript:process1('<%=id%>',this,'<%=ob.getCmsLeMainProfileId()%>')">
										  <option value="">Please Select</option>
										  <option value="limitRelease" >Limit Release</option>
										  <option value="deferralRaised" >Deferral Raised</option>
										</select>
								
								 
								<%}else{ %>
								  <% if(ob.getStatus().equals("LIMIT_RELEASED")){ %>
											   <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_cpu');">View  </a>
											    <%}else{ %>
											     <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_branch');">View  </a>
								
								<%}}
	                                
									
									}else if("CAM".equals(ob.getModule()) || "PDDC".equals(ob.getModule())){ 
								if(ob.getStatus().equals("DOCUMENT_SCANNED") ||ob.getStatus().equals("DEFERRAL_APPROVED") ){ %>
	                                <select onchange="javascript:process1('<%=id%>',this,'<%=ob.getCmsLeMainProfileId()%>')">
										  <option value="">Please Select</option>
										  <option value="climsUpdated" >CLIMS Updated</option>
										  <option value="deferralRaised" >Deferral Raised</option>
										</select>
								
								<%}else if(ob.getStatus().equals("DEFERRAL_RAISED") ){ %>
							<select onchange="javascript:process1('<%=id%>',this,'<%=ob.getCmsLeMainProfileId()%>')">
										  <option value="">Please Select</option>
										  <option value="climsUpdated" >CLIMS Updated</option>
										</select>
								<%}else{ %>
								 <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_branch');">View  </a>
								<%}}else{ %>
								 <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_branch');">View  </a>
								
								<%}} else{ %>
											      <a href="javascript:showCase('<%=String.valueOf(ob.getCaseId())%>','show_case_branch');">View  </a>
											      <%}%>
											</td>
											<td><integro:wrapper lineLength="50" value="<%=ob.getRemarks()%>"   />&nbsp;
											</td>
											<td>
											
											
											
											 <a href="javascript:showAudit('<%=String.valueOf(ob.getCaseId())%>');">View  </a>
											
											</td>
										</tr>
									</logic:iterate>
									<% if (sno == 0 ) { %>
									<tr class="odd">
										<td colspan="13"><bean:message
											key="label.global.not.found" /></td>
									</tr>
									<% } %>
								</logic:present>
								<logic:notPresent name="newTatList">
									<tr class="odd">
										<td colspan="13"><bean:message
											key="label.global.not.found" /></td>
									</tr>
								</logic:notPresent>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>
			<!-- InstanceEndEditable --></td>
		</tr>
		<logic:present name="newTatList">
			<tr>
				<td height="25"><!-- InstanceBeginEditable name="GeneralPurposeBar" -->
				<table id="generalPurposeBar" width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr>
<td width="3" valign="middle" ></td>

						<%
                            String pageIndexUrl=null;
                            pageIndexUrl = "NewTat.do?event=pagination&startIndexInner=";
                           System.out.println(pageIndexUrl);
                           System.out.println(sr.getNItems());
                        %>
						<td width="100" >&nbsp;<integro:pageindex
							pageIndex='<%=new PageIndex(startIndexInner,10, newTatList.size())%>'
							url='<%=pageIndexUrl%>' /></td>

					</tr>
				</table>
				</td>
			</tr>
		</logic:present>
	</table>

	</body>
</html:form>
<!-- InstanceEnd -->
</html>
