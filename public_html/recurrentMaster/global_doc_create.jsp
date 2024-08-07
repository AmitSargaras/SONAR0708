<%@page 	import="java.util.*,com.integrosys.cms.ui.collateral.CategoryCodeConstant,java.util.List,java.util.ArrayList,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.cms.ui.common.CommonCodeList,com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.cms.ui.cam.CAMGlobalForm"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/global_doc_create.jsp,v 1.7 2006/10/27 08:13:10 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.7 $
 * @since $Date: 2006/10/27 08:13:10 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<% 
RecurrentGlobalForm aForm = (RecurrentGlobalForm) request.getAttribute("RecurrentGlobalForm");
CommonCodeList commonCode = CommonCodeList.getInstance("APPLICATION_TYPE");

List appCodeID   = (List) commonCode.getCommonCodeValues();
List appCodeValue   = (List) commonCode.getCommonCodeLabels();



%>



<%@page import="com.integrosys.cms.ui.recurrentMaster.RecurrentGlobalForm"%><html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>


<style>
table.tblInput tbody tr td.fieldname {
	width: 150px;
}
}
</style>

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

function loadPage() {
	window.opener.refreshContent();
	window.close();
}

function savePage () {
	document.forms[0].action="RecurrentGlobal.do?event=draft_doc_item";
	document.forms[0].submit();
}
/*function selectLists(){
    List = document.forms[0].loanApplicationList;
    Append = document.forms[0].appendLoanList;
    for (i=0;i<List.length;i++){
        List.options[i].selected = true;
        Append.value = List.options[i].value + "-" + Append.value;
    }

}
*/
function submitPage () {
	//selectLists();
	addRating();
	addSegment();
	addClassification();
	document.forms[0].submit();
}
function addRating() {

	ListRating = document.forms[0].rating;
    
    AppendedRating = document.forms[0].appendRating;
    for (i=0;i<ListRating.length;i++){
    	ListRating.options[i].selected = true;
    	if(AppendedRating.value.search(ListRating.options[i].value)==-1)
    	{
    		AppendedRating.value = ListRating.options[i].value + "-" + AppendedRating.value;
    	}
       // alert(AppendedSegment.value);
    }
    document.forms[0].rating.value=AppendedRating.value;

}
function addSegment() {

	ListSegment = document.forms[0].segment;
    
    AppendedSegment = document.forms[0].appendSegment;
    for (i=0;i<ListSegment.length;i++){
    	ListSegment.options[i].selected = true;
    	if(AppendedSegment.value.search(ListSegment.options[i].value)==-1)
    	{
    		AppendedSegment.value = ListSegment.options[i].value + "-" + AppendedSegment.value;
    	}
       // alert(AppendedSegment.value);
    }
    document.forms[0].segment.value=AppendedSegment.value;
}
function addClassification() {

	ListClassification = document.forms[0].classification;
    
    AppendedClassification = document.forms[0].appendClassification;
    for (i=0;i<ListClassification.length;i++){
    	ListClassification.options[i].selected = true;
    	if(AppendedClassification.value.search(ListClassification.options[i].value)==-1)
    	{
    		AppendedClassification.value = ListClassification.options[i].value + "-" + AppendedClassification.value;
    	}
       // alert(AppendedSegment.value);
    }
    document.forms[0].classification.value=AppendedClassification.value;
   

}
//-->
function skipImageTagCheckbox(){
	var x =document.getElementById("skipImgTag").checked;
	if (x == true) {
		document.getElementById("skipImgTag").value="ENABLE";
		document.getElementById("skipImgTag1").value="ENABLE";
		}else{
		document.getElementById("skipImgTag").value="DISABLE";
		document.getElementById("skipImgTag1").value="DISABLE";
		}
	}
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="RecurrentGlobal.do">
<html:hidden property="appendRating"/>
<html:hidden property="appendSegment"/>
<html:hidden property="appendClassification"/>
<input type="hidden" name="event" value="create_doc_item"/>
<input type="hidden" name="itemID" value="" />
<!--<input type="hidden" name="appendLoanList" value="" />-->
<html:hidden property="docVersion" value="0"/>
<html:hidden property="isPreApprove" value="N"/>
<html:hidden property="deprecated" value="N" />


<!-- InstanceBeginEditable name="Content" -->
<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global  Document Template - New</h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead> </thead> <tbody>
        <tr class="even">
			<td class="fieldname">Document Code&nbsp;</td>
			<td><html:text property="itemCode" size="50" maxlength="30" style="background:#B4CFEC" disabled="true"/>
			<html:errors property="itemCode" /><html:errors property="itemCodespecialcharacter" /></td>
		</tr>
        <tr class="odd">
          <td class="fieldname">Document Description&nbsp;<font color="red">* </font></td>
          <td>
            <html:text property="itemDesc" size="50" maxlength="200" /><html:errors property="itemDesc" /><html:errors property="itemDescspecialcharacter" />
          </td>
        </tr>
<!--        <tr class="odd">-->
<!--          <td class="fieldname">Document Frequency&nbsp;<font color="red">* </font></td>-->
<!--          <td>-->
<!--            <html:text property="tenureCount"  maxlength="3" />-->
<!--            <html:select property="tenureType" >-->
<!--                  <option value="" ><bean:message key="label.please.select"/></option>-->
<!--                  <html:options name="frequencyValues" labelName="frequencyLabels"/>-->
<!--                </html:select>-->
<!--             <html:errors property="tenureError" /><html:errors property="tenureTypeError" />-->
<!--           -->
<!--          </td>-->
<!--        </tr>-->
<html:hidden property="tenureCount" value="1"/>
<html:hidden property="tenureType" value="1"/>
        <tr class="even">
        <td class="fieldname" >Status&nbsp;</td>
              <td >Enable<input type="radio" checked="checked" id="status" name="status" value="ENABLE" disabled="disabled" >
              &nbsp;Disable<input type="radio"  id="status" name="status" value="DISABLE" disabled="disabled" >&nbsp;</td>
        
        </tr>
        <tr class="even">
        <td class="fieldname" >Statement Type&nbsp;<font color="red">*</font></td>
              <td ><html:select property="statementType" >
                                    	<integro:common-code 
                                    		categoryCode="<%=CategoryCodeConstant.STATEMENT_TYPE%>" descWithCode="false" />
                                    </html:select><html:errors property="statementError" />&nbsp;</td>
        
        </tr>
<!--        <tr >-->
<!--         <td class="fieldname" >Critical&nbsp;</td>-->
<!--        <td  ><input name="mandatoryID" type="checkbox"  />-->
<!--              </td>-->
<!--              -->
<!--              </tr>-->
<!--              <tr>-->
<!--               <td class="fieldname" >Mandatory&nbsp;</td>-->
<!--                 <td  ><input name="mandatoryDisplayID" type="checkbox"  />-->
<!--              </td>-->
<!--        </tr>-->
<!--        <tr class="even">-->
<!--			<td class="fieldname">Document Version&nbsp;<font color="#0000FF">* </font></td>-->
<!--			<td><html:text property="docVersion" size="3" maxlength="7" />-->
<!--			<html:errors property="docVersion" /></td>-->
<!--		</tr>-->
        <tr class="odd">
          <td class="fieldname">Document Due Date</td>
          <td>
            <html:text property="expDate" size="12" maxlength="12" readonly="true"/>
            <img src="img/calendara.gif"  name="Image32" border="0" id="Image32" onclick="return showCalendar('expDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" />
            <html:errors property="expDate" />
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Is Recurrent</td>
          <td>
            <html:checkbox property="isRecurrent" />
           
          </td>
        </tr>  
        
               <tr class="odd">
        <td class="fieldname">Skip Image Tagging&nbsp;<font color="red">*</font></td>
              <td>
              <input type="checkbox" name="skipImgTag" id="skipImgTag" onclick="skipImageTagCheckbox()" />
              </td>           
        </tr>
      <html:hidden property="skipImgTag" styleId="skipImgTag1"/>
        
        
<!--        <tr class="even">-->
<!--			<td class="fieldname">Pre-Approval Document&nbsp;</td>-->
<!--			<td><html:radio property="isPreApprove" value="Y" />Yes-->
<!--				<html:radio property="isPreApprove" value="N"  />No</td>-->
<!--		</tr>-->
		<!-- <tr class="odd">
			<td class="fieldname">Type&nbsp;</td>
			<td><table border="0">
							<tr>
								<td>
									 <select id="loanApplicationTypeAvail" name="loanApplicationTypeAvail" size="10" multiple="multiple" style="width:260">
						                <% for(int i=0; i<appCodeID.size(); i++){
						                	if (aForm.getLoanApplicationList() == null)
						                	{
						                %>
						                	<option value='<%=appCodeID.get(i)%>'><%=appCodeValue.get(i)%></option>
						                <%
						                	}else
						                	if(aForm.getLoanApplicationList()!=null && !Arrays.asList(aForm.getLoanApplicationList()).contains(appCodeID.get(i)))
						                		{
						                %>
						                  	<option value='<%=appCodeID.get(i)%>'><%=appCodeValue.get(i)%></option>
						                  <%
						                		}
						                	}
						                  %>
		
		                			</select> 
		                		</td>

		                		<td>
		             				<input type="button" name="Button" value="Add&gt;&gt;" style="width:80" onclick="moveDualList(loanApplicationTypeAvail,loanApplicationList, false),getOrgCodesByCtryCodes()" class="btnNormal"/>
			                		<br/> <br/> 
									<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" onclick="moveDualList(loanApplicationList,loanApplicationTypeAvail,false),delOrgCodesByCtryCodes()" class="btnNormal"/>
		                		</td>
		                		<td>
									 <select id="loanApplicationList" name="loanApplicationList" size="10" multiple="multiple" style="width:260">
		 								<% for(int i=0; i<appCodeID.size(); i++){
						                	if(aForm.getLoanApplicationList()!=null && Arrays.asList(aForm.getLoanApplicationList()).contains(appCodeID.get(i)))
						                		{
						                %>
						                  	<option value='<%=appCodeID.get(i)%>'><%=appCodeValue.get(i)%></option>
						                  <%
						                	 }}
						                  %>
		                			</select> 
		                		</td>
		                	</tr>
                			</table>
		    </td>
		</tr> --> <html:hidden  property="status"  />
		
		<input type="hidden" name="mandatoryID" />
<input type="hidden" name="mandatoryDisplayID" />
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>


<table class="tblFormSection" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Global  Document Template - Criteria</h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        <thead> </thead> <tbody>
       <tr  >
							            <td class="fieldname" width="20%">Rating </td>
							            <td width="30%">
										<html:select  size="5" multiple="multiple" style="width:250" property="allRating" >					               
									        <integro:common-code pleaseSelect="false"	categoryCode="<%=CategoryCodeConstant.CommonCode_RISK_GRADE%>" descWithCode="false" />
										</html:select> &nbsp; 
										</td>
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(allRating,rating, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(rating,allRating,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
										    <td>		               
												<html:select  size="5" multiple="multiple" style="width:250" property="rating" >
												</html:select> 
										&nbsp;
										</td>
									</tr> 
									<tr  >
							            <td class="fieldname" width="20%">Segment </td>
							            <td width="30%">
										<html:select  size="5" multiple="multiple" style="width:250" property="allSegment" >					               
									        <integro:common-code pleaseSelect="false"	categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" descWithCode="false" />
										</html:select> &nbsp; 
										</td>
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(allSegment,segment, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(segment,allSegment,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
										    <td>		               
												<html:select  size="5" multiple="multiple" style="width:250" property="segment" >
												</html:select> 
										&nbsp;
										</td>
									</tr> 
        <tr class="odd">
          <td class="fieldname">Total Sanctioned Amount&nbsp;</td>
          <td>
            <html:text property="totalSancAmt" size="50" maxlength="200" />
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>
            &nbsp;
          </td>
        </tr>
        <tr  >
							            <td class="fieldname" width="20%">Classification </td>
							            <td width="30%">
										<html:select  size="5" multiple="multiple" style="width:250" property="allClassification" >					               
									        <integro:common-code pleaseSelect="false"	categoryCode="<%=CategoryCodeConstant.CommonCode_ASSET_ClASSIFICATION%>" descWithCode="false" />
										</html:select> &nbsp; 
										</td>
								         	  <td>
										         <input type="button" name="Button" value="Add&gt;&gt;" style="width:80" 
										         	onclick="moveDualList(allClassification,classification, false),getOrgCodesByCtryCodes()" 
										         	class="btnNormal"/>
											 <br/> <br/> 
												<input type="button" name="Button" value="&lt;&lt;Remove" style="width:80" 
													onclick="moveDualList(classification,allClassification,false),delOrgCodesByCtryCodes()" 
													class="btnNormal"/>
										     </td>		               
										    <td>		               
												<html:select  size="5" multiple="multiple" style="width:250" property="classification" >
												</html:select> 
										&nbsp;
										</td>
									</tr> 
        <tr class="even">
        <td class="fieldname" >Guarantor&nbsp;</td>
              <td >Yes<input type="radio" id="guarantor" name="guarantor" value="OPEN"  >
              &nbsp;No<input type="radio"  id="guarantor" name="guarantor" value="CLOSE"  >&nbsp;</td>
          <td class="fieldname">&nbsp;</td>
          <td>
            &nbsp;
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="100" valign="baseline" align="center"> <a href="#"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a>
                        </td>
                        <td width="100" valign="baseline" align="center"> <a href="RecurrentGlobal.do?event=global_list&type=REC&go=N" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
                        </td>
                      </tr>
                      <tr>
                        <td valign="baseline" align="center">&nbsp;</td>
                        <td valign="baseline" align="center">&nbsp;</td>
                      </tr>
                    </table>
</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
