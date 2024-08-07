<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.user.MaintainUserForm,
                 java.util.Vector"%>

<%
List branchList = (List)session.getAttribute("com.integrosys.cms.ui.user.MaintainUserAction.branchList");
pageContext.setAttribute("branchList",branchList);
%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>



<%@page import="java.util.List"%><script>
    <!--
    function submitPage(buttonNO) {
		if(buttonNO==1){
			document.forms[0].searchBy.value="loginId";
		}else if(buttonNO==2){
			document.forms[0].searchBy.value="name";
		}else if(buttonNO==3){
			document.forms[0].searchBy.value="branch";
		}else if(buttonNO==4){
			var value=document.getElementById("statusDrop").value;
			document.forms[0].searchBy.value="status";
			if(value=='A'){
				document.forms[0].status.value="A";
			}
			if(value=='I'){
				
				document.forms[0].status.value="I";
				
			}
			if(value=='T'){
				document.forms[0].status.value="T";
			}
			
		}	
		//alert("ss 3"+document.forms[0].status.value);
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

<html:form action="user.do">
<html:hidden property="event" value="maker_search_user"/>
<html:hidden property="searchBy" value=""/>
<html:hidden property="status" value=""/>
	<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" >
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td valign="top">
                    <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
                      <thead>
                        <tr>
                            <td colspan="3"><bean:message key="label.global.enterSearchCriteria"/></td>
                        </tr>
                      </thead>
                     <tbody>
                        <tr class="odd">
                            <td class="fieldname">Login ID :</td>
                            <td>
								<html:text property="loginId" maxlength="40" onkeypress="return handleEnter(this, window.event||event, 1);"/>
								<html:errors property="loginId"/>
							</td>
                            <td><input onclick="submitPage(1)" name="SeachByID" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                        <tr class="even">
                            <td class="fieldname">Full Name :</td>
                            <td>
								<html:text property="name" maxlength="40" onkeypress="return handleEnter(this, window.event||event, 2);"/> 
								<html:errors property="name"/>
							</td>
                            <td><input onclick="submitPage(2)" name="SeachByName" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                         <tr class="odd">
                            <td class="fieldname">Branch:</td>
                            <td>
								<html:select property="branchCode" >
											<option value="">Please Select</option>
											<html:options collection="branchList" labelProperty="label" property="value" />
											</html:select> </br> 
								<html:errors property="branchCode"/>
							</td>
                            <td><input onclick="submitPage(3)" name="SeachByName" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                         <tr class="even">
                            <td class="fieldname" style="">Status :</td>
                            <td>
								<select id="statusDrop">
								<option value="0">Please Select</option>
								<option value="A">Enabled</option>
								<option value="I">Disabled</option>
								<option value="T">Terminated</option>
								 </select>
								<html:errors property="status"/>
							</td>
                            <td><input onclick="submitPage(4)" name="SeachByName" type="button" id="AddNew3" value="Go"
                                       class="btnNormal" style="margin-right:5px;margin-left:10;width:50px"/>
                            </td>
                        </tr>
                     </tbody>
                    </table>
				</td>
         </tr>
	</table>
</html:form>