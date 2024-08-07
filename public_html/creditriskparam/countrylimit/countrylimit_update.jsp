<%@ page import="java.util.Locale,
				java.util.List,
				java.util.Arrays,
				 com.integrosys.base.businfra.currency.CurrencyManager,
				 com.integrosys.base.uiinfra.common.ICommonEventConstant,
				com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.creditriskparam.trx.countrylimit.ICountryLimitTrxValue,
                 com.integrosys.cms.app.creditriskparam.trx.countrylimit.OBCountryLimitTrxValue,
				 com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitUIHelper,
                 com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitForm,
                 com.integrosys.cms.ui.creditriskparam.countrylimit.EventConstant,
                 java.util.List" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>

<%         
    CountryLimitUIHelper helper = new CountryLimitUIHelper();
    
    Object obj = session.getAttribute("com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitAction.countryLimitTrxObj");
	String status = "";
    if( obj != null ) {
        ICountryLimitTrxValue obTrxValue = (OBCountryLimitTrxValue)obj;
		status = obTrxValue.getStatus();
	}
%>
<html>
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title><bean:message key="label.country.lmt.param"/></title>
    <!-- InstanceEndEditable -->
     <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="CssStyle" -->
  <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" title="winter"/>
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="js/itgUtilities.js"></script>
    <script type="text/javascript" src="js/ajaxDropdown.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>

    <script language="javascript">
    <!--
    function performSubmit()    {  	
		
		var proceed = true;
		//if ( document.forms[0].remarks != null ) {
		//	proceed = checkRemarksMaxLength( document.forms[0].remarks );
		//}
		if( proceed == true ) {
		
			document.forms[0].event.value = '<%=EventConstant.EVENT_SUBMIT%>';	
			document.forms[0].submit();		
		}
    }

    function cancelSubmit(){
       
        var url = 'Welcome.do';
        document.location.href = url;
    }

    function createItem() {
		
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].indexID.value = '';
        document.forms[0].event.value = '<%=EventConstant.EVENT_CREATE_ITEM%>';
        document.forms[0].submit();
    }

    function deleteItem(){
		
        document.forms[0].event.value = '<%=EventConstant.EVENT_DELETE_ITEM%>';
        document.forms[0].submit();
    }

    function updateItem(ind){
		
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].indexID.value = ind;
        document.forms[0].event.value = '<%=EventConstant.EVENT_UPDATE_ITEM%>';
        document.forms[0].submit();
    }      
	
	function editRating(){
		
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].event.value = '<%=EventConstant.EVENT_PREPARE_UPDATE_RATING%>';
        document.forms[0].submit();
    }       		

    -->
</script>
</head>

<body>

<html:form action="CountryLimitParam.do">
    <input type="hidden" name="event" value=""/>
    <input type="hidden" name="fromEvent" value=""/>
    <input type="hidden" name="indexID" value=""/>	
	
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitAction.countryLimitTrxObj" type="com.integrosys.cms.app.creditriskparam.trx.countrylimit.ICountryLimitTrxValue" scope="session"/>
    <bean:define id="formObj" name="CountryLimitForm" scope="request" type="com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitForm"/>
	
	<p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>

	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	    <tr>
	        <td width="50%"><h3><bean:message key="title.crp.countryLimit"/></h3></td>
	       
			<td align="right" valign="baseline">
	                <input class="btnNormal" type="button" name="btnAddXRef" value="Add New" onclick="javascript:createItem()"/>&nbsp;
	                <input class="btnNormal" type="button" name="btnDelXRef" value="Remove" onclick="javascript:deleteItem()"/>
	        </td>
	    </tr>
		
	    <tr>
	        <td colspan="2"><hr/></td>
	    </tr>
	</thead>
	
	        <tr>
	            <td colspan="2"><html:errors property="chkDeleteItems"/>
	
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
	                    <thead>
	                        <tr>
	                            <td width="2%"><bean:message key="label.global.sno"/></td>
	                            <td width="18%"><bean:message key="label.country"/><font color="#0000FF">*</font></td>
	                            <td width="15%"><bean:message key="label.crp.countryLimit.country.rating"/><font color="#0000FF">*</font></td>
	                            <td width="15%"><bean:message key="label.crp.countryLimit.country.limit"/></td>  
	                            <td width="9%"><bean:message key="label.global.action"/></td>
	                            <td width="9%"><bean:message key="label.global.delete"/></td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <logic:present name="CountryLimitForm" property="deletedItemList" scope="request">
	                            <bean:define id="itemSize" value="<%= String.valueOf(formObj.getCountryLimitItemList().size()) %>"/>
	                            <logic:notEqual name="itemSize" value="0">
	                                <logic:iterate id="item" indexId="itemInd" name="CountryLimitForm" 
												property="countryLimitItemList" scope="request"
	                                            type="com.integrosys.cms.app.creditriskparam.bus.countrylimit.ICountryLimit">
	                                    
	                                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                                        <td class="index">
	                                            <%= itemInd.intValue() + 1 %>
	                                        </td>                                        
	                                        <td>
	                                            &nbsp;<integro:wrapper value="<%=helper.getCountryDesc( item.getCountryCode() )%>"/>
	                                        </td>
	                                        <td>
	                                            &nbsp;<integro:empty-if-null value="<%=helper.getRatingDesc( item.getCountryRatingCode() )%>"/>
	                                        </td>	
											<% if (item.getCountryLimitAmount() != null && item.getCountryLimitAmount().getCurrencyCode() != null)
											 {
										    %>	
											<td>
											    <integro:empty-if-null value="<%=item.getCountryLimitAmount().getCurrencyCode() %>"/> &nbsp;
											    <integro:empty-if-null value="<%=CurrencyManager.convertToString(locale, item.getCountryLimitAmount())%>"/>
											</td>
											<% } else { %>
											<td> &nbsp;</td>
											<% } %>				
											
	                                        <td style="text-align:center">
	                                            <a href="javascript:updateItem('<%=Long.toString(item.getCountryLimitID())%>')">Edit</a>
	                                        </td>
	                                        <td style="text-align:center">
	                                            <html:multibox property="deletedItemList" value="<%=Long.toString(item.getCountryLimitID())%>"/>
	                                            &nbsp;
	                                        </td>
	                                    </tr>
	                                </logic:iterate>
	                            </logic:notEqual>
	                            <logic:equal name="itemSize" value="0">
	                                <tr class="odd">
	                                    <td colspan="8"><bean:message key="label.no.records.found"/></td>
	                                </tr>
	                            </logic:equal>
	                        </logic:present>
	                       
	                    </tbody>
										
	                </table>
	            </td>
	        </tr>				
	</table>	
	
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	    <thead>
	        <tr>
	            <td><h3><bean:message key="title.crp.countryLimit.max.country.limit"/></h3></td>
	        
	            <td align="right" valign="baseline">
	                <input class="btnNormal" type="button" name="btnEditXRef" value="Edit" onclick="javascript:editRating()"/>&nbsp;
	            </td>
	        </tr>
			 <tr>
	        <td colspan="2"><hr/></td>
	    </tr>
	    </thead>
	        <tr>
	            <td colspan="2">
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
	                    <thead>
	                        <tr>
	                            <td width="2%"><bean:message key="label.global.sno"/></td>
	                            <td width="18%"><bean:message key="label.crp.countryLimit.country.rating"/></td>
	                            <td width="15%"><bean:message key="label.crp.countryLimit.bank.capital.funds.percentage"/></td>  
	                            <td width="15%"><bean:message key="label.crp.countryLimit.preset.country.limit.percentage"/></td>  
	                        </tr>
	                    </thead>
	                    <tbody>
	                        <logic:present name="CountryLimitForm" property="countryRatingList" scope="request">
	                            <bean:define id="itemSize" value="<%= String.valueOf(formObj.getCountryRatingList().size()) %>"/>
	                            <logic:notEqual name="itemSize" value="0">
	                                <logic:iterate id="item" indexId="itemInd" name="CountryLimitForm" 
												property="countryRatingList" scope="request"
	                                            type="com.integrosys.cms.app.creditriskparam.bus.countrylimit.ICountryRating">
	                                    
	                                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                                        <td class="index">
	                                            <%= itemInd.intValue() + 1 %>
	                                        </td>                                        
	                                        <td>
	                                            &nbsp;<integro:wrapper value="<%=helper.getRatingDesc( item.getCountryRatingCode() )%>"/>
	                                        </td>
											<% if (item.getBankCapFundPercentage() != null ) { %>
	                                        <td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf( item.getBankCapFundPercentage().doubleValue() )%>"/>
	                                        </td>
											<% } else { %>
											<td> &nbsp;</td>
											<% } %>
											<% if (item.getPresetCtryLimitPercentage() != null ) { %>											
											<td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf( item.getPresetCtryLimitPercentage().doubleValue() )%>"/>
	                                        </td>	
											<% } else { %>
	                                        <td> &nbsp;</td>
											<% } %>
	                                    </tr>
	                                </logic:iterate>
	                            </logic:notEqual>
	                            <logic:equal name="itemSize" value="0">
	                                <tr class="odd">
	                                    <td colspan="8"><bean:message key="label.no.records.found"/></td>
	                                </tr>
	                            </logic:equal>
	                        </logic:present>
	                        
	                    </tbody>
											
	                </table>
	            </td>
	        </tr>
	   
	</table>

	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	    <tr><td>&nbsp;</td></tr>
	    <% if ( status.equals( ICMSConstant.STATE_REJECTED_CREATE ) || 
				status.equals( ICMSConstant.STATE_REJECTED_UPDATE ) || 
				status.equals( ICMSConstant.STATE_REJECTED_DELETE ) ) { %>
	        <tr>
	            <td colspan="2">
	                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	                    <tbody>
	                        <tr>
	                            <td class="fieldname"><bean:message key="label.remarks"/></td>
	                            <td class="odd">
	                                <html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
	                                <html:errors property="remarks"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="fieldname"><bean:message key="label.last.action.by"/></td>
	                            <td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
	                        </tr>
	                        <tr class="odd">
	                            <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
	                            <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
	                        </tr>
	                    </tbody>
	                </table>
	            </td>
	        </tr>
	    <% } %>
	</table>
	<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	        <td colspan="3">&nbsp;</td>
	    </tr>
	    <tr>
	        <td><a href="javascript:performSubmit();"><img src="img/submit1.gif" name="Image41" border="0" id="Image3"/></a></td>
	        <% if ( status.equals( ICMSConstant.STATE_REJECTED_CREATE ) || 
				status.equals( ICMSConstant.STATE_REJECTED_UPDATE ) || 
				status.equals( ICMSConstant.STATE_REJECTED_DELETE ) ) { %>
			<td><a href="ToDo.do"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a></td>
			<% }else{ %>
			<td><a href="javascript:cancelSubmit();"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5"/></a></td>
			<% } %>
        </tr>
	    <tr>
	        <td colspan="3">&nbsp;</td>
	    </tr>
	</table>
	</html:form>
	</body>
</html>