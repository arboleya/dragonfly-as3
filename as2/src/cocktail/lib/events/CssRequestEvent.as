import cocktail.lib.events.RequestEvent;
import TextField.StyleSheet;

class cocktail.lib.events.CssRequestEvent extends RequestEvent {

	public static function get PARSE_ERROR () : String {
		return 'PARSE_ERROR';
	}
	
	public var error : String;
	public var styleSheet : StyleSheet;
	
	public function CssRequestEvent (type : String, target : StyleSheet, loaded : Number, total : Number) {
		super(type, loaded, total);
		
		this.styleSheet = target;
	}

}