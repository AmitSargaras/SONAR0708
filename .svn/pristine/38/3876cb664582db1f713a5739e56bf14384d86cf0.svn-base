function createjsDOMenu() {

	mainMenu = new jsDOMenu(170);
	with (mainMenu) {
		addMenuItem(new menuItem("Maintenance Console", "", ""));
		addMenuItem(new menuItem("-"));
		addMenuItem(new menuItem("Switch Theme", "switchTheme", ""));
		//addMenuItem(new menuItem("Dock Settings", "dockSettings", ""));
		//addMenuItem(new menuItem("Desktop Background", "desktopBackground", ""));
	}

	switchThemeSubMenu = new jsDOMenu(130);
	with (switchThemeSubMenu) {
		addMenuItem(new menuItem("Alphacube", "", "javascript:parent.refreshTheme('alphacube')"));
		addMenuItem(new menuItem("DarkX", "", "javascript:parent.refreshTheme('darkX')"));
		addMenuItem(new menuItem("Lighting - Blue", "", "javascript:parent.refreshTheme('darkbluelighting')"));
		addMenuItem(new menuItem("Lighting - Cyan", "", "javascript:parent.refreshTheme('bluelighting')"));
		addMenuItem(new menuItem("Lighting - Green", "", "javascript:parent.refreshTheme('greenlighting')"));
		addMenuItem(new menuItem("Lighting - Gray", "", "javascript:parent.refreshTheme('greylighting')"));
		addMenuItem(new menuItem("Mac OS X", "", "javascript:parent.refreshTheme('mac_os_x')"));
		addMenuItem(new menuItem("Nuncio", "", "javascript:parent.refreshTheme('nuncio')"));
		addMenuItem(new menuItem("Roundy", "", "javascript:parent.refreshTheme('theme1')"));
		addMenuItem(new menuItem("Spread", "", "javascript:parent.refreshTheme('spread')"));
	}

	mainMenu.items.switchTheme.setSubMenu(switchThemeSubMenu);

	setPopUpMenu(mainMenu);
	activatePopUpMenuBy(1, 2);

}