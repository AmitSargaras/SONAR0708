<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>

<%@page import="com.integrosys.cms.ui.discrepency.DiscrepencyForm"%>
<%@page import="com.integrosys.cms.app.discrepency.trx.IDiscrepencyTrxValue"%>

<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.app.discrepency.bus.IDiscrepencyFacilityList"%><html>
<%
List waiverCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.waiverCreditApproverList");
if(waiverCreditApproverList!=null){
	pageContext.setAttribute("waiverCreditApproverList",waiverCreditApproverList);
}
List allCreditApproverList = (List)session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.allCreditApproverList");

if(allCreditApproverList!=null){
	pageContext.setAttribute("allCreditApproverList",allCreditApproverList);
}
	DiscrepencyForm discrepencyForm = (DiscrepencyForm) request.getAttribute("DiscrepencyForm");
	IDiscrepencyTrxValue discrepencyTrx = (IDiscrepencyTrxValue) session.getAttribute("com.integrosys.cms.ui.discrepency.DiscrepencyAction.IDiscrepencyTrxValue");
	String checkDiscrepency = discrepencyTrx.getStagingDiscrepency().getDiscrepencyType();
	List selectedList = (List) request.getAttribute("selectedList");
	//List facList = (List) request.getAttribute("facilityList");
	//System.out.println("##########################"+facList.size());
	System.out.println("########################### discrepencyForm = "+discrepencyForm.getStatus()+" selectedList = "+selectedList+"discrepencyTrx from state"+discrepencyTrx.getFromState());
	HashMap booleanFacMap= new HashMap();
	//String append = "";
	ILimitProfile limitProfile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	System.out.println("########################### limitProfile "+limitProfile); 
	ILimit[] limits=null;
	if(limitProfile!=null){
		 limits=limitProfile.getLimits();
	}
	boolean hasFacility= true;
	
	IDiscrepencyFacilityList[] discrepencyFacilityList=null; 
	if(discrepencyTrx.getActualDiscrepency()!=null){
	discrepencyFacilityList=(IDiscrepencyFacilityList[])discrepencyTrx.getActualDiscrepency().getFacilityList();
	}else{
		discrepencyFacilityList=(IDiscrepencyFacilityList[])discrepencyTrx.getStagingDiscrepency().getFacilityList();
	}
	if(limits!=null){
	for(int ab=0;ab<limits.length;ab++){
		long idFac=limits[ab].getLimitID();
		
		for(int ac=0;ac<discrepencyFacilityList.length;ac++){
			IDiscrepencyFacilityList iDiscrepencyFacilityList= discrepencyFacilityList[ac]; 
			//System.out.println(":::::::::::::::::::::::::"+iDiscrepencyFacilityList.getFacilityId());
			if(idFac==iDiscrepencyFacilityList.getFacilityId()){
				booleanFacMap.put(String.valueOf(idFac),"true");
			}
			
		}
	}
	}
	//System.out.println(":::::::::::::::::::::::::booleanFacMap ::::::::::: "+booleanFacMap);
	String styleSelect="none";
	if(discrepencyForm.getDiscrepencyType()!=null){
	if(discrepencyForm.getDiscrepencyType().equals("Facility")){
		styleSelect="";
	}
	}
	//System.out.println("########################### discrepencyForm.getCustomerId(): "+discrepencyForm.getCustomerId());
%>

<head>
<title>Untitled Document</title>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/JavaScript">

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
    document.forms[0].action="ToDo.do?event=totrack";    
    document.forms[0].submit();
}

/*function selectLists(){
    List = document.forms[0].selectedFacilityList;
    Append = document.forms[0].hiddenList;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
        Append.value = List.options[i].value + "-" + Append.value;
        //alert(Append.value);
    }
}*/
function selectLists(){
    List = document.forms[0].selectedFacilityList;
    Append = document.forms[0].hiddenList;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
       // alert("List.options[i].value :"+List.options[i].value+"Append.value"+Append.value)
      
        if(Append.value.search(List.options[i].value)==-1){
         //   alert("Appending........");
        Append.value = List.options[i].value + "-" + Append.value;
        }
        //alert(Append.value);
    }
}
function submitPage () {
//	alert(	document.getElementById("selectedFacilityList").value);
//selectLists();
	document.forms[0].action="Discrepency.do?event=maker_confirm_resubmit_edit_discrepency";
    document.forms[0].submit();
}

//
</script>
<style type="text/css">
.hiddenDiv {
	display: none;
	}
.visibleDiv {
	display: block;
	border: 1px grey solid;
	}
.style1 {color: #FF0000}
.style5 {color: #FF0000}
.style11 {color: #FF0000}

</style>
<!--		 InstanceEndEditable -->
	</head>
<html:form action='Discrepency.do?'>
	<body>
<!--			 InstanceBeginEditable name="Content" -->
		<table width="80%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>
				<tr>
					<td>
						<br>
						<h3>
							
								Discrepancy
						</h3>
					</td>
				</tr>
				<tr>
					<td>
						<hr />
					</td>
				</tr>
			</thead>
			<% 
			if(discrepencyTrx.getFromState()!=null){
				if(!discrepencyTrx.getFromState().equals("PENDING_UPDATE")){
		
			%>
			<tbody>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tblInput">
							<thead>
							</thead>
							<tbody>
							<tr class="odd">
								<td class="fieldname" width="20%">Type of Discrepancy<font color="red">*</font></td>
								<td class="even" width="20%" colspan="3">
								General
                        		<html:radio property="discrepencyType" value="General" onclick="hideFacility()"></html:radio>
	                            Facility
	                            <html:radio property="discrepencyType" value="Facility" onclick="showFacility()"></html:radio>
                            </td>
                       		</tr>
                       		
                       		<% if( checkDiscrepency.equals("Facility") ) { %>
                       		
                       				<%if(discrepencyTrx.getStagingDiscrepency().getFacilityList()==null){ %>
		                        		<tr class="even" id="mutlipleSelect"  style="width:260" style="display: <%=styleSelect %>">
							            <td class="fieldname" width="20%">Facility <font color="#ff0000">*</font></td>
							            <td width="30%">
										<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="facilityList" >					               
									         <%if(limits!=null){ 
									         
									         for(int i=0;i<limits.length;i++){
									        	 
									         %>
									         <option value="<%=limits[i].getLimitID() %>">
									         
									         <integro:empty-if-null value="<%=limits[i].getFacilityName() %>"/></option>
									         
									         <%
									        	 
									         }
									         } %>
										</html:select> 
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(facilityList,selectedFacilityList, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(selectedFacilityList,facilityList,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
										    <td>		               
												<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="selectedFacilityList" >
												</html:select> 
										&nbsp;
										</td>
									</tr> 
									<%}else{ %>
									<tr class="even" id="mutlipleSelect"  style="width:260" style="display: <%=styleSelect %>">
							            <td class="fieldname" width="20%">Facility <font color="#ff0000">*</font></td>
							            <td width="30%">
										<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="facilityList" >					               
									         <%if(limits!=null){ 
									         
									         for(int i=0;i<limits.length;i++){
									        	 String availFac=(String)booleanFacMap.get(String.valueOf(limits[i].getLimitID()));
									        	 if(!"true".equals(availFac)){
									         %>
									         <option value="<%=limits[i].getLimitID() %>">
									         
									         <integro:empty-if-null value="<%=limits[i].getFacilityName() %>"/></option>
									         
									         <%
									        	 }
									         }
									         } %>
										</html:select> 
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(facilityList,selectedFacilityList, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(selectedFacilityList,facilityList,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
										    <td>		               
												<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="selectedFacilityList" >
												
												 <%if(limits!=null){ 
									         
									         for(int i=0;i<limits.length;i++){
									        	 String availFac=(String)booleanFacMap.get(String.valueOf(limits[i].getLimitID()));
									        	 if("true".equals(availFac)){
									         %>
									         <option value="<%=limits[i].getLimitID() %>">
									         
									         <integro:empty-if-null value="<%=limits[i].getFacilityName() %>"/></option>
									         
									         <%
									        	 }
									         }
									         } %>
												
												
												</html:select> 
										&nbsp;
										</td>
									</tr> 
									
									<%} %>
		                        <%} %>		
							<tr class="odd">
								<td class="fieldname" width="20%">Creation Date<font color="red">*</font></td>
								<td class="even" width="20%">
								
								<html:text property="creationDate" name="DiscrepencyForm" />
					            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
						             onclick="showCalendar('creationDate', 'dd/mm/y')"
						             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						             onmouseout="MM_swapImgRestore()"/>&nbsp;
						        <br/><html:errors property="creationDateError"/>
								</td>

								<td class="fieldname" width="20%">Approved Date
</td>
								<td class="even" width="20%">
								
								<html:text property="acceptedDate"  name="DiscrepencyForm" />
					            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
						             onclick="showCalendar('acceptedDate', 'dd/mm/y')"
						             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						             onmouseout="MM_swapImgRestore()"/>&nbsp; 
						       <html:errors property="acceptedDateError"/>	
								<br/></td>
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">Original Target Date</td>
								<td class="even" width="20%">
								
								<html:text property="originalTargetDate"  name="DiscrepencyForm" />
					            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
						             onclick="showCalendar('originalTargetDate', 'dd/mm/y')"
						             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						             onmouseout="MM_swapImgRestore()"/>&nbsp; 
						        <html:errors property="originalTargetDateError"/>
								<br/></td>
								
								<td class="fieldname" width="20%">Next Due Date</td>
								<td class="even" width="20%">
								
								<html:text property="nextDueDate"  name="DiscrepencyForm" />
					            <img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725"
						             onclick="showCalendar('nextDueDate', 'dd/mm/y')"
						             onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						             onmouseout="MM_swapImgRestore()"/>&nbsp; 
						        <html:errors property="originalTargetDateError"/>
								<br/></td>
								

							</tr>
							<tr class="odd">
							<td class="fieldname" width="20%">Critical<font color="red">*</font></td>
								<td class="even" width="20%">Yes
								<html:radio property="critical" value="Yes"></html:radio>
	                            No
                            <html:radio property="critical" value="No"></html:radio>
								</td>
								
								<td class="fieldname" width="20%">Approved By<font color="red">*</font></td>
											<td class="even" width="20%">
											<html:select property="approvedBy" name="DiscrepencyForm" >
											<option value="">Please Select</option>
											<html:options collection="allCreditApproverList" labelProperty="label" property="value" />
											</html:select>
											
											<br/><html:errors property="approvedByError"/></td>
							</tr>
							
							<tr class="even">
								<td class="fieldname" width="20%">Discrepency<font color="red">*</font></td>
								<td class="even" width="20%">
								<html:select property ="discrepency" name="DiscrepencyForm" >
									<integro:common-code categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" descWithCode="false" />
								</html:select>
								</td>
<!--								<td class="fieldname" width="20%">Discrepency Counter</td>-->
<!--								<td class="even" width="20%"><bean:write name="DiscrepencyForm" property="counter"/>-->
<!--								</td>-->
								
								<td class="fieldname" width="20%"> &nbsp;</td>
								<td class="even" width="20%">&nbsp;
								</td>
							</tr>
							
<!--							<tr>-->
<!--							<td class="fieldname">Remarks</td>-->
<!--							<td class="even" colspan="3">-->
<!--							<html:textarea property="discrepencyRemark" rows="6" cols="100"/>-->
<!--							<br/><html:errors property="disrepencyRemarkError"/></td>-->
<!--						</tr>-->
							
						</tbody>
						</table>
					</td>
				</tr>
		<tr>
			<td>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblInfo">
				<tbody>
					<tr>
						<td class="fieldname">Remarks</td>
						<td class="even"><textarea name="remarks" rows="4"
							style="width: 90%"></textarea>
						<br/><html:errors property="remarkError"/></td>
					</tr>
					<tr>
						<td class="fieldname">Last Action By</td>
						<td class="even"><%=discrepencyTrx.getUserInfo()%>&nbsp;</td>
					</tr>
					<tr class="odd">
						<td class="fieldname">Last Remarks Made</td>
						<td><%=discrepencyTrx.getRemarks() != null ? discrepencyTrx.getRemarks(): ""%>&nbsp;</td>
					</tr>		
				</tbody>
			</table>
			</td>
			 <html:hidden property="status" /> 
		</tr>

			</tbody>
			<%}else{ %>
			<tbody>
        <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <thead>
                </thead>
                <tbody>
                    <tr class="odd">
                        <td class="fieldname">Type of Facility</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="discrepencyType"/></td>
                        <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <%if(discrepencyTrx.getActualDiscrepency().getFacilityList()==null){ %>
		                        		<tr class="even" id="mutlipleSelect"  style="width:260" style="display: <%=styleSelect %>">
							            <td class="fieldname" width="20%">Facility <font color="#ff0000">*</font></td>
							            <td width="30%">
										<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="facilityList" >					               
									         <%if(limits!=null){ 
									         
									         for(int i=0;i<limits.length;i++){
									        	 
									         %>
									         <option value="<%=limits[i].getLimitID() %>">
									         
									         <integro:empty-if-null value="<%=limits[i].getFacilityName() %>"/></option>
									         
									         <%
									        	 
									         }
									         } %>
										</html:select> 
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(facilityList,selectedFacilityList, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(selectedFacilityList,facilityList,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
										    <td>		               
												<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="selectedFacilityList" >
												</html:select> 
										&nbsp;
										</td>
									</tr> 
									<%}else{ %>
									<tr class="even" id="mutlipleSelect"  style="width:260" style="display: <%=styleSelect %>">
							            <td class="fieldname" width="20%">Facility <font color="#ff0000">*</font></td>
							            <td width="30%">
										<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="facilityList" >					               
									         <%if(limits!=null){ 
									         
									         for(int i=0;i<limits.length;i++){
									        	 String availFac=(String)booleanFacMap.get(String.valueOf(limits[i].getLimitID()));
									        	 if(!"true".equals(availFac)){
									         %>
									         <option value="<%=limits[i].getLimitID() %>">
									         
									         <integro:empty-if-null value="<%=limits[i].getFacilityName() %>"/></option>
									         
									         <%
									        	 }
									         }
									         } %>
										</html:select> 
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(facilityList,selectedFacilityList, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(selectedFacilityList,facilityList,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
										    <td>		               
												<html:select name="DiscrepencyForm" size="5" multiple="multiple" style="width:150" property="selectedFacilityList" >
												
												 <%if(limits!=null){ 
									         
									         for(int i=0;i<limits.length;i++){
									        	 String availFac=(String)booleanFacMap.get(String.valueOf(limits[i].getLimitID()));
									        	 if("true".equals(availFac)){
									         %>
									         <option value="<%=limits[i].getLimitID() %>">
									         
									         <integro:empty-if-null value="<%=limits[i].getFacilityName() %>"/></option>
									         
									         <%
									        	 }
									         }
									         } %>
												
												
												</html:select> 
										&nbsp;
										</td>
									</tr> 
									
									<%} %>
                    <tr class="even">
                        <td class="fieldname">Critical</td>
                        <td>&nbsp;<bean:write name="DiscrepencyForm" property="critical"/></td>
                        <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr class="odd">
                        <td class="fieldname">Discrepency</td>
                        <td>&nbsp;<integro:common-code-single categoryCode="<%=CategoryCodeConstant.DISCREPENCY%>" refEntryCode="" entryCode="<%=discrepencyForm.getDiscrepency() %>" descWithCode="false" display="true"/></td>
                    <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
						<tr class="even">
                        <td class="fieldname">Creation Date</td>
                        <td>&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getCreationDate() %>" /></td>
                        <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr class="odd">
											
											<td class="fieldname" >Approved Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getAcceptedDate() %>" />
							            </td><td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
										</tr>
										<tr class="even">
											<td class="fieldname" >Original Target Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getOriginalTargetDate() %>" />
											<html:errors property="originalTargetDateError" />
								            </td>
											<td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
										</tr>
										
										<tr class="even">
											<td class="fieldname" >Next Due Date</td>
											<td class="even" >
											&nbsp;<integro:date object="<%=discrepencyTrx.getStagingDiscrepency().getNextDueDate() %>" />
								            </td>
											<td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>

										</tr>
                    <%if("PENDING_WAIVE".equals(discrepencyForm.getStatus())){ %>
                    
                    
                    <tr class="even">
                        <td class="fieldname">Date Waived&nbsp;<font color="RED">*</font></td>
                        <td><html:text property="waiveDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('waiveDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                                 <html:errors property="waiveDateError"/>
                        </td>
                        <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                         <html:hidden property="status" value="PENDING_WAIVE"/>   
                    </tr>
                    <%} %>
                    <%if("PENDING_CLOSE".equals(discrepencyForm.getStatus())){ %>
                    
                    
                     <tr class="even">
                        <td class="fieldname">Date Closed&nbsp;<font color="Red">*</font></td>
                        <td><html:text property="recDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('recDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                                 <html:errors property="recDate"/>
                        </td>
                        <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                         <html:hidden property="status" value="PENDING_CLOSE"/>   
                    </tr>
                    <%} %>
                    
                    <%if("PENDING_DEFER".equals(discrepencyForm.getStatus())){ %>
                    
                    
                    <tr class="even">
                        <td class="fieldname">Date Defered&nbsp;<font color="RED">*</font></td>
                        <td><html:text property="deferDate" size="12" maxlength="12" readonly="true"/>
                            <img src="img/calendara.gif" name="Image11" border="0" id="Image1" onclick="return showCalendar('deferDate', 'dd/mm/y');"
                                 onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)"/>
                                 <html:errors property="deferDateError"/>
                        </td>
                        <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                         <html:hidden property="status" value="PENDING_DEFER"/>   
                    </tr>
                    <%} %>
                    
                   
                   
 
                  
                    <tr class="odd">
                        <td class="fieldname">Credit Approver</td>
                        <td><html:select property="creditApprover"  >
											<option value="">Please Select</option>
											<html:options collection="waiverCreditApproverList" labelProperty="label" property="value" />
											</html:select>
                        </td>
                        <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>

                </tbody>
            </table>

                <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                    <tr class="odd">
                            <td class="fieldname">Creation Remarks</td>
                            
                            <td><integro:empty-if-null value="<%=discrepencyTrx.getStagingDiscrepency().getDiscrepencyRemark()%>"/>&nbsp;</td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td><html:textarea name="DiscrepencyForm" rows="5" cols="80" property="docRemarks"
                                               onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks"/></td>
                                               <td class="fieldname" >&nbsp;</td>
                        <td>&nbsp;</td>
                        </tr>
                     
        
                        
                    </tbody>
                </table>
                <table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblInfo">
				<tbody>
					<tr>
						<td class="fieldname">Remarks<font color="red">*</font></td>
						<td class="even"><textarea name="remarks" rows="4"
							style="width: 90%"></textarea>
						<br/><html:errors property="remarkError"/></td>
					</tr>
					<tr>
						<td class="fieldname">Last Action By</td>
						<td class="even"><%=discrepencyTrx.getUserInfo()%>&nbsp;</td>
					</tr>
					<tr class="odd">
						<td class="fieldname">Last Remarks Made</td>
						<td><%=discrepencyTrx.getRemarks() != null ? discrepencyTrx.getRemarks(): ""%>&nbsp;</td>
					</tr>		
				</tbody>
			</table>
                    <%-- End here for cr-17 --%>
            </td>
        </tr>
    </tbody>
			<%}} %>
		</table>
 <html:hidden property="id"/>
         <html:hidden property="customerId"/>
         <html:hidden property="discrepencyType"/>
         <html:hidden property="discrepencyId"/>
         <html:hidden property="creationDate"/>
         <html:hidden property="acceptedDate"/>
         <html:hidden property="originalTargetDate"/>
         <html:hidden property="nextDueDate"/>
         <html:hidden property="critical"/>
         <html:hidden property="approvedBy"/>
         <html:hidden property="counter"/>
         <html:hidden property="discrepency"/>
         <html:hidden property="discrepencyRemark"/>  
         <html:hidden property="docRemarks"/>   
         <html:hidden property="recDate"/>   
         <html:hidden property="deferDate"/>   
         <html:hidden property="waiveDate"/>
         <html:hidden property="creditApprover"/>  
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

		<td colspan="4"><a href="#" onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
			onClick="submitPage()"><img src="img/submit1.gif"
			name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp; <a
			href="ToDo.do" onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
			src="img/cancel1.gif" name="Image2" width="70" height="20"
			border="0" id="Image2" /></a> &nbsp;</td>

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


<!--			 InstanceEndEditable -->
	</body>
<html:hidden  name="DiscrepencyForm" property="id" />
<html:hidden name="DiscrepencyForm" property="selectedFacilityList" />    
</html:form>
<!--	 InstanceEnd -->
</html>
