<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java"
	import="com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.geography.GeographyAction,com.integrosys.cms.ui.geography.region.RegionForm,com.integrosys.base.businfra.search.SearchResult,com.integrosys.cms.app.geography.country.bus.OBCountry,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.Collection,java.util.List"%>
<%
	String context = request.getContextPath() + "/";

	System.out.println("************************************ "
			+ context);
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	
	List countryList=null;	
	countryList = (List)session.getAttribute("com.integrosys.cms.ui.geography.region.RegionAction.countryList");	
	pageContext.setAttribute("countryList",countryList);
%>

<script language="JavaScript" type="text/JavaScript">
    function goPageIndex(ind)
    {
        document.forms[0].startIndex.value  = ind;
        document.forms[0].event.value       = "";
        document.forms[0].submit();
    }

    function saveRegion()
 	{  
 	 	document.forms[0].action      	= "Region.do";
     	document.forms[0].event.value 	= "maker_save_region";
     	document.forms[0].submit();
 	}
 	
    function createRegion()
 	{    
 	 	document.forms[0].action      	= "Region.do";
     	document.forms[0].event.value 	= "maker_create_region";
     	document.forms[0].submit();
 	}

    function goBack(){
		document.forms[0].action		=	"Region.do";
		document.forms[0].event.value	=	"view_list_region";
		document.forms[0].submit(); 
	}

    function getList(){
        alert('doing');
	}
</script>
<html:form action="/Region">
	<html:hidden property="startIndex" />
	<html:hidden property="numItems" />
	<html:hidden property="event" />
	<table width="100%" height="100%" border="0" align="center"
		cellpadding="0" cellspacing="0" class="tblFormSection"
		id="contentWindow">
		<tr height="95%">
			<td valign="top">
			<div id="contentCanvas" style="height: 100%; width: 100%;">
			<table width="96%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<tr>
					<td width="70%">
					<h3>Create Region</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td colspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="tblInfo">
						<tbody>
							<tr>
								<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									class="tblInput">
									<thead>
									</thead>
									<tbody>
										<tr class="odd">
											<td class="fieldname" width="20%">Region Code<font color="red">*</font></td>
											<td class="even" width="20%"><html:text
												property="regionCode"  maxlength="30"></html:text>
											<html:errors property="regionCodeError"/></td>

											<td class="fieldname" width="20%">Region Name<font color="red">*</font></td>
											<td class="even" width="20%" ><html:text
												property="regionName" maxlength="30" ></html:text>
											<html:errors property="regionNameError"/></td>
										</tr>

										<tr class="even">
											<td class="fieldname" width="20%">Country Name<font color="red">*</font></td>
											<td class="even" width="20%"><html:select
												property="countryOBId" name="RegionForm">
												<html:option value="">Please Select</html:option>
												<html:options collection="countryList" labelProperty="label"
													property="value" />
											</html:select>
											<br/><html:errors property="countryOBIdError"/></td>
											<td class="fieldname">&nbsp;</td>
											<td class="even">&nbsp;</td>
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
							<td width="65">&nbsp;</td>
							<td width="65">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2">
							<center><a href="javascript:saveRegion()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/save2.gif',1)"><img
								src="img/save1.gif" name="Image4411" border="0" id="Image4411" />
							</a></center>
							</td>
							<td colspan="2">
							<center><a href="javascript:createRegion()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)">
							<img src="img/submit1.gif" name="Image4411" border="0"
								id="Image4411" /> </a></center>
							</td>
							<td colspan="2">
							<center><a href="javascript:goBack()"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="Image4411" border="0"
								id="Image4411" /> </a></center>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
			</div>
			</td>
		</tr>
	</table>
<html:hidden property="regionCode"/>	
</html:form>