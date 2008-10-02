import cocktail.lib.events.Event;

class cocktail.lib.events.StageEvent extends Event {
	
	public static function get RESIZE() : String { return 'RESIZE'; }
	
	public var width : Number;
	public var height : Number;	
	public var center_x : Number;
	public var center_y : Number;	
	
	public function StageEvent (type : String, width : Number, height : Number, center_x : Number, center_y : Number) {
		super(type);
		
		this.width = width;
		this.height = height;
		
		this.center_x = center_x;
		this.center_y = center_y;
	}
}