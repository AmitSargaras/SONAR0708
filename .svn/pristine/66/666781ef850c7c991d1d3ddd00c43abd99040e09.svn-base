
function showDebugBox() {

	if ((location.href.indexOf("localhost") != -1) || (location.href.indexOf('http:') == -1))
		showExtendedDebug();

	// Set up a windows observer, check ou debug window to get messages
	var myObserver = {
		onStartMove: function(eventName, win) {
			debug(eventName + " on " + win.getId())
		},
		onEndMove: function(eventName, win) {
			debug(eventName + " on " + win.getId())
		},
		onStartResize: function(eventName, win) {
			debug(eventName + " on " + win.getId() + " width: " + win.getSize().width + " height: " + win.getSize().height)
		},
		onEndResize: function(eventName, win) {
			debug(eventName + " on " + win.getId() + " width: " + win.getSize().width + " height: " + win.getSize().height)
		},
		onClose: function(eventName, win) {
			debug(eventName + " on " + win.getId())
		},
		onDestroy: function(eventName, win) {
			if (win == contentWin) {
				$('container').appendChild($('test_content'));
				contentWin = null;
			}
			else if (win == win_sitemap) {
				win_sitemap = null;
			}
			else if (win == win_utilities) {
				win_utilities = null;
			}
			else if (win == win_main) {
				win_main = null;
			}
			else if (win == win_preferences) {
				win_preferences = null;
			}
			else if (win == win_broadcast) {
				win_broadcast = null;
			}

			debug(eventName + " on " + win.getId())
		}
	}
	Windows.addObserver(myObserver);

	debug("pageWidth: " + WindowUtilities.getPageSize().pageWidth);
	debug("pageHeight: " + WindowUtilities.getPageSize().pageHeight);
	debug("windowWidth: " + WindowUtilities.getPageSize().windowWidth);
	debug("windowHeight: " + WindowUtilities.getPageSize().windowHeight);

}

