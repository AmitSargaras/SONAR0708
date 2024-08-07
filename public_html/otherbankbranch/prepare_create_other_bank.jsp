<%@ page import="com.integrosys.component.notification.bus.INotification,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 java.util.ArrayList,
                 com.integrosys.component.notification.bus.OBNotification,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankForm"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.IOtherBank"%>


<%
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	List list =(ArrayList) request.getAttribute("cityList");
	

	System.out.println("************************************ "
			+ list.size());
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
			clearDisplayDropdown('stateId');
			clearDisplayDropdown('cityId');
		}
	 var dep = 'regionId';
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
			clearDisplayDropdown('cityId');
	}
	 var dep = 'stateId';
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
	 var dep = 'cityId';
	 var url = '/cms/OtherBank.do?event=refresh_city_id&stateId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
	
	function submitPage() {
		document.forms[0].action="OtherBank.do?event=maker_submit_create_other_bank";
		document.forms[0].submit();
	}

	function savePage() {
		document.forms[0].action="OtherBank.do?event=maker_save_create_other_bank";
		document.forms[0].submit();
	}
		


</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<html:form action="OtherBank.do">
<input type="hidden" name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0"/>

  <tr >

	<td width="100%" height="100%" valign="bottom" >
      <table width="98%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
      <tr>
    	<td>        <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank Details:Add</h3>                
		</td>
      </tr>
    <tr height="95%">
        <td valign="top">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td width="70%">
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
				                  <td class="fieldname" >Bank Code <font color="red">*</font></td>
				                  <td>
				                  	<html:text property="otherBankCode"  maxlength="30"/>
				                  	<html:errors property="otherBankCodeError"/>
				                  	
				                  	
				                  </td>
				                  <td class="fieldname" width="15%">Bank Name <font color="red">*</font>
				                  <br/><bean:message key="error.string.otherbank.name"/></td>
				                  <td><html:text property="otherBankName"  maxlength="50"/>
				                  <html:errors property="otherBankNameError"/>
				                  </td>
				                </tr>
				                <tr class="odd">  
				                  <td class="fieldname" >Address </td>
				                  <td width="25%">
				                  	<html:textarea name="OtherBankForm" property="address" cols="45" rows="5" ></html:textarea>
				                 <html:errors property="addressError"/> </td>
				                  
				                  <td class="fieldname" >Country  </td>
				                  <td>
				                  	<html:select name="OtherBankForm" property="countryId"  onchange="javascript:refreshRegionId(this)">
				                  		<option value="">Please Select</option>
				                  		<html:options collection="countryList" labelProperty="label" property="value" />
				                  	</html:select>
								  </td>
				                 </tr> 
				                
				                <tr class="even">
				                	<td class="fieldname" >region  </td>
				                  	<td>
				                  		<html:select name="OtherBankForm" property="regionId"  onchange="javascript:refreshStateId(this)">
				                  			<option value="">Please Select</option>
				                  			<html:options collection="regionList" labelProperty="label" property="value" /> 
				                  		</html:select>
				                  	</td>
				                  	
				                	<td class="fieldname" >State  </td>
				                  	<td>
				                  		<html:select name="OtherBankForm" property="stateId"  onchange="javascript:refreshCityId(this)">
				                  			<option value="">Please Select</option>
				                  			<html:options collection="stateList" labelProperty="label" property="value" />
				                  		</html:select>
				                  	</td>
				                </tr>
				                <tr class="odd">  
				                  <td class="fieldname" >City </td>
				                  <td width="25%">
				                  	<html:select name="OtherBankForm" property="cityId" >
				                  		<option value="">Please Select</option>
				                  		<html:options collection="cityList" labelProperty="label" property="value" />
				                  	</html:select>
				                  </td>
				                  <td class="fieldname" >Telephone No. </td>
				                  <td>
				                  	<html:text name="OtherBankForm" property="contactNo" maxlength="15" />
				                  	<html:errors property="contactNoError"/>
				                  </td>
				                </tr>
				                <tr class="even">  
								  <td class="fieldname" >Bank email ID</td>
				                  <td>
				                  	<html:text name="OtherBankForm" property="contactMailId" maxlength="50" ></html:text>
				                  	<html:errors property="contactMailIdError"/>
				                  </td>
				                  <td class="fieldname">Fax No.</td>
				                  <td>
				                  	<html:text name="OtherBankForm" property="faxNo" maxlength="15"></html:text>
				                  	<html:errors property="faxNoError"/>
				                  </td>
				                </tr>
				                <tr class="even">  
								  <td class="fieldname" >Status</td>
				                  <td>
				                  	<input type="radio" name="status" checked="checked" value="ACTIVE" disabled="disabled"><%=ICMSConstant.STATE_ENABLE.toString()%></input>
				                  	<input type="radio" name="status" value="INACTIVE" disabled="disabled"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
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
						<td width="100" valign="baseline" align="center"><a href="#"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image2211','','img/save2.gif',1)"
							onClick="savePage()"><img src="img/save1.gif"
							name="Image2211" border="0" id="Image2211" /></a></td>
						<td width="100" valign="baseline" align="center"><a href="#"
							onMouseOut="MM_swapImgRestore()"
							onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick="submitPage()"><img src="img/submit1.gif"
							name="Image3311" border="0" id="Image3311" /></a></td>
						<td width="100" valign="baseline" align="center">
						 <a href="OtherBank.do?event=view_other_bank"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>
						
						</td>
					</tr>	

            </table>
        </td>
    </tr>
</table>

</td>
</tr>
</html:form>
</table>
</body>
</html>

