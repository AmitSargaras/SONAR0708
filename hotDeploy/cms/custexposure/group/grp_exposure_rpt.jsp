<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.custgrpi.bus.ICustGrpIdentifier,
				 com.integrosys.cms.app.custgrpi.bus.OBCustGrpIdentifier,
                 java.util.Locale,
				 com.integrosys.cms.app.custexposure.trx.group.IGroupExposureTrxValue,
				 com.integrosys.cms.app.custexposure.trx.group.OBGroupExposureTrxValue,
				 java.util.Date,
				 com.integrosys.component.user.app.bus.ICommonUser,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
				 com.integrosys.cms.app.custexposure.bus.group.OBGroupExposure,
				 com.integrosys.cms.app.custexposure.bus.group.IGroupExposure,
				 com.integrosys.cms.app.custexposure.bus.group.IGroupExpBankEntity,
				 com.integrosys.cms.app.custexposure.bus.group.OBGroupExpBankEntity,
				 com.integrosys.cms.app.custexposure.bus.group.OBGroupExpCustGrp,
				 com.integrosys.cms.app.custexposure.bus.group.IGroupExpCustGrp,
				 com.integrosys.cms.batch.reports.OBReport"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Purpose: view group exposure report list
*
* @author $Grace Teh$<br>
* @version $Revision$
* Date: $12 August 2008$
* Tag: $Name$
*/
%>

<%
    int rowIdx = 0;
    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
    ICommonUser user = (ICommonUser) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    String sub_profile_id = (String) request.getParameter("sub_profile_id");
    String event = (String) request.getParameter("event");
    String grpNo = (String) request.getParameter("grpID");
    String startIndex = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "startIndex");
    
    IGroupExposure stagingObj = null;  
    IGroupExpBankEntity[] grpEntityLimit = null;
    ICustGrpIdentifier  grpIdn =  null;
    IGroupExpCustGrp custGrp = null;
    IGroupExposureTrxValue trxValue = (IGroupExposureTrxValue) session.getAttribute("com.integrosys.cms.ui.custexposure.group.GrpExposureAction.GroupExposureTrxValue");
    
    if (trxValue != null){
        stagingObj = trxValue.getGroupExposure();
    }

    if (stagingObj == null){
        stagingObj = new OBGroupExposure();
    } 
 
    custGrp = stagingObj.getGroupExpCustGrp();
    grpEntityLimit = stagingObj.getGroupExpBankEntity();

    Date searchDate = (Date) request.getAttribute("searchDate");
    String countryName = (String) request.getAttribute("countryName");
    OBReport[] objReportList = (OBReport[]) request.getAttribute("OBReportList");

    if (objReportList != null ) {
      pageContext.setAttribute("OBReportList",objReportList);
    }
    int counter = 0;
    
    if(custGrp != null){
		  grpIdn = custGrp.getCustGroup();
	}	
%>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script language="Javascript" type="text/javascript">
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
				
				function goView(folderPath, name, reportID, fileName) {
                   var strURL = 'ReportServlet?flag=view&scope=GRP&save='+fileName+'&reportId='+reportID+'&path='+folderPath+'&name='+name;
                   displayReportFrame.location=strURL;
        		}
     -->
    </script>
</head>

<body>

<html:form action="CustExposure.do?event=grp_exposure_rpt>">

 <input type="hidden" name="name"/>
 <input type="hidden" name="path"/>
 <input type="hidden" name="flag" value="view"/>
 <input type="hidden" name="scope" value="GRP"/>
 <input type="hidden" name="save"/>
 <input type="hidden" name="reportId"/>
      
 <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <%if(grpIdn != null){%>
      <td width="75%"><h3><bean:message key="title.report.setup"/> - <%=grpIdn.getGroupName()%> (<bean:message key="label.group.id"/>  <%=Long.toString(grpIdn.getGrpNo())%> ) </h3></td>
      <%}%>
        <tr>
            <td colspan="2"><hr/></td>
        </tr>
  </thead>
 
  <tbody>
    <tr>
      <td colspan="2">
       <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
            <tr>
              <td width="4%"><bean:message key="label.global.sno"/></td>
              <td width="8%"><bean:message key="label.report.no"/></td>
              <td width="55%"><bean:message key="label.rpt.title"/></td>
			  			<td width="12%"><bean:message key="label.rpt.date"/></td>
              <td width="20%"><bean:message key="label.global.action"/></td>
            </tr>
          </thead>
          
          <tbody>
            <logic:present name="OBReportList">
                <logic:iterate id="OB" name="OBReportList" type="com.integrosys.cms.batch.reports.OBReport">
                <% 
	                if(grpNo.equals(OB.getGroupID())){
			                counter++;
				 %>  
                   <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index"><%=counter%></td>
                        <td>&nbsp;<bean:write name="OB" property="MISReportNumber"/></td>
                        <td><bean:write name="OB" property="title"/></td>
                        <td>
                           <% if (searchDate !=  null) { %>
                            <integro:date object="<%=searchDate%>" simpleDateFormat="dd/MM/yyyy"/>
                            <%}else{%>
                            -
                            <%}%>
                          </td>
                        <td style="text-align:center">

                                  <%  if (OB.getHasPDF()) {
                                    %>
                                        <input type="button" name="Button" value="View PDF" class="btnNormal" style="width:80"
                                               onclick="goView('<%=OB.getFolderPath()%>', '<%=OB.getPdfName()%>', <%=OB.getReportId()%>, '<%=OB.getFileName()+".pdf"%>') "/>
                                    <% }
                                       if (OB.getHasXLS()) {
                                    %>
                                        <input type="button" name="Button3" value="View Excel" class="btnNormal" style="width:80"
                                               onclick="goView('<%=OB.getFolderPath()%>', '<%=OB.getXlsName()%>', <%=OB.getReportId()%>, '<%=OB.getFileName()+".xls"%>') "/>
                                    <% } %>
                        </td>
                    </tr>
                  <%}%>
                </logic:iterate>
            </logic:present>
             <% if (counter ==0) {  %>
                    <tr class="odd">
                         <td colspan="5"> <bean:message key="label.global.not.found" /></td>
                    </tr>
             <% } %>
        </tbody>
    </table>
   <br/>
    <table width="60%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td align="center">
                <a href="javascript:history.go(-1);" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Return','','img/return2.gif',1)">
                    <img src="img/return1.gif" name="Return" border="0">
                </a>
            </td>
        </tr>
    </table>
</td>
        </tr>
    </table>

</html:form>
<iframe name='displayReportFrame' src='refresh.gif' width='0' height='0' frameborder='0' scrolling='no'></iframe>
</body>
</html>

