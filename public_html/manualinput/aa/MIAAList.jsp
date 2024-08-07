<%@ page import="com.integrosys.cms.ui.customer.CustomerSearchForm,
         com.integrosys.base.uiinfra.tag.PageIndex,
         java.util.*,
         com.integrosys.base.uiinfra.common.ICommonEventConstant,
         com.integrosys.cms.ui.common.constant.IGlobalConstant,
         com.integrosys.component.bizstructure.app.bus.ITeam,
         com.integrosys.cms.app.common.constant.ICMSConstant,
         com.integrosys.cms.ui.common.CountryList,
		 com.integrosys.cms.ui.manualinput.aa.AAUIHelper,
		 com.integrosys.base.uiinfra.exception.AccessDeniedException,
         com.integrosys.cms.ui.common.AgreementTypeList"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
boolean isUserCpcMaker = false;       
if(Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_SSC_MAKER
	||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
	||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
	||Long.parseLong(teamTypeMemID)==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
	isUserCpcMaker = true;
} else {
	isUserCpcMaker=false;
}


%>

<%@page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%><html>
  <head>
    
    
    <script language="JavaScript">
    <!--
      function selectAction(val, aaId, custId, agreementType)
      {
             if (val == "ADD_LIMIT")
             {
                document.location.href = "MILimit.do?event=prepare_create&limitProfileID=" + aaId + "&isCreate=Y&agreementType="+agreementType + "&customerID=" +custId; 
             }
             else if (val == "EDIT_LIMIT")
             {
                document.location.href = "MILimitList.do?event=list_limit&limitProfileID=" + aaId + "&source=manualinput" + "&customerID=" +custId;
             }
             else if (val == "EDIT_AA")
             {
                document.location.href = "MIAADetail.do?event=view&aaID=" + aaId + "&customerID=" +custId;
             }
             else if (val == "ADD_AA")
             {
                document.location.href = "MIAADetail.do?event=maker_add_aadetail&customerID=" +custId + "&indexChange=0";
             }
             else if (val == "DELETE_AA")
             {
                document.location.href = "MIAADetail.do?event=maker_delete_aadetail&aaID=" + aaId + "&customerID=" +custId;
             }    
      }    
      
      function goAlphaIndex(ind) {
         document.forms[0].customerName.value=ind;
       if (ind == '')
       {
        document.forms[0].all.value = 'Y';
       }
         document.forms[0].indicator.value='*';
         document.forms[0].startIndex.value=0;
         document.forms[0].submit();
      }
    -->
    </script>
  </head>
  <body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
    <table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
      <tr>
        <td valign="top">
        <%
          ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
          long teamTypeID = userTeam.getTeamType().getTeamTypeID();
          boolean isMR = false;    
          if (teamTypeID == ICMSConstant.TEAM_TYPE_MR ) {
            isMR = true;
          }
          List optionList = (List)(request.getAttribute("optionList"));
          CustomerSearchForm aForm = (CustomerSearchForm)(request.getAttribute("CustomerSearchForm"));
          CountryList cList = CountryList.getInstance();
          AgreementTypeList aList = AgreementTypeList.getInstance();
          String source = request.getParameter("source");
          if (source == null)
          {
            source = "";
          }
          int startIndex = aForm.getStartIndex();
          int records_per_page = 10;
		  AAUIHelper aaHelper = new AAUIHelper();
        %>
        <html:form action="MICustomerSearch.do?event=list_customer">
        <html:hidden property="startIndex" />
        <input type="hidden" name="customerName" >
        <input type="hidden" name="indicator" >
        <input type="hidden" name="all">
        <input type="hidden" name="source" value="<%= source %>"/>
        <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
          <tr>
            <td>
        <%--      <%= aForm.getNumItems() %> Record(s) Found --%>
            </td>
          </tr>
          <tr>
            <td>
              <table class="tblinfo" style="margin-top:0" border="0" width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
                <thead>
                  <tr>
                    <td width="4%">S/N</td>
                    <td width="18%">Party Name</td>
                    <td width="11%">Party ID</td>
                    <td width="13%">CAM No.</td>
                    <td width="13%">CAM Type</td>                   
                    <td width="13%">Date Approved</td>
                    <td width="15%">Action</td>         
                  </tr>
                </thead>
                <tbody>
                  <logic:notEmpty name="CustomerSearchForm" property="searchResult" scope="request">
                  <logic:iterate id="curItem" indexId="curInd" name="CustomerSearchForm" property="searchResult" type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult">
                  <% 
                    boolean isDeleted = false;
                    String rowClass = "";
                    String agreementType = "";
                    startIndex++;
                    if (curInd.intValue() % 2 == 0)
                    {
                      rowClass = "even";    
                    }
                    else
                    {
                      rowClass = "odd";    
                    }
                    boolean hasAA = false;
                    if( curItem.getInstructionID() != ICMSConstant.LONG_INVALID_VALUE &&
                        curItem.getInstructionID() != 0 )
                    {
                      hasAA = true;
                    }
                    boolean canEdit = false;
                    if( curItem.getCMSCreateInd() )
                    {
                      canEdit = true;
                    }
					boolean canAccess = true;
					try {
						aaHelper.canAccess( userTeam, curItem.getBcaOrigLocation() );
					} catch(AccessDeniedException adex)
					{
			            canAccess = false;
					}
                  %>
                    <tr class="<%=rowClass%>">
                      <td style="text-align:center" class="index"><%= startIndex %></td>
                      <td><integro:htmltext value="<%= curItem.getLegalName() %>"/>&nbsp;<br></td>
                      <td><integro:htmltext value="<%= curItem.getLegalReference() %>"/>&nbsp;</td>
                      <td><integro:empty-if-null value="<%= curItem.getInstructionRefNo() %>"/>&nbsp;</td>
                      <td><integro:empty-if-null value="<%= curItem.getCamType() %>"/>&nbsp;</td>
                      <td><integro:date object="<%= curItem.getInstructionApprovedDate() %>" />&nbsp;</td>
                      <% if( isMR ) {
                         agreementType = curItem.getAgreementType();%>
                      <td><integro:htmltext value="<%= aList.getAgreementTypeName( curItem.getAgreementType() ) %>"/>&nbsp;</td>
                      <% } %>
                      <td> 
                        <% if ("limit".equals(source)) { %>
                          <logic:iterate id="curOption" name="optionList" type="org.apache.struts.util.LabelValueBean">
                          <select name="actionPer" onchange="javascript:selectAction(this.value, '<%= curItem.getInstructionID() %>', '<%= String.valueOf( curItem.getSubProfileID() ) %>','<%=agreementType%>')" style="width:110"> 
                            <option selected="selected" >Please Select</option> 
                            <%if(isUserCpcMaker) { %>
                            <option value="ADD_LIMIT">ADD Facility</option>
                            <option value="<%=curOption.getValue()%>"><%=curOption.getLabel() %></option>
                            <%}else{%>
                             <option value="<%=curOption.getValue()%>">View</option>
                             <%}%>
                            </select>        
                          </logic:iterate>   
						<% } else { %>   
                          <select name="actionPerformed" onchange="javascript:selectAction(this.options[this.selectedIndex].value, '<%= curItem.getInstructionID() %>', '<%= String.valueOf( curItem.getSubProfileID() ) %>','<%=agreementType%>')"  style="width:110"> 
                            <option selected="selected" >Please Select</option>                        
                            <%if( hasAA ) { %>
	                            <%if(isUserCpcMaker) { %>
	                            <option value="EDIT_AA"><%=canEdit?"View / Edit CAM":"View CAM"%></option>
	                             <%}else{%>
	                             <option value="EDIT_AA"><%=canEdit?"View CAM":"View CAM"%></option>
	                             <%}%>
                            <% }else { %>
                            <%if(isUserCpcMaker) { %>
                            <option value="ADD_AA">Add New CAM</option>
                            <%}%>
                            <%} //if( !isDeleted && hasAA && curItem.getCanDeleteLmtProfile() && canAccess ) { %>
                            <!--<option value="DELETE_AA">Delete CAM</option>     -->
                           <%// } %>       
                          </select>  
                        <% } %>  
                      </td>    
                    </tr>    
                  </logic:iterate>         
                  </logic:notEmpty>
                  <%
                  if(aForm.getNumItems()==0){
                    %><tr class="odd">
                        <td colspan="7"><bean:message key="label.global.not.found"/></td>
                    </tr><%
                  }
                  %>
                </tbody>
              </table> 
            </td>
          </tr>
        </table>
        </html:form>
        </td>
      </tr>
      <tr>
        <td height="25">    
          <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="580" valign="middle">
                <integro:alphaindex url='<%="/MICustomerSearch.do?event=list"%>' submitFlag='<%=new Boolean(true)%>'/>
              </td>
              <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
              <td valign="middle" >
                <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(), records_per_page, aForm.getNumItems())%>' url='<%=request.getContextPath()+"/MICustomerSearch.do?event=list&source="+source+"&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
              </td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
  </body>
</html>