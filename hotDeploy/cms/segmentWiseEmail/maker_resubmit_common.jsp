
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.cms.ui.segmentWiseEmail.SegmentWiseEmailForm,
	com.integrosys.base.techinfra.logger.DefaultLogger,
	com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,
	com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,
	com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.base.techinfra.util.DateUtil,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,
	java.util.*,
	java.util.Locale,
	java.util.Arrays,
	com.integrosys.cms.app.segmentWiseEmail.trx.ISegmentWiseEmailTrxValue,
	com.integrosys.cms.app.segmentWiseEmail.trx.OBSegmentWiseEmailTrxValue,
	com.integrosys.cms.app.segmentWiseEmail.bus.*"%>
<%
	SegmentWiseEmailForm segmentWiseEmailForm = (SegmentWiseEmailForm) request.getAttribute("SegmentWiseEmailForm");
	ISegmentWiseEmailTrxValue segmentWiseEmailTrx = (ISegmentWiseEmailTrxValue) session.getAttribute(
			"com.integrosys.cms.ui.segmentWiseEmail.SegmentWiseEmailAction.ISegmentWiseEmailTrxValue");
	ISegmentWiseEmail segmentWiseEmail = (OBSegmentWiseEmail) segmentWiseEmailTrx.getStagingSegmentWiseEmail();
	String flag="";
	
	if("ACTIVE".equals(segmentWiseEmail.getStatus()) && "PENDING_UPDATE".equals(segmentWiseEmailTrx.getFromState())) {
		flag="maker_prepare_resubmit_edit";
	}else if("INACTIVE".equals(segmentWiseEmail.getStatus()) && "PENDING_UPDATE".equals(segmentWiseEmailTrx.getFromState())) {
		flag="maker_prepare_resubmit_delete";
	}else if("ACTIVE".equals(segmentWiseEmail.getStatus()) && "PENDING_CREATE".equals(segmentWiseEmailTrx.getFromState())) {
		flag="maker_prepare_resubmit_create";
	}
	
	int sno = 0;
	int startIndex = 0;
	int counter = 0;

	List emailList = null;
	emailList = (ArrayList) request.getAttribute("emailList");
	pageContext.setAttribute("emailList", emailList);

	List allEmailList = null;
	allEmailList = (ArrayList) request.getAttribute("allEmailList");

	System.out.println("<<<<<<<<<Size>>>>>>>>> " + allEmailList.size());
	pageContext.setAttribute("allEmailList", allEmailList);

	String event = request.getParameter("event");
	
%>


<html>
<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script language="JavaScript" type="text/JavaScript">
	var emaillist=new Array();
	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}

	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}

</script>
<!-- InstanceEndEditable -->
</head>

<html:form action='segmentWiseEmail.do'>
	<html:hidden property="startIndex" />
	<body>
		<!-- InstanceBeginEditable name="Content" -->
		<table width="60%" border="0" align="center" cellpadding="0"
			cellspacing="0" >
			<tbody>
				<tr>
					<td>
						<% if("maker_prepare_resubmit_create".equals(flag)){ %>		
						    <jsp:include page="maker_resubmit_create_segment_wise_email.jsp"></jsp:include>
						<%} else if("maker_prepare_resubmit_edit".equals(flag)){ %>
						    <jsp:include page="maker_resubmit_edit_segment_wise_email.jsp"></jsp:include>
						<%} else if("maker_prepare_resubmit_delete".equals(flag)){ %>
						    <jsp:include page="maker_prepare_resubmit_delete.jsp"></jsp:include>	
						<%}%>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- InstanceEndEditable -->
	</body>
</html:form>
<!-- InstanceEnd -->
</html>
