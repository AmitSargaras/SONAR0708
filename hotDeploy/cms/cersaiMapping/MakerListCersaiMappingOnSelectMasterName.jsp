 <%@ page import="  com.integrosys.cms.ui.cersaiMapping.CersaiMappingForm,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                com.integrosys.cms.ui.cersaiMapping.CersaiMappingMapper,
                com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction,
                 java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
CersaiMappingForm cersaiMappingForm = (CersaiMappingForm) request.getAttribute("CersaiMappingForm");
Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
List masterNameList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.cersaiMapping.CersaiMappingAction.masterNameList");
// System.out.println("diaryForm.getLastUpdatedDate()"+diaryForm.getLastUpdatedDate());
//Date lastUpdatedDate = DateUtil.convertDate(locale, diaryForm.getLastUpdatedDate());

String fromPage = (String) request.getAttribute("frompage");
if (fromPage == null) {
    fromPage = request.getParameter("frompage");
}

String startIndex = (String) request.getAttribute("startIndex");
if (startIndex == null) {
    startIndex = request.getParameter("startIndex");
}


DefaultLogger.debug(this, "fromPage >>>>>>>>>> " + fromPage);
DefaultLogger.debug(this, "startIndex >>>>>>>>>> " + startIndex);


%>



<head>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">

function submitForm(dropdown){
	
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
	     if (dropdown.options[i].selected == true)
	     {
		 curSel = dropdown.options[i].value;		
	     }
     }
	if(curSel != ""){
document.forms[0].event.value = "maker_list_cersai_mapping_on_select_master";
document.forms[0].submit();
	}
	}
</script>
</head>
<html:form action="cersaiMapping.do">
<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td>
      <h3>CERSAI Mapping</h3>
    </td>
  </tr>
  <tr>
    <td><hr /></td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
      <tr class="even">
          <td class="fieldname" width="29%">Master Name&nbsp;<font color="red">* </font></td>
          <td width="71%">
               <html:select onchange="javascript:submitForm(this) "property="masterName" >
         				<html:option value="">Please Select</html:option>
                  		<html:options collection="masterNameList" property="value"  labelProperty="label"/>
                </html:select>
                <html:errors property="masterName"/>
                <html:hidden property="masterName"/>    
                     
            </td>
        </tr>
      </table>
    </td>
    </tr>
    
    
   <%--   <tr >
                <td colspan="3" valign="top" style="height:100%;width:100%;">
                    <table width="90%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:15px">
                      <thead>
                      <tr>
                        <td width="24%">
                          <h3>Facility Category</h3>
                        </td>
                  <td width="76%" valign="bottom">
<!--                         <strong>Access Country:</strong>-->

                        </td>  
                      </tr>
                      <tr>
                        <td colspan="2"> <hr /></td>
                      </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td  colspan="2">
                          <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
                            <thead>
                            <tr>
                              <td width="5%">S/N</td>                            
                              <td width="40%">Clims Value</td>
                              <td width="45%" nowrap="nowrap">CERSAI Value</td>
                              <td width="10%">Action</td>
                               <!--<td width="5%">Obsolete</td>-->
                            </tr>
                            </thead>
                         <tbody>
                <logic:present name="masterValueList">
                    <logic:iterate id="OB" name="masterValueList" type="com.integrosys.cms.app.cersaiMapping.bus.ICersaiMapping" scope="page" >
                   <%
                       String rowClass = "";
                       counter++;
                       if ( counter%2 != 0 ) {
                           rowClass = "odd";
                       } else {
                           rowClass = "even";
                       }

                     //  String itemURL = "DiaryItem.do?event=read&frompage=list_non_expired&itemId="+OB.getItemID();
                  %>
                    <tr class=<%=rowClass%>>
                      <td class="index" width="5%"><%=counter%></td>
                      <td width="45%"><integro:wrapper value="<%=OB.getCustomerName()%>"  lineLength="20"/><%=OB.isBold()?"</b>":""%></td>
                      <td width="40%"><bean:write name="OB" property="customerReference" /><%=OB.isBold()?"</b>":""%></td>                 
                      <td width="10%"><a href ="">
                      <integro:wrapper value="Edit" lineLength="40"/> </a></td>
                    </tr>
                    </logic:iterate>
                </logic:present>
                <logic:notPresent name="masterValueList" >
                <tr class="odd"><td colspan="9">
                    <bean:message key="label.global.not.found"/></td></tr>
                </logic:notPresent>
                            </tbody>
                          </table>
                        </td>
                        </tr>
                       <tr><td colspan="2">&nbsp;</td></tr>
 
                      
                      </tbody>
                    </table>
				</td>
              </tr> --%>
              
              
              
    </tbody>
  </table>
  </html:form>