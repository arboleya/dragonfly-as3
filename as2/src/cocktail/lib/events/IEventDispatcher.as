import cocktail.lib.events.EventListener;

interface cocktail.lib.events.IEventDispatcher{

	/**
	* Turn event dispatching off
	*/
	public function disableEvents () : Void
	
	
	/**
	* Turn event dispatching on
	*/
	public function enableEvents () : Void 
	
	
	/**
	* Adds a event listener to the ed_listeners stack.
	* 
	* @param type Event type you want to add a listener.
	* @param method Function listener.
	* @param scope Scope where function listener should be executed.
	* @param args Extra args you want to add to the event ( YourReceivedEvent.args ).
	* 
	* @return The added EventListener instance -- you may keep a reference of it, so you can use
	* the "destroy" method to delete-and-remove it from the Eventdispatcher ed_listeners stack (just a plus).
	* Or... you simply ignore it and keep using the "removeEventListener".
	* @see EventListener 
	*/
	public function addEventListener (type : String, method : Function, scope : Object, args : Array) : EventListener 

	
	/**
	 * Removes a listener from the listerns stack.
	 * 
	 * @param method Function listener you want to removed.
	 * @param type Event type you wanna remove listener. If no type is given,
	 * listener will be removed from all events, otherwise only for the given type.
	 */
	public function removeEventListener (method : Function, type : String) : Void 
	
	
	
	/**
	* Removes all event ed_listeners for the given event type.
	* 
	* @param type Event type you wanna remove ed_listeners.
	* If no type is given, all ed_listeners for all events will be removed.
	*/
	public function removeAllEventListeners (type : String) : Void 
	
	
	/**
	 * Checks if there's any listener of the given type. 
	 * 
	 * @param type	Event type you want to check the ed_listeners existence.
	 * @return <code>true</code> if there's some event, <code>false</code> otherwise.
	 */
	public function hasEventListener (type : String) : Boolean 
	
	
	/** Determines whether or not an object or any of its parent containers have listeners for a specific type event. 
	* This is much like hasEventListener but this method checks the current object as well as all objects 
	* that might be affected from the propagation of the event.
	* 
	* @param	eventName
	* @return
	*/
	//TODO: is necessary implement yet?
	//public function willTrigger (eventName : String) : Boolean 
	
}