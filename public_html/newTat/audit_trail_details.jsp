<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
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


List auditList = (List)request.getAttribute("auditList");
Map usersMap = (Map)request.getAttribute("usersMap");

if(auditList!=null){
	pageContext.setAttribute("auditList",auditList);
}
if(usersMap!=null){
	pageContext.setAttribute("usersMap",usersMap);
}
    String event = request.getParameter("event");
    
    int sno = 0;
    int startIndexInner = 0;
    int auditStartInd = 0;
    String ind= (String) request.getAttribute("startIndexInner");
    
	if(ind!=null && (!ind.equals("")))
		 startIndexInner = Integer.parseInt(ind);
	
	  String auditStartIndex= (String) request.getAttribute("auditStartIndex");
	
	  
		if(auditStartIndex!=null && (!auditStartIndex.equals("")))
			auditStartInd = Integer.parseInt(auditStartIndex);
	
	System.out.print("startIndexInner "+startIndexInner);
	System.out.print(" ind "+ind);
	
	boolean isBranch= false;
	boolean isRM= false;
	boolean isCPU= false;
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    
    HashMap regionMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.regionMap");
    Collection regionList = regionMap.values();
	 HashMap rmMap=(HashMap) session.getAttribute("com.integrosys.cms.ui.newTat.NewTatAction.rmMap");
	 
	 String teamTypeMemId = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	 
	 System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$teamTypeMemId$$$$$$$$$$$$$$$$$$$$$$$$$$$"+teamTypeMemId);
	 if(teamTypeMemId.equals("1020")){
		 isRM=true;
	 }else  if(teamTypeMemId.equals("1001")||teamTypeMemId.equals("1002")||teamTypeMemId.equals("1003")){
		 isBranch=true;
	 }else  if(teamTypeMemId.equals("1006")||teamTypeMemId.equals("1007")||teamTypeMemId.equals("1013")){
		 isCPU=true;
	 }
	 
	 String customerName=(String)request.getAttribute("cusName");
	 if(customerName==null)
		 customerName="";
	 String customerId=(String)request.getAttribute("cusId");
	 if(customerId==null)
		 customerId="";
	 String caseInitiator =(String)request.getAttribute("caseIni");
	 if(caseInitiator==null)
		 caseInitiator="";
	 String lastUpdate=(String)request.getAttribute("lastUpdate");
	 if(lastUpdate==null)
		 lastUpdate="";
	 String region=(String)request.getAttribute("rgn");
	 if(region==null)
		 region="";
	 String status=(String)request.getAttribute("sts");
	 if(status==null)
		 status="";
	 String segment=(String)request.getAttribute("sgmnt");
	 if(segment==null)
		 segment="";
	 String module=(String)request.getAttribute("mdl");
	 if(module==null)
		 module="";
	 
	
%>



<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.newTat.NewTatUtil"%>
<%@page import="com.crystaldecisions.enterprise.ocaframework.r"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.SimpleDateFormat"%><html>
<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" -->
<!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" -->
<!-- InstanceParam name="contentHeight" type="text" value="100%" -->
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


  function initiate(){
	  
	  document.forms[0].action="NewTat.do?event=initiate_new_tat";
	    document.forms[0].submit();
	    
  }

 function process1(id,ifChecked){

     var id =id;
	 if(ifChecked.value == 'deferralApprove'){
	  document.forms[0].action="NewTat.do?event=prepare_deferral_approve&id="+id;
	    document.forms[0].submit();
	 }else if (ifChecked.value == 'deferralClearance' ){
	 document.forms[0].action="NewTat.do?event=prepare_deferral_clearance&id="+id;
	    document.forms[0].submit();
 		}else if (ifChecked.value == 'documentReceive' ){
 			 document.forms[0].action="NewTat.do?event=prepare_document_receive&id="+id;
 		    document.forms[0].submit();
 	 		}
 		else if (ifChecked.value == 'documentScan' ){
 			 document.forms[0].action="NewTat.do?event=prepare_document_scan&id="+id;
 			    document.forms[0].submit();
 		 		}
		
  }
 function getTatList(){
	
		var cusName=document.getElementById('cusName').value;
		var cusId=document.getElementById('cusId').value;
		var caseIni=document.getElementById('caseIni').value;
		var lastUpdate=document.getElementById('lastUpdate').value;
		var rgn=document.getElementById('rgn').value;
		var sts=document.getElementById('sts').value;
		var sgmnt=document.getElementById('sgmnt').value;
		var mdl=document.getElementById('mdl').value;
		
		document.forms[0].action="NewTat.do?event=maker_list_tat&go=Y&cusName="+cusName+"&cusId="+cusId+"&caseIni="+caseIni+"&lastUpdate="+lastUpdate+"&rgn="+rgn+"&sts="+sts+"&sgmnt="+sgmnt+"&mdl="+mdl;
	    document.forms[0].submit();
	}
 function cancelPage(){
	    document.forms[0].action="NewTat.do?event=list_cancel&startIndexInner="+<%=startIndexInner%>;
	    
	    document.forms[0].submit();
	}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action='NewTat.do'>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<!-- InstanceBeginEditable name="menuScript" -->
	<!-- InstanceEndEditable -->
	<table width="100%" height="100%" cellspacing="0" cellpadding="0"
		border="0">

		<tr>
			<td valign="top">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td width="82%">
						<h3>Audit Trail Details</h3>
						</td>
						<td width="18%" align="right" valign="bottom"></td>
						<td>&nbsp;</td>

					</tr>

					<tr>
						<td colspan="4">
						<hr />
						</td>
					</tr>
				</thead>
				<tbody>


					<tr>
						<td colspan="4">
						<table width="95%" border="0" cellspacing="0" cellpadding="0"
							class="tblInfo" align="center">
							<thead>
								<tr>
									<td width="3%">S/N</td>
									<td width="7%">Action</td>
									<td width="7%">Profile</td>
									<td width="7%">Performed By</td>
									<td width="7%">Date</td>
									<td width="8%">Time</td>
									<td width="10%">Remarks</td>
									<td width="8%">Delay Reason</td>


								</tr>
							</thead>
							<tbody>
								<logic:present name="auditList">
									<logic:iterate id="ob" name="auditList"
										offset="<%=String.valueOf(auditStartIndex)%>"
										indexId="counter"
										type="com.integrosys.cms.app.newTat.bus.OBNewTat" scope="page">
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


											<td>
		<%if("DOCUMENT_SUBMITTED".equals(ob.getStatus().trim()) && "FTNR".equals(ob.getType())){
			status = "Document Re-Submitted";
		}else if("DOCUMENT_RECEIVED".equals(ob.getStatus().trim())  && "FTNR".equals(ob.getType())){
			status = "Document Re-Received";
		}else if("DOCUMENT_SCANNED".equals(ob.getStatus().trim())  && "FTNR".equals(ob.getType())){
			status = "Document Re-Scanned";
		}else if("DOCUMENT_SUBMITTED".equals(ob.getStatus().trim())){
			status = "Document Submitted";
		}else if("CLOSED".equals(ob.getStatus().trim())){
			status = "Document Closed";
		}else if("LIMIT_RELEASED".equals(ob.getStatus().trim())){
			status = "Limit Released";
		}else if("DEFERRAL_RAISED".equals(ob.getStatus().trim())){
			status = "Deferral Raised";
		}else if("DOCUMENT_RECEIVED".equals(ob.getStatus().trim())){
			status = "Document Received";
		}else if("DOCUMENT_SCANNED".equals(ob.getStatus().trim())){
			status = "Document Scanned";
		}else if("CLIMS_UPDATED".equals(ob.getStatus().trim())){
			status = "Clims Updated";
		}else if("DEFERRAL_APPROVED".equals(ob.getStatus().trim())){
			status = "Deferral Approved";
		}else if("DEFERRAL_CLEARANCE".equals(ob.getStatus().trim())){
			status = "Document Re-Submitted";
		} %> <%=status %>&nbsp;</td>
											<% SimpleDateFormat sdfDate = new SimpleDateFormat("dd-MM-yyyy"); 
											SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
											
											String date = "";
											String time = "";
											if(ob.getActivityTime()!=null && !"".equals(ob.getActivityTime())){
												date = (String)sdfDate.format(ob.getActualActivityTime());
												time = (String)sdfTime.format(ob.getActualActivityTime());
											}
											
											
											%>


											<td>
											<%if(usersMap.containsKey(ob.getLastUpdateBy())){ %>
											<%if(usersMap.get(ob.getLastUpdateBy()).equals("1020")){ %>
											RM
											<%}else if(usersMap.get(ob.getLastUpdateBy()).equals("1001") 
													|| usersMap.get(ob.getLastUpdateBy()).equals("1002") 
													|| usersMap.get(ob.getLastUpdateBy()).equals("1003")){ %>
											LSS Coordinator
											<%}else if(usersMap.get(ob.getLastUpdateBy()).equals("1006") 
													|| usersMap.get(ob.getLastUpdateBy()).equals("1007") 
													|| usersMap.get(ob.getLastUpdateBy()).equals("1013")){ %>
											LSS CPU		
											<%} %>
											<%} %>
											
											&nbsp;
											
											
											
											</td>
											<td><%=NewTatUtil.getUserName(ob.getLastUpdateBy())%>&nbsp;</td>
											<td><%=date%>&nbsp;</td>


											<td><%=time%>&nbsp;</td>
											<td><integro:wrapper value="<%=ob.getRemarks()%>"/>&nbsp;</td>
											<td><integro:common-code-single
								categoryCode="TAT_DELAY"
								descWithCode="false" display="true"
								entryCode="<%=ob.getDelayReason() %>" />
								<%
								if(ob.getDelayReason()!=null && ob.getDelayReason().trim().equals("OTHER")){
									if(ob.getDelayReasonText()!=null){
								%>
							  - <integro:wrapper lineLength="50" value="<%=ob.getDelayReasonText() %>"  /> 
								<%}} %>
								&nbsp;</td>

										</tr>
									</logic:iterate>

								</logic:present>

							</tbody>
						</table>
						</td>

					</tr>
					<tr align="center">
						<td colspan="4">&nbsp;&nbsp;</td>
					</tr>
					<tr align="center">
						<td colspan="4"><a href="javascript:cancelPage();"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" />
						</a> &nbsp;&nbsp;</td>
					</tr>
				</tbody>
			</table>
			<!-- InstanceEndEditable --></td>
		</tr>

	</table>

	</body>
</html:form>
<!-- InstanceEnd -->
</html>
