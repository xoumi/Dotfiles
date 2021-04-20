// ==UserScript==
// @name           userChrome.js
// @namespace      scrollbars_win10
// @version        0.0.8
// @note           Windows 10 style by /u/mrkwatz https://www.reddit.com/r/FirefoxCSS/comments/7fkha6/firefox_57_windows_10_uwp_style_overlay_scrollbars/
// @note           Brought to Firefox 57 by /u/Wiidesire https://www.reddit.com/r/firefox/comments/7f6kc4/floating_scrollbar_finally_possible_in_firefox_57/
// @note           userChrome.js https://github.com/nuchi/firefox-quantum-userchromejs
// @note           Forked from https://github.com/Endor8/userChrome.js/blob/master/floatingscrollbar/FloatingScrollbar.uc.js
// ==/UserScript==

(function () {
	var css = `
		:not(select):not(hbox) > scrollbar {
			-moz-appearance: none!important;
			position: relative!important;
			background-color: transparent;
			pointer-events: none;
			z-index: 2147483647;
		}
		:not(select):not(hbox) > scrollbar * {
			-moz-appearance: none!important;
			background-color: transparent!important;
			pointer-events: none;
		}
		:not(select):not(hbox) > scrollbar thumb {
			-moz-appearance: none!important;
			background-color: transparent;
			pointer-events: auto;
		}
		:not(select):not(hbox) > scrollbar[orient = "vertical"] {
			min-width: 12px!important;
			-moz-margin-start: -12px;/*margin to fill the whole render window with content and overlay the scrollbars*/
		}
		:not(select):not(hbox) > scrollbar[orient = "horizontal"] {
			height: 12px!important;
			margin-top: -12px;
		}
		:not(select):not(hbox) > scrollbar[orient = "vertical"] thumb {
			border-right: 2px solid rgba(133, 132, 131, 1);
			width: 12px;
			min-height: 12px;
			transition: border 0.1s ease-in;
		}
		:not(select):not(hbox) > scrollbar[orient = "horizontal"] thumb {
			border-bottom: 2px solid rgba(133, 132, 131, 1);
			min-width: 12px;
			transition: border 0.1s ease-in;
		}
		:not(select):not(hbox) > scrollbar:hover {
			background-color: rgba(0, 0, 0, 0.25);
			max-width: 12px!important;
			point-events: auto;
		}
		:not(select):not(hbox) > scrollbar:hover thumb {
			border-width: 12px;
			transition: border 0s linear;
		}
		:not(select):not(hbox) > scrollbar scrollbarbutton, :not(select):not(hbox) > scrollbar gripper {
			/*display: none;*/
		}
		@-moz-document domain("youtube.com") {
			:not(select):not(hbox) > scrollbar[orient = "vertical"]:not(:hover) thumb {
				opacity: 0 !important;
			}
		}
	`;

	var sss = Cc['@mozilla.org/content/style-sheet-service;1'].getService(Ci.nsIStyleSheetService);
	var uri = makeURI('data:text/css;charset=UTF=8,' + encodeURIComponent(css));

	sss.loadAndRegisterSheet(uri, sss.AGENT_SHEET);

})();
// userChrome.js
userChrome.import("/customScrollbar/custom_scrollbars.uc.js", "UChrm");
