GB_showFullScreenSet = function(set, start_index, callback_fn) {
    var options = {
        type: 'page',
        fullscreen: true,
        center_win: false
    }
    var gb_sets = new GB_Sets(options, set);
    gb_sets.addCallback(callback_fn);
    gb_sets.showSet(start_index-1);
    return false;
}

GB_showImageSet = function(set, start_index, callback_fn) {
	alert("dddd");
    var options = {
        type: 'image',
        fullscreen: false,
        center_win: true,
        width: 300,
        height: 300
    }
    var win = new GB_Gallery(options);
    var gb_sets = new GB_Sets(options, set);
    gb_sets.addCallback(callback_fn);
    gb_sets.showSet(start_index-1);
    return false;
}
GB_Gallery = GreyBox.extend({
    init: function(options) {
        this.parent({});
        this.img_close = this.root_dir + 'g_close.gif';
        AJS.update(this, options);
        this.addCallback(this.callback_fn);
    },

    initHook: function() {
        AJS.addClass(this.g_window, 'GB_Gallery');

        var inner = AJS.DIV({'class': 'inner'});
        this.header = AJS.DIV({'class': 'GB_header'}, inner);
        AJS.setOpacity(this.header, 0);
        AJS.getBody().insertBefore(this.header, this.overlay.nextSibling);

        var td_caption = AJS.TD({'id': 'GB_caption', 'class': 'caption', 'width': '20%'}, this.caption);
        var td_middle = AJS.TD({'id': 'GB_middle', 'class': 'middle', 'width': '20%'});

        var img_close = AJS.IMG({'src': this.img_close});
        AJS.AEV(img_close, 'click', GB_hide);
        var td_close = AJS.TD({'class': 'close', 'width': '20%'}, img_close);

        var tbody = AJS.TBODY(AJS.TR(td_caption, td_middle, td_close));

        var table = AJS.TABLE({'cellspacing': '0', 'cellpadding': 0, 'border': 0}, tbody);
        AJS.ACN(inner, table);

        if(this.fullscreen)
            AJS.AEV(window, 'scroll', AJS.$b(this.setWindowPosition, this));
        else
            AJS.AEV(window, 'scroll', AJS.$b(this._setHeaderPos, this));
    },

    setFrameSize: function() {
        var overlay_w = this.overlay.offsetWidth;
       
        var page_size = AJS.getWindowSize();

        if(this.fullscreen) {
            this.width = 500;
            this.height = 500;
        }
        AJS.setWidth(this.iframe, 500);
        AJS.setHeight(this.iframe, 500);

        AJS.setWidth(this.header, 1000);
    },

    _setHeaderPos: function() {
        AJS.setTop(this.header, AJS.getScrollTop()+10);
    },

    setWindowPosition: function() {
        var overlay_w = this.overlay.offsetWidth;
        var page_size = AJS.getWindowSize();
        AJS.setLeft(this.g_window, 250);

        var header_top = AJS.getScrollTop()+55;
        if(!this.center_win) {
            AJS.setTop(this.g_window, header_top);
        }
        else {
            var fl = ((page_size.h - this.height) /2) + 20 + AJS.getScrollTop();
            if(fl < 0) fl = 0;
            if(header_top > fl) {
                fl = header_top;
            }
            AJS.setTop(this.g_window, fl);
        }
        this._setHeaderPos();
    },

    onHide: function() {
        AJS.removeElement(this.header);
        AJS.removeClass(this.g_window, 'GB_Gallery');
    },

    onShow: function() {
        if(this.use_fx)
            AJS.fx.fadeIn(this.header, {to: 1});
        else
            AJS.setOpacity(this.header, 1);
    }
});

GB_Sets = GB_Gallery.extend( {
	init : function(a, b) {
		this.parent(a);
		if (!this.img_next) {
			this.img_next = this.root_dir + "next.gif"
		}
		if (!this.img_prev) {
			this.img_prev = this.root_dir + "prev.gif"
		}
		this.current_set = b
	},
	showSet : function(a) {
		this.current_index = a;
		var b = this.current_set[this.current_index];
		this.show(b.url);
		this._setCaption(b.caption);
		this.btn_prev = AJS.IMG( {
			"class" : "left",
			src : this.img_prev
		});
		this.btn_next = AJS.IMG( {
			"class" : "right",
			src : this.img_next
		});
		AJS.AEV(this.btn_prev, "click", AJS.$b(this.switchPrev, this));
		AJS.AEV(this.btn_next, "click", AJS.$b(this.switchNext, this));
		GB_STATUS = AJS.SPAN( {
			"class" : "GB_navStatus"
		});
		AJS.ACN(AJS.$("GB_middle"), this.btn_prev, GB_STATUS, this.btn_next);
		this.updateStatus()
	},
	updateStatus : function() {
		AJS.setHTML(GB_STATUS, (this.current_index + 1) + " / "
				+ this.current_set.length);
		if (this.current_index == 0) {
			AJS.addClass(this.btn_prev, "disabled")
		} else {
			AJS.removeClass(this.btn_prev, "disabled")
		}
		if (this.current_index == this.current_set.length - 1) {
			AJS.addClass(this.btn_next, "disabled")
		} else {
			AJS.removeClass(this.btn_next, "disabled")
		}
	},
	_setCaption : function(a) {
		AJS.setHTML(AJS.$("GB_caption"), a)
	},
	updateFrame : function() {
		var a = this.current_set[this.current_index];
		this._setCaption(a.caption);
		this.url = a.url;
		this.startLoading()
	},
	switchPrev : function() {
		if (this.current_index != 0) {
			this.current_index--;
			this.updateFrame();
			this.updateStatus()
		}
	},
	switchNext : function() {
		if (this.current_index != this.current_set.length - 1) {
			this.current_index++;
			this.updateFrame();
			this.updateStatus()
		}
	}
});

AJS.AEV(window, "load", function() {
	AJS.preloadImages(GB_ROOT_DIR + "next.gif", GB_ROOT_DIR + "prev.gif")
});




