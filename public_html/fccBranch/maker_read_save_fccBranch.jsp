<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
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
                 java.util.HashMap,
                 java.util.Locale,
                 java.util.Arrays"%>
<%@page import="com.integrosys.cms.ui.fccBranch.FCCBranchForm"%>                 
<%
	FCCBranchForm fccBranchForm = (FCCBranchForm) request.getAttribute("FCCBranchForm");
	DefaultLogger.debug("maker_list_fccBranch.jsp", "size is " + fccBranchForm+ "<<<<<<<<<<<<<<");
	String event = request.getParameter("event");
	pageContext.setAttribute("fccBranchList", fccBranchForm);
	int sno = 0;
	int startIndex = 0;
	
	IFCCBranchTrxValue trxvalue = (IFCCBranchTrxValue)session.getAttribute("com.integrosys.cms.ui.fccBranch.FCCBranchAction.IFCCBranchTrxValue");
	System.out.println("getFromState>>>>>"+trxvalue.getFromState());
	List branchList = (List)session.getAttribute("com.integrosys.cms.ui.fccBranch.FCCBranchAction.branchList");
	pageContext.setAttribute("branchList",branchList);	
%>



<%@page import="com.integrosys.cms.app.fccBranch.trx.IFCCBranchTrxValue"%>
<%@page import="org.apache.struts.util.LabelValueBean"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
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
	
function cancelPage(){
	
    document.forms[0].action="ToDo.do?event=prepare";
    
    document.forms[0].submit();
}
function submitForm(event) {
		document.forms[0].action="fccBranch.do?event=maker_save_update";
	    document.forms[0].submit();
}



</script>
<style type="text/css"><!--

.hiddenDiv {
	display: none;
	}
.visibleDiv {
	display: block;
	border: 1px grey solid;
	}
.style1 {color: #FF0000}
.style5 {color: #FF0000}
.style11 {color: #FF0000}
-->
</style>
<!-- InstanceEndEditable -->
</head>

<html:form action='fccBranch.do?'>
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <br>
  <br>
  <br>
  <br>
  <br>
  <tr>
<td>
							<h3>
								FCC Branch
							</h3>
						</td>
     
  </tr>
  <tr>
    <td><hr/></td>
  </tr>
  </thead>
  <tbody>
  <tr>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          </thead>
          <tbody>
   
            <tr class="odd">
              <td class="fieldname">Branch Code<font color="red">*</font></td>
                  <td>&nbsp;<html:text property="branchCode"/> <html:errors property="branchCodeError"/><html:errors property="fccBranchDuplicateError"/></td>    
              
              
             
           
            
             
              <td class="fieldname">Alias Branch Code<font color="red">*</font></td>
                  <td>&nbsp;<html:text property="aliasBranchCode"/> <html:errors property="aliasBranchCodeError"/><html:errors property="fccBranchCombinationDuplicateError"/></td>    
              
              
             
            </tr>
            
           
            <tr class="odd">
             
              <td class="fieldname" width="20%">Branch Name<font color="red">*</font></td>
              <td width="30%"><html:text property="branchName" maxlength="50" /><html:errors property="branchNameError"/>
              </td>
              
           
             
            <%if(trxvalue.getFCCBranch()==null){ %> 
            <td class="fieldname" >Status&nbsp;</td>
              <td >Enable<input type="radio" checked="checked" id="status" name="status" value="ACTIVE" disabled="disabled">
              &nbsp;
              Disable<input type="radio"  id="status" name="status" value="INACTIVE" disabled="disabled">&nbsp;</td>
            <%}else{ %>
             
             <td class="fieldname" >Status&nbsp;</td>
              <td >Enable<html:radio   property="status" value="ACTIVE" />&nbsp;
              Disable<html:radio  property="status" value="INACTIVE" />&nbsp;</td>
              
             <%} %> 
              
            </tr>
               
 <html:hidden  property="status"  />
<html:hidden name="FCCBranchForm" property="branchName"/>
<html:hidden name="FCCBranchForm" property="branchCode"/>
<html:hidden name="FCCBranchForm" property="aliasBranchCode"/>
<html:hidden name="FCCBranchForm" property="deprecated" />
<html:hidden name="FCCBranchForm" property="id"/>

                
                
            

          </tbody>
        </table> </td>
  </tr>
  

  </tbody>
</table>

<table width="130" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="65">&nbsp;</td>
    <td width="65">&nbsp;</td>
  </tr>
  <tr>
   <%if((event.equals("maker_update_save_process"))){%>
                   <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_update_save_process')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                    <%}else{ %>
                    <td colspan="2">
						<a href="#" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
							onClick=" submitForm('maker_save_create')"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" />
						</a>&nbsp;&nbsp;
					</td>
                     <%} %>
   

			<td colspan="2">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;&nbsp;
					</td>
 
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>


<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>
