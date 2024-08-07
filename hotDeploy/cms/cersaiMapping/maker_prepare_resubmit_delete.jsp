<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="  com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping,
                com.integrosys.cms.app.cersaiMapping.bus.OBCersaiMapping,
                com.integrosys.cms.asst.validator.ASSTValidator,
                 java.util.*"%>
    
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,com.integrosys.cms.app.cersaiMapping.trx.ICersaiMappingTrxValue,com.integrosys.cms.app.cersaiMapping.trx.OBCersaiMappingTrxValue"%>
    
<%

CersaiMappingForm cersaiMappingForm = (CersaiMappingForm) request
			.getAttribute("CersaiMappingForm");
ICersaiMappingTrxValue cersaiMappingTrx = (ICersaiMappingTrxValue)session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.ICersaiMappingTrxValue");
	OBCersaiMapping oc=(OBCersaiMapping)cersaiMappingTrx.getStagingCersaiMapping();
	String mastername=oc.getMasterName();
	
	
	String mname=(String)request.getAttribute("masterName");
	if(mastername==null){
		pageContext.setAttribute("masterName", mname);
		session.setAttribute("masterName", mname);
		mastername=mname;
	}else{
		pageContext.setAttribute("masterName", mastername);
		session.setAttribute("masterName", mastername);
	}
	
	String event = (String)request.getParameter("event");
	System.out.println("event is ===///**--++//*=====  "+event);
	
	int counter = 0;
	
	ICersaiMapping[] masterValueList = (ICersaiMapping[])request.getAttribute("masterValueList");
	if (!(masterValueList == null)) {
    	System.out.println("<<<<<<xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx>>>>>>"+masterValueList);
		pageContext.setAttribute("masterValueList", masterValueList);
		session.setAttribute("masterValueList", masterValueList);
		}
	
ICersaiMapping[] ListOfValue1 = (ICersaiMapping[])session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.ListOfValue");
	
	if(null!=ListOfValue1){
		for(int i=0;i<ListOfValue1.length;i++){
		String cersaiVal=	ListOfValue1[i].getCersaiValue();
		String climval=ListOfValue1[i].getClimsValue();
		System.out.println("Clims Value === "+climval+"    ====  Cersai Value  === "+cersaiVal);
		}
		}else{
			System.out.println("List Of Value is Null ====");
		}
	
	pageContext.setAttribute("ListOfValue", ListOfValue1);
	session.setAttribute("ListOfValue", ListOfValue1);
	
	int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	
	if(!event.equals("maker_confirm_resubmit_delete")){
		cersaiMappingForm.setStatus(ind);
		System.out.println("Number before Load "+cersaiMappingForm.getStatus());
	}else{
		System.out.println("Number After Load "+cersaiMappingForm.getStatus());
		if(cersaiMappingForm.getStatus() != ""){
		startIndex=Integer.parseInt(cersaiMappingForm.getStatus());
		ind=cersaiMappingForm.getStatus();
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

/* function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
} */

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
function cancelPage(){
	document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
    //sessionStorage.removeItem('items');
	sessionStorage.clear();
	}
function submitForm() {
		document.forms[0].action = "cersaiMapping.do?event=maker_confirm_resubmit_delete";
		document.forms[0].submit();
		sessionStorage.removeItem('items');
		//sessionStorage.clear();
	}
	
	
var arr=[];
var storedArray=[];
var staticArray=[];
var event1='<%=event%>';


if(event1 == "maker_confirm_resubmit_delete"){
	staticArray=JSON.parse(sessionStorage.getItem("arrayReload1"));
	arr=staticArray;
	
}
if(event1 == "maker_prepare_resubmit_delete"){
	sessionStorage.clear();
}
if(event1 == "process_list_pagination"){
	
	staticArray=JSON.parse(sessionStorage.getItem("arrayReload1"));
	if(staticArray != null){
		arr=staticArray;
	 	window.sessionStorage.setItem("items", JSON.stringify(arr));
	}
}

function myFunction(val,num) {
	  
	  var climVal="";
	  climVal=document.getElementById("climVal"+num).value;
	  //alert(climVal);
		
	if(arr == null || arr.length <= 0){
		  storedArray = JSON.parse(sessionStorage.getItem("items"));
		  
		  var i;
		  if(storedArray !=null){
		  for (i = 0; i < storedArray.length; i++) {
		              // console.log(storedArray[i]);
		  }
		  arr=storedArray.slice();
		  }}
	
	if(arr !=null || arr.length > 0){
	for(var b=0;b<arr.length;b++){
		
		if(arr[b].Clims_Value == climVal){
			arr.splice( b,1);
		}
	}
	arr.push({
	    "Clims_Value": climVal,
	    "Cersai_Value": val
	});
	}
	  
	  if(arr != null){
	  for(var l=0;l<arr.length;l++){
		 //console.log(arr[l]);
	  }
		  window.sessionStorage.setItem("arrayReload1", JSON.stringify(arr));
		  if(event1 != "maker_confirm_resubmit_delete"){
			  staticArray=arr;
			  window.sessionStorage.setItem("arrayReload1", JSON.stringify(staticArray));
		  }
	 // console.log(arr);
	  window.sessionStorage.setItem("items", JSON.stringify(arr));
	  }
	}


function cersaiFunction(num){
	var arryStore=JSON.parse(sessionStorage.getItem("items"));
	var valClim=document.getElementById("climVal"+num).value;
	var i;
	  if(arryStore !=null){
	  for (i = 0; i < arryStore.length; i++) {
		  
	      if(valClim == arryStore[i].Clims_Value){
	    	  document.getElementById("editCersaiValue"+num).value=arryStore[i].Cersai_Value;
	      }
	  }
	  
	  }}
	  
	  
function cersaiFunction1(num){
	var number=num+10;
	var arryStore=[];
	if(event1 == "maker_confirm_resubmit_delete"){
		arryStore=JSON.parse(sessionStorage.getItem("arrayReload1"));
	}else{
		arryStore=JSON.parse(sessionStorage.getItem("items"));
	}
	for(var k=0;k<number;k++){
	var valClim=document.getElementById("climVal"+num).value;
	var i;
	  if(arryStore !=null){
	  for (i = 0; i < arryStore.length; i++) {
		  
	      if(valClim == arryStore[i].Clims_Value){
	    	  document.getElementById("editCersaiValue"+num).value=arryStore[i].Cersai_Value;
	      }
	  }
	  }
	  num++;
	  }}
	  
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='cersaiMapping.do'>
	<html:hidden property="startIndex" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<thead>

				<tr>
					<td>
						<h3>Edit Cersai Mapping</h3>
					</td>
				</tr>
				
			</thead>
			<tbody>
				<tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      <tr class="even">
          <td class="fieldname" width="29%">Master Name&nbsp;</td>
          <td width="71%"><%=mastername%>
          <!--  
               <html:select property="masterName">
         				<html:option value="">Please Select</html:option> 
                </html:select>-->
                     
            </td>
        </tr>
      </table>
    </td>
    </tr>
    
    
    <tr>
                          <td  colspan="2">
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                              <td width="5%">S/N</td>                            
                              <td width="40%">CLIMS Value</td>
                              <td width="45%">CERSAI Value</td>
                            </tr>
                            </thead>
                            
                            <logic:present name="ListOfValue">
                            <logic:iterate id="OB" length="10" indexId="counter1"
                    offset="<%=String.valueOf(startIndex)%>" name="ListOfValue" type="com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping" scope="page">
					  
                   <%
                       String rowClass = "";
                       counter++;
                       if ( counter%2 != 0 ) {
                           rowClass = "odd";
                       } else {
                           rowClass = "even";
                       }
                       
                      // String[] aa=OB.getClimsValues();
                       //int a=aa.length;
						
                     //  String itemURL = "DiaryItem.do?event=read&frompage=list_non_expired&itemId="+OB.getItemID();
                  %>
                  <body onload="cersaiFunction1(<%=counter%>)"></body>
                  <tbody>
                    <tr class=<%=rowClass%>>
                      <td class="index" width="5%"><%=counter1.intValue()+1%></td>
                      <td width="45%"><integro:wrapper value="<%=OB.getClimsValue()%>"  /><input type="hidden" name="climsValues" value="<%=OB.getClimsValue()%>" id="climVal<%=counter%>"/></td>  
                      <td width="40%">
                	<input type="text" name="updatedCersaiValue" value="<%=OB.getCersaiValue()%>" maxlength="200" id="editCersaiValue<%=counter%>" onchange="myFunction(this.value,<%=counter%>)" onmousemove="cersaiFunction(<%=counter%>)" style="width:370px;"/>
            		<% 
            		if(cersaiMappingForm.getUpdatedCersaiValue() != null){
    					for(int i=0;i < cersaiMappingForm.getUpdatedCersaiValue().length;i++){
    						if(cersaiMappingForm.getClimsValues()[i].equals(OB.getClimsValue())){
    							if(cersaiMappingForm.getUpdatedCersaiValue()[i].equals(OB.getClimsValue())){
                	%>
                	<html:errors property="cersaiValueSameBothValueError"/> 
                	<%
    							}
    						}
    					}}
            		
            	if(cersaiMappingForm.getUpdatedCersaiValue() != null){
            		for(int j=0;j < cersaiMappingForm.getUpdatedCersaiValue().length;j++){
						if(OB.getClimsValue().equals(cersaiMappingForm.getClimsValues()[j])){
						
            		boolean codeFlag = ASSTValidator.isValidAlphaNumStringWithSpace(cersaiMappingForm.getUpdatedCersaiValue()[j]);
					if (codeFlag == true) {
					%>
					<html:errors property="cersaiValueError"/>
					<% 
					}}}}
            	%> 
            </td>  
                    </tr>
                              </tbody>
                             
                              </logic:iterate>
                              <% if (counter == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <%} %>
                </logic:present>
                 <logic:notPresent name="ListOfValue">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                            
                            </table>
                            </td>
                            </tr>
                            
                            <html:hidden name="CersaiMappingForm" property="lastUpdateBy" />
                            <html:hidden name="CersaiMappingForm" property="status" />
							<html:hidden name="CersaiMappingForm" property="createBy" />
							<html:hidden name="CersaiMappingForm" property="lastUpdateDate" />
							<html:hidden name="CersaiMappingForm" property="creationDate" />
							<html:hidden name="CersaiMappingForm" property="deprecated" />
							<html:hidden name="CersaiMappingForm" property="id" />
				<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=cersaiMappingTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=cersaiMappingTrx.getRemarks() != null ? cersaiMappingTrx.getRemarks() : ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
  
  <logic:present name="ListOfValue">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table  width="100%" border="0" cellspacing="0" cellpadding="0">
                         
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, ListOfValue1.length)%>"
					                            url="cersaiMapping.do?event=process_list_pagination&startIndex="/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					
                      </table>
                 </td>
              </tr>
              </logic:present>
				
				
				
			</tbody>
		</table>
		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
				<td>
					<center>
						<a href="javascript:submitForm();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)">
							<img src="img/submit1.gif" name="Image3311" border="0"
							id="Image3311" />
						</a>
					</center> &nbsp;
				</td>
				<td>
					<center>
						<a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4411" border="0" id="Image4411" />
						</a>
					</center> &nbsp;
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>


		<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>