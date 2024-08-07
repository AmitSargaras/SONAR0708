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
	int counter = 0;
	OBImageUploadAdd obImageUploadAdd = new OBImageUploadAdd();
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
ImageTagMapForm imageTagMapForm = (ImageTagMapForm) request.getAttribute("ImageTagMapForm");
OBImageTagDetails  obImageTagDetails = (OBImageTagDetails)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.OBImageTagDetails");
OBLimitProfile  camInfo = (OBLimitProfile)request.getAttribute("camInfo");


String failitySourceID=(String)request.getAttribute("failitySourceID");    
//System.out.print(">>>>>>>>>>>>>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + obImageTagDetails.getCustId()+"<<<<<<<<<<<<<<<<<<<@@@@@@@@@@@@@");
String rowClass = "";
	String recordsString = PropertyManager
			.getValue("customer.pagination.nitems");
	System.out.print(">>>>>>>>>>>>>list" + list1);
	list1 = (List) request.getAttribute("obImageTagAddList");
	System.out.print(">>>>>>>>>>>>>list" + list1);
	String trxId= (String)request.getAttribute("trxId");
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

	// pageContext.setAttribute("customerList",customerList);
	int rowIdx = 0;
	int sno = 0;
	// System.out.println("value of records_per_page"+records_per_page);
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
<script language="JavaScript" type="text/javascript" src="<%=context%>js/ajaxGetImage.js"></script>


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
 var url = '/cms/ImageTagMap.do?event=refresh_status_date&docDesc='+document.getElementById("dd").value;
 sendLoadListReqImageTag(dep, url);
}
var image_set = [{'caption': 'Flower', 'url': 'http://static.flickr.com/119/294309231_a3d2a339b9.jpg'},
                 {'caption': 'Nice waterfall', 'url': 'http://www.widerange.org/images/large/plitvicka.jpg'}];
</script>

<script language="JavaScript" type="text/JavaScript">
function submitPage() {

	var c_value = "";
	for (var i=0; i < document.forms[0].selected.length; i++)
	  {
	  if (document.forms[0].selected[i].checked)
	    {
	     c_value = c_value + document.forms[0].selected[i].value + ",\n";
	     }
	  }
	
	

    document.forms[0].action="ImageTagMap.do?event=checker_confirm_create&imageId="+c_value;
    document.forms[0].method="POST";
    document.forms[0].submit();
}
insertHeader();
insertMenu('examples');
function cancelPage(){
    document.forms[0].action="ToDo.do?event=totrack";
    document.forms[0].submit();
}
function closePage() {
    document.forms[0].action="ImageTag.do?event=image_tag";
    document.forms[0].submit();
}
function ShowBiggerImage(obj)

{

    document.getElementById("LargeImageContainerDiv").innerHTML = "<img src='" + obj.src + "' >";

    
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
	document.forms[0].action="ImageTagMap.do?event=retrieveImageGallaryMakerTotrack&imageName="+imageName+"&status="+status+"&count="+count+"&pID="+imagePath+"&category"+catg;
	document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="ImageTagMap.do?event=checker_reject_create";
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
</script>
</head>
<body >
		
<html:form action="/ImageTagMap">

<html:hidden name="event" property="event" value="save_image_tag"/>

<html:hidden name="ImageTagMapForm" property="imgId" />
<html:hidden name="ImageTagMapForm" property="id" />
<html:hidden name="ImageTagMapForm" property="custId" value="<%=legalName%>"/>
<input type="hidden" name="dmsImagePath"/>

<html:hidden name="ImageTagMapForm" property="subfolderName"/>
<html:hidden name="ImageTagMapForm" property="documentName" />

<input type="hidden" name="TrxId" value = "<%=trxId %>"/>
<input type="hidden" name="category"/>
								
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
																		<td width="20%" nowrap="nowrap">
																			FileName
																		</td>
																		<td width="20%">
																			Category
																		</td>
																		<td width="20%">
																			Sub Folder
																		</td>
																		<td width="20%">
																			Document Name
																		</td>
																		<td width="20%">
																			Select
																		</td>
																		
																	</tr>
																</thead>
																<tbody>
																	<%
																		int counter1 = 0;

																			if (list1 != null) {
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
																		<td width="25%">
																	&nbsp;
<%if(obImageUploadAdd.getStatus()==3){ %>		
<a href="#"
onclick="getImageGallary('<%=obImageUploadAdd.getImageFilePath().trim()%>','<%=obImageUploadAdd.getImgFileName().trim()%>','<%=obImageUploadAdd.getStatus()%>','<%=counter1-1%>')"><%=obImageUploadAdd.getImgFileName()%>
</a>
<%}else{ %>
<%=obImageUploadAdd.getImgFileName()%>
<%} %>																			
																		</td>
																		<td width="25%">
																			&nbsp;
																	<integro:common-code-single  entryCode="<%=obImageUploadAdd.getCategory()%>"
                                    								categoryCode="<%=IImageTagConstants.IMG_UPLOAD_CATEGORY %>" display="true" descWithCode="false" />
																		</td>
																		<td width="25%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getSubfolderName()%>"/>
																		</td>
																		<td width="25%">
																			&nbsp;
																			<integro:empty-if-null value="<%=obImageUploadAdd.getDocumentName()%>"/>
																		</td>
																		<td width="20%">
																			&nbsp;
																		<input type="checkbox" id="selected" name="selected" value="<%=obImageUploadAdd.getImgId()%>" checked="checked" disabled="true" />
																		</td>
																	</tr>
																	<%
																		}
																			}
																	%>
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
					<td width="25%" class="even" colspan="4">
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
					<td  class="even" ><input type="hidden" id="dd" value="<%=obImageTagDetails.getDocDesc()%>"/>
						<integro:empty-if-null value="<%=obImageTagDetails.getDocDescLabel()%>" />&nbsp;
					</td>
				</tr>     
				<br></br>
				<%if(!obImageTagDetails.getDocType().equals("CAM_NOTE")){ %>
			<tr  class="even">
			    <td width="25%" class="fieldname">
			     	Status
				</td>
				<td>
				<input type="text" readonly="readonly" id="docStatus" />
							&nbsp;
			      </td>
			         <td width="25%" class="fieldname">
			     	Document Date
				</td>
				<td>
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
    </td>
    
</tr>
</tbody>
</table>
</td>

</tr>
<tr><td colspan="2">
<br><br>	
<%
IImageTagTrxValue trxValue=(IImageTagTrxValue)session.getAttribute("com.integrosys.cms.ui.imageTag.ImageTagAction.IImageTagTrxValue");
String event = request.getParameter("event");
if(event.equals("rejected_delete_read")) {%>
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
<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
</p>

</html:form>
</body>
</html>



