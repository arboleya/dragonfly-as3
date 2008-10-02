
import dragonfly.body.Egg;
import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.GlowEgg;



class dragonfly.plugins.larvas.events.GlowFlightEvent extends FlightEvent {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new GlowFlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function GlowFlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList ) {
		super( type, egg, prop, value, eggs );
	}
	
	
	
	
	
	// [ GETTERS ] ***********************************************************/
	
	/**
	 * TODO: add comments.
	 */
	public function get COLOR () : Number {
		return Number( this.read ( GlowEgg.COLOR ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ALPHA () : Number {
		return Number( this.read ( GlowEgg.ALPHA ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLUR_X () : Number {
		return Number( this.read ( GlowEgg.BLUR_X ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLUR_Y () : Number {
		return Number( this.read ( GlowEgg.BLUR_Y ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get STRENGTH () : Number {
		return Number( this.read ( GlowEgg.STRENGTH ) );
	}
	
}