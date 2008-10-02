
import dragonfly.body.Egg;
import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.DropShadowEgg;


/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.events.DropShadowFlightEvent extends FlightEvent {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new DropShadowFlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function DropShadowFlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList ) {
		super( type, egg, prop, value, eggs );
	}
	
	
	
	
	
	// [ GETTERS ] ***********************************************************/
	
	/**
	 * TODO: add comments.
	 */
	public function get DISTANCE () : Number {
		return Number( this.read ( DropShadowEgg.DISTANCE ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ANGLE () : Number {
		return Number( this.read ( DropShadowEgg.ANGLE ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get COLOR () : Number {
		return Number( this.read ( DropShadowEgg.COLOR ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ALPHA () : Number {
		return Number( this.read ( DropShadowEgg.ALPHA ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLUR_X () : Number {
		return Number( this.read ( DropShadowEgg.BLUR_X ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLUR_Y () : Number {
		return Number( this.read ( DropShadowEgg.BLUR_Y ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get STRENGTH () : Number {
		return Number( this.read ( DropShadowEgg.STRENGTH ) );
	}
}