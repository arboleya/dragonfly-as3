var quicknavDoc = null;

function loadData() {
	// silently fails to load anything if the required DOM APIs
	// are missing, in which case the quicknav will not appear.
	if (document.implementation && document.implementation.createDocument) {
		quicknavDoc = document.implementation.createDocument("", "", null);
		quicknavDoc.onload = attachQuicknav;
		if (quicknavDoc.load) {
			quicknavDoc.load(adjustHref("quicknav.xml"));
		}
	} else if (ActiveXObject) {
		var xmlhttp = null;
		try {
			xmlhttp = new ActiveXObject('Msxml2.XMLHTTP');
		} catch (e) {
			try {
				xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
			} catch (e) {
				return;  // give up
			}
		}
		xmlhttp.onreadystatechange = function() {
			if (quicknavDoc != null) {
				return;
			}
			if (xmlhttp.readyState==4) {
				if (xmlhttp.status==200) {
					quicknavDoc = xmlhttp.responseXML;
					attachQuicknav();
				} else {
					alert("quicknav: "+statusText);
				}
			} 
		};
		xmlhttp.open("GET", adjustHref("quicknav.xml"));
		xmlhttp.send("");
	}
}

function attachQuicknav() {
	if (quicknavDoc.documentElement == null) {
		alert("quicknav: no doc");
		return;
	}
	var main_nav = document.getElementById("main_nav");
	var li = document.createElement("li");
	li.className = "quicknav";
	var span = document.createElement("span");
	span.className = "ui";
	main_nav.insertBefore(li, main_nav.firstChild);
	li.appendChild(span);
	// setup quicknav input box,
	var label = document.createElement("label");
	label.setAttribute("for", "quicknav_input");
	label.appendChild(document.createTextNode("Quicknav "));
	span.appendChild(label);
	var input = document.createElement("input");
	input.id = "quicknav_input"
	input.autocomplete = "off";
	input.onfocus = quicknavFocus;
	input.onkeyup = quicknavKeyup;
	input.onblur = quicknavBlur;
	span.appendChild(input);
	var menu = document.createElement("ul");
	menu.id = "quicknav_menu";
	menu.style.visibility = "hidden";
	menu.appendChild(document.createTextNode("Loading..."));
	span.appendChild(menu);
}

function quicknavFocus() {
	showQuicknavMenu();
	quicknavSearch();
}

function quicknavKeyup() {
	quicknavSearch();
}
function quicknavSearch() {
 	var input = document.getElementById("quicknav_input");
	var search = input.value.toLowerCase();
	var items = quicknavDoc.getElementsByTagName("li");
	var menu = document.getElementById("quicknav_menu");
	clearQuicknavMenu(menu);
	var count = 0;
	for (var i=0; i < items.length; i++) {
		var item = items[i];
		var match = item.firstChild.firstChild.nodeValue;
		if (match.substr(0, search.length).toLowerCase() == search) {
			menu.appendChild(createMenuItem(item));
			count++;
		}
		if (count >= 8) {
			break;
		}
	}
}

function createMenuItem(sourceNode) {
	var li = document.createElement("li");
	var a = document.createElement("a");
	li.appendChild(a);
	var sourceLink = sourceNode.firstChild;
	var anchorText = sourceLink.firstChild.nodeValue;
	a.appendChild(document.createTextNode(anchorText));
	var href = sourceLink.getAttribute("href");
	href = adjustHref(href);
	a.setAttribute("href", href);
	a.setAttribute("title", sourceLink.getAttribute("title"));
	return li;
}

/**
 * Adjusts the given path, which is relative to the 'base document directory',
 * returning a path relative to the current page instead, and therefore useful
 * as the deftination of a hyperlink within this page.
 */
function adjustHref(href) {
	return document.quicknavBasePath + "/" + href;
}

function clearQuicknavMenu(menu) {
	for (var i = menu.childNodes.length -1; i >= 0 ; i--) {
		menu.removeChild(menu.childNodes[i]);
	}
}

function quicknavBlur() {
	// give the user a chance to click on one of the menu items,
	setTimeout("hideQuicknavMenu()", 200);
}

function showQuicknavMenu() {
 	var input = document.getElementById("quicknav_input");
	var menu = document.getElementById("quicknav_menu");
	menu.style.left = getElementX(input) + "px";
	menu.style.top = getElementY(input) + input.offsetHeight + 2 + "px";
	var width = getWidth(input);
	if (width > 0) {
		menu.style.width = width + "px";
	}
	menu.style.visibility = "visible";
}

function hideQuicknavMenu() {
	var menu = document.getElementById("quicknav_menu");
	menu.style.visibility = "hidden";
}

function getElementX(element){
    var targetLeft = 0;
    while (element) {
        if (element.offsetParent) {
            targetLeft += element.offsetLeft;
        } else if (element.x) {
            targetLeft += element.x;
        }
        element = element.offsetParent;
    }
    return targetLeft;
}


function getElementY(element){
    var targetTop = 0;
    while (element) {
        if (element.offsetParent) {
            targetTop += element.offsetTop;
        } else if (element.y) {
            targetTop += element.y;
        }
        element = element.offsetParent;
    }
    return targetTop;
}

function getWidth(element) {
    if (element.clientWidth && element.offsetWidth && element.clientWidth <element.offsetWidth) {
        return element.clientWidth; /* some mozillas (like 1.4.1) return bogus clientWidth so ensure it's in range */
    } else if (element.offsetWidth) {
        return element.offsetWidth;
    } else if (element.width) {
        return element.width;
    } else {
        return 0;
    }
}

window.onload = loadData;
