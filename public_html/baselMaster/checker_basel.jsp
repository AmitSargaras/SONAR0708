
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,
	java.util.List,com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.app.baselmaster.bus.IBaselMaster,
	com.integrosys.cms.ui.baselmaster.MaintainBaselForm,
	com.integrosys.cms.app.baselmaster.trx.OBBaselMasterTrxValue,
	com.integrosys.cms.app.baselmaster.trx.IBaselMasterTrxValue,
	com.integrosys.cms.ui.collateral.CategoryCodeConstant,
	com.integrosys.cms.app.baselmaster.bus.OBBaselMaster,
	com.integrosys.base.techinfra.diff.CompareOBUtil"%>
	
	
<%

MaintainBaselForm baselForm = (MaintainBaselForm) request.getAttribute("MaintainBaselForm");
IBaselMasterTrxValue baselTrx = (OBBaselMasterTrxValue)session.getAttribute("com.integrosys.cms.ui.baselmaster.MaintainBaselMasterAction.IBaselMasterTrxValue");
OBBaselMaster actualBasel=(OBBaselMaster)baselTrx.getBaselMaster();
OBBaselMaster stageBasel=(OBBaselMaster)baselTrx.getStagingBaselMaster();

	//ISystemBankTrxValue systemBankTrx = (OBSystemBankTrxValue) request.getAttribute("ISystemBankTrxValue");
	String submitEvent = "checker_approve_edit";

	String rejectEvent = "checker_reject_edit";
	int sno = 0;
	int startIndex = 0;
%>



<html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		<script language="JavaScript" type="text/JavaScript"><!--

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
    document.forms[0].action="baselmaster.do?event=maker_list_component";
    
    document.forms[0].submit();
}
function approvePage() {
	
    document.forms[0].action="baselmaster.do?event=<%=submitEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="baselmaster.do?event=<%=rejectEvent%>";
    document.forms[0].submit();
}
function cancelPage(){
    document.forms[0].action="ToDo.do?event=prepare";
    document.forms[0].submit();
}

//
--></script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='baselmaster.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<br>
					<br>
					<br>
					<br>
					<tr>
						<td>
							<h3>
								Maintain Basel System Master
							</h3>
						</td>
					</tr>
					<tr>
						<td>
							<hr />
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInput">
								<thead>
								</thead>
								<tbody>
					<tr class="even">
             
              <td class="<%=CompareOBUtil.compOB(stageBasel,actualBasel,"system")? "fieldname":"fieldnamediff"%>"  width="20%">
               System Filed<font color="red">*</font>
              </td>
              <td width="30%"><span class="odd"> <%=stageBasel.getSystem() %>
								
							  </span></td>    
			  <td class="<%=CompareOBUtil.compOB(stageBasel,actualBasel,"systemValue")? "fieldname":"fieldnamediff"%>"  width="20%">
               Value Filed<font color="red">*</font>
              </td>  
              <td> <%=stageBasel.getSystemValue() %> </td>
            </tr>
            <tr class="odd">             
              <td class="<%=CompareOBUtil.compOB(stageBasel,actualBasel,"exposureSource")? "fieldname":"fieldnamediff"%>"  width="20%">Exposure Source System<font color="red">*</font></td>
                <td width="30%"> <%=stageBasel.getExposureSource() %></td>   
             <td class="<%=CompareOBUtil.compOB(stageBasel,actualBasel,"baselValidation")? "fieldname":"fieldnamediff"%>"  width="20%">Basel Validation<font color="red">*</font></td>
             <%String validation=stageBasel.getBaselValidation();
             if(validation.equals("L")){
            	 validation="Limit";
             }else{
            	 validation="Account";
             }%>
                 <td>
              <%=validation %>
              </td>             
            </tr>
            <tr class="even">             
              <td class="<%=CompareOBUtil.compOB(stageBasel,actualBasel,"reportHandOff")? "fieldname":"fieldnamediff"%>"  width="20%">To be reported in hand off<font color="red">*</font></td>
              <%String report=stageBasel.getReportHandOff();
              if(report.equals("Y")){
            	  report="Yes";
              }else{
            	  report="No";
              }%>
              <td colspan="3">
              <%=report %>
              </td>             
            </tr>
            
            
            
            
            
										
								</tbody>
							</table>
						</td>
					</tr>
			<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="odd"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></br><html:errors property="baselRemarksError"/></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=baselTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=baselTrx.getRemarks() != null
						? baselTrx.getRemarks()
						: ""%>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>

		</tbody>
			</table>

			<table width="130" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="65">
						&nbsp;
					</td>
					<td width="65">
						&nbsp;
					</td>
				</tr>
			
				<tr>


					 <td><a href="javascript:approvePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
    <td><a href="javascript:rejectPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
    <td><a href="javascript:cancelPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>
              