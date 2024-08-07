<%@ page import="com.integrosys.cms.ui.diaryitem.DiaryItemAction,
                 com.integrosys.base.techinfra.util.DateUtil,
                   java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.diaryitem.DiaryItemForm,
                 java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/diaryitem/view_diary_item.jsp,v 1.13 2006/08/25 12:56:49 wltan Exp $
     * @author $Author: wltan $
     * @version $Revision: 1.13 $
     * @since $Date: 2006/08/25 12:56:49 $
     * Tag: $Name:  $
     */
%>

<html>
<body>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<style>
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
</style>

<%
    DiaryItemForm diaryForm = (DiaryItemForm) request.getAttribute("DiaryItemForm");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
   // System.out.println("diaryForm.getLastUpdatedDate()"+diaryForm.getLastUpdatedDate());
    //Date lastUpdatedDate = DateUtil.convertDate(locale, diaryForm.getLastUpdatedDate());
	List actionList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.actionList");
    String fromPage = (String) request.getAttribute("frompage");
    String closedate = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.closedate");
    String closeBy = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.closeBy");
   
    char ch = '0';
    int length = diaryForm.getDiaryNumber().length( ); 
    if(length > 7){
	   if(diaryForm.getDiaryNumber().charAt(6) == ch && diaryForm.getDiaryNumber().charAt(7) == ch && diaryForm.getDiaryNumber().charAt(8) != ch){
	   diaryForm.setDiaryNumber("0"+diaryForm.getDiaryNumber());
	   }
    }
    
    if (!(closeBy == null)) {
		pageContext.setAttribute("closeBy", closeBy);
		session.setAttribute("closeBy", closeBy);
		 
		}
   
    if (!(closedate == null)) {
		pageContext.setAttribute("closedate", closedate);
		session.setAttribute("closedate", closedate);
		 
		}
    
    if (fromPage == null) {
        fromPage = request.getParameter("frompage");
    }

    String startIndex = (String) request.getAttribute("startIndex");
    if (startIndex == null) {
        startIndex = request.getParameter("startIndex");
    }

    String customerIndex = (String) request.getAttribute("customerIndex");
    if (customerIndex == null) {
        customerIndex = diaryForm.getCustomerIndex();
    }
	
    String releaseAmount = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.releaseAmount");
    System.out.println("<<<<releaseAmount>>>>>>>"+releaseAmount+"<<<<>>>>>");
    if("".equals(releaseAmount))
    	releaseAmount="0";
    String closingAmount = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.closingAmount");
   
    DefaultLogger.debug(this, "fromPage >>>>>>>>>> " + fromPage);
    DefaultLogger.debug(this, "startIndex >>>>>>>>>> " + startIndex);
    DefaultLogger.debug(this, "customerIndex >>>>>>>>>> " + customerIndex);
    
    String genericCount = (String) request.getAttribute("genericCount");
    String odCount = (String) request.getAttribute("odCount");
    String totalCount = (String) request.getAttribute("totalCount");
    String segment = (String) request.getAttribute("segment");
    String segmentName = (String) request.getAttribute("segmentName");
    String overDueCount = (String) request.getAttribute("overDueCount");
    
    String itemDueDate =  (String) request.getAttribute("itemDueDate");
    pageContext.setAttribute("genericCount", genericCount);
    pageContext.setAttribute("odCount", odCount);
    pageContext.setAttribute("totalCount", totalCount);
    pageContext.setAttribute("segment", segment);
    pageContext.setAttribute("segmentName", segmentName);
    pageContext.setAttribute("overDueCount", overDueCount);
    pageContext.setAttribute("itemDueDate", itemDueDate);
    
    System.out.print("=========================== itemDueDate : "+itemDueDate);
    System.out.print("=========================== genericCount : "+genericCount);
    
    List facilityBoardCategoryList= (List) session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.facilityBoardCategoryList");
    List activityList= (List) session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.activityList");
    System.out.print("<<<<<<<<facilityBoardCategoryList>>>>>>>>>>>> : "+facilityBoardCategoryList);
    System.out.print("<<<<<<<<activityList>>>>>>>>>>>> : "+activityList);

%>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
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
	document.forms[0].event.value = "<%=DiaryItemAction.EVENT_UPDATE%>";
	<%if("Y".equals(diaryForm.getDropLineOD()) && !"list_non_expired".equals(diaryForm.getFrompage())){ %>
		if(""==document.forms[0].action.value){
			alert("Please select Action");
		}
		else{
			var releaseAmount=<%=releaseAmount%>;
			var closingAmount=<%=closingAmount%>;
			if(releaseAmount!=closingAmount){
				if(closingAmount == null){
					closingAmount = 0;
				}
				var answer5=  confirm("Released Amount Mismatch \n\n   CLIMS             : "+releaseAmount+".00\n   OD Schedule  : "+closingAmount+".00 \n\nDo you still want to continue?");
				if(answer5 == true){
					document.forms[0].submit();	
				}
			}else{
				document.forms[0].submit();	
			}
		}
	 <%}else{%>
	 	document.forms[0].submit();
	 <%}%>
}

function cancelForm() {
    document.forms[0].event.value = "<%=DiaryItemAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}

function limitFieldText(limitField, limitNum, fieldName) {
	if (limitField.value.length > limitNum) {
        limitField.value = limitField.value.substring(0, limitNum);
        alert(fieldName+' field can be only '+limitNum+' Characters');
		limitField.value = limitField.value.substring(0, limitNum);
	}
}

function limitFieldTextCust(limitField, limitNum, fieldName) {
	if (limitField.value.length > limitNum) {
        limitField.value = limitField.value.substring(0, limitNum);
        alert(fieldName+' maximum length is '+limitNum+' alphanumeric characters');
		limitField.value = limitField.value.substring(0, limitNum);
	}
}


function enableODFileUpload(){
	 document.getElementById("odScheduleUploadFile").disabled= false;
	
	  document.forms[0].itemDueDate.value = '';
	// $('#Image5').datepicker("hide");
	 document.forms[0].itemDueDate.disabled = true;
	 document.getElementById("ODFile").hidden= false;
	 document.getElementById("targetDate").hidden= true;
	 
	 
}

function disableODFileUpload(){
	
	 document.getElementById("odScheduleUploadFile").disabled= true;
	 document.forms[0].itemDueDate.disabled = false;
	 document.getElementById("ODFile").hidden= true;
	 
	// document.getElementById("Image5").hidden= false;
	 document.getElementById("targetDate").hidden= false;
}

window.onload = function() {
	//document.forms[0].diaryNumber.value = '';
	var dropLineOD = '<%=diaryForm.getDropLineOD()%>';
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
	document.getElementById("dropLineODY").disabled = true;
	document.getElementById("dropLineODN").disabled = true;
	
	<%if(!( diaryForm.getEvent().equals("read"))){ %>
	document.getElementById("closeByhide").hidden= true;
	 document.getElementById("closeDatehide").hidden= true;
	 document.getElementById("closeByshow").hidden= false;
	 document.getElementById("closeDateshow").hidden= false;
	<%}%>
	<%if( diaryForm.getEvent().equals("prepare_update") || diaryForm.getEvent().equals("updateError")){ %>
	document.getElementById('internalRemarks').setAttribute('maxlength', '200');
	<%}%>
	};
	
function previousDateValidator(){
		var targetDate = new Date(document.forms[0].nextTargetDate.value);
		var todayDate = new Date();
		if(targetDate < todayDate){
			alert("Please enter future date or today's date");
			document.forms[0].nextTargetDate.value = "";
			return false;
		}

		
	}
	
function changeCloseByCloseDate(dropdown)
{
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
     }	
     if(curSel == "Closed"){
    	 document.getElementById("closeByhide").hidden= false;
    	 document.getElementById("closeDatehide").hidden= false;
    	 document.getElementById("closeByshow").hidden= true;
    	 document.getElementById("closeDateshow").hidden= true;
    	 if(document.getElementById("dropLineODN").checked == true){
    	 document.getElementById("nextTargetDateNotMandatory").hidden= true; 
    	 document.getElementById("nextTargetDatehide").hidden= true; 
    	 document.getElementById("nextTargetDateshow").hidden= false; 
    	 document.forms[0].nextTargetDate.value = "";
    	 }
    	 
    	 document.forms[0].closeBy.value = '<%=closeBy%>';
    	 document.forms[0].closeDate.value = '<%=closedate%>' ;
    	
     }else if(curSel == "Extended"){
    	 document.getElementById("closeByhide").hidden= true;
    	 document.getElementById("closeDatehide").hidden= true;
    	 document.getElementById("closeByshow").hidden= false;
    	 document.getElementById("closeDateshow").hidden= false;
    	 if(document.getElementById("dropLineODN").checked == true){
    	 document.getElementById("nextTargetDatehide").hidden= false;
    	 document.getElementById("nextTargetDateshow").hidden= true; 
    	 document.getElementById("nextTargetDateNotMandatory").hidden= false; 
    	 }
    	 document.forms[0].closeBy.value = '';
    	 document.forms[0].closeDate.value = '' ;

     }else{
    	 document.getElementById("closeByhide").hidden= true;
    	 document.getElementById("closeDatehide").hidden= true;
    	 document.getElementById("closeByshow").hidden= false;
    	 document.getElementById("closeDateshow").hidden= false;
    	 if(document.getElementById("dropLineODN").checked == true){
    	 document.getElementById("nextTargetDateNotMandatory").hidden= false; 
    	 document.getElementById("nextTargetDatehide").hidden= false; 
    	 document.getElementById("nextTargetDateshow").hidden= true;
    	 }
     }
     
}

//-->
</script>
</head>
<html:form action="DiaryItem.do">
<input type="hidden" name="event" value="<%=DiaryItemAction.EVENT_UPDATE%>"/>
<input type="hidden" name="itemId" value="<%=diaryForm.getItemId()%>" />
<input type="hidden" name="frompage" value="<%=fromPage%>" />
<%diaryForm.setFrompage(fromPage) ;%>
<input type="hidden" name="startIndex" value="<%=startIndex%>" />
<%System.out.println("************"+startIndex); %>
<input type="hidden" name="customerIndex" value="<%=customerIndex%>" />

<input type="hidden" name="itemDueDate" value='<%=itemDueDate%>' />
<input type="hidden" name="genericCount" value='<%=genericCount %>'/>
<input type="hidden" name="odCount" value='<%=odCount %>'/>
<input type="hidden" name="totalCount" value='<%=totalCount %>'/>
<input type="hidden" name="segment" value='<%=segment %>'/>
<input type="hidden" name="segmentName" value='<%=segmentName %>'/>
<input type="hidden" name="overDueCount" value='<%=overDueCount %>'/>

<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td>
      <%if("prepare_update".equals(diaryForm.getEvent())){ %>
      <h3>Update Diary Item 
      <%System.out.println("###########FromPage"+fromPage); %>
      <%if("Y".equals(diaryForm.getDropLineOD()) && !"list_non_expired".equals(diaryForm.getFrompage())){ 
      if(diaryForm.getMonth() != null){%>
      #Month - <%=diaryForm.getMonth().replace(".00", "") %>
      <%}
      } %> <html:hidden property="month" /></h3>
      <%} else{%>
      	  <h3>View Diary Item 
      <%System.out.println("###########FromPage"+fromPage); %>
      <%if("Y".equals(diaryForm.getDropLineOD()) && !"list_non_expired".equals(diaryForm.getFrompage())){ 
      if(diaryForm.getMonth() != null){%>
      #Month - <%=diaryForm.getMonth().replace(".00", "") %>
      <%}
      } %> <html:hidden property="month" /></h3>
      <%} %>
      
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
               <integro:wrapper value="<%=diaryForm.getDiaryNumber()%>" lineLength="20"/>
               <html:hidden name="DiaryItemForm" property="diaryNumber"/>
            </td>
            <td class="fieldname" width="80%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td width="25%">
              
            </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="25%">Party ID </td>
          <td width="25%"><integro:wrapper value="<%=diaryForm.getLeID()%>" lineLength="20"/>
          <html:hidden name="DiaryItemForm" property="leID"/>
          </td>
        
          <td class="fieldname" width="25%">Party Name</td>
          <td width="25%"><integro:wrapper value="<%=diaryForm.getCustomerName()%>" lineLength="50"/>
          <html:hidden name="DiaryItemForm" property="customerName"/>
          </td>
        </tr>
        
        <tr class="even">
        
        <td class="fieldname" width="25%">Segment</td>
          <td width="25%"><integro:wrapper value="<%=diaryForm.getCustomerSegmentName()%>" lineLength="50"/>
          <html:hidden name="DiaryItemForm" property="customerSegment"/>
          </td>
        
        <td class="fieldname" width="25%">Region</td>
          	<td width="25%"><integro:wrapper value="<%=diaryForm.getRegion()%>" lineLength="50"/>
          <html:hidden name="DiaryItemForm" property="region"/>
          </tr>
          
        <%-- <tr class="even">
          <td class="fieldname" width="29%">Segment <font color="red">* </font></td>
          <td width="71%">
          System.out.println("hhhh"+diaryForm.getCustomerSegment());
           <!--   <html:select property="customerSegment"   > 
          <html:option value="" >Please Select</html:option>
          <html:option value="CORPORATE" >CORPORATE</html:option>
          <html:option value="MIDDLE MARKET" >MIDDLE MARKET</html:option>
          <html:option value="RETAIL" >RETAIL</html:option>
          <html:option value="EMERGING MARKET" >EMERGING MARKET</html:option>
          <html:option value="CASH MANAGEMENT" >CASH MANAGEMENT</html:option>
          <html:option value="STOCK EXCHANGE" >STOCK EXCHANGE</html:option>
          <html:option value="FINANTIAL INSTITUTION" >FINANTIAL INSTITUTION</html:option>
          <html:option value="TREASURY" >TREASURY</html:option>
          <html:option value="DEPOSITORY" >DEPOSITORY</html:option>
          <html:option value="CUSTODY" >CUSTODY</html:option>
          <html:option value="OTHERS" >OTHERS</html:option>
          </html:select>
           <html:errors property="segment"/>  --> 
           
           <html:select property="customerSegment" value="<%=diaryForm.getCustomerSegment()%>" >
                        <integro:common-code categoryCode="HDFC_SEGMENT"  />
			    	</html:select>                         
                       <html:errors property="segment"/>
           
               
           
          </td>
        </tr> --%>
      <!--   <tr class="odd">
         <td class="fieldname" width="29%">AM</td>
          <td width="71%">
            <html:text property="FAM" value="<%--=diaryForm.getFAM()--%>" size="50"
                onkeyup="limitFieldTextCust(this.form.FAM, 50, 'FAM');"/>
            <html:errors property="FAM"/>
          </td>
        </tr>-->
        
         
          <tr class="odd">
         <td class="fieldname" width="25%">Facility Board Category <font color="red">* </font>&nbsp;</td>
          <td width="25%">
          	<html:select property="facilityBoardCategory" disabled="true">
		    	<option value="">Please Select </option>	
            	<html:options collection="facilityBoardCategoryList" property="value" labelProperty="label"/>
           </html:select>
           <html:hidden name="DiaryItemForm" property="facilityBoardCategory"/>
          </td>
          	<td class="fieldname" width="25%">Facility Line Number <font color="red">* </font>&nbsp;</td>
        <td width="25%"><integro:wrapper value="<%=diaryForm.getFacilityLineNo()%>" lineLength="50"/>
          <html:hidden name="DiaryItemForm" property="facilityLineNo"/></td>
          </tr>
          
          <tr class="even">
         <td class="fieldname" width="25%">Facility Serial Number <font color="red">* </font>&nbsp;</td>
          <td width="25%"><integro:wrapper value="<%=diaryForm.getFacilitySerialNo()%>" lineLength="50"/>
          <html:hidden name="DiaryItemForm" property="facilitySerialNo"/></td>
       <td class="fieldname" width="25%">Status<font color="red">* </font>&nbsp;</td>
         <td width="25%"> 	<integro:htmltext value="<%=diaryForm.getStatus() %>"/>
         			<html:hidden property="status" value="Open"/>                  		
          	</td>
          </tr>
          
          <tr class="odd">
         <td class="fieldname" width="25%">DropLine OD<font color="red">* </font>&nbsp;</td>
         <td width="25%"> 

         			 <input type="radio"  name="dropLineOD" value="Y" id = "dropLineODY" onclick="javascript:enableODFileUpload()">Yes
             &nbsp;&nbsp;
             <input type="radio" name="dropLineOD" value="N"  id = "dropLineODN"  onclick="javascript:disableODFileUpload()" >No
             <html:hidden property="dropLineOD" />
          	</td>
          	
          	<%-- <td class="fieldname" width="25%">OD Schedule Upload File <font id="ODFile" color="red">*  </font>&nbsp;</td>
        <td width="25%">
            
                   <input type="file" name="odScheduleUploadFile" id = "odScheduleUploadFile" accept="application/vnd.ms-excel"  />  
                 <html:errors property="odScheduleUploadFile"/>   
        </td> --%>
        
        	<td class="fieldname" width="25%">OD Schedule Upload File 
          		<font id="ODFile" color="red">*  </font>&nbsp;
          	</td>
          	<%if("Y".equals(diaryForm.getDropLineOD()) && "N".equals(diaryForm.getUploadFileError())){ %>
        		<td width="25%">
        			<% 
        				String viewURL = "DiaryItem.do?event=view_odschedule&itemId="+diaryForm.getItemId()
        				+"&diaryNumber="+diaryForm.getDiaryNumber()+"&fromEvent="+diaryForm.getEvent()+"&frompage="+fromPage+"&itemDueDate="+itemDueDate;
 					%>
       		 		<a href ="<%=viewURL%>" name="odScheduleUploadFile" id = "odScheduleUploadFile">View OD Schedule</a>  
       		 		<%System.out.println("ViewURL------------"+viewURL); %>
        		</td>
        	<%}else{ %>
        		<td width="25%"><a href ="" name="odScheduleUploadFile" id = "odScheduleUploadFile"></a></td>
        	<%} %>
          </tr>
          
               <tr class="even">
         <td class="fieldname" width="25%">Activity <font color="red">* </font>&nbsp;</td>
        <td width="25%">
        	<html:select property="activity" disabled="true">
		    	<option value="">Please Select </option>	
            	<html:options collection="activityList" property="value" labelProperty="label"/>
           </html:select>	
        </td>
        <html:hidden property="activity" />
			<td class="fieldname" width="25%">Target Date&nbsp;<font id="targetDate"
								color="red">* </font></td>
			<td width="25%"><integro:wrapper value="<%=diaryForm.getItemDueDate()%>" lineLength="50"/></td>
			<html:hidden property="itemDueDate" />
						</tr>
						
            
            <tr class="odd">
         <td class="fieldname" width="25%">Maker Id&nbsp;</td>
       
         <td width="25%"> 
         	 <integro:htmltext value="<%=diaryForm.getMakerId() %>"/>
         		<html:hidden property="makerId" />                  		
          	</td>
			<td class="fieldname" width="25%">Maker Date and Time &nbsp;</td>
			<td width="25%">
			<integro:htmltext value="<%=diaryForm.getMakerDateTime() %>"/>
			<html:hidden property="makerDateTime" />
								</td>											
						</tr>
			
			 <%if("read".equals(diaryForm.getEvent())){ %>		
			<tr class="even">
         
			<td class="fieldname"  width="25%">Remarks&nbsp;</td>
           <td width="75%" colspan="3">
                <integro:htmltext value="<%=diaryForm.getDescription() %>"/>
         			<html:hidden property="description" /> 
                
            </td>										
			</tr>
			  <%} %>
			
			<%System.out.println("######################################################"+diaryForm.getEvent()); %>
			
			 <%if(!( diaryForm.getEvent().equals("read"))){ %>
			<tr class="odd">
         <td class="fieldname" width="25%">Action<font color="red">* </font>&nbsp;</td>
         <td width="25%"> 
			<%if("N".equals(diaryForm.getDropLineOD())){ %>
         			<html:select property="action" onchange="javascript:changeCloseByCloseDate(this)" >
         				<html:option value="">Please Select</html:option>
                  		<html:options collection="actionList" property="value" labelProperty="label"/>
                    </html:select>
                     <html:errors property="action"/>
                  <%}else{ %>
                  <html:select property="action"  onchange="javascript:changeCloseByCloseDate(this)" >
         				<html:option value="">Please Select</html:option>
                  		<html:option value="Closed">Closed</html:option>
                    </html:select>
                    <html:errors property="action"/>
                    <%} %>
                   
          	</td>
          	
          	<td class="fieldname" width="25%">Close Date &nbsp;</td>
			<td width="25%" id="closeDatehide">
			<integro:htmltext value="<%=closedate %>"  />
			<html:hidden property="closeDate" />
								</td>
			<td width="25%" id="closeDateshow"></td>
			
						</tr>
						
		<tr class="even">
         <td class="fieldname" width="25%">Closed by with Date Time&nbsp;</td>
       
         <td width="25%" id="closeByhide"> 
          	 <integro:htmltext value="<%=closeBy %>" />
         		<html:hidden property="closeBy" />                  		
          	</td><td width="25%" id="closeByshow"></td>
								
          	<td class="fieldname" width="25%">Next Target Date&nbsp;
			 <%if("N".equals(diaryForm.getDropLineOD())){ %>
	       <font id="nextTargetDateNotMandatory" color="red">* </font></td>
			<td width="25%" id="nextTargetDatehide"><html:text property="nextTargetDate" 
									style="width:80px" size="12" maxlength="11" readonly="true" />
								<img src="img/calendara.gif" name="Image5223161211" border="0"
								id="Image5"
								onclick="return showCalendar('nextTargetDate', 'dd/mm/y'  );"
								onMouseOver="MM_swapImage('Image5223161211','','img/calendarb.gif',1)"
								onMouseOut="MM_swapImgRestore()" /> <html:errors
									property="nextTargetDate" />
									</td>
			<td width="25%" hidden id="nextTargetDateshow"></td>
			<%}else{ %>
			<td width="25%"  ></td>
			<%} %>			
					</tr>
						
          <%} %>  
          <%System.out.println("Event........."+diaryForm.getEvent()); %>
          <%if("prepare_update".equals(diaryForm.getEvent()) || "updateError".equals(diaryForm.getEvent())){ %>
          <tr class="odd">
        
			<td class="fieldname" rowspan="2"  width="25%">Remarks&nbsp;</td>
          <td width="75%" colspan="3">
              <%--   <html:text property="description" size="25" maxlength="100"/> --%>
           <html:textarea  rows="3" cols="100" property="description"  styleId="internalRemarks" /> 
            </td>										
						</tr>
		 <%} %>
       <%--  <tr class="odd">
          <td class="fieldname" width="29%">Short Description&nbsp;<font color="red">* </font></td>
          <td width="71%">
            <html:text property="description" value="<%=diaryForm.getDescription()%>" size="50" maxlength="153"
                onkeyup="limitFieldTextCust(this.form.description, 150, 'Short Description');"/>
            <html:errors property="description"/>
         </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="29%">Narration</td>
          <td width="71%"><html:textarea property="narration" rows="6" cols="80" onkeyup="limitFieldText(this.form.narration, 1600, 'Narration');"/>
           <html:errors property="narration"/>
           </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="29%">Item Expiry Date&nbsp;<font color="red">* </font></td>
          <td width="71%">
            <html:text property="itemExpiryDate" size="12" maxlength="11" readonly="true" />
            <img src="img/calendara.gif"  name="Image52231612111" border="0" id="Image5" onClick="return showCalendar('itemExpiryDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image52231612111','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                <html:errors property="itemExpiryDate"/> 
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="29%">Date of Reminder&nbsp;<font color="red">* </font></td>
          <td width="71%">
             <html:text property="itemDueDate" size="12" maxlength="11" readonly="true" />
            <img src="img/calendara.gif"  name="Image5223161211" border="0" id="Image5" onClick="return showCalendar('itemDueDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image5223161211','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                
                   <html:errors property="itemDueDate"/>
          </td>
        </tr> --%>
       <!--   <tr class="even">
          <td class="fieldname" width="29%">Last Updated By</td>
          <td width="71%"><bean:write name="DiaryItemForm" property="lastUpdatedBy"/></td>
          <html:hidden name="DiaryItemForm" property="lastUpdatedBy"/>
        </tr>  --> 
      <!--   <tr class="odd">
          <td class="fieldname" width="29%"> Date Updated</td>
          <td width="71%"><bean:write name="DiaryItemForm" property="lastUpdatedDate"/>
              <html:hidden name="DiaryItemForm" property="lastUpdatedDate"/>
          </td>
        </tr>  --> 
        <thead>
        </thead>
        <tbody>
          <!-- <tr class="even">
          <td class="fieldname" width="29%"> Obsolete </td>
          <td width="71%">
             <%--
                 String strObsolete = diaryForm.getObsolete();
                 boolean isObsolete = false;
                 if (strObsolete != null) {
                        isObsolete = strObsolete.equals(ICMSConstant.TRUE_VALUE);
                 }
             --%>
             <input type="checkbox" name="obsolete" value=<%--=ICMSConstant.TRUE_VALUE--%> <%-- if(isObsolete){--%>checked<%--}--%>/>
            (Pls tick to make item obsolete) </td>
        </tr> -->
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>


<table width="72" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="72">&nbsp;</td>
  </tr>
  <tr>
  

  <%if(!(diaryForm.getEvent().equals("read"))){ %>
    <td width="72"><a href="javascript:submitForm();" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('ImageSave','','img/save2.gif',1)"><img src="img/save1.gif" name="ImageSave" width="70" height="20" border="0" id="ImageSave" /></a></td>
  <%} %>
    <%
        StringBuffer sb = new StringBuffer("DiaryItem.do?event="+fromPage+"&genericCount="+genericCount+"&odCount="+odCount+"&totalCount="+totalCount+"&segment="+segment+"&segmentName="+segmentName+"&overDueCount="+overDueCount);
        if (customerIndex != null && customerIndex.trim().length() > 0) {
            sb.append("&customerIndex="+customerIndex);
        } 

        if (startIndex != null && startIndex.trim().length() > 0){
            sb.append("&startIndex="+startIndex);
        }
        String cancelURL = sb.toString();
        System.out.println("@@@@@@@@@@@@@@@@@@@"+cancelURL);
    %>
    <%System.out.println("************"+startIndex); %>
    <td width="72"><a href="<%=cancelURL%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel" width="70" height="20" border="0" id="ImageCancel" /></a></td>
  
  </tr>
</table>
</html:form>
</body>
</html>
