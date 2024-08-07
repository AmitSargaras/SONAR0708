<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.custrelationship.customer.CRCustSearchForm,
                 com.integrosys.cms.ui.common.AgreementTypeList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
				 com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.cms.app.cci.bus.CounterpartySearchCriteria" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<jsp:include page="printTransValue.jsp"/>

<%
org.apache.struts.action.ActionMapping am=(org.apache.struts.action.ActionMapping
)request.getAttribute("org.apache.struts.action.mapping.instance");

String actionPath=am.getPath();


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
    ITeam userTeam = (ITeam) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMR = false;
    boolean isSAC = false;
    DefaultLogger.debug(this, "Team Type ID = " + teamTypeID);

    if (teamTypeID == ICMSConstant.TEAM_TYPE_MR) {
        isMR = true;
    } else if (teamTypeID == ICMSConstant.TEAM_TYPE_SSC) {
        isSAC = true;
    }
    CRCustSearchForm aForm = (CRCustSearchForm) request.getAttribute("CRCustSearchForm");
    CountryList cList = CountryList.getInstance();
    AgreementTypeList aList = AgreementTypeList.getInstance();
    int nItems = 0;

    List v = (List) aForm.getSearchResult();

    if (v != null) {
        pageContext.setAttribute("counterpartyList", v);
        System.out.println("v.size() = " + v.size());
    }
    
	// Retrieve Search Criteria from Global Scope
    CounterpartySearchCriteria search = (CounterpartySearchCriteria) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+com.integrosys.cms.ui.custrelationship.customer.CRCustSearchCommand.EXTERNAL_SEARCH_CRITERIA_OBJ);
	CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);

	String dbkey="";

	if (search!=null)
		dbkey=StringUtils.defaultString(search.getDbKey());

//		dbkey="DB123";
//    SearchResult result = (SearchResult)session.getAttribute("com.integrosys.cms.ui.collateral.CollateralSearchAction.session_searchResult");



    if (search != null) {  	

        aForm.setStartIndex(search.getStartIndex());
        //nItems = aForm.getStartIndex();
    }
    int rowIdx = 0;
    int sno = 0;
    int count = 1;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0) {
        prev = aForm.getStartIndex() - records_per_page;
    }
    int numItem = aForm.getNumItems();
%>

<%
    int index = 0;
    String sii = (String) request.getAttribute("startIndex");
    if (sii != null) {
        index = Integer.parseInt(sii);
    }
    String alphaURL = "/CRCustomerSearch.do?event=cc_customer_list";
    
    String event = request.getParameter("event");
    String nextEvent = "";
    String cancelAction = "";
    
	if ("add_cus_sh_search".equals(event)  || "add_cus_sh_search_frame".equals(event) || "add_cust_search_sh_select".equals(event)) {
		nextEvent = "add_cust_search_sh_select";
		cancelAction = "CRShareHolder.do?event=cancel";
	} else {
		nextEvent = "add_customer_search_select";
		cancelAction = "CustRelationship.do?event=cancel";
	}
	
	if ("add_cust_search_sh_select".equals(event)) {
		event = "add_cus_sh_search_frame";
	}
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="Javascript" type="text/javascript">
<!--

	// TODO: To be replace by loca form submit action
	function submitSearch() {
		location.href ="<%=request.getContextPath()+actionPath+".do?event="+event+"&customerSeach=true"%>";
	}

	function JumpOnSelectactive(selectObj, customerID)
	{

  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "viewcustdetails")
		{
        	location.href = "CRCustomerSearch.do?event=view_cust_details&sub_profile_id=" +customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
   		}

     }
    //-->
</script>
</head>

<body >
<table width="100%" align="center" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td valign="top">
       <html:form action='<%="CRCustomerSearch.do?event=" + event%>'>

            <html:hidden property="customerSeach" value="true"/>
            <html:hidden property="startIndex"/>
            <html:hidden property="numItems"/>

            <html:hidden property="groupCCINo"/>
            <html:hidden property="leIDType"/>
            <html:hidden property="customerName"/>
            
            <!--
            <html:hidden property="legalID"/>
             -->

            <html:hidden property="idNO"/>

            <html:hidden property="legalName"/>

            <input type="hidden" name="indicator">
            <input type="hidden" name="all">
            <input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>">
            
           

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
                                    <td width="3%"><bean:message key="label.global.sn"/></td>
                                    <td width="20%"><bean:message key="label.global.name"/></td>
                                    <td width="5%"><bean:message key="label.customer.id.source"/></td>
                                    <td width="7%"><bean:message key="label.customer.id"/></td>
                                    <td width="15%"><bean:message key="label.col.owner.id.no"/></td>
                                    <td width="5%"><bean:message key="label.select"/></td>
                                </tr>

                            </thead>
                            <tbody>
                                <% if (v != null) {%>
                                <logic:present name="counterpartyList">
                                    <logic:iterate id="OB" name="counterpartyList" type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
                                        <%
                                            String strSubprofileID = OB.getSubProfileID() + "";
                                             sno++;
                                             count++;
											 
											 String sourceId = OB.getSourceID();
											 String sourceDesc = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);
											 
											 String tempCustkey = OB.getSubProfileID() + "";
											 
											 String errEntityID = "errEntityID" + tempCustkey;
											 
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td style="text-align:center" class="index"><%=sno%></td>
                                            <td><integro:empty-if-null value="<%=OB.getCustomerName()%>"/></td>
                                            <td><integro:empty-if-null value="<%=sourceDesc%>"/> </td>
                                            <td><integro:empty-if-null value="<%=OB.getLmpLeID()%>"/>&nbsp; </td>
                                            <td><integro:empty-if-null value="<%=OB.getIdNo()%>"/>&nbsp; </td>
                                            <td><html:checkbox property="selectCustomerID" value="<%=StringUtils.defaultString(String.valueOf(OB.getLmpLeID()))%>"/> 
                                            <html:errors property="<%=errEntityID%>"/>
                                            </td>
                                        </tr>
                                    </logic:iterate>
                                </logic:present>
                                <%} else {%>
                                <tr>
                                    <td colspan="6" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
                                </tr>
                                <%}%>
                            </tbody>
							<html:errors property="chkDeletes" />
                        </table>
                        <tr><td>&nbsp</td></tr>
                        <tr height="40">
                            <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                                                  onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                                <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>
                                
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

<tr>
    <td height="25">
  
       <table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="580" valign="middle">
                        <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        <td valign="middle" >
                         <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%="CRCustomerSearch.do?event="%>' submitFlag='<%=new Boolean(true)%>'/>
                        </td>
                      </tr>
               </table>
       
    </td>
</tr>

</table>

 <script language="JavaScript">
  <!--
        function submitForm(){
          var customerIDCB = document.CRCustSearchForm.selectCustomerID;
          var checked = false;
          if (<%=rowIdx%> > 1) {
	          for (i=0;i<customerIDCB.length;i++)
					if (customerIDCB[i].checked==true)
						checked = true;
		  } else if (<%=rowIdx%> == 1) {
		  	  if (customerIDCB.checked==true)
				checked = true;
		  }
		  
          var cstId  = <%=rowIdx%>;
            if (cstId ==0){
                alert("No record is avaiable.");
            }else if (checked == false) {
            	alert("Please select one record");
            } else{
                document.forms[0].action ="CRCustomerSearch.do?event=<%=nextEvent%>";
                document.forms[0].submit();
            }
        }

        function cancelForm(){
            document.forms[0].action ="<%=cancelAction%>";
            document.forms[0].submit();
        }

		/**
        function JumpOnSelectactive(selectObj, customerID, limitProfileID, agreementID){
            var selectIndex = selectObj.selectedIndex;
            if (selectObj.options[selectIndex].value == "VIEW_CCI"){
                location.href = "CRCustomerSearch.do?event=read&customerID=" +customerID+"&limitProfileID="
                +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
            }else if (selectObj.options[selectIndex].value == "DELETE_CCI") {
                location.href = "CRCustomerSearch.do?event=DelCCINo&customerID=" +customerID+"&limitProfileID="
                +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
            }
        }
        */

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

