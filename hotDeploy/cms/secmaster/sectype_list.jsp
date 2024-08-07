<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.IDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.CollateralSubTypeSearchResultItem"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/secmaster/sectype_list.jsp,v 1.4 2006/10/27 08:47:34 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.4 $
 * @since $Date: 2006/10/27 08:47:34 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    boolean viewOnly = false;
  if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
      viewOnly=true; 
  }
  
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<script language="JavaScript" src="js/itgTwoCombo.js"></script>

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" -->
<style>
table.tblInfo tbody tr td.fieldname {
	width : 150px;
}
</style>


<script>
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function showType(secType,secTypeDesc){
  //       alert(secTypeDesc);
	    document.forms[0].secTypeDesc.value=secTypeDesc;
	    document.forms[0].event.value="show_subtype_list";
	    document.forms[0].submit();

}

function gotopage(aLocation) {
	window.location = aLocation;
}
function goCreate(){
document.forms[0].event.value="create_template_item";
document.forms[0].submit();
}
function goView(subType,subTypeDesc,trxID){
document.forms[0].subType.value=subType;
document.forms[0].subTypeDesc.value=subTypeDesc;
document.forms[0].custTypeTrxID.value=trxID;
document.forms[0].event.value="view_template_item";
document.forms[0].submit();
}



function createEdit(subType,subTypeDesc,trxID){
document.forms[0].subType.value=subType;
document.forms[0].subTypeDesc.value=subTypeDesc;
// alert("subType=="+subType);
// alert("subTypeDesc="+subTypeDesc);
if(trxID=="" || trxID.length == 0 || trxID == "null"){
    goCreate();
}else{
document.forms[0].event.value="edit_template_item";
document.forms[0].secTrxID.value=trxID;
document.forms[0].submit();
}
}

function rightAction(viewOnly){
var list=document.getElementById('subTypeList').value;
var currentTagTokens = list.split( "*" );

var subType = "";
var subTypeDesc = "";
var trxID = "";
var isNew ;
var isEditAllowed ;


isNew = currentTagTokens[ 0 ];
isEditAllowed = currentTagTokens[ 1 ];
subType = currentTagTokens[ 2 ];
subTypeDesc = currentTagTokens[ 3 ];
trxID = currentTagTokens[ 4 ];
  //alert(trxID+','+isNew+','+isEditAllowed+','+subType+','+subTypeDesc+','+viewOnly);

if(isNew=='true'){
         if(viewOnly==false){
     	     createEdit(subType,subTypeDesc,trxID);
         }else{
             alert('This security master template ('+subTypeDesc+') is not yet maintained');
         }
    }else{
         if(isEditAllowed=='true'){
             if(viewOnly==false){
                createEdit(subType,subTypeDesc,trxID);
             }else{
                goView(subType,subTypeDesc,trxID);
             }
         }else{
             goView(subType,subTypeDesc,trxID); 
         }
    }
}


//-->
</script>

 <!-- InstanceEndEditable -->
</head>

<body>
<html:form action="SecurityMaster">
<input type="hidden" name="event" />
<input type="hidden" name="secTypeDesc" />
<input type="hidden" name="subType" />
<input type="hidden" name="secTrxID" />
<input type="hidden" name="custTypeTrxID" />
<%if(viewOnly){%>
<input type="hidden" name="view" value="view">
<%}%>
<input type="hidden" name="subTypeDesc"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td style="padding-left:5"><h3> Collateral Doc Template</h3>
      <hr></td>
  </tr>
  <tr>
    <td><form name="selectcol" method="post" action="">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
          <tr class="even">
              <td width="22%" class="fieldname">Collateral Type</td>
              <td width="78%">
			  <html:select property="secType" onchange="showType(this.value,secType[secType.selectedIndex].text)" >
                <html:option value="pleaseSelect" >Please Select </html:option>
				<html:options name="secTypeValue" labelName="secTypeLabel"/>
			  </html:select>
              </td>
            </tr> 
            <tr class="odd">
              <td width="22%" class="fieldname">Collateral SubType</td>
              <td width="78%">

			<logic:present name="colSubTypeList">
				<select id="subTypeList" onchange="rightAction(<%=viewOnly%>)">
	                <option value="pleaseselect" >Please Select </option>
	                <logic:present name="colSubTypeList">
	   				   <logic:iterate id="OB" name="colSubTypeList"  type="com.integrosys.cms.app.chktemplate.bus.CollateralSubTypeSearchResultItem" > 
	   				    <option value="<%=(OB.isNew()+"*"+OB.isEditAllowed()+"*"+OB.getCollateralSubTypeCode()+"*"+OB.getCollateralSubTypeDesc()+
	   				    "*"+OB.getTrxID())%>"  ><%= OB.getCollateralSubTypeDesc()%></option>
	   				   </logic:iterate>
					</logic:present>
				  </select>
			  </logic:present>

			  <logic:notPresent name="colSubTypeList">
				  <select>
				  <option>Please Select </option>
				  </select>
			  </logic:notPresent>
              </td>
            </tr>

          </tbody>
        </table>
      </form></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>
