<%@ page import="com.integrosys.cms.ui.srp.global.SRPGlobalConstants,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.app.collateral.bus.ICollateralSubType,
                 com.integrosys.cms.app.collateral.trx.parameter.OBCollateralSubTypeTrxValue,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.HashMap,
                 com.integrosys.cms.ui.common.ConvertFloatToString"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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

function checkAll(selectAllfName) {
    var formObj = document.forms[0];
    var count = eval("formObj."+selectAllfName).length;
    //checkbox.length returns "undefine" if its anything less than 2
    if (count > 1) {
        if (eval("formObj.selectAll"+selectAllfName).checked) {
            for (var i = 0; i < count; i++) {
                eval("formObj."+selectAllfName+"[i]").checked = true;
            }
        } else {
            for (var i = 0; i < count; i++) {
                eval("formObj."+selectAllfName+"[i]").checked = false;
            }
        }
    } else {
        if (eval("formObj.selectAll"+selectAllfName).checked) {
            eval("formObj."+selectAllfName).checked = true;
        } else {
            eval("formObj."+selectAllfName).checked = false;
        }
    }
}

function submitPage() {
    document.forms[0].action='<%=SRPGlobalConstants.ACTION_URL+"?event=maker_edit_srpglobal"%>';
    document.forms[0].submit();
}
function gotoPreparePage() {
    document.forms[0].action='<%=SRPGlobalConstants.ACTION_URL+"?event=maker_prepare_srpglobal"%>';
    document.forms[0].submit();
}
function closeEditRejected() {
    document.forms[0].action='<%=SRPGlobalConstants.ACTION_URL+"?event=maker_cncl_reject_edit"%>';
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<%
    ICollateralSubType[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.srp.global.SRPGlobalAction.CollateralSubTypeTrxValue");
    com.integrosys.cms.ui.srp.global.SRPGlobalForm aForm = (com.integrosys.cms.ui.srp.global.SRPGlobalForm) request.getAttribute("SRPGlobalForm");
    OBCollateralSubTypeTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {       
        obTrxValue = (OBCollateralSubTypeTrxValue)obj;

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_edit_srpglobal_read_rejected")) {
           parametersArray = obTrxValue.getStagingCollateralSubTypes();
        } else {
           parametersArray = obTrxValue.getCollateralSubTypes();
        }
    }
%>

<html:form action="SRPCountry.do?">

<body>
<!-- InstanceBeginEditable name="Content" -->
<%@include file="/common/mandatory_for_submission_note.jsp" %>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>&nbsp;</td>
    </tr>
  <tr>
      <td><h3>SRP - Global Parameter and Eligible Security - <%=obTrxValue.getCollateralSubTypes()[0]!=null?obTrxValue.getCollateralSubTypes()[0].getTypeName():"SECURITY_SUBTYPE_IS_NULL"%></h3></td>
  </tr>
  <tr>
    <td>
    <hr />
    </td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
          <thead>
            <tr class="tblInfo">
              <td width="8%">S/N</td>
              <td width="50%">Description</td>
              <td width="10%">Max %&nbsp;<font color="#00AAFF">* </font></td>
							<td width="10%">Standardised Approach<br>
                <input type="checkbox" name="selectAllsubTypeStandardisedApproach"   value="Check All"
                onclick="checkAll('subTypeStandardisedApproach');" />
                Select&nbsp;All
							</td>
              <td width="10%">Foundation IRB <br>
                <input type="checkbox" name="selectAllsubTypeFoundationIRB"   value="Check All"
                onclick="checkAll('subTypeFoundationIRB');" />
                Select&nbsp;All 
							</td>
              <td width="10%">Advanced IRB <br>
                <input type="checkbox" name="selectAllsubTypeAdvancedIRB"   value="Check All"
                onclick="checkAll('subTypeAdvancedIRB');" />
                Select&nbsp;All 
							</td>
            </tr>
          </thead>
          <tbody>

          <%
              for (int i = 0; i < parametersArray.length; i++) {
                  ICollateralSubType parameter = parametersArray[i];
                  String maxValue[] = new String[parametersArray.length];
                         maxValue = aForm.getMaxValues();
          %>
            <html:hidden property="securityTypeCode" value='<%=""+parameter.getTypeCode()%>'/>
            <html:hidden property="subTypeCodes" value='<%=""+parameter.getSubTypeCode()%>'/>
            <tr class='<%=(i%2==0?"even":"odd")%>'>
              <td class="index"><%=(i+1)%></td>
              <td><%=parameter.getSubTypeDesc()%></td>
              <td style="text-align:center;padding-right:5px">
               <html:text  property="maxValues"  value="<%=maxValue[i]%>" maxlength="3" size="3" /> &nbsp;
                  <%--  <html:text property="maxValues" value='<%=""+ConvertFloatToString.getInstance().convertDouble(parameter.getMaxValue())%>' size="5" maxlength="5" />--%>
               <font color="#FF0000" size="1">
                  <%	String errorString = "maxValues" + i; %>
                    	<html:errors property="<%=errorString%>" />
                    </font>
              </td>
							<td style="text-align:center"><input name="subTypeStandardisedApproach" type="checkbox" value='<%=i%>' <%if(parameter.getSubTypeStandardisedApproach()){ %> checked <% } %> /></td>
							<td style="text-align:center"><input name="subTypeFoundationIRB" type="checkbox" value='<%=i%>' <%if(parameter.getSubTypeFoundationIRB()){ %> checked <% } %> /></td>
							<td style="text-align:center"><input name="subTypeAdvancedIRB" type="checkbox" value='<%=i%>' <%if(parameter.getSubTypeAdvancedIRB()){ %> checked <% } %> /></td>
            </tr>
            <%
              }
            %>
          </tbody>
    	</table>
      </td>
  </tr>
<%
	if(isRejected ) {
%>  
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
      <jsp:include page="../srp_remarks_section_include.jsp" flush="true" >
        <jsp:param name="UID" value='<%=obTrxValue.getUserInfo()%>' />
        <jsp:param name="remarks" value='<%=obTrxValue.getRemarks()%>' />
      </jsp:include>
    </td>
  </tr>  
<%
	}
%>  
  </tbody>
</table>

<table width="149" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr>
    <td><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href='<%=isRejected?"ToDo.do":"javascript:gotoPreparePage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2">&nbsp;</td></tr>
  <tr><td colspan="2">&nbsp;</td></tr>   
</table>
<!-- InstanceEndEditable -->
</body>

</html:form>
<!-- InstanceEnd --></html>
