<%@ page import="com.integrosys.cms.ui.interestrate.MaintainInterestRateForm,
                 java.util.Collection,
                 java.util.*,
                 java.util.Vector,java.util.Iterator,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.cms.ui.common.InterestRateTypeList
                "%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/interestrate/interest_rate_maker_search.jsp,v 1 2007/02/08 Jerlin Exp $
*
* Describe this JSP.
* Purpose: For Maker and Checker to search the month and type to view or edit the Interest Rates
* Description: search for the Interest Rates that want to be change or view by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision: 1$
* Date: $Date: 2007/02/08 $
* Tag: $Name$
*/
%>

<%
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    boolean isChecker = false;
    boolean isMaker = false;
    String event = "";
    for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_MR_MAKER){
                  event = "list";
                }else if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_MR_CHECKER){
                  event = "checker_view";
                }
            }
        }
    }
    //System.out.println("----------------------------------- 2 event : " + event);


    InterestRateTypeList list = InterestRateTypeList.getInstance ();
    Collection interestRateTypeListID = list.getInterestRateTypeListID ();
    Collection interestRateTypeListValue = list.getInterestRateTypeListValue ();
    pageContext.setAttribute("interestRateTypeListID", interestRateTypeListID);
    pageContext.setAttribute("interestRateTypeListValue", interestRateTypeListValue);

    com.integrosys.cms.ui.interestrate.MaintainInterestRateForm aForm = (com.integrosys.cms.ui.interestrate.MaintainInterestRateForm) request.getAttribute("MaintainInterestRateForm");
    String typeIntRate ="";
    String mthyr = "";
    if(!aForm.getTypeInterestRates().equals(null) || !aForm.getTypeInterestRates().equals("") ){
      typeIntRate = aForm.getTypeInterestRates();
    }
    if(!aForm.getMonthYear().equals(null) || !aForm.getMonthYear().equals("") ){
      mthyr = aForm.getMonthYear();
    }

%>


<%!
    int records_per_page = 10;
%>

<!-- InstanceBeginEditable name="head" -->

<script>
<!--

function submitPage() {
    document.forms[0].monthYear.value = document.forms[0].mthYear.value;
    document.forms[0].action = "MaintainInterestRate.do?event=<%=event%>";
    document.forms[0].submit();
}

//-->
</script>


<!-- InstanceEndEditable -->
<body>
<!-- InstanceBeginEditable name="Content" -->

<html:form action="MaintainInterestRate.do?event=list">
<html:hidden property="monthYear" />
  <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  id="custsearch">
    <tr>
      <td>
        <table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
          <thead>
            <tr>
              <td colspan="3">Please enter search criteria</td>
            </tr>
          </thead>
          <tbody>
            <tr class="odd">
              <td width="37%" class="fieldname">Type of Interest Rates :</td>
              <td width="58%">
                <html:select property="typeInterestRates">
                  <html:option value="">Please Select</html:option>
                  <html:options name="interestRateTypeListID" labelName="interestRateTypeListValue"/>
                </html:select>
                <html:errors property="typeIntRates" />
              </td>
              <td rowspan=2>
                <input onclick="submitPage()" name="AddNew" type="button" id="AddNew" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
              </td>
            </tr>
            <tr class="even">
              <td class="fieldname">Month/Year :</td>
              <td>
                <select name="mthYear" maxlength="50%">
                  <option value="">Please Select</option>
                  <% Calendar date = Calendar.getInstance();
                     int startMonth = date.get(Calendar.MONTH) - 12;
                     int endMonth = date.get(Calendar.MONTH) + 12;
                     int startYear = date.get(Calendar.YEAR) - 1;
                     String mthYear[] = new String[25];
                     String mthYearDesc[] = new String[25];
                     int mth = 0;
                     int yr = 0;
                     int j = -1;

                     for (int i = startMonth; i<=endMonth; i++) {

                       if (i < 0) {
                         yr = startYear;
                         mth = i + 12;

                         if (Integer.toString(mth).length() == 1) {
                           mthYear[j+1] = "0" + Integer.toString(mth) + "|" + Integer.toString(yr);                                                       
                         }else{
                           mthYear[j+1] = Integer.toString(mth) + "|" + Integer.toString(yr);                                                                                                              
                         }

                       }else if(i >= 0 && i <= 12){
                         yr = startYear + 1;
                         mth = i;

                         if (Integer.toString(mth).length() == 1) {
                           mthYear[j+1] = "0" + Integer.toString(mth) + "|" + Integer.toString(yr);                                                       
                         }else{
                           mthYear[j+1] = Integer.toString(mth) + "|" + Integer.toString(yr);                                                                                                              
                         }

                       }else{
                         yr = startYear + 2;
                         mth = i - 12;

                         if(Integer.toString(mth).length() == 1){
                           mthYear[j+1] = "0" + Integer.toString(mth) + "|" + Integer.toString(yr);                                                       
                         }else{
                           mthYear[j+1] = Integer.toString(mth) + "|" + Integer.toString(yr);                                                                                                              
                         }

                       }

                       switch (mth){

                         case 0: mthYearDesc[j+1] = "December/" + Integer.toString(yr-1); break;
                         case 1: mthYearDesc[j+1] = "January/" + Integer.toString(yr); break;
                         case 2: mthYearDesc[j+1] = "February/" + Integer.toString(yr); break;
                         case 3: mthYearDesc[j+1] = "March/" + Integer.toString(yr); break;
                         case 4: mthYearDesc[j+1] = "April/" + Integer.toString(yr); break;
                         case 5: mthYearDesc[j+1] = "May/" + Integer.toString(yr); break;
                         case 6: mthYearDesc[j+1] = "June/" + Integer.toString(yr); break;
                         case 7: mthYearDesc[j+1] = "July/" + Integer.toString(yr); break;
                         case 8: mthYearDesc[j+1] = "August/" + Integer.toString(yr); break;
                         case 9: mthYearDesc[j+1] = "September/" + Integer.toString(yr); break;
                         case 10: mthYearDesc[j+1] = "October/" + Integer.toString(yr); break;
                         case 11: mthYearDesc[j+1] = "November/" + Integer.toString(yr); break;
                         case 12: mthYearDesc[j+1] = "December/" + Integer.toString(yr); break;
                       }

                       j++;
                     }

                     for(int i=0; i<mthYear.length; i++){
                  %>
                  <option value="<%=mthYear[i]%>" <%if( mthyr.equals(mthYear[i]) ){%>selected<%}%>><%=mthYearDesc[i]%></option>
                  <% } %>
                </select>
                <html:errors property="mthYear" />
              </td>
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
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->



