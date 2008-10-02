import cocktail.lib.events.Event;

class cocktail.lib.events.SliderEvent extends Event{

	public static var UPDATE:String = 'onUpdate';
	public static var PRESS:String = 'onPress';
	public static var RELEASE:String = 'onRelease';
	
	public var percentageX:Number; 
	public var percentageY:Number;
	public var x:Number;
	public var y:Number;
	public var distanceX:Number;
	public var distanceY:Number;
	
	public function SliderEvent(type:String) {
		super(type);
	}
	
}