<%-- this is for the bottom strip, </div> is done by respective JSP --%>
<script type="text/javascript">
	var cookie = read_Cookie("cms_style");
	var styletitle = cookie ? cookie : get_PreferredStyleSheet();

	var stripImgName = "<%=request.getContextPath()%>/themes/" + styletitle + "/img/stripbottom.jpg";
	document.write('<div id="windowList" style="text-align:right; height:20px;width:100%;top:117px;left:0px;background-image:url(' + stripImgName + ')">');
</script>