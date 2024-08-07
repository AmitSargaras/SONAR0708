<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.custrelationship.customer.CRCustSearchForm,
                 com.integrosys.cms.ui.common.CommonCodeList" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%@ page import="com.integrosys.cms.app.cci.bus.CounterpartySearchCriteria" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ page import="com.integrosys.cms.ui.custrelationship.customer.CRCustSearchCommand"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<jsp:include page="printTransValue.jsp"/>

<%
	String customerName = (String)request.getAttribute("customerName");
  
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch (NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
    // System.out.println("value of records_per_page"+records_per_page);
%>

<%
    CRCustSearchForm aForm = (CRCustSearchForm) request.getAttribute("CRCustSearchForm");
    List v = (List) aForm.getSearchResult();

    if (v != null) {
        pageContext.setAttribute("counterpartyList", v);
        System.out.println("v.size() = " + v.size());
    }

	// Retrieve Search Criteria from Global Scope
    CounterpartySearchCriteria search = (CounterpartySearchCriteria) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CRCustSearchCommand.EXTERNAL_SEARCH_CRITERIA_OBJ);
	CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);

    if (search != null) {
        aForm.setStartIndex(search.getStartIndex());
        customerName = search.getCustomerName();
    }
    
    int rowIdx = 0;
    int sno = 0;
    int count = 1;
    sno = aForm.getStartIndex();
    int numItem = aForm.getNumItems();
    
    String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	  long roleType = Long.parseLong(teamTypeMemID);

%>

<%@page import="com.integrosys.base.techinfra.util.AccessorUtil"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="Javascript" type="text/javascript">
<!--

	// TODO: To be replace by loca form submit action
	function submitSearch() {
		location.href ="<%=request.getContextPath()+"/CRCustomerSearch.do?event=search_customer&customerSeach=true"%>";
	}

	function JumpOnSelectactive(selectObj, custID, cifNo, cifSource, cifName)
	{

  		var selectIndex = selectObj.selectedIndex;
  		
    	if (selectObj.options[selectIndex].value == "viewcustdetails")
		  {
        	location.href = "CRCustomerSearch.do?event=view_cust_details&cifNo=" +cifNo+"&sub_profile_id=" +custID+
							"&cifSource=" +cifSource+"&cifName="+escape(cifName);
   		}
   		else if(selectObj.options[selectIndex].value == "viewexposures")
   		{
	   		location.href = "CustExposure.do?event=view_cust_exposure&cifNo=" +cifNo+"&sub_profile_id=" +custID+
							"&cifSource=" +cifSource+"&cifName="+escape(cifName);
   		}

     }
    //-->
</script>
</head>

<body >
<table width="100%" align="center" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td valign="top">
       <html:form action="CRCustomerSearch.do?event=search_customer">

            <html:hidden property="customerSeach" value="true"/>
            <html:hidden property="startIndex"/>
            <html:hidden property="numItems"/>

            <html:hidden property="groupCCINo"/>
            
            <html:hidden property="customerName"/>
            
            <!--
            <html:hidden property="leIDType"/>
            <html:hidden property="legalID"/>
            <html:hidden property="idNO"/>
            -->

            <html:hidden property="legalName"/>

            <input type="hidden" name="indicator">
            <input type="hidden" name="all">

            <table width="60%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" id="custsearch">
                <tr>
                    <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <tr>
                                <td valign="bottom"><h3><bean:message key="label.cci.search.result"/></h3></td>
                            </tr>
                        </table>
                        <table width="100%" class="tblinfo" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                                <tr>
                                    <td width="3%"><bean:message key="label.global.sno"/></td>
                                    <td width="20%"><bean:message key="label.cci.cciNo"/></td>
									                  <td width="20%"><bean:message key="label.customer.name"/></td>
                                    <td width="5%"><bean:message key="label.customer.id.source"/></td>
                                    <td width="7%"><bean:message key="label.security.pledgor.le.id"/></td>
                                    <td width="15%"><bean:message key="label.col.owner.id.no"/></td>
                                    <td width="5%"><bean:message key="label.global.action"/></td>
                                </tr>

                            </thead>
                            <tbody>
                                <% if (v != null&&v.size()>0) {%>
                                <logic:present name="counterpartyList">
                                    <logic:iterate id="OB" name="counterpartyList" type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
                                        <%
                                            String strSubprofileID = OB.getSubProfileID() + "";
                                             sno++;
                                             count++;
											 
											 String sourceId = OB.getSourceID();
											 String sourceDesc = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td style="text-align:center" class="index"><%=sno%></td>
                                            <td><integro:empty-if-null value="<%=OB.getGroupCCINo()%>"/></td>
											<td><integro:empty-if-null value="<%=OB.getCustomerName()%>"/></td>
                                            <td><integro:empty-if-null value="<%=sourceDesc%>"/> </td>
                                            <td><integro:empty-if-null value="<%=OB.getLmpLeID()%>"/>&nbsp; </td>
                                            <td><integro:empty-if-null value="<%=OB.getIdNo()%>"/>&nbsp; </td>
                                            <% String legalName = OB.getLegalName().replaceAll("'","");%>
                                            <td><select name="actionPerformed"  onChange="javascript:JumpOnSelectactive(this, '<%=OB.getSubProfileID()%>' , '<%=OB.getLmpLeID()%>' , '<%=OB.getSourceID()%>', '<%=legalName%>') ">
						                      		<option selected="selected" ><bean:message key="label.please.select"/></option>
						                      		<% if (!(roleType == ICMSConstant.TEAM_TYPE_GEMS_MAKER || roleType == ICMSConstant.TEAM_TYPE_GEMS_AM_CHECKER
						                      		        || roleType == ICMSConstant.TEAM_TYPE_GEMS_CHECKER)) { %>
						                      		<option value="viewcustdetails"><bean:message key="title.customer.process"/></option>
						                      		<% } %>
						                      		<option value="viewexposures"><bean:message key="label.view.exposure"/></option>
						                  		</select>
                                           </td>
                                        </tr>
                                    </logic:iterate>
                                </logic:present>
                                <%} else {%>
                                <tr>
                                    <td colspan="7" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                                </tr>
                                <%}%>
                            </tbody>

                        </table>
                        <tr height="40">
                            <td align="center">
                                <a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()"
                                   onmouseover="MM_swapImage('Image2','','img/cancel1.gif',1)">
                                    <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
                                <br>
                                <html:errors property="errDuplicate"/>
                            </td>

                </tr>
            </table>
        </html:form>
    </td>
</tr>
<!-- End Content -->

<!-- General Purpose Bar -->

<% 
	String alphaURL="/CRCustomerSearch.do?event=search_customer";
%>


<tr>
    <td height="25">
  
       <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="580" valign="middle">
                        <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        <td valign="middle" >
                         <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%="CRCustomerSearch.do?event=search_customer&customerSeach=true&customerName=" + customerName + "&startIndex="%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                      </tr>
               </table>
       
    </td>
</tr>



</table>

 <script language="JavaScript">
  <!--
        function submitForm(){
          var cstId  = <%=rowIdx%>;
            if (cstId ==0){
                alert("Please select one record")
            } else{
                document.forms[0].action ="CRCustomerSearch.do?event=add";
                document.forms[0].submit();
            }
        }

        function cancelForm(){
            document.forms[0].action ="CRCustomerSearch.do?event=prepare";
            document.forms[0].submit();
        }

        function gotoPage() {
            parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
        }

        function goNextPrev(ind) {
            document.forms["CRCustSearchForm"].customerName.value='';
            document.forms["CRCustSearchForm"].startIndex.value=ind;
            document.forms["CRCustSearchForm"].numItems.value=<%=numItem%>;
        }

        function goPageIndex(ind) {
            document.forms["CRCustSearchForm"].startIndex.value=ind;
            document.forms["CRCustSearchForm"].numItems.value=<%=numItem%>;
            document.forms["CRCustSearchForm"].submit();
        }

        function goAlphaIndex(ind) {
            document.forms["CRCustSearchForm"].customerName.value=ind;
            if (ind == ''){
                document.forms["CRCustSearchForm"].all.value = 'Y';
            }
            document.forms[0].indicator.value='*';
            document.forms["CRCustSearchForm"].startIndex.value=0;
            document.forms["CRCustSearchForm"].submit();
        }
        function goPage(pageNo){
            document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
            document.forms[0].numItems.value = <%=numItem%>;
        }
     -->
    </script>

</body>

</html>



