<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBranchForm"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.IOtherBranch"%>
<%
	OtherBranchForm otherBranchForm = (OtherBranchForm) request
			.getAttribute("OtherBranchForm");
	String event = (String) request.getAttribute("event");

	pageContext.setAttribute("OtherBranchObj", otherBranchForm);

	String BranchId = otherBranchForm.getId();
	String BankId = otherBranchForm.getOtherBankId();

	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	
	List countryList = null;
	List regionList = null;
	List stateList = null;
	List cityList = null;

	countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.countryList");
	regionList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.regionList");
	stateList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.stateList");
	cityList = (List) session
			.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBranchAction.cityList");

	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("stateList", stateList);
	pageContext.setAttribute("cityList", cityList);
%> 
<%
String actionStr1 = "com.integrosys.cms.ui.otherbankbranch.OtherBranchAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
<html>
<head>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/JavaScript">

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}

	function refreshRegionId(dropdown)
	{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }

	 if(curSel==""){
		clearDisplayDropdown('branchStateId');
		clearDisplayDropdown('branchCityId');
	 }
	 var dep = 'branchRegionId';
	 var url = '/cms/OtherBank.do?event=refresh_region_id&countryId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
	function refreshStateId(dropdown)
	{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 if(curSel==""){
		clearDisplayDropdown('branchCityId');
	 }
	 var dep = 'branchStateId';
	 var url = '/cms/OtherBank.do?event=refresh_state_id&regionId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}

	function refreshCityId(dropdown)
	{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 var dep = 'branchCityId';
	 var url = '/cms/OtherBank.do?event=refresh_city_id&stateId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
	
	function submitPage (idx) {
		document.forms[0].action="OtherBranch.do?event=maker_submit_edit_branch&BranchId="+idx;
		document.forms[0].submit();
	}
		
	function saveToDraft(){
		document.forms[0].action="OtherBranch.do?event=maker_save_update_other_bank_branch";
		document.forms[0].submit();
	}

</script>
</head>
<body>
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<html:form action="OtherBranch.do">

  <tr >

	<td width="100%" height="100%" valign="bottom" >
      <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
    <tr height="95%">
        <td valign="top">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td width="70%">
                                 <h3>Edit Other Bank</h3>
                                 <table id="111" border="0" cellpadding="0" cellspacing="0" width="99%">
                                   <tbody>                                  
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                        		<tr class="even">
				                  <td class="fieldname" >Branch Code</td>
				                  <td><%=otherBranchForm.getOtherBranchCode()%></td>
				                  <td class="fieldname" width="15%">Branch Name <font color="RED">*</font> 
				                  <br/><bean:message key="error.string.branch.name"/></td>
				                  <td><html:text name="OtherBranchForm" property="otherBranchName" value="<%=otherBranchForm.getOtherBranchName()%>"/>
				                  <html:errors property="otherBranchNameError"/></td>
				                </tr>
	                            <tr class="odd">
				                  <td class="fieldname" >Bank Code</td>
				                  <td><bean:write name="OtherBranchForm" property="otherBankCode"/></td>
				                  <td class="fieldname" width="15%">Bank Name </td>
				                  <td><bean:write name="OtherBranchForm" property="otherBankName" /></td>
				                </tr>
								<tr class="even">
									<td class="fieldname">RBI Code</td>
									<td><integro:empty-if-null
										value="<%=otherBranchForm.getBranchRbiCode()%>" /></td>
									<td class="fieldname" width="15%">&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr class="odd">  
				                  <td class="fieldname" width="15%">Address </td>
				                  <td>
				                  	<html:textarea name="OtherBranchForm" property="branchAddress" value="<%=otherBranchForm.getBranchAddress() %>" cols="45" rows="5" ></html:textarea>
				                  	<html:errors property="addressError"/>
				                  </td>
				                  <td class="fieldname" >Country </td>
				                  <td>
				                  	<html:select name="OtherBranchForm" property="branchCountryId"  onchange="javascript:refreshRegionId(this)">
				                  		<option value="">Please Select</option>
				                  		<html:options collection="countryList" labelProperty="label" property="value" />
				                  	</html:select>
								  </td>
				                 </tr> 
				                
				                <tr class="even">
				                	<td class="fieldname" >region </td>
				                  	<td>
				                  		<html:select name="OtherBranchForm" property="branchRegionId"  onchange="javascript:refreshStateId(this)">
				                  			<option value="">Please Select</option>
				                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
				                  		</html:select>
				                  	</td>
				                  	
				                	<td class="fieldname" >State </td>
				                  	<td>
				                  		<html:select name="OtherBranchForm" property="branchStateId"  onchange="javascript:refreshCityId(this)">
				                  			<option value="">Please Select</option>
				                  			<html:options collection="stateList" labelProperty="label" property="value" />
				                  		</html:select>
				                  	</td>
				                </tr>
				                <tr class="odd">  
				                  <td class="fieldname" >City </td>
				                  <td width="25%">
				                  	<html:select name="OtherBranchForm" property="branchCityId" >
				                  		<option value="">Please Select</option>
				                  		<html:options collection="cityList" labelProperty="label" property="value" />
				                  	</html:select>
				                  </td>
				                  <td class="fieldname" >Contact No</td>
				                  <td>
				                  	<input type="text" name="branchContactNo" value="<%=otherBranchForm.getBranchContactNo()%>" />
				                  	<html:errors property="branchContactNoError"/>
				                  </td>
				                </tr>
				                <tr class="even">  
								  <td class="fieldname" >Contact Mail ID</td>
				                  <td>
				                  	<html:text name="OtherBranchForm" property="branchContactMailId" value="<%=otherBranchForm.getBranchContactMailId()%>"></html:text>
				                  	<html:errors property="branchContactMailIdError"/>
				                  </td>
				                  <td class="fieldname">Fax Number</td>
				                  <td>
				                 	 <html:text name="OtherBranchForm" property="branchFaxNo" value="<%=otherBranchForm.getBranchFaxNo()%>"></html:text>
				                  	<html:errors property="branchFaxNoError"/>
				                  </td>	
				                </tr>
				                
				                <tr class="even">  
									  <td class="fieldname" >Status</td>
					                  <td>
					                  	<%
					                  		if( otherBranchForm.getStatus().equalsIgnoreCase("ACTIVE") ){
					                  	%>
					                  	<input type="radio" name="status" checked="checked" value="ACTIVE" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
				                  		<input type="radio" name="status" value="INACTIVE" ><%=ICMSConstant.STATE_DISABLE.toString()%></input>
				                  		<%}else{%>
				                  			<input type="radio" name="status"  value="ACTIVE" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
					                  		<input type="radio" name="status" checked="checked" value="INACTIVE" ><%=ICMSConstant.STATE_DISABLE.toString()%></input>
				                  		<%} %>
					                  </td>
					                  <td class="fieldname">&nbsp;</td>
					                  <td>&nbsp;
					                  </td>
				                </tr>
                            </tbody>
                                 
                        </table>
                    </td>
                </tr>
            </table>
            </table>
            <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
					<tr align="center">
						<td><a href="#" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('saveImage','','img/save2.gif',1)"><img
								src="img/save1.gif" name="saveImage" border="0" 
								onclick="saveToDraft()" /></a></td>
						<td width="100" valign="baseline" align="center"><a href="#"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick="submitPage('<%=BranchId%>')"><img src="img/submit1.gif"
							name="Image3311" border="0" id="Image3311" /></a></td>
						<td width="100" valign="baseline" align="center">
						 <a href="OtherBank.do?event=view_other_bank_by_index&BankId=<%=BankId%>"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>
						
						</td>
					</tr>	

            </table>
        </td>
    </tr>
</table>

<input type="hidden" name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0"/>
<input type="hidden"  name="BranchId" value="<%=otherBranchForm.getId()%>" />
<html:hidden  name="OtherBranchForm" property="otherBranchCode"/>
<html:hidden  name="OtherBranchForm" property="otherBankId"/>
<html:hidden  name="OtherBranchForm" property="otherBankCode"/>
<html:hidden  name="OtherBranchForm" property="branchRbiCode"/>
<html:hidden  name="OtherBranchForm" property="id" />
<html:hidden  name="OtherBranchForm" property="createdBy" />
<html:hidden  name="OtherBranchForm" property="creationDate" />
<html:hidden  name="OtherBranchForm" property="lastUpdateBy" />
<html:hidden  name="OtherBranchForm" property="lastUpdateDate" />
<html:hidden  name="OtherBranchForm" property="status" />
<html:hidden  name="OtherBranchForm" property="deprecated" />
<html:hidden  name="OtherBranchForm" property="versionTime" />

</td>
</tr>
</html:form>
</table>
</body>
</html>

