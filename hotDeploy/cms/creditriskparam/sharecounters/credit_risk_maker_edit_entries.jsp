
<%@ page import="com.integrosys.cms.ui.creditriskparam.sharecounter.ShareCounterConstants"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.bus.ICreditRiskParamGroup"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.bus.OBCreditRiskParam"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.trx.OBCreditRiskParamGroupTrxValue"%>
<%@ page import="com.integrosys.cms.ui.creditriskparam.sharecounter.ShareCounterForm"%>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@ page import="com.integrosys.base.techinfra.util.AccessorUtil"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
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


Collection boardValues = (Collection) request.getAttribute ( ShareCounterConstants.BOARD_TYPE_VALUES ) ;
Collection boardLabels = (Collection) request.getAttribute ( ShareCounterConstants.BOARD_TYPE_LABELS ) ;

Collection shareValues = (Collection) request.getAttribute ( ShareCounterConstants.SHARE_STATUS_VALUES ) ;
Collection shareLabels = (Collection) request.getAttribute ( ShareCounterConstants.SHARE_STATUS_LABELS ) ;

OBCreditRiskParamGroupTrxValue ob = ( OBCreditRiskParamGroupTrxValue ) request.getAttribute ( ShareCounterConstants.CREDIT_RISK_PARAM_TRX_VALUE ) ;
ICreditRiskParamGroup group = null;
boolean noRecord = false;
String title  = "";
Integer offset = null;
Integer length = null;

if ( ob == null )
{
    noRecord = true;
}
else
{
    group = ob.getCreditRiskParamGroup () ;
    
    title  =  ( group.getSubTypeDescription () == null ? "" : group.getSubTypeDescription () ) + " - " + ( group.getStockTypeDescription () == null ? "" : group.getStockTypeDescription () ) ;
    
    offset = (Integer)  request.getAttribute ( ShareCounterConstants.OFFSET );
    length = (Integer)  request.getAttribute ( ShareCounterConstants.LENGTH );
    
    if ( group == null || group.getFeedEntries () == null || group.getFeedEntries ().length <= 0  )
    {
        noRecord = true ;
    }
    else
    {
        noRecord = false ;
        
        DefaultLogger.debug(this, "group.getStockType() : " + group.getStockType());
        
        boardValues =  CommonDataSingleton.getCodeCategoryValues ( ShareCounterConstants.BOARD_TYPE , null , null , group.getSubType () ) ;
        boardLabels = CommonDataSingleton.getCodeCategoryLabels ( ShareCounterConstants.BOARD_TYPE , null , null , group.getSubType () ) ;
        
        
        shareValues =  CommonDataSingleton.getCodeCategoryValues ( ShareCounterConstants.SHARE_STATUS , null , null , group.getSubType () ) ;
        shareLabels = CommonDataSingleton.getCodeCategoryLabels ( ShareCounterConstants.SHARE_STATUS , null , null , group.getSubType () ) ;
        
    }
    
    
}



%>


<html>
    
    <head>
        
        <script type="text/javascript" >
		<!--

			function submitOnSelect( optionDom )
			{
				if ( optionDom.selectedIndex > 0 )
				{
					document.getElementById( 'form' ).submit() ;
				}
			}

			function changedHiddenField( id , checkBox )
			{
				if ( checkBox.checked )
				{
					document.getElementById( id ).value = 'Y' ;
				}
				else
				{
					document.getElementById( id ).value = 'N' ;
				}                                                                                                
			}
      
                        function changedHiddenFieldAndRefresh( id , checkBox )
			{
				if ( checkBox.checked )
				{
					document.getElementById( id ).value = 'Y' ;
				}
				else
				{
					document.getElementById( id ).value = 'N' ;
				}
                                                                
                                refresh () ;                                
			}                        
                        
			function submit()
			{
				document.getElementById( 'form' ).submit() ;
			}

			function cancel()
			{
				location.href = "MaintainShareCounter.do?event=maker_share_counter_start" ;
			}


			function goPageIndex(targetOffset)
			{
				document.getElementById( 'event' ).value = '<%=ShareCounterConstants.SHARE_COUNTER_MAKER_PAGINATE%>'  ;

				document.getElementById( 'offset' ).value = targetOffset ;

				document.getElementById( 'form' ).submit() ;
			}
                        
                        function refresh () 
                        {
				document.getElementById( 'event' ).value = '<%=ShareCounterConstants.SHARE_COUNTER_MAKER_REFRESH%>'  ;

				document.getElementById( 'offset' ).value = <%=offset.intValue ()%> ;

				document.getElementById( 'form' ).submit() ;
                        }                        


		//-->
        </script>
        
        <title>
            <!--Credit Risk Parameter-->
            <bean:message key="title.credit.risk.param"/>
        </title>
        
    </head>
    
    <body>
    	<html:form action="MaintainShareCounter.do" method="POST" styleId="form" >
        <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
        <tr>
			<td valign="top"><p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p></td>
        </tr>
		<tr>
        <td valign="top">
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <h3><integro:empty-if-null value="<%=title%>" /></h3>
                        </td>
                    </tr>                    
                    <tr>
                        <td><hr></td>
                    </tr>
                </thead>
            </table>
            </td>
            </tr>
            <tr>
            <td valign="top">
            <table width="95%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInput">
                <thead>
                    <tr align="center" >
                        <td width="2%" >                            
                            <bean:message key="label.global.sn"/>
                        </td>
                        <td width="5%">
                            ISIN
                        </td>
                        <!--<td width="5%">-->
                        <%--<bean:message key="label.stock.code"/>--%>
                        <!--</td>-->

                        <td width="3%">
                            <bean:message key="label.ric"/>
                        </td>
                        
                        <td width="6%">
                            <bean:message key="label.fi.indicator"/>
                        </td>
                        
                        <td width="15%">
                            <bean:message key="label.counter.name"/>
                        </td>
                        
                        <td width="4%">
                            <bean:message key="label.ccy"/>
                        </td>
                        
                        <td width="6%">
                            <!--Board Type-->
                            <bean:message key="label.board.type"/>
                        </td>
                        
                        <td width="10%">
                            <bean:message key="label.acceptable.or.unacceptable"/>
                        </td>
                        
                        <td width="5%">
                            <bean:message key="label.share.status"/>
                        </td>
                        
                        <td width="5%">
                            <bean:message key="label.suspend.for.internal.use"/>
                        </td>
                        
                        <td width="5%">
                            <bean:message key="label.liquid.or.illiquid"/>
                        </td>

                        <% if (group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_WARRANTS) || 
                            		group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_LOAN_STOCKS)) { 
                            %>
                        <td width="10%">
                            <bean:message key="label.moa"/>
                        </td>
                        <% } %>                      
                    </tr>
                    
                </thead>
                
                <tbody>
                    
                    <%
                    if (!noRecord)
                    {
    OBCreditRiskParam[] params = group.getFeedEntries () ;
    
    ShareCounterForm form = (ShareCounterForm)request.getAttribute ( ShareCounterConstants.SHARE_COUNTER_FORM ) ;
    
    
    DefaultLogger.debug ( this , " IS null ? : "  + ( form == null ) ) ;
    DefaultLogger.debug ( this , " Offset : "  + offset.intValue () ) ;
    DefaultLogger.debug ( this , " length.intValue () : "  + length.intValue () ) ;
    DefaultLogger.debug ( this , " params.length : "  + params.length ) ;
    
    
    boolean odd = true ;
    boolean isSuspended ;
    boolean isLiquid ;
    boolean isFi ;
    int count = 0 ;
    
    for ( int loop = offset.intValue () ; loop < params.length && loop < offset.intValue () + length.intValue () ; loop ++ )
    {
        isFi = params[ loop ].getIsFi () != null && params[ loop ].getIsFi ().equals ( "Y" ) ;
        isLiquid = params[ loop ].getIsLiquid () != null && params[ loop ].getIsLiquid ().equals ( "Y" ) ;
        isSuspended = params[ loop ].getIntSuspend () != null && params[ loop ].getIntSuspend ().equals ( "Y" ) ;
        
        
        String error1 = "shareStatus" + count ;
        String error2 = "boardType" + count ;
        String error3 = "marginOfAdvance" + count;
        
        count ++ ;
                    
                    
                    
                    %>
                    <tr class=" <%= odd ? "odd" : "even" %>">
                        
                        <td class="index" >
                            <%= loop + 1 %>
                        </td>
                        
                        <td >
                            <integro:empty-if-null value="<%= params[ loop ].getIsinCode () %>" />
                        </td>
                        
                        <td >
                            <integro:empty-if-null value="<%= params[ loop ].getRic () %>" />
                        </td>
                        
                        <td >
                            <input type="checkbox" name="dummythree" id="dummythree<%=loop%>" onclick="changedHiddenField( 'isFi<%=loop%>' , this )" value="Y" <%= isFi ? "checked=\"checked\"" : "" %> />
                        </td>
                        
                        <td >
                            <integro:empty-if-null value="<%= params[ loop ].getName () %>" />
                        </td>
                        
                        <td >
                            <integro:empty-if-null value="<%= params[ loop ].getCurrencyCode () %>" />
                        </td>
                        
                        <td >
                            
                            <select name="paramBoardType" onchange="refresh()">
                                
                                <option value = ""  >
                                    <bean:message key="label.please.select.option"/>
                                </option>                                
                                
                                <%
                                Iterator boardLabelIter = boardLabels.iterator () ;
                                Iterator boardValueIter = boardValues.iterator () ;
                                String currentBoard =  params[ loop ].getParamBoardType () ;
                                
                                while ( boardLabelIter.hasNext () )
                                {
                                    
                                    String currentLabel = (String) boardLabelIter.next () ;
                                    String currentValue = (String) boardValueIter.next () ;
                                
                                %>                                
                                <option value="<%=currentValue%>" <%= currentValue.equalsIgnoreCase ( currentBoard ) ? "selected=\"selected\"" : "" %> >
                                    <%= currentLabel %>
                                </option>
                                
                                <%
                                }     
                                %>
                                
                            </select>
                            
                            <html:errors property="<%=error2%>" />
                            
                        </td>
                        
                        <td >                            
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
                        
                        <td >
                            
                            <select name="paramShareStatus" onchange="refresh()" >
                                
                                <option value = "" >
                                    <bean:message key="label.please.select.option"/>
                                </option>
                                
                                <%
                                
                                Iterator shareLabelIter = shareLabels.iterator () ;
                                Iterator shareValueIter = shareValues.iterator () ;
                                String currentShare = params[ loop ].getParamShareStatus () ;
                                
                                while ( shareLabelIter.hasNext () && shareValueIter.hasNext () )
                                {
                                    
                                    
                                    String currentLabel2 = (String) shareLabelIter.next () ;
                                    String currentValue2 = (String) shareValueIter.next () ;
                                
                                %>
                                <option value="<%=currentValue2%>" <%= currentValue2.equalsIgnoreCase ( currentShare ) ? "selected=\"selected\"" : "" %> >
                                    <%= currentLabel2 %>
                                </option>
                                
                                <%
                                }
                                %>
                                
                            </select>
                            
                            <html:errors property="<%=error1%>" />
                            
                        </td>
                        
                        <td >
                            <input type="checkbox" name="dummyone" id="dummyone<%=loop%>" onclick="changedHiddenFieldAndRefresh( 'isIntSuspend<%=loop%>' , this ) " value="Y" <%= isSuspended ? "checked=\"checked\"" : "" %> />
                        </td>
                        
                        <td >
                            <input type="checkbox" name="dummytwo" id="dummytwo<%=loop%>" onclick="changedHiddenField( 'isLiquid<%=loop%>' , this ) " value="Y" <%= isLiquid ? "checked=\"checked\"" : "" %> />
                        </td>
                        <%  if (group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_WARRANTS) || 
                            		group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_LOAN_STOCKS)) { 
                            %>
                                <td >
                                	<input type="text" name="marginOfAdvance" size="4" id="marginOfAdvance" value="<%=params[loop].getMarginOfAdvance() %>" />%
                                	<html:errors property="<%=error3%>" />
                            	</td>
                            <% } %>                        
     
                            <input type="hidden" name="isIntSuspend" id="isIntSuspend<%=loop%>" value="<%= isSuspended ? "Y" : "N"  %>" />
                            
                            <input type="hidden" name="isLiquid" id="isLiquid<%=loop%>" value="<%= isLiquid ? "Y" : "N" %>" />
                            
                            <input type="hidden" name="isFi" id="isFi<%=loop%>" value="<%= isFi ? "Y" : "N" %>" />
                            
                            <input type="hidden" name="parameterId" value="<%= Long.toString ( params[ loop ].getParameterId () ) %>" />
                            
                            <input type="hidden" name="parameterType" value="<%= params[ loop ].getParameterType () == null ? "" : params[ loop ].getParameterType () %>" />
                            
                            <input type="hidden" name="status" value="<%= params[ loop ].getStatus () == null ? "" :  params[ loop ].getStatus () %>" />
                            
                            <input type="hidden" name="versionTime" value="<%= Long.toString ( params[ loop ].getVersionTime () ) %>" />
                            
                            <input type="hidden" name="feedId" value="<%= Long.toString ( params[ loop ].getFeedId () ) %>" />
                            
                            <input type="hidden" name="parameterRef" value="<%= Long.toString ( params[ loop ].getParameterRef () ) %>" />

                    </tr>
                    
                    <%
                    odd = !odd ;
    }
                    %>
                    
                </tbody>
                
            </table>
            
            <input type="hidden" name="event" id="event" value="<%=ShareCounterConstants.SHARE_COUNTER_MAKER_UPDATE%>" />
            
            <%-- the value of ShareCounterConstants.OFFSET is 'offset' --%>
            <input type="hidden" name="<%=ShareCounterConstants.OFFSET%>" id="<%=ShareCounterConstants.OFFSET%>"  />
            
            <input type="hidden" name="<%=ShareCounterConstants.CURRENT_OFFSET_NUMBER%>" value="<%= offset.toString () %>"  />
            
            </td>
            </tr>
            <tr>
            <td height="70%" valign="top">
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
                    
                    <td width="100" valign="baseline" align="center">
                        
                        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)" onClick="submit()" >
                            <img src="img/submit1.gif" name="Image4411"  border="0" id="Image4411" />
                        </a>
                        
                    </td>
                    
                    <td width="100" valign="baseline" align="center">
                        
                        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','img/cancel2.gif',1)" onclick="cancel()" >
                            <img src="img/cancel1.gif" name="Image4413"  border="0" id="Image4413" />
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
                    
                </tr>
                
            </table>
            
            </td>
            </tr>
			<tr><td height="25">

	            <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
	                <tr>
	                    <td valign="middle">
	                        <integro:pageindex pageIndex="<%=new PageIndex( offset.intValue () , length.intValue () ,  params.length ) %>" url="MaintainShareCounter.do" submitFlag="true" />
	                    </td>
	                </tr>
	            </table>
				</td></tr>
			</table>

            <%
                    }
                    else
                    {
            %>
            <td colspan="15">
                <bean:message key="label.global.not.found"/>
            </td>
            </tbody>
            </table>
            
            <b/>
            <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0">
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><font size="-2">* FI - Financial Institutions</font></td>
                </tr>
            </table>
            <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="baseline" align="center">&nbsp;</td>
                    <td valign="baseline" align="center">&nbsp;</td>
                </tr>
                <tr>
                    <td width="100" valign="baseline" align="center">
                        <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4415','','img/return2.gif',1)" onclick="cancel()" >
                            <img src="img/return1.gif" name="Image4415"  border="0" id="Image4415" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td valign="baseline" align="center">&nbsp;</td>
                    <td valign="baseline" align="center">&nbsp;</td>
                </tr>
            </table>
            
            <%
            }
            %>
        </html:form>
        
    </body>
    
</html>