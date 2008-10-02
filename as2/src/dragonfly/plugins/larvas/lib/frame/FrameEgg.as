import dragonfly.body.Egg;
import dragonfly.body.Larva;
import dragonfly.body.Flight;
import dragonfly.plugins.larvas.events.FrameFlightEvent;

import cocktail.lib.data.ds.Node;



/**
 * FrameEgg class.s
 */
class dragonfly.plugins.larvas.lib.frame.FrameEgg extends Egg {
	
	// [ CONSTANTS - properties ] ********************************************/
	
	public static function get FRAME () : String { return "_frame"; }
	
	
	
	
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Create a FrameEgg object.
	 * 
	 * @param prop The Egg prop.
	 * @param larva The larva that owns the Egg.
	 * @param flight The larva flight.
	 */
	public function FrameEgg (prop : String, larva : Larva, flight : Flight) {
		super(prop, larva, flight);
		this.flight.setEventClass( FrameFlightEvent );
	}
	
	
	
	
	
	// [ PUBLIC - value getter/setter ] **************************************/
	
	/**
	 * Sets the Egg prop/value.
	 * 
	 * @param value Returns the new value for the prop.
	 */
	public function setValue (value : Object) : Void {
		this._targets.each(function ( target : MovieClip, node : Node) : Void {
			target.gotoAndStop(Math.round(Number(value)));
		}, this);
	}
	
	/**
	 * Returns the current Egg prop/value.
	 * 
	 * @return The current prop/value.
	 */
	public function getValue () : Object {
		return this._targets.head.data._currentframe;
	}
}
