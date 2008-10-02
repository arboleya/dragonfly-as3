
import cocktail.lib.events.Event;

class cocktail.lib.events.StatusEvent extends Event {
	
	public static var START:String = "start";
	public static var INIT:String = "init";
	public static var STOP:String = "stop";
	public static var PLAY:String = "play";
	public static var UPDATE:String = "update";
	public static var LOOP:String = "loop";
	
	public static var ACTIVE:String = 'active';
	public static var INACTIVE:String = 'inactive';
	
	function StatusEvent( type:String ){
		super( type );
	}
}
