<%@page import="java.util.List"%>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 java.util.*,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/global_doc_checklist.jsp,v 1.8 2006/10/27 08:13:10 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.8 $
 * @since $Date: 2006/10/27 08:13:10 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.recurrentMaster.RecurrentGlobalAction.searchResult");
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
	pageContext.setAttribute("globalDocChkList", resultList);
}else{
	pageContext.setAttribute("globalDocChkList", new ArrayList());
}
int startIndex=0;
String ind= (String) request.getAttribute("startIndex");
if( ind == null || ind.equals("null")||"".equals(ind))
	startIndex=0;
else 
	 startIndex = Integer.parseInt(ind);
// pageContext.setAttribute("customerList",customerList);
int rowIdx = 0;

// System.out.println("value of records_per_page"+records_per_page);
    String sview = (String) session.getAttribute("com.integrosys.cms.ui.recurrentMaster.RecurrentGlobalAction.sview");
    boolean viewOnly = false;
    if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
        viewOnly=true;
    }else{
    	if(sview!=null && sview.equals("view")){
            viewOnly=true;
        }
    }
      String event = request.getParameter("event");
      String statDesc=(String)request.getAttribute("statDesc");
      String statType=(String)request.getAttribute("statType");
      if(null==statDesc||"null".equalsIgnoreCase(statDesc))
    	  statDesc="";
      List recurrentStatTypeList = (List)session.getAttribute("com.integrosys.cms.ui.recurrentMaster.RecurrentGlobalAction.recurrentStatTypeList");
  	pageContext.setAttribute("recurrentStatTypeList",recurrentStatTypeList);
%>

    
    
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="java.util.ArrayList"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function refreshContent() {
	window.location="CCDocTemp(sscmaker,corp&eng).htm";
	//parent.location=".htm";
}

function gotopage(aLocation) {
	window.location = aLocation ;
}

function MM_jumpMenu(selObj,docTrxID,startIndex){
	//v3.0
 
  
  if(selObj.selectedIndex == 0){
    return ;
  }
  if(selObj.selectedIndex == 'view'){
	    document.forms[0].event.value="view_doc_item";
	    document.forms[0].docTrxID.value=docTrxID;
	    document.forms[0].startIndex.value=startIndex;
	    document.forms[0].submit();
  }
  if(selObj.selectedIndex == 2){
    document.forms[0].event.value="edit_doc_item";
    document.forms[0].docTrxID.value=docTrxID;
    document.forms[0].startIndex.value=startIndex;
    document.forms[0].submit();
  }
  if(selObj.selectedIndex == 1){
	    document.forms[0].event.value="view_doc_item";
	    document.forms[0].docTrxID.value=docTrxID;
	    document.forms[0].startIndex.value=startIndex;
	    document.forms[0].submit();
	  }

  if(selObj.selectedIndex == 3){
	    document.forms[0].event.value="prepare_delete_doc_item";
	    document.forms[0].docTrxID.value=docTrxID;
	    document.forms[0].startIndex.value=startIndex;
	    document.forms[0].submit();
	  }

}

function disableEnterKey(e)
{
     var key;
     if(window.event)
          key = window.event.keyCode;     //IE
     else
          key = e.which;     //firefox
     if(key == 13)
          return false;
     else
          return true;
}

function getRecList(){
	var type=document.getElementById('statType').value;
	document.forms[0].action="RecurrentGlobal.do?event=global_list&go=Y&statType="+type;
    document.forms[0].submit();
}

function goToPage() {
    document.forms[0].event.value="prepare_create_doc_item";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="RecurrentGlobal.do">
<input type="hidden" name="event" />
<input type="hidden" name="docTrxID" />
<input type="hidden" name="startIndex" />
<%
if(viewOnly){
	%>
	
	<input type="hidden" name="view" value="view" />
	<%
	}
%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:10px">
 <THEAD><TR><TD colSpan=4 width="100%">Please enter search criteria</TD></TR></THEAD>
                        <tr>
                        <td  class="fieldname" >Statement Description</td>
                        <td >
                        <input type="text" id="statDesc" value="<%=statDesc %>"  name="statDesc" onKeyPress="return disableEnterKey(event)"/>						
                         <html:errors property="itemDescError" />
                       </td>
                       <td class="fieldname" >Statement Type</td>
                       <td>
                        <select  id="statType">
												<option value=""> Please Select </option>
                        <%
                         if(null!=statType||!"".equalsIgnoreCase(statType)){
                         for(int i=0;i<recurrentStatTypeList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)recurrentStatTypeList.get(i);
                         if(labelValueBean.getValue().equals(statType)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="recurrentStatTypeList" labelProperty="label" property="value"  />
                           <%} %>
									                    </select>
                        </td>
                        </tr>
                       <tr> <td colspan="4" width="20%"><center><input class=btnNormal style="margin-left:50px;height:30px; WIDTH: 70px;"  type="button" value="Go" onclick='getRecList()'></center></td></tr>
</table>                        
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global Recurrent Document Template</h3></td>
      <%if(!viewOnly){%>
            <td width="10%" valign="baseline" align="right"> <input type="button" value="Add New" class="btnNormal" onclick="goToPage()"/>
            </td>
        <%}%>
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
          <td width="4%">S/N</td>
          <td width="11%">Code</td>
          <td width="30%">Description</td>
<!--           <td width="10%">Document Frequency</td>-->
		   <td width="10%">Status</td>
          <td width="30%">Statement Type</td>
          <td width="30%">Due Date</td>
				<td width="15%">Action</td>
       
        </tr>
        </thead>
        <tbody>
        <%int counter1 = 0; %>
<logic:present name="globalDocChkList">
   <logic:iterate id="OB" name="globalDocChkList"  type="com.integrosys.cms.app.chktemplate.bus.DocumentSearchResultItem" scope="page" length="10" offset="<%=String.valueOf(startIndex)%>" >
   <%
       String rowClass="";
   counter1++;
      if(counter1%2!=0){
           rowClass="odd";
       }else{
           rowClass="even";
       }

   %>

        <tr class="<%=rowClass%>">
          <td class="index" height="18" ><%=counter1+startIndex%></td>
          <td >&nbsp;<bean:write property="itemCode" name="OB"/></td>
          <td height="18" >&nbsp;<bean:write property="itemDesc" name="OB"/></td>
        <%--  <td>
          <%if(OB.getTenureCount()==0){
          %>&nbsp;<%}else{ %>
          <%=OB.getTenureCount()%> &nbsp;<integro:common-code-single  entryCode="<%=OB.getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" />
          <%} %>
          </td>
            --%>
             
        <td ><%if(OB.getStatus().trim().equalsIgnoreCase("ENABLE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
          <td ><integro:common-code-single 
                                    		categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE%>" entryCode="<%=OB.getStatementType() %>" descWithCode="false" display="true"/>
                                   &nbsp;</td>
           <td>
           &nbsp;
           <integro:date object="<%=OB.getExpiryDate() %>"></integro:date>
           </td>                        
          <td style="text-align:center">
            <select name="menu1" onchange="MM_jumpMenu(this,'<%=OB.getTrxID()%>','<%=startIndex %>')">
              <option value="0" selected>Please Select</option>
			
			  <option  value="view">View</option>
			  
			    <%if(!viewOnly){%>
			 
                <option value="edit">Edit</option>
                <option value="delete">Delete</option>
                
              <% }%>
            </select>
          </td>
         
        </tr>
</logic:iterate>
</logic:present>
<%if(counter1 == 0) { %>
<tr class="odd">
<td colspan='<%=viewOnly?"7":"8"%>' ><bean:message key="label.global.not.found"/></td>
</tr>
<% }%>

  </tbody>
</table>
</td>
</tr>
		<% if(searchResult != null && searchResult.getNItems() != 0) {%>
				<tr >
				    <td height="25" colspan="2">
				        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
				            <tr>
				            <%
				            String url="RecurrentGlobal.do?event=paginate&type=REC&go=N&startIndex=";
				            %>
				            
				                <td valign="middle">
				                    <integro:pageindex pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
				                            url="<%=url %>" />
				                </td>
				            </tr>
				        </table>
				    </td>
				</tr>
				<%} %>			
</tbody>
</table>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
