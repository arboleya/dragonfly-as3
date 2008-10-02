//* Cocktail
import cocktail.lib.events.RequestEvent;



class cocktail.lib.events.MixerEvent extends RequestEvent {
	
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
	
	
	
	/**
	 * Constructor 
	 * 
	 * @param	type	Type for the Event
	 */
	public function MixerEvent ( type:String, target : Object ) {
		super ( type );
	}
	
}