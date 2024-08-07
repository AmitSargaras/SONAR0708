<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
	<title></title>
</head>
<%
	String context = request.getContextPath() + "/";
%>


<script language="JavaScript" type="text/javascript"	src="<%=context%>js/itgUtilities.js"></script>
	
<script type="text/javascript">

function startP(){        
	document.getElementById("114").disabled=true;
	
	window.location.href ='systemHandOff.do?event=performAdfRbi';
	newShowSilkScreen();
		
}


</script>
<% 
	//String status = (String)request.getAttribute("log");
%>

<body>
	<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:30px">
  		<thead>
    		<tr>
      			<td>
      				<h3>Confirmation
      				<hr/></h3>
        	   </td>
    		</tr>
 		</thead>
  		<tbody>
   		   <tr>
      			<td>
      				<table width="100%" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          				<thead>
          				</thead>
         				 <tbody>
            				<tr>
              					<td height="111" class="odd" style="text-align:left">ADF RBI Activity : Would you like to start RBI ADF reports activity.<br></td>
           					</tr>
           					<tr>
              					<td height="51" class="odd" style="text-align:left">
             						<input type="button" id="114" name="start" value="Start" onclick="startP()" />
             						
             					</td>
           					 </tr>
          				</tbody>
        			</table>
        		</td>
   		 </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
