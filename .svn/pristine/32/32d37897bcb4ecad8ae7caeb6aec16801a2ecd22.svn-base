
<%@ page import="java.util.Collection,
	java.util.Iterator,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryConstant,
	com.integrosys.cms.app.commoncodeentry.bus.OBCommonCodeEntry,
	java.util.ArrayList,
	com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
	java.util.Iterator,
	java.util.Map,
	java.lang.Integer,
	 com.integrosys.cms.app.common.constant.ICMSConstant,
	 com.integrosys.cms.ui.common.constant.IGlobalConstant,
	 com.integrosys.base.uiinfra.common.ICommonEventConstant,
	 com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
	com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
	com.integrosys.cms.app.commoncodeentry.trx.ICommonCodeEntriesTrxValue,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryCountryList,
	com.integrosys.cms.ui.commoncodeentry.list.MaintainCCEntryListForm,
	com.integrosys.cms.ui.commoncodeentry.list.MaintainCCEntryUtil,
    com.integrosys.component.commondata.app.CommonDataSingleton,
    com.integrosys.component.user.app.bus.ICommonUser,
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

	Map ctyValLabMap = (Map)session.getAttribute(prefix+"ctyValLabMap");
	Map entryIdMap = (Map)session.getAttribute(prefix+"entryIdMap");
	
	ICommonCodeEntriesTrxValue trxValue = (ICommonCodeEntriesTrxValue)session.getAttribute(prefix+CommonCodeEntryConstant.COMMON_CODE_OB_ENTRIES_TRX);
	
	ArrayList entryList = null;
	String event = request.getParameter("event");
	if(CommonCodeEntryConstant.PREPARE_CLOSE_PARAM_PAGEINATE.equals ( event )||CommonCodeEntryConstant.PREPARE_CLOSE_PARAM.equals ( event )){
		entryList = (ArrayList)trxValue.getStagingCommonCodeEntries().getEntries();
	}else{
		entryList = (ArrayList)trxValue.getCommonCodeEntries().getEntries();
	}
	
	int totalNO = entryList.size();
	
	Integer offset = (Integer)session.getAttribute(prefix+CommonCodeEntryConstant.OFFSET );
	Integer length = CommonCodeEntryConstant.FIXED_LENGTH;

	boolean isMaintainRef = "Y".equals((String)session.getAttribute (prefix+"IsMaintainRef" ));
	//isMaintainRef = ob.getRefCategoryCode()!=null&&!"".equals(ob.getRefCategoryCode().trim());
	
	String origialEvent = request.getParameter("origial_event");
	if(origialEvent==null){
		origialEvent = event;
	}
	
	String codeValue=(String)session.getAttribute(prefix+"codeValueSession");
	String codeDescription=(String)session.getAttribute(prefix+"codeDescriptionSession"); 
	String pagenationEvent = CommonCodeEntryConstant.PREPARE_CLOSE_PARAM_PAGEINATE;
	ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
	
	TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){
        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){
            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
                if(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_CHECKER
                		||userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH){
					pagenationEvent = CommonCodeEntryConstant.CHECKER_TO_TRACK_PAGEINATE;
					break TOP_LOOP;
				}
			}
		}
	}
	//System.out.println("origialEvent:"+origialEvent);
	//System.out.println("pagenationEvent:"+pagenationEvent);
%>


<html>
    
    <head>
        
        <script type="text/javascript" >
         <!--            
            function searchPage(){
                document.forms[0].action="MaintainCommonCodeParameters.do?event=read&go=Y";
                document.forms[0].submit();
                                 }
            function closeThis(){
                document.forms[0].event.value = "<%= CommonCodeEntryConstant.CLOSE_PARAM %>" ; 
                document.forms[0].submit();
            }
            
            function goPageIndex(targetOffset){
                    document.forms[0].event.value = '<%=pagenationEvent%>';
					document.forms[0].<%=CommonCodeEntryConstant.CURRENT_OFFSET_NUMBER%>.value = targetOffset ;
                    document.forms[0].submit();
            }                      
            
         -->
        </script>
        
        <title>
            <bean:message key="label.common.code.param.view"/>
        </title>
        
    </head>
    
    <body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">                
        <html:form action="MaintainCommonCodeParameters.do" method="post">
        
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            
            <thead>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr align="left" > 
                    <td>
                        <h3>
                            <bean:message key="label.common.code.param.view"/>
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
               <input type="button" name="Submit" style="margin-right:10px;margin-left:10;width:50px;height:25px" value="Go" class="btnNormal" onclick="searchPage()"/></center>
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
                        </td>
                        <td width="20%">                            
                            <bean:message key="label.common.code.param.value"/>                            
                        </td>
                        <td width="10%">
                            <bean:message key="label.applicable.country"/>
                            <br />
                            <html:errors property="country" />
                        </td>
						
						<%
							if(isMaintainRef){
						%>
                        <td width="10%">
							Reference Entry Code                   
                        </td>
						<%
							}
						%>
                        
                        <td width="5%">
                            <bean:message key="label.active"/>
                        </td>
                    </tr>
                    
                </thead>
                
                <tbody>
				
                    <%
						
						for(int index=offset.intValue();index<(offset.intValue()+length.intValue())&&index< totalNO;index++){
							String colorClass = (index-offset.intValue())%2==0?"even":"odd";
							OBCommonCodeEntry entry = (OBCommonCodeEntry)entryList.get(index);
                    %>
                    
                    <tr class="<%= colorClass %>"> 
						<td class="index" valign="top"><%=index + 1%></td>                         
                        <td >
                            <integro:empty-if-null value= "<%= entry.getEntryName()%>" />                           
                        </td>
                        
                        <td >
                            <integro:empty-if-null value= "<%= entry.getEntryCode()%>" />
                        </td>
                        
                        <td align="center" >
						<%
							if(entry.getCountry()==null||"".equals(entry.getCountry())){
						%>							
							<bean:message key="label.all"/>
						<%
							}else{
						%>
							<integro:empty-if-null value= "<%=ctyValLabMap.get(entry.getCountry())%>" />  
						<%
							}
						%>  
                        </td>
                        
						<%
							if(isMaintainRef){		
						%>
                        <td valign="middle" align="center"> 
							<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ob.getRefCategoryCode(),entry.getRefEntryCode())%>" />
							<%--integro:empty-if-null value= "<%= entry.getRefEntryCode()%>" /--%>  
						</td>
						<%
							}
						%>
						
                        <td valign="middle" align="center">
                            <%
								if(entry.getActiveStatus()){
                            %>
							<img src="img/tick(black).gif" alt="" />
							<%
								}else{
	                        %>
	                        &nbsp;
	                        <%
								}
	                        %>
                        </td>   
                    </tr>
                    <%       
                       }       
                    %>
                    <%if(totalNO==0){ %>
                    	
                    	 <tr class="even">
                            <td colspan="7">
                                <bean:message key="label.no.records.found" />
                            </td>
                        </tr>
                    <%} %>
                    
                </tbody>  
                
            </table>
            
            <br />
            
            <input type="hidden" name="event"/>
            <input type="hidden" name="origial_event" value="<%=origialEvent%>"/>
            <input type="hidden" name="<%=CommonCodeEntryConstant.CURRENT_OFFSET_NUMBER%>" value="<%= offset.toString()%>"  />            
        <%	
			if(CommonCodeEntryConstant.PREPARE_CLOSE_PARAM.equals (origialEvent)){
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
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
            </tr>
            
            <tr>
                <%
					if(CommonCodeEntryConstant.EDIT_REJECTED_PARAM.equals(origialEvent)){
				%>
                <td width="100" valign="baseline" align="center"> 
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" >
                        <img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" />
                    </a>
                </td>
                
                <td width="100" valign="baseline" align="center">
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4412','','img/reject2.gif',1)" onClick="reject()" >
                        <img src="img/reject1.gif" name="Image4412"  border="0" id="Image4412" />
                    </a>
                </td>
                <td width="100" valign="baseline" align="center">
                    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4413','','img/cancel2.gif',1)" >
                        <img src="img/cancel1.gif" name="Image4413"  border="0" id="Image4413" />
                    </a>
                </td>
				<%
					}else if(CommonCodeEntryConstant.PREPARE_CLOSE_PARAM.equals (origialEvent)){
				%>
                <td width="100" valign="baseline" align="center"> 
                    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)" onClick="closeThis()" >
                        <img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" />
                    </a>
                </td>
                
                <td width="100" valign="baseline" align="center">
                    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4412','','img/cancel2.gif',1)" >
                        <img src="img/cancel1.gif" name="Image4412"  border="0" id="Image4412" />
                    </a>
                </td>
				<td>&nbsp;</td>		
				<%
					}else if(CommonCodeEntryConstant.CHECKER_TO_TRACK.equals(origialEvent)){
				%>
					<td>&nbsp;</td>
	                <td width="100" valign="baseline" align="center">
	                    <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
	                        <img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" />
	                    </a>
	                </td>
					<td>&nbsp;</td>
				<%
					}
				%>
            </tr>
            
            <tr>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
                <td valign="baseline" align="center">
                    &nbsp;
                </td>
                
            </tr>
            
        </table>
		</html:form>        
		</td></tr>
		<tr >
		<td height="25">
        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td valign="middle">
                    <integro:pageindex pageIndex="<%=new PageIndex(offset.intValue(),length.intValue(),totalNO) %>" url="MaintainCommonCodeParameters.do" submitFlag="true" />
                </td>
            </tr>
        </table>    
     	</td></tr>
	</table>
    </body>
</html>