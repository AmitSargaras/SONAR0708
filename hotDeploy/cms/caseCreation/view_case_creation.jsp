<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.checklist.bus.ICheckList,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.checklist.trx.ICheckListTrxValue,
                 com.integrosys.cms.ui.checklist.security.SecurityCheckListForm,
                 com.integrosys.cms.ui.common.SecurityTypeList,
                 com.integrosys.cms.ui.common.SecuritySubTypeList,
                 com.integrosys.cms.ui.checklist.CheckListHelper,
                 java.util.*" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
   // ICheckListTrxValue checkListTrxVal = (ICheckListTrxValue) session.getAttribute("com.integrosys.cms.ui.checklist.cam.CAMCheckListAction.checkListTrxVal");
   // ICheckList checkList = (ICheckList) session.getAttribute("com.integrosys.cms.ui.checklist.cam.CAMCheckListAction.checkList");
    List receivedLists=(List) session.getAttribute("com.integrosys.cms.ui.caseCreation.CaseCreationAction.receivedList");
    HashMap typeMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreation.CaseCreationAction.typeMap");
    HashMap facilityNameMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreation.CaseCreationAction.facilityNameMap");
    HashMap securityTypeMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreation.CaseCreationAction.securityTypeMap");
    HashMap hmCaseCreation=(HashMap) session.getAttribute("com.integrosys.cms.ui.caseCreation.CaseCreationAction.hmCaseCreation");
   // System.out.println("hmCaseCreation"+hmCaseCreation.size());
   List branchList = (List)session.getAttribute("com.integrosys.cms.ui.caseCreation.CaseCreationAction.branchList");
		
		
		pageContext.setAttribute("branchList",branchList);		
    System.out.println("receivedLists"+receivedLists.size());
    String aisCput=(String)request.getAttribute("isCPUT");
    String aisBRANCH=(String)request.getAttribute("isBRANCH");
    String lastRemarks=(String)request.getAttribute("remarks");
  //  System.out.println("aisCput:::::"+aisCput);
    //System.out.println("aisBRANCH::::::"+aisBRANCH);
   
    //boolean isCPUT=false;
    boolean isCPUT=false;
    boolean isBRANCH=false;
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
    		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
    	isBRANCH=true;
    }
    
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER 
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER_WFH){
    	isCPUT=true;
    }
   /* if(aisCput!= null && aisCput.equals("true")){
		isCPUT=true;
	}
	if(aisBRANCH!= null && aisBRANCH.equals("true")){
		isBRANCH=true;
	}*/
	
    ICheckListItem[] actualItems = new OBCheckListItem[receivedLists.size()];
    for(int i=0;i<receivedLists.size();i++){
    	actualItems[i]=(ICheckListItem)receivedLists.get(i);
    }
    
    String remarks = "";
    String lastActionBy = "";
    if (actualItems != null)
        pageContext.setAttribute("actualItems", actualItems);
    int row = 0;
    int index = 0;
    int indexBranch=0;
    
  
%>



<%@page import="com.integrosys.cms.ui.checklist.cam.CAMCheckListForm"%>
<%@page import="com.integrosys.cms.app.checklist.bus.OBCheckListItem"%>
<%@page import="com.integrosys.cms.app.caseCreation.bus.ICaseCreation"%>
<%@page import="com.integrosys.cms.app.caseCreation.bus.OBCaseCreation"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="org.apache.struts.util.LabelValueBean"%><html xmlns="http://www.w3.org/19009/xhtml"><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>

<script language="JavaScript" src="js/validation.js"></script>
  <script type="text/javascript" src="js/ajaxCoordinator.js"></script>
<script language="JavaScript" type="text/JavaScript">

<!--
function MM_swapImgRestore() { //v3.0
    var i,x,a = document.MM_sr;
    for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
}

function MM_preloadImages() { //v3.0
    var d = document;
    if (d.images) {
        if (!d.MM_p) d.MM_p = new Array();
        var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
        for (i = 0; i < a.length; i++)
            if (a[i].indexOf("#") != 0) {
                d.MM_p[j] = new Image;
                d.MM_p[j++].src = a[i];
            }
    }
}

function MM_findObj(n, d) { //v4.01
    var p,i,x;
    if (!d) d = document;
    if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
        d = parent.frames[n.substring(p + 1)].document;
        n = n.substring(0, p);
    }
    if (!(x = d[n]) && d.all) x = d.all[n];
    for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
    for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
    if (!x && d.getElementById) x = d.getElementById(n);
    return x;
}

function MM_swapImage() { //v3.0
    var i,j = 0,x,a = MM_swapImage.arguments;
    document.MM_sr = new Array;
    for (i = 0; i < (a.length - 2); i += 3)
        if ((x = MM_findObj(a[i])) != null) {
            document.MM_sr[j++] = x;
            if (!x.oSrc) x.oSrc = x.src;
            x.src = a[i + 2];
        }
}

function gotopage(aLocation) {
    window.location = aLocation;
}

function addItems(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      if (type == 'checkbox') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
	      if (type == 'checkbox') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.itemID[j].value);
				temp = temp + "," + formObj.itemID[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
	      if (type == 'checkbox') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.itemID.value);
				temp = temp + "," + formObj.itemID.value;
			}
	      }
		}
	}
//    alert('j'+j);
    if(temp==""){
        alert('Please select atleast one document.');
        return false;
    }
	temp=temp.substring(1);
	//alert(temp);
	formObj.hiddenItemID.value=temp;


//CHANGES 09-03-2012
	//var tempStatus=document.getElementById('14').value;
	 //if(tempStatus=="0"){
	  //      alert('Please select atleast one to submit.');
	   //     return false;
	   // }
var branchCode=document.getElementById('branchCode').value;
	 if(branchCode==""){
	        alert('Please select Branch.');
	        return false;
	    }
	 var tempRemark=document.getElementById('123').value;
	// //alert(tempRemark);
	 document.forms[0].remark.value=tempRemark;
	//document.forms[0].status.value=tempStatus;
	//document.forms[0].event.value="CaseCreationRequestCommand";
	
	document.forms[0].action="CaseCreation.do?event=CaseCreationRequestCommand&branchCode="+branchCode;
	document.forms[0].submit();
}

function refreshCoordinatorDetail(dropdown) {
	//alert("ss");
    var curSel = "";
   
    for(i=0; i < dropdown.options.length; i++)   {
        if (dropdown.options[i].selected == true) {
            curSel = dropdown.options[i].value;
        }
    }  
    //alert("aa"+curSel);
    var dep = 'coordinator1Name';
    var url = '/cms/CaseCreation.do?event=refresh_coordinator_detail&branchCode='+curSel;
    sendLoadCoordinatorReq(dep, url);
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="CaseCreation">
<input type="hidden" name="hiddenItemID" />
<input type="hidden" name="event" />
<html:hidden property="status"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td><h3>
           Case Creation <%if(isCPUT){ %>
  ( CPUT )
    <%} %>
    <%if(isBRANCH){ %>
   ( BRANCH )
    <%} %>
           </h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>

<tr>
    <td>&nbsp;</td>
</tr>
<tr>
   
    <td valign="bottom">
         
                <table width="160" border="0" align="right" cellpadding="0" cellspacing="0" style="margin-top:5px">
           
                    <tr>

                       
                    </tr>
                </table>
    </td>
</tr>


<tr>
    <td>
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

        	<td>Action</td>
        </tr>
    </thead>
    <tbody>
   <%
   if(actualItems.length>0){
   
   for(int j=0;j<actualItems.length;j++){
	   
	  
	   index++;
	   %>
  
    

<%
boolean isCPUTRequested=false;
boolean isBranchSent=false;
boolean isCPUTReceived=false;
boolean isDocMaintained=false;
boolean isCaseDate=false;
boolean isReqDate=false;
boolean isSentDate=false;
boolean isRecDate=false;
ICaseCreation caseCreation= new OBCaseCreation();
if(hmCaseCreation.containsKey(String.valueOf(actualItems[j].getCheckListItemID()))){
 caseCreation =(ICaseCreation)hmCaseCreation.get(String.valueOf(actualItems[j].getCheckListItemID()));
isDocMaintained=true;

if(caseCreation.getCaseDate()!=null){
	isCaseDate=true;
}
if(caseCreation.getRequestedDate()!=null){
	isReqDate=true;
}
if(caseCreation.getDispatchedDate()!=null){
	isSentDate=true;
}
if(caseCreation.getReceivedDate()!=null){
	isRecDate=true;
}

if("1".equals(caseCreation.getStatus())){
	isCPUTRequested=true;
}
if("2".equals(caseCreation.getStatus())){
	isBranchSent=true;
}
if("3".equals(caseCreation.getStatus())){
	isCPUTReceived=true;
}
}
//System.out.println("=======================view_case_creation.jsp ======337=========isCPUT : "+isCPUT);
   if(isCPUT){ %>

<tr class="">
<td class="index"><%=index%></td>
	<%--	<td><%=actualItems[j].getItemCode()%></td> --%>
        <td height="18"><%=actualItems[j].getItemDesc()%></td>
        <td><integro:empty-if-null value="<%=typeMap.get(String.valueOf(actualItems[j].getCheckListItemID()))%>"/></td>
        <td><integro:empty-if-null value="<%=facilityNameMap.get(String.valueOf(actualItems[j].getCheckListItemID()))%>"/></td>
        <td><integro:empty-if-null value="<%=securityTypeMap.get(String.valueOf(actualItems[j].getCheckListItemID()))%>"/></td>
        
        
        
        <td height="18"><%if(!isDocMaintained){ %>
        Not Maintained
        <%}else{ 
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
             }%>
        
        </td>
      
        
       <td style="text-align:center">
      <%if(isCPUT){
    	   if(isDocMaintained){
    		   if(isBranchSent){
    	  
    	   %>
            <input type="checkbox" name="itemID" value="<%=actualItems[j].getCheckListItemID()%>" />
            <%} }else {
            	%>
       <input type="checkbox" name="itemID" value="<%=actualItems[j].getCheckListItemID()%>" />
     <% } }%>
             <%if(isBRANCH){
            	 if(isDocMaintained){
            		 if(isCPUTRequested){
            	 %>
            <input type="checkbox" name="itemID" value="<%=actualItems[j].getCheckListItemID()%>" />
            <%} } }%>
          </td>
            
    </tr>
   <%}else{ if(isDocMaintained){ 
   
    indexBranch++;
   %>
   
<tr class="">
<td class="index"><%=indexBranch%></td>
		<td><%=actualItems[j].getItemCode()%></td>
        <td height="18">&nbsp;<%=actualItems[j].getItemDesc()%></td>
        <td><integro:empty-if-null value="<%=typeMap.get(String.valueOf(actualItems[j].getCheckListItemID()))%>"/></td>
        <td><integro:empty-if-null value="<%=facilityNameMap.get(String.valueOf(actualItems[j].getCheckListItemID()))%>"/></td>
        <td><integro:empty-if-null value="<%=securityTypeMap.get(String.valueOf(actualItems[j].getCheckListItemID()))%>"/></td>
        
        
        
        <td height="18">&nbsp;<%if(!isDocMaintained){ %>
        Not Maintained
        <%}else{ 
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
             }%>
        
        </td>
      
          <td height="18">&nbsp;
        <%if(isReqDate){ %>
        <integro:date object="<%=caseCreation.getRequestedDate()%>"></integro:date>
        
        <%} %>
        </td>
        <td height="18">&nbsp;
        <%if(isSentDate){ %>
        <integro:date object="<%=caseCreation.getDispatchedDate()%>"></integro:date>
        
        <%} %>
        </td>
        <td height="18">&nbsp;
        <%if(isRecDate){ %>
        <integro:date object="<%=caseCreation.getReceivedDate()%>"></integro:date>
        
        <%} %>
        </td>
       <td style="text-align:center">&nbsp;
      <%if(isCPUT){
    	   if(isDocMaintained){
    		   if(isBranchSent){
    	  
    	   %>
            <input type="checkbox" name="itemID" value="<%=actualItems[j].getCheckListItemID()%>" />
            <%} }else {
            	%>
       <input type="checkbox" name="itemID" value="<%=actualItems[j].getCheckListItemID()%>" />
     <% } }%>
             <%if(isBRANCH){
            	 if(isDocMaintained){
            		 if(isCPUTRequested){
            	 %>
            <input type="checkbox" name="itemID" value="<%=actualItems[j].getCheckListItemID()%>" />
            <%} } }%>
          </td>
    </tr>
   
   
   
   
   
   
   <%
   }  }
   }
   
   
  if(isBRANCH){ 
  if(indexBranch==0){ 
   %>
   <tr>
   <td colspan="11">
   No records found.
  
   </td>
   
   </tr>
   
   <%
   }  } 
   }else{%>
   <tr>
   <td colspan="11">
   No records found.
  
   </td>
   
   </tr>
   <%}%>
    </tbody>
    </table>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>
					<% 
if(actualItems.length>0){

%>

<tr class="odd">
              <td class="fieldname" >Branch Code<font color="red">*</font>
                  </td><td width="30%" >
                  <select id="branchCode" name="branchCode"  onchange="javascript:refreshCoordinatorDetail(this);"> 
                  <option value="">--Please Select--</option>
                  <%
                  for(int ab=0;ab<branchList.size();ab++){
                	LabelValueBean labelValueBean=(LabelValueBean)branchList.get(ab);
                	%>
                	<option value="<%=labelValueBean.getValue() %>" ><%=labelValueBean.getLabel() %></option>
                	
                	
                	
                	<%
                	
                  }
                  
                  %>
                  
                  </select>
                  &nbsp; <html:errors property="branchCodeError"/></td>    
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
              
              
             
            </tr>
<%--
<tr>
    <td colspan="2">
    Documents Status: <select id="14">
     <option value="0" >--Please Select--</option>
     <%if(isCPUT){ %>
   
    <option value="1">CPUT Requested</option>
    <option value="3">CPUT Received</option>
    <%} %>
    <%if(isBRANCH){ %>
    <option value="2">Branch Sent</option>
    <%} %>
    </select> <html:errors property="caseCreationError"/>
    <hr/></td>
</tr>

<tr>
    <td colspan="9"><html:errors property="remove.error"/></td>
</tr>
</tbody>
</table>
<table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                            <td class="fieldname">Last Remark Made</td>
                            <td><textarea name="lastRemarks"  rows="4" readonly="readonly"
								style="width: 90%" ><integro:empty-if-null value="<%=lastRemarks %>"/></textarea>    </td>
                        </tr></input>
                    </tbody>
                </table>
                
              
 <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td><textarea name="remarks" id="123" rows="4"
								style="width: 90%" ></textarea>    <html:errors property="docRemarks"/></td>
                        </tr><input type="hidden" name="remark"></input>
                    </tbody>
                </table> --%>
                 <%} %> 
                 
                 
               <tr>
               <td class="fieldname"  >
               Co-Ordinator 1 Name
               </td>
               <td>
               <html:text property="coordinator1Name" styleId="coordinator1Name"  readonly="true"></html:text>
               &nbsp;
               </td>
              <td class="fieldname"  >
               Co-Ordinator 2 Name
               </td>
               <td>&nbsp;
               <html:text property="coordinator2Name" styleId="coordinator2Name" readonly="true"></html:text>
               </td>
               
               </tr>  
                 
					 </tbody>
					 </table>
					
                
              
 <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                    <tbody>
                        <tr class="even">
                            <td class="fieldname">Remarks</td>
                            <td><textarea name="remarks" id="123" rows="4"
								style="width: 90%" ></textarea>    <html:errors property="docRemarks"/></td>
                        </tr><input type="hidden" name="remark"></input>
                    </tbody>
                </table>
 </td>
</tr>
<tr>
<td>
&nbsp;

</td>

</tr>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                       
                      <tr>
                      <tr>
                        <td width="100" valign="baseline" align="center">
                        &nbsp;
                        <%
if(actualItems.length>0){

%>
                         <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick ="addItems()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                       <%} %> </td>
                        <td width="100" valign="baseline" align="center"> 
<!--                        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)" onClick ="cancelBack()"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>-->
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>



</html:form>
</body>

<!-- InstanceEnd --></html>
