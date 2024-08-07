
<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@ page import="com.integrosys.component.bizstructure.app.bus.ITeam"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ page import="com.integrosys.cms.ui.creditriskparam.sharecounter.ShareCounterConstants"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

Collection coll = (Collection) request.getAttribute ( PreDealConstants.SEARCH_RESULT ) ;
String stockExchangeName = (String) request.getAttribute ( PreDealConstants.STOCK_EXCHANGE_NAME ) ;

if ( coll == null )
{
    coll = new ArrayList () ;
    
    DefaultLogger.debug ( this , "Collection is null , creating an empty collection" ) ;
}

Iterator iter = coll.iterator () ;

ICommonUser user = (ICommonUser)session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE+"."+ IGlobalConstant.USER);
ITeam userTeam = ( ITeam )session.getAttribute ( ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
DefaultLogger.debug (this, "userId: "+user.getUserID ());
String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
long teamTypeMembershipID = Long.parseLong(teamTypeMemID);
boolean found = false;

int role = 0 ;
	if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_CHECKER){
	    found = true;
	    DefaultLogger.debug(this, "User is SSC checker...");
	    role = ICMSConstant.TEAM_TYPE_SSC_CHECKER;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH){
	    found = true;
	    DefaultLogger.debug(this, "User is SSC checker WFH...");
	    role = ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER){
	    found = true;
	    DefaultLogger.debug(this, "User is SSC Maker...");
	    role = ICMSConstant.TEAM_TYPE_SSC_MAKER;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH){
	    found = true;
	    DefaultLogger.debug(this, "User is SSC Maker WFH...");
	    role = ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_I){
	    found = true;
	    DefaultLogger.debug(this, "User is SSC Maker I...");
	    role = ICMSConstant.TEAM_TYPE_CPU_MAKER_I;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH){
	    found = true;
	    DefaultLogger.debug(this, "User is SSC Maker I - WFH...");
	    role = ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_GAM_USER){
	    found = true;
	    DefaultLogger.debug(this, "User is gam...");
	    role = ICMSConstant.TEAM_TYPE_GAM_USER;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_SCO_USER){
	    found = true;
	    DefaultLogger.debug(this, "User is CR user...");
	    role = ICMSConstant.TEAM_TYPE_SCO_USER;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_AM_MAKER){
	    found = true;
	    DefaultLogger.debug(this, "User is AM Maker...");
	    role = ICMSConstant.TEAM_TYPE_AM_MAKER;
	    
	}else if(teamTypeMembershipID==ICMSConstant.TEAM_TYPE_AM_CHECKER){
	    found = true;
	    DefaultLogger.debug(this, "User is AM Checker...");
	    role = ICMSConstant.TEAM_TYPE_AM_CHECKER;
	    
	}
%>

<html>
    <head>
        
        <script type="text/javascript">
  <!--

    function jump ( selectElement , feedId )
    {
      if ( feedId != '#' )
      {
        var form = document.getElementById( 'form' ) ;

        form.event.value = selectElement.value ;
        form.feedId.value = feedId ;

        form.submit () ;
      }
    }

    function cancel()
    {
      var form = document.getElementById( 'form' ) ;

      form.event.value = '<%= PreDealConstants.EVENT_MAKER_PREPARE_SEARCH %>' ;

      form.submit () ;
    }

  //-->
        </script>
        
        <title>
            <!-- Pre-Deal -->
            <bean:message key="title.pre.deal"/>
        </title>
        
    </head>
    
    <body>
        <br />
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" >
            <tbody>
                <tr>
                    <td><%=coll.size ()%> Record(s) Found</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" >
                            <thead>
                                <tr>
                                    <!--S/N-->
                                    <td width="4%"><bean:message key="label.predeal.sn"/></td>
                                    <!--Suspended (Internal Use)-->
                                    <td width="7%"><bean:message key="label.predeal.suspended.internal"/></td>
                                    <!--Suspended (Stock Exchange)-->
                                    <td width="8%"><bean:message key="label.predeal.suspended.stock"/></td>
                                    <!--Share Status-->
                                    <td width="8%"><bean:message key="label.predeal.share.status"/></td>
                                    <!--Name-->
                                    <td width="15%"><bean:message key="label.predeal.name"/></td>
                                    <!--ISIN-->
                                    <td width="5%"><bean:message key="label.predeal.isin"/></td>
                                    <!--RIC-->
                                    <td width="5%"><bean:message key="label.predeal.ric"/></td>
                                    <!--Stock Code/ Ticker-->
                                    <td width="5%"><bean:message key="label.predeal.stockcodeticker"/></td>
                                    <!--CCY-->
                                    <td width="5%"><bean:message key="label.predeal.ccy"/></td>
                                    <!--Update Price-->
                                    <td width="7%"><bean:message key="label.predeal.update.price"/></td>
                                    <!--Last Updated Date-->
                                    <td width="7%"><bean:message key="label.predeal.last.updated.date"/></td>
                                    <!--Total Actual Holdings Held by Bank Group-->
                                    <td width="11%"><bean:message key="label.predeal.total.holdings"/></td>
                                    <!--No. of Earmarked units held in &ldquo;Holding Area&rdquo;-->
                                    <td width="11%"><bean:message key="label.predeal.earmarked.units"/></td>
                                    <!--Total Current Earmarked Units-->
                                    <td width="11%"><bean:message key="label.predeal.current.earmarked.units"/></td>
                                    <!--Ear-marking-->
                                    <td width="5%"><bean:message key="label.predeal.earmaking"/></td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                DefaultLogger.debug ( this , "Collection size is : " + coll.size () ) ;
                                if ( coll.size () == 0 )
                                {
                                %>
                                <tr class="odd" >
                                    <td colspan="15" ><bean:message key="label.global.not.found"/></td>
                                </tr>
                                <%
                                }
                                
                                boolean odd = false  ;
                                int count = 0 ;
                                while ( iter.hasNext () )
                                {
                                    Object obj = iter.next () ;
                                    //DefaultLogger.debug ( this , "Class of obeject " + obj.getClass ().getName () ) ;
                                    
                                    PreDealSearchRecord record = (PreDealSearchRecord)obj;
                                    odd = !odd ;
                                    ++ count ;
                                %>
                                <tr class="<%= odd ?  "odd" : "even" %>">
                                    <td class="index" valign="middle"><%= count %></td>
                                    
                                    <td>
                                        <%
                                        if ( record.isInSuspended ()  )
                                        {
                                        %>
                                        <img src="/cms/img/tick(black).gif" alt="" />
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        &nbsp;
                                        <%
                                        }
                                        %>
                                    </td>
                                    
                                    <td>
                                        <%
                                        if ( record.isSuspended ()  )
                                        {
                                        %>
                                        <img src="/cms/img/tick(black).gif" alt="" />
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        &nbsp;
                                        <%
                                        }
                                        %>
                                    </td>
                                    <td>
                                        <integro:empty-if-null value="<%= CommonDataSingleton.getCodeCategoryLabelByValue (  ShareCounterConstants.SHARE_STATUS , record.getShareStatus () ) %>" />&nbsp;
                                    </td>
                                    
                                    <td>
                                        <integro:empty-if-null value="<%= record.getName () %>" />&nbsp;
                                    </td>
                                    
                                    <td>
                                        <integro:empty-if-null value="<%= record.getIsin_code () %>" />&nbsp;
                                    </td>
                                    
                                    <td>
                                        <integro:empty-if-null value="<%= record.getRic () %>" />&nbsp;
                                    </td>
                                    
                                    <td>
                                        <integro:empty-if-null value="<%= record.getStockCode () %>" />&nbsp;
                                    </td>
                                    
                                    <td>
                                        <integro:empty-if-null value="<%= record.getUpdatePrice ().getCurrencyCode () %>" />&nbsp;
                                    </td>
                                    
                                    <td>
                                        <integro:empty-if-null value="<%= record.getUpdatePrice ().getAmountAsBigDecimal ().toString () %>" />&nbsp;
                                    </td>
                                    
                                    <td style="text-align:center">
                                        <%
                                        if ( record.getLastUpdateDate () == null )
                                        {
                                        %>
                                        -
                                        <%
                                        }
                                        else
                                        {
                                        %>                        
                                        <integro:date object="<%=record.getLastUpdateDate ()%>"/>&nbsp;
                                        <%
                                        }
                                        %>
                                    </td>
                                    
                                    <td style="text-align:center">
                                        <%long total = record.getGroupTotalUnits () + record.getGroupCmsActualHolding (); %>&nbsp;
                                        <integro:empty-if-null value="<%= String.valueOf (total) %>" />&nbsp;
                                    </td>
                                    
                                    <td style="text-align:center">
                                        <integro:empty-if-null value="<%= String.valueOf (record.getGroupEarmarkHolding ()) %>" />&nbsp;
                                    </td>
                                    
                                    <td style="text-align:center">
                                        <integro:empty-if-null value="<%= String.valueOf (record.getGroupEarmarkCurrent ()) %>" />&nbsp;
                                    </td>
                                    
                                    <td style="text-align:center">
                                        <%
                                        
                                        if ( role == ICMSConstant.TEAM_TYPE_AM_MAKER ||
                                                role == ICMSConstant.TEAM_TYPE_SSC_MAKER ||
                                                role == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH ||
                                                role == ICMSConstant.TEAM_TYPE_SCO_USER ||
                                                role == ICMSConstant.TEAM_TYPE_GAM_USER||
                                                role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I||
                                                role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
                                                ) // if AM , SAC maker, GAM or CR user
                                        {
                                            
                                            boolean canMakeNew = true ;
                                            
                                            if ( "002".equals ( record.getGroupStockType () ) ||
                                                    "003".equals ( record.getGroupStockType () ) )
                                            {
                                                if ( record.getExpiryDate () != null )
                                                {
                                                    Date now = new Date () ;
                                                    
                                                    int newMonth = now.getMonth () + 6 ;
                                                    int newYear = newMonth / 12  + now.getYear () ;
                                                    
                                                    now.setMonth ( newMonth % 12 ) ;
                                                    now.setYear ( newYear ) ;
                                                    
                                                    canMakeNew = now.before ( record.getExpiryDate () ) ;
                                                    
                                                    //DefaultLogger.debug( this , "canMakeNew : " + canMakeNew ) ; 
                                                }
                                            }
                                        %>
                                        
                                        <select name="select" onchange="jump( this , '<%=record.getFeedId ()%>' )" >
                                            <option value="#">Please Select</option>
                                            <%
                                            
                                            DefaultLogger.debug(this, "role : " + role);
                                            DefaultLogger.debug(this, "record.getListedShareQuantity () : " + record.getListedShareQuantity ());
                                            DefaultLogger.debug(this, "record.isInSuspended () : " + record.isInSuspended ());
                                            DefaultLogger.debug(this, "record.isSuspended () : " + record.isSuspended ());
                                            DefaultLogger.debug(this, "record.getShareStatus () : " + record.getShareStatus ());
                                            DefaultLogger.debug(this, "canMakeNew : " + canMakeNew);
                                            
                                            if ( (role == ICMSConstant.TEAM_TYPE_AM_MAKER ||
                                            	  role == ICMSConstant.TEAM_TYPE_SSC_MAKER||
                                            	  role == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH||
                                            	  role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I||
                                            	  role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH) && // if AM or SAC maker
                                                    record.getListedShareQuantity () > 0 &&
                                                    ! record.isInSuspended () &&
                                                    ! record.isSuspended () &&
                                                    "1".equalsIgnoreCase ( record.getShareStatus () ) &&
                                                    canMakeNew )
                                                
                                            {
                                            %>
                                            <option value="<%=PreDealConstants.EVENT_MAKER_PREPARE_NEW_EAR_MARK%>">New Ear-marking</option>
                                            <%
                                            }
                                            %>
                                            <option value="<%=PreDealConstants.EVENT_MAKER_VIEW_EAR_MARK%>">View Ear-marking</option>
                                            <% if ((role == ICMSConstant.TEAM_TYPE_SSC_MAKER ||
                                            		role == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH ||
                                            		role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I ||
                                            		role == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH ||
                                            		role == ICMSConstant.TEAM_TYPE_GAM_USER ||
                                            		role == ICMSConstant.TEAM_TYPE_SCO_USER) &&  
	                                            record.getListedShareQuantity () > 0 &&
	                                            ! record.isInSuspended () &&
	                                            ! record.isSuspended () &&
	                                            "1".equalsIgnoreCase ( record.getShareStatus () ) &&
	                                            canMakeNew ) {
                                            %>
                                            <option value="<%=PreDealConstants.EVENT_MAKER_VIEW_CONCENTRATION%>">View Concentration</option>
                                            <% } %>
                                        </select>
                                        
                                        <%
                                        }
                                        else
                                        {
                                        %>
                                        -
                                        <%
                                        }
                                        %>
                                    </td>
                                </tr>
                                
                                <%
                                }
                                %>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
            </tbody>
        </table>
        <br />
        
        <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="baseline" align="center">&nbsp;</td>
            </tr>
            
            <tr>
                <td width="100" valign="baseline" align="center">
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','/cms/img/return2.gif',1)" onclick="cancel()" >
                        <img src="/cms/img/return1.gif" name="Image4413"  border="0" id="Image4413" />
                    </a>
                </td>
            </tr>
            
            <tr>
                <td valign="baseline" align="center">&nbsp;</td>
            </tr>
        </table>
        
        <html:form action="PreDeal.do" styleId="form" >
            <html:hidden property="event" />
            <input type="hidden" name="feedId" />
        </html:form>
        
    </body>
    
</html>