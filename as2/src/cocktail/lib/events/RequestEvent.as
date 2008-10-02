import cocktail.lib.events.Event;

class cocktail.lib.events.RequestEvent extends Event {
	
	public static function get LOAD_START() : String { return 'LOAD_START'; }
	public static function get LOAD_PROGRESS() : String { return 'LOAD_PROGRESS'; }
	public static function get LOAD_COMPLETE() : String { return 'LOAD_COMPLETE'; }
	
	public static function get LOAD_INIT() : String { return 'LOAD_INIT'; }
	public static function get LOAD_ERROR() : String { return 'LOAD_ERROR'; }
	public static function get LOAD_ABORT() : String { return 'LOAD_ABORT'; }
	
	public var load_bytes_total : Number;
	public var load_bytes_loaded : Number;
	public var load_bytes_percent : Number;
	
	public var buffer_length : Number;
	
	
	public function RequestEvent (type : String, bytes_loaded : Number, bytes_total : Number, bytes_percent : Number, bufferLength : Number ) {
		super(type);
		
		this.load_bytes_loaded = bytes_loaded;
		this.load_bytes_total = bytes_total;
		this.load_bytes_percent = bytes_percent;
		this.buffer_length = buffer_length;
	}
	
	//public function get progress () : Number {
		//return Math.floor(loaded / total * 100) / 100 || 0;
	//}
}