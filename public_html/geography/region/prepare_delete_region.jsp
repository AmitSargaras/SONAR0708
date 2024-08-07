<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@page import="com.integrosys.cms.ui.geography.region.RegionForm"%>
<%@page import="java.util.List"%>

<%
    RegionForm form = (RegionForm) request.getAttribute("RegionForm");   
	String flg = (String) request.getAttribute("flag");
	String ind= (String) request.getAttribute("startIndex");
	
	List countryList=null;
	
	countryList = (List)session.getAttribute("com.integrosys.cms.ui.geography.region.RegionAction.countryList");
	
	pageContext.setAttribute("countryList",countryList);
%>
<%
String actionStr1 = "com.integrosys.cms.ui.geography.region.RegionAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>


<script language="JavaScript" type="text/javascript">
	function goBack(){
		document.forms[0].action		=	"Region.do?startIndex="+<%=ind%>;
		document.forms[0].event.value	=	"view_list_region";
		document.forms[0].submit(); 
	}

	function deleteRegion(){
		var flag = <%=flg %>
		if( flag == true )
			alert('Please Disable The States for this REGION !!!');
		else
		{
			var ans = window.confirm('Are You Sure to Disable the REGION ');
			if( ans == true )
			{
				document.forms[0].action		=	"Region.do";
				document.forms[0].event.value	=	"maker_delete_region";
				document.forms[0].submit();
			}			
		}  
	}
	
</script>

<html:form action="Region.do">
<html:hidden property="event"/>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
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
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr><td><h3>Disable Region</h3></td></tr>
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
										<td class="fieldname" width="20%">Region Code</td>
				                        <td class="even" width="20%"><bean:write name="RegionForm" property="regionCode"/></td>
										
										<td class="fieldname" width="20%">Region Name</td>
				                        <td class="even" width="20%"><bean:write name="RegionForm" property="regionName"/></td>
									</tr>
									
									<tr class="even">	
										<td class="fieldname" width="20%">Country Name</td>
										<td class="even" width="20%">									
											<html:select property="countryOBId" name="RegionForm" disabled="true">				                  
												<html:option value="">Please Select</html:option>                      
												<html:options collection ="countryList" labelProperty ="label" property ="value"/>								                   
											</html:select>									
										</td>
										
										<td class="fieldname" width="20%">&nbsp;</td>
										<td class="even" width="20%">&nbsp;</td>
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
							<a href="javascript:deleteRegion()" onmouseout="MM_swapImgRestore()"
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


			<!-- InstanceEndEditable -->
	</body>
<html:hidden name="RegionForm" property="regionCode" />
<html:hidden name="RegionForm" property="regionName" />
<html:hidden name="RegionForm" property="id" />
<html:hidden name="RegionForm" property="countryId" />
<html:hidden name="RegionForm" property="status" />
<html:hidden name="RegionForm" property="deprecated" />
</html:form>

