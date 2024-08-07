<%@ page import="com.integrosys.cms.ui.commodityglobal.warehouse.list.WarehouseListAction,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commodityglobal.commodityuom.list.CommodityUOMListAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
    /**
    * Copyright Integro Technologies Pte Ltd
    * $Header: /home/cms2/cvsroot/cms2/public_html/commodityglobal/warehouse/list/select.jsp,v 1.5 2006/10/27 08:42:26 hmbao Exp $
    *
    * Purpose:
    * Description:
    *
    * @author $Author: hmbao $<br>
    * @version $Revision: 1.5 $
    * Date: $Date: 2006/10/27 08:42:26 $
    * Tag: $Name:  $
    */
%>
<%ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
 ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
     boolean isCMTMaker=false;
  TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CMT_MAKER){
                    isCMTMaker = true;
                    break TOP_LOOP;
                }
            }
        }
  }
     String event = CommodityUOMListAction.EVENT_READ;
     if (isCMTMaker) {
         event = CommodityUOMListAction.EVENT_PREPARE;
     }
%>


<html>
<head>
<title>Untitled Document</title>



<style>
table.tblInfo tbody tr td.fieldname {
width : 150px;
}
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<!-- InstanceEndEditable -->

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

function submitPage() {
    document.forms[0].submit();
}

//-->
</script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<html:form action="WarehouseList.do">
<input type="hidden" name="event" value="<%=event%>"/>

<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:15px">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
            <tr>
                <td colspan="2">Please select the Country</td>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td class="fieldname">Country</td>
                <td>
                    <html:select property="country">
                    <html:option value="">Please Select</html:option>
                    <html:options name="countryValues" labelName="countryLabels"/>
                    </html:select>&nbsp;
                    <html:errors property="country"/>
                </td>
            </tr>
        </tbody>
        </table>
    </td>
    </tr>
    <tr>
    <td>&nbsp;</td>
    </tr>
            <tr>
                <td style="text-align:center">
                    <input onclick="javascript:submitPage()" name="select" type="button" id="select" value="Select"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                </td>
            </tr>
    </tbody>
</table>

</html:form>

</body>
</html>
