import cocktail.utils.Delegate;
import cocktail.utils.FunctionHelper;

class cocktail.utils.XmlObject {
	
	private var xml : XML;
	private var output : Object;
	private var extraArgs : Object;

	public var onLoad : Function;
	public var onLoadError : Function;
	public var onParse : Function;
	public var onParseError : Function;
	public var onHTTPStatus : Function;
	
	public function XmlObject (extraArgs : Object) {
		this.xml = new XML();
		this.xml.ignoreWhite = true;
		this.xml.onLoad = Delegate.create(this.onXmlLoad, this);
		//using eval, to remove mtasc error
		FunctionHelper.bridge(this, 'onHTTPStatus', this.xml);
		this.extraArgs = extraArgs;
	}
	
	// load 
	
	public function load (file : String) : Void {
		this.output = {};
		this.xml.load(file);
	}
	
	private function onXmlLoad () {
		var args = [this.output];
		
		//was xml successfull parsed ?
		if (this.xml.status != 0) {
			//nope, trigger error handler
			return this.onParseError(this.xml.status, this.paserStatusToString(this.xml.status));
		}
		
		if (! this.xml.loaded) {
			return this.onLoadError();
		}
		
		if(this.extraArgs != undefined){
			args.push(this.extraArgs);
		}
		
		XmlObject.parseSource(this.output, this.xml.firstChild);
		this.onLoad.apply(this, args);
	}
	
	// private core
	
	public function parse( node ) : Array {
		this.output = this.output || {};
		var args = [this.output];
		
		if(this.extraArgs != undefined){
			args.push(this.extraArgs);
		}
		
		XmlObject.parseSource(this.output, node);
		this.onParse.apply(this, args);
		
		return args;
	}
	
	public static function parseSource (target, node) {
		var i, len, childs, childNode, recursiveTarget;
		
		childs = node.childNodes;
		len = node.childNodes.length;
		
		for (i = 0; i < len; i ++) {
			childNode = node.childNodes[i];
			recursiveTarget = XmlObject.parseNode (target, childNode, childNode.nodeName);
			if (childNode.hasChildNodes()) {
				XmlObject.parseSource(recursiveTarget, childNode);
			}
		}
	}
	
	private static function parseNode (target, node, name) {
		var attributes, value, index;
		
		if (name == undefined) {
			return;
		}
		
		if (target[name] == undefined) {
			target = (target[name] = {});
		} else {
			if (! (target[name] instanceof Array)) {
				target[name] = [target[name]];
			}
			
			target = (target[name][target[name].length] = {});
		}
		
		for (var i in (attributes = node.attributes)) {
			if (target.attributes == undefined) {
				target.attributes = {};
			}
			target.attributes[i] = attributes[i];
		}
		
		if ((value = node.firstChild.nodeValue) != undefined) {
			target.value = value;
		}
		
		return target;
	}
	
	/**
	 * Convert xml status to a understandable string
	 * @param	status
	 * @return
	 */
	private function paserStatusToString (status : Number) : String {
		switch (status) {
			case 0 :
				return "No error; parse was completed successfully.";
			case -2 :
				return "A CDATA section was not properly terminated.";
			case -3 :
				return "The XML declaration was not properly terminated.";
			case -4 :
				return "The DOCTYPE declaration was not properly terminated.";
			case -5 :
				return "A comment was not properly terminated.";
			case -6 :
				return "An XML element was malformed.";
			case -7 :
				return "Out of memory.";
				break;
			case -8 :
				return "An attribute value was not properly terminated.";
				break;
			case -9 :
				return "A start-tag was not matched with an end-tag.";
				break;
			case -10 :
				return "An end-tag was encountered without a matching";
		}
		
		return "An unknown error has occurred.";
	}
	
	// getters
	
	public function getBytesLoaded(){
		return this.xml.getBytesLoaded();
	}

	public function getBytesTotal(){
		return this.xml.getBytesTotal();
	}
}