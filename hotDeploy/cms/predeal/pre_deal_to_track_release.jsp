<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord"%>
<%@ page import="com.integrosys.cms.app.predeal.trx.OBPreDealTrxValue"%>
<%@ page import="com.integrosys.cms.ui.predeal.PreDealForm"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
PreDealSearchRecord record = (PreDealSearchRecord) request.getAttribute ( PreDealConstants.PRE_DEAL_RECORD ) ;
OBPreDealTrxValue trxValue = (OBPreDealTrxValue) request.getAttribute ( PreDealConstants.OB_PRE_DEAL_TRX_VALUE ) ;
PreDealForm form = (PreDealForm)request.getAttribute ( PreDealConstants.PRE_DEAL_FROM ) ;


String remarks = trxValue.getRemarks ();
String lastActionBy = trxValue.getUserInfo ();

if( lastActionBy == null )
{
    lastActionBy = "";
}

if ( remarks == null )
{
    remarks= "";
}


%>

<html>
    
    <head>
        
        <title>
            <!-- Pre-Deal -->
            <bean:message key="title.pre.deal"/>
        </title>
        
    </head>
    
    
    <body>
        
        <table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
            
            <thead>
                
                <tr>
                    
                    <td>
                        
                        <h3>
                            Acknowledgement
                        </h3>
                        
                        <br/>
                        
                        <span class="style1">
                            Release of Ear-marking Shares Into Bank's Actual Holdings
                        </span>
                        
                    </td>
                    
                </tr>
                
                <tr>
                    <td>
                        <hr/>
                    </td>
                </tr>
                
            </thead>
            
        </table>
        
        <html:form action="PreDeal.do" styleId="form" >
            
            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
                
                <thead>
                    
                    <tr>
                        
                        <!--Customer Name-->
                        <td width="12%">
                            <bean:message key="label.predeal.cust.name"/>
                        </td>
                        
                        <!--Source System-->
                        <td width="10%">
                            <bean:message key="label.predeal.source.sys"/>
                        </td>
                                                
                        <!--AA Number-->
                        <td width="10%">
                            <bean:message key="label.predeal.aa.num"/>
                        </td>
                        
                        <!--Security ID-->
                        <td width="8%">
                            <bean:message key="label.predeal.sec.id"/>
                        </td>
                        
                        <!--Counter Name-->
                        <td width="10%">
                            <bean:message key="label.predeal.counterName"/>
                        </td>
                        
                        <!--Stock Code-->
                        <td width="5%">
                            <bean:message key="label.predeal.stock.code"/>
                        </td>
                                                
                        <!--Ear-marking Unit-->
                        <td width="8%">
                            <bean:message key="label.predeal.earmarking.units"/>
                        </td>
                        
                        <!--Release-->
                        <td width="24%">
                            <bean:message key="label.predeal.release"/>
                        </td>
                        
                        <!--Action-->
                        <td width="18%">
                            <bean:message key="label.predeal.action"/>
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
                        
                        <td>
                            <%
                            if ( "cancel".equalsIgnoreCase ( form.getReleaseStatus () ) )
                            {
                            %>
                            Cancel Ear-marking
                            <%
                            }
                            else if ( "confirm".equalsIgnoreCase ( form.getReleaseStatus () ) )
                            {
                            %>
                            Security Confirmed Legally Enforceable
                            <%
                            }
                            %>
                            
                        </td>
                        
                        <td>
                            
                            <%
                            if ( form.getInfoCorrectInd () )
                            {
                            %>
                            Correct Information
                            <%
                            }
                            else
                            {
                            %>
                            Incorrect Information
                            <%
                            }
                            %>
                        </td>
                        
                    </tr>
                    
                </tbody>
                
            </table>
            
            <br />
            
            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                
                <tbody>
                    
                    <tr>
                        
                        <td width="0%" valign="top" class="fieldname">
                            
                            Remarks about incorrect information
                            
                        </td>
                        
                        <td valign="top" class="even">
                            
                            <span class="odd">
                                
                                <html:textarea property="infoIncorrectDetails" cols="100" rows="5" readonly="true"/>
                                
                            </span>
                            
                            <br/>
                            
                            <br/>
                            
                        </td>
                        
                    </tr>
                    
                </tbody>
                
            </table>
            
        </html:form>
        
        <br />
        
        <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
            
            <tr>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
            </tr>
            
            <tr>
                
                <td width="100%" valign="baseline" align="center"> 
                    
                    <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
                        <img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" />
                    </a>
                    
                </td>
                
            </tr>
            
            <tr>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
            </tr>
            
        </table>        
        
    </body>
    
</html>