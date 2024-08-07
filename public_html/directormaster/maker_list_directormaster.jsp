<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.user.MaintainUserForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
                 com.integrosys.component.user.app.bus.CommonUserSearchCriteria,
                 java.util.List,
                 java.util.Collection,
                 java.util.Vector"%>

<%
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");	
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
	
	String event = request.getParameter("event");	 
    
%>

<%
	SearchResult searchResult =(SearchResult) session.getAttribute("com.integrosys.cms.ui.directorMaster.MaintainDirectorMasterAction.directorMasterList");
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
		pageContext.setAttribute("directorMasterSize", Integer.toString(listSize));
		pageContext.setAttribute("directorMasterList", resultList);
	}
	
	
	String srcBy = (String) request.getAttribute("searchBy");
	String srcText = (String) request.getAttribute("searchText");
	
	String pageIndexUrl = "directorMaster.do?event=list_pagination&searchBy="+srcBy+"&searchText="+srcText+"&startIndex=";
%>

<html>
<head>
<script language="JavaScript" type="text/JavaScript">
<!--
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
function createDirectorMaster() {
  
 	document.forms[0].action="directorMaster.do?event=maker_prepare_create_directorMaster";
 	
    document.forms[0].submit();
}
function cancel()
{
	document.forms[0].action="directorMaster.do?event=maker_search_list_directorMaster";
 	
    document.forms[0].submit();
}
 function searchDirector()
	    {	
	    
		    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
			    {
					 document.forms[0].action="directorMaster.do?event=maker_list_directorMaster";
					 document.forms[0].submit();
			    }	
		    else
			{    
	     
	        var searchText = document.getElementById("searchText").value;
	        var searchBy = document.getElementById("searchByCriteria").value;
	       
	       
	      
	       document.forms[0].action="directorMaster.do?event=maker_search_list_directorMaster&searchBy="+searchBy+"&searchText="+searchText;
    
    document.forms[0].submit();
			}
	    }
 function checkerSearchDirector()
 {	
 
	    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
		    {
				alert("Please Enter Value For Search" );
		    }	
	    else
		{    
  
     var searchText = document.getElementById("searchText").value;
     var searchBy = document.getElementById("searchByCriteria").value;
     
     document.forms[0].action="directorMaster.do?event=checker_search_list_directorMaster&searchBy="+searchBy+"&searchText="+searchText;

	document.forms[0].submit();
		}
 }

</script>

</head>
<html:form action='directorMaster.do?'>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
                    <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
               		<br/>
				
                        <tr>
                          <td width="82%"><h3>Director Listing</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  <td>&nbsp;</td>      
						<% //if (isEditAccess) { %>                    
                          
						<%// } else { %>
						  <td>&nbsp;</td>
						<%// } %>
                        </tr>
                         <tr>
                    <td colspan="2">
                    Search By:<select id="searchByCriteria">
                     <option value="" >--Please Select--</option>
                    <option value="director_code">Director Code</option>
                    <option value="name">Director Name</option>               
                    </select>
                   
                    Search Text: <input type="text" maxlength="30" id="searchText" /> 
                    <%if((event.equals("checker_list_directorMaster"))||event.equals("checker_search_list_directorMaster")||event.equals("checker_list_pagination")||event.equals("checker_list_directorMaster")){%>
                    <input class="btnNormal" type="button" value="GO" onclick="javascript:checkerSearchDirector();"/>
                    <%}else{ %>
                    <input class="btnNormal" type="button" value="GO" onclick="javascript:searchDirector();"/>
                    </td>
                    <td  valign="bottom" align="right">
										<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="createDirectorMaster()"/>
										</td>
                     <%} %>
                    
                    
                </tr>
                <tr>
                  <td><html:errors property="searchTextError"/></td>
               </tr>

		<tr>
                  <td  valign="bottom" align="right">
											
										</td>          
                  
                    
                </tr>
                        <tr>
                          <td colspan="4"><hr /></td>
                        </tr>
                      </thead>
                        <tbody>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                  <td width="5%">S/N</td>
                                  <td width="25%">Director Code</td>
                                  <td width="30%">Director Name</td>
                                  <td width="40%">DIN </td>
                                  <td width="15%">Status</td>
                                  <td width="25%">Action</td>
                                 </tr>
                              </thead>
                              <tbody>
                       
                       <logic:greaterThan name="directorMasterSize" value="0">                           
                          <logic:iterate id="ob" name="directorMasterList" type="com.integrosys.cms.app.directorMaster.bus.OBDirectorMaster" 
                             		scope="page" length="10" offset="<%=String.valueOf(startIndex) %>">  
                       
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
                      <%
					String	DinNO = ob.getDinNo();
                      
					%>
                       <td class="index"><%=sno+startIndex%></td>
                       <td><%=ob.getDirectorCode()%></td>
                       <td><%=ob.getName()%></td>
                       <td><%=ob.getDinNo()%></td>
                       <td><% if(ob.getStatus().equals("ACTIVE")){%>Enable
                        <%}else{ %>Disable<%}%></td>
                        <%! String status=null;
                                         %>
                         <%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE"))
                       {
                    	  status="Disable";
                       }
                       else
                       {
                    	  status="Enable";
                       }
                         
                       %>
                       
                                 <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      
                                      
                                      <option value='directorMaster.do?event=maker_view_directorMaster&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
										
									 <%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE")) { %>
                                      <option value='directorMaster.do?event=maker_edit_directorMaster_read&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
                                     <% } %>
                                 
			                         <%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE")) {%>
                                       <option value='directorMaster.do?event=maker_disable_directorMaster_read&branchCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'><%=status %></option>
		                               <%
		                             
		                       		}else{ %> 
                               
	                                 <option value='directorMaster.do?event=maker_enable_directorMaster_read&branchCode=<%=ob.getId()%>'><%=status %></option>
	                                 <%
	                                
	                                 } %>
				                     </select> </td>
                                </tr>
                               
                                </logic:iterate>
                                </logic:greaterThan>
	            		<logic:equal name="directorMasterSize" value="0">
		                	<tr class="even"><td colspan="8">
		                		No Record Found
		                    </td></tr>
		                </logic:equal>	                
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
				</td>
              </tr>
              <% if(searchResult != null && searchResult.getNItems() != 0) {%>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
					                             url='<%=pageIndexUrl%>'/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					<%} %>
              
</table>

</body>
</html:form>
</html>
