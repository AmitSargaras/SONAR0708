<%@ page import="com.integrosys.cms.app.creditriskparam.bus.entitylimit.IEntityLimit,
                 com.integrosys.cms.app.creditriskparam.trx.entitylimit.IEntityLimitTrxValue,
                 com.integrosys.cms.app.creditriskparam.trx.entitylimit.OBEntityLimitTrxValue,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 java.util.HashMap,
                 com.integrosys.cms.ui.creditriskparam.entitylimit.list.EntityLimitListForm,
                 com.integrosys.cms.ui.creditriskparam.entitylimit.list.EntityLimitListAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 java.util.Collection,
                 java.util.Locale,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.creditriskparam.entitylimit.list.EntityLimitListMapper,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	DefaultLogger.debug(this, ">>>> edit.jsp");

    EntityLimitListForm actionForm = (EntityLimitListForm) pageContext.findAttribute("EntityLimitListForm");
    
    String event = actionForm.getEvent();

    // Get the exempted inst trx value from session.
    IEntityLimitTrxValue entityLimitTrxValue = (IEntityLimitTrxValue) session.
            getAttribute("com.integrosys.cms.ui.creditriskparam.entitylimit.EntityLimitAction.EntityLimitTrxValue");
    
    IEntityLimit[] stagingEntityLimit = entityLimitTrxValue.getStagingEntityLimit();
    IEntityLimit[] tempEntityLimit = entityLimitTrxValue.getTempEntityLimit();

    if (stagingEntityLimit == null)stagingEntityLimit = new IEntityLimit[0];
    if (tempEntityLimit == null)tempEntityLimit = new IEntityLimit[0];

    int rowIdx = 0;
    
	int editedPos = (request.getAttribute("editedPos") == null) ? -1 : 
		((Integer)request.getAttribute("editedPos")).intValue();
	
	System.out.println("************************* >>>> " + editedPos);
	
	// if the editedPos comes from the request Attributes
	// then it is editing the particular entity limit
	if (editedPos != -1) {
		if (editedPos < stagingEntityLimit.length) {
			IEntityLimit[] editedEntityLimitArr = {stagingEntityLimit[editedPos]};
			pageContext.setAttribute("editEntityLimit", editedEntityLimitArr);
			pageContext.setAttribute("editELSize", "1");
		} else {
			pageContext.setAttribute("editEntityLimit", null);
			pageContext.setAttribute("editELSize", "0");
		}
	} else {
		pageContext.setAttribute("editEntityLimit", tempEntityLimit);
		pageContext.setAttribute("editELSize", String.valueOf(tempEntityLimit.length));
	}
	
	// Declaring global variables and getting static reference
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+
		com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	
	Collection currencyCode = CurrencyList.getInstance ().getCountryValues ();
	CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
	
	pageContext.setAttribute("currencyCode", currencyCode);
	ICommonUser user = (ICommonUser)session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE+"."+ IGlobalConstant.USER);
	String defaultCurrencyCode = CurrencyList.getInstance().getCurrencyCodeByCountry(user.getCountry());

	String duplicateEntry = (String)request.getAttribute("duplicateEntry");
	String noEntry = (String)request.getAttribute("noEntry");
%>
<html>
<head>
    <title>Untitled Document</title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
   <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <link href="js/calendar-blue.css" rel="stylesheet" type="text/css" />
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
		    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_UPDATE%>"
		    document.forms[0].submit();
		}
		function cancelForm() {
		    document.forms[0].event.value = "<%=EntityLimitListAction.EVENT_CANCEL%>"
		    document.forms[0].submit();
		}

//-->
    </script>

</head>
<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">
<!-- Content -->
<html:form action="EntityLimit.do">
<input type="hidden" name="event"/>
<input type="hidden" name="editedPos" value="<%=editedPos %>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
	<tr>
		<td height="34"><h3><bean:message key="title.crp.entitylimit"/></h3></td>
	</tr>
    <tr>
        <td><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
<td colspan="2">
	<% if(duplicateEntry!=null) { %>
	<font color="#FF0000" size="1"><bean:message key="label.warning.duplicate.cust.id"/></font>&nbsp;               
	<%}%>
	<% if(noEntry!=null) { %>
	<font color="#FF0000" size="1"><bean:message key="label.warning.msg"/></font>&nbsp;               
	<%}%>
</td>
</tr>
    <tr>
        <td colspan="2">
            <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
				<thead>
				       <tr>
				           <td width="5%"><bean:message key="label.global.sno"/></td>
				           <td width="20%"><bean:message key="label.customer.name"/>&nbsp;</td>
				           <td width="10%"><bean:message key="label.customer.id.source"/></td>
				           <td width="15%"><bean:message key="label.security.pledgor.le.id"/></td>
				           <td width="15%"><bean:message key="label.currency"/><font color="#0000FF"> *</font></td>
				           <td width="15%"><bean:message key="label.security.pri.limit.amt"/><font color="#0000FF"> *</font></td>
				           <td width="15%"><bean:message key="label.crp.limit.last.review.date"/><font color="#0000FF"> *</font></td>			          
				       </tr>
				</thead> 
                <tbody>

				<logic:empty name="editEntityLimit">
                <tr>
                    <td colspan="8" class="odd">
                        <bean:message key="label.global.not.found"/>
                    </td>
                </tr>
                </logic:empty>

                <logic:iterate id="entityLimit" name="editEntityLimit"                              
                               indexId="counter"
                               type="com.integrosys.cms.app.creditriskparam.bus.entitylimit.IEntityLimit">
					
					<% 	
						DefaultLogger.debug(this, "counter is now " + counter.intValue());
					
						String sourceId = entityLimit.getCustIDSource();
						sourceId = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);
						
						String limitAmount = "";
						String limitDate = "";
						
						if (event.equals(EntityLimitListAction.EVENT_EDIT_NOOP) && actionForm != null) {
							defaultCurrencyCode = actionForm.getLimitCurrencys()[counter.intValue()];
							limitAmount = actionForm.getLimitAmounts()[counter.intValue()];
							limitDate = actionForm.getLimitLastReviewDates()[counter.intValue()];
						} else {
							if (entityLimit.getLimitAmount() != null && entityLimit.getLimitAmount().getCurrencyCode() != null) {
								limitAmount = UIUtil.mapAmountToString(entityLimit.getLimitAmount(), locale, false);
								defaultCurrencyCode = entityLimit.getLimitAmount().getCurrencyCode();
							}
							
							if (entityLimit.getLimitLastReviewDate() != null)
								limitDate = DateUtil.formatDate(locale, entityLimit.getLimitLastReviewDate());
						}
						
					%>
						
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index" valign="top"><%=counter.intValue() + 1%></td>
						<td >&nbsp;<integro:empty-if-null value="<%=entityLimit.getCustomerName()%>"/></td>
						<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=sourceId %>"/></td>
						<td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=entityLimit.getLEReference() %>"/></td>
						<td style="text-align:center">&nbsp;
							<html:select property="limitCurrencys" value="<%=defaultCurrencyCode%>" >
    							<option value="" ><bean:message key="label.please.select"/> </option>
    							<html:options name="currencyCode" labelName="currencyCode"/>
    						</html:select>&nbsp;
    						<html:errors property='<%="limitCurrencys" + counter%>' />
    					</td>
						<td style="text-align:center">&nbsp;
							<html:text property="limitAmounts" value="<%=limitAmount%>" />
							<html:errors property='<%="limitAmounts" + counter%>' />
						</td>
						<td style="text-align:center">&nbsp;<html:text property="limitLastReviewDates" value="<%=limitDate %>" readonly="true" />

						<logic:greaterThan name="editELSize" value="1" >
						<img src="img/calendara.gif"  name="Image11" border="0" id="Image11" 
								onclick="return showCalendarWithObject(document.EntityLimitListForm.limitLastReviewDates[<%=counter %>], 'dd/mm/y');" 
								onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
						</logic:greaterThan>
						<logic:equal name="editELSize" value="1" >
						<img src="img/calendara.gif"  name="Image11" border="0" id="Image11" 
								onclick="return showCalendar('limitLastReviewDates', 'dd/mm/y');" 
								onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />	

		                </logic:equal>
						<html:errors property='<%="limitLastReviewDates" + counter%>' />
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

<table width="300" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td valign="baseline" align="center" colspan="2">
            <a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3" 
             height="22" border="0" id="Image3"/>
            </a>
            <a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel1.gif',1)"><img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
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
<!-- No pagination -->

</table>

</body>
</html>