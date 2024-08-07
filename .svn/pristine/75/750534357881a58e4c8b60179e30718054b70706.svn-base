<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.customer.CategoryCodeConstant"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.ui.collateral.pledgor.PledgorForm" %>

<html>
<head>
<title>Search Pledgor</title>

<%
    ArrayList customerList = (ArrayList) request.getAttribute("customerList");
    if (customerList == null) {
        customerList = new ArrayList();
    }
    
    String formNameDotDo = request.getParameter("formNameDotDo");
    PledgorForm form = (PledgorForm)request.getAttribute("PledgorForm");
    
%>
<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function submitPage(searchButton) {
	
        document.forms[0].searchButton.value=searchButton;
        if(searchButton==1)  {
            //document.forms[0].customerName.value="";
            document.forms[0].legalID.value="";
            document.forms[0].IDType.value="";
            //document.forms[0].idNO.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="search_pledgor";
        } else if(searchButton==2){
            document.forms[0].customerName.value="";
            //document.forms[0].legalID.value="";
            document.forms[0].IDType.value="";
            //document.forms[0].idNO.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="search_pledgor";
        } else if(searchButton==3){
            document.forms[0].customerName.value="";
            document.forms[0].legalID.value="";
            //document.forms[0].IDType.value="";
            //document.forms[0].idNO.value="";
            //document.forms[0].issuedCountry.value="";
            
            document.forms[0].event.value="search_pledgor";
       	} else if(searchButton==4){
       		document.forms[0].event.value="cancel";
       	} else if(searchButton==5 || searchButton==6){
            var custSize = "<%=customerList.size()%>";
            for (var i=0; i<custSize; i++) {
                document.forms[0].relationship[i].selectedIndex = 0;
            }
            document.forms[0].event.value="search_pledgor";
        }
        document.forms[0].submit();
    }

    function save() {
    	document.forms[0].event.value="save_pledgor";
    	document.forms[0].submit();
    }
	
	function handleEnter (field, event, itemPressed) {
		var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
		//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

		if (keyCode == 13) {
			if (field.value == "" || field.value == null) {
				//
			}
			else {
				submitPage(itemPressed);
			}
			return false;
		} 
		else
		return true;
	}

</script>
</head>
<%
	String columnStyle = "fieldname";
	String[] style = { "even", "odd" };
	int count = 1;
%>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<html:form action="<%=formNameDotDo%>">
		<html:hidden property="searchButton" />
		<html:hidden property="event" />
		<input type="hidden" name="subtype"
			value="<%=request.getParameter("subtype")%>">
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
								<td class="<%=columnStyle %>"><bean:message key="label.customer.name" /></td>
								<td><html:text property="customerName" maxlength="40" onkeypress="return handleEnter(this, window.event||event, 1);" /> 
									<a onclick="submitPage(1)" onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('Image1','','img/search2a.gif',1)"><img
									src="img/search1a.gif" name="Image1" border="0" id="Image1" /></a>
								<html:errors property="customerName" /></td>
							</tr>
							<tr class="<%=style[++count%2] %>">
								<td class="<%=columnStyle %>"><bean:message key="label.customer.id" /></td>
								<td><html:text property="legalID" maxlength="20" onkeypress="return handleEnter(this, window.event||event, 2);" /> 
									<a onclick="submitPage(2)" onmouseout="MM_swapImgRestore()"
									onmouseover="MM_swapImage('Image2','','img/search2a.gif',1)"><img
									src="img/search1a.gif" name="Image2" border="0" id="Image2" /></a>
								<html:errors property="legalID" /></td>
							</tr>
							<tr class="<%=style[++count%2] %>">
								<td class="<%=columnStyle %>"><bean:message key="label.global.id" /></td>
								<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									class="tblinfo" style="margin-top: 0">
									<tr>
										<td class="<%=style[count%2] %>"><bean:message key="label.global.type" /></td>
										<td><html:select property="IDType" onkeypress="return handleEnter(this, window.event||event, 3);">
											<integro:common-code
												categoryCode="<%=CategoryCodeConstant.ID_TYPE%>" />
											</html:select><a onclick="submitPage(3)" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image3','','img/search2a.gif',1)"><img
											src="img/search1a.gif" name="Image3" border="0" id="Image3" /></a>
										<html:errors property="IDType" /></td>
									</tr>
									<tr>
										<td class="<%=style[count%2] %>"><bean:message key="label.global.no" /></td>
										<td><html:text property="idNO" maxlength="20" onkeypress="return handleEnter(this, window.event||event, 3);" /> 
											<html:errors property="idNO" />
										</td>
									</tr>
									<tr>
										<td class="<%=style[count%2] %>"><bean:message key="label.pledgor.issued.country" /></td>
										<td><html:select property="issuedCountry" onkeypress="return handleEnter(this, window.event||event, 3);">
												<integro:country-list />
											</html:select> <html:errors property="issuedCountry" />
										</td>
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
										<td width="3%"><bean:message key="label.global.sn" /></td>
										<td width="12%"><bean:message key="label.customer.id" /></td>
										<td width="14%"><bean:message
											key="label.customer.id.type" /></td>
										<td width="14%"><bean:message
											key="label.customer.id.number" /></td>
										<td width="25%"><bean:message
											key="label.customer.security.pledgor.name" /></td>
										<td width="36%"><bean:message
											key="label.customer.security.pledgor.relationship" /></td>
										<td width="6%"><bean:message key="label.select" /> <html:errors
											property="select" /></td>
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
                                                <td class="index"><% int index = indexId.intValue(); %><%=index + 1%></td>
                                                <td><%=OB.getLegalReference()%>
                                                    <html:hidden property="cifNo" value="<%=OB.getLegalReference()%>" /></td>
                                                <td>
                                                    <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ID_TYPE, OB.getIdType())%>" />&nbsp;
                                                    <html:hidden property="idTypeCode" value="<%=CategoryCodeConstant.ID_TYPE%>"></html:hidden>
                                                    <%
                                                    	String idType = OB.getIdType();
                                                    	if (idType == null) {
	                                                    	idType = "";
                                                    	}
                                                    %>
                                                    <html:hidden property="idType" value="<%=idType%>"></html:hidden>
                                                </td>
                                                <td><integro:empty-if-null value="<%=OB.getIdNo()%>" />
													<%
                                                    	String idNo = OB.getIdNo();
                                                    	if (idNo == null) {
	                                                    	idNo = "";
                                                    	}
                                                    %>
                                                    <html:hidden property="idNo" value="<%=idNo%>"></html:hidden></td>
                                                <td><integro:empty-if-null value="<%=OB.getLegalName()%>" />
                                                    <html:hidden property="pledgorName" value="<%=OB.getLegalName()%>"></html:hidden></td>
                                                <td><html:select property="relationship" value='<%=form != null && form.getRelationship() != null? form.getRelationship()[index]: "" %>' >
                                                    <integro:common-code categoryCode="RELATIONSHIP" />
                                                    </html:select><html:errors property="relationship" /></td>
                                                <td style="text-align: center;"><html:checkbox
                                                    property="selected" value="<%=Integer.toString(index)%>"></html:checkbox>
                                                </td>
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
						<td align="center"><logic:present name="customerList">
							<a href="#" onclick="save()" onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
								src="img/ok1.gif" name="Image3311" border="0" id="Image3311"
								width="60" height="22" /></a>
						</logic:present> <a href="javascript:submitPage(4)"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image221','','img/cancel2.gif',1)">
						<img src="img/cancel1.gif" name="Image221" width="70" height="20"
							border="0" id="Image221" /></a></td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
  <!-- General Purpose Bar -->
<logic:present name="customerList">
<% if (customerList.size() >= 10) { %>    
    <tr id="generalPurposeBarTR">
	<td height="25">
		<table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">
		<tr>
			<!--<td align="left"><a href="javascript:submitPage(5)"> << Previous</a></td>-->
	 	    <td align="right"><a href="javascript:submitPage(6)"> >> Next</a></td>
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