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
                 java.util.*,
                 java.util.Vector"%>

<%


//SearchResult sr = (SearchResult)request.getAttribute("caseCreationUpdateList");

SearchResult sr = (SearchResult)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.caseCreationUpdateList");
List caseCreationUpdateList=null;
boolean isCPUTMaker=false;
boolean isBranchUserMaker=false;
boolean isBRANCH=false;

ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
	|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
	isBranchUserMaker=true;
}
 if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
		 ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
		 ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
		 ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
		 ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
		 ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
		 ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER 
		 ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH){
	isCPUTMaker=true;
}
if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_CHECKER 
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_CHECKER_WFH
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_VIEW 
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_VIEW_WFH
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT_WFH){
	isBRANCH=true;
}
boolean isCPUTMakerchecker=false;
String steamTypemembershipId=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
int teamTypemembershipId=  Integer.parseInt(steamTypemembershipId);
if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER_WFH){
	System.out.println("teamTypemembershipId  :"+teamTypemembershipId);
	if(teamTypemembershipId==ICMSConstant.CPU_MAKER
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
			||teamTypemembershipId==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
			){
		isCPUTMakerchecker=true;
    	}
}
System.out.println("sr====>"+sr);
if(sr!=null){
	if(sr.getResultList()!=null){
	caseCreationUpdateList = new ArrayList(sr.getResultList());
	pageContext.setAttribute("caseCreationUpdateList",caseCreationUpdateList);
	}
}
System.out.println("caseCreationUpdateList=>"+caseCreationUpdateList);
List branchList = (List)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.branchList");

HashMap customerMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.customerMap");
List regionList = (List)session.getAttribute("com.integrosys.cms.ui.caseCreationUpdate.MaintainCaseCreationAction.regionList");
if(regionList!=null){
System.out.println("regionList==========================:"+regionList.size());
}
pageContext.setAttribute("regionList", regionList);

HashMap branchMap=new HashMap();
if(branchList!=null){
for(int i=0;i<branchList.size();i++){
	LabelValueBean labelValueBean=(LabelValueBean)branchList.get(i);
	branchMap.put(labelValueBean.getValue(),labelValueBean.getLabel());
}
}
pageContext.setAttribute("branchList",branchList);	
    String event = request.getParameter("event");
    
    int sno = 0;
    int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);
	
	  //ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
	 //   DefaultLogger.debug(this, "customer ==============================@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+customer);
	   
%>





<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICMSCustomer"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html><!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable --> <!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" --> <!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" --> <!-- InstanceParam name="contentHeight" type="text" value="100%" -->
<!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
<!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->
<!-- InstanceBeginEditable name="head" -->
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
function createHoliday() {

 	document.forms[0].action="caseCreationUpdate.do?event=maker_prepare_create_caseCreationUpdate";
    document.forms[0].submit();
}
 function searchBranch()
	    {	
	    
		    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
			    {
					alert("Please Enter Value For Search" );
			    }	
		    else
			{    
	     
	        var searchText = document.getElementById("searchText").value;
	        var searchBy = document.getElementById("searchByCriteria").value;
	        
	      
	       
	      
	       document.forms[0].action="systemBank.do?event=maker_search_list_caseCreationUpdate&searchBy="+searchBy+"&searchText="+searchText;
    
    document.forms[0].submit();
			}
	    }
 function checkerSearchBranch()
 {	
 
	    if(document.getElementById("searchText").value==""||document.getElementById("searchText").value==null||document.getElementById("searchByCriteria").value=="")
		    {
				alert("Please Enter Value For Search" );
		    }	
	    else
		{    
  
     var searchText = document.getElementById("searchText").value;
     var searchBy = document.getElementById("searchByCriteria").value;
     
   
    
   
    document.forms[0].action="caseCreationUpdate.do?event=checker_search_list_caseCreationUpdate&searchBy="+searchBy+"&searchText="+searchText;

document.forms[0].submit();
		}
 }
 
  function uploadMasterFile() {
	document.forms[0].action="caseCreationUpdate.do?event=maker_prepare_upload_caseCreationUpdate";
    document.forms[0].submit();
}

  function searchCaseCreation()
  {	
	  var txtSegment=document.forms[0].txtSegment.value;
	  var txtRegion=document.forms[0].txtRegion.value;
	  var isBranch = <%=isBRANCH%>;
 	var txtPartyName = document.getElementById("txtPartyName").value;
     var txtCaseId = document.getElementById("txtCaseId").value;
     //var txtSegment = document.getElementById("txtSegment").value;
    // var txtRegion = document.getElementById("txtRegion").value;
     var txtStatus = document.getElementById("txtStatus").value;
     var txtAllParty=document.getElementById("radioPartyNameY").checked;
    if(document.getElementById("radioPartyNameN").checked == true){
    	if(document.getElementById("txtPartyName").value != ''){
 	    	document.forms[0].action  = "caseCreationUpdate.do?event=search_case_creation_update&partyName="+txtPartyName+"&caseId="+txtCaseId+"&segment="+txtSegment+"&region="+txtRegion+"&status="+txtStatus+"&txtAllParty="+txtAllParty+"&isBRANCH="+isBranch;
 		    document.forms[0].submit();
    	}else{
    		alert('Please enter Customer Name.');
    	}
    }else{
    	document.forms[0].action  = "caseCreationUpdate.do?event=search_case_creation_update&partyName="+txtPartyName+"&caseId="+txtCaseId+"&segment="+txtSegment+"&region="+txtRegion+"&status="+txtStatus+"&txtAllParty="+txtAllParty+"&isBRANCH="+isBranch;
		document.forms[0].submit();
    }
  }

//-->



function searchByAllParty(selfObj)
{	
	  
	
	//alert('radioPartyName=>'+selfObj);
   if(selfObj== 'Yes'){
	   document.getElementById("radioPartyNameY").checked = true;
	   document.getElementById("radioPartyNameN").checked = false;
  	}
	if(selfObj == 'No'){
		document.getElementById("radioPartyNameY").checked = false;
		document.getElementById("radioPartyNameN").checked = true;
  	}
          
}
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='caseCreationUpdate.do?'>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>Case Creation Update</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  <td>&nbsp;</td>      
						<% //if (isEditAccess) { %>                    
                          
						<%// } else { %>
						  <td>&nbsp;</td>
						<%// } %>
                        </tr>
                           <tr >
							<td ><br />
								Customer Name :<input type="radio" value="No" id="radioPartyNameN" onclick="searchByAllParty(this.value)" checked/>
								<input type="text" size="18" id="txtPartyName"  maxlength="30"/>
								<input type="radio" value="Yes" id="radioPartyNameY" onclick="searchByAllParty(this.value)"/>All &nbsp;&nbsp;&nbsp;
								Case Id :<input type="text" size="18" id="txtCaseId"  maxlength="50"/>
								Segment :
<!--								<input type="text" size="18" id="txtSegment" maxlength="30"/>-->
								<html:select property="txtSegment" >
                                    	<integro:common-code 
                                    		categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" descWithCode="false" />
                                    </html:select>
								Region :
<!--								<input type="text" size="18" id="txtRegion" maxlength="30" />-->
								<html:select property="txtRegion">
						    	<option value="">Please Select</option>
								<html:options collection="regionList" labelProperty="label" property="value" />
						</html:select>	
								Status :
								<select id="txtStatus"  >
								<option value="" >Please Select</option>
								<option value="1" >CPUT Requested</option>
								<option value="2" >Branch Sent</option>
								<option value="3" >CPUT Received</option>
								<option value="4" >Wrong Request</option>
								 </select>
								
								<a href="#" target="_self"><img src="img/search.gif" border="0"
								onclick="searchCaseCreation()" /></a> 
								</br>
								&nbsp;<html:errors property="partyNameInvalidCodeError" />
								&nbsp;<html:errors property="caseIdInvalidNameError" />
								&nbsp;<html:errors property="segmentInvalidNameError" />
								&nbsp;<html:errors property="regionInvalidNameError" />
								&nbsp;<html:errors property="statusInvalidNameError" />
								
								</td>
								<td  valign="bottom" align="right">&nbsp;
								<html:errors property="caseIdError"/>
										</td>
										<td  valign="bottom" align="right">&nbsp;
						
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
                                  <td width="16%">Case ID</td>
                                  <td width="30%">Customer Name</td>
                                  <td width="16%">Customer Segment</td>
                                  <td width="16%">Customer Region</td>
                                  <td width="16%">Creation Date</td>
                                  <td width="16%">Last Updated Date</td>
                                  <td width="20%">Case Creation Branch</td>
                                  <td width="20%">Status</td>
                                  <td width="16%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                              <%if(caseCreationUpdateList != null){ %>
                                <logic:present name="caseCreationUpdateList">
                    <logic:iterate id="ob" name="caseCreationUpdateList" 
                    length="10" 
                    offset="<%=String.valueOf(startIndex)%>"
                    indexId="counter"
                     type="com.integrosys.cms.app.caseCreationUpdate.bus.OBCaseCreation" scope="page">
                        <%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                           // boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                           
                           ICMSCustomer customer=(ICMSCustomer) customerMap.get(String.valueOf(ob.getId()));
                           
                         //  System.out.println("=====================@@@@@@@@@@@@@@@@@@@@@@@@@@@@##################"+customer.getCustomerID());
                        %>
                                <tr class="<%=rowClass%>">
                                  <td class="index"><%=counter.intValue()+1%></td>
                                   <td><%=ob.getId()%>&nbsp;</td>
                                   <%if(customer!=null){ %>
                                   <td><integro:empty-if-null value="<%=customer.getCustomerName()%>"></integro:empty-if-null>&nbsp;</td>
                                   <td><integro:empty-if-null value="<%=customer.getCustomerSegment()%>"></integro:empty-if-null>&nbsp;</td>
                                   <td><integro:empty-if-null value="<%=customer.getRegion()%>"></integro:empty-if-null>&nbsp;</td>
                                   <%}else{ %>
                                    <td>-&nbsp;</td>
                                    <td>-&nbsp;</td>
                                    <td>-&nbsp;</td>
                                   <%} %>
                                  <td><integro:date object="<%=ob.getCreationDate()%>"></integro:date>&nbsp;</td>
                                  <td><integro:date object="<%=ob.getLastUpdateDate()%>"></integro:date>&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=branchMap.get(ob.getBranchCode())%>"></integro:empty-if-null>&nbsp;</td>
                                 
         
              <td ><%if(!ob.getStatus().trim().equalsIgnoreCase("CLOSED")){ %>Open
              <%}else{ %>Closed<%} %>&nbsp;</td>
                                  <td> 
                                 
                                 
                                 <% if (isBranchUserMaker || isCPUTMaker||isCPUTMakerchecker){ %>
                                   <a href="caseCreationUpdate.do?event=maker_view_caseCreationUpdate_branch&id=<%=ob.getId()%>&customerID=<%=customer.getCustomerID() %>&limitProfileID=<%=ob.getLimitProfileId()%>&startIndex=<%=startIndex%>"  ><bean:message key="label.process"/></a>
                                   <%}else{ %>
                                   <a href="caseCreationUpdate.do?event=maker_view_caseCreationUpdate_branch&id=<%=ob.getId()%>&customerID=<%=customer.getCustomerID() %>&limitProfileID=<%=ob.getLimitProfileId()%>&startIndex=<%=startIndex%>"  ><bean:message key="label.view"/></a>
                                   <%} %>
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
                <%}else{ %>
               
												<tr class="odd">
													<td colspan="10">Sorry, there are no records found.</td>
												</tr>
											
                <%} %>
                
                
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              
              <logic:present name="caseCreationUpdateList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        

                        
                        
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        
                       <% //String pageIndexUrl = "user.do?event=maker_list_user&"+form.getName()!=null&&form.getName().trim().equals("")?"name="+form.getName():""+"&startIndex=";%>
                        <%
                            String pageIndexUrl=null;
 							if(event!=null && event.equalsIgnoreCase("search_case_creation_update")||event.equalsIgnoreCase("search_case_creation_update_paginate")){
 								pageIndexUrl = "caseCreationUpdate.do?event=search_case_creation_update_paginate&startIndex=";
 							}else{
                        
                           if(isBRANCH){ 
                        	   
                        	   if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT
                        			   ||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT_WFH){
                        		   pageIndexUrl = "caseCreationUpdate.do?event=maker_list_casecreation_cput_menu&startIndex=";
                        	   }else{
                        		   pageIndexUrl = "caseCreationUpdate.do?event=maker_list_casecreation_branch_menu&startIndex=";   
                        	   }
                                
                           }else{
                        	   pageIndexUrl = "caseCreationUpdate.do?event=maker_list_casecreation_cput_menu&startIndex=";
                           }
 							}
                           //System.out.println(pageIndexUrl);
                           //System.out.println(sr.getNItems());
                        %>
                        <td width="86" valign="middle">
                           &nbsp;<integro:pageindex pageIndex='<%=new PageIndex(startIndex,10, caseCreationUpdateList.size())%>'
                                url='<%=pageIndexUrl%>' />

                        </td>
                        
                      </tr>
                    </table>
                 </td>
              </tr>
              </logic:present>
              
</table>

</body>
</html:form>
<!-- InstanceEnd --></html>
