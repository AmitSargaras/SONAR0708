<%@ page import="com.integrosys.cms.ui.predeal.PreDealConstants"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.PreDealSearchRecord"%>
<%@ page import="com.integrosys.cms.app.predeal.trx.OBPreDealTrxValue"%>
<%@ page import="com.integrosys.cms.app.predeal.bus.OBPreDeal"%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
PreDealSearchRecord record = (PreDealSearchRecord) request.getAttribute ( PreDealConstants.PRE_DEAL_RECORD ) ;

OBPreDealTrxValue trxValue = (OBPreDealTrxValue) request.getAttribute ( PreDealConstants.OB_PRE_DEAL_TRX_VALUE ) ;

String remarks = trxValue.getRemarks ();
String lastActionBy = trxValue.getUserInfo ();

OBPreDeal ob = (OBPreDeal) trxValue.getStagingPreDeal();
OBPreDeal original = (OBPreDeal) trxValue.getPreDeal();

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
        
        <script type="text/javascript">
		<!--

			function submit ()
			{
			 	var form = document.getElementById( 'form' ) ;

				form.event.value  = '<%= PreDealConstants.EVENT_CHECKER_APPROVE %>' ;

				form.submit () ;
			}

			function reject ()
			{
				var form = document.getElementById( 'form' ) ;

				form.event.value  = '<%= PreDealConstants.EVENT_CHECKER_REJECT %>' ;

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
        
        <html:form action="PreDeal.do" styleId="form" >
            
            <table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
                
                <thead>
                    
                    <tr>
                        
                        <td>
                            <h3>
                                Acknowledgement
                            </h3>
                            
                            <br/>
                            
                            <br/>
                            
                            <strong>
                                Click approve to confirm deletion
                            </strong>
                            
                        </td>
                        
                    </tr>
                    
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <hr/>
                        </td>
                    </tr>
                    
                </thead>
                
            </table>
            
            <br />
            
            <table width="98%" align="center" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                
                <thead>
                    
                    <tr>
                        
                        <!--Customer Name-->
                        <td>
                            <bean:message key="label.predeal.cust.name"/>
                        </td>

                        <!--Source System-->
                        <td>
                            <bean:message key="label.predeal.source.sys"/>
                        </td>
                                                
                        <!--AA Number-->
                        <td>
                            <bean:message key="label.predeal.aa.num"/>
                        </td>
                        
                        <!--Security ID-->
                        <td>
                            <bean:message key="label.predeal.sec.id"/>
                        </td>
                        
                        <!--Counter Name-->
                        <td>
                            <bean:message key="label.predeal.counterName"/>
                        </td>
                        
                        <!--Stock Code-->
                        <td>
                            <bean:message key="label.predeal.stock.code"/>
                        </td>                        
                        
                        <!--Ear-marking Unit-->
                        <td>
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
            
            <table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
                
                <tbody>
                    
                    <tr>
                        
                        <td class="fieldname">
                            <!--Remarks-->
                            <bean:message key="label.remarks"/>
                        </td>
                        
                        <td class="odd">
                            <textarea name="remarks" id="remarks" rows="4" cols="80" ></textarea>
                        </td>
                        
                    </tr>
                    
                    <tr>
                        
                        <td class="fieldname">
                            <!--Last Action By-->
                            <bean:message key="label.last.action.by"/>
                        </td>
                        
                        <td class="even">
                            &nbsp;<%=lastActionBy%>
                        </td>
                        
                    </tr>
                    
                    <tr class="odd">
                        
                        <td class="fieldname">
                            <!--Last Remarks Made-->
                            <bean:message key="label.last.remarks.made"/>
                        </td>
                        
                        <td>
                            <integro:wrapper value="<%=remarks%>" />&nbsp;
                        </td>
                        
                    </tr>
                    
                </tbody>
                
            </table>
            
            <html:hidden property="event" />
            
            <html:hidden property="TrxID" value="<%= (String)request.getAttribute ( PreDealConstants.TRX_ID ) %>" />
            
        </html:form>
        
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
                    
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','/cms/img/approve2.gif',1)" onClick="submit()" >
                        <img src="/cms/img/approve1.gif" name="Image4411"  border="0" id="Image4411" />
                    </a>
                    
                </td>
                
                <td width="100" valign="baseline" align="center">
                    
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4412','','/cms/img/reject2.gif',1)" onClick="reject()" >
                        <img src="/cms/img/reject1.gif" name="Image4412"  border="0" id="Image4412" />
                    </a>
                    
                </td>
                
                <td width="100" valign="baseline" align="center">
                    
                    <a href="/cms/ToDo.do?event=prepare&isMenu=Y" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','/cms/img/cancel2.gif',1)" >
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