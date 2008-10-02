import cocktail.lib.events.RequestEvent;

class cocktail.lib.events.Mp3StreamEvent extends RequestEvent {
	
	// types
	public static function get PLAY_START () : String { return 'PLAY_START'; }
	public static function get PLAY_PAUSE () : String { return 'PLAY_PAUSE'; }
	public static function get PLAY_PROGRESS () : String { return 'PLAY_PROGRESS'; }
	public static function get PLAY_COMPLETE () : String { return 'PLAY_COMPLETE'; }
	public static function get PLAY_STOP () : String { return 'PLAY_STOP'; }
	
	// vars
	public var play_duration : Number;
	public var play_time : Number;
	public var play_percent : Number;
	
	
	
	public function Mp3StreamEvent (type : String ) {
		super( type );
	}
	
}