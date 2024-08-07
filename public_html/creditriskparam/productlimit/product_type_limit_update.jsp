<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.CommonCodeList,
				 com.integrosys.cms.ui.creditriskparam.producttypelimit.ProductTypeLimitAction,
				 java.util.List,
				 java.util.ArrayList,
				 java.util.Map,
				 java.util.Collection,
				 java.util.Iterator,
				 org.apache.struts.util.LabelValueBean,
				 java.util.Collections,
				 java.util.Comparator,
				 java.util.HashMap,
                 org.apache.commons.lang.StringEscapeUtils"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%

	class AlphabeticComparator implements Comparator {
    	public int compare(Object o1, Object o2) {
        	LabelValueBean s1 = (LabelValueBean) o1;
        	LabelValueBean s2 = (LabelValueBean) o2;
        	return s1.getLabel().compareTo(s2.getLabel());
   		}
	}

	String indexID = request.getParameter("indexID");
	boolean isAdd = indexID.equals(String.valueOf(ICMSConstant.INT_INVALID_VALUE));
	
	CommonCodeList prodType = CommonCodeList.getInstance(ICMSConstant.CATEGORY_CODE_PRODUCT_TYPE);
	
	List prodTypeList = new ArrayList();
	Map prodTypeMap = prodType.getLabelValueMap();
	Collection keys = prodType.getCommonCodeValues();

	Map prodTypeMapTemp = new HashMap();
	
	for (Iterator i = keys.iterator(); i.hasNext();) {
	    	Object o = i.next();
	    	LabelValueBean bean = new LabelValueBean((String)prodTypeMap.get(o), (String)prodTypeMap.get(o));
	    	prodTypeList.add(bean);
	    	prodTypeMapTemp.put(StringEscapeUtils.escapeJavaScript((String)prodTypeMap.get(o)), StringEscapeUtils.escapeJavaScript((String)o));
	}
	    
	Collections.sort(prodTypeList, new AlphabeticComparator());   
	pageContext.setAttribute("prodTypeList", prodTypeList);

%>

<html>
<head>
    <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" title="winter"/>

	<script type="text/javascript" src="js/calendar.js"></script>
	<script type="text/javascript" src="js/calDriver.js"></script>
	<script language="javascript">
	<!--
	function submitForm(idx) {

		document.forms[0].prodTypeRefCode.disabled = false;
		
		if (idx == 1){
			document.forms[0].event.value = '<%=ProductTypeLimitAction.EVENT_CREATE%>';
		}else if (idx == 2){
			document.forms[0].event.value = '<%=ProductTypeLimitAction.EVENT_UPDATE%>';
		}else{
			document.forms[0].event.value = '<%=ProductTypeLimitAction.EVENT_RETURN%>';
		}

		document.forms[0].submit();  
	}

	function changeOption(selectObj)
	{
		var selectIndex = selectObj[selectObj.selectedIndex];

		if (selectObj.selectedIndex > 0) {

			var i = selectIndex.value; 

			var j = '<%= prodTypeMapTemp %>';

			var w = j.split(","); 

			for (j=0; j<w.length; j++)
			{
				if (w[j].indexOf (i) != -1)
				{
					var u = w[j].split("=");
					break;
				} 
			}	
			document.forms[0].prodTypeRefCode.value = u[1];
			
		}
	}
	
	-->
	</script>
</head>
<body>
<html:form action="ProductTypeLimitParam.do">
	<input type="hidden" name="indexID" value="<%=request.getParameter("indexID") %>"/>
	<input type="hidden" name="fromEvent" value="<%=request.getParameter("fromEvent") %>"/>
	<input type="hidden" name="event"/>
	
    <p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p><br>

	    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" align="center">
        <thead>
            <tr>
                <td>
                    <h3>
                    <% if( isAdd ) {%>
                    	<bean:message key="label.add"/>
                    <% } else { %>
                    	<bean:message key="label.edit"/>
                    <% } %>
					<bean:message key="label.productlimit.product.type"/>
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
                            <tr class="odd">
                                <td width="40%" class="fieldname">
                                	<bean:message key="label.productlimit.product.type.desc"/>&nbsp;
									<font color="#0000FF">*</font>
								</td>
                                <td width="60%">
		         				 <html:select property="prodTypeDesc" onchange="javascript:changeOption(this)">
		            				<option value=""><bean:message key="label.please.select"/></option>
		            				<html:options collection="prodTypeList" property="value" labelProperty="label"/>
		         				 </html:select>
                                       &nbsp;<html:errors property="prodTypeDesc"/>
                                </td>
                            </tr>
							<tr class="even">
								<td class="fieldname"><bean:message key="label.productlimit.reference.code"/>&nbsp;
								<font color="#0000FF">*</font></td>
								<td><html:text property="prodTypeRefCode" maxlength="10" size="20" disabled="true"/>
                                <html:errors property="prodTypeRefCode"/></td>
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
	
  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
           <% if (isAdd) { %>
            <td><a href="javascript:submitForm(1)"><img src="img/ok1.gif" border="0" /></a></td>
		<% } else { %>
            <td><a href="javascript:submitForm(2)"><img src="img/save1.gif" border="0" /></a></td>
		<% } %>
           <td><a href="javascript:submitForm(3)"><img src="img/cancel1.gif" width="70" height="20" border="0" /></a></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
  </table>

</html:form>
</body>
</html>