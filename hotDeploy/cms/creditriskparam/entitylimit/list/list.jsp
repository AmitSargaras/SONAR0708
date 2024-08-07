<%@ page import="com.integrosys.cms.app.creditriskparam.bus.entitylimit.IEntityLimit,
                 com.integrosys.cms.app.creditriskparam.trx.entitylimit.IEntityLimitTrxValue,
                 com.integrosys.cms.app.creditriskparam.trx.entitylimit.OBEntityLimitTrxValue,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 java.util.HashMap,
                 com.integrosys.cms.ui.creditriskparam.entitylimit.list.EntityLimitListForm,
                 com.integrosys.cms.ui.creditriskparam.entitylimit.list.EntityLimitListAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 java.util.Locale,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.creditriskparam.entitylimit.list.EntityLimitListMapper,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.UIUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	DefaultLogger.debug(this, ">>>> list.jsp");

    EntityLimitListForm actionForm = (EntityLimitListForm) pageContext.findAttribute("EntityLimitListForm");

    String event = actionForm.getEvent();
    
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+
			com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    // Get the exempted inst trx value from session.
    IEntityLimitTrxValue entityLimitTrxValue = (IEntityLimitTrxValue) session.
            getAttribute("com.integrosys.cms.ui.creditriskparam.entitylimit.EntityLimitAction.EntityLimitTrxValue");
    
    IEntityLimit[] stagingEntityLimit = entityLimitTrxValue.getStagingEntityLimit();
    IEntityLimit[] actualEntityLimit = entityLimitTrxValue.getEntityLimit();

    if (stagingEntityLimit == null)stagingEntityLimit = new IEntityLimit[0];
    if (actualEntityLimit == null)actualEntityLimit = new IEntityLimit[0];
    
    pageContext.setAttribute("stagingEntityLimit", stagingEntityLimit);
    System.out.println("stagingEntityLimit.length : " + stagingEntityLimit.length); 

    int totalEntries = stagingEntityLimit.length;

    Integer offsetInt = (Integer)session.getAttribute(
    					"com.integrosys.cms.ui.creditriskparam.entitylimit.EntityLimitAction.offset");
    
    Integer lengthInt = (Integer)session.getAttribute(
						"com.integrosys.cms.ui.creditriskparam.entitylimit.EntityLimitAction.length");
    
    // Get the record markers.
    int offset = (offsetInt != null) ? offsetInt.intValue() : 0;
    int length = (lengthInt != null) ? lengthInt.intValue() : 0;

    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
	
	// Get transaction user and date
	String userId = entityLimitTrxValue.getUserID();
	java.util.Date lastUpdateDate = entityLimitTrxValue.getTransactionDate();
	
	DefaultLogger.debug(this, "userId = " + userId);
	DefaultLogger.debug(this, "lastUpdateDate = " + lastUpdateDate);  
	
	CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
       
	String duplicateEntry = (String)request.getAttribute("duplicateEntry");
	String noEntry = (String)request.getAttribute("noEntry");
%>
<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
   <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
	<script type="text/javascript" src="js/validation.js"></script>
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

function addNew() {
    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_REMOVE%>";
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_SUBMIT%>";
    document.forms[0].submit();
}
function editForm(pos) {
    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_EDIT%>";
    document.forms[0].editedPos.value = pos;
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_SAVE%>";
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_PAGINATE%>";
    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}

function cancelSubmit(){
   
    var url = 'Welcome.do';
    document.location.href = url;
}

//-->
    </script>
</head>
<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<table width="100%" height="97%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">
<!-- Content -->
<html:form action="EntityLimit.do">
<input type="hidden" name="event"/>
<input type="hidden" name="editedPos" value="-1"/>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3><bean:message key="title.crp.entitylimit"/></h3></td>
        <td align="right" valign="bottom">
            <table width="50" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100" valign="bottom" align="center">
                        <input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()" style="margin-right:5px;margin-left:5px;width:100px"/>
                    </td>
                    <td width="100" valign="bottom" align="center">
                        <%if (stagingEntityLimit.length != 0) {%>
                        &nbsp;
                        <input type="button" name="Submit2" value="Remove" class="btnNormal" onclick="remove()" style="margin-right:5px;margin-left:5px;width:100px"/>
                        
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
	<% if(duplicateEntry!=null) { %>
	<font color="#FF0000" size="1">Please check as duplicate customer ID exists.</font>&nbsp;               
	<%}%>
	<% if(noEntry!=null) { %>
	<font color="#FF0000" size="1">At least one customer must be entered to submit.</font>&nbsp;               
	<%}%>
</td>
</tr>
    <tr>
        <td colspan="2"><html:errors property="chkDeletes"/>
            <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
				<thead>
				       <tr>
				           <td width="5%"><bean:message key="label.global.sno"/></td>
				           <td width="20%"><bean:message key="label.customer.name"/>&nbsp;</td>
				           <td width="10%"><bean:message key="label.customer.id.source"/></td>
				           <td width="15%"><bean:message key="label.security.pledgor.le.id"/></td>
				           <td width="15%"><bean:message key="label.security.pri.limit.amt"/><font color="#0000FF"> *</font></td>
				           <td width="15%"><bean:message key="label.crp.limit.last.review.date"/><font color="#0000FF"> *</font></td>
				           <td width="10%"><bean:message key="label.global.action"/></td>
				           <td width="10%"><bean:message key="label.global.delete"/></td>
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
                <logic:iterate id="entityLimit" name="stagingEntityLimit"
                               offset="<%=String.valueOf(offset)%>"
                   			   length="<%=String.valueOf(iterateLength)%>"                              
                               indexId="counter"
                               type="com.integrosys.cms.app.creditriskparam.bus.entitylimit.IEntityLimit">
					
					<% 	
						DefaultLogger.debug(this, "counter now is " + counter.intValue());
					
						String sourceId = entityLimit.getCustIDSource();
						sourceId = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);
						
						String limitAmount = UIUtil.formatAmount(entityLimit.getLimitAmount(), 0, locale);
						String limitDate = UIUtil.formatDate(entityLimit.getLimitLastReviewDate());
                        String errProp = "errEntityLimit"+entityLimit.getCustomerID();

                    %>
						
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index" valign="top"><%=counter.intValue() + 1%></td>
						<td >&nbsp;<integro:empty-if-null value="<%=entityLimit.getCustomerName()%>"/></td>
						<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=sourceId %>"/></td>
						<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=entityLimit.getLEReference() %>"/></td>
						<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=limitAmount%>" /></td>
						<td style="text-align:center">&nbsp;<integro:date object ="<%=entityLimit.getLimitLastReviewDate() %>" /></td>
						<td style="text-align:center">&nbsp;<a href="#" onclick="editForm(<%=counter.intValue()%>)" >Edit</a>
						</td>
                        <td style="text-align:center">
                            <input type="checkbox" name="checkSelects"
                            	<%=EntityLimitListMapper.inArray(counter.intValue(), selectsArr) ? "checked" : ""%>
                       				value="<%=counter.intValue()%>"/>
                            <html:errors property="<%=errProp%>"/>
                        </td>
                        
                    </tr>
                </logic:iterate>
            	</tbody>
            </table>
        </td>
    </tr>
</tbody>
</table>
<br><br>
<%
	System.out.println("entityLimitTrxValue.getStatus() : " + entityLimitTrxValue.getStatus());

    if (entityLimitTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
    		entityLimitTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_CREATE) ||
    		entityLimitTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_UPDATE)) {
        String lastActionBy = entityLimitTrxValue.getUserInfo();
        String lastRemarksMade = entityLimitTrxValue.getRemarks();
        String editedRemarks = entityLimitTrxValue.getEditedRemarks();
        if (lastRemarksMade == null) {
            lastRemarksMade = "";
        }

%>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>
        <tr>
            <td class="fieldname"><bean:message key="label.remarks"/></td>
            <td class="odd"><html:textarea property="remarks" rows="3" cols="120" value="<%=editedRemarks %>"/><br/>
                <html:errors property="remarks"/></td>
        </tr>
        <tr>
            <td class="fieldname"><bean:message key="label.last.action.by"/></td>
            <td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
            <td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
        </tr>
    </tbody>
</table>
<% } %>

<table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td valign="baseline" align="center" colspan="2">
            <a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75"
             height="22" border="0" id="Image3"/>
            </a>
            <%
    		if (entityLimitTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
    			entityLimitTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_CREATE) ||
    			entityLimitTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED_UPDATE)) {

			%>
            <a href="ToDo.do?event=" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
            <% } else { %>
            <a href="javascript:cancelSubmit();"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a>
            <% } %>
         </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

</html:form>
</td>
</tr>
<!-- End Content -->

<!-- General Purpose Bar -->

<tr>
    <td height="25">
        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
               cellpadding="5" align="center">

            <tr>
                <td valign="middle">
                    <integro:pageindex
                            pageIndex="<%=new PageIndex(offset, length, stagingEntityLimit.length)%>"
                            url="EntityLimit.do" submitFlag="true"/>
                </td>
            </tr>
        </table>
    </td>
</tr>
</table>

</body>
</html>