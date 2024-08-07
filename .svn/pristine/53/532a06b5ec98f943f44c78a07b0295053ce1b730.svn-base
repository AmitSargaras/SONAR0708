<%-- 
  triggered from \template\topbanner.jsp
	- started from changeSettings()
	- wrapped up from checkPreferenceClosed()
	
  each time a new theme is added, the css is to be inserted into \themes\stylesheet_template.jsp
--%>

<html>

<head>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />

<script language="JavaScript" type="text/javascript" src="<%=request.getContextPath()%>/js/sec_layout_tabcontent.js"></script>

<SCRIPT type=text/javascript>
<!--
	var omitformtags=["input", "textarea", "select"];
	omitformtags=omitformtags.join("|");
	
	function disableselect(e){
		if (omitformtags.indexOf(e.target.tagName.toLowerCase())==-1)
		return false
	}
	
	function reEnable(){
		return true
	}
	
	if (typeof document.onselectstart!="undefined")
		document.onselectstart=new Function ("return false")
	else {
		document.onmousedown=disableselect
		document.onmouseup=reEnable
	}

	function MM_preloadImages(){var d=document;if(d.images){if(!d.MM_p)d.MM_p=new Array();var i,j=d.MM_p.length,a=MM_preloadImages.arguments;for(i=0;i<a.length;i++)if(a[i].indexOf("#")!=0){d.MM_p[j]=new Image;d.MM_p[j++].src=a[i];}}};function MM_findObj(n,d){var p,i,x;if(!d)d=document;if((p=n.indexOf("?"))>0&&parent.frames.length){d=parent.frames[n.substring(p+1)].document;n=n.substring(0,p);}if(!(x=d[n])&&d.all)x=d.all[n];for(i=0;!x&&i<d.forms.length;i++)x=d.forms[i][n];for(i=0;!x&&d.layers&&i<d.layers.length;i++)x=MM_findObj(n,d.layers[i].document);if(!x&&d.getElementById)x=d.getElementById(n);return x;};function MM_swapImage(){var i,j=0,x,a=MM_swapImage.arguments;document.MM_sr=new Array;for(i=0;i<(a.length-2);i+=3)if((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x;if(!x.oSrc)x.oSrc=x.src;x.src=a[i+2];}};function MM_swapImgRestore(){var i,x,a=document.MM_sr;for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++)x.src=x.oSrc;}function MM_reloadPage(init){if(init==true)with(navigator){if((appName=="Netscape")&&(parseInt(appVersion)==4)){document.MM_pgW=innerWidth;document.MM_pgH=innerHeight;onresize=MM_reloadPage;}}else if(innerWidth!=document.MM_pgW||innerHeight!=document.MM_pgH)location.reload();}MM_reloadPage(true);

	var imgpath = "./";
	
	function showImage(imgName) {
	  document.images["mainImg"].src = imgpath + "theme_" + imgName + ".jpg";

	  var elmt = document.formTheme.imgMenu;
	  for (var i = 0; i < elmt.options.length; i++) {
		if (elmt.options[i].value == imgName) {
		  elmt.selectedIndex = i;
		  break;
		}
	  }
	}

	function showLayoutImage(imgName) {
	  document.images["mainImgTabbed"].src = imgpath + "layout_" + imgName + ".jpg";

	  var elmt = document.formLayout.imgTabbed;
	  for (var i = 0; i < elmt.options.length; i++) {
		if (elmt.options[i].value == imgName) {
		  elmt.selectedIndex = i;
		  break;
		}
	  }
	}

	function save_preferences(preValue, myName) {
		if (typeof parent.setCookie == 'function')
			parent.setCookie(myName, preValue, 31536000);

		//function can be found inside \console\scripts\theme_pages.js
		if (typeof parent.close_preferences == 'function')		
			parent.close_preferences();
	}


	var curpage = "div_showall";
	
	function gotopage(newpage) {
		document.getElementById(curpage).style.display = "none";
		document.getElementById(newpage).style.display = "block";
		curpage = newpage; 
	}

	function preloadBttns(){
		var btns=new Array();
		btns[0]=new Image(); btns[0].src='misc/desktop_over.gif';
		btns[1]=new Image(); btns[1].src='misc/dock_over.gif';
		btns[2]=new Image(); btns[2].src='misc/icons_over.gif';
		btns[3]=new Image(); btns[3].src='misc/showall_over.gif';
		btns[4]=new Image(); btns[4].src='misc/themes_over.gif';
		btns[5]=new Image(); btns[5].src='misc/cache_over.gif';
		btns[6]=new Image(); btns[6].src='misc/other_colors_over.gif';
		btns[7]=new Image(); btns[7].src='misc/wallpaper_over.gif';
	}

	function selectOption(num, myName)
	{
		var selObj = document.getElementById(myName);
		selObj.selectedIndex = num;
	}

	function clean_cache()
	{
		if (typeof parent.getCookie == 'function') {
			var cachedTabCountData = getCookieTabCount('cms_tab_cache');
			if (cachedTabCountData != null) {
				for (var tabno = 0; tabno < cachedTabCountData.length; tabno++) {
					//alert(parent.getCookie('cms_tab_header_' + cachedTabCountData[tabno]));
					parent.deleteCookie('cms_tab_header_' + cachedTabCountData[tabno]);
					
					//alert(parent.getCookie('cms_tab_tag_' + cachedTabCountData[tabno]));
					parent.deleteCookie('cms_tab_tag_' + cachedTabCountData[tabno]);
				}
			}
			parent.deleteCookie('cms_tab_cache');

			//parent.deleteCookie('cms_layout');
			//parent.deleteCookie('cms_style');
			//parent.deleteCookie('bgcolor');
			//parent.deleteCookie('bgimage');	
		}
	
	}

	preloadBttns();

//-->
</SCRIPT>

<STYLE type=text/css>
BODY {
	PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND-IMAGE: url(misc/background.gif); PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; moz-user-select: none
}

BODY {
	FONT: 11px Verdana, Arial, Helvetica, sans-serif; OVERFLOW: hidden
}
TD {
	FONT: 11px Verdana, Arial, Helvetica, sans-serif; OVERFLOW: hidden
}
TH {
	FONT: 11px Verdana, Arial, Helvetica, sans-serif; OVERFLOW: hidden
}
.showall {
	FONT-SIZE: 11px; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}

</STYLE>

</head>

<BODY bgcolor="#ffffff" ondragstart="return false" 
onload="MM_preloadImages('misc/showall_over.gif','misc/themes_over.gif','misc/dock_over.gif','misc/icons_over.gif','misc/desktop_over.gif','misc/cache_over.gif','misc/other_colors_over.gif','misc/wallpaper_over.gif');">


<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
	<TBODY>
		<TR>
		<TD background="misc/bg.gif" height=54 width="100%">
			<A 
		      onmouseover="MM_swapImage('showall','','misc/showall_over.gif',1)" 
		      onmouseout=MM_swapImgRestore() 
		      href="javascript:gotopage('div_showall')"><IMG id=showall height=54 alt="" 
		      src="misc/showall.gif" width=80 border=0 name=showall></A>	  
			<A 
			  onmouseover="MM_swapImage('themes','','misc/themes_over.gif',1)" 
			  onmouseout=MM_swapImgRestore() 
			  href="javascript:gotopage('div_themes')"><IMG id=themes height=54 alt="" 
			  src="misc/themes.gif" width=52 border=0 name=themes></A>
			<A 
			  onmouseover="MM_swapImage('desktop','','misc/desktop_over.gif',1)" 
			  onmouseout=MM_swapImgRestore() 
			  href="javascript:gotopage('div_desktop')"><IMG id=desktop height=54 alt="" 
			  src="misc/desktop.gif" width=56 border=0 name=desktop></A>
			<A 
			  onmouseover="MM_swapImage('cache','','misc/cache_over.gif',1)" 
			  onmouseout=MM_swapImgRestore() 
			  href="javascript:gotopage('div_cache')"><IMG id=cache height=54 alt="" 
			  src="misc/cache.gif" width=56 border=0 name=cache></A>
		</TD>
		</TR>
	</TBODY>
</TABLE>


<DIV id=div_showall style="DISPLAY: block">
<TABLE cellSpacing=0 cellPadding=0 width=340 align=center border=0>
  <TBODY>
  <TR>
    <TD>
		<BR><STRONG>Themes</STRONG><BR>
		<DIV class=showall style="MARGIN: 0px 0px 0px 15px">The theme panel allows you to change the appearance of the site.</DIV>
		<BR><STRONG>Layouts</STRONG> 
		<DIV class=showall style="MARGIN: 0px 0px 0px 15px">The layout panel allows you to change the layout for collateral pages - flat or tabbed.</DIV>
		<BR><STRONG>Cache Clean</STRONG> 
		<DIV class=showall style="MARGIN: 0px 0px 0px 15px">The cache panel allows you to remove the cache information stored in the browser. This cache shall be re-created when the application is being used again.</DIV>
	</TD>
  </TR>
  </TBODY>
  </TABLE>
</DIV>

<DIV id=div_themes style="DISPLAY: none">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><BR>
      <FORM style="MARGIN-BOTTOM: 0px" name=formTheme>
      <SELECT class=select onchange=showImage(this.options[this.selectedIndex].value); name=imgMenu id=imgMenuId> 
		<OPTION value=blackwhite>Black and White Theme</OPTION>
        <OPTION value=blue>Blue Theme</OPTION>
		<OPTION value=green>Green Theme</OPTION>
        <OPTION value=orange>Orange Theme</OPTION>
      </SELECT> 
      <P><IMG height=213 alt="" src="./theme_blue.jpg" width=320 border=1 name=mainImg> 
      <INPUT onclick="save_preferences(form.imgMenu.value, 'cms_style');" type=button value="Apply Theme"> 
      </P>
      </FORM>
      </DIV>
    </TD></TR></TBODY></TABLE>
</DIV>

<DIV id=div_desktop style="DISPLAY: none">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><BR>
      <FORM style="MARGIN-BOTTOM: 0px" name=formLayout>
      <SELECT class=select onchange=showLayoutImage(this.options[this.selectedIndex].value); name=imgTabbed id=imgTabbedId> 
        <OPTION value=flat>Flat Layout</OPTION>
        <OPTION value=tabbed>Tabbed Layout</OPTION>
      </SELECT> 
      <P><IMG height=213 alt="" src="./layout_flat.jpg" width=320 border=1 name=mainImgTabbed> 
      <INPUT onclick="save_preferences(form.imgTabbed.value, 'cms_layout');" type=button value="Apply Layout"> 
      </P>
      </FORM>
      </DIV>
    </TD></TR></TBODY></TABLE>
</DIV>

<DIV id=div_cache style="DISPLAY: none">
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><BR>
      <FORM style="MARGIN-BOTTOM: 0px" name=formCache>
      <SELECT class=select onchange=showLayoutImage(this.options[this.selectedIndex].value); name=imgCache id=imgCacheId> 
        <OPTION value=cache>Clear Cache</OPTION>
      </SELECT> 
      <P><IMG height=140 alt="" src="./cache_trash.png" width=140 border=1 name=mainImgCache onmouseover="MM_swapImage('mainImgCache','','./cache_trash_over.png',1)" onmouseout=MM_swapImgRestore()>
      <br><br><INPUT onclick="clean_cache();" type=button value="Apply"> 
      </P>
      </FORM>
      </DIV>
    </TD></TR></TBODY></TABLE>
</DIV>


<SCRIPT type=text/javascript>
<!--

if (typeof parent.getCookie == 'function') {

	styletitle = parent.getCookie('cms_style');
	if (styletitle == null) {
		styletitle = 'blue';
		parent.setCookie('cms_style', styletitle, 31536000);
	}

	var selObj = document.getElementById('imgMenuId');
	if (selObj.options != null) {
		for (var i = 0; i < selObj.options.length; i++) {
			if (selObj.options[i].value == styletitle) {
				//alert(i + " : " + selObj.options[i] + "  " + styletitle);
				selectOption(i, 'imgMenuId');
				showImage(styletitle);
				break;
			}
		}
	}
	

	layouttitle = parent.getCookie('cms_layout');
	if (layouttitle == null) {
		layouttitle = 'flat';
		parent.setCookie('cms_layout', layouttitle, 31536000);
	}

	var tabbedObj = document.getElementById('imgTabbedId');
	if (tabbedObj.options != null) {
		for (var i = 0; i < tabbedObj.options.length; i++) {
			if (tabbedObj.options[i].value == layouttitle) {
				selectOption(i, 'imgTabbedId');
				showLayoutImage(layouttitle);
				break;
			}
		}
	}

}
//-->
</SCRIPT>

</body>
</html>
