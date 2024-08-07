<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java"
	import="com.integrosys.base.uiinfra.tag.PageIndex,
			com.integrosys.cms.ui.geography.GeographyAction,
			com.integrosys.cms.ui.geography.GeographyForm,
			com.integrosys.base.businfra.search.SearchResult,
			com.integrosys.cms.app.geography.bus.OBGeography,
			com.integrosys.base.techinfra.propertyfile.PropertyManager,
			java.util.Collection,java.util.List"%>

<%
	List searchResult = (List) request.getAttribute("continentList");
	int counter = 0;
	Collection cityList = null;
	int noofItems = 0;
	if (searchResult != null)
		pageContext.setAttribute("continentList", searchResult);
%>

<script language="JavaScript" type="text/JavaScript">
    function goPageIndex(ind)
    {
        document.forms[0].startIndex.value  = ind;
        document.forms[0].event.value       = "";
        document.forms[0].submit();
    }

    function searchCity()
    {
    	var searchType = document.getElementById("selType").value;
    	var searchText = document.getElementById("searchtxt").value;
                
    	if(searchType == '' && searchText == '')
        {
	        document.forms[0].action            = "Geography.do";
	        document.forms[0].event.value       = "view_list_city";
	        document.forms[0].submit();
        }
        else
        {
	        if(searchType !='' && searchText!='')
		    {
		        document.forms[0].action            = "Geography.do?type="+searchType +"&"+ "text="+searchText;
		        document.forms[0].event.value       = "view_list_city";	        
				document.forms[0].submit();
	        }	       
	    }        
    }

    function viewCity(id)
 	{
 	 	document.forms[0].action      	= "Geography.do?cityId="+id;
     	document.forms[0].event.value 	= "view_city";     	
     	document.forms[0].submit();
     	 		
 	}
 	
</script>
<html:form action="Geography.do">
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
					<h3>Continent List</h3>
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
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td colspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="tblInfo">
						<thead>
							<tr>
								<td width="5%">S/N</td>
								<td width="15%">Continent Code</td>
								<td width="15%">Continent Name</td>
								<td width="15%">Last Authorized By</td>
								<td width="15%">Last Authorization Date</td>
							</tr>
						</thead>
						<tbody>

						<logic:present name="continentList">
							<logic:iterate id="OB" name="continentList"
								type="com.integrosys.cms.app.geography.bus.IGeography"
								scope="page">
								<%
									String rowClass = "";
									counter++;
									if (counter % 2 != 0)
										rowClass = "odd";
									else
										rowClass = "even";
								%>
								<tr class="<%=rowClass%>">
									<td class="index" width="4%"><%=counter%></td>
									<td>
									<center><%=OB.getCodeName()%></center>
									</td>
									<%
										long i = OB.getId();
										String name = OB.getCodeDesc();
									%>
									<td><%=OB.getCodeDesc()%></td>
									<td>
									<center><%=OB.getUpdateBy()%></center>
									</td>
									<td>
									<center><%=OB.getUpdateDate()%></center>
									</td>
								</tr>
							</logic:iterate>
						</logic:present>

						<logic:notPresent name="continentList">
							<tr class="odd">
								<td colspan="8">No Record Found</td>
							</tr>
						</logic:notPresent>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			</div>
			</td>
		</tr>
	</table>
</html:form>
