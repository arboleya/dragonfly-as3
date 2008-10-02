import dragonfly.body.ColorNymph;
import dragonfly.body.events.EggEvent;
import dragonfly.body.events.NymphEvent;
import dragonfly.Dragonfly;
import dragonfly.body.Nymph;
import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.body.interfaces.IEgg;

import cocktail.lib.data.ds.Node;
import cocktail.utils.SetTimeout;
import cocktail.lib.data.ds.LinkedList;
import cocktail.lib.events.EventDispatcher;



/**
 * Egg class.
 * 
 * @author nybras | nybras@codeine.it
 */
class dragonfly.body.Egg extends EventDispatcher implements IEgg {
	
	// [ PRIVATE - properties ] **********************************************/
	
	private var _isColor:Boolean;
	
	private var _node:Node;
	private var _stack:LinkedList;
	
	private var _larva:Larva;
	private var _nymph:Nymph;
	private var _flight:Flight;
	
	private var _prop:String;
	private var _targets:LinkedList;
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a Egg object.
	 * 
	 * @param prop Prop of the egg.
	 * @param larva Larva that owns the egg.
	 * @param flight Larva flight.
	 */
	public function Egg (prop : String, larva : Larva, flight : Flight) {
		this._prop = prop;
		this._larva = larva;
		this._flight = flight;
		this._targets = larva.targets;
	}
	
	
	
	
	
	// [ PUBLIC - main functions ] **********************************************/
	
	/**
	 * Lays a new instance of any Egg (since you pass the class).
	 * 
	 * @param larv 	The egg Larva,
	 * @param eggClass The eggClass you want to lay a new instance.
	 * @param prop The egg 'prop' you want to lay.
	 * @param start	Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the <code>'setInterval'</code> mode (default=30).
	 * @param useFrames	If <code>true</code>'onEnterFreame' mode used, otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 * @param extraEggArgs Extra arguments you need in your Egg's Contructor, besides the defaults [prop, larva, flight].
	 * 
	 * @return	A new instance of the given 'eggClass'.
	 */
	public static function lay (larva : Larva, eggClass : Function, prop : String, start : Object, end : Object, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean, extraEggArgs : Array ) : Egg {
		var egg:Egg;
		var flight:Flight;
		
		flight = new Flight;
		flight.cloneFrom(larva.defaultFlight);
		
		egg = new eggClass(prop, larva, flight, extraEggArgs);
		
		egg.shoke(start, end, duration, delay, equation, equationArgs, forceInit, fps, useFrames);
		flight.setEgg( egg );
		
		return egg;
	}
	
	/**
	 * Shoke the egg.
	 * 
	 * @param start	Start value for the Egg transition.
	 * @param end End value for the Egg transition.
	 * @param duration Duration value for the Egg transition, in milleseconds.
	 * @param delay	Delay before start the Egg transition, in milleseconds.
	 * @param equation Equation for the Egg transition.
	 * @param equationArgs EquationArgs to be applied to the given Equation.
	 * @param forceInit	If <code>true</code>, the start value is initialized imediatelly, even if the tween has a delay.
	 * @param fps If useFrames is <code>false</code>, you can set the refresh interval for the <code>'setInterval'</code> mode (default=30).
	 * @param useFrames	If <code>true</code> <code>'onEnterFreame'</code> mode used, otherwise (<code>false</code>) <code>'setInterval'</code> mode is used.
	 */
	public function shoke (start : Object, end : Object, duration : Number, delay : Number, equation : Function, equationArgs : Array, forceInit : Boolean, fps : Number, useFrames : Boolean) : Void {
		var st:SetTimeout;
		
		if (forceInit && (!isNaN(start) || start instanceof Array)) this.setValue( start );
		
		start = ( start == null ? this.getValue() : start );
		end = ( end == null ? this.getValue() : end );
		fps = ( ( isNaN( fps ) ) ? Dragonfly.defaultFps : fps ); 
		
		if ( this._isColor ) {
			this._nymph = new ColorNymph(start, end, duration, delay, equation, equationArgs, fps, useFrames);
		} else {
			this._nymph = new Nymph(start, end, duration, delay, equation, equationArgs, fps, useFrames);
		}
		
		this._nymph.addEventListener(NymphEvent.START, this.dispatchEventByType, this );
		this._nymph.addEventListener(NymphEvent.UPDATE, this.dispatchEventByType, this );
		this._nymph.addEventListener(NymphEvent.COMPLETE, this.dispatchEventByType, this );
		
		if (!Dragonfly.enabled || (start == end)) st = new SetTimeout(this._nymph.kick, 1, this._nymph);
	}
	
	
	
	
	
	// [ PRIVATE - ev dispatching ] ****************************************/
	
	/**
	 * @private
	 * Dispatches a event according the given type.
	 * 
	 * @param ev	A NymphEvent.
	 */
	private function dispatchEventByType ( event :  NymphEvent) : Void {
		if (event.type == NymphEvent.UPDATE) this.setValue( event.data );
		//trace ( "dispatch: "+ [ event.type, event.data ] );
		this.dispatchEvent( new EggEvent( event.type, this, this.prop, this.getValue() ) );
	}
	
	
	
	
	
	// [ GETTERS and SETTERS ] ****************************************/
	
	/**
	 * sets the egg node/stack
	 * 
	 * @param	node	Egg node.
	 * @param	stack	Egg stack.
	 */
	public function setNodeStack ( node : Node, stack : LinkedList ) : Void {
		this._node = node;
		this._stack = stack;
	}
	
	
	
	/**
	 * Sets the Egg prop/value.
	 * 
	 * @param value The new prop value.
	 */
	public function setValue (value : Object) : Void {
		throw new Error( "this functions MUST to be overwriten by the child classes, as PRIVATE");
	}
	
	/**
	 * Returns the current prop/value.
	 * 
	 * @return The current prop/value.
	 */
	public function getValue () : Object {
		throw new Error( "this function MUST to be overwriten by the child classes, as PRIVATE");
		return Object;
	}
	
	
	
	/**
	 * Returns the parent eggs in the same larva, including itself
	 */
	public function get parentEggs () : LinkedList {
		return this._larva.eggs;
	}
	
	/**
	 * Egg.IS_ACTIVE.
	 * 
	 * @return <code>true</code> if the egg is active ( currrently moving ), otherwise <code>false</code>.
	 */
	public function get active () : Boolean {
		return this._nymph.active;
	}
	
	/**
	 * Egg.TIME_LEFT.
	 * 
	 * @return The egg tween's time left.
	 */
	public function get timeLeft () : Number {
		return this._nymph.timeLeft;
	}
	
	
	
	/**
	 * Egg.PROP.
	 * 
	 * @return <code>true</code> if the egg is active ( currrently moving ), otherwise <code>false</code>.
	 */
	public function get prop () : String {
		return this._prop;
	}
	
	
	
	
	
	/**
	 * Egg.LarvaListener.
	 * 
	 * @return The egg's LarvaListener.
	 */
	public function get flight () : Flight {
		return this._flight;
	}
	
	
	
	
	// [ PUBLIC - egg control ] ****************************************/
	
	/**
	 * Hold the egg animation.
	 */
	public function hold () : Void {
		this._nymph.hold();
	}
	
	/**
	 * Unhold the egg animation.
	 */
	public function unhold () : Void {
		this._nymph.unhold();
	}
	
	/**
	 * Resets the egg animation.
	 */
	public function reset () : Void {
		this._nymph.reset();
	}
	
	/**
	 * Destroy the egg.
	 */
	public function fries () : Void {
		this._nymph.removeAllEventListeners();
		this._flight.removeAllEventListeners();
		this.removeAllEventListeners();
		this._stack.remove( this._node );
	}
	
}
