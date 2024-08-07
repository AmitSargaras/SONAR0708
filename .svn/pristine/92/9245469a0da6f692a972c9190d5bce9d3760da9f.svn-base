<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 org.apache.struts.util.LabelValueBean,
				 com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
                 com.integrosys.cms.ui.manualinput.security.SecDetailForm" %>
<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton" %>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Set"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%SecDetailForm form = (SecDetailForm)request.getAttribute("SecDetailForm");
System.out.println("////////////////*********************** getMonitorProcess "+form.getMonitorProcess());

//List securityTypeSubTypeForParty=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.security.SecDetailAction.securityTypeSubTypeForParty");
//Added by Uma Khot: PHASE 3 CR Start:For Create Multiple Security : validation Popup message
String securityTypeSubTypeStr=(String)request.getAttribute("securityTypeSubTypeStr");

System.out.println("////////////////*********************** LIMIT PROFILE ID:"+form.getLimitProfileID());
System.out.println("////////////////*********************** securityTypeSubTypeStr:"+securityTypeSubTypeStr);

String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);
//Added by Uma Khot: PHASE 3 CR End: For Create Multiple Security :  validation Popup message
%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%><html>
 <head>
  <!-- InstanceBeginEditable name="doctitle" -->
  <title>Untitled Document</title>
  <!-- InstanceEndEditable -->
  
  <!-- InstanceBeginEditable name="CssStyle" -->
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
  <!-- InstanceEndEditable -->
  <!-- InstanceBeginEditable name="head" -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script type="text/javascript" src="js/ajaxDropdown.js"></script>
 </head>
 <body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
   <script language="javascript">

   function setMaxLenght(field,maxChars)
   {
         if(field.value.length >= maxChars) {
            event.returnValue=false;
            return false;
         }
   }
   
   // Added By Dayananda Laishram : For CR Bill As colleteral validation on 05-May-2015 || Starts
   function disableSecurityPriority()
   {
	   var colCode = document.forms[0].collateralCode.value;
	   if("COL0000139"==colCode)
	   {
		   
		   document.getElementById("monitorProcessN").checked = true;
		   document.getElementById("monitorProcessY").checked = false;
		   document.getElementById('monitorFrequency').disabled = true;
		   
	   }
	   else
		{
		  
		   document.getElementById("monitorProcessY").checked = true;
		   document.getElementById("monitorProcessN").checked = false;
		   document.getElementById('monitorFrequency').disabled = false;
		}
		
	   
   }
 // Added By Dayananda Laishram : For CR Bill As colleteral validation on 05-May-2015 || Ends
 
   <!--
     function submitSecurity()
     {
	 //Added by Uma Khot: PHASE 3 CR Start:For Create Multiple Security : validation Popup message
	    var securityType=document.getElementById("secType");
	    var securitySubtype=document.getElementById("secSubtype");
	   // alert("SEcurity securityType:"+securityType.options[securityType.selectedIndex].text);
	   // alert("SEcurity securitySubtype:"+securitySubtype.options[securitySubtype.selectedIndex].text);
	    var securityTypeName=securityType.options[securityType.selectedIndex].text;
		var securitySubtypeName=securitySubtype.options[securitySubtype.selectedIndex].text;
		var securityTypeSubTypeStr= '<%= securityTypeSubTypeStr %>';
		var securityTypeSubType=securityTypeName+":"+securitySubtypeName;

		 var securityTypeNameCode=securityType.options[securityType.selectedIndex].value;
		 var securitySubtypeNameCode=securitySubtype.options[securitySubtype.selectedIndex].value;
		 var securityTypeSubTypeCode=securityTypeNameCode+":"+securitySubtypeNameCode;
	//	alert(securityTypeSubTypeStr);
	//	alert(":"+securityTypeSubType+":");
		
		<%  if(null!=securityTypeSubTypeStr && !"".equals(securityTypeSubTypeStr)){%>
		
	//	alert(securityTypeSubTypeStr);
		
		if(securityTypeSubTypeStr.indexOf(securityTypeSubTypeCode) >=0){
			
		var answer=  confirm(securityTypeSubType+" Security is already exist for the party. Do you want to proceed.");
	
		if(answer == true){
			document.forms[0].event.value = 'create';	
			document.forms[0].submit();
			}
			}else{ 
			document.forms[0].event.value = 'create';	
		    document.forms[0].submit();
			     } 
			    <%}else{  %>
		//Added by Uma Khot: PHASE 3 CR End:For Create Multiple Security : validation Popup message
		document.forms[0].event.value = 'create';	
		document.forms[0].facCat.value = '<%=(String)request.getAttribute("facCat")%>';	    
        document.forms[0].submit();

        <%}%>
     }

     function cancelSubmit()
     {
	 	document.forms[0].event.value = 'cancel';
	 	document.forms[0].facCat.value = '<%=(String)request.getAttribute("facCat")%>';
        document.forms[0].submit();
		//var url = '<%= (String)request.getAttribute("returnUrl") %>';
     }


     function createPledgor()
     {
		document.forms[0].fromEvent.value = 'update';
		document.forms[0].indexID.value = '';
        document.forms[0].event.value =  'create_sub_pledgor';
		document.forms[0].submit();	
     }

     function deletePledgor() 
     {
		document.forms[0].itemType.value = 'pledgor';
		document.forms[0].event.value = 'delete_item';
		document.forms[0].submit(); 
     }

     function refreshBranch(dropdown)
     {
	  var curSel = "";
	  for(i=0; i<dropdown.options.length; i++)
	  {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}
        }	
        var dep = 'secBookingOrg';
        var url = '/cms/MISecurity.do?event=refresh_org&secCountry='+curSel; 
        sendLoadDropdownReq(dep, url);
     }	

     function refreshSubtype(dropdown)
     {
	  var curSel = "";
	  for(i=0; i<dropdown.options.length; i++)
	  {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}
        }	
        var dep = 'secSubtype';
        var url = '/cms/MISecurity.do?event=refresh_subtype&securityType='+curSel; 
        sendLoadDropdownReq(dep, url);
     }	


     function refreshCollateralCode(dropdown)
     {
	  var curSel = "";
	  for(i=0; i<dropdown.options.length; i++)
	  {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}
        }	
        var dep = 'collateralCode';
        var url = '/cms/MISecurity.do?event=refresh_collateral_code&subtype='+curSel; 
        sendLoadDropdownReq(dep, url);
     }	

     function changeCurrency(){

if(document.forms[0].secType.value=='MS'){
document.forms[0].secCurrency.value='INR'
document.forms[0].secCurrency.readonly=true;
}

     }
     -->
   </script> 	
 
   <html:form action="MISecurity.do">
        <html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>
    <input type="hidden" name="event" value="" />
    <input type="hidden" name="fromEvent" value="" />
    <input type="hidden" name="indexID" value="" />
    <input type="hidden" name="itemType" value="" />	
	<html:hidden property="limitProfileID"/>  
	<html:hidden property="customerID"/>
    <html:hidden property="securityId"/>
    <html:hidden property="isCreate" />
    <bean:define id="itrxValue" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.secTrxObj"  type="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue" scope="session"/>	
    <bean:define id="formObj" name="SecDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.security.SecDetailForm"/>
    <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
	<input type="hidden" name="facCat" value="<%=(String)request.getAttribute("facCat")%>" />
    			
    <p class="required"><font color="#FF0000">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
      <thead>
        <tr> 
          <td width="81%" ><h3>Limit Security Mapping - Security Details</h3></td>
          <td width="19%" align="right" valign="bottom" >&nbsp; </td>
        </tr>
        <tr> 
          <td colspan="2"> <hr/> </td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
              <tbody>
                <tr class="odd">
                  <td class="fieldname" width="20%">Source Security ID&nbsp;</td>
                  <td width="30%">
                    <bean:write name="SecDetailForm" property="sciColId" />&nbsp;
		    <html:hidden property="sciColId" />
		  </td>
		  <td class="fieldname" width="20%">Security Booking Country&nbsp;<font color="#FF0000">*</font></td>
                  <td width="30%">
                    <html:select property="secBookingCountry" onchange="javascript:refreshBranch(this)">
		      <option value="">Please Select </option>	
                      <html:options collection="countryList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="secBookingCountry" />	
                  </td>
                </tr>
                <tr class="even">
                  <td class="fieldname" width="20%">Security Branch Name&nbsp;</td>
                  <td width="30%">
                    <html:select property="secBookingOrg">
		      <option value="">Please Select </option>	
                      <html:options collection="orgList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="secBookingOrg" />	
		  </td>
		  <td class="fieldname" width="20%">Security Currency&nbsp;<font color="#FF0000">*</font></td>
                  <td width="30%">
                    <html:select property="secCurrency" value="INR" >
		      		 <option value="">Please Select </option>	
                      <html:options collection="currencyList" property="value" labelProperty="label" />
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="secCurrency" />	
                  </td>
                </tr>	
		<tr class="odd">
				<td class="fieldname" width="20%">Security Type&nbsp;<font color="#FF0000">*</font></td>
                  <td width="30%">
                    <html:select property="secType" onchange="javascript:refreshSubtype(this),changeCurrency()" styleId="secType">
		      <option value="">Please Select </option>	
                      <html:options collection="secTypeList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="secType" />	
                  </td>
                  <td class="fieldname" width="20%">Security Sub-Type&nbsp;<font color="#FF0000">*</font></td>
                  <td width="30%">
                    <html:select property="secSubtype" onchange="javascript:refreshCollateralCode(this)" styleId="secSubtype">
		      <option value="">Please Select </option>	
                      <html:options collection="secSubtypeList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="secSubtype" />	
		  </td>
         </tr>	  
         <tr class="odd">
            <td class="fieldname">Collateral Code-Name<font color="#FF0000">*</font></td>
            <td width="30%">
             <html:select property="collateralCode"  onchange="disableSecurityPriority()">
		      <option value="">Please Select </option>	
                      <html:options collection="collateralList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="collateralCode" />	</td>
		      <td class="fieldname">Security Priority <font color="#FF0000">*</font></td>
            <td><html:radio property="secPriority" value="Y"></html:radio>
              Primary 
              <html:radio property="secPriority" value="N"></html:radio>
              Secondary <html:errors property="secPriority" /></td>
          </tr>
          <tr class="odd">
          <td class="fieldname">Monitoring Process of Collaterals<font color="#FF0000">*</font></td>
		     <td>
		     <%if(form.getMonitorProcess()==null){ %>
		     <input type="radio" id="monitorProcessY" name="monitorProcess" value="Y" onclick="document.getElementById('monitorFrequency').disabled=false">Yes</input>
		     <input type="radio" id="monitorProcessN" name="monitorProcess" value="N" onclick="document.getElementById('monitorFrequency').disabled=true">No</input>
		     
		     <%}else{ %>
		     <html:radio property="monitorProcess" value="Y" onclick="document.getElementById('monitorFrequency').disabled=false" ></html:radio>Yes
		     <html:radio property="monitorProcess" value="N" onclick="document.getElementById('monitorFrequency').disabled=true"></html:radio>No
		     <%} %>		    
			<html:errors property="monitorProcess" />	</td>
           
              
            <td class="fieldname">Monitoring Frequency  of Collaterals<font color="#FF0000">*</font></td>
            <%if(form.getMonitorProcess()!=null && !form.getMonitorProcess().equals("")){ %>            
            <%if(form.getMonitorProcess().equalsIgnoreCase("Y")){
            		%>
            <td>
            <html:select property ="monitorFrequency" styleId="monitorFrequency" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%}else{
				%>
			<td>
			 <html:select property ="monitorFrequency" styleId="monitorFrequency" disabled="true">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%} }else{
				%>
			<td>
			<html:select property ="monitorFrequency" styleId="monitorFrequency" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" />
			</html:select>
			<html:errors property="monitorFrequency" />
			</td>
			<%} %>
			
           
          </tr>
         
		<tr class="even">
		  <td class="fieldname" width="20%">Security Reference Note&nbsp;</td>
                  <td colspan="3">
                    <html:textarea property="secReferenceNote" rows="4" style="width:80%" onkeypress="setMaxLenght(this,'100')"/>
                    <html:errors property="secReferenceNote" />
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table>
    
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
      <tr><td>&nbsp;</td></tr>
      <logic:equal name="itrxValue" property="status" value="<%= ICMSConstant.STATE_REJECTED %>">	
        <tr>
          <td colspan="2">
	    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
              <tbody>
                <tr>
                  <td class="fieldname">Remarks</td>
                  <td class="odd">
                    <html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
                    <html:errors property="remarks"/>
                  </td>
                </tr>
                <tr>
                  <td class="fieldname">Last Action By</td>
                  <td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
                </tr>
                <tr class="odd">
                  <td class="fieldname">Last Remarks Made</td>
                  <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </logic:equal>
    </table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <td><a href="javascript:submitSecurity()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/ok2.gif',1)">
        	<img src="img/ok1.gif" name="Image41" border="0" id="Image4" /></a></td>
        	<td><a href="javascript:cancelSubmit()" ><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
	   <logic:empty name="returnUrl" scope="request"> 
		<td>&nbsp;</td>
	  </logic:empty>	
	</tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </table>    
  </html:form>
 </body>	