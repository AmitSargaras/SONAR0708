<%@ page import="com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductProgramLimitParameter,
				 com.integrosys.cms.app.creditriskparam.trx.productlimit.IProductLimitParameterTrxValue,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 org.apache.struts.util.LabelValueBean, 
				 java.util.List,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	IProductLimitParameterTrxValue trxValue = (IProductLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction"+"."+"productLimitTrxObj");

    String remarks = (String)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction.remarks");

	boolean isCreate = 
		(trxValue == null || 
		trxValue.getActualProductProgramLimitParameter() == null);
	
	String fromEvent = (String)request.getAttribute("fromEvent");
	
	IProductProgramLimitParameter obj = (IProductProgramLimitParameter)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction"+"."+"productProgramLimitObj");

	IProductProgramLimitParameter actualObj = trxValue == null ? null : trxValue.getActualProductProgramLimitParameter();
	
	String event = (String) request.getAttribute("event");
	
	if (obj!= null && obj.getProductTypeList() != null && obj.getProductTypeList().size() > 0) {	
		pageContext.setAttribute("productTypeList", obj.getProductTypeList());
	}

%>

<html>
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Product Limit Parameter</title>
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


<script language="javascript">
    <!--
    function performSubmit() {
    	 document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_SUBMIT%>';
		document.forms[0].submit();
    }

    function cancelSubmit(idx){
        if (idx == 1) 
 			document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_LIST%>';
 		else if (idx == 2)	{
 	 		document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_VIEW%>';
 	 		document.forms[0].productLimitId.value = '<%=(actualObj!=null)?String.valueOf(actualObj.getId()):""%>';
 		} 
		document.forms[0].submit();
    }

    function addNew() {
        document.forms[0].event.value = '<%= ProductProgramLimitAction.EVENT_ADD_ITEM%>';
        document.forms[0].indexID.value = '<%=ICMSConstant.INT_INVALID_VALUE%>';
        document.forms[0].submit();             
    }

    function editItem(idx) {
    	document.forms[0].event.value = '<%= ProductProgramLimitAction.EVENT_EDIT_ITEM%>';
        document.forms[0].indexID.value = idx;
        document.forms[0].submit();
    }

    function deleteList() {
    	document.forms[0].event.value = '<%= ProductProgramLimitAction.EVENT_DELETE_ITEM%>';
        document.forms[0].submit();
    }

    -->
</script>
</head>
<body>
<html:form action="ProductProgramLimitParam.do">
    <input type="hidden" name="event" value=""/>
    <input type="hidden" name="productLimitId" />
	<input type="hidden" name="indexID" value="<%=request.getParameter("indexID") %>"/>
	<input type="hidden" name="fromEvent" value="<%=request.getAttribute("event")%>"/>

    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3>
                    <% if( isCreate ) {%>
                    	<bean:message key="label.add"/>
                    <% } else { %>
                    	<bean:message key="label.edit"/>
                    <% } %>
					<bean:message key="title.productlimit.program"/> 
					</h3>
                </td>
            </tr>
            <tr>
                <td><hr /></td>
            </tr>
            <tr>
                <td>
                <html:errors property="duplicateEntryError"/>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                        <% if (!isCreate) { %>
                            <tr class="odd">
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.productlimit.product.program.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%">
									<html:text property="prodProgramDesc" readonly = "true" maxlength="150" size="50"/> 
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.productlimit.reference.code"/>&nbsp;
								<font color="#0000FF">*</font></td>
								<td>
									<html:text property="prodProgramRefCode" readonly = "true" maxlength="10" size="20"/>                       
								</td>
							</tr>				
							<% } else {%>
							<tr class="odd">
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.productlimit.product.program.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%">
									<html:text property="prodProgramDesc" maxlength="150" size="50"/> 
                                     &nbsp;<html:errors property="prodProgDesc"/>
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.productlimit.reference.code"/>&nbsp;
								<font color="#0000FF">*</font></td>
								<td>
									<html:text property="prodProgramRefCode" maxlength="10" size="20"/>
                                     &nbsp;<html:errors property="prodProgRefCode"/>
								</td>
							</tr>		
							<% } %>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.productlimit.limit.amount"/></td>
                                <td>MYR <html:text property="limitAmt" maxlength="16" size="20"/>
                                &nbsp;<html:errors property="prodProgLimitAmt"/></td>                
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
    


<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td> <h3><bean:message key="label.productlimit.product.type"/></h3></td>
      <td valign="bottom">
        <table border="0" align="right" cellpadding="0" cellspacing="2">
          <tr>
            <td valign="baseline" align="center">
				<input type="button" value="<bean:message key="label.add.new"/>" class="btnNormal" onclick="javascript:addNew()"/>
				&nbsp;
				<input type="button" value="<bean:message key="label.remove"/>" class="btnNormal" onclick="javascript:deleteList()"/>
            </td>
          </tr>
        </table>  
      </td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <html:errors property="chkDeletes"/>
        <table width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td width="5%"><bean:message key="label.global.sn"/></td>
              <td width="35%"><bean:message key="label.productlimit.product.type.desc"/></td>
              <td width="15%"><bean:message key="label.global.action"/></td>
			  <td width="15%"><bean:message key="label.select"/></td>
            </tr>
          </thead>
            <tbody>
				<logic:present name="productTypeList" scope="page">
                    <logic:iterate name="productTypeList" id="element" indexId="ind" type="com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductTypeLimitParameter">
						<tr class="<%=ind.intValue()%2==0?"odd":"even" %>">
							<td class="index"><%= ind.intValue() + 1 %></td>
							<td><integro:empty-if-null value="<%= element.getProductTypeDesc()%>"/>&nbsp;</td>
                            <td><a href="javascript:editItem('<%=ind.intValue()%>')"><bean:message key="label.edit"/></a></td>
							<td><html:multibox property="deleteItems" value="<%=ind.toString()%>"/></td>							
						</tr>
					</logic:iterate>
				</logic:present>		
                <logic:notPresent name="productTypeList" scope="page">
                    <tr class="odd">
                        <td colspan="8"><bean:message key="label.global.not.found"/></td>
                    </tr>
                </logic:notPresent>
                

            </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
<%
  if (trxValue != null && !ICMSConstant.STATE_ACTIVE.equals(trxValue.getStatus())) {
	//String remarks = trxValue.getRemarks();
	if (!ProductProgramLimitAction.EVENT_PREPARE_UPDATE.equals(request.getParameter("event")) &&
			!ProductProgramLimitAction.EVENT_MAKER_PROCESS.equals(request.getParameter("event"))) {
		String oldremarks = request.getParameter("remarks");
	}

%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
<tbody>

     <tr>
       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
           <tbody>
             <tr>
			    <td class="fieldname"><bean:message key="label.remarks"/></td>
	            <td class="odd">
	            <html:textarea property="remarks" rows="3" cols="120" value="<%=remarks%>" />&nbsp;
	            <html:errors property="remarks"/><html:hidden property="remarks" value="" />
	            </td>
             </tr>
             <tr>
               <td class="fieldname">Last Action By</td>
               <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
             </tr>
             <tr class="odd">
               <td class="fieldname">Last Remarks Made</td>
               <td><%=trxValue.getRemarks()%>&nbsp;</td>
			  
             </tr>
           </tbody>
         </table></td>
     </tr>
	
  </tbody>
</table>    
<% } %>
    <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
		<tr>
      <td colspan="2">&nbsp;<html:errors property="<%=ICMSUIConstant.PRODUCTLIMIT_DUPLICATE_PRODUCT%>"/></td>
    </tr>
        <tr>
            <td><a href="javascript:performSubmit()" onmouseout="MM_swapImgRestore()"><img src="img/submit1.gif" border="0" /></a></td>
        <% if (request.getParameter("trxId") == null && ((trxValue == null) || !trxValue.getOpDesc().equals("CHECKER_REJECT"))) { %>
        	<% if (isCreate) { %>
     		<td><a href="javascript:cancelSubmit(1)"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
			<% } else { %>
			<td><a href="javascript:cancelSubmit(2)"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
		<% }} else { %>
			<td><a href="ToDo.do"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
		<% } %>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</html:form>
</body>

</html>