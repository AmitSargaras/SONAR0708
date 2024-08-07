
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
	java.util.List,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.ui.component.MaintainComponentForm,com.integrosys.cms.app.component.trx.IComponentTrxValue,com.integrosys.cms.app.component.trx.OBComponentTrxValue"%>
<%
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
String event = request.getParameter("event");
IFileUploadTrxValue itrxValue=(IFileUploadTrxValue)session.getAttribute("com.integrosys.cms.ui.fileUpload.FileUploadAction.IFileUploadTrxValue");
List ubsList =(List) session.getAttribute("com.integrosys.cms.ui.fileUpload.FileUploadAction.ubsList");;
if(ubsList!=null){
	
	
	pageContext.setAttribute("ubsList",ubsList);
}
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> itrxValue>"+itrxValue.getTransactionSubType());
int sno = 0;
	int startIndex = 0;
	
	String heading="";
	if("UBS_UPLOAD".equals(itrxValue.getTransactionSubType())){
		heading="UBS File Upload";
	}else if("HONGKONG_UPLOAD".equals(itrxValue.getTransactionSubType())){
		heading="HongKong File Upload";
	}else if("FINWARE_UPLOAD".equals(itrxValue.getTransactionSubType())){
		heading="Finware File Upload";
	}else if("BAHRAIN_UPLOAD".equals(itrxValue.getTransactionSubType())){
		heading="Bahrain File Upload";
	}
%>



<%@page import="com.integrosys.cms.app.fileUpload.trx.IFileUploadTrxValue"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><html>
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
	
    document.forms[0].action="ToDo.do?event=totrack";
    
    document.forms[0].submit();
}
function submitPage(){
	
    document.forms[0].action="fileUpload.do?event=maker_close_ubs_file";
    
    document.forms[0].submit();
}

//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='fileUpload.do?'>
		<body>
			
<thead>
<h3><%=heading %></h3>
<br></br>
</thead>
<tbody>
<tr>
<td colspan="4" align="center">
<table width="90%" border="0" cellspacing="0" cellpadding="0" class="tblInfo" align="center">
                              <thead>
                                <tr>
                                  <td width="3%">S/N</td>
                                  <td width="6%">Customer</td>
                                  <td width="6%">Line No.</td>
                                  <td width="5%">Serial No.</td>
                                  <td width="5%">Currency</td>
                                  <td width="8%">Limit Amount</td>
                                  <td width="8%">Utilize Amount</td>
                                  <td width="5%">Status</td>
                                  <td width="54%">Reason</td>
                                </tr>
                              </thead>
                             <%if("UBS_UPLOAD".equals(itrxValue.getTransactionSubType())){ %>
                              <tbody>
                                <logic:present name="ubsList">
                    <logic:iterate id="ob" name="ubsList" 
                                     
                    indexId="counter"
                     type="com.integrosys.cms.app.fileUpload.bus.OBUbsFile" scope="page">
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
                                   <td><center><%=ob.getCustomer()%>&nbsp;</center></td>
                                   <td><center><%=ob.getLine()%>&nbsp;</center></td>
                                   <td><center><%=ob.getSerialNo()%>&nbsp;</center></td>
                                   <td><center><%=ob.getCurrency()%>&nbsp;</center></td> 
                                   <td><center>
                                   <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getLimit()))%>" />&nbsp;</center>
                                   </td> 
                                   <td><center> 
                                    <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getUtilize()))%>" />&nbsp;</center>                     
                                  </td>
                                  <td><center><%=ob.getStatus()%>&nbsp;</center></td> 
                                   <td><center><%=ob.getReason()%>&nbsp;</center></td> 
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
                <logic:notPresent name="ubsList">
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                </logic:notPresent>
                              </tbody>
                              <%}else if("HONGKONG_UPLOAD".equals(itrxValue.getTransactionSubType())){ %>
                              <tbody>
                              <logic:present name="ubsList">
                  <logic:iterate id="ob" name="ubsList" 
                                   
                  indexId="counter"
                   type="com.integrosys.cms.app.fileUpload.bus.OBHongKongFile" scope="page">
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
                                 <td><center><%=ob.getCustomer()%>&nbsp;</center></td>
                                 <td><center><%=ob.getLine()%>&nbsp;</center></td>
                                 <td><center><%=ob.getSerialNo()%>&nbsp;</center></td>
                                 <td><center><%=ob.getCurrency()%>&nbsp;</center></td> 
                                 <td><center>
                                 <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getLimit()))%>" />&nbsp;</center>
                                 </td> 
                                 <td><center> 
                                  <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getUtilize()))%>" />&nbsp;</center>                     
                                </td>
                                 <td><center><%=ob.getStatus()%>&nbsp;</center></td> 
                                   <td><center><%=ob.getReason()%>&nbsp;</center></td> 
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
              <logic:notPresent name="ubsList">
                              <tr class="odd">
                              	<td colspan="10">
                              		<bean:message key="label.global.not.found"/>                                
                              	</td>
                              </tr>
              </logic:notPresent>
                            </tbody>
                            <%}else if("FINWARE_UPLOAD".equals(itrxValue.getTransactionSubType())){ %>
                            <tbody>
                              <logic:present name="ubsList">
                  <logic:iterate id="ob" name="ubsList" 
                                   
                  indexId="counter"
                   type="com.integrosys.cms.app.fileUpload.bus.OBFinwareFile" scope="page">
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
                                 <td><center><%=ob.getCustomer()%>&nbsp;</center></td>
                                 <td><center><%=ob.getLine()%>&nbsp;</center></td>
                                 <td><center><%=ob.getSerialNo()%>&nbsp;</center></td>
                                 <td><center><%=ob.getCurrency()%>&nbsp;</center></td> 
                                 <td><center>
                                 <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getLimit()))%>" />&nbsp;</center>
                                 </td> 
                                 <td><center> 
                                  <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getUtilize()))%>" />&nbsp;</center>                     
                                </td>
                                 <td><center><%=ob.getStatus()%>&nbsp;</center></td> 
                                   <td><center><%=ob.getReason()%>&nbsp;</center></td> 
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
              <logic:notPresent name="ubsList">
                              <tr class="odd">
                              	<td colspan="10">
                              		<bean:message key="label.global.not.found"/>                                
                              	</td>
                              </tr>
              </logic:notPresent>
                            </tbody>
                             <%}else if("BAHRAIN_UPLOAD".equals(itrxValue.getTransactionSubType())){ %>
                            <tbody>
                              <logic:present name="ubsList">
                  <logic:iterate id="ob" name="ubsList" 
                                   
                  indexId="counter"
                   type="com.integrosys.cms.app.fileUpload.bus.OBBahrainFile" scope="page">
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
                                 <td><center><%=ob.getCustomer()%>&nbsp;</center></td>
                                 <td><center><%=ob.getLine()%>&nbsp;</center></td>
                                 <td><center><%=ob.getSerialNo()%>&nbsp;</center></td>
                                 <td><center><%=ob.getCurrency()%>&nbsp;</center></td> 
                                 <td><center>
                                 <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getLimit()))%>" />&nbsp;</center>
                                 </td> 
                                 <td><center> 
                                  <integro:amount param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),String.valueOf(ob.getUtilize()))%>" />&nbsp;</center>                     
                                </td>
                                 <td><center><%=ob.getStatus()%>&nbsp;</center></td> 
                                   <td><center><%=ob.getReason()%>&nbsp;</center></td> 
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
              <logic:notPresent name="ubsList">
                              <tr class="odd">
                              	<td colspan="10">
                              		<bean:message key="label.global.not.found"/>                                
                              	</td>
                              </tr>
              </logic:notPresent>
                            </tbody>
                            <%} %>
                            </table></td>
          
</tr>
<tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>		
      <tr>
        <td colspan="4" align="center">
	  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
              
              <tr>
                <td class="fieldname">Last Action By</td>
               	<td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
              </tr>
              <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
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
				<td colspan="2">
				<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
				</td>

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
