<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductProgramLimitParameter,
				 com.integrosys.cms.app.creditriskparam.trx.productlimit.IProductLimitParameterTrxValue,
				 com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction,
				 com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitForm,
				 java.text.NumberFormat,
				 java.text.DecimalFormat" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	IProductLimitParameterTrxValue trxValue = (IProductLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction"+"."+"productLimitTrxObj");
	String event = request.getParameter("event");

	IProductProgramLimitParameter obj = (IProductProgramLimitParameter)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction"+"."+"productProgramLimitObj");

	if (obj != null && obj.getProductTypeList() != null && obj.getProductTypeList().size() > 0) {
		pageContext.setAttribute("prodTypeList", obj.getProductTypeList());
	}

	String remarks = (String)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction.remarks");

	NumberFormat formatter = new DecimalFormat("#############.##");
	
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
    <script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="javascript">
    <!--

    function submitForm (idx) {
        if (idx == 0) {
        	document.forms[0].event.value='<%=ProductProgramLimitAction.EVENT_PREPARE_EDIT_PRODUCT%>';            
        } else if (idx == 1) {
        	document.forms[0].event.value='<%=ProductProgramLimitAction.EVENT_LIST%>';            
        } else if (idx == 2) {
            document.forms[0].event.value='<%=ProductProgramLimitAction.EVENT_CLOSE%>';
        } else if (idx == 3) {
            document.forms[0].event.value='<%=ProductProgramLimitAction.EVENT_DELETE%>';
        }
        document.forms[0].submit();
    }

    -->
</script>
</head>

<body>
<html:form action="ProductProgramLimitParam.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="productLimitId" value="<%=request.getAttribute("productLimitId") %>"/>

    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3>
                    <% if (ProductProgramLimitAction.EVENT_PREPARE_CLOSE.equals(event)) { %>
                    <bean:message key="label.close"/> 
                    <% } else if (ProductProgramLimitAction.EVENT_PREPARE_DELETE.equals(event) ||
                    		ProductProgramLimitAction.EVENT_MAKER_PROCESS_DELETE.equals(event)) { %>
                    <bean:message key="label.global.delete"/> 
                     <% } else if (ProductProgramLimitAction.EVENT_TRACK.equals(event)) { %>
                    <bean:message key="title.todo.page"/> 
                    <% } else { %>
                    <bean:message key="label.view"/> 
                    <% } %>
                    <bean:message key="title.productlimit.detail"/>
					</h3>					
                </td>
	            <td valign="baseline" align="right" >
				<% if (ProductProgramLimitAction.EVENT_VIEW.equals(event)) { %>
					<input type="button" value="<bean:message key="label.edit"/>" class="btnNormal" onclick="javascript:submitForm(0)"/>
				<% } %>
	            </td>
            </tr>
            <tr>
                <td colspan="2"><hr /></td>
            </tr>
		</thead>
		<tbody>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                            <tr class="odd">
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.productlimit.product.program.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%"><%=obj.getProductProgramDesc()%>
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname">
									<bean:message key="label.productlimit.reference.code"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
								<td><%=obj.getReferenceCode()%>&nbsp;</td>
							</tr>
                            <tr class="odd">
                                <td class="fieldname">
                                	<bean:message key="label.productlimit.limit.amount"/>
								</td>
                                <td><%=obj.getLimitAmount() == null ? "-" : obj.getLimitAmount().getCurrencyCode()%> 
                                <%=obj.getLimitAmount() == null ? "" : formatter.format(obj.getLimitAmount().getAmount())%>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </tbody>
    </table>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.productlimit.product.type"/></h3></td>
      <td valign="bottom">
      </td>
    </tr>
    <tr>
      <td colspan="2"><hr /> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td width="5%"><bean:message key="label.global.sn"/></td>
              <td width="50%"><bean:message key="label.productlimit.product.type.desc"/></td>
            </tr>
          </thead>
            <tbody>
                <logic:present name="prodTypeList" scope="page">
                    <logic:iterate name="prodTypeList" id="element" indexId="ind" type="com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductTypeLimitParameter">
						<tr class="<%=ind.intValue()%2==0?"odd":"even" %>">
							<td class="index"><%= ind.intValue() + 1 %></td>
							<td><integro:empty-if-null value="<%=element.getProductTypeDesc()%>"/>&nbsp;</td>
						</tr>
					</logic:iterate>
				</logic:present>		
                <logic:notPresent name="prodTypeList" scope="page">
                    <tr class="odd">
                        <td colspan="4"><bean:message key="label.global.not.found"/></td>
                    </tr>
                </logic:notPresent>

            </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>

<%
	if (ProductProgramLimitAction.EVENT_MAKER_PROCESS_DELETE.equals(event) || ProductProgramLimitAction.EVENT_PREPARE_CLOSE.equals(event) ) {
		String oldRemarks = trxValue.getRemarks();
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
<tbody>
     <tr>
       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
           <tbody>
             <tr>
               <td class="fieldname" width="20%">Remarks</td>
               <td width="80%" class="odd"><html:textarea property="remarks" rows="3" cols="95" value="<%=remarks%>"/>&nbsp;
               <html:errors property="remarks"/>
               </td>
             </tr>
             <tr>
               <td class="fieldname">Last Action By</td>
               <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
             </tr>
             <tr class="odd">
               <td class="fieldname">Last Remarks Made</td>
               <td><integro:wrapper value="<%=trxValue.getRemarks()%>" lineLength="90"/>&nbsp;</td>
             </tr>
           </tbody>
         </table></td>
     </tr>

  </tbody>
</table>    
<% } %>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
		<% if (ProductProgramLimitAction.EVENT_VIEW.equals(event)) { %>
        	<td><a href="#" onclick="submitForm(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/return2.gif',1)"><img src="img/return1.gif" name="Image8" width="80" height="20" border="0" id="Image8"/></a></td>
		<% } else if (ProductProgramLimitAction.EVENT_PREPARE_CLOSE.equals(event)) { %>
			<td><a href="#" onclick="submitForm(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
			<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10"/></a></td>
		<% } else if (ProductProgramLimitAction.EVENT_PREPARE_DELETE.equals(event)) { %>
			<td><a href="#" onclick="submitForm(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image8" border="0" id="Image8" /></a></td>
			<td><a href="#" onclick="submitForm(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/return2.gif',1)"><img src="img/return1.gif" name="Image8" width="80" height="20" border="0" id="Image8"/></a></td>
		<% } else if (ProductProgramLimitAction.EVENT_MAKER_PROCESS_DELETE.equals(event)) { %>
			<td><a href="#" onclick="submitForm(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image8" border="0" id="Image8" /></a></td>		
			<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10"/></a></td>
		<% } else { %>
	        <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/return2.gif',1)"><img src="img/return1.gif" name="Image10" border="0" id="Image10"/></a></td>
		<% } %>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
</body>
</html>