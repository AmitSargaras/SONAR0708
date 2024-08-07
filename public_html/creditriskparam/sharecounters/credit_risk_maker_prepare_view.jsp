<%@ page import="com.integrosys.cms.ui.creditriskparam.sharecounter.ShareCounterConstants"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.bus.ICreditRiskParamGroup"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.bus.OBCreditRiskParam"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.trx.OBCreditRiskParamGroupTrxValue"%>
<%@ page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.integrosys.cms.ui.creditriskparam.sharecounter.MaintainShareCounterUtil"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

/**
* Copyright Integro Technologies Pte Ltd
* $Header$
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



OBCreditRiskParamGroupTrxValue ob = ( OBCreditRiskParamGroupTrxValue ) request.getAttribute ( ShareCounterConstants.CREDIT_RISK_PARAM_TRX_VALUE ) ;
ICreditRiskParamGroup group = ob.getCreditRiskParamGroup () ;

Integer offset = (Integer)  request.getAttribute ( ShareCounterConstants.OFFSET );
Integer length = (Integer)  request.getAttribute ( ShareCounterConstants.LENGTH );

String lastActionBy = ob.getUserInfo () ;
String remarks = ob.getRemarks () ;

if( lastActionBy == null )
{
    lastActionBy = "";
}

if ( remarks == null )
{
    remarks= "";
}

DecimalFormat df = new DecimalFormat ( "0.00" ) ;

//String roleType = (String) session.getAttribute (ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.TEAM_TYPE_MEMBERSHIP_ID);
String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
long roleType = Long.parseLong(teamTypeMemID);
int roleId = (int)roleType ;
//int roleId = Integer.parseInt ( roleType ) ;
int paramsSize = 0 ;

boolean noRecord = false ;

if ( group.getFeedEntries () == null || group.getFeedEntries ().length == 0)
{
    noRecord = true ;
}
else
{
    paramsSize = group.getFeedEntries ().length ;
}

String title  = ob.getCreditRiskParamGroup ().getSubTypeDescription () + " - " +  ob.getCreditRiskParamGroup ().getStockTypeDescription () ;
System.out.println("title : " + title);
%>


<html>
    
    <head>
        
        <script type="text/javascript" >
         <!--

			function goPageIndex(targetOffset)
			{
				document.getElementById( 'event' ).value = '<%=ShareCounterConstants.SHARE_COUNTER_VIEW_PAGINATE %>'  ;

				document.getElementById( 'offset' ).value = targetOffset ;

				document.getElementById( 'hiddenForm' ).submit() ;
			}

		 //-->
        </script>
        
        <title>
            Credit Risk Parameter
        </title>
        
    </head>
    
    <body>
        <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        <tr>
        <td valign="top">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            <thead>
                
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <h3>
                            <integro:empty-if-null value="<%=title%>" />
                        </h3>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <hr>
                    </td>
                </tr>
            </thead>
        </table>
        </td>
        </tr>
        
        <tr>
        <td valign="top">
        <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInput">
            
            <thead>
                
                <tr align="center" >
                    
                    <td width="2%" >
                        <!--S/N-->
                        <bean:message key="label.global.sn"/>
                    </td>
                    
                    <td width="5%">
                        ISIN
                    </td>
                    
                    <td width="3%">
                        <!--RIC-->
                        <bean:message key="label.ric"/>
                    </td>
                    
                    <td width="6%">
                        <!--FI-->
                        <!--<br/>-->
                        <!--Indicator *-->
                        <bean:message key="label.fi.indicator"/>
                    </td>
                    
                    <td width="9%">
                        <!--Counter Name-->
                        <bean:message key="label.counter.name"/>
                    </td>
                    
                    <td width="4%">
                        <!--CCY-->
                        <bean:message key="label.ccy"/>
                    </td>
                    
                    <td width="6%">
                        <!--Board Type-->
                        <bean:message key="label.board.type"/>
                    </td>
                    
                    <td width="10%">
                        <!--Acceptable/ Unacceptable-->
                        <bean:message key="label.acceptable.or.unacceptable"/>
                    </td>
                    
                    <td width="5%">
                        <!--Share Status-->
                        <bean:message key="label.share.status"/>
                    </td>
                    
                    <td width="5%">
                        <!--Suspended-->
                        <!--<br/>-->
                        <!--(Internal Use)-->
                        <bean:message key="label.suspend.for.internal.use"/>
                    </td>
                    
                    <td width="5%">
                        <!--Liquid/ Illiquid-->
                        <bean:message key="label.liquid.or.illiquid"/>
                    </td>
                   <% 
                   		if (group != null && group.getStockType() != null) {
                   		if (group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_WARRANTS) || 
                          		group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_LOAN_STOCKS)) { 
                          %>
                      <td width="10%">
                          <!--MOA-->
                          <bean:message key="label.moa"/>
                      </td>
                      <% }
                   		}%>  
                </tr>
                
            </thead>
            
            <tbody>
                
                <%
                if ( !noRecord )
                {
    
    OBCreditRiskParam[] params = group.getFeedEntries () ;
    boolean odd = true ;
    boolean isSuspended ;
    boolean isLiquid ;
    boolean isFi ;
    
    for ( int loop = offset.intValue () ; loop < params.length && loop < offset.intValue () + length.intValue () ; loop ++ )
    {
        isFi = params[ loop ].getIsFi () != null && params[ loop ].getIsFi ().equals ( "Y" ) ;
        isLiquid = params[ loop ].getIsLiquid () != null && params[ loop ].getIsLiquid ().equals ( "Y" ) ;
        isSuspended = params[ loop ].getIntSuspend () != null && params[ loop ].getIntSuspend ().equals ( "Y" ) ;
                
                %>
                <tr class=" <%= odd ? "odd" : "even" %>">
                    
                    <td width="2%" align="center" class="index" >
                        <%= loop + 1 %>
                    </td>
                    
                    <td width="5%" align="center" >
                        <integro:empty-if-null value="<%= params[ loop ].getStockCode () %>" />
                    </td>
                    
                    <td width="5%" align="center" >
                        <integro:empty-if-null value="<%= params[ loop ].getRic () %>" />
                    </td>
                    
                    <td width="8%" align="center" >
                        <%
                        if ( isFi )
                        {
                        %>
                        <img src="img/tick(black).gif" alt="" />
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
                    
                    <td width="13%" align="center" >
                        <integro:empty-if-null value="<%= params[ loop ].getName () %>" />
                    </td>
                    
                    <td width="5%" align="center" >
                        <integro:empty-if-null value="<%= params[ loop ].getCurrencyCode () %>" />
                    </td>
                    
                    <td width="9%" align="center" >
                        <integro:empty-if-null value="<%= CommonDataSingleton.getCodeCategoryLabelByValue (  ShareCounterConstants.BOARD_TYPE ,  params[ loop ].getParamBoardType () )  %>" />
                    </td>
                    
                    <td width="10%" align="center" >
                        <%
                        if ( params[ loop ].getIsAcceptable () != null && params[ loop ].getIsAcceptable ().equalsIgnoreCase ( "Y" ) )
                        {
                        %>
                        <bean:message key="label.acceptable"/>
                        <%
                        }
                        else
                        {
                        %>
                        <bean:message key="label.unacceptable"/>
                        <%
                        
                        }
                        %>
                    </td>
                    
                    <td width="8%" align="center" >
                        <integro:empty-if-null value="<%=  CommonDataSingleton.getCodeCategoryLabelByValue (  ShareCounterConstants.SHARE_STATUS , params[ loop ].getParamShareStatus () ) %>" />
                    </td>
                    
                    <td width="8%" align="center" >
                        <%
                        if ( isSuspended )
                        {
                        %>
                        <img src="img/tick(black).gif" alt="" />
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
                    
                    <td width="5%" align="center"  >
                        <%
                        if ( isLiquid )
                        {
                        %>
                        <img src="img/tick(black).gif" alt="" />
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
                   	<% if (group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_WARRANTS) || 
                       	   group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_LOAN_STOCKS)) { 
                    %>
                     <td >
                       	<integro:empty-if-null value="<%=String.valueOf(params[loop].getMarginOfAdvance()) %>" />%
                    </td>
                    <% } %>                                          
                </tr>
                
                <%
                odd = !odd ;
    }
                }
                else
                {
                %>
                <tr class="odd">
                    <td colspan="15">
                        <bean:message key="label.global.not.found"/>
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
        <td valign="top" height="70%">
        <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
            
            <tr>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
            </tr>
            
            <tr>
                

                <td width="100%" valign="baseline" align="center">
                    <a href="MaintainShareCounter.do?event=maker_share_counter_start" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
                        <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/>
                    </a>
                </td>
                
                
            </tr>
            
            <tr>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
            </tr>
            
        </table>
        
        <form action="MaintainShareCounter.do" method="POST" id="hiddenForm" >
            
            <input type="hidden" name="event" id="event" />
            
            <input type="hidden" name="TrxId" id="TrxId" value="<%=ob.getTransactionID ()%>" />
            
            <input type="hidden" name="<%=ShareCounterConstants.OFFSET%>" id="<%=ShareCounterConstants.OFFSET%>"  />
            
            <input type="hidden" name="<%=ShareCounterConstants.GROUP_STOCK_TYPE%>" value="<%=group.getStockType() %>" />
        </form>
        </td>
        </tr>
        <tr>
        <td height="25">
	        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
	            <tr>
	                <td valign="middle">
	                    <integro:pageindex pageIndex="<%=new PageIndex( offset.intValue () , length.intValue () ,  paramsSize ) %>" url="MaintainShareCounter.do" submitFlag="true" />
	                </td>
	            </tr>
	        </table>
        </td>
        </tr>
        </table>
        
    </body>
    
</html>