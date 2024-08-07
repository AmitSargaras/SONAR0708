<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
              	 com.integrosys.component.commondata.app.CommonDataSingleton,
              	 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    int sno = 0;
    List sAddTemplateList = (List)session.getAttribute("com.integrosys.cms.ui.facmaster.FacilityMasterAction.sAddTemplateList");
    String category=(String)request.getAttribute("facCategory");
    if(category==null)
    	category="";
    String system=(String)request.getAttribute("facSystem");
    System.out.println("system............"+system);
    if(system==null)
    	system="";
    String type=(String)request.getAttribute("facType");
    System.out.println("system............"+type);
    if(type==null)
    	type="";
    pageContext.setAttribute("facCategory",category);
    pageContext.setAttribute("facType",type);
    pageContext.setAttribute("facSystem",system);
    if(sAddTemplateList!=null){
        pageContext.setAttribute("sAddTemplateList",sAddTemplateList);
    }
    String event =(String)request.getParameter("event");
    System.out.println("##############$$$$$$$$$$$$$$$#############event="+event);
    String subType = request.getParameter("subType");
%>



<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html>
<head>

<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
}
</style>

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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}


function goCreate(lawCode,custTypeCode) {
    document.forms[0].event.value="create_cc_master";
    document.forms[0].lawCode.value=lawCode;
    document.forms[0].custTypeCode.value=custTypeCode;
    document.forms[0].submit();
}

function addItems(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	for (var i=0; i<formObj.elements.length; i++) {
      var type = formObj.elements[i].type;
      if (type == 'checkbox') {
		k++;
	  }
	}
    j = 0;
	if( k > 1) {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
	      if (type == 'checkbox') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.itemID[j].value);
				temp = temp + "," + formObj.itemID[j].value;
			}
			j++;
	      }
		}
	} else {
	    for (var i=0; i<formObj.elements.length; i++) {
		  var type = formObj.elements[i].type;
	      if (type == 'checkbox') {
	        var obj = formObj.elements[i];
		    if (obj.checked) {
//				alert(formObj.itemID.value);
				temp = temp + "," + formObj.itemID.value;
			}
	      }
		}
	}
//    alert('j'+j);
    if(temp==""){
        alert('Please select atleast one to save.');
        return false;
    }
	temp=temp.substring(1);
	//alert(temp);
	formObj.hiddenItemID.value=temp;
	<%if("add_facility_master_resubmit".equals(event)){%>
	document.forms[0].event.value="add_template_item_resubmit";
	<%}else{%>
	document.forms[0].event.value="add_template_item";
	<%}%>
	document.forms[0].submit();
}

function cancelBack(){
    var formObj = document.forms[0];
	var k = 0;
	var temp = "";
	formObj.hiddenItemID.value=temp;
	document.forms[0].event.value="add_template_item";
	document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<div id="xRateStore" style="display:none" class="userData"></div>
<html:form action="DocFacilityMaster" >
<input type="hidden" name="hiddenItemID" />
<input type="hidden" name="event" />
<input type="hidden" name="subType" value="<%=subType%>"/>

<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Facility (Facility)
         </h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead>
        <tr>
          <td width="3%">S/N</td>
          <td width="9%">Code</td>
          <td width="50%">Description</td>
          
           <td width="10%">Tenure</td>
          <td width="5%">Select</td>
        </tr>
        </thead> <tbody>
<logic:present name="sAddTemplateList">
   <logic:iterate id="OB" name="sAddTemplateList"  type="com.integrosys.cms.app.chktemplate.bus.DocumentSearchResultItem" >

   <%
       String rowClass="";
       sno++;
      if(sno%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }


//       OB.getI

   %>
        <tr class="<%=rowClass%>" >
          <td class="index" height="18" ><%=sno%></td>
          <td>&nbsp;<bean:write property="itemCode" name="OB"/></td>
          <td>&nbsp;<bean:write property="itemDesc" name="OB"/></td>
      	  <td>
          <%
          if(OB.getTenureCount()==0){
          %>&nbsp;<%}else{ %>
          <%=OB.getTenureCount()%> &nbsp;<integro:common-code-single  entryCode="<%=OB.getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" />
          <%} %>
          </td>
          <td style="text-align:center">
            <input type="checkbox" name="itemID" value="<%=OB.getItemID()%>" />
          </td>
        </tr>
</logic:iterate>
</logic:present>
<%if (sAddTemplateList==null){ %>
<tr class="odd">
<td colspan="6" ><bean:message key="label.global.not.found"/></td>
</tr>
<%} else if(sAddTemplateList.size()==0){%>
<tr class="odd">
<td colspan="6" ><bean:message key="label.global.not.found"/></td>
</tr>
<%}%>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                      <tr>
                        <td width="100" valign="baseline" align="center"> <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)" onClick ="addItems()" ><img src="img/save1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                        </td>
                        <td width="100" valign="baseline" align="center"> <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)" onClick ="cancelBack()"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>

<!-- InstanceEndEditable -->
<html:hidden property="subTypeDesc"/>
</html:form>
</body>
<!-- InstanceEnd --></html>
