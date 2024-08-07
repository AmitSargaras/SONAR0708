
<%@ page import="java.util.Collection,
	java.util.Iterator,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryConstant,
	java.util.ArrayList,
	java.util.Iterator,
	java.lang.Integer,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
	com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryCountryList,
	com.integrosys.cms.ui.commoncodeentry.item.MaintainCCEntryAction,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.cms.ui.common.CommonCodeList"%>
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
**/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	String prefix = "com.integrosys.cms.ui.commoncodeentry.CommonCodeEntryCommonAction.";
	ICommonCodeType ob = (ICommonCodeType)session.getAttribute (prefix+"commonCodeType" );

	Collection labels = CountryList.getInstance().getCountryLabels();
	Collection values = CountryList.getInstance().getCountryValues();
	
	pageContext.setAttribute("ctyListLabels",labels);
	pageContext.setAttribute("ctyListValues",values);
		
	CommonCodeList commonCode = CommonCodeList.getInstance(ob.getRefCategoryCode());
	pageContext.setAttribute("refCatCodeLabels",commonCode.getCommonCodeLabels());
	pageContext.setAttribute("refCatCodeValues",commonCode.getCommonCodeValues());	
	
%>


<html>

    <head>
        <script type="text/javascript" >
         <!--
            function confirmAdd(){
             	//var strObj = document.forms[0].entryName;
             	//if (strObj.value != null && strObj.value.length > 0)
				//	removeNL(strObj);

				//strObj = document.forms[0].entryCode;
				//if (strObj.value != null && strObj.value.length > 0)
				//	removeNL(strObj);
        	 
                document.forms[0].event.value = "<%=MaintainCCEntryAction.CONFIRM_ADD%>" ;
                document.forms[0].submit();
            }

            function cancelAdd(){
            	document.forms[0].action="MaintainCCEntry.do?event=<%=MaintainCCEntryAction.CANCEL_ADD%>&go=N";
                document.forms[0].submit();
            }

         -->
        </script>

        <title>
            <!--Update Common Code Parameters-->
            <bean:message key="label.common.code.param.update"/>
        </title>

    </head>
    
    <body>
        
        <html:form action="MaintainCCEntry.do">       
            
            <input type="hidden" name="event"/>       
			
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            
            <thead>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr align="left" > 
                    <td>
                        <h3>
                            Add Common Code Parameters     
                        </h3>
                    </td>      
                    
                    <td align="right" valign="bottom">
                        &nbsp;
                    </td>                    
                </tr>
                
                <tr> 
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                
            </thead>
            
        </table>
        
        <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                    <td width="20%" class="fieldname">
                        <bean:message key="label.common.code.type.description"/>
                    </td>
                    <td width="80%">
                        <integro:empty-if-null value="<%= ob.getCommonCategoryName () %>" /> 
                    </td>
                </tr>
                <tr class="even">
                    <td class="fieldname">
                        <bean:message key="label.common.code.type.value"/>
                    </td>
                    <td>
                        <integro:empty-if-null value="<%= ob.getCommonCategoryCode () %>" /> 
                    </td>
                </tr>
            </tbody>
        </table> 
        <br />
        
            <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInfo">                
                <tbody>                    
                    <tr class="odd">                         
                        <td width="30%" class="fieldname">                
                            <bean:message key="label.common.code.param.description"/>&nbsp;
							<bean:message key="label.mandatory"/>                        
                        </td>           
                        <td>							
                            <html:textarea cols="100" rows="4" property="entryName" onkeydown="return noEnter(event)" />
                            <br/>                            
                            <html:errors property="entryName" />                            
                        </td>
                    </tr>
					<tr class="even"> 
                        <td width="20%" class="fieldname">                            
                            <bean:message key="label.common.code.param.value"/>&nbsp;
							<bean:message key="label.mandatory"/>                            
                        </td>
                        <td valign="middle">
                            <html:text property="entryCode" size="15" onkeydown="return noEnter(event)"  />
                            <br/>                             
                            <html:errors property="entryCode" />
                        </td>
                    </tr>
					<tr class="odd">     
                        <td width="10%" class="fieldname">
                            <bean:message key="label.applicable.country"/>
                        </td>
                        <td align="center" >                            
                            <html:select property="country" >                              
                                <option value="" >
                                    <bean:message key="label.all"/>
								</option>        
								<html:options name="ctyListValues" labelName="ctyListLabels"/>                                								
                            </html:select>
                        </td>
                    </tr>
						<%
							if(ob.getRefCategoryCode()!=null&&!"".equals(ob.getRefCategoryCode().trim())){
						%>
					<tr class="even"> 	

                        <td width="10%" class="fieldname">
							Reference Entry Code                  
                        </td>
                        <td valign="middle" align="center">    
							<html:select property="refCategoryCode">               
                                <!--  <option value="" >
                                    <bean:message key="label.all"/>
								</option> -->       
								<html:options name="refCatCodeValues" labelName="refCatCodeLabels"/>                                								
                            </html:select>
						</td>
                    </tr>
						<%
							}
						%>
					<tr class="odd">     
                        <td width="5%" class="fieldname">
                            <bean:message key="label.active"/>
                        </td>
                        <td valign="middle" align="center">              
							Active
                        </td>   
                    </tr>
                </tbody>
            </table>
            
            <br /> 
              
        <table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
            </tr>            
            <tr>
                <td width="100" valign="baseline" align="center">                    
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/ok2.gif',1)" onclick="confirmAdd()" >
                        <img src="img/ok1.gif" name="Image4411"  border="0" id="Image4411" />
                    </a>                    
                </td>                
                <td width="100" valign="baseline" align="center">                    
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','img/cancel2.gif',1)" onclick="cancelAdd()" >
                        <img src="img/cancel1.gif" name="Image4413"  border="0" id="Image4413" />
                    </a>                    
                </td>                
            </tr> 
            
        </table>
        
        <table>
            <tr>
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
            </tr>
        </table>
        
        <br />   
		</html:form>     
    </body>    
</html>