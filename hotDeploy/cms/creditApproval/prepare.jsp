<%@ page import="com.integrosys.cms.ui.feed.bond.item.BondItemAction,
                 com.integrosys.cms.ui.common.CurrencyList,com.integrosys.base.businfra.currency.ICurrency,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.ui.feed.bond.item.BondItemAction,com.integrosys.cms.ui.feed.bond.item.BondItemForm,com.integrosys.cms.ui.creditApproval.CreditApprovalAction,java.util.List,com.integrosys.cms.ui.creditApproval.CreditApprovalAction,com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@page import="com.integrosys.cms.app.creditApproval.bus.OBSegment"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
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
    
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

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

function submitForm() {
document.forms[0].submit();
}

function cancelForm() {
    document.forms[0].action = "credit_approval.do";
    document.forms[0].event.value = "<%=CreditApprovalAction.EVENT_PREPARE_LIST%>";
    document.forms[0].submit();
}
function saveForm() {

 	document.forms[0].action="credit_approval.do?event=maker_draft_creditApproval";
    document.forms[0].submit();
}

//-->
    </script>
    <!-- InstanceEndEditable -->
</head>
<%
	
	List regionList = (java.util.ArrayList) request.getAttribute("regionList");
	
%>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>



<html:form action="credit_approval.do">
			<input type="hidden" name="event"value="<%=CreditApprovalAction.EVENT_PREPARE_SUBMIT%>" />
			<input type="hidden" name="createBy" value="" />
			<input type="hidden" name="lastUpdateBy" value="" />
			<input type="hidden" name="deprecated" value="N" />
			



			<table width="98%" border="0" cellspacing="0" cellpadding="0" class="tblFormSection" align="center">

  <tr>
    <td width="100%">      
      <h3>Add Credit Approver's Details</h3>
      <hr />
      
      <table class="tblInput" id="backEdit1" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">      
        <tbody>   
          <tr>            
            <!--              <td class="fieldname" colspan="4"><center>Branch Details</center> </td>              -->
            <td><br />
              
              <table class="tblInput" id="backEdit2" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">     
                <tbody>
                  <tr class="even" >
                    <td width="20%" class="fieldname" >Credit Approver Code <span class="style11"></span></td>
                  <td width="20%" class="even"><span class="odd">
                        <html:text property="approvalCode" size="30" maxlength="50" style="background:#B4CFEC"  disabled="true"/>
                                    <html:errors property="approvalCode"/>
                </td>
                  
              <td width="20%" class="fieldname" > Name &nbsp;<span class="style11"><font color="#ff0000">*</font></span>
              <br/><bean:message key="error.string.directorAndCreditapprover.name"/></td>
                  <td width="20%"><span class="odd">
                    <html:text property="approvalName" size="30" maxlength="75"/>
                    <html:errors property="approvalName"/>
                    	<html:errors property="specialCharacterNameError"/></td>
                </tr>
              <tr class="odd">
                   
              	   <td width="20%" class="fieldname" >Minimum Limit (INR)&nbsp;<font color="#ff0000">*</font></td>
                   <td width="20%" class="odd">

 						<html:text property="minimumLimit" size="30" maxlength="23" styleId="minimumLimit" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                    	<html:errors property="minimumLimit"/>
				   </td>
				    <td width="20%" class="fieldname">Maximum Limit (INR)&nbsp;<font color="#ff0000">*</font></td>
                    <td width="20%" class="odd">
 						<html:text property="maximumLimit" size="30" maxlength="23" styleId="maximumLimit" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                    	<html:errors property="maximumLimit"/>
				   </td>
             </tr>
             <tr class="odd">
                    <td width="20%" class="fieldname"  >Segment</td>
                  	<td width="20%" class="even">                                 
                       <html:select property="segmentId">
                        <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"  />
						    
					   </html:select>                         
                       <html:errors property="segmentId"/>
                   </td>
             	   <td width="20%" class="fieldname"  >E-mail</td>
                   <td width="20%" class="odd">
				      <html:text property="email" size="30" maxlength="53"/>
                      <html:errors property="email"/>
			       </td>
            </tr>
            <tr class="even">
                   <td width="20%" class="fieldname">Senior<span class="style11"></span></td>
                   <td width="20%" class="even">
                      <html:checkbox property="senior"/>
                      <html:errors property="senior"/>
                   </td>  
              	   <td width="20%" class="fieldname" >Risk<span class="style11"></span></td>
                   <td width="20%" class="even"><label>
                      <html:checkbox property="risk"/>
                      <html:errors property="risk"/></label>
                  </td>
            </tr>   
            
            
             <tr class="odd">
                    <td width="20%" class="fieldname">Deferral Powers</td>
                    <td width="20%" class="odd"><label>
                       <input type="radio" name="deferralPowers" value="Y" checked="checked"/>Yes 
                       <input type="radio" name="deferralPowers" value="N"/>No 
                       <html:errors property="deferralPowers"/>
                   </label></td>
                     
                    <td width="20%" class="fieldname" >Waiving Powers<span class="style11"></span></td>
                    <td width="20%" class="odd"><label>
                      <input type="radio" name="waivingPowers" value="Y" checked="checked"/>Yes 
                       <input type="radio" name="waivingPowers" value="N"/>No 
                      <html:errors property="waivingPowers"/>
                    </label></td>
            </tr>
            
               <tr>
            		<td class="fieldname">Region</td>
				 	<td class="even" width="20%">
						<html:select property="regionId">
						    	<option value="">Please Select</option>
								<html:options collection="regionList" labelProperty="label" property="value" />
						</html:select>												
		         	</td>
		      	 	<td width="20%" class="fieldname" >Status<span class="style11"></span></td>
                 	<td width="20%" class="odd">
                     	 <input type="radio" name="status" checked="checked" value="ACTIVE" disabled="disabled"><%=ICMSConstant.STATE_ENABLE.toString()%></input>
					     <input type="radio" name="status" value="INACTIVE" disabled="disabled"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
               		</td>
               </tr>
                 <tr>
                  <td class="fieldname">Employee Id &nbsp;<font color="#ff0000">*</font>
                  </td>
                 <td>  <html:text property="employeeId" style="text-transform: uppercase" tabindex="1" size="30" maxlength="30" />
                      <html:errors property="employeeIdError" /></br> <html:errors property="employeeIdDuplicateError" /></td>
                  <td>
                  </td>
                 <td></td>
                  </tr>
                    </tbody>
              </table>
          <br/>            </td></tr></tbody>
      </table>
      <!--            edited-->      <table width="170" border="0" align="center" cellpadding="0" cellspacing="0">

        <tr>
            <td><a href="#" onClick="submitForm()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/submit2.gif',1)">
            	<img src="img/submit1.gif" name="Image3" width="75"height="22" border="0" id="Image3"/></a>
            </td>
             <td colspan="2"><center> <a href="javascript:saveForm();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img
				src="img/save1.gif" name="ImageSave" 
				border="0" id="ImageSave" /></a>
				</center>
			</td>
			<td colspan="2">
            <td><a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/cancel2.gif',1)">
            	<img src="img/cancel1.gif" name="Image3" width="70" height="20" border="0" id="Image3"/></a>
            </td>
        </tr>
    </table></td> 
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>



</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>