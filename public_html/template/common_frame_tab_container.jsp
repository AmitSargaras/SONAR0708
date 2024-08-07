<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.Map,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.limit.proxy.*,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.cccertificate.proxy.*,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.base.uiinfra.common.MessageResourceUtils,
                 java.util.Locale"%>
                 

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<% 
	
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); 

	Map map = (Map)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
    String title = MessageResourceUtils.getInstance().getMessage(null, (String)map.get(ICommonEventConstant.TITLE), null, pageContext, null);

	//System.out.println(map);
	//String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    //String leftPath = (String)map.get(ICommonEventConstant.LEFT_FRAME);
	
    if(null == title) {
        title = "";
    }

    ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    String cccStatus = "Not Issued";
    String sccStatus = "Not Issued";
    String bflStatus = "-";
    
    if(customer.getNonBorrowerInd()) {
        DefaultLogger.debug(this, "ILimitProfile is not in session.");
        /*
        sccStatus = "-";       
        ICCCertificateProxyManager certProxy = CCCertificateProxyManagerFactory.getCCCertificateProxyManager();
        if (certProxy.isAllCCCGenerated(customer))
        {
            cccStatus = "Issued";
        }
        */
    }
    else {
        DefaultLogger.debug(this, "Found ILimitProfile in session.");
		/*
        ILimitProxy proxy = LimitProxyFactory.getProxy();
        profile = proxy.getLimitProfile(profile.getLimitProfileID());   //refreshing the object
        
        int scc_status_ind = proxy.getSCCStatus(profile);                
        if(ICMSConstant.SCC_NOT_APPLICABLE == scc_status_ind) {
            sccStatus = "N.A.";
        }
        if(ICMSConstant.SCC_FULL_ISSUED == scc_status_ind) {
            sccStatus = "Issued";
        }
        if(ICMSConstant.SCC_PARTIAL_ISSUED == scc_status_ind) {
            sccStatus = "Partial";
        }               
        if(ICMSConstant.CCC_FULL_ISSUED == proxy.getCCCStatus(profile)) {
            cccStatus = "Issued";
        }
        bflStatus = proxy.getLatestBFLDesc(profile);
        */
    }
    
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);

	System.out.println("///////////////////////////////// Right Frame is ///////////////////////////// common_frame_tab_container.jsp");
%>

<html>
<head>
<title><bean:message key="label.system.title" /></title>
<%@ include file="/template/stylesheet_template.jsp" %>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>

<script language="JavaScript" type="text/javascript">
<!--
initCountCookie("<%=user.getLoginID()%>", "<%=session.getMaxInactiveInterval()%>");
window.onload = function() {
		resize();
		MM_preloadImages('img/tab_home2.gif','img/tab_help2.gif','img/tab_keys2.gif', 'img/tab_logout2.gif');
		countDownSession();
		extraOnLoadTask();
}
document.onstop = setUnloadFlag;
window.onunload = setServerSubmit;

window.onbeforeprint = resizeOnPrint;
window.onafterprint = resizeOnAfterPrint;
window.onresize = resize;

//-->
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">


<jsp:include page="/template/topbanner.jsp" />
<%
	if(null != customer) {
%>
	  <table id="winTitleBar" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td align="left" bgcolor="#FFFFFF"><input id="imgPropertyIcon" name="imgPropertyIcon" type="image" src="img/win/icon.gif" width="16" height="16" border="0" />
		  </td>
		  <td id="tdWinTitle" style="width:100%" bgcolor="#FFFFFF">
			  <label></label>
			  <label><%=customer.getCustomerName()%></label>
			  &nbsp;(<%=customer.getCMSLegalEntity().getLEReference()%>)
		  </td>
		</tr>
	</table>
  <% } %>
<%-- Title Container --%>
	  <table id="contentCompositeBar2" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td nowrap="nowrap">
		  	  <label><bean:message key="label.title"/>:</label>
              <label id="txtContentTitle"><%=title%></label>
		  </td>
<%-- WinTitle Container --%>


<%
	if(null != profile && (!"DELETED".equals(profile.getBCAStatus())))
	{
%>
		  <td nowrap="nowrap">
			  <label><bean:message key="label.global.host.los.aa.number"/>:</label>
			  <label id="txtContentTitle"><%=profile.getBCAReference()%>
	<%--	 /	<integro:empty-if-null value="<%=profile.getLosLimitProfileReference() %>"/> --%>	
			  </label>		  </td>
		  <td nowrap="nowrap">
			  <label>Approved Date:</label>
			  <label id="txtContentTitle"><%=DateUtil.formatDate(locale,(profile.getApprovalDate()))%></label>
		  </td>        
<%  }  
    else
    {
%>      <td nowrap="nowrap">
			  <label>Instruction Ref:</label>
			  <label id="txtContentTitle">-</label>
		  </td>
		  <td nowrap="nowrap">
			  <label>Approved Date:</label>
			  <label id="txtContentTitle">-</label>
		  </td>
<%  }
%>
        </tr>
<%--
		<tr >
		  <td nowrap="nowrap">
			  <label>BFL Status:</label>
			  <label id="txtContentTitle"><%=bflStatus%></label>
		  </td>

		  <td nowrap="nowrap">
			  <label>SCC Status:</label>
			  <label id="txtContentTitle"><%=sccStatus%></label>
		  </td>
		</tr>
--%>
	  </table>
    <div id="contentCanvas" style="height:100%;width:100%;top:125px;left:0px;position:absolute;">

      <table border='1' cellpadding="0" cellspacing="1" class="tableSize">
          <tr valign='top'>
              <td id="leftFrameTD" width="15%">
                  <div style="height:100%;width:100%;overflow:auto;position:absolute;">
                    <template:get name='leftContainer'/>
                  </div>
              </td>
              <td width="85%">
                  <%String errMsg = (String)session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.errorMsg");
                      System.out.println("--------------------------------errMsg : " + errMsg);
                  if(errMsg != null && !errMsg.equals("")){%>
                  <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left" width="100%"><font face=Tahoma size=2 color="#FF0000"><%=errMsg%></font></td>
                    </tr>
                  </table>
                  <%}%>
                  <div id="contentCanvasTab" style="overflow-x:hidden;width:100%;height:6%;position:relative">
                  	<table width="100%" style="border-bottom: 1 solid" cellpadding="0" cellspacing="0">
                  	<tr><td>
                      <template:get name='rightContainerTab'/>
                    </td></tr>
                    </table>
                  </div>
                  <div id="contentCanvasInnerTab" style="overflow:auto;height:93%;width:100%;position:absolute;">
					  <jsp:include page="/template/common_error_message.jsp"/>
                      <template:get name='rightContainer'/>
                  </div>
              </td>
          </tr>
      </table>
    </div>
	  <%@ include file="/template/image_strip_template.jsp" %>
	  </div>
</body>
</html>