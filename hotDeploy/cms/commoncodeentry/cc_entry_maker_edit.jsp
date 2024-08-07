
<%@ page import="java.util.Collection,
	java.util.Iterator,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryConstant,
	com.integrosys.cms.app.commoncodeentry.bus.OBCommonCodeEntry,
	java.util.ArrayList,
	com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
	java.lang.Integer,
	java.util.Map,
	java.util.HashMap,
    com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
	com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
	com.integrosys.cms.app.commoncodeentry.trx.ICommonCodeEntriesTrxValue,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryCountryList,
	com.integrosys.cms.ui.commoncodeentry.list.MaintainCCEntryListForm,
	com.integrosys.cms.ui.commoncodeentry.list.MaintainCCEntryUtil,
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
		
	ICommonCodeEntriesTrxValue trxValue = (ICommonCodeEntriesTrxValue)session.getAttribute(prefix+CommonCodeEntryConstant.COMMON_CODE_OB_ENTRIES_TRX);
	int totalNO = trxValue.getCommonCodeEntries().getEntries().size();
	Integer offset = (Integer)session.getAttribute(prefix+CommonCodeEntryConstant.OFFSET );
	Integer length = CommonCodeEntryConstant.FIXED_LENGTH;

	boolean isMaintainRef = "Y".equals((String)session.getAttribute (prefix+"IsMaintainRef" ));
	//isMaintainRef = ob.getRefCategoryCode()!=null&&!"".equals(ob.getRefCategoryCode().trim());
	
	MaintainCCEntryListForm form = (MaintainCCEntryListForm)request.getAttribute("MaintainCCEntryListForm");	
	
	String event = (String)request.getParameter("event");
	String codeValue=(String)session.getAttribute(prefix+"codeValueSession");
	String codeDescription=(String)session.getAttribute(prefix+"codeDescriptionSession");
	String pagenationEvent = CommonCodeEntryConstant.EDIT_SELECTED_PARAM_PAGEINATE;
	boolean isReturnToDo = false;
	if ( !ICMSConstant.STATE_ACTIVE.equals ( trxValue.getStatus() )){
		pagenationEvent = CommonCodeEntryConstant.EDIT_REJECTED_PARAM_PAGEINATE;
		isReturnToDo = true;
	}
	
	Map ctyValLabMap=null;
	if(isMaintainRef){
		ctyValLabMap = MaintainCCEntryUtil.getCountryValueLabelMap();
	}
%>




        <script type="text/javascript" >
         <!--            

            function searchPage(){
                document.forms[0].action="MaintainCommonCodeParameters.do?event=maker_edit_common_code_params_edit&go=Y";
                document.forms[0].submit();
                                 }
            function submitForm(){

                document.forms[0].event.value = "<%= CommonCodeEntryConstant.UPDATE_SELECTED_PARAM %>" ;
                document.forms[0].go.value = 'N';
                document.forms[0].submit();
            }
            
            function cancel (){
                document.forms[0].event.value = "<%= CommonCodeEntryConstant.LIST_PARAMS %>" ; 
                document.forms[0].submit();
            }
            
            function add(){
                document.forms[0].event.value = "<%= CommonCodeEntryConstant.ADD_PARAM %>" ; 
                document.forms[0].submit();
            }
            			
            function search(){
                document.forms[0].event.value = "<%= CommonCodeEntryConstant.SEARCH_CC_ENTRY %>" ; 
                document.forms[0].submit();
            }
			
            function activate(id,checkBoxObj){
                if (checkBoxObj.checked){
					document.getElementById(id).value = "A" ; 
                }else{
					document.getElementById( id ).value = "N" ; 
                }            
            }
            
            function goPageIndex(targetOffset){
                    document.forms[0].event.value = '<%=pagenationEvent%>';
					document.forms[0].<%=CommonCodeEntryConstant.CURRENT_OFFSET_NUMBER%>.value = targetOffset ;
                    document.forms[0].submit();
            }                      
            
         -->
        </script>
       
   
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">        
        <html:form action="MaintainCommonCodeParameters.do" >
        <html:hidden property="go"/>
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            
            <thead>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr align="left" > 
                    <td>
                        <h3>
                            <bean:message key="label.common.code.param.update"/>
                        </h3>
                    </td>      
                    
                    <td align="right" valign="bottom">
						<%
							if(!isMaintainRef){
						%>
                        <input type="button" name="Submit3" value="Add New" class="btnNormal" onclick="add()" />
						<!--
						&nbsp;
						<input type="button" name="Submit4" value="Search" class="btnNormal" onclick="search()" />
						-->
						<%
							}
						%>
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
                
                <tr class="even">
                    
                    <td  class="fieldname">
                        <bean:message key="label.common.code.type.description"/>
                    </td>
                    
                    <td >
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
                <tr><td colspan="4">
                        <table id="choiceTable" width="100%"  border="0" cellspacing="0" cellpadding="0" class="tblInfo" >
                       <thead>
                         <tr>
                         <td colspan="4"><center>Please enter search criteria</center></td>
                        </tr>
                       </thead>
					   <tr class="odd">
                    <td class="fieldname" width="20%">
                       <bean:message key="label.common.code.param.description"/>
                    </td>
                    <td width="20%">
                         <html:text property="codeDescription" value="<%= codeDescription %>" />
                         <html:errors property="codeDescriptionError"/>
                         </td>
                    <td class="fieldname" width="20%" >
                       <bean:message key="label.common.code.param.value"/>
                    </td>
                    <td width="20%">
                        <html:text property="codeValue" value="<%= codeValue %>" />
                        <html:errors property="codeValueError"/>
                    </td>  
                    </tr>
               <tr>
               <td colspan="4"><center>
               <input type="button" name="Submit" style="margin-right:10px;margin-left:10;width:50px;height:25px" value="Go" class="btnNormal" onclick="searchPage()"/> </center>  
               </td>
               </tr>
               </table></td></tr>
            </tbody>
            
        </table> 
        
        <br />
        
            <table width="90%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInfo">                
                <thead>                    
                    <tr>                   
						<td width="3%">S/N</td>          
                        <td width="30%">                            
                            <bean:message key="label.common.code.param.description"/>     
							<br/>
                            <html:errors property="entryName" />                          
                        </td>
                        <td width="20%">                            
                            <bean:message key="label.common.code.param.value"/>   
							<br/>
                            <html:errors property="entryCode" />            
                        </td>
                        <td width="10%">
                            <bean:message key="label.applicable.country"/>
                            <br />
                        </td>
						
						<%
							if(isMaintainRef){
						%>
                        <td width="10%">
							Reference Entry Code
                            <br />                                                   
                        </td>
						<%
							}
						%>
                        
                        <td width="5%">
                            <bean:message key="label.active"/>
                        </td>
                    </tr>
                    <tr>
						<td colspan="4">
						<html:errors property="NoEntryError"/>
						</td>
					</tr>
                </thead>
                
                <tbody>
                <logic:empty name="MaintainCCEntryListForm" property="entryName">
                	<tr><td colspan="<%=isMaintainRef?6:5%>">
                	 <bean:message key="label.global.not.found"/>
                	 </td></tr>
                </logic:empty>
                <logic:notEmpty name="MaintainCCEntryListForm" property="entryName">
                    <%
						int size = form.getEntryName().length;						
						for(int index=0;index<size;index++){
							String colorClass = index%2==0?"even":"odd" ;
							if(isMaintainRef){
                    %>
								<%@ include file="edit_ref.jsp" %>
					<%
							}else{					
					%>
								<%@ include file="edit_cc.jsp" %>
                    <%       
							}								
                       }       
                    %>
                </logic:notEmpty>
                </tbody>  
                
            </table>
            
            <br />
            			
            <input type="hidden" name="event"/>
            <input type="hidden" name="IsMaintainRef" value="<%=isMaintainRef?"Y":"N"%>"/>
            <input type="hidden" name="<%=CommonCodeEntryConstant.CURRENT_OFFSET_NUMBER%>" value="<%= offset.toString()%>"  />            
        <%	
			if(CommonCodeEntryConstant.EDIT_REJECTED_PARAM.equals (event)){
		%>
         <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr>
                    <td class="fieldname">
                        <bean:message key="label.remarks"/>
                    </td>
                    <td class="odd">
                        <textarea name="remarksDummy" id="remarksDummy" rows="4" cols="80" ></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="fieldname">
                        <bean:message key="label.last.action.by"/>
                    </td>
                    <td class="even">
                        &nbsp;<%=trxValue.getUserInfo()%>
                    </td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">
                        <bean:message key="label.last.remarks.made"/>
                    </td>
                    <td>
                        <integro:wrapper value="<%=trxValue.getRemarks()%>" />&nbsp;
                    </td>
                </tr>
            </tbody>
        </table>
        <%
			}
		%> 
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
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/submit2.gif',1)" onclick="submitForm()" >
                        <img src="img/submit1.gif" name="Image4411"  border="0" id="Image4411" />
                    </a>                    
                </td>  
		 <%	
			if(isReturnToDo){
		 %>
                <td width="100" valign="baseline" align="center">                    
                    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','img/cancel2.gif',1)" >
                        <img src="img/cancel1.gif" name="Image4413"  border="0" id="Image4413" />
                    </a>                    
                </td>         

        <%
			}else{
		%> 
                <td width="100" valign="baseline" align="center">                    
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','img/cancel2.gif',1)" onclick="cancel()" >
                        <img src="img/cancel1.gif" name="Image4413"  border="0" id="Image4413" />
                    </a>                    
                </td>      
        <%
			}
		%> 				
            </tr> 
            
        </table>
		</html:form>             
		</td></tr>
		<tr >
		<td height="25">
        <table width="100%" id="generalPurposeBar" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td valign="middle">
                    <integro:pageindex pageIndex="<%=new PageIndex(offset.intValue(),length.intValue(),totalNO) %>" url="MaintainCommonCodeParameters.do" submitFlag="true" />
                </td>
            </tr>
        </table>    

		</td>
		</tr>
	</table>
    </body>
