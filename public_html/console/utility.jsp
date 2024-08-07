<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
<head>
	<title>Product Console</title> 
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />

	<%@ include file="/template/stylesheet_template.jsp" %>

<style type="text/css">
.nolines {  font-size: 11px; border: 0px solid #CCCCFF;  }
.linesmost { font-size: 11px;   border-left: 0px; border-bottom: 0px; border-top: 1px solid #CCCCFF; border-right: 1px solid #CCCCFF;  background-color: #FFFFFF; padding-bottom: 12px}
.graytext { font-family: sans-serif; color: #666666; font-size: 14px;}
.desctext { font-family: sans-serif; color: #666666; font-size: 12px; line-height: 130%}
.bluebold { font-weight: bold; color: #0000F0; font-size: 14px; font-family: Helvetica,sans-serif;}
a .bluebold  {  text-decoration: underline; color: blue  }
</style>

</head>

<body class="content">

<table border="0" cellpadding="20" cellspacing="0" width="94%" height="94%">
<tr>
	<td  height="50%" width="50%" valign="top">

<table  border="0" cellpadding="7" cellspacing="0" width="100%" >
	<tr> 
    	<td class="nolines" align="top">
    		<img src="<%=request.getContextPath()%>/img/arrowrighta.gif" align="left" alt="">
    			<span class="bluebold">SmartLender Product Suite</span>
		</td>
  	</tr>
</table>

<table border="0" cellpadding="5" cellspacing="0" width="100%" >
	<tr>                   
    	<td class="linesmost" align="top">
		   		<span class="desctext">Find <a target="_blank" rel="noopener noreferrer" href="http://www.integrosys.com/english/products/index.htm">product information</a> about the SmartLender software family that creates on-demand financial solutions designed by bankers for bankers.</span>
     	</td>
	</tr>
</table>
	</td>
	
	<td  height="50%" width="50%" valign="top"> 

<table  border="0" cellpadding="7" cellspacing="0" width="100%" >
	<tr> 
    	<td class="nolines" align="top">
    		<img src="<%=request.getContextPath()%>/img/arrowrighta.gif" align="left" alt="">
    			<label for="abouttext"><span class="bluebold">About</span>
				<span class="graytext"> your Application</span></label>
		</td>
  	</tr>
</table>

<table border="0" cellpadding="5" cellspacing="0" width="100%" >
	<tr>                   
    	<td class="linesmost" align="top">

<html>
<head>
</head>
<body>

<STYLE>
TEXTAREA { width:95%; background-color: #ffffff; border-style: none; scrollbar-face-color:#CCCCCC; scrollbar-shadow-color:#FFFFFF; scrollbar-highlight-color:#FFFFFF; scrollbar-3dlight-color:#6B7A92; scrollbar-darkshadow-color:#6B7A92; scrollbar-track-color:#E2E2E2; scrollbar-arrow-color:#6B7A92  }
</STYLE>

<textarea name="abouttext" rows='6' cols='40' CLASS="desctext" READONLY>
<%= PropertyManager.getValue("reportSystemName", "Collateral Management System") %>

Build Number: <%= PropertyManager.getValue("build.number", "-") %>
Build Date: <%= PropertyManager.getValue("build.date", "-") %>
Build Environment: <%= PropertyManager.getValue("build.env", "-") %>
</textarea>
</body>
</html>

     	</td>
	</tr>
</table>

	</td>
	
</tr>
	
<tr>

	<td  width="50%" valign="top"> 

<table  border="0" cellpadding="7" cellspacing="0" width="100%" >
	<tr> 
    	<td class="nolines" align="top">
    		<img src="<%=request.getContextPath()%>/img/arrowrighta.gif" align="left" alt="">

    			<span class="bluebold">J2EE Resources</span>
   		
		</td>
  	</tr>
</table>

<table border="0" cellpadding="5" cellspacing="0" width="100%" >
	<tr>                   
    	<td class="linesmost" align="top">
    		
		   		<span class="desctext">Get the latest technical articles, best practices, tutorials and much more:<br>
					<li><a href="http://www.javasoft.com/" target="_blank" rel="noopener noreferrer">Sun Developer Network (SDN)</a></li>
					<li><a href="http://www.bea.com/framework.jsp?CNT=index.htm&FP=/content/products/weblogic&WT.ac=topnav_products_weblogic" target="_blank" rel="noopener noreferrer">Weblogic Product Family</a></li>
					<li><a href="http://www.ibm.com/developerworks/websphere/zones/was/" target="_blank" rel="noopener noreferrer">WebSphere Application Server Zone</a></li>
					
				</span>
     	</td>
	</tr>
</table>

	</td>
	
	<td  width="50%" valign="top"> 

<table  border="0" cellpadding="7" cellspacing="0" width="100%" >
	<tr> 
    	<td class="nolines" align="top">
    		<img src="<%=request.getContextPath()%>/img/arrowrighta.gif" align="left" alt="">    		
    			<span class="bluebold">Documentation</span>
		</td>
  	</tr>
</table>


<table border="0" cellpadding="5" cellspacing="0" width="100%" >
	<tr>                   
    	<td class="linesmost" align="top">
    		
		   		<span class="desctext">For documentation, including articles and PDF files, visit:

				<li><a href="http://java.sun.com/javaee/reference/" target="_blank" rel="noopener noreferrer">Sun Java EE APIs & Docs</a></li>
				<li><a href="http://edocs.bea.com/" target="_blank" rel="noopener noreferrer">BEA eDocs</a></li>
				<li><a href="http://www14.software.ibm.com/webapp/wsbroker/redirect?version=pix&product=was-nd-dist&topic=" target="_blank" rel="noopener noreferrer">IBM online information center</a></li>
     	</td>
	</tr>
</table>

	</td>
	
</tr>
	
</table>
    
</body>
</html>


