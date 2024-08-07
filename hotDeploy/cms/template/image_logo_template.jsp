<%-- this is for displaying application logo --%>
<script type="text/javascript">
	var cookie = read_Cookie("cms_style");
	var styletitle = cookie ? cookie : get_PreferredStyleSheet();

	var imgName = "<%=request.getContextPath()%>/themes/" + styletitle + "/img/banner.jpg";
	document.write('<td height="48" style="background-image: url(' + imgName + '); background-repeat: no-repeat;background-color:white;" align="right" valign="bottom" class="role">');
</script>
