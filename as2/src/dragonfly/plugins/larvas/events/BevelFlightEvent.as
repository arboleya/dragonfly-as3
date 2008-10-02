
import dragonfly.body.Egg;
import cocktail.lib.data.ds.LinkedList;
import dragonfly.body.events.FlightEvent;
import dragonfly.plugins.larvas.lib.filters.eggs.BevelEgg;



class dragonfly.plugins.larvas.events.BevelFlightEvent extends FlightEvent {
	
	// [ CONSTRUCTOR ] *******************************************************/
	
	/**
	 * Creates a new BevelFlightEvent.
	 * 
	 * @param	type	Event type.
	 * @param	egg	The caller egg.
	 * @param	prop	The egg property.
	 * @param	value	The egg value.
	 * @param	eggs	The Eggs linked list ( when there's a multiple fight calls )
	 */
	public function BevelFlightEvent ( type : String, egg : Egg, prop : String, value : Object, eggs : LinkedList ) {
		super( type, egg, prop, value, eggs );
	}
	
	
	
	
	
	// [ GETTERS ] ***********************************************************/
	
	/**
	 * TODO: add comments.
	 */
	public function get DISTANCE () : Number {
		return Number( this.read ( BevelEgg.DISTANCE ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get ANGLE () : Number {
		return Number( this.read ( BevelEgg.ANGLE ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get HIGHLIGHTCOLOR () : Number {
		return Number( this.read ( BevelEgg.HIGHLIGHTCOLOR ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get HIGHLIGHTALPHA () : Number {
		return Number( this.read ( BevelEgg.HIGHLIGHTALPHA ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get SHADOWCOLOR () : Number {
		return Number( this.read ( BevelEgg.SHADOWCOLOR ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get SHADOWALPHA () : Number {
		return Number( this.read ( BevelEgg.SHADOWALPHA ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLURX () : Number {
		return Number( this.read ( BevelEgg.BLURX ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get BLURY () : Number {
		return Number( this.read ( BevelEgg.BLURY ) );
	}
	
	/**
	 * TODO: add comments.
	 */
	public function get STRENGTH () : Number {
		return Number( this.read ( BevelEgg.STRENGTH ) );
	}
	
}