import cocktail.lib.events.EventDispatcher;



class cocktail.lib.events.EventListener {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/
	
	public var dispatcher:EventDispatcher;
	
	public var method:Function;
	public var type:String;
	public var scope:Object;
	public var args:Object;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/
	
	/**
	 * Constructor
	 * 
	 * @param	dispatcher	The listener dispatcher
	 * @param	type	Event type
	 * @param	method	Function listener
	 * @param	scope	Scope in which the function should be executed
	 * @param	args	Args you wanna pass to the evebt ( get in FlightEvent.args )
	 */
	public function EventListener ( dispatcher : EventDispatcher , type:String , method:Function , scope:Object , args:Object ) {
		this.dispatcher = dispatcher;
		this.type = type;
		this.method = method;
		this.scope = scope;
		this.args = args;
	}
	
	
	
	
	
	/** [PUBLIC - Destroy Feature - that's a plus :-) ] *******************************
	***********************************************************************************/
	
	/**
	 * Destroys the EventLister and removes it from the EventDispatcher listeners stack
	 */
	public function destroy ():Void {
		this.dispatcher.removeEventListener( this.method , this.type );
	}
	
}