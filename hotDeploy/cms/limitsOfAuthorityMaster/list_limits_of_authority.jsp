<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
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
 	document.forms[0].action="LimitsOfAuthorityMaster.do?event=maker_prepare_create_limits_of_authority";
    document.forms[0].submit();
}
</script>
</head>
<html:form action='LimitsOfAuthorityMaster.do'>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
			<tr>
		   		<td valign="top">
					<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
		            	<thead>
		                 	<tr>
			                    <td width="82%"><h3>Limits of Authority (LOA) Master</h3></td>
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
				                            
				                            <td>S/N</td>
											<td>Employee Grade</td>
											<td>Ranking Sequence</td>
											<td>Segment</td>
											<td>Limit Release Amount(Delta) (In Rs.)</td>
											<td>Total Sanctioned Limit (In Rs.)</td>
											<td>Property Valuation (In Rs.)</td>
											<td>FD Amount (In Rs.)</td>
											<td>Drawing Power (In Rs.)</td>
											<td>SBLC Security OMV (In Rs.)</td>
											<td>Facility CAM Covenant</td>
											<td>Action</td> 
				                            
				                          </tr>
				                        </thead>
			                        	<tbody>
			                        	 	<logic:present name="resultList">
					                        <logic:iterate id="item" name="resultList" length="10" offset="<%=String.valueOf(startIndex)%>" indexId="counter" 
					                        type="com.integrosys.cms.app.limitsOfAuthorityMaster.bus.ILimitsOfAuthorityMaster" scope="page">
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
                                   							<integro:common-code-single categoryCode="<%=CategoryCodeConstant.EMPLOYEE_GRADE %>" 
                                   							entryCode="<%=item.getEmployeeGrade()%>" display="true" descWithCode="false" />
                                   							&nbsp;
                                   						</center>
                                   					</td>
                                   					
                                   					<td>
                                   						<center>
                                   							<integro:empty-if-null value="<%=item.getRankingOfSequence()%>"/>
                                   							&nbsp;
                                   						</center>
                                   					</td>
                                   					
                                   					<td>
                                   						<center>
                                   							<integro:common-code-single categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT %>" 
                                   							entryCode="<%=item.getSegment()%>" display="true" descWithCode="false" />
                                   							&nbsp;
                                   						</center>
                                   					</td> 
                                   					
                                   					<td>
                                   						<center>
                                   							<%=item.getLimitReleaseAmt() !=null?UIUtil.formatWithCommaAndDecimalNew(item.getLimitReleaseAmt().toPlainString()):"-" %>
                                   						</center>
                                   					</td> 
													<td>
														<center>
	                                   						<%=item.getTotalSanctionedLimit() !=null?UIUtil.formatWithCommaAndDecimalNew(item.getTotalSanctionedLimit().toPlainString()):"-" %>
														</center>
													</td>
													<td>
														<center>
	                                   						<%=item.getPropertyValuation() !=null?UIUtil.formatWithCommaAndDecimalNew(item.getPropertyValuation().toPlainString()):"-" %>
														</center>
													</td>
													<td>
														<center>
	                                   						<%=item.getFdAmount() !=null?UIUtil.formatWithCommaAndDecimalNew(item.getFdAmount().toPlainString()):"-" %>
														</center>
													</td>
													<td>
														<center>
	                                   						<%=item.getDrawingPower() !=null?UIUtil.formatWithCommaAndDecimalNew(item.getDrawingPower().toPlainString()):"-" %>
														</center>
													</td>
													<td>
														<center>
	                                   						<%=item.getSblcSecurityOmv() !=null?UIUtil.formatWithCommaAndDecimalNew(item.getSblcSecurityOmv().toPlainString()):"-" %>
														</center>
													</td>
													<td>
														<center>
														<%=ICMSConstant.YES.equals(item.getFacilityCamCovenant())?"Yes":ICMSConstant.NO.equals(item.getFacilityCamCovenant())?"No":"-"%>
														</center>
													</td>
													
													<td>
                                  						<select name="menu1" onchange="MM_jumpMenu('self',this,0)" style="width:110">
                                     			        	<option value="#" selected>Please Select</option>
					                                       <%if(isMaker){%>
                                      						<option value='LimitsOfAuthorityMaster.do?event=maker_view_limits_of_authority&id=<%=item.getId()%>&startIndex=<%=startIndex%>'>View</option>
                                      						<option value='LimitsOfAuthorityMaster.do?event=maker_edit_read_limits_of_authority&id=<%=item.getId()%>&startIndex=<%=startIndex%>'>Edit</option>
									  					<%}else{ %>
									  						 <option value='LimitsOfAuthorityMaster.do?event=checker_view_limits_of_authority&id=<%=item.getId()%>&startIndex=<%=startIndex%>'>View</option>
									  					<%} %>
                                    					</select> 
                                    				</td>
                                   					                                
					                        	</tr>
					                		</logic:iterate>
			                                <% if (sno == 0 ) { %>
			                                <tr class="odd">
			                                	<td colspan="12">
			                                		<bean:message key="label.global.not.found"/>                                
			                                	</td>
			                                </tr>
			                                <% } %>
					                		</logic:present>
					                		<logic:notPresent name="resultList">
					                                <tr class="odd">
					                                	<td colspan="12">
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
				                   String pageIndexUrl="LimitsOfAuthorityMaster.do?event=maker_list_limits_of_authority&startIndex=";
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