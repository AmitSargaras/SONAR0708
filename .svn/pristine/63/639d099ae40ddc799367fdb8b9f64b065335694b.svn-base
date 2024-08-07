<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.base.techinfra.diff.CompareOBUtil,
				 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
				 com.integrosys.base.techinfra.diff.CompareResult,
				 java.util.List,
				 java.util.Arrays,
				 com.integrosys.base.businfra.currency.Amount,
				 java.util.Comparator,
				 java.util.Collections,
				 com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductProgramLimitParameter,
				 com.integrosys.cms.app.creditriskparam.trx.productlimit.IProductLimitParameterTrxValue,
				 com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction,
				 com.integrosys.cms.app.creditriskparam.bus.productlimit.IProductTypeLimitParameter,
				 java.text.NumberFormat,
				 java.text.DecimalFormat" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    String event = request.getParameter("event");
	IProductLimitParameterTrxValue trxValue = (IProductLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.productprogramlimit.ProductProgramLimitAction"+"."+"productLimitTrxObj");
    
    if( trxValue ==null ) {
        out.println("Expected session parameter 'IProductLimitParameterTrxValue' is missing.");
        return;
    }
    
    IProductProgramLimitParameter productObj = null;
    boolean isTrack = false;
    boolean isDelete = false;
    boolean isClose = false;
    if(trxValue != null){
	   
	   if(event.equalsIgnoreCase(ProductProgramLimitAction.EVENT_TRACK)) {
		   isTrack = true;
	       	if (trxValue.getStatus().equals(ICMSConstant.STATE_CLOSED)) {
	       		productObj = trxValue.getActualProductProgramLimitParameter();
	       		
	       		if (productObj == null)
	       			productObj = trxValue.getStagingProductProgramLimitParameter();
	       		
	       		if(productObj.getProductTypeList() != null && productObj.getProductTypeList().size() > 0){
	       	    pageContext.setAttribute("prodTypeList", productObj.getProductTypeList());
	       		}
	       		
	       	} else {
	       		productObj = trxValue.getStagingProductProgramLimitParameter();
	       		if(productObj.getProductTypeList() != null && productObj.getProductTypeList().size() > 0){
	       	    pageContext.setAttribute("prodTypeList", productObj.getProductTypeList());
	       		}
	        }
       }
	   
	   if(event.equalsIgnoreCase(ProductProgramLimitAction.EVENT_PREPARE_CLOSE)){
		    isClose = true;
		    productObj = trxValue.getStagingProductProgramLimitParameter();
     		if(productObj.getProductTypeList() != null && productObj.getProductTypeList().size() > 0){
     	    pageContext.setAttribute("prodTypeList", productObj.getProductTypeList());
     		}
	   }
	   
	   if(event.equals(ProductProgramLimitAction.EVENT_PREPARE_DELETE)){
		    isDelete = true;
		    productObj = trxValue.getActualProductProgramLimitParameter();
    		if(productObj.getProductTypeList() != null && productObj.getProductTypeList().size() > 0){
    	    pageContext.setAttribute("prodTypeList", productObj.getProductTypeList()); 
    		}
	   }
	   
	  
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
 
    function submitPage (idx) {
    	if (idx == 0) {
            document.forms[0].event.value='<%=ProductProgramLimitAction.EVENT_CLOSE%>';
    	}else if( idx == 1){
    		document.forms[0].event.value='<%=ProductProgramLimitAction.EVENT_DELETE%>';
    	}else if(idx == 2){
    		document.forms[0].event.value='<%=ProductProgramLimitAction.EVENT_LIST%>';
    	}
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
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.productlimit.product.program.desc"/>&nbsp;<font color="#0000FF">*</font>
								</td>
                                <td width="60%"><integro:empty-if-null value="<%=productObj.getProductProgramDesc()%>"/>&nbsp;
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.productlimit.reference.code"/>&nbsp;<font color="#0000FF">*</font></td>
								<td><integro:empty-if-null value="<%=productObj.getReferenceCode()%>"/>&nbsp;</td>
							</tr>
                            <tr class="odd">
                                <td class="fieldname"><bean:message key="label.productlimit.limit.amount"/></td>
								<td>
								<%=productObj.getLimitAmount() == null ? "-" : productObj.getLimitAmount().getCurrencyCode()%>
								<%=productObj.getLimitAmount() == null ? "" : formatter.format(productObj.getLimitAmount().getAmount())%>								
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
	              <td width="95%"><bean:message key="label.productlimit.product.type.desc"/></td>
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
                        <td colspan="7"><bean:message key="label.global.not.found"/></td>
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
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
			
	    </tr>
	    <tr>
        <% 
          if (isTrack) 
          { 
        %>
            <td><a href='ToDo.do?event=totrack' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/return2.gif',1)"><img src="img/return1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
           <td>&nbsp;</td>
        <% 
          } else if(isDelete){ 
        %>
            <td><a href="javascript:submitPage(1)"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image8" border="0" id="Image8" /></a></td>
			<td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/return2.gif',1)"><img src="img/return1.gif" name="Image8" width="80" height="20" border="0" id="Image8"/></a></td>
       <%  
          }
          else 
          { 
        %>
           <td><a href="javascript:submitPage(0)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
           <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        <% 
          } 
        %>
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