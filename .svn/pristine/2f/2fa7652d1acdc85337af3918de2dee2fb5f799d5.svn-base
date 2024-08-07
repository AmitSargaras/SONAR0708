
<%@ page import="java.util.Collection,
	java.util.Iterator,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryConstant,
	com.integrosys.cms.app.commoncodeentry.bus.OBCommonCodeEntry,
	java.util.ArrayList,
	com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
	java.util.Iterator,
	java.util.Map,
	java.util.HashMap,
	java.util.Collections,
	java.lang.Integer,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.base.uiinfra.tag.PageIndex,
	com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
	com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
	com.integrosys.cms.app.commoncodeentry.trx.ICommonCodeEntriesTrxValue,
	com.integrosys.cms.app.commoncodeentry.CommonCodeEntryCountryList,
	com.integrosys.cms.ui.commoncodeentry.list.MaintainCCEntryListForm,
	com.integrosys.cms.ui.commoncodeentry.list.MaintainCCEntryUtil,
	com.integrosys.cms.app.commoncodeentry.bus.CommonCodeEntryComparator,
    com.integrosys.component.commondata.app.CommonDataSingleton,
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
	if(ctyValLabMap==null){
		ctyValLabMap = new HashMap();
	}
	Map entryIdMap = (Map)session.getAttribute(prefix+"entryIdMap");
	
	ICommonCodeEntriesTrxValue trxValue = (ICommonCodeEntriesTrxValue)session.getAttribute(prefix+CommonCodeEntryConstant.COMMON_CODE_OB_ENTRIES_TRX);
	
	ArrayList stageEntries = (ArrayList)trxValue.getStagingCommonCodeEntries().getEntries();
	Collections.sort(stageEntries,new CommonCodeEntryComparator(CommonCodeEntryComparator.BY_UPDATE_FLAG));
	
	int totalNO = stageEntries.size();
	
	Integer offset = (Integer)session.getAttribute(prefix+CommonCodeEntryConstant.OFFSET );
	Integer length = CommonCodeEntryConstant.FIXED_LENGTH;

	boolean isMaintainRef = "Y".equals((String)session.getAttribute (prefix+"IsMaintainRef" ));
	//isMaintainRef = ob.getRefCategoryCode()!=null&&!"".equals(ob.getRefCategoryCode().trim());
	
	System.out.println("totalNO in JSP : "+totalNO);
	System.out.println("offset in JSP : "+offset.intValue());

%>


<html>
    
    <head>
        
		<script type="text/javascript" src="js/validation.js"></script>
        <script type="text/javascript" >
         <!--            
            function approve(){
				document.forms[0].event.value = '<%= CommonCodeEntryConstant.CHECKER_APPROVE %>' ;
				document.forms[0].submit();
            }

            function reject(){
				document.forms[0].event.value = '<%= CommonCodeEntryConstant.CHECKER_REJECT  %>' ;
				document.forms[0].submit();
            }
            
            function goPageIndex(targetOffset){
				document.forms[0].event.value = '<%=CommonCodeEntryConstant.CHECKER_PROCESS_PAGEINATE%>'  ;
				document.forms[0].<%=CommonCodeEntryConstant.CURRENT_OFFSET_NUMBER%>.value = targetOffset ;
				document.forms[0].submit();
            }                      
            
         -->
        </script>
        
        <title>
            <bean:message key="label.common.code.param.update"/>
        </title>
        
    </head>
    
    <body>
        
        <html:form action="MaintainCommonCodeParameters.do" method="post">
        
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
                            <br />                            
                            <html:errors property="refCategoryCode" />                            
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
							OBCommonCodeEntry entry = (OBCommonCodeEntry)stageEntries.get(index);
							OBCommonCodeEntry actualEntry = (OBCommonCodeEntry)entryIdMap.get(new Long(entry.getEntryId()));
							if(actualEntry==null){
								actualEntry = new OBCommonCodeEntry();
							}
							String indexCSS = "index";
							if(isMaintainRef){
								if(!MaintainCCEntryUtil.isEqualString(entry.getRefEntryCode(),actualEntry.getRefEntryCode())){
									indexCSS = "indexdiff";
								}
							}else{
								if('I'==entry.getUpdateFlag()){
									indexCSS = "indexadd";
								}else if('U'==entry.getUpdateFlag()){
									indexCSS = "indexdiff";
								}
							}
							
                    %>
                    
                    <tr class="<%= colorClass %>">  
						<td class="<%=indexCSS%>" valign="top"><%=index + 1%></td> 
                        <td >
                            <integro:empty-if-null value= "<%= entry.getEntryName()%>" />                           
                        </td>
                        
                        <td >
                            <integro:empty-if-null value= "<%= entry.getEntryCode()%>" />
                        </td>
                        
                        <td align="center">
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
                        <td valign="middle" align="center" >    
							<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ob.getRefCategoryCode(),entry.getRefEntryCode())%>" />
						</td>
						<%
							}
						%>
						
                        <td valign="middle" align="center" >
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
                    
                </tbody>  
                
            </table>
            
            <br />
            
            <input type="hidden" name="event"/>
            <input type="hidden" name="<%=CommonCodeEntryConstant.CURRENT_OFFSET_NUMBER%>" value="<%= offset.toString()%>"  />            
              
         <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr>
                    <td class="fieldname">
                        <bean:message key="label.remarks"/>
                    </td>
                    <td class="odd">
						<html:textarea property="remarks" rows="3" cols="80"  onkeyup="limitTextInput(this,2000,'Remarks')"/>&nbsp;
						<html:errors property="remarks"/>
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
        
        <br />
        <table class="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
            <tr>
                <td valign="middle">
                    <integro:pageindex pageIndex="<%=new PageIndex(offset.intValue(),length.intValue(),totalNO) %>" url="MaintainCommonCodeParameters.do" submitFlag="true" />
                </td>
            </tr>
        </table>    
		</html:form>     
    </body>
</html>