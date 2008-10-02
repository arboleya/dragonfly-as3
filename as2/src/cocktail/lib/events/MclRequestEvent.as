import cocktail.lib.events.RequestEvent;

class cocktail.lib.events.MclRequestEvent extends RequestEvent {

	public var scope : Object;
	
	public var errorCode : String;
	public var httpStatus : Number;
	
	public function MclRequestEvent (type : String, scope : Object, loaded : Number, total : Number) {
		super(type, loaded, total);
		
		this.scope = scope;
	}
	
}