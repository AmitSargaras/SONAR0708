<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
PreDealSearchRecord record = ( PreDealSearchRecord ) request.getAttribute ( PreDealConstants.PRE_DEAL_RECORD ) ;

%>

<html>
    
    <head>
        
        
        <script type="text/javascript">
		<!--

			function submit ()
			{
			 	var form = document.getElementById( 'form' ) ;

				form.event.value  = '<%= PreDealConstants.EVENT_MAKER_SUBMIT_TRANSFER %>' ;

				form.submit () ;
			}

			function cancel()
			{
				var form = document.getElementById( 'form' ) ;

				form.event.value = '<%= PreDealConstants.EVENT_MAKER_VIEW_EAR_MARK %>' ;

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
        
        <table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
            
            <thead>
                
                <tr>
                    <td>
                        
                        <h3>
                            Acknowledgement
                        </h3>
                        
                        <br/>
                        
                        Transfer of Ear-marking Shares Into &quot;Holding Area&quot;
                        
                        <span class="style1">
                            *
                        </span>
                        
                        <br/>
                        
                        <br/>
                        
                        <br/>
                        
                        <strong>
                            Click "Submit" to confirm your transfer transaction into holding area
                        </strong>
                        
                    </td>
                    
                </tr>
                
                <tr>
                    <td>
                        
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <hr/>
                    </td>
                </tr>
                
            </thead>
            
        </table>
        
        <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            
            <thead>
                
                <tr>
                    
                    <td width="16%">
                        <bean:message key="label.predeal.cust.name"/>
                    </td>
                    
                    <td width="11%">
                        <bean:message key="label.predeal.source.sys"/>
                    </td>
                    
                    <td width="11%">
                        <bean:message key="label.predeal.aa.num"/>
                    </td>
                                        
                    <td width="11%">
                        <bean:message key="label.predeal.sec.id"/>
                    </td>
                    
                    <td width="27%">
                        <bean:message key="label.predeal.counterName"/>
                    </td>
                    
                    <td width="11%">
                         <bean:message key="label.predeal.stock.code"/>
                    </td>
                                        
                    <td width="13%">
                        <bean:message key="label.predeal.earmarking.units"/>
                    </td>
                    
                </tr>
                
            </thead>
            
            <tbody>
                
                <tr class="even">
                    
                    <td>
                        <bean:write name="PreDealForm" property="customerName" />
                    </td>
                    
                    <td>
                        <bean:write name="PreDealForm" property="sourceSystem" />
                    </td>                
                    
                    <td>
                        <bean:write name="PreDealForm" property="aaNumber" />
                    </td>
                    
                    <td>
                        <bean:write name="PreDealForm" property="securityId" />
                    </td>
                    
                    
                    <td>
                        <integro:empty-if-null value="<%= record.getName () %>" />
                    </td>

                    <td>
                        <integro:empty-if-null value="<%= record.getStockCode () %>" />
                    </td>
                                        
                    <td>
                        <bean:write name="PreDealForm" property="earMarkUnits" />
                    </td>
                    
                </tr>
                
            </tbody>
            
        </table>
        
        <br />
        
        <table class="tblFormSection" align="center" width="98%">
            <tr >
                <td>
                    * &quot;Holding Area&quot; refers to ear-marking shares which are held while pending documentation perfection.
                </td>
            </tr>
        </table>
        
        <br />
        
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
                    
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','/cms/img/submit2.gif',1)" onClick="submit()" >
                        <img src="/cms/img/submit1.gif" name="Image4411"  border="0" id="Image4411" />
                    </a>
                    
                </td>
                
                <td width="100" valign="baseline" align="center">
                    
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','/cms/img/cancel2.gif',1)" onclick="cancel()" >
                        <img src="/cms/img/cancel1.gif" name="Image4413"  border="0" id="Image4413" />
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
        
        <html:form action="PreDeal.do" styleId="form" >
            
            <html:hidden property="event" />
            
            <html:hidden property="feedId" value="<%= String.valueOf ( record.getFeedId () ) %>" /> 
            
        </html:form>
        
    </body>
    
</html>
