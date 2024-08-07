<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants" %>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.predeal.bus.OBPreDeal" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%


PreDealSearchRecord record = (PreDealSearchRecord) request.getAttribute (PreDealConstants.PRE_DEAL_RECORD);
Collection coll = (Collection) request.getAttribute (PreDealConstants.EAR_MARK_GROUP);
DefaultLogger.debug (this, "Collection size is : " + coll.size ());

if (record == null)
{
    record = new PreDealSearchRecord ();
}

if (coll == null)
{
    coll = new ArrayList ();
    DefaultLogger.debug (this, "Collection is null , creating an empty collection");
}

Iterator iter = coll.iterator ();

String counterName = (String) request.getAttribute (PreDealConstants.COUNTER_NAME);
String isinCode = (String) request.getAttribute (PreDealConstants.ISIN_CODE);
String ric = (String) request.getAttribute (PreDealConstants.RIC);

ICommonUser user = (ICommonUser) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER);
ITeam userTeam = (ITeam) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.USER_TEAM);
DefaultLogger.debug (this, "userId: " + user.getUserID ());


int role = 0;

TOP_LOOP:
    
    for (int i = 0; i < userTeam.getTeamMemberships ().length; i++)
    { //parse team membership to validate user first
    for (int j = 0; j < userTeam.getTeamMemberships ()[i].getTeamMembers ().length; j++)
    {  //parse team memebers to get the team member first..
        if (userTeam.getTeamMemberships ()[i].getTeamMembers ()[j].getTeamMemberUser ().getUserID () == user.getUserID ())
        {
            if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_SCO_USER)   // the CR user
            {
                role = ICMSConstant.TEAM_TYPE_SCO_USER;
                
                DefaultLogger.debug (this, "CR user found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_SSC_MAKER)   // the SAC Maker
            {
                role = ICMSConstant.TEAM_TYPE_SSC_MAKER;
                
                DefaultLogger.debug (this, "SAC maker found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH)   // the SAC Maker
            {
                role = ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH;
                
                DefaultLogger.debug (this, "SAC maker found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_CPU_MAKER_I)   // the SAC Maker
            {
                role = ICMSConstant.TEAM_TYPE_CPU_MAKER_I;
                
                DefaultLogger.debug (this, "SAC maker found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH)   // the SAC Maker
            {
                role = ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH;
                
                DefaultLogger.debug (this, "SAC maker I - WFH found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_SSC_CHECKER)   // the SAC Checker
            {
                role = ICMSConstant.TEAM_TYPE_SSC_CHECKER;
                
                DefaultLogger.debug (this, "SAC checker found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH)   // the SAC Checker WFH
            {
                role = ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH;
                
                DefaultLogger.debug (this, "SAC checker WFH found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_AM_MAKER)   // the AM Maker
            {
                role = ICMSConstant.TEAM_TYPE_AM_MAKER;
                
                DefaultLogger.debug (this, "AM maker found");
                
                break TOP_LOOP;
            }
            else if (userTeam.getTeamMemberships ()[i].getTeamTypeMembership ().getMembershipID () == ICMSConstant.TEAM_TYPE_AM_CHECKER)   // the AM Checker
            {
                role = ICMSConstant.TEAM_TYPE_AM_CHECKER;
                
                DefaultLogger.debug (this, "AM checker found");
                
                break TOP_LOOP;
            }
        }
    }
    }


%>


<html>
    <head>
        <script type="text/javascript">
        <!--
			function jump ( selectElement , earMarkId ){
				var form = document.getElementById( 'form' ) ;
				form.event.value = selectElement.value ;
				form.earMarkId.value = earMarkId ;
				form.submit () ;
			}
			function cancel() {
				var form = document.getElementById( 'form' ) ;
				form.event.value = '<%= PreDealConstants.EVENT_MAKER_SEARCH %>' ;
				form.submit () ;
			}

		//-->
        </script>
        <title>
            <bean:message key="title.pre.deal"/>
        </title>
        
    </head>
    
    <body>
        
        <table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            
            <thead>
                <tr>
                    <td>
                        <h3>View List</h3>
                        <h5>
                            <%
                            String  currencyCode = "";
                            if ( record.getUpdatePrice () != null )
                                currencyCode = record.getUpdatePrice ().getCurrencyCode () ;
                            %>
                            <integro:empty-if-null value="<%=record.getName()%>"/> (Stock Code: <integro:empty-if-null value="<%=record.getStockCode ()%>"/>; Currency: <integro:empty-if-null value="<%=currencyCode%>"/>)
                            
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <hr/>
                    </td>
                </tr>
            </thead>
        </table>
        <br/>
        
        <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
                <tr>
                    <!--S/N-->
                    <td width="3%"><bean:message key="label.predeal.sn"/></td>
                    <!--Customer Name-->
                    <td width="12%"><bean:message key="label.predeal.cust.name"/></td>
                    <!--Source System-->
                    <td width="10%"><bean:message key="label.predeal.source.sys"/></td>
                    <!--AA Number-->
                    <td width="13%"><bean:message key="label.predeal.aa.num"/></td>
                    <!--Security ID-->
                    <td width="12%"><bean:message key="label.predeal.sec.id"/></td>
                    <!--Ear-marking Units-->
                    <td width="10%"><bean:message key="label.predeal.earmarking.units"/></td>
                    <!--Date of Ear-marking-->
                    <td width="10%"><bean:message key="label.predeal.earmarking.date"/></td>
                    <!--Status-->
                    <td width="11%"><bean:message key="label.predeal.status"/></td>
                    <!--Action-->
                    <td width="19%"><bean:message key="label.predeal.action"/></td>
                </tr>
            </thead>
            <tbody>
                <% if (coll.size () == 0)
                { %>
                <tr class="odd">
                    <td colspan="14">
                        <bean:message key="label.global.not.found"/>
                    </td>
                </tr>
                <% }
                else
                {
                                boolean odd = false;
                                int count = 0;
                                while (iter.hasNext ())
                                {
                                    Object obj = iter.next ();
                                    DefaultLogger.debug (this, "Class of obeject " + obj.getClass ().getName ());
                                    OBPreDeal ob = (OBPreDeal) obj;
                                    odd = !odd;
                                    ++ count;
                %>
                
                <tr class="<%= odd ?  "odd" : "even" %>">
                    
                    <td class="index" valign="middle"><%= count %></td>
                    <td><integro:empty-if-null value="<%=ob.getCustomerName ()%>"/></td>
                    <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue ( PreDealConstants.PRE_DEAL_SOURCE , ob.getSourceSystem() ) %>"/></td>
                    <td><integro:empty-if-null value="<%=ob.getAaNumber ()%>"/></td>
                    <td><integro:empty-if-null value="<%=ob.getSecurityId ()%>"/></td>
                    <td><%=ob.getEarMarkUnits ()%></td>
                    <td width="10%">
                        <%
                        if ( ob.getEarMarkingDate () == null )
                        {
                        %>
                        -
                        <%
                        }
                        else
                        {
                        %>                        
                        <integro:date object="<%=ob.getEarMarkingDate ()%>"/>
                        <%
                        }
                        %>                                                
                    </td>
                    <td width="11%"><integro:empty-if-null value="<%=ob.getEarMarkStatus ()%>"/></td>
                    <td width="19%">
                        <%
                        if (PreDealConstants.EARMARK_STATUS_DELETED.equals (ob.getEarMarkStatus ()) ||
                                            PreDealConstants.EARMARK_STATUS_RELEASED.equals (ob.getEarMarkStatus ()) ||
                                            (PreDealConstants.EARMARK_STATUS_HOLDING.equals (ob.getEarMarkStatus ()) && role == ICMSConstant.TEAM_TYPE_AM_MAKER)) // ||
                                            //(PreDealConstants.EARMARK_STATUS_EARMARKED.equals (ob.getEarMarkStatus ()) && role == ICMSConstant.TEAM_TYPE_SSC_MAKER))
                        {
                        %>
                        -
                        <% }
                        else if (role == ICMSConstant.TEAM_TYPE_AM_MAKER 
                        		|| role == ICMSConstant.TEAM_TYPE_SSC_MAKER 
                        		|| role == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
                        		|| role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I
                        		|| role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH)
                        {  %>
                        <select onchange="jump( this , '<%=ob.getEarMarkId ()%>' )">
                            <option value="#"> Please Select </option>
                            <% if ((PreDealConstants.EARMARK_STATUS_EARMARKED.equals (ob.getEarMarkStatus ())) && (role == ICMSConstant.TEAM_TYPE_AM_MAKER ||
                                    role == ICMSConstant.TEAM_TYPE_SSC_MAKER 
                                    || role == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
                                    || role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I
                                    || role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH))
                            { %>
                            <option value="<%= PreDealConstants.EVENT_MAKER_PREPARE_DELETE %>">Delete</option>
                            <option value="<%= PreDealConstants.EVENT_MAKER_PREPARE_TRANSFER %>">Transfer</option>
                            <% }
                            else if (PreDealConstants.EARMARK_STATUS_HOLDING.equals (ob.getEarMarkStatus ()) &&  (role == ICMSConstant.TEAM_TYPE_SSC_MAKER 
                            		|| role == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
                            		|| role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I
                            		|| role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH))
                            { %>
                            <option value="<%= PreDealConstants.EVENT_MAKER_PREPARE_RELEASE %>">Release </option>
                            <%}%>
                        </select>
                        <% }
                        else
                        { %>
                        -
                        <% } %>
                    </td>
                </tr>
                
                <% }
                }%>
            </tbody>
        </table>
        
        <br/>
        
        <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="baseline" align="center">&nbsp;</td>
            </tr>
            <tr>
                <td width="100" valign="baseline" align="center">
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','/cms/img/return2.gif',1)" onclick="cancel()">
                        <img src="/cms/img/return1.gif" name="Image4413" border="0" id="Image4413" alt="cancel"/>
                    </a>
                </td>
            </tr>
            <tr>
                <td valign="baseline" align="center">&nbsp;</td>
            </tr>
        </table>
        
        <html:form action="PreDeal.do" styleId="form">
            <html:hidden property="event"/>
            <html:hidden property="earMarkId"/>
            <html:hidden property="counterName" value="<%= counterName %>"/>
            <html:hidden property="isinCode" value="<%= isinCode %>"/>
            <html:hidden property="ric" value="<%= ric %>"/>
        </html:form>
    </body>
</html>