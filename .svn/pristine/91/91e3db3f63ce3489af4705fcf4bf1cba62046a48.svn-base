<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,java.util.*,com.integrosys.base.businfra.search.SearchResult,
com.integrosys.cms.app.transaction.OBTrxContext" %>
<script language="JavaScript" type="text/JavaScript">

var parentPageFrom = '<%=parentPageFrom%>';

function editInsuranceDetail(event,insuranceCode,calculatedDP,trxId) {

	//alert("event:"+event);
	var event = event;
	var action ;
	var insuranceCode = insuranceCode;
	var trxId = trxId;
	var calculatedDP = calculatedDP;
	document.forms[0].action ="AssetInsuranceCollateral.do?event="+event+"&insuranceCode="+insuranceCode+"&calculatedDP="+calculatedDP+"&trxID="+trxId;
    document.forms[0].submit();
   return action;
}	

function viewInsuranceHistory(){
    document.forms[0].action="AssetGenChargeCollateral.do?event=update_session_view_insurance_history&parentPageFrom="+parentPageFrom;
    document.forms[0].collateralID.value=<%=itrxValue.getReferenceID()%>;
    document.forms[0].submit();
}

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
List insuranceList=(List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceList");
String dp1=(String)request.getAttribute("calculatedDP");
HashMap actualMap=(HashMap)request.getAttribute("actualMap");
HashMap stageMap=(HashMap)request.getAttribute("stageMap");
String event2=(String)request.getAttribute("event");
System.out.println("/////////////////**********************  event2 "+event2);



List componentList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.componentList");
List companyList = (List) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCoverageList");
System.out.println("/////////////////**********************  companyList "+companyList.size());
System.out.println("/////////////////**********************  componentList "+componentList.size());
System.out.println("/////////////////**********************  insuranceList "+insuranceList.size());

/*OBTrxContext theOBTrxContext=(OBTrxContext)request.getAttribute("theOBTrxContext");
System.out.println("/////////////////**********************  TRX "+trxID);
System.out.println("/////////////////**********************  ID "+theOBTrxContext);*/

pageContext.setAttribute("insuranceList", insuranceList);
pageContext.setAttribute("componentList", componentList);
pageContext.setAttribute("companyList", companyList);
pageContext.setAttribute("actualMap", actualMap);


int lno=0;

boolean isMaker= false;
boolean isChecker= false;
ICommonUser user1 = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
if(user1.getTeamTypeMembership().getMembershipID()==1006){
	isMaker=true;
}else {
	isChecker=true;
}
OBInsuranceGC actual=null;
OBInsuranceGC stage=null;



%>




<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="org.apache.struts.util.LabelValueBean"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>

<input type="hidden" name="referrerEvent" value="${requestScope['AssetGenChargeForm'].event}"/>
<input type="hidden" name="trxID" />
<input type="hidden" name="collateralID" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Untitled Document</title>


</head>

<body>

                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                      <thead>
                        <tr>
                          <td width="82%"><h3>Insurance Details </h3></td>
                          <td width="18%" align="right" valign="bottom">
							<input type="button" name="Submit" value="View Insurance History" class="btnNormal" onclick="viewInsuranceHistory()"/>
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
                                   <td width="15%">Status</td>
                                  <td width="10%">Due Date</td>  
                                   <td width="15%">Insurance Policy No.</td>
                                   <td width="15%">Insurance Company Name</td>
                                   <td width="10%">Insured Amount</td>
                                <!-- <td width="15%">Component Name</td>
                                  <td width="15%">Insurance Company</td>  
                                   <td width="12%">Policy Number</td>
                                   <td width="12%">Policy Amount</td>
                                   <td width="11%">Insured Amount</td>
                                   <td width="10%">Effective Date</td>  -->  
                                   <td width="10%">Expiry Date</td>                                                                    
                                  <td width="10%">Action</td>
                                  
                                </tr>
                              </thead>
                              <tbody>
                               <logic:present name="insuranceList">
                               <logic:iterate id="ob" name="insuranceList"  indexId="counter"
                               type="com.integrosys.cms.ui.collateral.assetbased.assetgencharge.OBInsuranceGC" scope="page">
                               <%
                            String rowClass="";
                            lno++;
                            if(lno%2!=0){
                                rowClass="odd";
                            }else{ 
                                rowClass="even";
                            }
                           // boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
                           if(((actualMap.containsKey(String.valueOf(ob.getInsuranceCode())))==true) &&((stageMap.containsKey(String.valueOf(ob.getId())))==true)){
                                actual=(OBInsuranceGC)actualMap.get(String.valueOf(ob.getInsuranceCode()));
                                stage=(OBInsuranceGC)stageMap.get(String.valueOf(ob.getId()));
                               	}
                        %>
                        
                               <tr class="<%=rowClass%>">
                                <td class="<%if (ob.getIsProcessed().equals("Y")
							&& ob.getDeprecated().equals("N")) {%>index<%}
					if ((ob.getIsProcessed().equals("N")||ob.getIsProcessed().equals("DD"))
							&& ob.getDeprecated().equals("Y")) {%>indexdel<%}
					if ((ob.getIsProcessed().equals("N")||ob.getIsProcessed().equals("DA"))
							&& ob.getDeprecated().equals("N")) {%>indexadd<%}
					if (ob.getIsProcessed().equals("YR")
							&& ob.getDeprecated().equals("Y")) {%>indexdel<%}
					if ((ob.getIsProcessed().equals("NM")||ob.getIsProcessed().equals("DE"))
							&& ob.getDeprecated().equals("N")) {%>indexdiff<%}
					if (ob.getIsProcessed().equals("YR")&& ob.getDeprecated().equals("N")){
							if((stage!=null && actual!=null) && stage.getInsuranceCode().equals(actual.getInsuranceCode())){%>indexdiff<%}
							else{%>indexadd<%}}%>"><%=counter.intValue() + 1%></td>
                             <%--    <%
                               	if (ob.getInsuranceRequired().equals("All")) {
                               %>
                               <td>All</td>
                               <%
                               	} else if (ob.getInsuranceRequired().equals("Component_wise")
                               					&& componentList.size() > 0) {
                               				LabelValueBean lvb1 = new LabelValueBean();
                               				String valueCode = "";
                               				String[] abc = ob.getSelectComponent().split("-");
                               				
                               				List selectList = Arrays.asList(abc);
                               				StringBuffer result = new StringBuffer();
                               				for (int i = 0; i < componentList.size(); i++) {
                               					for (int j = 0; j < selectList.size(); j++) {
                               						LabelValueBean lvb = (LabelValueBean) componentList.get(i);
                               						String selctVal = (String) selectList.get(j);
                               						String lable = lvb.getLabel();
                               						String value = lvb.getValue();
                               						if (selctVal.equals(value)) {

                               							if(valueCode.equals("")){
															valueCode=valueCode+lable;
														}else{
															valueCode= valueCode+",";
															valueCode=valueCode+lable;
														}
                               						}
                               						//lvb1.setLabel(result.toString());
                               					}
                               				}
                               %> 
                               <td><%=valueCode.toString()%></td>  --%>
                               <%
                             //  	}
                               			LabelValueBean company = new LabelValueBean();
                               			for (int k = 0; k < companyList.size(); k++) {
                               				LabelValueBean lvb = (LabelValueBean) companyList
                               						.get(k);
                               				if (lvb.getValue().equals(ob.getInsuranceCompany())) {
                               					company.setLabel(lvb.getLabel());
                               				}
                               			}
                               %>
                                <td>
                               <center>
                                <%if("UPDATE_RECEIVED".equals(ob.getInsuranceStatus())){ %>
                                <integro:empty-if-null value="PENDING_RECEIVED" />
                                 <%}else if("AWAITING".equals(ob.getInsuranceStatus())){ %>
                                <integro:empty-if-null value="PENDING" />
                                <%}else{ %>
                               <integro:empty-if-null value="<%=ob.getInsuranceStatus()%>" />
                               <%} %>
                               </center>
                               </td>
                               <%	DateFormat df1 = new SimpleDateFormat("dd/MMM/yyyy");
                               		String dueDate1="";
                               		if(null!=ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("DEFER")){
                               			if(null!=ob.getNextDueDate()){
                               			dueDate1=df1.format(ob.getNextDueDate());
                               			}
                               		}else if(null!=ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("WAIVE")){
                               		
                               		}else if(null!=ob.getOriginalTargetDate()){
                               		dueDate1=df1.format(ob.getOriginalTargetDate());
                               		}
                               %>
                               <td>
                               <center><integro:empty-if-null value="<%=dueDate1%>" /></center>
                               </td>
                               <td>
                               <center><integro:empty-if-null
												value="<%=ob.getInsurancePolicyNo()%>" /></center>
                               </td>
                               
                               <td>
                               <center><integro:empty-if-null
												value="<%=company.getLabel()%>" /></center>
                               
                               </td>
                               
                               <!-- 
                               <td>
                               <center><integro:empty-if-null
												value="<%=UIUtil.formatWithCommaAndDecimal(ob.getInsurancePolicyAmt())%>" /></center>
                               
                               
                               </td>  -->
                               <td>
                               <center><integro:empty-if-null
												value="<%=UIUtil.formatWithCommaAndDecimalNew(ob.getInsuredAmount())%>" /></center>
                               
                               
                               </td>
                               <%DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
                               String effectiveDate =  "";
                               String expiryDate = "";
                               if(ob.getEffectiveDate()!=null){
                               effectiveDate=df.format(ob.getEffectiveDate());
                               }
                               if(ob.getExpiryDate()!=null){
                               expiryDate=df.format(ob.getExpiryDate());
                               }
                               
                           //    String insuranceStatus="";
                           
                          /*     if(null!=ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("RECEIVED")){
                            	   insuranceStatus="RECEIVED";
                               }else if(null!=ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("DEFERRED")){
                            	   insuranceStatus="DEFERRED";
                               }else if(null!=ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("WAIVED")){
                            	   insuranceStatus="WAIVED";
                               }else if(null!=ob.getInsuranceStatus() && ob.getInsuranceStatus().contains("PENDING")){
                            	   insuranceStatus="PENDING";
                               } 
                               
                               System.out.println("insuranceStatus:"+insuranceStatus); */
                               %>
                               <!--   <td>
                                <center><integro:empty-if-null
												value="<%=effectiveDate%>" /></center>
                               
                               </td> -->  
                               <td>
                                <center><integro:empty-if-null
												value="<%=expiryDate%>" /></center>
                               
                               </td>
                           
               
                               <td>
                               
                                           <%if("RECEIVED".equals(ob.getInsuranceStatus()) || "PENDING_RECEIVED".equals(ob.getInsuranceStatus()) || "UPDATE_RECEIVED".equals(ob.getInsuranceStatus())){ %>  
                                           <center> <a href="javascript:editInsuranceDetail('checker_view_insurance_received','<%=ob.getInsuranceCode()%>','<%=dp1%>','<%=trxID%>')">View </a></center>
                                           <%}else if("DEFERRED".equals(ob.getInsuranceStatus()) || "PENDING_DEFER".equals(ob.getInsuranceStatus())){ %>  
                                           <center> <a href="javascript:editInsuranceDetail('checker_view_insurance_deferred','<%=ob.getInsuranceCode()%>','<%=dp1%>','<%=trxID%>')">View </a></center>
                                           <%}else if("WAIVED".equals(ob.getInsuranceStatus()) || "PENDING_WAIVER".equals(ob.getInsuranceStatus())){ %>  
                                           <center> <a href="javascript:editInsuranceDetail('checker_view_insurance_waived','<%=ob.getInsuranceCode()%>','<%=dp1%>','<%=trxID%>')">View </a></center>
                                           <%}else if("AWAITING".equals(ob.getInsuranceStatus()) || "PENDING_UPDATE".equals(ob.getInsuranceStatus())){ %>  
                                           <center> <a href="javascript:editInsuranceDetail('checker_view_insurance_pending','<%=ob.getInsuranceCode()%>','<%=dp1%>','<%=trxID%>')">View </a></center>
                                           <%} %>
                                         </td>   
                               </tr>
                               </logic:iterate>
                               <% if (lno == 0 ) { %>
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
                    <!-- InstanceEndEditable -->
				</td>
              </tr>
          


</body>

</html>