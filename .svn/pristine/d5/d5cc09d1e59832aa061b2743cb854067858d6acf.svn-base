<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.text.DecimalFormat,
                 java.text.NumberFormat,
                 java.math.BigDecimal,
                 org.apache.struts.util.LabelValueBean,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.List,
                 java.util.Collections,
                 java.util.Collection,
                 java.util.Iterator,
                 java.util.Comparator,
                 java.util.ArrayList,
                 java.util.Map,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.creditriskparam.trx.internalcreditrating.OBInternalCreditRatingTrxValue,
								 com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.OBInternalCreditRating,
                 com.integrosys.cms.ui.creditriskparam.internalcreditrating.InternalCreditRatingItemForm,
                 com.integrosys.base.techinfra.validation.Validator" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Add New Internal Credit Rating</title>
<!-- InstanceEndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!-- InstanceBeginEditable name="CssStyle" -->
<!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>
  <script type="text/javascript" src="js/itgUtilities.js"></script>
  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
  <script type="text/javascript" src="js/validation.js"></script>
</head>

<body onLoad="MM_preloadImages('img/return2.gif')">
 <script language="javascript">
   function performSubmit()
   {
	   //alert(document.forms[0].indexID.value);
	   //alert(document.forms[0].fromEvent.value);
		if (document.forms[0].indexID.value == '')
		{
		    document.forms[0].event.value = "maker_create_item_confirm";
		}
		else
		{
		   document.forms[0].event.value = "maker_submit";	
		} 
		document.forms[0].submit();	
		
   }

   function cancelSubmit()
   {
		
		document.forms[0].action = "InternalCreditRatingParam.do?event=maker_return_add_item";
		document.forms[0].submit();
   }

	function killEnter(evt)
	{
		if(evt.keyCode == 13 || evt.which == 13)
		{
			return false;
		}
		return true;
	}   
   
 </script>

<% class AlphabeticComparator implements Comparator {
        public int compare(Object o1, Object o2) {
            LabelValueBean s1 = (LabelValueBean) o1;
            LabelValueBean s2 = (LabelValueBean) o2;
            return s1.getValue().compareTo(s2.getValue());
        }
    }
%>  

<%
InternalCreditRatingItemForm itemForm = (InternalCreditRatingItemForm)request.getAttribute("InternalCreditRatingItemForm");
String indexID = itemForm.getIndexID();
DefaultLogger.debug(this, "@@@Debug1::::::::" + indexID);

String fromEvent = request.getParameter("fromEvent");
DefaultLogger.debug(this, "@@@Debug2::::::::" + fromEvent);

String event = request.getParameter("event");
DefaultLogger.debug(this, "@@@Debug3::::::::" + event);

DefaultLogger.debug(this, "@@@Debug3::::::::" + itemForm );

NumberFormat formatter = new DecimalFormat("##");

String regex = "[-]*[0-9]*";

List gradeList = new ArrayList();
CommonCodeList grade = CommonCodeList.getInstance(CategoryCodeConstant.INTERNAL_CREDIT_GRADE);
Map gradeMap = grade.getLabelValueMap();
Collection keys = grade.getCommonCodeValues();

for (Iterator i = keys.iterator(); i.hasNext();) {
    	Object o = i.next();
    	LabelValueBean bean = new LabelValueBean((String)gradeMap.get(o), (String) o );
      gradeList.add(bean);
}
    
Collections.sort(gradeList, new AlphabeticComparator());   
pageContext.setAttribute("gradeList", gradeList);
     
%>
 <html:form action="InternalCreditRatingItem.do">
  <input type="hidden" name="event" value=""/> 
  <input type="hidden" name="errorEvent" value="<%=request.getAttribute("errorEvent")%>"/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="indexID"/>
  
  <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> &nbsp;&nbsp;&nbsp;&nbsp;
     <td width="46%"> <h3><%if( indexID.equals("") ) {%><bean:message key="title.crp.add.internal.credit.rating"/><%}else{%><bean:message key="title.crp.edit.internal.credit.rating"/><%}%></h3></td>
     <td width="54%" align="right">&nbsp;</td>
    </tr>
    <tr> 
     <td colspan="2"><hr /></td>
    </tr>
    <tr> 
     <td colspan="2">
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
       <tbody>
        <tr class="odd"> 
         <td width="32%" class="fieldname"><bean:message key="label.crp.internal.credit.rating.grade"/>&nbsp;<font color="#0000FF">*</font></td>
         <td width="68%">
				     <html:select property="creditRatingGrade">
		            <option value=""><bean:message key="label.please.select"/></option>
		            <!--html:options  name="creditRatingGradeValues" labelName="creditRatingGradeLabels"/-->
		            <html:options collection="gradeList" property="value" labelProperty="label"/>
		          </html:select>&nbsp;
				       &nbsp;<html:errors property="creditRatingGrade" />	 
         </td>
        </tr>
        
        <tr class="even"> 
         <td class="fieldname"><bean:message key="label.crp.internal.credit.rating.limit.amt"/>&nbsp;<font color="#0000FF">*</font></td>
         <td>
                <html:hidden property="creditRatingLmtAmtCode" value="<%=itemForm.getCreditRatingLmtAmtCode()%>"/>

                <%
                if(itemForm.getCreditRatingLmtAmt()!=null && !itemForm.getCreditRatingLmtAmt().trim().equals("") && Validator.checkPattern(itemForm.getCreditRatingLmtAmt(), regex)){
	                    
		                    DefaultLogger.debug(this, "If here::::::::");
	               %>
                   <html:text property="creditRatingLmtAmt" value="<%=formatter.format(Double.parseDouble(itemForm.getCreditRatingLmtAmt()))%>" size="30" />&nbsp;

                <% 
              }
              else if("maker_edit_item".equals(event)){
	              
	              %>
	              <html:text property="creditRatingLmtAmt" value="<%=formatter.format(Double.parseDouble(itemForm.getCreditRatingLmtAmt()))%>" size="30" />&nbsp;
	              
	              <%
                  }else{
	                  DefaultLogger.debug(this, "@@@Here::::::::" );%>
                
                  <html:text property="creditRatingLmtAmt" value="<%=itemForm.getCreditRatingLmtAmt()%>" size="30" />&nbsp;
                <%}%>
							  &nbsp;<html:errors property="creditRatingLmtAmt" />	
  
         </td>
        </tr>
       </tbody>
	            <html:errors property="duplicateEntryError"/>	
      </table>
     </td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
   </thead>
   <tbody>
   </tbody>
  </table>  

  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
	    <td><a href="#" onmouseout="MM_swapImgRestore()" onClick="performSubmit();" onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
	        <img src="img/ok1.gif" name="Image1" width="60" height="22" border="0" id="Image1"/></a>
	    </td>
	    
	    <td><a href="javascript:cancelSubmit()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
	        <img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2"/></a>
	    </td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>
 </html:form>
</body>