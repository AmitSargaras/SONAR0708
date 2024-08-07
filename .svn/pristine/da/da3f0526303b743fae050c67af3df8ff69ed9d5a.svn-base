<%@ page import="java.util.Locale,
				java.util.List,
				java.util.Arrays,
				com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.propertyparameters.trx.marketfactor.IMFTemplateTrxValue,
                 com.integrosys.cms.app.propertyparameters.trx.marketfactor.OBMFTemplateTrxValue,
				 com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateUIHelper,
                 com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateForm,
                 com.integrosys.cms.ui.systemparameters.marketfactor.EventConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%         
    MFTemplateUIHelper helper = new MFTemplateUIHelper();
    
    Object obj = session.getAttribute("com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateAction.MFTemplateTrxObj");
	String status = "";
    if( obj != null ) {
        IMFTemplateTrxValue obTrxValue = (OBMFTemplateTrxValue)obj;
		status = obTrxValue.getStatus();
	}
	
	List collateralSubTypeFullList = (List)request.getAttribute("collateralSubTypeFullList");
    List collateralSubTypeFullListLabel = (List)request.getAttribute("collateralSubTypeFullListLabel");
    
	MFTemplateForm templateForm = (MFTemplateForm)request.getAttribute("MFTemplateForm");
    String[] selectedColSubTypeVals = templateForm.getSecSubType();
%>
<html>
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Maintain MF Template</title>
    <!-- InstanceEndEditable -->
     
    <!-- InstanceBeginEditable name="CssStyle" -->

    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>

    <script type="text/javascript" src="js/ajaxDropdown.js"></script>


    <script language="javascript">
    <!--
    function performSubmit()    {    
		selectAll(document.forms[0]);		
		
		if (document.forms[0].isCreate.value == 'Y')   {
			document.forms[0].event.value = '<%=EventConstant.EVENT_CREATE%>';
		} else{
			document.forms[0].event.value = '<%=EventConstant.EVENT_SUBMIT%>';
		}
		
		document.forms[0].submit();		
    }

    function cancelSubmit(){
        var url = '<%= (String) request.getAttribute("returnUrl") %>';
        document.location.href = url;
    }

    function createItem() {
		selectAll(document.forms[0]);
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].indexID.value = '';
        document.forms[0].event.value = '<%=EventConstant.EVENT_CREATE_ITEM%>';
        document.forms[0].submit();
    }

    function deleteItem(){
		selectAll(document.forms[0]);        
        document.forms[0].event.value = '<%=EventConstant.EVENT_DELETE_ITEM%>';
        document.forms[0].submit();
    }

    function updateItem(ind){
		selectAll(document.forms[0]);
        document.forms[0].fromEvent.value = 'update';
        document.forms[0].indexID.value = ind;
        document.forms[0].event.value = '<%=EventConstant.EVENT_UPDATE_ITEM%>';
        document.forms[0].submit();
    }        
	
    function addOption(original,selection,searchItem)
	{
	    var i=0,j=0,or_length=original.length,index=0;
	    var newitem=true;
	    var newItemCount = 0;

	    for (i=0;i<or_length;i++)
	    {
	        if (original.options[i].selected)
	        {
	            for (j=0;j<selection.length;j++)
	            {
	                if (original.options[i].value==selection.options[j].value)
	                {
	                    newitem=false;
	                    break;
	                }
	            }

	            if (newitem)
	            {
	                var op = new Option(original.options[i].text, original.options[i].value);
	                if(selection.length == 1 && selection.options[0].value == "")
	                {
	                    selection.options[0] = op;
	                }
	                else
	                    selection.options[selection.length] = op;

	                newItemCount ++ ;
	            }
	        }
	    }
		delOption(original);   
	}

	function delOption(selection)
	{
	    var length=selection.length, i=0, index=0;
	    for(i=(length-1);i>=0;i--)
	    {
	        if (selection.options[i].selected)
	        {
	            selection.options[i].selected=false;
	            selection.options[i]=null;
	        }
	    }
	}
	
	function selectAll(form)
	{
	    for(var i=0;i<form.unselectSecSubType.length;i++)
	    {
	        form.unselectSecSubType[i].selected= true;
	    }
	    for(var i=0;i<form.secSubType.length;i++)
	    {
	        form.secSubType[i].selected= true;
	    }	    
	}
	
	function killEnter(evt)
	{
		if(evt.keyCode == 13 || evt.which == 13)
		{
			return false;
		}
		return true;
	}

    -->
</script>
</head>

<body>

<html:form action="MaintainMFTemplate.do">
    <input type="hidden" name="event" value=""/>
    <input type="hidden" name="fromEvent" value=""/>
    <input type="hidden" name="indexID" value=""/>	
	<html:hidden property="isCreate"/>
	
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateAction.MFTemplateTrxObj" type="com.integrosys.cms.app.propertyparameters.trx.marketfactor.IMFTemplateTrxValue" scope="session"/>
    <bean:define id="formObj" name="MFTemplateForm" scope="request" type="com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateForm"/>

    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	<thead>
	    <tr>
	        <td width="81%"><h3><% if( formObj.getIsCreate() != null && formObj.getIsCreate().equals("Y") ) {%><bean:message key="title.mftemplate.create"/><% }else{ %><bean:message key="title.mftemplate.edit"/><%}%></h3></td>
	        <td width="19%" align="right" valign="bottom">&nbsp; </td>
	    </tr>
	    <tr>
	        <td colspan="2"><hr/></td>
	    </tr>
	</thead>
	<tbody>
	<tr>
	<td colspan="2">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	<tbody>
	<tr class="odd">
	    <td class="fieldname" width="20%"><bean:message key="label.mftemplate.templatename"/>&nbsp;<font color="#0000FF">*</font></td>
	    <td colspan="3" width="30%">
			<html:text property="MFTemplateName" size="80" maxlength="150" onkeypress="return killEnter(window.event);"/>&nbsp;        
	        <html:errors property="MFTemplateName"/>
	        <html:hidden property="MFTemplateID"/>
	    </td>
	    
	</tr>
	<tr class="even">
	    <td class="fieldname" width="20%"><bean:message key="label.status"/>&nbsp;<font color="#0000FF">*</font></td>
	    <td colspan="3" width="30%">		       
			<html:radio property="MFTemplateStatus" value="A"/>&nbsp;<bean:message key="label.active"/>&nbsp;
			<html:radio property="MFTemplateStatus" value="I"/>&nbsp;<bean:message key="label.inactive"/>&nbsp;
	        &nbsp;<html:errors property="MFTemplateStatus"/>			
	    </td>    
	</tr>
<%// ICMSConstant.SECURITY_TYPE_PROPERTY %>
	<tr class="even">
	    <td class="fieldname" width="20%"><bean:message key="label.security.type"/>&nbsp;</td>
	    <td colspan="3" width="30%">
	        <%= helper.getSecurityTypeDesc( formObj.getSecType() ) %>
			<html:hidden property="secType"/>
	    </td>
	</tr>
	<tr class="even">
		<td class="fieldname">
			<bean:message key="label.security.sub.type"/>&nbsp;<font color="#0000FF">*</font>
		</td>
       <td width="38%" height="171">
			<select name="unselectSecSubType" size="10" multiple="multiple" id="unselectSecSubType" style="width:260">
				<% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
					 if(selectedColSubTypeVals==null || !Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
				%>
						<option value='<%=collateralSubTypeFullList.get(i)%>'><%=collateralSubTypeFullListLabel.get(i)%></option>
				<%
					 }
				   }
				%>
			</select>
			<br><html:errors property="securitySubTypeError"/>
		</td>
		<td>
			<br/><br/><br/><br/>
			<input name="AddSubType" type="button" class="btnHighlight" value="<bean:message key="label.autovalparam.button.add"/>&gt;&gt;"
				onclick="addOption(this.form.unselectSecSubType, this.form.secSubType, '')"/>
			<br/>
			<input name="RemoveSubType" type="button" class="btnHighlight" value="&lt;&lt;<bean:message key="label.autovalparam.button.remove"/>"
				onclick="addOption(this.form.secSubType, this.form.unselectSecSubType, '')"/>
			<br/><br/><br/><br/><br />
		</td>
        <td width="38%">
			<select name="secSubType" size="10" multiple="multiple" id="secSubType" style="width:260">
				<% for(int i=0; i<collateralSubTypeFullListLabel.size(); i++){
					 if(selectedColSubTypeVals!=null && Arrays.asList(selectedColSubTypeVals).contains(collateralSubTypeFullList.get(i))){  //if this value not in selected value print..
				%>
						<option value='<%=collateralSubTypeFullList.get(i)%>'><%=collateralSubTypeFullListLabel.get(i)%></option>
				<%
					 }
				   }
				%>
			</select>
			<html:errors property="secSubType"/>
		</td>	
	</tr>
				
	</tbody>
	</table>
	</td>
	</tr>
	</tbody>
	</table>
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	    <thead>
	        <tr>
	            <td><h3><bean:message key="title.mftemplate.factor.detail"/></h3></td>
	        </tr>
	        <tr>
	            <td align="right" valign="baseline">
	                <input class="btnNormal" type="button" name="btnAddXRef" value="Add New" onclick="javascript:createItem()"/>&nbsp;
	                <input class="btnNormal" type="button" name="btnDelXRef" value="Remove" onclick="javascript:deleteItem()"/>
	            </td>
	        </tr>
	    </thead>
	    <tbody>
	        <tr>
	            <td>
	                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
	                    <thead>
	                        <tr>
	                            <td width="2%"><bean:message key="label.global.sn"/></td>
	                            <td width="18%"><bean:message key="label.mfitem.factordesc"/></td>
	                            <td width="15%"><bean:message key="label.mfitem.weightpercentage"/></td>  
	                            <td width="9%"><bean:message key="label.global.action"/></td>
	                            <td width="9%"><bean:message key="label.global.delete"/></td>
	                        </tr>
	                    </thead>
	                    <tbody>
	                         <% if (formObj.getMFItemList() != null) { %>
	                        <logic:present name="MFTemplateForm" property="deletedItemList" scope="request">
	                            <bean:define id="itemSize" value="<%= String.valueOf(formObj.getMFItemList().size()) %>"/>
	                            <logic:notEqual name="itemSize" value="0">
	                                <logic:iterate id="item" indexId="itemInd" name="MFTemplateForm" 
												property="MFItemList" scope="request"
	                                            type="com.integrosys.cms.app.propertyparameters.bus.marketfactor.IMFItem">
	                                    
	                                    <tr class="<%=(itemInd.intValue() + 1)%2==0?"even":"odd"%>">
	                                        <td class="index">
	                                            <%= itemInd.intValue() + 1 %>
	                                        </td>                                        
	                                        <td>
	                                            &nbsp;<integro:wrapper value="<%=item.getFactorDescription()%>"/>
	                                        </td>
	                                        <td>
	                                            &nbsp;<integro:empty-if-null value="<%=String.valueOf( item.getWeightPercentage() )%>"/>
	                                        </td>	
	                                        <td style="text-align:center">
	                                            <a href="javascript:updateItem('<%= itemInd.intValue() %>')">Edit</a>
	                                        </td>
	                                        <td style="text-align:center">
	                                            <html:multibox property="deletedItemList" value="<%= itemInd.toString() %>"/>
	                                            &nbsp;
	                                        </td>
	                                    </tr>
	                                </logic:iterate>
	                            </logic:notEqual>
	                            <logic:equal name="itemSize" value="0">
	                                <tr class="odd">
	                                    <td colspan="8"><bean:message key="label.mftemplate.nofactor"/></td>
	                                </tr>
	                            </logic:equal>
	                        </logic:present>
	                        <logic:notPresent name="MFTemplateForm" property="MFItemList" scope="request">
	                            <tr class="odd">
	                                <td colspan="8"><bean:message key="label.mftemplate.nofactor"/></td>
	                            </tr>
	                        </logic:notPresent>
	                      <% } else { %>
	                      <tr class="odd">
	                                <td colspan="8"><bean:message key="label.mftemplate.nofactor"/></td>
	                            </tr>
	                      <% } %>
	                    </tbody>
						<html:errors property="itemEmptyError"/>							
	                </table>
	            </td>
	        </tr>
	    </tbody>
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