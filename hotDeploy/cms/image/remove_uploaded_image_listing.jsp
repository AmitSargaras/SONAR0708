<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.integrosys.cms.app.image.bus.OBImageUploadAdd,java.util.Iterator,java.util.List"%>
<%@ page import ="java.text.DecimalFormat,java.text.NumberFormat" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template'%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%
	String context = request.getContextPath() + "/";
	String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
String customerName = request.getParameter("customerName");
String legalName = request.getParameter("legalName");
String fromAmt = request.getParameter("fromAmt");
String typeOfDocVal = request.getParameter("typeOfDocVal");
String docNameVal = request.getParameter("docNameVal");
String docDatetypeVal = request.getParameter("docDatetypeVal");
String docToAmt = request.getParameter("docToAmt");
String docFrmDateVal = request.getParameter("docFrmDateVal");
String docToDateval = request.getParameter("docToDateval");
%>

<html>
	<head>
		<script language="JavaScript" type="text/JavaScript">
//function submitImageUpload(){ 
//alert("Alert");
	//document.forms[0].action="ImageUploadAdd.do?event=submit";   
//	document.forms[0].submit();
//}
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
	//document.forms[0].action="ImageUpload.do?event=image_upload&customerID=-999999999&limitProfileID=-999999999";
	document.forms[0].action="ImageUpload.do?event=list_image";
	document.forms[0].submit();
}
function submitPage() {
	document.forms[0].action="ImageUpload.do?event=image_upload";
	document.forms[0].submit();
}
function downloadImage(imagePath,imageName,status){ //v3.0
	var aLocation = "ImageUploadAdd.do?event=downloadImage&pID="+imagePath+"&imageName="+imageName+"&status="+status;
	window.location.href = aLocation ;
	//document.forms[0].submit();
}
function remove() {

    var formObj = document.forms[0];
    var k = 0;
    var temp = "";
    for (var i = 0; i < formObj.elements.length; i++) {
        var type = formObj.elements[i].type;
        var name = formObj.elements[i].name;
        if (type == 'checkbox' && name == 'removeBox') {
            k++;
        }
    }
    j = 0;
    if (k > 1) {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'removeBox') {
                var obj = formObj.elements[i];
                if ((obj.checked)) {           //updated: changed from "Delete" to "Required"
                    //therefore instead of if(obj.checked), its if(!(obj.checked))
                    //				alert(formObj.removeID[j].value);
                    temp = temp + "," + formObj.removeBox[j].value;
                }
                j++;
            }
        }
    } else {
        for (var i = 0; i < formObj.elements.length; i++) {
            var type = formObj.elements[i].type;
            var name = formObj.elements[i].name;
            if (type == 'checkbox' && name == 'removeBox') {
                var obj = formObj.elements[i];
                if ((obj.checked)) {           //updated: changed from "Delete" to "Required"
                    //therefore instead of if(obj.checked), its if(!(obj.checked))
                    //				alert(formObj.removeID.value);
                    temp = temp + "," + formObj.removeBox.value;
                }
            }
        }
    }
    //    alert('j'+j);
    if (temp == "") {
        alert('There is no record to remove!');
    }else{
    	var r=confirm("Are you sure you want to delete the selected images ?");
    	if(r==true){
		    temp = temp.substring(1);
		    formObj.event.value = "remove_images";
		    formObj.removeIdx.value = temp;
		    document.forms[0].action="ImageUploadAdd.do?event=remove_images&customerID=-999999999&limitProfileID=-999999999";
			document.forms[0].submit();
    	}
    }
}

function toggleSelectAll() {
	
	//alert("srf"+document.forms[0].selectedArray.value);
	
	var c_value = "";
	var toggleSelect = false;
	if(document.forms[0].selected.length==undefined ){
		if(!document.forms[0].selected.checked)
			toggleSelect=true;
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (!document.forms[0].selected[i].checked)
		      {
			   toggleSelect=true;
		      }
		   }
	}
	
	if(toggleSelect){
		document.forms[0].list11.checked=false;
	}else{
		document.forms[0].list11.checked=true;
	}
	
}
function checkedAllImages(){ 
	var a =0;
	if(document.getElementById("list11").checked){
	for(var s=0;s<document.getElementsByName("selected").length;s++){
	   document.getElementsByName("selected")[s].checked=true;
	}
	}else{
		for(var s=0;s<document.getElementsByName("selected").length;s++){
		   document.getElementsByName("selected")[s].checked=false;
		}
	}
}


function downloadImageZip() {

	var s_value = "";
	var n_value = "";
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (document.forms[0].selected[i].checked)
		      {
		      s_value = s_value + document.forms[0].selected[i].value + "-";
		      }else{
		    	  n_value = n_value + document.forms[0].selected[i].value + "-";
		      }
		   }
	}
	var catg= document.forms[0].category.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].custName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
		document.forms[0].unCheckArray.value=n_value;
		
	    //document.forms[0].submit();
	    //var aLocation = "ImageUploadAdd.do?event=download_image_zip&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&imageId="+s_value+"&unCheckId="+n_value;
	//window.location.href = aLocation ;
		document.forms[0].action="ImageUploadAdd.do?event=download_image_zip&custId="+custId1+"&customerName="+customerName+"&category="+catg;
	    document.forms[0].submit();
		} else{
		alert("Please select the image for downloading.");
	}
}

function printPage() {

	var s_value = "";
	var n_value = "";
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
		   if (document.forms[0].selected[i].checked)
		      {
		      s_value = s_value + document.forms[0].selected[i].value + "-";
		      }else{
		    	  n_value = n_value + document.forms[0].selected[i].value + "-";
		      }
		   }
	}
	var catg= document.forms[0].category.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].custName.value;
	

	if(s_value!=''){
		 //document.forms[0].method="POST";
		//document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    
	   MM_openBrWindow1("ImageTagMap.do?event=print_image&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  // window.focus(); 
		} else{
		alert("Please select the image for printing.");
	}
}
</script>

<script language="JavaScript" type="text/javascript" src="<%=context%>js/ajaxGetImage.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>

<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="<%=context%>js/imageNavigation.js"></script>
	</head>
	<html:form action="/ImageUploadAdd">
	
	<html:hidden property="event"/>
	<html:hidden property="custId"/>
	<html:hidden property="custName"/>
	<html:hidden property="category"/>
	<input type="hidden" name="customerName" value="<%=customerName%>">
	<input type="hidden" name="legalName" value="<%=legalName%>">
	<input type="hidden" name="fromAmt" value="<%=fromAmt%>">
<input type="hidden" name="docDatetypeVal" value="<%=docDatetypeVal%>">
<input type="hidden" name="docToAmt" value="<%=docToAmt%>">
<input type="hidden" name="docFrmDateVal" value="<%=docFrmDateVal%>">
<input type="hidden" name="docToDateval" value="<%=docToDateval%>">
<input type="hidden" name="typeOfDocVal" value="<%=typeOfDocVal%>">
<input type="hidden" name="docNameVal" value="<%=docNameVal%>">
	<body>
		<%
			OBImageUploadAdd obImageUploadAdd = new com.integrosys.cms.app.image.bus.OBImageUploadAdd();
			List obImageUploadAddList = null;
			List custImageListWithTag = null;
			NumberFormat formatter = new DecimalFormat("#0.000");
			obImageUploadAddList = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.obImageUploadAddList");
			
			custImageListWithTag = (List) session.getAttribute("com.integrosys.cms.ui.image.ImageUploadAction.custImageListWithTag");
			
			System.out.println("custImageListWithTag =================================" + custImageListWithTag.size());
			
			int index=0;
		%>
		<input type="hidden" id="removeIdx" name="removeIdx">
			<tr>
				<td width="70%" valign="top">
					<table id="window" border="0" cellpadding="0" cellspacing="0">
					<tr>
					<td>
				  <table width="70%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center">
				  		<thead>
							<tr>
								<td >
									<h3>
										Customer Details
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
					                <tr class="even">
					                    <td class="fieldname" width="20%"><bean:message key="label.list.party.name"/></td>
					                    <td width="30%">
					                    <bean:write name="imageUploadAddForm" property="custName"/>&nbsp;</td>
					                    <td class="fieldname" width="20%"><bean:message key="label.list.party.id"/></td>
					                    <td width="30%"><bean:write name="imageUploadAddForm" property="custId"/>&nbsp;</td>
					                </tr>
			                		</table>
			                </td>
			               </tr>
			              </tbody>
			       </table>
					</td>
					</tr>
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
															<integro:user-role role="<%=teamTypeMemID%>" moduleId="36" operation="Download">
															<a href="#" onclick="downloadImageZip()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
									<img src="img/download.jpg" name="Image3316" border="0"
										id="Image3316" align="right" /> </a>
										<a href="#" onclick="printPage()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3311','','img/print2.gif',1)">
									<img src="img/print1.gif" name="Image3311" border="0"
										id="Image3311" align="right" /> </a>
										</integro:user-role>
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
																		<td width="20%" nowrap="nowrap">
																			FileName
																		</td>
																		<td width="10%">
																			Type Of Document
																		</td>
																		<td width="10%">
																			Type/ID
																		</td>
																		<td width="10%">
																			Document Name
																		</td>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			Other Document Name
																		</td>
																		<td width="10%">
																			Subfolder Name
																		</td>
																		<td width="10%">
																			Document Name(Migrated)
																		</td>
																		<td width="10%">
																			Bank Name
																		</td>
																		<td width="10%">
																			Upload Date & Timestamp
																		</td>																		
											    						<!--Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II -->
																		<td width="5%">
																			Remove
																		</td>
																		<td width="5%">Select
																		 <%	if (obImageUploadAddList != null && obImageUploadAddList.size()>0) { %>
												<input type="checkbox" name="list11" id="list11"
													value="Check All" onClick="checkedAllImages()" /> <%} %>
												</td>
																	</tr>
																</thead>
																<tbody>
																	<%
																		int counter = 0;
																	
																	
																		if (obImageUploadAddList != null && obImageUploadAddList.size() != 0) {
																			for (Iterator it = obImageUploadAddList.iterator(); it.hasNext();) {
																				index++;
																				obImageUploadAdd = (OBImageUploadAdd) it.next();
																				String rowClass = "";
																				counter++;
																				if (counter % 2 != 0) {
																					rowClass = "odd";
																				} else {
																					rowClass = "even";
																				}
																	%>
																	<tr class=<%=rowClass%>>
																		<td class="index" width="5%"><%=counter%></td>
																		<td width="15%">
																			&nbsp;
																			<%=obImageUploadAdd.getImgFileName()%></td>
																		<%-- <td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/>
																		</td> --%>
																		<%-- <td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/>
																		</td> --%>
																		<%-- <td width="10%">
																			&nbsp;
																			<%System.out.println("obImageUploadAdd.getCategory()"+obImageUploadAdd.getCategory()); %>
                    															<integro:common-code-single categoryCode="IMG_UPLOAD_CATEGORY" entryCode="<%=obImageUploadAdd.getCategory()%>" display="true" descWithCode="false"/>&nbsp;
																			</td> --%>
																			<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/>
																		</td>
																		<!--<td width="10%">
																			&nbsp;
																		</td>-->
																		<%if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getFacilityName() %>"/>
																		</td>
																		<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ 
																			String securityNameIds = obImageUploadAdd.getSecurityIdi()+"-"+obImageUploadAdd.getSubTypeSecurity() ;
																			if(!"".equals(obImageUploadAdd.getSecurityIdi()) && obImageUploadAdd.getSecurityIdi() != null){
																		%>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=securityNameIds%>"/>
																		</td>
																		<%}else{ %>
																			<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%} %>
																		<%}else if("CAM".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getHasCam() %>"/>
																		</td>
																		<%}else if("Statement".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getStatementTyped() %>"/>
																		</td>
																		<%}else{%>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%}%>
																		
																		<%if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getFacilityDocName() %>"/>
																		</td>
																		<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getSecurityDocName() %>"/>
																		</td>
																		<%}else if("CAM".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getCamDocName() %>"/>
																		</td>
																		<%}else if("Statement".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getStatementDocName() %>"/>
																		</td>
																		<%}else{%>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%}%>
																		
																		<%if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOtherDocName() %>"/>
																		</td>
																		<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOtherSecDocName() %>"/>
																		</td>
																		<%}else if("Other".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<!--Added by Uma Khot:Start: Phase 3 CR:tag scanned images of Annexure II-->
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getOthersDocsName() %>"/>
																		</td>
																		<%}else{%>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%}%>
																		
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getSubfolderName() %>"/>
																		</td>
																		
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getDocumentName() %>"/>
																		</td>
																		
																		<%if("Exchange of Info".equals(obImageUploadAdd.getTypeOfDocument())){ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getBank() %>"/>
																		</td>
																		<%}else{ %>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="-"/>
																		</td>
																		<%} %>
																		<!--Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II -->	
																		<td width="15%">
																		<%if(obImageUploadAdd.getCreationDate() != null){ %>
																			<%=new SimpleDateFormat("dd/MMM/yyyy HH:mm:ss").format(obImageUploadAdd.getCreationDate())%>
																		<%}else {%>
																			-
																		<%} %>	
																		</td>
																		<% 
																		
																		if(custImageListWithTag.contains(obImageUploadAdd)) {
																		
																		%>
																		
																		<td width="5%">
																		<input type="checkbox" name="removeBox" value="<%=index-1%>" disabled>	&nbsp;
																		
																		</td>
																		
																		<% } else { %>
																		
																		<td width="5%">
																		<input type="checkbox" name="removeBox" value="<%=index-1%>" >	&nbsp;
																		
																		</td>
																		
																		<% } %>
																		
																		<td width="5%">&nbsp; 

														<input type="checkbox" id="selected" name="selected" 
															value="<%=counter%>"
															onClick="toggleSelectAll()" /> 
														</td>
																	</tr>
																	<%
																		}
																		}else{
																			%>
																			<tr>
																			<td colspan="11">
																			Sorry, there are no records found.
																			</td>
																			</tr>
																			<%
																		}
																	%>
																</tbody>
															</table>
														</td>
		</tr>
					<html:hidden property="selectedArray" />	
					<html:hidden property="unCheckArray" />						
<td align="center">
	<br>
	<%if (obImageUploadAddList != null && obImageUploadAddList.size() != 0) { %>
	<a href="javascript:remove();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/delete2.gif',1)">
		<img src="img/delete1.gif" name="Image41" border="0" id="Image3"/></a>
	<%} %>
		<a href="javascript:cancelPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',2)">
		<img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/>
		</a>
<!--  
<a href="ImageUploadAdd.do?event=submit" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit1.gif',1)">
<img src="img/submit1.gif" name="Image41" border="0" id="Image3"/></a>
-->
<!--  
<%//if (obImageUploadAddList != null && obImageUploadAddList.size() != 0) { %>
	<a href="javascript:submitImageUpload();"><img src="img/submit1.gif" name="Image41" border="0" id="Image3"/></a>
	<a href="javascript:cancelPage()"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a>
	
<%// }else{%>
	<!-- <a href="ImageUpload.do?event=image_upload" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image2" border="0" id="Image2" /> </a>-> 

<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)">
<img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a>

<%//} %>
-->
</td>
	</html:form>
												</tbody>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
	</body>
</html>