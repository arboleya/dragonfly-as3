
import dragonfly.body.Egg;
import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.DisplacementMapEgg;



class dragonfly.plugins.larvas.events.DisplacementMapFlightEvent extends FlightEvent {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new DisplacementMapFlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function DisplacementMapFlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList ) {
		super( type, egg, prop, value, eggs );
	}
	
	
	
	
	
	// [ GETTERS ] ***********************************************************/
	
	/**
	 * TODO: add comments.
	 */
	public function get SCALE_X () : Number {
		return Number( this.read ( DisplacementMapEgg.SCALE_X ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get SCALE_Y () : Number {
		return Number( this.read ( DisplacementMapEgg.SCALE_Y ) );
	}
}