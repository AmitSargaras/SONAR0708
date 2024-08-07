<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.cms.ui.creditApproval.CreditApprovalAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.creditApproval.bus.ICreditApproval,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils,
                 com.integrosys.cms.app.creditApproval.bus.OBCreditApproval,
                 java.util.List,java.util.ArrayList,java.util.Collection,
                 com.integrosys.base.businfra.search.SearchResult,
                 java.text.DecimalFormat"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
    <title>Untitled Document</title>
    <%
     String event = request.getParameter("event");
     System.out.println("event------------->"+event);
     String strSearchEvent = "";
  	 	if(event.equals(CreditApprovalAction.EVENT_PREPARE_LIST)||event.equals(CreditApprovalAction.MAKER_SEARCH_LIST_CREDIT_APPROVAL)  || event.equals("paginate") )
   	 	{
   		 	strSearchEvent = CreditApprovalAction.MAKER_SEARCH_LIST_CREDIT_APPROVAL;
   	 	}
   		 else
     	{
    		strSearchEvent = CreditApprovalAction.CHECKER_SEARCH_LIST_CREDIT_APPROVAL;
     	}
  	 	String code = (String) request.getAttribute("approvalCode");
  	 	if(code == null) {
  	 		code = "";
  	 	}
  		String name = (String) request.getAttribute("approvalName");
  		if(name == null) {
  			name = "";
  		}
  		
   %>  
<script language="JavaScript" type="text/JavaScript">

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}

</script>

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

function gotopage(aLocation) {
    window.location = aLocation;
}

function addNew() {

document.forms[0].action = "credit_approval.do";
    document.forms[0].event.value = "<%=CreditApprovalAction.EVENT_PREPARE%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=CreditApprovalAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=CreditApprovalAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
 function searchCreditApproval()
	    {	
		    //if(document.getElementById("searchTxtApprovalCode").value==""||document.getElementById("searchTxtApprovalCode").value==null||document.getElementById("searchTxtApprovalName").value==""||document.getElementById("searchTxtApprovalName").value==null)
			   // {
				//	alert("Please Enter Value For Search" );
			   // }	
		   // else
			//{    
	        var srcTxtApprovalCode = document.getElementById("searchTxtApprovalCode").value;
	        var srcTxtApprovalName = document.getElementById("searchTxtApprovalName").value;
	       
	       document.forms[0].action="credit_approval.do?event=<%=strSearchEvent%>&approvalCode="+srcTxtApprovalCode+"&approvalName="+srcTxtApprovalName;
	      
	           document.forms[0].submit();
			//}
	    }
	    
	    
function uploadMasterFile() {
	document.forms[0].action="credit_approval.do?event=maker_prepare_upload_creditApproval";
    document.forms[0].submit();
}

//-->
    </script>
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">

<%
     String appId= "";
     DecimalFormat dft = new DecimalFormat("#0.00");
     List oBCreditApprovalList = (java.util.ArrayList)request.getAttribute("oBCreditApproval");
     SearchResult sr = (SearchResult)request.getAttribute("searchResultRbiCategory");
     
	 Collection resultList = null;
	
	int length = 10;
	int displayLength = 0;
	int totalCount = 0;
	int listSize = 0;
	if (oBCreditApprovalList != null) {
		resultList = (java.util.ArrayList)oBCreditApprovalList;
		listSize = resultList.size();
		pageContext.setAttribute("listSize", listSize + "");
		pageContext.setAttribute("oBCreditApproval", resultList);
	}
	
	int sno = 0;
    int startIndex = 0;
    startIndex = Integer.parseInt(request.getAttribute("startIndex").toString());
    
    sno = startIndex;
	String startindex=String.valueOf(startIndex);
	 String approvalCode=(String)request.getAttribute("approvalCode");
	 if(approvalCode == null){
		 approvalCode = "";
	 }
	 String approvalName=(String) request.getAttribute("approvalName");
	 if(approvalName == null){
		 approvalName = "";
	 }
	
	
	//System.out.println("event------------->startindex "+startindex);
    

%>

<html:form action="credit_approval.do">
<html:hidden property="event" />
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3>Credit Approver</h3></td>

    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>

        <tr>
        
           <td align="right" valign="bottom">
            <table width="50" border="0" align="right" cellpadding="0" cellspacing="0">
            <%if(!( event.equals(CreditApprovalAction.EVENT_CHECKER_PREPARE_LIST) || event.equals("paginateChecker") || event.equals(CreditApprovalAction.CHECKER_SEARCH_LIST_CREDIT_APPROVAL))){ %>
                <tr>                
                    <td width="100" valign="bottom" align="center"><input type="button" name="Submit" value="Add New" class="btnNormal" onClick="addNew()"/>
                    </td> 
                    <td  valign="bottom" align="right">
						&nbsp;
					</td> 
                    <td  valign="bottom" align="right">
						<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadMasterFile()"/>
					</td>
                </tr>
                <%} %>
                <tr>
                <td>
                <br>
                </td>
                </tr>
             </table>
        </td>
    </tr>
 
            <tr>
                   <td colspan="2">
                     Credit Approver Code: <html:text property="searchTxtApprovalCode" styleId="searchTxtApprovalCode" maxlength="30" value="<%=approvalCode %>"/> 
                      <html:errors property="searchTxtApprovalCode"/>
                     &nbsp;&nbsp;&nbsp;Credit Approver Name: <html:text property="searchTxtApprovalName" styleId="searchTxtApprovalName" maxlength="50" value="<%=approvalName%>"/>
                      <html:errors property="searchTxtApprovalName" />
                     <input class="btnNormal" type="button" value="GO" onclick="javascript:searchCreditApproval();"/>
                   </td>
                   
                   <html:hidden property="searchTxtApprovalCode" value="<%=code %>"/>
					<html:hidden property="searchTxtApprovalName" value="<%=name %>"/>
                   
   </tr>
   <tr> <td colspan="2"><br/></td></tr>
</thead>
<tbody>

<tr>
<td colspan="2">
<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>

    <tr>
           <td width="10%">S/N</td>
           <td width="15%">Credit Approver's Code</td>
           <td width="15%">Credit Approver's Name</td>
           <td width="15%">Minimum Limit (INR)</td>
           <td width="15%">Maximum Limit (INR)</td>
           <td width="15%">Senior</td>
           <td width="15%">Risk</td>
           <td width="15%">Status</td>
           <td width="15%">Action</td>                                          
    </tr>
</thead> <tbody>

												 <logic:present name="oBCreditApproval">
													<logic:iterate id="OB"
													 offset="<%=String.valueOf(startIndex)%>" length="<%=String.valueOf(10)%>"
													 name="oBCreditApproval"
														type="com.integrosys.cms.app.creditApproval.bus.OBCreditApproval"
														scope="page">
														<%
															String rowClass = "";
																		sno++;
																		if (sno % 2 != 0) {
																			rowClass = "odd";
																		} else {
																			rowClass = "even";
																		}
														%>
														<tr class="<%=rowClass%>">
														    <%
																appId = Long.toString(OB.getId());
															%>
															<td class="index"><%=sno%></td>

                                                            
															<td><integro:empty-if-null value="<%=OB.getApprovalCode()%>" />&nbsp;</td>

															<td><integro:empty-if-null value="<%=OB.getApprovalName()%>" />&nbsp;</td>
															
															<td><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(OB.getMinimumLimit().toString())%>" />&nbsp;</td>

															<td><integro:empty-if-null value="<%=UIUtil.formatWithCommaAndDecimal(OB.getMaximumLimit().toString())%>" />&nbsp;</td>
															
															<%--<td><%=dft.format(OB.getMinimumLimit())%></td>

															<td><%=dft.format(OB.getMaximumLimit())%></td>

															
				--%><td>
					<%String check;
                     
                     if(OB.getSenior()!=null && OB.getSenior().equals("Y")){
                    
                     check = "checked";}
                     else
                     { 
                     check = "";
                     }%>
                      <input type=checkbox name="senior" disabled="disabled" <%=check%>>
                </td>

				<td>
					<%
                     if(OB.getRisk()!=null && OB.getRisk().equals("Y")){
                     check = "checked";}
                     else
                     { 
                     check = "";
                     }%>
                     <input type=checkbox name="risk" disabled="disabled" <%=check%>>
                </td>
                
                <td><% if(OB.getStatus().equals("ACTIVE")){%>Enable
                <%}else{ %>Disable<%}%></td>

															<td><select name="chooseAction"
																onchange="MM_jumpMenu('self',this,0)">
																<option value="#" selected="selected">Please Select</option>
														<%if(event.equals(CreditApprovalAction.EVENT_CHECKER_PREPARE_LIST)|| event.equals(CreditApprovalAction.CHECKER_SEARCH_LIST_CREDIT_APPROVAL) || event.equals("paginateChecker")){ %>
																<option
																	value="credit_approval.do?event=checker_view_creditApproval_read&creditAppId=<%=appId%>&startIndex=<%=startindex %>&approvalCode=<%=approvalCode %>&approvalName=<%=approvalName %>">View</option>
														<%}else{ %>
														<option
																	value="credit_approval.do?event=maker_view_creditApproval_read&creditAppId=<%=appId%>&startIndex=<%=startindex %>&approvalCode=<%=approvalCode %>&approvalName=<%=approvalName %>">View</option>
														<%} %>
														<%if(!event.equals(CreditApprovalAction.EVENT_CHECKER_PREPARE_LIST) && !event.equals(CreditApprovalAction.CHECKER_SEARCH_LIST_CREDIT_APPROVAL) && !event.equals("paginateChecker")){ %>
																<option
																	value="credit_approval.do?event=prepare_maker_submit_edit&creditAppId=<%=appId%>&startIndex=<%=startindex %>&approvalCode=<%=approvalCode %>&approvalName=<%=approvalName %>">Edit</option>

																<option
																	value="credit_approval.do?event=prepare_maker_submit_remove&creditAppId=<%=appId%>&startIndex=<%=startindex %>&approvalCode=<%=approvalCode %>&approvalName=<%=approvalName %>">Delete</option>
														<%} %>
															</select></td>

														</tr>
													</logic:iterate>
												 <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                </logic:present>

</table>
</td>
</tr>
</tbody>
</table>
<br><br>



</td>
</tr>
<tr>
    <td height="25">
        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
               cellpadding="5" align="center">

           
        </table>
    </td>
</tr>

 <logic:present name="oBCreditApproval">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <%
                            String pageIndexUrl=null;
                        if(event.equals(CreditApprovalAction.EVENT_PREPARE_LIST)||event.equals(CreditApprovalAction.MAKER_SEARCH_LIST_CREDIT_APPROVAL) || event.equals("paginate") ){
                                pageIndexUrl = "credit_approval.do?event=paginate&approvalCode="+code+"&approvalName="+name+"&startIndex=";
                        }
                        else
                        {
                        	 pageIndexUrl = "credit_approval.do?event=paginateChecker&approvalCode="+code+"&approvalName="+name+"&startIndex=";
                        }
                        %>
                        <td width="580" valign="middle">&nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,10,listSize)%>'
                                url='<%=pageIndexUrl%>' />
                        </td>
                       <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>                       
                      </tr>
                    </table>
                 </td>
              </tr>
   </logic:present>

</table>


</body>
</html:form>
</html>