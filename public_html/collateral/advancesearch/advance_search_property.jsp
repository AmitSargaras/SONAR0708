<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<script language="javascript">
	function refreshDropDown(dropdown,dd_idx){
		var currVal = "";
		for(i=0; i <dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				currVal = dropdown.options[i].value;
			}
		}
		var dep = "";
		var url = "";
		if(dd_idx==0){
			dep ='locationDistrict';
			url = '/cms/CollateralSearch.do?event=refresh&locationState='+currVal;
		}else if(dd_idx==1){
			dep ='locationMukim';
			url = '/cms/CollateralSearch.do?event=refresh&locationState='+currVal;
		}
		sendLoadDropdownReq(dep, url);
	}
</script>

<table class="tblInput" width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>       
        <tr class="odd">
            <td width="40%" class="fieldname"><bean:message key="label.security.property.title.no"/></td>
            <td width="60%">
	        	<html:select property="titleNoPrefix">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.TITLE_NUMBER%>"/>
				</html:select>
				<html:text property="titleNo" maxlength="30"/>
            </td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.security.property.title.type"/> </td>
            <td><html:select property="titleTypeCD">
                <option value=""><bean:message key="label.please.select"/></option>
                <html:options name="titleTypeValue" labelName="titleTypeLabel"/>
            </html:select>&nbsp;
                <html:errors property="titleTypeCD"/></td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.security.property.state"/> </td>
            <td><html:select property="stateCD" onchange="getStateDistrictMukim('STATE_CODE');">
                <option value=""><bean:message key="label.please.select"/></option>
                <%--<html:options name="stateValue" labelName="stateLabel"/>--%>
               <html:options name="locationStateValue" labelName="locationStateLabel"/>
            </html:select>&nbsp;
                <html:errors property="stateCD"/>
            </td>
        </tr>
        <tr class="even">
            <td class="fieldname"><bean:message key="label.security.property.district"/> </td>
            <td><html:select property="districtCD" >
                <option value=""><bean:message key="label.please.select"/></option>
                <%--<html:options name="districtValue" labelName="districtLabel"/>--%>
                <html:options collection="locationDistrictColl" property="value" labelProperty="label"/>
            </html:select>&nbsp;
                <html:errors property="districtCD"/>
            </td>
        </tr>
        <tr class="odd">
            <td class="fieldname"><bean:message key="label.mukim"/></td>
            <td><html:select property="mukimCD">
                <option value=""><bean:message key="label.please.select"/></option>
                <%--<html:options name="mukimValue" labelName="mukimLabel"/>--%>
                <html:options collection="locationMukimColl" property="value" labelProperty="label"/>
            </html:select>&nbsp;
                <html:errors property="mukimCD"/>
            </td>
        </tr>
    </tbody>
</table>



