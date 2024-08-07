<%@page import="java.util.Iterator"%>
<%@page import="com.integrosys.cms.app.image.bus.OBImageUploadAdd"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeStockDetailsHelperForm,
				com.integrosys.cms.ui.collateral.assetbased.assetgencharge.DueDateAndStockForm,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction,
				com.integrosys.cms.businfra.LabelValue,
				org.springframework.util.CollectionUtils,
				org.apache.commons.lang.StringUtils,
				java.math.BigDecimal,
				java.util.HashMap,
				java.util.List"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
	<script type="text/javascript" src="js/ajaxDropdown.js"></script>
	<script type="text/javascript" src="js/emulation.js"></script>
	<script type="JavaScript" src="js/itgPrjConfigSetup.js"></script>
	<script type="JavaScript" src="js/itgCheckForm.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calDriver.js"></script>
	<script type="text/javascript" src="js/dateext.js"></script>
	<script type="text/javascript" src="js/enableFields.js"></script>
	<script type="text/javascript" src="js/imageNavigation.js"></script>
	<script type="text/javascript" src="js/collateral_helper.js"></script>
	
<%
ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
pageContext.setAttribute("serviceColObj",itrxValue);
System.out.println("================serviceColObj"+itrxValue);
String iPin = AssetBasedAction.class.getName();
String rowClass = "";
List list1 = (ArrayList) session.getAttribute(iPin + "."+CollateralConstant.SESSION_VIEW_STOCK_STATEMENT_IMAGES);
//List imagesList = (ArrayList) session.getAttribute(iPin + "."+"sessionViewStockStatementImages");
OBImageUploadAdd obImageUploadAdd = new OBImageUploadAdd();
System.out.println("list1::"+list1);
int counter1 = 0;
int startIndex=0;
String ind= (String) request.getAttribute("startIndex");
if( ind == null || ind.equals("null"))
	startIndex=0;
else 
	 startIndex = Integer.parseInt(ind);

System.out.println("startIndex ====>"+startIndex);
%>

<script language="JavaScript" type="text/JavaScript">

window.onload = function(){
	
}
 
function goBack(){
    document.forms[0].action="dueDateAndStock.do?event=edit_due_date_and_stock";
    document.forms[0].submit();
}

function downloadImage(imagePath,imageName,status){ //v3.0
	var aLocation = "dueDateAndStock.do?event=downloadImage&pID="+imagePath+"&imageName="+imageName+"&status="+status;
	window.location.href = aLocation ;
	//document.forms[0].submit();
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

function downloadImageZip(recordNum) {
	var s_value = "";
	var n_value = "";
	var v_value_count = document.forms[0].selected.length;
	var recordNumss = recordNum;
	if(document.forms[0].selected.length==undefined ){
		if(document.forms[0].selected.checked)
			s_value = s_value + document.forms[0].selected.value + "-";
		
	}else{
		for (var i=0; i < document.forms[0].selected.length; i++)
		   {
			recordNumss++;
		   if (document.forms[0].selected[i].checked)
		      {
		     // s_value = s_value + document.forms[0].selected[i].value + "-";
			   s_value = s_value + (recordNumss) + "-";
		      }else{
		    	//  n_value = n_value + document.forms[0].selected[i].value + "-";
		    	  n_value = n_value + (recordNumss) + "-";
		    	  
		      }
		   }
	}
	//alert('s_value=>'+s_value+' n_value=>'+n_value);
	/* var facNamed= document.forms[0].facilityName.value;
	var custId1= document.forms[0].custId.value;
	var customerName= document.forms[0].customerName.value; */
	
	var facNamed= document.getElementById("facilityName").value;
	var custId1=document.getElementById("custId").value;
	var customerName= document.getElementById("custName").value;
//alert('v_value_count='+v_value_count);
	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
	    document.forms[0].unCheckArray.value=n_value;
	    //document.forms[0].submit();
	   // var checkArray = new Array();
	   // var unCheckArray = new Array();
	   // checkArray[0] =s_value;
	   // unCheckArray[0] = n_value;
	    var aLocation = "dueDateAndStock.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&facNames="+facNamed+"&imageId="+s_value+"&unCheckId="+n_value;
	  //  var aLocation = "ImageUploadAdd.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&facNames="+facNamed+"&imageId="+s_value+"&unCheckId="+v_value_count;
	window.location.href = aLocation ;
	
       // document.forms[0].action="ImageUploadAdd.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&category="+catg;
	   // document.forms[0].submit();
	 //MM_openBrWindow("ImageUploadAdd.do?event=downloadImage&custId="+custId1+"&customerName="+customerName+"&category="+catg+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  
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

	var facNamed= document.getElementById("facilityName").value;
	var custId1=document.getElementById("custId").value;
	var customerName= document.getElementById("custName").value;

	if(s_value!=''){
		 //document.forms[0].method="POST";
		document.forms[0].selectedArray.value=s_value;
	    //document.forms[0].submit();
	    
	   MM_openBrWindow1("ImageUploadAdd.do?event=print_image&custId="+custId1+"&customerName="+customerName+"&facNames="+facNamed+"&imageId="+s_value+"&unCheckId="+n_value,'_blank','scrollbars=no,toolbar=no,menubar=no,resizable=no,width=0,height=0,left=100,top=100')
	  // window.focus(); 
		} else{
		alert("Please select the image for printing.");
	}
}


</script>

<html:form action="dueDateAndStock.do">
<input type="hidden" name="event"/>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">

<tbody>

<tr>
										<td colspan="3" valign="top"
											style="height: 100%; width: 100%;">

											<table width="95%"   class="tblFormSection" border="0"
												align="center" cellpadding="0" cellspacing="0"
												style="margin-bottom: 15px">
												<thead>
													<tr>
														<td>
															<h3>
																Image Uploaded Details
															</h3>
														<a href="#" onclick="downloadImageZip(<%=counter1%>)"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3316','','img/download.jpg',1)">
									<img src="img/download.jpg" name="Image3316" border="0"
										id="Image3316" align="right" /> </a>
										<a href="#" onclick="printPage()"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image3311','','img/print2.gif',1)">
									<img src="img/print1.gif" name="Image3311" border="0"
										id="Image3311" align="right" /> </a>
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
															<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
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
																		<td width="10%">
																			Other Document Name
																		</td>
																		<td width="10%">
																			Subfolder Name
																		</td>
																		<td width="10%">
																			Document Name(Migrated)
																		</td>
<!--																		<td width="25%">-->
<!--																			Download-->
<!--																		</td>-->
																		
<td width="10%">Select <%	if (list1 != null && list1.size()>0) { %>
												<input type="checkbox" name="list11" id="list11"
													value="Check All" onClick="checkedAllImages()" /> <%} %>
												</td>
																	</tr>
																</thead>
																<tbody>
																	<%
																		

																			if (list1 != null && list1.size()>0) {
																				for (Iterator it = list1.iterator(); it.hasNext();) {

																					obImageUploadAdd = (OBImageUploadAdd) it.next();

																					counter1++;
																					if (counter1 % 2 != 0) {
																						rowClass = "odd";
																					} else {
																						rowClass = "even";
																					}
																	%>
																	<tr class=<%=rowClass%>>
																		<td class="index" width="5%"><%=counter1%></td>
																		<%
																			String subs = obImageUploadAdd.getImgFileName();
																						//subs = subs.substring();
																		%>




																		<td width="25%">
																			&nbsp;
			<%if(obImageUploadAdd.getStatus()==3){ %>																
																		<a href="#"
onclick="javascript:getImageGallaryRecurrentDoc('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=counter1-1%>')"><%=obImageUploadAdd.getImgFileName()%>
</a>
			<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>															
<input type="hidden" name="custId" id="custId" value="<%=obImageUploadAdd.getCustId().trim()%>">
<input type="hidden" id="custName" name="custName" value="<%=obImageUploadAdd.getCustName()%>">
<input type="hidden" id="facilityName" name="facilityName" value="<%=obImageUploadAdd.getFacilityName()%>">
<html:hidden property="selectedArray" />
<html:hidden property="unCheckArray" />	
																		</td>
																		<td width="10%">
																			&nbsp;
																		<integro:empty-if-null value="<%=obImageUploadAdd.getTypeOfDocument() %>"/> 
																		</td>
																		<% if("Statement".equals(obImageUploadAdd.getTypeOfDocument())){ %>
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
																		
																		<%if("Statement".equals(obImageUploadAdd.getTypeOfDocument())){ %>
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
																		
																		<%if("Other".equals(obImageUploadAdd.getTypeOfDocument())){ %>
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
																		
<td width="10%">&nbsp; 

														<input type="checkbox" id="selected" name="selected"
															value="<%=counter1%>"
															onClick="toggleSelectAll()" /> 
														</td>
																	</tr>
																	<%
																		}
																			}else{
																	%>
																	<tr class=<%=rowClass%>>
																		<td colspan="6">
																			No records found.
																		</td>
																	</tr>
																	<%} %>
																</tbody>
																
															</table>
														</td>
														<td>
										

										</td>
																	
													</tr>
													</tbody>
													</table>
													</td>
													</tr>

</tbody>
</table>

<p align="center">
             <a href="javascript:goBack();"
												onmouseout="MM_swapImgRestore()"
												onmouseover="MM_swapImage('img_return','','img/return2.gif',1)">
													<img src="img/return1.gif" name="img_return" border="0" />
											</a>
</p>


</html:form>

