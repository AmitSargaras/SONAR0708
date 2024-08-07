<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 java.util.List,
                 java.util.ArrayList"%>
<%
SearchResult sr = (SearchResult)request.getAttribute("resultList");
List resultList = null;
if(sr != null){
	if(sr.getResultList() != null)
		resultList = new ArrayList(sr.getResultList());
	else
		resultList = new ArrayList();
	pageContext.setAttribute("resultList",resultList);
}

    String event = request.getParameter("event");
    
    int sno = 0;
    int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	boolean isMaker= false;
	boolean isChecker= false;
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    if(user.getTeamTypeMembership().getMembershipID()==1004){
    	isMaker=true;
    }else {
    	isChecker=true;
    }
%>
<html>
<head>
<title>Banking Arrangement Facility Exclusion</title>
<script language="JavaScript" type="text/JavaScript">
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

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
function prepareCreate() {
 	document.forms[0].action="BankingArrangementFacExclusion.do?event=maker_prepare_create&isNew=Y";
    document.forms[0].submit();
}
</script>
</head>
<html:form action='BankingArrangementFacExclusion.do'>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
		   		<td valign="top">
					<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		            	<thead>
		                 	<tr>
			                    <td width="82%"><h3>Banking Arrangement Facility Exclusion</h3></td>
		                     </tr>
		                     <tr>
		                     <%if(isMaker){%>
		                   		<td valign="bottom" align="right">
									<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="prepareCreate()"/>
									&nbsp;
								</td>
		                    <%}%>
			                </tr>
		                    <tr>
		                    	<td colspan="4"><hr /></td>
		                     </tr>
		                </thead>
		                <tbody>
		                	<tr>
		                    	<td colspan="4">
		                    		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
				                        <thead>
				                          <tr>
				                            <td width="5%">S/N</td>
				                            <td width="16%">System</td>
				                            <td width="10%">Facility Category</td>
				                            <td width="30%">Facility Name</td>
				                            <td width="20%">Excluded</td>
				                            <td width="16%">Action</td>
				                          </tr>
				                        </thead>
			                        	<tbody>
			                        	 	<logic:present name="resultList">
					                        <logic:iterate id="item" name="resultList" length="10" offset="<%=String.valueOf(startIndex)%>" indexId="counter" 
					                        type="com.integrosys.cms.app.bankingArrangementFacExclusion.bus.IBankingArrangementFacExclusion" scope="page">
					                        <%
					                            String rowClass="";
					                            sno++;
					                            if(sno%2!=0){
					                                rowClass="odd";
					                            }else{
					                                rowClass="even";
					                            }
					                        %>
					                        	<tr class="<%=rowClass%>">
					                        		<td class="index"><%=counter.intValue()+1%></td>
                                   					<td>
                                   						<center>
                                   							<integro:common-code-single categoryCode="<%=CategoryCodeConstant.SYSTEM %>" 
                                   							entryCode="<%=item.getSystem()%>" display="true" descWithCode="true" />
                                   							&nbsp;
                                   						</center>
                                   					</td>                                  
                                    				<td>  
                                    					<center>
                                   							<integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY %>" 
                                   							entryCode="<%=item.getFacCategory()%>" display="true" descWithCode="false" />
                                   							&nbsp;
                                   						</center>
                                   					</td> 
                                    				<td><center><%=(item.getFacName() == null || item.getFacName().length() == 0) ? "-" : item.getFacName() %>&nbsp;</center></td> 
                                    				<td><center>
                                    						<%=item.getExcluded()%>
                                    					</center>
                                    					</td> 
                                  					<td>
                                  						<select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                     			        	<option value="#" selected>Please Select</option>
					                                       <%if(isMaker){%>
                                      						<option value='BankingArrangementFacExclusion.do?event=maker_view&id=<%=item.getId()%>&startIndex=<%=startIndex%>'>View</option>
                                      						<option value='BankingArrangementFacExclusion.do?event=maker_edit_read&id=<%=item.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
                                      						<option value='BankingArrangementFacExclusion.do?event=maker_delete_read&id=<%=item.getId()%>&startIndex=<%=startIndex%>'>Delete</option>
									  					<%}else{ %>
									  						 <option value='BankingArrangementFacExclusion.do?event=checker_view&id=<%=item.getId()%>&startIndex=<%=startIndex%>'>View</option>
									  					<%} %>
                                    					</select> 
                                    				</td>
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
					                		<logic:notPresent name="resultList">
					                                <tr class="odd">
					                                	<td colspan="10">
					                                		<bean:message key="label.global.not.found"/>                                
					                                	</td>
					                                </tr>
					                		</logic:notPresent>
			                        	</tbody>
		                     		</table>
		                     	</td>
		                    </tr>
		                </tbody>
		            </table>
				</td>
		     </tr>
		     <logic:present name="resultList">
		     	<logic:notEmpty name="resultList">
				     <tr>
				       <td height="25">
				           <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
				             <tr>
				               <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
				               <%
				                   String pageIndexUrl="BankingArrangementFacExclusion.do?event=maker_list&startIndex=";
				               %>
				               <td width="86" valign="middle">
				                  &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,10, resultList.size())%>'
				                       url='<%=pageIndexUrl%>' />
				
				               </td>
				             </tr>
				           </table>
				        </td>
				     </tr>
			     </logic:notEmpty>
		     </logic:present>
		</table>
	</body>
</html:form>
</html>