<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
				 java.util.List,
				  com.integrosys.cms.ui.manualinput.limit.LmtDetailForm,
			     com.integrosys.base.uiinfra.tag.PageIndex,
				 com.integrosys.cms.ui.manualinput.limit.EventConstant,
                 com.integrosys.cms.ui.manualinput.limit.LmtSecMappingForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html> <!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif')">
<% 

String facCoBorrowerLiabIds =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.facCoBorrowerLiabIds");
pageContext.setAttribute("facCoBorrowerLiabIds",facCoBorrowerLiabIds);

   String startInd = (String)request.getParameter("startIndex");
   String totalCount = (String)request.getAttribute("totalSecCount");
   int length = 10;
   int startIndex = (startInd == null || "".equals(startInd))?0:Integer.parseInt(startInd);
   int totalSecCount = (totalCount == null || "".equals(totalCount))?0:Integer.parseInt(totalCount);
   
   System.out.print("startIndex "+startIndex);
%>
<script language="javascript">
	function searchSecurity()
	{
		document.forms[0].event.value = 'search_secdetail';
		document.forms[0].totalSecCount.value = "";
		document.forms[0].submit();
	}

	function goPageIndex(stInd)
	{
		document.forms[0].startIndex.value = stInd;
		document.forms[0].submit();
	}

	function saveSecurityLink()
	{
		document.forms[0].event.value = 'create';
		document.forms[0].submit();
	}

	function cancelSubmit()
	{
		document.forms[0].facCat.value = '<%=(String)request.getAttribute("facCat")%>';
		document.forms[0].event.value = 'cancel';
		document.forms[0].submit();
	}
	
	function createNewSecurity()
    {
		document.forms[0].event.value = '<%=EventConstant.EVENT_CREATE_NEW_SEC%>';
		document.forms[0].facCat.value = '<%=(String)request.getAttribute("facCat")%>';
		document.forms[0].submit();		
    }

    function shwhide(val) {
        if(val=='prepare_create'){
        	document.getElementById('divSearch').style.display = '';
        	document.getElementById('divSearchProperty').style.display = 'none';
        }else {
        	document.getElementById('divSearch').style.display = 'none';
        	document.getElementById('divSearchProperty').style.display = '';
        }
    }

	function searchPropertySecurity() {
		document.forms[0].action="MILmtSecDetail.do?event=search_secpropdetail&CustName="+document.getElementById('CustNameId').value+
																				"&PropId="+document.getElementById('PropIds').value;
		document.forms[0].submit();
	}
    
</script>
<html:form action="MILmtSecDetail.do">
<html:hidden name="LmtDetailForm" property="facCoBorrowerLiabIds" styleId="facCoBorrowerIds" value="<%=facCoBorrowerLiabIds%>"/>
 <html:hidden property="event"/>
 <input type="hidden" name="startIndex" value="0"/>
 <input type="hidden" name="totalSecCount" value="<%= totalCount==null?"":totalCount %>" /> 
 <html:hidden property="fromEvent"/>
 <html:hidden property="limitProfileID"/>
 <html:hidden property="customerID"/>
 <html:hidden property="indexID"/>
 <html:hidden property="isCreate"/> 
 <%
 String strCustName = (String)request.getAttribute("CustName");
 String strPropId = (String)request.getAttribute("PropId");
 if(strCustName == null){
	 strCustName = "";
 }
 
 if(strPropId == null){
	 strPropId = "";
 }
 
 %>
  <input type="hidden"  name="inrValue" readonly="readonly" value="<%=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.inrValue") %>"/>
    <input type="hidden" name="fundedAmount" value="<%=(String)request.getAttribute("fundedAmount") %>"/>
	<input type="hidden" name="nonFundedAmount" value="<%=(String)request.getAttribute("nonFundedAmount")  %>" />
    <input type="hidden" name="memoExposer"  value="<%=(String)request.getAttribute("memoExposer")  %>" />
	<input type="hidden" name="sanctionedLimit"	value="<%=(String)request.getAttribute("sanctionedLimit") %>" />
	<input type="hidden" name="facCat" value="<%=(String)request.getAttribute("facCat")%>" />
 <table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
   <tr>
    <td width="64%">
     <h3> Map Security to Limit</h3>
    </td>
    <td width="36%" align="right" valign="bottom">&nbsp;</td>
   </tr>
   <tr>
    <td colspan="2"><hr/></td>
   </tr>
  </thead>
  <tbody>
   <tr>
    <td colspan="2">
	 <div id="divSearch" style="background:transparent;height:auto;border:0 none;display:none;">
		 <table width="15%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  id="custsearch">
			  <tr>
			    <td colspan="2">&nbsp;</td>
			  </tr>		  
			  <tr>
			    <td align="center">
					<a href="javascript:searchSecurity()"><img src="img/search1a.gif" name="Image411" border="0" id="Image4" /></a>        
				</td>
			    <td align="center">
					<a href="javascript:createNewSecurity()"><img src="img/createnewsec2.gif" name="Image411" border="0" id="Image4" /></a>        
				</td>
			  </tr>
			  <tr>
			    <td colspan="2" align="center">&nbsp;</td>
			  </tr>
		</table>
	</div>
	 <div id="divSearchProperty" style="background:transparent;height:auto;border:0 none;display:none;">
		 <table width="30%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  id="custsearch">
			  <tr>
			    <td colspan="2">Customer Name</td>
			    <td colspan="2"><input type="text" name="CustName" id="CustNameId" value="<%=strCustName %>"></td>
			  </tr>		
			  <tr>
			    <td colspan="2">Property Id</td>
			    <td colspan="2"><input type="text" name="PropId" id="PropIds" value="<%=strPropId %>"></td>
			  </tr>	  
			  <tr>
			    <td colspan="2">&nbsp;</td>
			  </tr>	
			  <tr>
			   <td colspan="2">&nbsp;</td>
			    <td align="center">
					<a href="javascript:searchPropertySecurity()"><img src="img/search1a.gif" name="Image411" border="0" id="Image4" /></a>        
				</td>
			  </tr>
			  <tr>
			    <td align="center">&nbsp;</td>
			  </tr>
		</table>
	</div>
	
	  <script type="text/javascript">
	   if(document.forms[0].event.value == 'prepare_create') {
		   shwhide('prepare_create');
	   }else {
		   shwhide('search_secdetail');
	   }
   </script>
	
    </td>
   </tr>
  </tbody>
 </table>
 <logic:present name="displayList" scope="request">
 <table width="70%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
   <td><h3>Security </h3> </td>
   <td>&nbsp;</td>
  </tr>
  <tr> 
   <td colspan="2"> 
    <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
     <thead>
      <tr> 
       <td width="5%">S/N</td>
       <td width="17%">Party Name </td>
       <td width="12%">Security ID </td>
       <td width="12%">Security Type  </td>
       <td width="17%">Security Sub Type  </td>
       <td width="17%">Security Name  </td>
       <td width="17%">Property Id  </td>
       <td width="5%">Select</td>
      </tr>
     </thead>
     <tbody>
      <logic:notPresent name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.securityList" scope="session">      
       <tr class="odd">
        <td colspan="5"><bean:message key="label.global.not.found"/></td>
       </tr> 
      </logic:notPresent>
      <logic:present name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.securityList" scope="session">
       <% int secSize = ((List)(session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.securityList"))).size();
	  if (secSize > 0) 
	  {
       %> 			 
       <logic:iterate id="secItem" indexId="secind" name="com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.securityList" scope="session" type="com.integrosys.cms.app.collateral.bus.OBCollateral">
       <% 
          int ind = secind.intValue() + startIndex + 1;
       	  int indIndex = secind.intValue() + startIndex;
       %>
	<tr>
	 <td width="5%" class="index"><%= ind %></td>
	 	 <td width="17%" ><%= secItem.getComment() %></td>
         <td width="12%" ><%= secItem.getCollateralID() %></td>
         <td width="12%" ><%= secItem.getCollateralSubType().getTypeName() %></td>
         <td width="17%" ><%= secItem.getCollateralSubType().getSubTypeName() %></td>
         <td width="17%" ><%= secItem.getToBeDischargedInd()%></td>
         <td width="17%" > <integro:empty-if-null value="<%= secItem.getPropSearchId()%>"/> </td>
         <td width="5%" >
          <html:multibox property="selectedSec"  value="<%= String.valueOf(indIndex) %>" />
          &nbsp;
         </td>
	</tr>
       </logic:iterate>
       <% }
          else
	  {
       %>
	<tr class="odd">
         <td colspan="8"><bean:message key="label.global.not.found"/></td>
        </tr>
       <%
	  }
       %>		 	    
      </logic:present>
     </tbody>
    </table>
   </td>
  </tr>
  <tr>
   <td height="25">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
     <tr>
      <td valign="middle">   
       <integro:pageindex pageIndex='<%=new PageIndex(startIndex, length, (int)(totalSecCount))%>'
	url='<%="MILmtSecDetail.do"%>' submitFlag='<%=new Boolean(true)%>'/>
      </td>
     </tr>
    </table>
   </td>
  </tr> 
 </table>
 </logic:present>
 <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
    <td>
      <logic:present name="displayList" scope="request">
	  <a href="javascript:saveSecurityLink()"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
      </logic:present>
	<logic:notPresent name="displayList" scope="request">
	  &nbsp;
      </logic:notPresent>
    </td>
    <td><a href="javascript:cancelSubmit()"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 </table>  
</html:form> 
</body>