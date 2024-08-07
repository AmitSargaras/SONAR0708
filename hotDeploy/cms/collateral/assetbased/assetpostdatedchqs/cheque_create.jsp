<%@ page import="com.integrosys.cms.ui.dataprotection.DataProtectionUtil,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.ChequeForm"
        %>

<%
   int listNewSize = 0;
   List otherBranchList = (List) request.getAttribute("BranchListFormBankId");
   Collection  resultNewList = null;
   int sno = 0;
   int no = 0;
  if (otherBranchList != null) {
	pageContext.setAttribute("otherBranchList", otherBranchList);
   }
   String subtypeCode = ICMSConstant.COLTYPE_ASSET_PDT_CHEQUE;
    ChequeForm aForm = (ChequeForm) request.getAttribute("AssetChequeForm");
    AssetPostDatedChqsForm obj=(AssetPostDatedChqsForm)request.getAttribute("AssetPostDatedChqsForm");
   	int rowIdx = 0;
	    List otherBankList =(List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.otherBankList");
		  if (otherBankList != null) {
		      pageContext.setAttribute("otherBankList",otherBankList);
		    }
	   String context = request.getContextPath() + "/";
	  DateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
	  String prefix1 = "Asset";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%@page import="java.util.List"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetpostdatedchqs.AssetPostDatedChqsForm"%>
<%@page import="com.integrosys.base.businfra.search.SearchResult"%>
<%@page import="java.util.Collection"%><html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script type="text/javascript" src="js/enableFields.js"></script>
    <script type="text/javascript" src="js/imageNavigation.js"></script>
    <script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
    <script language="JavaScript" type="text/JavaScript">
        

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
            var e =document.getElementById("bankName").options[document.getElementById("bankName").selectedIndex].text;

             if (num == 1) {
        	   if(e=='HDFC BANK'||e=='HDFC BANK LTD'){
        		
        		   document.getElementById("branchCodeVal").value=document.getElementById("branchCode").value;
            	  
        		   document.getElementById("hdfcBank").value='S';
        		   document.getElementById("bankBranchType").value='SB';
               }else{
            	  
            	   document.getElementById("branchCodeVal").value=document.getElementById("branchCode").value;
            	   document.getElementById("hdfcBank").value='O';
            	   document.getElementById("bankBranchType").value='OB';
                 }
        	   
        	   
                 document.forms[0].event.value="create";
              }
            if (num == 2) {
                document.forms[0].event.value="update";
                if(e=='HDFC BANK'||e=='HDFC BANK LTD'){
 		           document.getElementById("branchCodeVal").value=document.getElementById("branchCode").value;
            	   document.getElementById("hdfcBank").value='S';
         		   document.getElementById("bankBranchType").value='SB';
                }else{
             	   document.getElementById("branchCodeVal").value=document.getElementById("branchCode").value;
             	   document.getElementById("hdfcBank").value='O';
             	   document.getElementById("bankBranchType").value='OB';
                  }

             }
            if (num == 3) {
            	  document.forms[0].event.value="return_from_view";

            	  if(e=='HDFC BANK'||e=='HDFC BANK LTD'){
            		   
            		   document.getElementById("branchCodeVal").value=document.getElementById("branchCode").value;
                	  
            		   document.getElementById("hdfcBank").value='S';
            		   document.getElementById("bankBranchType").value='SB';
                   }else{
                	  
                	   document.getElementById("branchCodeVal").value=document.getElementById("branchCode").value;
                	   document.getElementById("hdfcBank").value='O';
                	   document.getElementById("bankBranchType").value='OB';
                     }
            }
          
            document.forms[0].submit();
        }
        function getBulkorSingle(selectval,selobj)
        {

        if(selectval==1){
        	document.getElementById("bulkSingle").value = 'B';
        	document.getElementById('chknum').style.display = 'none';
        	document.getElementById('chknumBulk').style.display = '';
        	
        }
        if(selectval==2){
            
        	document.getElementById("bulkSingle").value = '';
        
        	document.getElementById('chknum').style.display = '';
        	document.getElementById('chknumBulk').style.display = 'none';
         }
                    
        }
        function getBankCode(object) {
        	document.forms[0].bankCode.value=object.value;
        }


        function refreshBranch(dropdown){
        	var url;
        	var e = document.getElementById("bankName").options[document.getElementById("bankName").selectedIndex].text;
        
        	getBankCode(dropdown);
       
             var curSel = "";
         	for(i=0; i<dropdown.options.length; i++){
		       	if (dropdown.options[i].selected == true)
		        	{
		        	    curSel = dropdown.options[i].value;	
		        	}    	
	         }
       
         var dep = 'branchName';
        if(e=='HDFC BANK'||e=='HDFC BANK LTD'){
             document.getElementById("draweeBank").value='S';
             document.getElementById("bankBranchType").value='SB';
        	   url = '/cms/AssetCheque.do?event=refresh_branch_id&bankId='+curSel+'&hdfcBank=S';
        	  
         }else{
        	  document.getElementById("draweeBank").value='O';
              document.getElementById("bankBranchType").value='OB';
            url = '/cms/AssetCheque.do?event=refresh_branch_id&bankId='+curSel+'&hdfcBank=O';;
         }    
        sendLoadDropdownReq(dep, url);
       }
        function selectCode(object) {
        	document.forms[0].branchCode.value=object.value;
        }

  function totalCheck(){     
  var i=(document.getElementById("chequeNoFrom").value);
  var m=(document.getElementById("chequeNoTo").value);
     if((i!=null && i!="")&&(m!=null && m!="")){
     if(i<m){
     var j=m-i+1;
     if(isNaN(j)){
       document.forms[0].totalNumberOfcheque.value='0';
      }else{
     	  document.getElementById("totalNumberOfcheque").value=j;
     }
     }else{
      alert("'Cheque Number From' can not greater than 'Cheque Number To'" );
      document.getElementById("chequeNoFrom").value='';
      document.getElementById("chequeNoTo").value='';
      document.getElementById("totalNumberOfcheque").value='';
     }

     }

      }

  function singlenoOfcheque(){
            var m=document.forms[0].chequeNumber.value;
            if(m!=''){
        	var k=document.forms[0].totalNumberOfcheque.value;
            if(k==''&& m!=''){
            	document.forms[0].totalNumberOfcheque.value='';
        	    document.forms[0].totalNumberOfcheque.value='1';
            }else{
                var d=0;
                d=document.forms[0].chequeNumber.value;
               
            	if(k=='0'){
                	if(d!=''){
                		document.forms[0].totalNumberOfcheque.value='1';
                	}else{
                		document.forms[0].totalNumberOfcheque.value='0';
                	}
            	}else if(document.getElementById("bulkSingle").value==''){
            		document.forms[0].totalNumberOfcheque.value='1';
            	}else if(document.getElementById("bulkSingle").value=='B'){

                	if(document.forms[0].chequeNoFrom.value==''&& document.forms[0].chequeNoTo.value==''){
            		document.forms[0].totalNumberOfcheque.value='';
                	}
            	}
            }
            }else {
            	document.forms[0].totalNumberOfcheque.value='0';
            }
        }

        function mandatory(obj){
        
            if (obj != ''){
                     document.getElementById('chknumBulk11').style.display = 'none';
                  document.getElementById('totalNumberOfcheque').style.display = '';
              }
            else {
               
                 document.getElementById('show1').innerText = " ";
                 document.getElementById('chknumBulk').style.display = 'none';
                 document.getElementById(' chknumBulk2').style.display = '';
             
            }
         }

   </script>
    <script type="text/javascript" src="js/calDriver.js"></script>
    <script language="javascript" type="text/javascript">
function imposeMaxLength(Object, MaxLen)
{
  return (Object.value.length <= MaxLen);
}
</script> 
</head>

<body >
<%@ include file="/collateral/ssc.jsp" %>

<html:form action="AssetCheque.do">

<input type="hidden" name="event"/>
<input type="hidden" name="branchCodeVal" id="branchCodeVal"/>
<input type="hidden" name="hdfcBank" id="hdfcBank"/>
<input type="hidden" name="draweeBank" id="draweeBank"/>
<input type="hidden" name="bankBranchType" id="bankBranchType"/>
<input type="hidden" name="subtype" id="subtype" value="<%=request.getParameter("subtype")%>"/>
<input type="hidden" name="indexID" id="indexID" value="<%=request.getParameter("indexID")%>"/>

<% int index = 2;

    if ("prepare".equals(request.getParameter("event")) || "create".equals(request.getParameter("event"))) {
        index = 1;
    }

%>

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
<thead>
    <tr>
        <td><h3><bean:message key="label.security.asset.cheque.detail"/> - <% if (index == 1) { %> New <% } else { %> Edit <% } %></h3></td>
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
        
     
           <tr class="even">
	                     <td width="20%" class="fieldname">
		                      Bank Name <font color="red">*</font>
	                     </td>
    	                  <td width="30%" >
    	                  
                               <html:select name="AssetPostDatedChqsForm" property="bankName" styleId="bankName" value="<%=aForm.getBankCode() %>"  onchange="javascript:refreshBranch(this);">
                               <option value="" >select</option>
                               <html:options collection="otherBankList" labelProperty="label" property="value"  />
                               </html:select><html:errors property="bankNameError"/>
                          </td>

                           <td width="20%"class="fieldname">
		                        Bank Code
                           </td>
 	                       <td width="30%">
 	                      <html:text property="bankCode" maxlength="20" size="20" readonly="true" />  
		                       
                           </td>
 	
                      </tr>
                      
              <tr class="even">
	                     <td width="20%" class="fieldname">
		                      Branch Name <font color="red">*</font>
	                     </td>
    	                  <td width="30%" >
    	                  
                                  
                               
                               	<html:select name="AssetPostDatedChqsForm"
											property="branchName" styleId="branchName" style="width:250px" value="<%=aForm.getBankCode() %>" onchange="javascript:selectCode(this);" >
                                 	<option value="">Please Select</option>
											<logic:present name="otherBranchList">
												<logic:iterate id="ob" name="otherBranchList"
													type="org.apache.struts.util.LabelValueBean"
													 scope="page">

													<%
												
														if (aForm.getBranchCode() == null) {
													%>
													<option 
														value="<%=ob.getValue()%>"><%=ob.getLabel()%></option>
													<%
														} else {
													%>
													<%
														if (aForm.getBranchCode().equals(
																				String.valueOf(ob.getValue()))) {
													%>
													<option 
														value="<%= ob.getValue() %>" selected="selected"><%= ob.getLabel() %></option>
													<%
														} else {
													%>
													<option 
														value="<%=ob.getValue()%>"><%=ob.getLabel()%></option>
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

                           <td width="20%"class="fieldname">
		                        Branch Code
                           </td>
 	                       <td width="30%">
 	                  <html:text property="branchCode" styleId="branchCode" maxlength="20" size="20" readonly="true" />  
		                       
                           </td>
 	
                      </tr>        
                      
                     <tr class="odd">
	                         <td width="20%" class="fieldname">
		                           Packet Number<font color="red">*</font>
		                        
	                          </td>
    	                      <td width="30%" >
	                         <html:text property="packetNumber" maxlength="20" size="20"  /><html:errors property="packetNumberError"/>       </td>

                               <td width="20%" class="fieldname">
		                               Loanable
                               </td>
 	                            <td width="30%" >
		                            <html:radio property="loanable" value="">Yes</html:radio>&nbsp
				                    <html:radio property="loanable" value="<%=ICMSConstant.FALSE_VALUE%>">No</html:radio> </html>
				               </td>
 	
                      </tr>
  	
	<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	 
	            <td width="20%" class="fieldname">Cheque Amount</td>
                  <td width="30%"><html:text property="chequeAmt" maxlength="23" size="34" styleId="chequeAmt" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
                 <html:errors property="chequeAmtError"/>  
                   </td>
                
                  <td width="20%" class="fieldname">Return Status</td>
                  <td width="30%"><html:text property="returnStatus" maxlength="15"  />&nbsp;
                  
                  </td>

    </tr>
    
    
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="fieldname">Start Date</td>
            <td width="30%"><html:text property="startDate"  readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('startDate', 'dd/mm/y');"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <html:errors property="startDateError"/></br><html:errors property="startDate"/></td>
            <td width="20%" class="fieldname">Maturity Date&nbsp;</td>
            <td width="30%"><html:text property="maturityDate"  readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('maturityDate', 'dd/mm/y');"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <html:errors property="maturityDateError"/></br><html:errors property="maturityDate"/></td>
        </tr>
        
  	
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="fieldname">Deposit  Date</td>
            <td width="30%"><html:text property="issueDate"  readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('issueDate', 'dd/mm/y');"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <html:errors property="issueDateError"/> <br><html:errors property="issueDateReturnDateError"/></br></td>
            <td width="20%" class="fieldname"><bean:message key="label.limit.expiry.date"/>&nbsp;</td>
            <td width="30%"><html:text property="expiryDate"  readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('expiryDate', 'dd/mm/y');"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <html:errors property="expiryDateError"/><html:errors property="expiryDateForEqualError"/></td>
        </tr>
        
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%" class="fieldname">Return Date</td>
            <td width="30%"><html:text property="returnDate"  readonly="true" size="15" maxlength="11"/>
                <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="return showCalendar('returnDate', 'dd/mm/y');"
                     onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <html:errors property="returnDateError"/></td>
      
      <td width="20%" class="fieldname">Ram Id</td>
                  <td width="30%"><html:text property="ramId" maxlength="20"  />&nbsp;
                 <html:errors property="ramIdError"/>  
                   </td>
      
        </tr>
            
        <tr class="even">
	
	      <td width="30%" class="fieldname">
	      <%if(aForm.getBulkSingle()==null  ){  %>
		  <html:radio property="bulkSingle" styleId="bulkSingle"   value="B" onclick="getBulkorSingle('1',this);totalCheck();singlenoOfcheque();">Bulk</html:radio>&nbsp
		 <html:radio property="bulkSingle" styleId="bulkSingle"  value="" onclick="getBulkorSingle('2',this);singlenoOfcheque();" >Single</html:radio> </html>
	    <%}else if( aForm.getBulkSingle().equals("")){ %>
	     <html:radio property="bulkSingle" styleId="bulkSingle"  value="B" onclick="getBulkorSingle('1',this);totalCheck();singlenoOfcheque();" disabled="true">Bulk</html:radio>&nbsp
		 <html:radio property="bulkSingle" styleId="bulkSingle"  value="" onclick="getBulkorSingle('2',this);singlenoOfcheque();" >Single</html:radio> </html>
	  
	    <%}else if( aForm.getBulkSingle().equals("B")){  %>
	        <html:radio property="bulkSingle" styleId="bulkSingle"   value="B" onclick="getBulkorSingle('1',this);totalCheck();singlenoOfcheque();" >Bulk</html:radio>&nbsp
		  <html:radio property="bulkSingle" styleId="bulkSingle"  value="" onclick="getBulkorSingle('2',this);singlenoOfcheque();" disabled="true" >Single</html:radio> </html>
	 
	    <%} %>
	     </td>
    
             <td width="20%"   ></td>
                  <td width="30%"  class="fieldname" ></td>
           
           <td width="30%"   ></td>
         </tr>
         
     <%if(aForm.getBulkSingle()==null ){ %>
          <tr class="odd" id="chknum" >
	  
	            <td width="20%" class="fieldname">Cheque Number<font color="red">*</font></td>
                  <td width="30%">
           
                  
                  <html:text property="chequeNumber" maxlength="10"   onchange="singlenoOfcheque();" />&nbsp;<html:errors property="chequeNumberError"/>
          
                  </td>
                
                  <td width="20%" class="fieldname"></td>
                  <td width="30%"  >&nbsp;
                  </td>
           </tr>
           
            
             <%}else if("".equals(aForm.getBulkSingle())){ %>
             <tr class="odd" id="chknum" >
	  
	            <td width="20%" class="fieldname">Cheque Number<font color="red">*</font></td>
                  <td width="30%">
           
                  
                  <html:text property="chequeNumber" maxlength="10" onchange="singlenoOfcheque();" />&nbsp;<html:errors property="chequeNumberError"/>
          
                  </td>
                
                  <td width="20%" class="fieldname"></td>
                  <td width="30%" >&nbsp;
                  </td>
           </tr> 
             
             
             <%}else if(aForm.getBulkSingle().equals("B")){%>
             
              <tr class="odd" id="chknumBulk"  >
	  
	            <td width="20%" class="fieldname">Cheque Number From<font color="red">*</font></td>
                  <td width="30%">
           
                  
                  <html:text property="chequeNoFrom" styleId="chequeNoFrom" maxlength="10" onblur="totalCheck();mandatory(this.value);"  />&nbsp;<html:errors property="chequeNoFromError"/>
          
                 
                  <td width="20%" class="fieldname">Cheque Number To<font color="red">*</font></td>
                  <td width="30%" > <html:text property="chequeNoTo" styleId="chequeNoTo" maxlength="10" onblur="totalCheck();mandatory(this.value);"  />&nbsp;<html:errors property="chequeNoToError"/>
                  </td>
           </tr> 
   
             
            <%} %>
             
    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>" id="chknumBulk" style="display:none;" >
	  
	            <td width="20%" class="fieldname">Cheque Number From<font color="red">*</font></td>
                  <td width="30%">
           
                  
                  <html:text property="chequeNoFrom" styleId="chequeNoFrom" maxlength="10" onblur="totalCheck();mandatory(this.value);"  />&nbsp;<html:errors property="chequeNoFromError"/>
          
                 
                  <td width="20%" class="fieldname">Cheque Number To<font color="red">*</font></td>
                  <td width="30%"> <html:text property="chequeNoTo" styleId="chequeNoTo" maxlength="10" onblur="totalCheck();mandatory(this.value);"  />&nbsp;<html:errors property="chequeNoToError"/>
                  </td>
           </tr> 
   <%if(aForm.getBulkSingle()==null  ){  %>
    <tr class="even" id="chknum" >
	  
	            <td width="20%" class="fieldname">Total Number of Cheque</font></td>
                  <td width="30%">
           
                  
                  <html:text property="totalNumberOfcheque" styleId="totalNumberOfcheque" maxlength="10" readonly="true"   />&nbsp;
          
                  </td>
                
                  <td width="20%" class="fieldname"></td>
                  <td width="30%" >&nbsp;
                  </td>
           </tr>  
      <%}else if( aForm.getBulkSingle().equals("")){ %>
       <tr class="even" id="chknum" >
	  
	            <td width="20%" class="fieldname">Total Number of Cheque</font></td>
                  <td width="30%">
           
                  
                  <html:text property="totalNumberOfcheque" styleId="totalNumberOfcheque" maxlength="15" value="1" readonly="true" />&nbsp;
          
                  </td>
                
                  <td width="20%" class="fieldname"></td>
                  <td width="30%" >&nbsp;
                  </td>
           </tr>  
       <%}else if( aForm.getBulkSingle().equals("B")){  %>
        <tr class="even" id="chknum" >
	  
	            <td width="20%" class="fieldname">Total Number of Cheque</font></td>
    <td width="30%" id="chknumBulk11">                  
       <script>  
        var u=parseInt(document.getElementById("chequeNoFrom").value); 
        var d=parseInt(document.getElementById("chequeNoTo").value);
        var g=d-u+1;
      </script>           
            <% String str="<script>document.writeln(g);</script>";%>
           <%=str %>      
                 &nbsp;
    </td>
    <td id="chknumBulk22"  >
           <html:text property="totalNumberOfcheque" styleId="totalNumberOfcheque" maxlength="15" value="1" readonly="true" style="display:none;" />&nbsp;
           
    </td>
                
                  <td width="20%"  ></td>
                 
                  </td>
                  
           </tr> 
         <%} %>    
          <tr class="odd">
	                         <td width="20%" class="fieldname">
		                          Remarks
	                          </td>
    	                      <td width="30%" colspan="3">
	                    <html:textarea  property="remarks" rows="2"cols="60" onkeypress="return imposeMaxLength(this, 200);"  onkeyup="limitTextInput(this,40,'Description of Asset ')"/>
	               
	               <html:errors property="remarksError"/>
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
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(<%=index%>)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/ok2.gif',1)">
                <img src="img/ok1.gif" name="Image142" border="0" id="Image142"/></a></td>
        <td width="100" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image4411" border="0" id="Image4411"/></a></td>
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
