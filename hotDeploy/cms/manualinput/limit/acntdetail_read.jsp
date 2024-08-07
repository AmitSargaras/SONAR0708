<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.manualinput.limit.XRefDetailForm,
                 com.integrosys.cms.ui.limit.CategoryCodeConstant,
                 java.util.*"%>
<%@page import="com.integrosys.cms.app.limit.trx.ILimitTrxValue"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitSysXRef"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICustomerSysXRef"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
</head>
<%
Map lbValMap=(Map)request.getAttribute("viewSecurityMap");
XRefDetailForm frm=(XRefDetailForm)request.getAttribute("XRefDetailForm");
String sec1=(String)lbValMap.get(frm.getSecurity1());
String sec2=(String)lbValMap.get(frm.getSecurity2());
String sec3=(String)lbValMap.get(frm.getSecurity3());
String sec4=(String)lbValMap.get(frm.getSecurity4());
String sec5=(String)lbValMap.get(frm.getSecurity5());
String sec6=(String)lbValMap.get(frm.getSecurity6());
String createdBy = "";
String	createdOn ="";
String	updatedBy ="";
String updatedOn ="";
 ILimitTrxValue lmtTrxObj = (ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
 
 //SimpleDateFormat sdf = new SimpleDateFormat("dd-Mon-yy"); 
 if(lmtTrxObj!= null && lmtTrxObj.getLimit()!= null){
 System.out.println("111");
 boolean flag = false;
ILimitSysXRef[] refArr = lmtTrxObj.getLimit().getLimitSysXRefs();
 String indexID = (String)request.getAttribute("indexID");
  System.out.println("222"+indexID);
			if (refArr != null) {
			 System.out.println("333");
				for(int i=0;i<refArr.length;i++){
				 System.out.println("444");
					if(refArr[i].getCustomerSysXRef().getSerialNo().equals(String.valueOf(indexID))){
						ICustomerSysXRef obj = refArr[i].getCustomerSysXRef();
						if(obj!= null){
						System.out.println("11555");
						createdBy =	obj.getCreatedBy();
						System.out.println("createdBy"+createdBy);
					if(obj.getCreatedOn()!=null && !"".equals(obj.getCreatedOn()))
					createdOn =	obj.getCreatedOn().toString();
					System.out.println("createdOn"+createdOn);
					updatedBy =	obj.getUpdatedBy();
					System.out.println("updatedBy"+updatedBy);
					if(obj.getUpdatedOn()!=null && !"".equals(obj.getUpdatedOn()))
					updatedOn =	obj.getUpdatedOn().toString();
						System.out.println("updatedOn"+updatedOn);
						flag = true;
					}
					}else if(refArr[i].getCustomerSysXRef().getSerialNo().equals(frm.getHiddenSerialNo()) && !flag){
						ICustomerSysXRef obj = refArr[i].getCustomerSysXRef();
						if(obj!= null){
						System.out.println("22555");
						createdBy =	obj.getCreatedBy();
					if(obj.getCreatedOn()!=null && !"".equals(obj.getCreatedOn()))
					createdOn =	obj.getCreatedOn().toString();
					updatedBy =	obj.getUpdatedBy();
					if(obj.getUpdatedOn()!=null && !"".equals(obj.getUpdatedOn()))
					updatedOn =	obj.getUpdatedOn().toString();
					}
					}
					break;
				}
			}
}

 List restCoBorrowerList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.restCoBorrowerList");

 if (!(restCoBorrowerList == null)) {
 		System.out.println("restCoBorrowerList size="+restCoBorrowerList.size());
 		pageContext.setAttribute("restCoBorrowerList", restCoBorrowerList);
 	}else {
 		restCoBorrowerList = new ArrayList();
 	pageContext.setAttribute("restCoBorrowerList", new ArrayList());
 	}

    
 int vno = 0;
 %>

<body onload="MM_preloadImages('img/return2.gif')">
 <script language="javascript">
 
   function submitAccount()
   {
	if (document.forms[0].indexID.value == '')
	{
	    document.forms[0].event.value = 'create';
        }
        else
	{
	    document.forms[0].event.value = 'submit';	
	} 
	document.forms[0].submit();	
   }

   function cancelSubmit()
   {
	   if(document.forms[0].fromEvent.value == 'update'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=track"+ "&trxID="+ document.forms[0].trxID.value ;
		    document.forms[0].submit();
	   }
	   if(document.forms[0].fromEvent.value == 'view'){
			document.forms[0].event.value = 'cancel';
			document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'custread'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=show_lmt_cust_detail";
		   document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'prepare_cust_update'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimit.do?event=prepare_cust_update";
		   document.forms[0].submit();
	   }
	   
	   if(document.forms[0].fromEvent.value == 'read'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=show_lmt_detail";
		   document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'process'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=process"+ "&trxID="+document.forms[0].trxID.value;
		    document.forms[0].submit();
	   }

	   if(document.forms[0].fromEvent.value == 'prepare_close'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=prepare_close"+ "&trxID="+document.forms[0].trxID.value;
		    document.forms[0].submit();
		}

	   if(document.forms[0].fromEvent.value == 'prepare_delete'){
		   document.forms[0].limitId.value = '<%= request.getAttribute("lmtId")%>';
		   document.forms[0].action="MILimitList.do?event=del_limit";
		    document.forms[0].submit();
		}
		
	   if(document.forms[0].fromEvent.value == 'track'){
		   document.forms[0].trxID.value == '<%=request.getParameter("trxID")%>';
		   document.forms[0].action="MILimit.do?event=track"+ "&trxID="+ document.forms[0].trxID.value ;
		    document.forms[0].submit();
	   }
	
   }
	
   function refreshHostSystem(dropdown)
   {
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
        }	
        var dep = 'hostSystemName';
        var url = '/cms/MIAcntDetail.do?event=refresh_hostsyscountry&hostSystemCountry='+curSel;
        sendLoadDropdownReq(dep, url);
   }	



   function JumpOnSelect(selectObj)
   {
     		var selectIndex = selectObj.selectedIndex;
   		
   		//Process Customer
   		if (selectObj.options[selectIndex].value == 1)
   		window.location.href('../customer/CustDetails(mode=view,cpcMaker).htm');
   		
   		//View Limits
   		else if (selectObj.options[selectIndex].value == 2)
   		window.location.href('searchLimit(SACmaker,result).htm');
   		
   		/*View Sec Coverage
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Collateral/ViewSecurityCoverageContainer.htm');*/
   		
   		//View Securities
   		else if(selectObj.options[selectIndex].value == 3)
   		parent.window.location.href('../Deal/Dealframe(GMRA,MRmaker).htm');
   		
   		//View Valuation
   		else if(selectObj.options[selectIndex].value == 4)
   		parent.window.location.href('../Valuation/Valuationframe(MRmaker).htm');
   		
   		//Maintain Security Checklist
   		else if(selectObj.options[selectIndex].value == 5)
   		window.location.href('#');
   		
   		//Update C/C Doc Receipt
   		else if(selectObj.options[selectIndex].value == 6)
   		parent.window.location.href('../Documentation/UpCCDocReceiptContainer(cpcdocmaker).htm');
   		else if(selectObj.options[selectIndex].value == 9)
   		window.location.href('../Collateral/ViewLimitsContainer(SACmaker).htm');
   		
   }
   function shwhd(selfObj){
   	if(selfObj.value == 'fixed'){
   		document.getElementById('fixed').style.display = ''; 
   		document.getElementById('margin').style.display = 'none';
   	}else if (selfObj.value == 'floating'){
   		document.getElementById('fixed').style.display = 'none';
   		document.getElementById('margin').style.display = '';
   	}
   	
   }
      
 </script>
 <html:form action="MIAcntDetail">
  <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>	
  <input type="hidden" name="event" value=""/> 
  <html:hidden property="fromEvent"/>
  <html:hidden property="limitProfileID"/>
  <html:hidden property="createdBy"/>
  <html:hidden property="createdOn"/>
  <html:hidden property="updatedBy"/>
  <html:hidden property="updatedOn"/>
  
  <html:hidden property="hiddenSerialNo"/>
  <html:hidden property="edited"/>
  
  <html:hidden property="indexID"/>
  <html:hidden property="isCreate"/> 
  <html:hidden property="customerID"/>
  <input type="hidden" name="limitId" value="<%=request.getParameter("lmtId") %>"/>
  <input type="hidden" name="trxID" value="<%=request.getParameter("trxID") %>"/>
    <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
   <thead>
    <tr> 
     <td><h3>Released Line Details</h3></td>
    </tr>
    <tr> 
      <td><hr /></td>
    </tr>
   </thead>
   <tbody>
    <tr> 
     <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
       <thead>
       </thead> 
       <tbody>
        <tr class="even">
		  <td width="20%" class="fieldname">Serial No.<font color="#FF0000">*</font> </td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="serialNo" /></td>
                  <td width="20%" class="fieldname">System</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="facilitySystem" /></td>
                </tr>
          <tr class="odd">
          <tr class="even">
		 		  <td width="20%" class="fieldname">Line No.</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="lineNo" /></td>
                  
                  <td width="20%" class="fieldname">System ID</td>
                  <td width="30%"><bean:write name="XRefDetailForm" property="facilitySystemID" /></td>
          </tr>
          <tr>
		 	 <td class="fieldname">Interest rate <font color="#FF0000">*</font></td>
             <td>
             <bean:write name="XRefDetailForm" property="interestRateType"   />
             <%if(frm.getInterestRateType().equalsIgnoreCase("fixed")){ %>
             		rate: &nbsp; <integro:empty-if-null value="<%=frm.getIntRateFix() %>" />
             <%}else if(frm.getInterestRateType().equalsIgnoreCase("floating")){ %>
              <% if(frm.getIntRateFloatingMarginFlag().equals("-")){%>
                  rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingRange()) - Double.parseDouble(frm.getIntRateFloatingMargin())) %>"/>
                   <%}else { %>
                  rate: &nbsp; <integro:empty-if-null value="<%= String.valueOf(Double.parseDouble(frm.getIntRateFloatingMargin()) + Double.parseDouble(frm.getIntRateFloatingRange()))%>"/>
                  <%} %>
             <%} %>
             </td>
             <td class="fieldname"><p>&nbsp;</p>
             <td></td> 
           </tr>
           <tr class="even">
             <td class="fieldname">Released&nbsp; Amount <font color="#FF0000">*</font> </td>
             <td><bean:write name="XRefDetailForm" property="releasedAmount" /></td>
             <td class="fieldname">Released date</td>
             <td><bean:write name="XRefDetailForm" property="releaseDate" /> </td>
           </tr>
           <tr class="even">
		  <td class="fieldname">Utilized Amount </td>
                  <td><bean:write name="XRefDetailForm" property="utilizedAmount" /></td>	
                  <td class="fieldname">Facility line expiry date</td>
                  <td><p>
                    <bean:write name="XRefDetailForm" property="dateOfReset" /> </p></td> 
                </tr>
                <tr class="odd">
		  <td class="fieldname">Capital market  exposure<font color="#FF0000">*</font></td>
                  <td><bean:write name="XRefDetailForm" property="isCapitalMarketExposer" /> 
  				</td> 	
		  <td class="fieldname">  </td>
                  <td>&nbsp;
  				  </td>	
                </tr>
                <tr class="even">
                  <td class="fieldname">Real Estate Exposure <font color="#FF0000">*</font> </td>
                  <td><bean:write name="XRefDetailForm" property="isRealEstateExposer" />
  				  </td>
                  <td class="fieldname">Commercial Real estate/ Residential real Estate  / Indirect real estate</td>
                  <td><bean:write name="XRefDetailForm" property="estateType"/>
                     <% if(frm.getEstateType()!=null){
                         if(frm.getEstateType().equalsIgnoreCase("Commercial Real estate")){ %>
    						<html:select property="commRealEstateType" disabled = "true" style="width:250px">
    						<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE%>" descWithCode="false" />
    						</html:select>
    						<html:hidden property="commRealEstateType" />  
                    	<%}} %>
                  </td> 			
                </tr>
                <tr class="odd">
                  <td class="fieldname">Priority Sector <font color="#FF0000">*</font>  </td>
                  <td><bean:write name="XRefDetailForm" property="isPrioritySector" />
					<p>
	                  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="No">
						<integro:common-code-single  entryCode="<%=frm.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR %>" display="true" descWithCode="false" />               
	                  </logic:equal>
	                  <logic:equal name="XRefDetailForm" property="isPrioritySector" value="Yes">
						<integro:common-code-single  entryCode="<%=frm.getPrioritySector()%>"
	                                    categoryCode="<%=CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y %>" display="true" descWithCode="false" />               
	                  </logic:equal>
					</p>
				</td>
				 <%if("METG".equals(frm.getFacilitySystem())){%>
				<td class="fieldname">Banking Arrangement</td>
				<td>                  	
					<html:select property="bankingArrangement" disabled = "true" style="width:250px">
						<integro:common-code categoryCode="<%=CategoryCodeConstant.BANKING_ARRANGEMENT%>" descWithCode="false" />
					</html:select>
					<html:hidden property="bankingArrangement" />
				</td>
				<%}else{%>
					<td class="fieldname">&nbsp;</td><td>&nbsp;</td>
				<%}%>
                </tr>
                
            
           <tr id="addCountryDetails">
     <td class="fieldname" >Co-borrower Details </td>

							<td colspan="6">
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
										<td> Sr No</td>
										<td> Co-Borrower Liab Id </td>
										<td> Co-Borrower Name </td>
									
									</tr>
								</thead>
								 <tbody>
								
								 
									<logic:present name="restCoBorrowerList">
										<logic:iterate id="ob" name="restCoBorrowerList"
											type="com.integrosys.cms.app.customer.bus.OBLimitXRefCoBorrower"
											 scope="page">
											<%
												String rowClass = "";
														vno++;
														rowClass = "even";
														
											%>
											 <tr class="<%=rowClass%>">
												<td class="index"><%=vno%></td>
												<td>
												<center><%=ob.getCoBorrowerId()%>&nbsp;</center>
												</td>
												<td>
													<center><%=ob.getCoBorrowerName()%>&nbsp;</center>
												<%-- <html:text property="coBorrowerName" styleId="coBorrowerName" value = "<%=ob.getCoBorrowerName()%>"/> --%>
												</td>
											</tr> 
										
										</logic:iterate>
									</logic:present>
										<%if(restCoBorrowerList.size()==0){ %>
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>
								</tbody> 
							</table>
							</td>
						</tr>
                <tr class="even">
                  <td class="fieldname">Security 1</td>
                  <td>
                  <integro:empty-if-null value="<%=sec1%>"/>

                  </td>
                  <td class="fieldname">Security 2</td>
                  <td><p>
                   <integro:empty-if-null value="<%=sec2%>"/> 
                  </p></td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">Security 3</td>
                  <td>
                  <p>
                   <integro:empty-if-null value="<%=sec3%>"/>
                 </p>
                  </td>
                  <td class="fieldname">Security 4</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec4%>"/> 
                  </p>
                  </td>
                </tr>	
                 <tr class="even">
                  <td class="fieldname">Security 5</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec5%>"/>  
                 </p>
                  </td>
                  <td class="fieldname">Security 6</td>
                  <td>
                  <p>
                <integro:empty-if-null value="<%=sec6%>"/> 
                  </p>
                  </td>
                </tr>	
                
       </tbody>
      </table>
     </td>
    </tr>
    <tr>
     <td>
      &nbsp;
     </td>
    </tr>
    
     
    
    <tr>
      <td>&nbsp;</td>
    </tr>
   
   </tbody>
  </table>
  
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
     <tr> 
     <td>
   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
 <tr class="odd">
    
                  <td class="fieldname">Created/Edited By</td>
                  <td>
            
             <integro:empty-if-null value="<%=createdBy %>"/>
                  </td>
                  <td class="fieldname">Approved By</td>
                     <td>
              
                <integro:empty-if-null value="<%=updatedBy %>"/>
                  </td>
                  </tr>
      <tr class="odd">
                  <td class="fieldname">Created/Edited On</td>
                  <td>
             
              <integro:empty-if-null value="<%=createdOn %>"/>
                  </td>
                  <td class="fieldname">Approved On</td>
                  <td> 
                   
                      <integro:empty-if-null value="<%=updatedOn %>"/>
                    </td>
                  </tr>
                  </table>
                  </td>
                  </tr></table>
  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
   <tr> 
    <td><a href="javascript:cancelSubmit()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
   </tr>
   <tr> 
    <td colspan="2">&nbsp;</td>
   </tr>
  </table>
 </html:form>
</body>