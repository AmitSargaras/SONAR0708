<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.user.app.constant.UserConstant,
                 com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
                 com.integrosys.cms.app.user.trx.OBUserTrxValue,
                 java.util.List,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,                 
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatForm"%>

<%
	String context = request.getContextPath() + "/";
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	//ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	 HashMap regionMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.regionMap");
	 HashMap rmMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.rmMap");
	 HashMap branchListValues=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.branchListValues");
	 HashMap facilityNameMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityNameMap");
	 int startIndexInner = 0;
	   
	    String ind= (String) request.getAttribute("startIndexInner");
	  
		if(ind!=null && (!ind.equals("")))
			startIndexInner = Integer.parseInt(ind);
	 
	 NewTatForm tat = (NewTatForm) request.getAttribute("NewTatForm");
	 String event = (String) request.getAttribute("event");
	 String valueFTNR="";
	 if(tat!= null && tat.getType()!=null){
	 valueFTNR=tat.getType();
	 }
	 List relationshipMgrList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.relationshipMgrList");
	 if (!(relationshipMgrList == null)) {
			
			pageContext.setAttribute("relationshipMgrList", relationshipMgrList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("relationshipMgrList", new ArrayList());
		 
	 }
	 
	 
	 List facilityCategoryList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityCategoryList");
	 if (!(facilityCategoryList == null)) {
			
			pageContext.setAttribute("facilityCategoryList", facilityCategoryList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("facilityCategoryList", new ArrayList());
		 
	 }
	 
	 List facilityNameList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.facilityNameList");
	 if (!(facilityNameList == null)) {
			
			pageContext.setAttribute("facilityNameList", facilityNameList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("facilityNameList", new ArrayList());
		 
	 }
	 
	 List CAMTypeList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.CAMTypeList");
	 if (!(CAMTypeList == null)) {
			
			pageContext.setAttribute("CAMTypeList", CAMTypeList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("CAMTypeList", new ArrayList());
		 
	 }
	 
	 List DeferralTypeList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.DeferralTypeList");
	 if (!(DeferralTypeList == null)) {
			
			pageContext.setAttribute("DeferralTypeList", DeferralTypeList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("DeferralTypeList", new ArrayList());
		 
	 }
	 
	 List LSSCoOrdinatorBranchList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.LSSCoOrdinatorBranchList");
	 if (!(LSSCoOrdinatorBranchList == null)) {
			
			pageContext.setAttribute("LSSCoOrdinatorBranchList", LSSCoOrdinatorBranchList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("LSSCoOrdinatorBranchList", new ArrayList());
		 
	 }
%>


<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatUtil"%><html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
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
function cancelPage(){
    document.forms[0].action="NewTat.do?event=list_cancel&startIndexInner="+<%=startIndexInner%>;
    
    document.forms[0].submit();
}

function myFunction(){
var a = '<%=event%>';
var valueFTNR = '<%=valueFTNR%>';
var answer='';
if(a == 'prepare_deferral_approve'){
	document.forms[0].action="NewTat.do?event=deferral_approve&startIndexInner="+<%=startIndexInner%>;
    document.forms[0].submit();
  }
  else if(a == 'prepare_deferral_clearance'){
		document.forms[0].action="NewTat.do?event=deferral_clearance&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
  }else if(a == 'prepare_document_receive'){

	    var status= document.NewTatForm.status[1].checked;

	  if(status){
		  var answer=confirm("Do you want to close the documents ?");
		  
	  }else{
				if(valueFTNR=='FTNR'){
					  var answer=confirm("Do you really want to Re-Receive the documents ?");
				}else{
					var answer=confirm("Do you really want to Receive the documents ?");
				}
	  		}
		
		if (answer==true)
		    {
		     
			document.forms[0].action="NewTat.do?event=confirm_document_receive&startIndexInner="+<%=startIndexInner%>;
		    document.forms[0].submit();
		    }




  }else if(a == 'prepare_document_scan'){

	  if(valueFTNR=='FTNR'){
		  var answer=confirm("Do you want to Re-Scan the documents ?");
	}else{
		var answer=confirm("Do you want to Scan the documents ?");
	}
	  if (answer==true)
	    {
		document.forms[0].action="NewTat.do?event=confirm_document_scan&startIndexInner="+<%=startIndexInner%>;
	    document.forms[0].submit();
	    }
}
}


function enbleBtn(ifChecked){
	if(ifChecked == 1){
		
		document.getElementById('fCategory').style.display = ''
		document.getElementById('fName').style.display = ''
		document.getElementById('deferralType').style.display = 'none'
		document.getElementById('CAMType').style.display = 'none'
	}else if (ifChecked == 2 ){
	
		document.getElementById('fCategory').style.display = 'none'
			document.getElementById('fName').style.display = 'none'
			document.getElementById('deferralType').style.display = ''
			document.getElementById('CAMType').style.display = 'none'	
	}else if (ifChecked == 3 ){
		
		document.getElementById('fCategory').style.display = 'none'
			document.getElementById('fName').style.display = 'none'
			document.getElementById('deferralType').style.display = 'none'
			document.getElementById('CAMType').style.display = ''
	}
}

//-->
</script>
<style type="text/css">
<!--
.hiddenDiv {
	display: none;
}

.visibleDiv {
	display: block;
	border: 1px grey solid;
}

.style1 {
	color: #FF0000
}

.style5 {
	color: #FF0000
}

.style11 {
	color: #FF0000
}
-->
</style>
<!-- InstanceEndEditable -->
</head>

<html:form action="/NewTat">
	<body>

	<!-- InstanceBeginEditable name="Content" -->
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<%if("prepare_document_scan".equals(event)){
								if(tat != null && tat.getType()!=null && tat.getType().trim().equals("FTNR")){
								%>
								<h3>Document Re-Scan</h3>
								<%}else{ %>
							<h3>Document Scan</h3>
							<%}}else{
								if(tat != null && tat.getType()!=null && tat.getType().trim().equals("FTNR")){
								%>
							<h3>Document Re-Receive/Return</h3>
								<%}else{ %>
							<h3>Document Receive/Return</h3>
							<% } } %>
				</td>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInput" id="choiceTable">
					<thead>
					</thead>
					<tbody>

						<tr class="odd">

							<td class="fieldname" width="20%">Party Name: </td>
							<td width="30%"><integro:empty-if-null
								value="<%=tat.getLspShortName() %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Party Id: </td>
							<td width="30%"><integro:empty-if-null
								value="<%=tat.getLspLeId() %>" />&nbsp;</td>

						</tr>
						
						<tr class="odd">

							<td class="fieldname" width="20%">Region: </td>
							<td width="30%"><integro:empty-if-null
								value="<%=regionMap.get(tat.getRmRegion()) %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Segment: </td>
							<td width="30%"><integro:common-code-single
								categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
								descWithCode="false" display="true"
								entryCode="<%=tat.getSegment() %>" />&nbsp;</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="20%">Module: </td>
							<td width="25%">
							<%if( tat.getModule()==null || tat.getModule().equalsIgnoreCase("LIMIT")){
											%> Limit
							Release <%
										}
										else if( tat.getModule().equalsIgnoreCase("PDDC") ){
					                  	%> Post Disbursal Deferral Clearance <%
										}else if( tat.getModule().equalsIgnoreCase("CAM") ){
					                  	%> CAM Module <%}%> <br>
							<html:errors property="moduleError" /></td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Relationship Manager: </td>
							<td width="30%">
							 <integro:empty-if-null
								value="<%=rmMap.get(tat.getRelationshipManager()) %>" />&nbsp;
							<html:errors property="relationshipMgrError" /></td>

						</tr>

						<tr class="odd">

							<td class="fieldname" width="20%">Case Initiator: </td>
							<td width="30%"><integro:empty-if-null value="<%=NewTatUtil.getUserName(tat.getCaseInitiator())%>"/>&nbsp;</td>

						</tr>
						
						<tr class="even">

							<td class="fieldname" width="20%">Case Id: </td>
							<td width="30%"><integro:empty-if-null value="<%=tat.getId()%>"/>&nbsp;</td>

						</tr>
						
						<% if(tat.getModule()==null || tat.getModule().equalsIgnoreCase("LIMIT") ){  %>
						<tr class="odd" id="fCategory">

							<td class="fieldname" width="20%">Facility Selected By RM: </td>
							<td><integro:empty-if-null value="<%=facilityNameMap.get(tat.getFacilityName()) %>"/>&nbsp;
							<html:errors property="newFacilityCategoryError" /></td>

						</tr>

						<%}else if(tat.getModule().equalsIgnoreCase("CAM")){ %>
						<tr class="odd" id="fCategory" >

							<td class="fieldname" width="20%">CAM Type: </td>
							<td>
							<integro:empty-if-null value="<%=tat.getCamType() %>"/>
							&nbsp;</br>
							</td>

						</tr>

						<%}else if(tat.getModule().equalsIgnoreCase("PDDC") ){  %>
						<tr class="odd" id="deferralType">

							<td class="fieldname" width="20%">Deferral Type: </td>

<td>
<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" entryCode="<%=tat.getDeferralType()%>" display="true" descWithCode="false"  />
							
							&nbsp;
							</br>
							
							</td>



						</tr>

						<%}%>
						<tr class="even">

							<td class="fieldname" width="20%">Last Action: </td>
							<td width="30%"><integro:empty-if-null value="<%=NewTatUtil.getStatusName(tat.getStatus(),tat.getType()) %>"/> <br>
							</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="20%">Last Updated By: </td>
							<td><integro:empty-if-null value="<%=NewTatUtil.getUserName(tat.getLastUpdateBy()) %>"/>&nbsp;
							<br>
							</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">Status Updated To: </td>
							<td width="30%">
							<%if("prepare_document_scan".equals(event)){
								if(tat.getType()!=null && tat.getType().trim().equals("FTNR")){
								%>
								Document Re-Scanned
								<%}else{ %>
							Document Scanned
							<%}}else{
								if(tat.getType()!=null && tat.getType().trim().equals("FTNR")){
								%>
								<input type="radio"  name ="status" value="DOCUMENT_RECEIVED" checked="checked">Document Re-Received
							<input type="radio"  name ="status" value="CLOSED">Document Returned
								<%}else{ %>
							<input type="radio"  name ="status" value="DOCUMENT_RECEIVED" checked="checked">Document Received
							<input type="radio"  name ="status" value="CLOSED">Document Returned
							<% } } %>
							&nbsp;
							 <br>
							</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="20%">LSS Co-ordinator Branch: </td>
							<td width="30%"><integro:empty-if-null value="<%=branchListValues.get(tat.getLssCoordinatorBranch()) %>"/> <br>
							</td>

						</tr>
						
						<tr class="odd">

							<td class="fieldname" width="20%">Remarks:</td>
							<td><html:textarea property="remarks" rows="6" cols="100"></html:textarea>&nbsp;
							<br>
							<html:errors property="remarksLengthError"/>
							</td>

						</tr>
						<html:hidden property="versionTime" />
<html:hidden property="id" />
<html:hidden property="createBy"  />
<html:hidden property="creationDate" />
<html:hidden property="lastUpdateBy" value="<%=user.getLoginID() %>" />
<html:hidden property="lastUpdateDate" />
<html:hidden property="deprecated" value="N" />
<html:hidden property="status" />
<html:hidden property="cmsLeMainProfileId" />
<html:hidden property="lspLeId" value="<%=tat.getLspLeId()%>"/>
<html:hidden property="lspShortName" value="<%=tat.getLspShortName() %>"/>
<html:hidden property="caseId" />
<html:hidden property="module" />
<html:hidden property="caseInitiator" />
<html:hidden property="relationshipManager"/>
<html:hidden property="docStatus" />
<html:hidden property="remarks" />
<html:hidden property="facilityCategory" />
<html:hidden property="facilityName" />
<html:hidden property="camType" />
<html:hidden property="deferralType" />
<html:hidden property="lssCoordinatorBranch" />
<html:hidden property="type" />
<html:hidden property="activityTime" />
<html:hidden property="actualActivityTime" />
<html:hidden property="facilitySystem" />
<html:hidden property="facilityManual" />
<html:hidden property="amount" />
<html:hidden property="currency" />
<html:hidden property="lineNumber" />
<html:hidden property="serialNumber" />
<html:hidden property="segment" />
<html:hidden property="region" value="<%=tat.getRegion()%>"/>
<html:hidden property="rmRegion" value="<%=tat.getRmRegion()%>"/>
</tbody>
				</table>
				</td>
			</tr>


		</tbody>
	</table>

	<table width="130" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="65">&nbsp;</td>
			<td width="65">&nbsp;</td>
		</tr>
		<tr>
		
			<td colspan="4"><a href="#" onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
				onClick=" myFunction()"><img src="img/submit1.gif"
				name="Image3311" border="0" id="Image3311" /> </a>&nbsp;&nbsp;</td>
			
			<td colspan="4"><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
			</a> &nbsp;&nbsp;</td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>


	<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
