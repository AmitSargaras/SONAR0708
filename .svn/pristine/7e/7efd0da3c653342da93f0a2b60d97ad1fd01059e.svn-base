<!--Modified by Pratheepa for CR148-->
<%@ page import="com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.limit.bus.ITATEntry,
                 java.util.HashMap,
                 java.util.Date,
                 java.util.ArrayList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.ui.bfl.BflHelper,
                 com.integrosys.component.user.app.bus.ICommonUser"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->



<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">

function MM_preloadImages() { //v3.0
    var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_jumpMenu(targ,selObj,restore){ //v3.0
    eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
    if (restore) selObj.selectedIndex=0;
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

function clearToken() {
    var obj = document.getElementById("<%= org.apache.struts.taglib.html.Constants.TOKEN_KEY %>");
    obj.value = "";
}

function gotopage(reqURL) {
    clearToken();
    document.forms[0].action=reqURL;
    document.forms[0].submit();
}


</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/return2.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="Bfl.do?event=reminder_bfl">

<%
    ICommonUser user = (ICommonUser) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    boolean userAccess = false;
    TOP_LOOP:
        for (int i=0; i<userTeam.getTeamMemberships().length; i++)
        {//parse team membership to validate user first
            for (int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length; j++)
            {  //parse team memebers to get the team member first..
                if (userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID() == user.getUserID())
                {
                    if  (userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID() == ICMSConstant.TEAM_TYPE_CPC_CHECKER) {
                        userAccess = true;
                        DefaultLogger.debug(this, "User is cpc checker...");
                        break TOP_LOOP;
                    }
                    else {
                        userAccess=false;
                    }
                }
            }
        }
        
    	HashMap rs = null;
	String event_from = (String)request.getAttribute("event");
	if(event_from.equals("print_bfl_reminder"))
		rs = (HashMap) request.getAttribute("infoMap");
	else
		rs = (HashMap) request.getAttribute("infoMap_print_bfl_reminder");

    
    ArrayList resList = (ArrayList) rs.get ("tatList");
    ITATEntry[] tatEntryList = (ITATEntry[]) resList.toArray (new ITATEntry[0]);
    
    tatEntryList = BflHelper.sortTatEntryList(tatEntryList,event_from);
    
    
    String st = (String) request.getAttribute("reminder");
    request.setAttribute("cpcchecker",new Boolean(userAccess));
%>
<input type="hidden" name="cpcchecker" value="<%=userAccess%>"/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.bfl.reminder.clean"/></h3></td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>

  <tbody>
    <tr>
      <td>
        <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
          <thead>
            <tr>
              <td width="4%"><bean:message key="label.global.sn"/></td>
              <td width="25%"><bean:message key="label.bfl.last.print.reminder.date"/></td>
              <td width="71%"><bean:message key="label.remarks"/></td>
            </tr>
          </thead>
          <tbody>
          <%
          	int row = 0;
              	String rowClass="";
          	if (st!= null && (st.equals("false"))) {
				
		%>
				<tr class="<%=rowClass%>">
					<td align="right" colspan="3">Reminder not Required</td>
				</tr>
		<%

              
             }else  if (tatEntryList != null && tatEntryList.length != 0)
              {
                  for (int i=0; i < tatEntryList.length; i++)
                  {
                      row++;
                      if (row%2 != 0) {
                          rowClass = "odd";
                      } else {
                          rowClass="even";
                      }
                      %>
                      <tr class="<%=rowClass%>">
                        <td class="index" width="4%" ><%=row%></td>
                        <td width="25%" ><%=DateUtil.formatDate("dd MMM yyyy HH:mm:ss",tatEntryList[i].getTATStamp())%></td>
                        <td width="71%" ><integro:htmltext value="<%=tatEntryList[i].getRemarks()%>" /></td>
                    </tr>
          <%
                  }
              }
	      else{ %>
		<tr class="<%=rowClass%>">
			<td align="right" colspan="3"><bean:message key="label.bfl.no reminder.none"/></td>
		</tr>
	     <%
		} %>

              
             
              
              
          
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>

<br>
<% if (userAccess && st!=null && (!st.equals("false")) && event_from.equals("print_bfl_reminder")) {%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
  <tr>
    <td width="20%" class="fieldname"><bean:message key="label.remarks"/></td>
    <td width="80%"><html:textarea property="tatRemarks" rows="5" cols="100" /></td>
  </tr>
</tbody>
</table>
<table width="95%" align="center">
  <tr>
    <td><html:errors property="tatRemarks"/></td>
  </tr>
</table>
<h5 align="center"><bean:message key="label.bfl.reminder.msg"/></h5>

<table width="140" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="79">&nbsp;</td>
    <td width="71">&nbsp;</td>
  </tr>
  <tr>
    <td></td>
    <td><input type="button" name="Submit" value="Update Time Stamp" style="width:120px"  class="btnNormal" onclick="gotopage('Bfl.do?event=confirm_print_bfl_reminder&cpcchecker =true')" /></td>
    <td>&nbsp;&nbsp;&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<% } %>
<%if(st!=null && (!st.equals("false"))){%>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:0;margin-bottom:20px">
  <thead>
    <tr >
      <td valign="top"><bean:message key="label.remarks"/></td>
      <td valign="top"><bean:message key="label.reminder"/></td>
      <td  valign="top"><bean:message key="label.global.action"/></td>
    </tr>
  </thead>
  <tbody>
    <tr class="odd">
      <td valign="top" class="index">1</td>
      <td valign="top"><bean:message key="label.bfl.os.reminder"/></td>
      <td valign="top" style="text-align:center"><input type="button" name="Button22" value="View" class="btnNormal" style="width:60" onclick="gotopage('Bfl.do?event=reminder_bfl')" /></td>
    </tr>
  </tbody>
</table>
<% } %>
</html:form>
</body>
</html>