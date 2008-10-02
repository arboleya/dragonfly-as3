import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.Egg;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.larvas.lib.movieclip.MovieClipEgg;


/**
 * @author nybras | nybras@codeine.it
 */
class dragonfly.plugins.larvas.events.MovieClipFlightEvent extends FlightEvent {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new MovieClipFlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function MovieClipFlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList ) {
		super( type, egg, prop, value, eggs );
	}
	
	
	
	
	
	// [ GETTERS ] ***********************************************************/
	
	/**
	 * TODO: add comments.
	 */
	public function get X () : Number {
		return Number( this.read ( MovieClipEgg.X ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get Y () : Number {
		return Number( this.read ( MovieClipEgg.Y ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get XSCALE () : Number {
		return Number( this.read ( MovieClipEgg.XSCALE ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get YSCALE () : Number {
		return Number( this.read ( MovieClipEgg.YSCALE ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ROTATION () : Number {
		return Number( this.read ( MovieClipEgg.ROTATION ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ALPHA () : Number {
		return Number( this.read ( MovieClipEgg.ALPHA ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get WIDTH () : Number {
		return Number( this.read ( MovieClipEgg.WIDTH ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get HEIGHT () : Number {
		return Number( this.read ( MovieClipEgg.HEIGHT ) );
	}
}