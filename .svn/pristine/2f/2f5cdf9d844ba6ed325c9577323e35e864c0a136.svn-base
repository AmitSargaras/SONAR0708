<%@ page import="com.integrosys.base.businfra.search.SearchResult,
				 com.integrosys.cms.app.transaction.OBPendingCasesSearchResult,
				 com.integrosys.cms.app.transaction.CMSTrxSearchCriteria,
				 com.integrosys.base.uiinfra.tag.PageIndex,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant" %>				 

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<script type="text/javascript" src="js/ajaxDropdown.js"></script>
<%
	SearchResult result = (SearchResult)request.getAttribute("searchResult");
	
	if (result != null && result.getNItems() > 0)
		pageContext.setAttribute("pendingList",result.getResultList());		
    
	CMSTrxSearchCriteria globalCriteria = (CMSTrxSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CMSTRXSEARCHCRITERIA_OBJ);
	
    String type = "";
    String task = globalCriteria.getPendingTask();
    if (ICMSConstant.EXISTING_CASES.equals(task))
    	type = "Existing";
    else
    	type = "New";
    	
    int sno = 0;
    if (globalCriteria != null)
    	sno = globalCriteria.getStartIndex();
    
    int nItems = 0;
    int startIndex = 0;
    
    if (result != null) {
    	nItems = result.getNItems();
    	startIndex = result.getStartIndex();
	}
%>
<script language="JavaScript" type="text/JavaScript">
<!--
function submitPage(num) {
	if (num == 3) {
			
		if (<%=nItems%> > 0) {
		
			var formObj = document.forms[0];
		    var k = 0;
		    var temp = "";
		    for (var i = 0; i < formObj.elements.length; i++) {
		        var type = formObj.elements[i].type;
		        var name = formObj.elements[i].name;
		        if (type == 'checkbox' && name == 'selectedItems') {
		            k++;
		        }
		    }
		    
		    j = 0;
		    if (k > 1) {
		        for (var i = 0; i < formObj.elements.length; i++) {
		            var type = formObj.elements[i].type;
		            var name = formObj.elements[i].name;
		            if (type == 'checkbox' && name == 'selectedItems') {
		                var obj = formObj.elements[i];
		                if (obj.checked) {
		                    temp = temp + "," + formObj.selectedItems[j].value;
		                }
		                j++;
		            }
		        }
		    }
		    
		    //alert(temp);
		    
		    if (temp == "") {
		        alert("There is no record being selected.");
		        return;
		    }
	    			
			decision = confirm("Do you really want to transfer the selected items?");
			if (decision == true) {
				document.forms[0].event.value="reassign_pending_cases";
			} else {
				return;
			}
		} else {
			alert("There is no cases at the moment.");
			return;
		}		
	}
	document.forms[0].submit();

}

function refreshFilterbyList(dropdown) {
    var curSel = "";
        for(i=0; i < dropdown.options.length; i++)   {
            if (dropdown.options[i].selected == true) {
                curSel = dropdown.options[i].value;
            }
        }
    var dep = 'filterByValue';
    var url = 'ToDo.do?event=refresh_pending_cases&filterByType='+curSel;
    sendLoadDropdownReq(dep, url);	
}
-->
</script>
<html:form action="ToDo.do">
<input type="hidden" name="startIndex" value="0"/>
<input type="hidden" name="event" value="pending_cases" />
<input type="hidden" name="task" value="<%=task%>"%>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
	<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
	  	<thead>
	  		<tr>
	  		<td  valign="top" colspan="2"><h3><%=type%> Pending Cases (Incomplete Security Details)</h3></td>
	  		</tr>
	  		<tr><td colspan="2"><hr></td></tr>
	  		<tr>
	  		<td width="30%">
	  			<h3>Sort By:
	  			<html:select property="sortBy">
	  			<option value=""><bean:message key="label.please.select"/></option>
	  			<html:options name="sortByCode" labelName="sortByValues" />
	  			</html:select>
	  			&nbsp;
	  			<input type="button" value="Sort By" onclick="submitPage(1)"/>
	  			</h3>
	  		</td>
	  		<td align="right">
	  			<h3>Filter By:
	  			<html:select property="filterByType" onchange="javascript:refreshFilterbyList(this)">
	  			<option value=""><bean:message key="label.please.select"/></option>
	  			<html:options name="filterByTypeCode" labelName="filterByTypeValues" />
	  			</html:select>
	  			&nbsp;
	  			<html:select property="filterByValue">
	  			<option value=""><bean:message key="label.please.select"/></option>
	  			<html:options collection="filterByValueList" property="value" labelProperty="label"/>
	  			</html:select>
	  			&nbsp;
	  			<input type="button" value="Filter By" onclick="submitPage(1)"/>
	  			<html:errors property="filterByValue"/>
	  			</h3>
	  		</td>
	  		</tr>
	  	</thead>
	  	<tbody>
	    	<tr>
	        <td colspan="2" valign="top">
	          	<table width="100%" class="tblInfo" border="0" align="center" cellpadding="0" cellspacing="0">
					<thead>
						<tr>
	                	<td width="3%"><bean:message key="label.global.sn"/></td>
						<td width="2%"><bean:message key="label.todo.pending.select"/></td>
	                  	<td width="16%"><bean:message key="label.todo.pending.customer.name"/></td>
	                  	<td width="8%"><bean:message key="label.todo.pending.LEID"/></td>
	                  	<td width="10%"><bean:message key="label.todo.pending.cms.segment.code"/></td>
	                  	<td width="12%"><bean:message key="label.todo.pending.cms.segment.desc"/></td>
	                  	<td width="8%"><bean:message key="label.todo.pending.bca.ref"/></td>
	                  	<td width="8%"><bean:message key="label.todo.pending.source"/></td>
	                  	<td width="6%"><bean:message key="label.todo.pending.org.code"/></td>
					  	<td width="11%"><bean:message key="label.todo.pending.org.desc"/></td>
	                  	<td width="11%"><bean:message key="label.global.action"/></td>				
	                  	</tr>
					</thead>
					<tbody>
						<logic:present name="pendingList">
							<logic:iterate id="sr" indexId="srCount" name="pendingList" type="com.integrosys.cms.app.transaction.OBPendingCasesSearchResult">
							<tr class="<%=(srCount.intValue() + 1)%2==0?"even":"odd"%>">
								<td class="index"><%= sno + srCount.intValue() + 1 %></td>
								<td><html:multibox property="selectedItems" disabled="<%=(sr.getTrxStatus().equals(ICMSConstant.STATE_ACTIVE) || sr.getTrxStatus().equals(ICMSConstant.STATE_NEW))?false:true%>" value="<%=String.valueOf(sr.getLimitProfileID())%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getCustomerName()%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getLeID()%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getCmsSegmentCode()%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getCmsSegmentValue()%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getBcaRefNum()%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getSourceName()%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getOrgCode()%>"/></td>
								<td><integro:empty-if-null value="<%=sr.getOrgName()%>"/></td>
								<td><a href="CustomerProcess.do?event=viewsecurities&customerID=<%=sr.getCustomerID()%>&limitProfileID=<%=sr.getLimitProfileID()%>&startIndex=0&frompage=pending_cases"%>Process</a>
							</tr>
							</logic:iterate>
						</logic:present>
						<logic:notPresent name="pendingList">
							<tr class="even">
								<td colspan="11">
									<bean:message key="label.global.not.found"/>
								</td>
							</tr>
						</logic:notPresent>
						<tr>
						</tr>
					</tbody>
				</table>
			<td>
		</tr>
		<tr><td><br></td></tr>
		<tr>
			<td colspan="2" align="center"><input type="button" value="Reassign To" onclick="submitPage(3)"> &nbsp; 
		  	<html:select property="reassignTo">
	  			<option value=""><bean:message key="label.please.select"/></option>
  				<html:options collection="cmsSegmentList" property="value" labelProperty="label"/>
			</html:select>
			<html:errors property="reassignTo"/>
		  	</td>
		</tr>		
		</tbody>
	</table>
	</td>
	</tr>
	<tr valign="bottom">
		<td colspan="2" height="25">		
			<table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center" valign="bottom">
			<tr>
			<%
				String pageIndexUrl = "ToDo.do?event=pending_cases&task="+task;
				if (globalCriteria != null) {
					if (globalCriteria.getSortBy() != null)
						pageIndexUrl += "&sortBy="+globalCriteria.getSortBy();
					if (globalCriteria.getFilterByType() != null)
						pageIndexUrl += "&filterByType="+globalCriteria.getFilterByType();
					if (globalCriteria.getFilterByValue() != null)
						pageIndexUrl += "&filterByValue="+globalCriteria.getFilterByValue();
				}
				pageIndexUrl += "&startIndex=";
			%>			
				<td valign="middle">   
					<integro:pageindex pageIndex='<%=new PageIndex(startIndex, 10, nItems)%>'
					url='<%=pageIndexUrl%>' submitFlag='<%=new Boolean(false)%>'/>             
				</td>		
			</tr>
			</table>
		</td>
	</tr>
</table>	

</html:form>