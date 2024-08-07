<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 java.util.List,
				 com.integrosys.cms.ui.manualinput.security.MISecurityUIHelper,
                 com.integrosys.cms.ui.manualinput.security.SecPledgorDtlForm" %>

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
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <script language="javascript">
  <!--
	function validateFormData(tp)
	{
		if (tp == 1)
		{
			if (document.forms[0].leIdType.value == "" || document.forms[0].leId.value == "")
			{
				document.getElementById("le_error").innerHTML = '<font color="#FF0000" size="1">Please input le id type and le id</font>';
				return false;
			} 
			else
			{
				document.forms[0].customerName.value = '';
				document.forms[0].IDType.options[0].selected = true;
				document.forms[0].IDNo.value = "";	
				document.getElementById("le_error").innerHTML = '&nbsp';
			}
		}
		else if (tp == 2)
		{
			if (document.forms[0].customerName.value == "")
			{
				document.getElementById("custname_error").innerHTML = '<font color="#FF0000" size="1">Please input customer name</font>';
				return false;		
			}
			else
			{
				document.forms[0].leIdType.options[0].selected = true;
				document.forms[0].leId.value = "";	
				document.forms[0].IDType.options[0].selected = true;
				document.forms[0].IDNo.value = "";	
				document.getElementById("custname_error").innerHTML = '&nbsp';
			}
		}
		else if (tp == 3)
		{
			if (document.forms[0].IDType.value == "" || document.forms[0].IDNo.value == "")
			{
				document.getElementById("iDNo_error").innerHTML = '<font color="#FF0000" size="1">Please input ID Type and ID No.</font>';
				return false;
			} 
			else
			{
				document.forms[0].customerName.value = '';
				document.forms[0].leIdType.options[0].selected = true;
				document.forms[0].leId.value = "";	
				document.getElementById("iDNo_error").innerHTML = '&nbsp';
			}
		}
		return true;	
	}

	function searchPledgor(tp)
	{
		if (validateFormData(tp))
		{
			document.forms[0].submit();
		}
	}

	function savePledgorLink()
	{
		document.forms[0].event.value = 'create';
		document.forms[0].submit();
	}

	function cancelSubmit()
	{
		document.forms[0].event.value = 'cancel';
		document.forms[0].submit();
	}
	-->
  </script>
  <html:form action="MISecPledgorDetail.do">
    <input type="hidden" name="event" value="search_plgdtl"/>
    <html:hidden property="fromEvent"/>
    <html:hidden property="indexID"/>
    <html:hidden property="isCreate"/> 
	
	<html:hidden property="limitProfileID"/>
	<html:hidden property="customerID"/>
	
    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
	<td width="100%" valign="top">         
      	  <table id="window" border="0" cellpadding="0" cellspacing="0">
	    <tr>
	      <td>			 			
		<table class="tblInput" id="custsearch" style="margin-top:25px" width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
                  <thead>
                    <tr> 
                      <td colspan="3">Please enter search criteria</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr class="even">
                      <td width="37%" class="fieldname">LE ID Type / LE ID : </td>
                      <td width="48%">
                        <html:select property="leIdType">
		          <option value="">Please Select </option>	
                          <html:options collection="sourceIdList" property="value" labelProperty="label"/>
                    	</html:select>          
                        <html:text property="leId"/>
			&nbsp;<span id="le_error">&nbsp;</span>
                      </td> 
                      <td width="15%">
			<input onClick="javascript:searchPledgor(1)" type="button" id="AddNew2" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
		      </td>
                    </tr>          
                    <tr class="odd">
                      <td class="fieldname">Customer Name </td>
                      <td>
			<html:text property="customerName"/>
			&nbsp;<span id="custname_error">&nbsp;</span>
		      </td> 
                      <td>
			<input onClick="javascript:searchPledgor(2)" name="AddNew3" type="button" id="AddNew3" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                      </td>
                    </tr>
					<tr class="even">
                      <td width="37%" class="fieldname">ID Type </td>
                      <td width="48%">
                        <html:select property="IDType">
		          <option value="">Please Select </option>	
                          <html:options collection="idTypeList" property="value" labelProperty="label"/>
                    	</html:select>          
                      </td> 
                      <td width="15%">
		      </td>
                    </tr>          
					<tr class="odd">
                      <td class="fieldname">ID No. </td>
                      <td>
			<html:text property="IDNo"/>
			&nbsp;<span id="iDNo_error">&nbsp;</span>
		      </td> 
                      <td>
			<input onClick="javascript:searchPledgor(3)" name="AddNew4" type="button" id="AddNew4" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" />
                      </td>
                    </tr>
                  </tbody>
                </table>
                <%
		int count = 0;
		%>
		<logic:present name="displayList" scope="request">
		<%
		count = 1;
		%>
                <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
                  <tr> 
                    <td> 
		      <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                          <tr> 
                            <td width="8%">S/N</td>
                            <td width="31%">Customer Name</td>
                            <td width="24%">LE ID </td>
                            <td width="26%">LE ID Type </td>
                            <td width="11%">Action</td>
                          </tr>
                        </thead>
                        <tbody>
                          <logic:notPresent name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.customerList" scope="session">      
       			    <tr class="odd">
        		      <td colspan="5"><bean:message key="label.global.not.found"/></td>
       			    </tr> 
      			  </logic:notPresent>
      			  <logic:present name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.customerList" scope="session"> 
       			    <% int custSize = ((List)(session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.customerList"))).size();
	  		       if (custSize > 0) 
	  		       {
       			    %> 
			    <logic:iterate id="custItem" indexId="custind" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.customerList" scope="session" type="com.integrosys.cms.app.collateral.bus.OBCollateralPledgor">
			      <tr class="<%=custind.intValue()%2==0?"even":"odd"%>">	
			        <td class="index"><%= custind.intValue() + 1 %></td>
         		        <td><%= custItem.getPledgorName() %></td>
         		        <td><%= custItem.getLegalID() %></td>
         		        <td><%= new MISecurityUIHelper().getLeSystemDesc(custItem.getSourceId()) %></td>
         		        <td>
          			  <html:multibox property="selectedPlegor"  value="<%= custind.toString() %>" />&nbsp;
         		        </td>
			      </tr>	
       			    </logic:iterate>
			    <% }
          		       else
	  		       {
       			    %>
			      <tr class="odd">
         		        <td colspan="5"><bean:message key="label.global.not.found"/></td>
        		      </tr>
       			    <%
	  		       }
       			    %>		    
      			  </logic:present>
                        </tbody>
                      </table>
		    </td>
                  </tr>
                </table>
		<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  		  <tr> 
    		    <td width="96">&nbsp;</td>
    		    <td width="54">&nbsp;</td>
  		  </tr>
  		  <tr> 
    		    <td>
		      <a href="javascript:savePledgorLink()" ><img src="img/save1.gif" name="Image14"border="0" id="Image14" /></a>
		    </td>
		    <td>
		      <a href="javascript:cancelSubmit()" ><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a>
		    </td>
  		  </tr>
  		  <tr> 
    		    <td>&nbsp;</td>
    		    <td>&nbsp;</td>
  		  </tr>
		</table>    		    
		</logic:present>		
		<%
		if(count==0){
		%>
		<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr> 
		    <td width="96">&nbsp;</td>
		</tr>
  		<tr> 
		   <td>
		      <a href="javascript:cancelSubmit()" ><img src="img/return1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a>
		    </td>
  		</tr>
		</table>
		<%
		}
		%>
	      </td>
            </tr>	     
            <tr> 
              <td>&nbsp;</td> 		 
            </tr>		  
          </table>    
	</td>
      </tr>		
    </table>
  </html:form>
</body>
<!-- InstanceEnd -->
</html>
    

