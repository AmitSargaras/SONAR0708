<%@ page import="com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralAssetLife,
                 com.integrosys.cms.app.collateral.trx.assetlife.OBCollateralAssetLifeTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.HashMap"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/systemparameters/assetlife/assetlife_maker_edit.jsp,v 1 2007/01/30 Jerlin Exp $
*
* Describe this JSP.
* Purpose: For Maker to edit Maintain Asset Life Parameters
* Description: changing the year of Maintain Asset Life Parameters
*
* @author $Author: Jerlin$<br>
* @version $Revision: 1$
* Date: $Date: 2007/01/30$
* Tag: $Name$
*/
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
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

function submitPage() {
    document.forms[0].action= "MaintainAssetLife.do?event=maker_edit_assetlife_confirm";
    document.forms[0].submit();
}
function gotoPreparePage() {
    document.forms[0].action="MaintainAssetLife.do?event=maker_view_assetlife";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<%
    ICollateralAssetLife[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.systemparameters.assetlife.MaintainAssetLifeAction.CollateralAssetLifeTrxValue");
    com.integrosys.cms.ui.systemparameters.assetlife.MaintainAssetLifeForm aForm = (com.integrosys.cms.ui.systemparameters.assetlife.MaintainAssetLifeForm) request.getAttribute("MaintainAssetLifeForm");
    OBCollateralAssetLifeTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    //System.out.println("------------------------------------obj: " + obj);

    if( obj!=null ) {
    	DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.OBCollateralAssetLifeTrxValue");
        obTrxValue = (OBCollateralAssetLifeTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );//true;

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_edit_assetlife_reject")) {
           parametersArray = obTrxValue.getStagingCollateralAssetLifes();
        } else {
           parametersArray = obTrxValue.getCollateralAssetLifes();
        }
        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'CollateralAssetLifesTrxValue' ");
    }
%>

<html:form action="MaintainAssetLife.do">

<body>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3>Asset Life</h3></td>
  </tr>
  <tr>
    <td>
    <hr />
    </td>

  </tr>
  </thead>
  <tbody>
  <tr>
    <td><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="10%">S/N</td>
              <td width="65%">Security Type / Security Sub-Type</td>
              <td width="25%">Useful Life of Asset&nbsp;<font color="#0000FF">* </font></td>
            </tr>
          </thead>
          <tbody>
          	<tr>
          	  <td colspan=3>Asset Based</td>
          	</tr>

          <%
              for (int i = 0; i < parametersArray.length; i++) {
                  ICollateralAssetLife parameter = parametersArray[i];
                  String yearValue[] = new String[parametersArray.length];
                              yearValue =aForm.getYearValues();

          %>
                      <html:hidden property="subTypeCodes" value='<%=""+parameter.getSubTypeCode()%>'/>

            <tr class='<%=(i%2==0?"even":"odd")%>'>
              <td class="index"><%=(i+1)%></td>
              <td><%=parameter.getSubTypeDesc()%></td>
              <td style="text-align:center;padding-right:5px">
               <html:text  property="yearValues"  value="<%=yearValue[i]%>" maxlength="3" size="3" /> &nbsp;year
                  <%--  <html:text property="maxValues" value='<%=""+ConvertFloatToString.getInstance().convertDouble(parameter.getMaxValue())%>' size="5" maxlength="5" />--%>
               <font color="#FF0000" size="1">
        <%	String errorString = "yearValues" + i; %>
                    	<html:errors property="<%=errorString%>" />
                    </font>
              </td>
            </tr>

            <%
              }
            %>
        </tbody>
      </table>
    </td>
  </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>
        <%if(isRejected ) {
    String paramUID = obTrxValue.getUserInfo();
    String paramRemarks = obTrxValue.getRemarks();
		    if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
    			paramRemarks=" ";
		    }%>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	    <tbody>
		  <tr>
        	<td width="43%" class="fieldname">Remarks</td>
	        <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
    	  </tr>
	      <tr>
      	    <td class="fieldname">Last Action By</td>
	        <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
          </tr>
          <tr class="odd">
            <td class="fieldname">Last Remarks Made</td>
            <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
          </tr>
        </tbody>
	    </table>
      <%}%>
      </td>
    </tr>
  </tbody>
</table>
<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href='<%=isRejected?"ToDo.do":"javascript:gotoPreparePage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
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
