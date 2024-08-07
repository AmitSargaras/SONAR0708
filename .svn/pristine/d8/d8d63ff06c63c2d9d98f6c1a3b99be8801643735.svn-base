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


   function fileupload(system)
	{
	 	document.forms[0].action      	= "fileUpload.do";
 	  	document.forms[0].event.value 	= "list_system_files"; 
 	  	document.forms[0].fileUploadSystem.value 	= system; 
 	  	document.forms[0].submit();
	}


	
 	
</script>

<html:form action="fileUpload.do">
<html:hidden property="event"/>
<html:hidden property="fileUploadSystem"/>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
    <tr height="95%">
        <td valign="top">
        	<div id="contentCanvas" style="height:100%;width:100%;">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td width="70%">
                        <center><h3>System File Upload</h3></center> 
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
                                 <td><center><h3><a href="javascript:fileupload('UBS')"  onclick="javascript : newShowSilkScreen()">UBS File Upload</a></h3></center></td>
                           </tr>
                           <tr class="odd">                                 
                                 <td><center><h3><a href="javascript:fileupload('FINWARE')"  onclick="javascript : newShowSilkScreen()">Finware/FinwareFW File Upload</a></h3></center></td>
                           </tr>                                          
                            <tr class="even">                                 
                                 <td><center><h3><a href="javascript:fileupload('HONGKONG')"  onclick="javascript : newShowSilkScreen()">Hongkong File Upload</a></h3></center></td>
                           </tr>
                            <tr class="odd">                                 
                                 <td><center><h3><a href="javascript:fileupload('BAHRAIN')"  onclick="javascript : newShowSilkScreen()">Bahrain File Upload</a></h3></center></td>
                           </tr>
                              <tr class="even">                                 
                                 <td><center><h3><a href="javascript:fileupload('FD')"  onclick="javascript : newShowSilkScreen()">FD File Upload</a></h3></center></td>
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
