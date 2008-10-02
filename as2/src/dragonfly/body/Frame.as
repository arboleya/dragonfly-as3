import dragonfly.body.events.FrameEvent;

import cocktail.lib.events.EventDispatcher;
import cocktail.lib.events.EventListener;
import cocktail.lib.status.Status;
import cocktail.utils.Delegate;



/**
 * Frame class.
 */
class dragonfly.body.Frame extends EventDispatcher {
	
	// [ PRIVATE - properties ] **********************************************/
	
	private var broadcaster:MovieClip;
	private var status:String;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a Frame object.
	 */
	public function Frame () {
		if ( _level0.DragonflyFrameBroadcaster instanceof MovieClip ) {
			this.broadcaster = _level0.DragonflyFrameBroadcaster;
		} else {
			this.broadcaster = _level0.createEmptyMovieClip("DragonflyFrameBroadcaster" , _level0.getNextHighestDepth());
		}
		this.status = Status.DISABLED;
	}
	
	
	
	
	
	// [ PRIVATE - enable/disable ] ******************************************/
	
	/**
	 * @private
	 * Enable dispatcher
	 */
	private function enable () : Void {
		this.broadcaster.onEnterFrame = Delegate.create(
			this.dispatchEvent,
			this,
			[new FrameEvent(FrameEvent.ON_ENTER_FRAME)]
		);
		this.status = Status.ENABLED;
	}
	
	/**
	 * @private
	 * Disable dispatcher
	 */
	 private function disable () : Void {
		this.status = Status.DISABLED;
		this.broadcaster.onEnterFrame = null;
		delete this.broadcaster.onEnterFrame;
	}
	
	
	
	
	
	// [ PUBLIC - ADD/REMOVE evs ] ****************************************/
	
	/**
	 * Adds a ev listener to the ed_listeners stack.
	 * 
	 * @param type Event type you want to add.
	 * @param method Function listener.
	 * @param scope Scope where function listener should be executed.
	 * @param args Extra args you want to add to the event ( YourReceivedEvent.args ).
	 * 
	 * @return The added EventListener instance -- you may keep a reference of it, so you can use
	 * the "destroy" method to delete-and-remove it from the Eventdispatcher ed_listeners stack
	 * (just a plus). Or... you simply ignore it and keep using the "removeEventListener".
	 */
	public function addEventListener (type : String, func : Function, scope : Object ) : EventListener {
		if (this.status == Status.DISABLED ) this.enable();
		return super.addEventListener(type , func , scope);
	}
	
	/**
	 * Removes a listener from the listerns stack.
	 * 
	 * @param method Function listener you want to removed.
	 * @param type Event type you wanna remove listener. If no type is given,
	 * listener will be removed from all evs, otherwise only for the given type.
	 */
	public function removeEventListener (func : Function, type : String ) : Void {
		super.removeEventListener(func, type);
		if (!this.ed_listeners.length && this.status == Status.ENABLED) {
			this.disable();
		}
	}
}