<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.main.trx.titledocument.ITitleDocumentTrxValue,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument,
                 java.util.HashMap,
                 java.util.Collection,
                 com.integrosys.cms.ui.commodityglobal.CommodityGlobalConstants,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.ui.commodityglobal.titledocument.list.TitleDocumentListAction,
                 java.util.List,
                 java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/titledocument/list/update_titledocument_list.jsp,v 1.9 2006/10/27 08:42:06 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.9 $
    * Date: $Date: 2006/10/27 08:42:06 $
    * Tag: $Name:  $
    */
%>
<%
    ITitleDocumentTrxValue trxValue = (ITitleDocumentTrxValue)session.getAttribute("com.integrosys.cms.ui.commodityglobal.titledocument.TitleDocumentAction.titleDocumentTrxValue");
    HashMap titleDocObj = (HashMap)session.getAttribute("com.integrosys.cms.ui.commodityglobal.titledocument.TitleDocumentAction.titleDocumentObj");
    List titledocNonNeg = new ArrayList();
    List titledocNeg = new ArrayList();

    titledocNonNeg = (List)titleDocObj.get("stageTitleDocNonNeg");
    titledocNeg = (List)titleDocObj.get("stageTitleDocNeg");

    String[] uneditableDoc = CommodityConstant.TITLEDOCUMNETS_FROZEN;
%>


<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>


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

function addDocument(index) {
    if (index == 1) {
        document.forms[0].type.value = "<%=CommodityGlobalConstants.NON_NEGOTIABLE_DOCUMENT%>";
    }
    if (index == 2) {
        document.forms[0].type.value = "<%=CommodityGlobalConstants.NEGOTIABLE_DOCUMENT%>";
    }

    document.forms[0].event.value = "prepare_add";
    document.forms[0].indexID.value = "-1";

    document.forms[0].submit();
}

function deleteDocument(index) {
    if (index == 1) {
        var nonNegObj = document.forms[0].chkDeletesNonNeg;
        var valid = false;
       if(nonNegObj!=null){
        if (!nonNegObj.length) {
            valid = nonNegObj.checked;
        } else {
            for (i = 0; i < nonNegObj.length; i++) {
                if (nonNegObj[i].checked) {
                    valid = true;
                }
            }
        }
       }else{
           alert('At least one Non-Negotiable documentation must be checked');
            return false;
       }

        if (!valid) {
            alert('At least one Non-Negotiable documentation must be checked');
            return false;
        }
        document.forms[0].type.value = "<%=CommodityGlobalConstants.NON_NEGOTIABLE_DOCUMENT%>";
    }
    if (index == 2) {
        var negObj = document.forms[0].chkDeletesNeg;
        var valid = false;
        if(negObj!=null){
        if (!negObj.length) {
                valid = negObj.checked;
        } else {
            for (i = 0; i < negObj.length; i++) {
                if (negObj[i].checked) {
                    valid = true;
                }
            }
        }
        }else{ 
            alert('At least one Negotiable documentation must be checked');
            return false;
        }
        if (!valid) {
            alert('At least one Negotiable documentation must be checked');
            return false;
        }
        document.forms[0].type.value = "<%=CommodityGlobalConstants.NEGOTIABLE_DOCUMENT%>";
    }
    document.forms[0].event.value = "<%=TitleDocumentListAction.EVENT_DELETE%>";

    document.forms[0].submit();
}

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=TitleDocumentListAction.EVENT_SUBMIT%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=TitleDocumentListAction.EVENT_UPDATE%>";
    }
    document.forms[0].submit();
}

function editItem(index, docType) {
    document.forms[0].event.value = "edit_item";
    document.forms[0].indexID.value = index;
    if (docType == 1) {
        document.forms[0].type.value = "<%=CommodityGlobalConstants.NON_NEGOTIABLE_DOCUMENT%>";
    }
    if (docType == 2) {
        document.forms[0].type.value = "<%=CommodityGlobalConstants.NEGOTIABLE_DOCUMENT%>";
    }

    document.forms[0].submit();
}
//-->
</script>

<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/submit2.gif','img/cancel2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p><br>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="TitleDocumentList.do">
<input type="hidden" name="type"/>
<input type="hidden" name="event" value="<%=TitleDocumentListAction.EVENT_SUBMIT%>"/>
<input type="hidden" name="indexID"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>Maintain Commodity Title Documentation</h3></td>
    </tr>
  </thead>
  <tbody>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td width="58%"> <h3>Non-Negotiable Documentation</h3></td>
      <td width="42%" valign="bottom">
          <table width="160"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="80" valign="baseline" align="center">
                <input name="Submit2" type="button" class="btnNormal" value="Add New" onclick="javascript:addDocument(1)"/>
            </td>
            <td width="80" valign="baseline" align="center">
                <input name="Submit2" type="button" class="btnNormal" value="Delete" onclick="javascript:deleteDocument(1)"/>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="4%">S/N</td>
              <td width="82%">Documentation Description&nbsp;<font color="#00AAFF">* </font></td>
              <td width="6%">Action</td>
              <td width="8%">Remove</td>
            </tr>
          </thead>
          <tbody>
            <%
                if (titledocNonNeg == null || titledocNonNeg.size() == 0) {
            %>
          <tr class="odd">
          <td colspan="4">
          There is no Non-Negotiable Documentation
          </td>
          </tr>
          <%
                } else {
                    for (int i = 0; i <titledocNonNeg.size(); i++) {
                        String docName = ((ITitleDocument)titledocNonNeg.get(i)).getName().trim().toUpperCase();
                        boolean editable = true;
                        if (uneditableDoc != null) {
                            for (int j = 0; j < uneditableDoc.length && editable; j++) {
                                if (docName.equals(uneditableDoc[j].trim().toUpperCase())) {
                                    editable = false;
                                }
                            }
                        }
          %>
            <tr class="<%=i%2==0?"odd":"even"%>">
              <td width="4%" class="index" style="text-align:center"><%=i + 1%></td>
              <td width="82%"><integro:empty-if-null value="<%=((ITitleDocument)titledocNonNeg.get(i)).getName()%>"/></td>
              <td width="6%" style="text-align:center">
              <% if (editable) { %>
                <a href="javascript:editItem(<%=i%>, 1)">Edit</a>
              <% } else { %>-<% } %>
              </td>
              <td width="8%" style="text-align:center">
              <% if (editable) { %>
                <html:multibox property="chkDeletesNonNeg" value="<%=String.valueOf(i)%>"/>
              <% } else { %>-<% } %>
              </td>
            </tr>
          <%  } } %>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Negotiable Documentation</h3></td>
      <td valign="bottom"><table width="160"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="80" valign="baseline" align="center">
                <input name="Submit2" type="button" class="btnNormal" value="Add New" onclick="javascript:addDocument(2)"/>
            </td>
            <td width="80" valign="baseline" align="center">
                <input name="Submit2" type="button" class="btnNormal" value="Delete" onclick="javascript:deleteDocument(2)"/>
            </td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="4%">S/N</td>
              <td width="82%">Documentation Description&nbsp;<font color="#00AAFF">* </font></td>
              <td width="6%">Action</td>
              <td width="8%">Remove</td>
            </tr>
          </thead>
          <tbody>
          <%
              if (titledocNeg == null || titledocNeg.size() == 0) {
          %>
          <tr class="odd">
          <td colspan="4">
          There is no Negotiable Documentation
          </td>
          </tr>
          <%
                } else {
                    for (int i = 0; i <titledocNeg.size(); i++) {
                        String docName = ((ITitleDocument)titledocNeg.get(i)).getName().trim().toUpperCase();
                        boolean editable = true;
                        if (uneditableDoc != null) {
                            for (int j = 0; j < uneditableDoc.length && editable; j++) {
                                if (docName.equals(uneditableDoc[j].trim().toUpperCase())) {
                                    editable = false;
                                }
                            }
                        }
          %>
            <tr class="<%=i%2==0?"odd":"even"%>">
              <td width="4%" class="index" style="text-align:center"><%=i + 1%></td>
              <td width="82%"><integro:empty-if-null value="<%=((ITitleDocument)titledocNeg.get(i)).getName()%>"/></td>
              <td width="6%" style="text-align:center">
              <% if (editable) { %>
                <a href="javascript:editItem(<%=i%>, 2)">Edit</a>
              <% } else { %>-<% } %>
              </td>
              <td width="8%" style="text-align:center">
              <% if (editable) { %>
                <html:multibox property="chkDeletesNeg" value="<%=String.valueOf(i)%>"/>
              <% } else { %>-<% } %>
              </td>
            </tr>
            <%
                    }}
            %>
          </tbody>
        </table></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
  </tbody>
</table>
<%  String colspan= "2";
    if (trxValue != null && trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) {
        colspan="3";
%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
    <tr>
        <td class="fieldname" width="39%">Remarks</td>
        <td class="odd" width="61%"><html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="remarks"/>
        </td>
    </tr>
    <tr>
        <td class="fieldname">Last Action By</td>
        <td class="even"><%=trxValue!=null?trxValue.getUserInfo():""%>&nbsp;</td>
    </tr>
    <tr class="odd">
        <td class="fieldname">Last Remarks Made</td>
        <td><% if (trxValue != null) { %>
            <integro:wrapper value="<%=trxValue.getRemarks()%>"/>
            <% } %>&nbsp;
       </td>
    </tr>
    </tbody>
</table>
<% } else if (ICMSConstant.STATE_DRAFT.equals(trxValue.getStatus())) { colspan="3"; }%>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="<%=colspan%>">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
              ICMSConstant.STATE_DRAFT.equals(trxValue.getStatus())) {
  %>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image41" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','img/save2.gif',1)"><img src="img/save1.gif" name="Image31" border="0" id="Image3" /></a></td>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } else { %>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image41" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image31','','img/save2.gif',1)"><img src="img/save1.gif" name="Image31" border="0" id="Image3" /></a></td>
    <% } %>
  </tr>
  <tr>
    <td colspan="<%=colspan%>">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>
