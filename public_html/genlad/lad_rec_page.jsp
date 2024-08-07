<%@ page import="com.integrosys.cms.app.ddn.trx.IDDNTrxValue,
                 com.integrosys.cms.app.ddn.bus.*,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.ddn.bus.IDDNCustomerDetail,
                 com.integrosys.cms.ui.genddn.GenerateDDNForm,
                 com.integrosys.cms.app.ddn.bus.DDNCollateralInfo,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.OrgCodeList,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.transaction.OBCMSTrxHistoryLog,                 
				 com.integrosys.cms.app.common.util.*,
                 java.util.*"%>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.IDocumentHeld" %>
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.ICheckListProxyManager" %>
<%@ page import="com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory" %>
<%@ page import="com.integrosys.cms.app.checklist.bus.ICheckList" %>
<%@ page import="com.integrosys.cms.app.collateral.bus.ICollateral" %>
<%@ page import="com.integrosys.cms.app.chktemplate.bus.OBDocumentHeld" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<%
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID);

List ilads=(List)session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.ilads");
%>


<%@page import="com.integrosys.cms.app.lad.bus.ILAD"%>
<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
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

function onChangeOperation(){
	  var value=document.getElementById("1").value;
		 alert(value); 
		    document.forms[0].action="GenerateLAD.do?event=display&operation="+value;
		    document.forms[0].submit();

	}
function generateLAD() {

 	document.forms[0].action="GenerateLAD.do?event=prepare_generate";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/calendarb.gif','img/cancel2.gif')">
<html:form action="GenerateLAD" >
<input type="hidden" name="event" />
<input type="hidden" name="operation" />
<%--<input type="hidden" name="outerLimitID"/>--%>
<%--<input type="hidden" name="limitID"/>--%>
<%--<input type="hidden" name="outerLimitProfileID"/>--%>

<!-- InstanceBeginEditable name="Content" -->
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>--%>
<table width="97%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3>LAD Received listing </br></br></h3></td>
    </tr>
   
  </thead>
  <tbody>
   <tr>
      <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
          
          <tbody>
<!--            <tr class="odd">-->
<!--              <td height="22" class="fieldname">Select<br /> </td>-->
<!--              <td><select id="1" name="operation" onchange="javascript:onChangeOperation()"  >-->
<!--						<option value="">----Please Select----</option>-->
<!--						<option value="LADDUE">LAD Due</option>-->
<!--						<option value="LADGBNR">LAD Generated But Not Received</option>-->
<!--			   			<option value="LADREC" >LAD Received</option>-->
<!--			  	  </select>&nbsp;</td>-->
<!--              -->
<!--            </tr>-->
          </tbody>
        </table></td>
    </tr>
    <tr >
                        
										
						</tr>
						<tr>
						<td>
						 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                            <thead>
                             <td width="5%">S/N</td>
                                                        <td width="30%">LAD Name</td>
                                                         <td width="21%">LAD Received Date</td>
<!--                                                          <td width="21%">LAD Document Date</td>-->
                                                           <td width="21%">LAD Expiry Date</td>
                                                         <td width="21%">Action</td>
                            </thead>
                            <tbody>
                            <%
                            if(ilads!=null){
                            	if(ilads.size()!=0){
                                                    int _row = 0;
                                                    for (int z = 0; z < ilads.size(); z++) {
														ILAD ilad=(ILAD)ilads.get(z);
                                                       String rowClass = "";
                                                        _row++;
                                                        if (_row % 2 != 0) {
                                                            rowClass = "odd";
                                                        } else {
                                                            rowClass = "even";
                                                        }
                                                             
                                                        %>
                                                        
                                   <tr class="<%=rowClass%>">
                                                            <td class="index"><%=_row%></td>
                                                            <td><integro:empty-if-null value="<%=ilad.getLad_name()%>" />&nbsp;</td>
                                                             <td><integro:date object="<%=ilad.getReceive_date()%>"/>&nbsp;</td>
<!--                                                              <td><integro:empty-if-null value="<%=ilad.getDocument_date()%>"/>&nbsp;</td>-->
                                                               <td><integro:date object="<%=ilad.getExpiry_date()%>"/>&nbsp;</td>
                                   <td> 
                                   <%if(isUserCpcMaker){ %>
                                   <a href="GenerateLAD.do?event=prepare_view_lad&operation=LADREC&id=<%=ilad.getId()%>" >View&nbsp;</a>
                                   <%}else{ %>
                                   <a href="GenerateLAD.do?event=prepare_view_lad_view&operation=LADREC&id=<%=ilad.getId()%>" >View&nbsp;</a>
                                   <%} %>
                                   </td>                      
                                                        </tr>
                                                        <%
                                                    }
                                                }else{
                                                    %>      
                                               <tr >     
                                                    <td colspan="6">
                                						<bean:message key="label.global.not.found"/>                                
                                					</td>   
                                			   </tr>	
                                			   <%} }%>	                     
                            </tbody>
                            </table>
						</td>
						
						
						</tr>
  </tbody>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
