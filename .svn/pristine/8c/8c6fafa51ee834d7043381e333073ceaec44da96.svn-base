<%@page import="java.util.List"%>
<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.CommonCodeList,
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
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%


SearchResult searchResult = (SearchResult) session.getAttribute("com.integrosys.cms.ui.cam.CAMGlobalAction.searchResult");
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
System.out.println("////////////////////********************** IND:-"+ind);
if( ind == null || ind.equals("null")||"".equals(ind))
	startIndex=0;
else 
	 startIndex = Integer.parseInt(ind);
// pageContext.setAttribute("customerList",customerList);
int rowIdx = 0;


 
   
   String sview = (String) session.getAttribute("com.integrosys.cms.ui.cam.CAMGlobalAction.sview");
    boolean viewOnly = false;
    if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
        viewOnly=true;
    }else{
    	if(sview!=null && sview.equals("view")){
            viewOnly=true;
        }
    }
      String event = request.getParameter("event");
      String camDocCode=(String)request.getAttribute("camDocCode");
      String camDocDesc=(String)request.getAttribute("camDocDesc");
      String camDocTenureCount=(String)request.getAttribute("camDocTenureCount");
      String camDocTenureType=(String)request.getAttribute("camDocTenureType");
      if(null==camDocCode||"null".equalsIgnoreCase(camDocCode))
    	  camDocCode="";
      if(null==camDocDesc||"null".equalsIgnoreCase(camDocDesc))
    	  camDocDesc="";
      if(null==camDocTenureCount||"null".equalsIgnoreCase(camDocTenureCount))
    	  camDocTenureCount="";
      List tenureTypeList = (List)session.getAttribute("com.integrosys.cms.ui.cam.CAMGlobalAction.tenureTypeList");
  	pageContext.setAttribute("tenureTypeList",tenureTypeList);
%>

    
    

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

function getRecList(){
	var camDocCode=document.getElementById('camDocCode').value;
	var camDocDesc=document.getElementById('camDocDesc').value;
	var camDocTenureCount=document.getElementById('camDocTenureCount').value;
	var camDocTenureType=document.getElementById('camDocTenureType').value;
	document.forms[0].action="CAMGlobal.do?event=global_list&go=Y";
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
<html:form action="CAMGlobal.do">
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
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
    <tr><td colspan="2">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:10px">
 <THEAD><TR><TD colSpan=4 width="100%">Please enter search criteria</TD></TR></THEAD>
                        <tr><td class="fieldname" >Document Code</td>
                        <td >
                        <html:text property="camDocCode" value="<%= camDocCode %>" styleId='camDocCode'/>
                        <html:errors property="itemCodeError" /></td>
                       <td class="fieldname" >Document Description</td>
                        <td >
                        <html:text value="<%= camDocDesc %>" property="camDocDesc" styleId='camDocDesc'/>
                        <html:errors property="itemDescError" />
                        </td></tr>
                        <tr><td class="fieldname" >Document Tenure</td><td>
                        <html:text maxlength="3" size="10" value="<%= camDocTenureCount %>" property="camDocTenureCount" styleId='camDocTenureCount'/>
                        <html:errors property="tenureError" />
	 <html:select  styleId="camDocTenureType"  property="camDocTenureType" >
												<html:option value=""> Please Select </html:option>
                        <%
                         if(null!=camDocTenureType||!"".equalsIgnoreCase(camDocTenureType)){
                         for(int i=0;i<tenureTypeList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)tenureTypeList.get(i);
                         if(labelValueBean.getValue().equals(camDocTenureType)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="tenureTypeList" labelProperty="label" property="value"  />
                           <%} %>
									                    </html:select>
                        
                        </td>
                        </tr>
                         <tr><td  colspan="4"><center><input class=btnNormal style="margin-left: 40px;height:30px; WIDTH: 70px;"  type="button" value="Go" onclick='getRecList()'></center></td></tr>
</table> 
    </td>
    </tr>
    <tr>
      <td> <h3>Global CAM Document Template</h3></td>
      <%if(!viewOnly){%>
            <td width="10%" valign="baseline" align="right"> <input type="button" value="Add New" class="btnNormal" onclick="goToPage()"/>
            </td>
        <%}%>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  <tbody>
    <tr>
      <td colspan="2">
      <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
        <thead>
        <tr>
          <td width="4%">S/N</td>
          <td width="11%">Code</td>
          <td width="50%">Description</td>
           <td width="10%">Tenure</td>
		   <td width="10%">Status</td>
          
         
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
          <td height="18" >&nbsp;<integro:wrapper value="<%=OB.getItemDesc()%>"/></td>
          <td>
          <%if(OB.getTenureCount()==0){
          %>&nbsp;<%}else{ %>
          <%=OB.getTenureCount()%> &nbsp;<integro:common-code-single  entryCode="<%=OB.getTenureType()%>"
                                    		categoryCode="<%=CategoryCodeConstant.TIME_FREQ%>" display="true" descWithCode="false" />
          <%} %>
          </td>
        <td ><%if(OB.getStatus().trim().equalsIgnoreCase("ENABLE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
         
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
				            String url="CAMGlobal.do?event=paginate&type=CAM&go=N&startIndex=";
				            %>
				            <%if(listSize>10){ %>
				                <td valign="middle">
				                    <integro:pageindex pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
				                            url="<%=url %>" />
				                </td>
				                <%} %>
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
