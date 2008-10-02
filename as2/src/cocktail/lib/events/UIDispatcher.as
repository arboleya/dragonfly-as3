import cocktail.lib.data.ds.LinkedList;
import cocktail.lib.data.ds.Node;
import cocktail.lib.events.Event;
import cocktail.lib.events.EventListener;
import cocktail.utils.Delegate;



//this is a copy from EventDispatcher, but extends MovieClip
class cocktail.lib.events.UIDispatcher extends MovieClip {
	
	/** [VARS] ************************************************************************
	***********************************************************************************/
	
	private var ed_listeners:LinkedList;
	private var ed_scope:UIDispatcher;
	private var ed_active:Boolean;
	
	
	
	
	
	/** [CONSTRUCTOR] *****************************************************************
	***********************************************************************************/
	
	/**
	 * Constructor
	 */
	function UIDispatcher () {
		this.ed_listeners = new LinkedList;
		this.ed_scope = this;
		this.ed_active = true;
	}
	
	
	
	
	
	/** [PUBLIC - enable/disable events] **********************************************
	***********************************************************************************/
	
	/**
	* Disable event dispatching
	*/
	public function disableEvents () : Void {
		this.ed_active = false;
	}
	
	/**
	* Enable event dispatching
	*/
	public function enableEvents () : Void {
		this.ed_active = true;
	}
	
	
	
	
	
	/** [PUBLIC - add/remove ed_listeners] ************************************************
	***********************************************************************************/
	
	/**
	* Adds a event listener to the ed_listeners stack
	* 
	* @param type Event type you want to add a listener to
	* @param method Function listener
	* @param scope Scope where function listener should be executed
	* @param args Extra args you want to add to the event ( YourReceivedEvent.args )
	* 
	* @return The added EventListener instance -- you may keep a reference of it, so you can use the "destroy" method to delete-and-remove it from the Eventdispatcher ed_listeners stack (just a plus). Or... you simply ignore it and keep using the "removeEventListener" to 
	*/
	public function addEventListener ( type : String, method : Function, scope : Object, args : Object ) : EventListener {
		var e:EventListener = new EventListener(type, method, (scope || this.ed_scope), args);
		e.setNodeStack( this.ed_listeners.append(e), this.ed_listeners);
		return e;
	}
	
	/**
	 * Removes a listener from the listerns stack
	 * 
	 * @param method Function listener you want to removed
	 * @param type Event type you wanna remove listener. If no type is given, listener will be removed from all events, otherwise only for the given type
	 */
	public function removeEventListener (method : Function, type : String) : Void {
		this.ed_listeners.each(function( listener:EventListener, node:Node ) {
			if (listener.type != type || type == undefined) return;
			if (listener.method != method) return;
			this.ed_listeners.remove(node);
		}, this);
	}
	
	

	
	/**
	* Removes all event ed_listeners for the given event type
	* 
	* @param type	Event type you wanna remove ed_listeners. If no type is given, all ed_listeners for all events will be removed
	*/
	public function removeAllEventListeners( type:String ):Void {
		if (type == undefined) {
			this.ed_listeners = new LinkedList;
			return;
		}
		
		this.ed_listeners.each(function( listener:EventListener, node:Node ) : Void {
			if (listener.type != type) return;
			this.ed_listeners.remove(node);
		}, this);
	}
	
	
	
	
	
	/** [PRIVATE - dispatchEvent, ed_listeners] ***************************************
	***********************************************************************************/
	
	/**
	* Dispatches an event
	* 
	* @param event Event to be dispatched
	*/
	private function dispatchEvent( event:Event ):Void {
		if( !this.ed_active ) return;
		this.ed_listeners.each(Delegate.create(this.each_dispatchEvent, this, event));
	}
	
	/**
	 * Listeners loop execution
	 * 
	 * @param	event	Event to be dispatched
	 * @param	listener	Current listener in the loop
	 */
	private function each_dispatchEvent ( event:Event, listener:EventListener ):Void {
		if (listener.type != event.type) return;
		event.args = listener.args;
		listener.method.apply(listener.scope, [event]);
	}
	
	
	
	/** [PUBLIC - events check] *******************************************************
	***********************************************************************************/
	
	/**
	 * Checks if there's any listener of the given type 
	 * 
	 * @param type	Event type you want to check the ed_listeners existence
	 * @return TRUE if there's some event, FALSE otherwise
	 */
	public function hasEventListener (type : String) : Boolean {
		var has:Boolean = false;
		
		this.ed_listeners.each(function( listener:EventListener ) : Void {
			if (listener.type != type) return;
			has = true;
		}, this);
		
		return has;
	}
}
