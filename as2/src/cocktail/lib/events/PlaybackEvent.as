
import cocktail.lib.events.RequestEvent;



class cocktail.lib.events.PlaybackEvent extends RequestEvent {
	
	// types
	public static function get PLAY_START () : String { return 'PLAY_START'; }
	public static function get PLAY_PAUSE () : String { return 'PLAY_PAUSE'; }
	public static function get PLAY_STOP () : String { return 'PLAY_STOP'; }
	public static function get PLAY_PROGRESS () : String { return 'PLAY_PROGRESS'; }
	public static function get PLAY_COMPLETE () : String { return 'PLAY_COMPLETE'; }
	
	public static function get NS_METADATA () : String { return 'NS_METADATA'; }
	public static function get NS_STATUS () : String { return 'NS_STATUS'; }
	public static function get NS_CUE_POINT () : String { return 'NS_CUE_POINT'; }
	
	// vars
	public var info:Object;
	public var buffer_length:Number;
	
	public var play_duration:Number;
	public var play_time:Number;
	public var play_percent:Number;
	
	public var load_bytes_total:Number;
	public var load_bytes_loaded:Number;
	public var load_percent:Number;
	
	
	
	public function PlaybackEvent (type : String) {
		super(type);
	}
	
}