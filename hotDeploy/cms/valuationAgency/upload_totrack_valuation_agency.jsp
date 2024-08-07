
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.*,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.holiday.MaintainHolidayForm,com.integrosys.cms.app.holiday.trx.IHolidayTrxValue,com.integrosys.cms.app.holiday.trx.OBHolidayTrxValue"%>
<%
	ValuationAgencyForm valuationAgencyForm = (ValuationAgencyForm) request
			.getAttribute("ValuationAgencyForm");

IValuationAgencyTrxValue valuationAgencyTrx = (IValuationAgencyTrxValue)session.getAttribute("com.integrosys.cms.ui.valuationAgency.ValuationAgencyAction.IValuationAgencyTrxValue");
//ISystemBankTrxValue systemBankTrx = (OBSystemBankTrxValue) request.getAttribute("ISystemBankTrxValue");

	
	String transId=(String)request.getAttribute("TrxId"); 

	
	
	int counter = 0;

	String submitEvent = "checker_approve_insert";

	String rejectEvent = "checker_reject_insert";
%>
<%
  // List sr = (List)request.getAttribute("valuationAgencyList");

SearchResult sr = (SearchResult) request.getAttribute("valuationAgencyList");

if (sr != null) {
	List valuationAgencyList = new ArrayList(sr.getResultList());
	pageContext.setAttribute("valuationAgencyList",
			valuationAgencyList);
}
//System.out.println("sr :::::::::::::::::: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; " + sr.getNItems());
String event = request.getParameter("event");
   
    int sno = 0;
    int startIndex=0;
    
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
	{
		 startIndex = Integer.parseInt(ind);
		// request.setAttribute("startIndex",String.valueOf(startIndex));
	}
	
    
   
%>




<%@page import="com.integrosys.cms.ui.valuationAgency.ValuationAgencyForm"%>
<%@page import="com.integrosys.cms.app.valuationAgency.trx.IValuationAgencyTrxValue"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
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
function cancelPage(){
    document.forms[0].action="ValuationAgency.do?event=maker_list_valuationAgency";
    
    document.forms[0].submit();
}
function approvePage() {
	
    document.forms[0].action= "ValuationAgency.do?event=<%=submitEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action= "ValuationAgency.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}

//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

<html:form action="ValuationAgency.do" >
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
                    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                       
                          <tr>
                          <td ><h3>Valuation Agency</h3></td>
                          <td  align="right" valign="bottom">
							
						  </td>
						    
						
                        </tr>
                         <tr>
               
                 
                    
                    
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
                                  <td width="16%">Valuation Agency Code</td>
                                  <td width="21%">Valuation Agency Name</td>
                                  <td width="16%">City</td>
                                  <td width="16%">State</td>
                                  <td width="16%">Region</td>
                                  <td width="16%">Country</td>
                                 
                                </tr>
                              </thead>
                              <tbody>
                                <logic:present name="valuationAgencyList">
                    <logic:iterate id="ob" name="valuationAgencyList"  type="com.integrosys.cms.app.valuationAgency.bus.OBValuationAgency" scope="page"
                    length="10" offset="<%=String.valueOf(startIndex) %>">
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
                                  <td class="index"><%=startIndex+sno%></td>
                                  <td><%= ob.getValuationAgencyCode() %>&nbsp;</td>
                                  <td><%=ob.getValuationAgencyName() %>&nbsp;</td>
                              <%if(ob.getCityTown()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                     <td><%= ob.getCityTown().getCityName() %>&nbsp;</td>
                                   <%} %>
                                     <%if(ob.getState()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                    <td><%=ob.getState().getStateName() %>&nbsp;</td>
                                    <%} %>
                                      <%if(ob.getRegion()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                     <td><%=ob.getRegion().getRegionName() %>&nbsp;</td>
                                      <%} %>
                                      
                                      <%if(ob.getCountry()==null){ %>   
                                   <td><%= "" %>&nbsp;</td>
                                   <%}else{ %>
                                      <td><%=ob.getCountry().getCountryName() %>&nbsp;</td>
                                      
                                       <%} %>
                                      
                                    
                                      
                                      
                                      
                                      
                                      
                              
                                </tr>
                                </logic:iterate>
                                <% if (sno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="8">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                </logic:present>
                
                              </tbody>
                            </table></td>
                        </tr>
                        	<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 100%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=valuationAgencyTrx.getUserInfo()!= null? valuationAgencyTrx.getUserInfo(): ""%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=valuationAgencyTrx.getRemarks() != null ? valuationAgencyTrx.getRemarks(): ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
                      </tbody>
                    </table>
                    
                    <table width="130" border="0" align="center"
															cellpadding="0" cellspacing="0">
															<tr>
																<td width="65">
																	&nbsp;
																</td>
																<td width="65">
																	&nbsp;
																</td>
															</tr>
															

															<tr>


																
																<td>
																	<a href="javascript:cancelPage();"
																		onmouseout="MM_swapImgRestore()"
																		onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
																			src="img/cancel1.gif" name="Image1" border="0"
																			id="Image1" />
																	</a>
																</td>

															</tr>
																														
														</table>
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
              
              
 <tr>
    <td height="25">


        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">

            <tr>
            
             <%
                            String pageIndexUrl=null;
                            
                                pageIndexUrl = "ValuationAgency.do?event=list_pagination&startIndex=";
                           
                        %>
                <td valign="middle">
                    <integro:pageindex
                            pageIndex="<%=new PageIndex(startIndex,10,0)%>"
                            url="ValuationAgency.do?event=list_pagination&startIndex=" />
                </td>
            </tr>
        </table>

    </td>
</tr>             
              
              
              
              
</table>

</body>
</html:form>
<!-- InstanceEnd --></html>