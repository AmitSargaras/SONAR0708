
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationForm,com.integrosys.cms.app.caseCreationUpdate.trx.ICaseCreationTrxValue,com.integrosys.cms.app.caseCreationUpdate.trx.OBCaseCreationTrxValue"%>
<%

	MaintainCaseCreationForm caseCreationUpdateForm = (MaintainCaseCreationForm) request
			.getAttribute("MaintainCaseCreationForm");
ICaseCreationTrxValue caseCreationUpdateTrx = (ICaseCreationTrxValue)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.ICaseCreationTrxValue");

SearchResult searchResult = (SearchResult )session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.searchResultCaseCreation");
HashMap typeMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.typeMap");
HashMap facilityNameMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.facilityNameMap");
HashMap securityTypeMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.securityTypeMap");
List receivedLists=(List) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.receivedList");
List branchList = (List)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.branchList");

pageContext.setAttribute("branchList",branchList);	
String coordinator1Name = (String) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.coordinator1Name"); 
String coordinator2Name = (String) session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.coordinator2Name"); 
	String submitEvent = "checker_approve_edit";

	String rejectEvent = "checker_reject_edit";
	int counter = 0;
	int noofItems = 0;
	int index = 0;
	int sno = 0;
	int startInd = 0;

	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;

	if (searchResult != null) {
		resultList = searchResult.getResultList();
		System.out.println("searchResult:::::::::::"+resultList.size());
		startInd = searchResult.getStartIndex();
		totalCount = searchResult.getNItems();
		listSize = resultList.size();
		pageContext
				.setAttribute("imageListSize", Integer.toString(listSize));
		pageContext.setAttribute("globalDocChkList", resultList);
	}
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
HashMap checklistItemMap = new HashMap();
	// System.out.println("value of records_per_page"+records_per_page);
	  ICheckListItem[] actualItems = new OBCheckListItem[receivedLists.size()];
    for(int i=0;i<receivedLists.size();i++){
    	actualItems[i]=(ICheckListItem)receivedLists.get(i);
    	checklistItemMap.put(String.valueOf(actualItems[i].getCheckListItemID()),actualItems[i]);
    }
%>



<%@page import="com.integrosys.cms.app.caseCreationUpdate.bus.ICaseCreation"%>
<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.cms.app.checklist.bus.ICheckListItem"%>
<%@page import="com.integrosys.cms.app.checklist.bus.OBCheckListItem"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
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
    document.forms[0].action="caseCreationUpdate.do?event=maker_list_caseCreationUpdate";
    
    document.forms[0].submit();
}
function approvePage() {
	
    document.forms[0].action="caseCreationUpdate.do?event=<%=submitEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="caseCreationUpdate.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=totrack";
    document.forms[0].submit();
}

//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='caseCreationUpdate.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					
					<br>
					<br>
					<tr>
						<td>
							<h3>
								Maintain Case Creation
							</h3>
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
								class="tblInput">
								<thead>
								</thead>
								<tbody>
											<tr class="odd">

												<td class="fieldname" width="20%">
													Case Id
												</td>
												<td width="30%">
												<%if(caseCreationUpdateTrx.getCaseCreation()!=null){ %>
												<%=caseCreationUpdateTrx.getCaseCreation().getId()%>
												<%} %>
												&nbsp;
												</td>
												
											</tr>
											
											
											<tr class="odd">
												<td class="fieldname" >Status&nbsp;</td>
								              	<td >
								              <%
								              if(caseCreationUpdateTrx.getCaseCreation()==null){
								              if(!caseCreationUpdateForm.getStatus().trim().equalsIgnoreCase("CLOSED")){ %>
								              Open
								              <%}else{ %>
								              Closed
								              <%}} else{
								              if(!caseCreationUpdateTrx.getCaseCreation().getStatus().trim().equalsIgnoreCase("CLOSED")){ %>
								              Open
								              <%}else{ %>
								              Closed
								              <%}} %>
								              &nbsp;
								              
								              
								              </td>
								              
								              </tr>	
              
              <tr >
    <td colspan="2">
    <%if(resultList.size()>9){ %>
    <div  id="listingTable" style="width:100%; height:200px; overflow-x:hidden;overflow-y:scroll">
    <%} %>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
        	<td>S/N</td>
        
<!--        	<td>Doc Code</td>-->
        	<td>Description</td>
        	<td>Document Type</td>
        	<td>Facility Name</td>
        	<td>Security Type </br>-</br> Sub Type</td>
        	
<td>Status</td>
<td>CPUT Requested Date</td>
<td>Branch Sent Date</td>
<td>CPUT Received Date</td>
        	
        </tr>
    </thead>
    <tbody>
  <%int counter1 = 0; %>
<logic:present name="globalDocChkList">
   <logic:iterate id="OB" name="globalDocChkList"  type="com.integrosys.cms.app.caseCreation.bus.ICaseCreation" scope="page" length="10" offset="<%=String.valueOf(startIndex)%>" >
   <%
   
   ICheckListItem actualItem=(ICheckListItem) checklistItemMap.get(String.valueOf(OB.getChecklistitemid()));
       String rowClass="";
   counter1++;
      if(counter1%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }
      boolean isCPUTRequested=false;
      boolean isBranchSent=false;
      boolean isCPUTReceived=false;
      boolean isDocMaintained=false;
      boolean isCaseDate=false;
      boolean isReqDate=false;
      boolean isSentDate=false;
      boolean isRecDate=false;
      boolean isWrongRequest=false;
      boolean isWrongRequestAccepted=false;
      boolean itemNotFound= false;
      if(actualItem!=null){
    	  
    	 isDocMaintained=true;

    	 if(OB.getCaseDate()!=null){
    	 	isCaseDate=true;
    	 }
    	 if(OB.getRequestedDate()!=null){
    	 	isReqDate=true;
    	 }
    	 if(OB.getDispatchedDate()!=null){
    	 	isSentDate=true;
    	 }
    	 if(OB.getReceivedDate()!=null){
    	 	isRecDate=true;
    	 }

    	 if("1".equals(OB.getStatus())){
    	 	isCPUTRequested=true;
    	 }
    	 if("2".equals(OB.getStatus())){
    	 	isBranchSent=true;
    	 }
    	 if("3".equals(OB.getStatus())){
    	 	isCPUTReceived=true;
    	 }
    	 if("4".equals(OB.getStatus())){
    		 isWrongRequest=true;
     	 }
    	 if("5".equals(OB.getStatus())){
    		 isWrongRequestAccepted=true;
     	 }
    	 }else{
    		 itemNotFound=true;
    	 }
      
      if(!itemNotFound){
      
      
   %>
  
    

   
<tr class="<%= rowClass%>">
<td class="index"><%=counter1+startIndex%></td>
		<%--<td><%=actualItem.getItemCode()%></td> --%>
        <td height="18"><%=actualItem.getItemDesc()%></td>
        <td><integro:empty-if-null value="<%=typeMap.get(String.valueOf(OB.getChecklistitemid()))%>"/></td>
        <td><integro:empty-if-null value="<%=facilityNameMap.get(String.valueOf(OB.getChecklistitemid()))%>"/></td>
        <td><integro:empty-if-null value="<%=securityTypeMap.get(String.valueOf(OB.getChecklistitemid()))%>"/></td>
        
        
        
        <td height="18"><%
        if(isCPUTRequested){
        %>
       <font color="#7F4E52"> CPUT Requested</font>
        <%}
        if(isBranchSent){
            %>
            <font color="#1589FF">BRANCH Sent</font>
            <%}
             if(isCPUTReceived){
        %>
        <font color="#4AA02C">CPUT Received</font>
        <%}
             if(isWrongRequest){
                 %>
                 <font color="#FF0000">Wrong Request</font>
                 <%}
             if(isWrongRequestAccepted){
                     %>
                     <font color="#4AA02C">Wrong Request Accepted</font>
                     <%}
                          %>
        
        </td>
      
          <td height="18">&nbsp;
        <%if(isReqDate){ %>
        <integro:date object="<%=OB.getRequestedDate()%>"></integro:date>
        
        <%} %>
        </td>
        <td height="18">&nbsp;
        <%if(isSentDate){ %>
        <integro:date object="<%=OB.getDispatchedDate()%>"></integro:date>
        
        <%} %>
        </td>
        <td height="18">&nbsp;
        <%if(isRecDate){ %>
        <integro:date object="<%=OB.getReceivedDate()%>"></integro:date>
        
        <%} %>
        </td>
      
    </tr>
   <%} %>
   
   </logic:iterate>
   </logic:present>
   
   
   
   <%
   if(counter1 == 0) { %>

   <tr>
   <td colspan="11">
   No records found.
  
   </td>
   
   </tr>
   <% }%>
  
    </tbody>
    </table>
    <%if(resultList.size()>9){ %>
    </div>
    <%} %>
    <table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>
					
<tr>
    <td class="fieldname"  >
    Case Creation Branch : 
    </td>
    <td colspan="3" >
    <html:select property="branchCode" disabled="true">
    <html:options collection="branchList" labelProperty="label" property="value" />
    </html:select> <html:errors property="branchCodeError"/>
   </td>
   <html:hidden property="branchCode"/>
</tr>

<tr>
               <td class="fieldname"  >
               Co-Ordinator 1 Name
               </td>
               <td >
               <integro:empty-if-null value="<%=coordinator1Name %>"/>
               &nbsp;
               </td>
              <td class="fieldname"  >
               Co-Ordinator 2 Name
               </td >
               <td  >&nbsp;
                <integro:empty-if-null value="<%=coordinator2Name %>"/>
               </td>
               
               </tr>  
               
                
								</tbody>
								</table>
 </td>
</tr>
  
              
              
              
              	
<html:hidden name="MaintainCaseCreationForm" property="status"/>
               
                   <html:hidden name="MaintainCaseCreationForm" property="description"/>
 <html:hidden name="MaintainCaseCreationForm" property="createBy"/>
 <html:hidden name="MaintainCaseCreationForm" property="lastUpdateBy"/>
  <html:hidden name="MaintainCaseCreationForm" property="lastUpdateDate"/>
    <html:hidden name="MaintainCaseCreationForm" property="creationDate"/>
     <html:hidden name="MaintainCaseCreationForm" property="deprecated"/>
      <html:hidden name="MaintainCaseCreationForm" property="id"/>

										
								</tbody>
							</table>
							<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
												
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=caseCreationUpdateTrx.getStagingCaseCreation().getCurrRemarks() != null
						? caseCreationUpdateTrx.getStagingCaseCreation().getCurrRemarks()
						: ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
						</td>
					</tr>
			

		</tbody>
			</table>

			<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
			
				<tr>


    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
