<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="com.integrosys.component.commondata.app.Constants,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.commoncode.MaintainCommonCodeTypeForm,
                 com.integrosys.cms.app.commoncode.trx.OBCommonCodeTypeTrxValue,
                 com.integrosys.cms.app.commoncode.bus.ICommonCodeTypeGroup,
                 com.integrosys.cms.app.commoncode.bus.ICommonCodeType,
                 com.integrosys.cms.app.commoncode.bus.OBCommonCodeTypeGroup,
                 com.integrosys.cms.app.commoncode.bus.OBCommonCodeType,
                 com.integrosys.cms.app.tatduration.bus.OBTatParam,
                 com.integrosys.cms.app.tatduration.trx.ITatParamTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
				 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant, 
				 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
				 java.util.Map"%>




<%@page import="org.springframework.web.context.request.RequestAttributes"%>
<%@page import="com.integrosys.cms.app.tatduration.bus.ITatParamConstant"%>
<%@ page import="com.integrosys.component.user.app.bus.ICommonUser" %>
<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->

<!-- InstanceEndEditable -->
<script language="JavaScript" type="text/JavaScript">
		<!--
		
		function onGO()
		{
		    document.forms[0].submit();
			return true;
		}

		function submitPage() 
		{
		    //checkStatus();
		    
		    var formObj = document.forms[0];
			var valueString = "";
			var stageValue = "";
			
			for (var i=0; i<formObj.elements.length; i++)
			 {
   		    	var type = formObj.elements[i].type;
      			var name = formObj.elements[i].name;
				
      			if (type == 'text' && name == 'duration')
      				stageValue += formObj.elements[i].value + ",";
  				
      			if (type == 'select-one' && name == 'durationType') 
      				stageValue += formObj.elements[i].value + ",";

  				if(type == 'hidden' && name == 'stageId')
  				{
  					stageValue += "" + formObj.elements[i].value;
  					valueString += stageValue + ";";
  					stageValue = "";
  				}
			 }
			
			valueString = valueString.substring(0, valueString.length - 1);
			document.forms[0].tatParamStageIdString.value = valueString;
		    document.forms[0].action="TatDuration.do?event=submit_tat_duration";
		    document.forms[0].submit();
		}
		//-->
        </script>
        
</head>
<%
	int sno = 0;
	String editFlag = (String) request.getAttribute("editFlag");
	if(editFlag == null)
		editFlag = "N";
	String tatParamId = String.valueOf(request.getAttribute("tatParamId"));
	ITatParamTrxValue trxVal = (ITatParamTrxValue) session.getAttribute("com.integrosys.cms.ui.tatduration.TatDurationAction.ITatParamTrxValue");
	OBTatParam iTat = (OBTatParam) trxVal.getStagingTatParam();
	
	Map durationTypeLabelMap = CommonDataSingleton.getCodeCategoryValueLabelMap(ITatParamConstant.DURATION_TYPE_ENTRY_CODE);

    String userRole = "";
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"." + IGlobalConstant.USER);
    ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);

    TOP_LOOP: for(int i=0;i<userTeam.getTeamMemberships().length;i++){//parse team membership to validate user first
		if (String.valueOf(userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipID()).equals(teamTypeMemID)) {
	        for(int j=0; j<userTeam.getTeamMemberships()[i].getTeamMembers().length;j++){  //parse team memebers to get the team member first..
	            if(userTeam.getTeamMemberships()[i].getTeamMembers()[j].getTeamMemberUser().getUserID()==user.getUserID()){
	                userRole= userTeam.getTeamMemberships()[i].getTeamTypeMembership().getMembershipName();
	            }
	        }
    	}
    }
%>

<body>
<!-- InstanceBeginEditable name="Content" -->
<html:form action="TatDuration.do">
<input type="hidden" name="event" value="edit_stage_list"/>
<input type="hidden" name="tatParamId" value="<%=tatParamId%>"/>
<input type="hidden" name="tatParamStageIdString" />
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td>
          <h3>Maintain TAT Duration - <integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.COMMON_CODE_APPLICATION_TYPE, iTat.getApplicationType())%>"/></h3>
      </td>
      
      <td align="right" valign="bottom">&nbsp;
      <% if("N".equals(editFlag) && userRole.equals("SC Maker")) { %>
                <input type="button" onclick="onGO()" value="Edit" class="btnNormal" style="margin-right:10px;margin-left:10;width:50px" />
      <% } %>
        </td>
        
    </tr>
    <tr>
      <td colspan="2"><hr />
      </td>
    </tr>    
   </thead>
   <tbody>

    <tr>
      <td colspan="2">

      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          <tr>
              <td colspan="4" alight="left">Pre-Disbursement</td>
            </tr>
            <tr>
              <td width="5%">S/N</td>
              <td width="35%">Pre Stage</td>
              <td width="35%">Post Stage</td>
              <td width="25%">Duration</td>
            </tr>
          </thead>
              <tbody>

<logic:present name="stagePreDibursmentList">
   <logic:iterate id="OB" name="stagePreDibursmentList"  type="com.integrosys.cms.app.tatduration.bus.OBTatParamItem" >
                                <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }
                                %>

                            <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <!-- td><bean:write property="preStage" name="OB"/> </td>
                          <td><bean:write property="postStage" name="OB"/> </td> -->
                          <td><%= OB.getPreStage() %></td>
                          <td><%= OB.getPostStage() %></td>
                          <td align="center">&nbsp;

							<% 
							String duration = OB.getDuration() + "";
							if(duration.endsWith(".0") && duration.length()>2)
								duration = duration.substring(0, duration.length()-2);
							if("Y".equals(editFlag)) {%>
							<input type="text" name="duration" size="5" value="<%=duration%>" />
							&nbsp;
							 <html:select property="durationType" name="OB" >
                  			        <option value=""><bean:message key="label.please.select"/></option>
							        <html:options collection="durationTypeOptionList" property="value" labelProperty="label"/>
                			</html:select>
							<input type="hidden" name="stageId" value="<%=OB.getTatParamItemId()%>"/>
                            <% }
                               else
                               {	                              
                            %>
                            	<%= duration %>&nbsp;
                            	<%= durationTypeLabelMap.get(OB.getDurationType()) %>
							<% } %>
                            <br/><html:errors property='<%="tatDuration"+(sno-1)%>' />
                          </td>
                        </tr>
</logic:iterate>
</logic:present>
              </tbody>
         </table>
         
         <br>
         
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          <tr>
              <td colspan="4" alight="left">Disbursement</td>
            </tr>
            <tr>
              <td width="5%">S/N</td>
              <td width="35%">Pre Stage</td>
              <td width="35%">Post Stage</td>
              <td width="25%">Duration</td>
            </tr>
          </thead>
              <tbody>
<%
	sno = 0;
%>
<logic:present name="stageDibursmentList">
   <logic:iterate id="OB" name="stageDibursmentList"  type="com.integrosys.cms.app.tatduration.bus.OBTatParamItem" >
                                <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }
                                %>

                            <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <td><%= OB.getPreStage() %></td>
                          <td><%= OB.getPostStage() %></td>
                          <td align="center">&nbsp;

							<% 
							String duration = OB.getDuration() + "";
							if(duration.endsWith(".0") && duration.length()>2)
								duration = duration.substring(0, duration.length()-2);
							if("Y".equals(editFlag)) {%>
                           <input type="text" name="duration" size="5" value="<%=duration%>"/>
							&nbsp;
                            <html:select property="durationType" name="OB" >
                  			<option value=""><bean:message key="label.please.select"/></option>
							<html:options collection="durationTypeOptionList" property="value" labelProperty="label"/>
                			</html:select>
                            <input type="hidden" name="stageId" value="<%=OB.getTatParamItemId()%>"/>
                            <% }
                               else
                               {	                              
                            	%>
                            	<%= duration %>&nbsp;
                            	<%= durationTypeLabelMap.get(OB.getDurationType()) %>
							<% } %>
                          </td>
                        </tr>
</logic:iterate>
</logic:present>
              </tbody>
         </table>
         
         <br>
         
         <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInput">
          <thead>
          <tr>
              <td colspan="4" alight="left">Post-Disbursement</td>
            </tr>
            <tr>
              <td width="5%">S/N</td>
              <td width="35%">Pre Stage</td>
              <td width="35%">Post Stage</td>
              <td width="25%">Duration</td>
            </tr>
          </thead>
              <tbody>
<%
	sno = 0;
%>
<logic:present name="stagePostDibursmentList">
   <logic:iterate id="OB" name="stagePostDibursmentList"  type="com.integrosys.cms.app.tatduration.bus.OBTatParamItem" >
                                <%
                                    String rowClass="";
                                    sno++;
                                   if(sno%2!=0){
                                        rowClass="odd";
                                    }else{
                                        rowClass="even";
                                    }
                                %>

                            <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <td><%= OB.getPreStage() %></td>
                          <td><%= OB.getPostStage() %></td>
                          <td align="center">&nbsp;

							<% 
							String duration = OB.getDuration() + "";
							if(duration.endsWith(".0") && duration.length()>2)
								duration = duration.substring(0, duration.length()-2);
							if("Y".equals(editFlag)) {%>
                            <input type="text" name="duration" size="5" value="<%=duration%>"/>
							&nbsp;
                            <html:select property="durationType" name="OB" >
                  			<option value=""><bean:message key="label.please.select"/></option>
							<html:options collection="durationTypeOptionList" property="value" labelProperty="label"/>
                			</html:select>
                            <input type="hidden" name="stageId" value="<%=OB.getTatParamItemId()%>"/>
                             <% }
                               else
                               {	                              
                            %>
								<%= duration %>&nbsp;
                            	<%= durationTypeLabelMap.get(OB.getDurationType()) %>
							<% } %>
                          </td>
                        </tr>
</logic:iterate>
</logic:present>
              </tbody>
         </table>
         
         <br>
        
        </td>
       </tr>
       <% if("Y".equals(editFlag)) {%>
        <tr>
        <td colspan="2" align="center">
        <table>
   	<tr>  
    <td valign="baseline" align="center"><a href="#"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)" onClick="submitPage()" ><img src="img/submit1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
	<!--<td valign="baseline" align="center"><a href="./TatDuration.do?event=view_app_list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>-->
    <td valign="baseline" align="center"><a href="./TatDuration.do?event=read_stage_list&tatParamId=<%=tatParamId%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>       
	</tr></table>
       </td>
        </tr>
       <% } else {%>
       
       <tr>
           <td colspan="2" align="center">
                <a href="./TatDuration.do?event=view_app_list" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image5511','','img/return2.gif',1)"><img src="img/return1.gif" name="Image5511"  border="0" id="Image5511" /></a>    
           </td>
       </tr>

       <% } %>
       
    </tbody>
  </table>

<br>

</html:form>

<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
