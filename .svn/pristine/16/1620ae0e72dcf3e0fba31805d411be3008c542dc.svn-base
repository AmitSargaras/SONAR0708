<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.base.uiinfra.common.CommonForm,
                 com.integrosys.cms.ui.ccmaster.CCMasterForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue itemTrxVal =(ITemplateTrxValue)session.getAttribute("com.integrosys.cms.ui.ccmaster.CCMasterAction.itemTrxVal");
    String remarks = "";
    String lastActionBy = "";

    ITemplate iTemplate = (ITemplate)session.getAttribute("com.integrosys.cms.ui.ccmaster.CCMasterAction.template");
    String law = CommonDataSingleton.getCodeCategoryLabelByValue("APP_LAW", iTemplate.getLaw());
    String custType = "";
    if(iTemplate!=null) {
        pageContext.setAttribute("iTemplate",iTemplate);
        custType = iTemplate.getLegalConstitution();
    }
    int row = 0;
    String editFlag = (String) request.getAttribute("isEdit");
    boolean isEdit = false;
    if("true".equals(editFlag)){
        isEdit = true;
    }
    String status = "";
    if(itemTrxVal!=null){
        status = itemTrxVal.getStatus();
        remarks = itemTrxVal.getRemarks();
        lastActionBy = itemTrxVal.getUserInfo();
    }
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";
    custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION,custType);



    String getEvent = request.getParameter("event");
%>
<%
	int numBorrower = 0; 
	int numForPledgor = 0;
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

function refreshContent() {
	window.location="CCDocTemp(sscmaker,corp&eng).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function addNew(){
    document.forms[0].event.value="add_cc_master";
    document.forms[0].submit();
}

function remove(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'removeID') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'removeID') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.removeID[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'removeID') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.removeID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
    if(temp==""){
        alert('Please select items to remove.');
        return false;
    }
	formObj.removeIndex.value=temp;
    document.forms[0].event.value="remove_item";
    document.forms[0].submit();
}

function submitPage() {
    var formObj = document.forms[0];
	var k = 0;
	var m = 0;
	var temp1 = "";
	var temp2 = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox'  && name == 'forBorrowerID') {
		k++;
	  }
 	  if(type == 'checkbox'  && name == 'forPledgorID'){
	    m++;
	  }
	}
    j = 0;
    n = 0;
    if( m > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox'  && name == 'forPledgorID') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
				temp2 = temp2 + "," + formObj.forPledgorID[n].value;
			}
			n++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'forPledgorID') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
				temp2 = temp2 + "," + formObj.forPledgorID.value;
			}
	      }
		}
	}
	
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox'  && name == 'forBorrowerID') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//			alert("up="+formObj.forBorrowerID[j].value);
				temp1 = temp1 + "," + formObj.forBorrowerID[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'forBorrowerID') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//			alert("down="+formObj.forBorrowerID.value);
				temp1 = temp1 + "," + formObj.forBorrowerID.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp1=temp1.substring(1);
	temp2=temp2.substring(1);
// 	alert('temp2=='+temp2);
// 	alert('temp1=='+temp1);
	formObj.mandatoryForBorrowerID.value=temp1;
	formObj.mandatoryForPledgorID.value=temp2;
    <% if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
    document.forms[0].event.value="update_cc_master";
    <% } else {%>
    document.forms[0].event.value="submit_cc_master";
    <% } %>
//	alert("flag for submiit "+document.forms[0].subFlag.value);
	if(document.forms[0].subFlag.value=="1") {
		document.forms[0].submit();
	}else{
		alert('There must be atleast one document item before submitting.');
		return false;
	}
}





//-->
</script>
<!-- InstanceEndEditable -->
</head>

<logic:present name="iTemplate" property="templateItemList" >
<script language="JavaScript" type="text/JavaScript">
   function checkedBorrowerAll(){ 
   var a =0;
	if(document.getElementById("list11").checked){
	for(var s=0;s<document.getElementsByName("forBorrowerID").length;s++){
	   document.getElementsByName("forBorrowerID")[s].checked=true;
	}
	}else{
	for(var s=0;s<document.getElementsByName("forBorrowerID").length;s++){
	   document.getElementsByName("forBorrowerID")[s].checked=false;
	}
	}
}

function checkedPledgorAll(){ 
   var a =0;
	if(document.getElementById("list22").checked){
	for(var s=0;s<document.getElementsByName("forPledgorID").length;s++){
	   document.getElementsByName("forPledgorID")[s].checked=true;
	}
	}else{
	for(var s=0;s<document.getElementsByName("forPledgorID").length;s++){
	   document.getElementsByName("forPledgorID")[s].checked=false;
	}
	}
}
function getPledgorNum(){
	var pledgorNum = document.getElementsByName("forPledgorID").length;
	return pledgorNum;
}
function getBorrowerNum(){
 	var borrowerNum = document.getElementsByName("forBorrowerID").length;
	return borrowerNum;
}
</script>
</logic:present>


<body>
<html:form action="CCMaster.do">
<input type="hidden" name="event" />
<input type="hidden" name="mandatoryForBorrowerID" />
<input type="hidden" name="mandatoryForPledgorID" />
<input type="hidden" name="removeIndex" />
<% if(isEdit){ %>
<input type="hidden" name="isEdit" value="true" />
<%}%>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3><%=law%> - <integro:empty-if-null value="<%=custType%>" /></h3></td>
      <td valign="bottom"><table width="160"  border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
            <td width="80" valign="baseline" align="center">
			<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
            </td>
          <td width="80" valign="baseline" align="center">
          <input type="button" name="Submit" value="Remove" class="btnNormal" onclick="remove()"/>
          </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
         <thead>
        <tr>
          <td rowspan="2" width="4%">S/N</td>
          <td colspan="2" >Mandatory</td>
          <td rowspan="2" >Code</td>
          <td rowspan="2" >Description</td>
          <td rowspan="2" ><bean:message key="label.cc.checklist.application.type"/></td>
	      <td rowspan="2" >Pre-Approval Document</td>
	      <td rowspan="2" >Document Version</td>
          <td rowspan="2" >Expiry Date</td>
          <td rowspan="2" >Delete</td>
        </tr>
        <tr>
          <td width="9%">Borrower<br><input type="checkbox" name="list11" id="list11" value="Check All" onClick="checkedBorrowerAll()"
              <%if((iTemplate.getTemplateItemList()==null)||(iTemplate.getTemplateItemList().length==0)){ %>disabled <%} %>/> Select All </td>
          <td width="9%">Chargor/<br>Pledgor/<br>Guarantor<br><input type="checkbox" name="list22" id="list22" onClick="checkedPledgorAll()"
          value="Check All" <%if((iTemplate.getTemplateItemList()==null)||(iTemplate.getTemplateItemList().length==0)){ %>disabled <%} %>/> Select All </td>
        </tr>
        </thead> <tbody>
		<logic:present name="iTemplate" property="templateItemList" >
   <logic:iterate id="OB" name="iTemplate"  property="templateItemList" type="com.integrosys.cms.app.chktemplate.bus.ITemplateItem"  >
<%  
 	
    String rowClass="";
    row++;
    if(row%2!=0){
       rowClass="odd";
    }else{
       rowClass="even";
    }
    boolean checked = false;
    if(OB.getIsMandatoryInd()){
        checked = true;
    }
    
    boolean checked1 = false;
    if(OB.getItem().getIsForBorrower()){
    	checked1 = true;
    	numBorrower++ ; 
    }
    boolean checked2 = false;
    if(OB.getItem().getIsForPledgor()){
    	checked2 = true;
    	numForPledgor++;
    }
    
    String isPreApprove = "N";
    if(OB.getItem().getIsPreApprove()){
    	isPreApprove = "Y";
    	
    }

   %>
   

        <tr class="<%=rowClass%>">
          <td class="index" height="18" ><%=row%></td>
          <td style="text-align:center" height="18">&nbsp;
           <%if(checked1){ %><input name="forBorrowerID" type="checkbox" id="forBorrower"
           <%if((getEvent.equals("edit_cc_master")&&OB.getIsMandatoryForBorrowerInd())||
        ((getEvent.equals("add_new_item"))&&OB.getIsMandatoryForBorrowerInd())||
        (getEvent.equals("remove_item")&&OB.getIsMandatoryForBorrowerInd())||
        ((getEvent.equals("edit_staging_template_item"))&&OB.getIsMandatoryForBorrowerInd())){%>checked <%} %>value=<%=row-1%> /><%} %>
          </td>
          <td style="text-align:center" height="18">&nbsp;
            <%if(checked2){ %><input name="forPledgorID" type="checkbox" id="forPledgor"
            <%if((getEvent.equals("edit_cc_master")&&OB.getIsMandatoryForPledgorInd())||
        ((getEvent.equals("add_new_item"))&&OB.getIsMandatoryForPledgorInd())||
        ((getEvent.equals("edit_staging_template_item"))&&OB.getIsMandatoryForPledgorInd())||
        (getEvent.equals("remove_item")&&OB.getIsMandatoryForPledgorInd())){%>checked <%} %> value=<%=row-1%> /><%} %>
          </td>
          <td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td>&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
          <td style="text-align:center">
          <%java.util.Iterator iter = OB.getItem().getCMRDocAppItemList().iterator(); 
          	while (iter.hasNext())
          	{
          		com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem docAppItem = (com.integrosys.cms.app.documentlocation.bus.IDocumentAppTypeItem) iter.next();
          %>
          	&nbsp;<integro:common-code display="true" categoryCode="APPLICATION_TYPE" descWithCode="false" entryCode="<%=docAppItem.getAppType()%>" />
          	<br>
          <%
          	}
          %>
          </td>
  			
          <td style="text-align:center">&nbsp;<%=isPreApprove %></td>
          <td style="text-align:center">&nbsp;<bean:write name="OB" property="item.documentVersion" /></td>
          <td>&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getItem().getExpiryDate())%></td>
          <td style="text-align:center" height="18" ><input name="removeID" type="checkbox" value="<%=(row-1)%>" /></td>
        </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="iTemplate" property="templateItemList" >
            <tr class="odd">
              <td colspan="9"><bean:message key="label.global.not.found"/></td>
            </tr>
</logic:notPresent>
<%if(iTemplate.getTemplateItemList()!=null){ %>
	<%if((iTemplate.getTemplateItemList().length==0)){ %>
				<tr class="odd">
	              <td colspan="9"><bean:message key="label.global.not.found"/></td>
	            </tr>
	<%} %>
<%} %>
<%if(row==0) { %> 
	<input type="hidden" name="subFlag" value="0" >
<% }else{ %>
	<input type="hidden" name="subFlag" value="1" >
<% }%>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<%if(ICMSConstant.STATE_REJECTED.equals(status)) { %>
<p/>
<p/>
<p/>
				<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="90"></textarea></td>
					</tr>
					<tr>
					  <td class="fieldname">Last Action By</td>
					  <td class="even">&nbsp;<%=lastActionBy%></td>
					</tr>
					<tr class="odd">
					  <td class="fieldname">Last Remarks Made</td>
					  <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
					</tr>
				  </tbody>
                </table>
<% } %>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
    <%if(ICMSConstant.STATE_REJECTED.equals(status)) { %>
    <td width="100" valign="baseline" align="center"> <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    <%}else{%>
    <td width="100" valign="baseline" align="center"> <a href="CCMaster.do?event=master_cc_list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
    <%}%> 
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
        <td width="100%" align="left"><span class="errormsg">*Expired item will not be shown</span></td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
