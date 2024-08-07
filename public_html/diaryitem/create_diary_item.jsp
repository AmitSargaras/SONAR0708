<%@ page import="com.integrosys.cms.ui.feed.bond.item.BondItemAction,
                 com.integrosys.cms.ui.diaryitem.DiaryItemAction,
                 java.util.Collection,
                 java.util.ArrayList,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.cms.ui.diaryitem.DiaryItemForm,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.*,
                 java.util.HashSet,
                 org.apache.struts.upload.FormFile,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>   
<%@page	import="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult"%>   
<%@page	import="com.integrosys.cms.app.diary.bus.OBDiaryItem"%>           
<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/diaryitem/create_diary_item.jsp,v 1.13 2006/10/27 08:43:13 hmbao Exp $
     * @author $Author: hmbao $
     * @version $Revision: 1.13 $
     * @since $Date: 2006/10/27 08:43:13 $
     * Tag: $Name:  $
     */

%>

<%

		String context = request.getContextPath() + "/";
        Collection countryValues = (Collection)request.getAttribute("CountryValues");
        pageContext.setAttribute("CountryValues", countryValues);
        DiaryItemForm diaryForm = (DiaryItemForm) request.getAttribute("DiaryItemForm");
        OBCustomerSearchResult searchResult=(OBCustomerSearchResult)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.customerObject");
        OBDiaryItem regionAndSegment=(OBDiaryItem)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.diaryItemObj");
        List facilityBoardCategorylist = (ArrayList)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.facilityBoardCategorylist");
        List facilityLineNoList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.facilityLineNoList");
        List facilitySerialNoList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.facilitySerialNoList");
        List activityList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.activityList");
        String makerId = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.makerId");
        String makerDate = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.makerDate");
        String dropLineOD = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.dropLineOD");
        FormFile odScheduleUploadFile = (FormFile)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.odScheduleUploadFile");
        
        
        if (!(dropLineOD == null)) {
    		pageContext.setAttribute("dropLineOD", dropLineOD);
    		session.setAttribute("dropLineOD", dropLineOD);
    		 
    		}
        
        if (!(odScheduleUploadFile == null)) {
    		pageContext.setAttribute("odScheduleUploadFile", odScheduleUploadFile);
    		session.setAttribute("odScheduleUploadFile", odScheduleUploadFile);
    		 
    		}
        
        if (!(makerId == null)) {
    		pageContext.setAttribute("makerId", makerId);
    		session.setAttribute("makerId", makerId);
    		 
    		}
       
        if (!(makerDate == null)) {
    		pageContext.setAttribute("makerDate", makerDate);
    		session.setAttribute("makerDate", makerDate);
    		 
    		}
    		
        if (!(facilityBoardCategorylist == null)) {
    		pageContext.setAttribute("facilityBoardCategorylist", facilityBoardCategorylist);
    		session.setAttribute("facilityBoardCategorylist", facilityBoardCategorylist);
    		 
    		}
        
        if (!(facilityLineNoList == null)) {
    		pageContext.setAttribute("facilityLineNoList", facilityLineNoList);
    		session.setAttribute("facilityLineNoList", facilityLineNoList);
    		 
    		}
        
        if (!(facilityLineNoList == null)) {
    		pageContext.setAttribute("facilitySerialNoList", facilitySerialNoList);
    		session.setAttribute("facilitySerialNoList", facilitySerialNoList);
    		 
    		}
        
        if (!(activityList == null)) {
    		pageContext.setAttribute("activityList", activityList);
    		session.setAttribute("activityList", activityList);
    		 
    		}
        
              
        
        

%>


<%@page import="com.integrosys.cms.ui.diaryitem.DiaryItemListMapper"%><html>
<body>

<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<style>
table.tblInput tbody tr td.fieldname {
	width : 125px;
}
</style>

<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script language="JavaScript" type="text/JavaScript">

<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function submitForm() {
	var odfile = document.forms[0].odScheduleUploadFile.value;
	var odValidation = odfile.indexOf(".xlsx");
	if(document.forms[0].odScheduleUploadFile.value == '' && document.getElementById("dropLineODY").checked == true){		
		alert("Please select OD Schedule Upload File.");
	}if(odValidation == '-1' && document.forms[0].odScheduleUploadFile.value != ''){
		alert("Please upload file in .xlsx format.");
	}else
	{
		 document.forms[0].allowedCountry.value='IN';
		    document.forms[0].submit();
	}

	
}

function cancelForm() {
    document.forms[0].event.value = "<%=DiaryItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}

function addDays(pDate, days) {
    return new Date(pDate.getTime() + days*86400000);
}


     months = new Array();
     months['Jan'] = 0;
     months['Feb'] = 1;
     months['Mar'] = 2;
     months['Apr'] = 3;
     months['May'] = 4;
     months['Jun'] = 5;
     months['Jul'] = 6;
     months['Aug'] = 7;
     months['Sep'] = 8;
     months['Oct'] = 9;
     months['Nov'] = 10;
     months['Dec'] = 11;

     month = new Array('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec');

     function getDueDate(cal, date) {
        if (cal != "" && date != "") {
            cal.sel.value = date;
        }

        lastItemExpDateValue = document.forms[0].itemExpiryDate.value;

        if (lastItemExpDateValue != "" ) {
            lastDate = new Date();
     	    lastDate.setDate(lastItemExpDateValue.substring(0,2));
     	    lastDate.setMonth(months[lastItemExpDateValue.substring(3,6)]);
     	    lastDate.setFullYear(lastItemExpDateValue.substring(7,11));

            nextDate = new Date();
            //default item due date to 7 days before item expiry date
            nextDate = lastDate.add(Date.DAY, -7);
            nextDateStr = "";
            if (nextDate.getDate() < 10) {
                nextDateStr = "0";
            }

            nextDateStr = nextDateStr + nextDate.getDate()+"/"+month[nextDate.getMonth()]+"/"+nextDate.getFullYear();
            document.forms[0].itemDueDate.value = nextDateStr;
        }
    }

function limitFieldText(limitField, limitNum, fieldName) {
	if (limitField.value.length > limitNum) {
        limitField.value = limitField.value.substring(0, limitNum);
        alert(fieldName+' field can be only '+limitNum+' Characters');
		limitField.value = limitField.value.substring(0, limitNum);
	}
}
function cancelPage() {
		 document.forms[0].action = "DiaryItem.do";
		    document.forms[0].event.value = "list_segment_wise";
		    document.forms[0].submit();
	}
function limitFieldTextCust(limitField, limitNum, fieldName) {
	if (limitField.value.length > limitNum) {
        limitField.value = limitField.value.substring(0, limitNum);
        alert(fieldName+' maximum length is '+limitNum+' alphanumeric characters');
		limitField.value = limitField.value.substring(0, limitNum);
	}
}

function searchCustomer(){ //v3.0
	//alert("searchCustomerName  : "+document.forms[0].searchCustomerName.value);
	if(document.forms[0].customerName.value==""){
		alert("Please enter customer name to search.");
		return false;
	}
	
	if(document.forms[0].customerName.value.length <= 2){
		alert("Please enter atleast three character");
		return false;
	}
	document.forms[0].event.value="list";
	document.forms[0].submit();
}

function refreshFacilityLineNo(dropdown)
{
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
     }	
     var dep = 'facilityLineNo';
     var url = '/cms/DiaryItem.do?event=refreshFacilityLine&facilityBoardCategory='+curSel;
     sendLoadDropdownReq(dep, url);
     
}

function refreshFacilitySerialNo(dropdown)
{
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
     }	
     var dep = 'facilitySerialNo';
     var url = '/cms/DiaryItem.do?event=refreshFacilitySerialNo&facilityLineNo='+curSel+'&facilityBoardCategory='+document.forms[0].facilityBoardCategory.value;
     sendLoadDropdownReq(dep, url);
     
}

function disableODFileUpload(){
	
	// document.getElementById("odScheduleUploadFile").disabled= true;
	 document.forms[0].odScheduleUploadFile.disabled = true;
	 document.forms[0].itemDueDate.disabled = false;
	 document.getElementById("ODFile").hidden= true;
	 document.getElementById("Image5").hidden= false;
	 document.getElementById("targetDate").hidden= false;
	 document.forms[0].odScheduleUploadFile.value = null;
	 document.forms[0].activity.disabled = false;

}

function enableODFileUpload(){
	// document.getElementById("odScheduleUploadFile").disabled= false;
	 document.forms[0].odScheduleUploadFile.disabled = false;
	  document.getElementById("Image5").hidden= true;
	  document.forms[0].itemDueDate.value = '';
	// $('#Image5').datepicker("hide");
	 document.forms[0].itemDueDate.disabled = true;
	 document.getElementById("ODFile").hidden= false;
	 document.getElementById("targetDate").hidden= true;
	 document.forms[0].activity.disabled = true;
	 document.forms[0].activity.value = '';
	 
}

window.onload = function() {
	document.forms[0].diaryNumber.value = '';
	 document.getElementById('internalRemarks').setAttribute('maxlength', '200');
	
	var dropLineOD = '<%=dropLineOD%>';
	<%if("Y".equals(dropLineOD)){
		diaryForm.setOdScheduleUploadFile(odScheduleUploadFile);
	}%>
	if(dropLineOD == 'Y'){
	document.getElementById("dropLineODY").checked = true;
	 enableODFileUpload();
	}else if(dropLineOD == 'N'){
	document.getElementById("dropLineODN").checked = true;
	disableODFileUpload();
	}else{
		document.getElementById("dropLineODN").checked = true;
		disableODFileUpload();
	}
	};

function previousDateValidator(){
	var targetDate = new Date(document.forms[0].itemDueDate.value);
	var todayDate = new Date();
	if(targetDate < todayDate){
		alert("Please enter future date or today's date");
		document.forms[0].itemDueDate.value = "";
		return false;
	}

	
}

//-->


</script>
<!-- InstanceEndEditable -->
</head>


<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<html:form action="DiaryItem.do" enctype="multipart/form-data">
<input type="hidden" name="event" value="<%=DiaryItemAction.EVENT_CREATE%>"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td>
      <h3>Add New Diary Item</h3>
    </td>
  </tr>
  <tr>
    <td><hr /></td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        
        <tr class="even">
          <td class="fieldname" width="25%">Diary Number</td>
          <td width="25%">
                <html:text property="diaryNumber" maxlength="30" size="40" readonly="true"/>
                <html:errors property="diaryNumber"/>
            </td>
            <td class="fieldname" width="80%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td width="20%">
              
            </td>
        </tr>
       	<%if(searchResult!=null){ %>
        <tr class="even" >
         <td class="fieldname" width="25%">Party ID</td>
          <td width="25%">
            <html:hidden property="leID" value="<%=searchResult.getLegalReference()%>"  />
          <%=searchResult.getLegalReference()%>
               
            </td>
          <td class="fieldname" width="25%">Party Name<font color="red">* </font></td>
          
          <td width="25%">
                <html:text property="customerName" value="<%=searchResult.getCustomerName()%>"    maxlength="30" size="35"/><input class="btnNormal" id="searchCustomerButton" type="button" value="Search Party"  onclick="searchCustomer()"/>
                <html:errors property="customerName"/>
            </td>
                </tr>
        <tr class="even">
         <td class="fieldname" width="25%">Segment &nbsp;</td>
         <td width="25%"> 
				<%=regionAndSegment.getCustomerSegmentName()%>
         			<html:hidden property="customerSegment" value="<%=regionAndSegment.getCustomerSegment()%>" />                         
                       
          	</td>
          	<td class="fieldname" width="25%">Region&nbsp;</td>
        <td width="25%">
        <%if(regionAndSegment.getRegion() == null){
        	regionAndSegment.setRegion("");
        }%>
        
        <%=regionAndSegment.getRegion()%>
            <html:hidden property="region" value="<%=regionAndSegment.getRegion()%>"  />
        </td>
          </tr>
          
          
          <tr class="even">
         <td class="fieldname" width="25%">Facility Board Category <font color="red">* </font>&nbsp;</td>
         <td width="25%"> 

         			<html:select property="facilityBoardCategory" onchange="javascript:refreshFacilityLineNo(this)">
         			<html:option value="">Please Select</html:option>
                  		<html:options collection="facilityBoardCategorylist" property="value" labelProperty="label"/>
                    </html:select>
                    <html:errors property="facilityBoardCategory"/>
          	</td>
          	<td class="fieldname" width="25%">Facility Line Number <font color="red">* </font>&nbsp;</td>
        <td width="25%">
            
                      <html:select property="facilityLineNo" onchange="javascript:refreshFacilitySerialNo(this)" >
                      <html:option value="">Please Select</html:option>
                  		<html:options collection="facilityLineNoList" property="value" labelProperty="label"/>
                    </html:select>
                    <html:errors property="facilityLineNo"/>
        </td>
          </tr>
          
          <tr class="even">
         <td class="fieldname" width="25%">Facility Serial No. <font color="red">* </font>&nbsp;</td>
         <td width="25%"> 

         			<html:select property="facilitySerialNo" >
         			<html:option value="">Please Select</html:option>
                  		<html:options collection="facilitySerialNoList" property="value" labelProperty="label"/>
                    </html:select>
                    <html:errors property="facilitySerialNo"/>
          	</td>
         <td class="fieldname" width="25%">Status<font color="red">* </font>&nbsp;</td>
         <td width="25%"> Open
         			<html:hidden property="status" value="Open"/>                  		
          	</td>
          </tr>
          
           
          
          
                    
      <%}else{%>
    	  <tr class="even">
    	  <td class="fieldname" width="25%">Party ID</td>
          <td width="25%">
            <html:hidden property="leID" value=""  />
          
                <html:errors property="leID"/>
            </td>
          <td class="fieldname" width="25%">Party Name<font color="red">* </font></td>
          
          <td width="25%">
                <html:text property="customerName"   maxlength="25" size="25"/><input class="btnNormal" id="searchCustomerButton" type="button" value="Search Party"  onclick="searchCustomer()"/>
                <html:errors property="customerName"/>
            </td>         
        </tr>
        <tr class="even">
         <td class="fieldname" width="25%">Segment&nbsp;</td>
         <td width="25%"> 				
         			<html:hidden property="customerSegment" value="" />                         
                       
          	</td>
          	<td class="fieldname" width="25%">Region&nbsp;</td>
        <td width="25%">
            <html:hidden property="region" value=""  />
        </td>
          </tr>
          
           <tr class="even">
         <td class="fieldname" width="25%">Facility Board Category <font color="red">* </font>&nbsp;</td>
         <td width="25%"> 

         			<html:select property="facilityBoardCategory" onchange="javascript:refreshFacilityLineNo(this)">
         			<html:option value="">Please Select</html:option>
                  		
                    </html:select>
                    <html:errors property="facilityBoardCategory"/>
          	</td>
          	<td class="fieldname" width="25%">Facility Line Number <font color="red">* </font>&nbsp;</td>
        <td width="25%">
            
                      <html:select property="facilityLineNo" onchange="javascript:refreshFacilitySerialNo(this)" >
                      <html:option value="">Please Select</html:option>
                  		
                    </html:select>
                    <html:errors property="facilityLineNo"/>
        </td>
          </tr>
          
          <tr class="even">
         <td class="fieldname" width="25%">Facility Serial No. <font color="red">* </font>&nbsp;</td>
         <td width="25%"> 

         			<html:select property="facilitySerialNo" >
         			<html:option value="">Please Select</html:option>
                  		
                    </html:select>
                     <html:errors property="facilitySerialNo"/>
          	</td>
     
         <td class="fieldname" width="25%">Status<font color="red">* </font>&nbsp;</td>
         <td width="25%"> Open
         			<html:hidden property="status" value="Open"/>                  		
          	</td>
    
          </tr>
     <%}%>
          <!-- <td class="fieldname" width="29%">Segment</td>
          <td width="71%">
                <html:text property="customerSegment" maxlength="20" size="25"
            onkeyup="limitFieldTextCust(this.form.customerSegment, 15, 'Customer Segment');"/>
                <html:errors property="customerSegment"/>
            </td>  -->
  <!-- </tr>
        <tr class="odd">
          <td class="fieldname" width="29%">AM</td>
          <td width="71%">
                <html:text property="FAM" maxlength="60" size="25"
                onkeyup="limitFieldTextCust(this.form.FAM, 25, 'FAM');"/>
                <html:errors property="FAM"/>
            </td>
        </tr>  --> 
       
          <tr class="even">
         <td class="fieldname" width="25%">DropLine OD<font color="red">* </font>&nbsp;</td>
         <td width="25%"> 

         			 <input type="radio"  name="dropLineOD" value="Y" id = "dropLineODY" onclick="javascript:enableODFileUpload()">Yes
             &nbsp;&nbsp;
             <input type="radio" name="dropLineOD" value="N"  id = "dropLineODN"  onclick="javascript:disableODFileUpload()" >No
          	</td>
          	
          	<td class="fieldname" width="25%">OD Schedule Upload File <font id="ODFile" color="red">*  </font>&nbsp;</td>
        <td width="25%">
            
                   <html:file property="odScheduleUploadFile"  ></html:file>  
<%--                  <html:errors property="odScheduleUploadFile"/>   
 --%>          <%--        <html:hidden property="odScheduleUploadFile" /> --%>
        </td>
          </tr>
          
          <tr class="even">
         <td class="fieldname" width="25%">Activity<font color="red">* </font>&nbsp;</td>
         <td width="25%"> 

         			<html:select property="activity" >
         				<html:option value="">Please Select</html:option>
                  		<html:options collection="activityList" property="value" labelProperty="label"/>
                    </html:select>
                    <html:errors property="activity"/>
          	</td>
			<td class="fieldname" width="25%">Target Date&nbsp;<font id="targetDate"
								color="red">* </font></td>
			<td width="25%"><html:text property="itemDueDate"
									style="width:80px" size="12" maxlength="11" readonly="true" />
								<img src="img/calendara.gif" name="Image5223161211" border="0"
								id="Image5"
								onclick="return showCalendar('itemDueDate', 'dd/mm/y'  );"
								onMouseOver="MM_swapImage('Image5223161211','','img/calendarb.gif',1)"
								onMouseOut="MM_swapImgRestore()" /> <html:errors
									property="itemDueDate" /></td>
						</tr>
						
						
			<tr class="even">
         <td class="fieldname" width="25%">Maker Id&nbsp;</td>
       
         <td width="25%"> 
         	 <integro:htmltext value="<%=makerId %>"/>
         		<html:hidden property="makerId" value=""/>                  		
          	</td>
			<td class="fieldname" width="25%">Maker Date and Time &nbsp;</td>
			<td width="25%">
			<integro:htmltext value="<%=makerDate %>"/>
			<html:hidden property="makerDateTime" />
								</td>											
						</tr>
		
		<tr class="even">
        
			<td class="fieldname" rowspan="2"  width="25%">Remarks&nbsp;</td>
          <td width="75%" colspan="3">
              <%--   <html:text property="description" size="25" maxlength="100"/> --%>
           <html:textarea  rows="3" cols="140" property="description"  styleId="internalRemarks" /> 
            </td>										
						</tr>
         
           
      <%--   <tr class="odd">
          <td class="fieldname" width="29%">Narration</td>
          <td width="71%">
              <html:textarea property="narration" rows="5" cols="40" onkeyup="limitFieldText(this.form.narration, 200, 'Narration');"/>
              <html:errors property="narration" />
              </textarea>
          </td>
        </tr>
         <tr class="even">
          
        </tr>
        <tr class="odd">
          <td class="fieldname" width="29%">Item Expiry Date&nbsp;<font color="red">* </font></td>
          <td width="71%">
             <html:text property="itemExpiryDate" style="width:80px"  size="12" maxlength="11" readonly="true" />
             <img src="img/calendara.gif"  name="Image5223161211" border="0" id="Image5" onClick="return showCalendar('itemExpiryDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image5223161211','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
             <html:errors property="itemExpiryDate"/> </td>
        </tr> --%>
       
        <thead> </thead> <tbody>
        <tr class="even">
<!--          <td class="fieldname" width="29%">Access Country&nbsp;<font color="#0000FF">* </font></td>-->
          <td width="25%">  

          	    <html:hidden property="allowedCountry" />

          </td>
        </tr>
        </tbody> 
      </table>
    

<table width="72" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="72">&nbsp;</td>
  </tr>
  <tr>
    <td width="72">
    	<a href="javascript:submitForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)">
    	<img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" /></a>
    </td>
        
     <td>
		<a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)">
		<img src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
	</td>
  </tr>
</table>
</td>
</tr></tbody></table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
