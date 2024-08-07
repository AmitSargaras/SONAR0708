<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustRelationship,
                 com.integrosys.cms.app.custrelationship.trx.ICustRelationshipTrxValue,
                 com.integrosys.cms.app.custrelationship.trx.OBCustRelationshipTrxValue,
                 java.util.HashMap,
                 com.integrosys.cms.ui.custrelationship.list.CustRelationshipListForm,
                 com.integrosys.cms.ui.custrelationship.list.CustRelationshipListAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,				 
                 com.integrosys.cms.ui.custrelationship.list.CustRelationshipListMapper,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.custrelationship.CustRelUtils,
                 com.integrosys.cms.ui.custrelationship.CustRelConstants,
                 com.integrosys.cms.ui.common.CountryList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	//System.out.println(">>>> list.jsp");

    CustRelationshipListForm actionForm = (CustRelationshipListForm) pageContext.findAttribute("CustRelationshipListForm");

    String event = actionForm.getEvent();
	//System.out.println(">>>>event ="+event );
	String from_event = request.getParameter("from_event");
	//System.out.println(">>>>from_event ="+from_event );
	if( from_event == null || from_event.equals("") ) {
		from_event = event;
	}
	//System.out.println(">>>>from_event ="+from_event );
    // Get the customer relationship trx value from session.
    ICustRelationshipTrxValue custRelTrxValue = (ICustRelationshipTrxValue) session.
            getAttribute("com.integrosys.cms.ui.custrelationship.CustRelAction.CustRelationshipTrxValue");
    
    ICustRelationship[] stagingCustRelationship = custRelTrxValue.getStagingCustRelationship();
    ICustRelationship[] actualCustRelationship = custRelTrxValue.getCustRelationship();

    if (stagingCustRelationship == null)stagingCustRelationship = new ICustRelationship[0];
    if (actualCustRelationship == null)actualCustRelationship = new ICustRelationship[0];
    
    pageContext.setAttribute("stagingCustRelationship", stagingCustRelationship);

    int totalEntries = stagingCustRelationship.length;

    Integer offsetInt = (Integer)session.getAttribute(
    					"com.integrosys.cms.ui.custrelationship.CustRelAction.offset");
    
    Integer lengthInt = (Integer)session.getAttribute(
						"com.integrosys.cms.ui.custrelationship.CustRelAction.length");
    
    // Get the record markers.
    int offset = (offsetInt != null) ? offsetInt.intValue() : 0;
    int length = (lengthInt != null) ? lengthInt.intValue() : 0;

    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
    
    String subProfileId = (String)session.getAttribute(
		"com.integrosys.cms.ui.custrelationship.CustRelAction.sub_profile_id");    

	DefaultLogger.debug(this, "subProfileId = " + subProfileId);

	String customerType = (String)session.getAttribute(
		"com.integrosys.cms.ui.custrelationship.CustRelAction.customerType");    

	// Get transaction user and date
	String userId = custRelTrxValue.getUserID();
	java.util.Date lastUpdateDate = custRelTrxValue.getTransactionDate();
	
	DefaultLogger.debug(this, "userId = " + userId);
	DefaultLogger.debug(this, "lastUpdateDate = " + lastUpdateDate);  
	
    CommonCodeList commonCode = CommonCodeList .getInstance(null, null, ICMSUIConstant.ENTITY_REL, null);
    
	if (request.getAttribute("entRelValues") == null)
		request.setAttribute("entRelValues", 
				CustRelUtils.removeIntFromCollection(CustRelConstants.SHAREHOLDER_ID, commonCode.getCommonCodeValues()));
	if (request.getAttribute("entRelLabels") == null)
		request.setAttribute("entRelLabels", 
				CustRelUtils.removeStringFromCollection(CustRelConstants.SHAREHOLDER_LABEL, commonCode.getCommonCodeLabels()));
%>
<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

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

function gotopage(aLocation) {
    window.location = aLocation;
}

function addNew(currEvent) {

	if( currEvent == "<%=CustRelationshipListAction.EVENT_READ_MAKER_EDIT%>" ) {
		document.forms[0].event.value = "<%=CustRelationshipListAction.EVENT_ADD%>";

	} else {
		document.forms[0].event.value = "<%=CustRelationshipListAction.EVENT_ADD_FRAME%>";

	}
    document.forms[0].submit();
}
function remove() {

	document.forms[0].event.value = "<%=CustRelationshipListAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function cancelForm() {
    document.forms[0].event.value = "<%=CustRelationshipListAction.EVENT_VIEW%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=CustRelationshipListAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=CustRelationshipListAction.EVENT_SAVE%>"
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=CustRelationshipListAction.EVENT_PAGINATE%>"
    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}

//-->
    </script>
</head>
<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">
<!-- Content -->
<html:form action="CustRelationship.do">
<input type="hidden" name="event"/>
<input type="hidden" name="from_event" value="<%=from_event%>"/>

<input type="hidden" name="sub_profile_id" value="<%=subProfileId %>"/>
<input type="hidden" name="customerType" value="<%=customerType %>"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td height="34"><h3><bean:message key="title.cust.relationship.info" /></h3></td>
        <td align="right" valign="bottom">
            <table width="50" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100" valign="bottom" align="center">
                        <input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew('<%=from_event%>')" style="margin-right:5px;margin-left:5px;width:100px"/>
                    </td>
                    <td width="100" valign="bottom" align="center">
                        <%if (stagingCustRelationship.length != 0) {%>
                        &nbsp;
                        <input type="button" name="Submit2" value="Remove" class="btnNormal" onclick="remove()" style="margin-right:5px;margin-left:5px;width:100px"/>
                        <html:errors property="checkSelects"/>
                        <%}%>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
    <tr>
        <td colspan="2">
            <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
                <thead>
                    <tr>
                        <td width="5%"><bean:message key="label.global.sn" /></td>
                        <td width="20%"><bean:message key="label.global.name" />&nbsp;<font color="#0000FF"> </font></td>
                        <td width="9%"><bean:message key="label.customer.dob" /><br/>(DD/MM/YYYY)</td>
                        <td width="8%"><bean:message key="label.cust.relationship.age" /></td>
                        <td width="15%"><bean:message key="label.cust.relationship.entity.rel" /> &nbsp;<font color="#0000FF">* </font></td>
                        <td width="12%"><bean:message key="label.cust.relationship.id.country" /></td>
                        <td width="15%"><bean:message key="label.remarks" /></td>
                        <td width="8%"><bean:message key="label.select" /></td>
                    </tr>
                </thead> 
                <tbody>

                <%
                    // Check that offset + length cannot exceed the total.
                    int iterateLength = 0;
                    if (offset + length > totalEntries) {
                        iterateLength = totalEntries - offset;
                    } else {
                        iterateLength = length;
                    }

                    String[] chkSelectArr = actionForm.getCheckSelects();
                    int[] selectsArr = new int[ chkSelectArr == null ?
                            0 : chkSelectArr.length];

                    for (int i = 0; i < selectsArr.length; i++) {
                    	selectsArr[i] = Integer.parseInt(chkSelectArr[i]);
                    }
                %>
                <%
                    if (iterateLength == 0) {
                %>
                <tr>
                    <td colspan="8" class="odd">
                        <bean:message key="label.global.not.found"/>
                    </td>
                </tr>
                <%
                    }
                %>
                <logic:iterate id="custRel" name="stagingCustRelationship"
                               offset="<%=String.valueOf(offset)%>"
                               length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                               type="com.integrosys.cms.app.custrelationship.bus.ICustRelationship">
					
					<% 	String relationshipValue = custRel.getRelationshipValue() ;
						relationshipValue = (relationshipValue == null) ? "" : relationshipValue.trim();
						
						String custRemarks = custRel.getRemarks() ;
						custRemarks = (custRemarks == null) ? "" : custRemarks.trim();
						
	                    java.util.Date dob = null;
	                	String age = "";
	                	String customerName = "";
	                	String legalRegCountry = "";
	                	
	                	if (custRel.getCustomerDetails() != null &&
	                			custRel.getCustomerDetails().getCMSLegalEntity() != null) {
	                		dob = custRel.getCustomerDetails()
	    							.getCMSLegalEntity().getIncorporateDate();
	                	
	            			int ageInt = CustRelUtils.computeAge(dob);
	            			age =  (ageInt == -1) ? "-" : String.valueOf(ageInt);
	            			
	                		customerName = custRel.getCustomerDetails().getCustomerName();
	                		legalRegCountry = custRel.getCustomerDetails()
	                							.getCMSLegalEntity().getLegalRegCountry();				
	                	}
	                	
					%>
						
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index" valign="top"><%=counter.intValue() + 1%></td>
                        <td>&nbsp;<integro:empty-if-null value="<%=customerName%>"/></td>
                        <td>&nbsp;<integro:date object="<%=dob%>" /></td>
                        <td class="amount">&nbsp;<integro:empty-if-null value="<%=age%>"/></td>
                        <td style="text-align:center">
                            <html:select property="entityRels" value="<%=relationshipValue %>">
                            	<html:option value="">Please Select</html:option>
                            	<html:options name="entRelValues" labelName="entRelLabels" />
                            </html:select>
                            <html:errors property="<%=\"entityRels.\"+String.valueOf(counter.intValue() - offset)%>"/>
                        </td>
                        
                        <%
                            String cty = null;
                            if (!(legalRegCountry == null || legalRegCountry.equals(""))) {
                                cty = CountryList.getInstance().getCountryName(legalRegCountry);
                            }
                        %> 
                        
                        <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=cty%>"/></td>
                        <td style="text-align:center">&nbsp;<html:text property="custRemarks" value="<%=custRemarks %>" /></td>
                        <td style="text-align:center">
                            <input type="checkbox" name="checkSelects"
                            	<%=CustRelationshipListMapper.inArray(counter.intValue(), selectsArr) ? "checked" : ""%>
                       				value="<%=counter.intValue()%>"/>
                        </td>
                        
                    </tr>
                </logic:iterate>
				<html:errors property="chkDeletes"/>
            	</tbody>
            </table>
        </td>
    </tr>
</tbody>
</table>
<br>
<%
    if (custRelTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
    		custRelTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_CREATE) ||
    		custRelTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_UPDATE)) {
        String lastActionBy = custRelTrxValue.getUserInfo();
        String lastRemarksMade = custRelTrxValue.getRemarks();
        if (lastRemarksMade == null) {
            lastRemarksMade = "";
        }

%>
<br/>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
        <tr>
            <td class="fieldname">Remarks</td>
            <td class="odd"><html:textarea property="remarks" style="width:90%"/>
                <html:errors property="remarks"/></td>
        </tr>
        <tr>
            <td class="fieldname">Last Action By</td>
            <td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
        </tr>
        <tr class="odd">
            <td class="fieldname">Last Remarks Made</td>
            <td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
        </tr>
    </tbody>
</table>
<% } %>

<table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2" valign="baseline" align="center" align="center">&nbsp;<html:errors property="<%=CustRelConstants.ERROR_CUST_REL %>"/></td>
    </tr>
    <tr>
    <td>&nbsp</td>
    </tr>
    <tr>
       
		<td align="right"><a href="javascript:submitForm();"><img src="img/submit1.gif" name="Image41" border="0" id="Image3"/></a></td>

		<%
		if (custRelTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
			custRelTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_CREATE) ||
			custRelTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_UPDATE)) {

		%>
		<td align="left"><a href="ToDo.do"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a></td>
		<% } else { %>
		<td align="left"><a href="javascript:cancelForm();"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a></td>
		<% } %>
        
    </tr>
</table>

</html:form>
</td>
</tr>
<!-- End Content -->

<!-- General Purpose Bar -->

<tr>
    <td height="25">


        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">

            <tr>
                <td valign="middle">
                    <integro:pageindex
                            pageIndex="<%=new PageIndex(offset, length, stagingCustRelationship.length)%>"
                            url="CustRelationship.do" submitFlag="true"/>
                </td>
            </tr>
        </table>

    </td>
</tr>

</table>

</body>
</html>