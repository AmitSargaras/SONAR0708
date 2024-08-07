<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,  
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 java.util.Map,
                 com.integrosys.cms.ui.tatduration.TatDurationForm,
                 com.integrosys.cms.app.tatduration.bus.OBTatParam,
                 com.integrosys.cms.app.tatduration.bus.OBTatParamItem,
                 com.integrosys.cms.app.tatduration.bus.ITatParam,
                 com.integrosys.cms.app.tatduration.bus.ITatParamConstant,
                 com.integrosys.cms.app.tatduration.trx.ITatParamTrxValue,
                 com.integrosys.cms.app.tatduration.trx.OBTatParamTrxValue,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
				 com.integrosys.cms.app.common.constant.ICategoryEntryConstant,
				 com.integrosys.cms.app.common.constant.ICMSConstant,
				 java.util.Iterator"
%>

<%
/**
 * Title: CLIMS 
 * Description: For Checker to view Property Index parameter
 * Copyright: Integro Technologies Sdn Bhd 
 * Author: Andy Wong 
 * Date: Jan 30, 2008
 */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	DefaultLogger.debug("trace code", "init -----------------");
    ITatParamTrxValue trxVal = (ITatParamTrxValue)session.getAttribute("com.integrosys.cms.ui.tatduration.TatDurationAction.ITatParamTrxValue");
    DefaultLogger.debug("trxVal is ========>> ", trxVal);
	OBTatParam iTat = (OBTatParam) trxVal.getStagingTatParam();
	pageContext.setAttribute("obj", iTat);
    String remarks = trxVal.getRemarks();
    String lastActionBy = trxVal.getUserInfo();
    if(lastActionBy==null) lastActionBy = "";
    if (remarks==null) remarks= "";

    OBTatParam stageOb = (OBTatParam) trxVal.getStagingTatParam();
    OBTatParam ob = (OBTatParam) trxVal.getTatParam();
    
    DefaultLogger.debug("trace code - ob is ", ob);
    
    String event = request.getParameter("event");
    String approveEvent="checker_confirm_approve_edit";
    String rejectEvent="checker_confirm_reject_edit";
    String closeEvent = "maker_confirm_close";
	
	int sno = 0;
	String tatParamId = String.valueOf(request.getAttribute("tatParamId"));
	Map durationTypeLabelMap = CommonDataSingleton.getCodeCategoryValueLabelMap(ITatParamConstant.DURATION_TYPE_ENTRY_CODE);
%>

<html>
<head>

    <style>
        .fixedSelectLength {
            width: 276px;
            COLOR: #000000;
        }

        .btnHighlight {
            border: 1px solid Purple;
            background-color: #FAF0E6;
            text-align: center;
            width: 85px;
        }
    </style>

    <script language="JavaScript" type="text/JavaScript">

        function MM_swapImgRestore() { //v3.0
            var i,x,a = document.MM_sr;
            for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++) x.src = x.oSrc;
        }

        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function MM_findObj(n, d) { //v4.01
            var p,i,x;
            if (!d) d = document;
            if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
                d = parent.frames[n.substring(p + 1)].document;
                n = n.substring(0, p);
            }
            if (!(x = d[n]) && d.all) x = d.all[n];
            for (i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
            for (i = 0; !x && d.layers && i < d.layers.length; i++) x = MM_findObj(n, d.layers[i].document);
            if (!x && d.getElementById) x = d.getElementById(n);
            return x;
        }

        function MM_swapImage() { //v3.0
            var i,j = 0,x,a = MM_swapImage.arguments;
            document.MM_sr = new Array;
            for (i = 0; i < (a.length - 2); i += 3)
                if ((x = MM_findObj(a[i])) != null) {
                    document.MM_sr[j++] = x;
                    if (!x.oSrc) x.oSrc = x.src;
                    x.src = a[i + 2];
                }
        }

        function approve() 
		{
        	document.forms[0].event.value = '<%=approveEvent%>';
    		document.forms[0].submit();
		}

		function reject()
		{
		    document.forms[0].event.value='<%=rejectEvent%>';
		    document.forms[0].submit();
		}

		function makerClose()
		{
		    document.forms[0].event.value='<%=closeEvent%>';
		    document.forms[0].submit();
		}

</script>
<!-- InstanceEndEditable -->
</head>

<body >
<html:form action="TatDuration.do">
<input type="hidden" name="event" value=""/> 
  
<bean:define id="formObj" name="TatDurationForm" scope="request" type="com.integrosys.cms.ui.tatduration.TatDurationForm"/>
  
<table class="tblFormSection" width="70%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Process TAT Duration - <integro:wrapper value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.COMMON_CODE_APPLICATION_TYPE, iTat.getApplicationType())%>"/></h3></td>
    </tr>
    <tr>
      <td colspan="2"><hr/></td>
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
                                   
                                   String duration = OB.getDuration() + "";
	       						   if(duration.endsWith(".0") && duration.length()>2)
	       						   	   duration = duration.substring(0, duration.length()-2);
                                %>

                          <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <td><%=OB.getPreStage()%></td>
                          <td><%=OB.getPostStage()%></td>
                          <td align="center">&nbsp;

							<%= duration %>&nbsp;
                            <%= durationTypeLabelMap.get(OB.getDurationType()) %>
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
                                   
                                   String duration = OB.getDuration() + "";
	       						   if(duration.endsWith(".0") && duration.length()>2)
	       						   	   duration = duration.substring(0, duration.length()-2);
                                %>

                            <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <td><%=OB.getPreStage()%></td>
                          <td><%=OB.getPostStage()%></td>
                          <td align="center">
							<%= duration %>&nbsp;
                            <%= durationTypeLabelMap.get(OB.getDurationType()) %>
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
                                   
                                   String duration = OB.getDuration() + "";
	       						   if(duration.endsWith(".0") && duration.length()>2)
	       						   	   duration = duration.substring(0, duration.length()-2);
                                %>

                            <tr class="<%=rowClass%>">
                          <td class="index"><%=sno%></td>
                          <td><%=OB.getPreStage()%></td>
                          <td><%=OB.getPostStage()%></td>
                          <td align="center">&nbsp;
								<%= duration %>&nbsp;
                            	<%= durationTypeLabelMap.get(OB.getDurationType()) %>
                          </td>
                        </tr>
</logic:iterate>
</logic:present>
              </tbody>
         </table>
	    </td>
     </tr>
  </tbody>
</table>
	  
<p/>
<p/>
<p/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
  <tbody>
    <tr>
      <td class="fieldname"><bean:message key="label.remarks"/></td>
      <td class="odd"><html:textarea property="remarks" rows="4" cols="80"/><br><html:errors property="remarks"/></td>
    </tr>
    <tr>
      <td class="fieldname"><bean:message key="label.last.action.by"/></td>
      <td class="even">&nbsp;<%=lastActionBy%></td>
    </tr>
    <tr class="odd">
      <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
      <td><integro:wrapper value="<%=remarks%>" />&nbsp;</td>
    </tr>
  </tbody>
</table>
  
<table width="100"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
    <td valign="baseline" align="center">&nbsp;</td>
  </tr>
  	<% if("to_track".equals(event) || "view_property_index".equals(event)){%>
  	<tr>
	    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	  </tr>
	<% }else if("maker_prepare_close".equals(event) ){%>
  	<tr>
	    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/close2a.gif',1)" onClick="makerClose()" ><img src="img/close1a.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	  </tr>
  	<%}else{
  	%>
	  <tr>
	    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/approve2.gif',1)" onClick="approve()" ><img src="img/approve1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td width="100" valign="baseline" align="center">    <a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/reject2.gif',1)" onClick="reject()" ><img src="img/reject1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	    <td width="100" valign="baseline" align="center">    <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a></td>
	  </tr>
	  <%} %>
	  <tr>
	    <td valign="baseline" align="center">&nbsp;</td>
	  </tr>
</table>
</html:form>

<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd --></html>
