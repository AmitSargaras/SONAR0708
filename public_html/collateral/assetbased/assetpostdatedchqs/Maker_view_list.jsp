<%@ page import="com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                    org.apache.commons.lang.StringUtils,
                 com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeForm"
        %>

<%
   String subtypeCode = ICMSConstant.COLTYPE_ASSET_PDT_CHEQUE;
    ChequeForm aForm = (ChequeForm) request.getAttribute("AssetChequeForm");
	int rowIdx = 0;
    int in=Integer.parseInt(request.getParameter("indexID"));
   ICollateralTrxValue itrxValue = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
   IAssetPostDatedCheque iCol = (IAssetPostDatedCheque) itrxValue.getCollateral();
   IPostDatedCheque[] cheque = iCol.getPostDatedCheques();
   OBPostDatedCheque obj1=(OBPostDatedCheque)cheque[in];
   ChequeForm obj=new ChequeForm();
   String trxID= (String)request.getAttribute("trxID");
   String pdcEvent= (String)request.getAttribute("pdcEvent");
   String userName= (String)request.getAttribute("userName");
   String collateralID=(String)request.getParameter("collateralID");
   String event_from = (String)request.getAttribute("event");
   DateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
   String prefix1 = "Asset";
   
   List otherBranchList = (List) request.getAttribute("BranchListFormBankId");
   Collection  resultNewList = null;
   int sno = 0;
   int no = 0;
  if (otherBranchList != null) {
	pageContext.setAttribute("otherBranchList", otherBranchList);
   }
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IAssetPostDatedCheque"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.IPostDatedCheque"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.pdcheque.OBPostDatedCheque"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        <!--

        function changeGovtName(theOpt){
            document.forms[0].govtName.disabled=theOpt;
        }

        function changeValAftMargin() {
            var margin = document.forms[0].margin.value.replace(',', '');
            var valBefMargin = 0;
            if (document.forms[0].befValMargin.value != null && document.forms[0].befValMargin.value != "") {
                valBefMargin = parseFloat(document.forms[0].befValMargin.value.split(',').join(''));
            }
            document.forms[0].aftValMargin.value = Math.round((margin / 100) * valBefMargin);
        }

        function changeValBefMargin() {
            document.forms[0].befValMargin.value = document.forms[0].chequeAmt.value;
            changeValAftMargin();
        }

        function updateInternal() {
            document.forms[0].secCustodianExt.value = '';
            document.forms[0].secCustodianExt.disabled = true;
            document.forms[0].secCustodianInt.disabled = false;
        }

        function updateExternal() {
            document.forms[0].secCustodianInt.value = '';
            document.forms[0].secCustodianInt.disabled = true;
            document.forms[0].secCustodianExt.disabled = false;
        }

        function submitPage(num) {
            enableAllFormElements();
            if (num == 1) {
               document.forms[0].event.value="read";
            }
            if (num == 2) {
                 document.forms[0].event.value="track";
            }
            if (num == 3) {
                document.forms[0].event.value="prepare_close";
            }
            document.forms[0].submit();
        }
       function getBulkorSingle(selectval)
        { 
      if(selectval==1){
        }
        if(selectval==2){
        	
        }
   
           var selection = document.form[0].chequeAmt;
       }
        //-->
    </script>
    <script type="text/javascript" src="js/calDriver.js"></script>
</head>

<body>
<%@ include file="/collateral/ssc.jsp" %>

<html:form action="AssetPostDatedChqsCollateral.do">

<input type="hidden" name="event"/>
<input type="hidden" name="trxID" value="<%=trxID %> "/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="userName" value="<%=userName %> "/>
<input type="hidden" name="collateralID" value="<%=collateralID %> "/>


<% int index = 2;

    if ("prepare".equals(request.getParameter("event")) || "create".equals(request.getParameter("event"))) {
        index = 1;
    }
    if ("view_chequeDetail".equals(request.getParameter("event"))||"maker_view_list".equals(request.getParameter("event")) ) {
        index = 3;
    }

%>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="label.security.asset.cheque.detail"/> - <% if (index == 3) { %> View <% } else { %> Delete <% } %></h3></td>
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
        
       <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	            <td width="20%" class="fieldname">Bank Name</td>
	            <%if(obj1.getOtherbank()!=null){ %>
                  <td width="30%"> <%= obj1.getOtherbank().getOtherBankName() %>
                  <%}else if(obj1.getSystemBank()!=null){ %>
                <td width="30%">      <integro:empty-if-null value="<%=obj1.getSystemBank().getSystemBankName()%>"/>&nbsp;
                  
                  
                     <%}else{%>
                      <td width="30%"> 
                      <%}%>
                    
                  
                 </td>
                
              <td width="20%" class="fieldname">Bank Code</td>
               
               <td width="30%"><integro:empty-if-null value="<%=obj1.getBankCode() %>"/>
                   </td>
          </tr> 
         
  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	          <td width="20%" class="fieldname">Branch Name </td>
              

                 <td width="30%" >
    	                  
                                  
                               
                               	<html:select name="AssetPostDatedChqsForm"
											property="branchName" style="width:250px" value="<%=aForm.getBankCode() %>" onchange="javascript:selectCode(this);" >
                                 	
											<logic:present name="otherBranchList">
												<logic:iterate id="ob" name="otherBranchList"
													type="org.apache.struts.util.LabelValueBean"
													 scope="page">

													<%
												
														if (aForm.getBranchCode() == null) {
													%>
													<option 
														value="<%=ob.getValue()%>" disabled="disabled"><%=ob.getLabel()%></option>
													<%
														} else {
													%>
													<%
														if (aForm.getBranchCode().equals(
																				String.valueOf(ob.getValue()))) {
													%>
													<option 
														value="<%= ob.getValue() %>" selected="selected" disabled="disabled"><%= ob.getLabel() %></option>
													<%
														} else {
													%>
													<option 
														value="<%=ob.getValue()%>" disabled="disabled"><%=ob.getLabel()%></option>
													<%
														}
													%>
													<%
														 }
													%>


												</logic:iterate>
											</logic:present>
											
										</html:select><html:errors property="branchNameError"/>
                          </td>
               
                  <td width="20%" class="fieldname">Branch Code</td>
                 <td width="30%"><integro:empty-if-null value="<%=obj1.getBranchCode() %>"/>
                   </td>
      </tr>        
           <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	             <td width="20%" class="fieldname">PacketNumber</td>
                 <td width="30%"><integro:empty-if-null value="<%=obj1.getPacketNumber() %>"/>
                   <html:errors property="chequeAmt"/></td>
                  
	              <td width="20%" class="fieldname">Loanable</td>
	              <%if(obj1.getLoanable()!=null) {%>
	              <% if(obj1.getLoanable().equals("N")){ %>
                  <td width="30%" class="even"> No 
                  </td>
                  
                  <%}else{ %>
                  
                  <td width="30%" class="even"> Yes 
                  </td>
                  <%}}else{ %>
                  <td width="30%" class="even"> Yes 
                  </td>
                  <%} %>
           </tr> 
         
         
         
     <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	 
	 
	  <td width="20%" class="fieldname">Cheque Amount</td>
                  <td width="30%"><%=UIUtil.formatWithCommaAndDecimal(String.valueOf(obj1.getChequeAmount().getAmountAsBigDecimal()))%>
                   <html:errors property="chequeAmt"/></td>
	 
	 
	  <%if(obj1.getChequeNoFrom() >=1){ %>
	 <td width="20%" class="fieldname">Cheque Type</td>
	   <td width="30%" ><integro:empty-if-null value="Bulk"/>     </td>
	   </tr> 
	 <%}else{ %>
	   <td width="20%" class="fieldname">Cheque Type</td>
                  <td width="30%" ><integro:empty-if-null value="Single"/>
                 </td>
                 
                   </tr> 
                        
                        
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
        
         <td width="20%" class="fieldname">Cheque Number</td>
                              <td width="30%">
                              <%if(obj1.getChequeNumber()!=null){ %>
                              <%= StringUtils.leftPad(obj1.getChequeNumber()==null?"":obj1.getChequeNumber(),6, "0") %>
                              <%}else{ %>
                               <integro:empty-if-null value="<%=obj1.getChequeNumber()%>"/>&nbsp;
                              <%} %>
   </td>
	    
	 
	       <td width="20%" class="fieldname">Total Number of Cheque</td>
                  <td width="30%">1
                    </td>
	       
                  
                 </td>
                 
      </tr>  
       <%} %>         
               
        
         <%if(obj1.getChequeNoFrom()>=1){ %> 
        
         <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	   <td width="20%" class="fieldname">Cheque Number From</td>
                 <td width="30%"> <%if(String.valueOf(obj1.getChequeNoFrom())!=null){ %>
                              <%= StringUtils.leftPad(String.valueOf(obj1.getChequeNoFrom())==null?"":String.valueOf(obj1.getChequeNoFrom()),6, "0") %>
                                  <%}else{ %>
                                  <integro:empty-if-null value="<%=String.valueOf(obj1.getChequeNoFrom())%>"/>&nbsp;
                                  <%} %>
                  </td>
	  <td width="20%" class="fieldname">Cheque Number To</td>
                  <td width="30%">  <%if(String.valueOf(obj1.getChequeNoTo())!=null){ %>
                              <%= StringUtils.leftPad(String.valueOf(obj1.getChequeNoTo())==null?"":String.valueOf(obj1.getChequeNoTo()),6, "0") %>
                                  <%}else{ %>
                                  <integro:empty-if-null value="<%=String.valueOf(obj1.getChequeNoTo())%>"/>&nbsp;
                                  <%} %>
                   </td>
                
     </tr> 
      
        <%long i=0;
        long j=0;
        long k=0;
      i=obj1.getChequeNoFrom();
      j=obj1.getChequeNoTo();
      k=j-i+1;
      %>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	   <td width="20%" class="fieldname">Total Number of Cheque</td>
                  <td width="30%"><integro:empty-if-null value="<%=String.valueOf(k) %>"/>
                  </td>
	            <td width="20%" class="fieldname"></td>
                  <td width="30%">
               </td>
                 
      </tr> 
      
        
        <%} %>
        
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<%
	Date dt1=new Date();
	DateFormat dtr=new SimpleDateFormat("dd/MM/yyyy");
	
	
	%>
	 
	           <td class="fieldname">Start Date</td>
	           <%if(obj1.getStartDate()!=null){ %>
              <td><integro:empty-if-null value="<%= dtr.format(obj1.getStartDate()) %>"/>
              <%}else{ %>
               <td width="30%"><integro:empty-if-null value=""/>
                <%} %>
                </td>
                
                
                <td class="fieldname">Maturity Date&nbsp;<bean:message key="label.mandatory"/></td>
            <%if(obj1.getMaturityDate()!=null){ %>
            <td><integro:empty-if-null value="<%= dtr.format(obj1.getMaturityDate())%>"/>
            <%}else{ %>
               <td width="30%"><integro:empty-if-null value=""/>
                <%} %>
                </td>
                
     
    </tr>
	
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	           <td class="fieldname">Deposit Date</td>
	             <%if(obj1.getIssueDate()!=null){ %>
              <td><integro:empty-if-null value="<%= dtr.format(obj1.getIssueDate()) %>"/>
              <%}else{ %>
               <td width="30%"><integro:empty-if-null value=""/>
                <%} %>
                </td>
                
                
                <td class="fieldname"><bean:message key="label.limit.expiry.date"/>&nbsp;<bean:message key="label.mandatory"/></td>
            <%if(obj1.getExpiryDate()!=null){ %>
            <td><integro:empty-if-null value="<%= dtr.format(obj1.getExpiryDate())%>"/>
            <%}else{ %>
            <td width="30%"><integro:empty-if-null value=""/>
                <%} %>
                </td>
    
    </tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	           <td class="fieldname">Ram Id</td>
              <td><integro:empty-if-null value="<%= obj1.getRamId() %>"/>
                </td>
                
                
                <td class="fieldname"></span>&nbsp;</td>
                  <td>
                </td>
      
    </tr>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="fieldname">Return Status</td>
                  <td width="30%"><integro:empty-if-null value="<%=obj1.getReturnStatus() %>"/>
                  </td>
                  
                   <td class="fieldname">Return Date</td>
                    <%if(obj1.getReturnDate()!=null){ %>
            <td><integro:empty-if-null value="<%=dtr.format(obj1.getReturnDate()) %>"/>
            <%}else{ %>
              <td>
                <%} %>
                </td>
            
        </tr>
        
      <tr class="odd">
	                         <td width="20%" class="fieldname">
		                          Remarks
	                          </td>
    	                      <td width="100%" colspan="3">
    	                      <integro:empty-if-null value="<%=obj1.getRemarks() %>"/>
	                 </td>

                              
                      </tr>

        </tbody>
        </table>
       </td>
    </tr>
</tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
     
    <%if(pdcEvent.equals("prepare_close")){ %>
     <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
     
    
    <%} else if(!pdcEvent.equals("close_totrack")){ %>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
         <%} else if (pdcEvent.equals("close_totrack")){ %>  
             <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
    <%}%>
       
        </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
	<tr><td height="70">&nbsp;</td></tr>
</table>
</html:form>

</body>
</html>
