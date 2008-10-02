import dragonfly.body.Egg;
import dragonfly.body.events.EggEvent;
import dragonfly.body.events.FlightEvent;

import cocktail.lib.events.EventListener;
import cocktail.lib.events.EventDispatcher;

import	cocktail.lib.data.ds.LinkedList



/**
 * Fligh is a event listener of larva behaviors.
 */
class dragonfly.body.Flight extends EventDispatcher {
	
	
	// [ PRIVATE - properties ] **********************************************/
	
	private var activeEggs : Number;
	private var startCount : Number;
	private var updateCount : Number;
	private var completeCount : Number;
	
	private var _egg : Egg;
	private var _eggs : LinkedList;
	private var _eventExtraArgs : Object;
	private var _eventClass : Function;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a Flight object.
	 */
	public function Flight () {
		this._eventClass = FlightEvent;
	}
	
	
	
	
	
	// [ PRIVATE - egg integration ] *****************************************/
	
	/**
	 * 
	 * @param	egg	Egg to be listened.
	 */
	private function listenEgg ( egg : Egg ) : Void {
		egg.addEventListener(EggEvent.START, this.dispatchEventByType, this);
		egg.addEventListener(EggEvent.UPDATE, this.dispatchEventByType, this);
		egg.addEventListener(EggEvent.COMPLETE, this.dispatchEventByType, this);
	}
	
	/**
	 * Sets the respective Flight's Egg, so Flight start listeing it.
	 * @param egg Egg to be listened.
	 */
	public function setEgg (egg : Egg) : Void {
		this.listenEgg( this._egg = egg );
	}
	
	/**
	 * Sets all the multiples flight calls and return a reference of flight itself, for re-use.
	 * @param egg Egg to be listened.
	 */
	public function setEggs ( eggs : LinkedList ) : Flight {
		this._egg.removeAllEventListeners();
		this._egg = null;
		
		this.startCount = 0;
		this.updateCount = 0;
		this.completeCount = 0;
		
		this.activeEggs = (this._eggs = eggs).length;
		
		this._eggs = eggs;
		this._eggs.each( this.setEgg, this );
		
		return this;
	}
	
	/**
	 * Specifies the event class that will be used for event dispatching.
	 * @param	eventClass	The event class that will be dispatched by the Flight engine, this class MUST extend the FlightEvent  class.
	 */
	public function setEventClass ( eventClass : Function ) : Void {
		this._eventClass = eventClass;
	}
	
	/**
	 * Specifies the extraArgs for the event class that will be used for event dispatching ( think about some data persistent in your Event ).
	 * @param	eventClass	The event class that will be dispatched by the Flight engine, this class MUST extend the FlightEvent  class.
	 */
	public function setEventExtraArgs ( extraArgs : Object ) : Void {
		this._eventExtraArgs = extraArgs;
	}
	
	
	
	
	
	// [ PRIVATE - event dispatching ] ***************************************/
	
	/**
	 * @private
	 * Dispatches the ev according the given type.
	 * @param ev A EggEvent to dispatch.
	 */
	private function dispatchEventByType ( event :  EggEvent ) : Void {
		switch ( event.type ) {
			case EggEvent.START:
				if ( ++this.startCount < this.activeEggs ) return;
				this.startCount = 0;
			break;
			
			case EggEvent.UPDATE:
				if ( ++this.updateCount < this.activeEggs ) return;
				this.updateCount = 0;
			break;
			
			case EggEvent.COMPLETE:
				if ( this.completeCount++ < this.activeEggs-- ) return;
				this.completeCount = 0;
			break;
		}
		
		this.dispatchEvent( new this._eventClass( event.type, event.egg, event.prop, event.value, this._eggs, this._eventExtraArgs  ) );
	}
	
	
	
	
	
	// [ PUBLIC - adding events ] ********************************************/
	
	/**
	 * Adds a flight start listener.
	 * @param method Function listener.
	 * @param scope Scope where function listener should be executed.
	 * @param args Extra args you want to add to the ev ( get it from FlightEvent.args ).
	 * @return	EventListener
	 */
	public function addStartListener (method : Function, scope : Object, args : Object ) : EventListener {
		return super.addEventListener(FlightEvent.START, method, scope, args);
	}
	
	/**
	 * Adds a flight update listener.
	 * @param method Function listener.
	 * @param scope Scope where function listener should be executed.
	 * @param args Extra args you want to add to the ev ( get it from FlightEvent.args ).
	 * @return	EventListener
	 */
	public function addUpdateListener (method : Function, scope : Object, args : Object) : EventListener {
		return super.addEventListener(FlightEvent.UPDATE, method, scope, args);
	}
	
	/**
	 * 
	 * Adds a flight complete listener.
	 * @param method Function listener.
	 * @param scope Scope where function listener should be executed.
	 * @param args Extra args you want to add to the ev ( get it from FlightEvent.args ).
	 * @return	EventListener
	 */
	public function addCompleteListener (method : Function, scope : Object, args : Object  ) : EventListener {
		return super.addEventListener(FlightEvent.COMPLETE, method, scope, args);
	}
	
	
	
	
	
	// [ PUBLIC - clone feature ] ********************************************/
	
	/**
	 * Clones all listeners from the given Flight into this one.
	 * @param flight Flight which listeners will be copied/cloned from.
	 */
	public function cloneFrom (flight : Flight) : Void {
		if (!flight.ed_listeners.length) return;
		flight.ed_listeners.each( function ( listener : EventListener ) {
			this.addEventListener(listener.type, listener.method, listener.scope, listener.args);
		}, this );
	}
}