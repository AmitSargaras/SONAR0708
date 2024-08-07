
<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager, com.integrosys.cms.ui.common.CommonCodeList,
com.integrosys.cms.ui.common.constant.ICMSUIConstant, java.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%!
    int records_per_page = 10;
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="Javascript" type="text/javascript">
    <!--

    function submitPage(gobutton) {
        document.forms[0].gobutton.value=gobutton;
        if(gobutton==1)  {
        	document.forms[0].leIDType.value="";
            document.forms[0].legalID.value="";
            document.forms[0].idNO.value="";
            document.forms[0].docBarCode.value="";
        } else if(gobutton==2){
            document.forms[0].customerName.value="";
            document.forms[0].idNO.value="";
            document.forms[0].docBarCode.value="";
        }else if(gobutton==3){
            document.forms[0].customerName.value="";
            document.forms[0].leIDType.value="";
            document.forms[0].legalID.value="";
            document.forms[0].docBarCode.value="";
       	}else if(gobutton==4){
            document.forms[0].customerName.value="";
            document.forms[0].leIDType.value="";
            document.forms[0].legalID.value="";
            document.forms[0].idNO.value="";            
        }
        document.forms[0].submit();
 }

    function handleEnter (field, event, itemPressed) {
		var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
		//alert("event.keyCode: " + event.keyCode + "  event.which: " + event.which + "  event.charCode: " + event.charCode);

		if (keyCode == 13) {
			if (field.value == "" || field.value == null) {
				//
			}
			else {
				submitPage(itemPressed);
			}
			return false;
		}
		else
		return true;
	}


    //-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<!-- InstanceBeginEditable name="Content" -->
<% 
CommonCodeList commonCode = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
        Collection leTypeValues = commonCode.getCommonCodeValues();
        Collection leTypeLabels = commonCode.getCommonCodeLabels();
        if (leTypeValues == null) {
            leTypeValues = new ArrayList();
        }
        if (leTypeLabels == null) {
            leTypeLabels = new ArrayList();
        }
        
        pageContext.setAttribute("leTypeValues", leTypeValues);
        pageContext.setAttribute("leTypeLabels", leTypeLabels);
            
%>

<html:form action="custodian_search.do?event=list">
  
   <input type="hidden" value="" name="gobutton">
    <input type="hidden" name="event" value="customer_list">
    <%
        String source = request.getParameter("source");
        if (source == null) {
            source = "";
        }
    %>
    <input type="hidden" name="source" value="<%= source %>"/>
    <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
        <tr>
            <td>
                 <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="odd">
                            <td class="fieldname"><bean:message key="label.customer.name"/></td>
                            <td><html:text property="customerName" maxlength="40" onkeypress="return handleEnter(this, window.event||event, 1);" /> 
								<html:errors property="cusName"/>
							</td>
                            <td><input onclick="submitPage(1)" name="AddNew1" type="button" id="AddNew1" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>                  
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.customer.id.source"/></td>
                            <td>
                                <html:select property="leIDType">
                                    <option value="">Please Select</option>
                                    <html:options name="leTypeValues" labelName="leTypeLabels"/>
                                </html:select>
                                <html:errors property="leIDType"/>
                            </td>
                            <td rowspan="2">
                                <input onclick="submitPage(2)" name="AddNew2" type="button" id="AddNew2" value="Go"
                                       class="btnNormal"   style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname"><bean:message key="label.customer.id"/></td>
                            <td>
                                <html:text property="legalID" maxlength="20" onkeypress="return handleEnter(this, window.event||event, 2);" />
                                <html:errors property="legalID"/>
                            </td>
                        </tr>
                         <tr class="odd">
                            <td class="fieldname"><bean:message key="label.col.owner.id.no"/></td>
                            <td>
                                <html:text property="idNO" maxlength="100" onkeypress="return handleEnter(this, window.event||event, 3);" /> <html:errors property="idNO"/>
                            </td>
                            <td><input onclick="submitPage(3)" name="AddNew3" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="odd">
                           <td class="fieldname"><bean:message key="label.document.custodian.barcode"/></td>
                           <td>
                              <html:text property="docBarCode" maxlength="20" onkeypress="return handleEnter(this, window.event||event, 4);" /> <html:errors property="docBarCode"/>
                           </td>
                          <td><input onclick="submitPage(4)" name="AddNew4" type="button" id="AddNew4" value="Go"
                                               class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                             </td>
                        </tr>
                        <tr class="">
                          <td class="" colspan="3"><html:errors property="searchError"/></td>
                        </tr>
                                </tbody>
                            </table>
                        </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>

    </table>
</html:form>
</body>
</html>

