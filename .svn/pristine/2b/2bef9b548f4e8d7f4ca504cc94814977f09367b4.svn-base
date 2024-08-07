
<%@ page import="java.util.Collection,
java.util.Iterator,
com.integrosys.cms.app.commoncodeentry.*,
com.integrosys.cms.app.commoncode.bus.CommonCodeTypeSearchResultItem,
com.integrosys.cms.app.common.constant.ICMSConstant,
com.integrosys.base.uiinfra.common.ICommonEventConstant,
com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header$
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/

Collection collection = (Collection)request.getAttribute ( CommonCodeEntryConstant.EDITABLE_PARAM_LIST ) ;

if ( collection == null )
{
    collection = new ArrayList () ;
}

Iterator iter = collection.iterator () ;

String event = CommonCodeEntryConstant.EDIT_SELECTED_PARAM;

String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
long oneTeamMshipID = Long.parseLong(teamTypeMemID);
	
if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER 
	|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH
	|| oneTeamMshipID == ICMSConstant.ALL_VIEW_REPORT 
	|| oneTeamMshipID == ICMSConstant.ALL_VIEW_REPORT_WFH
	) {
  event = "read";
}
 
%>

<html>
    
    <head>       
        
        <title>
            <!--Common Code Parameter-->
            <bean:message key="title.common.code.param"/>
        </title>
        
        <script language="JavaScript" type="text/JavaScript">
		<!--
		
		function onGO()
		{

		    if (document.forms[0].elements[0].value == "")
		    {
		    	alert("<bean:message key="label.please.select.option"/>");
		    	return false;
		    }

			document.getElementById( "categoryCodeId" ).value = document.forms[0].elements[0].value ;

		    document.forms[0].submit();
			
			return true;
		}
		//-->
        </script>
    </head>
    
    <body>
        
        <br />
        
        <form action="MaintainCommonCodeParameters.do" method="POST">
            
            <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                
                <thead>
                    
                    <tr align="left" > 
                        <td>
                            <h3>
                                <!--Search Common Code Parameter-->
                                <bean:message key="label.common.code.param.search"/>
                            </h3>
                        </td>        
                    </tr>
                    
                    <tr> 
                        <td>
                            <hr />
                        </td>
                    </tr>
                    
                </thead>
                
            </table> 
            
            <table width="80%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInput">
                
                <thead>                   
                    
                    <tr>        
                        <td colspan="3" align="center">
                            <!--Please select an option -->
                            <bean:message key="label.please.select.option"/>
                        </td>
                    </tr>
                    
                </thead>
                
                <tbody>    
                    
                    <tr class="odd">
                        
                        <td width="45%" class="fieldname" >
                            <!--Common Code Type Description-->
                            <bean:message key="label.common.code.type.description"/>
                        </td>
                        
                        <td width="45%">
                            
                            <select name="<%=CommonCodeEntryConstant.SELECTED_CATEGORY_CODE_ID%>">
                                
                                <option value="" selected="selected">
                                    <bean:message key="label.please.select"/>
                                </option>
                                
                                <%
                                int count = 0;
                                while ( iter.hasNext () )
                                {
                                        
                                CommonCodeTypeSearchResultItem categories = ( CommonCodeTypeSearchResultItem ) iter.next ();
                                
                                %>
                                <option value="<%=categories.getCommonCategoryId() %>" >                                
                                    <integro:empty-if-null value="<%= categories.getCommonCategoryName () %>" />
                                </option>                        
                                <%
                                }
                                %>
                                
                            </select>
                            
                            <html:errors property="selectError" />
                            
                        </td>
                        
                        <td width="12%" align="center" >
                            <center>
                                <input type="button" onclick="onGO()" value="Go" class="btnNormal" style="margin-right:10px;margin-left:10;width:50px" />
                            </center>
                        </td>
                        
                    </tr>
                    
                    <tr> 
                        <td colspan="3">
                            
                        </td>
                    </tr>
                    
                </tbody>
                
            </table>
            
            
            <input type="hidden" name="event" value="<%= event %>" />
            
            <input type="hidden" id="categoryCodeId" name="categoryCodeId" />
            
            
        </form>
        
    </body>
    
</html>
