<%@ page import="com.integrosys.cms.ui.customer.GroupSearchForm,
                 java.util.Collection,
                 java.util.Vector,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.ArrayList"%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/GroupList.jsp,v 1.6 2006/10/27 08:43:04 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.6 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
   // System.out.println("value of records_per_page"+records_per_page);
%>

<%


    com.integrosys.cms.ui.customer.GroupSearchForm aForm = (com.integrosys.cms.ui.customer.GroupSearchForm) request.getAttribute("GroupSearchForm");
    Collection v = new ArrayList();
    v = (Collection)aForm.getSearchResult();
    if(v!=null) {
       pageContext.setAttribute("groupList",v);
    }
   int sno = 0;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}

%>
<% if(v!=null) {
    try

    {
     %>


<html>
<head>

<script language="JavaScript">

    function gotoPage() {
	    parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        document.forms["NewUserSearchForm"].cusName.value='';
        document.forms["NewUserSearchForm"].startIndex.value=ind;
    }

    function goPageIndex(ind) {
        document.forms["GroupSearchForm"].startIndex.value=ind;
        document.forms["GroupSearchForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["GroupSearchForm"].groupName.value=ind;
        document.forms["GroupSearchForm"].startIndex.value=0;
        document.forms["GroupSearchForm"].submit();
    }
    function goPage(pageNo){
	    document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
    }
</script>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->

<html:form action="GroupSearch.do?event=list">
<html:hidden property="startIndex" />
<input type="hidden" name="groupName" >

         <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">

          <tr>
           <td>
             <%if(v!=null){%>
             <%=aForm.getNumItems()%> Record(s) Found
             <%}else{ %>
             0 Record(s) Found
             <%}%>
           </td>
          </tr>
          <tr>
           <td>
            <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
             <thead>
              <tr>


               <td width="3%">S/N</td>
               <td width="6%">Grouping Type</td>
               <td width="18%">Group ID<br />
                  Group Name</td>
               <td width="4%">Parent</td>
               <td width="18%">Group ID<br />
                       Group Name</td>
               <td width="18%">Legal ID<br />
                  Legal Name</td>
               <td width="4%">Parent</td>
               <td width="18%">Legal ID<br />
                         Legal Name</td>
               <td>Relationship Status</td>
               <td width="6%">Ownership %</td>

              </tr>
             </thead>
             <tbody>
       <% if(v!=null)  {%>
              <logic:present name="groupList">
               <logic:iterate id="OB" name="groupList"  type="com.integrosys.cms.app.customer.bus.OBGroupSearchResult" scope="page">
                <%
                    String rowClass="";
       				sno++;
      				if(sno%2!=0){
          			rowClass="odd";
      				}else{
          			rowClass="even";
      				}
      			 %>
                  <tr class="<%=rowClass%>">
                  <td style="text-align:center" class="index"><%=sno%></td>
                  <td><integro:empty-if-null value="<%=OB.getGroupType()%>" />&nbsp;</td>
                  <td><%=OB.getParentGroupID()%>&nbsp; <br> <%=OB.getParentGroupName()%>&nbsp;</td>
                  <td>Yes</td>
                  <td><%=(Long.parseLong(OB.getGroupID()) == 0) ? "" : OB.getGroupID()%>&nbsp; <br> <integro:empty-if-null value="<%=OB.getGroupName()%>" />&nbsp;</td>
                  <td><%=OB.getLegalParentID()%>&nbsp; <br> <%=OB.getLegalParentName()%>&nbsp;</td>
                  <td><%= (Long.parseLong(OB.getLegalID()) == 0) ? "" : "Yes"%>&nbsp;</td>
                  <td><%= (Long.parseLong(OB.getLegalID()) == 0) ? "" : OB.getLegalID()%>&nbsp; <br> <integro:empty-if-null value="<%=OB.getLegalName()%>" />&nbsp;</td>
                  <td><integro:empty-if-null value="<%=OB.getRelationshipStatus()%>" />&nbsp;</td>
                  <td><integro:empty-if-null value="<%=OB.getOwnershipPercent()%>" />&nbsp;</td>

                 </tr>
	            </logic:iterate>
               </logic:present>
               <%}%>
              </tbody>
			</table>
		   </td>
		  </tr>
		 </table>
</html:form>
 </td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->
        <% String alphaURL="/GroupSearch.do?event=list";%>
<tr>
<td height="25">
			<table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="3" valign="middle" style="padding-right : 5px"><img src="img/icon/seprate_bar.gif" /></td>
                        <td valign="middle" >
                          Pg:&nbsp;<integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%="GroupSearch.do?event=list&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
                        </td>
                      </tr>
               </table>
</td>
</tr>

</table>

</body>
</html>


<%} catch(Exception e)
        { e.printStackTrace();  }

}  else{%>




<html>
<head>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

 <table width="460" height="210" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd">
      <td style="text-align:center" valign="middle"><table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td class="even" style="text-align:center" valign="middle">
                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                  <tr class="even">
                    <td style="border:none;text-align:center"><strong><img src="img/info.gif" /></strong></td>
                  </tr>
                  <tr class="even">
                    <td style="border:none;text-align:center">
                      <strong><font size="2"><br /><bean:message key="label.global.not.found"/></font></strong>
                    </td>
                  </tr>
                </table> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
</body>
</html>
                 <%}  %>