<%@ page import="java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>



<html>
<head>
<title>Untitled Document</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function submit() {      	
    	document.forms[0].submit();
}
-->
</script>
</head>




<body>
   <html:form action="AuditCheckList" >
    <input type="hidden" name="event" value="list_all"/>
    <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
      <thead>
        <tr>
          <td><br></td>
        </tr>
        <tr>
          <td><br></td>
        </tr>
  </thead>
    <tbody>
     <tr>
          <td >
          <table  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
    	  <thead> 
    	  	<tr> 
    	    		<td width="12%" colspan ="2">Please enter search criteria</td>    	    
    	  	</tr>
    	  </thead>
          <tbody>        
            <tr class="even">
                <td class="fieldname" >
                    As of Date : 
                </td>              
                <td >
                    <html:text property="asOfDate"  readonly="true"/>
                    <img src="img/calendara.gif"  name="Image11" border="0" id="Image11" onclick="return showCalendar('asOfDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image11','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="asOfDate"/>
                </td>
            </tr>
          </tbody>
          </table>
          </td>
    </tr>
    </tbody>
    <tr>
        <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="150" align="center">
                <tr >
                    <td width="75" valign="baseline" align="center">                        
                        <input type="button" name="Button" value="Go" class="btnNormal" style="width:50" onclick="submit()"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
    </html:form>
    
 </body>
</html>
