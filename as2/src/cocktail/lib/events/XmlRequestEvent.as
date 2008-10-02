import cocktail.lib.events.RequestEvent;

class cocktail.lib.events.XmlRequestEvent extends RequestEvent {

	public static function get PARSE_ERROR () : String {
		return 'PARSE_ERROR';
	}
	
	public var status : Number;
	public var error_str : String;
	public var info : Object;
	public var parsedXml : Object;
	
	public function XmlRequestEvent (type : String, info  : Object, loaded : Number, total : Number) {
		super(type, loaded, total);
		
		this.info = info ;
	}
	
}