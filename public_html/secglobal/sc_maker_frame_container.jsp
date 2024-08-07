<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/sc_maker_frame_container.jsp,v 1.5 2006/10/27 08:13:10 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.5 $
 * @since $Date: 2006/10/27 08:13:10 $
 * Tag: $Name:  $
 */
 %>
<%@ page import="java.util.HashMap,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 org.apache.struts.util.MessageResources"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>

<%
    //String roleDesc = "";
    String title = "";

	HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
    MessageResources msg = (MessageResources)request.getAttribute(ICommonEventConstant.MESSAGE_RESOURCES);
    //roleDesc = msg.getMessage((String)map.get(ICommonEventConstant.ROLE_DESC));
    title = msg.getMessage((String)map.get(ICommonEventConstant.TITLE));


%>



<html>
<head>
<title><bean:message key="label.system.title" /></title>

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
window.onload = function() {
		resize();
		MM_preloadImages('img/tab_home2.gif','img/tab_help2.gif','img/tab_keys2.gif', 'img/tab_logout2.gif');
}
window.onresize = resize;
//-->
</script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<script language=JavaScript src="menu/SCMakerMenu.js" type=text/javascript></script>
<script language=JavaScript src="menu/mmenu.js" type=text/javascript></script>

<jsp:include page="/template/topbanner.jsp" />

<!-- Title Container -->
	  <table id="contentCompositeBar" border="0" cellpadding="0" cellspacing="0">
        <tr >
          <td nowrap="nowrap" id="contentTitleBar">
		  	  <label>Titles:</label>
              <label id="txtContentTitle"><%=title%></label>
		  </td>
		</tr>
	  </table>

	  <div id="contentCanvas" style="height:100%;width:100%;top:95px;left:0px;position:absolute;">


			<table border='1' cellpadding="0" cellspacing="1" class="tableSize">
				<tr valign='top'>
					<td width="20%">
						<template:get name='leftContainer'/>
					</td>
					<td width="80%"><template:get name='rightContainer'/>
					</td>
				</tr>
			</table>

	  </div>
	  <%@ include file="/template/image_strip_template.jsp" %>

	</div>
</body>
</html>