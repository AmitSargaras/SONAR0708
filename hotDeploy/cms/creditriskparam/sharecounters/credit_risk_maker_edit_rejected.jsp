<%@ page import="com.integrosys.cms.ui.creditriskparam.sharecounter.ShareCounterConstants"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.bus.ICreditRiskParamGroup"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.bus.OBCreditRiskParam"%>
<%@ page import="com.integrosys.cms.app.creditriskparam.trx.OBCreditRiskParamGroupTrxValue"%>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
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



OBCreditRiskParamGroupTrxValue ob = ( OBCreditRiskParamGroupTrxValue ) request.getAttribute ( ShareCounterConstants.CREDIT_RISK_PARAM_TRX_VALUE ) ;
ICreditRiskParamGroup group = ob.getStagingCreditRiskParamGroup () ;
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

String title  = ob.getCreditRiskParamGroup ().getSubTypeDescription () + " - " + ob.getCreditRiskParamGroup ().getStockTypeDescription () ;
Integer offset = (Integer)  request.getAttribute ( ShareCounterConstants.OFFSET );
Integer length = (Integer)  request.getAttribute ( ShareCounterConstants.LENGTH );



Collection boardValues = ( Collection ) request.getAttribute ( ShareCounterConstants.BOARD_TYPE_VALUES ) ;
Collection boardLabels = (Collection) request.getAttribute ( ShareCounterConstants.BOARD_TYPE_LABELS ) ;

Collection shareValues = ( Collection ) request.getAttribute ( ShareCounterConstants.SHARE_STATUS_VALUES ) ;
Collection shareLabels = (Collection) request.getAttribute ( ShareCounterConstants.SHARE_STATUS_LABELS ) ;



boardValues =  CommonDataSingleton.getCodeCategoryValues ( ShareCounterConstants.BOARD_TYPE , null , null , ob.getCreditRiskParamGroup ().getSubType () ) ;
boardLabels = CommonDataSingleton.getCodeCategoryLabels ( ShareCounterConstants.BOARD_TYPE , null , null , ob.getCreditRiskParamGroup ().getSubType () ) ;


shareValues =  CommonDataSingleton.getCodeCategoryValues ( ShareCounterConstants.SHARE_STATUS , null , null , ob.getCreditRiskParamGroup ().getSubType () ) ;
shareLabels = CommonDataSingleton.getCodeCategoryLabels ( ShareCounterConstants.SHARE_STATUS , null , null , ob.getCreditRiskParamGroup ().getSubType () ) ;    


%>


<html>
    
    <head>
        
        <script type="text/javascript" >
		<!--

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
				location.href = "ToDo.do" ;
			}


			function goPageIndex(targetOffset)
			{
				document.getElementById( 'event' ).value = '<%=ShareCounterConstants.SHARE_COUNTER_MAKER_PAGINATE_REJECTED%>'  ;

				document.getElementById( 'offset' ).value = targetOffset ;

				document.getElementById( 'form' ).submit() ;
			}

                        
                        function refresh () 
                        {
				document.getElementById( 'event' ).value = '<%=ShareCounterConstants.SHARE_COUNTER_MAKER_REFRESH_REJECTED%>'  ;

				document.getElementById( 'offset' ).value = <%=offset.intValue ()%> ;

				document.getElementById( 'form' ).submit() ;
                        }                                

		//-->
        </script>
        
        <title>
            Credit Risk Parameter
        </title>
        
    </head>
    
    <body>
    	<form action="MaintainShareCounter.do" method="POST" id="form" >
        <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
        	<tr>
        	<td valign="top">        
            
            <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <thead>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h3>
                                <%= title %>
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
            
            <table width="95%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInput">
                
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

                        <% if (group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_WARRANTS) || 
                            		group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_LOAN_STOCKS)) { 
                            %>
                        <td width="10%">
                            <!--MOA-->
                            <bean:message key="label.moa"/>
                        </td>
                        <% } %>                            
                    </tr>
                    
                </thead>
                
                <tbody>
                    
                    <%
                    
                    OBCreditRiskParam[] params = group.getFeedEntries () ;
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
                        
                        String error3 = "marginOfAdvance" + count;
                        count ++ ;
                    
                    %>
                    <tr class=" <%= odd ? "odd" : "even" %>">
                        
                        <td width="2%" align="center" class="index" >
                            <%= loop + 1 %>
                        </td>
                        
                        <td width="5%" align="center" >
                            <integro:empty-if-null value="<%= params[ loop ].getIsinCode () %>" />
                        </td>
                        
                        <td width="5%" align="center" >
                            <integro:empty-if-null value="<%= params[ loop ].getRic () %>" />
                        </td>
                        
                        <td width="8%" align="center" >
                            <input type="checkbox" name="dummythree" id="dummythree<%=loop%>" onclick="changedHiddenField( 'isFi<%=loop%>' , this )" value="Y" <%= isFi ? "checked=\"checked\"" : "" %> />
                            
                            <%
                            if ( isFi )
                            {
                            %>
                            <!--<img src="img/tick(black).gif" alt="" />-->
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
                        
                        <td >
                            
                            <select name="paramBoardType" onchange="refresh()" >
                                
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
                                
                                <option value="" >
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
                            
                        </td>
                        
                        <td width="8%" align="center" >
                            <input type="checkbox" name="dummyone" id="dummyone<%=loop%>" onclick="changedHiddenFieldAndRefresh( 'isIntSuspend<%=loop%>' , this ) ; refresh () ;" value="Y" <%= isSuspended ? "checked=\"checked\"" : "" %> />
                        </td>
                        
                        <td width="5%" align="center" >
                            <input type="checkbox" name="dummytwo" id="dummytwo<%=loop%>" onclick="changedHiddenField( 'isLiquid<%=loop%>' ,  this ) " value="Y" <%= isLiquid ? "checked=\"checked\"" : "" %> />
                        </td>
                        	<%  if (group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_WARRANTS) || 
                            		group.getStockType().equals(ShareCounterConstants.GROUP_STOCK_TYPE_LOAN_STOCKS)) { 
                            %>
                                <td width="5%" align="center">
                                	<input type="text" name="marginOfAdvance" size="4" id="marginOfAdvance<%=loop%>" value="<%=params[loop].getMarginOfAdvance() %>" />%
                                	<html:errors property="<%=error3%>" />
                            	</td>
                            <% } %>  
                        

                            <input type="hidden" name="isIntSuspend" id="isIntSuspend<%=loop%>" value="<%=isSuspended ? "Y" : "N" %>" />
                            
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
            </td>
            </tr>
            <tr>
            <td>
            <br/>
            <input type="hidden" name="TrxId" id="TrxId" value="<%= ob.getTransactionID () %>" />
            
            <input type="hidden" name="event" id="event" value="<%=ShareCounterConstants.SHARE_COUNTER_MAKER_UPDATE_REJECTED%>" />
            
            <%-- the value of ShareCounterConstants.OFFSET is 'offset' --%>
            <input type="hidden" name="<%=ShareCounterConstants.OFFSET%>" id="<%=ShareCounterConstants.OFFSET%>"  />
            
            <input type="hidden" name="<%=ShareCounterConstants.CURRENT_OFFSET_NUMBER%>" value="<%= offset.toString () %>"  />
            
            <table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                
                <tbody>
                    
                    <tr>
                        
                        <td class="fieldname">
                            Remarks
                        </td>
                        
                        <td class="odd">
                            <textarea name="remarks" id="remarks" rows="4" cols="80" ></textarea>
                        </td>
                        
                    </tr>
                    
                    <tr>
                        
                        <td class="fieldname">
                            Last Action By
                        </td>
                        
                        <td class="even">
                            &nbsp;<%=lastActionBy%>
                        </td>
                        
                    </tr>
                    
                    <tr class="odd">
                        
                        <td class="fieldname">
                            Last Remarks Made
                        </td>
                        
                        <td>
                            <integro:wrapper value="<%=remarks%>" />&nbsp;
                        </td>
                        
                    </tr>
                    
                </tbody>
                
            </table>
           </td>
           </tr>
           <tr>
            <td valign="top" height="80%">
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
                        
                        <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','img/cancel2.gif',1)" >
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
            <tr>
        	<td height="25">
		        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
		            <tr>
		                <td valign="middle">
		                    <integro:pageindex pageIndex="<%=new PageIndex( offset.intValue () , length.intValue () ,  params.length ) %>" url="MaintainShareCounter.do" submitFlag="true" />
		                </td>
		            </tr>
		        </table>
        	</td>
        	</tr>
        	</table>
         </form>       
    </body>
    
</html>