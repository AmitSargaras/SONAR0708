<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.component.commondata.app.CommonDataSingleton" %>

<%@ page import="com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<jsp:include page="printTransValue.jsp"/>

<%
    System.out.println("Entered search_select.jsp");
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }

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
    
    CounterpartySearchForm aForm = (CounterpartySearchForm) request.getAttribute("CounterpartySearchForm");
    
    List v = (List)aForm.getSearchResult();
    System.out.println("Search Result : " + v);
    if(v!=null) {
       pageContext.setAttribute("customerList",v);
    }
    
    CustomerSearchCriteria search = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
    }
    
    
    int sno = 0;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}
    int numItem = aForm.getNumItems();
   
    String event = request.getParameter("event");
    String nextEvent = "add";

    try {
    	int count = 1;
    	int rowIdx = 0;

%>


<%@page import="com.integrosys.base.techinfra.util.AccessorUtil"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="com.integrosys.cms.ui.cci.CounterpartySearchForm" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="Javascript" type="text/javascript">
<!--

	function JumpOnSelectactive(selectObj, customerID)
	{

  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "viewcustdetails")
		{
        	location.href = "CounterpartyCCI.do?event=view_cust_details&sub_profile_id=" +customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
   		}

     }
    //-->
</script>
</head>

<body >
<table width="100%" align="center" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <td valign="top">
       <html:form action="CounterpartyCCI.do">

            <html:hidden property="customerSeach" value="true"/>
            <html:hidden property="startIndex"/>
            <html:hidden property="numItems"/>
            <html:hidden property="leIDType"/>
            <html:hidden property="customerName"/>
            <!--
            <html:hidden property="legalID"/>
             -->
            <html:hidden property="idNO"/>
            <html:hidden property="legalName"/>

            <input type="hidden" name="indicator">
            <input type="hidden" name="all">

            <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" id="custsearch">
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
                                    <td width="5%"><bean:message key="label.global.sn"/></td>
                                    <td width="40%"><bean:message key="label.global.name"/></td>
                                    <td width="15%"><bean:message key="label.customer.doincorp"/></td>
                                    <td width="15%"><bean:message key="label.customer.id.source"/></td>
                                    <td width="10%"><bean:message key="label.customer.id"/></td>
                                    <td width="15%"><bean:message key="label.col.owner.id.no"/></td>
                                    <td width="5%"><bean:message key="label.cci.add"/></td>
                                </tr>

                            </thead>
                            <tbody>
                                <% if (v != null) {%>
                                <logic:present name="customerList">
                                    <logic:iterate id="OB" name="customerList" type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
                                        <%
                                            String strSubprofileID = OB.getSubProfileID() + "";
                                             sno++;
                                             count++;
                                            Date dob = OB.getDob()!=null?OB.getDob():OB.getIncorporationDate()!=null?OB.getIncorporationDate():null;

                                             String sourceDesc =CommonDataSingleton.getCodeCategoryLabelByValue(ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, OB.getSourceID());
                                        %>
                                        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                                            <td style="text-align:center" class="index"><%=sno%></td>
                                            <%--<td><integro:empty-if-null value="<%=OB.getLegalName()%>"/></td>--%>
                                            <td><integro:empty-if-null value="<%=OB.getCustomerName()%>"/></td>
                                            <td><% if (dob != null){%>
                                                    <integro:date object="<%=dob%>"/>
                                                <%}else {%>
                                                 -
                                            <%}%>&nbsp;</td>
                                            <td><integro:empty-if-null value="<%=sourceDesc%>"/> </td>
                                            <td><integro:empty-if-null value="<%=OB.getLmpLeID()%>"/>&nbsp; </td>
                                            <td><integro:empty-if-null value="<%=OB.getIdNo()%>"/>&nbsp; </td>
                                            <td style="text-align:center;"><html:checkbox property="customerID" value="<%=String.valueOf(OB.getSubProfileID())%>"/> </td>
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
                    </td>
                </tr>
                <tr>
                    <td><html:errors property="errDuplicate" /></td>
                </tr>
                <tr height="40">
                    <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onClick="submitForm();"
                                          onmouseover="MM_swapImage('Image1','','img/ok2.gif',1)">
                        <img src="img/ok1.gif" name="Image1" border="0" id="Image1"/></a>

                        <a href="#" onClick="cancelForm();" onmouseout="MM_swapImgRestore()"
                           onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
                            <img src="img/cancel1.gif" name="Image2" border="0" id="Image2"/></a>
                    </td>
                </tr>
            </table>
        </html:form>
    </td>
</tr>
<!-- End Content -->

<!-- General Purpose Bar -->
<% String alphaURL="CounterpartyCCI.do?event=customer_list";%>
<tr>
<td height="25">
		<table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr>
             <td width="580" valign="middle">
             <integro:alphaindex url='<%=alphaURL%>' submitFlag='<%=new Boolean(true)%>'/>
             </td>
             <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
             <td valign="middle" >
              <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%=request.getContextPath()+"/CounterpartyCCI.do?event=customer_list&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
             </td>
           </tr>
       </table>
</td>
</tr>


</table>

 <script language="JavaScript">
  <!--
        function submitForm(){
          var customerIDCB = document.CounterpartySearchForm.customerID;
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
                document.forms[0].action ="CounterpartyCCI.do?event=<%=nextEvent%>";
                document.forms[0].submit();
            }
        }

        function cancelForm(){
            document.forms[0].action ="CounterpartyCCI.do?event=cancel";
            document.forms[0].submit();
        }

        function gotoPage() {
            parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
        }

        function goNextPrev(ind) {
            document.forms["CounterpartySearchForm"].cusName.value='';
            document.forms["CounterpartySearchForm"].startIndex.value=ind;
            document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
        }

        function goPageIndex(ind) {
            document.forms["CounterpartySearchForm"].startIndex.value=ind;
            document.forms["CounterpartySearchForm"].numItems.value=<%=numItem%>;
            document.forms["CounterpartySearchForm"].submit();
        }

        function goAlphaIndex(ind) {
            document.forms["CounterpartySearchForm"].customerName.value=ind;
            if (ind == ''){
                document.forms["CounterpartySearchForm"].all.value = 'Y';
            }
            document.forms[0].indicator.value='*';
            document.forms["CounterpartySearchForm"].startIndex.value=0;
            document.forms["CounterpartySearchForm"].action = '<%=alphaURL%>';
            document.forms["CounterpartySearchForm"].submit();
        }
        function goPage(pageNo){
            document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
            document.forms[0].numItems.value = <%=numItem%>;
        }
     -->
    </script>

</body>

</html>


<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

