


class cocktail.utils.Debugger {	
	
	private static var typing:Boolean;
	private static var output:String;
	private static var header = ["=====[ ", " ]=====\r"];
	
	public static var enabled:Boolean = true;
	public static var flashEnabled: Boolean = true;
	public static var browserEnabled: Boolean = true;
	
	private static var clips:Object;
	
	
	
	/**
	* There's no constructor (static class)
	* 
	**/
	function Debugger () {
		throw new Error ("Debugger is a static class and should not be instantiated.");
	}
	
	
	/**
	* Prepare the data to be parsed
	* 
	* @param	object
	* @param	label
	* @param	$typing
	*/
	private static function prepare(object:Object, label:String, $typing:Boolean) {
		var tag:String;
		
		if (label != undefined) {
			tag = Debugger.header.join(label);
		} else {
			tag = Debugger.header.join("cocktail.utils.Debugger @ timer: "+ getTimer());
		}
		
		Debugger.typing = typing;
		Debugger.output = tag;
		Debugger.parse(object);
		Debugger.output += tag + "\r\r";
	}
	
	
	
	/**
	* Parse all the tree of the given object
	* 
	* @param	object
	* @param	prevTab
	* @param	propPrefix
	*/
	private static function parse(object:Object, prevTab:String, propPrefix:String) {
		var isArr:Boolean;
		var isMc:Boolean;
		var isObj:Boolean;
		var skipRecursive:Boolean;
		
		var nextTab:String;
		var endTag:String;
		
		var prefix:String;
		var prop:Object;
		var i:String;
		
		isArr = (object instanceof Array);
		isMc = (object instanceof MovieClip);
		isObj = (object instanceof Object && !isArr && !isMc);
		
		skipRecursive = false;
		nextTab = ("\t" + (prevTab != undefined ? prevTab : ""));
		
		prefix = (prevTab != undefined ? prevTab.slice(0, -1) : "");
		prefix += (propPrefix != undefined ? propPrefix : "");
		
		if (isObj) {
			Debugger.output += (prefix +"_Object { \r");
		} else if (isArr) {
			Debugger.output += (prefix +"_Array [ \r");
		} else if (isMc && !Debugger.searchClip(MovieClip(object))) {
			Debugger.addClip(MovieClip(object));
			Debugger.output += (prefix +"_Movieclip:' "+ object +" ' ( \r");
		} else {
			Debugger.output += object.toString();
			skipRecursive = true;
		}
		
		
		if (!skipRecursive) {
			
			for (i in object) {
				prop = object[i];
				if (prop instanceof Object) {
					Debugger.parse(prop, (nextTab +"\t"), ("[ "+ i +" ] => "));
				} else {
					output += (nextTab +"[ " + i + " ] => "+ prop);
					output += (typing ? (" ("+ typeof prop +")") : "") +"; \r";
				}
			}
			
			endTag = (isObj ? "};" : isArr ? "];" : isMc ? ");" : "");
			output += (nextTab.slice(0, -2) + endTag +"\r");
		}
	}
	
	
	/**
	* Clips Overhead prevention methods
	* 
	*/
	private static function resetClips () {
		Debugger.clips = new Object;
	}
	
	private static function addClip (clip:MovieClip) {
		Debugger.clips[clip] = 1;
	}
	
	private static function searchClip (clip:MovieClip) {
		return (Debugger.clips[clip] == 1);
	}
	
	
	
	/**
	* Sends the output to the Flash Output Panel
	* 
	*/
	private static function flashTrace() {
		Debugger.prepare.apply(Debugger, arguments);
		trace(output);
	}
	
	
	
	/**
	* Sends the output to a Persistent Browser PopUp
	* 
	*/
	private static function browserTrace() {
		var features:String;
		var content:String;
		var win:String;
		
		Debugger.prepare.apply(Debugger, arguments);
		
		Debugger.output = Debugger.output.split("\r\n").join("<br />").split("\n").join("<br />'");
		Debugger.output = Debugger.output.split("\r").join("<br />").split("'").join("\\'");
		Debugger.output = Debugger.output.split("\t").join("&nbsp;&nbsp;&nbsp;&nbsp;");
		
		features = "width=600, height=500, resizable=yes, scrollbars=yes, dependent";
		content = "<pre>\n" + escape(output) + "\n</pre>";
		win = "javascript: var o = window.open('', 'Debugger', '" + features + "');";
		win += "o.document.write('" + content + "'); o.focus();";
		
		getURL(win);
	}
	
	
	
	/**
	* Traces the object tree
	* 
	* @param	data
	* @param	label
	* @param	typing
	*/
	public static function trace(data:Object, label:String, typing:Boolean) {
		var pt:String;
		
		if(!Debugger.enabled){
			return;
		}
		
		Debugger.resetClips();
		
		pt = System.capabilities.playerType;
		if (pt == "External" && flashEnabled) {
			Debugger.flashTrace.apply(Debugger, arguments);
		} else if (pt == "PlugIn" && browserEnabled) {
			Debugger.browserTrace.apply(Debugger, arguments);
		}
	};
};
