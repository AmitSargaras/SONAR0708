//use debugutil to help set to null on destroy
var Xloc, Yloc, Xwidth, Yheight;

var contentWin = null;

var win_main = null;
var win_sitemap = null;	
var win_utilities = null;
var win_preferences = null;

var utilities_filename = "";
var utilities_titleText = "";


function show_sitemap(){
	Xloc = 8;
	Yloc = 60;
	Xwidth = 150;
	Ywidth = 360;
	Ywidth = WindowUtilities.getPageSize().windowHeight - Yloc - 60;
	if (Ywidth < 360) Ywidth = 360;

	if (win_sitemap == null) {
		win_sitemap = new Window('(Site Map)', {className: currentTheme, title: "Site Map", 
						left:Xloc, top:Yloc, width:Xwidth, height:Ywidth, maximizable: false, minimizable: false, closable: false,
						resizable: false, url: "sitemap.jsp", showEffectOptions: {duration: 0.7}, hideEffectOptions: {duration: 0.5}});
		
		win_sitemap.setConstraint(true, {left:4, right:4, top: 55, bottom:0})
		win_sitemap.toFront();
		win_sitemap.setDestroyOnClose();
		win_sitemap.show();
	}
	else {
		win_sitemap.toFront();
		win_sitemap.show();
	}

	restartCountCookie();
}


function ReplaceWindow(newlocation){
	
	newurl = $(win_utilities.getId() + '_content');		
	newurl.src = newlocation;

}


function show_utilities(filename, titleText) {
	Xloc = 190;
	Yloc = 60;
	Xwidth = WindowUtilities.getPageSize().windowWidth - Xloc - 40;
	if (Xwidth < 640) Xwidth = 480;
	Ywidth = WindowUtilities.getPageSize().windowHeight - Yloc - 60;
	if (Ywidth < 360) Ywidth = 360;
	
	//alert(WindowUtilities.getPageSize().windowWidth + ", " + WindowUtilities.getPageSize().windowHeight);
	
	if ((filename == null) || (filename == ''))
		filename = 'utility.jsp';

	utilities_filename = filename;
	utilities_titleText = titleText;

	if (win_utilities == null) {
	
		win_utilities = new Window('(Utilities)', {className: currentTheme, title: "Welcome", 
						left:Xloc, top:Yloc, width:Xwidth, height:Ywidth, maximizable: true,
						resizable: true, url: filename, showEffectOptions: {duration: 0.7}, hideEffectOptions: {duration: 0.5}});
		
		win_utilities.setConstraint(true, {left:4, right:4, top: 55, bottom:0})
		win_utilities.toFront();
		win_utilities.setDestroyOnClose();
		win_utilities.show();
		
	}
	else {
	
		ReplaceWindow(filename);
		win_utilities.toFront();
		win_utilities.show();
	}

	if ((titleText != null) && (titleText != ''))
		win_utilities.setTitle(titleText);
	else
		win_utilities.setTitle("Welcome");

	debug("Page loaded: " + filename);
	restartCountCookie();
}

function handle_resize() {

	debug("***** Browser resize activated *****");
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "pageWidth: " + WindowUtilities.getPageSize().pageWidth);
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "pageHeight: " + WindowUtilities.getPageSize().pageHeight);
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "windowWidth: " + WindowUtilities.getPageSize().windowWidth);
	debug("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "windowHeight: " + WindowUtilities.getPageSize().windowHeight);

	if (win_utilities != null) {	
		Xloc = 190;
		Yloc = 60;
		Xwidth = WindowUtilities.getPageSize().windowWidth - Xloc - 40;
		if (Xwidth < 480) Xwidth = 480;
		Ywidth = WindowUtilities.getPageSize().windowHeight - Yloc - 60;
		if (Ywidth < 360) Ywidth = 360;

		if (win_utilities.isMaximized())
		{
			win_utilities.maximize();
			setTimeout("handle_resize()", 600);
		}

		win_utilities.setSize(Xwidth, Ywidth);
	}
}


function reload_Theme() {

	//changeTheme(currentTheme);

	if (win_sitemap != null)
		win_sitemap.destroy();
	
	if (win_utilities != null)
		win_utilities.destroy();

	setTimeout("reload_Theme_Actual()", 600);
	debug("Active theme is now [" + currentTheme + "]");

}

function reload_Theme_Actual() {
	show_sitemap();
	show_utilities(utilities_filename, utilities_titleText);
}

