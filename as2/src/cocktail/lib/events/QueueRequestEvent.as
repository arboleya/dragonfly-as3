import cocktail.lib.events.Event;

class cocktail.lib.events.QueueRequestEvent extends Event {

	public static function get LOAD_ABORT () : String {
		return 'LOAD_ABORT';
	}
	
	public static function get LOAD_START () : String {
		return 'LOAD_START';
	}
	
	public static function get LOAD_PROGRESS () : String {
		return 'LOAD_PROGRESS';
	}
	
	public static function get LOAD_COMPLETE () : String {
		return 'LOAD_COMPLETE';
	}
	
	public var progress : Number;
	
	public var started_loads : Number;
	public var aborted_loads : Number;
	public var failed_loads : Number;
	public var completed_loads : Number;
	public var active_loads : Number;
	
	public function QueueRequestEvent (type : String, progress : Number) {
		super(type);
		
		this.progress = progress;
	}
	
}