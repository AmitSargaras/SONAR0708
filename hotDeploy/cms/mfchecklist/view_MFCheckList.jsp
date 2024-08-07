<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.propertyparameters.bus.marketfactor.IMFTemplate,
                 com.integrosys.cms.app.collateral.trx.marketfactor.IMFChecklistTrxValue,
                 com.integrosys.cms.app.collateral.trx.marketfactor.OBMFChecklistTrxValue,
                 com.integrosys.cms.ui.mfchecklist.MFCheckListForm,
                 com.integrosys.cms.ui.mfchecklist.MFCheckListAction,
                 com.integrosys.cms.app.collateral.bus.type.property.marketfactor.OBMFChecklist,
                 java.util.Collection,
                 java.util.Arrays,
                 java.util.Iterator,
				 java.math.BigDecimal,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


<%
           
	String event = request.getParameter("event");
    String orig_event = request.getParameter("orig_event");
	if( orig_event == null )
	{
		orig_event = event;
	}
    //System.out.println("event = " + event);
    IMFTemplate[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.mfchecklist.MFCheckListAction.MFChecklistTrxObj");
    //System.out.println("obj = " + obj);
    MFCheckListForm aForm = (MFCheckListForm) request.getAttribute("MFCheckListForm");
	String colSubTypeCode = (String)request.getAttribute("colSubTypeCode");
	String colTypeCode = (String)request.getAttribute("colTypeCode");
	String flag = request.getParameter("flag");

	String status = "";
	IMFChecklistTrxValue itrxValue = null;
    if( obj != null ) {
        itrxValue = (OBMFChecklistTrxValue)obj;
		status = itrxValue.getStatus();
	}

	Collection OBList = (Collection)request.getAttribute("request.OBAList");

	if (OBList != null && OBList.size() > 0 ) {
	  pageContext.setAttribute("OBList",OBList);
	}   
%>

<html>
<head>
<title>Marketability Factor Input</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/JavaScript">
<!--

function CanceledPage(subTypeCode,colID,flag){
   
   var url;
   
   switch(subTypeCode){
		case "PT700":
			url =  "PropAgriCollateral.do?event=read&flag="+ flag +"&collateralID="+ colID;
			break;
		case "PT701":
			url =  "PropCommGeneralCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT702":
			url =  "PropCommShopCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT703":
			url =  "PropIndusCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT704":
			url =  "PropResStdCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT705":
			url =  "PropResLuxCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT706":
			url =  "PropSpHotelCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT707":
			url =  "PropLandUrbanCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT708":
			url =  "PropRuralCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT709":
			url =  "PropSpOtherCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT710":
			url =  "PropCommServiceAptCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		case "PT711":
			url =  "PropIndusSpecCollateral.do?event=read&flag="+ flag +"&collateralID=" + colID;
			break;
		default:
			break;
	}	
				
   document.location.href = url;
  
}

function submitPage() {
	 
    document.forms[0].event.value = "maker_mfchecklist_confirm";
    document.forms[0].submit();

}

function changeMFTemplate() {
    document.forms[0].isRefresh.value = "refresh";
	document.forms[0].event.value =  document.forms[0].orig_event.value;
   	document.forms[0].submit();
}

function calcScore(valueFactor, weightg, index)
{
	var result = 0;
	var itemSize = document.forms[0].itemSize.value;
	var scoreID = "score" + index;
	var scoreName = "scoreName" + index;
	
	document.getElementById(scoreID).innerHTML="0";
	document.getElementById(scoreName).value="";
			
	if (valueFactor.length!=0 && weightg.length!=0)
	{ 
		result = valueFactor * weightg / 100;
		
		if( isNaN( result ) ) {
			document.getElementById(scoreID).innerHTML="0";
			result=0;
		} else {
			result = result.toFixed(2)*1; 

			document.getElementById(scoreID).innerHTML=result;

			document.getElementById(scoreName).value=result;
		}

	}
	
	var total = 0;
	for (i=0;i<itemSize;i=i+1) {
		var scoreName = "scoreName" +i;		
		
		if(i!=index) {
			
			total = total*1 + document.forms[0].elements[scoreName].value*1;
			total = total.toFixed(2)*1;
		}
	}
	total = total+result;

	document.getElementById("total").innerHTML = total.toFixed(2)*1; 
}

//-->

</script>

</head>

<body>
<html:form action="MarketabilityFactor.do">

<html:hidden property="event" value="<%=event%>"/>
<input type="hidden" name="orig_event" value="<%=orig_event%>"/>	
<html:hidden property="colCollateralID"/>
<html:hidden property="isRefresh" value=""/>
<input type="hidden" name="trxID" value="<%=request.getParameter("trxID")%>"/>	
<input type="hidden" name="colTypeCode" value="<%=colTypeCode%>"/>
<input type="hidden" name="colSubTypeCode" value="<%=colSubTypeCode%>"/>
<input type="hidden" name="flag" value="<%=flag%>"/>	
 
<bean:define id="formObj" name="MFCheckListForm" scope="request" type="com.integrosys.cms.ui.mfchecklist.MFCheckListForm"/>			
    
<table class="tblFormSection" width="60%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
        <tr>
            <td><h3>Marketability Factor Input</h3></td>
        </tr>
        <tr>
            <td><hr/></td>
        </tr>
    </thead>
    <tbody>
     <tr>
         <td>
             <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
             <tbody>
             <html:hidden property="MFTemplateName"/>
             <tr class="odd">
      			<td><h4><bean:message key="label.marketability.factor.template.name"/></h4></td>
      			<td width="78%">
					<html:select property="MFTemplateID">
					<option value="">Please Select</option>
					
					 <html:options collection="templateNameList" property="value" labelProperty="label"/>
					
					</html:select>
					
					&nbsp;
					<input type="button" name="Button" value="Go" class="btnNormal" onclick="changeMFTemplate()"/>
					</input><br/>
  				    <html:errors property="MFTemplateID"/>
				</td>
  				
    	    </tr>
    	    
    	    <tr class="even">
    	    	<td><h4><bean:message key="label.marketability.factor.last.updated"/></h4>&nbsp;</td>
    	    	<!--<td width="42%" align="right" valign="bottom" >&nbsp; </td>-->
    	    	<td><bean:write name="MFCheckListForm" property="lastUpdateDate" /></td></td>
    	    	<html:hidden property="lastUpdateDate"/>
    	    	</tr>
    	    </tbody>
    	    </table>
    	 </td>
     </tr>
     
     <tr><td>&nbsp;</td></tr>
     <tr><td>&nbsp;</td></tr>
     
     <tr>
     <td>
     	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
        	<thead>
        	<tr>
        		<td width="5%"><bean:message key="label.marketability.factor.sn"/></td>
        		<td width="20%"><bean:message key="label.marketability.factor.factor.description"/></td>
        		<td width="20%"><bean:message key="label.marketability.factor.weightage"/></td>
        		<td width="35%"><bean:message key="label.marketability.factor.valuer.assigned.factor"/></td>
        		<td width="20%"><bean:message key="label.marketability.factor.weighted.score"/></td>
        	</tr>
        	</thead>
        	<tbody>
        	
        	<%      	
			double total = 0;	
        	%>
          <logic:present name="MFCheckListForm" property="MFItemList" scope="request">
		  <bean:define id="itemSize" value="<%= String.valueOf(formObj.getMFItemList().size()) %>" />
		  <logic:notEqual name="itemSize" value="0"> 
		  <html:hidden property="itemSize" value="<%=itemSize%>"/>
				<logic:iterate id="itemList" indexId="itemListID" name="MFCheckListForm" 
					property="MFItemList" scope="request" 
					type="com.integrosys.cms.app.collateral.bus.type.property.marketfactor.IMFChecklistItem">

				<tr class="<%=(itemListID.intValue() + 1)%2==0?"even":"odd"%>">    
					<td class="index">
						<%= itemListID.intValue() + 1 %>
					</td>

					<td>
						&nbsp;<bean:write name="itemList" property="factorDescription" />
					</td>

					<td>
						&nbsp;<bean:write name="itemList" property="weightPercentage" format="0.00"/>
					</td>

					<td>
						&nbsp
						<input type="text" 
						name="valuerAssignFactorList" 
						size="30" 
						onkeyup="calcScore(this.value,'<%=itemList.getWeightPercentage()%>','<%=itemListID%>')"
						value="<%=(formObj.getValuerAssignFactorList()[itemListID.intValue()]==null?"":formObj.getValuerAssignFactorList()[itemListID.intValue()])%>"/> 

						<%	String errorString = "valuerAssignFactor" + itemListID; %>
						<html:errors property="<%=errorString%>"/>
					</td>
					
					<%	String scoreID = "score" + itemListID; %>									
					<td>
						&nbsp;
						<span id="<%=scoreID%>"><bean:write name="itemList" property="weightScore" format="0.00"/></span>
					</td>
					<input type="hidden" name="<%="scoreName"+itemListID%>" value="<%=itemList.getWeightScore()%>">
					<%       

						if(itemList.getWeightScore()!= 0){
							BigDecimal weightScoreBD = new BigDecimal(itemList.getWeightScore());
							weightScoreBD = weightScoreBD.setScale(2,BigDecimal.ROUND_HALF_UP); 
							total += weightScoreBD.doubleValue();
							
						}
						BigDecimal totalBD = new BigDecimal(total);
						totalBD = totalBD.setScale(2,BigDecimal.ROUND_HALF_UP); 
						total = totalBD.doubleValue();
					%>
										
				</tr>  

				</logic:iterate>

				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>Total:</td>
					<td><span id="total"><%=total%></span></td>
				</tr>
		  </logic:notEqual>
		  <logic:equal name="itemSize" value="0">
		    	<tr class="odd">
                      <td colspan="8">There is no MF Item.</td>
            	</tr>	
		  </logic:equal>	
                </logic:present>
                <logic:notPresent name="MFCheckListForm" property="MFItemList" scope="request">
                  <tr class="odd">
                    <td colspan="8">There is no MF Item.</td>
                  </tr>
                </logic:notPresent>
              </tbody>
     	</table>
     	
     	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	    <tr><td>&nbsp;</td></tr>
	    <% if ( status.equals( ICMSConstant.STATE_REJECTED_CREATE ) || 
				status.equals( ICMSConstant.STATE_REJECTED_UPDATE ) ) { %>
	        <tr>
	            <td colspan="2">
	                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
	                    <tbody>
	                        <tr>
	                            <td class="fieldname"><bean:message key="label.remarks"/></td>
	                            <td class="odd">
	                                <html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
	                                <html:errors property="remarks"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="fieldname"><bean:message key="label.last.action.by"/></td>
	                            <td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
	                        </tr>
	                        <tr class="odd">
	                            <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
	                            <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
	                        </tr>
	                    </tbody>
	                </table>
	            </td>
	        </tr>
	    <% } %>
	</table>
     	<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
     		<tbody>
     		<td >&nbsp;</td>
     		<td>&nbsp;</td>
     			<tr>
     				<td ><a href="javascript:submitPage()"><img src="img/submit1.gif" name="Image142" border="0" id="Image142"/></a><a href="javascript:submitPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image142','','img/submit2.gif',1)"></a></td>
    				
     				<%
     				
     				if (
		    			itrxValue != null &&
		    			(	ICMSConstant.STATE_REJECTED_UPDATE.equals(itrxValue.getStatus()) ||
		   					ICMSConstant.STATE_REJECTED_CREATE.equals(itrxValue.getStatus())) ) 
		    		{
			    		
			        %>	
			    		<td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>	
     	
     				<% }else {
	     				
	     				%>
     					<td ><a href="javascript:CanceledPage('<%=colSubTypeCode%>','<%=formObj.getColCollateralID()%>','<%=flag%>')"><img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>	
     				<%}%>
     				</tr>
     		</tbody>
     	</table>
     	
     </td>
     </tr>
	</tbody>
</table>
</html:form>
</body>
</html>
