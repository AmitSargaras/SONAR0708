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
	 NewTatForm tat = (NewTatForm) request.getAttribute("NewTatForm");
	 String event = (String) request.getAttribute("event");
	 List relationshipMgrList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.relationshipMgrList");
	 if (!(relationshipMgrList == null)) {
			
			pageContext.setAttribute("relationshipMgrList", relationshipMgrList);
			//request.setAttribute("otherBankList", otherBankList);
		}
	 
	 else{
		 pageContext.setAttribute("relationshipMgrList", new ArrayList());
		 
	 }
	 
	 List branchList = (List) session
		.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.branchList");
	 
	
	 if (!(branchList == null)) {
			pageContext.setAttribute("branchList", branchList);
		}
	 else{
		 pageContext.setAttribute("branchList", new ArrayList());
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
	 
	 int startIndexInner = 0;
	   
	    String ind= (String) request.getAttribute("startIndexInner");
	  
		if(ind!=null && (!ind.equals("")))
			 startIndexInner = Integer.parseInt(ind);
%>


<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
if(a == 'prepare_deferral_approve'){
	document.forms[0].action="NewTat.do?event=deferral_approve&startIndexInner="+<%=startIndexInner%>;
    document.forms[0].submit();
  }
  else if(a == 'prepare_deferral_clearance'){

	  var r=confirm("Do you want to Re-submit the documents ?");
	  if (r==true)
	    {
		  document.forms[0].action="NewTat.do?event=deferral_clearance&startIndexInner="+<%=startIndexInner%>;
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
			<%if(event.equals("prepare_deferral_clearance")){ %>
							<td width="30%"><h3>Document Re-Submit</h3>&nbsp;</td>
<%}else{ %>
<td width="30%"><h3>Deferral Approve</h3>&nbsp;</td>
<%} %>
		
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

							<td class="fieldname" width="10%">Party Name: </td>
							<td width="30%"><integro:empty-if-null
								value="<%=tat.getLspShortName() %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Party Id: </td>
							<td width="30%"><integro:empty-if-null
								value="<%=tat.getLspLeId() %>" />&nbsp;</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="10%">Segment: </td>
							<td width="30%"><integro:common-code-single
								categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
								descWithCode="false" display="true"
								entryCode="<%=tat.getSegment() %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Region: </td>
							<td width="30%"><integro:empty-if-null
								value="<%=regionMap.get(tat.getRmRegion()) %>" />&nbsp;</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Module: </td>
							<td width="25%">
							 Limit Release
							</td>

						</tr>
						<tr class="odd">

							<td class="fieldname" width="10%">Relationship Manager: </td>
							<td width="30%">
							<%if(rmMap.get(tat.getRelationshipManager())==null ){ %> <html:select
								name="NewTatForm" property="relationshipManager"
								style="width:250px">
								<option value="">Please Select</option>
								<html:options collection="relationshipMgrList"
									labelProperty="label" property="value" />
							</html:select> <br>
							<%}else{ %> <integro:empty-if-null
								value="<%=rmMap.get(tat.getRelationshipManager()) %>" />&nbsp;
							<%} %> <html:errors property="relationshipMgrError" /></td>

						</tr>

						<tr class="even">

							<td class="fieldname" width="10%">Case Initiator: </td>
							<td width="30%"><integro:empty-if-null
								value="<%=user.getUserName() %>" />&nbsp;</td>

						</tr>
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

							<td class="fieldname" width="10%">Status Updated to :</td>
								  <%if(event.equals("prepare_deferral_clearance")){ %>
							<td width="30%">Deferral Clearance&nbsp;</td>
<%}else{ %>
<td width="30%">Deferral Approved&nbsp;</td>
<%} %>
						</tr>
						
					<tr class="odd" id="fCategory">

							<td class="fieldname" width="20%">Facility Selected By RM: </td>
							<td><integro:empty-if-null value="<%=facilityNameMap.get(tat.getFacilityName()) %>"/>&nbsp;
							<html:errors property="newFacilityCategoryError" /></td>

						</tr>
						
						<tr class="even">

							<td class="fieldname" width="10%">LSS Coordinator Branch: </td>
							<td width="30%"><integro:empty-if-null value="<%=branchListValues.get(tat.getLssCoordinatorBranch()) %>"/> <br>
							</td>

						</tr>
						<tr class="even">

							<td class="fieldname" width="10%">Remarks: </td>
							<td><html:textarea property="remarks" rows="6" cols="100"></html:textarea>&nbsp;
							<br>
							<html:errors property="remarksLengthError" /></td>

						</tr>
						
						<%
						SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//dd/MM/yyyy
					    Date now = new Date();
					    String strDate = sdfDate.format(now);
						%>
						<html:hidden property="versionTime" />
<html:hidden property="id" />
<html:hidden property="createBy" value="<%=user.getLoginID() %>" />
<html:hidden property="creationDate" value="<%=tat.getLastUpdateDate()%>"/>
<html:hidden property="lastUpdateBy" value="<%=user.getLoginID() %>" />
<html:hidden property="lastUpdateDate" value="<%=strDate%>"/>
<html:hidden property="deprecated" value="N" />
<html:hidden property="status" />
<html:hidden property="cmsLeMainProfileId" />
<html:hidden property="lspLeId" value="<%=tat.getLspLeId()%>"/>
<html:hidden property="lspShortName" value="<%=tat.getLspShortName() %>"/>
<html:hidden property="caseId" />
<html:hidden property="module" />
<html:hidden property="caseInitiator" value="<%=user.getLoginID() %>"/>
<html:hidden property="relationshipManager" value="<%=tat.getRelationshipManager() %>"/>
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
<html:hidden property="segment" value="<%=tat.getSegment()%>"/>
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
