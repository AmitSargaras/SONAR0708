<%@ page import="com.integrosys.cms.app.image.bus.OBImageUploadAdd,
com.integrosys.base.uiinfra.tag.PageIndex,,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
java.util.Iterator,java.util.List"%>
<%@ page import ="java.text.DecimalFormat,java.text.NumberFormat" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	String context = request.getContextPath() + "/";
%>
<%
	String custId= (String) request.getAttribute("legalName");
	String custName=(String) request.getAttribute("customerName");
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
	
	System.out.println("Customer Id : "+custId+ " AND Customer Name : "+ custName);
%>

<%
	SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.searchResult");
	int counter = 0;
	int noofItems = 0;
	int index = 0;
	int sno = 0;
	int startInd = 0;

	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;
	System.out.println("Search Result : == " + searchResult);
	if (searchResult != null) {
		resultList = searchResult.getResultList();
		startInd = searchResult.getStartIndex();
		totalCount = searchResult.getNItems();
		listSize = resultList.size();
		pageContext
				.setAttribute("imageListSize", Integer.toString(listSize));
		pageContext.setAttribute("resultList", resultList);
		System.out.println("Result List : == "+resultList);
	}
%>

<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%><html>
	<head>
		<script language="JavaScript" type="text/JavaScript">
function submitImageUpload() {

	var c_value = "";
	for (var i=0; i < document.forms[0].selected.length; i++)
	   {
	   if (document.forms[0].selected[i].checked)
	      {
	      c_value = c_value + document.forms[0].selected[i].value + ",\n";
	      }
	   }
	
	

    document.forms[0].action="ImageUploadAdd.do?event=maker_confirm_submit&imageId="+c_value;
    document.forms[0].method="POST";
    document.forms[0].submit();
}

function cancelPage() {
	document.forms[0].action="ImageUpload.do?event=image_upload";
	document.forms[0].submit();
}
function submitPage() {
	document.forms[0].action="ImageUpload.do?event=image_upload";
	document.forms[0].submit();
}

</script>
	</head>
	<html:form action="/ImageUploadAdd.do" method="POST">
	<html:hidden property="startIndex" />
	
	<html:hidden property="event" value="maker_prepare_submit"/>
	<body>
		<form>
			<tr>
				<td width="70%" valign="top">
					<table id="window" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<table width="100%" height="100%" border="0" cellpadding="0"
									cellspacing="0" id="contentWindow">
									<tr>
										<td colspan="3" valign="top">
											<table width="90%" class="tblFormSection" border="0"
												align="center" cellpadding="0" cellspacing="0">
												<tr>
													<td width="100%">

													</td>
												</tr>
											</table>
										</td>
									</tr>
									<!--//End CR-120 Search Diary Item-->
									<tr>
										<td colspan="3" valign="top"
											style="height: 100%; width: 100%;">

											<table width="70%" class="tblFormSection" border="0"
												align="center" cellpadding="0" cellspacing="0"
												style="margin-bottom: 15px">
												<thead>
													<tr>
														<td>
															<h3>
																Image Uploaded Details
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
															<table width="100%" class="tblinfo" style="margin-top: 0"
																border="0" cellspacing="0" cellpadding="0">
																<thead>
																	<tr>
																		<td width="5%">
																			S/N
																		</td>
																		<td width="10%" nowrap="nowrap">
																			FileName
																		</td>
																		<td width="5%">
																			Type Of Document
																		</td>
																		<td width="7%">
																			Facility
																		</td>
																		<td width="7%">
																			Facility Document Name
																		</td>
																		<td width="7%">
																			Other Facility Document
																		</td>
																		<td width="7%">
																			Security
																		</td>
																		<td width="7%">
																			Security Document Name
																		</td>
																		<td width="7%">
																			Other Security Document
																		</td>
																		<td width="7%">
																			Statement Type
																		</td>
																		<td width="7%">
																			Statement Document Name
																		</td>
																		<td width="5%">
																			CAM Number
																		</td>
																		<td width="7%">
																			CAM Document Name
																		</td>
																		<td width="7%">
																			Other Document Name
																		</td>
																		<td width="5%">
																			Bank Name
																		</td>
																	</tr>
																</thead>
																<tbody>
																<logic:greaterThan name="imageListSize" value="0">
																		<logic:iterate id="obImageUploadAdd" name="resultList"
																			type="com.integrosys.cms.app.image.bus.OBImageUploadAdd"
																			scope="page" length="10" offset="<%=String.valueOf(startIndex) %>">
																	<%
																		String rowClass = "";
																		counter++;
																		if (counter % 2 != 0) {
																			rowClass = "odd";
																		} else {
																			rowClass = "even";
																		}
																	%>
																	<tr class=<%=rowClass%>>
																		<td class="index" width="5%"><%=counter+startIndex%></td>
																		<td width="15%">
																			&nbsp;
																			<%=obImageUploadAdd.getImgFileName()%></td>
																		<%-- <td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/>
																		</td> --%>
																		<%-- <td width="10%">
																			&nbsp;
                    															<integro:common-code-single categoryCode="IMG_UPLOAD_CATEGORY" entryCode="<%=obImageUploadAdd.getCategory()%>" display="true" descWithCode="false"/>&nbsp;
																			</td> --%>
																			
																			<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/>
																		</td>
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getFacilityName() %>"/>
																		</td>
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getFacilityDocName() %>"/>
																		</td>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOtherDocName() %>"/>
																		</td>
																		<%String securityNameIds = obImageUploadAdd.getSecurityIdi()+"-"+obImageUploadAdd.getSubTypeSecurity(); 
																		if(!"Security".equals(obImageUploadAdd.getTypeOfDocument())){%>
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getSecurityIdi()%>"/>
																		</td>
																		<%}else{ %>
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=securityNameIds%>"/>
																		</td>
																		<%} %>
																		
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getSecurityDocName() %>"/>
																		</td>
																		
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOtherSecDocName() %>"/>
																		</td>
																		
																		<td width="7%">
																			&nbsp;
                                    									<integro:common-code-single categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE %>" entryCode="<%=obImageUploadAdd.getStatementTyped()%>" display="true" descWithCode="false"/>
                                    		
																		</td>
																		
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getStatementDocName() %>"/>
																		</td>
																		
																		<td width="5%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getHasCam() %>"/>
																		</td>
																		
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getCamDocName() %>"/>
																		</td>
																		
																		<td width="7%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOthersDocsName() %>"/>
																		</td>
																		
																		<td width="5%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getBank() %>"/>
																		</td>
																	</tr>
																	</logic:iterate>
																	</logic:greaterThan>
																 			<logic:equal name="imageListSize" value="0">
																				<tr class="even">
																					<td colspan="17">No Record Found</td>
																				</tr>
																			</logic:equal>
																</tbody>
															</table>
														</td>
		</tr>
										
<td align="center">
	<br>
</td>
	</html:form>
												</tbody>
											</table>
										</td>
									</tr>
									<% if(searchResult != null && searchResult.getNItems() != 0) {%>
				<tr>
				    <td height="25">
				        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
				            <tr>
				            <%
								String url="ImageUploadAdd.do?legalName="+custId+"&customerName="+custName+"&event=paginate&startIndex=";
				            %>
							
				                <td valign="middle">
				                    <integro:pageindex pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
				                            url="<%=url%>"/>
				                </td>
				            </tr>
				        </table>
				    </td>
				</tr>
				<%} %>	
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</body>
</html>