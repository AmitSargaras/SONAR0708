<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/taglib/IntegroTag.tld" prefix="integro"%>

<%@page language="java" import="com.integrosys.base.uiinfra.tag.PageIndex,                                
                                com.integrosys.cms.ui.geography.GeographyAction,
                                com.integrosys.cms.ui.geography.GeographyForm,
                                com.integrosys.base.businfra.search.SearchResult,
                                com.integrosys.cms.app.geography.bus.OBGeography,
                                com.integrosys.base.techinfra.propertyfile.PropertyManager,                                
                                java.util.Collection,
                                java.util.List"%>

<script language="JavaScript" type="text/JavaScript">

	function continentList()
	{
	 	document.forms[0].action      	= "Geography.do";
 	  	document.forms[0].event.value 	= "view_list_continent";     	
 	  	document.forms[0].submit();
	}

	function countryList()
	{
	 	document.forms[0].action      	= "Country.do";
 		document.forms[0].event.value 	= "view_list_country";     	
 		document.forms[0].submit(); 	 		
	}

	function regionList()
	 {
 	 	document.forms[0].action      	= "Region.do";
     	document.forms[0].event.value 	= "view_list_region";     	
     	document.forms[0].submit();
	 }

	function stateList()
 	{
 	 	document.forms[0].action      	= "State.do";
     	document.forms[0].event.value 	= "view_list_state";     	
     	document.forms[0].submit();
 	}

    function cityList()
 	{
 	 	document.forms[0].action      	= "City.do";
   		document.forms[0].event.value 	= "view_list_city";     	
     	document.forms[0].submit();
 	}
 	
</script>

<html:form action="Country.do">
<html:hidden property="event"/>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
    <tr height="95%">
        <td valign="top">
        	<div id="contentCanvas" style="height:100%;width:100%;">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td width="70%">
                        <center><h3>Geography Contents</h3></center> 
                    </td>
                </tr>
                 <tr>
                    <td colspan="2"><hr/></td>
                </tr>                 
                <tr>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td>&nbsp;</td>
               </tr>            
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                           <tr class="even">                                 
                                 <td><center><h3><a href="javascript:countryList()">Country</a></h3></center></td>
                           </tr>
                           <tr class="odd">                                 
                                 <td><center><h3><a href="javascript:regionList()">Region</a></h3></center></td>
                           </tr>                           
                           <tr class="even">                                 
                                 <td><center><h3><a href="javascript:stateList()">State</a></h3></center></td>
                           </tr>
                           <tr class="odd">                                 
                                 <td><center><h3><a href="javascript:cityList()">City</a></h3></center></td>
                           </tr>      
                        </table>
                    </td>
                </tr>
            </table>
            </div>
        </td>
    </tr>
</table>
</html:form>   