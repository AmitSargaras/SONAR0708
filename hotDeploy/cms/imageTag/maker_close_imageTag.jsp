<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.integrosys.cms.app.imageTag.trx.IImageTagTrxValue"%>
<%@page import="com.integrosys.cms.ui.imageTag.IImageTagConstants"%>
<%@page import="com.integrosys.cms.ui.imageTag.ImageTagMapForm"%><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<%@ page import="com.integrosys.cms.app.imageTag.bus.OBImageTagDetails,com.integrosys.base.techinfra.propertyfile.PropertyManager,com.integrosys.cms.app.customer.bus.*,com.integrosys.cms.app.limit.bus.OBLimitProfile,com.integrosys.cms.ui.cci.CounterpartyUIHelper,com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,com.integrosys.cms.ui.imageTag.ImageTagForm,com.integrosys.cms.ui.common.CountryList,com.integrosys.cms.ui.customer.*,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.component.commondata.app.CommonDataSingleton,java.math.BigDecimal,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.List,com.integrosys.cms.app.collateral.bus.OBCollateral,com.integrosys.cms.app.collateral.bus.ICollateral,com.integrosys.cms.app.collateral.bus.CollateralComparator,java.util.Collection,java.util.HashMap,com.integrosys.cms.app.image.bus.OBImageUploadAdd,com.integrosys.base.businfra.search.SearchResult,java.util.Iterator"%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	
	
	List list1 = null;
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
	String context = request.getContextPath() + "/";
%>

<%
String trxId= (String)request.getAttribute("trxId");
System.out.println("trxId:::::::::::"+trxId);
IImageTagTrxValue trxValue=(IImageTagTrxValue)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.IImageTagTrxValue");
String event = request.getParameter("event");
OBLimitProfile  camInfo = (OBLimitProfile)request.getAttribute("camInfo");
SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.searchResult");
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
	System.out.println("searchResult:::::::::::"+resultList.size());
	startInd = searchResult.getStartIndex();
	totalCount = searchResult.getNItems();
	listSize = resultList.size();
	pageContext
			.setAttribute("imageListSize", Integer.toString(listSize));
	pageContext.setAttribute("resultList", resultList);
}

ImageTagMapForm imageTagMapForm = (ImageTagMapForm) request.getAttribute("ImageTagMapForm");
OBImageTagDetails  obImageTagDetails = (OBImageTagDetails)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.OBImageTagDetails");
String failitySourceID=(String)request.getAttribute("failitySourceID");    
String rowClass = "";
	String recordsString = PropertyManager
			.getValue("customer.pagination.nitems");
	list1 = (List) request.getAttribute("obImageTagAddList");
	int records_per_page = 10; //default value
	try {
		records_per_page = Integer.parseInt(recordsString);
	} catch (NumberFormatException e) {
		DefaultLogger
				.error(
						this,
						"Caught NumberFormatException. Using Default value of 10.",
						e);
		records_per_page = 10;
	}
	String customerName = request.getParameter("customerName");
	String legalName = request.getParameter("legalName");
	SearchResult customerList = (SearchResult) request
			.getAttribute("customerList");

	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
	
	
	// code start:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
String fromPage=(String)request.getAttribute("fromPage");   
if(fromPage==null){
	fromPage="";
}
	
	Set<String> taggedImageIdSet=(HashSet)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.taggedImageIdSet");
	DefaultLogger.debug(this,"taggedImageIdSet:"+taggedImageIdSet);

    // code end:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
%>


<head>
    <title>Customer Details</title>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" media="all"
	href="<%=context%>css/calendar-blue.css" title="blue" />
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/ajaxGetImage.js"></script>

<script type="text/javascript" src="<%=context%>greybox/base/AJS.js"></script>
<script type="text/javascript" src="<%=context%>greybox/base/AJS_fx.js"></script>
<script type="text/javascript" src="<%=context%>greybox/gb_scripts.js"></script>
<link href="<%=context%>greybox/gb_styles.css" rel="stylesheet" type="text/css" />
<link href="<%=context%>greybox/base/base.css" rel="stylesheet" type="text/css" />

<link href="<%=context%>greybox/window/window.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/window/window.js"></script>


<link href="<%=context%>greybox/set/set.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/set/set.js"></script>

<link href="<%=context%>greybox/gallery/gallery.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=context%>greybox/gallery/gallery.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxListImageTag.js"/>



<script type="text/javascript">
    var GB_ROOT_DIR = "./greybox/";
</script>
<script type="text/javascript">
window.onload = function () {
resize();
var dep = 'docStatus';
var docType = document.getElementById("dt").value;
var exchg_of_info = 'EXCHANGE_OF_INFO';

 if(docType == exchg_of_info){
	 var url = '/cms/ImageTagMap.do?event=refresh_recc_doc_status_date&docDesc='+document.getElementById("dd").value;
	 sendLoadListReqImageTag(dep, url);
	}else {
 var url = '/cms/ImageTagMap.do?event=refresh_status_date&docDesc='+document.getElementById("dd").value;
 sendLoadListReqImageTag(dep, url);
}
}
var image_set = [{'caption': 'Flower', 'url': 'http://static.flickr.com/119/294309231_a3d2a339b9.jpg'},
                 {'caption': 'Nice waterfall', 'url': 'http://www.widerange.org/images/large/plitvicka.jpg'}];
</script>

<script language="JavaScript" type="text/JavaScript">

insertHeader();
insertMenu('examples');

function closePage() {
    document.forms[0].action="ImageTag.do?event=image_tag";
    document.forms[0].submit();
}
function ShowBiggerImage(obj)

{

    document.getElementById("LargeImageContainerDiv").innerHTML = "<img src='" + obj.src + "' >";

    
}

function rejectPage() {
    document.forms[0].action="ImageTagMap.do?event=checker_reject_create";
    document.forms[0].submit();
}
function cancelPage(){
	
    document.forms[0].action="ToDo.do?event=prepare";
    
    document.forms[0].submit();
}

function submitPage () {
	document.forms[0].action="ImageTag.do?event=maker_confirm_close";
    document.forms[0].submit();
}

function refreshSubtype(dropdown)
{
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }	
   var dep = 'secSubtype';
   var url = '/cms/MISecurity.do?event=refresh_subtype&securityType='+curSel; 
   sendLoadDropdownReq(dep, url);
}

function getImageGallary(imagePath,imageName,status,count) {
//  var dep = 'imagePath';
//  var url = '/cms/ImageTagMap.do?event=retrieveImage&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath;
  //sendLoadImagePathReq(dep, url);
  var catg= document.forms[0].category.value;
  //alert("getImageGallary");
	//alert("imagePath is "+imagePath);
	//alert("imageName is "+imageName);
	//alert("status is "+status);
	//alert("category is "+catg);
	//alert("count is "+count);
	document.forms[0].action="ImageTagMap.do?event=retrieveImageGallaryMakerClose&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg;
	document.forms[0].submit();
}
function refreshSecurityId(dropdown)
{
	
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}
	
   }

   var dep = 'securityId';
   var url = '/cms/ImageTagMap.do?event=refresh_security_id&securitySubType='+curSel; 
   sendLoadDropdownReq(dep, url);
}	


function goPageIndex(targetOffset) {
	//alert("targetOffset"+targetOffset);
	
	document.forms[0].startIndex.value = targetOffset;
	document.forms[0].idNO.value = "<%=trxId%>";
	document.forms[0].event.value = "maker_prepare_close";
    document.forms[0].submit();
}
</script>
</head>
<body >
		
<html:form action="/ImageTag">
<html:hidden property="startIndex" />
<html:hidden name="event" property="event" value="save_image_tag"/>
<html:hidden property="idNO" />
<input type="hidden" name="TrxId" value = "<%=trxId%>"/>
<input type="hidden" name="category"/>
<input type="hidden" name="dmsImagePath"/>

								
<table width="100%" >
<tr>
<td width="50%" height="100%" valign="top" >		
									
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td><h3>Customer Details</h3>
        
<!--      <a href="#" onclick="return GB_showImageSet(image_set, 1)">Launch gallery</a>-->
        </td>
     

    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>

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
																Image Taged Details
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
															<table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
																<thead>
																	<tr>
																		<td width="5%">
																			S/N
																		</td>
																			<td width="15%" nowrap="nowrap">
																			FileName
																		</td>
																		<td width="10%">
																			Category
																		</td>
																		<td width="10%">
																			Sub Folder
																		</td>
																			<td width="15%">Document Name(Migrated)</td>
												<td width="15%">Document Name</td>
												<td width="15%">Other Document Name</td>
																		<!--Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II -->
																		<td width="10%">Bank Name</td>
											    						<!--Added by Uma Khot: End: Phase 3 CR:tag scanned images of Annexure II -->
											    						<!-- code start:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document -->
											    					
												                        <td width="5%">Is Tagged</td>
												                       
												                        <!-- code end:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document -->
																		<td width="5%">
																			Select
																		</td>
																		
																	</tr>
																</thead>
																<tbody>
																	<%int counter1 = 0; %>
																	<logic:greaterThan name="resultList" value="0">
																		<logic:iterate id="obImageUploadAdd" name="resultList"
								type="com.integrosys.cms.app.image.bus.OBImageUploadAdd"
								scope="page" length="10" offset="<%=String.valueOf(startIndex) %>">
								
								
								<%
																		

																		
																					counter1++;
																					if (counter1 % 2 != 0) {
																						rowClass = "odd";
																					} else {
																						rowClass = "even";
																					}
																	%>
																	<tr class=<%=rowClass%>>
																		<td class="index" width="5%"><%=counter1+startIndex%></td>
																		<td width="20%">
														&nbsp;
<%if(obImageUploadAdd.getStatus()==3){ %>					
<a href="#"
onclick="getImageGallary('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=(counter1-1)+startIndex%>')"><%=obImageUploadAdd.getImgFileName()%>
</a>
<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>																			
																		</td>
																		<td width="10%">
																			&nbsp;
																	<integro:common-code-single  entryCode="<%=obImageUploadAdd.getCategory()%>"
                                    								categoryCode="<%=IImageTagConstants.IMG_UPLOAD_CATEGORY %>" display="true" descWithCode="false" />
																		</td>
																		<td width="10%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getSubfolderName()%>"/>
																		</td>
																		<td width="15%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getDocumentName()%>"/>
																		</td>
																		
																			
																		<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getCamDocName()%>" /></td>
															
																<% if("Facility".equals(obImageUploadAdd.getTypeOfDocument())){%>
														<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getOtherDocName()%>" /></td>
															
														<%}else if("Security".equals(obImageUploadAdd.getTypeOfDocument())){ %>	
														<td width="15%">&nbsp; <integro:empty-if-null
															value="<%=obImageUploadAdd.getOtherSecDocName()%>" /></td>
															
														<%}else{%>
														<td width="15%">&nbsp; <integro:empty-if-null
															value="" /></td>
														<%} %>
																		
																		<!--Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II -->
																		<td width="15%">&nbsp; <integro:empty-if-null
																			value="<%=obImageUploadAdd.getBank()%>" /></td>
																		<!--Added by Uma Khot: Start: Phase 3 CR:tag scanned images of Annexure II -->
																		<% 
																		// code start:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
																		if(IImageTagConstants.TAG.equals(fromPage)) {
																		if(null!=taggedImageIdSet){
																		//	DefaultLogger.debug(this,"Inside if(null!=taggedImageIdSet)");
																		//	DefaultLogger.debug(this,"obImageUploadAdd.getImgId():"+obImageUploadAdd.getImgId());
																		//	DefaultLogger.debug(this,"taggedImageIdSet.contains(String.valueOf(obImageUploadAdd.getImgId())):"+taggedImageIdSet.contains(String.valueOf(obImageUploadAdd.getImgId())));
																		  if(taggedImageIdSet.contains(String.valueOf(obImageUploadAdd.getImgId()))){
																		//	  DefaultLogger.debug(this,"if(taggedImageIdSet.contains(obImageUploadAdd.getImgId()))");%>	
																		<td width="5%">&nbsp; Tagged</td>	
																	    <% }else{ %>
																	    <td width="5%">&nbsp; UnTagged</td>	
																	    <% }} else{%>
																	    <td width="5%">&nbsp; UnTagged</td>
																	    <% }
																		}else{%>
																		<td width="5%">&nbsp; Tagged</td>
																		<% }
																	    // code end:Uma Khot 02/09/2015 Phase 3 CR:Identifier to reflect tagged document
																	     %>	
																		<td width="5%">
																			&nbsp;
																		<input type="checkbox" id="selected" name="selected" value="<%=obImageUploadAdd.getImgId()%>" checked="checked" disabled="true" />
																		</td>
																	</tr>
																	</logic:iterate>
																	</logic:greaterThan>
																</tbody>
																
															</table>
														</td>
														<td>
										

										</td>
																	
													</tr>
													
													<% if(searchResult != null && searchResult.getNItems() != 0) {%>
				<tr>
				    <td height="25">
				        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
				            <tr>
				            <%
				           
				            
				            String url="ImageTag.do?event=maker_prepare_close&idNO="+trxId+"&startIndex=";
				           
				            %>
				            
				                <td valign="middle">
				                    <integro:pageindex pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
				                            url="<%=url %>" submitFlag="true"/>
				                </td>
				            </tr>
				        </table>
				    </td>
				</tr>
				<%} %>	
													</tbody>
													</table>
													</td>
													</tr>
<tr>

    <td colspan="2">
        <table width="95%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
													<tr><td colspan="4">
																Customer Details
															
													
													
														
														</td>
													</tr>
												</thead>
            <tbody>
                <tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.name"/></td>
                    <td width="30%"><integro:empty-if-null value="<%=obImageTagDetails.getCustomerNameLabel()%>"/>&nbsp;</td>
                    <td class="fieldname" width="20%"><bean:message key="label.list.party.id"/></td>
                    <td width="30%"><integro:empty-if-null value="<%=obImageTagDetails.getCustId()%>"/>&nbsp;</td>
                </tr>

                <tr class="odd">
					<td width="25%" class="fieldname" >Document Type</td>
					<td width="25%" class="even" colspan="4"><input type="hidden" id="dt" value="<%=obImageTagDetails.getDocType()%>"/>
						<integro:common-code-single  entryCode="<%=obImageTagDetails.getDocType()%>"
                                    		categoryCode="DOC_TYPE" display="true" descWithCode="false" />&nbsp;
					</td>
				</tr>     
<%if(IImageTagConstants.SECURITY_DOC.equals(obImageTagDetails.getDocType())) {%>
                <tr class="odd">
					<td width="25%" class="fieldname" >Security Type</td>
					<td width="25%" class="even" >
						<integro:empty-if-null value="<%=obImageTagDetails.getSecTypeLabel()%>" />&nbsp;
					</td>
					<td width="25%" class="fieldname" >Document Description</td>
					<td width="25%" class="even">
						<integro:empty-if-null value="<%=obImageTagDetails.getSecSubtypeLabel()%>" />&nbsp;
					</td>
				</tr>     
                <tr class="odd">
					<td width="25%" class="fieldname" >Security</td>
					<td width="25%" class="even" colspan="4">
						<integro:empty-if-null value="<%=obImageTagDetails.getSecurityIdLabel()%>" />&nbsp;
					</td>
				</tr>     
<%} else if(IImageTagConstants.FACILITY_DOC.equals(obImageTagDetails.getDocType())){ %>
                <tr class="odd">
					<td width="25%" class="fieldname" >Facility</td>
					<td width="25%" class="even" colspan="4">
						<integro:empty-if-null value="<%=obImageTagDetails.getFacilityIdLabel()%>" />
						<%if(failitySourceID!=null){ %>
							&nbsp;-&nbsp;<integro:common-code-single categoryCode="<%=ICMSConstant.CATEGORY_SOURCE_SYSTEM%>" entryCode="<%=failitySourceID%>" display="true" descWithCode="false"  />
						<%} %>
						&nbsp;
					</td>
				</tr>     

<%} %>
                <tr  class="even">
					<td width="25%" class="fieldname" >Document Description</td>
					<td width="25%" class="even" colspan="4"><input type="hidden" id="dd" value="<%=obImageTagDetails.getDocDesc()%>"/>
						<integro:empty-if-null value="<%=obImageTagDetails.getDocDescLabel()%>" />&nbsp;
					</td>
				</tr>     
				<%if(!obImageTagDetails.getDocType().equals("CAM_NOTE")){ %>
				 <tr  class="even">
			    <td width="25%" class="fieldname">
			     	Status
				</td>
				<td >
				<input type="text" readonly="readonly" id="docStatus" />
							&nbsp;
			      </td>
			       <td width="25%" class="fieldname">
			     	Document Date
				</td>
				<td >
				<input type="text" readonly="readonly" id="docDate" />
							&nbsp;
			      </td>
			</tr>		
			<tr  class="even">
			    <td width="25%" class="fieldname">
							Received Date
				</td>
				<td>
				<input type="text" readonly="readonly" id="receivedDate"/>
							&nbsp;
			                
			      </td>
			        <td width="25%" class="fieldname">
							Document Amount
				</td>
				<td>
				<input type="text" readonly="readonly" id="docAmt"/>
							&nbsp;
			                
			      </td>
			</tr>
			<%}else{ %>		 
			<tr  class="even">
			    <td width="25%" class="fieldname">
			     	CAM Type
				</td>
				<td>
				<%=camInfo.getCamType() %>	&nbsp;
			      </td>
			       <td width="25%" class="fieldname">
			     	CAM Date
				</td>
				<td>
				<%=camInfo.getApprovalDate() %>
							&nbsp;
			      </td>
			</tr>	
			<tr  class="even">
			    <td width="25%" class="fieldname">
			     	CAM Expiry Date
				</td>
				<td colspan="3">
				<%=camInfo.getNextAnnualReviewDate() %>
							&nbsp;
			      </td>			       
				
			</tr>	
			<%} %>	   

</tbody>
</table>
</td></tr></tbody></table>

</td>

</tr>
<tr><td colspan="2">
<br><br>	
<%


if(event.equals("maker_prepare_close")) {%>
					<table width="90%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
						<tbody>
							<tr>
								<td class="fieldname">Last Action By</td>
								<td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Last Remarks Made</td>
								<td><%=trxValue.getRemarks() != null
							? trxValue.getRemarks()
							: ""%>&nbsp;</td>
							</tr>
						</tbody>
					</table>
	<%} %>
</td></tr>
</table>
<p align="center">
	<a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)" onClick="submitPage()" ><img src="img/close1a.gif" name="Image3311"  border="0" id="Image3311" /></a>&nbsp;&nbsp;
	<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
			<img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
	</a>
</p>

</html:form>
</body>
</html>



