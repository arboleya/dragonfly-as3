//* dragonfly
import dragonfly.body.Egg;
import dragonfly.body.Flight;
import dragonfly.body.events.EggEvent;
import dragonfly.body.interfaces.ILarva;
import dragonfly.body.events.LarvaEvent;

//* cocktail
import cocktail.lib.data.ds.Node;
import cocktail.lib.data.ds.LinkedList;
import cocktail.lib.events.EventDispatcher;



/**
 * Larva class.
 */
class dragonfly.body.Larva extends EventDispatcher implements ILarva {
	
	// [ PRIVATE - properties ] **********************************************/
	
	private var _defaultFlight:Flight;
	private var _targets:LinkedList;
	private var _eggs:LinkedList;
	private var _useFrames:Boolean;
	private var _fps:Number;
	
	private var _flightOpen : Boolean;
	private var _openFlights : LinkedList;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a Larva object.
	 * 
	 * @param target	The larva target.
	 * @param useFrames If <code>true</code> 'onEnterFreame' mode used,
	 * otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 * @param fp If useFrames is <code>false</code>, you can set the refresh interval
	 * for the <code>'setInterval'</code> mode (default=30).
	 */
	public function Larva (target : Object, useFrames : Boolean, fps : Number) {
		this._eggs = new LinkedList;
		this._targets = new LinkedList;
		
		this._targets.append(target);
		this._useFrames = useFrames;
		this._fps = fps;
	}
	
	
	
	
	
	// [ PUBLIC STATIC - createFlight ] **************************************/
	
	/**
	 * Creates a new Flight.
	 * 
	 * @return A new Flight.
	 */ 
	public static function createFlight () : Flight {
		return new Flight;
	}
	
	
	
	
	
	// [ PUBLIC - setDefaultFlight, get.defaultFlight ] **********************/
	
	/**
	 * Sets the default LarvaListener ( listener ).
	 * 
	 * @param LarvaListener A LarvaListener listener.
	 */
	public function setDefaultFlight (flight : Flight) : Void {
		this._defaultFlight = flight;
	}
	
	/**
	 * Returns the default LarvaListener ( listener ).
	 * 
	 * @return The default LarvaListener ( listener ).
	 */
	public function get defaultFlight () : Flight {
		return this._defaultFlight;
	}
	
	
	
	
	
	// [ PUBLIC - addTarget, removeTarget, get.targets, get.defaultTarget ] **/
	
	/**
	 * Adds a target into the Larva.
	 * @param Target	The target to be added.
	 * 
	 * @return The added target id.
	 */
	public function addTarget (target : Object) : Node {
		return this._targets.append(target);
	}
	
	/**
	 * Removes one or all targets from a Larva ( except the default target ).
	 * 
	 * @param targetId The id of the targets to be removed.
	 * @param removeAll If <code>true</code>, removes all targets.
	 */
	public function removeTarget (target : Node, removeAll : Boolean) : Void {
		if (removeAll) {
			this._targets = new LinkedList;
		} else {
			this._targets.remove(target);
		}
		
		if (!this._targets.length) {
			trace ("WARNING: Your larva has no target!");
		}
	}
	
	
	
	/**
	 * Returns the larva's eggs.
	 * 
	 * @return The larva's eggs.
	 */
	public function get eggs () : LinkedList {
		return this._eggs;
	} 
	
	/**
	 * Returns the larva's targets.
	 * 
	 * @return The larva's targets.
	 */
	public function get targets () : LinkedList {
		return this._targets;
	} 
	
	/**
	 * Returns the larva's default target.
	 * 
	 * @return The larva's target.
	 */
	public function get defaultTarget () : Node {
		return this._targets.head;
	}
	
	
	
	
	
	// [ PUBLIC - Larva Utils ] **********************************************/
	
	/**
	 * Gets the thotal time left to larva has until get stopped.
	 * 
	 * @return The total left time larva has until get stopped.
	 */
	public function getTimeLeft () : Number {
		var timeLeft:Number = 0;
		this._eggs.each(function( egg:Egg ) {
			timeLeft = Math.max(egg.timeLeft, timeLeft);
		});
		return timeLeft;
	}
	
	
	
	
	
	// [ PUBLIC - Larva control  ( hold, unhold, reset, active, fps )] *******/
	
	/**
	 * Holds the running eggs.
	 */
	public function hold () : Void {
		this._eggs.each(function(egg:Egg) { egg.unhold(); } );
	}
	
	/**
	 * Unholds the running eggs.
	 */
	public function unhold () : Void {
		this._eggs.each(function(egg:Egg) { egg.hold(); } );
	}
	
	/**
	 * Resets the running eggs.
	 */
	public function reset () : Void {
		this._eggs.each(function(egg:Egg) { egg.fries(); } );
	}
	
	
	
	/**
	 * Returns the larva's status.
	 * 
	 * @return The larva's status.
	 */
	public function get active () : Number {
		var active : Number = 0;
		this._eggs.each(function(egg:Egg) {
			if (egg.active) active ++;
		} );
		return active;
	}
	
	
	
	/**
	 * Returns the larva's fps
	 */
	public function get fps () : Number {
		return this._fps;
	}
	
	/**
	 * Sets the larva's fps
	 */
	public function set fps ( fps : Number ) : Void {
		this._fps = fps;
	}
	
	
	
	
	
	// [ PRIVATE - Eggs Control ] ********************************************/
	
	/**
	 * @private
	 * Lays a new egg into the nest.
	 * 
	 * @param eggClass The eggClass you want to lay a new instance.
	 * @param prop The egg 'prop' you want to lay.
	 * @param start Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param extraEggArgs Extra arguments you need in your Egg's Contructor, besides the defaults [prop, larva, flight].
	 * 
	 * @return	The layed egg.
	 */
	private function lay ( eggClass : Function, prop : String, start : Object, end : Object, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, extraEggArgs : Array ) : Flight {
		var egg:Egg;
		
		if (!delay && this._eggs.length) {
			this.friePrevEggs( eggClass, prop );
		}
		
		egg = Egg.lay(this, eggClass, prop, start, end, duration, delay, equation, equationArgs, forceInit, this.fps, this._useFrames, extraEggArgs);
		egg.setNodeStack( this._eggs.append(egg), this._eggs);
		
		if ( !this._flightOpen ) {
			return this.listenEgg( egg ).flight;
		} else {
			return Egg( this._openFlights.append( egg ) ).flight;
		}
	}
	
	/**
	 * Fries all previous layed eggs, according the given class and type, except the exclude egg
	 * 
	 * @param	eggClass	The egg class you want to fries. If ommited, all egg class types will be fried.
	 * @param	prop	The egg prop you want to fries. If ommited, all egg props types will be fried.
	 * @param	excludeEgg	Egg you want to protect from being fried.
	 */
	private function friePrevEggs ( eggClass : Function, prop : String, excludeEgg : Egg ) : Void {
		this._eggs.each( function( egg:Egg ) {
			if ( ( egg instanceof eggClass ) && egg.prop == prop && egg != excludeEgg ) {
				egg.fries();
			}
		} );
	}
	
	
	
	
	
	// [ PRIVATE - Eggs Listening ] ******************************************/
	
	/**
	 * @private
	 * Starts listening the given egg.
	 * 
	 * @param	egg	Egg to be listened.
	 * @return	The egg itself, for re-use.
	 */
	private function listenEgg ( egg : Egg ) : Egg {
		egg.addEventListener(EggEvent.START, this.egg_onStart, this, egg.flight);
		egg.addEventListener(EggEvent.UPDATE, this.egg_onUpdate, this, egg.flight);
		egg.addEventListener(EggEvent.COMPLETE, this.egg_onComplete, this, egg.flight);
		return egg;
	}
	
	
	
	
	/**
	 * @private
	 * Listens the EGG.START ( and fries previous eggs ).
	 * 
	 * @param ev The EggEvent.
	 */
	private function egg_onStart ( event :  EggEvent ) : Void {
		this.friePrevEggs( event.egg[ "__constructor__" ], event.prop, event.egg );
		
		if (this.active == 1) {
			this.dispatchEvent( new LarvaEvent( LarvaEvent.START, this._eggs) );
		}
	}
	
	/**
	 * @private
	 * Listens the EGG.UPDATE ( but do nothing ).
	 * 
	 * @param ev The EggEvent.
	 */
	private function egg_onUpdate (event :  EggEvent) : Void {
		this.dispatchEvent( new LarvaEvent( LarvaEvent.UPDATE, this._eggs ) );
	}
	
	/**
	 * @private
	 * Listens the EGG.COMPLETE ( and fries the egg itself ).
	 * 
	 * @param event	The EggEvent.
	 */
	private function egg_onComplete (event :  EggEvent) : Void {
		event.egg.fries ();
		
		if (! this._eggs.length) {
			this.dispatchEvent( new LarvaEvent( LarvaEvent.COMPLETE, this._eggs ) );
		}
	}
	
	
	
	
	
	// [ PUBLIC - Multiple Fligh Calls Feature] *******************************/
	
	/**
	 * @private
	 * Opens a flight for multiple calls
	 */
	private function openFlight () : Void {
		this._openFlights = new LinkedList;
		this._flightOpen = true;
	}
	
	/**
	 * @private
	 * Closes the previous opened multiple-flight and return its main flight
	 * @return	The main flight.
	 */
	private function closeFlight () : Flight {
		this._flightOpen = false;
		return this.listenEgg( Egg ( this._openFlights.tail.data ) ).flight.setEggs( this._openFlights );
	}
}