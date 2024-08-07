<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,java.util.*" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int dno = 0;
List stocksAndDueDateList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.stocksAndDueDateList");
pageContext.setAttribute("stocksAndDueDateList", stocksAndDueDateList);
%>

<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Untitled Document</title>
 
<script language="JavaScript" type="text/JavaScript">

function viewEditItem(assetId,index) {
		document.forms[0].action = "AssetGenChargeCollateral.do?assetId=" +assetId +"&index="+index;		
    	document.forms[0].event.value = "edit_each_stock_and_date";
    	document.forms[0].submit();
	}	    

function addStocks(){
	document.forms[0].action="AssetGenChargeCollateral.do";
	document.forms[0].event.value = "add_each_stock_and_date";
    document.forms[0].submit();
}
</script>
</head>
<body>

                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>Due Date and Stock Details</h3></td>
                          <td width="18%" align="right" valign="bottom">
							
						  </td>
						  
                    <td  valign="bottom" align="right">
						<input onclick="javascript : addStocks('add_each_stock_and_date')"
						 type="button" name="Submit" value="Add New" class="btnNormal"/>&nbsp;
					</td>
						  <td>&nbsp;</td>      
						  <td>&nbsp;</td>
                        </tr>
                         <tr>
                    <td colspan="2">
                    </td>
                </tr>
                        <tr>
                          <td colspan="4"><hr /></td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td colspan="4"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                              <thead>
                                <tr>
                                    <td width="5%">S/N</td>
                                  <td width="10%">Due Date</td>  
                                  <td width="15%">Statement Name</td>
                                   <td width="10%">DP to be calculated Manually</td>
                                   <td width="10%">DP Share</td>
                                   <td width="15%">Drawing Power(as per stock statement) </td>
                                   <td width="15%">DP for Cash Flow/Cash Budget</td>                                                                    
                                  <td width="5%">Action</td>
                                </tr>
                              </thead>
                                 <tbody>
                               <logic:present name="stocksAndDueDateList">
                               <logic:iterate id="ob" name="stocksAndDueDateList"  indexId="counter"
                               type="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.OBGeneralChargeDetails" scope="page">
                               <%
                            String rowClass="";
                            dno++;
                            if(dno%2!=0){
                                rowClass="odd";
                            }else{ 
                                rowClass="even";
                            }
                        %>   
                        <tr class="<%=rowClass%>">
						<td class="index"><%=dno%></td>
                          <td>
                              <%SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");
                             String strDate= formatter.format(ob.getDueDate()); %>
                             
                             <center><integro:empty-if-null value="<%=strDate%>" /></center>
                          </td>  
                          <td>
                           <%
                            String docCode = null;
                        	if(ob.getDocCode()!=null){
                        	String[] split = ob.getDocCode().split(",");
                        	docCode=split[1];
                        	}
                            %>
                             <center><integro:empty-if-null value="<%=docCode%>" /></center>
                          </td>
                           <td>
                             <center><integro:empty-if-null value="<%=ob.getDpCalculateManually()%>" /></center>
                          </td>
                           <td>
                             <center><integro:empty-if-null value="<%=ob.getDpShare()%>" /></center>
                          </td> 
                           <td>
                             <center><integro:empty-if-null value="<%=ob. getCalculatedDP()%>" /></center>
                          </td> 
                          <td>
                             <center><integro:empty-if-null value="<%=ob. getCalculatedDP()%>" /></center>
                          </td>    
                         <td ><a href="javascript:viewEditItem('<%=ob.getGeneralChargeDetailsID()%>','<%=dno%>')">View/Edit</a></td>
                         </tr>               
                               </logic:iterate>
                               <% if (dno == 0 ) { %>
                                <tr class="odd">
                                	<td colspan="10">
                                		<bean:message key="label.global.not.found"/>                                
                                	</td>
                                </tr>
                                <% } %>
                               </logic:present>
                               
              
                              </tbody>
                            </table></td>
                        </tr>
                      </tbody>
                    </table>
                    
				</td>
              </tr>
          


</body>
</html>