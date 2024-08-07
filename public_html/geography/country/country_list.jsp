<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java" import="com.integrosys.base.uiinfra.tag.PageIndex,                                
                                com.integrosys.cms.ui.geography.GeographyAction,
                                com.integrosys.cms.ui.geography.GeographyForm,
                                com.integrosys.base.businfra.search.SearchResult,
                                com.integrosys.cms.app.geography.bus.OBGeography,                                
                                com.integrosys.cms.app.geography.country.trx.ICountryTrxValue,
                                com.integrosys.base.techinfra.propertyfile.PropertyManager,                                
                                java.util.Collection,
                                java.util.List"%>
<%
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");	
	if( ind == null || ind.equals("null"))
		startIndex=0;
	else 
		 startIndex = Integer.parseInt(ind);
%>

<%
	SearchResult searchResult =(SearchResult) session.getAttribute("com.integrosys.cms.ui.geography.country.CountryAction.countryList");
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
		pageContext.setAttribute("countrySize", Integer.toString(listSize));
		pageContext.setAttribute("countryList", resultList);
	}
%>


<script language="JavaScript" type="text/JavaScript">
    function MM_jumpMenu(targ,selObj,restore){ //v3.0
  	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  	  if (restore) selObj.selectedIndex=0;
  	 
  	}
    
    function addCountry(){
		document.forms[0].action		=	"Country.do";
		document.forms[0].event.value	=	"prepare_create_country";
		document.forms[0].submit(); 
	}
	
    function goBack(){
		document.forms[0].action		=	"Geography.do";
		document.forms[0].event.value	=	"view_geography";
		document.forms[0].submit(); 
	}
  	
      
    function searchCountry()
    {
    	var searchType = document.getElementById("selType").value;
    	var searchText = document.getElementById("searchText").value;
    	if( searchType !='' && searchText!='' )
	    {
	       document.forms[0].action            = "Country.do?type="+searchType +"&"+ "text="+searchText;
	       document.forms[0].event.value       = "view_list_country";	        
			document.forms[0].submit();			    				
        }
        else
        {
        	if( searchText == '' )
            {
        		document.forms[0].action            = "Country.do";
    		    document.forms[0].event.value       = "view_list_country";	        
    			document.forms[0].submit();
                                      
            }   
	    }        
    }

  	
    function removeCountry(id,name)
 	{    
     	var ans = window.confirm("Are You Sure to Delete the Country " + name);
     	if( ans == true )
        {
     		var ans1 = window.confirm("All its STATES AND CITIES will be deleted");
         	if( ans1 == true )
            {
		 	 	document.forms[0].action      	= "Country.do?countryId="+id;
		     	document.forms[0].event.value 	= "prepare_remove_country";
		     	document.forms[0].submit();
            }
     	}
     	 		
 	}

    function uploadCountry() {
		document.forms[0].action="Country.do?event=maker_prepare_upload_country";
	    document.forms[0].submit();
	}
</script>

<html:form action="Country.do">
<html:hidden property="startIndex"/>
<html:hidden property="numItems"/>     
<html:hidden property="event"/>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
    <tr height="95%">
        <td valign="top">
        	<div id="contentCanvas" style="height:100%;width:100%;">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td width="70%">
                        <h3>Country List</h3>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2"><hr/></td>
                </tr>
                                     
                <tr>                   
                   <td><label>Search :&nbsp;</label>
                   	<select id="selType">
	                   	<option value="">--Select--</option>	                
	                   	<option value="Country">Country Name</option>
                   	</select> 
	           		<html:text property="searchText" styleId="searchText" maxlength="30"/>
	           		<img alt="Search" src="./img/search.gif" onclick="javascript:searchCountry()">
                   </td>
                   
                   <td  valign="bottom" align="right">
						<input type="button" name="add" value="Add New" class="btnNormal" onclick="javascript:addCountry()"/>
						<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadCountry()"/>
				   </td>    
               </tr>
                 
                <tr>
                   <td><html:errors property="searchTextError"/></td>
               </tr>
               <tr>
                   <td>&nbsp;</td>
               </tr>
            
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">                            
                            <thead>
                            <tr>        
                            	<td width="5%">S/N</td>                          
                                <td width="15%">Country Code</td>
                                <td width="15%">Country Name</td>
                                <td width="15%">Status</td>
                                <td width="15%">Action</td>
                            </tr>
                            </thead>
                            <tbody>				            				          
                            <logic:greaterThan name="countrySize" value="0">
                           
                             <logic:iterate id="OB" name="countryList" type="com.integrosys.cms.app.geography.country.bus.OBCountry" 
                             		scope="page" length="10" offset="<%=String.valueOf(startIndex) %>">                                                                        
                               <%
                                String rowClass = "";
                                	counter++;
                                if ( counter%2 != 0 ) 
                                    rowClass = "odd";
                                else 
                                    rowClass = "even";
                                
                               %>
                              <tr class="<%=rowClass%>">                                      
                                 <td class="index" width="4%"><%=counter+startIndex%></td>                                        
                                 <td><center><%=OB.getCountryCode()%></center></td>                                       
                                 <%
                                 	long i=OB.getIdCountry();
                                 	String name=OB.getCountryName(); 
                                 %>
                                 <td><%=OB.getCountryName()%></td>
                                 <td><% if(OB.getStatus().equals("ACTIVE")){%>Enable
                                 	<%}else{ %>Disable<%}%></td>                                                               
                                <td>
                                <select name="chooseAction"
									onchange="MM_jumpMenu('self',this,0)">
									<option value="#" selected="selected">Please Select</option>

									<option value="Country.do?event=view_country_by_index&countryId=<%=i%>&startIndex=<%=startIndex%>">View</option>
									<%
										if( OB.getStatus().equals("ACTIVE") ){
									%>
									<option value="Country.do?event=prepare_maker_edit_country&countryId=<%=i%>&startIndex=<%=startIndex%>">Edit</option>
									<%} %>
									<%
										String status =""; 
										if( OB.getStatus().equals("ACTIVE") ){
											status = "Disable";
									%>	
									<option value="Country.do?event=maker_delete_country_read&countryId=<%=i%>&startIndex=<%=startIndex%>">		
									
									<% } else {
										status = "Enable";
									%>	
									<option value="Country.do?event=maker_prepare_activate_country&countryId=<%=i%>&startIndex=<%=startIndex%>">		
									<% } %>
									<%=status %>
									 </option>
									
								</select>
								</td>
                                                              
                             </tr>                                   
				            </logic:iterate>
				            <table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
							<tr><td width="65">&nbsp;</td>
								<td width="65">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="4">
									<center>
										<a href="javascript:goBack()" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
												src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
										</a>
									</center>&nbsp;
								</td>
			
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
				        </logic:greaterThan>
					    <tr class="odd"><td colspan="8">&nbsp;</td></tr>
	            		<logic:equal name="countrySize" value="0">
		                	<tr class="even"><td colspan="8">
		                		No Record Found
		                    </td></tr>
		                </logic:equal>
                       </tbody>
                      </table>
                    </td>
                </tr>
                <!-- General Purpose Bar -->
                 <% if(searchResult != null && searchResult.getNItems() != 0) {%>
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
					                            url="Country.do?event=paginate&startIndex="/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					<%} %>
            </table>
            </div>
        </td>
    </tr>
</table>
</html:form>   