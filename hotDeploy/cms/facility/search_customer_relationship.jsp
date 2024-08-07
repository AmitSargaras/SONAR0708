
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.customer.CategoryCodeConstant"%>
<%@page import="java.util.*"%>
<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page	import="com.integrosys.cms.ui.limit.facility.relationship.RelationshipForm"%>

<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
/**
 *do not change the condition value inside the submit page js, unless u know exactly what u do
 * 1 -> search by name - with frame
 * 2 -> search by cif no - with frame
 * 3 -> search by id type - with frame
 * 4 -> search by name - without frame
 * 5 -> search by cif no - without frame
 * 6 -> search by id type - without frame
 * this number is not related outside this file
 **/
	function submitPage(searchButton) {
	
        document.forms[0].searchButton.value=searchButton;
        if(searchButton==1)  {
            //document.forms[0].legalName.value="";
            document.forms[0].LEReference.value="";
            document.forms[0].idType.value="";
            //document.forms[0].idNo.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="<%=FacilityMainAction.EVENT_SEARCH_CUSTOMER %>";
        }
        else if(searchButton==2){
            document.forms[0].legalName.value="";
            //document.forms[0].LEReference.value="";
            document.forms[0].idType.value="";
            //document.forms[0].idNo.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="<%=FacilityMainAction.EVENT_SEARCH_CUSTOMER %>";
        }
        else if(searchButton==3){
            document.forms[0].legalName.value="";
            document.forms[0].LEReference.value="";
            //document.forms[0].idType.value="";
            //document.forms[0].idNo.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="<%=FacilityMainAction.EVENT_SEARCH_CUSTOMER %>";
       	}
        else if(searchButton==4)  {
            //document.forms[0].legalName.value="";
            document.forms[0].LEReference.value="";
            document.forms[0].idType.value="";
            //document.forms[0].idNo.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="<%=FacilityMainAction.EVENT_SEARCH_CUSTOMER_WO_FRAME %>";
        }
        else if(searchButton==5){
            document.forms[0].legalName.value="";
            //document.forms[0].LEReference.value="";
            document.forms[0].idType.value="";
            //document.forms[0].idNo.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="<%=FacilityMainAction.EVENT_SEARCH_CUSTOMER_WO_FRAME %>";
        }
        else if(searchButton==6){
            document.forms[0].legalName.value="";
            document.forms[0].LEReference.value="";
            //document.forms[0].idType.value="";
            //document.forms[0].idNo.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="<%=FacilityMainAction.EVENT_SEARCH_CUSTOMER_WO_FRAME %>";
       	} 
       	else if(searchButton==7){
       		document.forms[0].event.value="<%=FacilityMainAction.EVENT_ADD %>";
       	}
       	else if(searchButton==8){
       		document.forms[0].event.value="<%=FacilityMainAction.EVENT_ADD_WO_FRAME %>";
       	}
        else if(searchButton==9){
            document.forms[0].event.value="<%=FacilityMainAction.EVENT_SEARCH_CUSTOMER %>";
        }
        document.forms[0].submit();
    }
</script>
</head>
<%
    String columnStyle = "fieldname";
	String[] style = { "even", "odd" };
	int count = 1;

//	SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.customerList");
	String currentTab = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.currentTab");

    ArrayList searchResult = (ArrayList) request.getAttribute("customerList");
    if (searchResult == null) {
        searchResult = new ArrayList();
    }

//    Vector v = new Vector();
//	if (searchResult != null) {
//		v = (Vector) searchResult.subList(0, searchResult.size()-1);
//		if (v == null) {
//			v = new Vector();
//		}
//		pageContext.setAttribute("customerList", v);
//	}
	
	RelationshipForm form = (RelationshipForm) request.getAttribute("FacilityRelationshipForm");
    String event = null;
	if (form != null) {
		event = form.getEvent();
    }
	int searchButton = 0;
	if (!FacilityMainAction.TAB_RELATIONSHIP_CHECKER.equals(event)
			&& !FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(event)
			&& !FacilityMainAction.TAB_RELATIONSHIP_VIEW_WO_FRAME.equals(event)
			&& !FacilityMainAction.EVENT_NAVIGATE_VIEW_WO_FRAME.equals(event)) {
		if (FacilityMainAction.EVENT_LIST_WO_FRAME.equals(event)
				|| FacilityMainAction.EVENT_SAVE_WO_FRAME.equals(event)
				|| FacilityMainAction.EVENT_UPDATE_WO_FRAME.equals(event)
				|| FacilityMainAction.EVENT_DELETE_WO_FRAME.equals(event)
				|| FacilityMainAction.EVENT_PREPARE_SEARCH_CUSTOMER_WO_FRAME.equals(event)
				|| FacilityMainAction.EVENT_SEARCH_CUSTOMER_WO_FRAME.equals(event)) {
			searchButton = 3;
		}
	}
%>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<html:form action="FacilityRelationship.do">
		<html:hidden property="searchButton" />
		<html:hidden property="event" />
		<input type="hidden" name="nextTab" value="<%=currentTab %>">
		<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>">
		<tr>
			<td valign="top">
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td width="70%" colspan="2">
						<h3><bean:message key="title.pledgor.search.customer" /></h3>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<hr>
						</td>
					</tr>
                    <tr>
                        <td><html:errors property="stpError" /></td>
                    </tr>
                </thead>
				<tbody>
					<tr>
						<td>
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="tblinfo" style="margin-top: 0">
							<tr class="<%=style[++count%2] %>">
								<td class="<%=columnStyle %>"><bean:message
									key="label.customer.name" /></td>
								<td><html:text property="legalName" maxlength="40" /> <a
									onclick="submitPage(<%=searchButton + 1 %>)" onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('Image1','','img/search2a.gif',1)"><img
									src="img/search1a.gif" name="Image1" border="0" id="Image1" /></a>
								<html:errors property="legalName" /></td>
							</tr>
							<tr class="<%=style[++count%2] %>">
								<td class="<%=columnStyle %>"><bean:message
									key="label.customer.id" /></td>
								<td><html:text property="LEReference" maxlength="20" /> <a
									onclick="submitPage(<%=searchButton + 2 %>)" onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('Image2','','img/search2a.gif',1)"><img
									src="img/search1a.gif" name="Image2" border="0" id="Image2" /></a>
								<html:errors property="LEReference" /></td>
							</tr>
							<tr class="<%=style[++count%2] %>">
								<td class="<%=columnStyle %>"><bean:message
									key="label.global.id" /></td>
								<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="tblinfo" style="margin-top: 0">
									<tr>
										<td class="<%=style[count%2] %>"><bean:message
											key="label.global.type" /></td>
										<td><html:select property="idType">
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.ID_TYPE%>" />
										</html:select><a onclick="submitPage(<%=searchButton + 3 %>)" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image3','','img/search2a.gif',1)"><img
											src="img/search1a.gif" name="Image3" border="0" id="Image3" /></a>
										<html:errors property="idType" /></td>
									</tr>
									<tr>
										<td class="<%=style[count%2] %>"><bean:message
											key="label.global.no" /></td>
										<td><html:text property="idNo" maxlength="20" /> <html:errors
											property="idNo" /></td>
									</tr>
									<tr>
										<td class="<%=style[count%2] %>"><bean:message
											key="label.pledgor.issued.country" /></td>
										<td><html:select property="issuedCountry">
											<integro:country-list />
										</html:select> <html:errors property="issuedCountry" /></td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<logic:present name="customerList">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="tblinfo" style="margin-top: 0">
								<thead>
									<tr>
										<td width="3%">&nbsp;</td>
                                        <td width="3%"><bean:message key="label.global.sn" />&nbsp;<html:errors property="selectedId"/> </td>
                                        <td width="12%"><bean:message key="label.customer.id" /></td>
										<td width="25%"><bean:message key="label.facility.customer.name" /></td>
									</tr>
								</thead>
								<tbody>
									<logic:empty name="customerList">
										<tr class="odd">
											<td colspan="7"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:empty>
                                    <logic:notEmpty name="customerList">
										<logic:iterate id="OB" name="customerList"
											type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult"
											indexId="indexId">
											<tr class="<%=style[++count%2] %>">
                                                <td class="index"><% int index = indexId.intValue(); %> <%=index + 1%> 
                                                <td><html:radio property="selectedId" value="<%=Integer.toString(index)%>"></html:radio> </td>
												<td><%=OB.getLegalReference()%><html:hidden	property="cifNo" value="<%=OB.getLegalReference()%>"></html:hidden></td>
												<td><integro:empty-if-null value="<%=OB.getLegalName()%>" /><html:hidden
													property="pledgorName" value="<%=OB.getLegalName()%>"></html:hidden></td>
											</tr>
										</logic:iterate>
									</logic:notEmpty>
								</tbody>
							</table>
							</td>
						</tr>
					</logic:present>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr valign="top">
						<td align="center">
						<logic:present name="customerList">
							<%if (searchButton == 0) {%>
								<a href="javascript:submitPage(7)" onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('Image3311','','img/add2.gif',1)"><img
									src="img/add1.gif" name="Image3311" border="0" id="Image331"
									width="75" height="20" /></a>
							<%} else if (searchButton == 3) {%>
								<a href="javascript:submitPage(8)" onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('Image3311','','img/add2.gif',1)"><img
									src="img/add1.gif" name="Image3311" border="0" id="Image331"
									width="75" height="20" /></a>
							<%} %>
						</logic:present> 
						
						<%if (searchButton == 0) {%>
							<a href="FacilityRelationship.do?event=list"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="Image2" width="70" height="20"
							border="0" id="Image2" /></a>
						<%} else if (searchButton == 3) {%>
							<a href="FacilityRelationship.do?event=list_no_frame"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
							<img src="img/cancel1.gif" name="Image2" width="70" height="20"
							border="0" id="Image2" /></a>
						<%} %>
							</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
    <!-- General Purpose Bar -->
    <logic:present name="customerList">
    <% if (searchResult.size() >= 10) { %>
    <tr id="generalPurposeBarTR">
    <td height="25">
        <table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">
        <tr>
            <!--<td align="left"><a href="javascript:submitPage(10)"> << Previous</a></td>-->
            <td align="right"><a href="javascript:submitPage(9)"> >> Next</a></td>
        </tr>
        </table>
    </td>
    </tr>
    <% } %>
    </logic:present>
    </html:form>
</table>
</body>
</html>