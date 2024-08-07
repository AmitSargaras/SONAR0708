<%@ page import="com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductProgramLimitParameter,
				 com.integrosys.cms.app.creditriskparam.trx.productlimit.IProductLimitParameterTrxValue,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction,
				 com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductTypeLimitParameter,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 java.util.List,
				 java.util.Arrays,
				 com.integrosys.base.businfra.currency.Amount,
				 java.util.Comparator,
				 java.util.Collections,
				 java.text.NumberFormat,
				 java.text.DecimalFormat" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    IProductLimitParameterTrxValue trxValue = (IProductLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction"+"."+"productLimitTrxObj");
    
    String event = request.getParameter("event");
	
    if( trxValue ==null ) {
        out.println("Expected session parameter 'IProductLimitParameterTrxValue' is missing.");
        return;
    }
    
	IProductProgramLimitParameter actualObj = trxValue.getActualProductProgramLimitParameter();
	
	IProductProgramLimitParameter stagingObj = trxValue.getStagingProductProgramLimitParameter();
	
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

    function approve() {
        document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_APPROVE%>';
        document.forms[0].submit();
    }
    
    function reject() {
        document.forms[0].event.value = '<%=ProductProgramLimitAction.EVENT_REJECT%>';
        document.forms[0].submit();
    }
    -->
</script>
</head>

<body>
<html:form action="ProductProgramLimitParam.do">
<input type="hidden" name="event" value=""/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID") %>"/>

  <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3><bean:message key="title.productlimit.program"/>
					</h3>
                </td>
            </tr>
            <tr>
                <td><hr /></td>
            </tr>
		</thead>
		<tbody>
            <tr>
                <td>
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
                            <tr class="odd">
                                <td width="40%" class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "productProgramDesc")?"fieldname":"fieldnamediff"%>">
                                	<bean:message key="label.productlimit.product.program.desc"/>&nbsp;<font color="#0000FF">*</font>
								</td>
                                <td width="60%"><integro:empty-if-null value="<%=stagingObj.getProductProgramDesc()%>"/>&nbsp;
                                </td>
                            </tr>
							<tr class="even">
								<td class="<%=CompareOBUtil.compOB(stagingObj, actualObj, "referenceCode")?"fieldname":"fieldnamediff"%>"><bean:message key="label.productlimit.reference.code"/>&nbsp;<font color="#0000FF">*</font></td>
								<td><integro:empty-if-null value="<%=stagingObj.getReferenceCode()%>"/>&nbsp;</td>
							</tr>
                            <tr class="odd">
                             <td class='<%=(stagingObj!=null && actualObj!=null) && (stagingObj.getLimitAmount()!=null && actualObj.getLimitAmount()!=null) && (stagingObj.getLimitAmount().getAmount() == actualObj.getLimitAmount().getAmount())?"fieldname":"fieldnamediff"%>'>
                               <bean:message key="label.productlimit.limit.amount"/></td>
								<td><%=stagingObj.getLimitAmount() == null ? "-" : "MYR" + formatter.format(stagingObj.getLimitAmount().getAmount())%></td>
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

	<%
		List res = CompareOBUtil.compOBArray(stagingObj.getProductTypeList().toArray(), 
						actualObj != null ? actualObj.getProductTypeList().toArray() : null);
	
		if (res != null && res.size() > 0) {
	
			Collections.sort(res, new Comparator() {
				public int compare (Object o1, Object o2) {
	
					return ((IProductTypeLimitParameter)((CompareResult)o1).getObj()).getProductTypeDesc().compareTo
						(((IProductTypeLimitParameter)((CompareResult)o2).getObj()).getProductTypeDesc());
				}		
			});
	
			pageContext.setAttribute("prodTypeList", res);
		}
	%>
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
              	  <td width="95%"><bean:message key="label.productlimit.product.type.desc"/></td>
	            </tr>
	          </thead>
	            <tbody>
					
	                <logic:present name="prodTypeList" scope="page">
	                    <logic:iterate name="prodTypeList" id="element" indexId="ind" type="com.integrosys.base.techinfra.diff.CompareResult">
							<%
								IProductTypeLimitParameter obj = (IProductTypeLimitParameter)element.getObj();
							%>
							<tr class="<%=ind.intValue()%2==0?"odd":"even" %>">
								<td class="<bean:write name="element" property="key" />"><%= ind.intValue() + 1 %></td>
								<td><integro:empty-if-null value="<%=obj.getProductTypeDesc()%>"/>&nbsp;</td>
							</tr>
						</logic:iterate>
					</logic:present>		
	                <logic:notPresent name="prodTypeList" scope="page">
	                    <tr class="odd">
	                        <td colspan="6"><bean:message key="label.global.not.found"/></td>
	                    </tr>
	                </logic:notPresent>
	
	            </tbody>
	        </table>
	      </td>
	    </tr>
        <tr>
                <td>&nbsp;</td>
        </tr>
	  </tbody>
	</table>
	
	<%
		String remarks = trxValue.getRemarks();
		if (!ProductProgramLimitAction.EVENT_CHECKER_PROCESS.equals(request.getParameter("event"))) {
			remarks = request.getParameter("remarks");
		}
	%>
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" >
	<tbody>
	     <tr>
	       <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	           <tbody>
	             <tr class="odd">
	               <td class="fieldname" width="20%">Remarks</td>
	               <td width="80%" class="odd"><html:textarea property="remarks" rows="3" cols="95"/>&nbsp;
	               <html:errors property="remarks"/>
	               </td>
	             </tr>
	             <tr class="even">
	               <td class="fieldname">Last Action By</td>
	               <td class="even"><%=trxValue.getUserInfo()%>&nbsp;</td>
	             </tr>
	             <tr class="odd">
	               <td class="fieldname">Last Remarks Made</td>
	               <td><integro:wrapper value="<%=trxValue.getRemarks()%>"/>&nbsp;</td>
	             </tr>
	           </tbody>
	         </table></td>
	     </tr>
	
	  </tbody>
	</table>
	
	<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
	    <tr>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
			
	    </tr>
	    <tr>
	        <td><a href="#" onclick="approve()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80"
	                                                                                                                                               height="20" border="0" id="Image8"/></a></td>
	        <td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70"
	                                                                                                                                             height="20" border="0" id="Image9"/></a></td>
	        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10"/></a>
	        </td>
	    </tr>
	    <tr>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
	    </tr>
	</table>

</html:form>
</body>
</html>