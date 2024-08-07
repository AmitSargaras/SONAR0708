<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="  com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping,
                com.integrosys.cms.app.cersaiMapping.bus.OBCersaiMapping,
                 java.util.*"%>
    
 <%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,com.integrosys.cms.app.cersaiMapping.trx.ICersaiMappingTrxValue,com.integrosys.cms.app.cersaiMapping.trx.OBCersaiMappingTrxValue"%>
    
<%

CersaiMappingForm cersaiMappingForm = (CersaiMappingForm) request
			.getAttribute("CersaiMappingForm");
ICersaiMappingTrxValue cersaiMappingTrx = (ICersaiMappingTrxValue)session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.ICersaiMappingTrxValue");
//ICersaiMappingTrxValue cersaiMappingTrx = (ICersaiMappingTrxValue)request.getAttribute("ICersaiMappingTrxValue");
	String submitEvent = "checker_approve_edit";

	String rejectEvent = "checker_reject_edit";
	
	ICersaiMappingTrxValue master1=(ICersaiMappingTrxValue)session.getAttribute("ICersaiMappingTrxValue");
	if(cersaiMappingTrx == null){
		cersaiMappingTrx = (ICersaiMappingTrxValue)request.getAttribute("ICersaiMappingTrxValue");
	}
	OBCersaiMapping oc=(OBCersaiMapping)cersaiMappingTrx.getStagingCersaiMapping();
	String mastername=oc.getMasterName();
	if(mastername==null){
		mastername=(String)request.getAttribute("masterName");
		if(mastername==null){
			mastername=(String)session.getAttribute("masterName");
		}
	}
	int counter = 0;
	
	ICersaiMapping[] masterValueList2 = (ICersaiMapping[])session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterValueList");
	
	ICersaiMapping[] masterValueList3 = (ICersaiMapping[])session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterValueList");
	
		
	ICersaiMapping[] ListOfValue1 = (ICersaiMapping[])session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.ListOfValue");
	
	if(null!=ListOfValue1){
		for(int i=0;i<ListOfValue1.length;i++){
		String cersaiVal=	ListOfValue1[i].getCersaiValue();
		String climval=ListOfValue1[i].getClimsValue();
		System.out.println("Clims Value === "+climval+"    ====  Cersai Value  === "+cersaiVal);
		}
		}else{
			System.out.println("List Of Value is Null ====");
		}
	
	
	
	if(null!=masterValueList3){
		for(int i=0;i<masterValueList3.length;i++){
		String cersaiVal=	masterValueList3[i].getCersaiValue();
		String climval=masterValueList3[i].getClimsValue();
		System.out.println("Clims Value masterValueList3 === "+climval+"    ====  Cersai Value masterValueList3  === "+cersaiVal);
		}
		}else{
			System.out.println("List Of Value is Null ====");
		}
	
	
	if(null!=masterValueList2){
	for(int i=0;i<masterValueList2.length;i++){
	String cersaiVal=	masterValueList2[i].getCersaiValue();
	}
	}
	
	pageContext.setAttribute("masterValueList", masterValueList2);
	session.setAttribute("masterValueList", masterValueList2);
	
	pageContext.setAttribute("ListOfValue", ListOfValue1);
	session.setAttribute("ListOfValue", ListOfValue1);
	
	if (!(mastername == null)) {
		pageContext.setAttribute("masterName", mastername);
		session.setAttribute("masterName", mastername);
		}
	
	if (!(cersaiMappingTrx == null)) {
		pageContext.setAttribute("ICersaiMappingTrxValue", cersaiMappingTrx);
		session.setAttribute("ICersaiMappingTrxValue", cersaiMappingTrx);
		}
	
	int startIndex = 0;
    String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
		
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>


<script language="JavaScript" type="text/JavaScript">

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

function approvePage() {
    document.forms[0].action="cersaiMapping.do?event=<%=submitEvent%>";
    document.forms[0].submit();
}
function rejectPage() {
    document.forms[0].action="cersaiMapping.do?event=<%=rejectEvent%>";
	document.forms[0].submit();
}
function cancelPage() {
	document.forms[0].action = "ToDo.do?event=prepare";
	document.forms[0].submit();
}
//-->
</script>
</head>

<html:form action='cersaiMapping.do?'>
<body>
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
						<h3>Cersai Mapping</h3>
					</td>
				</tr>
			</thead>
			<tbody>
			
			<tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      <tr class="even">
          <td class="fieldname" width="29%">Master Name&nbsp;</td>
          <td width="71%"><%=mastername%>
          <!--  
               <html:select property="masterName">
         				<html:option value="">Please Select</html:option> 
                </html:select>-->
                     
            </td>
        </tr>
      </table>
    </td>
    </tr>
    
    
    <tr>
                          <td  colspan="2">
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                              <td width="5%">S/N</td>                            
                              <td width="40%">Clims Value</td>
                              <td width="45%">CERSAI Value</td>
                            </tr>
                            </thead>
                            <logic:present name="ListOfValue">
                            <logic:iterate id="OB" length="10" indexId="counter1"
                    offset="<%=String.valueOf(startIndex)%>" name="ListOfValue" type="com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping" scope="page">
					  
                   <%
                       String rowClass = "";
                       counter++;
                       if ( counter%2 != 0 ) {
                           rowClass = "odd";
                       } else {
                           rowClass = "even";
                       }
                       
                       
                      // String[] aa=OB.getClimsValues();
                       //int a=aa.length;
						
                     //  String itemURL = "DiaryItem.do?event=read&frompage=list_non_expired&itemId="+OB.getItemID();
                  %>
                  <tbody>
                  
                    <tr class=<%=rowClass%>>
                    
                    <%
                    boolean fla=false;
                    for(int k=0;k<masterValueList3.length;k++){
                    if((OB.getClimsValue()).equalsIgnoreCase(masterValueList3[k].getClimsValue())){ %>
                    
                      <td class="index" width="5%" style="background-color: #638FC7;"><%=counter1.intValue()+1%></td>
                       <td width="45%"><integro:wrapper value="<%=OB.getClimsValue()%>" /><input type="hidden" name="climsValues" value="<%=OB.getClimsValue()%>"/></td>  
                      <td width="40%">
                	<integro:wrapper value="<%=OB.getCersaiValue()%>" /><input type="hidden" name="updatedCersaiValue" value="<%=OB.getCersaiValue()%>"/>
            </td>  
                      <%
                    fla=true;
                      break;
                    }}
                    if(fla == false){
                    %>
                      <td class="index" width="5%"><%=counter1.intValue()+1%></td>
                      <td width="45%"><integro:wrapper value="<%=OB.getClimsValue()%>" /><input type="hidden" name="climsValues" value="<%=OB.getClimsValue()%>"/></td>  
                      <td width="40%">
                	<integro:wrapper value="<%=OB.getCersaiValue()%>" /><input type="hidden" name="updatedCersaiValue" value="<%=OB.getCersaiValue()%>"/>
            </td>  
            <%} %>
                    </tr>
                              </tbody>
                             
                              </logic:iterate>
                              <% if (counter == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <%} %>
                </logic:present>
                 <logic:notPresent name="ListOfValue">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                            
                            </table>
                            </td>
                            </tr>
                            <html:hidden name="CersaiMappingForm" property="lastUpdateBy" />
                            <html:hidden name="CersaiMappingForm" property="status" />
							<html:hidden name="CersaiMappingForm" property="createBy" />
							<html:hidden name="CersaiMappingForm" property="lastUpdateDate" />
							<html:hidden name="CersaiMappingForm" property="creationDate" />
							<html:hidden name="CersaiMappingForm" property="deprecated" />
							<html:hidden name="CersaiMappingForm" property="id" />
    
			 	<tr>
					<td>
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0" class="tblInfo">
							<tbody>
								<tr>
									<td class="fieldname">Remarks</td>
									<td class="odd"><textarea name="remarks" rows="4"
											style="width: 100%"></textarea></br>
									<html:errors property="facilityRemarksError" /> 
									</td>
								</tr>
								<tr>
									<td class="fieldname">Last Action By</td>
									<td class="even"><%=cersaiMappingTrx.getUserInfo()%>&nbsp;</td>
								</tr>
								<tr class="odd">
									<td class="fieldname">Last Remarks Made</td>
									<td><%=cersaiMappingTrx.getRemarks() != null ? cersaiMappingTrx.getRemarks() : ""%>&nbsp;</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				
				<logic:present name="ListOfValue">
              <tr>
                <td height="25">
					<!-- InstanceBeginEditable name="GeneralPurposeBar" -->
                    <table  width="100%" border="0" cellspacing="0" cellpadding="0">
                         
					<tr>
					    <td height="25">
					        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
					            <tr>
					                <td valign="middle">
					                    <integro:pageindex
					                            pageIndex="<%=new PageIndex(startIndex, 10, ListOfValue1.length)%>"
					                            url="cersaiMapping.do?event=checker_list_pagination&startIndex="/>
					                </td>
					            </tr>
					        </table>
					    </td>
					</tr>
					
                      </table>
                 </td>
              </tr>
              </logic:present>
               

			</tbody>
		</table>
		<table width="130" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="65">&nbsp;</td>
				<td width="65">&nbsp;</td>
			</tr>
			<tr>
				<td><a href="javascript:approvePage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
						src="img/approve1.gif" name="Image8" width="80" height="20"
						border="0" id="Image8" /></a></td>
				<td><a href="javascript:rejectPage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
						src="img/reject1.gif" name="Image9" width="70" height="20"
						border="0" id="Image9" /></a></td>
				<td><a href="javascript:cancelPage();"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
						src="img/cancel1.gif" name="Image1" border="0" id="Image1" /></a></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		</table>
</body>
</html:form>
</html>