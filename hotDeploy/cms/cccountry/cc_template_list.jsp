<%@ page import="java.util.ArrayList,
                 java.util.List,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.cccountry.CCCountryForm,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 java.util.Iterator,
                 com.integrosys.cms.app.chktemplate.trx.ITemplateTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.ITemplate,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.ITemplate" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    ITemplateTrxValue itemTrxVal = (ITemplateTrxValue) session.getAttribute("com.integrosys.cms.ui.cccountry.CCCountryAction.itemTrxVal");
    ITemplate iTemplate = (com.integrosys.cms.app.chktemplate.bus.ITemplate) session.getAttribute("com.integrosys.cms.ui.cccountry.CCCountryAction.template");
    String remarks = "";
    String lastActionBy = "";
    String custType = "-";
    String law = CommonDataSingleton.getCodeCategoryLabelByValue("APP_LAW", iTemplate.getLaw());
    if (iTemplate != null) {
        pageContext.setAttribute("iTemplate", iTemplate);
        custType = iTemplate.getLegalConstitution();
        custType = CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.LEGAL_CONSTITUTION, custType);
    }
    int row = 0;
    String status = "";
    if (itemTrxVal != null) {
        status = itemTrxVal.getStatus();
        remarks = itemTrxVal.getRemarks();
        lastActionBy = itemTrxVal.getUserInfo();
    }
    if (lastActionBy == null) lastActionBy = "";
    if (remarks == null) remarks = "";

    String cCode = "";
    String cName = "";
    if (iTemplate != null) {
        cCode = iTemplate.getCountry();
        CountryList cList = CountryList.getInstance();
        cName = cList.getCountryName(cCode);
    }
    if (cName.equals("")) {
        CCCountryForm aForm = (CCCountryForm) request.getAttribute("CCCountryForm");
        cName = aForm.getCountryName();
    }
	
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
	window.location="CCDocTemp(sscmaker,cty=hk).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function addNew(){
    document.forms[0].event.value="add_template_list";
    document.forms[0].submit();
}

function create(){
    document.forms[0].event.value="create_item";
    document.forms[0].submit();
}

function edit(ind) {
	document.forms[0].event.value="edit_item";
	document.forms[0].index.value=ind;
	document.forms[0].submit();
}

function remove() {
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
    if(temp=="") {
        alert('Please select the records to remove.');
        return false;
    }
    temp=temp.substring(1);
    formObj.event.value="remove";
	formObj.removeIndex.value=temp;
    formObj.submit();

}

function formCheck1(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check1') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check1') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check1[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check1') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check1.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.mandatoryForBorrowerRows.value=temp;
}

function formCheck5(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check5') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check5') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
				temp = temp + "," + formObj.check5[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check5') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
				temp = temp + "," + formObj.check5.value;
			}
	      }
		}
	}
	temp=temp.substring(1);
	formObj.mandatoryForPledgorRows.value=temp;
}

function formCheck2() {
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check2') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check2[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check2.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.checkedInVault.value=temp;
}

function formCheck3() {
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check3') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check3') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check3[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check3') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check3.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.checkedExtCustodian.value=temp;
}
function formCheck4() {
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check4') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check4') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				temp = temp + "," + formObj.check4[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check4') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID.value);
				temp = temp + "," + formObj.check4.value;
			}
	      }
		}
	}
//    alert('j'+j);
	temp=temp.substring(1);
//    alert(temp);
	formObj.checkedAudit.value=temp;
}

function checkMutEx(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      var name = formObj.elements[i].name;
      if (type == 'checkbox' && name == 'check2') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
          if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.removeID[j].value);
				if(formObj.check3[j].checked) {
					alert('InVault and Ext Custodian are Mutually Excluisve');
					return false;
				}
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
          var name = formObj.elements[i].name;
	      if (type == 'checkbox' && name == 'check2') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
				if(formObj.check3.checked) {
					alert('InVault and Ext Custodian are Mutually Excluisve');
					return false;
				}
			}
	      }
		}
	}
	return true;

}


function submitForm() {
        formCheck1();
        formCheck2();
        formCheck4();
        formCheck5();
        <% if(ICMSConstant.STATE_REJECTED.equals(status)){ %>
        document.forms[0].event.value="update";
        <% } else {%>
        document.forms[0].event.value="submit";
        <% } %>
		if(document.forms[0].subFlag.value=="1") {
			document.forms[0].submit();
		}else{
			alert('There must be atleast one document item before submitting.');
			return false;
		}

//        document.forms[0].submit();
    
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<html:form action="CCCountry" >
<input type="hidden" name="event" />
<%-- for check boxes--%>
<input type="hidden" name="mandatoryForBorrowerRows" />
<input type="hidden" name="mandatoryForPledgorRows" />
<input type="hidden" name="checkedInVault" />
<input type="hidden" name="checkedExtCustodian" />
<input type="hidden" name="checkedAudit" />

<input type="hidden" name="removeIndex" />
<input type="hidden" name="index" />


<%--to display correct country name--%>
<html:hidden property="countryCode" />
<html:hidden property="countryName" />

<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td width="90%"> <h3>&nbsp;<%=law%> - <%=custType%> - (<%=cName%>)</h3></td>
      <td valign="bottom"><table width="160"  border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
            <td width="80" valign="baseline" align="center">
			<input type="button" name="Submit2" value="Create" class="btnNormal" onclick="create()"/>
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
              <td rowspan="2" width="3%">S/N</td>
              <td colspan="2" width="8%">Mandatory</td>
	          <td colspan="2" width="8%">Type</td>
              <td rowspan="2" width="6%">Code</td>
              <td rowspan="2" width="50%">Description</td>
              <td rowspan="2" width="3%"><bean:message key="label.cc.checklist.application.type"/></td>
              <td rowspan="2" width="3%">Pre-Approval Document</td>
              <td rowspan="2" width="3%">In Vault</td>
              <td rowspan="2" width="3%">Audit</td>
              <td rowspan="2" width="7%">Expiry Date</td>
              <td rowspan="2" width="4%">Action</td>
              <td rowspan="2" width="4%">Delete</td>
            </tr>
            <tr>
          		<td>Borrower</td>
          		<td>Chargor/<br>Pledgor/<br>Guarantor</td>
          		<td>Borrower</td>
          		<td>Chargor/<br>Pledgor/<br>Guarantor</td>
       	 	</tr>
          </thead>
          <tbody>
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
    boolean inherited = false;
    boolean fromGlobal = false;
    boolean mandatoryForBorrowerInd = false;
    boolean mandatoryForPledgorInd = false;
    boolean inVault = false;
    boolean extCustodian = false;
    boolean audit = false;

    if(OB.isInherited()){
        inherited = true;
    }
    if(OB.isFromGlobal()){
        fromGlobal = true;
    }
    if(OB.getIsInVaultInd()){
        inVault = true;
    }
    if(OB.getIsExtCustInd()){
        extCustodian = true;
    }
    if(OB.getIsAuditInd()){
        audit = true;
    }
    String isApproval = "N";
    if(OB.getItem().getIsPreApprove()){
    	isApproval = "Y";	
    }
	if(OB.getIsMandatoryForBorrowerInd()){
		mandatoryForBorrowerInd = true;
	}
	if(OB.getIsMandatoryForPledgorInd()){
		mandatoryForPledgorInd = true;
	}
   %>
        <tr class="<%=rowClass%>">
          <td class="index" ><%=row%></td>
          <td style="text-align:center">&nbsp;
            <%if(mandatoryForBorrowerInd && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <%if(OB.getItem().getIsForBorrower()){ %>
            <input type="checkbox" name="check1" value="<%=row-1%>" <%if(mandatoryForBorrowerInd){%> checked <%} %> />
            <%} }%>
          </td>
          <td style="text-align:center">&nbsp;
            <%if(mandatoryForPledgorInd && inherited){ %><img src="img/tick(black).gif" width="18" height="16" border="0" /><%}else if(!inherited){%>
            <%if(OB.getItem().getIsForPledgor()){ %>
            <input type="checkbox" name="check5" value="<%=row-1%>" <%if(mandatoryForPledgorInd){%> checked <%} %> />
            <%} }%>
          </td>
          <td style="text-align:center">&nbsp;<%=(OB.getItem().getIsForBorrower()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td style="text-align:center">&nbsp;<%=(OB.getItem().getIsForPledgor()) ? ICMSConstant.TRUE_VALUE : ICMSConstant.FALSE_VALUE%></td>
          <td >&nbsp;<bean:write name="OB" property="item.itemCode" /></td>
          <td height="18" >&nbsp;<bean:write name="OB" property="item.itemDesc" /></td>
          <td style="text-align:center" nowrap>
          <%Iterator iter = OB.getItem().getCMRDocAppItemList().iterator(); 
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
  			
          <td style="text-align:center"><%=isApproval %></td>
          <td style="text-align:center"><input type="checkbox" name="check2" value="<%=row-1%>" <%if(inVault){ out.print(" checked "); }%> /></td>
          <td style="text-align:center"><input type="checkbox" name="check4" value="<%=row-1%>" <%if(audit){ out.print(" checked "); }%>/></td>
          <td height="18" >&nbsp;<%=DateUtil.formatDate("dd/MMM/yyyy",OB.getItem().getExpiryDate())%></td>
          <td style="text-align:center">&nbsp;
          <%if(!(inherited || fromGlobal)) { %>
            <a href="#" onClick="edit('<%=(row-1)%>')">Edit</a>
            <% } %>
          </td>
          <td style="text-align:center" height="18" >&nbsp;
          <%if(!(inherited || fromGlobal)) { %>
            <input name="removeID" type="checkbox" value="<%=(row-1)%>" />
          <% } %>
          </td>
        </tr>
</logic:iterate>
</logic:present>
<logic:notPresent name="iTemplate" property="templateItemList" >
            <tr class="odd">
              <td colspan="13">There is no document</td>
            </tr>
</logic:notPresent>
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
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
				  <tbody>
					<tr>
					  <td class="fieldname">Remarks</td>
					  <td class="odd"><textarea name="remarks" rows="4" cols="120"></textarea></td>
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
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)" onClick="submitForm()" ><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
    <td width="100" valign="baseline" align="center"> <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)" ><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>

<% }else{ %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100" valign="baseline" align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)" onClick="submitForm()" ><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" /></a></td>
    <td width="100" valign="baseline" align="center"> <a href="CCCountry.do?event=cancel&countryCode=<%=cCode%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)" ><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
    </td>
  </tr>
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
</table>


<% }%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tr>
        <td width="100%" align="left"><span class="errormsg">*Expired item will not be shown</span></td>
    </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
