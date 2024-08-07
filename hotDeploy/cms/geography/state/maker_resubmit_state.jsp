<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>

<%@page import="com.integrosys.cms.ui.geography.state.StateForm"%>
<%@page import="com.integrosys.cms.app.geography.state.trx.IStateTrxValue"%><html>

<%
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "+context);
	
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			 + path + "/";
			System.out.println("************************************ "+basePath);			

	StateForm stateForm = (StateForm) request.getAttribute("StateForm");
	IStateTrxValue stateTrx = (IStateTrxValue) session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.IStateTrxValue");
	
	System.out.println(" stateTrx"+stateTrx.getFromState());
	List countryList=null;
	List regionList=null;
	
	countryList = (List)session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.countryList");
	regionList = (List)session.getAttribute("com.integrosys.cms.ui.geography.state.StateAction.regionList");
	
	pageContext.setAttribute("countryList",countryList);
	pageContext.setAttribute("regionList",regionList);
%>

<head>
<title>Untitled Document</title>
<script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print" rel="stylesheet" type="text/css" />

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
	
	function submitPage () {
		document.forms[0].action="State.do?event=maker_confirm_resubmit_edit_state";
	    document.forms[0].submit();
	}
	
	function getList(){
	    alert('doing');
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
	 var dep = 'regionOBId';
	 var url = '/cms/State.do?event=refresh_region_id&countryId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}	
	
	insertHeader();
	insertMenu('examples');

//
</script>
<!--		 InstanceEndEditable -->
	</head>

<html:form action='State.do?'>
<body>
<!--			 InstanceBeginEditable name="Content" -->
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
					<br>
					<h3>
						<%if( stateTrx.getFromState().equals("PENDING_DELETE") ){ %>
								Disable State
						<%} else if( stateTrx.getFromState().equals("PENDING_ACTIVATE") ){ %>
								Enable State
						<%} else { %>
								State
						<%} %>	
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
				<%
					String fromState = stateTrx.getFromState();
					if( fromState.equals("PENDING_ACTIVATE") || fromState.equals("PENDING_DELETE") )
					{
				%>
				<tr class="even">
					<td class="fieldname" width="20%">State Code <font color="red">*</font></td>
					<td width="30%"><bean:write name="StateForm" property="stateCode"/>&nbsp;
					</td>
					<td class="fieldname" width="20%">State Name</td>
					<br/><bean:message key="error.string.location.name"/>
					<td width="30%"><bean:write name="StateForm" property="stateName"/>
					</td>
				</tr>	
				
				<tr class="even">	
					<td class="fieldname" width="20%">Country Name</td>
					<td class="even" width="20%">									
					<html:select property="countryOBId" name="StateForm" disabled="true">				                  
						<html:option value="">Please Select</html:option>                      
						<html:options collection ="countryList" labelProperty ="label" property ="value"/>								                   
					</html:select>									
					</td>
					
					<td class="fieldname" width="20%">Region Name</td>
					<td class="even" width="20%">									
						<html:select property="regionOBId" name="StateForm" onchange="javascript:refreshRegionId(this)" disabled="true">				                  
						<option value="">Please Select </option>                      
						<html:options collection ="regionList" labelProperty ="label" property ="value"/>								                   
					</html:select>									
					</td>
				</tr>
				<%}else{ %>
				<tr class="even">
					<td class="fieldname" width="20%">State Code <font color="red">*</font></td>
					<td width="30%"><bean:write name="StateForm" property="stateCode"/>&nbsp;
					<br/><html:errors property="stateCodeError"/></td>
					
					<td class="fieldname" width="20%">State Name</td>
					<td width="30%"><html:text name="StateForm" property="stateName"></html:text>
					<br/><html:errors property="stateNameError"/></td>
				</tr>
				<tr class="even">	
					<td class="fieldname" width="20%">Country Name</td>
					<td class="even" width="20%">									
					<html:select property="countryOBId" name="StateForm" onchange="javascript:refreshRegionId(this)">				                  
						<html:option value="">Please Select</html:option>                      
						<html:options collection ="countryList" labelProperty ="label" property ="value"/>								                   
					</html:select>									
					<br/><html:errors property="countryOBIdError"/></td>
					
					<td class="fieldname" width="20%">Region Name</td>
					<td class="even" width="20%">									
						<html:select property="regionOBId" name="StateForm">				                  
						<option value="">Please Select </option>                      
						<html:options collection ="regionList" labelProperty ="label" property ="value"/>								                   
					</html:select>									
					<br/><html:errors property="regionOBIdError"/>	</td>
				</tr>
				
				<%} %>
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
					<td class="even"><%=stateTrx.getUserInfo()%>&nbsp;</td>
				</tr>
				<tr class="odd">
					<td class="fieldname">Last Remarks Made</td>
					<td><%=stateTrx.getRemarks() != null ? stateTrx.getRemarks(): ""%>&nbsp;</td>
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
<html:hidden  name="StateForm" property="id" />
<html:hidden name="StateForm" property="stateCode" />
<html:hidden name="StateForm" property="stateName" />
<html:hidden name="StateForm" property="countryOBId" />
<html:hidden name="StateForm" property="regionOBId" />
<html:hidden  name="StateForm" property="status" />
<html:hidden  name="StateForm" property="deprecated" />
</html:form>
<!--	 InstanceEnd -->
</html>
