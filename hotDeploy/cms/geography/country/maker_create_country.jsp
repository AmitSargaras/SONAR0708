<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java"
	import="com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.geography.GeographyAction,com.integrosys.cms.ui.geography.GeographyForm,com.integrosys.base.businfra.search.SearchResult,com.integrosys.cms.app.geography.bus.OBGeography,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.Collection,java.util.List"%>

<%
	List searchResult = (List) request.getAttribute("cityList");
	int counter = 0;
	Collection cityList = null;
	int noofItems = 0;
	if (searchResult != null) {

		//	noofItems = searchResult.getNItems();
		pageContext.setAttribute("cityList", searchResult);
		pageContext.setAttribute("citySize", searchResult.size() + "");
	}
%>

<script language="JavaScript" type="text/JavaScript">
    function goPageIndex(ind)
    {
        document.forms[0].startIndex.value  = ind;
        document.forms[0].event.value       = "";
        document.forms[0].submit();
    }

    function saveCountry()
 	{   
 	 	document.forms[0].action      	= "Country.do";
     	document.forms[0].event.value 	= "maker_save_country";
     	document.forms[0].submit();
        
 	}
 	
    function createCountry()
 	{    
 	 	document.forms[0].action      	= "Country.do";
     	document.forms[0].event.value 	= "maker_create_country";
     	document.forms[0].submit();
 	}

    function goBack(){
		document.forms[0].action		=	"Country.do";
		document.forms[0].event.value	=	"view_list_country";
		document.forms[0].submit(); 
	}
</script>

<html:form action="Country.do">
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
				<h3>Create Country</h3>
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
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tbody>
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>									
									<tr class="odd">	
										<td class="fieldname" width="20%">Country Code<font color="red">*</font></td>
				                        <td class="even" width="20%"><html:text property="countryCode" ></html:text>
				                        <html:errors property="countryCodeError"/></td>
										
										<td class="fieldname" width="20%">Country Name<font color="red">*</font></td>
				                        <td class="even" width="20%"><html:text property="countryName" maxlength="50"></html:text>
				                        <html:errors property="countryNameError"/></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					</tbody>
				</table>
				<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr><td width="65">&nbsp;</td>
					<td width="65">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<center>
						<a href="javascript:saveCountry()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/save2.gif',1)"><img
								src="img/save1.gif" name="Image4411" border="0" id="Image4411" />
						</a>
					</center>
					</td>
					<td colspan="2">
						<center>
							<a href="javascript:createCountry()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)"><img
									src="img/submit1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
						</center>	
						</td> 
						<td colspan="2">
							<center>
							<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
									src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
							</a>
						</center>
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
<html:hidden property="countryCode"/> 	
</html:form>
