import cocktail.lib.events.RequestEvent;

class cocktail.lib.events.FlvRequestEvent extends RequestEvent {
	
	public var infoLevel:String;
	public var errorCode:String;

	public function FlvRequestEvent(type:String, loaded:Number, total:Number) {
		super(type, loaded, total);
	}
	
}