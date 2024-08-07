<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@ page import="com.integrosys.cms.ui.customer.CustomerSearchForm,
                 java.util.Collection,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.customer.bus.CustomerSearchCriteria,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.limit.bus.ITradingAgreement,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.AgreementTypeList,
                 com.integrosys.cms.ui.genlad.GenerateLADForm " %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/customer/CustomerList.jsp,v 1.39 2006/10/27 08:43:04 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.39 $
     * @since $Date: 2006/10/27 08:43:04 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    System.out.println("Entered CustomerList.jsp");
    String recordsString = PropertyManager.getValue("customer.pagination.nitems");
    int records_per_page = 10;  //default value
    try {
        records_per_page = Integer.parseInt(recordsString);
    }
    catch(NumberFormatException e) {
        DefaultLogger.error(this, "Caught NumberFormatException. Using Default value of 10.", e);
        records_per_page = 10;
    }
  // System.out.println("value of records_per_page"+records_per_page);
%>

<%
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
    long teamTypeID = userTeam.getTeamType().getTeamTypeID();
    boolean isMR = false;
    boolean isSAC = false;
    DefaultLogger.debug(this, "Team Type ID = " + teamTypeID);
    if (teamTypeID == ICMSConstant.TEAM_TYPE_MR ) {
      isMR = true;
    } else if (teamTypeID == ICMSConstant.TEAM_TYPE_SSC) {
        isSAC = true;
    }
    
    GenerateLADForm aForm;
    
    aForm = (GenerateLADForm) request.getAttribute("GenerateLADForm");
    
    if (aForm == null) {
    	aForm = (GenerateLADForm) request.getAttribute("CustodianSearchForm");
    }
    
    CountryList cList = CountryList.getInstance();
	AgreementTypeList aList = AgreementTypeList.getInstance();

    Collection results = aForm.getSearchResult();
    
        String searchCustomerName=(String)session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.searchCustomerName");
        pageContext.setAttribute("searchCustomerName",searchCustomerName);
        
                String relationshipMgr=(String)session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.relationshipMgr");
        pageContext.setAttribute("relationshipMgr",relationshipMgr);
        
        
            String segment=(String)session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.segment");
        pageContext.setAttribute("segment",segment);
        
              String dueMonth=(String)session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.dueMonth");
        pageContext.setAttribute("dueMonth",dueMonth);
        
        
          String dueYear=(String)session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.dueYear");
        pageContext.setAttribute("dueYear",dueYear);
    
   
        
   
    
    SearchResult sresult=(SearchResult)session.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.customerList");
   // System.out.println("-------------------------1-----------------------------"+sresult);
    if(sresult!=null){
    	//System.out.println("-------------------------2-----------------------------"+sresult.getResultList());
    	results = sresult.getResultList();
    	aForm.setNumItems(sresult.getNItems());
   		pageContext.setAttribute("customerList",results);
   	}
    if(results!=null) {
       pageContext.setAttribute("customerList",results);
    }
	
    CustomerSearchCriteria search = (CustomerSearchCriteria)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMERSEARCHCRITERIA_OBJ);
    if (search != null) {
	    aForm.setStartIndex(search.getStartIndex());
    }
   int sno = 0;
    sno = aForm.getStartIndex();
    int prev = aForm.getStartIndex() - aForm.getNumItems();
    if (prev < 0 ) { prev = aForm.getStartIndex() - records_per_page;}

%>

<% 

    try

    {
     %>



<html>
<head>


<script language="JavaScript">
<!--
	function JumpOnSelectactive(selectObj, customerID, limitProfileID, agreementID)
	{

  		var selectIndex = selectObj.selectedIndex;
    	if (selectObj.options[selectIndex].value == "processcusdetails")
		{
        	location.href = "CustomerProcess.do?event=view_borrower_list&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        		//"CustomerProcess.do?event=processcusdetails&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
   		}
		else if (selectObj.options[selectIndex].value == "viewlimits")
        {
       		location.href = "Limits.do?event=viewlimits&customerID=" +customerID+"&limitProfileID=" +limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
		else if (selectObj.options[selectIndex].value == "viewsecurities")
        {
        	location.href = "CustomerProcess.do?event=viewsecurities&customerID="+customerID+"&limitProfileID="+limitProfileID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
		else if (selectObj.options[selectIndex].value == "viewISDACSADeal")
        {
        	location.href = "ISDACSADealVal.do?event=view_isda_deal_detail&agreementID="+agreementID+"&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
		else if (selectObj.options[selectIndex].value == "viewGMRADeal")
        {
        	location.href = "GMRADeal.do?event=view_gmra_deal_detail&agreementID="+agreementID+"&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
		}
        else if (selectObj.options[selectIndex].value == "viewContractFinance")
        {
            location.href = "ContractFinancing.do?event=list_summary&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        }
        else if (selectObj.options[selectIndex].value == "viewBridgingLoan")
        {
            location.href = "BridgingLoan.do?event=list_summary&limitProfileID="+limitProfileID+"&customerID="+customerID+"&startIndex="+"<%=aForm.getStartIndex()%>";
        }

     }

    function gotoPage() {
	    parent.document.location="User.do?event=<%=ICommonEventConstant.EVENT_PREPARE%>";
	}

    function goNextPrev(ind) {
        document.forms["NewUserSearchForm"].cusName.value='';
        document.forms["NewUserSearchForm"].startIndex.value=ind;
    }

    function goPageIndex(ind) {
        document.forms["GenerateLADForm"].startIndex.value=ind;
        document.forms["GenerateLADForm"].submit();
    }

    function goAlphaIndex(ind) {
        document.forms["GenerateLADForm"].customerName.value=ind;
		if (ind == '')
		{
			document.forms["GenerateLADForm"].all.value = 'Y';
		}        
        document.forms[0].indicator.value='*';
        document.forms["GenerateLADForm"].startIndex.value=0;
        document.forms["GenerateLADForm"].submit();
    }
    function goPage(pageNo){
	    document.forms[0].startIndex.value = pageNo*<%= records_per_page %>;
    }
    function submitForm(){
		var isadded =addItems();
		if(isadded){
			formObj = document.forms["GenerateLADForm"];
	           formObj.event.value = "submit";
	    	formObj.submit();
		}else{
						return false;
		}
	}
    function canclePage(){
		formObj = document.forms["GenerateLADForm"];
	    formObj.event.value = "cancleFilter";
	
	    
	   	formObj.submit();
	}
    function setCustomer() {
        var custId;
       
        custId=document.getElementById("12").value;
		  alert(custId);
       
    }
    function addItems(){
        var formObj = document.forms[0];
    	var k = 0;
    	var temp = "";
    	for (var i=0; i<formObj.elements.length; i++) {
          var type = formObj.elements[i].type;
          if (type == 'radio') {
    		k++;
    	  }
    	}
        j = 0;
    	if( k > 1) {
    	    for (var i=0; i<formObj.elements.length; i++) {
    		  var type = formObj.elements[i].type;
    	      if (type == 'radio') {
    	        var obj = formObj.elements[i];
    		    if (obj.checked) {
//    				alert(formObj.itemID[j].value);
    				temp = temp + "," + formObj.itemID[j].value;
    			}
    			j++;
    	      }
    		}
    	} else {
    	    for (var i=0; i<formObj.elements.length; i++) {
    		  var type = formObj.elements[i].type;
    	      if (type == 'radio') {
    	        var obj = formObj.elements[i];
    		    if (obj.checked) {
//    				alert(formObj.itemID.value);
    				temp = temp + "," + formObj.itemID.value;
    			}
    	      }
    		}
    	}
//        alert('j'+j);
        if(temp==""){
            alert('Please select atleast one to save.');
            return false;
        }
    	temp=temp.substring(1);
    //	alert(temp);
    	formObj.hiddenItemID.value=temp;
    	return true;
    }
-->
</script>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->

<html:form action="GenerateLAD.do?">
<html:hidden property="startIndex" />
<html:hidden property="searchCustomerName" value="<%=searchCustomerName %>"/>
<html:hidden property="relationshipMgr" value="<%=relationshipMgr %>"/>
<html:hidden property="segment" value="<%=segment %>"/>
<html:hidden property="dueMonth" value="<%=dueMonth %>"/>
<html:hidden property="dueYear" value="<%=dueYear %>"/>


    
        
<input type="hidden" name="searchCustomerName"  >
<input type="hidden" name="relationshipMgr"  >

<input type="hidden" name="customerName" >
<input type="hidden" name="legalName" >
<input type="hidden" name="hiddenItemID" />
<input type="hidden" name="indicator" >
<input type="hidden" name="all">
<input type="hidden" name="event">

         <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
<%--
          <tr>
           <td>
             <%if(results!=null){%>
             <%=aForm.getNumItems()%> Record(s) Found
             <%}else{ %>
             0 Record(s) Found
             <%}%>
           </td>
          </tr>
--%>          
          <tr>
           <td>
            <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
             <thead>
              <tr>
               <td width="4%"><bean:message key="label.global.sn"/></td>
               <td width="18%"><bean:message key="label.list.party.name"/><br/>
               
                </td>
               <td width="11%"><bean:message key="label.list.party.id"/><br/>
              </td>
                
              
              <td width="15%">Select</td>
              </tr>
             </thead>
             <tbody>
       <% if(results!=null)  {%>
              <logic:present name="customerList">
               <logic:iterate id="OB" name="customerList" indexId="index" type="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult" scope="page">
<%               
				 boolean isISDACSADeal = false;
				 boolean isGMRADeal = false;
				 long agreementID = ICMSConstant.LONG_INVALID_VALUE;
				 long subprofileID = OB.getSubProfileID();
				 long instrID = OB.getInstructionID();
				 boolean isNoLimits = OB.getNoLimitsInd();
                 boolean hasContractFinance = OB.getHasContractFinance();
                 boolean hasBridgingLoan = OB.getHasBridgingLoan();
                 boolean isDeleted = false;

                 String aaType = OB.getLmtProfileType();
				 if( aaType != null && aaType.equals( ICMSConstant.AA_TYPE_TRADE ) )
				 {				 
					String type = OB.getAgreementType();
					agreementID = OB.getAgreementID();
					if( type != null && type.equals( ICMSConstant.GMRA_TYPE ) )
					{
						isGMRADeal = true;
					}
					else if( type != null && type.equals( ICMSConstant.ISDA_CSA_TYPE ) )
					{
						isISDACSADeal = true;
					}
				 }

				 
				 String rowClass="";
				 sno++;
				 if(sno%2!=0){
					rowClass="odd";
				 }else{
					rowClass="even";
				 }
 			 %>
               <input type="hidden" name="customerID" value ="<%=subprofileID%>">
               <input type="hidden" name="limitProfileID" value ="<%=instrID%>">
               <input type="hidden" name="agreementID" value ="<%=agreementID%>">
                  <tr class="<%=rowClass%>">
                  <td style="text-align:center" class="index"><%=sno%></td>
                  <td><%--<integro:htmltext value="<%=OB.getLegalName()%>"/>--%>
                  <integro:htmltext value="<%=OB.getCustomerName()%>"/>&nbsp;<br>
                  
                  </td>
                  <td><integro:empty-if-null value="<%=OB.getLegalReference()%>"/>&nbsp;<br>
                  
                  </td>
                  
                 
               	 

                  <td>
<!--                  <input type="checkbox" name="itemID" value="<%=sno%>" />-->
                  
                  <%-- <input type="radio"  name="itemID" value="<%=sno %>" /> --%>
                  <input type="radio"  name="itemID" value="<%=index+1%>" />
                  
                  </td>

                 </tr>
	            </logic:iterate>
               </logic:present>
               <%} else {%>
			   <td colspan="7" class="odd"><bean:message key="label.global.not.found"/>&nbsp;</td>
			   <%}%>
              </tbody>
			</table>
		   </td>
		  </tr>
		 </table>
		 <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="75">&nbsp;</td>
  </tr>
  <tr>
    <td><a href="#" onClick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image12','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image12" width="75" height="22" border="0" id="Image12" /></a></td>
	
    <td>
	    <a href="javascript:canclePage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
			<img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" />
		</a>
    </td>
	

  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
 </td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->
        <% String alphaURL="/poiReport.do?event=list&startIndex=";%>
<tr>
<td height="25">
			<table  id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="580" valign="middle">
                        &nbsp;
                        </td>
                        <td  valign="middle" align="right" >  &nbsp;</td>
                        <td valign="middle" align="right"  >
                         <!-- <img src="img/icon/seprate_bar.gif" />   -->&nbsp;  &nbsp;
                         <integro:pageindex pageIndex='<%=new PageIndex(aForm.getStartIndex(),records_per_page,aForm.getNumItems())%>' url='<%="poiReport.do?event=list&fromPage=pagination&startIndex="%>' submitFlag='<%=new Boolean(false)%>'/>
                        </td>
                      </tr>
               </table>
</td>
</tr>

</table>

</body>
</html>


<%} catch(Exception e)
        { e.printStackTrace();  }%>

