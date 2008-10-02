
import dragonfly.body.Egg;
import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.ConvolutionEgg;
//import dragonfly.plugins.larvas.lib.frame.FrameEgg;



class dragonfly.plugins.larvas.events.ConvolutionFlightEvent extends FlightEvent {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new ConvolutionFlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function ConvolutionFlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList ) {
		super( type, egg, prop, value, eggs );
	}
	
	
	
	
	
	// [ GETTERS ] ***********************************************************/
	
	/**
	 * TODO: add comments.
	 */
	public function get MATRIX () : Number {
		return Number( this.read ( ConvolutionEgg.MATRIX ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get DIVISOR () : Number {
		return Number( this.read ( ConvolutionEgg.DIVISOR ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BIAS () : Number {
		return Number( this.read ( ConvolutionEgg.BIAS ) );
	}
	
}