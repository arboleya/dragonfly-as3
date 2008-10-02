import cocktail.lib.events.RequestEvent;

class cocktail.lib.events.Mp3RequestEvent extends RequestEvent {
	
	public var infoLevel:String;
	public var errorCode:String;

	public function Mp3RequestEvent(type:String, loaded:Number, total:Number) {
		super(type, loaded, total);
	}
	
}