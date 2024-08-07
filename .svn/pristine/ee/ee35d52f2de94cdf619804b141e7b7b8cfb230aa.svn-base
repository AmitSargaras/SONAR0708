<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord"%>
<%@ page import="com.integrosys.cms.app.predeal.proxy.PreDealProxyManagerFactory" %>
<%@ page import="com.integrosys.cms.app.predeal.trx.OBPreDealTrxValue" %>
<%@ page import="com.integrosys.cms.app.predeal.proxy.IPreDealProxy" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
PreDealSearchRecord record = ( PreDealSearchRecord ) request.getAttribute ( PreDealConstants.PRE_DEAL_RECORD ) ;
String earMarkID = request.getParameter ( PreDealConstants.EARMARK_ID  ) ;
IPreDealProxy proxy = PreDealProxyManagerFactory.getIPreDealProxy () ;
OBPreDealTrxValue value = (OBPreDealTrxValue) proxy.getEarByEarMarkId ( earMarkID ) ;
%>

<html>
    
    <head>
        
        <script type="text/javascript">
		<!--

			function submit ()
			{
			 	var form = document.getElementById( 'form' ) ;

				form.event.value  = '<%= PreDealConstants.EVENT_MAKER_SUBMIT_RELEASE %>' ;

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
                        
                        <br/>
                        
                        <br/>
                        
                        <br/>
                        
                        <STRONG>
                            Please verify the following details:
                        </STRONG>
                        
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
            <input type="hidden" name="<%=PreDealConstants.EARMARK_ID%>" value="<%=earMarkID%>"/>
            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
                
                <thead>
                    
                    <tr>
                        
                        <!--Customer Name-->
                        <td width="12%">
                            <bean:message key="label.predeal.cust.name"/>
                        </td>
                        
                        <!--Source System-->
                        <td width="8%">
                            <bean:message key="label.predeal.source.sys"/>
                        </td>
                                                
                        <!--AA Number-->
                        <td width="8%">
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
                            <integro:empty-if-null value="<%=value.getPreDeal().getCustomerName()%>" />
                        </td>
                        
                        <td>
                            <integro:empty-if-null value="<%=value.getPreDeal().getSourceSystem()%>" />
                        </td>
                        
                        <td>
                            <integro:empty-if-null value="<%=value.getPreDeal().getAaNumber()%>" />
                        </td>

                        <td>
                            <integro:empty-if-null value="<%=value.getPreDeal().getSecurityId()%>" />
                        </td>

                        <td>
                            <integro:empty-if-null value="<%= record.getName () %>" />
                        </td>
                        
                        <td>
                            <integro:empty-if-null value="<%= record.getStockCode () %>" />
                        </td>                        

                        <td>
                            <integro:empty-if-invalid displayForInvalid="-" value="<%=value.getPreDeal().getEarMarkUnits()%>" />
                        </td>

                        <td>
                            <html:radio property="releaseStatus" value="cancel" >
                                Cancel Ear-marking
                            </html:radio>

                            <br/>

                            <html:radio property="releaseStatus" value="confirm"  >
                                Security Confirmed Legally Enforceable
                            </html:radio>

                            <br />

                            <html:errors property="releaseStatus" />

                        </td>

                        <td>
                            <html:radio property="infoCorrectInd" value="true" >
                                Correct Information
                            </html:radio>

                            <br/>

                            <html:radio property="infoCorrectInd" value="false" >
                                Incorrect Information
                            </html:radio>

                            <br/>

                            <html:errors property="infoCorrectInd" />

                        </td>
                        
                    </tr>
                    
                </tbody>
                
            </table>
            
            <br />
            
            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                
                <tbody>
                    
                    <tr>
                        
                        <td width="0%" valign="top" class="fieldname">
                            
                            <span class="style2">
                                *
                            </span>
                            
                            Remarks
                        </td>
                        
                        <td valign="top" class="even">
                            
                            <span class="odd">
                                
                                <html:textarea property="infoIncorrectDetails" cols="100" rows="5" />
                                
                            </span>
                            
                            <br/>
                            
                            <html:errors property="infoIncorrectDetails" />
                            
                            <br/>
                            
                            <br/>
                            
                            (Please state correct details if the above information is not correct)
                            
                        </td>
                        
                    </tr>
                    
                </tbody>
                
            </table>
            
            <html:hidden property="event" />
            
            <html:hidden property="feedId" value="<%= String.valueOf ( record.getFeedId () ) %>" /> 

        </html:form>
        
        <br />
        
        <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
            
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
        
    </body>
    
</html>