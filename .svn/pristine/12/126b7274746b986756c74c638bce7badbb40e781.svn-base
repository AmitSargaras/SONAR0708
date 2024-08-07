<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java"
	import="com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.geography.GeographyAction,com.integrosys.cms.ui.geography.city.CityForm,com.integrosys.base.businfra.search.SearchResult,com.integrosys.cms.app.geography.city.bus.OBCity,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.Collection,java.util.List"%>

<%
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	System.out.print("startIndex : "+startIndex);
%>
<%
	SearchResult searchResult = (SearchResult) session
	.getAttribute("com.integrosys.cms.ui.geography.city.CityAction.cityList");
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
		startInd = searchResult.getStartIndex();
		totalCount = searchResult.getNItems();
		listSize = resultList.size();
		pageContext
				.setAttribute("citySize", Integer.toString(listSize));
		pageContext.setAttribute("cityList", resultList);
	}
%>

<script language="JavaScript" type="text/JavaScript">
    function goPageIndex(ind)
    {
        document.forms[0].startIndex.value  = ind;
        document.forms[0].event.value       = "";
        document.forms[0].submit();
    }

    function MM_jumpMenu(targ,selObj,restore){ //v3.0
    	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
    	  if (restore) selObj.selectedIndex=0;
    	 
    }

    function goBack(){
		document.forms[0].action		=	"Geography.do";
		document.forms[0].event.value	=	"checker_view_geography";
		document.forms[0].submit(); 
	}

    function searchCity()
    {
    	var searchType = document.getElementById("selType").value;
    	var searchText = document.getElementById("searchText").value;
                
    	if(searchType == '' && searchText == '')
        {
	        document.forms[0].action            = "City.do";
	        document.forms[0].event.value       = "checker_view_list_city";
	        document.forms[0].submit();
        }
        else
        {
	        if(searchType !='' && searchText!='')
		    {
		        document.forms[0].action            = "City.do?type="+searchType +"&"+ "text="+searchText;
		        document.forms[0].event.value       = "checker_view_list_city";	        
				document.forms[0].submit();
	        }	       
	    }        
    }
 	
</script>

<html:form action="City.do">
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
					<td width="100%">
					<h3>City List</h3>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>

				<tr>
					<td><label>Search :&nbsp;</label> <select id="selType">
						<option value="">--Select--</option>
						<option value="Country">Country</option>
						<option value="Region">Region</option>
						<option value="State">State</option>
					</select> <html:text property="searchText" maxlength="30"/> <img alt="Search"
						src="./img/search.gif" onclick="javascript:searchCity()"></td>
				</tr>

				<tr>
					<td><html:errors property="searchTextError"/></td>
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
								<td width="15%">City Code</td>
								<td width="15%">City Name</td>
								<td width="15%">State Name</td>
								<td width="15%">Region Name</td>
								<td width="15%">Country Name</td>
								<td width="16%">Status</td>
								<td width="15%">Action</td>
							</tr>
						</thead>
						<tbody>
							<logic:greaterThan name="citySize" value="0">								
								<logic:iterate id="OB" name="cityList" type="com.integrosys.cms.app.geography.city.bus.OBCity" scope="page"
												length="10" offset="<%=String.valueOf(startIndex) %>">
									<%
										String rowClass = "";
													counter++;
													if (counter % 2 != 0)
														rowClass = "odd";
													else
														rowClass = "even";
									%>
									<tr class="<%=rowClass%>">
										<td class="index" width="4%"><%=startIndex+counter%></td>
										<td>
										<center><%=OB.getCityCode()%></center>
										</td>
										<%
											long i = OB.getIdCity();
														String name = OB.getCityName();
										%>
										<td><%=OB.getCityName()%></td>
										<td><%=OB.getStateId().getStateName()%></td>
										<td><%=OB.getStateId().getRegionId().getRegionName()%></td>
										<td><%=OB.getStateId().getRegionId().getCountryId().getCountryName()%></td>
										<td><% if(OB.getStatus().equals("ACTIVE")){%>Enable
                               			<%}else{ %>Disable<%}%></td>  
										<td><select name="chooseAction"
											onchange="MM_jumpMenu('self',this,0)">
											<option value="#" selected="selected">Please Select</option>
											<option value="City.do?checkerEvent=yes&event=view_city_by_index&cityId=<%=i%>&startIndex=<%=startIndex%>">View</option>
										</select></td>
									</tr>
								</logic:iterate>
								<table width="130" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="65">&nbsp;</td>
										<td width="65">&nbsp;</td>
									</tr>
									<tr>
										<td colspan="4">
										<center><a href="javascript:goBack()"
											onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
											src="img/cancel1.gif" name="Image4411" border="0"
											id="Image4411" /> </a></center>
										&nbsp;</td>

									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</logic:greaterThan>
							<tr class="odd">
								<td colspan="6">&nbsp;</td>
							</tr>
							<logic:equal name="citySize" value="0">
		                	<tr class="even"><td colspan="8">
		                		No Record Found
		                    </td></tr>
		                </logic:equal>
						</tbody>
					</table>
					</td>
				</tr>
				<!-- General Purpose Bar -->
                 <% if(searchResult != null && searchResult.getNItems() != 0) {%>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
					                            url="City.do?event=checker_paginate&startIndex="/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					<%} %>
			</table>
			</div>
			</td>
		</tr>
	</table>
</html:form>
