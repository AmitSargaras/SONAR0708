<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 java.util.List,
				 java.util.Collection,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
				 com.integrosys.cms.app.creditriskparam.trx.internallimit.IInternalLimitParameterTrxValue,
				 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLimitListForm,
				 com.integrosys.cms.ui.creditriskparam.internallimit.list.InternalLimitListAction"%>
				 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:$
*
* credit_risk_param_unittrust_list.jsp
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<script language="JavaScript" type="text/JavaScript">
<!--
	function gotopage(aLocation) {
		window.location = aLocation;
	}

	function submitForm(event) {
		//"<%=InternalLimitListAction.EVENT_SUBMIT%>"
	    document.forms[0].event.value = event;
	    document.forms[0].submit();
	}

	function activate(id,checkBoxObj){
		if (checkBoxObj.checked){
			document.getElementById(id).value = "D" ; 
		}else{
			document.getElementById( id ).value = "A" ; 
		}            
	}
	
	function goPageIndex(targetOffset){
		//<%--document.forms[0].event.value = '<%=pagenationEvent%>';--%>
		document.forms[0].current_offset.value = targetOffset ;
		document.forms[0].submit();
	}                      
//-->
</script>

<%    
	try{
	InternalLimitListForm aForm = (InternalLimitListForm)request.getAttribute("InternalLimitListForm");	
    List theILParamFullList = (List)session.getAttribute("com.integrosys.cms.ui.creditriskparam.internallimit.InternalLimitAction.theILParamFullList");
	int totalNumber = 0;
	if(theILParamFullList!=null){
		totalNumber = theILParamFullList.size();
	}

    int offset = ((Integer)session.getAttribute("com.integrosys.cms.ui.creditriskparam.internallimit.InternalLimitAction.offset")).intValue();
    IInternalLimitParameterTrxValue theILParamTrxValue = (IInternalLimitParameterTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.internallimit.InternalLimitAction.theILParamTrxValue");
%>

<html:form action="InternalLimitList.do">
	<input type="hidden" name="event"/>
	<input type="hidden" name="current_offset" value="<%=offset%>"/>
<%--p class="required"><font color="#0000FF">*</font> <bean:message key="title.internallimit.list"/></p--%>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">	
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
		<thead>
			<tr>
				<td height="34" > <h3><bean:message key="title.internallimit.list"/></h3></td>
				<td align="right">
					<input type="button" name="Submit3" value="Add New" class="btnNormal" onclick="submitForm('<%=InternalLimitListAction.ADD_ITEM%>')" />&nbsp;
					<input type="button" name="Submit3" value="Remove" class="btnNormal" onclick="submitForm('<%=InternalLimitListAction.EVENT_DELETE%>')" />&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr /> </td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
						<thead>
							<tr>
								<td width="3%" rowspan="2" ><bean:message key="label.global.sno"/></td>
								<td width="25%" rowspan="2" style="{text-align: left}"><bean:message key="label.group.description"/></td>
					            <td width="30%" rowspan="2" style="{text-align: center}"><bean:message key="label.crp.internal.limit.percentage"/> </td>
								<td width="15%" rowspan="2" style="{text-align: center}"><bean:message key="label.currency"/></td>
								<td width="20%" rowspan="2" style="{text-align: center}"><bean:message key="label.crp.capital.fund.amt"/></td>
								<td width="7%" rowspan="2" style="{text-align: center}"><bean:message key="label.remove"/></td>
							</tr>
						</thead>
						<tbody>
					<%
						if (totalNumber <= 0){
					%>
			                <tr class="odd">
			                  <td colspan="9"><bean:message key="label.global.not.found"/></td>
			                </tr>
		            <%
						}else{
							int size = 0;
							if(aForm!=null&&aForm.getDescription()!=null){
									size = aForm.getDescription().length;
							}
							
							CurrencyList currencyList = CurrencyList.getInstance();
							Collection labels = currencyList.getCurrencyLabels();
							Collection values = currencyList.getCurrencyValues();
							for(int index=0;index<size;index++){
								String cssClass = index%2==0?"even":"odd" ;

					%>
							<tr class="<%=cssClass%>">
								<td class="index" valign="top" align="center"><%=index+1%></td>
								<td style="{text-align: left}">
									<integro:empty-if-null value="<%=aForm.getDescription()[index]%>"/> 
									<input type="hidden" name="description" value="<integro:empty-if-null value="<%=aForm.getDescription()[index]%>"/>"/>                  									
								</td>
								<td style="{text-align: center}">
									<input type="text" name="internalLimitPercentage" value="<integro:empty-if-null value="<%=aForm.getInternalLimitPercentage()[index]%>"/>" size="15" />                  
									&nbsp;%&nbsp;
									<html:errors property="internalLimitPercentage.<%=String.valueOf(index)%>"/%>
								</td>
								<td class="amount" style="{text-align: center}">
									<select id="currency" name="currency" >                                
										<option value="" >
											Please Select
										</option>                                
										<%
											Iterator currencyLabels =  labels.iterator () ;
											Iterator currencyValues =  values.iterator () ;
											
											String currency = aForm.getCurrency()[index] ;
											while ( currencyLabels.hasNext () && currencyValues.hasNext () ){
												String value = String.valueOf ( currencyValues.next()) ;                                
										%>
										<option value="<%= value %>" <%= currency == null || currency.equals ( "" ) ? "" : ( value.equalsIgnoreCase ( currency ) ? "selected=\"selected\""  : "" ) %> >
											<%=currencyLabels.next ()%>
										</option>
										<%
											}
										%>
									</select>	
					                <html:errors property="currency.<%=String.valueOf(index)%>"/%>
								</td>
					            <td class="amount" style="{text-align: center}">
									<input type="text" name="capitalFundAmount" value="<integro:empty-if-null value="<%=aForm.getCapitalFundAmount()[index]%>"/>" size="15" />                  
									<html:errors property="capitalFundAmount.<%=String.valueOf(index)%>"/%>
								</td>
					            <td style="{text-align: center}">
									<%
										String ckValue = aForm.getStatus()[index];
										String checkedStr = "D".equals(ckValue)?"checked":"";
										String idStr = "status_"+index;
									%>
									<input name="activeTemp" type="checkbox" <%=checkedStr%> onclick="activate('<%=idStr%>',this)" />
									<input name="status" type="hidden" id="<%=idStr%>"  value="<%=ckValue%>" />
								</td>
							</tr>
					<%
							}
						}
					%>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
<br><br>
<%
	if (theILParamTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) {
	    String lastActionBy = theILParamTrxValue.getUserInfo();
	    String lastRemarksMade = theILParamTrxValue.getRemarks();
	    if (lastRemarksMade == null) {
	        lastRemarksMade = "";
	    }
%>
	<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		<tbody>
			<tr>
				<td class="fieldname"><bean:message key="label.remarks"/></td>
				<td class="odd"><html:textarea property="remarks" style="width:90%"/>
					<html:errors property="remarks"/></td>
			</tr>
			<tr>
				<td class="fieldname"><bean:message key="label.last.action.by"/></td>
				<td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
			</tr>
			<tr class="odd">
				<td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
				<td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
			</tr>
		</tbody>
	</table>
<%
	}
%>

<%
  if (totalNumber > 0){
%>
    <table width="180"  border="0" align="center" cellpadding="0" cellspacing="0">

		<tr>
	        <td width="75" valign="baseline" align="center">
		        <a href="#" onclick="submitForm('<%=InternalLimitListAction.EVENT_SUBMIT%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3" />
		        </a>
			</td>
	        <td width="75" valign="baseline" align="center">
	        <%
	            if (theILParamTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
	                theILParamTrxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
	        %>
	        <a href="ToDo.do" align="center" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image331" /></a>
	        <%
	            } else {
	        %>
	        <a href="#" align="center" onclick="submitForm('<%=InternalLimitListAction.EVENT_SAVE%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3311"  border="0" id="Image331" /></a>
	        <% } %>
	        </td>
        </tr>

        <tr>
	        <td valign="baseline" align="center">&nbsp;</td>
	        <td valign="baseline" align="center">&nbsp;</td>
		</tr>
    </table>
<%
  }
%>

<table>
	<tr>
		<td height="25">
			<table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
				<tr>
					<td valign="middle">
					<integro:pageindex pageIndex="<%=new PageIndex(offset,10,totalNumber)%>" url="InternalLimitList.do" submitFlag="true"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

   </td>
</tr>
</table>
</html:form>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>