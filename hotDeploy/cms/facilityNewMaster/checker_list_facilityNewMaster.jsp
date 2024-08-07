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
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%
String code=(String)request.getAttribute("facCode");
if(code==null)
	code="";
String name=(String)request.getAttribute("facName");
if(name==null)
	name="";
String category=(String)request.getAttribute("facCategory");
if(category==null)
	category="";
String system=(String)request.getAttribute("facSystem");
if(system==null)
	system="";
String line=(String)request.getAttribute("facLine");
if(line==null)
	line="";
String type=(String)request.getAttribute("facType");
if(type==null)
	type="";
// System.out.print("\n\ncode = "+code+"\nname = "+name+"\nsystem = "+system+"\ncategory = "+category+"\ntype = "+type+"\nline = "+line+"\n\n");
SearchResult sr = (SearchResult)request.getAttribute("facilityNewMasterList");
List facilityCategoryList = (List)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.facilityCategoryList");
List facilityTypeList = (List)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.facilityTypeList");
List systemList = (List)session.getAttribute("com.integrosys.cms.ui.facilityNewMaster.MaintainFacilityNewMasterAction.systemList");
pageContext.setAttribute("facilityCategoryList",facilityCategoryList);
pageContext.setAttribute("facilityTypeList",facilityTypeList);
pageContext.setAttribute("systemList",systemList);
if(sr!=null){
 List facilityNewMasterList = new ArrayList(sr.getResultList());
	pageContext.setAttribute("facilityNewMasterList",facilityNewMasterList);
}

    String event = (String)request.getParameter("event");
    int sno = 0;
    int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	System.out.print("startIndex "+startIndex);
	System.out.print(" ind "+ind);
   // int counter = 0;
   // if (form != null)
    //    counter = form.getStartIndex();
   // String startIndex = (String)session.getAttribute("com.integrosys.cms.ui.diaryitem.DiaryItemAction.session.startIndex");
   // if (form == null && startIndex != null &&  !startIndex.equals(""))
    //    counter = Integer.parseInt(startIndex);
  //  int lStartIndex = counter;
%>





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

function getFacList(){
	var code=document.getElementById('facCode').value;
	var name=document.getElementById('facName').value;
	var category=document.getElementById('facCat').value;
	var type=document.getElementById('facType').value;
	var system=document.getElementById('facSys').value;
	var line=document.getElementById('facLine').value;
	document.forms[0].action="facilityNewMaster.do?event=checker_list_facilityNewMaster&go=Y&facCode="+code+"&facName="+name+"&facCategory="+category+"&facType="+type+"&facSystem="+system+"&facLine="+line;
    document.forms[0].submit();
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
	        
	      
	       
	      
	       document.forms[0].action="facilityNewMaster.do?event=maker_search_list_facilityNewMaster&searchBy="+searchBy+"&searchText="+searchText;
    
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
     
   
    
   
    document.forms[0].action="facilityNewMaster.do?event=checker_search_list_facilityNewMaster&searchBy="+searchBy+"&searchText="+searchText;

document.forms[0].submit();
		}
 }

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='facilityNewMaster.do?'>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">

<tr>
   <td valign="top">
                    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>Facility Master</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  <td>&nbsp;</td>      
						<% //if (isEditAccess) { %>                    
                          
						<%// } else { %>
						  <td>&nbsp;</td>
						<%// } %>
                        </tr>
                        <tr><td>&nbsp;</td></tr>
                        <tr><td colspan="3">
                        <table width="100%" class="tblinfo" border="0" align="center" cellpadding="0" cellspacing="0">
                        <THEAD>
                      <TR><TD colSpan=4 width="100%">Please enter search criteria</TD></TR></THEAD>
                        <tr><td class="fieldname" >Facility Code</td>
                        <td><html:text value="<%= code %>" property="newFacilityCodeSearch" styleId='facCode'/>
                        <html:errors property="newFacilityCodeError"/></td>
                        <td class="fieldname" >Facility Name</td>
                        <td><html:text value="<%= name %>" property="newFacilityNameSearch" styleId='facName'/>
                        <html:errors property="newFacilityNameError"/></td></tr>
                        <tr>
                        <td class="fieldname" >Facility Category</td>
                        <td>
                        <html:select  styleId="facCat" name="MaintainFacilityNewMasterForm"   property="newFacilityCategorySearch" >
												<html:option value=""> Please Select </html:option>
                        <%
                         if(null!=category||!"".equalsIgnoreCase(category)){
                         for(int i=0;i<facilityCategoryList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)facilityCategoryList.get(i);
                         if(labelValueBean.getValue().equals(category)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="facilityCategoryList" labelProperty="label" property="value"  />
                           <%} %>
									                    </html:select>
                        </td>
                        <td class="fieldname" >Facility Type</td>
                        <td>
                      						
<html:select  styleId="facType" name="MaintainFacilityNewMasterForm"   property="newFacilityTypeSearch" >
<html:option value=""> Please Select </html:option>
                        <%
                         if(null!=type||!"".equalsIgnoreCase(type)){
                         for(int i=0;i<facilityTypeList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)facilityTypeList.get(i);
                         if(labelValueBean.getValue().equals(type)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="facilityTypeList" labelProperty="label" property="value"  />
                           <%} %>
                        </html:select>
                        </td>
                        </tr>
                        <tr><td class="fieldname">System</td>
                        <td>
                       <html:select styleId="facSys" name="MaintainFacilityNewMasterForm"   property="newFacilitySystemSearch" >
					 <html:option value=""> Please Select </html:option>
                        <%
                         if(null!=system||!"".equalsIgnoreCase(system)){
                         for(int i=0;i<systemList.size();i++){
                         LabelValueBean labelValueBean = (LabelValueBean)systemList.get(i);
                         if(labelValueBean.getValue().equals(system)){ %>
                         <option value="<%=labelValueBean.getValue() %>" selected="selected"  ><%=labelValueBean.getLabel()%> </option>
                        <%}else{%>
                        <option value="<%=labelValueBean.getValue() %>"><%=labelValueBean.getLabel()%> </option>
                        <% 
                        }
						}}else{%>
                         <html:option value="">-- Please Select --</html:option>
                           <html:options collection="systemList" labelProperty="label" property="value"  />
                           <%} %>
											   </html:select>
                        </td>
                        <td class="fieldname" >Line</td>
                        <td><html:text maxlength="20" property="lineNumberSearch" styleId='facLine' value="<%= line %>"/>
                        <html:errors property="newFacilityLineError"/></td></tr>
                        <tr><td colspan="4"><center><input class=btnNormal style="margin-left: 60px;height:30px; WIDTH: 70px;"  type="button" value="Go" onclick='getFacList()'></center></td></tr>
                        </table></td>
                        </tr>
                         <tr>
                    <td colspan="2">
<!--                    Search By:<select id="searchByCriteria">-->
<!--                     <option value="" >--Please Select--</option>-->
<!--                    <option value="NEW_FACILITY_CODE">Facility Code</option>-->
<!--                     <option value="NEW_FACILITY_NAME">Facility Name</option>-->
<!--                      <option value="NEW_FACILITY_TYPE">Facility Type</option>-->
<!--                       <option value="NEW_FACILITY_SYSTEM">Facility System</option>-->


<!--                    </select>-->
<!--                    -->
<!--                    -->
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
                                  <td width="10%">S/N</td>
                                  <td width="20%">Facility Code</td>
                                  <td width="20%">Facility Name</td>
                                  <td width="20%">Facility Category</td>
                                  <td width="20%">Facility Type</td>
                                  <td width="20%">System</td>
                                  <td width="30%">Line No.</td>
                                  <td width="20%">Status</td>
                                  <td width="20%">Action</td>
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="facilityNewMasterList">
                    <logic:iterate id="ob" name="facilityNewMasterList"  
                    length="10" 
                    offset="<%=String.valueOf(startIndex)%>"
                    indexId="counter"
                     type="com.integrosys.cms.app.facilityNewMaster.bus.OBFacilityNewMaster" scope="page">
                        <%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                           // boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                        %>
                                <tr class="<%=rowClass%>">
                                  <td class="index"><%=counter.intValue()+1%></td>
                                   <td><%=ob.getNewFacilityCode()%>&nbsp;</td>
                                    <td><%=ob.getNewFacilityName()%>&nbsp;</td>                                    
                                    <td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_CATEGORY %>" entryCode="<%=ob.getNewFacilityCategory()%>" display="true" descWithCode="false" />&nbsp;</td>                                    
                                    <td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE %>" entryCode="<%=ob.getNewFacilityType()%>" display="true" descWithCode="false" />&nbsp;</td>
                                  <td><integro:common-code-single categoryCode="<%=CategoryCodeConstant.SYSTEM %>" entryCode="<%=ob.getNewFacilitySystem()%>" display="true" descWithCode="false" />&nbsp;</td>
                                  <td><integro:empty-if-null value="<%=ob.getLineNumber()%>"/></td>
                                  <td ><%if(ob.getStatus().trim().equalsIgnoreCase("ACTIVE")){ %>Enable
              <%}else{ %>Disable<%} %>&nbsp;</td>
                                  <td> <select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                      <option value="#" selected>Please Select</option>
                                      <%if((event.equals("checker_list_facilityNewMaster"))||event.equals("checker_search_list_facilityNewMaster")||event.equals("checker_list_pagination")){%>
                                      <option value='facilityNewMaster.do?event=checker_view_facilityNewMaster&facilityCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
                                       <%}else{ %>
                                      
                                      <option value='facilityNewMaster.do?event=maker_view_facilityNewMaster&facilityCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>View</option>
								
                                      <option value='facilityNewMaster.do?event=maker_edit_facilityNewMaster_read&facilityCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
                                     
                                      <option value='facilityNewMaster.do?event=maker_delete_facilityNewMaster_read&facilityCode=<%=ob.getId()%>&startIndex=<%=startIndex%>'>Delete</option>
                                    
                                      
									  <%} %>
                                    </select> </td>
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <%} %>
                </logic:present>
                 <logic:notPresent name="facilityNewMasterList">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              <logic:present name="facilityNewMasterList">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					             <% if(sr != null) {%>
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, sr.getResultList().size())%>"
					                            url="facilityNewMaster.do?event=checker_list_pagination&startIndex="/>
					                </td>
					            </tr>
					            <%} %>
					        </table>
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
